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

part '2015-10-01.g.dart';

/// GameLift provides solutions for hosting session-based multiplayer game
/// servers in the cloud, including tools for deploying, operating, and scaling
/// game servers. Built on AWS global computing infrastructure, GameLift helps
/// you deliver high-performance, high-reliability, low-cost game servers while
/// dynamically scaling your resource usage to meet player demand.
class GameLift {
  final _s.JsonProtocol _protocol;
  GameLift({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'gamelift',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Registers a player's acceptance or rejection of a proposed FlexMatch
  /// match. A matchmaking configuration may require player acceptance; if so,
  /// then matches built with that configuration cannot be completed unless all
  /// players accept the proposed match within a specified time limit.
  ///
  /// When FlexMatch builds a match, all the matchmaking tickets involved in the
  /// proposed match are placed into status <code>REQUIRES_ACCEPTANCE</code>.
  /// This is a trigger for your game to get acceptance from all players in the
  /// ticket. Acceptances are only valid for tickets when they are in this
  /// status; all other acceptances result in an error.
  ///
  /// To register acceptance, specify the ticket ID, a response, and one or more
  /// players. Once all players have registered acceptance, the matchmaking
  /// tickets advance to status <code>PLACING</code>, where a new game session
  /// is created for the match.
  ///
  /// If any player rejects the match, or if acceptances are not received before
  /// a specified timeout, the proposed match is dropped. The matchmaking
  /// tickets are then handled in one of two ways: For tickets where one or more
  /// players rejected the match, the ticket status is returned to
  /// <code>SEARCHING</code> to find a new match. For tickets where one or more
  /// players failed to respond, the ticket status is set to
  /// <code>CANCELLED</code>, and processing is terminated. A new matchmaking
  /// request for these players can be submitted as needed.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-client.html">
  /// Add FlexMatch to a Game Client</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html">
  /// FlexMatch Events Reference</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>StartMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>StopMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>AcceptMatch</a>
  /// </li>
  /// <li>
  /// <a>StartMatchBackfill</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [acceptanceType] :
  /// Player response to the proposed match.
  ///
  /// Parameter [playerIds] :
  /// A unique identifier for a player delivering the response. This parameter
  /// can include one or multiple player IDs.
  ///
  /// Parameter [ticketId] :
  /// A unique identifier for a matchmaking ticket. The ticket must be in status
  /// <code>REQUIRES_ACCEPTANCE</code>; otherwise this request will fail.
  Future<void> acceptMatch({
    @_s.required AcceptanceType acceptanceType,
    @_s.required List<String> playerIds,
    @_s.required String ticketId,
  }) async {
    ArgumentError.checkNotNull(acceptanceType, 'acceptanceType');
    ArgumentError.checkNotNull(playerIds, 'playerIds');
    ArgumentError.checkNotNull(ticketId, 'ticketId');
    _s.validateStringLength(
      'ticketId',
      ticketId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ticketId',
      ticketId,
      r'''[a-zA-Z0-9-\.]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.AcceptMatch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceptanceType': acceptanceType?.toValue() ?? '',
        'PlayerIds': playerIds,
        'TicketId': ticketId,
      },
    );

    return AcceptMatchOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Locates an available game server and temporarily reserves it to host
  /// gameplay and players. This operation is called from a game client or
  /// client service (such as a matchmaker) to request hosting resources for a
  /// new game session. In response, GameLift FleetIQ locates an available game
  /// server, places it in <code>CLAIMED</code> status for 60 seconds, and
  /// returns connection information that players can use to connect to the game
  /// server.
  ///
  /// To claim a game server, identify a game server group. You can also specify
  /// a game server ID, although this approach bypasses GameLift FleetIQ
  /// placement optimization. Optionally, include game data to pass to the game
  /// server at the start of a game session, such as a game map or player
  /// information.
  ///
  /// When a game server is successfully claimed, connection information is
  /// returned. A claimed game server's utilization status remains
  /// <code>AVAILABLE</code> while the claim status is set to
  /// <code>CLAIMED</code> for up to 60 seconds. This time period gives the game
  /// server time to update its status to <code>UTILIZED</code> (using
  /// <a>UpdateGameServer</a>) once players join. If the game server's status is
  /// not updated within 60 seconds, the game server reverts to unclaimed status
  /// and is available to be claimed by another request. The claim time period
  /// is a fixed value and is not configurable.
  ///
  /// If you try to claim a specific game server, this request will fail in the
  /// following cases:
  ///
  /// <ul>
  /// <li>
  /// If the game server utilization status is <code>UTILIZED</code>.
  /// </li>
  /// <li>
  /// If the game server claim status is <code>CLAIMED</code>.
  /// </li>
  /// </ul> <note>
  /// When claiming a specific game server, this request will succeed even if
  /// the game server is running on an instance in <code>DRAINING</code> status.
  /// To avoid this, first check the instance status by calling
  /// <a>DescribeGameServerInstances</a>.
  /// </note>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>RegisterGameServer</a>
  /// </li>
  /// <li>
  /// <a>ListGameServers</a>
  /// </li>
  /// <li>
  /// <a>ClaimGameServer</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServer</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServer</a>
  /// </li>
  /// <li>
  /// <a>DeregisterGameServer</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [OutOfCapacityException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group where the game server is
  /// running. Use either the <a>GameServerGroup</a> name or ARN value.. If you
  /// are not specifying a game server to claim, this value identifies where you
  /// want GameLift FleetIQ to look for an available game server to claim.
  ///
  /// Parameter [gameServerData] :
  /// A set of custom game server properties, formatted as a single string
  /// value. This data is passed to a game client or service when it requests
  /// information on game servers using <a>ListGameServers</a> or
  /// <a>ClaimGameServer</a>.
  ///
  /// Parameter [gameServerId] :
  /// A custom string that uniquely identifies the game server to claim. If this
  /// parameter is left empty, GameLift FleetIQ searches for an available game
  /// server in the specified game server group.
  Future<ClaimGameServerOutput> claimGameServer({
    @_s.required String gameServerGroupName,
    String gameServerData,
    String gameServerId,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'gameServerData',
      gameServerData,
      1,
      1024,
    );
    _s.validateStringPattern(
      'gameServerData',
      gameServerData,
      r'''.*\S.*''',
    );
    _s.validateStringLength(
      'gameServerId',
      gameServerId,
      3,
      128,
    );
    _s.validateStringPattern(
      'gameServerId',
      gameServerId,
      r'''[a-zA-Z0-9-\.]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ClaimGameServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        if (gameServerData != null) 'GameServerData': gameServerData,
        if (gameServerId != null) 'GameServerId': gameServerId,
      },
    );

    return ClaimGameServerOutput.fromJson(jsonResponse.body);
  }

  /// Creates an alias for a fleet. In most situations, you can use an alias ID
  /// in place of a fleet ID. An alias provides a level of abstraction for a
  /// fleet that is useful when redirecting player traffic from one fleet to
  /// another, such as when updating your game build.
  ///
  /// Amazon GameLift supports two types of routing strategies for aliases:
  /// simple and terminal. A simple alias points to an active fleet. A terminal
  /// alias is used to display messaging or link to a URL instead of routing
  /// players to an active fleet. For example, you might use a terminal alias
  /// when a game version is no longer supported and you want to direct players
  /// to an upgrade site.
  ///
  /// To create a fleet alias, specify an alias name, routing strategy, and
  /// optional description. Each simple alias can point to only one fleet, but a
  /// fleet can have multiple aliases. If successful, a new alias record is
  /// returned, including an alias ID and an ARN. You can reassign an alias to
  /// another fleet by calling <code>UpdateAlias</code>.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateAlias</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// <li>
  /// <a>DescribeAlias</a>
  /// </li>
  /// <li>
  /// <a>UpdateAlias</a>
  /// </li>
  /// <li>
  /// <a>DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a>ResolveAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceException].
  /// May throw [LimitExceededException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with an alias. Alias names do not
  /// need to be unique.
  ///
  /// Parameter [routingStrategy] :
  /// The routing configuration, including routing type and fleet target, for
  /// the alias.
  ///
  /// Parameter [description] :
  /// A human-readable description of the alias.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new alias resource. Tags are
  /// developer-defined key-value pairs. Tagging AWS resources are useful for
  /// resource management, access management and cost allocation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging AWS Resources</a> in the <i>AWS General Reference</i>. Once the
  /// resource is created, you can use <a>TagResource</a>, <a>UntagResource</a>,
  /// and <a>ListTagsForResource</a> to add, remove, and view tags. The maximum
  /// tag limit may be lower than stated. See the AWS General Reference for
  /// actual tagging limits.
  Future<CreateAliasOutput> createAlias({
    @_s.required String name,
    @_s.required RoutingStrategy routingStrategy,
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
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(routingStrategy, 'routingStrategy');
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'RoutingStrategy': routingStrategy,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAliasOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon GameLift build resource for your game server binary
  /// files. Game server binaries must be combined into a zip file for use with
  /// Amazon GameLift.
  /// <important>
  /// When setting up a new game build for GameLift, we recommend using the AWS
  /// CLI command <b> <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/gamelift/upload-build.html">upload-build</a>
  /// </b>. This helper command combines two tasks: (1) it uploads your build
  /// files from a file directory to a GameLift Amazon S3 location, and (2) it
  /// creates a new build resource.
  /// </important>
  /// The <code>CreateBuild</code> operation can used in the following
  /// scenarios:
  ///
  /// <ul>
  /// <li>
  /// To create a new game build with build files that are in an S3 location
  /// under an AWS account that you control. To use this option, you must first
  /// give Amazon GameLift access to the S3 bucket. With permissions in place,
  /// call <code>CreateBuild</code> and specify a build name, operating system,
  /// and the S3 storage location of your game build.
  /// </li>
  /// <li>
  /// To directly upload your build files to a GameLift S3 location. To use this
  /// option, first call <code>CreateBuild</code> and specify a build name and
  /// operating system. This operation creates a new build resource and also
  /// returns an S3 location with temporary access credentials. Use the
  /// credentials to manually upload your build files to the specified S3
  /// location. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UploadingObjects.html">Uploading
  /// Objects</a> in the <i>Amazon S3 Developer Guide</i>. Build files can be
  /// uploaded to the GameLift S3 location once only; that can't be updated.
  /// </li>
  /// </ul>
  /// If successful, this operation creates a new build resource with a unique
  /// build ID and places it in <code>INITIALIZED</code> status. A build must be
  /// in <code>READY</code> status before you can create fleets with it.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html">Uploading
  /// Your Game</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-cli-uploading.html#gamelift-build-cli-uploading-create-build">
  /// Create a Build with Files in Amazon S3</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateBuild</a>
  /// </li>
  /// <li>
  /// <a>ListBuilds</a>
  /// </li>
  /// <li>
  /// <a>DescribeBuild</a>
  /// </li>
  /// <li>
  /// <a>UpdateBuild</a>
  /// </li>
  /// <li>
  /// <a>DeleteBuild</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [ConflictException].
  /// May throw [TaggingFailedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a build. Build names do not
  /// need to be unique. You can use <a>UpdateBuild</a> to change this value
  /// later.
  ///
  /// Parameter [operatingSystem] :
  /// The operating system that the game server binaries are built to run on.
  /// This value determines the type of fleet resources that you can use for
  /// this build. If your game build contains multiple executables, they all
  /// must run on the same operating system. If an operating system is not
  /// specified when creating a build, Amazon GameLift uses the default value
  /// (WINDOWS_2012). This value cannot be changed later.
  ///
  /// Parameter [storageLocation] :
  /// The location where your game build files are stored. Use this parameter
  /// only when creating a build using files that are stored in an S3 bucket
  /// that you own. Identify an S3 bucket name and key, which must in the same
  /// Region where you're creating a build. This parameter must also specify the
  /// ARN for an IAM role that you've set up to give Amazon GameLift access your
  /// S3 bucket. To call this operation with a storage location, you must have
  /// IAM PassRole permission. For more details on IAM roles and PassRole
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/setting-up-role.html">
  /// Set up a role for GameLift access</a>.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new build resource. Tags are
  /// developer-defined key-value pairs. Tagging AWS resources are useful for
  /// resource management, access management and cost allocation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging AWS Resources</a> in the <i>AWS General Reference</i>. Once the
  /// resource is created, you can use <a>TagResource</a>, <a>UntagResource</a>,
  /// and <a>ListTagsForResource</a> to add, remove, and view tags. The maximum
  /// tag limit may be lower than stated. See the AWS General Reference for
  /// actual tagging limits.
  ///
  /// Parameter [version] :
  /// Version information that is associated with a build or script. Version
  /// strings do not need to be unique. You can use <a>UpdateBuild</a> to change
  /// this value later.
  Future<CreateBuildOutput> createBuild({
    String name,
    OperatingSystem operatingSystem,
    S3Location storageLocation,
    List<Tag> tags,
    String version,
  }) async {
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
    );
    _s.validateStringLength(
      'version',
      version,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateBuild'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (name != null) 'Name': name,
        if (operatingSystem != null)
          'OperatingSystem': operatingSystem.toValue(),
        if (storageLocation != null) 'StorageLocation': storageLocation,
        if (tags != null) 'Tags': tags,
        if (version != null) 'Version': version,
      },
    );

    return CreateBuildOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new fleet to run your game servers. whether they are custom game
  /// builds or Realtime Servers with game-specific script. A fleet is a set of
  /// Amazon Elastic Compute Cloud (Amazon EC2) instances, each of which can
  /// host multiple game sessions. When creating a fleet, you choose the
  /// hardware specifications, set some configuration options, and specify the
  /// game server to deploy on the new fleet.
  ///
  /// To create a new fleet, provide the following: (1) a fleet name, (2) an EC2
  /// instance type and fleet type (spot or on-demand), (3) the build ID for
  /// your game build or script ID if using Realtime Servers, and (4) a runtime
  /// configuration, which determines how game servers will run on each instance
  /// in the fleet.
  ///
  /// If the <code>CreateFleet</code> call is successful, Amazon GameLift
  /// performs the following tasks. You can track the process of a fleet by
  /// checking the fleet status or by monitoring fleet creation events:
  ///
  /// <ul>
  /// <li>
  /// Creates a fleet resource. Status: <code>NEW</code>.
  /// </li>
  /// <li>
  /// Begins writing events to the fleet event log, which can be accessed in the
  /// Amazon GameLift console.
  /// </li>
  /// <li>
  /// Sets the fleet's target capacity to 1 (desired instances), which triggers
  /// Amazon GameLift to start one new EC2 instance.
  /// </li>
  /// <li>
  /// Downloads the game build or Realtime script to the new instance and
  /// installs it. Statuses: <code>DOWNLOADING</code>, <code>VALIDATING</code>,
  /// <code>BUILDING</code>.
  /// </li>
  /// <li>
  /// Starts launching server processes on the instance. If the fleet is
  /// configured to run multiple server processes per instance, Amazon GameLift
  /// staggers each process launch by a few seconds. Status:
  /// <code>ACTIVATING</code>.
  /// </li>
  /// <li>
  /// Sets the fleet's status to <code>ACTIVE</code> as soon as one server
  /// process is ready to host a game session.
  /// </li>
  /// </ul>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// Up Fleets</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html#fleets-creating-debug-creation">Debug
  /// Fleet Creation Issues</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [eC2InstanceType] :
  /// The name of an EC2 instance type that is supported in Amazon GameLift. A
  /// fleet instance type determines the computing resources of each instance in
  /// the fleet, including CPU, memory, storage, and networking capacity. Amazon
  /// GameLift supports the following EC2 instance types. See <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a> for detailed descriptions.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a fleet. Fleet names do not
  /// need to be unique.
  ///
  /// Parameter [buildId] :
  /// A unique identifier for a build to be deployed on the new fleet. You can
  /// use either the build ID or ARN value. The custom game server build must
  /// have been successfully uploaded to Amazon GameLift and be in a
  /// <code>READY</code> status. This fleet setting cannot be changed once the
  /// fleet is created.
  ///
  /// Parameter [certificateConfiguration] :
  /// Indicates whether to generate a TLS/SSL certificate for the new fleet. TLS
  /// certificates are used for encrypting traffic between game clients and game
  /// servers running on GameLift. If this parameter is not specified, the
  /// default value, DISABLED, is used. This fleet setting cannot be changed
  /// once the fleet is created. Learn more at <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-howitworks.html#gamelift-howitworks-security">Securing
  /// Client/Server Communication</a>.
  ///
  /// Note: This feature requires the AWS Certificate Manager (ACM) service,
  /// which is available in the AWS global partition but not in all other
  /// partitions. When working in a partition that does not support this
  /// feature, a request for a new fleet with certificate generation results
  /// fails with a 4xx unsupported Region error.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <b>GENERATED</b> - Generate a TLS/SSL certificate for this fleet.
  /// </li>
  /// <li>
  /// <b>DISABLED</b> - (default) Do not generate a TLS/SSL certificate for this
  /// fleet.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A human-readable description of a fleet.
  ///
  /// Parameter [eC2InboundPermissions] :
  /// Range of IP addresses and port settings that permit inbound traffic to
  /// access game sessions that are running on the fleet. For fleets using a
  /// custom game build, this parameter is required before game sessions running
  /// on the fleet can accept connections. For Realtime Servers fleets, Amazon
  /// GameLift automatically sets TCP and UDP ranges for use by the Realtime
  /// servers. You can specify multiple permission settings or add more by
  /// updating the fleet.
  ///
  /// Parameter [fleetType] :
  /// Indicates whether to use On-Demand instances or Spot instances for this
  /// fleet. If empty, the default is <code>ON_DEMAND</code>. Both categories of
  /// instances use identical hardware and configurations based on the instance
  /// type selected for this fleet. Learn more about <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-ec2-instances.html#gamelift-ec2-instances-spot">
  /// On-Demand versus Spot Instances</a>.
  ///
  /// Parameter [instanceRoleArn] :
  /// A unique identifier for an AWS IAM role that manages access to your AWS
  /// services. Fleets with an instance role ARN allow applications that are
  /// running on the fleet's instances to assume the role. Learn more about
  /// using on-box credentials for your game servers at <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-resources.html">
  /// Access external resources from a game server</a>. To call this operation
  /// with instance role ARN, you must have IAM PassRole permissions. See <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-iam-policy-examples.html">IAM
  /// policy examples for GameLift</a>.
  ///
  /// Parameter [logPaths] :
  /// This parameter is no longer used. Instead, to specify where Amazon
  /// GameLift should store log files once a server process shuts down, use the
  /// Amazon GameLift server API <code>ProcessReady()</code> and specify one or
  /// more directory paths in <code>logParameters</code>. See more information
  /// in the <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api-ref.html#gamelift-sdk-server-api-ref-dataypes-process">Server
  /// API Reference</a>.
  ///
  /// Parameter [metricGroups] :
  /// The name of an Amazon CloudWatch metric group to add this fleet to. A
  /// metric group aggregates the metrics for all fleets in the group. Specify
  /// an existing metric group name, or provide a new name to create a new
  /// metric group. A fleet can only be included in one metric group at a time.
  ///
  /// Parameter [newGameSessionProtectionPolicy] :
  /// A game session protection policy to apply to all instances in this fleet.
  /// If this parameter is not set, instances in this fleet default to no
  /// protection. You can change a fleet's protection policy using
  /// <a>UpdateFleetAttributes</a>, but this change will only affect sessions
  /// created after the policy change. You can also set protection for
  /// individual instances using <a>UpdateGameSession</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>NoProtection</b> - The game session can be terminated during a
  /// scale-down event.
  /// </li>
  /// <li>
  /// <b>FullProtection</b> - If the game session is in an <code>ACTIVE</code>
  /// status, it cannot be terminated during a scale-down event.
  /// </li>
  /// </ul>
  ///
  /// Parameter [peerVpcAwsAccountId] :
  /// A unique identifier for the AWS account with the VPC that you want to peer
  /// your Amazon GameLift fleet with. You can find your account ID in the AWS
  /// Management Console under account settings.
  ///
  /// Parameter [peerVpcId] :
  /// A unique identifier for a VPC with resources to be accessed by your Amazon
  /// GameLift fleet. The VPC must be in the same Region as your fleet. To look
  /// up a VPC ID, use the <a href="https://console.aws.amazon.com/vpc/">VPC
  /// Dashboard</a> in the AWS Management Console. Learn more about VPC peering
  /// in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with Amazon GameLift Fleets</a>.
  ///
  /// Parameter [resourceCreationLimitPolicy] :
  /// A policy that limits the number of game sessions an individual player can
  /// create over a span of time for this fleet.
  ///
  /// Parameter [runtimeConfiguration] :
  /// Instructions for launching server processes on each instance in the fleet.
  /// Server processes run either a custom game build executable or a Realtime
  /// script. The runtime configuration defines the server executables or launch
  /// script file, launch parameters, and the number of processes to run
  /// concurrently on each instance. When creating a fleet, the runtime
  /// configuration must have at least one server process configuration;
  /// otherwise the request fails with an invalid request exception. (This
  /// parameter replaces the parameters <code>ServerLaunchPath</code> and
  /// <code>ServerLaunchParameters</code>, although requests that contain values
  /// for these parameters instead of a runtime configuration will continue to
  /// work.) This parameter is required unless the parameters
  /// <code>ServerLaunchPath</code> and <code>ServerLaunchParameters</code> are
  /// defined. Runtime configuration replaced these parameters, but fleets that
  /// use them will continue to work.
  ///
  /// Parameter [scriptId] :
  /// A unique identifier for a Realtime script to be deployed on the new fleet.
  /// You can use either the script ID or ARN value. The Realtime script must
  /// have been successfully uploaded to Amazon GameLift. This fleet setting
  /// cannot be changed once the fleet is created.
  ///
  /// Parameter [serverLaunchParameters] :
  /// This parameter is no longer used. Instead, specify server launch
  /// parameters in the <code>RuntimeConfiguration</code> parameter. (Requests
  /// that specify a server launch path and launch parameters instead of a
  /// runtime configuration will continue to work.)
  ///
  /// Parameter [serverLaunchPath] :
  /// This parameter is no longer used. Instead, specify a server launch path
  /// using the <code>RuntimeConfiguration</code> parameter. Requests that
  /// specify a server launch path and launch parameters instead of a runtime
  /// configuration will continue to work.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new fleet resource. Tags are
  /// developer-defined key-value pairs. Tagging AWS resources are useful for
  /// resource management, access management and cost allocation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging AWS Resources</a> in the <i>AWS General Reference</i>. Once the
  /// resource is created, you can use <a>TagResource</a>, <a>UntagResource</a>,
  /// and <a>ListTagsForResource</a> to add, remove, and view tags. The maximum
  /// tag limit may be lower than stated. See the AWS General Reference for
  /// actual tagging limits.
  Future<CreateFleetOutput> createFleet({
    @_s.required EC2InstanceType eC2InstanceType,
    @_s.required String name,
    String buildId,
    CertificateConfiguration certificateConfiguration,
    String description,
    List<IpPermission> eC2InboundPermissions,
    FleetType fleetType,
    String instanceRoleArn,
    List<String> logPaths,
    List<String> metricGroups,
    ProtectionPolicy newGameSessionProtectionPolicy,
    String peerVpcAwsAccountId,
    String peerVpcId,
    ResourceCreationLimitPolicy resourceCreationLimitPolicy,
    RuntimeConfiguration runtimeConfiguration,
    String scriptId,
    String serverLaunchParameters,
    String serverLaunchPath,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(eC2InstanceType, 'eC2InstanceType');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'buildId',
      buildId,
      r'''^build-\S+|^arn:.*:build\/build-\S+''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'instanceRoleArn',
      instanceRoleArn,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'peerVpcAwsAccountId',
      peerVpcAwsAccountId,
      1,
      1024,
    );
    _s.validateStringLength(
      'peerVpcId',
      peerVpcId,
      1,
      1024,
    );
    _s.validateStringPattern(
      'scriptId',
      scriptId,
      r'''^script-\S+|^arn:.*:script\/script-\S+''',
    );
    _s.validateStringLength(
      'serverLaunchParameters',
      serverLaunchParameters,
      1,
      1024,
    );
    _s.validateStringLength(
      'serverLaunchPath',
      serverLaunchPath,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EC2InstanceType': eC2InstanceType?.toValue() ?? '',
        'Name': name,
        if (buildId != null) 'BuildId': buildId,
        if (certificateConfiguration != null)
          'CertificateConfiguration': certificateConfiguration,
        if (description != null) 'Description': description,
        if (eC2InboundPermissions != null)
          'EC2InboundPermissions': eC2InboundPermissions,
        if (fleetType != null) 'FleetType': fleetType.toValue(),
        if (instanceRoleArn != null) 'InstanceRoleArn': instanceRoleArn,
        if (logPaths != null) 'LogPaths': logPaths,
        if (metricGroups != null) 'MetricGroups': metricGroups,
        if (newGameSessionProtectionPolicy != null)
          'NewGameSessionProtectionPolicy':
              newGameSessionProtectionPolicy.toValue(),
        if (peerVpcAwsAccountId != null)
          'PeerVpcAwsAccountId': peerVpcAwsAccountId,
        if (peerVpcId != null) 'PeerVpcId': peerVpcId,
        if (resourceCreationLimitPolicy != null)
          'ResourceCreationLimitPolicy': resourceCreationLimitPolicy,
        if (runtimeConfiguration != null)
          'RuntimeConfiguration': runtimeConfiguration,
        if (scriptId != null) 'ScriptId': scriptId,
        if (serverLaunchParameters != null)
          'ServerLaunchParameters': serverLaunchParameters,
        if (serverLaunchPath != null) 'ServerLaunchPath': serverLaunchPath,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFleetOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Creates a GameLift FleetIQ game server group for managing game hosting on
  /// a collection of Amazon EC2 instances for game hosting. This operation
  /// creates the game server group, creates an Auto Scaling group in your AWS
  /// account, and establishes a link between the two groups. You can view the
  /// status of your game server groups in the GameLift console. Game server
  /// group metrics and events are emitted to Amazon CloudWatch.
  ///
  /// Before creating a new game server group, you must have the following:
  ///
  /// <ul>
  /// <li>
  /// An Amazon EC2 launch template that specifies how to launch Amazon EC2
  /// instances with your game server build. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html">
  /// Launching an Instance from a Launch Template</a> in the <i>Amazon EC2 User
  /// Guide</i>.
  /// </li>
  /// <li>
  /// An IAM role that extends limited access to your AWS account to allow
  /// GameLift FleetIQ to create and interact with the Auto Scaling group. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gsg-iam-permissions-roles.html">Create
  /// IAM roles for cross-service interaction</a> in the <i>GameLift FleetIQ
  /// Developer Guide</i>.
  /// </li>
  /// </ul>
  /// To create a new game server group, specify a unique group name, IAM role
  /// and Amazon EC2 launch template, and provide a list of instance types that
  /// can be used in the group. You must also set initial maximum and minimum
  /// limits on the group's instance count. You can optionally set an Auto
  /// Scaling policy with target tracking based on a GameLift FleetIQ metric.
  ///
  /// Once the game server group and corresponding Auto Scaling group are
  /// created, you have full access to change the Auto Scaling group's
  /// configuration as needed. Several properties that are set when creating a
  /// game server group, including maximum/minimum size and auto-scaling policy
  /// settings, must be updated directly in the Auto Scaling group. Keep in mind
  /// that some Auto Scaling group properties are periodically updated by
  /// GameLift FleetIQ as part of its balancing activities to optimize for
  /// availability and cost.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ListGameServerGroups</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ResumeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>SuspendGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerInstances</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [gameServerGroupName] :
  /// An identifier for the new game server group. This value is used to
  /// generate unique ARN identifiers for the EC2 Auto Scaling group and the
  /// GameLift FleetIQ game server group. The name must be unique per Region per
  /// AWS account.
  ///
  /// Parameter [instanceDefinitions] :
  /// The EC2 instance types and sizes to use in the Auto Scaling group. The
  /// instance definitions must specify at least two different instance types
  /// that are supported by GameLift FleetIQ. For more information on instance
  /// types, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">EC2
  /// Instance Types</a> in the <i>Amazon EC2 User Guide</i>. You can optionally
  /// specify capacity weighting for each instance type. If no weight value is
  /// specified for an instance type, it is set to the default value "1". For
  /// more information about capacity weighting, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-weighting.html">
  /// Instance Weighting for Amazon EC2 Auto Scaling</a> in the Amazon EC2 Auto
  /// Scaling User Guide.
  ///
  /// Parameter [launchTemplate] :
  /// The EC2 launch template that contains configuration settings and game
  /// server code to be deployed to all instances in the game server group. You
  /// can specify the template using either the template name or ID. For help
  /// with creating a launch template, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html">Creating
  /// a Launch Template for an Auto Scaling Group</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>. After the Auto Scaling group is created, update
  /// this value directly in the Auto Scaling group using the AWS console or
  /// APIs.
  ///
  /// Parameter [maxSize] :
  /// The maximum number of instances allowed in the EC2 Auto Scaling group.
  /// During automatic scaling events, GameLift FleetIQ and EC2 do not scale up
  /// the group above this maximum. After the Auto Scaling group is created,
  /// update this value directly in the Auto Scaling group using the AWS console
  /// or APIs.
  ///
  /// Parameter [minSize] :
  /// The minimum number of instances allowed in the EC2 Auto Scaling group.
  /// During automatic scaling events, GameLift FleetIQ and EC2 do not scale
  /// down the group below this minimum. In production, this value should be set
  /// to at least 1. After the Auto Scaling group is created, update this value
  /// directly in the Auto Scaling group using the AWS console or APIs.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// for an IAM role that allows Amazon GameLift to access your EC2 Auto
  /// Scaling groups.
  ///
  /// Parameter [autoScalingPolicy] :
  /// Configuration settings to define a scaling policy for the Auto Scaling
  /// group that is optimized for game hosting. The scaling policy uses the
  /// metric <code>"PercentUtilizedGameServers"</code> to maintain a buffer of
  /// idle game servers that can immediately accommodate new games and players.
  /// After the Auto Scaling group is created, update this value directly in the
  /// Auto Scaling group using the AWS console or APIs.
  ///
  /// Parameter [balancingStrategy] :
  /// Indicates how GameLift FleetIQ balances the use of Spot Instances and
  /// On-Demand Instances in the game server group. Method options include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>SPOT_ONLY</code> - Only Spot Instances are used in the game server
  /// group. If Spot Instances are unavailable or not viable for game hosting,
  /// the game server group provides no hosting capacity until Spot Instances
  /// can again be used. Until then, no new instances are started, and the
  /// existing nonviable Spot Instances are terminated (after current gameplay
  /// ends) and are not replaced.
  /// </li>
  /// <li>
  /// <code>SPOT_PREFERRED</code> - (default value) Spot Instances are used
  /// whenever available in the game server group. If Spot Instances are
  /// unavailable, the game server group continues to provide hosting capacity
  /// by falling back to On-Demand Instances. Existing nonviable Spot Instances
  /// are terminated (after current gameplay ends) and are replaced with new
  /// On-Demand Instances.
  /// </li>
  /// <li>
  /// <code>ON_DEMAND_ONLY</code> - Only On-Demand Instances are used in the
  /// game server group. No Spot Instances are used, even when available, while
  /// this balancing strategy is in force.
  /// </li>
  /// </ul>
  ///
  /// Parameter [gameServerProtectionPolicy] :
  /// A flag that indicates whether instances in the game server group are
  /// protected from early termination. Unprotected instances that have active
  /// game servers running might be terminated during a scale-down event,
  /// causing players to be dropped from the game. Protected instances cannot be
  /// terminated while there are active game servers running except in the event
  /// of a forced game server group deletion (see ). An exception to this is
  /// with Spot Instances, which can be terminated by AWS regardless of
  /// protection status. This property is set to <code>NO_PROTECTION</code> by
  /// default.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new game server group resource. Tags are
  /// developer-defined key-value pairs. Tagging AWS resources is useful for
  /// resource management, access management, and cost allocation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging AWS Resources</a> in the <i>AWS General Reference</i>. Once the
  /// resource is created, you can use <a>TagResource</a>, <a>UntagResource</a>,
  /// and <a>ListTagsForResource</a> to add, remove, and view tags,
  /// respectively. The maximum tag limit may be lower than stated. See the AWS
  /// General Reference for actual tagging limits.
  ///
  /// Parameter [vpcSubnets] :
  /// A list of virtual private cloud (VPC) subnets to use with instances in the
  /// game server group. By default, all GameLift FleetIQ-supported Availability
  /// Zones are used. You can use this parameter to specify VPCs that you've set
  /// up. This property cannot be updated after the game server group is
  /// created, and the corresponding Auto Scaling group will always use the
  /// property value that is set with this request, even if the Auto Scaling
  /// group is updated directly.
  Future<CreateGameServerGroupOutput> createGameServerGroup({
    @_s.required String gameServerGroupName,
    @_s.required List<InstanceDefinition> instanceDefinitions,
    @_s.required LaunchTemplateSpecification launchTemplate,
    @_s.required int maxSize,
    @_s.required int minSize,
    @_s.required String roleArn,
    GameServerGroupAutoScalingPolicy autoScalingPolicy,
    BalancingStrategy balancingStrategy,
    GameServerProtectionPolicy gameServerProtectionPolicy,
    List<Tag> tags,
    List<String> vpcSubnets,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceDefinitions, 'instanceDefinitions');
    ArgumentError.checkNotNull(launchTemplate, 'launchTemplate');
    ArgumentError.checkNotNull(maxSize, 'maxSize');
    _s.validateNumRange(
      'maxSize',
      maxSize,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(minSize, 'minSize');
    _s.validateNumRange(
      'minSize',
      minSize,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:.*:role\/[\w+=,.@-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateGameServerGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        'InstanceDefinitions': instanceDefinitions,
        'LaunchTemplate': launchTemplate,
        'MaxSize': maxSize,
        'MinSize': minSize,
        'RoleArn': roleArn,
        if (autoScalingPolicy != null) 'AutoScalingPolicy': autoScalingPolicy,
        if (balancingStrategy != null)
          'BalancingStrategy': balancingStrategy.toValue(),
        if (gameServerProtectionPolicy != null)
          'GameServerProtectionPolicy': gameServerProtectionPolicy.toValue(),
        if (tags != null) 'Tags': tags,
        if (vpcSubnets != null) 'VpcSubnets': vpcSubnets,
      },
    );

    return CreateGameServerGroupOutput.fromJson(jsonResponse.body);
  }

  /// Creates a multiplayer game session for players. This operation creates a
  /// game session record and assigns an available server process in the
  /// specified fleet to host the game session. A fleet must have an
  /// <code>ACTIVE</code> status before a game session can be created in it.
  ///
  /// To create a game session, specify either fleet ID or alias ID and indicate
  /// a maximum number of players to allow in the game session. You can also
  /// provide a name and game-specific properties for this game session. If
  /// successful, a <a>GameSession</a> object is returned containing the game
  /// session properties and other settings you specified.
  ///
  /// <b>Idempotency tokens.</b> You can add a token that uniquely identifies
  /// game session requests. This is useful for ensuring that game session
  /// requests are idempotent. Multiple requests with the same idempotency token
  /// are processed only once; subsequent requests return the original result.
  /// All response values are the same with the exception of game session
  /// status, which may change.
  ///
  /// <b>Resource creation limits.</b> If you are creating a game session on a
  /// fleet with a resource creation limit policy in force, then you must
  /// specify a creator ID. Without this ID, Amazon GameLift has no way to
  /// evaluate the policy for this new game session request.
  ///
  /// <b>Player acceptance policy.</b> By default, newly created game sessions
  /// are open to new players. You can restrict new player access by using
  /// <a>UpdateGameSession</a> to change the game session's player session
  /// creation policy.
  ///
  /// <b>Game session logs.</b> Logs are retained for all active game sessions
  /// for 14 days. To access the logs, call <a>GetGameSessionLogUrl</a> to
  /// download the log files.
  ///
  /// <i>Available in Amazon GameLift Local.</i>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSession</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionDetails</a>
  /// </li>
  /// <li>
  /// <a>SearchGameSessions</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSession</a>
  /// </li>
  /// <li>
  /// <a>GetGameSessionLogUrl</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServiceException].
  /// May throw [UnauthorizedException].
  /// May throw [InvalidFleetStatusException].
  /// May throw [TerminalRoutingStrategyException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [FleetCapacityExceededException].
  /// May throw [LimitExceededException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [maximumPlayerSessionCount] :
  /// The maximum number of players that can be connected simultaneously to the
  /// game session.
  ///
  /// Parameter [aliasId] :
  /// A unique identifier for an alias associated with the fleet to create a
  /// game session in. You can use either the alias ID or ARN value. Each
  /// request must reference either a fleet ID or alias ID, but not both.
  ///
  /// Parameter [creatorId] :
  /// A unique identifier for a player or entity creating the game session. This
  /// ID is used to enforce a resource protection policy (if one exists) that
  /// limits the number of concurrent active game sessions one player can have.
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to create a game session in. You can use
  /// either the fleet ID or ARN value. Each request must reference either a
  /// fleet ID or alias ID, but not both.
  ///
  /// Parameter [gameProperties] :
  /// Set of custom properties for a game session, formatted as key:value pairs.
  /// These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  ///
  /// Parameter [gameSessionData] :
  /// Set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the <a>GameSession</a>
  /// object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  ///
  /// Parameter [gameSessionId] :
  /// <i>This parameter is no longer preferred. Please use
  /// <code>IdempotencyToken</code> instead.</i> Custom string that uniquely
  /// identifies a request for a new game session. Maximum token length is 48
  /// characters. If provided, this string is included in the new game session's
  /// ID. (A game session ARN has the following format:
  /// <code>arn:aws:gamelift:&lt;region&gt;::gamesession/&lt;fleet
  /// ID&gt;/&lt;custom ID string or idempotency token&gt;</code>.)
  ///
  /// Parameter [idempotencyToken] :
  /// Custom string that uniquely identifies a request for a new game session.
  /// Maximum token length is 48 characters. If provided, this string is
  /// included in the new game session's ID. (A game session ARN has the
  /// following format:
  /// <code>arn:aws:gamelift:&lt;region&gt;::gamesession/&lt;fleet
  /// ID&gt;/&lt;custom ID string or idempotency token&gt;</code>.) Idempotency
  /// tokens remain in use for 30 days after a game session has ended; game
  /// session objects are retained for this time period and then deleted.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a game session. Session names
  /// do not need to be unique.
  Future<CreateGameSessionOutput> createGameSession({
    @_s.required int maximumPlayerSessionCount,
    String aliasId,
    String creatorId,
    String fleetId,
    List<GameProperty> gameProperties,
    String gameSessionData,
    String gameSessionId,
    String idempotencyToken,
    String name,
  }) async {
    ArgumentError.checkNotNull(
        maximumPlayerSessionCount, 'maximumPlayerSessionCount');
    _s.validateNumRange(
      'maximumPlayerSessionCount',
      maximumPlayerSessionCount,
      0,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^alias-\S+|^arn:.*:alias\/alias-\S+''',
    );
    _s.validateStringLength(
      'creatorId',
      creatorId,
      1,
      1024,
    );
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
    );
    _s.validateStringLength(
      'gameSessionData',
      gameSessionData,
      1,
      4096,
    );
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      48,
    );
    _s.validateStringPattern(
      'gameSessionId',
      gameSessionId,
      r'''[a-zA-Z0-9-]+''',
    );
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      48,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[a-zA-Z0-9-]+''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateGameSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaximumPlayerSessionCount': maximumPlayerSessionCount,
        if (aliasId != null) 'AliasId': aliasId,
        if (creatorId != null) 'CreatorId': creatorId,
        if (fleetId != null) 'FleetId': fleetId,
        if (gameProperties != null) 'GameProperties': gameProperties,
        if (gameSessionData != null) 'GameSessionData': gameSessionData,
        if (gameSessionId != null) 'GameSessionId': gameSessionId,
        if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
        if (name != null) 'Name': name,
      },
    );

    return CreateGameSessionOutput.fromJson(jsonResponse.body);
  }

  /// Establishes a new queue for processing requests to place new game
  /// sessions. A queue identifies where new game sessions can be hosted -- by
  /// specifying a list of destinations (fleets or aliases) -- and how long
  /// requests can wait in the queue before timing out. You can set up a queue
  /// to try to place game sessions on fleets in multiple Regions. To add
  /// placement requests to a queue, call <a>StartGameSessionPlacement</a> and
  /// reference the queue name.
  ///
  /// <b>Destination order.</b> When processing a request for a game session,
  /// Amazon GameLift tries each destination in order until it finds one with
  /// available resources to host the new game session. A queue's default order
  /// is determined by how destinations are listed. The default order is
  /// overridden when a game session placement request provides player latency
  /// information. Player latency information enables Amazon GameLift to
  /// prioritize destinations where players report the lowest average latency,
  /// as a result placing the new game session where the majority of players
  /// will have the best possible gameplay experience.
  ///
  /// <b>Player latency policies.</b> For placement requests containing player
  /// latency information, use player latency policies to protect individual
  /// players from very high latencies. With a latency cap, even when a
  /// destination can deliver a low latency for most players, the game is not
  /// placed where any individual player is reporting latency higher than a
  /// policy's maximum. A queue can have multiple latency policies, which are
  /// enforced consecutively starting with the policy with the lowest latency
  /// cap. Use multiple policies to gradually relax latency controls; for
  /// example, you might set a policy with a low latency cap for the first 60
  /// seconds, a second policy with a higher cap for the next 60 seconds, etc.
  ///
  /// To create a new queue, provide a name, timeout value, a list of
  /// destinations and, if desired, a set of latency policies. If successful, a
  /// new queue object is returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-design.html">
  /// Design a Game Session Queue</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-creating.html">
  /// Create a Game Session Queue</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSessionQueue</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionQueues</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSessionQueue</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameSessionQueue</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with game session queue. Queue
  /// names must be unique within each Region.
  ///
  /// Parameter [destinations] :
  /// A list of fleets that can be used to fulfill game session placement
  /// requests in the queue. Fleets are identified by either a fleet ARN or a
  /// fleet alias ARN. Destinations are listed in default preference order.
  ///
  /// Parameter [playerLatencyPolicies] :
  /// A collection of latency policies to apply when processing game sessions
  /// placement requests with player latency information. Multiple policies are
  /// evaluated in order of the maximum latency value, starting with the lowest
  /// latency values. With just one policy, the policy is enforced at the start
  /// of the game session placement for the duration period. With multiple
  /// policies, each policy is enforced consecutively for its duration period.
  /// For example, a queue might enforce a 60-second policy followed by a
  /// 120-second policy, and then no policy for the remainder of the placement.
  /// A player latency policy must set a value for
  /// <code>MaximumIndividualPlayerLatencyMilliseconds</code>. If none is set,
  /// this API request fails.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new game session queue resource. Tags
  /// are developer-defined key-value pairs. Tagging AWS resources are useful
  /// for resource management, access management and cost allocation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging AWS Resources</a> in the <i>AWS General Reference</i>. Once the
  /// resource is created, you can use <a>TagResource</a>, <a>UntagResource</a>,
  /// and <a>ListTagsForResource</a> to add, remove, and view tags. The maximum
  /// tag limit may be lower than stated. See the AWS General Reference for
  /// actual tagging limits.
  ///
  /// Parameter [timeoutInSeconds] :
  /// The maximum time, in seconds, that a new game session placement request
  /// remains in the queue. When a request exceeds this time, the game session
  /// placement changes to a <code>TIMED_OUT</code> status.
  Future<CreateGameSessionQueueOutput> createGameSessionQueue({
    @_s.required String name,
    List<GameSessionQueueDestination> destinations,
    List<PlayerLatencyPolicy> playerLatencyPolicies,
    List<Tag> tags,
    int timeoutInSeconds,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'timeoutInSeconds',
      timeoutInSeconds,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateGameSessionQueue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (destinations != null) 'Destinations': destinations,
        if (playerLatencyPolicies != null)
          'PlayerLatencyPolicies': playerLatencyPolicies,
        if (tags != null) 'Tags': tags,
        if (timeoutInSeconds != null) 'TimeoutInSeconds': timeoutInSeconds,
      },
    );

    return CreateGameSessionQueueOutput.fromJson(jsonResponse.body);
  }

  /// Defines a new matchmaking configuration for use with FlexMatch. Whether
  /// your are using FlexMatch with GameLift hosting or as a standalone
  /// matchmaking service, the matchmaking configuration sets out rules for
  /// matching players and forming teams. If you're also using GameLift hosting,
  /// it defines how to start game sessions for each match. Your matchmaking
  /// system can use multiple configurations to handle different game scenarios.
  /// All matchmaking requests (<a>StartMatchmaking</a> or
  /// <a>StartMatchBackfill</a>) identify the matchmaking configuration to use
  /// and provide player attributes consistent with that configuration.
  ///
  /// To create a matchmaking configuration, you must provide the following:
  /// configuration name and FlexMatch mode (with or without GameLift hosting);
  /// a rule set that specifies how to evaluate players and find acceptable
  /// matches; whether player acceptance is required; and the maximum time
  /// allowed for a matchmaking attempt. When using FlexMatch with GameLift
  /// hosting, you also need to identify the game session queue to use when
  /// starting a game session for the match.
  ///
  /// In addition, you must set up an Amazon Simple Notification Service (SNS)
  /// to receive matchmaking notifications, and provide the topic ARN in the
  /// matchmaking configuration. An alternative method, continuously polling
  /// ticket status with <a>DescribeMatchmaking</a>, is only suitable for games
  /// in development with low matchmaking usage.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/gamelift-match.html">
  /// FlexMatch Developer Guide</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-configuration.html">
  /// Design a FlexMatch Matchmaker</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html">
  /// Set Up FlexMatch Event Notification</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingConfigurations</a>
  /// </li>
  /// <li>
  /// <a>UpdateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>CreateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingRuleSets</a>
  /// </li>
  /// <li>
  /// <a>ValidateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingRuleSet</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [acceptanceRequired] :
  /// A flag that determines whether a match that was created with this
  /// configuration must be accepted by the matched players. To require
  /// acceptance, set to <code>TRUE</code>. With this option enabled,
  /// matchmaking tickets use the status <code>REQUIRES_ACCEPTANCE</code> to
  /// indicate when a completed potential match is waiting for player
  /// acceptance.
  ///
  /// Parameter [name] :
  /// A unique identifier for a matchmaking configuration. This name is used to
  /// identify the configuration associated with a matchmaking request or
  /// ticket.
  ///
  /// Parameter [requestTimeoutSeconds] :
  /// The maximum duration, in seconds, that a matchmaking ticket can remain in
  /// process before timing out. Requests that fail due to timing out can be
  /// resubmitted as needed.
  ///
  /// Parameter [ruleSetName] :
  /// A unique identifier for a matchmaking rule set to use with this
  /// configuration. You can use either the rule set name or ARN value. A
  /// matchmaking configuration can only use rule sets that are defined in the
  /// same Region.
  ///
  /// Parameter [acceptanceTimeoutSeconds] :
  /// The length of time (in seconds) to wait for players to accept a proposed
  /// match, if acceptance is required. If any player rejects the match or fails
  /// to accept before the timeout, the tickets are returned to the ticket pool
  /// and continue to be evaluated for an acceptable match.
  ///
  /// Parameter [additionalPlayerCount] :
  /// The number of player slots in a match to keep open for future players. For
  /// example, assume that the configuration's rule set specifies a match for a
  /// single 12-person team. If the additional player count is set to 2, only 10
  /// players are initially selected for the match. This parameter is not used
  /// if <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  ///
  /// Parameter [backfillMode] :
  /// The method used to backfill game sessions that are created with this
  /// matchmaking configuration. Specify <code>MANUAL</code> when your game
  /// manages backfill requests manually or does not use the match backfill
  /// feature. Specify <code>AUTOMATIC</code> to have GameLift create a
  /// <a>StartMatchBackfill</a> request whenever a game session has one or more
  /// open slots. Learn more about manual and automatic backfill in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-backfill.html">
  /// Backfill Existing Games with FlexMatch</a>. Automatic backfill is not
  /// available when <code>FlexMatchMode</code> is set to
  /// <code>STANDALONE</code>.
  ///
  /// Parameter [customEventData] :
  /// Information to be added to all events related to this matchmaking
  /// configuration.
  ///
  /// Parameter [description] :
  /// A human-readable description of the matchmaking configuration.
  ///
  /// Parameter [flexMatchMode] :
  /// Indicates whether this matchmaking configuration is being used with
  /// GameLift hosting or as a standalone matchmaking solution.
  ///
  /// <ul>
  /// <li>
  /// <b>STANDALONE</b> - FlexMatch forms matches and returns match information,
  /// including players and team assignments, in a <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html#match-events-matchmakingsucceeded">
  /// MatchmakingSucceeded</a> event.
  /// </li>
  /// <li>
  /// <b>WITH_QUEUE</b> - FlexMatch forms matches and uses the specified
  /// GameLift queue to start a game session for the match.
  /// </li>
  /// </ul>
  ///
  /// Parameter [gameProperties] :
  /// A set of custom properties for a game session, formatted as key-value
  /// pairs. These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>). This information is added to the new
  /// <a>GameSession</a> object that is created for a successful match. This
  /// parameter is not used if <code>FlexMatchMode</code> is set to
  /// <code>STANDALONE</code>.
  ///
  /// Parameter [gameSessionData] :
  /// A set of custom game session properties, formatted as a single string
  /// value. This data is passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>). This information is added to the new
  /// <a>GameSession</a> object that is created for a successful match. This
  /// parameter is not used if <code>FlexMatchMode</code> is set to
  /// <code>STANDALONE</code>.
  ///
  /// Parameter [gameSessionQueueArns] :
  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a GameLift game session queue resource and uniquely
  /// identifies it. ARNs are unique across all Regions. Queues can be located
  /// in any Region. Queues are used to start new GameLift-hosted game sessions
  /// for matches that are created with this matchmaking configuration. If
  /// <code>FlexMatchMode</code> is set to <code>STANDALONE</code>, do not set
  /// this parameter.
  ///
  /// Parameter [notificationTarget] :
  /// An SNS topic ARN that is set up to receive matchmaking notifications.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new matchmaking configuration resource.
  /// Tags are developer-defined key-value pairs. Tagging AWS resources are
  /// useful for resource management, access management and cost allocation. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging AWS Resources</a> in the <i>AWS General Reference</i>. Once the
  /// resource is created, you can use <a>TagResource</a>, <a>UntagResource</a>,
  /// and <a>ListTagsForResource</a> to add, remove, and view tags. The maximum
  /// tag limit may be lower than stated. See the AWS General Reference for
  /// actual tagging limits.
  Future<CreateMatchmakingConfigurationOutput> createMatchmakingConfiguration({
    @_s.required bool acceptanceRequired,
    @_s.required String name,
    @_s.required int requestTimeoutSeconds,
    @_s.required String ruleSetName,
    int acceptanceTimeoutSeconds,
    int additionalPlayerCount,
    BackfillMode backfillMode,
    String customEventData,
    String description,
    FlexMatchMode flexMatchMode,
    List<GameProperty> gameProperties,
    String gameSessionData,
    List<String> gameSessionQueueArns,
    String notificationTarget,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(acceptanceRequired, 'acceptanceRequired');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-\.]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(requestTimeoutSeconds, 'requestTimeoutSeconds');
    _s.validateNumRange(
      'requestTimeoutSeconds',
      requestTimeoutSeconds,
      1,
      43200,
      isRequired: true,
    );
    ArgumentError.checkNotNull(ruleSetName, 'ruleSetName');
    _s.validateStringLength(
      'ruleSetName',
      ruleSetName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleSetName',
      ruleSetName,
      r'''[a-zA-Z0-9-\.]*|^arn:.*:matchmakingruleset\/[a-zA-Z0-9-\.]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'acceptanceTimeoutSeconds',
      acceptanceTimeoutSeconds,
      1,
      600,
    );
    _s.validateNumRange(
      'additionalPlayerCount',
      additionalPlayerCount,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'customEventData',
      customEventData,
      0,
      256,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'gameSessionData',
      gameSessionData,
      1,
      4096,
    );
    _s.validateStringLength(
      'notificationTarget',
      notificationTarget,
      0,
      300,
    );
    _s.validateStringPattern(
      'notificationTarget',
      notificationTarget,
      r'''[a-zA-Z0-9:_/-]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateMatchmakingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceptanceRequired': acceptanceRequired,
        'Name': name,
        'RequestTimeoutSeconds': requestTimeoutSeconds,
        'RuleSetName': ruleSetName,
        if (acceptanceTimeoutSeconds != null)
          'AcceptanceTimeoutSeconds': acceptanceTimeoutSeconds,
        if (additionalPlayerCount != null)
          'AdditionalPlayerCount': additionalPlayerCount,
        if (backfillMode != null) 'BackfillMode': backfillMode.toValue(),
        if (customEventData != null) 'CustomEventData': customEventData,
        if (description != null) 'Description': description,
        if (flexMatchMode != null) 'FlexMatchMode': flexMatchMode.toValue(),
        if (gameProperties != null) 'GameProperties': gameProperties,
        if (gameSessionData != null) 'GameSessionData': gameSessionData,
        if (gameSessionQueueArns != null)
          'GameSessionQueueArns': gameSessionQueueArns,
        if (notificationTarget != null)
          'NotificationTarget': notificationTarget,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateMatchmakingConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new rule set for FlexMatch matchmaking. A rule set describes the
  /// type of match to create, such as the number and size of teams. It also
  /// sets the parameters for acceptable player matches, such as minimum skill
  /// level or character type. A rule set is used by a
  /// <a>MatchmakingConfiguration</a>.
  ///
  /// To create a matchmaking rule set, provide unique rule set name and the
  /// rule set body in JSON format. Rule sets must be defined in the same Region
  /// as the matchmaking configuration they are used with.
  ///
  /// Since matchmaking rule sets cannot be edited, it is a good idea to check
  /// the rule set syntax using <a>ValidateMatchmakingRuleSet</a> before
  /// creating a new rule set.
  ///
  /// <b>Learn more</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html">Build
  /// a Rule Set</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-configuration.html">Design
  /// a Matchmaker</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-intro.html">Matchmaking
  /// with FlexMatch</a>
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingConfigurations</a>
  /// </li>
  /// <li>
  /// <a>UpdateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>CreateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingRuleSets</a>
  /// </li>
  /// <li>
  /// <a>ValidateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingRuleSet</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [name] :
  /// A unique identifier for a matchmaking rule set. A matchmaking
  /// configuration identifies the rule set it uses by this name value. Note
  /// that the rule set name is different from the optional <code>name</code>
  /// field in the rule set body.
  ///
  /// Parameter [ruleSetBody] :
  /// A collection of matchmaking rules, formatted as a JSON string. Comments
  /// are not allowed in JSON, but most elements support a description field.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new matchmaking rule set resource. Tags
  /// are developer-defined key-value pairs. Tagging AWS resources are useful
  /// for resource management, access management and cost allocation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging AWS Resources</a> in the <i>AWS General Reference</i>. Once the
  /// resource is created, you can use <a>TagResource</a>, <a>UntagResource</a>,
  /// and <a>ListTagsForResource</a> to add, remove, and view tags. The maximum
  /// tag limit may be lower than stated. See the AWS General Reference for
  /// actual tagging limits.
  Future<CreateMatchmakingRuleSetOutput> createMatchmakingRuleSet({
    @_s.required String name,
    @_s.required String ruleSetBody,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-\.]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(ruleSetBody, 'ruleSetBody');
    _s.validateStringLength(
      'ruleSetBody',
      ruleSetBody,
      1,
      65535,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateMatchmakingRuleSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'RuleSetBody': ruleSetBody,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateMatchmakingRuleSetOutput.fromJson(jsonResponse.body);
  }

  /// Reserves an open player slot in an active game session. Before a player
  /// can be added, a game session must have an <code>ACTIVE</code> status, have
  /// a creation policy of <code>ALLOW_ALL</code>, and have an open player slot.
  /// To add a group of players to a game session, use
  /// <a>CreatePlayerSessions</a>. When the player connects to the game server
  /// and references a player session ID, the game server contacts the Amazon
  /// GameLift service to validate the player reservation and accept the player.
  ///
  /// To create a player session, specify a game session ID, player ID, and
  /// optionally a string of player data. If successful, a slot is reserved in
  /// the game session for the player and a new <a>PlayerSession</a> object is
  /// returned. Player sessions cannot be updated.
  ///
  /// <i>Available in Amazon GameLift Local.</i>
  ///
  /// <ul>
  /// <li>
  /// <a>CreatePlayerSession</a>
  /// </li>
  /// <li>
  /// <a>CreatePlayerSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribePlayerSessions</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [UnauthorizedException].
  /// May throw [InvalidGameSessionStatusException].
  /// May throw [GameSessionFullException].
  /// May throw [TerminalRoutingStrategyException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [gameSessionId] :
  /// A unique identifier for the game session to add a player to.
  ///
  /// Parameter [playerId] :
  /// A unique identifier for a player. Player IDs are developer-defined.
  ///
  /// Parameter [playerData] :
  /// Developer-defined information related to a player. Amazon GameLift does
  /// not use this data, so it can be formatted as needed for use in the game.
  Future<CreatePlayerSessionOutput> createPlayerSession({
    @_s.required String gameSessionId,
    @_s.required String playerId,
    String playerData,
  }) async {
    ArgumentError.checkNotNull(gameSessionId, 'gameSessionId');
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameSessionId',
      gameSessionId,
      r'''[a-zA-Z0-9:/-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(playerId, 'playerId');
    _s.validateStringLength(
      'playerId',
      playerId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'playerData',
      playerData,
      1,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreatePlayerSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameSessionId': gameSessionId,
        'PlayerId': playerId,
        if (playerData != null) 'PlayerData': playerData,
      },
    );

    return CreatePlayerSessionOutput.fromJson(jsonResponse.body);
  }

  /// Reserves open slots in a game session for a group of players. Before
  /// players can be added, a game session must have an <code>ACTIVE</code>
  /// status, have a creation policy of <code>ALLOW_ALL</code>, and have an open
  /// player slot. To add a single player to a game session, use
  /// <a>CreatePlayerSession</a>. When a player connects to the game server and
  /// references a player session ID, the game server contacts the Amazon
  /// GameLift service to validate the player reservation and accept the player.
  ///
  /// To create player sessions, specify a game session ID, a list of player
  /// IDs, and optionally a set of player data strings. If successful, a slot is
  /// reserved in the game session for each player and a set of new
  /// <a>PlayerSession</a> objects is returned. Player sessions cannot be
  /// updated.
  ///
  /// <i>Available in Amazon GameLift Local.</i>
  ///
  /// <ul>
  /// <li>
  /// <a>CreatePlayerSession</a>
  /// </li>
  /// <li>
  /// <a>CreatePlayerSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribePlayerSessions</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [UnauthorizedException].
  /// May throw [InvalidGameSessionStatusException].
  /// May throw [GameSessionFullException].
  /// May throw [TerminalRoutingStrategyException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [gameSessionId] :
  /// A unique identifier for the game session to add players to.
  ///
  /// Parameter [playerIds] :
  /// List of unique identifiers for the players to be added.
  ///
  /// Parameter [playerDataMap] :
  /// Map of string pairs, each specifying a player ID and a set of
  /// developer-defined information related to the player. Amazon GameLift does
  /// not use this data, so it can be formatted as needed for use in the game.
  /// Player data strings for player IDs not included in the
  /// <code>PlayerIds</code> parameter are ignored.
  Future<CreatePlayerSessionsOutput> createPlayerSessions({
    @_s.required String gameSessionId,
    @_s.required List<String> playerIds,
    Map<String, String> playerDataMap,
  }) async {
    ArgumentError.checkNotNull(gameSessionId, 'gameSessionId');
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameSessionId',
      gameSessionId,
      r'''[a-zA-Z0-9:/-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(playerIds, 'playerIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreatePlayerSessions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameSessionId': gameSessionId,
        'PlayerIds': playerIds,
        if (playerDataMap != null) 'PlayerDataMap': playerDataMap,
      },
    );

    return CreatePlayerSessionsOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new script record for your Realtime Servers script. Realtime
  /// scripts are JavaScript that provide configuration settings and optional
  /// custom game logic for your game. The script is deployed when you create a
  /// Realtime Servers fleet to host your game sessions. Script logic is
  /// executed during an active game session.
  ///
  /// To create a new script record, specify a script name and provide the
  /// script file(s). The script files and all dependencies must be zipped into
  /// a single file. You can pull the zip file from either of these locations:
  ///
  /// <ul>
  /// <li>
  /// A locally available directory. Use the <i>ZipFile</i> parameter for this
  /// option.
  /// </li>
  /// <li>
  /// An Amazon Simple Storage Service (Amazon S3) bucket under your AWS
  /// account. Use the <i>StorageLocation</i> parameter for this option. You'll
  /// need to have an Identity Access Management (IAM) role that allows the
  /// Amazon GameLift service to access your S3 bucket.
  /// </li>
  /// </ul>
  /// If the call is successful, a new script record is created with a unique
  /// script ID. If the script file is provided as a local file, the file is
  /// uploaded to an Amazon GameLift-owned S3 bucket and the script record's
  /// storage location reflects this location. If the script file is provided as
  /// an S3 bucket, Amazon GameLift accesses the file at this storage location
  /// as needed for deployment.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html">Amazon
  /// GameLift Realtime Servers</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/setting-up-role.html">Set
  /// Up a Role for Amazon GameLift Access</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateScript</a>
  /// </li>
  /// <li>
  /// <a>ListScripts</a>
  /// </li>
  /// <li>
  /// <a>DescribeScript</a>
  /// </li>
  /// <li>
  /// <a>UpdateScript</a>
  /// </li>
  /// <li>
  /// <a>DeleteScript</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [ConflictException].
  /// May throw [TaggingFailedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a script. Script names do not
  /// need to be unique. You can use <a>UpdateScript</a> to change this value
  /// later.
  ///
  /// Parameter [storageLocation] :
  /// The Amazon S3 location of your Realtime scripts. The storage location must
  /// specify the S3 bucket name, the zip file name (the "key"), and an IAM role
  /// ARN that allows Amazon GameLift to access the S3 storage location. The S3
  /// bucket must be in the same Region where you are creating a new script. By
  /// default, Amazon GameLift uploads the latest version of the zip file; if
  /// you have S3 object versioning turned on, you can use the
  /// <code>ObjectVersion</code> parameter to specify an earlier version. To
  /// call this operation with a storage location, you must have IAM PassRole
  /// permission. For more details on IAM roles and PassRole permissions, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/setting-up-role.html">
  /// Set up a role for GameLift access</a>.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new script resource. Tags are
  /// developer-defined key-value pairs. Tagging AWS resources are useful for
  /// resource management, access management and cost allocation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging AWS Resources</a> in the <i>AWS General Reference</i>. Once the
  /// resource is created, you can use <a>TagResource</a>, <a>UntagResource</a>,
  /// and <a>ListTagsForResource</a> to add, remove, and view tags. The maximum
  /// tag limit may be lower than stated. See the AWS General Reference for
  /// actual tagging limits.
  ///
  /// Parameter [version] :
  /// The version that is associated with a build or script. Version strings do
  /// not need to be unique. You can use <a>UpdateScript</a> to change this
  /// value later.
  ///
  /// Parameter [zipFile] :
  /// A data object containing your Realtime scripts and dependencies as a zip
  /// file. The zip file can have one or multiple files. Maximum size of a zip
  /// file is 5 MB.
  ///
  /// When using the AWS CLI tool to create a script, this parameter is set to
  /// the zip file name. It must be prepended with the string "fileb://" to
  /// indicate that the file data is a binary object. For example:
  /// <code>--zip-file fileb://myRealtimeScript.zip</code>.
  Future<CreateScriptOutput> createScript({
    String name,
    S3Location storageLocation,
    List<Tag> tags,
    String version,
    Uint8List zipFile,
  }) async {
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
    );
    _s.validateStringLength(
      'version',
      version,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateScript'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (name != null) 'Name': name,
        if (storageLocation != null) 'StorageLocation': storageLocation,
        if (tags != null) 'Tags': tags,
        if (version != null) 'Version': version,
        if (zipFile != null) 'ZipFile': base64Encode(zipFile),
      },
    );

    return CreateScriptOutput.fromJson(jsonResponse.body);
  }

  /// Requests authorization to create or delete a peer connection between the
  /// VPC for your Amazon GameLift fleet and a virtual private cloud (VPC) in
  /// your AWS account. VPC peering enables the game servers on your fleet to
  /// communicate directly with other AWS resources. Once you've received
  /// authorization, call <a>CreateVpcPeeringConnection</a> to establish the
  /// peering connection. For more information, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with Amazon GameLift Fleets</a>.
  ///
  /// You can peer with VPCs that are owned by any AWS account you have access
  /// to, including the account that you use to manage your Amazon GameLift
  /// fleets. You cannot peer with VPCs that are in different Regions.
  ///
  /// To request authorization to create a connection, call this operation from
  /// the AWS account with the VPC that you want to peer to your Amazon GameLift
  /// fleet. For example, to enable your game servers to retrieve data from a
  /// DynamoDB table, use the account that manages that DynamoDB resource.
  /// Identify the following values: (1) The ID of the VPC that you want to peer
  /// with, and (2) the ID of the AWS account that you use to manage Amazon
  /// GameLift. If successful, VPC peering is authorized for the specified VPC.
  ///
  /// To request authorization to delete a connection, call this operation from
  /// the AWS account with the VPC that is peered with your Amazon GameLift
  /// fleet. Identify the following values: (1) VPC ID that you want to delete
  /// the peering connection for, and (2) ID of the AWS account that you use to
  /// manage Amazon GameLift.
  ///
  /// The authorization remains valid for 24 hours unless it is canceled by a
  /// call to <a>DeleteVpcPeeringAuthorization</a>. You must create or delete
  /// the peering connection while the authorization is valid.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringAuthorizations</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>CreateVpcPeeringConnection</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringConnections</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringConnection</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameLiftAwsAccountId] :
  /// A unique identifier for the AWS account that you use to manage your Amazon
  /// GameLift fleet. You can find your Account ID in the AWS Management Console
  /// under account settings.
  ///
  /// Parameter [peerVpcId] :
  /// A unique identifier for a VPC with resources to be accessed by your Amazon
  /// GameLift fleet. The VPC must be in the same Region where your fleet is
  /// deployed. Look up a VPC ID using the <a
  /// href="https://console.aws.amazon.com/vpc/">VPC Dashboard</a> in the AWS
  /// Management Console. Learn more about VPC peering in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with Amazon GameLift Fleets</a>.
  Future<CreateVpcPeeringAuthorizationOutput> createVpcPeeringAuthorization({
    @_s.required String gameLiftAwsAccountId,
    @_s.required String peerVpcId,
  }) async {
    ArgumentError.checkNotNull(gameLiftAwsAccountId, 'gameLiftAwsAccountId');
    _s.validateStringLength(
      'gameLiftAwsAccountId',
      gameLiftAwsAccountId,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(peerVpcId, 'peerVpcId');
    _s.validateStringLength(
      'peerVpcId',
      peerVpcId,
      1,
      1024,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateVpcPeeringAuthorization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameLiftAwsAccountId': gameLiftAwsAccountId,
        'PeerVpcId': peerVpcId,
      },
    );

    return CreateVpcPeeringAuthorizationOutput.fromJson(jsonResponse.body);
  }

  /// Establishes a VPC peering connection between a virtual private cloud (VPC)
  /// in an AWS account with the VPC for your Amazon GameLift fleet. VPC peering
  /// enables the game servers on your fleet to communicate directly with other
  /// AWS resources. You can peer with VPCs in any AWS account that you have
  /// access to, including the account that you use to manage your Amazon
  /// GameLift fleets. You cannot peer with VPCs that are in different Regions.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with Amazon GameLift Fleets</a>.
  ///
  /// Before calling this operation to establish the peering connection, you
  /// first need to call <a>CreateVpcPeeringAuthorization</a> and identify the
  /// VPC you want to peer with. Once the authorization for the specified VPC is
  /// issued, you have 24 hours to establish the connection. These two
  /// operations handle all tasks necessary to peer the two VPCs, including
  /// acceptance, updating routing tables, etc.
  ///
  /// To establish the connection, call this operation from the AWS account that
  /// is used to manage the Amazon GameLift fleets. Identify the following
  /// values: (1) The ID of the fleet you want to be enable a VPC peering
  /// connection for; (2) The AWS account with the VPC that you want to peer
  /// with; and (3) The ID of the VPC you want to peer with. This operation is
  /// asynchronous. If successful, a <a>VpcPeeringConnection</a> request is
  /// created. You can use continuous polling to track the request's status
  /// using <a>DescribeVpcPeeringConnections</a>, or by monitoring fleet events
  /// for success or failure using <a>DescribeFleetEvents</a>.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringAuthorizations</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>CreateVpcPeeringConnection</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringConnections</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringConnection</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet. You can use either the fleet ID or ARN
  /// value. This tells Amazon GameLift which GameLift VPC to peer with.
  ///
  /// Parameter [peerVpcAwsAccountId] :
  /// A unique identifier for the AWS account with the VPC that you want to peer
  /// your Amazon GameLift fleet with. You can find your Account ID in the AWS
  /// Management Console under account settings.
  ///
  /// Parameter [peerVpcId] :
  /// A unique identifier for a VPC with resources to be accessed by your Amazon
  /// GameLift fleet. The VPC must be in the same Region where your fleet is
  /// deployed. Look up a VPC ID using the <a
  /// href="https://console.aws.amazon.com/vpc/">VPC Dashboard</a> in the AWS
  /// Management Console. Learn more about VPC peering in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with Amazon GameLift Fleets</a>.
  Future<void> createVpcPeeringConnection({
    @_s.required String fleetId,
    @_s.required String peerVpcAwsAccountId,
    @_s.required String peerVpcId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(peerVpcAwsAccountId, 'peerVpcAwsAccountId');
    _s.validateStringLength(
      'peerVpcAwsAccountId',
      peerVpcAwsAccountId,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(peerVpcId, 'peerVpcId');
    _s.validateStringLength(
      'peerVpcId',
      peerVpcId,
      1,
      1024,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateVpcPeeringConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        'PeerVpcAwsAccountId': peerVpcAwsAccountId,
        'PeerVpcId': peerVpcId,
      },
    );

    return CreateVpcPeeringConnectionOutput.fromJson(jsonResponse.body);
  }

  /// Deletes an alias. This operation removes all record of the alias. Game
  /// clients attempting to access a server process using the deleted alias
  /// receive an error. To delete an alias, specify the alias ID to be deleted.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateAlias</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// <li>
  /// <a>DescribeAlias</a>
  /// </li>
  /// <li>
  /// <a>UpdateAlias</a>
  /// </li>
  /// <li>
  /// <a>DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a>ResolveAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [TaggingFailedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [aliasId] :
  /// A unique identifier of the alias that you want to delete. You can use
  /// either the alias ID or ARN value.
  Future<void> deleteAlias({
    @_s.required String aliasId,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^alias-\S+|^arn:.*:alias\/alias-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
      },
    );
  }

  /// Deletes a build. This operation permanently deletes the build resource and
  /// any uploaded build files. Deleting a build does not affect the status of
  /// any active fleets using the build, but you can no longer create new fleets
  /// with the deleted build.
  ///
  /// To delete a build, specify the build ID.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html">
  /// Upload a Custom Server Build</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateBuild</a>
  /// </li>
  /// <li>
  /// <a>ListBuilds</a>
  /// </li>
  /// <li>
  /// <a>DescribeBuild</a>
  /// </li>
  /// <li>
  /// <a>UpdateBuild</a>
  /// </li>
  /// <li>
  /// <a>DeleteBuild</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [TaggingFailedException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [buildId] :
  /// A unique identifier for a build to delete. You can use either the build ID
  /// or ARN value.
  Future<void> deleteBuild({
    @_s.required String buildId,
  }) async {
    ArgumentError.checkNotNull(buildId, 'buildId');
    _s.validateStringPattern(
      'buildId',
      buildId,
      r'''^build-\S+|^arn:.*:build\/build-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteBuild'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BuildId': buildId,
      },
    );
  }

  /// Deletes everything related to a fleet. Before deleting a fleet, you must
  /// set the fleet's desired capacity to zero. See <a>UpdateFleetCapacity</a>.
  ///
  /// If the fleet being deleted has a VPC peering connection, you first need to
  /// get a valid authorization (good for 24 hours) by calling
  /// <a>CreateVpcPeeringAuthorization</a>. You do not need to explicitly delete
  /// the VPC peering connection--this is done as part of the delete fleet
  /// process.
  ///
  /// This operation removes the fleet and its resources. Once a fleet is
  /// deleted, you can no longer use any of the resource in that fleet.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidFleetStatusException].
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to be deleted. You can use either the
  /// fleet ID or ARN value.
  Future<void> deleteFleet({
    @_s.required String fleetId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
      },
    );
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Terminates a game server group and permanently deletes the game server
  /// group record. You have several options for how these resources are
  /// impacted when deleting the game server group. Depending on the type of
  /// delete operation selected, this operation might affect these resources:
  ///
  /// <ul>
  /// <li>
  /// The game server group
  /// </li>
  /// <li>
  /// The corresponding Auto Scaling group
  /// </li>
  /// <li>
  /// All game servers that are currently running in the group
  /// </li>
  /// </ul>
  /// To delete a game server group, identify the game server group to delete
  /// and specify the type of delete operation to initiate. Game server groups
  /// can only be deleted if they are in <code>ACTIVE</code> or
  /// <code>ERROR</code> status.
  ///
  /// If the delete request is successful, a series of operations are kicked
  /// off. The game server group status is changed to
  /// <code>DELETE_SCHEDULED</code>, which prevents new game servers from being
  /// registered and stops automatic scaling activity. Once all game servers in
  /// the game server group are deregistered, GameLift FleetIQ can begin
  /// deleting resources. If any of the delete operations fail, the game server
  /// group is placed in <code>ERROR</code> status.
  ///
  /// GameLift FleetIQ emits delete events to Amazon CloudWatch.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ListGameServerGroups</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ResumeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>SuspendGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerInstances</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group. Use either the
  /// <a>GameServerGroup</a> name or ARN value.
  ///
  /// Parameter [deleteOption] :
  /// The type of delete to perform. Options include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SAFE_DELETE</code> – (default) Terminates the game server group and
  /// EC2 Auto Scaling group only when it has no game servers that are in
  /// <code>UTILIZED</code> status.
  /// </li>
  /// <li>
  /// <code>FORCE_DELETE</code> – Terminates the game server group, including
  /// all active game servers regardless of their utilization status, and the
  /// EC2 Auto Scaling group.
  /// </li>
  /// <li>
  /// <code>RETAIN</code> – Does a safe delete of the game server group but
  /// retains the EC2 Auto Scaling group as is.
  /// </li>
  /// </ul>
  Future<DeleteGameServerGroupOutput> deleteGameServerGroup({
    @_s.required String gameServerGroupName,
    GameServerGroupDeleteOption deleteOption,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteGameServerGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        if (deleteOption != null) 'DeleteOption': deleteOption.toValue(),
      },
    );

    return DeleteGameServerGroupOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a game session queue. Once a queue is successfully deleted,
  /// unfulfilled <a>StartGameSessionPlacement</a> requests that reference the
  /// queue will fail. To delete a queue, specify the queue name.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-intro.html">
  /// Using Multi-Region Queues</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSessionQueue</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionQueues</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSessionQueue</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameSessionQueue</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with game session queue. Queue
  /// names must be unique within each Region. You can use either the queue ID
  /// or ARN value.
  Future<void> deleteGameSessionQueue({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-]+|^arn:.*:gamesessionqueue\/[a-zA-Z0-9-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteGameSessionQueue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return DeleteGameSessionQueueOutput.fromJson(jsonResponse.body);
  }

  /// Permanently removes a FlexMatch matchmaking configuration. To delete,
  /// specify the configuration name. A matchmaking configuration cannot be
  /// deleted if it is being used in any active matchmaking tickets.
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingConfigurations</a>
  /// </li>
  /// <li>
  /// <a>UpdateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>CreateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingRuleSets</a>
  /// </li>
  /// <li>
  /// <a>ValidateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingRuleSet</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [name] :
  /// A unique identifier for a matchmaking configuration. You can use either
  /// the configuration name or ARN value.
  Future<void> deleteMatchmakingConfiguration({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-\.]*|^arn:.*:matchmakingconfiguration\/[a-zA-Z0-9-\.]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteMatchmakingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return DeleteMatchmakingConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Deletes an existing matchmaking rule set. To delete the rule set, provide
  /// the rule set name. Rule sets cannot be deleted if they are currently being
  /// used by a matchmaking configuration.
  ///
  /// <b>Learn more</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html">Build
  /// a Rule Set</a>
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingConfigurations</a>
  /// </li>
  /// <li>
  /// <a>UpdateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>CreateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingRuleSets</a>
  /// </li>
  /// <li>
  /// <a>ValidateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingRuleSet</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  /// May throw [NotFoundException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [name] :
  /// A unique identifier for a matchmaking rule set to be deleted. (Note: The
  /// rule set name is different from the optional "name" field in the rule set
  /// body.) You can use either the rule set name or ARN value.
  Future<void> deleteMatchmakingRuleSet({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-\.]*|^arn:.*:matchmakingruleset\/[a-zA-Z0-9-\.]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteMatchmakingRuleSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return DeleteMatchmakingRuleSetOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a fleet scaling policy. Once deleted, the policy is no longer in
  /// force and GameLift removes all record of it. To delete a scaling policy,
  /// specify both the scaling policy name and the fleet ID it is associated
  /// with.
  ///
  /// To temporarily suspend scaling policies, call <a>StopFleetActions</a>.
  /// This operation suspends all policies for the fleet.
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>DescribeEC2InstanceLimits</a>
  /// </li>
  /// <li>
  /// Manage scaling policies:
  ///
  /// <ul>
  /// <li>
  /// <a>PutScalingPolicy</a> (auto-scaling)
  /// </li>
  /// <li>
  /// <a>DescribeScalingPolicies</a> (auto-scaling)
  /// </li>
  /// <li>
  /// <a>DeleteScalingPolicy</a> (auto-scaling)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Manage fleet actions:
  ///
  /// <ul>
  /// <li>
  /// <a>StartFleetActions</a>
  /// </li>
  /// <li>
  /// <a>StopFleetActions</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to be deleted. You can use either the
  /// fleet ID or ARN value.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a scaling policy. Policy names
  /// do not need to be unique.
  Future<void> deleteScalingPolicy({
    @_s.required String fleetId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteScalingPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        'Name': name,
      },
    );
  }

  /// Deletes a Realtime script. This operation permanently deletes the script
  /// record. If script files were uploaded, they are also deleted (files stored
  /// in an S3 bucket are not deleted).
  ///
  /// To delete a script, specify the script ID. Before deleting a script, be
  /// sure to terminate all fleets that are deployed with the script being
  /// deleted. Fleet instances periodically check for script updates, and if the
  /// script record no longer exists, the instance will go into an error state
  /// and be unable to host game sessions.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html">Amazon
  /// GameLift Realtime Servers</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateScript</a>
  /// </li>
  /// <li>
  /// <a>ListScripts</a>
  /// </li>
  /// <li>
  /// <a>DescribeScript</a>
  /// </li>
  /// <li>
  /// <a>UpdateScript</a>
  /// </li>
  /// <li>
  /// <a>DeleteScript</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TaggingFailedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [scriptId] :
  /// A unique identifier for a Realtime script to delete. You can use either
  /// the script ID or ARN value.
  Future<void> deleteScript({
    @_s.required String scriptId,
  }) async {
    ArgumentError.checkNotNull(scriptId, 'scriptId');
    _s.validateStringPattern(
      'scriptId',
      scriptId,
      r'''^script-\S+|^arn:.*:script\/script-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteScript'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScriptId': scriptId,
      },
    );
  }

  /// Cancels a pending VPC peering authorization for the specified VPC. If you
  /// need to delete an existing VPC peering connection, call
  /// <a>DeleteVpcPeeringConnection</a>.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringAuthorizations</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>CreateVpcPeeringConnection</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringConnections</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringConnection</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameLiftAwsAccountId] :
  /// A unique identifier for the AWS account that you use to manage your Amazon
  /// GameLift fleet. You can find your Account ID in the AWS Management Console
  /// under account settings.
  ///
  /// Parameter [peerVpcId] :
  /// A unique identifier for a VPC with resources to be accessed by your Amazon
  /// GameLift fleet. The VPC must be in the same Region where your fleet is
  /// deployed. Look up a VPC ID using the <a
  /// href="https://console.aws.amazon.com/vpc/">VPC Dashboard</a> in the AWS
  /// Management Console. Learn more about VPC peering in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with Amazon GameLift Fleets</a>.
  Future<void> deleteVpcPeeringAuthorization({
    @_s.required String gameLiftAwsAccountId,
    @_s.required String peerVpcId,
  }) async {
    ArgumentError.checkNotNull(gameLiftAwsAccountId, 'gameLiftAwsAccountId');
    _s.validateStringLength(
      'gameLiftAwsAccountId',
      gameLiftAwsAccountId,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(peerVpcId, 'peerVpcId');
    _s.validateStringLength(
      'peerVpcId',
      peerVpcId,
      1,
      1024,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteVpcPeeringAuthorization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameLiftAwsAccountId': gameLiftAwsAccountId,
        'PeerVpcId': peerVpcId,
      },
    );

    return DeleteVpcPeeringAuthorizationOutput.fromJson(jsonResponse.body);
  }

  /// Removes a VPC peering connection. To delete the connection, you must have
  /// a valid authorization for the VPC peering connection that you want to
  /// delete. You can check for an authorization by calling
  /// <a>DescribeVpcPeeringAuthorizations</a> or request a new one using
  /// <a>CreateVpcPeeringAuthorization</a>.
  ///
  /// Once a valid authorization exists, call this operation from the AWS
  /// account that is used to manage the Amazon GameLift fleets. Identify the
  /// connection to delete by the connection ID and fleet ID. If successful, the
  /// connection is removed.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringAuthorizations</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>CreateVpcPeeringConnection</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringConnections</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringConnection</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet. This fleet specified must match the fleet
  /// referenced in the VPC peering connection record. You can use either the
  /// fleet ID or ARN value.
  ///
  /// Parameter [vpcPeeringConnectionId] :
  /// A unique identifier for a VPC peering connection. This value is included
  /// in the <a>VpcPeeringConnection</a> object, which can be retrieved by
  /// calling <a>DescribeVpcPeeringConnections</a>.
  Future<void> deleteVpcPeeringConnection({
    @_s.required String fleetId,
    @_s.required String vpcPeeringConnectionId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        vpcPeeringConnectionId, 'vpcPeeringConnectionId');
    _s.validateStringLength(
      'vpcPeeringConnectionId',
      vpcPeeringConnectionId,
      1,
      1024,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteVpcPeeringConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        'VpcPeeringConnectionId': vpcPeeringConnectionId,
      },
    );

    return DeleteVpcPeeringConnectionOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Removes the game server from a game server group. As a result of this
  /// operation, the deregistered game server can no longer be claimed and will
  /// not be returned in a list of active game servers.
  ///
  /// To deregister a game server, specify the game server group and game server
  /// ID. If successful, this operation emits a CloudWatch event with
  /// termination timestamp and reason.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>RegisterGameServer</a>
  /// </li>
  /// <li>
  /// <a>ListGameServers</a>
  /// </li>
  /// <li>
  /// <a>ClaimGameServer</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServer</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServer</a>
  /// </li>
  /// <li>
  /// <a>DeregisterGameServer</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group where the game server is
  /// running. Use either the <a>GameServerGroup</a> name or ARN value.
  ///
  /// Parameter [gameServerId] :
  /// A custom string that uniquely identifies the game server to deregister.
  Future<void> deregisterGameServer({
    @_s.required String gameServerGroupName,
    @_s.required String gameServerId,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(gameServerId, 'gameServerId');
    _s.validateStringLength(
      'gameServerId',
      gameServerId,
      3,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerId',
      gameServerId,
      r'''[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeregisterGameServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        'GameServerId': gameServerId,
      },
    );
  }

  /// Retrieves properties for an alias. This operation returns all alias
  /// metadata and settings. To get an alias's target fleet ID only, use
  /// <code>ResolveAlias</code>.
  ///
  /// To get alias properties, specify the alias ID. If successful, the
  /// requested alias record is returned.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateAlias</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// <li>
  /// <a>DescribeAlias</a>
  /// </li>
  /// <li>
  /// <a>UpdateAlias</a>
  /// </li>
  /// <li>
  /// <a>DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a>ResolveAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [aliasId] :
  /// The unique identifier for the fleet alias that you want to retrieve. You
  /// can use either the alias ID or ARN value.
  Future<DescribeAliasOutput> describeAlias({
    @_s.required String aliasId,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^alias-\S+|^arn:.*:alias\/alias-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
      },
    );

    return DescribeAliasOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves properties for a custom game build. To request a build resource,
  /// specify a build ID. If successful, an object containing the build
  /// properties is returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html">
  /// Upload a Custom Server Build</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateBuild</a>
  /// </li>
  /// <li>
  /// <a>ListBuilds</a>
  /// </li>
  /// <li>
  /// <a>DescribeBuild</a>
  /// </li>
  /// <li>
  /// <a>UpdateBuild</a>
  /// </li>
  /// <li>
  /// <a>DeleteBuild</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [buildId] :
  /// A unique identifier for a build to retrieve properties for. You can use
  /// either the build ID or ARN value.
  Future<DescribeBuildOutput> describeBuild({
    @_s.required String buildId,
  }) async {
    ArgumentError.checkNotNull(buildId, 'buildId');
    _s.validateStringPattern(
      'buildId',
      buildId,
      r'''^build-\S+|^arn:.*:build\/build-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeBuild'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BuildId': buildId,
      },
    );

    return DescribeBuildOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the following information for the specified EC2 instance type:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of instances allowed per AWS account (service limit).
  /// </li>
  /// <li>
  /// Current usage for the AWS account.
  /// </li>
  /// </ul>
  /// To learn more about the capabilities of each instance type, see <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a>. Note that the instance types offered may vary depending on the
  /// region.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [eC2InstanceType] :
  /// Name of an EC2 instance type that is supported in Amazon GameLift. A fleet
  /// instance type determines the computing resources of each instance in the
  /// fleet, including CPU, memory, storage, and networking capacity. Amazon
  /// GameLift supports the following EC2 instance types. See <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a> for detailed descriptions. Leave this parameter blank to
  /// retrieve limits for all types.
  Future<DescribeEC2InstanceLimitsOutput> describeEC2InstanceLimits({
    EC2InstanceType eC2InstanceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeEC2InstanceLimits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eC2InstanceType != null)
          'EC2InstanceType': eC2InstanceType.toValue(),
      },
    );

    return DescribeEC2InstanceLimitsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves core properties, including configuration, status, and metadata,
  /// for a fleet.
  ///
  /// To get attributes for one or more fleets, provide a list of fleet IDs or
  /// fleet ARNs. To get attributes for all fleets, do not specify a fleet
  /// identifier. When requesting attributes for multiple fleets, use the
  /// pagination parameters to retrieve results as a set of sequential pages. If
  /// successful, a <a>FleetAttributes</a> object is returned for each fleet
  /// requested, unless the fleet identifier is not found.
  /// <note>
  /// Some API operations may limit the number of fleet IDs allowed in one
  /// request. If a request exceeds this limit, the request fails and the error
  /// message includes the maximum allowed number.
  /// </note>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// Describe fleets:
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetPortSettings</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetUtilization</a>
  /// </li>
  /// <li>
  /// <a>DescribeRuntimeConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeEC2InstanceLimits</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetEvents</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetIds] :
  /// A list of unique fleet identifiers to retrieve attributes for. You can use
  /// either the fleet ID or ARN value. To retrieve attributes for all current
  /// fleets, do not include this parameter. If the list of fleet identifiers
  /// includes fleets that don't currently exist, the request succeeds but no
  /// attributes for that fleet are returned.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  Future<DescribeFleetAttributesOutput> describeFleetAttributes({
    List<String> fleetIds,
    int limit,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeFleetAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fleetIds != null) 'FleetIds': fleetIds,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeFleetAttributesOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the current capacity statistics for one or more fleets. These
  /// statistics present a snapshot of the fleet's instances and provide insight
  /// on current or imminent scaling activity. To get statistics on game hosting
  /// activity in the fleet, see <a>DescribeFleetUtilization</a>.
  ///
  /// You can request capacity for all fleets or specify a list of one or more
  /// fleet identifiers. When requesting multiple fleets, use the pagination
  /// parameters to retrieve results as a set of sequential pages. If
  /// successful, a <a>FleetCapacity</a> object is returned for each requested
  /// fleet ID. When a list of fleet IDs is provided, attribute objects are
  /// returned only for fleets that currently exist.
  /// <note>
  /// Some API operations may limit the number of fleet IDs allowed in one
  /// request. If a request exceeds this limit, the request fails and the error
  /// message includes the maximum allowed.
  /// </note>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html#gamelift-metrics-fleet">GameLift
  /// Metrics for Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// Describe fleets:
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetPortSettings</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetUtilization</a>
  /// </li>
  /// <li>
  /// <a>DescribeRuntimeConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeEC2InstanceLimits</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetEvents</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetIds] :
  /// A unique identifier for a fleet(s) to retrieve capacity information for.
  /// You can use either the fleet ID or ARN value.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  Future<DescribeFleetCapacityOutput> describeFleetCapacity({
    List<String> fleetIds,
    int limit,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeFleetCapacity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fleetIds != null) 'FleetIds': fleetIds,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeFleetCapacityOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves entries from the specified fleet's event log. You can specify a
  /// time range to limit the result set. Use the pagination parameters to
  /// retrieve results as a set of sequential pages. If successful, a collection
  /// of event log entries matching the request are returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// Describe fleets:
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetPortSettings</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetUtilization</a>
  /// </li>
  /// <li>
  /// <a>DescribeRuntimeConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeEC2InstanceLimits</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetEvents</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to get event logs for. You can use either
  /// the fleet ID or ARN value.
  ///
  /// Parameter [endTime] :
  /// Most recent date to retrieve event logs for. If no end time is specified,
  /// this call returns entries from the specified start time up to the present.
  /// Format is a number expressed in Unix time as milliseconds (ex:
  /// "1469498468.057").
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [startTime] :
  /// Earliest date to retrieve event logs for. If no start time is specified,
  /// this call returns entries starting from when the fleet was created to the
  /// specified end time. Format is a number expressed in Unix time as
  /// milliseconds (ex: "1469498468.057").
  Future<DescribeFleetEventsOutput> describeFleetEvents({
    @_s.required String fleetId,
    DateTime endTime,
    int limit,
    String nextToken,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeFleetEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return DescribeFleetEventsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a fleet's inbound connection permissions. Connection permissions
  /// specify the range of IP addresses and port settings that incoming traffic
  /// can use to access server processes in the fleet. Game sessions that are
  /// running on instances in the fleet use connections that fall in this range.
  ///
  /// To get a fleet's inbound connection permissions, specify the fleet's
  /// unique identifier. If successful, a collection of <a>IpPermission</a>
  /// objects is returned for the requested fleet ID. If the requested fleet has
  /// been deleted, the result set is empty.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// Describe fleets:
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetPortSettings</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetUtilization</a>
  /// </li>
  /// <li>
  /// <a>DescribeRuntimeConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeEC2InstanceLimits</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetEvents</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to retrieve port settings for. You can use
  /// either the fleet ID or ARN value.
  Future<DescribeFleetPortSettingsOutput> describeFleetPortSettings({
    @_s.required String fleetId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeFleetPortSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
      },
    );

    return DescribeFleetPortSettingsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves utilization statistics for one or more fleets. These statistics
  /// provide insight into how available hosting resources are currently being
  /// used. To get statistics on available hosting resources, see
  /// <a>DescribeFleetCapacity</a>.
  ///
  /// You can request utilization data for all fleets, or specify a list of one
  /// or more fleet IDs. When requesting multiple fleets, use the pagination
  /// parameters to retrieve results as a set of sequential pages. If
  /// successful, a <a>FleetUtilization</a> object is returned for each
  /// requested fleet ID, unless the fleet identifier is not found.
  /// <note>
  /// Some API operations may limit the number of fleet IDs allowed in one
  /// request. If a request exceeds this limit, the request fails and the error
  /// message includes the maximum allowed.
  /// </note>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html#gamelift-metrics-fleet">GameLift
  /// Metrics for Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// Describe fleets:
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetPortSettings</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetUtilization</a>
  /// </li>
  /// <li>
  /// <a>DescribeRuntimeConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeEC2InstanceLimits</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetEvents</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetIds] :
  /// A unique identifier for a fleet(s) to retrieve utilization data for. You
  /// can use either the fleet ID or ARN value. To retrieve attributes for all
  /// current fleets, do not include this parameter. If the list of fleet
  /// identifiers includes fleets that don't currently exist, the request
  /// succeeds but no attributes for that fleet are returned.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  Future<DescribeFleetUtilizationOutput> describeFleetUtilization({
    List<String> fleetIds,
    int limit,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeFleetUtilization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fleetIds != null) 'FleetIds': fleetIds,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeFleetUtilizationOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Retrieves information for a registered game server. Information includes
  /// game server status, health check info, and the instance that the game
  /// server is running on.
  ///
  /// To retrieve game server information, specify the game server ID. If
  /// successful, the requested game server object is returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>RegisterGameServer</a>
  /// </li>
  /// <li>
  /// <a>ListGameServers</a>
  /// </li>
  /// <li>
  /// <a>ClaimGameServer</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServer</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServer</a>
  /// </li>
  /// <li>
  /// <a>DeregisterGameServer</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group where the game server is
  /// running. Use either the <a>GameServerGroup</a> name or ARN value.
  ///
  /// Parameter [gameServerId] :
  /// A custom string that uniquely identifies the game server information to be
  /// retrieved.
  Future<DescribeGameServerOutput> describeGameServer({
    @_s.required String gameServerGroupName,
    @_s.required String gameServerId,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(gameServerId, 'gameServerId');
    _s.validateStringLength(
      'gameServerId',
      gameServerId,
      3,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerId',
      gameServerId,
      r'''[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeGameServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        'GameServerId': gameServerId,
      },
    );

    return DescribeGameServerOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Retrieves information on a game server group. This operation returns only
  /// properties related to GameLift FleetIQ. To view or update properties for
  /// the corresponding Auto Scaling group, such as launch template, auto
  /// scaling policies, and maximum/minimum group size, access the Auto Scaling
  /// group directly.
  ///
  /// To get attributes for a game server group, provide a group name or ARN
  /// value. If successful, a <a>GameServerGroup</a> object is returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ListGameServerGroups</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ResumeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>SuspendGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerInstances</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group. Use either the
  /// <a>GameServerGroup</a> name or ARN value.
  Future<DescribeGameServerGroupOutput> describeGameServerGroup({
    @_s.required String gameServerGroupName,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeGameServerGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
      },
    );

    return DescribeGameServerGroupOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Retrieves status information about the Amazon EC2 instances associated
  /// with a GameLift FleetIQ game server group. Use this operation to detect
  /// when instances are active or not available to host new game servers. If
  /// you are looking for instance configuration information, call
  /// <a>DescribeGameServerGroup</a> or access the corresponding Auto Scaling
  /// group properties.
  ///
  /// To request status for all instances in the game server group, provide a
  /// game server group ID only. To request status for specific instances,
  /// provide the game server group ID and one or more instance IDs. Use the
  /// pagination parameters to retrieve results in sequential segments. If
  /// successful, a collection of <code>GameServerInstance</code> objects is
  /// returned.
  ///
  /// This operation is not designed to be called with every game server claim
  /// request; this practice can cause you to exceed your API limit, which
  /// results in errors. Instead, as a best practice, cache the results and
  /// refresh your cache no more than once every 10 seconds.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ListGameServerGroups</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ResumeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>SuspendGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerInstances</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group. Use either the
  /// <a>GameServerGroup</a> name or ARN value.
  ///
  /// Parameter [instanceIds] :
  /// The EC2 instance IDs that you want to retrieve status on. EC2 instance IDs
  /// use a 17-character format, for example: <code>i-1234567890abcdef0</code>.
  /// To retrieve all instances in the game server group, leave this parameter
  /// empty.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential segments.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential segment of
  /// results. Use the token returned with the previous call to this operation.
  /// To start at the beginning of the result set, do not specify a value.
  Future<DescribeGameServerInstancesOutput> describeGameServerInstances({
    @_s.required String gameServerGroupName,
    List<String> instanceIds,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeGameServerInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        if (instanceIds != null) 'InstanceIds': instanceIds,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeGameServerInstancesOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves properties, including the protection policy in force, for one or
  /// more game sessions. This operation can be used in several ways: (1)
  /// provide a <code>GameSessionId</code> or <code>GameSessionArn</code> to
  /// request details for a specific game session; (2) provide either a
  /// <code>FleetId</code> or an <code>AliasId</code> to request properties for
  /// all game sessions running on a fleet.
  ///
  /// To get game session record(s), specify just one of the following: game
  /// session ID, fleet ID, or alias ID. You can filter this request by game
  /// session status. Use the pagination parameters to retrieve results as a set
  /// of sequential pages. If successful, a <a>GameSessionDetail</a> object is
  /// returned for each session matching the request.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSession</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionDetails</a>
  /// </li>
  /// <li>
  /// <a>SearchGameSessions</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSession</a>
  /// </li>
  /// <li>
  /// <a>GetGameSessionLogUrl</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TerminalRoutingStrategyException].
  ///
  /// Parameter [aliasId] :
  /// A unique identifier for an alias associated with the fleet to retrieve all
  /// game sessions for. You can use either the alias ID or ARN value.
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to retrieve all game sessions active on
  /// the fleet. You can use either the fleet ID or ARN value.
  ///
  /// Parameter [gameSessionId] :
  /// A unique identifier for the game session to retrieve.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [statusFilter] :
  /// Game session status to filter results on. Possible game session statuses
  /// include <code>ACTIVE</code>, <code>TERMINATED</code>,
  /// <code>ACTIVATING</code> and <code>TERMINATING</code> (the last two are
  /// transitory).
  Future<DescribeGameSessionDetailsOutput> describeGameSessionDetails({
    String aliasId,
    String fleetId,
    String gameSessionId,
    int limit,
    String nextToken,
    String statusFilter,
  }) async {
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^alias-\S+|^arn:.*:alias\/alias-\S+''',
    );
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
    );
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
    );
    _s.validateStringPattern(
      'gameSessionId',
      gameSessionId,
      r'''[a-zA-Z0-9:/-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringLength(
      'statusFilter',
      statusFilter,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeGameSessionDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (aliasId != null) 'AliasId': aliasId,
        if (fleetId != null) 'FleetId': fleetId,
        if (gameSessionId != null) 'GameSessionId': gameSessionId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (statusFilter != null) 'StatusFilter': statusFilter,
      },
    );

    return DescribeGameSessionDetailsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves properties and current status of a game session placement
  /// request. To get game session placement details, specify the placement ID.
  /// If successful, a <a>GameSessionPlacement</a> object is returned.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSession</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionDetails</a>
  /// </li>
  /// <li>
  /// <a>SearchGameSessions</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSession</a>
  /// </li>
  /// <li>
  /// <a>GetGameSessionLogUrl</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [placementId] :
  /// A unique identifier for a game session placement to retrieve.
  Future<DescribeGameSessionPlacementOutput> describeGameSessionPlacement({
    @_s.required String placementId,
  }) async {
    ArgumentError.checkNotNull(placementId, 'placementId');
    _s.validateStringLength(
      'placementId',
      placementId,
      1,
      48,
      isRequired: true,
    );
    _s.validateStringPattern(
      'placementId',
      placementId,
      r'''[a-zA-Z0-9-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeGameSessionPlacement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PlacementId': placementId,
      },
    );

    return DescribeGameSessionPlacementOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the properties for one or more game session queues. When
  /// requesting multiple queues, use the pagination parameters to retrieve
  /// results as a set of sequential pages. If successful, a
  /// <a>GameSessionQueue</a> object is returned for each requested queue. When
  /// specifying a list of queues, objects are returned only for queues that
  /// currently exist in the Region.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-console.html">
  /// View Your Queues</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSessionQueue</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionQueues</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSessionQueue</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameSessionQueue</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. You
  /// can request up to 50 results.
  ///
  /// Parameter [names] :
  /// A list of queue names to retrieve information for. You can use either the
  /// queue ID or ARN value. To request settings for all queues, leave this
  /// parameter empty.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<DescribeGameSessionQueuesOutput> describeGameSessionQueues({
    int limit,
    List<String> names,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeGameSessionQueues'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (names != null) 'Names': names,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeGameSessionQueuesOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a set of one or more game sessions. Request a specific game
  /// session or request all game sessions on a fleet. Alternatively, use
  /// <a>SearchGameSessions</a> to request a set of active game sessions that
  /// are filtered by certain criteria. To retrieve protection policy settings
  /// for game sessions, use <a>DescribeGameSessionDetails</a>.
  ///
  /// To get game sessions, specify one of the following: game session ID, fleet
  /// ID, or alias ID. You can filter this request by game session status. Use
  /// the pagination parameters to retrieve results as a set of sequential
  /// pages. If successful, a <a>GameSession</a> object is returned for each
  /// game session matching the request.
  ///
  /// <i>Available in Amazon GameLift Local.</i>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSession</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionDetails</a>
  /// </li>
  /// <li>
  /// <a>SearchGameSessions</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSession</a>
  /// </li>
  /// <li>
  /// <a>GetGameSessionLogUrl</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TerminalRoutingStrategyException].
  ///
  /// Parameter [aliasId] :
  /// A unique identifier for an alias associated with the fleet to retrieve all
  /// game sessions for. You can use either the alias ID or ARN value.
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to retrieve all game sessions for. You can
  /// use either the fleet ID or ARN value.
  ///
  /// Parameter [gameSessionId] :
  /// A unique identifier for the game session to retrieve.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [statusFilter] :
  /// Game session status to filter results on. Possible game session statuses
  /// include <code>ACTIVE</code>, <code>TERMINATED</code>,
  /// <code>ACTIVATING</code>, and <code>TERMINATING</code> (the last two are
  /// transitory).
  Future<DescribeGameSessionsOutput> describeGameSessions({
    String aliasId,
    String fleetId,
    String gameSessionId,
    int limit,
    String nextToken,
    String statusFilter,
  }) async {
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^alias-\S+|^arn:.*:alias\/alias-\S+''',
    );
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
    );
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
    );
    _s.validateStringPattern(
      'gameSessionId',
      gameSessionId,
      r'''[a-zA-Z0-9:/-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringLength(
      'statusFilter',
      statusFilter,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeGameSessions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (aliasId != null) 'AliasId': aliasId,
        if (fleetId != null) 'FleetId': fleetId,
        if (gameSessionId != null) 'GameSessionId': gameSessionId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (statusFilter != null) 'StatusFilter': statusFilter,
      },
    );

    return DescribeGameSessionsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a fleet's instances, including instance IDs.
  /// Use this operation to get details on all instances in the fleet or get
  /// details on one specific instance.
  ///
  /// To get a specific instance, specify fleet ID and instance ID. To get all
  /// instances in a fleet, specify a fleet ID only. Use the pagination
  /// parameters to retrieve results as a set of sequential pages. If
  /// successful, an <a>Instance</a> object is returned for each result.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-remote-access.html">Remotely
  /// Access Fleet Instances</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html">Debug
  /// Fleet Issues</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeInstances</a>
  /// </li>
  /// <li>
  /// <a>GetInstanceAccess</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to retrieve instance information for. You
  /// can use either the fleet ID or ARN value.
  ///
  /// Parameter [instanceId] :
  /// A unique identifier for an instance to retrieve. Specify an instance ID or
  /// leave blank to retrieve all instances in the fleet.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<DescribeInstancesOutput> describeInstances({
    @_s.required String fleetId,
    String instanceId,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''[a-zA-Z0-9\.-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        if (instanceId != null) 'InstanceId': instanceId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeInstancesOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves one or more matchmaking tickets. Use this operation to retrieve
  /// ticket information, including--after a successful match is
  /// made--connection information for the resulting new game session.
  ///
  /// To request matchmaking tickets, provide a list of up to 10 ticket IDs. If
  /// the request is successful, a ticket object is returned for each requested
  /// ID that currently exists.
  ///
  /// This operation is not designed to be continually called to track
  /// matchmaking ticket status. This practice can cause you to exceed your API
  /// limit, which results in errors. Instead, as a best practice, set up an
  /// Amazon Simple Notification Service (SNS) to receive notifications, and
  /// provide the topic ARN in the matchmaking configuration. Continuously
  /// poling ticket status with <a>DescribeMatchmaking</a> should only be used
  /// for games in development with low matchmaking usage.
  /// <p/>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-client.html">
  /// Add FlexMatch to a Game Client</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html">
  /// Set Up FlexMatch Event Notification</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>StartMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>StopMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>AcceptMatch</a>
  /// </li>
  /// <li>
  /// <a>StartMatchBackfill</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [ticketIds] :
  /// A unique identifier for a matchmaking ticket. You can include up to 10 ID
  /// values.
  Future<DescribeMatchmakingOutput> describeMatchmaking({
    @_s.required List<String> ticketIds,
  }) async {
    ArgumentError.checkNotNull(ticketIds, 'ticketIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeMatchmaking'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TicketIds': ticketIds,
      },
    );

    return DescribeMatchmakingOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the details of FlexMatch matchmaking configurations.
  ///
  /// This operation offers the following options: (1) retrieve all matchmaking
  /// configurations, (2) retrieve configurations for a specified list, or (3)
  /// retrieve all configurations that use a specified rule set name. When
  /// requesting multiple items, use the pagination parameters to retrieve
  /// results as a set of sequential pages.
  ///
  /// If successful, a configuration is returned for each requested name. When
  /// specifying a list of names, only configurations that currently exist are
  /// returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/matchmaker-build.html">
  /// Setting Up FlexMatch Matchmakers</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingConfigurations</a>
  /// </li>
  /// <li>
  /// <a>UpdateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>CreateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingRuleSets</a>
  /// </li>
  /// <li>
  /// <a>ValidateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingRuleSet</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. This
  /// parameter is limited to 10.
  ///
  /// Parameter [names] :
  /// A unique identifier for a matchmaking configuration(s) to retrieve. You
  /// can use either the configuration name or ARN value. To request all
  /// existing configurations, leave this parameter empty.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [ruleSetName] :
  /// A unique identifier for a matchmaking rule set. You can use either the
  /// rule set name or ARN value. Use this parameter to retrieve all matchmaking
  /// configurations that use this rule set.
  Future<DescribeMatchmakingConfigurationsOutput>
      describeMatchmakingConfigurations({
    int limit,
    List<String> names,
    String nextToken,
    String ruleSetName,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringLength(
      'ruleSetName',
      ruleSetName,
      1,
      256,
    );
    _s.validateStringPattern(
      'ruleSetName',
      ruleSetName,
      r'''[a-zA-Z0-9-\.]*|^arn:.*:matchmakingruleset\/[a-zA-Z0-9-\.]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeMatchmakingConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (names != null) 'Names': names,
        if (nextToken != null) 'NextToken': nextToken,
        if (ruleSetName != null) 'RuleSetName': ruleSetName,
      },
    );

    return DescribeMatchmakingConfigurationsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the details for FlexMatch matchmaking rule sets. You can request
  /// all existing rule sets for the Region, or provide a list of one or more
  /// rule set names. When requesting multiple items, use the pagination
  /// parameters to retrieve results as a set of sequential pages. If
  /// successful, a rule set is returned for each requested name.
  ///
  /// <b>Learn more</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html">Build
  /// a Rule Set</a>
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingConfigurations</a>
  /// </li>
  /// <li>
  /// <a>UpdateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>CreateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingRuleSets</a>
  /// </li>
  /// <li>
  /// <a>ValidateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingRuleSet</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [names] :
  /// A list of one or more matchmaking rule set names to retrieve details for.
  /// (Note: The rule set name is different from the optional "name" field in
  /// the rule set body.) You can use either the rule set name or ARN value.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<DescribeMatchmakingRuleSetsOutput> describeMatchmakingRuleSets({
    int limit,
    List<String> names,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      10,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeMatchmakingRuleSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (names != null) 'Names': names,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeMatchmakingRuleSetsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves properties for one or more player sessions. This operation can
  /// be used in several ways: (1) provide a <code>PlayerSessionId</code> to
  /// request properties for a specific player session; (2) provide a
  /// <code>GameSessionId</code> to request properties for all player sessions
  /// in the specified game session; (3) provide a <code>PlayerId</code> to
  /// request properties for all player sessions of a specified player.
  ///
  /// To get game session record(s), specify only one of the following: a player
  /// session ID, a game session ID, or a player ID. You can filter this request
  /// by player session status. Use the pagination parameters to retrieve
  /// results as a set of sequential pages. If successful, a
  /// <a>PlayerSession</a> object is returned for each session matching the
  /// request.
  ///
  /// <i>Available in Amazon GameLift Local.</i>
  ///
  /// <ul>
  /// <li>
  /// <a>CreatePlayerSession</a>
  /// </li>
  /// <li>
  /// <a>CreatePlayerSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribePlayerSessions</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [gameSessionId] :
  /// A unique identifier for the game session to retrieve player sessions for.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. If a
  /// player session ID is specified, this parameter is ignored.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value. If a
  /// player session ID is specified, this parameter is ignored.
  ///
  /// Parameter [playerId] :
  /// A unique identifier for a player to retrieve player sessions for.
  ///
  /// Parameter [playerSessionId] :
  /// A unique identifier for a player session to retrieve.
  ///
  /// Parameter [playerSessionStatusFilter] :
  /// Player session status to filter results on.
  ///
  /// Possible player session statuses include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>RESERVED</b> -- The player session request has been received, but the
  /// player has not yet connected to the server process and/or been validated.
  /// </li>
  /// <li>
  /// <b>ACTIVE</b> -- The player has been validated by the server process and
  /// is currently connected.
  /// </li>
  /// <li>
  /// <b>COMPLETED</b> -- The player connection has been dropped.
  /// </li>
  /// <li>
  /// <b>TIMEDOUT</b> -- A player session request was received, but the player
  /// did not connect and/or was not validated within the timeout limit (60
  /// seconds).
  /// </li>
  /// </ul>
  Future<DescribePlayerSessionsOutput> describePlayerSessions({
    String gameSessionId,
    int limit,
    String nextToken,
    String playerId,
    String playerSessionId,
    String playerSessionStatusFilter,
  }) async {
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
    );
    _s.validateStringPattern(
      'gameSessionId',
      gameSessionId,
      r'''[a-zA-Z0-9:/-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringLength(
      'playerId',
      playerId,
      1,
      1024,
    );
    _s.validateStringPattern(
      'playerSessionId',
      playerSessionId,
      r'''^psess-\S+''',
    );
    _s.validateStringLength(
      'playerSessionStatusFilter',
      playerSessionStatusFilter,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribePlayerSessions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (gameSessionId != null) 'GameSessionId': gameSessionId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (playerId != null) 'PlayerId': playerId,
        if (playerSessionId != null) 'PlayerSessionId': playerSessionId,
        if (playerSessionStatusFilter != null)
          'PlayerSessionStatusFilter': playerSessionStatusFilter,
      },
    );

    return DescribePlayerSessionsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a fleet's runtime configuration settings. The runtime
  /// configuration tells Amazon GameLift which server processes to run (and
  /// how) on each instance in the fleet.
  ///
  /// To get a runtime configuration, specify the fleet's unique identifier. If
  /// successful, a <a>RuntimeConfiguration</a> object is returned for the
  /// requested fleet. If the requested fleet has been deleted, the result set
  /// is empty.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-multiprocess.html">Running
  /// Multiple Processes on a Fleet</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// Describe fleets:
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetPortSettings</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetUtilization</a>
  /// </li>
  /// <li>
  /// <a>DescribeRuntimeConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeEC2InstanceLimits</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetEvents</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to get the runtime configuration for. You
  /// can use either the fleet ID or ARN value.
  Future<DescribeRuntimeConfigurationOutput> describeRuntimeConfiguration({
    @_s.required String fleetId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeRuntimeConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
      },
    );

    return DescribeRuntimeConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves all scaling policies applied to a fleet.
  ///
  /// To get a fleet's scaling policies, specify the fleet ID. You can filter
  /// this request by policy status, such as to retrieve only active scaling
  /// policies. Use the pagination parameters to retrieve results as a set of
  /// sequential pages. If successful, set of <a>ScalingPolicy</a> objects is
  /// returned for the fleet.
  ///
  /// A fleet may have all of its scaling policies suspended
  /// (<a>StopFleetActions</a>). This operation does not affect the status of
  /// the scaling policies, which remains ACTIVE. To see whether a fleet's
  /// scaling policies are in force or suspended, call
  /// <a>DescribeFleetAttributes</a> and check the stopped actions.
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>DescribeEC2InstanceLimits</a>
  /// </li>
  /// <li>
  /// Manage scaling policies:
  ///
  /// <ul>
  /// <li>
  /// <a>PutScalingPolicy</a> (auto-scaling)
  /// </li>
  /// <li>
  /// <a>DescribeScalingPolicies</a> (auto-scaling)
  /// </li>
  /// <li>
  /// <a>DeleteScalingPolicy</a> (auto-scaling)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Manage fleet actions:
  ///
  /// <ul>
  /// <li>
  /// <a>StartFleetActions</a>
  /// </li>
  /// <li>
  /// <a>StopFleetActions</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to retrieve scaling policies for. You can
  /// use either the fleet ID or ARN value.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [statusFilter] :
  /// Scaling policy status to filter results on. A scaling policy is only in
  /// force when in an <code>ACTIVE</code> status.
  ///
  /// <ul>
  /// <li>
  /// <b>ACTIVE</b> -- The scaling policy is currently in force.
  /// </li>
  /// <li>
  /// <b>UPDATEREQUESTED</b> -- A request to update the scaling policy has been
  /// received.
  /// </li>
  /// <li>
  /// <b>UPDATING</b> -- A change is being made to the scaling policy.
  /// </li>
  /// <li>
  /// <b>DELETEREQUESTED</b> -- A request to delete the scaling policy has been
  /// received.
  /// </li>
  /// <li>
  /// <b>DELETING</b> -- The scaling policy is being deleted.
  /// </li>
  /// <li>
  /// <b>DELETED</b> -- The scaling policy has been deleted.
  /// </li>
  /// <li>
  /// <b>ERROR</b> -- An error occurred in creating the policy. It should be
  /// removed and recreated.
  /// </li>
  /// </ul>
  Future<DescribeScalingPoliciesOutput> describeScalingPolicies({
    @_s.required String fleetId,
    int limit,
    String nextToken,
    ScalingStatusType statusFilter,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeScalingPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (statusFilter != null) 'StatusFilter': statusFilter.toValue(),
      },
    );

    return DescribeScalingPoliciesOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves properties for a Realtime script.
  ///
  /// To request a script record, specify the script ID. If successful, an
  /// object containing the script properties is returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html">Amazon
  /// GameLift Realtime Servers</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateScript</a>
  /// </li>
  /// <li>
  /// <a>ListScripts</a>
  /// </li>
  /// <li>
  /// <a>DescribeScript</a>
  /// </li>
  /// <li>
  /// <a>UpdateScript</a>
  /// </li>
  /// <li>
  /// <a>DeleteScript</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [scriptId] :
  /// A unique identifier for a Realtime script to retrieve properties for. You
  /// can use either the script ID or ARN value.
  Future<DescribeScriptOutput> describeScript({
    @_s.required String scriptId,
  }) async {
    ArgumentError.checkNotNull(scriptId, 'scriptId');
    _s.validateStringPattern(
      'scriptId',
      scriptId,
      r'''^script-\S+|^arn:.*:script\/script-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeScript'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScriptId': scriptId,
      },
    );

    return DescribeScriptOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves valid VPC peering authorizations that are pending for the AWS
  /// account. This operation returns all VPC peering authorizations and
  /// requests for peering. This includes those initiated and received by this
  /// account.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringAuthorizations</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>CreateVpcPeeringConnection</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringConnections</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringConnection</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  Future<DescribeVpcPeeringAuthorizationsOutput>
      describeVpcPeeringAuthorizations() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeVpcPeeringAuthorizations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeVpcPeeringAuthorizationsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves information on VPC peering connections. Use this operation to
  /// get peering information for all fleets or for one specific fleet ID.
  ///
  /// To retrieve connection information, call this operation from the AWS
  /// account that is used to manage the Amazon GameLift fleets. Specify a fleet
  /// ID or leave the parameter empty to retrieve all connection records. If
  /// successful, the retrieved information includes both active and pending
  /// connections. Active connections identify the IpV4 CIDR block that the VPC
  /// uses to connect.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringAuthorizations</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringAuthorization</a>
  /// </li>
  /// <li>
  /// <a>CreateVpcPeeringConnection</a>
  /// </li>
  /// <li>
  /// <a>DescribeVpcPeeringConnections</a>
  /// </li>
  /// <li>
  /// <a>DeleteVpcPeeringConnection</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet. You can use either the fleet ID or ARN
  /// value.
  Future<DescribeVpcPeeringConnectionsOutput> describeVpcPeeringConnections({
    String fleetId,
  }) async {
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeVpcPeeringConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fleetId != null) 'FleetId': fleetId,
      },
    );

    return DescribeVpcPeeringConnectionsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the location of stored game session logs for a specified game
  /// session. When a game session is terminated, Amazon GameLift automatically
  /// stores the logs in Amazon S3 and retains them for 14 days. Use this URL to
  /// download the logs.
  /// <note>
  /// See the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_gamelift">AWS
  /// Service Limits</a> page for maximum log file sizes. Log files that exceed
  /// this limit are not saved.
  /// </note>
  /// <ul>
  /// <li>
  /// <a>CreateGameSession</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionDetails</a>
  /// </li>
  /// <li>
  /// <a>SearchGameSessions</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSession</a>
  /// </li>
  /// <li>
  /// <a>GetGameSessionLogUrl</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [gameSessionId] :
  /// A unique identifier for the game session to get logs for.
  Future<GetGameSessionLogUrlOutput> getGameSessionLogUrl({
    @_s.required String gameSessionId,
  }) async {
    ArgumentError.checkNotNull(gameSessionId, 'gameSessionId');
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameSessionId',
      gameSessionId,
      r'''[a-zA-Z0-9:/-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.GetGameSessionLogUrl'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameSessionId': gameSessionId,
      },
    );

    return GetGameSessionLogUrlOutput.fromJson(jsonResponse.body);
  }

  /// Requests remote access to a fleet instance. Remote access is useful for
  /// debugging, gathering benchmarking data, or observing activity in real
  /// time.
  ///
  /// To remotely access an instance, you need credentials that match the
  /// operating system of the instance. For a Windows instance, Amazon GameLift
  /// returns a user name and password as strings for use with a Windows Remote
  /// Desktop client. For a Linux instance, Amazon GameLift returns a user name
  /// and RSA private key, also as strings, for use with an SSH client. The
  /// private key must be saved in the proper format to a <code>.pem</code> file
  /// before using. If you're making this request using the AWS CLI, saving the
  /// secret can be handled as part of the GetInstanceAccess request, as shown
  /// in one of the examples for this operation.
  ///
  /// To request access to a specific instance, specify the IDs of both the
  /// instance and the fleet it belongs to. You can retrieve a fleet's instance
  /// IDs by calling <a>DescribeInstances</a>. If successful, an
  /// <a>InstanceAccess</a> object is returned that contains the instance's IP
  /// address and a set of credentials.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-remote-access.html">Remotely
  /// Access Fleet Instances</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html">Debug
  /// Fleet Issues</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeInstances</a>
  /// </li>
  /// <li>
  /// <a>GetInstanceAccess</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet that contains the instance you want access
  /// to. You can use either the fleet ID or ARN value. The fleet can be in any
  /// of the following statuses: <code>ACTIVATING</code>, <code>ACTIVE</code>,
  /// or <code>ERROR</code>. Fleets with an <code>ERROR</code> status may be
  /// accessible for a short time before they are deleted.
  ///
  /// Parameter [instanceId] :
  /// A unique identifier for an instance you want to get access to. You can
  /// access an instance in any status.
  Future<GetInstanceAccessOutput> getInstanceAccess({
    @_s.required String fleetId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''[a-zA-Z0-9\.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.GetInstanceAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        'InstanceId': instanceId,
      },
    );

    return GetInstanceAccessOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves all aliases for this AWS account. You can filter the result set
  /// by alias name and/or routing strategy type. Use the pagination parameters
  /// to retrieve results in sequential pages.
  /// <note>
  /// Returned aliases are not listed in any particular order.
  /// </note>
  /// <ul>
  /// <li>
  /// <a>CreateAlias</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// <li>
  /// <a>DescribeAlias</a>
  /// </li>
  /// <li>
  /// <a>UpdateAlias</a>
  /// </li>
  /// <li>
  /// <a>DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a>ResolveAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with an alias. Alias names do not
  /// need to be unique.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [routingStrategyType] :
  /// The routing type to filter results on. Use this parameter to retrieve only
  /// aliases with a certain routing type. To retrieve all aliases, leave this
  /// parameter empty.
  ///
  /// Possible routing types include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>SIMPLE</b> -- The alias resolves to one specific fleet. Use this type
  /// when routing to active fleets.
  /// </li>
  /// <li>
  /// <b>TERMINAL</b> -- The alias does not resolve to a fleet but instead can
  /// be used to display a message to the user. A terminal alias throws a
  /// TerminalRoutingStrategyException with the <a>RoutingStrategy</a> message
  /// embedded.
  /// </li>
  /// </ul>
  Future<ListAliasesOutput> listAliases({
    int limit,
    String name,
    String nextToken,
    RoutingStrategyType routingStrategyType,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ListAliases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (name != null) 'Name': name,
        if (nextToken != null) 'NextToken': nextToken,
        if (routingStrategyType != null)
          'RoutingStrategyType': routingStrategyType.toValue(),
      },
    );

    return ListAliasesOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves build resources for all builds associated with the AWS account
  /// in use. You can limit results to builds that are in a specific status by
  /// using the <code>Status</code> parameter. Use the pagination parameters to
  /// retrieve results in a set of sequential pages.
  /// <note>
  /// Build resources are not listed in any particular order.
  /// </note>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html">
  /// Upload a Custom Server Build</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateBuild</a>
  /// </li>
  /// <li>
  /// <a>ListBuilds</a>
  /// </li>
  /// <li>
  /// <a>DescribeBuild</a>
  /// </li>
  /// <li>
  /// <a>UpdateBuild</a>
  /// </li>
  /// <li>
  /// <a>DeleteBuild</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [status] :
  /// Build status to filter results by. To retrieve all builds, leave this
  /// parameter empty.
  ///
  /// Possible build statuses include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>INITIALIZED</b> -- A new build has been defined, but no files have been
  /// uploaded. You cannot create fleets for builds that are in this status.
  /// When a build is successfully created, the build status is set to this
  /// value.
  /// </li>
  /// <li>
  /// <b>READY</b> -- The game build has been successfully uploaded. You can now
  /// create new fleets for this build.
  /// </li>
  /// <li>
  /// <b>FAILED</b> -- The game build upload failed. You cannot create new
  /// fleets for this build.
  /// </li>
  /// </ul>
  Future<ListBuildsOutput> listBuilds({
    int limit,
    String nextToken,
    BuildStatus status,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ListBuilds'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListBuildsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a collection of fleet resources for this AWS account. You can
  /// filter the result set to find only those fleets that are deployed with a
  /// specific build or script. Use the pagination parameters to retrieve
  /// results in sequential pages.
  /// <note>
  /// Fleet resources are not listed in a particular order.
  /// </note>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [buildId] :
  /// A unique identifier for a build to return fleets for. Use this parameter
  /// to return only fleets using a specified build. Use either the build ID or
  /// ARN value. To retrieve all fleets, do not include either a BuildId and
  /// ScriptID parameter.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [scriptId] :
  /// A unique identifier for a Realtime script to return fleets for. Use this
  /// parameter to return only fleets using a specified script. Use either the
  /// script ID or ARN value. To retrieve all fleets, leave this parameter
  /// empty.
  Future<ListFleetsOutput> listFleets({
    String buildId,
    int limit,
    String nextToken,
    String scriptId,
  }) async {
    _s.validateStringPattern(
      'buildId',
      buildId,
      r'''^build-\S+|^arn:.*:build\/build-\S+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'scriptId',
      scriptId,
      r'''^script-\S+|^arn:.*:script\/script-\S+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ListFleets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (buildId != null) 'BuildId': buildId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (scriptId != null) 'ScriptId': scriptId,
      },
    );

    return ListFleetsOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Retrieves information on all game servers groups that exist in the current
  /// AWS account for the selected Region. Use the pagination parameters to
  /// retrieve results in a set of sequential segments.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ListGameServerGroups</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ResumeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>SuspendGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerInstances</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential segments.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential segment of
  /// results. Use the token returned with the previous call to this operation.
  /// To start at the beginning of the result set, do not specify a value.
  Future<ListGameServerGroupsOutput> listGameServerGroups({
    int limit,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ListGameServerGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGameServerGroupsOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Retrieves information on all game servers that are currently active in a
  /// specified game server group. You can opt to sort the list by game server
  /// age. Use the pagination parameters to retrieve results in a set of
  /// sequential segments.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>RegisterGameServer</a>
  /// </li>
  /// <li>
  /// <a>ListGameServers</a>
  /// </li>
  /// <li>
  /// <a>ClaimGameServer</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServer</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServer</a>
  /// </li>
  /// <li>
  /// <a>DeregisterGameServer</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// An identifier for the game server group to retrieve a list of game servers
  /// from. Use either the <a>GameServerGroup</a> name or ARN value.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential segments.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential segment of
  /// results. Use the token returned with the previous call to this operation.
  /// To start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [sortOrder] :
  /// Indicates how to sort the returned data based on game server registration
  /// timestamp. Use ASCENDING to retrieve oldest game servers first, or use
  /// DESCENDING to retrieve newest game servers first. If this parameter is
  /// left empty, game servers are returned in no particular order.
  Future<ListGameServersOutput> listGameServers({
    @_s.required String gameServerGroupName,
    int limit,
    String nextToken,
    SortOrder sortOrder,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ListGameServers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return ListGameServersOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves script records for all Realtime scripts that are associated with
  /// the AWS account in use.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html">Amazon
  /// GameLift Realtime Servers</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateScript</a>
  /// </li>
  /// <li>
  /// <a>ListScripts</a>
  /// </li>
  /// <li>
  /// <a>DescribeScript</a>
  /// </li>
  /// <li>
  /// <a>UpdateScript</a>
  /// </li>
  /// <li>
  /// <a>DeleteScript</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<ListScriptsOutput> listScripts({
    int limit,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ListScripts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListScriptsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves all tags that are assigned to a GameLift resource. Resource tags
  /// are used to organize AWS resources for a range of purposes. This operation
  /// handles the permissions necessary to manage tags for the following
  /// GameLift resource types:
  ///
  /// <ul>
  /// <li>
  /// Build
  /// </li>
  /// <li>
  /// Script
  /// </li>
  /// <li>
  /// Fleet
  /// </li>
  /// <li>
  /// Alias
  /// </li>
  /// <li>
  /// GameSessionQueue
  /// </li>
  /// <li>
  /// MatchmakingConfiguration
  /// </li>
  /// <li>
  /// MatchmakingRuleSet
  /// </li>
  /// </ul>
  /// To list tags for a resource, specify the unique ARN value for the
  /// resource.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> in the <i>AWS General Reference</i>
  ///
  /// <a
  /// href="http://aws.amazon.com/answers/account-management/aws-tagging-strategies/">
  /// AWS Tagging Strategies</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>TagResource</a>
  /// </li>
  /// <li>
  /// <a>UntagResource</a>
  /// </li>
  /// <li>
  /// <a>ListTagsForResource</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [TaggingFailedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to and uniquely identifies the GameLift resource that you
  /// want to retrieve tags for. GameLift resource ARNs are included in the data
  /// object for the resource, which can be retrieved by calling a List or
  /// Describe operation for the resource type.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a scaling policy for a fleet. Scaling policies are used
  /// to automatically scale a fleet's hosting capacity to meet player demand.
  /// An active scaling policy instructs Amazon GameLift to track a fleet metric
  /// and automatically change the fleet's capacity when a certain threshold is
  /// reached. There are two types of scaling policies: target-based and
  /// rule-based. Use a target-based policy to quickly and efficiently manage
  /// fleet scaling; this option is the most commonly used. Use rule-based
  /// policies when you need to exert fine-grained control over auto-scaling.
  ///
  /// Fleets can have multiple scaling policies of each type in force at the
  /// same time; you can have one target-based policy, one or multiple
  /// rule-based scaling policies, or both. We recommend caution, however,
  /// because multiple auto-scaling policies can have unintended consequences.
  ///
  /// You can temporarily suspend all scaling policies for a fleet by calling
  /// <a>StopFleetActions</a> with the fleet action AUTO_SCALING. To resume
  /// scaling policies, call <a>StartFleetActions</a> with the same fleet
  /// action. To stop just one scaling policy--or to permanently remove it, you
  /// must delete the policy with <a>DeleteScalingPolicy</a>.
  ///
  /// Learn more about how to work with auto-scaling in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-autoscaling.html">Set
  /// Up Fleet Automatic Scaling</a>.
  ///
  /// <b>Target-based policy</b>
  ///
  /// A target-based policy tracks a single metric:
  /// PercentAvailableGameSessions. This metric tells us how much of a fleet's
  /// hosting capacity is ready to host game sessions but is not currently in
  /// use. This is the fleet's buffer; it measures the additional player demand
  /// that the fleet could handle at current capacity. With a target-based
  /// policy, you set your ideal buffer size and leave it to Amazon GameLift to
  /// take whatever action is needed to maintain that target.
  ///
  /// For example, you might choose to maintain a 10% buffer for a fleet that
  /// has the capacity to host 100 simultaneous game sessions. This policy tells
  /// Amazon GameLift to take action whenever the fleet's available capacity
  /// falls below or rises above 10 game sessions. Amazon GameLift will start
  /// new instances or stop unused instances in order to return to the 10%
  /// buffer.
  ///
  /// To create or update a target-based policy, specify a fleet ID and name,
  /// and set the policy type to "TargetBased". Specify the metric to track
  /// (PercentAvailableGameSessions) and reference a <a>TargetConfiguration</a>
  /// object with your desired buffer value. Exclude all other parameters. On a
  /// successful request, the policy name is returned. The scaling policy is
  /// automatically in force as soon as it's successfully created. If the
  /// fleet's auto-scaling actions are temporarily suspended, the new policy
  /// will be in force once the fleet actions are restarted.
  ///
  /// <b>Rule-based policy</b>
  ///
  /// A rule-based policy tracks specified fleet metric, sets a threshold value,
  /// and specifies the type of action to initiate when triggered. With a
  /// rule-based policy, you can select from several available fleet metrics.
  /// Each policy specifies whether to scale up or scale down (and by how much),
  /// so you need one policy for each type of action.
  ///
  /// For example, a policy may make the following statement: "If the percentage
  /// of idle instances is greater than 20% for more than 15 minutes, then
  /// reduce the fleet capacity by 10%."
  ///
  /// A policy's rule statement has the following structure:
  ///
  /// If <code>[MetricName]</code> is <code>[ComparisonOperator]</code>
  /// <code>[Threshold]</code> for <code>[EvaluationPeriods]</code> minutes,
  /// then <code>[ScalingAdjustmentType]</code> to/by
  /// <code>[ScalingAdjustment]</code>.
  ///
  /// To implement the example, the rule statement would look like this:
  ///
  /// If <code>[PercentIdleInstances]</code> is
  /// <code>[GreaterThanThreshold]</code> <code>[20]</code> for
  /// <code>[15]</code> minutes, then <code>[PercentChangeInCapacity]</code>
  /// to/by <code>[10]</code>.
  ///
  /// To create or update a scaling policy, specify a unique combination of name
  /// and fleet ID, and set the policy type to "RuleBased". Specify the
  /// parameter values for a policy rule statement. On a successful request, the
  /// policy name is returned. Scaling policies are automatically in force as
  /// soon as they're successfully created. If the fleet's auto-scaling actions
  /// are temporarily suspended, the new policy will be in force once the fleet
  /// actions are restarted.
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>DescribeEC2InstanceLimits</a>
  /// </li>
  /// <li>
  /// Manage scaling policies:
  ///
  /// <ul>
  /// <li>
  /// <a>PutScalingPolicy</a> (auto-scaling)
  /// </li>
  /// <li>
  /// <a>DescribeScalingPolicies</a> (auto-scaling)
  /// </li>
  /// <li>
  /// <a>DeleteScalingPolicy</a> (auto-scaling)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Manage fleet actions:
  ///
  /// <ul>
  /// <li>
  /// <a>StartFleetActions</a>
  /// </li>
  /// <li>
  /// <a>StopFleetActions</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to apply this policy to. You can use
  /// either the fleet ID or ARN value. The fleet cannot be in any of the
  /// following statuses: ERROR or DELETING.
  ///
  /// Parameter [metricName] :
  /// Name of the Amazon GameLift-defined metric that is used to trigger a
  /// scaling adjustment. For detailed descriptions of fleet metrics, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html">Monitor
  /// Amazon GameLift with Amazon CloudWatch</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>ActivatingGameSessions</b> -- Game sessions in the process of being
  /// created.
  /// </li>
  /// <li>
  /// <b>ActiveGameSessions</b> -- Game sessions that are currently running.
  /// </li>
  /// <li>
  /// <b>ActiveInstances</b> -- Fleet instances that are currently running at
  /// least one game session.
  /// </li>
  /// <li>
  /// <b>AvailableGameSessions</b> -- Additional game sessions that fleet could
  /// host simultaneously, given current capacity.
  /// </li>
  /// <li>
  /// <b>AvailablePlayerSessions</b> -- Empty player slots in currently active
  /// game sessions. This includes game sessions that are not currently
  /// accepting players. Reserved player slots are not included.
  /// </li>
  /// <li>
  /// <b>CurrentPlayerSessions</b> -- Player slots in active game sessions that
  /// are being used by a player or are reserved for a player.
  /// </li>
  /// <li>
  /// <b>IdleInstances</b> -- Active instances that are currently hosting zero
  /// game sessions.
  /// </li>
  /// <li>
  /// <b>PercentAvailableGameSessions</b> -- Unused percentage of the total
  /// number of game sessions that a fleet could host simultaneously, given
  /// current capacity. Use this metric for a target-based scaling policy.
  /// </li>
  /// <li>
  /// <b>PercentIdleInstances</b> -- Percentage of the total number of active
  /// instances that are hosting zero game sessions.
  /// </li>
  /// <li>
  /// <b>QueueDepth</b> -- Pending game session placement requests, in any
  /// queue, where the current fleet is the top-priority destination.
  /// </li>
  /// <li>
  /// <b>WaitTime</b> -- Current wait time for pending game session placement
  /// requests, in any queue, where the current fleet is the top-priority
  /// destination.
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a scaling policy. Policy names
  /// do not need to be unique. A fleet can have only one scaling policy with
  /// the same name.
  ///
  /// Parameter [comparisonOperator] :
  /// Comparison operator to use when measuring the metric against the threshold
  /// value.
  ///
  /// Parameter [evaluationPeriods] :
  /// Length of time (in minutes) the metric must be at or beyond the threshold
  /// before a scaling event is triggered.
  ///
  /// Parameter [policyType] :
  /// The type of scaling policy to create. For a target-based policy, set the
  /// parameter <i>MetricName</i> to 'PercentAvailableGameSessions' and specify
  /// a <i>TargetConfiguration</i>. For a rule-based policy set the following
  /// parameters: <i>MetricName</i>, <i>ComparisonOperator</i>,
  /// <i>Threshold</i>, <i>EvaluationPeriods</i>, <i>ScalingAdjustmentType</i>,
  /// and <i>ScalingAdjustment</i>.
  ///
  /// Parameter [scalingAdjustment] :
  /// Amount of adjustment to make, based on the scaling adjustment type.
  ///
  /// Parameter [scalingAdjustmentType] :
  /// The type of adjustment to make to a fleet's instance count (see
  /// <a>FleetCapacity</a>):
  ///
  /// <ul>
  /// <li>
  /// <b>ChangeInCapacity</b> -- add (or subtract) the scaling adjustment value
  /// from the current instance count. Positive values scale up while negative
  /// values scale down.
  /// </li>
  /// <li>
  /// <b>ExactCapacity</b> -- set the instance count to the scaling adjustment
  /// value.
  /// </li>
  /// <li>
  /// <b>PercentChangeInCapacity</b> -- increase or reduce the current instance
  /// count by the scaling adjustment, read as a percentage. Positive values
  /// scale up while negative values scale down; for example, a value of "-10"
  /// scales the fleet down by 10%.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetConfiguration] :
  /// The settings for a target-based scaling policy.
  ///
  /// Parameter [threshold] :
  /// Metric value used to trigger a scaling event.
  Future<PutScalingPolicyOutput> putScalingPolicy({
    @_s.required String fleetId,
    @_s.required MetricName metricName,
    @_s.required String name,
    ComparisonOperatorType comparisonOperator,
    int evaluationPeriods,
    PolicyType policyType,
    int scalingAdjustment,
    ScalingAdjustmentType scalingAdjustmentType,
    TargetConfiguration targetConfiguration,
    double threshold,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(metricName, 'metricName');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
      isRequired: true,
    );
    _s.validateNumRange(
      'evaluationPeriods',
      evaluationPeriods,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.PutScalingPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        'MetricName': metricName?.toValue() ?? '',
        'Name': name,
        if (comparisonOperator != null)
          'ComparisonOperator': comparisonOperator.toValue(),
        if (evaluationPeriods != null) 'EvaluationPeriods': evaluationPeriods,
        if (policyType != null) 'PolicyType': policyType.toValue(),
        if (scalingAdjustment != null) 'ScalingAdjustment': scalingAdjustment,
        if (scalingAdjustmentType != null)
          'ScalingAdjustmentType': scalingAdjustmentType.toValue(),
        if (targetConfiguration != null)
          'TargetConfiguration': targetConfiguration,
        if (threshold != null) 'Threshold': threshold,
      },
    );

    return PutScalingPolicyOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Creates a new game server resource and notifies GameLift FleetIQ that the
  /// game server is ready to host gameplay and players. This operation is
  /// called by a game server process that is running on an instance in a game
  /// server group. Registering game servers enables GameLift FleetIQ to track
  /// available game servers and enables game clients and services to claim a
  /// game server for a new game session.
  ///
  /// To register a game server, identify the game server group and instance
  /// where the game server is running, and provide a unique identifier for the
  /// game server. You can also include connection and game server data. When a
  /// game client or service requests a game server by calling
  /// <a>ClaimGameServer</a>, this information is returned in the response.
  ///
  /// Once a game server is successfully registered, it is put in status
  /// <code>AVAILABLE</code>. A request to register a game server may fail if
  /// the instance it is running on is in the process of shutting down as part
  /// of instance balancing or scale-down activity.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>RegisterGameServer</a>
  /// </li>
  /// <li>
  /// <a>ListGameServers</a>
  /// </li>
  /// <li>
  /// <a>ClaimGameServer</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServer</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServer</a>
  /// </li>
  /// <li>
  /// <a>DeregisterGameServer</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group where the game server is
  /// running. Use either the <a>GameServerGroup</a> name or ARN value.
  ///
  /// Parameter [gameServerId] :
  /// A custom string that uniquely identifies the game server to register. Game
  /// server IDs are developer-defined and must be unique across all game server
  /// groups in your AWS account.
  ///
  /// Parameter [instanceId] :
  /// The unique identifier for the instance where the game server is running.
  /// This ID is available in the instance metadata. EC2 instance IDs use a
  /// 17-character format, for example: <code>i-1234567890abcdef0</code>.
  ///
  /// Parameter [connectionInfo] :
  /// Information that is needed to make inbound client connections to the game
  /// server. This might include the IP address and port, DNS name, and other
  /// information.
  ///
  /// Parameter [gameServerData] :
  /// A set of custom game server properties, formatted as a single string
  /// value. This data is passed to a game client or service when it requests
  /// information on game servers using <a>ListGameServers</a> or
  /// <a>ClaimGameServer</a>.
  Future<RegisterGameServerOutput> registerGameServer({
    @_s.required String gameServerGroupName,
    @_s.required String gameServerId,
    @_s.required String instanceId,
    String connectionInfo,
    String gameServerData,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(gameServerId, 'gameServerId');
    _s.validateStringLength(
      'gameServerId',
      gameServerId,
      3,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerId',
      gameServerId,
      r'''[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''^i-[0-9a-zA-Z]{17}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'connectionInfo',
      connectionInfo,
      1,
      512,
    );
    _s.validateStringPattern(
      'connectionInfo',
      connectionInfo,
      r'''.*\S.*''',
    );
    _s.validateStringLength(
      'gameServerData',
      gameServerData,
      1,
      1024,
    );
    _s.validateStringPattern(
      'gameServerData',
      gameServerData,
      r'''.*\S.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.RegisterGameServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        'GameServerId': gameServerId,
        'InstanceId': instanceId,
        if (connectionInfo != null) 'ConnectionInfo': connectionInfo,
        if (gameServerData != null) 'GameServerData': gameServerData,
      },
    );

    return RegisterGameServerOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a fresh set of credentials for use when uploading a new set of
  /// game build files to Amazon GameLift's Amazon S3. This is done as part of
  /// the build creation process; see <a>CreateBuild</a>.
  ///
  /// To request new credentials, specify the build ID as returned with an
  /// initial <code>CreateBuild</code> request. If successful, a new set of
  /// credentials are returned, along with the S3 storage location associated
  /// with the build ID.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-cli-uploading.html#gamelift-build-cli-uploading-create-build">
  /// Create a Build with Files in S3</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateBuild</a>
  /// </li>
  /// <li>
  /// <a>ListBuilds</a>
  /// </li>
  /// <li>
  /// <a>DescribeBuild</a>
  /// </li>
  /// <li>
  /// <a>UpdateBuild</a>
  /// </li>
  /// <li>
  /// <a>DeleteBuild</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [buildId] :
  /// A unique identifier for a build to get credentials for. You can use either
  /// the build ID or ARN value.
  Future<RequestUploadCredentialsOutput> requestUploadCredentials({
    @_s.required String buildId,
  }) async {
    ArgumentError.checkNotNull(buildId, 'buildId');
    _s.validateStringPattern(
      'buildId',
      buildId,
      r'''^build-\S+|^arn:.*:build\/build-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.RequestUploadCredentials'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BuildId': buildId,
      },
    );

    return RequestUploadCredentialsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the fleet ID that an alias is currently pointing to.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateAlias</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// <li>
  /// <a>DescribeAlias</a>
  /// </li>
  /// <li>
  /// <a>UpdateAlias</a>
  /// </li>
  /// <li>
  /// <a>DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a>ResolveAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [TerminalRoutingStrategyException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [aliasId] :
  /// The unique identifier of the alias that you want to retrieve a fleet ID
  /// for. You can use either the alias ID or ARN value.
  Future<ResolveAliasOutput> resolveAlias({
    @_s.required String aliasId,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^alias-\S+|^arn:.*:alias\/alias-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ResolveAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
      },
    );

    return ResolveAliasOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Reinstates activity on a game server group after it has been suspended. A
  /// game server group might be suspended by the<a>SuspendGameServerGroup</a>
  /// operation, or it might be suspended involuntarily due to a configuration
  /// problem. In the second case, you can manually resume activity on the group
  /// once the configuration problem has been resolved. Refer to the game server
  /// group status and status reason for more information on why group activity
  /// is suspended.
  ///
  /// To resume activity, specify a game server group ARN and the type of
  /// activity to be resumed. If successful, a <a>GameServerGroup</a> object is
  /// returned showing that the resumed activity is no longer listed in
  /// <code>SuspendedActions</code>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ListGameServerGroups</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ResumeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>SuspendGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerInstances</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group. Use either the
  /// <a>GameServerGroup</a> name or ARN value.
  ///
  /// Parameter [resumeActions] :
  /// The activity to resume for this game server group.
  Future<ResumeGameServerGroupOutput> resumeGameServerGroup({
    @_s.required String gameServerGroupName,
    @_s.required List<GameServerGroupAction> resumeActions,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resumeActions, 'resumeActions');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ResumeGameServerGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        'ResumeActions':
            resumeActions?.map((e) => e?.toValue() ?? '')?.toList(),
      },
    );

    return ResumeGameServerGroupOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves all active game sessions that match a set of search criteria and
  /// sorts them in a specified order. You can search or sort by the following
  /// game session attributes:
  ///
  /// <ul>
  /// <li>
  /// <b>gameSessionId</b> -- A unique identifier for the game session. You can
  /// use either a <code>GameSessionId</code> or <code>GameSessionArn</code>
  /// value.
  /// </li>
  /// <li>
  /// <b>gameSessionName</b> -- Name assigned to a game session. This value is
  /// set when requesting a new game session with <a>CreateGameSession</a> or
  /// updating with <a>UpdateGameSession</a>. Game session names do not need to
  /// be unique to a game session.
  /// </li>
  /// <li>
  /// <b>gameSessionProperties</b> -- Custom data defined in a game session's
  /// <code>GameProperty</code> parameter. <code>GameProperty</code> values are
  /// stored as key:value pairs; the filter expression must indicate the key and
  /// a string to search the data values for. For example, to search for game
  /// sessions with custom data containing the key:value pair "gameMode:brawl",
  /// specify the following: <code>gameSessionProperties.gameMode =
  /// "brawl"</code>. All custom data values are searched as strings.
  /// </li>
  /// <li>
  /// <b>maximumSessions</b> -- Maximum number of player sessions allowed for a
  /// game session. This value is set when requesting a new game session with
  /// <a>CreateGameSession</a> or updating with <a>UpdateGameSession</a>.
  /// </li>
  /// <li>
  /// <b>creationTimeMillis</b> -- Value indicating when a game session was
  /// created. It is expressed in Unix time as milliseconds.
  /// </li>
  /// <li>
  /// <b>playerSessionCount</b> -- Number of players currently connected to a
  /// game session. This value changes rapidly as players join the session or
  /// drop out.
  /// </li>
  /// <li>
  /// <b>hasAvailablePlayerSessions</b> -- Boolean value indicating whether a
  /// game session has reached its maximum number of players. It is highly
  /// recommended that all search requests include this filter attribute to
  /// optimize search performance and return only sessions that players can
  /// join.
  /// </li>
  /// </ul> <note>
  /// Returned values for <code>playerSessionCount</code> and
  /// <code>hasAvailablePlayerSessions</code> change quickly as players join
  /// sessions and others drop out. Results should be considered a snapshot in
  /// time. Be sure to refresh search results often, and handle sessions that
  /// fill up before a player can join.
  /// </note>
  /// To search or sort, specify either a fleet ID or an alias ID, and provide a
  /// search filter expression, a sort expression, or both. If successful, a
  /// collection of <a>GameSession</a> objects matching the request is returned.
  /// Use the pagination parameters to retrieve results as a set of sequential
  /// pages.
  ///
  /// You can search for game sessions one fleet at a time only. To find game
  /// sessions across multiple fleets, you must search each fleet separately and
  /// combine the results. This search feature finds only game sessions that are
  /// in <code>ACTIVE</code> status. To locate games in statuses other than
  /// active, use <a>DescribeGameSessionDetails</a>.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSession</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionDetails</a>
  /// </li>
  /// <li>
  /// <a>SearchGameSessions</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSession</a>
  /// </li>
  /// <li>
  /// <a>GetGameSessionLogUrl</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TerminalRoutingStrategyException].
  ///
  /// Parameter [aliasId] :
  /// A unique identifier for an alias associated with the fleet to search for
  /// active game sessions. You can use either the alias ID or ARN value. Each
  /// request must reference either a fleet ID or alias ID, but not both.
  ///
  /// Parameter [filterExpression] :
  /// String containing the search criteria for the session search. If no filter
  /// expression is included, the request returns results for all game sessions
  /// in the fleet that are in <code>ACTIVE</code> status.
  ///
  /// A filter expression can contain one or multiple conditions. Each condition
  /// consists of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Operand</b> -- Name of a game session attribute. Valid values are
  /// <code>gameSessionName</code>, <code>gameSessionId</code>,
  /// <code>gameSessionProperties</code>, <code>maximumSessions</code>,
  /// <code>creationTimeMillis</code>, <code>playerSessionCount</code>,
  /// <code>hasAvailablePlayerSessions</code>.
  /// </li>
  /// <li>
  /// <b>Comparator</b> -- Valid comparators are: <code>=</code>,
  /// <code>&lt;&gt;</code>, <code>&lt;</code>, <code>&gt;</code>,
  /// <code>&lt;=</code>, <code>&gt;=</code>.
  /// </li>
  /// <li>
  /// <b>Value</b> -- Value to be searched for. Values may be numbers, boolean
  /// values (true/false) or strings depending on the operand. String values are
  /// case sensitive and must be enclosed in single quotes. Special characters
  /// must be escaped. Boolean and string values can only be used with the
  /// comparators <code>=</code> and <code>&lt;&gt;</code>. For example, the
  /// following filter expression searches on <code>gameSessionName</code>:
  /// "<code>FilterExpression": "gameSessionName = 'Matt\\'s Awesome Game
  /// 1'"</code>.
  /// </li>
  /// </ul>
  /// To chain multiple conditions in a single expression, use the logical
  /// keywords <code>AND</code>, <code>OR</code>, and <code>NOT</code> and
  /// parentheses as needed. For example: <code>x AND y AND NOT z</code>,
  /// <code>NOT (x OR y)</code>.
  ///
  /// Session search evaluates conditions from left to right using the following
  /// precedence rules:
  /// <ol>
  /// <li>
  /// <code>=</code>, <code>&lt;&gt;</code>, <code>&lt;</code>,
  /// <code>&gt;</code>, <code>&lt;=</code>, <code>&gt;=</code>
  /// </li>
  /// <li>
  /// Parentheses
  /// </li>
  /// <li>
  /// NOT
  /// </li>
  /// <li>
  /// AND
  /// </li>
  /// <li>
  /// OR
  /// </li> </ol>
  /// For example, this filter expression retrieves game sessions hosting at
  /// least ten players that have an open player slot:
  /// <code>"maximumSessions&gt;=10 AND hasAvailablePlayerSessions=true"</code>.
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to search for active game sessions. You
  /// can use either the fleet ID or ARN value. Each request must reference
  /// either a fleet ID or alias ID, but not both.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. The
  /// maximum number of results returned is 20, even if this value is not set or
  /// is set higher than 20.
  ///
  /// Parameter [nextToken] :
  /// Token that indicates the start of the next sequential page of results. Use
  /// the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [sortExpression] :
  /// Instructions on how to sort the search results. If no sort expression is
  /// included, the request returns results in random order. A sort expression
  /// consists of the following elements:
  ///
  /// <ul>
  /// <li>
  /// <b>Operand</b> -- Name of a game session attribute. Valid values are
  /// <code>gameSessionName</code>, <code>gameSessionId</code>,
  /// <code>gameSessionProperties</code>, <code>maximumSessions</code>,
  /// <code>creationTimeMillis</code>, <code>playerSessionCount</code>,
  /// <code>hasAvailablePlayerSessions</code>.
  /// </li>
  /// <li>
  /// <b>Order</b> -- Valid sort orders are <code>ASC</code> (ascending) and
  /// <code>DESC</code> (descending).
  /// </li>
  /// </ul>
  /// For example, this sort expression returns the oldest active sessions
  /// first: <code>"SortExpression": "creationTimeMillis ASC"</code>. Results
  /// with a null value for the sort operand are returned at the end of the
  /// list.
  Future<SearchGameSessionsOutput> searchGameSessions({
    String aliasId,
    String filterExpression,
    String fleetId,
    int limit,
    String nextToken,
    String sortExpression,
  }) async {
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^alias-\S+|^arn:.*:alias\/alias-\S+''',
    );
    _s.validateStringLength(
      'filterExpression',
      filterExpression,
      1,
      1024,
    );
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringLength(
      'sortExpression',
      sortExpression,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.SearchGameSessions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (aliasId != null) 'AliasId': aliasId,
        if (filterExpression != null) 'FilterExpression': filterExpression,
        if (fleetId != null) 'FleetId': fleetId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortExpression != null) 'SortExpression': sortExpression,
      },
    );

    return SearchGameSessionsOutput.fromJson(jsonResponse.body);
  }

  /// Resumes activity on a fleet that was suspended with
  /// <a>StopFleetActions</a>. Currently, this operation is used to restart a
  /// fleet's auto-scaling activity.
  ///
  /// To start fleet actions, specify the fleet ID and the type of actions to
  /// restart. When auto-scaling fleet actions are restarted, Amazon GameLift
  /// once again initiates scaling events as triggered by the fleet's scaling
  /// policies. If actions on the fleet were never stopped, this operation will
  /// have no effect. You can view a fleet's stopped actions using
  /// <a>DescribeFleetAttributes</a>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [actions] :
  /// List of actions to restart on the fleet.
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to start actions on. You can use either
  /// the fleet ID or ARN value.
  Future<void> startFleetActions({
    @_s.required List<FleetAction> actions,
    @_s.required String fleetId,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.StartFleetActions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Actions': actions?.map((e) => e?.toValue() ?? '')?.toList(),
        'FleetId': fleetId,
      },
    );

    return StartFleetActionsOutput.fromJson(jsonResponse.body);
  }

  /// Places a request for a new game session in a queue (see
  /// <a>CreateGameSessionQueue</a>). When processing a placement request,
  /// Amazon GameLift searches for available resources on the queue's
  /// destinations, scanning each until it finds resources or the placement
  /// request times out.
  ///
  /// A game session placement request can also request player sessions. When a
  /// new game session is successfully created, Amazon GameLift creates a player
  /// session for each player included in the request.
  ///
  /// When placing a game session, by default Amazon GameLift tries each fleet
  /// in the order they are listed in the queue configuration. Ideally, a
  /// queue's destinations are listed in preference order.
  ///
  /// Alternatively, when requesting a game session with players, you can also
  /// provide latency data for each player in relevant Regions. Latency data
  /// indicates the performance lag a player experiences when connected to a
  /// fleet in the Region. Amazon GameLift uses latency data to reorder the list
  /// of destinations to place the game session in a Region with minimal lag. If
  /// latency data is provided for multiple players, Amazon GameLift calculates
  /// each Region's average lag for all players and reorders to get the best
  /// game play across all players.
  ///
  /// To place a new game session request, specify the following:
  ///
  /// <ul>
  /// <li>
  /// The queue name and a set of game session properties and settings
  /// </li>
  /// <li>
  /// A unique ID (such as a UUID) for the placement. You use this ID to track
  /// the status of the placement request
  /// </li>
  /// <li>
  /// (Optional) A set of player data and a unique player ID for each player
  /// that you are joining to the new game session (player data is optional, but
  /// if you include it, you must also provide a unique ID for each player)
  /// </li>
  /// <li>
  /// Latency data for all players (if you want to optimize game play for the
  /// players)
  /// </li>
  /// </ul>
  /// If successful, a new game session placement is created.
  ///
  /// To track the status of a placement request, call
  /// <a>DescribeGameSessionPlacement</a> and check the request's status. If the
  /// status is <code>FULFILLED</code>, a new game session has been created and
  /// a game session ARN and Region are referenced. If the placement request
  /// times out, you can resubmit the request or retry it with a different
  /// queue.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSession</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionDetails</a>
  /// </li>
  /// <li>
  /// <a>SearchGameSessions</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSession</a>
  /// </li>
  /// <li>
  /// <a>GetGameSessionLogUrl</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [gameSessionQueueName] :
  /// Name of the queue to use to place the new game session. You can use either
  /// the queue name or ARN value.
  ///
  /// Parameter [maximumPlayerSessionCount] :
  /// The maximum number of players that can be connected simultaneously to the
  /// game session.
  ///
  /// Parameter [placementId] :
  /// A unique identifier to assign to the new game session placement. This
  /// value is developer-defined. The value must be unique across all Regions
  /// and cannot be reused unless you are resubmitting a canceled or timed-out
  /// placement request.
  ///
  /// Parameter [desiredPlayerSessions] :
  /// Set of information on each player to create a player session for.
  ///
  /// Parameter [gameProperties] :
  /// Set of custom properties for a game session, formatted as key:value pairs.
  /// These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  ///
  /// Parameter [gameSessionData] :
  /// Set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the <a>GameSession</a>
  /// object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  ///
  /// Parameter [gameSessionName] :
  /// A descriptive label that is associated with a game session. Session names
  /// do not need to be unique.
  ///
  /// Parameter [playerLatencies] :
  /// Set of values, expressed in milliseconds, indicating the amount of latency
  /// that a player experiences when connected to AWS Regions. This information
  /// is used to try to place the new game session where it can offer the best
  /// possible gameplay experience for the players.
  Future<StartGameSessionPlacementOutput> startGameSessionPlacement({
    @_s.required String gameSessionQueueName,
    @_s.required int maximumPlayerSessionCount,
    @_s.required String placementId,
    List<DesiredPlayerSession> desiredPlayerSessions,
    List<GameProperty> gameProperties,
    String gameSessionData,
    String gameSessionName,
    List<PlayerLatency> playerLatencies,
  }) async {
    ArgumentError.checkNotNull(gameSessionQueueName, 'gameSessionQueueName');
    _s.validateStringLength(
      'gameSessionQueueName',
      gameSessionQueueName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameSessionQueueName',
      gameSessionQueueName,
      r'''[a-zA-Z0-9-]+|^arn:.*:gamesessionqueue\/[a-zA-Z0-9-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        maximumPlayerSessionCount, 'maximumPlayerSessionCount');
    _s.validateNumRange(
      'maximumPlayerSessionCount',
      maximumPlayerSessionCount,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(placementId, 'placementId');
    _s.validateStringLength(
      'placementId',
      placementId,
      1,
      48,
      isRequired: true,
    );
    _s.validateStringPattern(
      'placementId',
      placementId,
      r'''[a-zA-Z0-9-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'gameSessionData',
      gameSessionData,
      1,
      4096,
    );
    _s.validateStringLength(
      'gameSessionName',
      gameSessionName,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.StartGameSessionPlacement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameSessionQueueName': gameSessionQueueName,
        'MaximumPlayerSessionCount': maximumPlayerSessionCount,
        'PlacementId': placementId,
        if (desiredPlayerSessions != null)
          'DesiredPlayerSessions': desiredPlayerSessions,
        if (gameProperties != null) 'GameProperties': gameProperties,
        if (gameSessionData != null) 'GameSessionData': gameSessionData,
        if (gameSessionName != null) 'GameSessionName': gameSessionName,
        if (playerLatencies != null) 'PlayerLatencies': playerLatencies,
      },
    );

    return StartGameSessionPlacementOutput.fromJson(jsonResponse.body);
  }

  /// Finds new players to fill open slots in an existing game session. This
  /// operation can be used to add players to matched games that start with
  /// fewer than the maximum number of players or to replace players when they
  /// drop out. By backfilling with the same matchmaker used to create the
  /// original match, you ensure that new players meet the match criteria and
  /// maintain a consistent experience throughout the game session. You can
  /// backfill a match anytime after a game session has been created.
  ///
  /// To request a match backfill, specify a unique ticket ID, the existing game
  /// session's ARN, a matchmaking configuration, and a set of data that
  /// describes all current players in the game session. If successful, a match
  /// backfill ticket is created and returned with status set to QUEUED. The
  /// ticket is placed in the matchmaker's ticket pool and processed. Track the
  /// status of the ticket to respond as needed.
  ///
  /// The process of finding backfill matches is essentially identical to the
  /// initial matchmaking process. The matchmaker searches the pool and groups
  /// tickets together to form potential matches, allowing only one backfill
  /// ticket per potential match. Once the a match is formed, the matchmaker
  /// creates player sessions for the new players. All tickets in the match are
  /// updated with the game session's connection information, and the
  /// <a>GameSession</a> object is updated to include matchmaker data on the new
  /// players. For more detail on how match backfill requests are processed, see
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/gamelift-match.html">
  /// How Amazon GameLift FlexMatch Works</a>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-backfill.html">
  /// Backfill Existing Games with FlexMatch</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/gamelift-match.html">
  /// How GameLift FlexMatch Works</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>StartMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>StopMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>AcceptMatch</a>
  /// </li>
  /// <li>
  /// <a>StartMatchBackfill</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [configurationName] :
  /// Name of the matchmaker to use for this request. You can use either the
  /// configuration name or ARN value. The ARN of the matchmaker that was used
  /// with the original game session is listed in the <a>GameSession</a> object,
  /// <code>MatchmakerData</code> property.
  ///
  /// Parameter [players] :
  /// Match information on all players that are currently assigned to the game
  /// session. This information is used by the matchmaker to find new players
  /// and add them to the existing game.
  ///
  /// <ul>
  /// <li>
  /// PlayerID, PlayerAttributes, Team -\\- This information is maintained in
  /// the <a>GameSession</a> object, <code>MatchmakerData</code> property, for
  /// all players who are currently assigned to the game session. The matchmaker
  /// data is in JSON syntax, formatted as a string. For more details, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-server.html#match-server-data">
  /// Match Data</a>.
  /// </li>
  /// <li>
  /// LatencyInMs -\\- If the matchmaker uses player latency, include a latency
  /// value, in milliseconds, for the Region that the game session is currently
  /// in. Do not include latency values for any other Region.
  /// </li>
  /// </ul>
  ///
  /// Parameter [gameSessionArn] :
  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a game session and uniquely identifies it. This is the
  /// same as the game session ID.
  ///
  /// Parameter [ticketId] :
  /// A unique identifier for a matchmaking ticket. If no ticket ID is specified
  /// here, Amazon GameLift will generate one in the form of a UUID. Use this
  /// identifier to track the match backfill ticket status and retrieve match
  /// results.
  Future<StartMatchBackfillOutput> startMatchBackfill({
    @_s.required String configurationName,
    @_s.required List<Player> players,
    String gameSessionArn,
    String ticketId,
  }) async {
    ArgumentError.checkNotNull(configurationName, 'configurationName');
    _s.validateStringLength(
      'configurationName',
      configurationName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configurationName',
      configurationName,
      r'''[a-zA-Z0-9-\.]*|^arn:.*:matchmakingconfiguration\/[a-zA-Z0-9-\.]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(players, 'players');
    _s.validateStringLength(
      'gameSessionArn',
      gameSessionArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'gameSessionArn',
      gameSessionArn,
      r'''[a-zA-Z0-9:/-]+''',
    );
    _s.validateStringLength(
      'ticketId',
      ticketId,
      0,
      128,
    );
    _s.validateStringPattern(
      'ticketId',
      ticketId,
      r'''[a-zA-Z0-9-\.]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.StartMatchBackfill'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationName': configurationName,
        'Players': players,
        if (gameSessionArn != null) 'GameSessionArn': gameSessionArn,
        if (ticketId != null) 'TicketId': ticketId,
      },
    );

    return StartMatchBackfillOutput.fromJson(jsonResponse.body);
  }

  /// Uses FlexMatch to create a game match for a group of players based on
  /// custom matchmaking rules. If you're also using GameLift hosting, a new
  /// game session is started for the matched players. Each matchmaking request
  /// identifies one or more players to find a match for, and specifies the type
  /// of match to build, including the team configuration and the rules for an
  /// acceptable match. When a matchmaking request identifies a group of players
  /// who want to play together, FlexMatch finds additional players to fill the
  /// match. Match type, rules, and other features are defined in a
  /// <code>MatchmakingConfiguration</code>.
  ///
  /// To start matchmaking, provide a unique ticket ID, specify a matchmaking
  /// configuration, and include the players to be matched. For each player, you
  /// must also include the player attribute values that are required by the
  /// matchmaking configuration (in the rule set). If successful, a matchmaking
  /// ticket is returned with status set to <code>QUEUED</code>.
  ///
  /// Track the status of the ticket to respond as needed. If you're also using
  /// GameLift hosting, a successfully completed ticket contains game session
  /// connection information. Ticket status updates are tracked using event
  /// notification through Amazon Simple Notification Service (SNS), which is
  /// defined in the matchmaking configuration.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-client.html">
  /// Add FlexMatch to a Game Client</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html">
  /// Set Up FlexMatch Event Notification</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-tasks.html">
  /// FlexMatch Integration Roadmap</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/gamelift-match.html">
  /// How GameLift FlexMatch Works</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>StartMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>StopMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>AcceptMatch</a>
  /// </li>
  /// <li>
  /// <a>StartMatchBackfill</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [configurationName] :
  /// Name of the matchmaking configuration to use for this request. Matchmaking
  /// configurations must exist in the same Region as this request. You can use
  /// either the configuration name or ARN value.
  ///
  /// Parameter [players] :
  /// Information on each player to be matched. This information must include a
  /// player ID, and may contain player attributes and latency data to be used
  /// in the matchmaking process. After a successful match, <code>Player</code>
  /// objects contain the name of the team the player is assigned to.
  ///
  /// Parameter [ticketId] :
  /// A unique identifier for a matchmaking ticket. If no ticket ID is specified
  /// here, Amazon GameLift will generate one in the form of a UUID. Use this
  /// identifier to track the matchmaking ticket status and retrieve match
  /// results.
  Future<StartMatchmakingOutput> startMatchmaking({
    @_s.required String configurationName,
    @_s.required List<Player> players,
    String ticketId,
  }) async {
    ArgumentError.checkNotNull(configurationName, 'configurationName');
    _s.validateStringLength(
      'configurationName',
      configurationName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configurationName',
      configurationName,
      r'''[a-zA-Z0-9-\.]*|^arn:.*:matchmakingconfiguration\/[a-zA-Z0-9-\.]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(players, 'players');
    _s.validateStringLength(
      'ticketId',
      ticketId,
      0,
      128,
    );
    _s.validateStringPattern(
      'ticketId',
      ticketId,
      r'''[a-zA-Z0-9-\.]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.StartMatchmaking'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationName': configurationName,
        'Players': players,
        if (ticketId != null) 'TicketId': ticketId,
      },
    );

    return StartMatchmakingOutput.fromJson(jsonResponse.body);
  }

  /// Suspends activity on a fleet. Currently, this operation is used to stop a
  /// fleet's auto-scaling activity. It is used to temporarily stop triggering
  /// scaling events. The policies can be retained and auto-scaling activity can
  /// be restarted using <a>StartFleetActions</a>. You can view a fleet's
  /// stopped actions using <a>DescribeFleetAttributes</a>.
  ///
  /// To stop fleet actions, specify the fleet ID and the type of actions to
  /// suspend. When auto-scaling fleet actions are stopped, Amazon GameLift no
  /// longer initiates scaling events except in response to manual changes using
  /// <a>UpdateFleetCapacity</a>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [actions] :
  /// List of actions to suspend on the fleet.
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to stop actions on. You can use either the
  /// fleet ID or ARN value.
  Future<void> stopFleetActions({
    @_s.required List<FleetAction> actions,
    @_s.required String fleetId,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.StopFleetActions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Actions': actions?.map((e) => e?.toValue() ?? '')?.toList(),
        'FleetId': fleetId,
      },
    );

    return StopFleetActionsOutput.fromJson(jsonResponse.body);
  }

  /// Cancels a game session placement that is in <code>PENDING</code> status.
  /// To stop a placement, provide the placement ID values. If successful, the
  /// placement is moved to <code>CANCELLED</code> status.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSession</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionDetails</a>
  /// </li>
  /// <li>
  /// <a>SearchGameSessions</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSession</a>
  /// </li>
  /// <li>
  /// <a>GetGameSessionLogUrl</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [placementId] :
  /// A unique identifier for a game session placement to cancel.
  Future<StopGameSessionPlacementOutput> stopGameSessionPlacement({
    @_s.required String placementId,
  }) async {
    ArgumentError.checkNotNull(placementId, 'placementId');
    _s.validateStringLength(
      'placementId',
      placementId,
      1,
      48,
      isRequired: true,
    );
    _s.validateStringPattern(
      'placementId',
      placementId,
      r'''[a-zA-Z0-9-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.StopGameSessionPlacement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PlacementId': placementId,
      },
    );

    return StopGameSessionPlacementOutput.fromJson(jsonResponse.body);
  }

  /// Cancels a matchmaking ticket or match backfill ticket that is currently
  /// being processed. To stop the matchmaking operation, specify the ticket ID.
  /// If successful, work on the ticket is stopped, and the ticket status is
  /// changed to <code>CANCELLED</code>.
  ///
  /// This call is also used to turn off automatic backfill for an individual
  /// game session. This is for game sessions that are created with a
  /// matchmaking configuration that has automatic backfill enabled. The ticket
  /// ID is included in the <code>MatchmakerData</code> of an updated game
  /// session object, which is provided to the game server.
  /// <note>
  /// If the operation is successful, the service sends back an empty JSON
  /// struct with the HTTP 200 response (not an empty HTTP body).
  /// </note>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-client.html">
  /// Add FlexMatch to a Game Client</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>StartMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>StopMatchmaking</a>
  /// </li>
  /// <li>
  /// <a>AcceptMatch</a>
  /// </li>
  /// <li>
  /// <a>StartMatchBackfill</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [ticketId] :
  /// A unique identifier for a matchmaking ticket.
  Future<void> stopMatchmaking({
    @_s.required String ticketId,
  }) async {
    ArgumentError.checkNotNull(ticketId, 'ticketId');
    _s.validateStringLength(
      'ticketId',
      ticketId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ticketId',
      ticketId,
      r'''[a-zA-Z0-9-\.]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.StopMatchmaking'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TicketId': ticketId,
      },
    );

    return StopMatchmakingOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Temporarily stops activity on a game server group without terminating
  /// instances or the game server group. You can restart activity by calling
  /// <a>ResumeGameServerGroup</a>. You can suspend the following activity:
  ///
  /// <ul>
  /// <li>
  /// <b>Instance type replacement</b> - This activity evaluates the current
  /// game hosting viability of all Spot instance types that are defined for the
  /// game server group. It updates the Auto Scaling group to remove nonviable
  /// Spot Instance types, which have a higher chance of game server
  /// interruptions. It then balances capacity across the remaining viable Spot
  /// Instance types. When this activity is suspended, the Auto Scaling group
  /// continues with its current balance, regardless of viability. Instance
  /// protection, utilization metrics, and capacity scaling activities continue
  /// to be active.
  /// </li>
  /// </ul>
  /// To suspend activity, specify a game server group ARN and the type of
  /// activity to be suspended. If successful, a <a>GameServerGroup</a> object
  /// is returned showing that the activity is listed in
  /// <code>SuspendedActions</code>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ListGameServerGroups</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ResumeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>SuspendGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerInstances</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group. Use either the
  /// <a>GameServerGroup</a> name or ARN value.
  ///
  /// Parameter [suspendActions] :
  /// The activity to suspend for this game server group.
  Future<SuspendGameServerGroupOutput> suspendGameServerGroup({
    @_s.required String gameServerGroupName,
    @_s.required List<GameServerGroupAction> suspendActions,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(suspendActions, 'suspendActions');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.SuspendGameServerGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        'SuspendActions':
            suspendActions?.map((e) => e?.toValue() ?? '')?.toList(),
      },
    );

    return SuspendGameServerGroupOutput.fromJson(jsonResponse.body);
  }

  /// Assigns a tag to a GameLift resource. AWS resource tags provide an
  /// additional management tool set. You can use tags to organize resources,
  /// create IAM permissions policies to manage access to groups of resources,
  /// customize AWS cost breakdowns, etc. This operation handles the permissions
  /// necessary to manage tags for the following GameLift resource types:
  ///
  /// <ul>
  /// <li>
  /// Build
  /// </li>
  /// <li>
  /// Script
  /// </li>
  /// <li>
  /// Fleet
  /// </li>
  /// <li>
  /// Alias
  /// </li>
  /// <li>
  /// GameSessionQueue
  /// </li>
  /// <li>
  /// MatchmakingConfiguration
  /// </li>
  /// <li>
  /// MatchmakingRuleSet
  /// </li>
  /// </ul>
  /// To add a tag to a resource, specify the unique ARN value for the resource
  /// and provide a tag list containing one or more tags. The operation succeeds
  /// even if the list includes tags that are already assigned to the specified
  /// resource.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> in the <i>AWS General Reference</i>
  ///
  /// <a
  /// href="http://aws.amazon.com/answers/account-management/aws-tagging-strategies/">
  /// AWS Tagging Strategies</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>TagResource</a>
  /// </li>
  /// <li>
  /// <a>UntagResource</a>
  /// </li>
  /// <li>
  /// <a>ListTagsForResource</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [TaggingFailedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to and uniquely identifies the GameLift resource that you
  /// want to assign tags to. GameLift resource ARNs are included in the data
  /// object for the resource, which can be retrieved by calling a List or
  /// Describe operation for the resource type.
  ///
  /// Parameter [tags] :
  /// A list of one or more tags to assign to the specified GameLift resource.
  /// Tags are developer-defined and structured as key-value pairs. The maximum
  /// tag limit may be lower than stated. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging AWS Resources</a> for actual tagging limits.
  Future<void> tagResource({
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes a tag that is assigned to a GameLift resource. Resource tags are
  /// used to organize AWS resources for a range of purposes. This operation
  /// handles the permissions necessary to manage tags for the following
  /// GameLift resource types:
  ///
  /// <ul>
  /// <li>
  /// Build
  /// </li>
  /// <li>
  /// Script
  /// </li>
  /// <li>
  /// Fleet
  /// </li>
  /// <li>
  /// Alias
  /// </li>
  /// <li>
  /// GameSessionQueue
  /// </li>
  /// <li>
  /// MatchmakingConfiguration
  /// </li>
  /// <li>
  /// MatchmakingRuleSet
  /// </li>
  /// </ul>
  /// To remove a tag from a resource, specify the unique ARN value for the
  /// resource and provide a string list containing one or more tags to be
  /// removed. This operation succeeds even if the list includes tags that are
  /// not currently assigned to the specified resource.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> in the <i>AWS General Reference</i>
  ///
  /// <a
  /// href="http://aws.amazon.com/answers/account-management/aws-tagging-strategies/">
  /// AWS Tagging Strategies</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>TagResource</a>
  /// </li>
  /// <li>
  /// <a>UntagResource</a>
  /// </li>
  /// <li>
  /// <a>ListTagsForResource</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [TaggingFailedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to and uniquely identifies the GameLift resource that you
  /// want to remove tags from. GameLift resource ARNs are included in the data
  /// object for the resource, which can be retrieved by calling a List or
  /// Describe operation for the resource type.
  ///
  /// Parameter [tagKeys] :
  /// A list of one or more tag keys to remove from the specified GameLift
  /// resource. An AWS resource can have only one tag with a specific tag key,
  /// so specifying the tag key identifies which tag to remove.
  Future<void> untagResource({
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Updates properties for an alias. To update properties, specify the alias
  /// ID to be updated and provide the information to be changed. To reassign an
  /// alias to another fleet, provide an updated routing strategy. If
  /// successful, the updated alias record is returned.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateAlias</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// <li>
  /// <a>DescribeAlias</a>
  /// </li>
  /// <li>
  /// <a>UpdateAlias</a>
  /// </li>
  /// <li>
  /// <a>DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a>ResolveAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [aliasId] :
  /// A unique identifier for the alias that you want to update. You can use
  /// either the alias ID or ARN value.
  ///
  /// Parameter [description] :
  /// A human-readable description of the alias.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with an alias. Alias names do not
  /// need to be unique.
  ///
  /// Parameter [routingStrategy] :
  /// The routing configuration, including routing type and fleet target, for
  /// the alias.
  Future<UpdateAliasOutput> updateAlias({
    @_s.required String aliasId,
    String description,
    String name,
    RoutingStrategy routingStrategy,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^alias-\S+|^arn:.*:alias\/alias-\S+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
        if (routingStrategy != null) 'RoutingStrategy': routingStrategy,
      },
    );

    return UpdateAliasOutput.fromJson(jsonResponse.body);
  }

  /// Updates metadata in a build resource, including the build name and
  /// version. To update the metadata, specify the build ID to update and
  /// provide the new values. If successful, a build object containing the
  /// updated metadata is returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html">
  /// Upload a Custom Server Build</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateBuild</a>
  /// </li>
  /// <li>
  /// <a>ListBuilds</a>
  /// </li>
  /// <li>
  /// <a>DescribeBuild</a>
  /// </li>
  /// <li>
  /// <a>UpdateBuild</a>
  /// </li>
  /// <li>
  /// <a>DeleteBuild</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [buildId] :
  /// A unique identifier for a build to update. You can use either the build ID
  /// or ARN value.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a build. Build names do not
  /// need to be unique.
  ///
  /// Parameter [version] :
  /// Version information that is associated with a build or script. Version
  /// strings do not need to be unique.
  Future<UpdateBuildOutput> updateBuild({
    @_s.required String buildId,
    String name,
    String version,
  }) async {
    ArgumentError.checkNotNull(buildId, 'buildId');
    _s.validateStringPattern(
      'buildId',
      buildId,
      r'''^build-\S+|^arn:.*:build\/build-\S+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
    );
    _s.validateStringLength(
      'version',
      version,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateBuild'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BuildId': buildId,
        if (name != null) 'Name': name,
        if (version != null) 'Version': version,
      },
    );

    return UpdateBuildOutput.fromJson(jsonResponse.body);
  }

  /// Updates fleet properties, including name and description, for a fleet. To
  /// update metadata, specify the fleet ID and the property values that you
  /// want to change. If successful, the fleet ID for the updated fleet is
  /// returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// Update fleets:
  ///
  /// <ul>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetPortSettings</a>
  /// </li>
  /// <li>
  /// <a>UpdateRuntimeConfiguration</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [InvalidFleetStatusException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to update attribute metadata for. You can
  /// use either the fleet ID or ARN value.
  ///
  /// Parameter [description] :
  /// Human-readable description of a fleet.
  ///
  /// Parameter [metricGroups] :
  /// Names of metric groups to include this fleet in. Amazon CloudWatch uses a
  /// fleet metric group is to aggregate metrics from multiple fleets. Use an
  /// existing metric group name to add this fleet to the group. Or use a new
  /// name to create a new metric group. A fleet can only be included in one
  /// metric group at a time.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a fleet. Fleet names do not
  /// need to be unique.
  ///
  /// Parameter [newGameSessionProtectionPolicy] :
  /// Game session protection policy to apply to all new instances created in
  /// this fleet. Instances that already exist are not affected. You can set
  /// protection for individual instances using <a>UpdateGameSession</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>NoProtection</b> -- The game session can be terminated during a
  /// scale-down event.
  /// </li>
  /// <li>
  /// <b>FullProtection</b> -- If the game session is in an <code>ACTIVE</code>
  /// status, it cannot be terminated during a scale-down event.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceCreationLimitPolicy] :
  /// Policy that limits the number of game sessions an individual player can
  /// create over a span of time.
  Future<UpdateFleetAttributesOutput> updateFleetAttributes({
    @_s.required String fleetId,
    String description,
    List<String> metricGroups,
    String name,
    ProtectionPolicy newGameSessionProtectionPolicy,
    ResourceCreationLimitPolicy resourceCreationLimitPolicy,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateFleetAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        if (description != null) 'Description': description,
        if (metricGroups != null) 'MetricGroups': metricGroups,
        if (name != null) 'Name': name,
        if (newGameSessionProtectionPolicy != null)
          'NewGameSessionProtectionPolicy':
              newGameSessionProtectionPolicy.toValue(),
        if (resourceCreationLimitPolicy != null)
          'ResourceCreationLimitPolicy': resourceCreationLimitPolicy,
      },
    );

    return UpdateFleetAttributesOutput.fromJson(jsonResponse.body);
  }

  /// Updates capacity settings for a fleet. Use this operation to specify the
  /// number of EC2 instances (hosts) that you want this fleet to contain.
  /// Before calling this operation, you may want to call
  /// <a>DescribeEC2InstanceLimits</a> to get the maximum capacity based on the
  /// fleet's EC2 instance type.
  ///
  /// Specify minimum and maximum number of instances. Amazon GameLift will not
  /// change fleet capacity to values fall outside of this range. This is
  /// particularly important when using auto-scaling (see
  /// <a>PutScalingPolicy</a>) to allow capacity to adjust based on player
  /// demand while imposing limits on automatic adjustments.
  ///
  /// To update fleet capacity, specify the fleet ID and the number of instances
  /// you want the fleet to host. If successful, Amazon GameLift starts or
  /// terminates instances so that the fleet's active instance count matches the
  /// desired instance count. You can view a fleet's current capacity
  /// information by calling <a>DescribeFleetCapacity</a>. If the desired
  /// instance count is higher than the instance type's limit, the "Limit
  /// Exceeded" exception occurs.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// Update fleets:
  ///
  /// <ul>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetPortSettings</a>
  /// </li>
  /// <li>
  /// <a>UpdateRuntimeConfiguration</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidFleetStatusException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to update capacity for. You can use either
  /// the fleet ID or ARN value.
  ///
  /// Parameter [desiredInstances] :
  /// Number of EC2 instances you want this fleet to host.
  ///
  /// Parameter [maxSize] :
  /// The maximum value allowed for the fleet's instance count. Default if not
  /// set is 1.
  ///
  /// Parameter [minSize] :
  /// The minimum value allowed for the fleet's instance count. Default if not
  /// set is 0.
  Future<UpdateFleetCapacityOutput> updateFleetCapacity({
    @_s.required String fleetId,
    int desiredInstances,
    int maxSize,
    int minSize,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'desiredInstances',
      desiredInstances,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'maxSize',
      maxSize,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minSize',
      minSize,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateFleetCapacity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        if (desiredInstances != null) 'DesiredInstances': desiredInstances,
        if (maxSize != null) 'MaxSize': maxSize,
        if (minSize != null) 'MinSize': minSize,
      },
    );

    return UpdateFleetCapacityOutput.fromJson(jsonResponse.body);
  }

  /// Updates port settings for a fleet. To update settings, specify the fleet
  /// ID to be updated and list the permissions you want to update. List the
  /// permissions you want to add in
  /// <code>InboundPermissionAuthorizations</code>, and permissions you want to
  /// remove in <code>InboundPermissionRevocations</code>. Permissions to be
  /// removed must match existing fleet permissions. If successful, the fleet ID
  /// for the updated fleet is returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// Update fleets:
  ///
  /// <ul>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetPortSettings</a>
  /// </li>
  /// <li>
  /// <a>UpdateRuntimeConfiguration</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [InvalidFleetStatusException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to update port settings for. You can use
  /// either the fleet ID or ARN value.
  ///
  /// Parameter [inboundPermissionAuthorizations] :
  /// A collection of port settings to be added to the fleet resource.
  ///
  /// Parameter [inboundPermissionRevocations] :
  /// A collection of port settings to be removed from the fleet resource.
  Future<UpdateFleetPortSettingsOutput> updateFleetPortSettings({
    @_s.required String fleetId,
    List<IpPermission> inboundPermissionAuthorizations,
    List<IpPermission> inboundPermissionRevocations,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateFleetPortSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        if (inboundPermissionAuthorizations != null)
          'InboundPermissionAuthorizations': inboundPermissionAuthorizations,
        if (inboundPermissionRevocations != null)
          'InboundPermissionRevocations': inboundPermissionRevocations,
      },
    );

    return UpdateFleetPortSettingsOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Updates information about a registered game server to help GameLift
  /// FleetIQ to track game server availability. This operation is called by a
  /// game server process that is running on an instance in a game server group.
  ///
  /// Use this operation to update the following types of game server
  /// information. You can make all three types of updates in the same request:
  ///
  /// <ul>
  /// <li>
  /// To update the game server's utilization status, identify the game server
  /// and game server group and specify the current utilization status. Use this
  /// status to identify when game servers are currently hosting games and when
  /// they are available to be claimed.
  /// </li>
  /// <li>
  /// To report health status, identify the game server and game server group
  /// and set health check to <code>HEALTHY</code>. If a game server does not
  /// report health status for a certain length of time, the game server is no
  /// longer considered healthy. As a result, it will be eventually deregistered
  /// from the game server group to avoid affecting utilization metrics. The
  /// best practice is to report health every 60 seconds.
  /// </li>
  /// <li>
  /// To change game server metadata, provide updated game server data.
  /// </li>
  /// </ul>
  /// Once a game server is successfully updated, the relevant statuses and
  /// timestamps are updated.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>RegisterGameServer</a>
  /// </li>
  /// <li>
  /// <a>ListGameServers</a>
  /// </li>
  /// <li>
  /// <a>ClaimGameServer</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServer</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServer</a>
  /// </li>
  /// <li>
  /// <a>DeregisterGameServer</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group where the game server is
  /// running. Use either the <a>GameServerGroup</a> name or ARN value.
  ///
  /// Parameter [gameServerId] :
  /// A custom string that uniquely identifies the game server to update.
  ///
  /// Parameter [gameServerData] :
  /// A set of custom game server properties, formatted as a single string
  /// value. This data is passed to a game client or service when it requests
  /// information on game servers using <a>ListGameServers</a> or
  /// <a>ClaimGameServer</a>.
  ///
  /// Parameter [healthCheck] :
  /// Indicates health status of the game server. A request that includes this
  /// parameter updates the game server's <i>LastHealthCheckTime</i> timestamp.
  ///
  /// Parameter [utilizationStatus] :
  /// Indicates whether the game server is available or is currently hosting
  /// gameplay.
  Future<UpdateGameServerOutput> updateGameServer({
    @_s.required String gameServerGroupName,
    @_s.required String gameServerId,
    String gameServerData,
    GameServerHealthCheck healthCheck,
    GameServerUtilizationStatus utilizationStatus,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(gameServerId, 'gameServerId');
    _s.validateStringLength(
      'gameServerId',
      gameServerId,
      3,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerId',
      gameServerId,
      r'''[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'gameServerData',
      gameServerData,
      1,
      1024,
    );
    _s.validateStringPattern(
      'gameServerData',
      gameServerData,
      r'''.*\S.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateGameServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        'GameServerId': gameServerId,
        if (gameServerData != null) 'GameServerData': gameServerData,
        if (healthCheck != null) 'HealthCheck': healthCheck.toValue(),
        if (utilizationStatus != null)
          'UtilizationStatus': utilizationStatus.toValue(),
      },
    );

    return UpdateGameServerOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the Amazon GameLift FleetIQ solution and
  /// game server groups.</b>
  ///
  /// Updates GameLift FleetIQ-specific properties for a game server group. Many
  /// Auto Scaling group properties are updated on the Auto Scaling group
  /// directly, including the launch template, Auto Scaling policies, and
  /// maximum/minimum/desired instance counts.
  ///
  /// To update the game server group, specify the game server group ID and
  /// provide the updated values. Before applying the updates, the new values
  /// are validated to ensure that GameLift FleetIQ can continue to perform
  /// instance balancing activity. If successful, a <a>GameServerGroup</a>
  /// object is returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-intro.html">GameLift
  /// FleetIQ Guide</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ListGameServerGroups</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>ResumeGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>SuspendGameServerGroup</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameServerInstances</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameServerGroupName] :
  /// A unique identifier for the game server group. Use either the
  /// <a>GameServerGroup</a> name or ARN value.
  ///
  /// Parameter [balancingStrategy] :
  /// Indicates how GameLift FleetIQ balances the use of Spot Instances and
  /// On-Demand Instances in the game server group. Method options include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>SPOT_ONLY</code> - Only Spot Instances are used in the game server
  /// group. If Spot Instances are unavailable or not viable for game hosting,
  /// the game server group provides no hosting capacity until Spot Instances
  /// can again be used. Until then, no new instances are started, and the
  /// existing nonviable Spot Instances are terminated (after current gameplay
  /// ends) and are not replaced.
  /// </li>
  /// <li>
  /// <code>SPOT_PREFERRED</code> - (default value) Spot Instances are used
  /// whenever available in the game server group. If Spot Instances are
  /// unavailable, the game server group continues to provide hosting capacity
  /// by falling back to On-Demand Instances. Existing nonviable Spot Instances
  /// are terminated (after current gameplay ends) and are replaced with new
  /// On-Demand Instances.
  /// </li>
  /// <li>
  /// <code>ON_DEMAND_ONLY</code> - Only On-Demand Instances are used in the
  /// game server group. No Spot Instances are used, even when available, while
  /// this balancing strategy is in force.
  /// </li>
  /// </ul>
  ///
  /// Parameter [gameServerProtectionPolicy] :
  /// A flag that indicates whether instances in the game server group are
  /// protected from early termination. Unprotected instances that have active
  /// game servers running might be terminated during a scale-down event,
  /// causing players to be dropped from the game. Protected instances cannot be
  /// terminated while there are active game servers running except in the event
  /// of a forced game server group deletion (see ). An exception to this is
  /// with Spot Instances, which can be terminated by AWS regardless of
  /// protection status. This property is set to <code>NO_PROTECTION</code> by
  /// default.
  ///
  /// Parameter [instanceDefinitions] :
  /// An updated list of EC2 instance types to use in the Auto Scaling group.
  /// The instance definitions must specify at least two different instance
  /// types that are supported by GameLift FleetIQ. This updated list replaces
  /// the entire current list of instance definitions for the game server group.
  /// For more information on instance types, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">EC2
  /// Instance Types</a> in the <i>Amazon EC2 User Guide</i>. You can optionally
  /// specify capacity weighting for each instance type. If no weight value is
  /// specified for an instance type, it is set to the default value "1". For
  /// more information about capacity weighting, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-weighting.html">
  /// Instance Weighting for Amazon EC2 Auto Scaling</a> in the Amazon EC2 Auto
  /// Scaling User Guide.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// for an IAM role that allows Amazon GameLift to access your EC2 Auto
  /// Scaling groups.
  Future<UpdateGameServerGroupOutput> updateGameServerGroup({
    @_s.required String gameServerGroupName,
    BalancingStrategy balancingStrategy,
    GameServerProtectionPolicy gameServerProtectionPolicy,
    List<InstanceDefinition> instanceDefinitions,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameServerGroupName',
      gameServerGroupName,
      r'''[a-zA-Z0-9-\.]+|^arn:.*:gameservergroup\/[a-zA-Z0-9-\.]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:.*:role\/[\w+=,.@-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateGameServerGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameServerGroupName': gameServerGroupName,
        if (balancingStrategy != null)
          'BalancingStrategy': balancingStrategy.toValue(),
        if (gameServerProtectionPolicy != null)
          'GameServerProtectionPolicy': gameServerProtectionPolicy.toValue(),
        if (instanceDefinitions != null)
          'InstanceDefinitions': instanceDefinitions,
        if (roleArn != null) 'RoleArn': roleArn,
      },
    );

    return UpdateGameServerGroupOutput.fromJson(jsonResponse.body);
  }

  /// Updates game session properties. This includes the session name, maximum
  /// player count, protection policy, which controls whether or not an active
  /// game session can be terminated during a scale-down event, and the player
  /// session creation policy, which controls whether or not new players can
  /// join the session. To update a game session, specify the game session ID
  /// and the values you want to change. If successful, an updated
  /// <a>GameSession</a> object is returned.
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSession</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessions</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionDetails</a>
  /// </li>
  /// <li>
  /// <a>SearchGameSessions</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSession</a>
  /// </li>
  /// <li>
  /// <a>GetGameSessionLogUrl</a>
  /// </li>
  /// <li>
  /// Game session placements
  ///
  /// <ul>
  /// <li>
  /// <a>StartGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionPlacement</a>
  /// </li>
  /// <li>
  /// <a>StopGameSessionPlacement</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceException].
  /// May throw [UnauthorizedException].
  /// May throw [InvalidGameSessionStatusException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [gameSessionId] :
  /// A unique identifier for the game session to update.
  ///
  /// Parameter [maximumPlayerSessionCount] :
  /// The maximum number of players that can be connected simultaneously to the
  /// game session.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a game session. Session names
  /// do not need to be unique.
  ///
  /// Parameter [playerSessionCreationPolicy] :
  /// Policy determining whether or not the game session accepts new players.
  ///
  /// Parameter [protectionPolicy] :
  /// Game session protection policy to apply to this game session only.
  ///
  /// <ul>
  /// <li>
  /// <b>NoProtection</b> -- The game session can be terminated during a
  /// scale-down event.
  /// </li>
  /// <li>
  /// <b>FullProtection</b> -- If the game session is in an <code>ACTIVE</code>
  /// status, it cannot be terminated during a scale-down event.
  /// </li>
  /// </ul>
  Future<UpdateGameSessionOutput> updateGameSession({
    @_s.required String gameSessionId,
    int maximumPlayerSessionCount,
    String name,
    PlayerSessionCreationPolicy playerSessionCreationPolicy,
    ProtectionPolicy protectionPolicy,
  }) async {
    ArgumentError.checkNotNull(gameSessionId, 'gameSessionId');
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gameSessionId',
      gameSessionId,
      r'''[a-zA-Z0-9:/-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maximumPlayerSessionCount',
      maximumPlayerSessionCount,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateGameSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GameSessionId': gameSessionId,
        if (maximumPlayerSessionCount != null)
          'MaximumPlayerSessionCount': maximumPlayerSessionCount,
        if (name != null) 'Name': name,
        if (playerSessionCreationPolicy != null)
          'PlayerSessionCreationPolicy': playerSessionCreationPolicy.toValue(),
        if (protectionPolicy != null)
          'ProtectionPolicy': protectionPolicy.toValue(),
      },
    );

    return UpdateGameSessionOutput.fromJson(jsonResponse.body);
  }

  /// Updates settings for a game session queue, which determines how new game
  /// session requests in the queue are processed. To update settings, specify
  /// the queue name to be updated and provide the new settings. When updating
  /// destinations, provide a complete list of destinations.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-intro.html">
  /// Using Multi-Region Queues</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGameSessionQueue</a>
  /// </li>
  /// <li>
  /// <a>DescribeGameSessionQueues</a>
  /// </li>
  /// <li>
  /// <a>UpdateGameSessionQueue</a>
  /// </li>
  /// <li>
  /// <a>DeleteGameSessionQueue</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with game session queue. Queue
  /// names must be unique within each Region. You can use either the queue ID
  /// or ARN value.
  ///
  /// Parameter [destinations] :
  /// A list of fleets that can be used to fulfill game session placement
  /// requests in the queue. Fleets are identified by either a fleet ARN or a
  /// fleet alias ARN. Destinations are listed in default preference order. When
  /// updating this list, provide a complete list of destinations.
  ///
  /// Parameter [playerLatencyPolicies] :
  /// A collection of latency policies to apply when processing game sessions
  /// placement requests with player latency information. Multiple policies are
  /// evaluated in order of the maximum latency value, starting with the lowest
  /// latency values. With just one policy, the policy is enforced at the start
  /// of the game session placement for the duration period. With multiple
  /// policies, each policy is enforced consecutively for its duration period.
  /// For example, a queue might enforce a 60-second policy followed by a
  /// 120-second policy, and then no policy for the remainder of the placement.
  /// When updating policies, provide a complete collection of policies.
  ///
  /// Parameter [timeoutInSeconds] :
  /// The maximum time, in seconds, that a new game session placement request
  /// remains in the queue. When a request exceeds this time, the game session
  /// placement changes to a <code>TIMED_OUT</code> status.
  Future<UpdateGameSessionQueueOutput> updateGameSessionQueue({
    @_s.required String name,
    List<GameSessionQueueDestination> destinations,
    List<PlayerLatencyPolicy> playerLatencyPolicies,
    int timeoutInSeconds,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-]+|^arn:.*:gamesessionqueue\/[a-zA-Z0-9-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'timeoutInSeconds',
      timeoutInSeconds,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateGameSessionQueue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (destinations != null) 'Destinations': destinations,
        if (playerLatencyPolicies != null)
          'PlayerLatencyPolicies': playerLatencyPolicies,
        if (timeoutInSeconds != null) 'TimeoutInSeconds': timeoutInSeconds,
      },
    );

    return UpdateGameSessionQueueOutput.fromJson(jsonResponse.body);
  }

  /// Updates settings for a FlexMatch matchmaking configuration. These changes
  /// affect all matches and game sessions that are created after the update. To
  /// update settings, specify the configuration name to be updated and provide
  /// the new settings.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-configuration.html">
  /// Design a FlexMatch Matchmaker</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingConfigurations</a>
  /// </li>
  /// <li>
  /// <a>UpdateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>CreateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingRuleSets</a>
  /// </li>
  /// <li>
  /// <a>ValidateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingRuleSet</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [name] :
  /// A unique identifier for a matchmaking configuration to update. You can use
  /// either the configuration name or ARN value.
  ///
  /// Parameter [acceptanceRequired] :
  /// A flag that indicates whether a match that was created with this
  /// configuration must be accepted by the matched players. To require
  /// acceptance, set to TRUE. With this option enabled, matchmaking tickets use
  /// the status <code>REQUIRES_ACCEPTANCE</code> to indicate when a completed
  /// potential match is waiting for player acceptance.
  ///
  /// Parameter [acceptanceTimeoutSeconds] :
  /// The length of time (in seconds) to wait for players to accept a proposed
  /// match, if acceptance is required. If any player rejects the match or fails
  /// to accept before the timeout, the tickets are returned to the ticket pool
  /// and continue to be evaluated for an acceptable match.
  ///
  /// Parameter [additionalPlayerCount] :
  /// The number of player slots in a match to keep open for future players. For
  /// example, assume that the configuration's rule set specifies a match for a
  /// single 12-person team. If the additional player count is set to 2, only 10
  /// players are initially selected for the match. This parameter is not used
  /// if <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  ///
  /// Parameter [backfillMode] :
  /// The method that is used to backfill game sessions created with this
  /// matchmaking configuration. Specify MANUAL when your game manages backfill
  /// requests manually or does not use the match backfill feature. Specify
  /// AUTOMATIC to have GameLift create a <a>StartMatchBackfill</a> request
  /// whenever a game session has one or more open slots. Learn more about
  /// manual and automatic backfill in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-backfill.html">Backfill
  /// Existing Games with FlexMatch</a>. Automatic backfill is not available
  /// when <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  ///
  /// Parameter [customEventData] :
  /// Information to add to all events related to the matchmaking configuration.
  ///
  /// Parameter [description] :
  /// A descriptive label that is associated with matchmaking configuration.
  ///
  /// Parameter [flexMatchMode] :
  /// Indicates whether this matchmaking configuration is being used with
  /// GameLift hosting or as a standalone matchmaking solution.
  ///
  /// <ul>
  /// <li>
  /// <b>STANDALONE</b> - FlexMatch forms matches and returns match information,
  /// including players and team assignments, in a <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html#match-events-matchmakingsucceeded">
  /// MatchmakingSucceeded</a> event.
  /// </li>
  /// <li>
  /// <b>WITH_QUEUE</b> - FlexMatch forms matches and uses the specified
  /// GameLift queue to start a game session for the match.
  /// </li>
  /// </ul>
  ///
  /// Parameter [gameProperties] :
  /// A set of custom properties for a game session, formatted as key-value
  /// pairs. These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>). This information is added to the new
  /// <a>GameSession</a> object that is created for a successful match. This
  /// parameter is not used if <code>FlexMatchMode</code> is set to
  /// <code>STANDALONE</code>.
  ///
  /// Parameter [gameSessionData] :
  /// A set of custom game session properties, formatted as a single string
  /// value. This data is passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>). This information is added to the new
  /// <a>GameSession</a> object that is created for a successful match. This
  /// parameter is not used if <code>FlexMatchMode</code> is set to
  /// <code>STANDALONE</code>.
  ///
  /// Parameter [gameSessionQueueArns] :
  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a GameLift game session queue resource and uniquely
  /// identifies it. ARNs are unique across all Regions. Queues can be located
  /// in any Region. Queues are used to start new GameLift-hosted game sessions
  /// for matches that are created with this matchmaking configuration. If
  /// <code>FlexMatchMode</code> is set to <code>STANDALONE</code>, do not set
  /// this parameter.
  ///
  /// Parameter [notificationTarget] :
  /// An SNS topic ARN that is set up to receive matchmaking notifications. See
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html">
  /// Setting up Notifications for Matchmaking</a> for more information.
  ///
  /// Parameter [requestTimeoutSeconds] :
  /// The maximum duration, in seconds, that a matchmaking ticket can remain in
  /// process before timing out. Requests that fail due to timing out can be
  /// resubmitted as needed.
  ///
  /// Parameter [ruleSetName] :
  /// A unique identifier for a matchmaking rule set to use with this
  /// configuration. You can use either the rule set name or ARN value. A
  /// matchmaking configuration can only use rule sets that are defined in the
  /// same Region.
  Future<UpdateMatchmakingConfigurationOutput> updateMatchmakingConfiguration({
    @_s.required String name,
    bool acceptanceRequired,
    int acceptanceTimeoutSeconds,
    int additionalPlayerCount,
    BackfillMode backfillMode,
    String customEventData,
    String description,
    FlexMatchMode flexMatchMode,
    List<GameProperty> gameProperties,
    String gameSessionData,
    List<String> gameSessionQueueArns,
    String notificationTarget,
    int requestTimeoutSeconds,
    String ruleSetName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-\.]*|^arn:.*:matchmakingconfiguration\/[a-zA-Z0-9-\.]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'acceptanceTimeoutSeconds',
      acceptanceTimeoutSeconds,
      1,
      600,
    );
    _s.validateNumRange(
      'additionalPlayerCount',
      additionalPlayerCount,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'customEventData',
      customEventData,
      0,
      256,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'gameSessionData',
      gameSessionData,
      1,
      4096,
    );
    _s.validateStringLength(
      'notificationTarget',
      notificationTarget,
      0,
      300,
    );
    _s.validateStringPattern(
      'notificationTarget',
      notificationTarget,
      r'''[a-zA-Z0-9:_/-]*''',
    );
    _s.validateNumRange(
      'requestTimeoutSeconds',
      requestTimeoutSeconds,
      1,
      43200,
    );
    _s.validateStringLength(
      'ruleSetName',
      ruleSetName,
      1,
      256,
    );
    _s.validateStringPattern(
      'ruleSetName',
      ruleSetName,
      r'''[a-zA-Z0-9-\.]*|^arn:.*:matchmakingruleset\/[a-zA-Z0-9-\.]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateMatchmakingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (acceptanceRequired != null)
          'AcceptanceRequired': acceptanceRequired,
        if (acceptanceTimeoutSeconds != null)
          'AcceptanceTimeoutSeconds': acceptanceTimeoutSeconds,
        if (additionalPlayerCount != null)
          'AdditionalPlayerCount': additionalPlayerCount,
        if (backfillMode != null) 'BackfillMode': backfillMode.toValue(),
        if (customEventData != null) 'CustomEventData': customEventData,
        if (description != null) 'Description': description,
        if (flexMatchMode != null) 'FlexMatchMode': flexMatchMode.toValue(),
        if (gameProperties != null) 'GameProperties': gameProperties,
        if (gameSessionData != null) 'GameSessionData': gameSessionData,
        if (gameSessionQueueArns != null)
          'GameSessionQueueArns': gameSessionQueueArns,
        if (notificationTarget != null)
          'NotificationTarget': notificationTarget,
        if (requestTimeoutSeconds != null)
          'RequestTimeoutSeconds': requestTimeoutSeconds,
        if (ruleSetName != null) 'RuleSetName': ruleSetName,
      },
    );

    return UpdateMatchmakingConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Updates the current runtime configuration for the specified fleet, which
  /// tells Amazon GameLift how to launch server processes on instances in the
  /// fleet. You can update a fleet's runtime configuration at any time after
  /// the fleet is created; it does not need to be in an <code>ACTIVE</code>
  /// status.
  ///
  /// To update runtime configuration, specify the fleet ID and provide a
  /// <code>RuntimeConfiguration</code> object with an updated set of server
  /// process configurations.
  ///
  /// Each instance in a Amazon GameLift fleet checks regularly for an updated
  /// runtime configuration and changes how it launches server processes to
  /// comply with the latest version. Existing server processes are not affected
  /// by the update; runtime configuration changes are applied gradually as
  /// existing processes shut down and new processes are launched during Amazon
  /// GameLift's normal process recycling activity.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateFleet</a>
  /// </li>
  /// <li>
  /// <a>ListFleets</a>
  /// </li>
  /// <li>
  /// <a>DeleteFleet</a>
  /// </li>
  /// <li>
  /// <a>DescribeFleetAttributes</a>
  /// </li>
  /// <li>
  /// Update fleets:
  ///
  /// <ul>
  /// <li>
  /// <a>UpdateFleetAttributes</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetCapacity</a>
  /// </li>
  /// <li>
  /// <a>UpdateFleetPortSettings</a>
  /// </li>
  /// <li>
  /// <a>UpdateRuntimeConfiguration</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <a>StartFleetActions</a> or <a>StopFleetActions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidFleetStatusException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for a fleet to update runtime configuration for. You
  /// can use either the fleet ID or ARN value.
  ///
  /// Parameter [runtimeConfiguration] :
  /// Instructions for launching server processes on each instance in the fleet.
  /// Server processes run either a custom game build executable or a Realtime
  /// Servers script. The runtime configuration lists the types of server
  /// processes to run on an instance and includes the following configuration
  /// settings: the server executable or launch script file, launch parameters,
  /// and the number of processes to run concurrently on each instance. A
  /// CreateFleet request must include a runtime configuration with at least one
  /// server process configuration.
  Future<UpdateRuntimeConfigurationOutput> updateRuntimeConfiguration({
    @_s.required String fleetId,
    @_s.required RuntimeConfiguration runtimeConfiguration,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringPattern(
      'fleetId',
      fleetId,
      r'''^fleet-\S+|^arn:.*:fleet\/fleet-\S+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runtimeConfiguration, 'runtimeConfiguration');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateRuntimeConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        'RuntimeConfiguration': runtimeConfiguration,
      },
    );

    return UpdateRuntimeConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Updates Realtime script metadata and content.
  ///
  /// To update script metadata, specify the script ID and provide updated name
  /// and/or version values.
  ///
  /// To update script content, provide an updated zip file by pointing to
  /// either a local file or an Amazon S3 bucket location. You can use either
  /// method regardless of how the original script was uploaded. Use the
  /// <i>Version</i> parameter to track updates to the script.
  ///
  /// If the call is successful, the updated metadata is stored in the script
  /// record and a revised script is uploaded to the Amazon GameLift service.
  /// Once the script is updated and acquired by a fleet instance, the new
  /// version is used for all new game sessions.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html">Amazon
  /// GameLift Realtime Servers</a>
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateScript</a>
  /// </li>
  /// <li>
  /// <a>ListScripts</a>
  /// </li>
  /// <li>
  /// <a>DescribeScript</a>
  /// </li>
  /// <li>
  /// <a>UpdateScript</a>
  /// </li>
  /// <li>
  /// <a>DeleteScript</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [scriptId] :
  /// A unique identifier for a Realtime script to update. You can use either
  /// the script ID or ARN value.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a script. Script names do not
  /// need to be unique.
  ///
  /// Parameter [storageLocation] :
  /// The Amazon S3 location of your Realtime scripts. The storage location must
  /// specify the S3 bucket name, the zip file name (the "key"), and an IAM role
  /// ARN that allows Amazon GameLift to access the S3 storage location. The S3
  /// bucket must be in the same Region as the script you're updating. By
  /// default, Amazon GameLift uploads the latest version of the zip file; if
  /// you have S3 object versioning turned on, you can use the
  /// <code>ObjectVersion</code> parameter to specify an earlier version. To
  /// call this operation with a storage location, you must have IAM PassRole
  /// permission. For more details on IAM roles and PassRole permissions, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/setting-up-role.html">
  /// Set up a role for GameLift access</a>.
  ///
  /// Parameter [version] :
  /// The version that is associated with a build or script. Version strings do
  /// not need to be unique.
  ///
  /// Parameter [zipFile] :
  /// A data object containing your Realtime scripts and dependencies as a zip
  /// file. The zip file can have one or multiple files. Maximum size of a zip
  /// file is 5 MB.
  ///
  /// When using the AWS CLI tool to create a script, this parameter is set to
  /// the zip file name. It must be prepended with the string "fileb://" to
  /// indicate that the file data is a binary object. For example:
  /// <code>--zip-file fileb://myRealtimeScript.zip</code>.
  Future<UpdateScriptOutput> updateScript({
    @_s.required String scriptId,
    String name,
    S3Location storageLocation,
    String version,
    Uint8List zipFile,
  }) async {
    ArgumentError.checkNotNull(scriptId, 'scriptId');
    _s.validateStringPattern(
      'scriptId',
      scriptId,
      r'''^script-\S+|^arn:.*:script\/script-\S+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
    );
    _s.validateStringLength(
      'version',
      version,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.UpdateScript'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScriptId': scriptId,
        if (name != null) 'Name': name,
        if (storageLocation != null) 'StorageLocation': storageLocation,
        if (version != null) 'Version': version,
        if (zipFile != null) 'ZipFile': base64Encode(zipFile),
      },
    );

    return UpdateScriptOutput.fromJson(jsonResponse.body);
  }

  /// Validates the syntax of a matchmaking rule or rule set. This operation
  /// checks that the rule set is using syntactically correct JSON and that it
  /// conforms to allowed property expressions. To validate syntax, provide a
  /// rule set JSON string.
  ///
  /// <b>Learn more</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html">Build
  /// a Rule Set</a>
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingConfigurations</a>
  /// </li>
  /// <li>
  /// <a>UpdateMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingConfiguration</a>
  /// </li>
  /// <li>
  /// <a>CreateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DescribeMatchmakingRuleSets</a>
  /// </li>
  /// <li>
  /// <a>ValidateMatchmakingRuleSet</a>
  /// </li>
  /// <li>
  /// <a>DeleteMatchmakingRuleSet</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [ruleSetBody] :
  /// A collection of matchmaking rules to validate, formatted as a JSON string.
  Future<ValidateMatchmakingRuleSetOutput> validateMatchmakingRuleSet({
    @_s.required String ruleSetBody,
  }) async {
    ArgumentError.checkNotNull(ruleSetBody, 'ruleSetBody');
    _s.validateStringLength(
      'ruleSetBody',
      ruleSetBody,
      1,
      65535,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.ValidateMatchmakingRuleSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleSetBody': ruleSetBody,
      },
    );

    return ValidateMatchmakingRuleSetOutput.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptMatchOutput {
  AcceptMatchOutput();
  factory AcceptMatchOutput.fromJson(Map<String, dynamic> json) =>
      _$AcceptMatchOutputFromJson(json);
}

enum AcceptanceType {
  @_s.JsonValue('ACCEPT')
  accept,
  @_s.JsonValue('REJECT')
  reject,
}

extension on AcceptanceType {
  String toValue() {
    switch (this) {
      case AcceptanceType.accept:
        return 'ACCEPT';
      case AcceptanceType.reject:
        return 'REJECT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Properties that describe an alias resource.
///
/// <ul>
/// <li>
/// <a>CreateAlias</a>
/// </li>
/// <li>
/// <a>ListAliases</a>
/// </li>
/// <li>
/// <a>DescribeAlias</a>
/// </li>
/// <li>
/// <a>UpdateAlias</a>
/// </li>
/// <li>
/// <a>DeleteAlias</a>
/// </li>
/// <li>
/// <a>ResolveAlias</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Alias {
  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a GameLift alias resource and uniquely identifies it.
  /// ARNs are unique across all Regions. In a GameLift alias ARN, the resource ID
  /// matches the alias ID value.
  @_s.JsonKey(name: 'AliasArn')
  final String aliasArn;

  /// A unique identifier for an alias. Alias IDs are unique within a Region.
  @_s.JsonKey(name: 'AliasId')
  final String aliasId;

  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// A human-readable description of an alias.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The time that this data object was last modified. Format is a number
  /// expressed in Unix time as milliseconds (for example "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// A descriptive label that is associated with an alias. Alias names do not
  /// need to be unique.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The routing configuration, including routing type and fleet target, for the
  /// alias.
  @_s.JsonKey(name: 'RoutingStrategy')
  final RoutingStrategy routingStrategy;

  Alias({
    this.aliasArn,
    this.aliasId,
    this.creationTime,
    this.description,
    this.lastUpdatedTime,
    this.name,
    this.routingStrategy,
  });
  factory Alias.fromJson(Map<String, dynamic> json) => _$AliasFromJson(json);
}

/// Values for use in <a>Player</a> attribute key-value pairs. This object lets
/// you specify an attribute value using any of the valid data types: string,
/// number, string array, or data map. Each <code>AttributeValue</code> object
/// can use only one of the available properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AttributeValue {
  /// For number values, expressed as double.
  @_s.JsonKey(name: 'N')
  final double n;

  /// For single string values. Maximum string length is 100 characters.
  @_s.JsonKey(name: 'S')
  final String s;

  /// For a map of up to 10 data type:value pairs. Maximum length for each string
  /// value is 100 characters.
  @_s.JsonKey(name: 'SDM')
  final Map<String, double> sdm;

  /// For a list of up to 10 strings. Maximum length for each string is 100
  /// characters. Duplicate values are not recognized; all occurrences of the
  /// repeated value after the first of a repeated value are ignored.
  @_s.JsonKey(name: 'SL')
  final List<String> sl;

  AttributeValue({
    this.n,
    this.s,
    this.sdm,
    this.sl,
  });
  factory AttributeValue.fromJson(Map<String, dynamic> json) =>
      _$AttributeValueFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeValueToJson(this);
}

/// Temporary access credentials used for uploading game build files to Amazon
/// GameLift. They are valid for a limited time. If they expire before you
/// upload your game build, get a new set by calling
/// <a>RequestUploadCredentials</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AwsCredentials {
  /// Temporary key allowing access to the Amazon GameLift S3 account.
  @_s.JsonKey(name: 'AccessKeyId')
  final String accessKeyId;

  /// Temporary secret key allowing access to the Amazon GameLift S3 account.
  @_s.JsonKey(name: 'SecretAccessKey')
  final String secretAccessKey;

  /// Token used to associate a specific build ID with the files uploaded using
  /// these credentials.
  @_s.JsonKey(name: 'SessionToken')
  final String sessionToken;

  AwsCredentials({
    this.accessKeyId,
    this.secretAccessKey,
    this.sessionToken,
  });
  factory AwsCredentials.fromJson(Map<String, dynamic> json) =>
      _$AwsCredentialsFromJson(json);
}

enum BackfillMode {
  @_s.JsonValue('AUTOMATIC')
  automatic,
  @_s.JsonValue('MANUAL')
  manual,
}

extension on BackfillMode {
  String toValue() {
    switch (this) {
      case BackfillMode.automatic:
        return 'AUTOMATIC';
      case BackfillMode.manual:
        return 'MANUAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum BalancingStrategy {
  @_s.JsonValue('SPOT_ONLY')
  spotOnly,
  @_s.JsonValue('SPOT_PREFERRED')
  spotPreferred,
  @_s.JsonValue('ON_DEMAND_ONLY')
  onDemandOnly,
}

extension on BalancingStrategy {
  String toValue() {
    switch (this) {
      case BalancingStrategy.spotOnly:
        return 'SPOT_ONLY';
      case BalancingStrategy.spotPreferred:
        return 'SPOT_PREFERRED';
      case BalancingStrategy.onDemandOnly:
        return 'ON_DEMAND_ONLY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Properties describing a custom game build.
///
/// <b>Related operations</b>
///
/// <ul>
/// <li>
/// <a>CreateBuild</a>
/// </li>
/// <li>
/// <a>ListBuilds</a>
/// </li>
/// <li>
/// <a>DescribeBuild</a>
/// </li>
/// <li>
/// <a>UpdateBuild</a>
/// </li>
/// <li>
/// <a>DeleteBuild</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Build {
  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a GameLift build resource and uniquely identifies it.
  /// ARNs are unique across all Regions. In a GameLift build ARN, the resource ID
  /// matches the <i>BuildId</i> value.
  @_s.JsonKey(name: 'BuildArn')
  final String buildArn;

  /// A unique identifier for a build.
  @_s.JsonKey(name: 'BuildId')
  final String buildId;

  /// Time stamp indicating when this data object was created. Format is a number
  /// expressed in Unix time as milliseconds (for example "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// A descriptive label that is associated with a build. Build names do not need
  /// to be unique. It can be set using <a>CreateBuild</a> or <a>UpdateBuild</a>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Operating system that the game server binaries are built to run on. This
  /// value determines the type of fleet resources that you can use for this
  /// build.
  @_s.JsonKey(name: 'OperatingSystem')
  final OperatingSystem operatingSystem;

  /// File size of the uploaded game build, expressed in bytes. When the build
  /// status is <code>INITIALIZED</code>, this value is 0.
  @_s.JsonKey(name: 'SizeOnDisk')
  final int sizeOnDisk;

  /// Current status of the build.
  ///
  /// Possible build statuses include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>INITIALIZED</b> -- A new build has been defined, but no files have been
  /// uploaded. You cannot create fleets for builds that are in this status. When
  /// a build is successfully created, the build status is set to this value.
  /// </li>
  /// <li>
  /// <b>READY</b> -- The game build has been successfully uploaded. You can now
  /// create new fleets for this build.
  /// </li>
  /// <li>
  /// <b>FAILED</b> -- The game build upload failed. You cannot create new fleets
  /// for this build.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final BuildStatus status;

  /// Version information that is associated with a build or script. Version
  /// strings do not need to be unique. This value can be set using
  /// <a>CreateBuild</a> or <a>UpdateBuild</a>.
  @_s.JsonKey(name: 'Version')
  final String version;

  Build({
    this.buildArn,
    this.buildId,
    this.creationTime,
    this.name,
    this.operatingSystem,
    this.sizeOnDisk,
    this.status,
    this.version,
  });
  factory Build.fromJson(Map<String, dynamic> json) => _$BuildFromJson(json);
}

enum BuildStatus {
  @_s.JsonValue('INITIALIZED')
  initialized,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('FAILED')
  failed,
}

extension on BuildStatus {
  String toValue() {
    switch (this) {
      case BuildStatus.initialized:
        return 'INITIALIZED';
      case BuildStatus.ready:
        return 'READY';
      case BuildStatus.failed:
        return 'FAILED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the use of a TLS/SSL certificate for a fleet. TLS
/// certificate generation is enabled at the fleet level, with one certificate
/// generated for the fleet. When this feature is enabled, the certificate can
/// be retrieved using the <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk.html">GameLift
/// Server SDK</a> call <code>GetInstanceCertificate</code>. All instances in a
/// fleet share the same certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CertificateConfiguration {
  /// Indicates whether a TLS/SSL certificate was generated for a fleet.
  ///
  ///
  ///
  ///
  @_s.JsonKey(name: 'CertificateType')
  final CertificateType certificateType;

  CertificateConfiguration({
    @_s.required this.certificateType,
  });
  factory CertificateConfiguration.fromJson(Map<String, dynamic> json) =>
      _$CertificateConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateConfigurationToJson(this);
}

enum CertificateType {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('GENERATED')
  generated,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClaimGameServerOutput {
  /// Object that describes the newly claimed game server.
  @_s.JsonKey(name: 'GameServer')
  final GameServer gameServer;

  ClaimGameServerOutput({
    this.gameServer,
  });
  factory ClaimGameServerOutput.fromJson(Map<String, dynamic> json) =>
      _$ClaimGameServerOutputFromJson(json);
}

enum ComparisonOperatorType {
  @_s.JsonValue('GreaterThanOrEqualToThreshold')
  greaterThanOrEqualToThreshold,
  @_s.JsonValue('GreaterThanThreshold')
  greaterThanThreshold,
  @_s.JsonValue('LessThanThreshold')
  lessThanThreshold,
  @_s.JsonValue('LessThanOrEqualToThreshold')
  lessThanOrEqualToThreshold,
}

extension on ComparisonOperatorType {
  String toValue() {
    switch (this) {
      case ComparisonOperatorType.greaterThanOrEqualToThreshold:
        return 'GreaterThanOrEqualToThreshold';
      case ComparisonOperatorType.greaterThanThreshold:
        return 'GreaterThanThreshold';
      case ComparisonOperatorType.lessThanThreshold:
        return 'LessThanThreshold';
      case ComparisonOperatorType.lessThanOrEqualToThreshold:
        return 'LessThanOrEqualToThreshold';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAliasOutput {
  /// The newly created alias resource.
  @_s.JsonKey(name: 'Alias')
  final Alias alias;

  CreateAliasOutput({
    this.alias,
  });
  factory CreateAliasOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateAliasOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBuildOutput {
  /// The newly created build resource, including a unique build IDs and status.
  @_s.JsonKey(name: 'Build')
  final Build build;

  /// Amazon S3 location for your game build file, including bucket name and key.
  @_s.JsonKey(name: 'StorageLocation')
  final S3Location storageLocation;

  /// This element is returned only when the operation is called without a storage
  /// location. It contains credentials to use when you are uploading a build file
  /// to an S3 bucket that is owned by Amazon GameLift. Credentials have a limited
  /// life span. To refresh these credentials, call
  /// <a>RequestUploadCredentials</a>.
  @_s.JsonKey(name: 'UploadCredentials')
  final AwsCredentials uploadCredentials;

  CreateBuildOutput({
    this.build,
    this.storageLocation,
    this.uploadCredentials,
  });
  factory CreateBuildOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateBuildOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFleetOutput {
  /// Properties for the newly created fleet.
  @_s.JsonKey(name: 'FleetAttributes')
  final FleetAttributes fleetAttributes;

  CreateFleetOutput({
    this.fleetAttributes,
  });
  factory CreateFleetOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateFleetOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGameServerGroupOutput {
  /// The newly created game server group object, including the new ARN value for
  /// the GameLift FleetIQ game server group and the object's status. The EC2 Auto
  /// Scaling group ARN is initially null, since the group has not yet been
  /// created. This value is added once the game server group status reaches
  /// <code>ACTIVE</code>.
  @_s.JsonKey(name: 'GameServerGroup')
  final GameServerGroup gameServerGroup;

  CreateGameServerGroupOutput({
    this.gameServerGroup,
  });
  factory CreateGameServerGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateGameServerGroupOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGameSessionOutput {
  /// Object that describes the newly created game session record.
  @_s.JsonKey(name: 'GameSession')
  final GameSession gameSession;

  CreateGameSessionOutput({
    this.gameSession,
  });
  factory CreateGameSessionOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateGameSessionOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGameSessionQueueOutput {
  /// An object that describes the newly created game session queue.
  @_s.JsonKey(name: 'GameSessionQueue')
  final GameSessionQueue gameSessionQueue;

  CreateGameSessionQueueOutput({
    this.gameSessionQueue,
  });
  factory CreateGameSessionQueueOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateGameSessionQueueOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMatchmakingConfigurationOutput {
  /// Object that describes the newly created matchmaking configuration.
  @_s.JsonKey(name: 'Configuration')
  final MatchmakingConfiguration configuration;

  CreateMatchmakingConfigurationOutput({
    this.configuration,
  });
  factory CreateMatchmakingConfigurationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateMatchmakingConfigurationOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMatchmakingRuleSetOutput {
  /// The newly created matchmaking rule set.
  @_s.JsonKey(name: 'RuleSet')
  final MatchmakingRuleSet ruleSet;

  CreateMatchmakingRuleSetOutput({
    @_s.required this.ruleSet,
  });
  factory CreateMatchmakingRuleSetOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateMatchmakingRuleSetOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePlayerSessionOutput {
  /// Object that describes the newly created player session record.
  @_s.JsonKey(name: 'PlayerSession')
  final PlayerSession playerSession;

  CreatePlayerSessionOutput({
    this.playerSession,
  });
  factory CreatePlayerSessionOutput.fromJson(Map<String, dynamic> json) =>
      _$CreatePlayerSessionOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePlayerSessionsOutput {
  /// A collection of player session objects created for the added players.
  @_s.JsonKey(name: 'PlayerSessions')
  final List<PlayerSession> playerSessions;

  CreatePlayerSessionsOutput({
    this.playerSessions,
  });
  factory CreatePlayerSessionsOutput.fromJson(Map<String, dynamic> json) =>
      _$CreatePlayerSessionsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateScriptOutput {
  /// The newly created script record with a unique script ID and ARN. The new
  /// script's storage location reflects an Amazon S3 location: (1) If the script
  /// was uploaded from an S3 bucket under your account, the storage location
  /// reflects the information that was provided in the <i>CreateScript</i>
  /// request; (2) If the script file was uploaded from a local zip file, the
  /// storage location reflects an S3 location controls by the Amazon GameLift
  /// service.
  @_s.JsonKey(name: 'Script')
  final Script script;

  CreateScriptOutput({
    this.script,
  });
  factory CreateScriptOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateScriptOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVpcPeeringAuthorizationOutput {
  /// Details on the requested VPC peering authorization, including expiration.
  @_s.JsonKey(name: 'VpcPeeringAuthorization')
  final VpcPeeringAuthorization vpcPeeringAuthorization;

  CreateVpcPeeringAuthorizationOutput({
    this.vpcPeeringAuthorization,
  });
  factory CreateVpcPeeringAuthorizationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateVpcPeeringAuthorizationOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVpcPeeringConnectionOutput {
  CreateVpcPeeringConnectionOutput();
  factory CreateVpcPeeringConnectionOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateVpcPeeringConnectionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGameServerGroupOutput {
  /// An object that describes the deleted game server group resource, with status
  /// updated to <code>DELETE_SCHEDULED</code>.
  @_s.JsonKey(name: 'GameServerGroup')
  final GameServerGroup gameServerGroup;

  DeleteGameServerGroupOutput({
    this.gameServerGroup,
  });
  factory DeleteGameServerGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteGameServerGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGameSessionQueueOutput {
  DeleteGameSessionQueueOutput();
  factory DeleteGameSessionQueueOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteGameSessionQueueOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMatchmakingConfigurationOutput {
  DeleteMatchmakingConfigurationOutput();
  factory DeleteMatchmakingConfigurationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteMatchmakingConfigurationOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMatchmakingRuleSetOutput {
  DeleteMatchmakingRuleSetOutput();
  factory DeleteMatchmakingRuleSetOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteMatchmakingRuleSetOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVpcPeeringAuthorizationOutput {
  DeleteVpcPeeringAuthorizationOutput();
  factory DeleteVpcPeeringAuthorizationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteVpcPeeringAuthorizationOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVpcPeeringConnectionOutput {
  DeleteVpcPeeringConnectionOutput();
  factory DeleteVpcPeeringConnectionOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteVpcPeeringConnectionOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAliasOutput {
  /// The requested alias resource.
  @_s.JsonKey(name: 'Alias')
  final Alias alias;

  DescribeAliasOutput({
    this.alias,
  });
  factory DescribeAliasOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeAliasOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBuildOutput {
  /// Set of properties describing the requested build.
  @_s.JsonKey(name: 'Build')
  final Build build;

  DescribeBuildOutput({
    this.build,
  });
  factory DescribeBuildOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeBuildOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEC2InstanceLimitsOutput {
  /// The maximum number of instances for the specified instance type.
  @_s.JsonKey(name: 'EC2InstanceLimits')
  final List<EC2InstanceLimit> eC2InstanceLimits;

  DescribeEC2InstanceLimitsOutput({
    this.eC2InstanceLimits,
  });
  factory DescribeEC2InstanceLimitsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeEC2InstanceLimitsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFleetAttributesOutput {
  /// A collection of objects containing attribute metadata for each requested
  /// fleet ID. Attribute objects are returned only for fleets that currently
  /// exist.
  @_s.JsonKey(name: 'FleetAttributes')
  final List<FleetAttributes> fleetAttributes;

  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeFleetAttributesOutput({
    this.fleetAttributes,
    this.nextToken,
  });
  factory DescribeFleetAttributesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeFleetAttributesOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFleetCapacityOutput {
  /// A collection of objects containing capacity information for each requested
  /// fleet ID. Leave this parameter empty to retrieve capacity information for
  /// all fleets.
  @_s.JsonKey(name: 'FleetCapacity')
  final List<FleetCapacity> fleetCapacity;

  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeFleetCapacityOutput({
    this.fleetCapacity,
    this.nextToken,
  });
  factory DescribeFleetCapacityOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeFleetCapacityOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFleetEventsOutput {
  /// A collection of objects containing event log entries for the specified
  /// fleet.
  @_s.JsonKey(name: 'Events')
  final List<Event> events;

  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeFleetEventsOutput({
    this.events,
    this.nextToken,
  });
  factory DescribeFleetEventsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeFleetEventsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFleetPortSettingsOutput {
  /// The port settings for the requested fleet ID.
  @_s.JsonKey(name: 'InboundPermissions')
  final List<IpPermission> inboundPermissions;

  DescribeFleetPortSettingsOutput({
    this.inboundPermissions,
  });
  factory DescribeFleetPortSettingsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeFleetPortSettingsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFleetUtilizationOutput {
  /// A collection of objects containing utilization information for each
  /// requested fleet ID.
  @_s.JsonKey(name: 'FleetUtilization')
  final List<FleetUtilization> fleetUtilization;

  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeFleetUtilizationOutput({
    this.fleetUtilization,
    this.nextToken,
  });
  factory DescribeFleetUtilizationOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeFleetUtilizationOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGameServerGroupOutput {
  /// An object with the property settings for the requested game server group
  /// resource.
  @_s.JsonKey(name: 'GameServerGroup')
  final GameServerGroup gameServerGroup;

  DescribeGameServerGroupOutput({
    this.gameServerGroup,
  });
  factory DescribeGameServerGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeGameServerGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGameServerInstancesOutput {
  /// The collection of requested game server instances.
  @_s.JsonKey(name: 'GameServerInstances')
  final List<GameServerInstance> gameServerInstances;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeGameServerInstancesOutput({
    this.gameServerInstances,
    this.nextToken,
  });
  factory DescribeGameServerInstancesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeGameServerInstancesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGameServerOutput {
  /// Object that describes the requested game server.
  @_s.JsonKey(name: 'GameServer')
  final GameServer gameServer;

  DescribeGameServerOutput({
    this.gameServer,
  });
  factory DescribeGameServerOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeGameServerOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGameSessionDetailsOutput {
  /// A collection of objects containing game session properties and the
  /// protection policy currently in force for each session matching the request.
  @_s.JsonKey(name: 'GameSessionDetails')
  final List<GameSessionDetail> gameSessionDetails;

  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeGameSessionDetailsOutput({
    this.gameSessionDetails,
    this.nextToken,
  });
  factory DescribeGameSessionDetailsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeGameSessionDetailsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGameSessionPlacementOutput {
  /// Object that describes the requested game session placement.
  @_s.JsonKey(name: 'GameSessionPlacement')
  final GameSessionPlacement gameSessionPlacement;

  DescribeGameSessionPlacementOutput({
    this.gameSessionPlacement,
  });
  factory DescribeGameSessionPlacementOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeGameSessionPlacementOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGameSessionQueuesOutput {
  /// A collection of objects that describe the requested game session queues.
  @_s.JsonKey(name: 'GameSessionQueues')
  final List<GameSessionQueue> gameSessionQueues;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeGameSessionQueuesOutput({
    this.gameSessionQueues,
    this.nextToken,
  });
  factory DescribeGameSessionQueuesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeGameSessionQueuesOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGameSessionsOutput {
  /// A collection of objects containing game session properties for each session
  /// matching the request.
  @_s.JsonKey(name: 'GameSessions')
  final List<GameSession> gameSessions;

  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeGameSessionsOutput({
    this.gameSessions,
    this.nextToken,
  });
  factory DescribeGameSessionsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeGameSessionsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstancesOutput {
  /// A collection of objects containing properties for each instance returned.
  @_s.JsonKey(name: 'Instances')
  final List<Instance> instances;

  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeInstancesOutput({
    this.instances,
    this.nextToken,
  });
  factory DescribeInstancesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeInstancesOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMatchmakingConfigurationsOutput {
  /// A collection of requested matchmaking configurations.
  @_s.JsonKey(name: 'Configurations')
  final List<MatchmakingConfiguration> configurations;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeMatchmakingConfigurationsOutput({
    this.configurations,
    this.nextToken,
  });
  factory DescribeMatchmakingConfigurationsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMatchmakingConfigurationsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMatchmakingOutput {
  /// A collection of existing matchmaking ticket objects matching the request.
  @_s.JsonKey(name: 'TicketList')
  final List<MatchmakingTicket> ticketList;

  DescribeMatchmakingOutput({
    this.ticketList,
  });
  factory DescribeMatchmakingOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeMatchmakingOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMatchmakingRuleSetsOutput {
  /// A collection of requested matchmaking rule set objects.
  @_s.JsonKey(name: 'RuleSets')
  final List<MatchmakingRuleSet> ruleSets;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeMatchmakingRuleSetsOutput({
    @_s.required this.ruleSets,
    this.nextToken,
  });
  factory DescribeMatchmakingRuleSetsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMatchmakingRuleSetsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePlayerSessionsOutput {
  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A collection of objects containing properties for each player session that
  /// matches the request.
  @_s.JsonKey(name: 'PlayerSessions')
  final List<PlayerSession> playerSessions;

  DescribePlayerSessionsOutput({
    this.nextToken,
    this.playerSessions,
  });
  factory DescribePlayerSessionsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribePlayerSessionsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRuntimeConfigurationOutput {
  /// Instructions describing how server processes should be launched and
  /// maintained on each instance in the fleet.
  @_s.JsonKey(name: 'RuntimeConfiguration')
  final RuntimeConfiguration runtimeConfiguration;

  DescribeRuntimeConfigurationOutput({
    this.runtimeConfiguration,
  });
  factory DescribeRuntimeConfigurationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRuntimeConfigurationOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScalingPoliciesOutput {
  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A collection of objects containing the scaling policies matching the
  /// request.
  @_s.JsonKey(name: 'ScalingPolicies')
  final List<ScalingPolicy> scalingPolicies;

  DescribeScalingPoliciesOutput({
    this.nextToken,
    this.scalingPolicies,
  });
  factory DescribeScalingPoliciesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeScalingPoliciesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScriptOutput {
  /// A set of properties describing the requested script.
  @_s.JsonKey(name: 'Script')
  final Script script;

  DescribeScriptOutput({
    this.script,
  });
  factory DescribeScriptOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeScriptOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVpcPeeringAuthorizationsOutput {
  /// A collection of objects that describe all valid VPC peering operations for
  /// the current AWS account.
  @_s.JsonKey(name: 'VpcPeeringAuthorizations')
  final List<VpcPeeringAuthorization> vpcPeeringAuthorizations;

  DescribeVpcPeeringAuthorizationsOutput({
    this.vpcPeeringAuthorizations,
  });
  factory DescribeVpcPeeringAuthorizationsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeVpcPeeringAuthorizationsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVpcPeeringConnectionsOutput {
  /// A collection of VPC peering connection records that match the request.
  @_s.JsonKey(name: 'VpcPeeringConnections')
  final List<VpcPeeringConnection> vpcPeeringConnections;

  DescribeVpcPeeringConnectionsOutput({
    this.vpcPeeringConnections,
  });
  factory DescribeVpcPeeringConnectionsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeVpcPeeringConnectionsOutputFromJson(json);
}

/// Player information for use when creating player sessions using a game
/// session placement request with <a>StartGameSessionPlacement</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DesiredPlayerSession {
  /// Developer-defined information related to a player. Amazon GameLift does not
  /// use this data, so it can be formatted as needed for use in the game.
  @_s.JsonKey(name: 'PlayerData')
  final String playerData;

  /// A unique identifier for a player to associate with the player session.
  @_s.JsonKey(name: 'PlayerId')
  final String playerId;

  DesiredPlayerSession({
    this.playerData,
    this.playerId,
  });
  Map<String, dynamic> toJson() => _$DesiredPlayerSessionToJson(this);
}

/// Current status of fleet capacity. The number of active instances should
/// match or be in the process of matching the number of desired instances.
/// Pending and terminating counts are non-zero only if fleet capacity is
/// adjusting to an <a>UpdateFleetCapacity</a> request, or if access to
/// resources is temporarily affected.
///
/// <ul>
/// <li>
/// <a>CreateFleet</a>
/// </li>
/// <li>
/// <a>ListFleets</a>
/// </li>
/// <li>
/// <a>DeleteFleet</a>
/// </li>
/// <li>
/// <a>DescribeFleetAttributes</a>
/// </li>
/// <li>
/// <a>UpdateFleetAttributes</a>
/// </li>
/// <li>
/// <a>StartFleetActions</a> or <a>StopFleetActions</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EC2InstanceCounts {
  /// Actual number of active instances in the fleet.
  @_s.JsonKey(name: 'ACTIVE')
  final int active;

  /// Ideal number of active instances in the fleet.
  @_s.JsonKey(name: 'DESIRED')
  final int desired;

  /// Number of active instances in the fleet that are not currently hosting a
  /// game session.
  @_s.JsonKey(name: 'IDLE')
  final int idle;

  /// The maximum value allowed for the fleet's instance count.
  @_s.JsonKey(name: 'MAXIMUM')
  final int maximum;

  /// The minimum value allowed for the fleet's instance count.
  @_s.JsonKey(name: 'MINIMUM')
  final int minimum;

  /// Number of instances in the fleet that are starting but not yet active.
  @_s.JsonKey(name: 'PENDING')
  final int pending;

  /// Number of instances in the fleet that are no longer active but haven't yet
  /// been terminated.
  @_s.JsonKey(name: 'TERMINATING')
  final int terminating;

  EC2InstanceCounts({
    this.active,
    this.desired,
    this.idle,
    this.maximum,
    this.minimum,
    this.pending,
    this.terminating,
  });
  factory EC2InstanceCounts.fromJson(Map<String, dynamic> json) =>
      _$EC2InstanceCountsFromJson(json);
}

/// The maximum number of instances allowed based on the Amazon Elastic Compute
/// Cloud (Amazon EC2) instance type. Instance limits can be retrieved by
/// calling <a>DescribeEC2InstanceLimits</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EC2InstanceLimit {
  /// Number of instances of the specified type that are currently in use by this
  /// AWS account.
  @_s.JsonKey(name: 'CurrentInstances')
  final int currentInstances;

  /// Name of an EC2 instance type that is supported in Amazon GameLift. A fleet
  /// instance type determines the computing resources of each instance in the
  /// fleet, including CPU, memory, storage, and networking capacity. Amazon
  /// GameLift supports the following EC2 instance types. See <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a> for detailed descriptions.
  @_s.JsonKey(name: 'EC2InstanceType')
  final EC2InstanceType eC2InstanceType;

  /// Number of instances allowed.
  @_s.JsonKey(name: 'InstanceLimit')
  final int instanceLimit;

  EC2InstanceLimit({
    this.currentInstances,
    this.eC2InstanceType,
    this.instanceLimit,
  });
  factory EC2InstanceLimit.fromJson(Map<String, dynamic> json) =>
      _$EC2InstanceLimitFromJson(json);
}

enum EC2InstanceType {
  @_s.JsonValue('t2.micro')
  t2Micro,
  @_s.JsonValue('t2.small')
  t2Small,
  @_s.JsonValue('t2.medium')
  t2Medium,
  @_s.JsonValue('t2.large')
  t2Large,
  @_s.JsonValue('c3.large')
  c3Large,
  @_s.JsonValue('c3.xlarge')
  c3Xlarge,
  @_s.JsonValue('c3.2xlarge')
  c3_2xlarge,
  @_s.JsonValue('c3.4xlarge')
  c3_4xlarge,
  @_s.JsonValue('c3.8xlarge')
  c3_8xlarge,
  @_s.JsonValue('c4.large')
  c4Large,
  @_s.JsonValue('c4.xlarge')
  c4Xlarge,
  @_s.JsonValue('c4.2xlarge')
  c4_2xlarge,
  @_s.JsonValue('c4.4xlarge')
  c4_4xlarge,
  @_s.JsonValue('c4.8xlarge')
  c4_8xlarge,
  @_s.JsonValue('c5.large')
  c5Large,
  @_s.JsonValue('c5.xlarge')
  c5Xlarge,
  @_s.JsonValue('c5.2xlarge')
  c5_2xlarge,
  @_s.JsonValue('c5.4xlarge')
  c5_4xlarge,
  @_s.JsonValue('c5.9xlarge')
  c5_9xlarge,
  @_s.JsonValue('c5.12xlarge')
  c5_12xlarge,
  @_s.JsonValue('c5.18xlarge')
  c5_18xlarge,
  @_s.JsonValue('c5.24xlarge')
  c5_24xlarge,
  @_s.JsonValue('c5a.large')
  c5aLarge,
  @_s.JsonValue('c5a.xlarge')
  c5aXlarge,
  @_s.JsonValue('c5a.2xlarge')
  c5a_2xlarge,
  @_s.JsonValue('c5a.4xlarge')
  c5a_4xlarge,
  @_s.JsonValue('c5a.8xlarge')
  c5a_8xlarge,
  @_s.JsonValue('c5a.12xlarge')
  c5a_12xlarge,
  @_s.JsonValue('c5a.16xlarge')
  c5a_16xlarge,
  @_s.JsonValue('c5a.24xlarge')
  c5a_24xlarge,
  @_s.JsonValue('r3.large')
  r3Large,
  @_s.JsonValue('r3.xlarge')
  r3Xlarge,
  @_s.JsonValue('r3.2xlarge')
  r3_2xlarge,
  @_s.JsonValue('r3.4xlarge')
  r3_4xlarge,
  @_s.JsonValue('r3.8xlarge')
  r3_8xlarge,
  @_s.JsonValue('r4.large')
  r4Large,
  @_s.JsonValue('r4.xlarge')
  r4Xlarge,
  @_s.JsonValue('r4.2xlarge')
  r4_2xlarge,
  @_s.JsonValue('r4.4xlarge')
  r4_4xlarge,
  @_s.JsonValue('r4.8xlarge')
  r4_8xlarge,
  @_s.JsonValue('r4.16xlarge')
  r4_16xlarge,
  @_s.JsonValue('r5.large')
  r5Large,
  @_s.JsonValue('r5.xlarge')
  r5Xlarge,
  @_s.JsonValue('r5.2xlarge')
  r5_2xlarge,
  @_s.JsonValue('r5.4xlarge')
  r5_4xlarge,
  @_s.JsonValue('r5.8xlarge')
  r5_8xlarge,
  @_s.JsonValue('r5.12xlarge')
  r5_12xlarge,
  @_s.JsonValue('r5.16xlarge')
  r5_16xlarge,
  @_s.JsonValue('r5.24xlarge')
  r5_24xlarge,
  @_s.JsonValue('r5a.large')
  r5aLarge,
  @_s.JsonValue('r5a.xlarge')
  r5aXlarge,
  @_s.JsonValue('r5a.2xlarge')
  r5a_2xlarge,
  @_s.JsonValue('r5a.4xlarge')
  r5a_4xlarge,
  @_s.JsonValue('r5a.8xlarge')
  r5a_8xlarge,
  @_s.JsonValue('r5a.12xlarge')
  r5a_12xlarge,
  @_s.JsonValue('r5a.16xlarge')
  r5a_16xlarge,
  @_s.JsonValue('r5a.24xlarge')
  r5a_24xlarge,
  @_s.JsonValue('m3.medium')
  m3Medium,
  @_s.JsonValue('m3.large')
  m3Large,
  @_s.JsonValue('m3.xlarge')
  m3Xlarge,
  @_s.JsonValue('m3.2xlarge')
  m3_2xlarge,
  @_s.JsonValue('m4.large')
  m4Large,
  @_s.JsonValue('m4.xlarge')
  m4Xlarge,
  @_s.JsonValue('m4.2xlarge')
  m4_2xlarge,
  @_s.JsonValue('m4.4xlarge')
  m4_4xlarge,
  @_s.JsonValue('m4.10xlarge')
  m4_10xlarge,
  @_s.JsonValue('m5.large')
  m5Large,
  @_s.JsonValue('m5.xlarge')
  m5Xlarge,
  @_s.JsonValue('m5.2xlarge')
  m5_2xlarge,
  @_s.JsonValue('m5.4xlarge')
  m5_4xlarge,
  @_s.JsonValue('m5.8xlarge')
  m5_8xlarge,
  @_s.JsonValue('m5.12xlarge')
  m5_12xlarge,
  @_s.JsonValue('m5.16xlarge')
  m5_16xlarge,
  @_s.JsonValue('m5.24xlarge')
  m5_24xlarge,
  @_s.JsonValue('m5a.large')
  m5aLarge,
  @_s.JsonValue('m5a.xlarge')
  m5aXlarge,
  @_s.JsonValue('m5a.2xlarge')
  m5a_2xlarge,
  @_s.JsonValue('m5a.4xlarge')
  m5a_4xlarge,
  @_s.JsonValue('m5a.8xlarge')
  m5a_8xlarge,
  @_s.JsonValue('m5a.12xlarge')
  m5a_12xlarge,
  @_s.JsonValue('m5a.16xlarge')
  m5a_16xlarge,
  @_s.JsonValue('m5a.24xlarge')
  m5a_24xlarge,
}

extension on EC2InstanceType {
  String toValue() {
    switch (this) {
      case EC2InstanceType.t2Micro:
        return 't2.micro';
      case EC2InstanceType.t2Small:
        return 't2.small';
      case EC2InstanceType.t2Medium:
        return 't2.medium';
      case EC2InstanceType.t2Large:
        return 't2.large';
      case EC2InstanceType.c3Large:
        return 'c3.large';
      case EC2InstanceType.c3Xlarge:
        return 'c3.xlarge';
      case EC2InstanceType.c3_2xlarge:
        return 'c3.2xlarge';
      case EC2InstanceType.c3_4xlarge:
        return 'c3.4xlarge';
      case EC2InstanceType.c3_8xlarge:
        return 'c3.8xlarge';
      case EC2InstanceType.c4Large:
        return 'c4.large';
      case EC2InstanceType.c4Xlarge:
        return 'c4.xlarge';
      case EC2InstanceType.c4_2xlarge:
        return 'c4.2xlarge';
      case EC2InstanceType.c4_4xlarge:
        return 'c4.4xlarge';
      case EC2InstanceType.c4_8xlarge:
        return 'c4.8xlarge';
      case EC2InstanceType.c5Large:
        return 'c5.large';
      case EC2InstanceType.c5Xlarge:
        return 'c5.xlarge';
      case EC2InstanceType.c5_2xlarge:
        return 'c5.2xlarge';
      case EC2InstanceType.c5_4xlarge:
        return 'c5.4xlarge';
      case EC2InstanceType.c5_9xlarge:
        return 'c5.9xlarge';
      case EC2InstanceType.c5_12xlarge:
        return 'c5.12xlarge';
      case EC2InstanceType.c5_18xlarge:
        return 'c5.18xlarge';
      case EC2InstanceType.c5_24xlarge:
        return 'c5.24xlarge';
      case EC2InstanceType.c5aLarge:
        return 'c5a.large';
      case EC2InstanceType.c5aXlarge:
        return 'c5a.xlarge';
      case EC2InstanceType.c5a_2xlarge:
        return 'c5a.2xlarge';
      case EC2InstanceType.c5a_4xlarge:
        return 'c5a.4xlarge';
      case EC2InstanceType.c5a_8xlarge:
        return 'c5a.8xlarge';
      case EC2InstanceType.c5a_12xlarge:
        return 'c5a.12xlarge';
      case EC2InstanceType.c5a_16xlarge:
        return 'c5a.16xlarge';
      case EC2InstanceType.c5a_24xlarge:
        return 'c5a.24xlarge';
      case EC2InstanceType.r3Large:
        return 'r3.large';
      case EC2InstanceType.r3Xlarge:
        return 'r3.xlarge';
      case EC2InstanceType.r3_2xlarge:
        return 'r3.2xlarge';
      case EC2InstanceType.r3_4xlarge:
        return 'r3.4xlarge';
      case EC2InstanceType.r3_8xlarge:
        return 'r3.8xlarge';
      case EC2InstanceType.r4Large:
        return 'r4.large';
      case EC2InstanceType.r4Xlarge:
        return 'r4.xlarge';
      case EC2InstanceType.r4_2xlarge:
        return 'r4.2xlarge';
      case EC2InstanceType.r4_4xlarge:
        return 'r4.4xlarge';
      case EC2InstanceType.r4_8xlarge:
        return 'r4.8xlarge';
      case EC2InstanceType.r4_16xlarge:
        return 'r4.16xlarge';
      case EC2InstanceType.r5Large:
        return 'r5.large';
      case EC2InstanceType.r5Xlarge:
        return 'r5.xlarge';
      case EC2InstanceType.r5_2xlarge:
        return 'r5.2xlarge';
      case EC2InstanceType.r5_4xlarge:
        return 'r5.4xlarge';
      case EC2InstanceType.r5_8xlarge:
        return 'r5.8xlarge';
      case EC2InstanceType.r5_12xlarge:
        return 'r5.12xlarge';
      case EC2InstanceType.r5_16xlarge:
        return 'r5.16xlarge';
      case EC2InstanceType.r5_24xlarge:
        return 'r5.24xlarge';
      case EC2InstanceType.r5aLarge:
        return 'r5a.large';
      case EC2InstanceType.r5aXlarge:
        return 'r5a.xlarge';
      case EC2InstanceType.r5a_2xlarge:
        return 'r5a.2xlarge';
      case EC2InstanceType.r5a_4xlarge:
        return 'r5a.4xlarge';
      case EC2InstanceType.r5a_8xlarge:
        return 'r5a.8xlarge';
      case EC2InstanceType.r5a_12xlarge:
        return 'r5a.12xlarge';
      case EC2InstanceType.r5a_16xlarge:
        return 'r5a.16xlarge';
      case EC2InstanceType.r5a_24xlarge:
        return 'r5a.24xlarge';
      case EC2InstanceType.m3Medium:
        return 'm3.medium';
      case EC2InstanceType.m3Large:
        return 'm3.large';
      case EC2InstanceType.m3Xlarge:
        return 'm3.xlarge';
      case EC2InstanceType.m3_2xlarge:
        return 'm3.2xlarge';
      case EC2InstanceType.m4Large:
        return 'm4.large';
      case EC2InstanceType.m4Xlarge:
        return 'm4.xlarge';
      case EC2InstanceType.m4_2xlarge:
        return 'm4.2xlarge';
      case EC2InstanceType.m4_4xlarge:
        return 'm4.4xlarge';
      case EC2InstanceType.m4_10xlarge:
        return 'm4.10xlarge';
      case EC2InstanceType.m5Large:
        return 'm5.large';
      case EC2InstanceType.m5Xlarge:
        return 'm5.xlarge';
      case EC2InstanceType.m5_2xlarge:
        return 'm5.2xlarge';
      case EC2InstanceType.m5_4xlarge:
        return 'm5.4xlarge';
      case EC2InstanceType.m5_8xlarge:
        return 'm5.8xlarge';
      case EC2InstanceType.m5_12xlarge:
        return 'm5.12xlarge';
      case EC2InstanceType.m5_16xlarge:
        return 'm5.16xlarge';
      case EC2InstanceType.m5_24xlarge:
        return 'm5.24xlarge';
      case EC2InstanceType.m5aLarge:
        return 'm5a.large';
      case EC2InstanceType.m5aXlarge:
        return 'm5a.xlarge';
      case EC2InstanceType.m5a_2xlarge:
        return 'm5a.2xlarge';
      case EC2InstanceType.m5a_4xlarge:
        return 'm5a.4xlarge';
      case EC2InstanceType.m5a_8xlarge:
        return 'm5a.8xlarge';
      case EC2InstanceType.m5a_12xlarge:
        return 'm5a.12xlarge';
      case EC2InstanceType.m5a_16xlarge:
        return 'm5a.16xlarge';
      case EC2InstanceType.m5a_24xlarge:
        return 'm5a.24xlarge';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Log entry describing an event that involves Amazon GameLift resources (such
/// as a fleet). In addition to tracking activity, event codes and messages can
/// provide additional information for troubleshooting and debugging problems.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Event {
  /// The type of event being logged.
  ///
  /// <b>Fleet creation events (ordered by fleet creation activity):</b>
  ///
  /// <ul>
  /// <li>
  /// FLEET_CREATED -- A fleet resource was successfully created with a status of
  /// <code>NEW</code>. Event messaging includes the fleet ID.
  /// </li>
  /// <li>
  /// FLEET_STATE_DOWNLOADING -- Fleet status changed from <code>NEW</code> to
  /// <code>DOWNLOADING</code>. The compressed build has started downloading to a
  /// fleet instance for installation.
  /// </li>
  /// <li>
  /// FLEET_BINARY_DOWNLOAD_FAILED -- The build failed to download to the fleet
  /// instance.
  /// </li>
  /// <li>
  /// FLEET_CREATION_EXTRACTING_BUILD – The game server build was successfully
  /// downloaded to an instance, and the build files are now being extracted from
  /// the uploaded build and saved to an instance. Failure at this stage prevents
  /// a fleet from moving to <code>ACTIVE</code> status. Logs for this stage
  /// display a list of the files that are extracted and saved on the instance.
  /// Access the logs by using the URL in <i>PreSignedLogUrl</i>.
  /// </li>
  /// <li>
  /// FLEET_CREATION_RUNNING_INSTALLER – The game server build files were
  /// successfully extracted, and the Amazon GameLift is now running the build's
  /// install script (if one is included). Failure in this stage prevents a fleet
  /// from moving to <code>ACTIVE</code> status. Logs for this stage list the
  /// installation steps and whether or not the install completed successfully.
  /// Access the logs by using the URL in <i>PreSignedLogUrl</i>.
  /// </li>
  /// <li>
  /// FLEET_CREATION_VALIDATING_RUNTIME_CONFIG -- The build process was
  /// successful, and the Amazon GameLift is now verifying that the game server
  /// launch paths, which are specified in the fleet's runtime configuration,
  /// exist. If any listed launch path exists, Amazon GameLift tries to launch a
  /// game server process and waits for the process to report ready. Failures in
  /// this stage prevent a fleet from moving to <code>ACTIVE</code> status. Logs
  /// for this stage list the launch paths in the runtime configuration and
  /// indicate whether each is found. Access the logs by using the URL in
  /// <i>PreSignedLogUrl</i>.
  /// </li>
  /// <li>
  /// FLEET_STATE_VALIDATING -- Fleet status changed from <code>DOWNLOADING</code>
  /// to <code>VALIDATING</code>.
  /// </li>
  /// <li>
  /// FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND -- Validation of the runtime
  /// configuration failed because the executable specified in a launch path does
  /// not exist on the instance.
  /// </li>
  /// <li>
  /// FLEET_STATE_BUILDING -- Fleet status changed from <code>VALIDATING</code> to
  /// <code>BUILDING</code>.
  /// </li>
  /// <li>
  /// FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE -- Validation of the runtime
  /// configuration failed because the executable specified in a launch path
  /// failed to run on the fleet instance.
  /// </li>
  /// <li>
  /// FLEET_STATE_ACTIVATING -- Fleet status changed from <code>BUILDING</code> to
  /// <code>ACTIVATING</code>.
  /// </li>
  /// <li>
  /// FLEET_ACTIVATION_FAILED - The fleet failed to successfully complete one of
  /// the steps in the fleet activation process. This event code indicates that
  /// the game build was successfully downloaded to a fleet instance, built, and
  /// validated, but was not able to start a server process. Learn more at <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html#fleets-creating-debug-creation">
  /// Debug Fleet Creation Issues</a>
  /// </li>
  /// <li>
  /// FLEET_STATE_ACTIVE -- The fleet's status changed from
  /// <code>ACTIVATING</code> to <code>ACTIVE</code>. The fleet is now ready to
  /// host game sessions.
  /// </li>
  /// </ul>
  /// <b>VPC peering events:</b>
  ///
  /// <ul>
  /// <li>
  /// FLEET_VPC_PEERING_SUCCEEDED -- A VPC peering connection has been established
  /// between the VPC for an Amazon GameLift fleet and a VPC in your AWS account.
  /// </li>
  /// <li>
  /// FLEET_VPC_PEERING_FAILED -- A requested VPC peering connection has failed.
  /// Event details and status information (see
  /// <a>DescribeVpcPeeringConnections</a>) provide additional detail. A common
  /// reason for peering failure is that the two VPCs have overlapping CIDR blocks
  /// of IPv4 addresses. To resolve this, change the CIDR block for the VPC in
  /// your AWS account. For more information on VPC peering failures, see <a
  /// href="https://docs.aws.amazon.com/AmazonVPC/latest/PeeringGuide/invalid-peering-configurations.html">https://docs.aws.amazon.com/AmazonVPC/latest/PeeringGuide/invalid-peering-configurations.html</a>
  /// </li>
  /// <li>
  /// FLEET_VPC_PEERING_DELETED -- A VPC peering connection has been successfully
  /// deleted.
  /// </li>
  /// </ul>
  /// <b>Spot instance events:</b>
  ///
  /// <ul>
  /// <li>
  /// INSTANCE_INTERRUPTED -- A spot instance was interrupted by EC2 with a
  /// two-minute notification.
  /// </li>
  /// </ul>
  /// <b>Other fleet events:</b>
  ///
  /// <ul>
  /// <li>
  /// FLEET_SCALING_EVENT -- A change was made to the fleet's capacity settings
  /// (desired instances, minimum/maximum scaling limits). Event messaging
  /// includes the new capacity settings.
  /// </li>
  /// <li>
  /// FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED -- A change was made to the
  /// fleet's game session protection policy setting. Event messaging includes
  /// both the old and new policy setting.
  /// </li>
  /// <li>
  /// FLEET_DELETED -- A request to delete a fleet was initiated.
  /// </li>
  /// <li>
  /// GENERIC_EVENT -- An unspecified event has occurred.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'EventCode')
  final EventCode eventCode;

  /// A unique identifier for a fleet event.
  @_s.JsonKey(name: 'EventId')
  final String eventId;

  /// Time stamp indicating when this event occurred. Format is a number expressed
  /// in Unix time as milliseconds (for example "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EventTime')
  final DateTime eventTime;

  /// Additional information related to the event.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// Location of stored logs with additional detail that is related to the event.
  /// This is useful for debugging issues. The URL is valid for 15 minutes. You
  /// can also access fleet creation logs through the Amazon GameLift console.
  @_s.JsonKey(name: 'PreSignedLogUrl')
  final String preSignedLogUrl;

  /// A unique identifier for an event resource, such as a fleet ID.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  Event({
    this.eventCode,
    this.eventId,
    this.eventTime,
    this.message,
    this.preSignedLogUrl,
    this.resourceId,
  });
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

enum EventCode {
  @_s.JsonValue('GENERIC_EVENT')
  genericEvent,
  @_s.JsonValue('FLEET_CREATED')
  fleetCreated,
  @_s.JsonValue('FLEET_DELETED')
  fleetDeleted,
  @_s.JsonValue('FLEET_SCALING_EVENT')
  fleetScalingEvent,
  @_s.JsonValue('FLEET_STATE_DOWNLOADING')
  fleetStateDownloading,
  @_s.JsonValue('FLEET_STATE_VALIDATING')
  fleetStateValidating,
  @_s.JsonValue('FLEET_STATE_BUILDING')
  fleetStateBuilding,
  @_s.JsonValue('FLEET_STATE_ACTIVATING')
  fleetStateActivating,
  @_s.JsonValue('FLEET_STATE_ACTIVE')
  fleetStateActive,
  @_s.JsonValue('FLEET_STATE_ERROR')
  fleetStateError,
  @_s.JsonValue('FLEET_INITIALIZATION_FAILED')
  fleetInitializationFailed,
  @_s.JsonValue('FLEET_BINARY_DOWNLOAD_FAILED')
  fleetBinaryDownloadFailed,
  @_s.JsonValue('FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND')
  fleetValidationLaunchPathNotFound,
  @_s.JsonValue('FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE')
  fleetValidationExecutableRuntimeFailure,
  @_s.JsonValue('FLEET_VALIDATION_TIMED_OUT')
  fleetValidationTimedOut,
  @_s.JsonValue('FLEET_ACTIVATION_FAILED')
  fleetActivationFailed,
  @_s.JsonValue('FLEET_ACTIVATION_FAILED_NO_INSTANCES')
  fleetActivationFailedNoInstances,
  @_s.JsonValue('FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED')
  fleetNewGameSessionProtectionPolicyUpdated,
  @_s.JsonValue('SERVER_PROCESS_INVALID_PATH')
  serverProcessInvalidPath,
  @_s.JsonValue('SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT')
  serverProcessSdkInitializationTimeout,
  @_s.JsonValue('SERVER_PROCESS_PROCESS_READY_TIMEOUT')
  serverProcessProcessReadyTimeout,
  @_s.JsonValue('SERVER_PROCESS_CRASHED')
  serverProcessCrashed,
  @_s.JsonValue('SERVER_PROCESS_TERMINATED_UNHEALTHY')
  serverProcessTerminatedUnhealthy,
  @_s.JsonValue('SERVER_PROCESS_FORCE_TERMINATED')
  serverProcessForceTerminated,
  @_s.JsonValue('SERVER_PROCESS_PROCESS_EXIT_TIMEOUT')
  serverProcessProcessExitTimeout,
  @_s.JsonValue('GAME_SESSION_ACTIVATION_TIMEOUT')
  gameSessionActivationTimeout,
  @_s.JsonValue('FLEET_CREATION_EXTRACTING_BUILD')
  fleetCreationExtractingBuild,
  @_s.JsonValue('FLEET_CREATION_RUNNING_INSTALLER')
  fleetCreationRunningInstaller,
  @_s.JsonValue('FLEET_CREATION_VALIDATING_RUNTIME_CONFIG')
  fleetCreationValidatingRuntimeConfig,
  @_s.JsonValue('FLEET_VPC_PEERING_SUCCEEDED')
  fleetVpcPeeringSucceeded,
  @_s.JsonValue('FLEET_VPC_PEERING_FAILED')
  fleetVpcPeeringFailed,
  @_s.JsonValue('FLEET_VPC_PEERING_DELETED')
  fleetVpcPeeringDeleted,
  @_s.JsonValue('INSTANCE_INTERRUPTED')
  instanceInterrupted,
}

enum FleetAction {
  @_s.JsonValue('AUTO_SCALING')
  autoScaling,
}

extension on FleetAction {
  String toValue() {
    switch (this) {
      case FleetAction.autoScaling:
        return 'AUTO_SCALING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// General properties describing a fleet.
///
/// <ul>
/// <li>
/// <a>CreateFleet</a>
/// </li>
/// <li>
/// <a>ListFleets</a>
/// </li>
/// <li>
/// <a>DeleteFleet</a>
/// </li>
/// <li>
/// <a>DescribeFleetAttributes</a>
/// </li>
/// <li>
/// <a>UpdateFleetAttributes</a>
/// </li>
/// <li>
/// <a>StartFleetActions</a> or <a>StopFleetActions</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FleetAttributes {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// associated with the GameLift build resource that is deployed on instances in
  /// this fleet. In a GameLift build ARN, the resource ID matches the
  /// <i>BuildId</i> value.
  @_s.JsonKey(name: 'BuildArn')
  final String buildArn;

  /// A unique identifier for a build.
  @_s.JsonKey(name: 'BuildId')
  final String buildId;

  /// Indicates whether a TLS/SSL certificate was generated for the fleet.
  @_s.JsonKey(name: 'CertificateConfiguration')
  final CertificateConfiguration certificateConfiguration;

  /// Time stamp indicating when this data object was created. Format is a number
  /// expressed in Unix time as milliseconds (for example "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// Human-readable description of the fleet.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. In a GameLift fleet ARN, the resource ID
  /// matches the <i>FleetId</i> value.
  @_s.JsonKey(name: 'FleetArn')
  final String fleetArn;

  /// A unique identifier for a fleet.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  /// Indicates whether the fleet uses on-demand or spot instances. A spot
  /// instance in use may be interrupted with a two-minute notification.
  @_s.JsonKey(name: 'FleetType')
  final FleetType fleetType;

  /// A unique identifier for an AWS IAM role that manages access to your AWS
  /// services.
  @_s.JsonKey(name: 'InstanceRoleArn')
  final String instanceRoleArn;

  /// EC2 instance type indicating the computing resources of each instance in the
  /// fleet, including CPU, memory, storage, and networking capacity. See <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a> for detailed descriptions.
  @_s.JsonKey(name: 'InstanceType')
  final EC2InstanceType instanceType;

  /// Location of default log files. When a server process is shut down, Amazon
  /// GameLift captures and stores any log files in this location. These logs are
  /// in addition to game session logs; see more on game session logs in the <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-api-server-code">Amazon
  /// GameLift Developer Guide</a>. If no default log path for a fleet is
  /// specified, Amazon GameLift automatically uploads logs that are stored on
  /// each instance at <code>C:\game\logs</code> (for Windows) or
  /// <code>/local/game/logs</code> (for Linux). Use the Amazon GameLift console
  /// to access stored logs.
  @_s.JsonKey(name: 'LogPaths')
  final List<String> logPaths;

  /// Names of metric groups that this fleet is included in. In Amazon CloudWatch,
  /// you can view metrics for an individual fleet or aggregated metrics for
  /// fleets that are in a fleet metric group. A fleet can be included in only one
  /// metric group at a time.
  @_s.JsonKey(name: 'MetricGroups')
  final List<String> metricGroups;

  /// A descriptive label that is associated with a fleet. Fleet names do not need
  /// to be unique.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of game session protection to set for all new instances started in
  /// the fleet.
  ///
  /// <ul>
  /// <li>
  /// <b>NoProtection</b> -- The game session can be terminated during a
  /// scale-down event.
  /// </li>
  /// <li>
  /// <b>FullProtection</b> -- If the game session is in an <code>ACTIVE</code>
  /// status, it cannot be terminated during a scale-down event.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'NewGameSessionProtectionPolicy')
  final ProtectionPolicy newGameSessionProtectionPolicy;

  /// Operating system of the fleet's computing resources. A fleet's operating
  /// system depends on the OS specified for the build that is deployed on this
  /// fleet.
  @_s.JsonKey(name: 'OperatingSystem')
  final OperatingSystem operatingSystem;

  /// Fleet policy to limit the number of game sessions an individual player can
  /// create over a span of time.
  @_s.JsonKey(name: 'ResourceCreationLimitPolicy')
  final ResourceCreationLimitPolicy resourceCreationLimitPolicy;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// associated with the GameLift script resource that is deployed on instances
  /// in this fleet. In a GameLift script ARN, the resource ID matches the
  /// <i>ScriptId</i> value.
  @_s.JsonKey(name: 'ScriptArn')
  final String scriptArn;

  /// A unique identifier for a Realtime script.
  @_s.JsonKey(name: 'ScriptId')
  final String scriptId;

  /// Game server launch parameters specified for fleets created before 2016-08-04
  /// (or AWS SDK v. 0.12.16). Server launch parameters for fleets created after
  /// this date are specified in the fleet's <a>RuntimeConfiguration</a>.
  @_s.JsonKey(name: 'ServerLaunchParameters')
  final String serverLaunchParameters;

  /// Path to a game server executable in the fleet's build, specified for fleets
  /// created before 2016-08-04 (or AWS SDK v. 0.12.16). Server launch paths for
  /// fleets created after this date are specified in the fleet's
  /// <a>RuntimeConfiguration</a>.
  @_s.JsonKey(name: 'ServerLaunchPath')
  final String serverLaunchPath;

  /// Current status of the fleet.
  ///
  /// Possible fleet statuses include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>NEW</b> -- A new fleet has been defined and desired instances is set to
  /// 1.
  /// </li>
  /// <li>
  /// <b>DOWNLOADING/VALIDATING/BUILDING/ACTIVATING</b> -- Amazon GameLift is
  /// setting up the new fleet, creating new instances with the game build or
  /// Realtime script and starting server processes.
  /// </li>
  /// <li>
  /// <b>ACTIVE</b> -- Hosts can now accept game sessions.
  /// </li>
  /// <li>
  /// <b>ERROR</b> -- An error occurred when downloading, validating, building, or
  /// activating the fleet.
  /// </li>
  /// <li>
  /// <b>DELETING</b> -- Hosts are responding to a delete fleet request.
  /// </li>
  /// <li>
  /// <b>TERMINATED</b> -- The fleet no longer exists.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final FleetStatus status;

  /// List of fleet activity that have been suspended using
  /// <a>StopFleetActions</a>. This includes auto-scaling.
  @_s.JsonKey(name: 'StoppedActions')
  final List<FleetAction> stoppedActions;

  /// Time stamp indicating when this data object was terminated. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'TerminationTime')
  final DateTime terminationTime;

  FleetAttributes({
    this.buildArn,
    this.buildId,
    this.certificateConfiguration,
    this.creationTime,
    this.description,
    this.fleetArn,
    this.fleetId,
    this.fleetType,
    this.instanceRoleArn,
    this.instanceType,
    this.logPaths,
    this.metricGroups,
    this.name,
    this.newGameSessionProtectionPolicy,
    this.operatingSystem,
    this.resourceCreationLimitPolicy,
    this.scriptArn,
    this.scriptId,
    this.serverLaunchParameters,
    this.serverLaunchPath,
    this.status,
    this.stoppedActions,
    this.terminationTime,
  });
  factory FleetAttributes.fromJson(Map<String, dynamic> json) =>
      _$FleetAttributesFromJson(json);
}

/// Information about the fleet's capacity. Fleet capacity is measured in EC2
/// instances. By default, new fleets have a capacity of one instance, but can
/// be updated as needed. The maximum number of instances for a fleet is
/// determined by the fleet's instance type.
///
/// <ul>
/// <li>
/// <a>CreateFleet</a>
/// </li>
/// <li>
/// <a>ListFleets</a>
/// </li>
/// <li>
/// <a>DeleteFleet</a>
/// </li>
/// <li>
/// <a>DescribeFleetAttributes</a>
/// </li>
/// <li>
/// <a>UpdateFleetAttributes</a>
/// </li>
/// <li>
/// <a>StartFleetActions</a> or <a>StopFleetActions</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FleetCapacity {
  /// A unique identifier for a fleet.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  /// Current status of fleet capacity.
  @_s.JsonKey(name: 'InstanceCounts')
  final EC2InstanceCounts instanceCounts;

  /// Name of an EC2 instance type that is supported in Amazon GameLift. A fleet
  /// instance type determines the computing resources of each instance in the
  /// fleet, including CPU, memory, storage, and networking capacity. Amazon
  /// GameLift supports the following EC2 instance types. See <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a> for detailed descriptions.
  @_s.JsonKey(name: 'InstanceType')
  final EC2InstanceType instanceType;

  FleetCapacity({
    this.fleetId,
    this.instanceCounts,
    this.instanceType,
  });
  factory FleetCapacity.fromJson(Map<String, dynamic> json) =>
      _$FleetCapacityFromJson(json);
}

enum FleetStatus {
  @_s.JsonValue('NEW')
  $new,
  @_s.JsonValue('DOWNLOADING')
  downloading,
  @_s.JsonValue('VALIDATING')
  validating,
  @_s.JsonValue('BUILDING')
  building,
  @_s.JsonValue('ACTIVATING')
  activating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('TERMINATED')
  terminated,
}

enum FleetType {
  @_s.JsonValue('ON_DEMAND')
  onDemand,
  @_s.JsonValue('SPOT')
  spot,
}

extension on FleetType {
  String toValue() {
    switch (this) {
      case FleetType.onDemand:
        return 'ON_DEMAND';
      case FleetType.spot:
        return 'SPOT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Current status of fleet utilization, including the number of game and player
/// sessions being hosted.
///
/// <ul>
/// <li>
/// <a>CreateFleet</a>
/// </li>
/// <li>
/// <a>ListFleets</a>
/// </li>
/// <li>
/// <a>DeleteFleet</a>
/// </li>
/// <li>
/// <a>DescribeFleetAttributes</a>
/// </li>
/// <li>
/// <a>UpdateFleetAttributes</a>
/// </li>
/// <li>
/// <a>StartFleetActions</a> or <a>StopFleetActions</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FleetUtilization {
  /// Number of active game sessions currently being hosted on all instances in
  /// the fleet.
  @_s.JsonKey(name: 'ActiveGameSessionCount')
  final int activeGameSessionCount;

  /// Number of server processes in an <code>ACTIVE</code> status currently
  /// running across all instances in the fleet
  @_s.JsonKey(name: 'ActiveServerProcessCount')
  final int activeServerProcessCount;

  /// Number of active player sessions currently being hosted on all instances in
  /// the fleet.
  @_s.JsonKey(name: 'CurrentPlayerSessionCount')
  final int currentPlayerSessionCount;

  /// A unique identifier for a fleet.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  /// The maximum number of players allowed across all game sessions currently
  /// being hosted on all instances in the fleet.
  @_s.JsonKey(name: 'MaximumPlayerSessionCount')
  final int maximumPlayerSessionCount;

  FleetUtilization({
    this.activeGameSessionCount,
    this.activeServerProcessCount,
    this.currentPlayerSessionCount,
    this.fleetId,
    this.maximumPlayerSessionCount,
  });
  factory FleetUtilization.fromJson(Map<String, dynamic> json) =>
      _$FleetUtilizationFromJson(json);
}

enum FlexMatchMode {
  @_s.JsonValue('STANDALONE')
  standalone,
  @_s.JsonValue('WITH_QUEUE')
  withQueue,
}

extension on FlexMatchMode {
  String toValue() {
    switch (this) {
      case FlexMatchMode.standalone:
        return 'STANDALONE';
      case FlexMatchMode.withQueue:
        return 'WITH_QUEUE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Set of key-value pairs that contain information about a game session. When
/// included in a game session request, these properties communicate details to
/// be used when setting up the new game session. For example, a game property
/// might specify a game mode, level, or map. Game properties are passed to the
/// game server process when initiating a new game session. For more
/// information, see the <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#gamelift-sdk-client-api-create">
/// Amazon GameLift Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GameProperty {
  /// The game property identifier.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The game property value.
  @_s.JsonKey(name: 'Value')
  final String value;

  GameProperty({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory GameProperty.fromJson(Map<String, dynamic> json) =>
      _$GamePropertyFromJson(json);

  Map<String, dynamic> toJson() => _$GamePropertyToJson(this);
}

/// <b>This data type is used with the Amazon GameLift FleetIQ and game server
/// groups.</b>
///
/// Properties describing a game server that is running on an instance in a
/// <a>GameServerGroup</a>.
///
/// A game server is created by a successful call to
/// <code>RegisterGameServer</code> and deleted by calling
/// <code>DeregisterGameServer</code>. A game server is claimed to host a game
/// session by calling <code>ClaimGameServer</code>.
///
/// <ul>
/// <li>
/// <a>RegisterGameServer</a>
/// </li>
/// <li>
/// <a>ListGameServers</a>
/// </li>
/// <li>
/// <a>ClaimGameServer</a>
/// </li>
/// <li>
/// <a>DescribeGameServer</a>
/// </li>
/// <li>
/// <a>UpdateGameServer</a>
/// </li>
/// <li>
/// <a>DeregisterGameServer</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GameServer {
  /// Indicates when an available game server has been reserved for gameplay but
  /// has not yet started hosting a game. Once it is claimed, the game server
  /// remains in <code>CLAIMED</code> status for a maximum of one minute. During
  /// this time, game clients connect to the game server to start the game and
  /// trigger the game server to update its utilization status. After one minute,
  /// the game server claim status reverts to null.
  @_s.JsonKey(name: 'ClaimStatus')
  final GameServerClaimStatus claimStatus;

  /// The port and IP address that must be used to establish a client connection
  /// to the game server.
  @_s.JsonKey(name: 'ConnectionInfo')
  final String connectionInfo;

  /// A set of custom game server properties, formatted as a single string value.
  /// This data is passed to a game client or service when it requests information
  /// on game servers using <a>ListGameServers</a> or <a>ClaimGameServer</a>.
  @_s.JsonKey(name: 'GameServerData')
  final String gameServerData;

  /// The ARN identifier for the game server group where the game server is
  /// located.
  @_s.JsonKey(name: 'GameServerGroupArn')
  final String gameServerGroupArn;

  /// A unique identifier for the game server group where the game server is
  /// running. Use either the <a>GameServerGroup</a> name or ARN value.
  @_s.JsonKey(name: 'GameServerGroupName')
  final String gameServerGroupName;

  /// A custom string that uniquely identifies the game server. Game server IDs
  /// are developer-defined and are unique across all game server groups in an AWS
  /// account.
  @_s.JsonKey(name: 'GameServerId')
  final String gameServerId;

  /// The unique identifier for the instance where the game server is running.
  /// This ID is available in the instance metadata. EC2 instance IDs use a
  /// 17-character format, for example: <code>i-1234567890abcdef0</code>.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// Timestamp that indicates the last time the game server was claimed with a
  /// <a>ClaimGameServer</a> request. The format is a number expressed in Unix
  /// time as milliseconds (for example <code>"1469498468.057"</code>). This value
  /// is used to calculate when a claimed game server's status should revert to
  /// null.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastClaimTime')
  final DateTime lastClaimTime;

  /// Timestamp that indicates the last time the game server was updated with
  /// health status using an <a>UpdateGameServer</a> request. The format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>). After game server registration, this
  /// property is only changed when a game server update specifies a health check
  /// value.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastHealthCheckTime')
  final DateTime lastHealthCheckTime;

  /// Timestamp that indicates when the game server was created with a
  /// <a>RegisterGameServer</a> request. The format is a number expressed in Unix
  /// time as milliseconds (for example <code>"1469498468.057"</code>).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RegistrationTime')
  final DateTime registrationTime;

  /// Indicates whether the game server is currently available for new games or is
  /// busy. Possible statuses include:
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - The game server is available to be claimed. A game
  /// server that has been claimed remains in this status until it reports game
  /// hosting activity.
  /// </li>
  /// <li>
  /// <code>UTILIZED</code> - The game server is currently hosting a game session
  /// with players.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'UtilizationStatus')
  final GameServerUtilizationStatus utilizationStatus;

  GameServer({
    this.claimStatus,
    this.connectionInfo,
    this.gameServerData,
    this.gameServerGroupArn,
    this.gameServerGroupName,
    this.gameServerId,
    this.instanceId,
    this.lastClaimTime,
    this.lastHealthCheckTime,
    this.registrationTime,
    this.utilizationStatus,
  });
  factory GameServer.fromJson(Map<String, dynamic> json) =>
      _$GameServerFromJson(json);
}

enum GameServerClaimStatus {
  @_s.JsonValue('CLAIMED')
  claimed,
}

/// <b>This data type is used with the Amazon GameLift FleetIQ and game server
/// groups.</b>
///
/// Properties that describe a game server group resource. A game server group
/// manages certain properties related to a corresponding EC2 Auto Scaling
/// group.
///
/// A game server group is created by a successful call to
/// <code>CreateGameServerGroup</code> and deleted by calling
/// <code>DeleteGameServerGroup</code>. Game server group activity can be
/// temporarily suspended and resumed by calling
/// <code>SuspendGameServerGroup</code> and <code>ResumeGameServerGroup</code>,
/// respectively.
///
/// <ul>
/// <li>
/// <a>CreateGameServerGroup</a>
/// </li>
/// <li>
/// <a>ListGameServerGroups</a>
/// </li>
/// <li>
/// <a>DescribeGameServerGroup</a>
/// </li>
/// <li>
/// <a>UpdateGameServerGroup</a>
/// </li>
/// <li>
/// <a>DeleteGameServerGroup</a>
/// </li>
/// <li>
/// <a>ResumeGameServerGroup</a>
/// </li>
/// <li>
/// <a>SuspendGameServerGroup</a>
/// </li>
/// <li>
/// <a>DescribeGameServerInstances</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GameServerGroup {
  /// A generated unique ID for the EC2 Auto Scaling group that is associated with
  /// this game server group.
  @_s.JsonKey(name: 'AutoScalingGroupArn')
  final String autoScalingGroupArn;

  /// Indicates how GameLift FleetIQ balances the use of Spot Instances and
  /// On-Demand Instances in the game server group. Method options include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>SPOT_ONLY</code> - Only Spot Instances are used in the game server
  /// group. If Spot Instances are unavailable or not viable for game hosting, the
  /// game server group provides no hosting capacity until Spot Instances can
  /// again be used. Until then, no new instances are started, and the existing
  /// nonviable Spot Instances are terminated (after current gameplay ends) and
  /// are not replaced.
  /// </li>
  /// <li>
  /// <code>SPOT_PREFERRED</code> - (default value) Spot Instances are used
  /// whenever available in the game server group. If Spot Instances are
  /// unavailable, the game server group continues to provide hosting capacity by
  /// falling back to On-Demand Instances. Existing nonviable Spot Instances are
  /// terminated (after current gameplay ends) and are replaced with new On-Demand
  /// Instances.
  /// </li>
  /// <li>
  /// <code>ON_DEMAND_ONLY</code> - Only On-Demand Instances are used in the game
  /// server group. No Spot Instances are used, even when available, while this
  /// balancing strategy is in force.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'BalancingStrategy')
  final BalancingStrategy balancingStrategy;

  /// A timestamp that indicates when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// A generated unique ID for the game server group.
  @_s.JsonKey(name: 'GameServerGroupArn')
  final String gameServerGroupArn;

  /// A developer-defined identifier for the game server group. The name is unique
  /// for each Region in each AWS account.
  @_s.JsonKey(name: 'GameServerGroupName')
  final String gameServerGroupName;

  /// A flag that indicates whether instances in the game server group are
  /// protected from early termination. Unprotected instances that have active
  /// game servers running might be terminated during a scale-down event, causing
  /// players to be dropped from the game. Protected instances cannot be
  /// terminated while there are active game servers running except in the event
  /// of a forced game server group deletion (see ). An exception to this is with
  /// Spot Instances, which can be terminated by AWS regardless of protection
  /// status.
  @_s.JsonKey(name: 'GameServerProtectionPolicy')
  final GameServerProtectionPolicy gameServerProtectionPolicy;

  /// The set of EC2 instance types that GameLift FleetIQ can use when balancing
  /// and automatically scaling instances in the corresponding Auto Scaling group.
  @_s.JsonKey(name: 'InstanceDefinitions')
  final List<InstanceDefinition> instanceDefinitions;

  /// A timestamp that indicates when this game server group was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// for an IAM role that allows Amazon GameLift to access your EC2 Auto Scaling
  /// groups.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The current status of the game server group. Possible statuses include:
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code> - GameLift FleetIQ has validated the
  /// <code>CreateGameServerGroup()</code> request.
  /// </li>
  /// <li>
  /// <code>ACTIVATING</code> - GameLift FleetIQ is setting up a game server
  /// group, which includes creating an Auto Scaling group in your AWS account.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The game server group has been successfully created.
  /// </li>
  /// <li>
  /// <code>DELETE_SCHEDULED</code> - A request to delete the game server group
  /// has been received.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - GameLift FleetIQ has received a valid
  /// <code>DeleteGameServerGroup()</code> request and is processing it. GameLift
  /// FleetIQ must first complete and release hosts before it deletes the Auto
  /// Scaling group and the game server group.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - The game server group has been successfully deleted.
  /// </li>
  /// <li>
  /// <code>ERROR</code> - The asynchronous processes of activating or deleting a
  /// game server group has failed, resulting in an error state.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final GameServerGroupStatus status;

  /// Additional information about the current game server group status. This
  /// information might provide additional insight on groups that are in
  /// <code>ERROR</code> status.
  @_s.JsonKey(name: 'StatusReason')
  final String statusReason;

  /// A list of activities that are currently suspended for this game server
  /// group. If this property is empty, all activities are occurring.
  @_s.JsonKey(name: 'SuspendedActions')
  final List<GameServerGroupAction> suspendedActions;

  GameServerGroup({
    this.autoScalingGroupArn,
    this.balancingStrategy,
    this.creationTime,
    this.gameServerGroupArn,
    this.gameServerGroupName,
    this.gameServerProtectionPolicy,
    this.instanceDefinitions,
    this.lastUpdatedTime,
    this.roleArn,
    this.status,
    this.statusReason,
    this.suspendedActions,
  });
  factory GameServerGroup.fromJson(Map<String, dynamic> json) =>
      _$GameServerGroupFromJson(json);
}

enum GameServerGroupAction {
  @_s.JsonValue('REPLACE_INSTANCE_TYPES')
  replaceInstanceTypes,
}

extension on GameServerGroupAction {
  String toValue() {
    switch (this) {
      case GameServerGroupAction.replaceInstanceTypes:
        return 'REPLACE_INSTANCE_TYPES';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// <b>This data type is used with the Amazon GameLift FleetIQ and game server
/// groups.</b>
///
/// Configuration settings for intelligent automatic scaling that uses target
/// tracking. These settings are used to add an Auto Scaling policy when
/// creating the corresponding Auto Scaling group with
/// <a>CreateGameServerGroup</a>. After the Auto Scaling group is created, all
/// updates to Auto Scaling policies, including changing this policy and adding
/// or removing other policies, is done directly on the Auto Scaling group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GameServerGroupAutoScalingPolicy {
  /// Settings for a target-based scaling policy applied to Auto Scaling group.
  /// These settings are used to create a target-based policy that tracks the
  /// GameLift FleetIQ metric <code>"PercentUtilizedGameServers"</code> and
  /// specifies a target value for the metric. As player usage changes, the policy
  /// triggers to adjust the game server group capacity so that the metric returns
  /// to the target value.
  @_s.JsonKey(name: 'TargetTrackingConfiguration')
  final TargetTrackingConfiguration targetTrackingConfiguration;

  /// Length of time, in seconds, it takes for a new instance to start new game
  /// server processes and register with GameLift FleetIQ. Specifying a warm-up
  /// time can be useful, particularly with game servers that take a long time to
  /// start up, because it avoids prematurely starting new instances.
  @_s.JsonKey(name: 'EstimatedInstanceWarmup')
  final int estimatedInstanceWarmup;

  GameServerGroupAutoScalingPolicy({
    @_s.required this.targetTrackingConfiguration,
    this.estimatedInstanceWarmup,
  });
  Map<String, dynamic> toJson() =>
      _$GameServerGroupAutoScalingPolicyToJson(this);
}

enum GameServerGroupDeleteOption {
  @_s.JsonValue('SAFE_DELETE')
  safeDelete,
  @_s.JsonValue('FORCE_DELETE')
  forceDelete,
  @_s.JsonValue('RETAIN')
  retain,
}

extension on GameServerGroupDeleteOption {
  String toValue() {
    switch (this) {
      case GameServerGroupDeleteOption.safeDelete:
        return 'SAFE_DELETE';
      case GameServerGroupDeleteOption.forceDelete:
        return 'FORCE_DELETE';
      case GameServerGroupDeleteOption.retain:
        return 'RETAIN';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum GameServerGroupInstanceType {
  @_s.JsonValue('c4.large')
  c4Large,
  @_s.JsonValue('c4.xlarge')
  c4Xlarge,
  @_s.JsonValue('c4.2xlarge')
  c4_2xlarge,
  @_s.JsonValue('c4.4xlarge')
  c4_4xlarge,
  @_s.JsonValue('c4.8xlarge')
  c4_8xlarge,
  @_s.JsonValue('c5.large')
  c5Large,
  @_s.JsonValue('c5.xlarge')
  c5Xlarge,
  @_s.JsonValue('c5.2xlarge')
  c5_2xlarge,
  @_s.JsonValue('c5.4xlarge')
  c5_4xlarge,
  @_s.JsonValue('c5.9xlarge')
  c5_9xlarge,
  @_s.JsonValue('c5.12xlarge')
  c5_12xlarge,
  @_s.JsonValue('c5.18xlarge')
  c5_18xlarge,
  @_s.JsonValue('c5.24xlarge')
  c5_24xlarge,
  @_s.JsonValue('r4.large')
  r4Large,
  @_s.JsonValue('r4.xlarge')
  r4Xlarge,
  @_s.JsonValue('r4.2xlarge')
  r4_2xlarge,
  @_s.JsonValue('r4.4xlarge')
  r4_4xlarge,
  @_s.JsonValue('r4.8xlarge')
  r4_8xlarge,
  @_s.JsonValue('r4.16xlarge')
  r4_16xlarge,
  @_s.JsonValue('r5.large')
  r5Large,
  @_s.JsonValue('r5.xlarge')
  r5Xlarge,
  @_s.JsonValue('r5.2xlarge')
  r5_2xlarge,
  @_s.JsonValue('r5.4xlarge')
  r5_4xlarge,
  @_s.JsonValue('r5.8xlarge')
  r5_8xlarge,
  @_s.JsonValue('r5.12xlarge')
  r5_12xlarge,
  @_s.JsonValue('r5.16xlarge')
  r5_16xlarge,
  @_s.JsonValue('r5.24xlarge')
  r5_24xlarge,
  @_s.JsonValue('m4.large')
  m4Large,
  @_s.JsonValue('m4.xlarge')
  m4Xlarge,
  @_s.JsonValue('m4.2xlarge')
  m4_2xlarge,
  @_s.JsonValue('m4.4xlarge')
  m4_4xlarge,
  @_s.JsonValue('m4.10xlarge')
  m4_10xlarge,
  @_s.JsonValue('m5.large')
  m5Large,
  @_s.JsonValue('m5.xlarge')
  m5Xlarge,
  @_s.JsonValue('m5.2xlarge')
  m5_2xlarge,
  @_s.JsonValue('m5.4xlarge')
  m5_4xlarge,
  @_s.JsonValue('m5.8xlarge')
  m5_8xlarge,
  @_s.JsonValue('m5.12xlarge')
  m5_12xlarge,
  @_s.JsonValue('m5.16xlarge')
  m5_16xlarge,
  @_s.JsonValue('m5.24xlarge')
  m5_24xlarge,
}

enum GameServerGroupStatus {
  @_s.JsonValue('NEW')
  $new,
  @_s.JsonValue('ACTIVATING')
  activating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETE_SCHEDULED')
  deleteScheduled,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('ERROR')
  error,
}

enum GameServerHealthCheck {
  @_s.JsonValue('HEALTHY')
  healthy,
}

extension on GameServerHealthCheck {
  String toValue() {
    switch (this) {
      case GameServerHealthCheck.healthy:
        return 'HEALTHY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// <b>This data type is used with the Amazon GameLift FleetIQ and game server
/// groups.</b>
///
/// Additional properties, including status, that describe an EC2 instance in a
/// game server group. Instance configurations are set with game server group
/// properties (see <code>DescribeGameServerGroup</code> and with the EC2 launch
/// template that was used when creating the game server group.
///
/// Retrieve game server instances for a game server group by calling
/// <code>DescribeGameServerInstances</code>.
///
/// <ul>
/// <li>
/// <a>CreateGameServerGroup</a>
/// </li>
/// <li>
/// <a>ListGameServerGroups</a>
/// </li>
/// <li>
/// <a>DescribeGameServerGroup</a>
/// </li>
/// <li>
/// <a>UpdateGameServerGroup</a>
/// </li>
/// <li>
/// <a>DeleteGameServerGroup</a>
/// </li>
/// <li>
/// <a>ResumeGameServerGroup</a>
/// </li>
/// <li>
/// <a>SuspendGameServerGroup</a>
/// </li>
/// <li>
/// <a>DescribeGameServerInstances</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GameServerInstance {
  /// A generated unique identifier for the game server group that includes the
  /// game server instance.
  @_s.JsonKey(name: 'GameServerGroupArn')
  final String gameServerGroupArn;

  /// A developer-defined identifier for the game server group that includes the
  /// game server instance. The name is unique for each Region in each AWS
  /// account.
  @_s.JsonKey(name: 'GameServerGroupName')
  final String gameServerGroupName;

  /// The unique identifier for the instance where the game server is running.
  /// This ID is available in the instance metadata. EC2 instance IDs use a
  /// 17-character format, for example: <code>i-1234567890abcdef0</code>.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// Current status of the game server instance.
  ///
  /// <ul>
  /// <li>
  /// <b>ACTIVE</b> -- The instance is viable for hosting game servers.
  /// </li>
  /// <li>
  /// <b>DRAINING</b> -- The instance is not viable for hosting game servers.
  /// Existing game servers are in the process of ending, and new game servers are
  /// not started on this instance unless no other resources are available. When
  /// the instance is put in DRAINING, a new instance is started up to replace it.
  /// Once the instance has no UTILIZED game servers, it will be terminated in
  /// favor of the new instance.
  /// </li>
  /// <li>
  /// <b>SPOT_TERMINATING</b> -- The instance is in the process of shutting down
  /// due to a Spot instance interruption. No new game servers are started on this
  /// instance.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'InstanceStatus')
  final GameServerInstanceStatus instanceStatus;

  GameServerInstance({
    this.gameServerGroupArn,
    this.gameServerGroupName,
    this.instanceId,
    this.instanceStatus,
  });
  factory GameServerInstance.fromJson(Map<String, dynamic> json) =>
      _$GameServerInstanceFromJson(json);
}

enum GameServerInstanceStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DRAINING')
  draining,
  @_s.JsonValue('SPOT_TERMINATING')
  spotTerminating,
}

enum GameServerProtectionPolicy {
  @_s.JsonValue('NO_PROTECTION')
  noProtection,
  @_s.JsonValue('FULL_PROTECTION')
  fullProtection,
}

extension on GameServerProtectionPolicy {
  String toValue() {
    switch (this) {
      case GameServerProtectionPolicy.noProtection:
        return 'NO_PROTECTION';
      case GameServerProtectionPolicy.fullProtection:
        return 'FULL_PROTECTION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum GameServerUtilizationStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('UTILIZED')
  utilized,
}

extension on GameServerUtilizationStatus {
  String toValue() {
    switch (this) {
      case GameServerUtilizationStatus.available:
        return 'AVAILABLE';
      case GameServerUtilizationStatus.utilized:
        return 'UTILIZED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Properties describing a game session.
///
/// A game session in ACTIVE status can host players. When a game session ends,
/// its status is set to <code>TERMINATED</code>.
///
/// Once the session ends, the game session object is retained for 30 days. This
/// means you can reuse idempotency token values after this time. Game session
/// logs are retained for 14 days.
///
/// <ul>
/// <li>
/// <a>CreateGameSession</a>
/// </li>
/// <li>
/// <a>DescribeGameSessions</a>
/// </li>
/// <li>
/// <a>DescribeGameSessionDetails</a>
/// </li>
/// <li>
/// <a>SearchGameSessions</a>
/// </li>
/// <li>
/// <a>UpdateGameSession</a>
/// </li>
/// <li>
/// <a>GetGameSessionLogUrl</a>
/// </li>
/// <li>
/// Game session placements
///
/// <ul>
/// <li>
/// <a>StartGameSessionPlacement</a>
/// </li>
/// <li>
/// <a>DescribeGameSessionPlacement</a>
/// </li>
/// <li>
/// <a>StopGameSessionPlacement</a>
/// </li>
/// </ul> </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GameSession {
  /// Time stamp indicating when this data object was created. Format is a number
  /// expressed in Unix time as milliseconds (for example "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// A unique identifier for a player. This ID is used to enforce a resource
  /// protection policy (if one exists), that limits the number of game sessions a
  /// player can create.
  @_s.JsonKey(name: 'CreatorId')
  final String creatorId;

  /// Number of players currently in the game session.
  @_s.JsonKey(name: 'CurrentPlayerSessionCount')
  final int currentPlayerSessionCount;

  /// DNS identifier assigned to the instance that is running the game session.
  /// Values have the following format:
  ///
  /// <ul>
  /// <li>
  /// TLS-enabled fleets: <code>&lt;unique identifier&gt;.&lt;region
  /// identifier&gt;.amazongamelift.com</code>.
  /// </li>
  /// <li>
  /// Non-TLS-enabled fleets: <code>ec2-&lt;unique
  /// identifier&gt;.compute.amazonaws.com</code>. (See <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses">Amazon
  /// EC2 Instance IP Addressing</a>.)
  /// </li>
  /// </ul>
  /// When connecting to a game session that is running on a TLS-enabled fleet,
  /// you must use the DNS name, not the IP address.
  @_s.JsonKey(name: 'DnsName')
  final String dnsName;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// associated with the GameLift fleet that this game session is running on.
  @_s.JsonKey(name: 'FleetArn')
  final String fleetArn;

  /// A unique identifier for a fleet that the game session is running on.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  /// Set of custom properties for a game session, formatted as key:value pairs.
  /// These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>). You can search for active game sessions based on this
  /// custom data with <a>SearchGameSessions</a>.
  @_s.JsonKey(name: 'GameProperties')
  final List<GameProperty> gameProperties;

  /// Set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the <a>GameSession</a>
  /// object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  @_s.JsonKey(name: 'GameSessionData')
  final String gameSessionData;

  /// A unique identifier for the game session. A game session ARN has the
  /// following format:
  /// <code>arn:aws:gamelift:&lt;region&gt;::gamesession/&lt;fleet
  /// ID&gt;/&lt;custom ID string or idempotency token&gt;</code>.
  @_s.JsonKey(name: 'GameSessionId')
  final String gameSessionId;

  /// IP address of the instance that is running the game session. When connecting
  /// to a Amazon GameLift game server, a client needs to reference an IP address
  /// (or DNS name) and port number.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// Information about the matchmaking process that was used to create the game
  /// session. It is in JSON syntax, formatted as a string. In addition the
  /// matchmaking configuration used, it contains data on all players assigned to
  /// the match, including player attributes and team assignments. For more
  /// details on matchmaker data, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-server.html#match-server-data">Match
  /// Data</a>. Matchmaker data is useful when requesting match backfills, and is
  /// updated whenever new players are added during a successful backfill (see
  /// <a>StartMatchBackfill</a>).
  @_s.JsonKey(name: 'MatchmakerData')
  final String matchmakerData;

  /// The maximum number of players that can be connected simultaneously to the
  /// game session.
  @_s.JsonKey(name: 'MaximumPlayerSessionCount')
  final int maximumPlayerSessionCount;

  /// A descriptive label that is associated with a game session. Session names do
  /// not need to be unique.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Indicates whether or not the game session is accepting new players.
  @_s.JsonKey(name: 'PlayerSessionCreationPolicy')
  final PlayerSessionCreationPolicy playerSessionCreationPolicy;

  /// Port number for the game session. To connect to a Amazon GameLift game
  /// server, an app needs both the IP address and port number.
  @_s.JsonKey(name: 'Port')
  final int port;

  /// Current status of the game session. A game session must have an
  /// <code>ACTIVE</code> status to have player sessions.
  @_s.JsonKey(name: 'Status')
  final GameSessionStatus status;

  /// Provides additional information about game session status.
  /// <code>INTERRUPTED</code> indicates that the game session was hosted on a
  /// spot instance that was reclaimed, causing the active game session to be
  /// terminated.
  @_s.JsonKey(name: 'StatusReason')
  final GameSessionStatusReason statusReason;

  /// Time stamp indicating when this data object was terminated. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'TerminationTime')
  final DateTime terminationTime;

  GameSession({
    this.creationTime,
    this.creatorId,
    this.currentPlayerSessionCount,
    this.dnsName,
    this.fleetArn,
    this.fleetId,
    this.gameProperties,
    this.gameSessionData,
    this.gameSessionId,
    this.ipAddress,
    this.matchmakerData,
    this.maximumPlayerSessionCount,
    this.name,
    this.playerSessionCreationPolicy,
    this.port,
    this.status,
    this.statusReason,
    this.terminationTime,
  });
  factory GameSession.fromJson(Map<String, dynamic> json) =>
      _$GameSessionFromJson(json);
}

/// Connection information for a new game session that is created in response to
/// a <a>StartMatchmaking</a> request. Once a match is made, the FlexMatch
/// engine creates a new game session for it. This information, including the
/// game session endpoint and player sessions for each player in the original
/// matchmaking request, is added to the <a>MatchmakingTicket</a>, which can be
/// retrieved by calling <a>DescribeMatchmaking</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GameSessionConnectionInfo {
  /// DNS identifier assigned to the instance that is running the game session.
  /// Values have the following format:
  ///
  /// <ul>
  /// <li>
  /// TLS-enabled fleets: <code>&lt;unique identifier&gt;.&lt;region
  /// identifier&gt;.amazongamelift.com</code>.
  /// </li>
  /// <li>
  /// Non-TLS-enabled fleets: <code>ec2-&lt;unique
  /// identifier&gt;.compute.amazonaws.com</code>. (See <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses">Amazon
  /// EC2 Instance IP Addressing</a>.)
  /// </li>
  /// </ul>
  /// When connecting to a game session that is running on a TLS-enabled fleet,
  /// you must use the DNS name, not the IP address.
  @_s.JsonKey(name: 'DnsName')
  final String dnsName;

  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a game session and uniquely identifies it.
  @_s.JsonKey(name: 'GameSessionArn')
  final String gameSessionArn;

  /// IP address of the instance that is running the game session. When connecting
  /// to a Amazon GameLift game server, a client needs to reference an IP address
  /// (or DNS name) and port number.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// A collection of player session IDs, one for each player ID that was included
  /// in the original matchmaking request.
  @_s.JsonKey(name: 'MatchedPlayerSessions')
  final List<MatchedPlayerSession> matchedPlayerSessions;

  /// Port number for the game session. To connect to a Amazon GameLift game
  /// server, an app needs both the IP address and port number.
  @_s.JsonKey(name: 'Port')
  final int port;

  GameSessionConnectionInfo({
    this.dnsName,
    this.gameSessionArn,
    this.ipAddress,
    this.matchedPlayerSessions,
    this.port,
  });
  factory GameSessionConnectionInfo.fromJson(Map<String, dynamic> json) =>
      _$GameSessionConnectionInfoFromJson(json);
}

/// A game session's properties plus the protection policy currently in force.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GameSessionDetail {
  /// Object that describes a game session.
  @_s.JsonKey(name: 'GameSession')
  final GameSession gameSession;

  /// Current status of protection for the game session.
  ///
  /// <ul>
  /// <li>
  /// <b>NoProtection</b> -- The game session can be terminated during a
  /// scale-down event.
  /// </li>
  /// <li>
  /// <b>FullProtection</b> -- If the game session is in an <code>ACTIVE</code>
  /// status, it cannot be terminated during a scale-down event.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ProtectionPolicy')
  final ProtectionPolicy protectionPolicy;

  GameSessionDetail({
    this.gameSession,
    this.protectionPolicy,
  });
  factory GameSessionDetail.fromJson(Map<String, dynamic> json) =>
      _$GameSessionDetailFromJson(json);
}

/// Object that describes a <a>StartGameSessionPlacement</a> request. This
/// object includes the full details of the original request plus the current
/// status and start/end time stamps.
///
/// Game session placement-related operations include:
///
/// <ul>
/// <li>
/// <a>StartGameSessionPlacement</a>
/// </li>
/// <li>
/// <a>DescribeGameSessionPlacement</a>
/// </li>
/// <li>
/// <a>StopGameSessionPlacement</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GameSessionPlacement {
  /// DNS identifier assigned to the instance that is running the game session.
  /// Values have the following format:
  ///
  /// <ul>
  /// <li>
  /// TLS-enabled fleets: <code>&lt;unique identifier&gt;.&lt;region
  /// identifier&gt;.amazongamelift.com</code>.
  /// </li>
  /// <li>
  /// Non-TLS-enabled fleets: <code>ec2-&lt;unique
  /// identifier&gt;.compute.amazonaws.com</code>. (See <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses">Amazon
  /// EC2 Instance IP Addressing</a>.)
  /// </li>
  /// </ul>
  /// When connecting to a game session that is running on a TLS-enabled fleet,
  /// you must use the DNS name, not the IP address.
  @_s.JsonKey(name: 'DnsName')
  final String dnsName;

  /// Time stamp indicating when this request was completed, canceled, or timed
  /// out.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// Set of custom properties for a game session, formatted as key:value pairs.
  /// These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  @_s.JsonKey(name: 'GameProperties')
  final List<GameProperty> gameProperties;

  /// Identifier for the game session created by this placement request. This
  /// value is set once the new game session is placed (placement status is
  /// <code>FULFILLED</code>). This identifier is unique across all Regions. You
  /// can use this value as a <code>GameSessionId</code> value as needed.
  @_s.JsonKey(name: 'GameSessionArn')
  final String gameSessionArn;

  /// Set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the <a>GameSession</a>
  /// object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  @_s.JsonKey(name: 'GameSessionData')
  final String gameSessionData;

  /// A unique identifier for the game session. This value is set once the new
  /// game session is placed (placement status is <code>FULFILLED</code>).
  @_s.JsonKey(name: 'GameSessionId')
  final String gameSessionId;

  /// A descriptive label that is associated with a game session. Session names do
  /// not need to be unique.
  @_s.JsonKey(name: 'GameSessionName')
  final String gameSessionName;

  /// A descriptive label that is associated with game session queue. Queue names
  /// must be unique within each Region.
  @_s.JsonKey(name: 'GameSessionQueueName')
  final String gameSessionQueueName;

  /// Name of the Region where the game session created by this placement request
  /// is running. This value is set once the new game session is placed (placement
  /// status is <code>FULFILLED</code>).
  @_s.JsonKey(name: 'GameSessionRegion')
  final String gameSessionRegion;

  /// IP address of the instance that is running the game session. When connecting
  /// to a Amazon GameLift game server, a client needs to reference an IP address
  /// (or DNS name) and port number. This value is set once the new game session
  /// is placed (placement status is <code>FULFILLED</code>).
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// Information on the matchmaking process for this game. Data is in JSON
  /// syntax, formatted as a string. It identifies the matchmaking configuration
  /// used to create the match, and contains data on all players assigned to the
  /// match, including player attributes and team assignments. For more details on
  /// matchmaker data, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-server.html#match-server-data">Match
  /// Data</a>.
  @_s.JsonKey(name: 'MatchmakerData')
  final String matchmakerData;

  /// The maximum number of players that can be connected simultaneously to the
  /// game session.
  @_s.JsonKey(name: 'MaximumPlayerSessionCount')
  final int maximumPlayerSessionCount;

  /// A collection of information on player sessions created in response to the
  /// game session placement request. These player sessions are created only once
  /// a new game session is successfully placed (placement status is
  /// <code>FULFILLED</code>). This information includes the player ID (as
  /// provided in the placement request) and the corresponding player session ID.
  /// Retrieve full player sessions by calling <a>DescribePlayerSessions</a> with
  /// the player session ID.
  @_s.JsonKey(name: 'PlacedPlayerSessions')
  final List<PlacedPlayerSession> placedPlayerSessions;

  /// A unique identifier for a game session placement.
  @_s.JsonKey(name: 'PlacementId')
  final String placementId;

  /// Set of values, expressed in milliseconds, indicating the amount of latency
  /// that a player experiences when connected to AWS Regions.
  @_s.JsonKey(name: 'PlayerLatencies')
  final List<PlayerLatency> playerLatencies;

  /// Port number for the game session. To connect to a Amazon GameLift game
  /// server, an app needs both the IP address and port number. This value is set
  /// once the new game session is placed (placement status is
  /// <code>FULFILLED</code>).
  @_s.JsonKey(name: 'Port')
  final int port;

  /// Time stamp indicating when this request was placed in the queue. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// Current status of the game session placement request.
  ///
  /// <ul>
  /// <li>
  /// <b>PENDING</b> -- The placement request is currently in the queue waiting to
  /// be processed.
  /// </li>
  /// <li>
  /// <b>FULFILLED</b> -- A new game session and player sessions (if requested)
  /// have been successfully created. Values for <i>GameSessionArn</i> and
  /// <i>GameSessionRegion</i> are available.
  /// </li>
  /// <li>
  /// <b>CANCELLED</b> -- The placement request was canceled with a call to
  /// <a>StopGameSessionPlacement</a>.
  /// </li>
  /// <li>
  /// <b>TIMED_OUT</b> -- A new game session was not successfully created before
  /// the time limit expired. You can resubmit the placement request as needed.
  /// </li>
  /// <li>
  /// <b>FAILED</b> -- GameLift is not able to complete the process of placing the
  /// game session. Common reasons are the game session terminated before the
  /// placement process was completed, or an unexpected internal error.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final GameSessionPlacementState status;

  GameSessionPlacement({
    this.dnsName,
    this.endTime,
    this.gameProperties,
    this.gameSessionArn,
    this.gameSessionData,
    this.gameSessionId,
    this.gameSessionName,
    this.gameSessionQueueName,
    this.gameSessionRegion,
    this.ipAddress,
    this.matchmakerData,
    this.maximumPlayerSessionCount,
    this.placedPlayerSessions,
    this.placementId,
    this.playerLatencies,
    this.port,
    this.startTime,
    this.status,
  });
  factory GameSessionPlacement.fromJson(Map<String, dynamic> json) =>
      _$GameSessionPlacementFromJson(json);
}

enum GameSessionPlacementState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('FULFILLED')
  fulfilled,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
  @_s.JsonValue('FAILED')
  failed,
}

/// Configuration of a queue that is used to process game session placement
/// requests. The queue configuration identifies several game features:
///
/// <ul>
/// <li>
/// The destinations where a new game session can potentially be hosted. Amazon
/// GameLift tries these destinations in an order based on either the queue's
/// default order or player latency information, if provided in a placement
/// request. With latency information, Amazon GameLift can place game sessions
/// where the majority of players are reporting the lowest possible latency.
/// </li>
/// <li>
/// The length of time that placement requests can wait in the queue before
/// timing out.
/// </li>
/// <li>
/// A set of optional latency policies that protect individual players from high
/// latencies, preventing game sessions from being placed where any individual
/// player is reporting latency higher than a policy's maximum.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <a>CreateGameSessionQueue</a>
/// </li>
/// <li>
/// <a>DescribeGameSessionQueues</a>
/// </li>
/// <li>
/// <a>UpdateGameSessionQueue</a>
/// </li>
/// <li>
/// <a>DeleteGameSessionQueue</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GameSessionQueue {
  /// A list of fleets that can be used to fulfill game session placement requests
  /// in the queue. Fleets are identified by either a fleet ARN or a fleet alias
  /// ARN. Destinations are listed in default preference order.
  @_s.JsonKey(name: 'Destinations')
  final List<GameSessionQueueDestination> destinations;

  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a GameLift game session queue resource and uniquely
  /// identifies it. ARNs are unique across all Regions. In a GameLift game
  /// session queue ARN, the resource ID matches the <i>Name</i> value.
  @_s.JsonKey(name: 'GameSessionQueueArn')
  final String gameSessionQueueArn;

  /// A descriptive label that is associated with game session queue. Queue names
  /// must be unique within each Region.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A collection of latency policies to apply when processing game sessions
  /// placement requests with player latency information. Multiple policies are
  /// evaluated in order of the maximum latency value, starting with the lowest
  /// latency values. With just one policy, the policy is enforced at the start of
  /// the game session placement for the duration period. With multiple policies,
  /// each policy is enforced consecutively for its duration period. For example,
  /// a queue might enforce a 60-second policy followed by a 120-second policy,
  /// and then no policy for the remainder of the placement.
  @_s.JsonKey(name: 'PlayerLatencyPolicies')
  final List<PlayerLatencyPolicy> playerLatencyPolicies;

  /// The maximum time, in seconds, that a new game session placement request
  /// remains in the queue. When a request exceeds this time, the game session
  /// placement changes to a <code>TIMED_OUT</code> status.
  @_s.JsonKey(name: 'TimeoutInSeconds')
  final int timeoutInSeconds;

  GameSessionQueue({
    this.destinations,
    this.gameSessionQueueArn,
    this.name,
    this.playerLatencyPolicies,
    this.timeoutInSeconds,
  });
  factory GameSessionQueue.fromJson(Map<String, dynamic> json) =>
      _$GameSessionQueueFromJson(json);
}

/// Fleet designated in a game session queue. Requests for new game sessions in
/// the queue are fulfilled by starting a new game session on any destination
/// that is configured for a queue.
///
/// <ul>
/// <li>
/// <a>CreateGameSessionQueue</a>
/// </li>
/// <li>
/// <a>DescribeGameSessionQueues</a>
/// </li>
/// <li>
/// <a>UpdateGameSessionQueue</a>
/// </li>
/// <li>
/// <a>DeleteGameSessionQueue</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GameSessionQueueDestination {
  /// The Amazon Resource Name (ARN) that is assigned to fleet or fleet alias.
  /// ARNs, which include a fleet ID or alias ID and a Region name, provide a
  /// unique identifier across all Regions.
  @_s.JsonKey(name: 'DestinationArn')
  final String destinationArn;

  GameSessionQueueDestination({
    this.destinationArn,
  });
  factory GameSessionQueueDestination.fromJson(Map<String, dynamic> json) =>
      _$GameSessionQueueDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$GameSessionQueueDestinationToJson(this);
}

enum GameSessionStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('ACTIVATING')
  activating,
  @_s.JsonValue('TERMINATED')
  terminated,
  @_s.JsonValue('TERMINATING')
  terminating,
  @_s.JsonValue('ERROR')
  error,
}

enum GameSessionStatusReason {
  @_s.JsonValue('INTERRUPTED')
  interrupted,
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGameSessionLogUrlOutput {
  /// Location of the requested game session logs, available for download. This
  /// URL is valid for 15 minutes, after which S3 will reject any download request
  /// using this URL. You can request a new URL any time within the 14-day period
  /// that the logs are retained.
  @_s.JsonKey(name: 'PreSignedUrl')
  final String preSignedUrl;

  GetGameSessionLogUrlOutput({
    this.preSignedUrl,
  });
  factory GetGameSessionLogUrlOutput.fromJson(Map<String, dynamic> json) =>
      _$GetGameSessionLogUrlOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstanceAccessOutput {
  /// The connection information for a fleet instance, including IP address and
  /// access credentials.
  @_s.JsonKey(name: 'InstanceAccess')
  final InstanceAccess instanceAccess;

  GetInstanceAccessOutput({
    this.instanceAccess,
  });
  factory GetInstanceAccessOutput.fromJson(Map<String, dynamic> json) =>
      _$GetInstanceAccessOutputFromJson(json);
}

/// Properties that describe an instance of a virtual computing resource that
/// hosts one or more game servers. A fleet may contain zero or more instances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Instance {
  /// Time stamp indicating when this data object was created. Format is a number
  /// expressed in Unix time as milliseconds (for example "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// DNS identifier assigned to the instance that is running the game session.
  /// Values have the following format:
  ///
  /// <ul>
  /// <li>
  /// TLS-enabled fleets: <code>&lt;unique identifier&gt;.&lt;region
  /// identifier&gt;.amazongamelift.com</code>.
  /// </li>
  /// <li>
  /// Non-TLS-enabled fleets: <code>ec2-&lt;unique
  /// identifier&gt;.compute.amazonaws.com</code>. (See <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses">Amazon
  /// EC2 Instance IP Addressing</a>.)
  /// </li>
  /// </ul>
  /// When connecting to a game session that is running on a TLS-enabled fleet,
  /// you must use the DNS name, not the IP address.
  @_s.JsonKey(name: 'DnsName')
  final String dnsName;

  /// A unique identifier for a fleet that the instance is in.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  /// A unique identifier for an instance.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// IP address that is assigned to the instance.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// Operating system that is running on this instance.
  @_s.JsonKey(name: 'OperatingSystem')
  final OperatingSystem operatingSystem;

  /// Current status of the instance. Possible statuses include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>PENDING</b> -- The instance is in the process of being created and
  /// launching server processes as defined in the fleet's run-time configuration.
  /// </li>
  /// <li>
  /// <b>ACTIVE</b> -- The instance has been successfully created and at least one
  /// server process has successfully launched and reported back to Amazon
  /// GameLift that it is ready to host a game session. The instance is now
  /// considered ready to host game sessions.
  /// </li>
  /// <li>
  /// <b>TERMINATING</b> -- The instance is in the process of shutting down. This
  /// may happen to reduce capacity during a scaling down event or to recycle
  /// resources in the event of a problem.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final InstanceStatus status;

  /// EC2 instance type that defines the computing resources of this instance.
  @_s.JsonKey(name: 'Type')
  final EC2InstanceType type;

  Instance({
    this.creationTime,
    this.dnsName,
    this.fleetId,
    this.instanceId,
    this.ipAddress,
    this.operatingSystem,
    this.status,
    this.type,
  });
  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

/// Information required to remotely connect to a fleet instance. Access is
/// requested by calling <a>GetInstanceAccess</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceAccess {
  /// Credentials required to access the instance.
  @_s.JsonKey(name: 'Credentials')
  final InstanceCredentials credentials;

  /// A unique identifier for a fleet containing the instance being accessed.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  /// A unique identifier for an instance being accessed.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// IP address that is assigned to the instance.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// Operating system that is running on the instance.
  @_s.JsonKey(name: 'OperatingSystem')
  final OperatingSystem operatingSystem;

  InstanceAccess({
    this.credentials,
    this.fleetId,
    this.instanceId,
    this.ipAddress,
    this.operatingSystem,
  });
  factory InstanceAccess.fromJson(Map<String, dynamic> json) =>
      _$InstanceAccessFromJson(json);
}

/// Set of credentials required to remotely access a fleet instance. Access
/// credentials are requested by calling <a>GetInstanceAccess</a> and returned
/// in an <a>InstanceAccess</a> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceCredentials {
  /// Secret string. For Windows instances, the secret is a password for use with
  /// Windows Remote Desktop. For Linux instances, it is a private key (which must
  /// be saved as a <code>.pem</code> file) for use with SSH.
  @_s.JsonKey(name: 'Secret')
  final String secret;

  /// User login string.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  InstanceCredentials({
    this.secret,
    this.userName,
  });
  factory InstanceCredentials.fromJson(Map<String, dynamic> json) =>
      _$InstanceCredentialsFromJson(json);
}

/// <b>This data type is used with the Amazon GameLift FleetIQ and game server
/// groups.</b>
///
/// An allowed instance type for a <a>GameServerGroup</a>. All game server
/// groups must have at least two instance types defined for it. GameLift
/// FleetIQ periodically evaluates each defined instance type for viability. It
/// then updates the Auto Scaling group with the list of viable instance types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InstanceDefinition {
  /// An EC2 instance type designation.
  @_s.JsonKey(name: 'InstanceType')
  final GameServerGroupInstanceType instanceType;

  /// Instance weighting that indicates how much this instance type contributes to
  /// the total capacity of a game server group. Instance weights are used by
  /// GameLift FleetIQ to calculate the instance type's cost per unit hour and
  /// better identify the most cost-effective options. For detailed information on
  /// weighting instance capacity, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-weighting.html">Instance
  /// Weighting</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. Default
  /// value is "1".
  @_s.JsonKey(name: 'WeightedCapacity')
  final String weightedCapacity;

  InstanceDefinition({
    @_s.required this.instanceType,
    this.weightedCapacity,
  });
  factory InstanceDefinition.fromJson(Map<String, dynamic> json) =>
      _$InstanceDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceDefinitionToJson(this);
}

enum InstanceStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('TERMINATING')
  terminating,
}

/// A range of IP addresses and port settings that allow inbound traffic to
/// connect to server processes on an Amazon GameLift hosting resource. New game
/// sessions that are started on the fleet are assigned an IP address/port
/// number combination, which must fall into the fleet's allowed ranges. For
/// fleets created with a custom game server, the ranges reflect the server's
/// game session assignments. For Realtime Servers fleets, Amazon GameLift
/// automatically opens two port ranges, one for TCP messaging and one for UDP
/// for use by the Realtime servers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IpPermission {
  /// A starting value for a range of allowed port numbers.
  @_s.JsonKey(name: 'FromPort')
  final int fromPort;

  /// A range of allowed IP addresses. This value must be expressed in CIDR
  /// notation. Example: "<code>000.000.000.000/[subnet mask]</code>" or
  /// optionally the shortened version "<code>0.0.0.0/[subnet mask]</code>".
  @_s.JsonKey(name: 'IpRange')
  final String ipRange;

  /// The network communication protocol used by the fleet.
  @_s.JsonKey(name: 'Protocol')
  final IpProtocol protocol;

  /// An ending value for a range of allowed port numbers. Port numbers are
  /// end-inclusive. This value must be higher than <code>FromPort</code>.
  @_s.JsonKey(name: 'ToPort')
  final int toPort;

  IpPermission({
    @_s.required this.fromPort,
    @_s.required this.ipRange,
    @_s.required this.protocol,
    @_s.required this.toPort,
  });
  factory IpPermission.fromJson(Map<String, dynamic> json) =>
      _$IpPermissionFromJson(json);

  Map<String, dynamic> toJson() => _$IpPermissionToJson(this);
}

enum IpProtocol {
  @_s.JsonValue('TCP')
  tcp,
  @_s.JsonValue('UDP')
  udp,
}

/// <b>This data type is used with the Amazon GameLift FleetIQ and game server
/// groups.</b>
///
/// An EC2 launch template that contains configuration settings and game server
/// code to be deployed to all instances in a game server group. The launch
/// template is specified when creating a new game server group with
/// <a>CreateGameServerGroup</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LaunchTemplateSpecification {
  /// A unique identifier for an existing EC2 launch template.
  @_s.JsonKey(name: 'LaunchTemplateId')
  final String launchTemplateId;

  /// A readable identifier for an existing EC2 launch template.
  @_s.JsonKey(name: 'LaunchTemplateName')
  final String launchTemplateName;

  /// The version of the EC2 launch template to use. If no version is specified,
  /// the default version will be used. With Amazon EC2, you can specify a default
  /// version for a launch template. If none is set, the default is the first
  /// version created.
  @_s.JsonKey(name: 'Version')
  final String version;

  LaunchTemplateSpecification({
    this.launchTemplateId,
    this.launchTemplateName,
    this.version,
  });
  Map<String, dynamic> toJson() => _$LaunchTemplateSpecificationToJson(this);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAliasesOutput {
  /// A collection of alias resources that match the request parameters.
  @_s.JsonKey(name: 'Aliases')
  final List<Alias> aliases;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAliasesOutput({
    this.aliases,
    this.nextToken,
  });
  factory ListAliasesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListAliasesOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBuildsOutput {
  /// A collection of build resources that match the request.
  @_s.JsonKey(name: 'Builds')
  final List<Build> builds;

  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBuildsOutput({
    this.builds,
    this.nextToken,
  });
  factory ListBuildsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBuildsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFleetsOutput {
  /// Set of fleet IDs matching the list request. You can retrieve additional
  /// information about all returned fleets by passing this result set to a call
  /// to <a>DescribeFleetAttributes</a>, <a>DescribeFleetCapacity</a>, or
  /// <a>DescribeFleetUtilization</a>.
  @_s.JsonKey(name: 'FleetIds')
  final List<String> fleetIds;

  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFleetsOutput({
    this.fleetIds,
    this.nextToken,
  });
  factory ListFleetsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListFleetsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGameServerGroupsOutput {
  /// A collection of game server group objects that match the request.
  @_s.JsonKey(name: 'GameServerGroups')
  final List<GameServerGroup> gameServerGroups;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGameServerGroupsOutput({
    this.gameServerGroups,
    this.nextToken,
  });
  factory ListGameServerGroupsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListGameServerGroupsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGameServersOutput {
  /// A collection of game server objects that match the request.
  @_s.JsonKey(name: 'GameServers')
  final List<GameServer> gameServers;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGameServersOutput({
    this.gameServers,
    this.nextToken,
  });
  factory ListGameServersOutput.fromJson(Map<String, dynamic> json) =>
      _$ListGameServersOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListScriptsOutput {
  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A set of properties describing the requested script.
  @_s.JsonKey(name: 'Scripts')
  final List<Script> scripts;

  ListScriptsOutput({
    this.nextToken,
    this.scripts,
  });
  factory ListScriptsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListScriptsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The collection of tags that have been assigned to the specified resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Represents a new player session that is created as a result of a successful
/// FlexMatch match. A successful match automatically creates new player
/// sessions for every player ID in the original matchmaking request.
///
/// When players connect to the match's game session, they must include both
/// player ID and player session ID in order to claim their assigned player
/// slot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MatchedPlayerSession {
  /// A unique identifier for a player
  @_s.JsonKey(name: 'PlayerId')
  final String playerId;

  /// A unique identifier for a player session
  @_s.JsonKey(name: 'PlayerSessionId')
  final String playerSessionId;

  MatchedPlayerSession({
    this.playerId,
    this.playerSessionId,
  });
  factory MatchedPlayerSession.fromJson(Map<String, dynamic> json) =>
      _$MatchedPlayerSessionFromJson(json);
}

/// Guidelines for use with FlexMatch to match players into games. All
/// matchmaking requests must specify a matchmaking configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MatchmakingConfiguration {
  /// A flag that indicates whether a match that was created with this
  /// configuration must be accepted by the matched players. To require
  /// acceptance, set to TRUE. When this option is enabled, matchmaking tickets
  /// use the status <code>REQUIRES_ACCEPTANCE</code> to indicate when a completed
  /// potential match is waiting for player acceptance.
  @_s.JsonKey(name: 'AcceptanceRequired')
  final bool acceptanceRequired;

  /// The length of time (in seconds) to wait for players to accept a proposed
  /// match, if acceptance is required. If any player rejects the match or fails
  /// to accept before the timeout, the tickets are returned to the ticket pool
  /// and continue to be evaluated for an acceptable match.
  @_s.JsonKey(name: 'AcceptanceTimeoutSeconds')
  final int acceptanceTimeoutSeconds;

  /// The number of player slots in a match to keep open for future players. For
  /// example, assume that the configuration's rule set specifies a match for a
  /// single 12-person team. If the additional player count is set to 2, only 10
  /// players are initially selected for the match. This parameter is not used
  /// when <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  @_s.JsonKey(name: 'AdditionalPlayerCount')
  final int additionalPlayerCount;

  /// The method used to backfill game sessions created with this matchmaking
  /// configuration. MANUAL indicates that the game makes backfill requests or
  /// does not use the match backfill feature. AUTOMATIC indicates that GameLift
  /// creates <a>StartMatchBackfill</a> requests whenever a game session has one
  /// or more open slots. Learn more about manual and automatic backfill in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-backfill.html">Backfill
  /// Existing Games with FlexMatch</a>. Automatic backfill is not available when
  /// <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  @_s.JsonKey(name: 'BackfillMode')
  final BackfillMode backfillMode;

  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a GameLift matchmaking configuration resource and
  /// uniquely identifies it. ARNs are unique across all Regions. In a GameLift
  /// configuration ARN, the resource ID matches the <i>Name</i> value.
  @_s.JsonKey(name: 'ConfigurationArn')
  final String configurationArn;

  /// The time stamp indicating when this data object was created. The format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// Information to attach to all events related to the matchmaking
  /// configuration.
  @_s.JsonKey(name: 'CustomEventData')
  final String customEventData;

  /// A descriptive label that is associated with matchmaking configuration.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Indicates whether this matchmaking configuration is being used with GameLift
  /// hosting or as a standalone matchmaking solution.
  ///
  /// <ul>
  /// <li>
  /// <b>STANDALONE</b> - FlexMatch forms matches and returns match information,
  /// including players and team assignments, in a <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html#match-events-matchmakingsucceeded">
  /// MatchmakingSucceeded</a> event.
  /// </li>
  /// <li>
  /// <b>WITH_QUEUE</b> - FlexMatch forms matches and uses the specified GameLift
  /// queue to start a game session for the match.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'FlexMatchMode')
  final FlexMatchMode flexMatchMode;

  /// A set of custom properties for a game session, formatted as key-value pairs.
  /// These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>). This information is added to the new <a>GameSession</a>
  /// object that is created for a successful match. This parameter is not used
  /// when <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  @_s.JsonKey(name: 'GameProperties')
  final List<GameProperty> gameProperties;

  /// A set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the <a>GameSession</a>
  /// object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>). This information is added to the new <a>GameSession</a>
  /// object that is created for a successful match. This parameter is not used
  /// when <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  @_s.JsonKey(name: 'GameSessionData')
  final String gameSessionData;

  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a GameLift game session queue resource and uniquely
  /// identifies it. ARNs are unique across all Regions. Queues can be located in
  /// any Region. Queues are used to start new GameLift-hosted game sessions for
  /// matches that are created with this matchmaking configuration. Thais property
  /// is not set when <code>FlexMatchMode</code> is set to
  /// <code>STANDALONE</code>.
  @_s.JsonKey(name: 'GameSessionQueueArns')
  final List<String> gameSessionQueueArns;

  /// A unique identifier for a matchmaking configuration. This name is used to
  /// identify the configuration associated with a matchmaking request or ticket.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An SNS topic ARN that is set up to receive matchmaking notifications.
  @_s.JsonKey(name: 'NotificationTarget')
  final String notificationTarget;

  /// The maximum duration, in seconds, that a matchmaking ticket can remain in
  /// process before timing out. Requests that fail due to timing out can be
  /// resubmitted as needed.
  @_s.JsonKey(name: 'RequestTimeoutSeconds')
  final int requestTimeoutSeconds;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// associated with the GameLift matchmaking rule set resource that this
  /// configuration uses.
  @_s.JsonKey(name: 'RuleSetArn')
  final String ruleSetArn;

  /// A unique identifier for a matchmaking rule set to use with this
  /// configuration. A matchmaking configuration can only use rule sets that are
  /// defined in the same Region.
  @_s.JsonKey(name: 'RuleSetName')
  final String ruleSetName;

  MatchmakingConfiguration({
    this.acceptanceRequired,
    this.acceptanceTimeoutSeconds,
    this.additionalPlayerCount,
    this.backfillMode,
    this.configurationArn,
    this.creationTime,
    this.customEventData,
    this.description,
    this.flexMatchMode,
    this.gameProperties,
    this.gameSessionData,
    this.gameSessionQueueArns,
    this.name,
    this.notificationTarget,
    this.requestTimeoutSeconds,
    this.ruleSetArn,
    this.ruleSetName,
  });
  factory MatchmakingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MatchmakingConfigurationFromJson(json);
}

enum MatchmakingConfigurationStatus {
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('PLACING')
  placing,
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('REQUIRES_ACCEPTANCE')
  requiresAcceptance,
  @_s.JsonValue('SEARCHING')
  searching,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
}

/// Set of rule statements, used with FlexMatch, that determine how to build
/// your player matches. Each rule set describes a type of group to be created
/// and defines the parameters for acceptable player matches. Rule sets are used
/// in <a>MatchmakingConfiguration</a> objects.
///
/// A rule set may define the following elements for a match. For detailed
/// information and examples showing how to construct a rule set, see <a
/// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html">Build
/// a FlexMatch Rule Set</a>.
///
/// <ul>
/// <li>
/// Teams -- Required. A rule set must define one or multiple teams for the
/// match and set minimum and maximum team sizes. For example, a rule set might
/// describe a 4x4 match that requires all eight slots to be filled.
/// </li>
/// <li>
/// Player attributes -- Optional. These attributes specify a set of player
/// characteristics to evaluate when looking for a match. Matchmaking requests
/// that use a rule set with player attributes must provide the corresponding
/// attribute values. For example, an attribute might specify a player's skill
/// or level.
/// </li>
/// <li>
/// Rules -- Optional. Rules define how to evaluate potential players for a
/// match based on player attributes. A rule might specify minimum requirements
/// for individual players, teams, or entire matches. For example, a rule might
/// require each player to meet a certain skill level, each team to have at
/// least one player in a certain role, or the match to have a minimum average
/// skill level. or may describe an entire group--such as all teams must be
/// evenly matched or have at least one player in a certain role.
/// </li>
/// <li>
/// Expansions -- Optional. Expansions allow you to relax the rules after a
/// period of time when no acceptable matches are found. This feature lets you
/// balance getting players into games in a reasonable amount of time instead of
/// making them wait indefinitely for the best possible match. For example, you
/// might use an expansion to increase the maximum skill variance between
/// players after 30 seconds.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MatchmakingRuleSet {
  /// A collection of matchmaking rules, formatted as a JSON string. Comments are
  /// not allowed in JSON, but most elements support a description field.
  @_s.JsonKey(name: 'RuleSetBody')
  final String ruleSetBody;

  /// The time stamp indicating when this data object was created. The format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a GameLift matchmaking rule set resource and uniquely
  /// identifies it. ARNs are unique across all Regions. In a GameLift rule set
  /// ARN, the resource ID matches the <i>RuleSetName</i> value.
  @_s.JsonKey(name: 'RuleSetArn')
  final String ruleSetArn;

  /// A unique identifier for a matchmaking rule set
  @_s.JsonKey(name: 'RuleSetName')
  final String ruleSetName;

  MatchmakingRuleSet({
    @_s.required this.ruleSetBody,
    this.creationTime,
    this.ruleSetArn,
    this.ruleSetName,
  });
  factory MatchmakingRuleSet.fromJson(Map<String, dynamic> json) =>
      _$MatchmakingRuleSetFromJson(json);
}

/// Ticket generated to track the progress of a matchmaking request. Each ticket
/// is uniquely identified by a ticket ID, supplied by the requester, when
/// creating a matchmaking request with <a>StartMatchmaking</a>. Tickets can be
/// retrieved by calling <a>DescribeMatchmaking</a> with the ticket ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MatchmakingTicket {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// associated with the GameLift matchmaking configuration resource that is used
  /// with this ticket.
  @_s.JsonKey(name: 'ConfigurationArn')
  final String configurationArn;

  /// Name of the <a>MatchmakingConfiguration</a> that is used with this ticket.
  /// Matchmaking configurations determine how players are grouped into a match
  /// and how a new game session is created for the match.
  @_s.JsonKey(name: 'ConfigurationName')
  final String configurationName;

  /// Time stamp indicating when this matchmaking request stopped being processed
  /// due to success, failure, or cancellation. Format is a number expressed in
  /// Unix time as milliseconds (for example "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// Average amount of time (in seconds) that players are currently waiting for a
  /// match. If there is not enough recent data, this property may be empty.
  @_s.JsonKey(name: 'EstimatedWaitTime')
  final int estimatedWaitTime;

  /// Identifier and connection information of the game session created for the
  /// match. This information is added to the ticket only after the matchmaking
  /// request has been successfully completed. This parameter is not set when
  /// FlexMatch is being used without GameLift hosting.
  @_s.JsonKey(name: 'GameSessionConnectionInfo')
  final GameSessionConnectionInfo gameSessionConnectionInfo;

  /// A set of <code>Player</code> objects, each representing a player to find
  /// matches for. Players are identified by a unique player ID and may include
  /// latency data for use during matchmaking. If the ticket is in status
  /// <code>COMPLETED</code>, the <code>Player</code> objects include the team the
  /// players were assigned to in the resulting match.
  @_s.JsonKey(name: 'Players')
  final List<Player> players;

  /// Time stamp indicating when this matchmaking request was received. Format is
  /// a number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// Current status of the matchmaking request.
  ///
  /// <ul>
  /// <li>
  /// <b>QUEUED</b> -- The matchmaking request has been received and is currently
  /// waiting to be processed.
  /// </li>
  /// <li>
  /// <b>SEARCHING</b> -- The matchmaking request is currently being processed.
  /// </li>
  /// <li>
  /// <b>REQUIRES_ACCEPTANCE</b> -- A match has been proposed and the players must
  /// accept the match (see <a>AcceptMatch</a>). This status is used only with
  /// requests that use a matchmaking configuration with a player acceptance
  /// requirement.
  /// </li>
  /// <li>
  /// <b>PLACING</b> -- The FlexMatch engine has matched players and is in the
  /// process of placing a new game session for the match.
  /// </li>
  /// <li>
  /// <b>COMPLETED</b> -- Players have been matched and a game session is ready to
  /// host the players. A ticket in this state contains the necessary connection
  /// information for players.
  /// </li>
  /// <li>
  /// <b>FAILED</b> -- The matchmaking request was not completed.
  /// </li>
  /// <li>
  /// <b>CANCELLED</b> -- The matchmaking request was canceled. This may be the
  /// result of a call to <a>StopMatchmaking</a> or a proposed match that one or
  /// more players failed to accept.
  /// </li>
  /// <li>
  /// <b>TIMED_OUT</b> -- The matchmaking request was not successful within the
  /// duration specified in the matchmaking configuration.
  /// </li>
  /// </ul> <note>
  /// Matchmaking requests that fail to successfully complete (statuses FAILED,
  /// CANCELLED, TIMED_OUT) can be resubmitted as new requests with new ticket
  /// IDs.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final MatchmakingConfigurationStatus status;

  /// Additional information about the current status.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// Code to explain the current status. For example, a status reason may
  /// indicate when a ticket has returned to <code>SEARCHING</code> status after a
  /// proposed match fails to receive player acceptances.
  @_s.JsonKey(name: 'StatusReason')
  final String statusReason;

  /// A unique identifier for a matchmaking ticket.
  @_s.JsonKey(name: 'TicketId')
  final String ticketId;

  MatchmakingTicket({
    this.configurationArn,
    this.configurationName,
    this.endTime,
    this.estimatedWaitTime,
    this.gameSessionConnectionInfo,
    this.players,
    this.startTime,
    this.status,
    this.statusMessage,
    this.statusReason,
    this.ticketId,
  });
  factory MatchmakingTicket.fromJson(Map<String, dynamic> json) =>
      _$MatchmakingTicketFromJson(json);
}

enum MetricName {
  @_s.JsonValue('ActivatingGameSessions')
  activatingGameSessions,
  @_s.JsonValue('ActiveGameSessions')
  activeGameSessions,
  @_s.JsonValue('ActiveInstances')
  activeInstances,
  @_s.JsonValue('AvailableGameSessions')
  availableGameSessions,
  @_s.JsonValue('AvailablePlayerSessions')
  availablePlayerSessions,
  @_s.JsonValue('CurrentPlayerSessions')
  currentPlayerSessions,
  @_s.JsonValue('IdleInstances')
  idleInstances,
  @_s.JsonValue('PercentAvailableGameSessions')
  percentAvailableGameSessions,
  @_s.JsonValue('PercentIdleInstances')
  percentIdleInstances,
  @_s.JsonValue('QueueDepth')
  queueDepth,
  @_s.JsonValue('WaitTime')
  waitTime,
}

extension on MetricName {
  String toValue() {
    switch (this) {
      case MetricName.activatingGameSessions:
        return 'ActivatingGameSessions';
      case MetricName.activeGameSessions:
        return 'ActiveGameSessions';
      case MetricName.activeInstances:
        return 'ActiveInstances';
      case MetricName.availableGameSessions:
        return 'AvailableGameSessions';
      case MetricName.availablePlayerSessions:
        return 'AvailablePlayerSessions';
      case MetricName.currentPlayerSessions:
        return 'CurrentPlayerSessions';
      case MetricName.idleInstances:
        return 'IdleInstances';
      case MetricName.percentAvailableGameSessions:
        return 'PercentAvailableGameSessions';
      case MetricName.percentIdleInstances:
        return 'PercentIdleInstances';
      case MetricName.queueDepth:
        return 'QueueDepth';
      case MetricName.waitTime:
        return 'WaitTime';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum OperatingSystem {
  @_s.JsonValue('WINDOWS_2012')
  windows_2012,
  @_s.JsonValue('AMAZON_LINUX')
  amazonLinux,
  @_s.JsonValue('AMAZON_LINUX_2')
  amazonLinux_2,
}

extension on OperatingSystem {
  String toValue() {
    switch (this) {
      case OperatingSystem.windows_2012:
        return 'WINDOWS_2012';
      case OperatingSystem.amazonLinux:
        return 'AMAZON_LINUX';
      case OperatingSystem.amazonLinux_2:
        return 'AMAZON_LINUX_2';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a player session that was created as part of a
/// <a>StartGameSessionPlacement</a> request. This object contains only the
/// player ID and player session ID. To retrieve full details on a player
/// session, call <a>DescribePlayerSessions</a> with the player session ID.
///
/// <ul>
/// <li>
/// <a>CreatePlayerSession</a>
/// </li>
/// <li>
/// <a>CreatePlayerSessions</a>
/// </li>
/// <li>
/// <a>DescribePlayerSessions</a>
/// </li>
/// <li>
/// Game session placements
///
/// <ul>
/// <li>
/// <a>StartGameSessionPlacement</a>
/// </li>
/// <li>
/// <a>DescribeGameSessionPlacement</a>
/// </li>
/// <li>
/// <a>StopGameSessionPlacement</a>
/// </li>
/// </ul> </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PlacedPlayerSession {
  /// A unique identifier for a player that is associated with this player
  /// session.
  @_s.JsonKey(name: 'PlayerId')
  final String playerId;

  /// A unique identifier for a player session.
  @_s.JsonKey(name: 'PlayerSessionId')
  final String playerSessionId;

  PlacedPlayerSession({
    this.playerId,
    this.playerSessionId,
  });
  factory PlacedPlayerSession.fromJson(Map<String, dynamic> json) =>
      _$PlacedPlayerSessionFromJson(json);
}

/// Represents a player in matchmaking. When starting a matchmaking request, a
/// player has a player ID, attributes, and may have latency data. Team
/// information is added after a match has been successfully completed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Player {
  /// Set of values, expressed in milliseconds, indicating the amount of latency
  /// that a player experiences when connected to AWS Regions. If this property is
  /// present, FlexMatch considers placing the match only in Regions for which
  /// latency is reported.
  ///
  /// If a matchmaker has a rule that evaluates player latency, players must
  /// report latency in order to be matched. If no latency is reported in this
  /// scenario, FlexMatch assumes that no Regions are available to the player and
  /// the ticket is not matchable.
  @_s.JsonKey(name: 'LatencyInMs')
  final Map<String, int> latencyInMs;

  /// A collection of key:value pairs containing player information for use in
  /// matchmaking. Player attribute keys must match the <i>playerAttributes</i>
  /// used in a matchmaking rule set. Example: <code>"PlayerAttributes": {"skill":
  /// {"N": "23"}, "gameMode": {"S": "deathmatch"}}</code>.
  @_s.JsonKey(name: 'PlayerAttributes')
  final Map<String, AttributeValue> playerAttributes;

  /// A unique identifier for a player
  @_s.JsonKey(name: 'PlayerId')
  final String playerId;

  /// Name of the team that the player is assigned to in a match. Team names are
  /// defined in a matchmaking rule set.
  @_s.JsonKey(name: 'Team')
  final String team;

  Player({
    this.latencyInMs,
    this.playerAttributes,
    this.playerId,
    this.team,
  });
  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}

/// Regional latency information for a player, used when requesting a new game
/// session with <a>StartGameSessionPlacement</a>. This value indicates the
/// amount of time lag that exists when the player is connected to a fleet in
/// the specified Region. The relative difference between a player's latency
/// values for multiple Regions are used to determine which fleets are best
/// suited to place a new game session for the player.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PlayerLatency {
  /// Amount of time that represents the time lag experienced by the player when
  /// connected to the specified Region.
  @_s.JsonKey(name: 'LatencyInMilliseconds')
  final double latencyInMilliseconds;

  /// A unique identifier for a player associated with the latency data.
  @_s.JsonKey(name: 'PlayerId')
  final String playerId;

  /// Name of the Region that is associated with the latency value.
  @_s.JsonKey(name: 'RegionIdentifier')
  final String regionIdentifier;

  PlayerLatency({
    this.latencyInMilliseconds,
    this.playerId,
    this.regionIdentifier,
  });
  factory PlayerLatency.fromJson(Map<String, dynamic> json) =>
      _$PlayerLatencyFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerLatencyToJson(this);
}

/// Queue setting that determines the highest latency allowed for individual
/// players when placing a game session. When a latency policy is in force, a
/// game session cannot be placed with any fleet in a Region where a player
/// reports latency higher than the cap. Latency policies are only enforced when
/// the placement request contains player latency information.
///
/// <ul>
/// <li>
/// <a>CreateGameSessionQueue</a>
/// </li>
/// <li>
/// <a>DescribeGameSessionQueues</a>
/// </li>
/// <li>
/// <a>UpdateGameSessionQueue</a>
/// </li>
/// <li>
/// <a>DeleteGameSessionQueue</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PlayerLatencyPolicy {
  /// The maximum latency value that is allowed for any player, in milliseconds.
  /// All policies must have a value set for this property.
  @_s.JsonKey(name: 'MaximumIndividualPlayerLatencyMilliseconds')
  final int maximumIndividualPlayerLatencyMilliseconds;

  /// The length of time, in seconds, that the policy is enforced while placing a
  /// new game session. A null value for this property means that the policy is
  /// enforced until the queue times out.
  @_s.JsonKey(name: 'PolicyDurationSeconds')
  final int policyDurationSeconds;

  PlayerLatencyPolicy({
    this.maximumIndividualPlayerLatencyMilliseconds,
    this.policyDurationSeconds,
  });
  factory PlayerLatencyPolicy.fromJson(Map<String, dynamic> json) =>
      _$PlayerLatencyPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerLatencyPolicyToJson(this);
}

/// Properties describing a player session. Player session objects are created
/// either by creating a player session for a specific game session, or as part
/// of a game session placement. A player session represents either a player
/// reservation for a game session (status <code>RESERVED</code>) or actual
/// player activity in a game session (status <code>ACTIVE</code>). A player
/// session object (including player data) is automatically passed to a game
/// session when the player connects to the game session and is validated.
///
/// When a player disconnects, the player session status changes to
/// <code>COMPLETED</code>. Once the session ends, the player session object is
/// retained for 30 days and then removed.
///
/// <ul>
/// <li>
/// <a>CreatePlayerSession</a>
/// </li>
/// <li>
/// <a>CreatePlayerSessions</a>
/// </li>
/// <li>
/// <a>DescribePlayerSessions</a>
/// </li>
/// <li>
/// Game session placements
///
/// <ul>
/// <li>
/// <a>StartGameSessionPlacement</a>
/// </li>
/// <li>
/// <a>DescribeGameSessionPlacement</a>
/// </li>
/// <li>
/// <a>StopGameSessionPlacement</a>
/// </li>
/// </ul> </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PlayerSession {
  /// Time stamp indicating when this data object was created. Format is a number
  /// expressed in Unix time as milliseconds (for example "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// DNS identifier assigned to the instance that is running the game session.
  /// Values have the following format:
  ///
  /// <ul>
  /// <li>
  /// TLS-enabled fleets: <code>&lt;unique identifier&gt;.&lt;region
  /// identifier&gt;.amazongamelift.com</code>.
  /// </li>
  /// <li>
  /// Non-TLS-enabled fleets: <code>ec2-&lt;unique
  /// identifier&gt;.compute.amazonaws.com</code>. (See <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses">Amazon
  /// EC2 Instance IP Addressing</a>.)
  /// </li>
  /// </ul>
  /// When connecting to a game session that is running on a TLS-enabled fleet,
  /// you must use the DNS name, not the IP address.
  @_s.JsonKey(name: 'DnsName')
  final String dnsName;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// associated with the GameLift fleet that the player's game session is running
  /// on.
  @_s.JsonKey(name: 'FleetArn')
  final String fleetArn;

  /// A unique identifier for a fleet that the player's game session is running
  /// on.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  /// A unique identifier for the game session that the player session is
  /// connected to.
  @_s.JsonKey(name: 'GameSessionId')
  final String gameSessionId;

  /// IP address of the instance that is running the game session. When connecting
  /// to a Amazon GameLift game server, a client needs to reference an IP address
  /// (or DNS name) and port number.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// Developer-defined information related to a player. Amazon GameLift does not
  /// use this data, so it can be formatted as needed for use in the game.
  @_s.JsonKey(name: 'PlayerData')
  final String playerData;

  /// A unique identifier for a player that is associated with this player
  /// session.
  @_s.JsonKey(name: 'PlayerId')
  final String playerId;

  /// A unique identifier for a player session.
  @_s.JsonKey(name: 'PlayerSessionId')
  final String playerSessionId;

  /// Port number for the game session. To connect to a Amazon GameLift server
  /// process, an app needs both the IP address and port number.
  @_s.JsonKey(name: 'Port')
  final int port;

  /// Current status of the player session.
  ///
  /// Possible player session statuses include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>RESERVED</b> -- The player session request has been received, but the
  /// player has not yet connected to the server process and/or been validated.
  /// </li>
  /// <li>
  /// <b>ACTIVE</b> -- The player has been validated by the server process and is
  /// currently connected.
  /// </li>
  /// <li>
  /// <b>COMPLETED</b> -- The player connection has been dropped.
  /// </li>
  /// <li>
  /// <b>TIMEDOUT</b> -- A player session request was received, but the player did
  /// not connect and/or was not validated within the timeout limit (60 seconds).
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final PlayerSessionStatus status;

  /// Time stamp indicating when this data object was terminated. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'TerminationTime')
  final DateTime terminationTime;

  PlayerSession({
    this.creationTime,
    this.dnsName,
    this.fleetArn,
    this.fleetId,
    this.gameSessionId,
    this.ipAddress,
    this.playerData,
    this.playerId,
    this.playerSessionId,
    this.port,
    this.status,
    this.terminationTime,
  });
  factory PlayerSession.fromJson(Map<String, dynamic> json) =>
      _$PlayerSessionFromJson(json);
}

enum PlayerSessionCreationPolicy {
  @_s.JsonValue('ACCEPT_ALL')
  acceptAll,
  @_s.JsonValue('DENY_ALL')
  denyAll,
}

extension on PlayerSessionCreationPolicy {
  String toValue() {
    switch (this) {
      case PlayerSessionCreationPolicy.acceptAll:
        return 'ACCEPT_ALL';
      case PlayerSessionCreationPolicy.denyAll:
        return 'DENY_ALL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum PlayerSessionStatus {
  @_s.JsonValue('RESERVED')
  reserved,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('TIMEDOUT')
  timedout,
}

enum PolicyType {
  @_s.JsonValue('RuleBased')
  ruleBased,
  @_s.JsonValue('TargetBased')
  targetBased,
}

extension on PolicyType {
  String toValue() {
    switch (this) {
      case PolicyType.ruleBased:
        return 'RuleBased';
      case PolicyType.targetBased:
        return 'TargetBased';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ProtectionPolicy {
  @_s.JsonValue('NoProtection')
  noProtection,
  @_s.JsonValue('FullProtection')
  fullProtection,
}

extension on ProtectionPolicy {
  String toValue() {
    switch (this) {
      case ProtectionPolicy.noProtection:
        return 'NoProtection';
      case ProtectionPolicy.fullProtection:
        return 'FullProtection';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutScalingPolicyOutput {
  /// A descriptive label that is associated with a scaling policy. Policy names
  /// do not need to be unique.
  @_s.JsonKey(name: 'Name')
  final String name;

  PutScalingPolicyOutput({
    this.name,
  });
  factory PutScalingPolicyOutput.fromJson(Map<String, dynamic> json) =>
      _$PutScalingPolicyOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterGameServerOutput {
  /// Object that describes the newly registered game server.
  @_s.JsonKey(name: 'GameServer')
  final GameServer gameServer;

  RegisterGameServerOutput({
    this.gameServer,
  });
  factory RegisterGameServerOutput.fromJson(Map<String, dynamic> json) =>
      _$RegisterGameServerOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestUploadCredentialsOutput {
  /// Amazon S3 path and key, identifying where the game build files are stored.
  @_s.JsonKey(name: 'StorageLocation')
  final S3Location storageLocation;

  /// AWS credentials required when uploading a game build to the storage
  /// location. These credentials have a limited lifespan and are valid only for
  /// the build they were issued for.
  @_s.JsonKey(name: 'UploadCredentials')
  final AwsCredentials uploadCredentials;

  RequestUploadCredentialsOutput({
    this.storageLocation,
    this.uploadCredentials,
  });
  factory RequestUploadCredentialsOutput.fromJson(Map<String, dynamic> json) =>
      _$RequestUploadCredentialsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolveAliasOutput {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// associated with the GameLift fleet resource that this alias points to.
  @_s.JsonKey(name: 'FleetArn')
  final String fleetArn;

  /// The fleet identifier that the alias is pointing to.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  ResolveAliasOutput({
    this.fleetArn,
    this.fleetId,
  });
  factory ResolveAliasOutput.fromJson(Map<String, dynamic> json) =>
      _$ResolveAliasOutputFromJson(json);
}

/// A policy that limits the number of game sessions a player can create on the
/// same fleet. This optional policy gives game owners control over how players
/// can consume available game server resources. A resource creation policy
/// makes the following statement: "An individual player can create a maximum
/// number of new game sessions within a specified time period".
///
/// The policy is evaluated when a player tries to create a new game session.
/// For example: Assume you have a policy of 10 new game sessions and a time
/// period of 60 minutes. On receiving a <code>CreateGameSession</code> request,
/// Amazon GameLift checks that the player (identified by
/// <code>CreatorId</code>) has created fewer than 10 game sessions in the past
/// 60 minutes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceCreationLimitPolicy {
  /// The maximum number of game sessions that an individual can create during the
  /// policy period.
  @_s.JsonKey(name: 'NewGameSessionsPerCreator')
  final int newGameSessionsPerCreator;

  /// The time span used in evaluating the resource creation limit policy.
  @_s.JsonKey(name: 'PolicyPeriodInMinutes')
  final int policyPeriodInMinutes;

  ResourceCreationLimitPolicy({
    this.newGameSessionsPerCreator,
    this.policyPeriodInMinutes,
  });
  factory ResourceCreationLimitPolicy.fromJson(Map<String, dynamic> json) =>
      _$ResourceCreationLimitPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceCreationLimitPolicyToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResumeGameServerGroupOutput {
  /// An object that describes the game server group resource, with the
  /// <code>SuspendedActions</code> property updated to reflect the resumed
  /// activity.
  @_s.JsonKey(name: 'GameServerGroup')
  final GameServerGroup gameServerGroup;

  ResumeGameServerGroupOutput({
    this.gameServerGroup,
  });
  factory ResumeGameServerGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$ResumeGameServerGroupOutputFromJson(json);
}

/// The routing configuration for a fleet alias.
///
/// <ul>
/// <li>
/// <a>CreateAlias</a>
/// </li>
/// <li>
/// <a>ListAliases</a>
/// </li>
/// <li>
/// <a>DescribeAlias</a>
/// </li>
/// <li>
/// <a>UpdateAlias</a>
/// </li>
/// <li>
/// <a>DeleteAlias</a>
/// </li>
/// <li>
/// <a>ResolveAlias</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RoutingStrategy {
  /// The unique identifier for a fleet that the alias points to. This value is
  /// the fleet ID, not the fleet ARN.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  /// The message text to be used with a terminal routing strategy.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The type of routing strategy for the alias.
  ///
  /// Possible routing types include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>SIMPLE</b> - The alias resolves to one specific fleet. Use this type when
  /// routing to active fleets.
  /// </li>
  /// <li>
  /// <b>TERMINAL</b> - The alias does not resolve to a fleet but instead can be
  /// used to display a message to the user. A terminal alias throws a
  /// TerminalRoutingStrategyException with the <a>RoutingStrategy</a> message
  /// embedded.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final RoutingStrategyType type;

  RoutingStrategy({
    this.fleetId,
    this.message,
    this.type,
  });
  factory RoutingStrategy.fromJson(Map<String, dynamic> json) =>
      _$RoutingStrategyFromJson(json);

  Map<String, dynamic> toJson() => _$RoutingStrategyToJson(this);
}

enum RoutingStrategyType {
  @_s.JsonValue('SIMPLE')
  simple,
  @_s.JsonValue('TERMINAL')
  terminal,
}

extension on RoutingStrategyType {
  String toValue() {
    switch (this) {
      case RoutingStrategyType.simple:
        return 'SIMPLE';
      case RoutingStrategyType.terminal:
        return 'TERMINAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A collection of server process configurations that describe what processes
/// to run on each instance in a fleet. Server processes run either a custom
/// game build executable or a Realtime Servers script. Each instance in the
/// fleet starts the specified server processes and continues to start new
/// processes as existing processes end. Each instance regularly checks for an
/// updated runtime configuration.
///
/// The runtime configuration enables the instances in a fleet to run multiple
/// processes simultaneously. Learn more about <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-multiprocess.html">
/// Running Multiple Processes on a Fleet </a>.
///
/// A Amazon GameLift instance is limited to 50 processes running
/// simultaneously. To calculate the total number of processes in a runtime
/// configuration, add the values of the <code>ConcurrentExecutions</code>
/// parameter for each <a>ServerProcess</a> object.
///
/// <ul>
/// <li>
/// <a>CreateFleet</a>
/// </li>
/// <li>
/// <a>ListFleets</a>
/// </li>
/// <li>
/// <a>DeleteFleet</a>
/// </li>
/// <li>
/// <a>DescribeFleetAttributes</a>
/// </li>
/// <li>
/// <a>UpdateFleetAttributes</a>
/// </li>
/// <li>
/// <a>StartFleetActions</a> or <a>StopFleetActions</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RuntimeConfiguration {
  /// The maximum amount of time (in seconds) that a game session can remain in
  /// status <code>ACTIVATING</code>. If the game session is not active before the
  /// timeout, activation is terminated and the game session status is changed to
  /// <code>TERMINATED</code>.
  @_s.JsonKey(name: 'GameSessionActivationTimeoutSeconds')
  final int gameSessionActivationTimeoutSeconds;

  /// The maximum number of game sessions with status <code>ACTIVATING</code> to
  /// allow on an instance simultaneously. This setting limits the amount of
  /// instance resources that can be used for new game activations at any one
  /// time.
  @_s.JsonKey(name: 'MaxConcurrentGameSessionActivations')
  final int maxConcurrentGameSessionActivations;

  /// A collection of server process configurations that describe which server
  /// processes to run on each instance in a fleet.
  @_s.JsonKey(name: 'ServerProcesses')
  final List<ServerProcess> serverProcesses;

  RuntimeConfiguration({
    this.gameSessionActivationTimeoutSeconds,
    this.maxConcurrentGameSessionActivations,
    this.serverProcesses,
  });
  factory RuntimeConfiguration.fromJson(Map<String, dynamic> json) =>
      _$RuntimeConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$RuntimeConfigurationToJson(this);
}

/// The location in S3 where build or script files are stored for access by
/// Amazon GameLift. This location is specified in <a>CreateBuild</a>,
/// <a>CreateScript</a>, and <a>UpdateScript</a> requests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Location {
  /// An S3 bucket identifier. This is the name of the S3 bucket.
  /// <note>
  /// GameLift currently does not support uploading from S3 buckets with names
  /// that contain a dot (.).
  /// </note>
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// The name of the zip file that contains the build files or script files.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The version of the file, if object versioning is turned on for the bucket.
  /// Amazon GameLift uses this information when retrieving files from an S3
  /// bucket that you own. Use this parameter to specify a specific version of the
  /// file. If not set, the latest version of the file is retrieved.
  @_s.JsonKey(name: 'ObjectVersion')
  final String objectVersion;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// for an IAM role that allows Amazon GameLift to access the S3 bucket.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  S3Location({
    this.bucket,
    this.key,
    this.objectVersion,
    this.roleArn,
  });
  factory S3Location.fromJson(Map<String, dynamic> json) =>
      _$S3LocationFromJson(json);

  Map<String, dynamic> toJson() => _$S3LocationToJson(this);
}

enum ScalingAdjustmentType {
  @_s.JsonValue('ChangeInCapacity')
  changeInCapacity,
  @_s.JsonValue('ExactCapacity')
  exactCapacity,
  @_s.JsonValue('PercentChangeInCapacity')
  percentChangeInCapacity,
}

extension on ScalingAdjustmentType {
  String toValue() {
    switch (this) {
      case ScalingAdjustmentType.changeInCapacity:
        return 'ChangeInCapacity';
      case ScalingAdjustmentType.exactCapacity:
        return 'ExactCapacity';
      case ScalingAdjustmentType.percentChangeInCapacity:
        return 'PercentChangeInCapacity';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Rule that controls how a fleet is scaled. Scaling policies are uniquely
/// identified by the combination of name and fleet ID.
///
/// <ul>
/// <li>
/// <a>DescribeFleetCapacity</a>
/// </li>
/// <li>
/// <a>UpdateFleetCapacity</a>
/// </li>
/// <li>
/// <a>DescribeEC2InstanceLimits</a>
/// </li>
/// <li>
/// Manage scaling policies:
///
/// <ul>
/// <li>
/// <a>PutScalingPolicy</a> (auto-scaling)
/// </li>
/// <li>
/// <a>DescribeScalingPolicies</a> (auto-scaling)
/// </li>
/// <li>
/// <a>DeleteScalingPolicy</a> (auto-scaling)
/// </li>
/// </ul> </li>
/// <li>
/// Manage fleet actions:
///
/// <ul>
/// <li>
/// <a>StartFleetActions</a>
/// </li>
/// <li>
/// <a>StopFleetActions</a>
/// </li>
/// </ul> </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScalingPolicy {
  /// Comparison operator to use when measuring a metric against the threshold
  /// value.
  @_s.JsonKey(name: 'ComparisonOperator')
  final ComparisonOperatorType comparisonOperator;

  /// Length of time (in minutes) the metric must be at or beyond the threshold
  /// before a scaling event is triggered.
  @_s.JsonKey(name: 'EvaluationPeriods')
  final int evaluationPeriods;

  /// A unique identifier for a fleet that is associated with this scaling policy.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  /// Name of the Amazon GameLift-defined metric that is used to trigger a scaling
  /// adjustment. For detailed descriptions of fleet metrics, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html">Monitor
  /// Amazon GameLift with Amazon CloudWatch</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>ActivatingGameSessions</b> -- Game sessions in the process of being
  /// created.
  /// </li>
  /// <li>
  /// <b>ActiveGameSessions</b> -- Game sessions that are currently running.
  /// </li>
  /// <li>
  /// <b>ActiveInstances</b> -- Fleet instances that are currently running at
  /// least one game session.
  /// </li>
  /// <li>
  /// <b>AvailableGameSessions</b> -- Additional game sessions that fleet could
  /// host simultaneously, given current capacity.
  /// </li>
  /// <li>
  /// <b>AvailablePlayerSessions</b> -- Empty player slots in currently active
  /// game sessions. This includes game sessions that are not currently accepting
  /// players. Reserved player slots are not included.
  /// </li>
  /// <li>
  /// <b>CurrentPlayerSessions</b> -- Player slots in active game sessions that
  /// are being used by a player or are reserved for a player.
  /// </li>
  /// <li>
  /// <b>IdleInstances</b> -- Active instances that are currently hosting zero
  /// game sessions.
  /// </li>
  /// <li>
  /// <b>PercentAvailableGameSessions</b> -- Unused percentage of the total number
  /// of game sessions that a fleet could host simultaneously, given current
  /// capacity. Use this metric for a target-based scaling policy.
  /// </li>
  /// <li>
  /// <b>PercentIdleInstances</b> -- Percentage of the total number of active
  /// instances that are hosting zero game sessions.
  /// </li>
  /// <li>
  /// <b>QueueDepth</b> -- Pending game session placement requests, in any queue,
  /// where the current fleet is the top-priority destination.
  /// </li>
  /// <li>
  /// <b>WaitTime</b> -- Current wait time for pending game session placement
  /// requests, in any queue, where the current fleet is the top-priority
  /// destination.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MetricName')
  final MetricName metricName;

  /// A descriptive label that is associated with a scaling policy. Policy names
  /// do not need to be unique.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of scaling policy to create. For a target-based policy, set the
  /// parameter <i>MetricName</i> to 'PercentAvailableGameSessions' and specify a
  /// <i>TargetConfiguration</i>. For a rule-based policy set the following
  /// parameters: <i>MetricName</i>, <i>ComparisonOperator</i>, <i>Threshold</i>,
  /// <i>EvaluationPeriods</i>, <i>ScalingAdjustmentType</i>, and
  /// <i>ScalingAdjustment</i>.
  @_s.JsonKey(name: 'PolicyType')
  final PolicyType policyType;

  /// Amount of adjustment to make, based on the scaling adjustment type.
  @_s.JsonKey(name: 'ScalingAdjustment')
  final int scalingAdjustment;

  /// The type of adjustment to make to a fleet's instance count (see
  /// <a>FleetCapacity</a>):
  ///
  /// <ul>
  /// <li>
  /// <b>ChangeInCapacity</b> -- add (or subtract) the scaling adjustment value
  /// from the current instance count. Positive values scale up while negative
  /// values scale down.
  /// </li>
  /// <li>
  /// <b>ExactCapacity</b> -- set the instance count to the scaling adjustment
  /// value.
  /// </li>
  /// <li>
  /// <b>PercentChangeInCapacity</b> -- increase or reduce the current instance
  /// count by the scaling adjustment, read as a percentage. Positive values scale
  /// up while negative values scale down.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ScalingAdjustmentType')
  final ScalingAdjustmentType scalingAdjustmentType;

  /// Current status of the scaling policy. The scaling policy can be in force
  /// only when in an <code>ACTIVE</code> status. Scaling policies can be
  /// suspended for individual fleets (see <a>StopFleetActions</a>; if suspended
  /// for a fleet, the policy status does not change. View a fleet's stopped
  /// actions by calling <a>DescribeFleetCapacity</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>ACTIVE</b> -- The scaling policy can be used for auto-scaling a fleet.
  /// </li>
  /// <li>
  /// <b>UPDATE_REQUESTED</b> -- A request to update the scaling policy has been
  /// received.
  /// </li>
  /// <li>
  /// <b>UPDATING</b> -- A change is being made to the scaling policy.
  /// </li>
  /// <li>
  /// <b>DELETE_REQUESTED</b> -- A request to delete the scaling policy has been
  /// received.
  /// </li>
  /// <li>
  /// <b>DELETING</b> -- The scaling policy is being deleted.
  /// </li>
  /// <li>
  /// <b>DELETED</b> -- The scaling policy has been deleted.
  /// </li>
  /// <li>
  /// <b>ERROR</b> -- An error occurred in creating the policy. It should be
  /// removed and recreated.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final ScalingStatusType status;

  /// The settings for a target-based scaling policy.
  @_s.JsonKey(name: 'TargetConfiguration')
  final TargetConfiguration targetConfiguration;

  /// Metric value used to trigger a scaling event.
  @_s.JsonKey(name: 'Threshold')
  final double threshold;

  ScalingPolicy({
    this.comparisonOperator,
    this.evaluationPeriods,
    this.fleetId,
    this.metricName,
    this.name,
    this.policyType,
    this.scalingAdjustment,
    this.scalingAdjustmentType,
    this.status,
    this.targetConfiguration,
    this.threshold,
  });
  factory ScalingPolicy.fromJson(Map<String, dynamic> json) =>
      _$ScalingPolicyFromJson(json);
}

enum ScalingStatusType {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UPDATE_REQUESTED')
  updateRequested,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETE_REQUESTED')
  deleteRequested,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('ERROR')
  error,
}

extension on ScalingStatusType {
  String toValue() {
    switch (this) {
      case ScalingStatusType.active:
        return 'ACTIVE';
      case ScalingStatusType.updateRequested:
        return 'UPDATE_REQUESTED';
      case ScalingStatusType.updating:
        return 'UPDATING';
      case ScalingStatusType.deleteRequested:
        return 'DELETE_REQUESTED';
      case ScalingStatusType.deleting:
        return 'DELETING';
      case ScalingStatusType.deleted:
        return 'DELETED';
      case ScalingStatusType.error:
        return 'ERROR';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Properties describing a Realtime script.
///
/// <b>Related operations</b>
///
/// <ul>
/// <li>
/// <a>CreateScript</a>
/// </li>
/// <li>
/// <a>ListScripts</a>
/// </li>
/// <li>
/// <a>DescribeScript</a>
/// </li>
/// <li>
/// <a>UpdateScript</a>
/// </li>
/// <li>
/// <a>DeleteScript</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Script {
  /// A time stamp indicating when this data object was created. The format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// A descriptive label that is associated with a script. Script names do not
  /// need to be unique.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// that is assigned to a GameLift script resource and uniquely identifies it.
  /// ARNs are unique across all Regions. In a GameLift script ARN, the resource
  /// ID matches the <i>ScriptId</i> value.
  @_s.JsonKey(name: 'ScriptArn')
  final String scriptArn;

  /// A unique identifier for a Realtime script
  @_s.JsonKey(name: 'ScriptId')
  final String scriptId;

  /// The file size of the uploaded Realtime script, expressed in bytes. When
  /// files are uploaded from an S3 location, this value remains at "0".
  @_s.JsonKey(name: 'SizeOnDisk')
  final int sizeOnDisk;
  @_s.JsonKey(name: 'StorageLocation')
  final S3Location storageLocation;

  /// The version that is associated with a build or script. Version strings do
  /// not need to be unique.
  @_s.JsonKey(name: 'Version')
  final String version;

  Script({
    this.creationTime,
    this.name,
    this.scriptArn,
    this.scriptId,
    this.sizeOnDisk,
    this.storageLocation,
    this.version,
  });
  factory Script.fromJson(Map<String, dynamic> json) => _$ScriptFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchGameSessionsOutput {
  /// A collection of objects containing game session properties for each session
  /// matching the request.
  @_s.JsonKey(name: 'GameSessions')
  final List<GameSession> gameSessions;

  /// Token that indicates where to resume retrieving results on the next call to
  /// this operation. If no token is returned, these results represent the end of
  /// the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  SearchGameSessionsOutput({
    this.gameSessions,
    this.nextToken,
  });
  factory SearchGameSessionsOutput.fromJson(Map<String, dynamic> json) =>
      _$SearchGameSessionsOutputFromJson(json);
}

/// A set of instructions for launching server processes on each instance in a
/// fleet. Server processes run either a custom game build executable or a
/// Realtime Servers script. Each instruction set identifies the location of the
/// custom game build executable or Realtime launch script, optional launch
/// parameters, and the number of server processes with this configuration to
/// maintain concurrently on the instance. Server process configurations make up
/// a fleet's <code> <a>RuntimeConfiguration</a> </code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServerProcess {
  /// The number of server processes that use this configuration to run
  /// concurrently on an instance.
  @_s.JsonKey(name: 'ConcurrentExecutions')
  final int concurrentExecutions;

  /// The location of the server executable in a custom game build or the name of
  /// the Realtime script file that contains the <code>Init()</code> function.
  /// Game builds and Realtime scripts are installed on instances at the root:
  ///
  /// <ul>
  /// <li>
  /// Windows (for custom game builds only): <code>C:\game</code>. Example:
  /// "<code>C:\game\MyGame\server.exe</code>"
  /// </li>
  /// <li>
  /// Linux: <code>/local/game</code>. Examples:
  /// "<code>/local/game/MyGame/server.exe</code>" or
  /// "<code>/local/game/MyRealtimeScript.js</code>"
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'LaunchPath')
  final String launchPath;

  /// An optional list of parameters to pass to the server executable or Realtime
  /// script on launch.
  @_s.JsonKey(name: 'Parameters')
  final String parameters;

  ServerProcess({
    @_s.required this.concurrentExecutions,
    @_s.required this.launchPath,
    this.parameters,
  });
  factory ServerProcess.fromJson(Map<String, dynamic> json) =>
      _$ServerProcessFromJson(json);

  Map<String, dynamic> toJson() => _$ServerProcessToJson(this);
}

enum SortOrder {
  @_s.JsonValue('ASCENDING')
  ascending,
  @_s.JsonValue('DESCENDING')
  descending,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartFleetActionsOutput {
  StartFleetActionsOutput();
  factory StartFleetActionsOutput.fromJson(Map<String, dynamic> json) =>
      _$StartFleetActionsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartGameSessionPlacementOutput {
  /// Object that describes the newly created game session placement. This object
  /// includes all the information provided in the request, as well as start/end
  /// time stamps and placement status.
  @_s.JsonKey(name: 'GameSessionPlacement')
  final GameSessionPlacement gameSessionPlacement;

  StartGameSessionPlacementOutput({
    this.gameSessionPlacement,
  });
  factory StartGameSessionPlacementOutput.fromJson(Map<String, dynamic> json) =>
      _$StartGameSessionPlacementOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartMatchBackfillOutput {
  /// Ticket representing the backfill matchmaking request. This object includes
  /// the information in the request, ticket status, and match results as
  /// generated during the matchmaking process.
  @_s.JsonKey(name: 'MatchmakingTicket')
  final MatchmakingTicket matchmakingTicket;

  StartMatchBackfillOutput({
    this.matchmakingTicket,
  });
  factory StartMatchBackfillOutput.fromJson(Map<String, dynamic> json) =>
      _$StartMatchBackfillOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartMatchmakingOutput {
  /// Ticket representing the matchmaking request. This object include the
  /// information included in the request, ticket status, and match results as
  /// generated during the matchmaking process.
  @_s.JsonKey(name: 'MatchmakingTicket')
  final MatchmakingTicket matchmakingTicket;

  StartMatchmakingOutput({
    this.matchmakingTicket,
  });
  factory StartMatchmakingOutput.fromJson(Map<String, dynamic> json) =>
      _$StartMatchmakingOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopFleetActionsOutput {
  StopFleetActionsOutput();
  factory StopFleetActionsOutput.fromJson(Map<String, dynamic> json) =>
      _$StopFleetActionsOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopGameSessionPlacementOutput {
  /// Object that describes the canceled game session placement, with
  /// <code>CANCELLED</code> status and an end time stamp.
  @_s.JsonKey(name: 'GameSessionPlacement')
  final GameSessionPlacement gameSessionPlacement;

  StopGameSessionPlacementOutput({
    this.gameSessionPlacement,
  });
  factory StopGameSessionPlacementOutput.fromJson(Map<String, dynamic> json) =>
      _$StopGameSessionPlacementOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopMatchmakingOutput {
  StopMatchmakingOutput();
  factory StopMatchmakingOutput.fromJson(Map<String, dynamic> json) =>
      _$StopMatchmakingOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SuspendGameServerGroupOutput {
  /// An object that describes the game server group resource, with the
  /// <code>SuspendedActions</code> property updated to reflect the suspended
  /// activity.
  @_s.JsonKey(name: 'GameServerGroup')
  final GameServerGroup gameServerGroup;

  SuspendGameServerGroupOutput({
    this.gameServerGroup,
  });
  factory SuspendGameServerGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$SuspendGameServerGroupOutputFromJson(json);
}

/// A label that can be assigned to a GameLift resource.
///
/// <b>Learn more</b>
///
/// <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
/// AWS Resources</a> in the <i>AWS General Reference</i>
///
/// <a
/// href="http://aws.amazon.com/answers/account-management/aws-tagging-strategies/">
/// AWS Tagging Strategies</a>
///
/// <b>Related operations</b>
///
/// <ul>
/// <li>
/// <a>TagResource</a>
/// </li>
/// <li>
/// <a>UntagResource</a>
/// </li>
/// <li>
/// <a>ListTagsForResource</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key for a developer-defined key:value pair for tagging an AWS resource.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for a developer-defined key:value pair for tagging an AWS
  /// resource.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Settings for a target-based scaling policy (see <a>ScalingPolicy</a>. A
/// target-based policy tracks a particular fleet metric specifies a target
/// value for the metric. As player usage changes, the policy triggers Amazon
/// GameLift to adjust capacity so that the metric returns to the target value.
/// The target configuration specifies settings as needed for the target based
/// policy, including the target value.
///
/// <ul>
/// <li>
/// <a>DescribeFleetCapacity</a>
/// </li>
/// <li>
/// <a>UpdateFleetCapacity</a>
/// </li>
/// <li>
/// <a>DescribeEC2InstanceLimits</a>
/// </li>
/// <li>
/// Manage scaling policies:
///
/// <ul>
/// <li>
/// <a>PutScalingPolicy</a> (auto-scaling)
/// </li>
/// <li>
/// <a>DescribeScalingPolicies</a> (auto-scaling)
/// </li>
/// <li>
/// <a>DeleteScalingPolicy</a> (auto-scaling)
/// </li>
/// </ul> </li>
/// <li>
/// Manage fleet actions:
///
/// <ul>
/// <li>
/// <a>StartFleetActions</a>
/// </li>
/// <li>
/// <a>StopFleetActions</a>
/// </li>
/// </ul> </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TargetConfiguration {
  /// Desired value to use with a target-based scaling policy. The value must be
  /// relevant for whatever metric the scaling policy is using. For example, in a
  /// policy using the metric PercentAvailableGameSessions, the target value
  /// should be the preferred size of the fleet's buffer (the percent of capacity
  /// that should be idle and ready for new game sessions).
  @_s.JsonKey(name: 'TargetValue')
  final double targetValue;

  TargetConfiguration({
    @_s.required this.targetValue,
  });
  factory TargetConfiguration.fromJson(Map<String, dynamic> json) =>
      _$TargetConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$TargetConfigurationToJson(this);
}

/// <b>This data type is used with the Amazon GameLift FleetIQ and game server
/// groups.</b>
///
/// Settings for a target-based scaling policy as part of a
/// <a>GameServerGroupAutoScalingPolicy</a>. These settings are used to create a
/// target-based policy that tracks the GameLift FleetIQ metric
/// <code>"PercentUtilizedGameServers"</code> and specifies a target value for
/// the metric. As player usage changes, the policy triggers to adjust the game
/// server group capacity so that the metric returns to the target value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TargetTrackingConfiguration {
  /// Desired value to use with a game server group target-based scaling policy.
  @_s.JsonKey(name: 'TargetValue')
  final double targetValue;

  TargetTrackingConfiguration({
    @_s.required this.targetValue,
  });
  Map<String, dynamic> toJson() => _$TargetTrackingConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAliasOutput {
  /// The updated alias resource.
  @_s.JsonKey(name: 'Alias')
  final Alias alias;

  UpdateAliasOutput({
    this.alias,
  });
  factory UpdateAliasOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateAliasOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBuildOutput {
  /// The updated build resource.
  @_s.JsonKey(name: 'Build')
  final Build build;

  UpdateBuildOutput({
    this.build,
  });
  factory UpdateBuildOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateBuildOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFleetAttributesOutput {
  /// A unique identifier for a fleet that was updated. Use either the fleet ID or
  /// ARN value.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  UpdateFleetAttributesOutput({
    this.fleetId,
  });
  factory UpdateFleetAttributesOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateFleetAttributesOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFleetCapacityOutput {
  /// A unique identifier for a fleet that was updated.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  UpdateFleetCapacityOutput({
    this.fleetId,
  });
  factory UpdateFleetCapacityOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateFleetCapacityOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFleetPortSettingsOutput {
  /// A unique identifier for a fleet that was updated.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  UpdateFleetPortSettingsOutput({
    this.fleetId,
  });
  factory UpdateFleetPortSettingsOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateFleetPortSettingsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGameServerGroupOutput {
  /// An object that describes the game server group resource with updated
  /// properties.
  @_s.JsonKey(name: 'GameServerGroup')
  final GameServerGroup gameServerGroup;

  UpdateGameServerGroupOutput({
    this.gameServerGroup,
  });
  factory UpdateGameServerGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGameServerGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGameServerOutput {
  /// Object that describes the newly updated game server.
  @_s.JsonKey(name: 'GameServer')
  final GameServer gameServer;

  UpdateGameServerOutput({
    this.gameServer,
  });
  factory UpdateGameServerOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGameServerOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGameSessionOutput {
  /// The updated game session metadata.
  @_s.JsonKey(name: 'GameSession')
  final GameSession gameSession;

  UpdateGameSessionOutput({
    this.gameSession,
  });
  factory UpdateGameSessionOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGameSessionOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGameSessionQueueOutput {
  /// An object that describes the newly updated game session queue.
  @_s.JsonKey(name: 'GameSessionQueue')
  final GameSessionQueue gameSessionQueue;

  UpdateGameSessionQueueOutput({
    this.gameSessionQueue,
  });
  factory UpdateGameSessionQueueOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGameSessionQueueOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMatchmakingConfigurationOutput {
  /// The updated matchmaking configuration.
  @_s.JsonKey(name: 'Configuration')
  final MatchmakingConfiguration configuration;

  UpdateMatchmakingConfigurationOutput({
    this.configuration,
  });
  factory UpdateMatchmakingConfigurationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateMatchmakingConfigurationOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRuntimeConfigurationOutput {
  /// The runtime configuration currently in force. If the update was successful,
  /// this object matches the one in the request.
  @_s.JsonKey(name: 'RuntimeConfiguration')
  final RuntimeConfiguration runtimeConfiguration;

  UpdateRuntimeConfigurationOutput({
    this.runtimeConfiguration,
  });
  factory UpdateRuntimeConfigurationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateRuntimeConfigurationOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateScriptOutput {
  /// The newly created script record with a unique script ID. The new script's
  /// storage location reflects an Amazon S3 location: (1) If the script was
  /// uploaded from an S3 bucket under your account, the storage location reflects
  /// the information that was provided in the <i>CreateScript</i> request; (2) If
  /// the script file was uploaded from a local zip file, the storage location
  /// reflects an S3 location controls by the Amazon GameLift service.
  @_s.JsonKey(name: 'Script')
  final Script script;

  UpdateScriptOutput({
    this.script,
  });
  factory UpdateScriptOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateScriptOutputFromJson(json);
}

/// Represents the returned data in response to a request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidateMatchmakingRuleSetOutput {
  /// A response indicating whether the rule set is valid.
  @_s.JsonKey(name: 'Valid')
  final bool valid;

  ValidateMatchmakingRuleSetOutput({
    this.valid,
  });
  factory ValidateMatchmakingRuleSetOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ValidateMatchmakingRuleSetOutputFromJson(json);
}

/// Represents an authorization for a VPC peering connection between the VPC for
/// an Amazon GameLift fleet and another VPC on an account you have access to.
/// This authorization must exist and be valid for the peering connection to be
/// established. Authorizations are valid for 24 hours after they are issued.
///
/// <ul>
/// <li>
/// <a>CreateVpcPeeringAuthorization</a>
/// </li>
/// <li>
/// <a>DescribeVpcPeeringAuthorizations</a>
/// </li>
/// <li>
/// <a>DeleteVpcPeeringAuthorization</a>
/// </li>
/// <li>
/// <a>CreateVpcPeeringConnection</a>
/// </li>
/// <li>
/// <a>DescribeVpcPeeringConnections</a>
/// </li>
/// <li>
/// <a>DeleteVpcPeeringConnection</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcPeeringAuthorization {
  /// Time stamp indicating when this authorization was issued. Format is a number
  /// expressed in Unix time as milliseconds (for example "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// Time stamp indicating when this authorization expires (24 hours after
  /// issuance). Format is a number expressed in Unix time as milliseconds (for
  /// example "1469498468.057").
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationTime')
  final DateTime expirationTime;

  /// A unique identifier for the AWS account that you use to manage your Amazon
  /// GameLift fleet. You can find your Account ID in the AWS Management Console
  /// under account settings.
  @_s.JsonKey(name: 'GameLiftAwsAccountId')
  final String gameLiftAwsAccountId;

  /// <p/>
  @_s.JsonKey(name: 'PeerVpcAwsAccountId')
  final String peerVpcAwsAccountId;

  /// A unique identifier for a VPC with resources to be accessed by your Amazon
  /// GameLift fleet. The VPC must be in the same Region where your fleet is
  /// deployed. Look up a VPC ID using the <a
  /// href="https://console.aws.amazon.com/vpc/">VPC Dashboard</a> in the AWS
  /// Management Console. Learn more about VPC peering in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with Amazon GameLift Fleets</a>.
  @_s.JsonKey(name: 'PeerVpcId')
  final String peerVpcId;

  VpcPeeringAuthorization({
    this.creationTime,
    this.expirationTime,
    this.gameLiftAwsAccountId,
    this.peerVpcAwsAccountId,
    this.peerVpcId,
  });
  factory VpcPeeringAuthorization.fromJson(Map<String, dynamic> json) =>
      _$VpcPeeringAuthorizationFromJson(json);
}

/// Represents a peering connection between a VPC on one of your AWS accounts
/// and the VPC for your Amazon GameLift fleets. This record may be for an
/// active peering connection or a pending connection that has not yet been
/// established.
///
/// <ul>
/// <li>
/// <a>CreateVpcPeeringAuthorization</a>
/// </li>
/// <li>
/// <a>DescribeVpcPeeringAuthorizations</a>
/// </li>
/// <li>
/// <a>DeleteVpcPeeringAuthorization</a>
/// </li>
/// <li>
/// <a>CreateVpcPeeringConnection</a>
/// </li>
/// <li>
/// <a>DescribeVpcPeeringConnections</a>
/// </li>
/// <li>
/// <a>DeleteVpcPeeringConnection</a>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcPeeringConnection {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>)
  /// associated with the GameLift fleet resource for this connection.
  @_s.JsonKey(name: 'FleetArn')
  final String fleetArn;

  /// A unique identifier for a fleet. This ID determines the ID of the Amazon
  /// GameLift VPC for your fleet.
  @_s.JsonKey(name: 'FleetId')
  final String fleetId;

  /// A unique identifier for the VPC that contains the Amazon GameLift fleet for
  /// this connection. This VPC is managed by Amazon GameLift and does not appear
  /// in your AWS account.
  @_s.JsonKey(name: 'GameLiftVpcId')
  final String gameLiftVpcId;

  /// CIDR block of IPv4 addresses assigned to the VPC peering connection for the
  /// GameLift VPC. The peered VPC also has an IPv4 CIDR block associated with it;
  /// these blocks cannot overlap or the peering connection cannot be created.
  @_s.JsonKey(name: 'IpV4CidrBlock')
  final String ipV4CidrBlock;

  /// A unique identifier for a VPC with resources to be accessed by your Amazon
  /// GameLift fleet. The VPC must be in the same Region where your fleet is
  /// deployed. Look up a VPC ID using the <a
  /// href="https://console.aws.amazon.com/vpc/">VPC Dashboard</a> in the AWS
  /// Management Console. Learn more about VPC peering in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with Amazon GameLift Fleets</a>.
  @_s.JsonKey(name: 'PeerVpcId')
  final String peerVpcId;

  /// The status information about the connection. Status indicates if a
  /// connection is pending, successful, or failed.
  @_s.JsonKey(name: 'Status')
  final VpcPeeringConnectionStatus status;

  /// A unique identifier that is automatically assigned to the connection record.
  /// This ID is referenced in VPC peering connection events, and is used when
  /// deleting a connection with <a>DeleteVpcPeeringConnection</a>.
  @_s.JsonKey(name: 'VpcPeeringConnectionId')
  final String vpcPeeringConnectionId;

  VpcPeeringConnection({
    this.fleetArn,
    this.fleetId,
    this.gameLiftVpcId,
    this.ipV4CidrBlock,
    this.peerVpcId,
    this.status,
    this.vpcPeeringConnectionId,
  });
  factory VpcPeeringConnection.fromJson(Map<String, dynamic> json) =>
      _$VpcPeeringConnectionFromJson(json);
}

/// Represents status information for a VPC peering connection. Status is
/// associated with a <a>VpcPeeringConnection</a> object. Status codes and
/// messages are provided from EC2 (see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_VpcPeeringConnectionStateReason.html">VpcPeeringConnectionStateReason</a>).
/// Connection status information is also communicated as a fleet <a>Event</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcPeeringConnectionStatus {
  /// Code indicating the status of a VPC peering connection.
  @_s.JsonKey(name: 'Code')
  final String code;

  /// Additional messaging associated with the connection status.
  @_s.JsonKey(name: 'Message')
  final String message;

  VpcPeeringConnectionStatus({
    this.code,
    this.message,
  });
  factory VpcPeeringConnectionStatus.fromJson(Map<String, dynamic> json) =>
      _$VpcPeeringConnectionStatusFromJson(json);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class FleetCapacityExceededException extends _s.GenericAwsException {
  FleetCapacityExceededException({String type, String message})
      : super(
            type: type,
            code: 'FleetCapacityExceededException',
            message: message);
}

class GameSessionFullException extends _s.GenericAwsException {
  GameSessionFullException({String type, String message})
      : super(type: type, code: 'GameSessionFullException', message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String type, String message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidFleetStatusException extends _s.GenericAwsException {
  InvalidFleetStatusException({String type, String message})
      : super(
            type: type, code: 'InvalidFleetStatusException', message: message);
}

class InvalidGameSessionStatusException extends _s.GenericAwsException {
  InvalidGameSessionStatusException({String type, String message})
      : super(
            type: type,
            code: 'InvalidGameSessionStatusException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class OutOfCapacityException extends _s.GenericAwsException {
  OutOfCapacityException({String type, String message})
      : super(type: type, code: 'OutOfCapacityException', message: message);
}

class TaggingFailedException extends _s.GenericAwsException {
  TaggingFailedException({String type, String message})
      : super(type: type, code: 'TaggingFailedException', message: message);
}

class TerminalRoutingStrategyException extends _s.GenericAwsException {
  TerminalRoutingStrategyException({String type, String message})
      : super(
            type: type,
            code: 'TerminalRoutingStrategyException',
            message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

class UnsupportedRegionException extends _s.GenericAwsException {
  UnsupportedRegionException({String type, String message})
      : super(type: type, code: 'UnsupportedRegionException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'FleetCapacityExceededException': (type, message) =>
      FleetCapacityExceededException(type: type, message: message),
  'GameSessionFullException': (type, message) =>
      GameSessionFullException(type: type, message: message),
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidFleetStatusException': (type, message) =>
      InvalidFleetStatusException(type: type, message: message),
  'InvalidGameSessionStatusException': (type, message) =>
      InvalidGameSessionStatusException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'OutOfCapacityException': (type, message) =>
      OutOfCapacityException(type: type, message: message),
  'TaggingFailedException': (type, message) =>
      TaggingFailedException(type: type, message: message),
  'TerminalRoutingStrategyException': (type, message) =>
      TerminalRoutingStrategyException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'UnsupportedRegionException': (type, message) =>
      UnsupportedRegionException(type: type, message: message),
};
