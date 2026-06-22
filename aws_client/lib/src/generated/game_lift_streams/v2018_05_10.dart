// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2018_05_10.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon GameLift Streams provides a global cloud solution for content
/// streaming experiences. Use Amazon GameLift Streams tools to upload and
/// configure content for streaming, deploy and scale computing resources to
/// host streams, and manage stream session placement to meet customer demand.
class GameLiftStreams {
  final _s.RestJsonProtocol _protocol;
  factory GameLiftStreams({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'gameliftstreams',
    );
    return GameLiftStreams._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  GameLiftStreams._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Add locations that can host stream sessions. To add a location, the stream
  /// group must be in <code>ACTIVE</code> status. You configure locations and
  /// their corresponding capacity for each stream group. Creating a stream
  /// group in a location that's nearest to your end users can help minimize
  /// latency and improve quality.
  ///
  /// This operation provisions stream capacity at the specified locations. By
  /// default, all locations have 1 or 2 capacity, depending on the stream class
  /// option: 2 for 'High' and 1 for 'Ultra' and 'Win2022'. This operation also
  /// copies the content files of all associated applications to an internal S3
  /// bucket at each location. This allows Amazon GameLift Streams to host
  /// performant stream sessions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// A stream group to add the specified locations to.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  ///
  /// Parameter [locationConfigurations] :
  /// A set of one or more locations and the streaming capacity for each
  /// location.
  Future<AddStreamGroupLocationsOutput> addStreamGroupLocations({
    required String identifier,
    required List<LocationConfiguration> locationConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      'LocationConfigurations': locationConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/streamgroups/${Uri.encodeComponent(identifier)}/locations',
      exceptionFnMap: _exceptionFns,
    );
    return AddStreamGroupLocationsOutput.fromJson(response);
  }

  /// When you associate, or link, an application with a stream group, then
  /// Amazon GameLift Streams can launch the application using the stream
  /// group's allocated compute resources. The stream group must be in
  /// <code>ACTIVE</code> status. You can reverse this action by using <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_DisassociateApplications.html">DisassociateApplications</a>.
  ///
  /// If a stream group does not already have a linked application, Amazon
  /// GameLift Streams will automatically assign the first application provided
  /// in <code>ApplicationIdentifiers</code> as the default.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationIdentifiers] :
  /// A set of applications to associate with the stream group.
  ///
  /// This value is a set of either <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARN)</a> or IDs that uniquely identify application
  /// resources. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  /// Example ID: <code>a-9ZY8X7Wv6</code>.
  ///
  /// Parameter [identifier] :
  /// A stream group to associate to the applications.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  Future<AssociateApplicationsOutput> associateApplications({
    required List<String> applicationIdentifiers,
    required String identifier,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationIdentifiers': applicationIdentifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/streamgroups/${Uri.encodeComponent(identifier)}/associations',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateApplicationsOutput.fromJson(response);
  }

  /// Enables clients to reconnect to a stream session while preserving all
  /// session state and data in the disconnected session. This reconnection
  /// process can be initiated when a stream session is in either
  /// <code>PENDING_CLIENT_RECONNECTION</code> or <code>ACTIVE</code> status.
  /// The process works as follows:
  /// <ol>
  /// <li>
  /// Initial disconnect:
  ///
  /// <ul>
  /// <li>
  /// When a client disconnects or loses connection, the stream session
  /// transitions from <code>CONNECTED</code> to
  /// <code>PENDING_CLIENT_RECONNECTION</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Reconnection time window:
  ///
  /// <ul>
  /// <li>
  /// Clients have <code>ConnectionTimeoutSeconds</code> (defined in <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_StartStreamSession.html">StartStreamSession</a>)
  /// to reconnect before session termination
  /// </li>
  /// <li>
  /// Your backend server must call <b>CreateStreamSessionConnection</b> to
  /// initiate reconnection
  /// </li>
  /// <li>
  /// Session transitions to <code>RECONNECTING</code> status
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Reconnection completion:
  ///
  /// <ul>
  /// <li>
  /// On successful <b>CreateStreamSessionConnection</b>, session status changes
  /// to <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// Provide the new connection information to the requesting client
  /// </li>
  /// <li>
  /// Client must establish connection within
  /// <code>ConnectionTimeoutSeconds</code>
  /// </li>
  /// <li>
  /// Session terminates automatically if client fails to connect in time
  /// </li>
  /// </ul> </li> </ol>
  /// For more information about the stream session lifecycle, see <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/stream-sessions.html">Stream
  /// sessions</a> in the <i>Amazon GameLift Streams Developer Guide</i>.
  ///
  /// To begin re-connecting to an existing stream session, specify the stream
  /// group ID and stream session ID that you want to reconnect to, and the
  /// signal request to use with the stream.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  ///
  /// The stream group that you want to run this stream session with. The stream
  /// group must be in <code>ACTIVE</code> status.
  ///
  /// Parameter [signalRequest] :
  /// A WebRTC ICE offer string to use when initializing a WebRTC connection.
  /// The offer is a very long JSON string. Provide the string as a text value
  /// in quotes. The offer must be newly generated, not the same offer provided
  /// to <code>StartStreamSession</code>.
  ///
  /// Parameter [streamSessionIdentifier] :
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream session
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamsession/sg-1AB2C3De4/ABC123def4567</code>.
  /// Example ID: <code>ABC123def4567</code>.
  ///
  /// The stream session must be in <code>PENDING_CLIENT_RECONNECTION</code> or
  /// <code>ACTIVE</code> status.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that represents a client request. The request is
  /// idempotent, which ensures that an API request completes only once. When
  /// users send a request, Amazon GameLift Streams automatically populates this
  /// field.
  Future<CreateStreamSessionConnectionOutput> createStreamSessionConnection({
    required String identifier,
    required String signalRequest,
    required String streamSessionIdentifier,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'SignalRequest': signalRequest,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/streamgroups/${Uri.encodeComponent(identifier)}/streamsessions/${Uri.encodeComponent(streamSessionIdentifier)}/connections',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStreamSessionConnectionOutput.fromJson(response);
  }

  /// When you disassociate, or unlink, an application from a stream group, you
  /// can no longer stream this application by using that stream group's
  /// allocated compute resources. Any streams in process will continue until
  /// they terminate, which helps avoid interrupting an end-user's stream.
  /// Amazon GameLift Streams will not initiate new streams in the stream group
  /// using the disassociated application. The disassociate action does not
  /// affect the stream capacity of a stream group. To disassociate an
  /// application, the stream group must be in <code>ACTIVE</code> status.
  ///
  /// If you disassociate the default application, Amazon GameLift Streams will
  /// automatically choose a new default application from the remaining
  /// associated applications. To change which application is the default
  /// application, call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_UpdateStreamGroup.html">UpdateStreamGroup</a>
  /// and specify a new <code>DefaultApplicationIdentifier</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationIdentifiers] :
  /// A set of applications that you want to disassociate from the stream group.
  ///
  /// This value is a set of either <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARN)</a> or IDs that uniquely identify application
  /// resources. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  /// Example ID: <code>a-9ZY8X7Wv6</code>.
  ///
  /// Parameter [identifier] :
  /// A stream group to disassociate these applications from.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  Future<DisassociateApplicationsOutput> disassociateApplications({
    required List<String> applicationIdentifiers,
    required String identifier,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationIdentifiers': applicationIdentifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/streamgroups/${Uri.encodeComponent(identifier)}/disassociations',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateApplicationsOutput.fromJson(response);
  }

  /// Export the files that your application modifies or generates in a stream
  /// session, which can help you debug or verify your application. When your
  /// application runs, it generates output files such as logs, diagnostic
  /// information, crash dumps, save files, user data, screenshots, and so on.
  /// The files can be defined by the engine or frameworks that your application
  /// uses, or information that you've programmed your application to output.
  ///
  /// You can only call this action on a stream session that is in progress,
  /// specifically in one of the following statuses <code>ACTIVE</code>,
  /// <code>CONNECTED</code>, <code>PENDING_CLIENT_RECONNECTION</code>, and
  /// <code>RECONNECTING</code>. You must provide an Amazon Simple Storage
  /// Service (Amazon S3) bucket to store the files in. When the session ends,
  /// Amazon GameLift Streams produces a compressed folder that contains all of
  /// the files and directories that were modified or created by the application
  /// during the stream session. AWS uses your security credentials to
  /// authenticate and authorize access to your Amazon S3 bucket.
  ///
  /// Amazon GameLift Streams collects the following generated and modified
  /// files. Find them in the corresponding folders in the <code>.zip</code>
  /// archive.
  ///
  /// <ul>
  /// <li>
  /// <code>application/</code>: The folder where your application or game is
  /// stored.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <code>profile/</code>: The user profile folder.
  /// </li>
  /// <li>
  /// <code>temp/</code>: The system temp folder.
  /// </li>
  /// </ul> <p/>
  /// To verify the status of the exported files, use GetStreamSession.
  ///
  /// To delete the files, delete the object in the S3 bucket.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  ///
  /// Parameter [outputUri] :
  /// The S3 bucket URI where Amazon GameLift Streams uploads the set of
  /// compressed exported files for this stream session. Amazon GameLift Streams
  /// generates a ZIP file name based on the stream session metadata.
  /// Alternatively, you can provide a custom file name with a <code>.zip</code>
  /// file extension.
  ///
  /// Example 1: If you provide an S3 URI called
  /// <code>s3://amzn-s3-demo-destination-bucket/MyGame_Session1.zip</code>,
  /// then Amazon GameLift Streams will save the files at that location.
  ///
  /// Example 2: If you provide an S3 URI called
  /// <code>s3://amzn-s3-demo-destination-bucket/MyGameSessions_ExportedFiles/</code>,
  /// then Amazon GameLift Streams will save the files at
  /// <code>s3://amzn-s3-demo-destination-bucket/MyGameSessions_ExportedFiles/YYYYMMDD-HHMMSS-appId-sg-Id-sessionId.zip</code>
  /// or another similar name.
  ///
  /// Parameter [streamSessionIdentifier] :
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream session
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamsession/sg-1AB2C3De4/ABC123def4567</code>.
  /// Example ID: <code>ABC123def4567</code>.
  Future<void> exportStreamSessionFiles({
    required String identifier,
    required String outputUri,
    required String streamSessionIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'OutputUri': outputUri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/streamgroups/${Uri.encodeComponent(identifier)}/streamsessions/${Uri.encodeComponent(streamSessionIdentifier)}/exportfiles',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves properties for a Amazon GameLift Streams stream session
  /// resource. Specify the Amazon Resource Name (ARN) of the stream session
  /// that you want to retrieve and its stream group ARN. If the operation is
  /// successful, it returns properties for the requested resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The stream group that runs this stream session.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  ///
  /// Parameter [streamSessionIdentifier] :
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream session
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamsession/sg-1AB2C3De4/ABC123def4567</code>.
  /// Example ID: <code>ABC123def4567</code>.
  Future<GetStreamSessionOutput> getStreamSession({
    required String identifier,
    required String streamSessionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/streamgroups/${Uri.encodeComponent(identifier)}/streamsessions/${Uri.encodeComponent(streamSessionIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStreamSessionOutput.fromJson(response);
  }

  /// Retrieves a list of Amazon GameLift Streams stream sessions that a stream
  /// group is hosting.
  ///
  /// To retrieve stream sessions, specify the stream group, and optionally
  /// filter by stream session status. You can paginate the results as needed.
  ///
  /// This operation returns the requested stream sessions in no particular
  /// order.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of a Amazon GameLift Streams stream group to
  /// retrieve the stream session for. You can use either the stream group ID or
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a>.
  ///
  /// Parameter [exportFilesStatus] :
  /// Filter by the exported files status. You can specify one status in each
  /// request to retrieve only sessions that currently have that exported files
  /// status.
  ///
  /// Exported files can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCEEDED</code>: The exported files are successfully stored in an
  /// S3 bucket.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The session ended but Amazon GameLift Streams
  /// couldn't collect and upload the files to S3.
  /// </li>
  /// <li>
  /// <code>PENDING</code>: Either the stream session is still in progress, or
  /// uploading the exported files to the S3 bucket is in progress.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The number of results to return. Use this parameter with
  /// <code>NextToken</code> to return results in sequential pages. Default
  /// value is <code>25</code>.
  ///
  /// Parameter [nextToken] :
  /// The token that marks the start of the next set of results. Use this token
  /// when you retrieve results as sequential pages. To get the first page of
  /// results, omit a token value. To get the remaining pages, provide the token
  /// returned with the previous result set.
  ///
  /// Parameter [status] :
  /// Filter by the stream session status. You can specify one status in each
  /// request to retrieve only sessions that are currently in that status.
  Future<ListStreamSessionsOutput> listStreamSessions({
    required String identifier,
    ExportFilesStatus? exportFilesStatus,
    int? maxResults,
    String? nextToken,
    StreamSessionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (exportFilesStatus != null)
        'ExportFilesStatus': [exportFilesStatus.value],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (status != null) 'Status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/streamgroups/${Uri.encodeComponent(identifier)}/streamsessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamSessionsOutput.fromJson(response);
  }

  /// Retrieves a list of Amazon GameLift Streams stream sessions that this user
  /// account has access to.
  ///
  /// In the returned list of stream sessions, the
  /// <code>ExportFilesMetadata</code> property only shows the
  /// <code>Status</code> value. To get the <code>OutpurUri</code> and
  /// <code>StatusReason</code> values, use <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetStreamSession.html">GetStreamSession</a>.
  ///
  /// We don't recommend using this operation to regularly check stream session
  /// statuses because it's costly. Instead, to check status updates for a
  /// specific stream session, use <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetStreamSession.html">GetStreamSession</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [exportFilesStatus] :
  /// Filter by the exported files status. You can specify one status in each
  /// request to retrieve only sessions that currently have that exported files
  /// status.
  ///
  /// Parameter [maxResults] :
  /// The number of results to return. Use this parameter with
  /// <code>NextToken</code> to return results in sequential pages. Default
  /// value is <code>25</code>.
  ///
  /// Parameter [nextToken] :
  /// The token that marks the start of the next set of results. Use this token
  /// when you retrieve results as sequential pages. To get the first page of
  /// results, omit a token value. To get the remaining pages, provide the token
  /// returned with the previous result set.
  ///
  /// Parameter [status] :
  /// Filter by the stream session status. You can specify one status in each
  /// request to retrieve only sessions that are currently in that status.
  Future<ListStreamSessionsByAccountOutput> listStreamSessionsByAccount({
    ExportFilesStatus? exportFilesStatus,
    int? maxResults,
    String? nextToken,
    StreamSessionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (exportFilesStatus != null)
        'ExportFilesStatus': [exportFilesStatus.value],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (status != null) 'Status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/streamsessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamSessionsByAccountOutput.fromJson(response);
  }

  /// Retrieves all tags assigned to a Amazon GameLift Streams resource. To list
  /// tags for a resource, specify the ARN value for the resource.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> in the <i>Amazon Web Services General
  /// Reference</i>
  ///
  /// <a
  /// href="http://aws.amazon.com/answers/account-management/aws-tagging-strategies/">
  /// Amazon Web Services Tagging Strategies</a>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that you want to retrieve tags for. To get an
  /// Amazon GameLift Streams resource ARN, call a List or Get operation for the
  /// resource.
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

  /// Removes a set of remote locations from this stream group. To remove a
  /// location, the stream group must be in <code>ACTIVE</code> status. When you
  /// remove a location, Amazon GameLift Streams releases allocated compute
  /// resources in that location. Stream sessions can no longer start from
  /// removed locations in a stream group. Amazon GameLift Streams also deletes
  /// the content files of all associated applications that were in Amazon
  /// GameLift Streams's internal Amazon S3 bucket at this location.
  ///
  /// You cannot remove the Amazon Web Services Region location where you
  /// initially created this stream group, known as the primary location.
  /// However, you can set the stream capacity to zero to avoid incurring costs
  /// for allocated compute resources in that location.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// A stream group to remove the specified locations from.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  ///
  /// Parameter [locations] :
  /// A set of locations to remove this stream group. For example,
  /// <code>us-east-1</code>.
  ///
  /// For a complete list of locations that Amazon GameLift Streams supports,
  /// refer to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/regions-quotas.html">Regions,
  /// quotas, and limitations</a> in the <i>Amazon GameLift Streams Developer
  /// Guide</i>.
  Future<void> removeStreamGroupLocations({
    required String identifier,
    required List<String> locations,
  }) async {
    final $query = <String, List<String>>{
      'locations': locations,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/streamgroups/${Uri.encodeComponent(identifier)}/locations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This action initiates a new stream session and outputs connection
  /// information that clients can use to access the stream. A stream session
  /// refers to an instance of a stream that Amazon GameLift Streams transmits
  /// from the server to the end-user. A stream session runs on a compute
  /// resource that a stream group has allocated. The start stream session
  /// process works as follows:
  /// <ol>
  /// <li>
  /// Prerequisites:
  ///
  /// <ul>
  /// <li>
  /// You must have a stream group in <code>ACTIVE</code> status
  /// </li>
  /// <li>
  /// You must have idle or on-demand capacity in a stream group in the location
  /// you want to stream from
  /// </li>
  /// <li>
  /// You must have at least one application associated to the stream group (use
  /// <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_AssociateApplications.html">AssociateApplications</a>
  /// if needed)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Start stream request:
  ///
  /// <ul>
  /// <li>
  /// Your backend server calls <b>StartStreamSession</b> to initiate connection
  /// </li>
  /// <li>
  /// Amazon GameLift Streams creates the stream session resource, assigns an
  /// Amazon Resource Name (ARN) value, and begins searching for available
  /// stream capacity to run the stream
  /// </li>
  /// <li>
  /// Session transitions to <code>ACTIVATING</code> status
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Placement completion:
  ///
  /// <ul>
  /// <li>
  /// If Amazon GameLift Streams is successful in finding capacity for the
  /// stream, the stream session status changes to <code>ACTIVE</code> status
  /// and <b>StartStreamSession</b> returns stream connection information
  /// </li>
  /// <li>
  /// If Amazon GameLift Streams was not successful in finding capacity within
  /// the placement timeout period (defined according to the capacity type and
  /// platform type), the stream session status changes to <code>ERROR</code>
  /// status and <b>StartStreamSession</b> returns a <code>StatusReason</code>
  /// of <code>placementTimeout</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Connection completion:
  ///
  /// <ul>
  /// <li>
  /// Provide the new connection information to the requesting client
  /// </li>
  /// <li>
  /// Client must establish connection within
  /// <code>ConnectionTimeoutSeconds</code> (specified in
  /// <b>StartStreamSession</b> parameters)
  /// </li>
  /// <li>
  /// Session terminates automatically if client fails to connect in time
  /// </li>
  /// </ul> </li> </ol>
  /// For more information about the stream session lifecycle, see <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/stream-sessions.html">Stream
  /// sessions</a> in the <i>Amazon GameLift Streams Developer Guide</i>.
  ///
  /// Timeouts to be aware of that affect a stream session:
  ///
  /// <ul>
  /// <li>
  /// <b>Placement timeout</b>: The amount of time that Amazon GameLift Streams
  /// has to find capacity for a stream request. Placement timeout varies based
  /// on the capacity type used to fulfill your stream request:
  ///
  /// <ul>
  /// <li>
  /// <b>Always-on capacity</b>: 75 seconds
  /// </li>
  /// <li>
  /// <b>On-demand capacity</b>:
  ///
  /// <ul>
  /// <li>
  /// Linux/Proton runtimes: 90 seconds
  /// </li>
  /// <li>
  /// Windows runtime: 10 minutes
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// <li>
  /// <b>Connection timeout</b>: The amount of time that Amazon GameLift Streams
  /// waits for a client to connect to a stream session in <code>ACTIVE</code>
  /// status, or reconnect to a stream session in
  /// <code>PENDING_CLIENT_RECONNECTION</code> status, the latter of which
  /// occurs when a client disconnects or loses connection from a stream
  /// session. If no client connects before the timeout, Amazon GameLift Streams
  /// terminates the stream session. This value is specified by
  /// <code>ConnectionTimeoutSeconds</code> in the
  /// <code>StartStreamSession</code> parameters.
  /// </li>
  /// <li>
  /// <b>Maximum session length</b>: A stream session will be terminated after
  /// this amount of time has elapsed since it started, regardless of any
  /// existing client connections. This value is specified by
  /// <code>SessionLengthSeconds</code> in the <code>StartStreamSession</code>
  /// parameters.
  /// </li>
  /// </ul>
  /// To start a new stream session, specify a stream group ID and application
  /// ID, along with the transport protocol and signal request to use with the
  /// stream session.
  ///
  /// For stream groups that have multiple locations, provide a set of locations
  /// ordered by priority using a <code>Locations</code> parameter. Amazon
  /// GameLift Streams will start a single stream session in the next available
  /// location. An application must be finished replicating to a remote location
  /// before the remote location can host a stream.
  ///
  /// To reconnect to a stream session after a client disconnects or loses
  /// connection, use <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_CreateStreamSessionConnection.html">CreateStreamSessionConnection</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationIdentifier] :
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the application
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  /// Example ID: <code>a-9ZY8X7Wv6</code>.
  ///
  /// Parameter [identifier] :
  /// The stream group to run this stream session with.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  ///
  /// Parameter [protocol] :
  /// The data transport protocol to use for the stream session.
  ///
  /// Parameter [signalRequest] :
  /// A WebRTC ICE offer string to use when initializing a WebRTC connection.
  /// Typically, the offer is a very long JSON string. Provide the string as a
  /// text value in quotes.
  ///
  /// Amazon GameLift Streams also supports setting the field to
  /// "NO_CLIENT_CONNECTION". This will create a session without needing any
  /// browser request or Web SDK integration. The session starts up as usual and
  /// waits for a reconnection from a browser, which is accomplished using <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_CreateStreamSessionConnection.html">CreateStreamSessionConnection</a>.
  ///
  /// Parameter [additionalEnvironmentVariables] :
  /// A set of options that you can use to control the stream session runtime
  /// environment, expressed as a set of key-value pairs. You can use this to
  /// configure the application or stream session details. You can also provide
  /// custom environment variables that Amazon GameLift Streams passes to your
  /// game client.
  /// <note>
  /// If you want to debug your application with environment variables, we
  /// recommend that you do so in a local environment outside of Amazon GameLift
  /// Streams. For more information, refer to the Compatibility Guidance in the
  /// troubleshooting section of the Developer Guide.
  /// </note>
  /// <code>AdditionalEnvironmentVariables</code> and
  /// <code>AdditionalLaunchArgs</code> have similar purposes.
  /// <code>AdditionalEnvironmentVariables</code> passes data using environment
  /// variables; while <code>AdditionalLaunchArgs</code> passes data using
  /// command-line arguments.
  ///
  /// Parameter [additionalLaunchArgs] :
  /// A list of CLI arguments that are sent to the streaming server when a
  /// stream session launches. You can use this to configure the application or
  /// stream session details. You can also provide custom arguments that Amazon
  /// GameLift Streams passes to your game client.
  ///
  /// <code>AdditionalEnvironmentVariables</code> and
  /// <code>AdditionalLaunchArgs</code> have similar purposes.
  /// <code>AdditionalEnvironmentVariables</code> passes data using environment
  /// variables; while <code>AdditionalLaunchArgs</code> passes data using
  /// command-line arguments.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that represents a client request. The request is
  /// idempotent, which ensures that an API request completes only once. When
  /// users send a request, Amazon GameLift Streams automatically populates this
  /// field.
  ///
  /// Parameter [connectionTimeoutSeconds] :
  /// Length of time (in seconds) that Amazon GameLift Streams should wait for a
  /// client to connect or reconnect to the stream session. Applies to both
  /// connection and reconnection scenarios. This time span starts when the
  /// stream session reaches <code>ACTIVE</code> state. If no client connects
  /// before the timeout, Amazon GameLift Streams terminates the stream session.
  /// Default value is 120.
  ///
  /// Parameter [description] :
  /// A human-readable label for the stream session. You can update this value
  /// later.
  ///
  /// Parameter [locations] :
  /// A list of locations, in order of priority, where you want Amazon GameLift
  /// Streams to start a stream from. For example, <code>us-east-1</code>.
  /// Amazon GameLift Streams selects the location with the next available
  /// capacity to start a single stream session in. If this value is empty,
  /// Amazon GameLift Streams attempts to start a stream session in the primary
  /// location.
  ///
  /// For a complete list of locations that Amazon GameLift Streams supports,
  /// refer to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/regions-quotas.html">Regions,
  /// quotas, and limitations</a> in the <i>Amazon GameLift Streams Developer
  /// Guide</i>.
  ///
  /// Parameter [performanceStatsConfiguration] :
  /// Configuration settings for sharing the stream session's performance stats
  /// with the client
  ///
  /// Parameter [sessionLengthSeconds] :
  /// The maximum duration of a session. Amazon GameLift Streams will
  /// automatically terminate a session after this amount of time has elapsed,
  /// regardless of any existing client connections. Default value is 43200 (12
  /// hours).
  ///
  /// Parameter [userId] :
  /// An opaque, unique identifier for an end-user, defined by the developer.
  Future<StartStreamSessionOutput> startStreamSession({
    required String applicationIdentifier,
    required String identifier,
    required Protocol protocol,
    required String signalRequest,
    Map<String, String>? additionalEnvironmentVariables,
    List<String>? additionalLaunchArgs,
    String? clientToken,
    int? connectionTimeoutSeconds,
    String? description,
    List<String>? locations,
    PerformanceStatsConfiguration? performanceStatsConfiguration,
    int? sessionLengthSeconds,
    String? userId,
  }) async {
    _s.validateNumRange(
      'connectionTimeoutSeconds',
      connectionTimeoutSeconds,
      1,
      3600,
    );
    _s.validateNumRange(
      'sessionLengthSeconds',
      sessionLengthSeconds,
      1,
      86400,
    );
    final $payload = <String, dynamic>{
      'ApplicationIdentifier': applicationIdentifier,
      'Protocol': protocol.value,
      'SignalRequest': signalRequest,
      if (additionalEnvironmentVariables != null)
        'AdditionalEnvironmentVariables': additionalEnvironmentVariables,
      if (additionalLaunchArgs != null)
        'AdditionalLaunchArgs': additionalLaunchArgs,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (connectionTimeoutSeconds != null)
        'ConnectionTimeoutSeconds': connectionTimeoutSeconds,
      if (description != null) 'Description': description,
      if (locations != null) 'Locations': locations,
      if (performanceStatsConfiguration != null)
        'PerformanceStatsConfiguration': performanceStatsConfiguration,
      if (sessionLengthSeconds != null)
        'SessionLengthSeconds': sessionLengthSeconds,
      if (userId != null) 'UserId': userId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/streamgroups/${Uri.encodeComponent(identifier)}/streamsessions',
      exceptionFnMap: _exceptionFns,
    );
    return StartStreamSessionOutput.fromJson(response);
  }

  /// Assigns one or more tags to a Amazon GameLift Streams resource. Use tags
  /// to organize Amazon Web Services resources for a range of purposes. You can
  /// assign tags to the following Amazon GameLift Streams resource types:
  ///
  /// <ul>
  /// <li>
  /// Application
  /// </li>
  /// <li>
  /// StreamGroup
  /// </li>
  /// </ul>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> in the <i>Amazon Web Services General
  /// Reference</i>
  ///
  /// <a
  /// href="http://aws.amazon.com/answers/account-management/aws-tagging-strategies/">
  /// Amazon Web Services Tagging Strategies</a>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> of the Amazon GameLift Streams resource that you
  /// want to apply tags to.
  ///
  /// Parameter [tags] :
  /// A list of tags, in the form of key-value pairs, to assign to the specified
  /// Amazon GameLift Streams resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Permanently terminates an active stream session. When called, the stream
  /// session status changes to <code>TERMINATING</code>. You can terminate a
  /// stream session in any status except <code>ACTIVATING</code>. If the stream
  /// session is in <code>ACTIVATING</code> status, an exception is thrown.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  ///
  /// The stream group that runs this stream session.
  ///
  /// Parameter [streamSessionIdentifier] :
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream session
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamsession/sg-1AB2C3De4/ABC123def4567</code>.
  /// Example ID: <code>ABC123def4567</code>.
  Future<void> terminateStreamSession({
    required String identifier,
    required String streamSessionIdentifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/streamgroups/${Uri.encodeComponent(identifier)}/streamsessions/${Uri.encodeComponent(streamSessionIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from a Amazon GameLift Streams resource. To
  /// remove tags, specify the Amazon GameLift Streams resource and a list of
  /// one or more tags to remove.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> of the Amazon GameLift Streams resource that you
  /// want to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the specified Amazon GameLift Streams
  /// resource.
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

  /// Creates an application resource in Amazon GameLift Streams, which
  /// specifies the application content you want to stream, such as a game build
  /// or other software, and configures the settings to run it.
  ///
  /// Before you create an application, upload your application content files to
  /// an Amazon Simple Storage Service (Amazon S3) bucket. For more information,
  /// see <b>Getting Started</b> in the Amazon GameLift Streams Developer Guide.
  /// <important>
  /// Make sure that your files in the Amazon S3 bucket are the correct version
  /// you want to use. If you change the files at a later time, you will need to
  /// create a new Amazon GameLift Streams application.
  /// </important>
  /// If the request is successful, Amazon GameLift Streams begins to create an
  /// application and sets the status to <code>INITIALIZED</code>. When an
  /// application reaches <code>READY</code> status, you can use the application
  /// to set up stream groups and start streams. To track application status,
  /// call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetApplication.html">GetApplication</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationSourceUri] :
  /// The location of the content that you want to stream. Enter an Amazon S3
  /// URI to a bucket that contains your game or other application. The location
  /// can have a multi-level prefix structure, but it must include all the files
  /// needed to run the content. Amazon GameLift Streams copies everything under
  /// the specified location.
  ///
  /// This value is immutable. To designate a different content location, create
  /// a new application.
  /// <note>
  /// The Amazon S3 bucket and the Amazon GameLift Streams application must be
  /// in the same Amazon Web Services Region.
  /// </note>
  ///
  /// Parameter [description] :
  /// A human-readable label for the application. You can update this value
  /// later.
  ///
  /// Parameter [executablePath] :
  /// The relative path and file name of the executable file that Amazon
  /// GameLift Streams will stream. Specify a path relative to the location set
  /// in <code>ApplicationSourceUri</code>. The file must be contained within
  /// the application's root folder. For Windows applications, the file must be
  /// a valid Windows executable or batch file with a filename ending in .exe,
  /// .cmd, or .bat. For Linux applications, the file must be a valid Linux
  /// binary executable or a script that contains an initial interpreter line
  /// starting with a shebang ('<code>#!</code>').
  ///
  /// Parameter [runtimeEnvironment] :
  /// Configuration settings that identify the operating system for an
  /// application resource. This can also include a compatibility layer and
  /// other drivers.
  ///
  /// A runtime environment can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// For Linux applications
  ///
  /// <ul>
  /// <li>
  /// Ubuntu 22.04 LTS (<code>Type=UBUNTU, Version=22_04_LTS</code>)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Windows applications
  ///
  /// <ul>
  /// <li>
  /// Microsoft Windows Server 2022 Base (<code>Type=WINDOWS,
  /// Version=2022</code>)
  /// </li>
  /// <li>
  /// Proton 10.0-4 (<code>Type=PROTON, Version=20260204</code>)
  /// </li>
  /// <li>
  /// Proton 9.0-2 (<code>Type=PROTON, Version=20250516</code>)
  /// </li>
  /// <li>
  /// Proton 8.0-5 (<code>Type=PROTON, Version=20241007</code>)
  /// </li>
  /// <li>
  /// Proton 8.0-2c (<code>Type=PROTON, Version=20230704</code>)
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [applicationLogOutputUri] :
  /// An Amazon S3 URI to a bucket where you would like Amazon GameLift Streams
  /// to save application logs. Required if you specify one or more
  /// <code>ApplicationLogPaths</code>.
  /// <note>
  /// The log bucket must have permissions that give Amazon GameLift Streams
  /// access to write the log files. For more information, see <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/applications.html#application-bucket-permission-template">Application
  /// log bucket permission policy</a> in the <i>Amazon GameLift Streams
  /// Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [applicationLogPaths] :
  /// Locations of log files that your content generates during a stream
  /// session. Enter path values that are relative to the
  /// <code>ApplicationSourceUri</code> location, or relative to the user's home
  /// directory when using a supported path variable. You can specify up to 10
  /// log paths. Each individual log file cannot exceed 50 MB in size.
  ///
  /// Each path can be a directory or an exact file path. When you specify a
  /// directory, Amazon GameLift Streams collects only files with the following
  /// extensions: <code>.txt</code>, <code>.log</code>, and
  /// <code>.utrace</code>. To collect files with other extensions, specify the
  /// exact file path. The copy operation is not performed recursively in
  /// subfolders.
  ///
  /// The following path variables are recognized when they appear as the first
  /// component of a path: <code>%USERPROFILE%</code> (Windows and Proton),
  /// <code>$HOME</code> or <code>~</code> (Linux). Use a path variable when
  /// your application writes logs outside of the application directory.
  ///
  /// Amazon GameLift Streams uploads designated log files to the Amazon S3
  /// bucket that you specify in <code>ApplicationLogOutputUri</code> at the end
  /// of a stream session. To retrieve stored log files, call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetStreamSession.html">GetStreamSession</a>
  /// and get the <code>LogFileLocationUri</code>.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that represents a client request. The request is
  /// idempotent, which ensures that an API request completes only once. When
  /// users send a request, Amazon GameLift Streams automatically populates this
  /// field.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new application resource. Tags are
  /// developer-defined key-value pairs. Tagging Amazon Web Services resources
  /// is useful for resource management, access management and cost allocation.
  /// See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging Amazon Web Services Resources</a> in the <i>Amazon Web Services
  /// General Reference</i>. You can use <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_TagResource.html">TagResource</a>
  /// to add tags, <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_UntagResource.html">UntagResource</a>
  /// to remove tags, and <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_ListTagsForResource.html">ListTagsForResource</a>
  /// to view tags on existing resources.
  Future<CreateApplicationOutput> createApplication({
    required String applicationSourceUri,
    required String description,
    required String executablePath,
    required RuntimeEnvironment runtimeEnvironment,
    String? applicationLogOutputUri,
    List<String>? applicationLogPaths,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationSourceUri': applicationSourceUri,
      'Description': description,
      'ExecutablePath': executablePath,
      'RuntimeEnvironment': runtimeEnvironment,
      if (applicationLogOutputUri != null)
        'ApplicationLogOutputUri': applicationLogOutputUri,
      if (applicationLogPaths != null)
        'ApplicationLogPaths': applicationLogPaths,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationOutput.fromJson(response);
  }

  /// Retrieves properties for an Amazon GameLift Streams application resource.
  /// Specify the ID of the application that you want to retrieve. If the
  /// operation is successful, it returns properties for the requested
  /// application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the application
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  /// Example ID: <code>a-9ZY8X7Wv6</code>.
  Future<GetApplicationOutput> getApplication({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationOutput.fromJson(response);
  }

  /// Updates the mutable configuration settings for a Amazon GameLift Streams
  /// application resource. You can change the <code>Description</code>,
  /// <code>ApplicationLogOutputUri</code>, and
  /// <code>ApplicationLogPaths</code>.
  ///
  /// To update application settings, specify the application ID and provide the
  /// new values. If the operation is successful, it returns the complete
  /// updated set of settings for the application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the application
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  /// Example ID: <code>a-9ZY8X7Wv6</code>.
  ///
  /// Parameter [applicationLogOutputUri] :
  /// An Amazon S3 URI to a bucket where you would like Amazon GameLift Streams
  /// to save application logs. Required if you specify one or more
  /// <code>ApplicationLogPaths</code>.
  /// <note>
  /// The log bucket must have permissions that give Amazon GameLift Streams
  /// access to write the log files. For more information, see <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/applications.html#application-bucket-permission-template">Application
  /// log bucket permission policy</a> in the <i>Amazon GameLift Streams
  /// Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [applicationLogPaths] :
  /// Locations of log files that your content generates during a stream
  /// session. Enter path values that are relative to the
  /// <code>ApplicationSourceUri</code> location, or relative to the user's home
  /// directory when using a supported path variable. You can specify up to 10
  /// log paths. Each individual log file cannot exceed 50 MB in size.
  ///
  /// Each path can be a directory or an exact file path. When you specify a
  /// directory, Amazon GameLift Streams collects only files with the following
  /// extensions: <code>.txt</code>, <code>.log</code>, and
  /// <code>.utrace</code>. To collect files with other extensions, specify the
  /// exact file path. The copy operation is not performed recursively in
  /// subfolders.
  ///
  /// The following path variables are recognized when they appear as the first
  /// component of a path: <code>%USERPROFILE%</code> (Windows and Proton),
  /// <code>$HOME</code> or <code>~</code> (Linux). Use a path variable when
  /// your application writes logs outside of the application directory.
  ///
  /// Amazon GameLift Streams uploads designated log files to the Amazon S3
  /// bucket that you specify in <code>ApplicationLogOutputUri</code> at the end
  /// of a stream session. To retrieve stored log files, call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetStreamSession.html">GetStreamSession</a>
  /// and get the <code>LogFileLocationUri</code>.
  ///
  /// Parameter [description] :
  /// A human-readable label for the application.
  Future<UpdateApplicationOutput> updateApplication({
    required String identifier,
    String? applicationLogOutputUri,
    List<String>? applicationLogPaths,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (applicationLogOutputUri != null)
        'ApplicationLogOutputUri': applicationLogOutputUri,
      if (applicationLogPaths != null)
        'ApplicationLogPaths': applicationLogPaths,
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/applications/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApplicationOutput.fromJson(response);
  }

  /// Permanently deletes an Amazon GameLift Streams application resource. This
  /// also deletes the application content files stored with Amazon GameLift
  /// Streams. However, this does not delete the original files that you
  /// uploaded to your Amazon S3 bucket; you can delete these any time after
  /// Amazon GameLift Streams creates an application, which is the only time
  /// Amazon GameLift Streams accesses your Amazon S3 bucket.
  ///
  /// You can only delete an application that meets the following conditions:
  ///
  /// <ul>
  /// <li>
  /// The application is in <code>READY</code> or <code>ERROR</code> status. You
  /// cannot delete an application that's in <code>PROCESSING</code> or
  /// <code>INITIALIZED</code> status.
  /// </li>
  /// <li>
  /// The application is not the default application of any stream groups. You
  /// must first delete the stream group by using <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_DeleteStreamGroup.html">DeleteStreamGroup</a>.
  /// </li>
  /// <li>
  /// The application is not linked to any stream groups. You must first unlink
  /// the stream group by using <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_DisassociateApplications.html">DisassociateApplications</a>.
  /// </li>
  /// <li>
  /// An application is not streaming in any ongoing stream session. You must
  /// wait until the client ends the stream session or call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_TerminateStreamSession.html">TerminateStreamSession</a>
  /// to end the stream.
  /// </li>
  /// </ul>
  /// If any active stream groups exist for this application, this request
  /// returns a <code>ValidationException</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the application
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  /// Example ID: <code>a-9ZY8X7Wv6</code>.
  Future<void> deleteApplication({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/applications/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a list of all Amazon GameLift Streams applications that are
  /// associated with the Amazon Web Services account in use. This operation
  /// returns applications in all statuses, in no particular order. You can
  /// paginate the results as needed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The number of results to return. Use this parameter with
  /// <code>NextToken</code> to return results in sequential pages. Default
  /// value is <code>25</code>.
  ///
  /// Parameter [nextToken] :
  /// The token that marks the start of the next set of results. Use this token
  /// when you retrieve results as sequential pages. To get the first page of
  /// results, omit a token value. To get the remaining pages, provide the token
  /// returned with the previous result set.
  Future<ListApplicationsOutput> listApplications({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsOutput.fromJson(response);
  }

  /// Stream groups manage how Amazon GameLift Streams allocates resources and
  /// handles concurrent streams, allowing you to effectively manage capacity
  /// and costs. Within a stream group, you specify an application to stream,
  /// streaming locations and their capacity, and the stream class you want to
  /// use when streaming applications to your end-users. A stream class defines
  /// the hardware configuration of the compute resources that Amazon GameLift
  /// Streams will use when streaming, such as the CPU, GPU, and memory.
  ///
  /// Stream capacity represents the number of concurrent streams that can be
  /// active at a time. You set stream capacity per location, per stream group.
  /// The following capacity settings are available:
  ///
  /// <ul>
  /// <li>
  /// <b>Always-on capacity</b>: This setting, if non-zero, indicates minimum
  /// streaming capacity which is allocated to you and is never released back to
  /// the service. You pay for this base level of capacity at all times, whether
  /// used or idle.
  /// </li>
  /// <li>
  /// <b>Maximum capacity</b>: This indicates the maximum capacity that the
  /// service can allocate for you. Newly created streams may take a few minutes
  /// to start. Capacity is released back to the service when idle. You pay for
  /// capacity that is allocated to you until it is released.
  /// </li>
  /// <li>
  /// <b>Target-idle capacity</b>: This indicates idle capacity which the
  /// service pre-allocates and holds for you in anticipation of future
  /// activity. This helps to insulate your users from capacity-allocation
  /// delays. You pay for capacity which is held in this intentional idle state.
  /// </li>
  /// </ul>
  /// Values for capacity must be whole number multiples of the tenancy value of
  /// the stream group's stream class.
  ///
  /// To adjust the capacity of any <code>ACTIVE</code> stream group, call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_UpdateStreamGroup.html">UpdateStreamGroup</a>.
  ///
  /// If the <code>CreateStreamGroup</code> request is successful, Amazon
  /// GameLift Streams assigns a unique ID to the stream group resource and sets
  /// the status to <code>ACTIVATING</code>. It can take a few minutes for
  /// Amazon GameLift Streams to finish creating the stream group while it
  /// searches for unallocated compute resources and provisions them. When
  /// complete, the stream group status will be <code>ACTIVE</code> and you can
  /// start stream sessions by using <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_StartStreamSession.html">StartStreamSession</a>.
  /// To check the stream group's status, call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetStreamGroup.html">GetStreamGroup</a>.
  ///
  /// Stream groups should be recreated every 3-4 weeks to pick up important
  /// service updates and fixes. Stream groups that are older than 180 days can
  /// no longer be updated with new application associations. Stream groups
  /// expire when they are 365 days old, at which point they can no longer
  /// stream sessions. The exact expiration date is indicated by the date value
  /// in the <code>ExpiresAt</code> field.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [description] :
  /// A descriptive label for the stream group.
  ///
  /// Parameter [streamClass] :
  /// The target stream quality for sessions that are hosted in this stream
  /// group. Set a stream class that is appropriate to the type of content that
  /// you're streaming. Stream class determines the type of computing resources
  /// Amazon GameLift Streams uses and impacts the cost of streaming. The
  /// following options are available:
  ///
  /// A stream class can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>gen6n_pro_win2022</code> (NVIDIA, pro)</b> Supports applications
  /// with extremely high 3D scene complexity which require maximum resources.
  /// Runs applications on Microsoft Windows Server 2022 Base and supports
  /// DirectX 12. Compatible with Unreal Engine versions up through 5.6, 32 and
  /// 64-bit applications, and anti-cheat technology. Powered by NVIDIA L4
  /// Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_pro</code> (NVIDIA, pro)</b> Supports applications with
  /// extremely high 3D scene complexity which require maximum resources.
  /// Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_ultra_win2022</code> (NVIDIA, ultra)</b> Supports
  /// applications with high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_ultra</code> (NVIDIA, ultra)</b> Supports applications
  /// with high 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_medium</code> (NVIDIA, medium)</b> Supports applications
  /// with moderate 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 2 vCPUs, 8 GB RAM, 6 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 4 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_small</code> (NVIDIA, small)</b> Supports applications
  /// with lightweight 3D scene complexity and low CPU usage. Powered by NVIDIA
  /// L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 1 vCPUs, 4 GB RAM, 2 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 12 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_medium_win2022</code> (NVIDIA, medium)</b> Supports
  /// applications with low 3D scene complexity. Powered by NVIDIA L4 Tensor
  /// Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 6 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_small_win2022</code> (NVIDIA, small)</b> Supports
  /// applications with low 3D scene complexity. Powered by NVIDIA L4 Tensor
  /// Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 2 vCPUs, 8 GB RAM, 3 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6e_pro_win2022</code> (NVIDIA, pro)</b> Supports applications
  /// with extremely high 3D scene complexity which require maximum resources.
  /// Runs applications on Microsoft Windows Server 2022 Base and supports
  /// DirectX 12. Compatible with Unreal Engine versions up through 5.6, 32 and
  /// 64-bit applications, and anti-cheat technology. Powered by NVIDIA L40S
  /// Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 128 GB RAM, 48 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6e_pro</code> (NVIDIA, pro)</b> Supports applications with
  /// extremely high 3D scene complexity which require maximum resources.
  /// Powered by NVIDIA L40S Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 128 GB RAM, 48 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_win2022</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA A10G Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA A10G Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_ultra</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Powered by NVIDIA A10G Tensor
  /// Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_win2022</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA T4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 8 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_ultra</code> (NVIDIA, ultra)</b> Supports applications
  /// with high 3D scene complexity. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that represents a client request. The request is
  /// idempotent, which ensures that an API request completes only once. When
  /// users send a request, Amazon GameLift Streams automatically populates this
  /// field.
  ///
  /// Parameter [defaultApplicationIdentifier] :
  /// The unique identifier of the Amazon GameLift Streams application that you
  /// want to set as the default application in a stream group. The application
  /// that you specify must be in <code>READY</code> status. The default
  /// application is pre-cached on always-on compute resources, reducing stream
  /// startup times. Other applications are automatically cached as needed.
  ///
  /// If you do not link an application when you create a stream group, you will
  /// need to link one later, before you can start streaming, using <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_AssociateApplications.html">AssociateApplications</a>.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the application
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  /// Example ID: <code>a-9ZY8X7Wv6</code>.
  ///
  /// Parameter [locationConfigurations] :
  /// A set of one or more locations and the streaming capacity for each
  /// location.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new stream group resource. Tags are
  /// developer-defined key-value pairs. Tagging Amazon Web Services resources
  /// is useful for resource management, access management and cost allocation.
  /// See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging Amazon Web Services Resources</a> in the <i>Amazon Web Services
  /// General Reference</i>. You can use <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_TagResource.html">TagResource</a>
  /// to add tags, <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_UntagResource.html">UntagResource</a>
  /// to remove tags, and <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_ListTagsForResource.html">ListTagsForResource</a>
  /// to view tags on existing resources.
  Future<CreateStreamGroupOutput> createStreamGroup({
    required String description,
    required StreamClass streamClass,
    String? clientToken,
    String? defaultApplicationIdentifier,
    List<LocationConfiguration>? locationConfigurations,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Description': description,
      'StreamClass': streamClass.value,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (defaultApplicationIdentifier != null)
        'DefaultApplicationIdentifier': defaultApplicationIdentifier,
      if (locationConfigurations != null)
        'LocationConfigurations': locationConfigurations,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/streamgroups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStreamGroupOutput.fromJson(response);
  }

  /// Retrieves properties for a Amazon GameLift Streams stream group resource.
  /// Specify the ID of the stream group that you want to retrieve. If the
  /// operation is successful, it returns properties for the requested stream
  /// group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  Future<GetStreamGroupOutput> getStreamGroup({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/streamgroups/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStreamGroupOutput.fromJson(response);
  }

  /// Updates the configuration settings for an Amazon GameLift Streams stream
  /// group resource. To update a stream group, it must be in
  /// <code>ACTIVE</code> status. You can change the description, the set of
  /// locations, and the requested capacity of a stream group per location. If
  /// you want to change the stream class, create a new stream group.
  ///
  /// Stream capacity represents the number of concurrent streams that can be
  /// active at a time. You set stream capacity per location, per stream group.
  /// The following capacity settings are available:
  ///
  /// <ul>
  /// <li>
  /// <b>Always-on capacity</b>: This setting, if non-zero, indicates minimum
  /// streaming capacity which is allocated to you and is never released back to
  /// the service. You pay for this base level of capacity at all times, whether
  /// used or idle.
  /// </li>
  /// <li>
  /// <b>Maximum capacity</b>: This indicates the maximum capacity that the
  /// service can allocate for you. Newly created streams may take a few minutes
  /// to start. Capacity is released back to the service when idle. You pay for
  /// capacity that is allocated to you until it is released.
  /// </li>
  /// <li>
  /// <b>Target-idle capacity</b>: This indicates idle capacity which the
  /// service pre-allocates and holds for you in anticipation of future
  /// activity. This helps to insulate your users from capacity-allocation
  /// delays. You pay for capacity which is held in this intentional idle state.
  /// </li>
  /// </ul>
  /// Values for capacity must be whole number multiples of the tenancy value of
  /// the stream group's stream class.
  ///
  /// To update a stream group, specify the stream group's Amazon Resource Name
  /// (ARN) and provide the new values. If the request is successful, Amazon
  /// GameLift Streams returns the complete updated metadata for the stream
  /// group. Expired stream groups cannot be updated.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  ///
  /// Parameter [defaultApplicationIdentifier] :
  /// The unique identifier of the Amazon GameLift Streams application that you
  /// want to set as the default application in a stream group. The application
  /// that you specify must be in <code>READY</code> status. The default
  /// application is pre-cached on always-on compute resources, reducing stream
  /// startup times. Other applications are automatically cached as needed.
  ///
  /// Note that this parameter only sets the default application in a stream
  /// group. To associate a new application to an existing stream group, you
  /// must use <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_AssociateApplications.html">AssociateApplications</a>.
  ///
  /// When you switch default applications in a stream group, it can take up to
  /// a few hours for the new default application to be pre-cached.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the application
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  /// Example ID: <code>a-9ZY8X7Wv6</code>.
  ///
  /// Parameter [description] :
  /// A descriptive label for the stream group.
  ///
  /// Parameter [locationConfigurations] :
  /// A set of one or more locations and the streaming capacity for each
  /// location.
  Future<UpdateStreamGroupOutput> updateStreamGroup({
    required String identifier,
    String? defaultApplicationIdentifier,
    String? description,
    List<LocationConfiguration>? locationConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      if (defaultApplicationIdentifier != null)
        'DefaultApplicationIdentifier': defaultApplicationIdentifier,
      if (description != null) 'Description': description,
      if (locationConfigurations != null)
        'LocationConfigurations': locationConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/streamgroups/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStreamGroupOutput.fromJson(response);
  }

  /// Permanently deletes all compute resources and information related to a
  /// stream group. To delete a stream group, specify the unique stream group
  /// identifier. During the deletion process, the stream group's status is
  /// <code>DELETING</code>. This operation stops streams in progress and
  /// prevents new streams from starting. As a best practice, before deleting
  /// the stream group, call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_ListStreamSessions.html">ListStreamSessions</a>
  /// to check for streams in progress and take action to stop them. When you
  /// delete a stream group, any application associations referring to that
  /// stream group are automatically removed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  Future<void> deleteStreamGroup({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/streamgroups/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a list of all Amazon GameLift Streams stream groups that are
  /// associated with the Amazon Web Services account in use. This operation
  /// returns stream groups in all statuses, in no particular order. You can
  /// paginate the results as needed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The number of results to return. Use this parameter with
  /// <code>NextToken</code> to return results in sequential pages. Default
  /// value is <code>25</code>.
  ///
  /// Parameter [nextToken] :
  /// A token that marks the start of the next set of results. Use this token
  /// when you retrieve results as sequential pages. To get the first page of
  /// results, omit a token value. To get the remaining pages, provide the token
  /// returned with the previous result set.
  Future<ListStreamGroupsOutput> listStreamGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/streamgroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamGroupsOutput.fromJson(response);
  }
}

/// @nodoc
class AddStreamGroupLocationsOutput {
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> or ID that uniquely identifies the stream group
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  /// Example ID: <code>sg-1AB2C3De4</code>.
  final String identifier;

  /// This value is set of locations, including their name, current status, and
  /// capacities.
  ///
  /// A location can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: Amazon GameLift Streams is preparing the location.
  /// You cannot stream from, scale the capacity of, or remove this location yet.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The location is provisioned with initial capacity. You
  /// can now stream from, scale the capacity of, or remove this location.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: Amazon GameLift Streams failed to set up this location.
  /// The <code>StatusReason</code> field describes the error. You can remove this
  /// location and try to add it again.
  /// </li>
  /// <li>
  /// <code>REMOVING</code>: Amazon GameLift Streams is working to remove this
  /// location. This will release all provisioned capacity for this location in
  /// this stream group.
  /// </li>
  /// </ul>
  final List<LocationState> locations;

  AddStreamGroupLocationsOutput({
    required this.identifier,
    required this.locations,
  });

  factory AddStreamGroupLocationsOutput.fromJson(Map<String, dynamic> json) {
    return AddStreamGroupLocationsOutput(
      identifier: (json['Identifier'] as String?) ?? '',
      locations: ((json['Locations'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocationState.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final locations = this.locations;
    return {
      'Identifier': identifier,
      'Locations': locations,
    };
  }
}

/// @nodoc
class AssociateApplicationsOutput {
  /// A set of applications that are associated to the stream group.
  ///
  /// This value is a set of <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARNs)</a> that uniquely identify application resources.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  final List<String>? applicationArns;

  /// A stream group that is associated to the applications.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that uniquely identifies the stream group resource.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  final String? arn;

  AssociateApplicationsOutput({
    this.applicationArns,
    this.arn,
  });

  factory AssociateApplicationsOutput.fromJson(Map<String, dynamic> json) {
    return AssociateApplicationsOutput(
      applicationArns: (json['ApplicationArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArns = this.applicationArns;
    final arn = this.arn;
    return {
      if (applicationArns != null) 'ApplicationArns': applicationArns,
      if (arn != null) 'Arn': arn,
    };
  }
}

/// @nodoc
class CreateStreamSessionConnectionOutput {
  /// The WebRTC answer string that the stream server generates in response to the
  /// <code>SignalRequest</code>.
  final String? signalResponse;

  CreateStreamSessionConnectionOutput({
    this.signalResponse,
  });

  factory CreateStreamSessionConnectionOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateStreamSessionConnectionOutput(
      signalResponse: json['SignalResponse'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final signalResponse = this.signalResponse;
    return {
      if (signalResponse != null) 'SignalResponse': signalResponse,
    };
  }
}

/// @nodoc
class DisassociateApplicationsOutput {
  /// A set of applications that are disassociated from this stream group.
  ///
  /// This value is a set of <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARNs)</a> that uniquely identify application resources.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  final List<String>? applicationArns;

  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that uniquely identifies the stream group resource.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  final String? arn;

  DisassociateApplicationsOutput({
    this.applicationArns,
    this.arn,
  });

  factory DisassociateApplicationsOutput.fromJson(Map<String, dynamic> json) {
    return DisassociateApplicationsOutput(
      applicationArns: (json['ApplicationArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArns = this.applicationArns;
    final arn = this.arn;
    return {
      if (applicationArns != null) 'ApplicationArns': applicationArns,
      if (arn != null) 'Arn': arn,
    };
  }
}

/// @nodoc
class ExportStreamSessionFilesOutput {
  ExportStreamSessionFilesOutput();

  factory ExportStreamSessionFilesOutput.fromJson(Map<String, dynamic> _) {
    return ExportStreamSessionFilesOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetStreamSessionOutput {
  /// A set of options that you can use to control the stream session runtime
  /// environment, expressed as a set of key-value pairs. You can use this to
  /// configure the application or stream session details. You can also provide
  /// custom environment variables that Amazon GameLift Streams passes to your
  /// game client.
  /// <note>
  /// If you want to debug your application with environment variables, we
  /// recommend that you do so in a local environment outside of Amazon GameLift
  /// Streams. For more information, refer to the Compatibility Guidance in the
  /// troubleshooting section of the Developer Guide.
  /// </note>
  /// <code>AdditionalEnvironmentVariables</code> and
  /// <code>AdditionalLaunchArgs</code> have similar purposes.
  /// <code>AdditionalEnvironmentVariables</code> passes data using environment
  /// variables; while <code>AdditionalLaunchArgs</code> passes data using
  /// command-line arguments.
  final Map<String, String>? additionalEnvironmentVariables;

  /// A list of CLI arguments that are sent to the streaming server when a stream
  /// session launches. You can use this to configure the application or stream
  /// session details. You can also provide custom arguments that Amazon GameLift
  /// Streams passes to your game client.
  ///
  /// <code>AdditionalEnvironmentVariables</code> and
  /// <code>AdditionalLaunchArgs</code> have similar purposes.
  /// <code>AdditionalEnvironmentVariables</code> passes data using environment
  /// variables; while <code>AdditionalLaunchArgs</code> passes data using
  /// command-line arguments.
  final List<String>? additionalLaunchArgs;

  /// The application streaming in this session.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that uniquely identifies the application resource.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  final String? applicationArn;

  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that's assigned to a stream session resource. When
  /// combined with the stream group resource ID, this value uniquely identifies
  /// the stream session across all Amazon Web Services Regions. Format is
  /// <code>arn:aws:gameliftstreams:\[AWS Region\]:\[AWS
  /// account\]:streamsession/\[stream group resource ID\]/\[stream session
  /// resource ID\]</code>.
  final String? arn;

  /// The length of time that Amazon GameLift Streams should wait for a client to
  /// connect or reconnect to the stream session. This time span starts when the
  /// stream session reaches <code>ACTIVE</code> or
  /// <code>PENDING_CLIENT_RECONNECTION</code> state. If no client connects (or
  /// reconnects) before the timeout, Amazon GameLift Streams terminates the
  /// stream session.
  final int? connectionTimeoutSeconds;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// A human-readable label for the stream session. You can update this value at
  /// any time.
  final String? description;

  /// Provides details about the stream session's exported files.
  final ExportFilesMetadata? exportFilesMetadata;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// The location where Amazon GameLift Streams hosts and streams your
  /// application. For example, <code>us-east-1</code>. For a complete list of
  /// locations that Amazon GameLift Streams supports, refer to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/regions-quotas.html">Regions,
  /// quotas, and limitations</a> in the <i>Amazon GameLift Streams Developer
  /// Guide</i>.
  final String? location;

  /// Access location for log files that your content generates during a stream
  /// session. These log files are uploaded to cloud storage location at the end
  /// of a stream session. The Amazon GameLift Streams application resource
  /// defines which log files to upload.
  final String? logFileLocationUri;

  /// The performance stats configuration for the stream session
  final PerformanceStatsConfiguration? performanceStatsConfiguration;

  /// The data transfer protocol in use with the stream session.
  final Protocol? protocol;

  /// The maximum duration of a session. Amazon GameLift Streams will
  /// automatically terminate a session after this amount of time has elapsed,
  /// regardless of any existing client connections.
  final int? sessionLengthSeconds;

  /// The WebRTC ICE offer string that a client generates to initiate a connection
  /// to the stream session.
  final String? signalRequest;

  /// The WebRTC answer string that the stream server generates in response to the
  /// <code>SignalRequest</code>.
  final String? signalResponse;

  /// The current status of the stream session. A stream session is ready for a
  /// client to connect when in <code>ACTIVE</code> status.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: The stream session is starting and preparing to
  /// stream.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The stream session is ready and waiting for a client
  /// connection. A client has <code>ConnectionTimeoutSeconds</code> (specified in
  /// <code>StartStreamSession</code>) from when the session reaches
  /// <code>ACTIVE</code> state to establish a connection. If no client connects
  /// within this timeframe, the session automatically terminates.
  /// </li>
  /// <li>
  /// <code>CONNECTED</code>: The stream session has a connected client. A session
  /// will automatically terminate if there is no user input for 60 minutes, or if
  /// the maximum length of a session specified by
  /// <code>SessionLengthSeconds</code> in <code>StartStreamSession</code> is
  /// exceeded.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: The stream session failed to activate. See
  /// <code>StatusReason</code> (returned by <code>GetStreamSession</code> and
  /// <code>StartStreamSession</code>) for more information.
  /// </li>
  /// <li>
  /// <code>PENDING_CLIENT_RECONNECTION</code>: A client has recently disconnected
  /// and the stream session is waiting for the client to reconnect. A client has
  /// <code>ConnectionTimeoutSeconds</code> (specified in
  /// <code>StartStreamSession</code>) from when the session reaches
  /// <code>PENDING_CLIENT_RECONNECTION</code> state to re-establish a connection.
  /// If no client connects within this timeframe, the session automatically
  /// terminates.
  /// </li>
  /// <li>
  /// <code>RECONNECTING</code>: A client has initiated a reconnect to a session
  /// that was in <code>PENDING_CLIENT_RECONNECTION</code> state.
  /// </li>
  /// <li>
  /// <code>TERMINATING</code>: The stream session is ending.
  /// </li>
  /// <li>
  /// <code>TERMINATED</code>: The stream session has ended.
  /// </li>
  /// </ul>
  final StreamSessionStatus? status;

  /// A short description of the reason the stream session is in
  /// <code>ERROR</code> status or <code>TERMINATED</code> status.
  ///
  /// <code>ERROR</code> status reasons:
  ///
  /// <ul>
  /// <li>
  /// <code>applicationLogS3DestinationError</code>: Could not write the
  /// application log to the Amazon S3 bucket that is configured for the streaming
  /// application. Make sure the bucket still exists.
  /// </li>
  /// <li>
  /// <code>internalError</code>: An internal service error occurred. Start a new
  /// stream session to continue streaming.
  /// </li>
  /// <li>
  /// <code>invalidSignalRequest</code>: The WebRTC signal request that was sent
  /// is not valid. When starting or reconnecting to a stream session, use
  /// <code>generateSignalRequest</code> in the Amazon GameLift Streams Web SDK to
  /// generate a new signal request.
  /// </li>
  /// <li>
  /// <code>placementTimeout</code>: Amazon GameLift Streams could not find
  /// available stream capacity to start a stream session. Increase the stream
  /// capacity in the stream group or wait until capacity becomes available.
  /// </li>
  /// </ul>
  /// <code>TERMINATED</code> status reasons:
  ///
  /// <ul>
  /// <li>
  /// <code>apiTerminated</code>: The stream session was terminated by an API call
  /// to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_TerminateStreamSession.html">TerminateStreamSession</a>.
  /// </li>
  /// <li>
  /// <code>applicationExit</code>: The streaming application exited or crashed.
  /// The stream session was terminated because the application is no longer
  /// running.
  /// </li>
  /// <li>
  /// <code>connectionTimeout</code>: The stream session was terminated because
  /// the client failed to connect within the connection timeout period specified
  /// by <code>ConnectionTimeoutSeconds</code>.
  /// </li>
  /// <li>
  /// <code>maxSessionLengthTimeout</code>: The stream session was terminated
  /// because it exceeded the maximum session length timeout period specified by
  /// <code>SessionLengthSeconds</code>.
  /// </li>
  /// <li>
  /// <code>reconnectionTimeout</code>: The stream session was terminated because
  /// the client failed to reconnect within the reconnection timeout period
  /// specified by <code>ConnectionTimeoutSeconds</code> after losing connection.
  /// </li>
  /// </ul>
  final StreamSessionStatusReason? statusReason;

  /// The unique identifier for the Amazon GameLift Streams stream group that is
  /// hosting the stream session. Format example: <code>sg-1AB2C3De4</code>.
  final String? streamGroupId;

  /// An opaque, unique identifier for an end-user, defined by the developer.
  final String? userId;

  /// The URL of an S3 bucket that stores Amazon GameLift Streams WebSDK files.
  /// The URL is used to establish connection with the client.
  final String? webSdkProtocolUrl;

  GetStreamSessionOutput({
    this.additionalEnvironmentVariables,
    this.additionalLaunchArgs,
    this.applicationArn,
    this.arn,
    this.connectionTimeoutSeconds,
    this.createdAt,
    this.description,
    this.exportFilesMetadata,
    this.lastUpdatedAt,
    this.location,
    this.logFileLocationUri,
    this.performanceStatsConfiguration,
    this.protocol,
    this.sessionLengthSeconds,
    this.signalRequest,
    this.signalResponse,
    this.status,
    this.statusReason,
    this.streamGroupId,
    this.userId,
    this.webSdkProtocolUrl,
  });

  factory GetStreamSessionOutput.fromJson(Map<String, dynamic> json) {
    return GetStreamSessionOutput(
      additionalEnvironmentVariables:
          (json['AdditionalEnvironmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      additionalLaunchArgs: (json['AdditionalLaunchArgs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      applicationArn: json['ApplicationArn'] as String?,
      arn: json['Arn'] as String?,
      connectionTimeoutSeconds: json['ConnectionTimeoutSeconds'] as int?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      exportFilesMetadata: json['ExportFilesMetadata'] != null
          ? ExportFilesMetadata.fromJson(
              json['ExportFilesMetadata'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      location: json['Location'] as String?,
      logFileLocationUri: json['LogFileLocationUri'] as String?,
      performanceStatsConfiguration:
          json['PerformanceStatsConfiguration'] != null
              ? PerformanceStatsConfiguration.fromJson(
                  json['PerformanceStatsConfiguration'] as Map<String, dynamic>)
              : null,
      protocol: (json['Protocol'] as String?)?.let(Protocol.fromString),
      sessionLengthSeconds: json['SessionLengthSeconds'] as int?,
      signalRequest: json['SignalRequest'] as String?,
      signalResponse: json['SignalResponse'] as String?,
      status: (json['Status'] as String?)?.let(StreamSessionStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(StreamSessionStatusReason.fromString),
      streamGroupId: json['StreamGroupId'] as String?,
      userId: json['UserId'] as String?,
      webSdkProtocolUrl: json['WebSdkProtocolUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalEnvironmentVariables = this.additionalEnvironmentVariables;
    final additionalLaunchArgs = this.additionalLaunchArgs;
    final applicationArn = this.applicationArn;
    final arn = this.arn;
    final connectionTimeoutSeconds = this.connectionTimeoutSeconds;
    final createdAt = this.createdAt;
    final description = this.description;
    final exportFilesMetadata = this.exportFilesMetadata;
    final lastUpdatedAt = this.lastUpdatedAt;
    final location = this.location;
    final logFileLocationUri = this.logFileLocationUri;
    final performanceStatsConfiguration = this.performanceStatsConfiguration;
    final protocol = this.protocol;
    final sessionLengthSeconds = this.sessionLengthSeconds;
    final signalRequest = this.signalRequest;
    final signalResponse = this.signalResponse;
    final status = this.status;
    final statusReason = this.statusReason;
    final streamGroupId = this.streamGroupId;
    final userId = this.userId;
    final webSdkProtocolUrl = this.webSdkProtocolUrl;
    return {
      if (additionalEnvironmentVariables != null)
        'AdditionalEnvironmentVariables': additionalEnvironmentVariables,
      if (additionalLaunchArgs != null)
        'AdditionalLaunchArgs': additionalLaunchArgs,
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (arn != null) 'Arn': arn,
      if (connectionTimeoutSeconds != null)
        'ConnectionTimeoutSeconds': connectionTimeoutSeconds,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (exportFilesMetadata != null)
        'ExportFilesMetadata': exportFilesMetadata,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (location != null) 'Location': location,
      if (logFileLocationUri != null) 'LogFileLocationUri': logFileLocationUri,
      if (performanceStatsConfiguration != null)
        'PerformanceStatsConfiguration': performanceStatsConfiguration,
      if (protocol != null) 'Protocol': protocol.value,
      if (sessionLengthSeconds != null)
        'SessionLengthSeconds': sessionLengthSeconds,
      if (signalRequest != null) 'SignalRequest': signalRequest,
      if (signalResponse != null) 'SignalResponse': signalResponse,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
      if (streamGroupId != null) 'StreamGroupId': streamGroupId,
      if (userId != null) 'UserId': userId,
      if (webSdkProtocolUrl != null) 'WebSdkProtocolUrl': webSdkProtocolUrl,
    };
  }
}

/// @nodoc
class ListStreamSessionsOutput {
  /// A collection of Amazon GameLift Streams stream sessions that are associated
  /// with a stream group and returned in response to a list request. Each item
  /// includes stream session metadata and status.
  final List<StreamSessionSummary>? items;

  /// A token that marks the start of the next sequential page of results. If an
  /// operation doesn't return a token, you've reached the end of the list.
  final String? nextToken;

  ListStreamSessionsOutput({
    this.items,
    this.nextToken,
  });

  factory ListStreamSessionsOutput.fromJson(Map<String, dynamic> json) {
    return ListStreamSessionsOutput(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => StreamSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListStreamSessionsByAccountOutput {
  /// A collection of Amazon GameLift Streams stream sessions that are associated
  /// with a stream group and returned in response to a list request. Each item
  /// includes stream session metadata and status.
  final List<StreamSessionSummary>? items;

  /// A token that marks the start of the next sequential page of results. If an
  /// operation doesn't return a token, you've reached the end of the list.
  final String? nextToken;

  ListStreamSessionsByAccountOutput({
    this.items,
    this.nextToken,
  });

  factory ListStreamSessionsByAccountOutput.fromJson(
      Map<String, dynamic> json) {
    return ListStreamSessionsByAccountOutput(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => StreamSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// A collection of tags that have been assigned to the specified resource.
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

/// @nodoc
class StartStreamSessionOutput {
  /// A set of options that you can use to control the stream session runtime
  /// environment, expressed as a set of key-value pairs. You can use this to
  /// configure the application or stream session details. You can also provide
  /// custom environment variables that Amazon GameLift Streams passes to your
  /// game client.
  /// <note>
  /// If you want to debug your application with environment variables, we
  /// recommend that you do so in a local environment outside of Amazon GameLift
  /// Streams. For more information, refer to the Compatibility Guidance in the
  /// troubleshooting section of the Developer Guide.
  /// </note>
  /// <code>AdditionalEnvironmentVariables</code> and
  /// <code>AdditionalLaunchArgs</code> have similar purposes.
  /// <code>AdditionalEnvironmentVariables</code> passes data using environment
  /// variables; while <code>AdditionalLaunchArgs</code> passes data using
  /// command-line arguments.
  final Map<String, String>? additionalEnvironmentVariables;

  /// A list of CLI arguments that are sent to the streaming server when a stream
  /// session launches. You can use this to configure the application or stream
  /// session details. You can also provide custom arguments that Amazon GameLift
  /// Streams passes to your game client.
  ///
  /// <code>AdditionalEnvironmentVariables</code> and
  /// <code>AdditionalLaunchArgs</code> have similar purposes.
  /// <code>AdditionalEnvironmentVariables</code> passes data using environment
  /// variables; while <code>AdditionalLaunchArgs</code> passes data using
  /// command-line arguments.
  final List<String>? additionalLaunchArgs;

  /// The application streaming in this session.
  ///
  /// This value is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that uniquely identifies the application resource.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  final String? applicationArn;

  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that's assigned to a stream session resource. When
  /// combined with the stream group resource ID, this value uniquely identifies
  /// the stream session across all Amazon Web Services Regions. Format is
  /// <code>arn:aws:gameliftstreams:\[AWS Region\]:\[AWS
  /// account\]:streamsession/\[stream group resource ID\]/\[stream session
  /// resource ID\]</code>.
  final String? arn;

  /// The length of time that Amazon GameLift Streams should wait for a client to
  /// connect or reconnect to the stream session. This time span starts when the
  /// stream session reaches <code>ACTIVE</code> or
  /// <code>PENDING_CLIENT_RECONNECTION</code> state. If no client connects (or
  /// reconnects) before the timeout, Amazon GameLift Streams terminates the
  /// stream session.
  final int? connectionTimeoutSeconds;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// A human-readable label for the stream session. You can update this value at
  /// any time.
  final String? description;

  /// Provides details about the stream session's exported files.
  final ExportFilesMetadata? exportFilesMetadata;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// The location where Amazon GameLift Streams hosts and streams your
  /// application. For example, <code>us-east-1</code>. For a complete list of
  /// locations that Amazon GameLift Streams supports, refer to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/regions-quotas.html">Regions,
  /// quotas, and limitations</a> in the <i>Amazon GameLift Streams Developer
  /// Guide</i>.
  final String? location;

  /// Access location for log files that your content generates during a stream
  /// session. These log files are uploaded to cloud storage location at the end
  /// of a stream session. The Amazon GameLift Streams application resource
  /// defines which log files to upload.
  final String? logFileLocationUri;

  /// The performance stats configuration for the stream session
  final PerformanceStatsConfiguration? performanceStatsConfiguration;

  /// The data transfer protocol in use with the stream session.
  final Protocol? protocol;

  /// The maximum duration of a session. Amazon GameLift Streams will
  /// automatically terminate a session after this amount of time has elapsed,
  /// regardless of any existing client connections.
  final int? sessionLengthSeconds;

  /// The WebRTC ICE offer string that a client generates to initiate a connection
  /// to the stream session.
  final String? signalRequest;

  /// The WebRTC answer string that the stream server generates in response to the
  /// <code>SignalRequest</code>.
  final String? signalResponse;

  /// The current status of the stream session. A stream session is ready for a
  /// client to connect when in <code>ACTIVE</code> status.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: The stream session is starting and preparing to
  /// stream.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The stream session is ready and waiting for a client
  /// connection. A client has <code>ConnectionTimeoutSeconds</code> (specified in
  /// <code>StartStreamSession</code>) from when the session reaches
  /// <code>ACTIVE</code> state to establish a connection. If no client connects
  /// within this timeframe, the session automatically terminates.
  /// </li>
  /// <li>
  /// <code>CONNECTED</code>: The stream session has a connected client. A session
  /// will automatically terminate if there is no user input for 60 minutes, or if
  /// the maximum length of a session specified by
  /// <code>SessionLengthSeconds</code> in <code>StartStreamSession</code> is
  /// exceeded.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: The stream session failed to activate. See
  /// <code>StatusReason</code> (returned by <code>GetStreamSession</code> and
  /// <code>StartStreamSession</code>) for more information.
  /// </li>
  /// <li>
  /// <code>PENDING_CLIENT_RECONNECTION</code>: A client has recently disconnected
  /// and the stream session is waiting for the client to reconnect. A client has
  /// <code>ConnectionTimeoutSeconds</code> (specified in
  /// <code>StartStreamSession</code>) from when the session reaches
  /// <code>PENDING_CLIENT_RECONNECTION</code> state to re-establish a connection.
  /// If no client connects within this timeframe, the session automatically
  /// terminates.
  /// </li>
  /// <li>
  /// <code>RECONNECTING</code>: A client has initiated a reconnect to a session
  /// that was in <code>PENDING_CLIENT_RECONNECTION</code> state.
  /// </li>
  /// <li>
  /// <code>TERMINATING</code>: The stream session is ending.
  /// </li>
  /// <li>
  /// <code>TERMINATED</code>: The stream session has ended.
  /// </li>
  /// </ul>
  final StreamSessionStatus? status;

  /// A short description of the reason the stream session is in
  /// <code>ERROR</code> status or <code>TERMINATED</code> status.
  ///
  /// <code>ERROR</code> status reasons:
  ///
  /// <ul>
  /// <li>
  /// <code>applicationLogS3DestinationError</code>: Could not write the
  /// application log to the Amazon S3 bucket that is configured for the streaming
  /// application. Make sure the bucket still exists.
  /// </li>
  /// <li>
  /// <code>internalError</code>: An internal service error occurred. Start a new
  /// stream session to continue streaming.
  /// </li>
  /// <li>
  /// <code>invalidSignalRequest</code>: The WebRTC signal request that was sent
  /// is not valid. When starting or reconnecting to a stream session, use
  /// <code>generateSignalRequest</code> in the Amazon GameLift Streams Web SDK to
  /// generate a new signal request.
  /// </li>
  /// <li>
  /// <code>placementTimeout</code>: Amazon GameLift Streams could not find
  /// available stream capacity to start a stream session. Increase the stream
  /// capacity in the stream group or wait until capacity becomes available.
  /// </li>
  /// </ul>
  /// <code>TERMINATED</code> status reasons:
  ///
  /// <ul>
  /// <li>
  /// <code>apiTerminated</code>: The stream session was terminated by an API call
  /// to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_TerminateStreamSession.html">TerminateStreamSession</a>.
  /// </li>
  /// <li>
  /// <code>applicationExit</code>: The streaming application exited or crashed.
  /// The stream session was terminated because the application is no longer
  /// running.
  /// </li>
  /// <li>
  /// <code>connectionTimeout</code>: The stream session was terminated because
  /// the client failed to connect within the connection timeout period specified
  /// by <code>ConnectionTimeoutSeconds</code>.
  /// </li>
  /// <li>
  /// <code>maxSessionLengthTimeout</code>: The stream session was terminated
  /// because it exceeded the maximum session length timeout period specified by
  /// <code>SessionLengthSeconds</code>.
  /// </li>
  /// <li>
  /// <code>reconnectionTimeout</code>: The stream session was terminated because
  /// the client failed to reconnect within the reconnection timeout period
  /// specified by <code>ConnectionTimeoutSeconds</code> after losing connection.
  /// </li>
  /// </ul>
  final StreamSessionStatusReason? statusReason;

  /// The unique identifier for the Amazon GameLift Streams stream group that is
  /// hosting the stream session. Format example: <code>sg-1AB2C3De4</code>.
  final String? streamGroupId;

  /// An opaque, unique identifier for an end-user, defined by the developer.
  final String? userId;

  /// The URL of an S3 bucket that stores Amazon GameLift Streams WebSDK files.
  /// The URL is used to establish connection with the client.
  final String? webSdkProtocolUrl;

  StartStreamSessionOutput({
    this.additionalEnvironmentVariables,
    this.additionalLaunchArgs,
    this.applicationArn,
    this.arn,
    this.connectionTimeoutSeconds,
    this.createdAt,
    this.description,
    this.exportFilesMetadata,
    this.lastUpdatedAt,
    this.location,
    this.logFileLocationUri,
    this.performanceStatsConfiguration,
    this.protocol,
    this.sessionLengthSeconds,
    this.signalRequest,
    this.signalResponse,
    this.status,
    this.statusReason,
    this.streamGroupId,
    this.userId,
    this.webSdkProtocolUrl,
  });

  factory StartStreamSessionOutput.fromJson(Map<String, dynamic> json) {
    return StartStreamSessionOutput(
      additionalEnvironmentVariables:
          (json['AdditionalEnvironmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      additionalLaunchArgs: (json['AdditionalLaunchArgs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      applicationArn: json['ApplicationArn'] as String?,
      arn: json['Arn'] as String?,
      connectionTimeoutSeconds: json['ConnectionTimeoutSeconds'] as int?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      exportFilesMetadata: json['ExportFilesMetadata'] != null
          ? ExportFilesMetadata.fromJson(
              json['ExportFilesMetadata'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      location: json['Location'] as String?,
      logFileLocationUri: json['LogFileLocationUri'] as String?,
      performanceStatsConfiguration:
          json['PerformanceStatsConfiguration'] != null
              ? PerformanceStatsConfiguration.fromJson(
                  json['PerformanceStatsConfiguration'] as Map<String, dynamic>)
              : null,
      protocol: (json['Protocol'] as String?)?.let(Protocol.fromString),
      sessionLengthSeconds: json['SessionLengthSeconds'] as int?,
      signalRequest: json['SignalRequest'] as String?,
      signalResponse: json['SignalResponse'] as String?,
      status: (json['Status'] as String?)?.let(StreamSessionStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(StreamSessionStatusReason.fromString),
      streamGroupId: json['StreamGroupId'] as String?,
      userId: json['UserId'] as String?,
      webSdkProtocolUrl: json['WebSdkProtocolUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalEnvironmentVariables = this.additionalEnvironmentVariables;
    final additionalLaunchArgs = this.additionalLaunchArgs;
    final applicationArn = this.applicationArn;
    final arn = this.arn;
    final connectionTimeoutSeconds = this.connectionTimeoutSeconds;
    final createdAt = this.createdAt;
    final description = this.description;
    final exportFilesMetadata = this.exportFilesMetadata;
    final lastUpdatedAt = this.lastUpdatedAt;
    final location = this.location;
    final logFileLocationUri = this.logFileLocationUri;
    final performanceStatsConfiguration = this.performanceStatsConfiguration;
    final protocol = this.protocol;
    final sessionLengthSeconds = this.sessionLengthSeconds;
    final signalRequest = this.signalRequest;
    final signalResponse = this.signalResponse;
    final status = this.status;
    final statusReason = this.statusReason;
    final streamGroupId = this.streamGroupId;
    final userId = this.userId;
    final webSdkProtocolUrl = this.webSdkProtocolUrl;
    return {
      if (additionalEnvironmentVariables != null)
        'AdditionalEnvironmentVariables': additionalEnvironmentVariables,
      if (additionalLaunchArgs != null)
        'AdditionalLaunchArgs': additionalLaunchArgs,
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (arn != null) 'Arn': arn,
      if (connectionTimeoutSeconds != null)
        'ConnectionTimeoutSeconds': connectionTimeoutSeconds,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (exportFilesMetadata != null)
        'ExportFilesMetadata': exportFilesMetadata,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (location != null) 'Location': location,
      if (logFileLocationUri != null) 'LogFileLocationUri': logFileLocationUri,
      if (performanceStatsConfiguration != null)
        'PerformanceStatsConfiguration': performanceStatsConfiguration,
      if (protocol != null) 'Protocol': protocol.value,
      if (sessionLengthSeconds != null)
        'SessionLengthSeconds': sessionLengthSeconds,
      if (signalRequest != null) 'SignalRequest': signalRequest,
      if (signalResponse != null) 'SignalResponse': signalResponse,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
      if (streamGroupId != null) 'StreamGroupId': streamGroupId,
      if (userId != null) 'UserId': userId,
      if (webSdkProtocolUrl != null) 'WebSdkProtocolUrl': webSdkProtocolUrl,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateApplicationOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that's assigned to an application resource and
  /// uniquely identifies it across all Amazon Web Services Regions. Format is
  /// <code>arn:aws:gameliftstreams:\[AWS Region\]:\[AWS
  /// account\]:application/\[resource ID\]</code>.
  final String arn;

  /// An Amazon S3 URI to a bucket where you would like Amazon GameLift Streams to
  /// save application logs. Required if you specify one or more
  /// <code>ApplicationLogPaths</code>.
  final String? applicationLogOutputUri;

  /// Locations of log files that your content generates during a stream session.
  /// Amazon GameLift Streams uploads log files to the Amazon S3 bucket that you
  /// specify in <code>ApplicationLogOutputUri</code> at the end of a stream
  /// session. To retrieve stored log files, call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetStreamSession.html">GetStreamSession</a>
  /// and get the <code>LogFileLocationUri</code>.
  final List<String>? applicationLogPaths;

  /// The original Amazon S3 location of uploaded stream content for the
  /// application.
  final String? applicationSourceUri;

  /// A newly created application is not associated to any stream groups. This
  /// value is empty.
  final List<String>? associatedStreamGroups;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// A human-readable label for the application. You can edit this value.
  final String? description;

  /// The relative path and file name of the executable file that launches the
  /// content for streaming.
  final String? executablePath;

  /// A unique ID value that is assigned to the resource when it's created. Format
  /// example: <code>a-9ZY8X7Wv6</code>.
  final String? id;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// A set of replication statuses for each location.
  final List<ReplicationStatus>? replicationStatuses;

  /// Configuration settings that identify the operating system for an application
  /// resource. This can also include a compatibility layer and other drivers.
  ///
  /// A runtime environment can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// For Linux applications
  ///
  /// <ul>
  /// <li>
  /// Ubuntu 22.04 LTS (<code>Type=UBUNTU, Version=22_04_LTS</code>)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Windows applications
  ///
  /// <ul>
  /// <li>
  /// Microsoft Windows Server 2022 Base (<code>Type=WINDOWS, Version=2022</code>)
  /// </li>
  /// <li>
  /// Proton 10.0-4 (<code>Type=PROTON, Version=20260204</code>)
  /// </li>
  /// <li>
  /// Proton 9.0-2 (<code>Type=PROTON, Version=20250516</code>)
  /// </li>
  /// <li>
  /// Proton 8.0-5 (<code>Type=PROTON, Version=20241007</code>)
  /// </li>
  /// <li>
  /// Proton 8.0-2c (<code>Type=PROTON, Version=20230704</code>)
  /// </li>
  /// </ul> </li>
  /// </ul>
  final RuntimeEnvironment? runtimeEnvironment;

  /// The current status of the application resource. Possible statuses include
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>INITIALIZED</code>: Amazon GameLift Streams has received the request
  /// and is initiating the work flow to create an application.
  /// </li>
  /// <li>
  /// <code>PROCESSING</code>: The create application work flow is in process.
  /// Amazon GameLift Streams is copying the content and caching for future
  /// deployment in a stream group.
  /// </li>
  /// <li>
  /// <code>READY</code>: The application is ready to deploy in a stream group.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: An error occurred when setting up the application. See
  /// <code>StatusReason</code> for more information.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Amazon GameLift Streams is in the process of deleting
  /// the application.
  /// </li>
  /// </ul>
  final ApplicationStatus? status;

  /// A short description of the status reason when the application is in
  /// <code>ERROR</code> status.
  final ApplicationStatusReason? statusReason;

  CreateApplicationOutput({
    required this.arn,
    this.applicationLogOutputUri,
    this.applicationLogPaths,
    this.applicationSourceUri,
    this.associatedStreamGroups,
    this.createdAt,
    this.description,
    this.executablePath,
    this.id,
    this.lastUpdatedAt,
    this.replicationStatuses,
    this.runtimeEnvironment,
    this.status,
    this.statusReason,
  });

  factory CreateApplicationOutput.fromJson(Map<String, dynamic> json) {
    return CreateApplicationOutput(
      arn: (json['Arn'] as String?) ?? '',
      applicationLogOutputUri: json['ApplicationLogOutputUri'] as String?,
      applicationLogPaths: (json['ApplicationLogPaths'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      applicationSourceUri: json['ApplicationSourceUri'] as String?,
      associatedStreamGroups: (json['AssociatedStreamGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      executablePath: json['ExecutablePath'] as String?,
      id: json['Id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      replicationStatuses: (json['ReplicationStatuses'] as List?)
          ?.nonNulls
          .map((e) => ReplicationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtimeEnvironment: json['RuntimeEnvironment'] != null
          ? RuntimeEnvironment.fromJson(
              json['RuntimeEnvironment'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(ApplicationStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(ApplicationStatusReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final applicationLogOutputUri = this.applicationLogOutputUri;
    final applicationLogPaths = this.applicationLogPaths;
    final applicationSourceUri = this.applicationSourceUri;
    final associatedStreamGroups = this.associatedStreamGroups;
    final createdAt = this.createdAt;
    final description = this.description;
    final executablePath = this.executablePath;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final replicationStatuses = this.replicationStatuses;
    final runtimeEnvironment = this.runtimeEnvironment;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'Arn': arn,
      if (applicationLogOutputUri != null)
        'ApplicationLogOutputUri': applicationLogOutputUri,
      if (applicationLogPaths != null)
        'ApplicationLogPaths': applicationLogPaths,
      if (applicationSourceUri != null)
        'ApplicationSourceUri': applicationSourceUri,
      if (associatedStreamGroups != null)
        'AssociatedStreamGroups': associatedStreamGroups,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (executablePath != null) 'ExecutablePath': executablePath,
      if (id != null) 'Id': id,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (replicationStatuses != null)
        'ReplicationStatuses': replicationStatuses,
      if (runtimeEnvironment != null) 'RuntimeEnvironment': runtimeEnvironment,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
    };
  }
}

/// @nodoc
class GetApplicationOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that's assigned to an application resource and
  /// uniquely identifies it across all Amazon Web Services Regions. Format is
  /// <code>arn:aws:gameliftstreams:\[AWS Region\]:\[AWS
  /// account\]:application/\[resource ID\]</code>.
  final String arn;

  /// An Amazon S3 URI to a bucket where you would like Amazon GameLift Streams to
  /// save application logs. Required if you specify one or more
  /// <code>ApplicationLogPaths</code>.
  final String? applicationLogOutputUri;

  /// Locations of log files that your content generates during a stream session.
  /// Amazon GameLift Streams uploads log files to the Amazon S3 bucket that you
  /// specify in <code>ApplicationLogOutputUri</code> at the end of a stream
  /// session. To retrieve stored log files, call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetStreamSession.html">GetStreamSession</a>
  /// and get the <code>LogFileLocationUri</code>.
  final List<String>? applicationLogPaths;

  /// The original Amazon S3 location of uploaded stream content for the
  /// application.
  final String? applicationSourceUri;

  /// A set of stream groups that this application is associated with. You can use
  /// any of these stream groups to stream your application.
  ///
  /// This value is a set of <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARNs)</a> that uniquely identify stream group resources.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  final List<String>? associatedStreamGroups;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// A human-readable label for the application. You can edit this value.
  final String? description;

  /// The relative path and file name of the executable file that launches the
  /// content for streaming.
  final String? executablePath;

  /// A unique ID value that is assigned to the resource when it's created. Format
  /// example: <code>a-9ZY8X7Wv6</code>.
  final String? id;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// A set of replication statuses for each location.
  final List<ReplicationStatus>? replicationStatuses;

  /// Configuration settings that identify the operating system for an application
  /// resource. This can also include a compatibility layer and other drivers.
  ///
  /// A runtime environment can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// For Linux applications
  ///
  /// <ul>
  /// <li>
  /// Ubuntu 22.04 LTS (<code>Type=UBUNTU, Version=22_04_LTS</code>)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Windows applications
  ///
  /// <ul>
  /// <li>
  /// Microsoft Windows Server 2022 Base (<code>Type=WINDOWS, Version=2022</code>)
  /// </li>
  /// <li>
  /// Proton 10.0-4 (<code>Type=PROTON, Version=20260204</code>)
  /// </li>
  /// <li>
  /// Proton 9.0-2 (<code>Type=PROTON, Version=20250516</code>)
  /// </li>
  /// <li>
  /// Proton 8.0-5 (<code>Type=PROTON, Version=20241007</code>)
  /// </li>
  /// <li>
  /// Proton 8.0-2c (<code>Type=PROTON, Version=20230704</code>)
  /// </li>
  /// </ul> </li>
  /// </ul>
  final RuntimeEnvironment? runtimeEnvironment;

  /// The current status of the application resource. Possible statuses include
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>INITIALIZED</code>: Amazon GameLift Streams has received the request
  /// and is initiating the work flow to create an application.
  /// </li>
  /// <li>
  /// <code>PROCESSING</code>: The create application work flow is in process.
  /// Amazon GameLift Streams is copying the content and caching for future
  /// deployment in a stream group.
  /// </li>
  /// <li>
  /// <code>READY</code>: The application is ready to deploy in a stream group.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: An error occurred when setting up the application. See
  /// <code>StatusReason</code> for more information.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Amazon GameLift Streams is in the process of deleting
  /// the application.
  /// </li>
  /// </ul>
  final ApplicationStatus? status;

  /// A short description of the status reason when the application is in
  /// <code>ERROR</code> status.
  final ApplicationStatusReason? statusReason;

  GetApplicationOutput({
    required this.arn,
    this.applicationLogOutputUri,
    this.applicationLogPaths,
    this.applicationSourceUri,
    this.associatedStreamGroups,
    this.createdAt,
    this.description,
    this.executablePath,
    this.id,
    this.lastUpdatedAt,
    this.replicationStatuses,
    this.runtimeEnvironment,
    this.status,
    this.statusReason,
  });

  factory GetApplicationOutput.fromJson(Map<String, dynamic> json) {
    return GetApplicationOutput(
      arn: (json['Arn'] as String?) ?? '',
      applicationLogOutputUri: json['ApplicationLogOutputUri'] as String?,
      applicationLogPaths: (json['ApplicationLogPaths'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      applicationSourceUri: json['ApplicationSourceUri'] as String?,
      associatedStreamGroups: (json['AssociatedStreamGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      executablePath: json['ExecutablePath'] as String?,
      id: json['Id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      replicationStatuses: (json['ReplicationStatuses'] as List?)
          ?.nonNulls
          .map((e) => ReplicationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtimeEnvironment: json['RuntimeEnvironment'] != null
          ? RuntimeEnvironment.fromJson(
              json['RuntimeEnvironment'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(ApplicationStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(ApplicationStatusReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final applicationLogOutputUri = this.applicationLogOutputUri;
    final applicationLogPaths = this.applicationLogPaths;
    final applicationSourceUri = this.applicationSourceUri;
    final associatedStreamGroups = this.associatedStreamGroups;
    final createdAt = this.createdAt;
    final description = this.description;
    final executablePath = this.executablePath;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final replicationStatuses = this.replicationStatuses;
    final runtimeEnvironment = this.runtimeEnvironment;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'Arn': arn,
      if (applicationLogOutputUri != null)
        'ApplicationLogOutputUri': applicationLogOutputUri,
      if (applicationLogPaths != null)
        'ApplicationLogPaths': applicationLogPaths,
      if (applicationSourceUri != null)
        'ApplicationSourceUri': applicationSourceUri,
      if (associatedStreamGroups != null)
        'AssociatedStreamGroups': associatedStreamGroups,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (executablePath != null) 'ExecutablePath': executablePath,
      if (id != null) 'Id': id,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (replicationStatuses != null)
        'ReplicationStatuses': replicationStatuses,
      if (runtimeEnvironment != null) 'RuntimeEnvironment': runtimeEnvironment,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
    };
  }
}

/// @nodoc
class UpdateApplicationOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that's assigned to an application resource and
  /// uniquely identifies it across all Amazon Web Services Regions. Format is
  /// <code>arn:aws:gameliftstreams:\[AWS Region\]:\[AWS
  /// account\]:application/\[resource ID\]</code>.
  final String arn;

  /// An Amazon S3 URI to a bucket where you would like Amazon GameLift Streams to
  /// save application logs. Required if you specify one or more
  /// <code>ApplicationLogPaths</code>.
  final String? applicationLogOutputUri;

  /// Locations of log files that your content generates during a stream session.
  /// Amazon GameLift Streams uploads log files to the Amazon S3 bucket that you
  /// specify in <code>ApplicationLogOutputUri</code> at the end of a stream
  /// session. To retrieve stored log files, call <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetStreamSession.html">GetStreamSession</a>
  /// and get the <code>LogFileLocationUri</code>.
  final List<String>? applicationLogPaths;

  /// The original Amazon S3 location of uploaded stream content for the
  /// application.
  final String? applicationSourceUri;

  /// A set of stream groups that this application is associated with. You can use
  /// any of these stream groups to stream your application.
  ///
  /// This value is a set of <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARNs)</a> that uniquely identify stream group resources.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  final List<String>? associatedStreamGroups;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// A human-readable label for the application. You can edit this value.
  final String? description;

  /// The relative path and file name of the executable file that launches the
  /// content for streaming.
  final String? executablePath;

  /// A unique ID value that is assigned to the resource when it's created. Format
  /// example: <code>a-9ZY8X7Wv6</code>.
  final String? id;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// A set of replication statuses for each location.
  final List<ReplicationStatus>? replicationStatuses;

  /// Configuration settings that identify the operating system for an application
  /// resource. This can also include a compatibility layer and other drivers.
  ///
  /// A runtime environment can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// For Linux applications
  ///
  /// <ul>
  /// <li>
  /// Ubuntu 22.04 LTS (<code>Type=UBUNTU, Version=22_04_LTS</code>)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Windows applications
  ///
  /// <ul>
  /// <li>
  /// Microsoft Windows Server 2022 Base (<code>Type=WINDOWS, Version=2022</code>)
  /// </li>
  /// <li>
  /// Proton 10.0-4 (<code>Type=PROTON, Version=20260204</code>)
  /// </li>
  /// <li>
  /// Proton 9.0-2 (<code>Type=PROTON, Version=20250516</code>)
  /// </li>
  /// <li>
  /// Proton 8.0-5 (<code>Type=PROTON, Version=20241007</code>)
  /// </li>
  /// <li>
  /// Proton 8.0-2c (<code>Type=PROTON, Version=20230704</code>)
  /// </li>
  /// </ul> </li>
  /// </ul>
  final RuntimeEnvironment? runtimeEnvironment;

  /// The current status of the application resource. Possible statuses include
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>INITIALIZED</code>: Amazon GameLift Streams has received the request
  /// and is initiating the work flow to create an application.
  /// </li>
  /// <li>
  /// <code>PROCESSING</code>: The create application work flow is in process.
  /// Amazon GameLift Streams is copying the content and caching for future
  /// deployment in a stream group.
  /// </li>
  /// <li>
  /// <code>READY</code>: The application is ready to deploy in a stream group.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: An error occurred when setting up the application. See
  /// <code>StatusReason</code> for more information.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Amazon GameLift Streams is in the process of deleting
  /// the application.
  /// </li>
  /// </ul>
  final ApplicationStatus? status;

  /// A short description of the status reason when the application is in
  /// <code>ERROR</code> status.
  final ApplicationStatusReason? statusReason;

  UpdateApplicationOutput({
    required this.arn,
    this.applicationLogOutputUri,
    this.applicationLogPaths,
    this.applicationSourceUri,
    this.associatedStreamGroups,
    this.createdAt,
    this.description,
    this.executablePath,
    this.id,
    this.lastUpdatedAt,
    this.replicationStatuses,
    this.runtimeEnvironment,
    this.status,
    this.statusReason,
  });

  factory UpdateApplicationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateApplicationOutput(
      arn: (json['Arn'] as String?) ?? '',
      applicationLogOutputUri: json['ApplicationLogOutputUri'] as String?,
      applicationLogPaths: (json['ApplicationLogPaths'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      applicationSourceUri: json['ApplicationSourceUri'] as String?,
      associatedStreamGroups: (json['AssociatedStreamGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      executablePath: json['ExecutablePath'] as String?,
      id: json['Id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      replicationStatuses: (json['ReplicationStatuses'] as List?)
          ?.nonNulls
          .map((e) => ReplicationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtimeEnvironment: json['RuntimeEnvironment'] != null
          ? RuntimeEnvironment.fromJson(
              json['RuntimeEnvironment'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(ApplicationStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(ApplicationStatusReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final applicationLogOutputUri = this.applicationLogOutputUri;
    final applicationLogPaths = this.applicationLogPaths;
    final applicationSourceUri = this.applicationSourceUri;
    final associatedStreamGroups = this.associatedStreamGroups;
    final createdAt = this.createdAt;
    final description = this.description;
    final executablePath = this.executablePath;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final replicationStatuses = this.replicationStatuses;
    final runtimeEnvironment = this.runtimeEnvironment;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'Arn': arn,
      if (applicationLogOutputUri != null)
        'ApplicationLogOutputUri': applicationLogOutputUri,
      if (applicationLogPaths != null)
        'ApplicationLogPaths': applicationLogPaths,
      if (applicationSourceUri != null)
        'ApplicationSourceUri': applicationSourceUri,
      if (associatedStreamGroups != null)
        'AssociatedStreamGroups': associatedStreamGroups,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (executablePath != null) 'ExecutablePath': executablePath,
      if (id != null) 'Id': id,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (replicationStatuses != null)
        'ReplicationStatuses': replicationStatuses,
      if (runtimeEnvironment != null) 'RuntimeEnvironment': runtimeEnvironment,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
    };
  }
}

/// @nodoc
class ListApplicationsOutput {
  /// A collection of Amazon GameLift Streams applications that are associated
  /// with the Amazon Web Services account in use. Each item includes application
  /// metadata and status.
  final List<ApplicationSummary>? items;

  /// A token that marks the start of the next sequential page of results. If an
  /// operation doesn't return a token, you've reached the end of the list.
  final String? nextToken;

  ListApplicationsOutput({
    this.items,
    this.nextToken,
  });

  factory ListApplicationsOutput.fromJson(Map<String, dynamic> json) {
    return ListApplicationsOutput(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateStreamGroupOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that is assigned to the stream group resource and
  /// that uniquely identifies the group across all Amazon Web Services Regions.
  /// Format is <code>arn:aws:gameliftstreams:\[AWS Region\]:\[AWS
  /// account\]:streamgroup/\[resource ID\]</code>.
  final String arn;

  /// A set of applications that this stream group is associated to. You can
  /// stream any of these applications by using this stream group.
  ///
  /// This value is a set of <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARNs)</a> that uniquely identify application resources.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  final List<String>? associatedApplications;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// The default Amazon GameLift Streams application that is associated with this
  /// stream group.
  final DefaultApplication? defaultApplication;

  /// A descriptive label for the stream group.
  final String? description;

  /// The time at which this stream group expires. Timestamps are expressed using
  /// in ISO8601 format, such as: <code>2022-12-27T22:29:40+00:00</code> (UTC).
  /// After this time, you will no longer be able to update this stream group or
  /// use it to start stream sessions. Only Get and Delete operations will work on
  /// an expired stream group.
  final DateTime? expiresAt;

  /// A unique ID value that is assigned to the resource when it's created. Format
  /// example: <code>sg-1AB2C3De4</code>.
  final String? id;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// This value is the set of locations, including their name, current status,
  /// and capacities.
  ///
  /// A location can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: Amazon GameLift Streams is preparing the location.
  /// You cannot stream from, scale the capacity of, or remove this location yet.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The location is provisioned with initial capacity. You
  /// can now stream from, scale the capacity of, or remove this location.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: Amazon GameLift Streams failed to set up this location.
  /// The <code>StatusReason</code> field describes the error. You can remove this
  /// location and try to add it again.
  /// </li>
  /// <li>
  /// <code>REMOVING</code>: Amazon GameLift Streams is working to remove this
  /// location. This will release all provisioned capacity for this location in
  /// this stream group.
  /// </li>
  /// </ul>
  final List<LocationState>? locationStates;

  /// The current status of the stream group resource. Possible statuses include
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: The stream group is deploying and isn't ready to
  /// host streams.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The stream group is ready to host streams.
  /// </li>
  /// <li>
  /// <code>ACTIVE_WITH_ERRORS</code>: One or more locations in the stream group
  /// are in an error state. Verify the details of individual locations and remove
  /// any locations which are in error.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Amazon GameLift Streams is in the process of deleting
  /// the stream group.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: An error occurred when the stream group deployed. See
  /// <code>StatusReason</code> (returned by <code>CreateStreamGroup</code>,
  /// <code>GetStreamGroup</code>, and <code>UpdateStreamGroup</code>) for more
  /// information.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code>: The stream group is expired and can no longer host
  /// streams. This typically occurs when a stream group is 365 days old, as
  /// indicated by the value of <code>ExpiresAt</code>. Create a new stream group
  /// to resume streaming capabilities.
  /// </li>
  /// <li>
  /// <code>UPDATING_LOCATIONS</code>: One or more locations in the stream group
  /// are in the process of updating (either activating or deleting).
  /// </li>
  /// </ul>
  final StreamGroupStatus? status;

  /// A short description of the reason that the stream group is in
  /// <code>ERROR</code> status. The possible reasons can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>internalError</code>: The request can't process right now because of
  /// an issue with the server. Try again later.
  /// </li>
  /// <li>
  /// <code>noAvailableInstances</code>: Amazon GameLift Streams does not
  /// currently have enough available capacity to fulfill your request. Wait a few
  /// minutes and retry the request as capacity can shift frequently. You can also
  /// try to make the request using a different stream class or in another region.
  /// </li>
  /// </ul>
  final StreamGroupStatusReason? statusReason;

  /// The target stream quality for the stream group.
  ///
  /// A stream class can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>gen6n_pro_win2022</code> (NVIDIA, pro)</b> Supports applications
  /// with extremely high 3D scene complexity which require maximum resources.
  /// Runs applications on Microsoft Windows Server 2022 Base and supports DirectX
  /// 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit
  /// applications, and anti-cheat technology. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_pro</code> (NVIDIA, pro)</b> Supports applications with
  /// extremely high 3D scene complexity which require maximum resources. Powered
  /// by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_ultra_win2022</code> (NVIDIA, ultra)</b> Supports
  /// applications with high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// high 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_medium</code> (NVIDIA, medium)</b> Supports applications
  /// with moderate 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 2 vCPUs, 8 GB RAM, 6 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 4 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_small</code> (NVIDIA, small)</b> Supports applications with
  /// lightweight 3D scene complexity and low CPU usage. Powered by NVIDIA L4
  /// Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 1 vCPUs, 4 GB RAM, 2 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 12 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_medium_win2022</code> (NVIDIA, medium)</b> Supports
  /// applications with low 3D scene complexity. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 6 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_small_win2022</code> (NVIDIA, small)</b> Supports
  /// applications with low 3D scene complexity. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 2 vCPUs, 8 GB RAM, 3 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6e_pro_win2022</code> (NVIDIA, pro)</b> Supports applications
  /// with extremely high 3D scene complexity which require maximum resources.
  /// Runs applications on Microsoft Windows Server 2022 Base and supports DirectX
  /// 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit
  /// applications, and anti-cheat technology. Powered by NVIDIA L40S Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 128 GB RAM, 48 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6e_pro</code> (NVIDIA, pro)</b> Supports applications with
  /// extremely high 3D scene complexity which require maximum resources. Powered
  /// by NVIDIA L40S Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 128 GB RAM, 48 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_win2022</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA A10G Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA A10G Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// extremely high 3D scene complexity. Powered by NVIDIA A10G Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_win2022</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 8 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// high 3D scene complexity. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// </ul>
  final StreamClass? streamClass;

  CreateStreamGroupOutput({
    required this.arn,
    this.associatedApplications,
    this.createdAt,
    this.defaultApplication,
    this.description,
    this.expiresAt,
    this.id,
    this.lastUpdatedAt,
    this.locationStates,
    this.status,
    this.statusReason,
    this.streamClass,
  });

  factory CreateStreamGroupOutput.fromJson(Map<String, dynamic> json) {
    return CreateStreamGroupOutput(
      arn: (json['Arn'] as String?) ?? '',
      associatedApplications: (json['AssociatedApplications'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      defaultApplication: json['DefaultApplication'] != null
          ? DefaultApplication.fromJson(
              json['DefaultApplication'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
      id: json['Id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      locationStates: (json['LocationStates'] as List?)
          ?.nonNulls
          .map((e) => LocationState.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.let(StreamGroupStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(StreamGroupStatusReason.fromString),
      streamClass:
          (json['StreamClass'] as String?)?.let(StreamClass.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedApplications = this.associatedApplications;
    final createdAt = this.createdAt;
    final defaultApplication = this.defaultApplication;
    final description = this.description;
    final expiresAt = this.expiresAt;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final locationStates = this.locationStates;
    final status = this.status;
    final statusReason = this.statusReason;
    final streamClass = this.streamClass;
    return {
      'Arn': arn,
      if (associatedApplications != null)
        'AssociatedApplications': associatedApplications,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (defaultApplication != null) 'DefaultApplication': defaultApplication,
      if (description != null) 'Description': description,
      if (expiresAt != null) 'ExpiresAt': unixTimestampToJson(expiresAt),
      if (id != null) 'Id': id,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (locationStates != null) 'LocationStates': locationStates,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
      if (streamClass != null) 'StreamClass': streamClass.value,
    };
  }
}

/// @nodoc
class GetStreamGroupOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that is assigned to the stream group resource and
  /// that uniquely identifies the group across all Amazon Web Services Regions.
  /// Format is <code>arn:aws:gameliftstreams:\[AWS Region\]:\[AWS
  /// account\]:streamgroup/\[resource ID\]</code>.
  final String arn;

  /// A set of applications that this stream group is associated to. You can
  /// stream any of these applications by using this stream group.
  ///
  /// This value is a set of <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARNs)</a> that uniquely identify application resources.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  final List<String>? associatedApplications;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// The default Amazon GameLift Streams application that is associated with this
  /// stream group.
  final DefaultApplication? defaultApplication;

  /// A descriptive label for the stream group.
  final String? description;

  /// The time at which this stream group expires. Timestamps are expressed using
  /// in ISO8601 format, such as: <code>2022-12-27T22:29:40+00:00</code> (UTC).
  /// After this time, you will no longer be able to update this stream group or
  /// use it to start stream sessions. Only Get and Delete operations will work on
  /// an expired stream group.
  final DateTime? expiresAt;

  /// A unique ID value that is assigned to the resource when it's created. Format
  /// example: <code>sg-1AB2C3De4</code>.
  final String? id;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// This value is the set of locations, including their name, current status,
  /// and capacities.
  ///
  /// A location can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: Amazon GameLift Streams is preparing the location.
  /// You cannot stream from, scale the capacity of, or remove this location yet.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The location is provisioned with initial capacity. You
  /// can now stream from, scale the capacity of, or remove this location.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: Amazon GameLift Streams failed to set up this location.
  /// The <code>StatusReason</code> field describes the error. You can remove this
  /// location and try to add it again.
  /// </li>
  /// <li>
  /// <code>REMOVING</code>: Amazon GameLift Streams is working to remove this
  /// location. This will release all provisioned capacity for this location in
  /// this stream group.
  /// </li>
  /// </ul>
  final List<LocationState>? locationStates;

  /// The current status of the stream group resource. Possible statuses include
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: The stream group is deploying and isn't ready to
  /// host streams.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The stream group is ready to host streams.
  /// </li>
  /// <li>
  /// <code>ACTIVE_WITH_ERRORS</code>: One or more locations in the stream group
  /// are in an error state. Verify the details of individual locations and remove
  /// any locations which are in error.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Amazon GameLift Streams is in the process of deleting
  /// the stream group.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: An error occurred when the stream group deployed. See
  /// <code>StatusReason</code> (returned by <code>CreateStreamGroup</code>,
  /// <code>GetStreamGroup</code>, and <code>UpdateStreamGroup</code>) for more
  /// information.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code>: The stream group is expired and can no longer host
  /// streams. This typically occurs when a stream group is 365 days old, as
  /// indicated by the value of <code>ExpiresAt</code>. Create a new stream group
  /// to resume streaming capabilities.
  /// </li>
  /// <li>
  /// <code>UPDATING_LOCATIONS</code>: One or more locations in the stream group
  /// are in the process of updating (either activating or deleting).
  /// </li>
  /// </ul>
  final StreamGroupStatus? status;

  /// A short description of the reason that the stream group is in
  /// <code>ERROR</code> status. The possible reasons can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>internalError</code>: The request can't process right now because of
  /// an issue with the server. Try again later.
  /// </li>
  /// <li>
  /// <code>noAvailableInstances</code>: Amazon GameLift Streams does not
  /// currently have enough available capacity to fulfill your request. Wait a few
  /// minutes and retry the request as capacity can shift frequently. You can also
  /// try to make the request using a different stream class or in another region.
  /// </li>
  /// </ul>
  final StreamGroupStatusReason? statusReason;

  /// The target stream quality for the stream group.
  ///
  /// A stream class can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>gen6n_pro_win2022</code> (NVIDIA, pro)</b> Supports applications
  /// with extremely high 3D scene complexity which require maximum resources.
  /// Runs applications on Microsoft Windows Server 2022 Base and supports DirectX
  /// 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit
  /// applications, and anti-cheat technology. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_pro</code> (NVIDIA, pro)</b> Supports applications with
  /// extremely high 3D scene complexity which require maximum resources. Powered
  /// by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_ultra_win2022</code> (NVIDIA, ultra)</b> Supports
  /// applications with high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// high 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_medium</code> (NVIDIA, medium)</b> Supports applications
  /// with moderate 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 2 vCPUs, 8 GB RAM, 6 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 4 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_small</code> (NVIDIA, small)</b> Supports applications with
  /// lightweight 3D scene complexity and low CPU usage. Powered by NVIDIA L4
  /// Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 1 vCPUs, 4 GB RAM, 2 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 12 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_medium_win2022</code> (NVIDIA, medium)</b> Supports
  /// applications with low 3D scene complexity. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 6 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_small_win2022</code> (NVIDIA, small)</b> Supports
  /// applications with low 3D scene complexity. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 2 vCPUs, 8 GB RAM, 3 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6e_pro_win2022</code> (NVIDIA, pro)</b> Supports applications
  /// with extremely high 3D scene complexity which require maximum resources.
  /// Runs applications on Microsoft Windows Server 2022 Base and supports DirectX
  /// 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit
  /// applications, and anti-cheat technology. Powered by NVIDIA L40S Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 128 GB RAM, 48 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6e_pro</code> (NVIDIA, pro)</b> Supports applications with
  /// extremely high 3D scene complexity which require maximum resources. Powered
  /// by NVIDIA L40S Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 128 GB RAM, 48 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_win2022</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA A10G Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA A10G Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// extremely high 3D scene complexity. Powered by NVIDIA A10G Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_win2022</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 8 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// high 3D scene complexity. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// </ul>
  final StreamClass? streamClass;

  GetStreamGroupOutput({
    required this.arn,
    this.associatedApplications,
    this.createdAt,
    this.defaultApplication,
    this.description,
    this.expiresAt,
    this.id,
    this.lastUpdatedAt,
    this.locationStates,
    this.status,
    this.statusReason,
    this.streamClass,
  });

  factory GetStreamGroupOutput.fromJson(Map<String, dynamic> json) {
    return GetStreamGroupOutput(
      arn: (json['Arn'] as String?) ?? '',
      associatedApplications: (json['AssociatedApplications'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      defaultApplication: json['DefaultApplication'] != null
          ? DefaultApplication.fromJson(
              json['DefaultApplication'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
      id: json['Id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      locationStates: (json['LocationStates'] as List?)
          ?.nonNulls
          .map((e) => LocationState.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.let(StreamGroupStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(StreamGroupStatusReason.fromString),
      streamClass:
          (json['StreamClass'] as String?)?.let(StreamClass.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedApplications = this.associatedApplications;
    final createdAt = this.createdAt;
    final defaultApplication = this.defaultApplication;
    final description = this.description;
    final expiresAt = this.expiresAt;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final locationStates = this.locationStates;
    final status = this.status;
    final statusReason = this.statusReason;
    final streamClass = this.streamClass;
    return {
      'Arn': arn,
      if (associatedApplications != null)
        'AssociatedApplications': associatedApplications,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (defaultApplication != null) 'DefaultApplication': defaultApplication,
      if (description != null) 'Description': description,
      if (expiresAt != null) 'ExpiresAt': unixTimestampToJson(expiresAt),
      if (id != null) 'Id': id,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (locationStates != null) 'LocationStates': locationStates,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
      if (streamClass != null) 'StreamClass': streamClass.value,
    };
  }
}

/// @nodoc
class UpdateStreamGroupOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that is assigned to the stream group resource and
  /// that uniquely identifies the group across all Amazon Web Services Regions.
  /// Format is <code>arn:aws:gameliftstreams:\[AWS Region\]:\[AWS
  /// account\]:streamgroup/\[resource ID\]</code>.
  final String arn;

  /// A set of applications that this stream group is associated with. You can
  /// stream any of these applications with the stream group.
  ///
  /// This value is a set of <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARNs)</a> that uniquely identify application resources.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  final List<String>? associatedApplications;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// The default Amazon GameLift Streams application that is associated with this
  /// stream group.
  final DefaultApplication? defaultApplication;

  /// A descriptive label for the stream group.
  final String? description;

  /// The time at which this stream group expires. Timestamps are expressed using
  /// in ISO8601 format, such as: <code>2022-12-27T22:29:40+00:00</code> (UTC).
  /// After this time, you will no longer be able to update this stream group or
  /// use it to start stream sessions. Only Get and Delete operations will work on
  /// an expired stream group.
  final DateTime? expiresAt;

  /// A unique ID value that is assigned to the resource when it's created. Format
  /// example: <code>sg-1AB2C3De4</code>.
  final String? id;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// This value is set of locations, including their name, current status, and
  /// capacities.
  ///
  /// A location can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: Amazon GameLift Streams is preparing the location.
  /// You cannot stream from, scale the capacity of, or remove this location yet.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The location is provisioned with initial capacity. You
  /// can now stream from, scale the capacity of, or remove this location.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: Amazon GameLift Streams failed to set up this location.
  /// The <code>StatusReason</code> field describes the error. You can remove this
  /// location and try to add it again.
  /// </li>
  /// <li>
  /// <code>REMOVING</code>: Amazon GameLift Streams is working to remove this
  /// location. This will release all provisioned capacity for this location in
  /// this stream group.
  /// </li>
  /// </ul>
  final List<LocationState>? locationStates;

  /// The current status of the stream group resource. Possible statuses include
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: The stream group is deploying and isn't ready to
  /// host streams.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The stream group is ready to host streams.
  /// </li>
  /// <li>
  /// <code>ACTIVE_WITH_ERRORS</code>: One or more locations in the stream group
  /// are in an error state. Verify the details of individual locations and remove
  /// any locations which are in error.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Amazon GameLift Streams is in the process of deleting
  /// the stream group.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: An error occurred when the stream group deployed. See
  /// <code>StatusReason</code> (returned by <code>CreateStreamGroup</code>,
  /// <code>GetStreamGroup</code>, and <code>UpdateStreamGroup</code>) for more
  /// information.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code>: The stream group is expired and can no longer host
  /// streams. This typically occurs when a stream group is 365 days old, as
  /// indicated by the value of <code>ExpiresAt</code>. Create a new stream group
  /// to resume streaming capabilities.
  /// </li>
  /// <li>
  /// <code>UPDATING_LOCATIONS</code>: One or more locations in the stream group
  /// are in the process of updating (either activating or deleting).
  /// </li>
  /// </ul>
  final StreamGroupStatus? status;

  /// A short description of the reason that the stream group is in
  /// <code>ERROR</code> status. The possible reasons can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>internalError</code>: The request can't process right now because of
  /// an issue with the server. Try again later.
  /// </li>
  /// <li>
  /// <code>noAvailableInstances</code>: Amazon GameLift Streams does not
  /// currently have enough available capacity to fulfill your request. Wait a few
  /// minutes and retry the request as capacity can shift frequently. You can also
  /// try to make the request using a different stream class or in another region.
  /// </li>
  /// </ul>
  final StreamGroupStatusReason? statusReason;

  /// The target stream quality for the stream group.
  ///
  /// A stream class can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>gen6n_pro_win2022</code> (NVIDIA, pro)</b> Supports applications
  /// with extremely high 3D scene complexity which require maximum resources.
  /// Runs applications on Microsoft Windows Server 2022 Base and supports DirectX
  /// 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit
  /// applications, and anti-cheat technology. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_pro</code> (NVIDIA, pro)</b> Supports applications with
  /// extremely high 3D scene complexity which require maximum resources. Powered
  /// by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_ultra_win2022</code> (NVIDIA, ultra)</b> Supports
  /// applications with high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// high 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_medium</code> (NVIDIA, medium)</b> Supports applications
  /// with moderate 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 2 vCPUs, 8 GB RAM, 6 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 4 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_small</code> (NVIDIA, small)</b> Supports applications with
  /// lightweight 3D scene complexity and low CPU usage. Powered by NVIDIA L4
  /// Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 1 vCPUs, 4 GB RAM, 2 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 12 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_medium_win2022</code> (NVIDIA, medium)</b> Supports
  /// applications with low 3D scene complexity. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 6 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_small_win2022</code> (NVIDIA, small)</b> Supports
  /// applications with low 3D scene complexity. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 2 vCPUs, 8 GB RAM, 3 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6e_pro_win2022</code> (NVIDIA, pro)</b> Supports applications
  /// with extremely high 3D scene complexity which require maximum resources.
  /// Runs applications on Microsoft Windows Server 2022 Base and supports DirectX
  /// 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit
  /// applications, and anti-cheat technology. Powered by NVIDIA L40S Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 128 GB RAM, 48 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6e_pro</code> (NVIDIA, pro)</b> Supports applications with
  /// extremely high 3D scene complexity which require maximum resources. Powered
  /// by NVIDIA L40S Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 128 GB RAM, 48 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_win2022</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA A10G Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA A10G Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// extremely high 3D scene complexity. Powered by NVIDIA A10G Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_win2022</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 8 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// high 3D scene complexity. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// </ul>
  final StreamClass? streamClass;

  UpdateStreamGroupOutput({
    required this.arn,
    this.associatedApplications,
    this.createdAt,
    this.defaultApplication,
    this.description,
    this.expiresAt,
    this.id,
    this.lastUpdatedAt,
    this.locationStates,
    this.status,
    this.statusReason,
    this.streamClass,
  });

  factory UpdateStreamGroupOutput.fromJson(Map<String, dynamic> json) {
    return UpdateStreamGroupOutput(
      arn: (json['Arn'] as String?) ?? '',
      associatedApplications: (json['AssociatedApplications'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      defaultApplication: json['DefaultApplication'] != null
          ? DefaultApplication.fromJson(
              json['DefaultApplication'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
      id: json['Id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      locationStates: (json['LocationStates'] as List?)
          ?.nonNulls
          .map((e) => LocationState.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.let(StreamGroupStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(StreamGroupStatusReason.fromString),
      streamClass:
          (json['StreamClass'] as String?)?.let(StreamClass.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedApplications = this.associatedApplications;
    final createdAt = this.createdAt;
    final defaultApplication = this.defaultApplication;
    final description = this.description;
    final expiresAt = this.expiresAt;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final locationStates = this.locationStates;
    final status = this.status;
    final statusReason = this.statusReason;
    final streamClass = this.streamClass;
    return {
      'Arn': arn,
      if (associatedApplications != null)
        'AssociatedApplications': associatedApplications,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (defaultApplication != null) 'DefaultApplication': defaultApplication,
      if (description != null) 'Description': description,
      if (expiresAt != null) 'ExpiresAt': unixTimestampToJson(expiresAt),
      if (id != null) 'Id': id,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (locationStates != null) 'LocationStates': locationStates,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
      if (streamClass != null) 'StreamClass': streamClass.value,
    };
  }
}

/// @nodoc
class ListStreamGroupsOutput {
  /// A collection of Amazon GameLift Streams stream groups that are associated
  /// with the Amazon Web Services account in use. Each item includes stream group
  /// metadata and status, but doesn't include capacity information.
  final List<StreamGroupSummary>? items;

  /// A token that marks the start of the next sequential page of results. If an
  /// operation doesn't return a token, you've reached the end of the list.
  final String? nextToken;

  ListStreamGroupsOutput({
    this.items,
    this.nextToken,
  });

  factory ListStreamGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListStreamGroupsOutput(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => StreamGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Describes a Amazon GameLift Streams stream group resource for hosting
/// content streams. To retrieve additional stream group details, call <a
/// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetStreamGroup.html">GetStreamGroup</a>.
///
/// @nodoc
class StreamGroupSummary {
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that uniquely identifies the stream group resource.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4</code>.
  final String arn;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// Object that identifies the Amazon GameLift Streams application to stream
  /// with this stream group.
  final DefaultApplication? defaultApplication;

  /// A descriptive label for the stream group.
  final String? description;

  /// The time at which this stream group expires. Timestamps are expressed using
  /// in ISO8601 format, such as: <code>2022-12-27T22:29:40+00:00</code> (UTC).
  /// After this time, you will no longer be able to update this stream group or
  /// use it to start stream sessions. Only Get and Delete operations will work on
  /// an expired stream group.
  final DateTime? expiresAt;

  /// An ID that uniquely identifies the stream group resource. Example ID:
  /// <code>sg-1AB2C3De4</code>.
  final String? id;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// The current status of the stream group resource. Possible statuses include
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: The stream group is deploying and isn't ready to
  /// host streams.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The stream group is ready to host streams.
  /// </li>
  /// <li>
  /// <code>ACTIVE_WITH_ERRORS</code>: One or more locations in the stream group
  /// are in an error state. Verify the details of individual locations and remove
  /// any locations which are in error.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Amazon GameLift Streams is in the process of deleting
  /// the stream group.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: An error occurred when the stream group deployed. See
  /// <code>StatusReason</code> (returned by <code>CreateStreamGroup</code>,
  /// <code>GetStreamGroup</code>, and <code>UpdateStreamGroup</code>) for more
  /// information.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code>: The stream group is expired and can no longer host
  /// streams. This typically occurs when a stream group is 365 days old, as
  /// indicated by the value of <code>ExpiresAt</code>. Create a new stream group
  /// to resume streaming capabilities.
  /// </li>
  /// <li>
  /// <code>UPDATING_LOCATIONS</code>: One or more locations in the stream group
  /// are in the process of updating (either activating or deleting).
  /// </li>
  /// </ul>
  final StreamGroupStatus? status;

  /// The target stream quality for the stream group.
  ///
  /// A stream class can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>gen6n_pro_win2022</code> (NVIDIA, pro)</b> Supports applications
  /// with extremely high 3D scene complexity which require maximum resources.
  /// Runs applications on Microsoft Windows Server 2022 Base and supports DirectX
  /// 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit
  /// applications, and anti-cheat technology. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_pro</code> (NVIDIA, pro)</b> Supports applications with
  /// extremely high 3D scene complexity which require maximum resources. Powered
  /// by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_ultra_win2022</code> (NVIDIA, ultra)</b> Supports
  /// applications with high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// high 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_medium</code> (NVIDIA, medium)</b> Supports applications
  /// with moderate 3D scene complexity. Powered by NVIDIA L4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 2 vCPUs, 8 GB RAM, 6 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 4 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_small</code> (NVIDIA, small)</b> Supports applications with
  /// lightweight 3D scene complexity and low CPU usage. Powered by NVIDIA L4
  /// Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 1 vCPUs, 4 GB RAM, 2 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 12 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_medium_win2022</code> (NVIDIA, medium)</b> Supports
  /// applications with low 3D scene complexity. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 6 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6n_small_win2022</code> (NVIDIA, small)</b> Supports
  /// applications with low 3D scene complexity. Powered by NVIDIA L4 Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 2 vCPUs, 8 GB RAM, 3 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6e_pro_win2022</code> (NVIDIA, pro)</b> Supports applications
  /// with extremely high 3D scene complexity which require maximum resources.
  /// Runs applications on Microsoft Windows Server 2022 Base and supports DirectX
  /// 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit
  /// applications, and anti-cheat technology. Powered by NVIDIA L40S Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 128 GB RAM, 48 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen6e_pro</code> (NVIDIA, pro)</b> Supports applications with
  /// extremely high 3D scene complexity which require maximum resources. Powered
  /// by NVIDIA L40S Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 16 vCPUs, 128 GB RAM, 48 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_win2022</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA A10G Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA A10G Tensor Core
  /// GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen5n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// extremely high 3D scene complexity. Powered by NVIDIA A10G Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_win2022</code> (NVIDIA, ultra)</b> Supports applications
  /// with extremely high 3D scene complexity. Runs applications on Microsoft
  /// Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
  /// Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
  /// technology. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_high</code> (NVIDIA, high)</b> Supports applications with
  /// moderate to high 3D scene complexity. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 4 vCPUs, 16 GB RAM, 8 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports up to 2 concurrent stream sessions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>gen4n_ultra</code> (NVIDIA, ultra)</b> Supports applications with
  /// high 3D scene complexity. Powered by NVIDIA T4 Tensor Core GPUs.
  ///
  /// <ul>
  /// <li>
  /// Reference resolution: 1080p
  /// </li>
  /// <li>
  /// Reference frame rate: 60 fps
  /// </li>
  /// <li>
  /// Workload specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM
  /// </li>
  /// <li>
  /// Tenancy: Supports 1 concurrent stream session
  /// </li>
  /// </ul> </li>
  /// </ul>
  final StreamClass? streamClass;

  StreamGroupSummary({
    required this.arn,
    this.createdAt,
    this.defaultApplication,
    this.description,
    this.expiresAt,
    this.id,
    this.lastUpdatedAt,
    this.status,
    this.streamClass,
  });

  factory StreamGroupSummary.fromJson(Map<String, dynamic> json) {
    return StreamGroupSummary(
      arn: (json['Arn'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      defaultApplication: json['DefaultApplication'] != null
          ? DefaultApplication.fromJson(
              json['DefaultApplication'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
      id: json['Id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      status: (json['Status'] as String?)?.let(StreamGroupStatus.fromString),
      streamClass:
          (json['StreamClass'] as String?)?.let(StreamClass.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final defaultApplication = this.defaultApplication;
    final description = this.description;
    final expiresAt = this.expiresAt;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final status = this.status;
    final streamClass = this.streamClass;
    return {
      'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (defaultApplication != null) 'DefaultApplication': defaultApplication,
      if (description != null) 'Description': description,
      if (expiresAt != null) 'ExpiresAt': unixTimestampToJson(expiresAt),
      if (id != null) 'Id': id,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (status != null) 'Status': status.value,
      if (streamClass != null) 'StreamClass': streamClass.value,
    };
  }
}

/// Represents the default Amazon GameLift Streams application that a stream
/// group hosts.
///
/// @nodoc
class DefaultApplication {
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that uniquely identifies the application resource.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  final String? arn;

  /// An ID that uniquely identifies the application resource. Example ID:
  /// <code>a-9ZY8X7Wv6</code>.
  final String? id;

  DefaultApplication({
    this.arn,
    this.id,
  });

  factory DefaultApplication.fromJson(Map<String, dynamic> json) {
    return DefaultApplication(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
    };
  }
}

/// @nodoc
class StreamClass {
  static const gen4nHigh = StreamClass._('gen4n_high');
  static const gen4nUltra = StreamClass._('gen4n_ultra');
  static const gen4nWin2022 = StreamClass._('gen4n_win2022');
  static const gen5nHigh = StreamClass._('gen5n_high');
  static const gen5nUltra = StreamClass._('gen5n_ultra');
  static const gen5nWin2022 = StreamClass._('gen5n_win2022');
  static const gen6nSmall = StreamClass._('gen6n_small');
  static const gen6nMedium = StreamClass._('gen6n_medium');
  static const gen6nHigh = StreamClass._('gen6n_high');
  static const gen6nUltra = StreamClass._('gen6n_ultra');
  static const gen6nUltraWin2022 = StreamClass._('gen6n_ultra_win2022');
  static const gen6nPro = StreamClass._('gen6n_pro');
  static const gen6nProWin2022 = StreamClass._('gen6n_pro_win2022');
  static const gen6nSmallWin2022 = StreamClass._('gen6n_small_win2022');
  static const gen6nMediumWin2022 = StreamClass._('gen6n_medium_win2022');
  static const gen6ePro = StreamClass._('gen6e_pro');
  static const gen6eProWin2022 = StreamClass._('gen6e_pro_win2022');

  final String value;

  const StreamClass._(this.value);

  static const values = [
    gen4nHigh,
    gen4nUltra,
    gen4nWin2022,
    gen5nHigh,
    gen5nUltra,
    gen5nWin2022,
    gen6nSmall,
    gen6nMedium,
    gen6nHigh,
    gen6nUltra,
    gen6nUltraWin2022,
    gen6nPro,
    gen6nProWin2022,
    gen6nSmallWin2022,
    gen6nMediumWin2022,
    gen6ePro,
    gen6eProWin2022
  ];

  static StreamClass fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StreamClass._(value));

  @override
  bool operator ==(other) => other is StreamClass && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StreamGroupStatus {
  static const activating = StreamGroupStatus._('ACTIVATING');
  static const updatingLocations = StreamGroupStatus._('UPDATING_LOCATIONS');
  static const active = StreamGroupStatus._('ACTIVE');
  static const activeWithErrors = StreamGroupStatus._('ACTIVE_WITH_ERRORS');
  static const error = StreamGroupStatus._('ERROR');
  static const deleting = StreamGroupStatus._('DELETING');
  static const expired = StreamGroupStatus._('EXPIRED');

  final String value;

  const StreamGroupStatus._(this.value);

  static const values = [
    activating,
    updatingLocations,
    active,
    activeWithErrors,
    error,
    deleting,
    expired
  ];

  static StreamGroupStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StreamGroupStatus._(value));

  @override
  bool operator ==(other) => other is StreamGroupStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StreamGroupStatusReason {
  static const internalError = StreamGroupStatusReason._('internalError');
  static const noAvailableInstances =
      StreamGroupStatusReason._('noAvailableInstances');

  final String value;

  const StreamGroupStatusReason._(this.value);

  static const values = [internalError, noAvailableInstances];

  static StreamGroupStatusReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StreamGroupStatusReason._(value));

  @override
  bool operator ==(other) =>
      other is StreamGroupStatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a location and its corresponding stream capacity and status.
///
/// @nodoc
class LocationState {
  /// This value is the stream capacity that Amazon GameLift Streams has
  /// provisioned in a stream group that can respond immediately to stream
  /// requests. It includes resources that are currently streaming and resources
  /// that are idle and ready to respond to stream requests. When target-idle
  /// capacity is configured, the idle resources include the capacity buffer
  /// maintained beyond ongoing sessions. You pay for this capacity whether it's
  /// in use or not. After making changes to capacity, it can take a few minutes
  /// for the allocated capacity count to reflect the change while compute
  /// resources are allocated or deallocated. Similarly, when allocated on-demand
  /// capacity is no longer needed, it can take a few minutes for Amazon GameLift
  /// Streams to spin down the allocated capacity.
  final int? allocatedCapacity;

  /// This setting, if non-zero, indicates minimum streaming capacity which is
  /// allocated to you and is never released back to the service. You pay for this
  /// base level of capacity at all times, whether used or idle.
  final int? alwaysOnCapacity;

  /// This value is the amount of allocated capacity that is not currently
  /// streaming. It represents the stream group's ability to respond immediately
  /// to new stream requests with near-instant startup time.
  final int? idleCapacity;

  /// The CIDR block of the service VPC for this location. Add this CIDR block to
  /// your VPC route table to enable traffic routing through the Transit Gateway.
  final String? internalVpcIpv4CidrBlock;

  /// A location's name. For example, <code>us-east-1</code>. For a complete list
  /// of locations that Amazon GameLift Streams supports, refer to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/regions-quotas.html">Regions,
  /// quotas, and limitations</a> in the <i>Amazon GameLift Streams Developer
  /// Guide</i>.
  final String? locationName;

  /// This indicates the maximum capacity that the service can allocate for you.
  /// Newly created streams may take a few minutes to start. Capacity is released
  /// back to the service when idle. You pay for capacity that is allocated to you
  /// until it is released.
  final int? maximumCapacity;

  /// The streaming capacity that Amazon GameLift Streams can allocate in response
  /// to stream requests, and then de-allocate when the session has terminated.
  /// This offers a cost control measure at the expense of a greater startup time
  /// (typically under 5 minutes). Default is 0 when creating a stream group or
  /// adding a location.
  final int? onDemandCapacity;

  /// This value is the always-on capacity that you most recently requested for a
  /// stream group. You request capacity separately for each location in a stream
  /// group. In response to an increase in requested capacity, Amazon GameLift
  /// Streams attempts to provision compute resources to make the stream group's
  /// allocated capacity meet requested capacity. When always-on capacity is
  /// decreased, it can take a few minutes to deprovision allocated capacity to
  /// match the requested capacity.
  final int? requestedCapacity;

  /// This value is set of locations, including their name, current status, and
  /// capacities.
  ///
  /// A location can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: Amazon GameLift Streams is preparing the location.
  /// You cannot stream from, scale the capacity of, or remove this location yet.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The location is provisioned with initial capacity. You
  /// can now stream from, scale the capacity of, or remove this location.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: Amazon GameLift Streams failed to set up this location.
  /// The <code>StatusReason</code> field describes the error. You can remove this
  /// location and try to add it again.
  /// </li>
  /// <li>
  /// <code>REMOVING</code>: Amazon GameLift Streams is working to remove this
  /// location. This will release all provisioned capacity for this location in
  /// this stream group.
  /// </li>
  /// </ul>
  final StreamGroupLocationStatus? status;

  /// This indicates idle capacity which the service pre-allocates and holds for
  /// you in anticipation of future activity. This helps to insulate your users
  /// from capacity-allocation delays. You pay for capacity which is held in this
  /// intentional idle state.
  final int? targetIdleCapacity;

  /// The VPC transit configuration for this location, including the Transit
  /// Gateway details needed to complete the VPC attachment setup.
  final VpcTransitConfigurationResponse? vpcTransitConfiguration;

  LocationState({
    this.allocatedCapacity,
    this.alwaysOnCapacity,
    this.idleCapacity,
    this.internalVpcIpv4CidrBlock,
    this.locationName,
    this.maximumCapacity,
    this.onDemandCapacity,
    this.requestedCapacity,
    this.status,
    this.targetIdleCapacity,
    this.vpcTransitConfiguration,
  });

  factory LocationState.fromJson(Map<String, dynamic> json) {
    return LocationState(
      allocatedCapacity: json['AllocatedCapacity'] as int?,
      alwaysOnCapacity: json['AlwaysOnCapacity'] as int?,
      idleCapacity: json['IdleCapacity'] as int?,
      internalVpcIpv4CidrBlock: json['InternalVpcIpv4CidrBlock'] as String?,
      locationName: json['LocationName'] as String?,
      maximumCapacity: json['MaximumCapacity'] as int?,
      onDemandCapacity: json['OnDemandCapacity'] as int?,
      requestedCapacity: json['RequestedCapacity'] as int?,
      status: (json['Status'] as String?)
          ?.let(StreamGroupLocationStatus.fromString),
      targetIdleCapacity: json['TargetIdleCapacity'] as int?,
      vpcTransitConfiguration: json['VpcTransitConfiguration'] != null
          ? VpcTransitConfigurationResponse.fromJson(
              json['VpcTransitConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedCapacity = this.allocatedCapacity;
    final alwaysOnCapacity = this.alwaysOnCapacity;
    final idleCapacity = this.idleCapacity;
    final internalVpcIpv4CidrBlock = this.internalVpcIpv4CidrBlock;
    final locationName = this.locationName;
    final maximumCapacity = this.maximumCapacity;
    final onDemandCapacity = this.onDemandCapacity;
    final requestedCapacity = this.requestedCapacity;
    final status = this.status;
    final targetIdleCapacity = this.targetIdleCapacity;
    final vpcTransitConfiguration = this.vpcTransitConfiguration;
    return {
      if (allocatedCapacity != null) 'AllocatedCapacity': allocatedCapacity,
      if (alwaysOnCapacity != null) 'AlwaysOnCapacity': alwaysOnCapacity,
      if (idleCapacity != null) 'IdleCapacity': idleCapacity,
      if (internalVpcIpv4CidrBlock != null)
        'InternalVpcIpv4CidrBlock': internalVpcIpv4CidrBlock,
      if (locationName != null) 'LocationName': locationName,
      if (maximumCapacity != null) 'MaximumCapacity': maximumCapacity,
      if (onDemandCapacity != null) 'OnDemandCapacity': onDemandCapacity,
      if (requestedCapacity != null) 'RequestedCapacity': requestedCapacity,
      if (status != null) 'Status': status.value,
      if (targetIdleCapacity != null) 'TargetIdleCapacity': targetIdleCapacity,
      if (vpcTransitConfiguration != null)
        'VpcTransitConfiguration': vpcTransitConfiguration,
    };
  }
}

/// @nodoc
class StreamGroupLocationStatus {
  static const activating = StreamGroupLocationStatus._('ACTIVATING');
  static const active = StreamGroupLocationStatus._('ACTIVE');
  static const error = StreamGroupLocationStatus._('ERROR');
  static const removing = StreamGroupLocationStatus._('REMOVING');

  final String value;

  const StreamGroupLocationStatus._(this.value);

  static const values = [activating, active, error, removing];

  static StreamGroupLocationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StreamGroupLocationStatus._(value));

  @override
  bool operator ==(other) =>
      other is StreamGroupLocationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The VPC transit configuration details for a stream group location, including
/// the Transit Gateway information needed to complete the VPC attachment setup.
///
/// @nodoc
class VpcTransitConfigurationResponse {
  /// The IPv4 CIDR blocks in your VPC that the stream group can access.
  final List<String>? ipv4CidrBlocks;

  /// The ID of the Transit Gateway that Amazon GameLift Streams created for this
  /// VPC connection. Use this ID when creating your VPC attachment.
  final String? transitGatewayId;

  /// The ARN of the AWS Resource Access Manager resource share for the Transit
  /// Gateway. You must accept this resource share before you can create a VPC
  /// attachment.
  final String? transitGatewayResourceShareArn;

  /// The ID of the Amazon VPC that is connected to the stream group.
  final String? vpcId;

  VpcTransitConfigurationResponse({
    this.ipv4CidrBlocks,
    this.transitGatewayId,
    this.transitGatewayResourceShareArn,
    this.vpcId,
  });

  factory VpcTransitConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return VpcTransitConfigurationResponse(
      ipv4CidrBlocks: (json['Ipv4CidrBlocks'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      transitGatewayId: json['TransitGatewayId'] as String?,
      transitGatewayResourceShareArn:
          json['TransitGatewayResourceShareArn'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipv4CidrBlocks = this.ipv4CidrBlocks;
    final transitGatewayId = this.transitGatewayId;
    final transitGatewayResourceShareArn = this.transitGatewayResourceShareArn;
    final vpcId = this.vpcId;
    return {
      if (ipv4CidrBlocks != null) 'Ipv4CidrBlocks': ipv4CidrBlocks,
      if (transitGatewayId != null) 'TransitGatewayId': transitGatewayId,
      if (transitGatewayResourceShareArn != null)
        'TransitGatewayResourceShareArn': transitGatewayResourceShareArn,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Configuration settings that define a stream group's stream capacity for a
/// location. When configuring a location for the first time, you must specify a
/// numeric value for at least one of the two capacity types. To update the
/// capacity for an existing stream group, call <a
/// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_UpdateStreamGroup.html">UpdateStreamGroup</a>.
/// To add a new location and specify its capacity, call <a
/// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_AddStreamGroupLocations.html">AddStreamGroupLocations</a>.
///
/// @nodoc
class LocationConfiguration {
  /// A location's name. For example, <code>us-east-1</code>. For a complete list
  /// of locations that Amazon GameLift Streams supports, refer to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/regions-quotas.html">Regions,
  /// quotas, and limitations</a> in the <i>Amazon GameLift Streams Developer
  /// Guide</i>.
  final String locationName;

  /// This setting, if non-zero, indicates minimum streaming capacity which is
  /// allocated to you and is never released back to the service. You pay for this
  /// base level of capacity at all times, whether used or idle.
  final int? alwaysOnCapacity;

  /// This indicates the maximum capacity that the service can allocate for you.
  /// Newly created streams may take a few minutes to start. Capacity is released
  /// back to the service when idle. You pay for capacity that is allocated to you
  /// until it is released.
  final int? maximumCapacity;

  /// This field is deprecated. Use <code>MaximumCapacity</code> instead. This
  /// parameter cannot be used with <code>MaximumCapacity</code> or
  /// <code>TargetIdleCapacity</code> in the same location configuration.
  ///
  /// The streaming capacity that Amazon GameLift Streams can allocate in response
  /// to stream requests, and then de-allocate when the session has terminated.
  /// This offers a cost control measure at the expense of a greater startup time
  /// (typically under 5 minutes). Default is 0 when creating a stream group or
  /// adding a location.
  final int? onDemandCapacity;

  /// This indicates idle capacity which the service pre-allocates and holds for
  /// you in anticipation of future activity. This helps to insulate your users
  /// from capacity-allocation delays. You pay for capacity which is held in this
  /// intentional idle state.
  final int? targetIdleCapacity;

  /// Configuration for connecting the stream group to resources in your Amazon
  /// VPC using AWS Transit Gateway. This setting is optional. If specified,
  /// Amazon GameLift Streams creates a Transit Gateway to enable private network
  /// connectivity between the service VPC and your VPC. The VPC ID cannot be
  /// changed after the stream group is created, but you can update the CIDR
  /// blocks by calling <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_UpdateStreamGroup.html">UpdateStreamGroup</a>.
  final VpcTransitConfiguration? vpcTransitConfiguration;

  LocationConfiguration({
    required this.locationName,
    this.alwaysOnCapacity,
    this.maximumCapacity,
    this.onDemandCapacity,
    this.targetIdleCapacity,
    this.vpcTransitConfiguration,
  });

  Map<String, dynamic> toJson() {
    final locationName = this.locationName;
    final alwaysOnCapacity = this.alwaysOnCapacity;
    final maximumCapacity = this.maximumCapacity;
    final onDemandCapacity = this.onDemandCapacity;
    final targetIdleCapacity = this.targetIdleCapacity;
    final vpcTransitConfiguration = this.vpcTransitConfiguration;
    return {
      'LocationName': locationName,
      if (alwaysOnCapacity != null) 'AlwaysOnCapacity': alwaysOnCapacity,
      if (maximumCapacity != null) 'MaximumCapacity': maximumCapacity,
      if (onDemandCapacity != null) 'OnDemandCapacity': onDemandCapacity,
      if (targetIdleCapacity != null) 'TargetIdleCapacity': targetIdleCapacity,
      if (vpcTransitConfiguration != null)
        'VpcTransitConfiguration': vpcTransitConfiguration,
    };
  }
}

/// Configuration for connecting a stream group location to resources in your
/// Amazon VPC using AWS Transit Gateway. When you specify a VPC transit
/// configuration, Amazon GameLift Streams creates a Transit Gateway and shares
/// it with your account using AWS Resource Access Manager. After the stream
/// group is active, you must complete the setup by accepting the resource
/// share, creating a VPC attachment, and configuring routing.
///
/// @nodoc
class VpcTransitConfiguration {
  /// A list of IPv4 CIDR blocks in your VPC that you want the stream group to be
  /// able to access. You can specify up to 5 CIDR blocks. The CIDR blocks must be
  /// valid subsets of the VPC's CIDR blocks and cannot overlap with the service
  /// VPC CIDR block.
  final List<String> ipv4CidrBlocks;

  /// The ID of the Amazon VPC that you want to connect to the stream group. The
  /// VPC must be in the same Amazon Web Services account as the stream group.
  /// This value cannot be changed after the stream group is created.
  final String vpcId;

  VpcTransitConfiguration({
    required this.ipv4CidrBlocks,
    required this.vpcId,
  });

  Map<String, dynamic> toJson() {
    final ipv4CidrBlocks = this.ipv4CidrBlocks;
    final vpcId = this.vpcId;
    return {
      'Ipv4CidrBlocks': ipv4CidrBlocks,
      'VpcId': vpcId,
    };
  }
}

/// Describes an application resource that represents a collection of content
/// for streaming with Amazon GameLift Streams. To retrieve additional
/// application details, call <a
/// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetApplication.html">GetApplication</a>.
///
/// @nodoc
class ApplicationSummary {
  /// An Amazon Resource Name (ARN) that's assigned to an application resource and
  /// uniquely identifies the application across all Amazon Web Services Regions.
  /// Format is <code>arn:aws:gameliftstreams:\[AWS Region\]:\[AWS
  /// account\]:application/\[resource ID\]</code>.
  final String arn;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// A human-readable label for the application. You can edit this value.
  final String? description;

  /// An ID that uniquely identifies the application resource. Example ID:
  /// <code>a-9ZY8X7Wv6</code>.
  final String? id;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// Configuration settings that identify the operating system for an application
  /// resource. This can also include a compatibility layer and other drivers.
  ///
  /// A runtime environment can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// For Linux applications
  ///
  /// <ul>
  /// <li>
  /// Ubuntu 22.04 LTS (<code>Type=UBUNTU, Version=22_04_LTS</code>)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Windows applications
  ///
  /// <ul>
  /// <li>
  /// Microsoft Windows Server 2022 Base (<code>Type=WINDOWS, Version=2022</code>)
  /// </li>
  /// <li>
  /// Proton 10.0-4 (<code>Type=PROTON, Version=20260204</code>)
  /// </li>
  /// <li>
  /// Proton 9.0-2 (<code>Type=PROTON, Version=20250516</code>)
  /// </li>
  /// <li>
  /// Proton 8.0-5 (<code>Type=PROTON, Version=20241007</code>)
  /// </li>
  /// <li>
  /// Proton 8.0-2c (<code>Type=PROTON, Version=20230704</code>)
  /// </li>
  /// </ul> </li>
  /// </ul>
  final RuntimeEnvironment? runtimeEnvironment;

  /// The current status of the application resource. Possible statuses include
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>INITIALIZED</code>: Amazon GameLift Streams has received the request
  /// and is initiating the work flow to create an application.
  /// </li>
  /// <li>
  /// <code>PROCESSING</code>: The create application work flow is in process.
  /// Amazon GameLift Streams is copying the content and caching for future
  /// deployment in a stream group.
  /// </li>
  /// <li>
  /// <code>READY</code>: The application is ready to deploy in a stream group.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: An error occurred when setting up the application. For
  /// more information about the error, call <code>GetApplication</code> and refer
  /// to <code>StatusReason</code>.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Amazon GameLift Streams is in the process of deleting
  /// the application.
  /// </li>
  /// </ul>
  final ApplicationStatus? status;

  ApplicationSummary({
    required this.arn,
    this.createdAt,
    this.description,
    this.id,
    this.lastUpdatedAt,
    this.runtimeEnvironment,
    this.status,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      arn: (json['Arn'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      runtimeEnvironment: json['RuntimeEnvironment'] != null
          ? RuntimeEnvironment.fromJson(
              json['RuntimeEnvironment'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(ApplicationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final runtimeEnvironment = this.runtimeEnvironment;
    final status = this.status;
    return {
      'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (runtimeEnvironment != null) 'RuntimeEnvironment': runtimeEnvironment,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class ApplicationStatus {
  static const initialized = ApplicationStatus._('INITIALIZED');
  static const processing = ApplicationStatus._('PROCESSING');
  static const ready = ApplicationStatus._('READY');
  static const deleting = ApplicationStatus._('DELETING');
  static const error = ApplicationStatus._('ERROR');

  final String value;

  const ApplicationStatus._(this.value);

  static const values = [initialized, processing, ready, deleting, error];

  static ApplicationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationStatus._(value));

  @override
  bool operator ==(other) => other is ApplicationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration settings that identify the operating system for an application
/// resource. This can also include a compatibility layer and other drivers.
///
/// A runtime environment can be one of the following:
///
/// <ul>
/// <li>
/// For Linux applications
///
/// <ul>
/// <li>
/// Ubuntu 22.04 LTS (<code>Type=UBUNTU, Version=22_04_LTS</code>)
/// </li>
/// </ul> </li>
/// <li>
/// For Windows applications
///
/// <ul>
/// <li>
/// Microsoft Windows Server 2022 Base (<code>Type=WINDOWS, Version=2022</code>)
/// </li>
/// <li>
/// Proton 10.0-4 (<code>Type=PROTON, Version=20260204</code>)
/// </li>
/// <li>
/// Proton 9.0-2 (<code>Type=PROTON, Version=20250516</code>)
/// </li>
/// <li>
/// Proton 8.0-5 (<code>Type=PROTON, Version=20241007</code>)
/// </li>
/// <li>
/// Proton 8.0-2c (<code>Type=PROTON, Version=20230704</code>)
/// </li>
/// </ul> </li>
/// </ul>
///
/// @nodoc
class RuntimeEnvironment {
  /// The operating system and other drivers. For Proton, this also includes the
  /// Proton compatibility layer.
  final RuntimeEnvironmentType type;

  /// Versioned container environment for the application operating system.
  final String version;

  RuntimeEnvironment({
    required this.type,
    required this.version,
  });

  factory RuntimeEnvironment.fromJson(Map<String, dynamic> json) {
    return RuntimeEnvironment(
      type: RuntimeEnvironmentType.fromString((json['Type'] as String?) ?? ''),
      version: (json['Version'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final version = this.version;
    return {
      'Type': type.value,
      'Version': version,
    };
  }
}

/// @nodoc
class RuntimeEnvironmentType {
  static const proton = RuntimeEnvironmentType._('PROTON');
  static const windows = RuntimeEnvironmentType._('WINDOWS');
  static const ubuntu = RuntimeEnvironmentType._('UBUNTU');

  final String value;

  const RuntimeEnvironmentType._(this.value);

  static const values = [proton, windows, ubuntu];

  static RuntimeEnvironmentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuntimeEnvironmentType._(value));

  @override
  bool operator ==(other) =>
      other is RuntimeEnvironmentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ApplicationStatusReason {
  static const internalError = ApplicationStatusReason._('internalError');
  static const accessDenied = ApplicationStatusReason._('accessDenied');
  static const sourceModified = ApplicationStatusReason._('sourceModified');

  final String value;

  const ApplicationStatusReason._(this.value);

  static const values = [internalError, accessDenied, sourceModified];

  static ApplicationStatusReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationStatusReason._(value));

  @override
  bool operator ==(other) =>
      other is ApplicationStatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the status of the replication of an application to a location. An
/// application cannot be streamed from a location until it has finished
/// replicating there.
///
/// @nodoc
class ReplicationStatus {
  /// A location's name. For example, <code>us-east-1</code>. For a complete list
  /// of locations that Amazon GameLift Streams supports, refer to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/regions-quotas.html">Regions,
  /// quotas, and limitations</a> in the <i>Amazon GameLift Streams Developer
  /// Guide</i>.
  final String? location;

  /// The current status of the replication process.
  final ReplicationStatusType? status;

  ReplicationStatus({
    this.location,
    this.status,
  });

  factory ReplicationStatus.fromJson(Map<String, dynamic> json) {
    return ReplicationStatus(
      location: json['Location'] as String?,
      status:
          (json['Status'] as String?)?.let(ReplicationStatusType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final status = this.status;
    return {
      if (location != null) 'Location': location,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class ReplicationStatusType {
  static const replicating = ReplicationStatusType._('REPLICATING');
  static const completed = ReplicationStatusType._('COMPLETED');

  final String value;

  const ReplicationStatusType._(this.value);

  static const values = [replicating, completed];

  static ReplicationStatusType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationStatusType._(value));

  @override
  bool operator ==(other) =>
      other is ReplicationStatusType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StreamSessionStatus {
  static const activating = StreamSessionStatus._('ACTIVATING');
  static const active = StreamSessionStatus._('ACTIVE');
  static const connected = StreamSessionStatus._('CONNECTED');
  static const pendingClientReconnection =
      StreamSessionStatus._('PENDING_CLIENT_RECONNECTION');
  static const reconnecting = StreamSessionStatus._('RECONNECTING');
  static const terminating = StreamSessionStatus._('TERMINATING');
  static const terminated = StreamSessionStatus._('TERMINATED');
  static const error = StreamSessionStatus._('ERROR');

  final String value;

  const StreamSessionStatus._(this.value);

  static const values = [
    activating,
    active,
    connected,
    pendingClientReconnection,
    reconnecting,
    terminating,
    terminated,
    error
  ];

  static StreamSessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StreamSessionStatus._(value));

  @override
  bool operator ==(other) =>
      other is StreamSessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StreamSessionStatusReason {
  static const internalError = StreamSessionStatusReason._('internalError');
  static const invalidSignalRequest =
      StreamSessionStatusReason._('invalidSignalRequest');
  static const placementTimeout =
      StreamSessionStatusReason._('placementTimeout');
  static const applicationLogS3DestinationError =
      StreamSessionStatusReason._('applicationLogS3DestinationError');
  static const applicationExit = StreamSessionStatusReason._('applicationExit');
  static const connectionTimeout =
      StreamSessionStatusReason._('connectionTimeout');
  static const reconnectionTimeout =
      StreamSessionStatusReason._('reconnectionTimeout');
  static const maxSessionLengthTimeout =
      StreamSessionStatusReason._('maxSessionLengthTimeout');
  static const idleTimeout = StreamSessionStatusReason._('idleTimeout');
  static const apiTerminated = StreamSessionStatusReason._('apiTerminated');

  final String value;

  const StreamSessionStatusReason._(this.value);

  static const values = [
    internalError,
    invalidSignalRequest,
    placementTimeout,
    applicationLogS3DestinationError,
    applicationExit,
    connectionTimeout,
    reconnectionTimeout,
    maxSessionLengthTimeout,
    idleTimeout,
    apiTerminated
  ];

  static StreamSessionStatusReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StreamSessionStatusReason._(value));

  @override
  bool operator ==(other) =>
      other is StreamSessionStatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Protocol {
  static const webRTC = Protocol._('WebRTC');

  final String value;

  const Protocol._(this.value);

  static const values = [webRTC];

  static Protocol fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Protocol._(value));

  @override
  bool operator ==(other) => other is Protocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration settings for sharing the stream session's performance stats
/// with the client
///
/// @nodoc
class PerformanceStatsConfiguration {
  /// Performance stats for the session are streamed to the client when set to
  /// <code>true</code>. Defaults to <code>false</code>.
  final bool? sharedWithClient;

  PerformanceStatsConfiguration({
    this.sharedWithClient,
  });

  factory PerformanceStatsConfiguration.fromJson(Map<String, dynamic> json) {
    return PerformanceStatsConfiguration(
      sharedWithClient: json['SharedWithClient'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final sharedWithClient = this.sharedWithClient;
    return {
      if (sharedWithClient != null) 'SharedWithClient': sharedWithClient,
    };
  }
}

/// Provides details about the stream session's exported files.
///
/// @nodoc
class ExportFilesMetadata {
  /// The S3 bucket URI where Amazon GameLift Streams uploaded the set of
  /// compressed exported files for a stream session. Amazon GameLift Streams
  /// generates a ZIP file name based on the stream session metadata.
  /// Alternatively, you can provide a custom file name with a <code>.zip</code>
  /// file extension.
  ///
  /// Example 1: If you provide an S3 URI called
  /// <code>s3://amzn-s3-demo-destination-bucket/MyGame_Session1.zip</code>, then
  /// Amazon GameLift Streams will save the files at that location.
  ///
  /// Example 2: If you provide an S3 URI called
  /// <code>s3://amzn-s3-demo-destination-bucket/MyGameSessions_ExportedFiles/</code>,
  /// then Amazon GameLift Streams will save the files at
  /// <code>s3://amzn-s3-demo-destination-bucket/MyGameSessions_ExportedFiles/YYYYMMDD-HHMMSS-appId-sg-Id-sessionId.zip</code>
  /// or another similar name.
  final String? outputUri;

  /// The result of the <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_ExportStreamSessionFiles.html">ExportStreamSessionFiles</a>
  /// operation.
  final ExportFilesStatus? status;

  /// A short description of the reason the export is in <code>FAILED</code>
  /// status.
  final String? statusReason;

  ExportFilesMetadata({
    this.outputUri,
    this.status,
    this.statusReason,
  });

  factory ExportFilesMetadata.fromJson(Map<String, dynamic> json) {
    return ExportFilesMetadata(
      outputUri: json['OutputUri'] as String?,
      status: (json['Status'] as String?)?.let(ExportFilesStatus.fromString),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputUri = this.outputUri;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (outputUri != null) 'OutputUri': outputUri,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// @nodoc
class ExportFilesStatus {
  static const succeeded = ExportFilesStatus._('SUCCEEDED');
  static const failed = ExportFilesStatus._('FAILED');
  static const pending = ExportFilesStatus._('PENDING');

  final String value;

  const ExportFilesStatus._(this.value);

  static const values = [succeeded, failed, pending];

  static ExportFilesStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExportFilesStatus._(value));

  @override
  bool operator ==(other) => other is ExportFilesStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes an Amazon GameLift Streams stream session. To retrieve additional
/// details for the stream session, call <a
/// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_GetStreamSession.html">GetStreamSession</a>.
///
/// @nodoc
class StreamSessionSummary {
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that uniquely identifies the application resource.
  /// Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6</code>.
  final String? applicationArn;

  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Name (ARN)</a> that uniquely identifies the stream session
  /// resource. Example ARN:
  /// <code>arn:aws:gameliftstreams:us-west-2:111122223333:streamsession/sg-1AB2C3De4/ABC123def4567</code>.
  final String? arn;

  /// A timestamp that indicates when this resource was created. Timestamps are
  /// expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? createdAt;

  /// Provides details about the stream session's exported files.
  final ExportFilesMetadata? exportFilesMetadata;

  /// A timestamp that indicates when this resource was last updated. Timestamps
  /// are expressed using in ISO8601 format, such as:
  /// <code>2022-12-27T22:29:40+00:00</code> (UTC).
  final DateTime? lastUpdatedAt;

  /// The location where Amazon GameLift Streams hosts and streams your
  /// application. For example, <code>us-east-1</code>. For a complete list of
  /// locations that Amazon GameLift Streams supports, refer to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/developerguide/regions-quotas.html">Regions,
  /// quotas, and limitations</a> in the <i>Amazon GameLift Streams Developer
  /// Guide</i>.
  final String? location;

  /// The data transfer protocol in use with the stream session.
  final Protocol? protocol;

  /// The current status of the stream session resource.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code>: The stream session is starting and preparing to
  /// stream.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The stream session is ready and waiting for a client
  /// connection. A client has <code>ConnectionTimeoutSeconds</code> (specified in
  /// <code>StartStreamSession</code>) from when the session reaches
  /// <code>ACTIVE</code> state to establish a connection. If no client connects
  /// within this timeframe, the session automatically terminates.
  /// </li>
  /// <li>
  /// <code>CONNECTED</code>: The stream session has a connected client. A session
  /// will automatically terminate if there is no user input for 60 minutes, or if
  /// the maximum length of a session specified by
  /// <code>SessionLengthSeconds</code> in <code>StartStreamSession</code> is
  /// exceeded.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: The stream session failed to activate. See
  /// <code>StatusReason</code> (returned by <code>GetStreamSession</code> and
  /// <code>StartStreamSession</code>) for more information.
  /// </li>
  /// <li>
  /// <code>PENDING_CLIENT_RECONNECTION</code>: A client has recently disconnected
  /// and the stream session is waiting for the client to reconnect. A client has
  /// <code>ConnectionTimeoutSeconds</code> (specified in
  /// <code>StartStreamSession</code>) from when the session reaches
  /// <code>PENDING_CLIENT_RECONNECTION</code> state to re-establish a connection.
  /// If no client connects within this timeframe, the session automatically
  /// terminates.
  /// </li>
  /// <li>
  /// <code>RECONNECTING</code>: A client has initiated a reconnect to a session
  /// that was in <code>PENDING_CLIENT_RECONNECTION</code> state.
  /// </li>
  /// <li>
  /// <code>TERMINATING</code>: The stream session is ending.
  /// </li>
  /// <li>
  /// <code>TERMINATED</code>: The stream session has ended.
  /// </li>
  /// </ul>
  final StreamSessionStatus? status;

  /// A short description of the reason the stream session is in
  /// <code>ERROR</code> status or <code>TERMINATED</code> status.
  ///
  /// <code>ERROR</code> status reasons:
  ///
  /// <ul>
  /// <li>
  /// <code>applicationLogS3DestinationError</code>: Could not write the
  /// application log to the Amazon S3 bucket that is configured for the streaming
  /// application. Make sure the bucket still exists.
  /// </li>
  /// <li>
  /// <code>internalError</code>: An internal service error occurred. Start a new
  /// stream session to continue streaming.
  /// </li>
  /// <li>
  /// <code>invalidSignalRequest</code>: The WebRTC signal request that was sent
  /// is not valid. When starting or reconnecting to a stream session, use
  /// <code>generateSignalRequest</code> in the Amazon GameLift Streams Web SDK to
  /// generate a new signal request.
  /// </li>
  /// <li>
  /// <code>placementTimeout</code>: Amazon GameLift Streams could not find
  /// available stream capacity to start a stream session. Increase the stream
  /// capacity in the stream group or wait until capacity becomes available.
  /// </li>
  /// </ul>
  /// <code>TERMINATED</code> status reasons:
  ///
  /// <ul>
  /// <li>
  /// <code>apiTerminated</code>: The stream session was terminated by an API call
  /// to <a
  /// href="https://docs.aws.amazon.com/gameliftstreams/latest/apireference/API_TerminateStreamSession.html">TerminateStreamSession</a>.
  /// </li>
  /// <li>
  /// <code>applicationExit</code>: The streaming application exited or crashed.
  /// The stream session was terminated because the application is no longer
  /// running.
  /// </li>
  /// <li>
  /// <code>connectionTimeout</code>: The stream session was terminated because
  /// the client failed to connect within the connection timeout period specified
  /// by <code>ConnectionTimeoutSeconds</code>.
  /// </li>
  /// <li>
  /// <code>maxSessionLengthTimeout</code>: The stream session was terminated
  /// because it exceeded the maximum session length timeout period specified by
  /// <code>SessionLengthSeconds</code>.
  /// </li>
  /// <li>
  /// <code>reconnectionTimeout</code>: The stream session was terminated because
  /// the client failed to reconnect within the reconnection timeout period
  /// specified by <code>ConnectionTimeoutSeconds</code> after losing connection.
  /// </li>
  /// </ul>
  final StreamSessionStatusReason? statusReason;

  /// An opaque, unique identifier for an end-user, defined by the developer.
  final String? userId;

  StreamSessionSummary({
    this.applicationArn,
    this.arn,
    this.createdAt,
    this.exportFilesMetadata,
    this.lastUpdatedAt,
    this.location,
    this.protocol,
    this.status,
    this.statusReason,
    this.userId,
  });

  factory StreamSessionSummary.fromJson(Map<String, dynamic> json) {
    return StreamSessionSummary(
      applicationArn: json['ApplicationArn'] as String?,
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      exportFilesMetadata: json['ExportFilesMetadata'] != null
          ? ExportFilesMetadata.fromJson(
              json['ExportFilesMetadata'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      location: json['Location'] as String?,
      protocol: (json['Protocol'] as String?)?.let(Protocol.fromString),
      status: (json['Status'] as String?)?.let(StreamSessionStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(StreamSessionStatusReason.fromString),
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final exportFilesMetadata = this.exportFilesMetadata;
    final lastUpdatedAt = this.lastUpdatedAt;
    final location = this.location;
    final protocol = this.protocol;
    final status = this.status;
    final statusReason = this.statusReason;
    final userId = this.userId;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (exportFilesMetadata != null)
        'ExportFilesMetadata': exportFilesMetadata,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (location != null) 'Location': location,
      if (protocol != null) 'Protocol': protocol.value,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
      if (userId != null) 'UserId': userId,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
