// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// GameLift provides solutions for hosting session-based multiplayer game
/// servers in the cloud, including tools for deploying, operating, and scaling
/// game servers. Built on AWS global computing infrastructure, GameLift helps
/// you deliver high-performance, high-reliability, low-cost game servers while
/// dynamically scaling your resource usage to meet player demand.
class GameLift {
  final _s.JsonProtocol _protocol;
  GameLift({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
  /// Add FlexMatch to a game client</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html">
  /// FlexMatch events</a> (reference)
  ///
  /// <b>Related actions</b>
  ///
  /// <a>StartMatchmaking</a> | <a>DescribeMatchmaking</a> |
  /// <a>StopMatchmaking</a> | <a>AcceptMatch</a> | <a>StartMatchBackfill</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required AcceptanceType acceptanceType,
    required List<String> playerIds,
    required String ticketId,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.AcceptMatch'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceptanceType': acceptanceType.toValue(),
        'PlayerIds': playerIds,
        'TicketId': ticketId,
      },
    );
  }

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>RegisterGameServer</a> | <a>ListGameServers</a> |
  /// <a>ClaimGameServer</a> | <a>DescribeGameServer</a> |
  /// <a>UpdateGameServer</a> | <a>DeregisterGameServer</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
  /// running. Use either the <a>GameServerGroup</a> name or ARN value. If you
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
    required String gameServerGroupName,
    String? gameServerData,
    String? gameServerId,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'gameServerData',
      gameServerData,
      1,
      1024,
    );
    _s.validateStringLength(
      'gameServerId',
      gameServerId,
      3,
      128,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateAlias</a> | <a>ListAliases</a> | <a>DescribeAlias</a> |
  /// <a>UpdateAlias</a> | <a>DeleteAlias</a> | <a>ResolveAlias</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required String name,
    required RoutingStrategy routingStrategy,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
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
  /// To create a new game build with build files that are in an Amazon S3
  /// location under an AWS account that you control. To use this option, you
  /// must first give Amazon GameLift access to the Amazon S3 bucket. With
  /// permissions in place, call <code>CreateBuild</code> and specify a build
  /// name, operating system, and the Amazon S3 storage location of your game
  /// build.
  /// </li>
  /// <li>
  /// To directly upload your build files to a GameLift Amazon S3 location. To
  /// use this option, first call <code>CreateBuild</code> and specify a build
  /// name and operating system. This operation creates a new build resource and
  /// also returns an Amazon S3 location with temporary access credentials. Use
  /// the credentials to manually upload your build files to the specified
  /// Amazon S3 location. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UploadingObjects.html">Uploading
  /// Objects</a> in the <i>Amazon S3 Developer Guide</i>. Build files can be
  /// uploaded to the GameLift Amazon S3 location once only; that can't be
  /// updated.
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateBuild</a> | <a>ListBuilds</a> | <a>DescribeBuild</a> |
  /// <a>UpdateBuild</a> | <a>DeleteBuild</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// Information indicating where your game build files are stored. Use this
  /// parameter only when creating a build with files stored in an Amazon S3
  /// bucket that you own. The storage location must specify an Amazon S3 bucket
  /// name and key. The location must also specify a role ARN that you set up to
  /// allow Amazon GameLift to access your Amazon S3 bucket. The S3 bucket and
  /// your new build must be in the same Region.
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
    String? name,
    OperatingSystem? operatingSystem,
    S3Location? storageLocation,
    List<Tag>? tags,
    String? version,
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

  /// Creates a fleet of Amazon Elastic Compute Cloud (Amazon EC2) instances to
  /// host your custom game server or Realtime Servers. Use this operation to
  /// configure the computing resources for your fleet and provide instructions
  /// for running game servers on each instance.
  ///
  /// Most GameLift fleets can deploy instances to multiple locations, including
  /// the home Region (where the fleet is created) and an optional set of remote
  /// locations. Fleets that are created in the following AWS Regions support
  /// multiple locations: us-east-1 (N. Virginia), us-west-2 (Oregon),
  /// eu-central-1 (Frankfurt), eu-west-1 (Ireland), ap-southeast-2 (Sydney),
  /// ap-northeast-1 (Tokyo), and ap-northeast-2 (Seoul). Fleets that are
  /// created in other GameLift Regions can deploy instances in the fleet's home
  /// Region only. All fleet instances use the same configuration regardless of
  /// location; however, you can adjust capacity settings and turn auto-scaling
  /// on/off for each location.
  ///
  /// To create a fleet, choose the hardware for your instances, specify a game
  /// server build or Realtime script to deploy, and provide a runtime
  /// configuration to direct GameLift how to start and run game servers on each
  /// instance in the fleet. Set permissions for inbound traffic to your game
  /// servers, and enable optional features as needed. When creating a
  /// multi-location fleet, provide a list of additional remote locations.
  ///
  /// If successful, this operation creates a new Fleet resource and places it
  /// in <code>NEW</code> status, which prompts GameLift to initiate the <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creation-workflow.html">fleet
  /// creation workflow</a>. You can track fleet creation by checking fleet
  /// status using <a>DescribeFleetAttributes</a> and
  /// <a>DescribeFleetLocationAttributes</a>/, or by monitoring fleet creation
  /// events using <a>DescribeFleetEvents</a>. As soon as the fleet status
  /// changes to <code>ACTIVE</code>, you can enable automatic scaling for the
  /// fleet with <a>PutScalingPolicy</a> and set capacity for the home Region
  /// with <a>UpdateFleetCapacity</a>. When the status of each remote location
  /// reaches <code>ACTIVE</code>, you can set capacity by location using
  /// <a>UpdateFleetCapacity</a>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up fleets</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html#fleets-creating-debug-creation">Debug
  /// fleet creation issues</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Multi-location
  /// fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleet</a> | <a>UpdateFleetCapacity</a> | <a>PutScalingPolicy</a>
  /// | <a>DescribeEC2InstanceLimits</a> | <a>DescribeFleetAttributes</a> |
  /// <a>DescribeFleetLocationAttributes</a> | <a>UpdateFleetAttributes</a> |
  /// <a>StopFleetActions</a> | <a>DeleteFleet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// The GameLift-supported EC2 instance type to use for all fleet instances.
  /// Instance type determines the computing resources that will be used to host
  /// your game servers, including CPU, memory, storage, and networking
  /// capacity. See <a href="http://aws.amazon.com/ec2/instance-types/">Amazon
  /// EC2 Instance Types</a> for detailed descriptions of EC2 instance types.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a fleet. Fleet names do not
  /// need to be unique.
  ///
  /// Parameter [buildId] :
  /// The unique identifier for a custom game server build to be deployed on
  /// fleet instances. You can use either the build ID or ARN. The build must be
  /// uploaded to GameLift and in <code>READY</code> status. This fleet property
  /// cannot be changed later.
  ///
  /// Parameter [certificateConfiguration] :
  /// Prompts GameLift to generate a TLS/SSL certificate for the fleet. TLS
  /// certificates are used for encrypting traffic between game clients and the
  /// game servers that are running on GameLift. By default, the
  /// <code>CertificateConfiguration</code> is set to <code>DISABLED</code>.
  /// Learn more at <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-howitworks.html#gamelift-howitworks-security">Securing
  /// Client/Server Communication</a>. This property cannot be changed after the
  /// fleet is created.
  ///
  /// Note: This feature requires the AWS Certificate Manager (ACM) service,
  /// which is not available in all AWS regions. When working in a region that
  /// does not support this feature, a fleet creation request with certificate
  /// generation fails with a 4xx error.
  ///
  /// Parameter [description] :
  /// A human-readable description of the fleet.
  ///
  /// Parameter [eC2InboundPermissions] :
  /// The allowed IP address ranges and port settings that allow inbound traffic
  /// to access game sessions on this fleet. If the fleet is hosting a custom
  /// game build, this property must be set before players can connect to game
  /// sessions. For Realtime Servers fleets, GameLift automatically sets TCP and
  /// UDP ranges.
  ///
  /// Parameter [fleetType] :
  /// Indicates whether to use On-Demand or Spot instances for this fleet. By
  /// default, this property is set to <code>ON_DEMAND</code>. Learn more about
  /// when to use <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-ec2-instances.html#gamelift-ec2-instances-spot">
  /// On-Demand versus Spot Instances</a>. This property cannot be changed after
  /// the fleet is created.
  ///
  /// Parameter [instanceRoleArn] :
  /// A unique identifier for an AWS IAM role that manages access to your AWS
  /// services. With an instance role ARN set, any application that runs on an
  /// instance in this fleet can assume the role, including install scripts,
  /// server processes, and daemons (background processes). Create a role or
  /// look up a role's ARN by using the <a
  /// href="https://console.aws.amazon.com/iam/">IAM dashboard</a> in the AWS
  /// Management Console. Learn more about using on-box credentials for your
  /// game servers at <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-resources.html">
  /// Access external resources from a game server</a>. This property cannot be
  /// changed after the fleet is created.
  ///
  /// Parameter [locations] :
  /// A set of remote locations to deploy additional instances to and manage as
  /// part of the fleet. This parameter can only be used when creating fleets in
  /// AWS Regions that support multiple locations. You can add any
  /// GameLift-supported AWS Region as a remote location, in the form of an AWS
  /// Region code such as <code>us-west-2</code>. To create a fleet with
  /// instances in the home Region only, omit this parameter.
  ///
  /// Parameter [logPaths] :
  /// <b>This parameter is no longer used.</b> To specify where GameLift should
  /// store log files once a server process shuts down, use the GameLift server
  /// API <code>ProcessReady()</code> and specify one or more directory paths in
  /// <code>logParameters</code>. See more information in the <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api-ref.html#gamelift-sdk-server-api-ref-dataypes-process">Server
  /// API Reference</a>.
  ///
  /// Parameter [metricGroups] :
  /// The name of an AWS CloudWatch metric group to add this fleet to. A metric
  /// group is used to aggregate the metrics for multiple fleets. You can
  /// specify an existing metric group name or set a new name to create a new
  /// metric group. A fleet can be included in only one metric group at a time.
  ///
  /// Parameter [newGameSessionProtectionPolicy] :
  /// The status of termination protection for active game sessions on the
  /// fleet. By default, this property is set to <code>NoProtection</code>. You
  /// can also set game session protection for an individual game session by
  /// calling <a>UpdateGameSession</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>NoProtection</b> - Game sessions can be terminated during active
  /// gameplay as a result of a scale-down event.
  /// </li>
  /// <li>
  /// <b>FullProtection</b> - Game sessions in <code>ACTIVE</code> status cannot
  /// be terminated during a scale-down event.
  /// </li>
  /// </ul>
  ///
  /// Parameter [peerVpcAwsAccountId] :
  /// Used when peering your GameLift fleet with a VPC, the unique identifier
  /// for the AWS account that owns the VPC. You can find your account ID in the
  /// AWS Management Console under account settings.
  ///
  /// Parameter [peerVpcId] :
  /// A unique identifier for a VPC with resources to be accessed by your
  /// GameLift fleet. The VPC must be in the same Region as your fleet. To look
  /// up a VPC ID, use the <a href="https://console.aws.amazon.com/vpc/">VPC
  /// Dashboard</a> in the AWS Management Console. Learn more about VPC peering
  /// in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with GameLift Fleets</a>.
  ///
  /// Parameter [resourceCreationLimitPolicy] :
  /// A policy that limits the number of game sessions that an individual player
  /// can create on instances in this fleet within a specified span of time.
  ///
  /// Parameter [runtimeConfiguration] :
  /// Instructions for how to launch and maintain server processes on instances
  /// in the fleet. The runtime configuration defines one or more server process
  /// configurations, each identifying a build executable or Realtime script
  /// file and the number of processes of that type to run concurrently.
  /// <note>
  /// The <code>RuntimeConfiguration</code> parameter is required unless the
  /// fleet is being configured using the older parameters
  /// <code>ServerLaunchPath</code> and <code>ServerLaunchParameters</code>,
  /// which are still supported for backward compatibility.
  /// </note>
  ///
  /// Parameter [scriptId] :
  /// The unique identifier for a Realtime configuration script to be deployed
  /// on fleet instances. You can use either the script ID or ARN. Scripts must
  /// be uploaded to GameLift prior to creating the fleet. This fleet property
  /// cannot be changed later.
  ///
  /// Parameter [serverLaunchParameters] :
  /// <b>This parameter is no longer used.</b> Specify server launch parameters
  /// using the <code>RuntimeConfiguration</code> parameter. Requests that use
  /// this parameter instead continue to be valid.
  ///
  /// Parameter [serverLaunchPath] :
  /// <b>This parameter is no longer used.</b> Specify a server launch path
  /// using the <code>RuntimeConfiguration</code> parameter. Requests that use
  /// this parameter instead continue to be valid.
  ///
  /// Parameter [tags] :
  /// A list of labels to assign to the new fleet resource. Tags are
  /// developer-defined key-value pairs. Tagging AWS resources are useful for
  /// resource management, access management and cost allocation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">
  /// Tagging AWS Resources</a> in the <i>AWS General Reference</i>. Once the
  /// fleet is created, you can use <a>TagResource</a>, <a>UntagResource</a>,
  /// and <a>ListTagsForResource</a> to add, remove, and view tags. The maximum
  /// tag limit may be lower than stated. See the <i>AWS General Reference</i>
  /// for actual tagging limits.
  Future<CreateFleetOutput> createFleet({
    required EC2InstanceType eC2InstanceType,
    required String name,
    String? buildId,
    CertificateConfiguration? certificateConfiguration,
    String? description,
    List<IpPermission>? eC2InboundPermissions,
    FleetType? fleetType,
    String? instanceRoleArn,
    List<LocationConfiguration>? locations,
    List<String>? logPaths,
    List<String>? metricGroups,
    ProtectionPolicy? newGameSessionProtectionPolicy,
    String? peerVpcAwsAccountId,
    String? peerVpcId,
    ResourceCreationLimitPolicy? resourceCreationLimitPolicy,
    RuntimeConfiguration? runtimeConfiguration,
    String? scriptId,
    String? serverLaunchParameters,
    String? serverLaunchPath,
    List<Tag>? tags,
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
        'EC2InstanceType': eC2InstanceType.toValue(),
        'Name': name,
        if (buildId != null) 'BuildId': buildId,
        if (certificateConfiguration != null)
          'CertificateConfiguration': certificateConfiguration,
        if (description != null) 'Description': description,
        if (eC2InboundPermissions != null)
          'EC2InboundPermissions': eC2InboundPermissions,
        if (fleetType != null) 'FleetType': fleetType.toValue(),
        if (instanceRoleArn != null) 'InstanceRoleArn': instanceRoleArn,
        if (locations != null) 'Locations': locations,
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

  /// Adds remote locations to a fleet and begins populating the new locations
  /// with EC2 instances. The new instances conform to the fleet's instance
  /// type, auto-scaling, and other configuration settings.
  /// <note>
  /// This operation cannot be used with fleets that don't support remote
  /// locations. Fleets can have multiple locations only if they reside in AWS
  /// Regions that support this feature (see <a>CreateFleet</a> for the complete
  /// list) and were created after the feature was released in March 2021.
  /// </note>
  /// To add fleet locations, specify the fleet to be updated and provide a list
  /// of one or more locations.
  ///
  /// If successful, this operation returns the list of added locations with
  /// their status set to <code>NEW</code>. GameLift initiates the process of
  /// starting an instance in each added location. You can track the status of
  /// each new location by monitoring location creation events using
  /// <a>DescribeFleetEvents</a>. Alternatively, you can poll location status by
  /// calling <a>DescribeFleetLocationAttributes</a>. After a location status
  /// becomes <code>ACTIVE</code>, you can adjust the location's capacity as
  /// needed with <a>UpdateFleetCapacity</a>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up fleets</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Multi-location
  /// fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleetLocations</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetLocationCapacity</a> |
  /// <a>DescribeFleetLocationUtilization</a> | <a>DescribeFleetAttributes</a> |
  /// <a>DescribeFleetCapacity</a> | <a>DescribeFleetUtilization</a> |
  /// <a>UpdateFleetCapacity</a> | <a>StopFleetActions</a> |
  /// <a>DeleteFleetLocations</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InvalidFleetStatusException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to add locations to. You can use either
  /// the fleet ID or ARN value.
  ///
  /// Parameter [locations] :
  /// A list of locations to deploy additional instances to and manage as part
  /// of the fleet. You can add any GameLift-supported AWS Region as a remote
  /// location, in the form of an AWS Region code such as
  /// <code>us-west-2</code>.
  Future<CreateFleetLocationsOutput> createFleetLocations({
    required String fleetId,
    required List<LocationConfiguration> locations,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    ArgumentError.checkNotNull(locations, 'locations');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.CreateFleetLocations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        'Locations': locations,
      },
    );

    return CreateFleetLocationsOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/gsg-iam-permissions-roles.html">Create
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameServerGroup</a> | <a>ListGameServerGroups</a> |
  /// <a>DescribeGameServerGroup</a> | <a>UpdateGameServerGroup</a> |
  /// <a>DeleteGameServerGroup</a> | <a>ResumeGameServerGroup</a> |
  /// <a>SuspendGameServerGroup</a> | <a>DescribeGameServerInstances</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
  /// <note>
  /// If you specify network interfaces in your launch template, you must
  /// explicitly set the property <code>AssociatePublicIpAddress</code> to
  /// "true". If no network interface is specified in the launch template,
  /// GameLift FleetIQ uses your account's default VPC.
  /// </note>
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
    required String gameServerGroupName,
    required List<InstanceDefinition> instanceDefinitions,
    required LaunchTemplateSpecification launchTemplate,
    required int maxSize,
    required int minSize,
    required String roleArn,
    GameServerGroupAutoScalingPolicy? autoScalingPolicy,
    BalancingStrategy? balancingStrategy,
    GameServerProtectionPolicy? gameServerProtectionPolicy,
    List<Tag>? tags,
    List<String>? vpcSubnets,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      128,
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

  /// Creates a multiplayer game session for players in a specific fleet
  /// location. This operation prompts an available server process to start a
  /// game session and retrieves connection information for the new game
  /// session. As an alternative, consider using the GameLift game session
  /// placement feature with
  ///
  /// with <a>StartGameSessionPlacement</a>, which uses FleetIQ algorithms and
  /// queues to optimize the placement process.
  ///
  /// When creating a game session, you specify exactly where you want to place
  /// it and provide a set of game session configuration settings. The fleet
  /// must be in <code>ACTIVE</code> status before a game session can be created
  /// in it.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To create a game session on an instance in a fleet's home Region, provide
  /// a fleet or alias ID along with your game session configuration.
  /// </li>
  /// <li>
  /// To create a game session on an instance in a fleet's remote location,
  /// provide a fleet or alias ID and a location name, along with your game
  /// session configuration.
  /// </li>
  /// </ul>
  /// If successful, a workflow is initiated to start a new game session. A
  /// <code>GameSession</code> object is returned containing the game session
  /// configuration and status. When the status is <code>ACTIVE</code>, game
  /// session connection information is provided and player sessions can be
  /// created for the game session. By default, newly created game sessions are
  /// open to new players. You can restrict new player access by using
  /// <a>UpdateGameSession</a> to change the game session's player session
  /// creation policy.
  ///
  /// Game session logs are retained for all active game sessions for 14 days.
  /// To access the logs, call <a>GetGameSessionLogUrl</a> to download the log
  /// files.
  ///
  /// <i>Available in GameLift Local.</i>
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a game session</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSession</a> | <a>DescribeGameSessions</a> |
  /// <a>DescribeGameSessionDetails</a> | <a>SearchGameSessions</a> |
  /// <a>UpdateGameSession</a> | <a>GetGameSessionLogUrl</a> |
  /// <a>StartGameSessionPlacement</a> | <a>DescribeGameSessionPlacement</a> |
  /// <a>StopGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A unique identifier for the alias associated with the fleet to create a
  /// game session in. You can use either the alias ID or ARN value. Each
  /// request must reference either a fleet ID or alias ID, but not both.
  ///
  /// Parameter [creatorId] :
  /// A unique identifier for a player or entity creating the game session. This
  /// parameter is required when requesting a new game session on a fleet with a
  /// resource creation limit policy. This type of policy limits the number of
  /// concurrent active game sessions that one player can create within a
  /// certain time span. GameLift uses the CreatorId to evaluate the new request
  /// against the policy.
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to create a game session in. You can use
  /// either the fleet ID or ARN value. Each request must reference either a
  /// fleet ID or alias ID, but not both.
  ///
  /// Parameter [gameProperties] :
  /// A set of custom properties for a game session, formatted as key:value
  /// pairs. These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session.
  ///
  /// Parameter [gameSessionData] :
  /// A set of custom game session properties, formatted as a single string
  /// value. This data is passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session.
  ///
  /// Parameter [gameSessionId] :
  /// <i>This parameter is no longer preferred. Please use
  /// <code>IdempotencyToken</code> instead.</i> Custom string that uniquely
  /// identifies a request for a new game session. Maximum token length is 48
  /// characters. If provided, this string is included in the new game session's
  /// ID.
  ///
  /// Parameter [idempotencyToken] :
  /// Custom string that uniquely identifies the new game session request. This
  /// is useful for ensuring that game session requests with the same
  /// idempotency token are processed only once. Subsequent requests with the
  /// same string return the original <code>GameSession</code> object, with an
  /// updated status. Maximum token length is 48 characters. If provided, this
  /// string is included in the new game session's ID. A game session ARN has
  /// the following format:
  /// <code>arn:aws:gamelift:&lt;region&gt;::gamesession/&lt;fleet
  /// ID&gt;/&lt;custom ID string or idempotency token&gt;</code>. Idempotency
  /// tokens remain in use for 30 days after a game session has ended; game
  /// session objects are retained for this time period and then deleted.
  ///
  /// Parameter [location] :
  /// A fleet's remote location to place the new game session in. If this
  /// parameter is not set, the new game session is placed in the fleet's home
  /// Region. Specify a remote location with an AWS Region code such as
  /// <code>us-west-2</code>.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a game session. Session names
  /// do not need to be unique.
  Future<CreateGameSessionOutput> createGameSession({
    required int maximumPlayerSessionCount,
    String? aliasId,
    String? creatorId,
    String? fleetId,
    List<GameProperty>? gameProperties,
    String? gameSessionData,
    String? gameSessionId,
    String? idempotencyToken,
    String? location,
    String? name,
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
    _s.validateStringLength(
      'creatorId',
      creatorId,
      1,
      1024,
    );
    _s.validateStringLength(
      'gameSessionData',
      gameSessionData,
      1,
      262144,
    );
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      48,
    );
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      48,
    );
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
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
        if (location != null) 'Location': location,
        if (name != null) 'Name': name,
      },
    );

    return CreateGameSessionOutput.fromJson(jsonResponse.body);
  }

  /// Creates a placement queue that processes requests for new game sessions. A
  /// queue uses FleetIQ algorithms to determine the best placement locations
  /// and find an available game server there, then prompts the game server
  /// process to start a new game session.
  ///
  /// A game session queue is configured with a set of destinations (GameLift
  /// fleets or aliases), which determine the locations where the queue can
  /// place new game sessions. These destinations can span multiple fleet types
  /// (Spot and On-Demand), instance types, and AWS Regions. If the queue
  /// includes multi-location fleets, the queue is able to place game sessions
  /// in all of a fleet's remote locations. You can opt to filter out individual
  /// locations if needed.
  ///
  /// The queue configuration also determines how FleetIQ selects the best
  /// available placement for a new game session. Before searching for an
  /// available game server, FleetIQ first prioritizes the queue's destinations
  /// and locations, with the best placement locations on top. You can set up
  /// the queue to use the FleetIQ default prioritization or provide an
  /// alternate set of priorities.
  ///
  /// To create a new queue, provide a name, timeout value, and a list of
  /// destinations. Optionally, specify a sort configuration and/or a filter,
  /// and define a set of latency cap policies. You can also include the ARN for
  /// an Amazon Simple Notification Service (SNS) topic to receive notifications
  /// of game session placement activity. Notifications using SNS or CloudWatch
  /// events is the preferred way to track placement activity.
  ///
  /// If successful, a new <code>GameSessionQueue</code> object is returned with
  /// an assigned queue ARN. New game session requests, which are submitted to
  /// the queue with <a>StartGameSessionPlacement</a> or
  /// <a>StartMatchmaking</a>, reference a queue's name or ARN.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-design.html">
  /// Design a game session queue</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-creating.html">
  /// Create a game session queue</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSessionQueue</a> | <a>DescribeGameSessionQueues</a> |
  /// <a>UpdateGameSessionQueue</a> | <a>DeleteGameSessionQueue</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with game session queue. Queue
  /// names must be unique within each Region.
  ///
  /// Parameter [customEventData] :
  /// Information to be added to all events that are related to this game
  /// session queue.
  ///
  /// Parameter [destinations] :
  /// A list of fleets and/or fleet aliases that can be used to fulfill game
  /// session placement requests in the queue. Destinations are identified by
  /// either a fleet ARN or a fleet alias ARN, and are listed in order of
  /// placement preference.
  ///
  /// Parameter [filterConfiguration] :
  /// A list of locations where a queue is allowed to place new game sessions.
  /// Locations are specified in the form of AWS Region codes, such as
  /// <code>us-west-2</code>. If this parameter is not set, game sessions can be
  /// placed in any queue location.
  ///
  /// Parameter [notificationTarget] :
  /// An SNS topic ARN that is set up to receive game session placement
  /// notifications. See <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queue-notification.html">
  /// Setting up notifications for game session placement</a>.
  ///
  /// Parameter [playerLatencyPolicies] :
  /// A set of policies that act as a sliding cap on player latency. FleetIQ
  /// works to deliver low latency for most players in a game session. These
  /// policies ensure that no individual player can be placed into a game with
  /// unreasonably high latency. Use multiple policies to gradually relax
  /// latency requirements a step at a time. Multiple policies are applied based
  /// on their maximum allowed latency, starting with the lowest value.
  ///
  /// Parameter [priorityConfiguration] :
  /// Custom settings to use when prioritizing destinations and locations for
  /// game session placements. This configuration replaces the FleetIQ default
  /// prioritization process. Priority types that are not explicitly named will
  /// be automatically applied at the end of the prioritization process.
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
    required String name,
    String? customEventData,
    List<GameSessionQueueDestination>? destinations,
    FilterConfiguration? filterConfiguration,
    String? notificationTarget,
    List<PlayerLatencyPolicy>? playerLatencyPolicies,
    PriorityConfiguration? priorityConfiguration,
    List<Tag>? tags,
    int? timeoutInSeconds,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'customEventData',
      customEventData,
      0,
      256,
    );
    _s.validateStringLength(
      'notificationTarget',
      notificationTarget,
      0,
      300,
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
        if (customEventData != null) 'CustomEventData': customEventData,
        if (destinations != null) 'Destinations': destinations,
        if (filterConfiguration != null)
          'FilterConfiguration': filterConfiguration,
        if (notificationTarget != null)
          'NotificationTarget': notificationTarget,
        if (playerLatencyPolicies != null)
          'PlayerLatencyPolicies': playerLatencyPolicies,
        if (priorityConfiguration != null)
          'PriorityConfiguration': priorityConfiguration,
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
  /// topic to receive matchmaking notifications. Provide the topic ARN in the
  /// matchmaking configuration. An alternative method, continuously polling
  /// ticket status with <a>DescribeMatchmaking</a>, is only suitable for games
  /// in development with low matchmaking usage.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-configuration.html">
  /// Design a FlexMatch matchmaker</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html">
  /// Set up FlexMatch event notification</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateMatchmakingConfiguration</a> |
  /// <a>DescribeMatchmakingConfigurations</a> |
  /// <a>UpdateMatchmakingConfiguration</a> |
  /// <a>DeleteMatchmakingConfiguration</a> | <a>CreateMatchmakingRuleSet</a> |
  /// <a>DescribeMatchmakingRuleSets</a> | <a>ValidateMatchmakingRuleSet</a> |
  /// <a>DeleteMatchmakingRuleSet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A unique identifier for the matchmaking configuration. This name is used
  /// to identify the configuration associated with a matchmaking request or
  /// ticket.
  ///
  /// Parameter [requestTimeoutSeconds] :
  /// The maximum duration, in seconds, that a matchmaking ticket can remain in
  /// process before timing out. Requests that fail due to timing out can be
  /// resubmitted as needed.
  ///
  /// Parameter [ruleSetName] :
  /// A unique identifier for the matchmaking rule set to use with this
  /// configuration. You can use either the rule set name or ARN value. A
  /// matchmaking configuration can only use rule sets that are defined in the
  /// same Region.
  ///
  /// Parameter [acceptanceTimeoutSeconds] :
  /// The length of time (in seconds) to wait for players to accept a proposed
  /// match, if acceptance is required.
  ///
  /// Parameter [additionalPlayerCount] :
  /// The number of player slots in a match to keep open for future players. For
  /// example, if the configuration's rule set specifies a match for a single
  /// 12-person team, and the additional player count is set to 2, only 10
  /// players are selected for the match. This parameter is not used if
  /// <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
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
  /// A set of custom properties for a game session, formatted as key:value
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
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift game session queue resource and uniquely
  /// identifies it. ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::gamesessionqueue/&lt;queue
  /// name&gt;</code>. Queues can be located in any Region. Queues are used to
  /// start new GameLift-hosted game sessions for matches that are created with
  /// this matchmaking configuration. If <code>FlexMatchMode</code> is set to
  /// <code>STANDALONE</code>, do not set this parameter.
  ///
  /// Parameter [notificationTarget] :
  /// An SNS topic ARN that is set up to receive matchmaking notifications. See
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html">
  /// Setting up notifications for matchmaking</a> for more information.
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
    required bool acceptanceRequired,
    required String name,
    required int requestTimeoutSeconds,
    required String ruleSetName,
    int? acceptanceTimeoutSeconds,
    int? additionalPlayerCount,
    BackfillMode? backfillMode,
    String? customEventData,
    String? description,
    FlexMatchMode? flexMatchMode,
    List<GameProperty>? gameProperties,
    String? gameSessionData,
    List<String>? gameSessionQueueArns,
    String? notificationTarget,
    List<Tag>? tags,
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
  /// a rule set</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-configuration.html">Design
  /// a matchmaker</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-intro.html">Matchmaking
  /// with FlexMatch</a>
  /// </li>
  /// </ul>
  /// <b>Related actions</b>
  ///
  /// <a>CreateMatchmakingConfiguration</a> |
  /// <a>DescribeMatchmakingConfigurations</a> |
  /// <a>UpdateMatchmakingConfiguration</a> |
  /// <a>DeleteMatchmakingConfiguration</a> | <a>CreateMatchmakingRuleSet</a> |
  /// <a>DescribeMatchmakingRuleSets</a> | <a>ValidateMatchmakingRuleSet</a> |
  /// <a>DeleteMatchmakingRuleSet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [name] :
  /// A unique identifier for the matchmaking rule set. A matchmaking
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
    required String name,
    required String ruleSetBody,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
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

  /// Reserves an open player slot in a game session for a player. New player
  /// sessions can be created in any game session with an open slot that is in
  /// <code>ACTIVE</code> status and has a player creation policy of
  /// <code>ACCEPT_ALL</code>. You can add a group of players to a game session
  /// with <a>CreatePlayerSessions</a>.
  ///
  /// To create a player session, specify a game session ID, player ID, and
  /// optionally a set of player data.
  ///
  /// If successful, a slot is reserved in the game session for the player and a
  /// new <a>PlayerSession</a> object is returned with a player session ID. The
  /// player references the player session ID when sending a connection request
  /// to the game session, and the game server can use it to validate the player
  /// reservation with the GameLift service. Player sessions cannot be updated.
  ///
  /// <i>Available in Amazon GameLift Local.</i>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreatePlayerSession</a> | <a>CreatePlayerSessions</a> |
  /// <a>DescribePlayerSessions</a> | <a>StartGameSessionPlacement</a> |
  /// <a>DescribeGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// Developer-defined information related to a player. GameLift does not use
  /// this data, so it can be formatted as needed for use in the game.
  Future<CreatePlayerSessionOutput> createPlayerSession({
    required String gameSessionId,
    required String playerId,
    String? playerData,
  }) async {
    ArgumentError.checkNotNull(gameSessionId, 'gameSessionId');
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
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

  /// Reserves open slots in a game session for a group of players. New player
  /// sessions can be created in any game session with an open slot that is in
  /// <code>ACTIVE</code> status and has a player creation policy of
  /// <code>ACCEPT_ALL</code>. To add a single player to a game session, use
  /// <a>CreatePlayerSession</a>.
  ///
  /// To create player sessions, specify a game session ID and a list of player
  /// IDs. Optionally, provide a set of player data for each player ID.
  ///
  /// If successful, a slot is reserved in the game session for each player, and
  /// new <a>PlayerSession</a> objects are returned with player session IDs.
  /// Each player references their player session ID when sending a connection
  /// request to the game session, and the game server can use it to validate
  /// the player reservation with the GameLift service. Player sessions cannot
  /// be updated.
  ///
  /// <i>Available in Amazon GameLift Local.</i>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreatePlayerSession</a> | <a>CreatePlayerSessions</a> |
  /// <a>DescribePlayerSessions</a> | <a>StartGameSessionPlacement</a> |
  /// <a>DescribeGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// Any player data strings for player IDs that are not included in the
  /// <code>PlayerIds</code> parameter are ignored.
  Future<CreatePlayerSessionsOutput> createPlayerSessions({
    required String gameSessionId,
    required List<String> playerIds,
    Map<String, String>? playerDataMap,
  }) async {
    ArgumentError.checkNotNull(gameSessionId, 'gameSessionId');
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateScript</a> | <a>ListScripts</a> | <a>DescribeScript</a> |
  /// <a>UpdateScript</a> | <a>DeleteScript</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// The location of the Amazon S3 bucket where a zipped file containing your
  /// Realtime scripts is stored. The storage location must specify the Amazon
  /// S3 bucket name, the zip file name (the "key"), and a role ARN that allows
  /// Amazon GameLift to access the Amazon S3 storage location. The S3 bucket
  /// must be in the same Region where you want to create a new script. By
  /// default, Amazon GameLift uploads the latest version of the zip file; if
  /// you have S3 object versioning turned on, you can use the
  /// <code>ObjectVersion</code> parameter to specify an earlier version.
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
  /// Version information that is associated with a build or script. Version
  /// strings do not need to be unique. You can use <a>UpdateScript</a> to
  /// change this value later.
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
    String? name,
    S3Location? storageLocation,
    List<Tag>? tags,
    String? version,
    Uint8List? zipFile,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateVpcPeeringAuthorization</a> |
  /// <a>DescribeVpcPeeringAuthorizations</a> |
  /// <a>DeleteVpcPeeringAuthorization</a> | <a>CreateVpcPeeringConnection</a> |
  /// <a>DescribeVpcPeeringConnections</a> | <a>DeleteVpcPeeringConnection</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameLiftAwsAccountId] :
  /// A unique identifier for the AWS account that you use to manage your
  /// GameLift fleet. You can find your Account ID in the AWS Management Console
  /// under account settings.
  ///
  /// Parameter [peerVpcId] :
  /// A unique identifier for a VPC with resources to be accessed by your
  /// GameLift fleet. The VPC must be in the same Region as your fleet. To look
  /// up a VPC ID, use the <a href="https://console.aws.amazon.com/vpc/">VPC
  /// Dashboard</a> in the AWS Management Console. Learn more about VPC peering
  /// in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with GameLift Fleets</a>.
  Future<CreateVpcPeeringAuthorizationOutput> createVpcPeeringAuthorization({
    required String gameLiftAwsAccountId,
    required String peerVpcId,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateVpcPeeringAuthorization</a> |
  /// <a>DescribeVpcPeeringAuthorizations</a> |
  /// <a>DeleteVpcPeeringAuthorization</a> | <a>CreateVpcPeeringConnection</a> |
  /// <a>DescribeVpcPeeringConnections</a> | <a>DeleteVpcPeeringConnection</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet. You can use either the fleet ID or ARN
  /// value. This tells Amazon GameLift which GameLift VPC to peer with.
  ///
  /// Parameter [peerVpcAwsAccountId] :
  /// A unique identifier for the AWS account with the VPC that you want to peer
  /// your Amazon GameLift fleet with. You can find your Account ID in the AWS
  /// Management Console under account settings.
  ///
  /// Parameter [peerVpcId] :
  /// A unique identifier for a VPC with resources to be accessed by your
  /// GameLift fleet. The VPC must be in the same Region as your fleet. To look
  /// up a VPC ID, use the <a href="https://console.aws.amazon.com/vpc/">VPC
  /// Dashboard</a> in the AWS Management Console. Learn more about VPC peering
  /// in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with GameLift Fleets</a>.
  Future<void> createVpcPeeringConnection({
    required String fleetId,
    required String peerVpcAwsAccountId,
    required String peerVpcId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
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
    await _protocol.send(
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
  }

  /// Deletes an alias. This operation removes all record of the alias. Game
  /// clients attempting to access a server process using the deleted alias
  /// receive an error. To delete an alias, specify the alias ID to be deleted.
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateAlias</a> | <a>ListAliases</a> | <a>DescribeAlias</a> |
  /// <a>UpdateAlias</a> | <a>DeleteAlias</a> | <a>ResolveAlias</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required String aliasId,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteAlias'
    };
    await _protocol.send(
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateBuild</a> | <a>ListBuilds</a> | <a>DescribeBuild</a> |
  /// <a>UpdateBuild</a> | <a>DeleteBuild</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [TaggingFailedException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [buildId] :
  /// A unique identifier for the build to delete. You can use either the build
  /// ID or ARN value.
  Future<void> deleteBuild({
    required String buildId,
  }) async {
    ArgumentError.checkNotNull(buildId, 'buildId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteBuild'
    };
    await _protocol.send(
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

  /// Deletes all resources and information related a fleet. Any current fleet
  /// instances, including those in remote locations, are shut down. You don't
  /// need to call <code>DeleteFleetLocations</code> separately.
  /// <note>
  /// If the fleet being deleted has a VPC peering connection, you first need to
  /// get a valid authorization (good for 24 hours) by calling
  /// <a>CreateVpcPeeringAuthorization</a>. You do not need to explicitly delete
  /// the VPC peering connection--this is done as part of the delete fleet
  /// process.
  /// </note>
  /// To delete a fleet, specify the fleet ID to be terminated. During the
  /// deletion process the fleet status is changed to <code>DELETING</code>.
  /// When completed, the status switches to <code>TERMINATED</code> and the
  /// fleet event <code>FLEET_DELETED</code> is sent.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleetLocations</a> | <a>UpdateFleetAttributes</a> |
  /// <a>UpdateFleetCapacity</a> | <a>UpdateFleetPortSettings</a> |
  /// <a>UpdateRuntimeConfiguration</a> | <a>StopFleetActions</a> |
  /// <a>StartFleetActions</a> | <a>PutScalingPolicy</a> | <a>DeleteFleet</a> |
  /// <a>DeleteFleetLocations</a> | <a>DeleteScalingPolicy</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidFleetStatusException].
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to be deleted. You can use either the
  /// fleet ID or ARN value.
  Future<void> deleteFleet({
    required String fleetId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteFleet'
    };
    await _protocol.send(
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

  /// Removes locations from a multi-location fleet. When deleting a location,
  /// all game server process and all instances that are still active in the
  /// location are shut down.
  ///
  /// To delete fleet locations, identify the fleet ID and provide a list of the
  /// locations to be deleted.
  ///
  /// If successful, GameLift sets the location status to <code>DELETING</code>,
  /// and begins to shut down existing server processes and terminate instances
  /// in each location being deleted. When completed, the location status
  /// changes to <code>TERMINATED</code>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleetLocations</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetLocationCapacity</a> |
  /// <a>DescribeFleetLocationUtilization</a> | <a>DescribeFleetAttributes</a> |
  /// <a>DescribeFleetCapacity</a> | <a>DescribeFleetUtilization</a> |
  /// <a>UpdateFleetCapacity</a> | <a>StopFleetActions</a> |
  /// <a>DeleteFleetLocations</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to delete locations for. You can use
  /// either the fleet ID or ARN value.
  ///
  /// Parameter [locations] :
  /// The list of fleet locations to delete. Specify locations in the form of an
  /// AWS Region code, such as <code>us-west-2</code>.
  Future<DeleteFleetLocationsOutput> deleteFleetLocations({
    required String fleetId,
    required List<String> locations,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    ArgumentError.checkNotNull(locations, 'locations');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteFleetLocations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        'Locations': locations,
      },
    );

    return DeleteFleetLocationsOutput.fromJson(jsonResponse.body);
  }

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameServerGroup</a> | <a>ListGameServerGroups</a> |
  /// <a>DescribeGameServerGroup</a> | <a>UpdateGameServerGroup</a> |
  /// <a>DeleteGameServerGroup</a> | <a>ResumeGameServerGroup</a> |
  /// <a>SuspendGameServerGroup</a> | <a>DescribeGameServerInstances</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
    required String gameServerGroupName,
    GameServerGroupDeleteOption? deleteOption,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSessionQueue</a> | <a>DescribeGameSessionQueues</a> |
  /// <a>UpdateGameSessionQueue</a> | <a>DeleteGameSessionQueue</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteGameSessionQueue'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Permanently removes a FlexMatch matchmaking configuration. To delete,
  /// specify the configuration name. A matchmaking configuration cannot be
  /// deleted if it is being used in any active matchmaking tickets.
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateMatchmakingConfiguration</a> |
  /// <a>DescribeMatchmakingConfigurations</a> |
  /// <a>UpdateMatchmakingConfiguration</a> |
  /// <a>DeleteMatchmakingConfiguration</a> | <a>CreateMatchmakingRuleSet</a> |
  /// <a>DescribeMatchmakingRuleSets</a> | <a>ValidateMatchmakingRuleSet</a> |
  /// <a>DeleteMatchmakingRuleSet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [name] :
  /// A unique identifier for the matchmaking configuration. You can use either
  /// the configuration name or ARN value.
  Future<void> deleteMatchmakingConfiguration({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteMatchmakingConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
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
  /// a rule set</a>
  /// </li>
  /// </ul>
  /// <b>Related actions</b>
  ///
  /// <a>CreateMatchmakingConfiguration</a> |
  /// <a>DescribeMatchmakingConfigurations</a> |
  /// <a>UpdateMatchmakingConfiguration</a> |
  /// <a>DeleteMatchmakingConfiguration</a> | <a>CreateMatchmakingRuleSet</a> |
  /// <a>DescribeMatchmakingRuleSets</a> | <a>ValidateMatchmakingRuleSet</a> |
  /// <a>DeleteMatchmakingRuleSet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  /// May throw [NotFoundException].
  /// May throw [TaggingFailedException].
  ///
  /// Parameter [name] :
  /// A unique identifier for the matchmaking rule set to be deleted. (Note: The
  /// rule set name is different from the optional "name" field in the rule set
  /// body.) You can use either the rule set name or ARN value.
  Future<void> deleteMatchmakingRuleSet({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteMatchmakingRuleSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Deletes a fleet scaling policy. Once deleted, the policy is no longer in
  /// force and GameLift removes all record of it. To delete a scaling policy,
  /// specify both the scaling policy name and the fleet ID it is associated
  /// with.
  ///
  /// To temporarily suspend scaling policies, call <a>StopFleetActions</a>.
  /// This operation suspends all policies for the fleet.
  ///
  /// <b>Related actions</b>
  ///
  /// <a>DescribeFleetCapacity</a> | <a>UpdateFleetCapacity</a> |
  /// <a>DescribeEC2InstanceLimits</a> | <a>PutScalingPolicy</a> |
  /// <a>DescribeScalingPolicies</a> | <a>DeleteScalingPolicy</a> |
  /// <a>StopFleetActions</a> | <a>StartFleetActions</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to be deleted. You can use either the
  /// fleet ID or ARN value.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a fleet's scaling policy.
  /// Policy names do not need to be unique.
  Future<void> deleteScalingPolicy({
    required String fleetId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
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
    await _protocol.send(
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateScript</a> | <a>ListScripts</a> | <a>DescribeScript</a> |
  /// <a>UpdateScript</a> | <a>DeleteScript</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TaggingFailedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [scriptId] :
  /// A unique identifier for the Realtime script to delete. You can use either
  /// the script ID or ARN value.
  Future<void> deleteScript({
    required String scriptId,
  }) async {
    ArgumentError.checkNotNull(scriptId, 'scriptId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeleteScript'
    };
    await _protocol.send(
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateVpcPeeringAuthorization</a> |
  /// <a>DescribeVpcPeeringAuthorizations</a> |
  /// <a>DeleteVpcPeeringAuthorization</a> | <a>CreateVpcPeeringConnection</a> |
  /// <a>DescribeVpcPeeringConnections</a> | <a>DeleteVpcPeeringConnection</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [gameLiftAwsAccountId] :
  /// A unique identifier for the AWS account that you use to manage your
  /// GameLift fleet. You can find your Account ID in the AWS Management Console
  /// under account settings.
  ///
  /// Parameter [peerVpcId] :
  /// A unique identifier for a VPC with resources to be accessed by your
  /// GameLift fleet. The VPC must be in the same Region as your fleet. To look
  /// up a VPC ID, use the <a href="https://console.aws.amazon.com/vpc/">VPC
  /// Dashboard</a> in the AWS Management Console. Learn more about VPC peering
  /// in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with GameLift Fleets</a>.
  Future<void> deleteVpcPeeringAuthorization({
    required String gameLiftAwsAccountId,
    required String peerVpcId,
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
    await _protocol.send(
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateVpcPeeringAuthorization</a> |
  /// <a>DescribeVpcPeeringAuthorizations</a> |
  /// <a>DeleteVpcPeeringAuthorization</a> | <a>CreateVpcPeeringConnection</a> |
  /// <a>DescribeVpcPeeringConnections</a> | <a>DeleteVpcPeeringConnection</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet. This fleet specified must match the
  /// fleet referenced in the VPC peering connection record. You can use either
  /// the fleet ID or ARN value.
  ///
  /// Parameter [vpcPeeringConnectionId] :
  /// A unique identifier for a VPC peering connection. This value is included
  /// in the <a>VpcPeeringConnection</a> object, which can be retrieved by
  /// calling <a>DescribeVpcPeeringConnections</a>.
  Future<void> deleteVpcPeeringConnection({
    required String fleetId,
    required String vpcPeeringConnectionId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
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
    await _protocol.send(
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
  }

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>RegisterGameServer</a> | <a>ListGameServers</a> |
  /// <a>ClaimGameServer</a> | <a>DescribeGameServer</a> |
  /// <a>UpdateGameServer</a> | <a>DeregisterGameServer</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
    required String gameServerGroupName,
    required String gameServerId,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DeregisterGameServer'
    };
    await _protocol.send(
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateAlias</a> | <a>ListAliases</a> | <a>DescribeAlias</a> |
  /// <a>UpdateAlias</a> | <a>DeleteAlias</a> | <a>ResolveAlias</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required String aliasId,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateBuild</a> | <a>ListBuilds</a> | <a>DescribeBuild</a> |
  /// <a>UpdateBuild</a> | <a>DeleteBuild</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [buildId] :
  /// A unique identifier for the build to retrieve properties for. You can use
  /// either the build ID or ARN value.
  Future<DescribeBuildOutput> describeBuild({
    required String buildId,
  }) async {
    ArgumentError.checkNotNull(buildId, 'buildId');
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

  /// The GameLift service limits and current utilization for an AWS Region or
  /// location. Instance limits control the number of instances, per instance
  /// type, per location, that your AWS account can use. Learn more at <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a>. The information returned includes the maximum number of
  /// instances allowed and your account's current usage across all fleets. This
  /// information can affect your ability to scale your GameLift fleets. You can
  /// request a limit increase for your account by using the <b>Service
  /// limits</b> page in the GameLift console.
  ///
  /// Instance limits differ based on whether the instances are deployed in a
  /// fleet's home Region or in a remote location. For remote locations, limits
  /// also differ based on the combination of home Region and remote location.
  /// All requests must specify an AWS Region (either explicitly or as your
  /// default settings). To get the limit for a remote location, you must also
  /// specify the location. For example, the following requests all return
  /// different results:
  ///
  /// <ul>
  /// <li>
  /// Request specifies the Region <code>ap-northeast-1</code> with no location.
  /// The result is limits and usage data on all instance types that are
  /// deployed in <code>us-east-2</code>, by all of the fleets that reside in
  /// <code>ap-northeast-1</code>.
  /// </li>
  /// <li>
  /// Request specifies the Region <code>us-east-1</code> with location
  /// <code>ca-central-1</code>. The result is limits and usage data on all
  /// instance types that are deployed in <code>ca-central-1</code>, by all of
  /// the fleets that reside in <code>us-east-2</code>. These limits do not
  /// affect fleets in any other Regions that deploy instances to
  /// <code>ca-central-1</code>.
  /// </li>
  /// <li>
  /// Request specifies the Region <code>eu-west-1</code> with location
  /// <code>ca-central-1</code>. The result is limits and usage data on all
  /// instance types that are deployed in <code>ca-central-1</code>, by all of
  /// the fleets that reside in <code>eu-west-1</code>.
  /// </li>
  /// </ul>
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To get limit and usage data for all instance types that are deployed in an
  /// AWS Region by fleets that reside in the same Region: Specify the Region
  /// only. Optionally, specify a single instance type to retrieve information
  /// for.
  /// </li>
  /// <li>
  /// To get limit and usage data for all instance types that are deployed to a
  /// remote location by fleets that reside in different AWS Region: Provide
  /// both the AWS Region and the remote location. Optionally, specify a single
  /// instance type to retrieve information for.
  /// </li>
  /// </ul>
  /// If successful, an <code>EC2InstanceLimits</code> object is returned with
  /// limits and usage data for each requested instance type.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleet</a> | <a>UpdateFleetCapacity</a> | <a>PutScalingPolicy</a>
  /// | <a>DescribeEC2InstanceLimits</a> | <a>DescribeFleetAttributes</a> |
  /// <a>DescribeFleetLocationAttributes</a> | <a>UpdateFleetAttributes</a> |
  /// <a>StopFleetActions</a> | <a>DeleteFleet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [eC2InstanceType] :
  /// Name of an EC2 instance type that is supported in GameLift. A fleet
  /// instance type determines the computing resources of each instance in the
  /// fleet, including CPU, memory, storage, and networking capacity. Do not
  /// specify a value for this parameter to retrieve limits for all instance
  /// types.
  ///
  /// Parameter [location] :
  /// The name of a remote location to request instance limits for, in the form
  /// of an AWS Region code such as <code>us-west-2</code>.
  Future<DescribeEC2InstanceLimitsOutput> describeEC2InstanceLimits({
    EC2InstanceType? eC2InstanceType,
    String? location,
  }) async {
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
    );
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
        if (location != null) 'Location': location,
      },
    );

    return DescribeEC2InstanceLimitsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves core fleet-wide properties, including the computing hardware and
  /// deployment configuration for all instances in the fleet.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To get attributes for one or more specific fleets, provide a list of fleet
  /// IDs or fleet ARNs.
  /// </li>
  /// <li>
  /// To get attributes for all fleets, do not provide a fleet identifier.
  /// </li>
  /// </ul>
  /// When requesting attributes for multiple fleets, use the pagination
  /// parameters to retrieve results as a set of sequential pages.
  ///
  /// If successful, a <code>FleetAttributes</code> object is returned for each
  /// fleet requested, unless the fleet identifier is not found.
  /// <note>
  /// Some API operations limit the number of fleet IDs that allowed in one
  /// request. If a request exceeds this limit, the request fails and the error
  /// message contains the maximum allowed number.
  /// </note>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>ListFleets</a> | <a>DescribeEC2InstanceLimits</a> |
  /// <a>DescribeFleetAttributes</a> | <a>DescribeFleetCapacity</a> |
  /// <a>DescribeFleetEvents</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetPortSettings</a> | <a>DescribeFleetUtilization</a> |
  /// <a>DescribeRuntimeConfiguration</a> | <a>DescribeScalingPolicies</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetIds] :
  /// A list of unique fleet identifiers to retrieve attributes for. You can use
  /// either the fleet ID or ARN value. To retrieve attributes for all current
  /// fleets, do not include this parameter.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  Future<DescribeFleetAttributesOutput> describeFleetAttributes({
    List<String>? fleetIds,
    int? limit,
    String? nextToken,
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

  /// Retrieves the resource capacity settings for one or more fleets. The data
  /// returned includes the current fleet capacity (number of EC2 instances),
  /// and settings that can control how capacity scaling. For fleets with remote
  /// locations, this operation retrieves data for the fleet's home Region only.
  /// See <a>DescribeFleetLocationCapacity</a> to get capacity settings for a
  /// fleet's remote locations.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To get capacity data for one or more specific fleets, provide a list of
  /// fleet IDs or fleet ARNs.
  /// </li>
  /// <li>
  /// To get capacity data for all fleets, do not provide a fleet identifier.
  /// </li>
  /// </ul>
  /// When requesting multiple fleets, use the pagination parameters to retrieve
  /// results as a set of sequential pages.
  ///
  /// If successful, a <a>FleetCapacity</a> object is returned for each
  /// requested fleet ID. Each FleetCapacity object includes a
  /// <code>Location</code> property, which is set to the fleet's home Region.
  /// When a list of fleet IDs is provided, attribute objects are returned only
  /// for fleets that currently exist.
  /// <note>
  /// Some API operations may limit the number of fleet IDs that are allowed in
  /// one request. If a request exceeds this limit, the request fails and the
  /// error message includes the maximum allowed.
  /// </note>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html#gamelift-metrics-fleet">GameLift
  /// metrics for fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>ListFleets</a> | <a>DescribeEC2InstanceLimits</a> |
  /// <a>DescribeFleetAttributes</a> | <a>DescribeFleetCapacity</a> |
  /// <a>DescribeFleetEvents</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetPortSettings</a> | <a>DescribeFleetUtilization</a> |
  /// <a>DescribeRuntimeConfiguration</a> | <a>DescribeScalingPolicies</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetIds] :
  /// A unique identifier for the fleet(s) to retrieve capacity information for.
  /// You can use either the fleet ID or ARN value. Leave this parameter empty
  /// to retrieve capacity information for all fleets.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  Future<DescribeFleetCapacityOutput> describeFleetCapacity({
    List<String>? fleetIds,
    int? limit,
    String? nextToken,
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

  /// Retrieves entries from a fleet's event log. Fleet events are initiated by
  /// changes in status, such as during fleet creation and termination, changes
  /// in capacity, etc. If a fleet has multiple locations, events are also
  /// initiated by changes to status and capacity in remote locations.
  ///
  /// You can specify a time range to limit the result set. Use the pagination
  /// parameters to retrieve results as a set of sequential pages.
  ///
  /// If successful, a collection of event log entries matching the request are
  /// returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>ListFleets</a> | <a>DescribeEC2InstanceLimits</a> |
  /// <a>DescribeFleetAttributes</a> | <a>DescribeFleetCapacity</a> |
  /// <a>DescribeFleetEvents</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetPortSettings</a> | <a>DescribeFleetUtilization</a> |
  /// <a>DescribeRuntimeConfiguration</a> | <a>DescribeScalingPolicies</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to get event logs for. You can use
  /// either the fleet ID or ARN value.
  ///
  /// Parameter [endTime] :
  /// The most recent date to retrieve event logs for. If no end time is
  /// specified, this call returns entries from the specified start time up to
  /// the present. Format is a number expressed in Unix time as milliseconds
  /// (ex: "1469498468.057").
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [startTime] :
  /// The earliest date to retrieve event logs for. If no start time is
  /// specified, this call returns entries starting from when the fleet was
  /// created to the specified end time. Format is a number expressed in Unix
  /// time as milliseconds (ex: "1469498468.057").
  Future<DescribeFleetEventsOutput> describeFleetEvents({
    required String fleetId,
    DateTime? endTime,
    int? limit,
    String? nextToken,
    DateTime? startTime,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
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

  /// Retrieves information on a fleet's remote locations, including life-cycle
  /// status and any suspended fleet activity.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To get data for specific locations, provide a fleet identifier and a list
  /// of locations. Location data is returned in the order that it is requested.
  /// </li>
  /// <li>
  /// To get data for all locations, provide a fleet identifier only. Location
  /// data is returned in no particular order.
  /// </li>
  /// </ul>
  /// When requesting attributes for multiple locations, use the pagination
  /// parameters to retrieve results as a set of sequential pages.
  ///
  /// If successful, a <code>LocationAttributes</code> object is returned for
  /// each requested location. If the fleet does not have a requested location,
  /// no information is returned. This operation does not return the home
  /// Region. To get information on a fleet's home Region, call
  /// <code>DescribeFleetAttributes</code>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleetLocations</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetLocationCapacity</a> |
  /// <a>DescribeFleetLocationUtilization</a> | <a>DescribeFleetAttributes</a> |
  /// <a>DescribeFleetCapacity</a> | <a>DescribeFleetUtilization</a> |
  /// <a>UpdateFleetCapacity</a> | <a>StopFleetActions</a> |
  /// <a>DeleteFleetLocations</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to retrieve remote locations for. You
  /// can use either the fleet ID or ARN value.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. This
  /// limit is not currently enforced.
  ///
  /// Parameter [locations] :
  /// A list of fleet locations to retrieve information for. Specify locations
  /// in the form of an AWS Region code, such as <code>us-west-2</code>.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<DescribeFleetLocationAttributesOutput>
      describeFleetLocationAttributes({
    required String fleetId,
    int? limit,
    List<String>? locations,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
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
      'X-Amz-Target': 'GameLift.DescribeFleetLocationAttributes'
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
        if (locations != null) 'Locations': locations,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeFleetLocationAttributesOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the resource capacity settings for a fleet location. The data
  /// returned includes the current capacity (number of EC2 instances) and some
  /// scaling settings for the requested fleet location. Use this operation to
  /// retrieve capacity information for a fleet's remote location or home Region
  /// (you can also retrieve home Region capacity by calling
  /// <code>DescribeFleetCapacity</code>).
  ///
  /// To retrieve capacity data, identify a fleet and location.
  ///
  /// If successful, a <code>FleetCapacity</code> object is returned for the
  /// requested fleet location.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html#gamelift-metrics-fleet">GameLift
  /// metrics for fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleetLocations</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetLocationCapacity</a> |
  /// <a>DescribeFleetLocationUtilization</a> | <a>DescribeFleetAttributes</a> |
  /// <a>DescribeFleetCapacity</a> | <a>DescribeFleetUtilization</a> |
  /// <a>UpdateFleetCapacity</a> | <a>StopFleetActions</a> |
  /// <a>DeleteFleetLocations</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to request location capacity for. You
  /// can use either the fleet ID or ARN value.
  ///
  /// Parameter [location] :
  /// The fleet location to retrieve capacity information for. Specify a
  /// location in the form of an AWS Region code, such as
  /// <code>us-west-2</code>.
  Future<DescribeFleetLocationCapacityOutput> describeFleetLocationCapacity({
    required String fleetId,
    required String location,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    ArgumentError.checkNotNull(location, 'location');
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeFleetLocationCapacity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        'Location': location,
      },
    );

    return DescribeFleetLocationCapacityOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves current usage data for a fleet location. Utilization data
  /// provides a snapshot of current game hosting activity at the requested
  /// location. Use this operation to retrieve utilization information for a
  /// fleet's remote location or home Region (you can also retrieve home Region
  /// utilization by calling <code>DescribeFleetUtilization</code>).
  ///
  /// To retrieve utilization data, identify a fleet and location.
  ///
  /// If successful, a <code>FleetUtilization</code> object is returned for the
  /// requested fleet location.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html#gamelift-metrics-fleet">GameLift
  /// metrics for fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleetLocations</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetLocationCapacity</a> |
  /// <a>DescribeFleetLocationUtilization</a> | <a>DescribeFleetAttributes</a> |
  /// <a>DescribeFleetCapacity</a> | <a>DescribeFleetUtilization</a> |
  /// <a>UpdateFleetCapacity</a> | <a>StopFleetActions</a> |
  /// <a>DeleteFleetLocations</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to request location utilization for. You
  /// can use either the fleet ID or ARN value.
  ///
  /// Parameter [location] :
  /// The fleet location to retrieve utilization information for. Specify a
  /// location in the form of an AWS Region code, such as
  /// <code>us-west-2</code>.
  Future<DescribeFleetLocationUtilizationOutput>
      describeFleetLocationUtilization({
    required String fleetId,
    required String location,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    ArgumentError.checkNotNull(location, 'location');
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.DescribeFleetLocationUtilization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FleetId': fleetId,
        'Location': location,
      },
    );

    return DescribeFleetLocationUtilizationOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a fleet's inbound connection permissions. Connection permissions
  /// specify the range of IP addresses and port settings that incoming traffic
  /// can use to access server processes in the fleet. Game sessions that are
  /// running on instances in the fleet must use connections that fall in this
  /// range.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To retrieve the inbound connection permissions for a fleet, identify the
  /// fleet's unique identifier.
  /// </li>
  /// <li>
  /// To check the status of recent updates to a fleet remote location, specify
  /// the fleet ID and a location. Port setting updates can take time to
  /// propagate across all locations.
  /// </li>
  /// </ul>
  /// If successful, a set of <a>IpPermission</a> objects is returned for the
  /// requested fleet ID. When a location is specified, a pending status is
  /// included. If the requested fleet has been deleted, the result set is
  /// empty.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>ListFleets</a> | <a>DescribeEC2InstanceLimits</a> |
  /// <a>DescribeFleetAttributes</a> | <a>DescribeFleetCapacity</a> |
  /// <a>DescribeFleetEvents</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetPortSettings</a> | <a>DescribeFleetUtilization</a> |
  /// <a>DescribeRuntimeConfiguration</a> | <a>DescribeScalingPolicies</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to retrieve port settings for. You can
  /// use either the fleet ID or ARN value.
  ///
  /// Parameter [location] :
  /// A remote location to check for status of port setting updates. Use the AWS
  /// Region code format, such as <code>us-west-2</code>.
  Future<DescribeFleetPortSettingsOutput> describeFleetPortSettings({
    required String fleetId,
    String? location,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
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
        if (location != null) 'Location': location,
      },
    );

    return DescribeFleetPortSettingsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves utilization statistics for one or more fleets. Utilization data
  /// provides a snapshot of how the fleet's hosting resources are currently
  /// being used. For fleets with remote locations, this operation retrieves
  /// data for the fleet's home Region only. See
  /// <a>DescribeFleetLocationUtilization</a> to get utilization statistics for
  /// a fleet's remote locations.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To get utilization data for one or more specific fleets, provide a list of
  /// fleet IDs or fleet ARNs.
  /// </li>
  /// <li>
  /// To get utilization data for all fleets, do not provide a fleet identifier.
  /// </li>
  /// </ul>
  /// When requesting multiple fleets, use the pagination parameters to retrieve
  /// results as a set of sequential pages.
  ///
  /// If successful, a <a>FleetUtilization</a> object is returned for each
  /// requested fleet ID, unless the fleet identifier is not found. Each fleet
  /// utilization object includes a <code>Location</code> property, which is set
  /// to the fleet's home Region.
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
  /// <b>Related actions</b>
  ///
  /// <a>ListFleets</a> | <a>DescribeEC2InstanceLimits</a> |
  /// <a>DescribeFleetAttributes</a> | <a>DescribeFleetCapacity</a> |
  /// <a>DescribeFleetEvents</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetPortSettings</a> | <a>DescribeFleetUtilization</a> |
  /// <a>DescribeRuntimeConfiguration</a> | <a>DescribeScalingPolicies</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [fleetIds] :
  /// A unique identifier for the fleet(s) to retrieve utilization data for. You
  /// can use either the fleet ID or ARN value. To retrieve attributes for all
  /// current fleets, do not include this parameter.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value. This
  /// parameter is ignored when the request specifies one or a list of fleet
  /// IDs.
  Future<DescribeFleetUtilizationOutput> describeFleetUtilization({
    List<String>? fleetIds,
    int? limit,
    String? nextToken,
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

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>RegisterGameServer</a> | <a>ListGameServers</a> |
  /// <a>ClaimGameServer</a> | <a>DescribeGameServer</a> |
  /// <a>UpdateGameServer</a> | <a>DeregisterGameServer</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
    required String gameServerGroupName,
    required String gameServerId,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
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

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameServerGroup</a> | <a>ListGameServerGroups</a> |
  /// <a>DescribeGameServerGroup</a> | <a>UpdateGameServerGroup</a> |
  /// <a>DeleteGameServerGroup</a> | <a>ResumeGameServerGroup</a> |
  /// <a>SuspendGameServerGroup</a> | <a>DescribeGameServerInstances</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
    required String gameServerGroupName,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
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

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameServerGroup</a> | <a>ListGameServerGroups</a> |
  /// <a>DescribeGameServerGroup</a> | <a>UpdateGameServerGroup</a> |
  /// <a>DeleteGameServerGroup</a> | <a>ResumeGameServerGroup</a> |
  /// <a>SuspendGameServerGroup</a> | <a>DescribeGameServerInstances</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<DescribeGameServerInstancesOutput> describeGameServerInstances({
    required String gameServerGroupName,
    List<String>? instanceIds,
    int? limit,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
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

  /// Retrieves additional game session properties, including the game session
  /// protection policy in force, a set of one or more game sessions in a
  /// specific fleet location. You can optionally filter the results by current
  /// game session status. Alternatively, use <a>SearchGameSessions</a> to
  /// request a set of active game sessions that are filtered by certain
  /// criteria. To retrieve all game session properties, use
  /// <a>DescribeGameSessions</a>.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To retrieve details for all game sessions that are currently running on
  /// all locations in a fleet, provide a fleet or alias ID, with an optional
  /// status filter. This approach returns details from the fleet's home Region
  /// and all remote locations.
  /// </li>
  /// <li>
  /// To retrieve details for all game sessions that are currently running on a
  /// specific fleet location, provide a fleet or alias ID and a location name,
  /// with optional status filter. The location can be the fleet's home Region
  /// or any remote location.
  /// </li>
  /// <li>
  /// To retrieve details for a specific game session, provide the game session
  /// ID. This approach looks for the game session ID in all fleets that reside
  /// in the AWS Region defined in the request.
  /// </li>
  /// </ul>
  /// Use the pagination parameters to retrieve results as a set of sequential
  /// pages.
  ///
  /// If successful, a <code>GameSessionDetail</code> object is returned for
  /// each game session that matches the request.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#gamelift-sdk-client-api-find">Find
  /// a game session</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSession</a> | <a>DescribeGameSessions</a> |
  /// <a>DescribeGameSessionDetails</a> | <a>SearchGameSessions</a> |
  /// <a>UpdateGameSession</a> | <a>GetGameSessionLogUrl</a> |
  /// <a>StartGameSessionPlacement</a> | <a>DescribeGameSessionPlacement</a> |
  /// <a>StopGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TerminalRoutingStrategyException].
  ///
  /// Parameter [aliasId] :
  /// A unique identifier for the alias associated with the fleet to retrieve
  /// all game sessions for. You can use either the alias ID or ARN value.
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to retrieve all game sessions active on
  /// the fleet. You can use either the fleet ID or ARN value.
  ///
  /// Parameter [gameSessionId] :
  /// A unique identifier for the game session to retrieve.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [location] :
  /// A fleet location to get game sessions for. You can specify a fleet's home
  /// Region or a remote location. Use the AWS Region code format, such as
  /// <code>us-west-2</code>.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [statusFilter] :
  /// Game session status to filter results on. Possible game session statuses
  /// include <code>ACTIVE</code>, <code>TERMINATED</code>,
  /// <code>ACTIVATING</code> and <code>TERMINATING</code> (the last two are
  /// transitory).
  Future<DescribeGameSessionDetailsOutput> describeGameSessionDetails({
    String? aliasId,
    String? fleetId,
    String? gameSessionId,
    int? limit,
    String? location,
    String? nextToken,
    String? statusFilter,
  }) async {
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
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
        if (location != null) 'Location': location,
        if (nextToken != null) 'NextToken': nextToken,
        if (statusFilter != null) 'StatusFilter': statusFilter,
      },
    );

    return DescribeGameSessionDetailsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves information, including current status, about a game session
  /// placement request.
  ///
  /// To get game session placement details, specify the placement ID.
  ///
  /// If successful, a <a>GameSessionPlacement</a> object is returned.
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSession</a> | <a>DescribeGameSessions</a> |
  /// <a>DescribeGameSessionDetails</a> | <a>SearchGameSessions</a> |
  /// <a>UpdateGameSession</a> | <a>GetGameSessionLogUrl</a> |
  /// <a>StartGameSessionPlacement</a> | <a>DescribeGameSessionPlacement</a> |
  /// <a>StopGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [placementId] :
  /// A unique identifier for a game session placement to retrieve.
  Future<DescribeGameSessionPlacementOutput> describeGameSessionPlacement({
    required String placementId,
  }) async {
    ArgumentError.checkNotNull(placementId, 'placementId');
    _s.validateStringLength(
      'placementId',
      placementId,
      1,
      48,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSessionQueue</a> | <a>DescribeGameSessionQueues</a> |
  /// <a>UpdateGameSessionQueue</a> | <a>DeleteGameSessionQueue</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    int? limit,
    List<String>? names,
    String? nextToken,
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

  /// Retrieves a set of one or more game sessions in a specific fleet location.
  /// You can optionally filter the results by current game session status.
  /// Alternatively, use <a>SearchGameSessions</a> to request a set of active
  /// game sessions that are filtered by certain criteria. To retrieve the
  /// protection policy for game sessions, use
  /// <a>DescribeGameSessionDetails</a>.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To retrieve all game sessions that are currently running on all locations
  /// in a fleet, provide a fleet or alias ID, with an optional status filter.
  /// This approach returns all game sessions in the fleet's home Region and all
  /// remote locations.
  /// </li>
  /// <li>
  /// To retrieve all game sessions that are currently running on a specific
  /// fleet location, provide a fleet or alias ID and a location name, with
  /// optional status filter. The location can be the fleet's home Region or any
  /// remote location.
  /// </li>
  /// <li>
  /// To retrieve a specific game session, provide the game session ID. This
  /// approach looks for the game session ID in all fleets that reside in the
  /// AWS Region defined in the request.
  /// </li>
  /// </ul>
  /// Use the pagination parameters to retrieve results as a set of sequential
  /// pages.
  ///
  /// If successful, a <code>GameSession</code> object is returned for each game
  /// session that matches the request.
  ///
  /// <i>Available in GameLift Local.</i>
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#gamelift-sdk-client-api-find">Find
  /// a game session</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSession</a> | <a>DescribeGameSessions</a> |
  /// <a>DescribeGameSessionDetails</a> | <a>SearchGameSessions</a> |
  /// <a>UpdateGameSession</a> | <a>GetGameSessionLogUrl</a> |
  /// <a>StartGameSessionPlacement</a> | <a>DescribeGameSessionPlacement</a> |
  /// <a>StopGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TerminalRoutingStrategyException].
  ///
  /// Parameter [aliasId] :
  /// A unique identifier for the alias associated with the fleet to retrieve
  /// game sessions for. You can use either the alias ID or ARN value.
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to retrieve game sessions for. You can
  /// use either the fleet ID or ARN value.
  ///
  /// Parameter [gameSessionId] :
  /// A unique identifier for the game session to retrieve.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [location] :
  /// A fleet location to get game session details for. You can specify a
  /// fleet's home Region or a remote location. Use the AWS Region code format,
  /// such as <code>us-west-2</code>.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [statusFilter] :
  /// Game session status to filter results on. You can filter on the following
  /// states: <code>ACTIVE</code>, <code>TERMINATED</code>,
  /// <code>ACTIVATING</code>, and <code>TERMINATING</code>. The last two are
  /// transitory and used for only very brief periods of time.
  Future<DescribeGameSessionsOutput> describeGameSessions({
    String? aliasId,
    String? fleetId,
    String? gameSessionId,
    int? limit,
    String? location,
    String? nextToken,
    String? statusFilter,
  }) async {
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
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
        if (location != null) 'Location': location,
        if (nextToken != null) 'NextToken': nextToken,
        if (statusFilter != null) 'StatusFilter': statusFilter,
      },
    );

    return DescribeGameSessionsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a fleet's instances, including instance IDs,
  /// connection data, and status.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To get information on all instances that are deployed to a fleet's home
  /// Region, provide the fleet ID.
  /// </li>
  /// <li>
  /// To get information on all instances that are deployed to a fleet's remote
  /// location, provide the fleet ID and location name.
  /// </li>
  /// <li>
  /// To get information on a specific instance in a fleet, provide the fleet ID
  /// and instance ID.
  /// </li>
  /// </ul>
  /// Use the pagination parameters to retrieve results as a set of sequential
  /// pages.
  ///
  /// If successful, an <code>Instance</code> object is returned for each
  /// requested instance. Instances are not returned in any particular order.
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
  /// <b>Related actions</b>
  ///
  /// <a>DescribeInstances</a> | <a>GetInstanceAccess</a> |
  /// <a>DescribeEC2InstanceLimits</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to retrieve instance information for.
  /// You can use either the fleet ID or ARN value.
  ///
  /// Parameter [instanceId] :
  /// A unique identifier for an instance to retrieve. Specify an instance ID or
  /// leave blank to retrieve all instances in the fleet.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [location] :
  /// The name of a location to retrieve instance information for, in the form
  /// of an AWS Region code such as <code>us-west-2</code>.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<DescribeInstancesOutput> describeInstances({
    required String fleetId,
    String? instanceId,
    int? limit,
    String? location,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
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
        if (location != null) 'Location': location,
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
  /// Add FlexMatch to a game client</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html">
  /// Set Up FlexMatch event notification</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>StartMatchmaking</a> | <a>DescribeMatchmaking</a> |
  /// <a>StopMatchmaking</a> | <a>AcceptMatch</a> | <a>StartMatchBackfill</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [ticketIds] :
  /// A unique identifier for a matchmaking ticket. You can include up to 10 ID
  /// values.
  Future<DescribeMatchmakingOutput> describeMatchmaking({
    required List<String> ticketIds,
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
  /// Setting up FlexMatch matchmakers</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateMatchmakingConfiguration</a> |
  /// <a>DescribeMatchmakingConfigurations</a> |
  /// <a>UpdateMatchmakingConfiguration</a> |
  /// <a>DeleteMatchmakingConfiguration</a> | <a>CreateMatchmakingRuleSet</a> |
  /// <a>DescribeMatchmakingRuleSets</a> | <a>ValidateMatchmakingRuleSet</a> |
  /// <a>DeleteMatchmakingRuleSet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A unique identifier for the matchmaking configuration(s) to retrieve. You
  /// can use either the configuration name or ARN value. To request all
  /// existing configurations, leave this parameter empty.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [ruleSetName] :
  /// A unique identifier for the matchmaking rule set. You can use either the
  /// rule set name or ARN value. Use this parameter to retrieve all matchmaking
  /// configurations that use this rule set.
  Future<DescribeMatchmakingConfigurationsOutput>
      describeMatchmakingConfigurations({
    int? limit,
    List<String>? names,
    String? nextToken,
    String? ruleSetName,
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
  /// a rule set</a>
  /// </li>
  /// </ul>
  /// <b>Related actions</b>
  ///
  /// <a>CreateMatchmakingConfiguration</a> |
  /// <a>DescribeMatchmakingConfigurations</a> |
  /// <a>UpdateMatchmakingConfiguration</a> |
  /// <a>DeleteMatchmakingConfiguration</a> | <a>CreateMatchmakingRuleSet</a> |
  /// <a>DescribeMatchmakingRuleSets</a> | <a>ValidateMatchmakingRuleSet</a> |
  /// <a>DeleteMatchmakingRuleSet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    int? limit,
    List<String>? names,
    String? nextToken,
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

  /// Retrieves properties for one or more player sessions.
  ///
  /// This action can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To retrieve a specific player session, provide the player session ID only.
  /// </li>
  /// <li>
  /// To retrieve all player sessions in a game session, provide the game
  /// session ID only.
  /// </li>
  /// <li>
  /// To retrieve all player sessions for a specific player, provide a player ID
  /// only.
  /// </li>
  /// </ul>
  /// To request player sessions, specify either a player session ID, game
  /// session ID, or player ID. You can filter this request by player session
  /// status. Use the pagination parameters to retrieve results as a set of
  /// sequential pages.
  ///
  /// If successful, a <code>PlayerSession</code> object is returned for each
  /// session that matches the request.
  ///
  /// <i>Available in Amazon GameLift Local.</i>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreatePlayerSession</a> | <a>CreatePlayerSessions</a> |
  /// <a>DescribePlayerSessions</a> | <a>StartGameSessionPlacement</a> |
  /// <a>DescribeGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
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
    String? gameSessionId,
    int? limit,
    String? nextToken,
    String? playerId,
    String? playerSessionId,
    String? playerSessionStatusFilter,
  }) async {
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
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
  /// configuration tells GameLift which server processes to run (and how) on
  /// each instance in the fleet.
  ///
  /// To get the runtime configuration that is currently in forces for a fleet,
  /// provide the fleet ID.
  ///
  /// If successful, a <a>RuntimeConfiguration</a> object is returned for the
  /// requested fleet. If the requested fleet has been deleted, the result set
  /// is empty.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-multiprocess.html">Running
  /// multiple processes on a fleet</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>ListFleets</a> | <a>DescribeEC2InstanceLimits</a> |
  /// <a>DescribeFleetAttributes</a> | <a>DescribeFleetCapacity</a> |
  /// <a>DescribeFleetEvents</a> | <a>DescribeFleetLocationAttributes</a> |
  /// <a>DescribeFleetPortSettings</a> | <a>DescribeFleetUtilization</a> |
  /// <a>DescribeRuntimeConfiguration</a> | <a>DescribeScalingPolicies</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to get the runtime configuration for.
  /// You can use either the fleet ID or ARN value.
  Future<DescribeRuntimeConfigurationOutput> describeRuntimeConfiguration({
    required String fleetId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
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
  /// <b>Related actions</b>
  ///
  /// <a>DescribeFleetCapacity</a> | <a>UpdateFleetCapacity</a> |
  /// <a>DescribeEC2InstanceLimits</a> | <a>PutScalingPolicy</a> |
  /// <a>DescribeScalingPolicies</a> | <a>DeleteScalingPolicy</a> |
  /// <a>StopFleetActions</a> | <a>StartFleetActions</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to retrieve scaling policies for. You
  /// can use either the fleet ID or ARN value.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [location] :
  /// CONTENT TODO
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
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
    required String fleetId,
    int? limit,
    String? location,
    String? nextToken,
    ScalingStatusType? statusFilter,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
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
        if (location != null) 'Location': location,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateScript</a> | <a>ListScripts</a> | <a>DescribeScript</a> |
  /// <a>UpdateScript</a> | <a>DeleteScript</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [scriptId] :
  /// A unique identifier for the Realtime script to retrieve properties for.
  /// You can use either the script ID or ARN value.
  Future<DescribeScriptOutput> describeScript({
    required String scriptId,
  }) async {
    ArgumentError.checkNotNull(scriptId, 'scriptId');
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateVpcPeeringAuthorization</a> |
  /// <a>DescribeVpcPeeringAuthorizations</a> |
  /// <a>DeleteVpcPeeringAuthorization</a> | <a>CreateVpcPeeringConnection</a> |
  /// <a>DescribeVpcPeeringConnections</a> | <a>DeleteVpcPeeringConnection</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateVpcPeeringAuthorization</a> |
  /// <a>DescribeVpcPeeringAuthorizations</a> |
  /// <a>DeleteVpcPeeringAuthorization</a> | <a>CreateVpcPeeringConnection</a> |
  /// <a>DescribeVpcPeeringConnections</a> | <a>DeleteVpcPeeringConnection</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet. You can use either the fleet ID or ARN
  /// value.
  Future<DescribeVpcPeeringConnectionsOutput> describeVpcPeeringConnections({
    String? fleetId,
  }) async {
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
  /// session. When a game session is terminated, GameLift automatically stores
  /// the logs in Amazon S3 and retains them for 14 days. Use this URL to
  /// download the logs.
  /// <note>
  /// See the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_gamelift">AWS
  /// Service Limits</a> page for maximum log file sizes. Log files that exceed
  /// this limit are not saved.
  /// </note>
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSession</a> | <a>DescribeGameSessions</a> |
  /// <a>DescribeGameSessionDetails</a> | <a>SearchGameSessions</a> |
  /// <a>UpdateGameSession</a> | <a>GetGameSessionLogUrl</a> |
  /// <a>StartGameSessionPlacement</a> | <a>DescribeGameSessionPlacement</a> |
  /// <a>StopGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [gameSessionId] :
  /// A unique identifier for the game session to get logs for.
  Future<GetGameSessionLogUrlOutput> getGameSessionLogUrl({
    required String gameSessionId,
  }) async {
    ArgumentError.checkNotNull(gameSessionId, 'gameSessionId');
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
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
  /// operating system of the instance. For a Windows instance, GameLift returns
  /// a user name and password as strings for use with a Windows Remote Desktop
  /// client. For a Linux instance, GameLift returns a user name and RSA private
  /// key, also as strings, for use with an SSH client. The private key must be
  /// saved in the proper format to a <code>.pem</code> file before using. If
  /// you're making this request using the AWS CLI, saving the secret can be
  /// handled as part of the <code>GetInstanceAccess</code> request, as shown in
  /// one of the examples for this operation.
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
  /// <b>Related actions</b>
  ///
  /// <a>DescribeInstances</a> | <a>GetInstanceAccess</a> |
  /// <a>DescribeEC2InstanceLimits</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet that contains the instance you want
  /// access to. You can use either the fleet ID or ARN value. The fleet can be
  /// in any of the following statuses: <code>ACTIVATING</code>,
  /// <code>ACTIVE</code>, or <code>ERROR</code>. Fleets with an
  /// <code>ERROR</code> status may be accessible for a short time before they
  /// are deleted.
  ///
  /// Parameter [instanceId] :
  /// A unique identifier for the instance you want to get access to. You can
  /// access an instance in any status.
  Future<GetInstanceAccessOutput> getInstanceAccess({
    required String fleetId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateAlias</a> | <a>ListAliases</a> | <a>DescribeAlias</a> |
  /// <a>UpdateAlias</a> | <a>DeleteAlias</a> | <a>ResolveAlias</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    int? limit,
    String? name,
    String? nextToken,
    RoutingStrategyType? routingStrategyType,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateBuild</a> | <a>ListBuilds</a> | <a>DescribeBuild</a> |
  /// <a>UpdateBuild</a> | <a>DeleteBuild</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    int? limit,
    String? nextToken,
    BuildStatus? status,
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

  /// Retrieves a collection of fleet resources in an AWS Region. You can call
  /// this operation to get fleets in a previously selected default Region (see
  /// <a
  /// href="https://docs.aws.amazon.com/credref/latest/refdocs/setting-global-region.html">https://docs.aws.amazon.com/credref/latest/refdocs/setting-global-region.html</a>or
  /// specify a Region in your request. You can filter the result set to find
  /// only those fleets that are deployed with a specific build or script. For
  /// fleets that have multiple locations, this operation retrieves fleets based
  /// on their home Region only.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To get a list of all fleets in a Region, don't provide a build or script
  /// identifier.
  /// </li>
  /// <li>
  /// To get a list of all fleets where a specific custom game build is
  /// deployed, provide the build ID.
  /// </li>
  /// <li>
  /// To get a list of all Realtime Servers fleets with a specific configuration
  /// script, provide the script ID.
  /// </li>
  /// </ul>
  /// Use the pagination parameters to retrieve results as a set of sequential
  /// pages.
  ///
  /// If successful, a list of fleet IDs that match the request parameters is
  /// returned. A NextToken value is also returned if there are more result
  /// pages to retrieve.
  /// <note>
  /// Fleet resources are not listed in a particular order.
  /// </note>
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleet</a> | <a>UpdateFleetCapacity</a> | <a>PutScalingPolicy</a>
  /// | <a>DescribeEC2InstanceLimits</a> | <a>DescribeFleetAttributes</a> |
  /// <a>DescribeFleetLocationAttributes</a> | <a>UpdateFleetAttributes</a> |
  /// <a>StopFleetActions</a> | <a>DeleteFleet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [buildId] :
  /// A unique identifier for the build to request fleets for. Use this
  /// parameter to return only fleets using a specified build. Use either the
  /// build ID or ARN value.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [scriptId] :
  /// A unique identifier for the Realtime script to request fleets for. Use
  /// this parameter to return only fleets using a specified script. Use either
  /// the script ID or ARN value.
  Future<ListFleetsOutput> listFleets({
    String? buildId,
    int? limit,
    String? nextToken,
    String? scriptId,
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

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameServerGroup</a> | <a>ListGameServerGroups</a> |
  /// <a>DescribeGameServerGroup</a> | <a>UpdateGameServerGroup</a> |
  /// <a>DeleteGameServerGroup</a> | <a>ResumeGameServerGroup</a> |
  /// <a>SuspendGameServerGroup</a> | <a>DescribeGameServerInstances</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
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
  Future<ListGameServerGroupsOutput> listGameServerGroups({
    int? limit,
    String? nextToken,
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

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>RegisterGameServer</a> | <a>ListGameServers</a> |
  /// <a>ClaimGameServer</a> | <a>DescribeGameServer</a> |
  /// <a>UpdateGameServer</a> | <a>DeregisterGameServer</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  ///
  /// Parameter [sortOrder] :
  /// Indicates how to sort the returned data based on game server registration
  /// timestamp. Use <code>ASCENDING</code> to retrieve oldest game servers
  /// first, or use <code>DESCENDING</code> to retrieve newest game servers
  /// first. If this parameter is left empty, game servers are returned in no
  /// particular order.
  Future<ListGameServersOutput> listGameServers({
    required String gameServerGroupName,
    int? limit,
    String? nextToken,
    SortOrder? sortOrder,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateScript</a> | <a>ListScripts</a> | <a>DescribeScript</a> |
  /// <a>UpdateScript</a> | <a>DeleteScript</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    int? limit,
    String? nextToken,
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
  /// <b>Related actions</b>
  ///
  /// <a>TagResource</a> | <a>UntagResource</a> | <a>ListTagsForResource</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required String resourceARN,
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
  /// <b>Related actions</b>
  ///
  /// <a>DescribeFleetCapacity</a> | <a>UpdateFleetCapacity</a> |
  /// <a>DescribeEC2InstanceLimits</a> | <a>PutScalingPolicy</a> |
  /// <a>DescribeScalingPolicies</a> | <a>DeleteScalingPolicy</a> |
  /// <a>StopFleetActions</a> | <a>StartFleetActions</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to apply this policy to. You can use
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
  /// A descriptive label that is associated with a fleet's scaling policy.
  /// Policy names do not need to be unique. A fleet can have only one scaling
  /// policy with the same name.
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
  /// An object that contains settings for a target-based scaling policy.
  ///
  /// Parameter [threshold] :
  /// Metric value used to trigger a scaling event.
  Future<PutScalingPolicyOutput> putScalingPolicy({
    required String fleetId,
    required MetricName metricName,
    required String name,
    ComparisonOperatorType? comparisonOperator,
    int? evaluationPeriods,
    PolicyType? policyType,
    int? scalingAdjustment,
    ScalingAdjustmentType? scalingAdjustmentType,
    TargetConfiguration? targetConfiguration,
    double? threshold,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
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
        'MetricName': metricName.toValue(),
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

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>RegisterGameServer</a> | <a>ListGameServers</a> |
  /// <a>ClaimGameServer</a> | <a>DescribeGameServer</a> |
  /// <a>UpdateGameServer</a> | <a>DeregisterGameServer</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
    required String gameServerGroupName,
    required String gameServerId,
    required String instanceId,
    String? connectionInfo,
    String? gameServerData,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
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
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringLength(
      'connectionInfo',
      connectionInfo,
      1,
      512,
    );
    _s.validateStringLength(
      'gameServerData',
      gameServerData,
      1,
      1024,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateBuild</a> | <a>ListBuilds</a> | <a>DescribeBuild</a> |
  /// <a>UpdateBuild</a> | <a>DeleteBuild</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [buildId] :
  /// A unique identifier for the build to get credentials for. You can use
  /// either the build ID or ARN value.
  Future<RequestUploadCredentialsOutput> requestUploadCredentials({
    required String buildId,
  }) async {
    ArgumentError.checkNotNull(buildId, 'buildId');
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateAlias</a> | <a>ListAliases</a> | <a>DescribeAlias</a> |
  /// <a>UpdateAlias</a> | <a>DeleteAlias</a> | <a>ResolveAlias</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required String aliasId,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
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

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameServerGroup</a> | <a>ListGameServerGroups</a> |
  /// <a>DescribeGameServerGroup</a> | <a>UpdateGameServerGroup</a> |
  /// <a>DeleteGameServerGroup</a> | <a>ResumeGameServerGroup</a> |
  /// <a>SuspendGameServerGroup</a> | <a>DescribeGameServerInstances</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
    required String gameServerGroupName,
    required List<GameServerGroupAction> resumeActions,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
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
        'ResumeActions': resumeActions.map((e) => e.toValue()).toList(),
      },
    );

    return ResumeGameServerGroupOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves all active game sessions that match a set of search criteria and
  /// sorts them into a specified order.
  ///
  /// When searching for game sessions, you specify exactly where you want to
  /// search and provide a search filter expression, a sort expression, or both.
  /// A search request can search only one fleet, but it can search all of a
  /// fleet's locations.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To search all game sessions that are currently running on all locations in
  /// a fleet, provide a fleet or alias ID. This approach returns game sessions
  /// in the fleet's home Region and all remote locations that fit the search
  /// criteria.
  /// </li>
  /// <li>
  /// To search all game sessions that are currently running on a specific fleet
  /// location, provide a fleet or alias ID and a location name. For location,
  /// you can specify a fleet's home Region or any remote location.
  /// </li>
  /// </ul>
  /// Use the pagination parameters to retrieve results as a set of sequential
  /// pages.
  ///
  /// If successful, a <code>GameSession</code> object is returned for each game
  /// session that matches the request. Search finds game sessions that are in
  /// <code>ACTIVE</code> status only. To retrieve information on game sessions
  /// in other statuses, use <a>DescribeGameSessions</a>.
  ///
  /// You can search or sort by the following game session attributes:
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSession</a> | <a>DescribeGameSessions</a> |
  /// <a>DescribeGameSessionDetails</a> | <a>SearchGameSessions</a> |
  /// <a>UpdateGameSession</a> | <a>GetGameSessionLogUrl</a> |
  /// <a>StartGameSessionPlacement</a> | <a>DescribeGameSessionPlacement</a> |
  /// <a>StopGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [NotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TerminalRoutingStrategyException].
  ///
  /// Parameter [aliasId] :
  /// A unique identifier for the alias associated with the fleet to search for
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
  /// A unique identifier for the fleet to search for active game sessions. You
  /// can use either the fleet ID or ARN value. Each request must reference
  /// either a fleet ID or alias ID, but not both.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages. The
  /// maximum number of results returned is 20, even if this value is not set or
  /// is set higher than 20.
  ///
  /// Parameter [location] :
  /// A fleet location to search for game sessions. You can specify a fleet's
  /// home Region or a remote location. Use the AWS Region code format, such as
  /// <code>us-west-2</code>.
  ///
  ///
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the start of the next sequential page of results.
  /// Use the token that is returned with a previous call to this operation. To
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
    String? aliasId,
    String? filterExpression,
    String? fleetId,
    int? limit,
    String? location,
    String? nextToken,
    String? sortExpression,
  }) async {
    _s.validateStringLength(
      'filterExpression',
      filterExpression,
      1,
      1024,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
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
        if (location != null) 'Location': location,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortExpression != null) 'SortExpression': sortExpression,
      },
    );

    return SearchGameSessionsOutput.fromJson(jsonResponse.body);
  }

  /// Resumes certain types of activity on fleet instances that were suspended
  /// with <a>StopFleetActions</a>. For multi-location fleets, fleet actions are
  /// managed separately for each location. Currently, this operation is used to
  /// restart a fleet's auto-scaling activity.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To restart actions on instances in the fleet's home Region, provide a
  /// fleet ID and the type of actions to resume.
  /// </li>
  /// <li>
  /// To restart actions on instances in one of the fleet's remote locations,
  /// provide a fleet ID, a location name, and the type of actions to resume.
  /// </li>
  /// </ul>
  /// If successful, GameLift once again initiates scaling events as triggered
  /// by the fleet's scaling policies. If actions on the fleet location were
  /// never stopped, this operation will have no effect. You can view a fleet's
  /// stopped actions using <a>DescribeFleetAttributes</a> or
  /// <a>DescribeFleetLocationAttributes</a>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleet</a> | <a>UpdateFleetCapacity</a> | <a>PutScalingPolicy</a>
  /// | <a>DescribeEC2InstanceLimits</a> | <a>DescribeFleetAttributes</a> |
  /// <a>DescribeFleetLocationAttributes</a> | <a>UpdateFleetAttributes</a> |
  /// <a>StopFleetActions</a> | <a>DeleteFleet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A unique identifier for the fleet to restart actions on. You can use
  /// either the fleet ID or ARN value.
  ///
  /// Parameter [location] :
  /// The fleet location to restart fleet actions for. Specify a location in the
  /// form of an AWS Region code, such as <code>us-west-2</code>.
  Future<StartFleetActionsOutput> startFleetActions({
    required List<FleetAction> actions,
    required String fleetId,
    String? location,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
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
        'Actions': actions.map((e) => e.toValue()).toList(),
        'FleetId': fleetId,
        if (location != null) 'Location': location,
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSession</a> | <a>DescribeGameSessions</a> |
  /// <a>DescribeGameSessionDetails</a> | <a>SearchGameSessions</a> |
  /// <a>UpdateGameSession</a> | <a>GetGameSessionLogUrl</a> |
  /// <a>StartGameSessionPlacement</a> | <a>DescribeGameSessionPlacement</a> |
  /// <a>StopGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A set of custom properties for a game session, formatted as key:value
  /// pairs. These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  ///
  /// Parameter [gameSessionData] :
  /// A set of custom game session properties, formatted as a single string
  /// value. This data is passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  ///
  /// Parameter [gameSessionName] :
  /// A descriptive label that is associated with a game session. Session names
  /// do not need to be unique.
  ///
  /// Parameter [playerLatencies] :
  /// A set of values, expressed in milliseconds, that indicates the amount of
  /// latency that a player experiences when connected to AWS Regions. This
  /// information is used to try to place the new game session where it can
  /// offer the best possible gameplay experience for the players.
  Future<StartGameSessionPlacementOutput> startGameSessionPlacement({
    required String gameSessionQueueName,
    required int maximumPlayerSessionCount,
    required String placementId,
    List<DesiredPlayerSession>? desiredPlayerSessions,
    List<GameProperty>? gameProperties,
    String? gameSessionData,
    String? gameSessionName,
    List<PlayerLatency>? playerLatencies,
  }) async {
    ArgumentError.checkNotNull(gameSessionQueueName, 'gameSessionQueueName');
    _s.validateStringLength(
      'gameSessionQueueName',
      gameSessionQueueName,
      1,
      256,
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
    _s.validateStringLength(
      'gameSessionData',
      gameSessionData,
      1,
      262144,
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

  /// Finds new players to fill open slots in currently running game sessions.
  /// The backfill match process is essentially identical to the process of
  /// forming new matches. Backfill requests use the same matchmaker that was
  /// used to make the original match, and they provide matchmaking data for all
  /// players currently in the game session. FlexMatch uses this information to
  /// select new players so that backfilled match continues to meet the original
  /// match requirements.
  ///
  /// When using FlexMatch with GameLift managed hosting, you can request a
  /// backfill match from a client service by calling this operation with a
  /// <a>GameSession</a> identifier. You also have the option of making backfill
  /// requests directly from your game server. In response to a request,
  /// FlexMatch creates player sessions for the new players, updates the
  /// <code>GameSession</code> resource, and sends updated matchmaking data to
  /// the game server. You can request a backfill match at any point after a
  /// game session is started. Each game session can have only one active
  /// backfill request at a time; a subsequent request automatically replaces
  /// the earlier request.
  ///
  /// When using FlexMatch as a standalone component, request a backfill match
  /// by calling this operation without a game session identifier. As with newly
  /// formed matches, matchmaking results are returned in a matchmaking event so
  /// that your game can update the game session that is being backfilled.
  ///
  /// To request a backfill match, specify a unique ticket ID, the original
  /// matchmaking configuration, and matchmaking data for all current players in
  /// the game session being backfilled. Optionally, specify the
  /// <code>GameSession</code> ARN. If successful, a match backfill ticket is
  /// created and returned with status set to QUEUED. Track the status of
  /// backfill tickets using the same method for tracking tickets for new
  /// matches.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-backfill.html">
  /// Backfill existing games with FlexMatch</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html">
  /// Matchmaking events</a> (reference)
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/gamelift-match.html">
  /// How GameLift FlexMatch works</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>StartMatchmaking</a> | <a>DescribeMatchmaking</a> |
  /// <a>StopMatchmaking</a> | <a>AcceptMatch</a> | <a>StartMatchBackfill</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// PlayerID, PlayerAttributes, Team -- This information is maintained in the
  /// <a>GameSession</a> object, <code>MatchmakerData</code> property, for all
  /// players who are currently assigned to the game session. The matchmaker
  /// data is in JSON syntax, formatted as a string. For more details, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-server.html#match-server-data">
  /// Match Data</a>.
  /// </li>
  /// <li>
  /// LatencyInMs -- If the matchmaker uses player latency, include a latency
  /// value, in milliseconds, for the Region that the game session is currently
  /// in. Do not include latency values for any other Region.
  /// </li>
  /// </ul>
  ///
  /// Parameter [gameSessionArn] :
  /// A unique identifier for the game session. Use the game session ID. When
  /// using FlexMatch as a standalone matchmaking solution, this parameter is
  /// not needed.
  ///
  /// Parameter [ticketId] :
  /// A unique identifier for a matchmaking ticket. If no ticket ID is specified
  /// here, Amazon GameLift will generate one in the form of a UUID. Use this
  /// identifier to track the match backfill ticket status and retrieve match
  /// results.
  Future<StartMatchBackfillOutput> startMatchBackfill({
    required String configurationName,
    required List<Player> players,
    String? gameSessionArn,
    String? ticketId,
  }) async {
    ArgumentError.checkNotNull(configurationName, 'configurationName');
    _s.validateStringLength(
      'configurationName',
      configurationName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(players, 'players');
    _s.validateStringLength(
      'gameSessionArn',
      gameSessionArn,
      1,
      256,
    );
    _s.validateStringLength(
      'ticketId',
      ticketId,
      0,
      128,
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
  /// custom matchmaking rules. With games that use GameLift managed hosting,
  /// this operation also triggers GameLift to find hosting resources and start
  /// a new game session for the new match. Each matchmaking request includes
  /// information on one or more players and specifies the FlexMatch matchmaker
  /// to use. When a request is for multiple players, FlexMatch attempts to
  /// build a match that includes all players in the request, placing them in
  /// the same team and finding additional players as needed to fill the match.
  ///
  /// To start matchmaking, provide a unique ticket ID, specify a matchmaking
  /// configuration, and include the players to be matched. You must also
  /// include any player attributes that are required by the matchmaking
  /// configuration's rule set. If successful, a matchmaking ticket is returned
  /// with status set to <code>QUEUED</code>.
  ///
  /// Track matchmaking events to respond as needed and acquire game session
  /// connection information for successfully completed matches. Ticket status
  /// updates are tracked using event notification through Amazon Simple
  /// Notification Service (SNS), which is defined in the matchmaking
  /// configuration.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-client.html">
  /// Add FlexMatch to a game client</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html">
  /// Set Up FlexMatch event notification</a>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/gamelift-match.html">
  /// How GameLift FlexMatch works</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>StartMatchmaking</a> | <a>DescribeMatchmaking</a> |
  /// <a>StopMatchmaking</a> | <a>AcceptMatch</a> | <a>StartMatchBackfill</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required String configurationName,
    required List<Player> players,
    String? ticketId,
  }) async {
    ArgumentError.checkNotNull(configurationName, 'configurationName');
    _s.validateStringLength(
      'configurationName',
      configurationName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(players, 'players');
    _s.validateStringLength(
      'ticketId',
      ticketId,
      0,
      128,
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

  /// Suspends certain types of activity in a fleet location. Currently, this
  /// operation is used to stop auto-scaling activity. For multi-location
  /// fleets, fleet actions are managed separately for each location.
  ///
  /// Stopping fleet actions has several potential purposes. It allows you to
  /// temporarily stop auto-scaling activity but retain your scaling policies
  /// for use in the future. For multi-location fleets, you can set up
  /// fleet-wide auto-scaling, and then opt out of it for certain locations.
  ///
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To stop actions on instances in the fleet's home Region, provide a fleet
  /// ID and the type of actions to suspend.
  /// </li>
  /// <li>
  /// To stop actions on instances in one of the fleet's remote locations,
  /// provide a fleet ID, a location name, and the type of actions to suspend.
  /// </li>
  /// </ul>
  /// If successful, GameLift no longer initiates scaling events except in
  /// response to manual changes using <a>UpdateFleetCapacity</a>. You can view
  /// a fleet's stopped actions using <a>DescribeFleetAttributes</a> or
  /// <a>DescribeFleetLocationAttributes</a>. Suspended activity can be
  /// restarted using <a>StartFleetActions</a>.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift Fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleet</a> | <a>UpdateFleetCapacity</a> | <a>PutScalingPolicy</a>
  /// | <a>DescribeEC2InstanceLimits</a> | <a>DescribeFleetAttributes</a> |
  /// <a>DescribeFleetLocationAttributes</a> | <a>UpdateFleetAttributes</a> |
  /// <a>StopFleetActions</a> | <a>DeleteFleet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A unique identifier for the fleet to stop actions on. You can use either
  /// the fleet ID or ARN value.
  ///
  /// Parameter [location] :
  /// The fleet location to stop fleet actions for. Specify a location in the
  /// form of an AWS Region code, such as <code>us-west-2</code>.
  Future<StopFleetActionsOutput> stopFleetActions({
    required List<FleetAction> actions,
    required String fleetId,
    String? location,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
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
        'Actions': actions.map((e) => e.toValue()).toList(),
        'FleetId': fleetId,
        if (location != null) 'Location': location,
      },
    );

    return StopFleetActionsOutput.fromJson(jsonResponse.body);
  }

  /// Cancels a game session placement that is in <code>PENDING</code> status.
  /// To stop a placement, provide the placement ID values. If successful, the
  /// placement is moved to <code>CANCELLED</code> status.
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSession</a> | <a>DescribeGameSessions</a> |
  /// <a>DescribeGameSessionDetails</a> | <a>SearchGameSessions</a> |
  /// <a>UpdateGameSession</a> | <a>GetGameSessionLogUrl</a> |
  /// <a>StartGameSessionPlacement</a> | <a>DescribeGameSessionPlacement</a> |
  /// <a>StopGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [placementId] :
  /// A unique identifier for a game session placement to cancel.
  Future<StopGameSessionPlacementOutput> stopGameSessionPlacement({
    required String placementId,
  }) async {
    ArgumentError.checkNotNull(placementId, 'placementId');
    _s.validateStringLength(
      'placementId',
      placementId,
      1,
      48,
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
  /// Add FlexMatch to a game client</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>StartMatchmaking</a> | <a>DescribeMatchmaking</a> |
  /// <a>StopMatchmaking</a> | <a>AcceptMatch</a> | <a>StartMatchBackfill</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [ticketId] :
  /// A unique identifier for a matchmaking ticket.
  Future<void> stopMatchmaking({
    required String ticketId,
  }) async {
    ArgumentError.checkNotNull(ticketId, 'ticketId');
    _s.validateStringLength(
      'ticketId',
      ticketId,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GameLift.StopMatchmaking'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TicketId': ticketId,
      },
    );
  }

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameServerGroup</a> | <a>ListGameServerGroups</a> |
  /// <a>DescribeGameServerGroup</a> | <a>UpdateGameServerGroup</a> |
  /// <a>DeleteGameServerGroup</a> | <a>ResumeGameServerGroup</a> |
  /// <a>SuspendGameServerGroup</a> | <a>DescribeGameServerInstances</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
    required String gameServerGroupName,
    required List<GameServerGroupAction> suspendActions,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
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
        'SuspendActions': suspendActions.map((e) => e.toValue()).toList(),
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
  /// <b>Related actions</b>
  ///
  /// <a>TagResource</a> | <a>UntagResource</a> | <a>ListTagsForResource</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required String resourceARN,
    required List<Tag> tags,
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
    await _protocol.send(
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
  /// <b>Related actions</b>
  ///
  /// <a>TagResource</a> | <a>UntagResource</a> | <a>ListTagsForResource</a> |
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required String resourceARN,
    required List<String> tagKeys,
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
    await _protocol.send(
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
  }

  /// Updates properties for an alias. To update properties, specify the alias
  /// ID to be updated and provide the information to be changed. To reassign an
  /// alias to another fleet, provide an updated routing strategy. If
  /// successful, the updated alias record is returned.
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateAlias</a> | <a>ListAliases</a> | <a>DescribeAlias</a> |
  /// <a>UpdateAlias</a> | <a>DeleteAlias</a> | <a>ResolveAlias</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
    required String aliasId,
    String? description,
    String? name,
    RoutingStrategy? routingStrategy,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateBuild</a> | <a>ListBuilds</a> | <a>DescribeBuild</a> |
  /// <a>UpdateBuild</a> | <a>DeleteBuild</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [buildId] :
  /// A unique identifier for the build to update. You can use either the build
  /// ID or ARN value.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a build. Build names do not
  /// need to be unique.
  ///
  /// Parameter [version] :
  /// Version information that is associated with a build or script. Version
  /// strings do not need to be unique.
  Future<UpdateBuildOutput> updateBuild({
    required String buildId,
    String? name,
    String? version,
  }) async {
    ArgumentError.checkNotNull(buildId, 'buildId');
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

  /// Updates a fleet's mutable attributes, including game session protection
  /// and resource creation limits.
  ///
  /// To update fleet attributes, specify the fleet ID and the property values
  /// that you want to change.
  ///
  /// If successful, an updated <code>FleetAttributes</code> object is returned.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleetLocations</a> | <a>UpdateFleetAttributes</a> |
  /// <a>UpdateFleetCapacity</a> | <a>UpdateFleetPortSettings</a> |
  /// <a>UpdateRuntimeConfiguration</a> | <a>StopFleetActions</a> |
  /// <a>StartFleetActions</a> | <a>PutScalingPolicy</a> | <a>DeleteFleet</a> |
  /// <a>DeleteFleetLocations</a> | <a>DeleteScalingPolicy</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A unique identifier for the fleet to update attribute metadata for. You
  /// can use either the fleet ID or ARN value.
  ///
  /// Parameter [description] :
  /// A human-readable description of a fleet.
  ///
  /// Parameter [metricGroups] :
  /// The name of a metric group to add this fleet to. Use a metric group in
  /// Amazon CloudWatch to aggregate the metrics from multiple fleets. Provide
  /// an existing metric group name, or create a new metric group by providing a
  /// new name. A fleet can only be in one metric group at a time.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a fleet. Fleet names do not
  /// need to be unique.
  ///
  /// Parameter [newGameSessionProtectionPolicy] :
  /// The game session protection policy to apply to all new instances created
  /// in this fleet. Instances that already exist are not affected. You can set
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
  /// Policy settings that limit the number of game sessions an individual
  /// player can create over a span of time.
  Future<UpdateFleetAttributesOutput> updateFleetAttributes({
    required String fleetId,
    String? description,
    List<String>? metricGroups,
    String? name,
    ProtectionPolicy? newGameSessionProtectionPolicy,
    ResourceCreationLimitPolicy? resourceCreationLimitPolicy,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
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

  /// Updates capacity settings for a fleet. For fleets with multiple locations,
  /// use this operation to manage capacity settings in each location
  /// individually. Fleet capacity determines the number of game sessions and
  /// players that can be hosted based on the fleet configuration. Use this
  /// operation to set the following fleet capacity properties:
  ///
  /// <ul>
  /// <li>
  /// Minimum/maximum size: Set hard limits on fleet capacity. GameLift cannot
  /// set the fleet's capacity to a value outside of this range, whether the
  /// capacity is changed manually or through automatic scaling.
  /// </li>
  /// <li>
  /// Desired capacity: Manually set the number of EC2 instances to be
  /// maintained in a fleet location. Before changing a fleet's desired
  /// capacity, you may want to call <a>DescribeEC2InstanceLimits</a> to get the
  /// maximum capacity of the fleet's EC2 instance type. Alternatively, consider
  /// using automatic scaling to adjust capacity based on player demand.
  /// </li>
  /// </ul>
  /// This operation can be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// To update capacity for a fleet's home Region, or if the fleet has no
  /// remote locations, omit the <code>Location</code> parameter. The fleet must
  /// be in <code>ACTIVE</code> status.
  /// </li>
  /// <li>
  /// To update capacity for a fleet's remote location, include the
  /// <code>Location</code> parameter set to the location to be updated. The
  /// location must be in <code>ACTIVE</code> status.
  /// </li>
  /// </ul>
  /// If successful, capacity settings are updated immediately. In response a
  /// change in desired capacity, GameLift initiates steps to start new
  /// instances or terminate existing instances in the requested fleet location.
  /// This continues until the location's active instance count matches the new
  /// desired instance count. You can track a fleet's current capacity by
  /// calling <a>DescribeFleetCapacity</a> or
  /// <a>DescribeFleetLocationCapacity</a>. If the requested desired instance
  /// count is higher than the instance type's limit, the
  /// <code>LimitExceeded</code> exception occurs.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-manage-capacity.html">Scaling
  /// fleet capacity</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleetLocations</a> | <a>UpdateFleetAttributes</a> |
  /// <a>UpdateFleetCapacity</a> | <a>UpdateFleetPortSettings</a> |
  /// <a>UpdateRuntimeConfiguration</a> | <a>StopFleetActions</a> |
  /// <a>StartFleetActions</a> | <a>PutScalingPolicy</a> | <a>DeleteFleet</a> |
  /// <a>DeleteFleetLocations</a> | <a>DeleteScalingPolicy</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A unique identifier for the fleet to update capacity settings for. You can
  /// use either the fleet ID or ARN value.
  ///
  /// Parameter [desiredInstances] :
  /// The number of EC2 instances you want to maintain in the specified fleet
  /// location. This value must fall between the minimum and maximum size
  /// limits.
  ///
  /// Parameter [location] :
  /// The name of a remote location to update fleet capacity settings for, in
  /// the form of an AWS Region code such as <code>us-west-2</code>.
  ///
  /// Parameter [maxSize] :
  /// The maximum number of instances that are allowed in the specified fleet
  /// location. If this parameter is not set, the default is 1.
  ///
  /// Parameter [minSize] :
  /// The minimum number of instances that are allowed in the specified fleet
  /// location. If this parameter is not set, the default is 0.
  Future<UpdateFleetCapacityOutput> updateFleetCapacity({
    required String fleetId,
    int? desiredInstances,
    String? location,
    int? maxSize,
    int? minSize,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
    _s.validateNumRange(
      'desiredInstances',
      desiredInstances,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'location',
      location,
      1,
      64,
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
        if (location != null) 'Location': location,
        if (maxSize != null) 'MaxSize': maxSize,
        if (minSize != null) 'MinSize': minSize,
      },
    );

    return UpdateFleetCapacityOutput.fromJson(jsonResponse.body);
  }

  /// Updates permissions that allow inbound traffic to connect to game sessions
  /// that are being hosted on instances in the fleet.
  ///
  /// To update settings, specify the fleet ID to be updated and specify the
  /// changes to be made. List the permissions you want to add in
  /// <code>InboundPermissionAuthorizations</code>, and permissions you want to
  /// remove in <code>InboundPermissionRevocations</code>. Permissions to be
  /// removed must match existing fleet permissions.
  ///
  /// If successful, the fleet ID for the updated fleet is returned. For fleets
  /// with remote locations, port setting updates can take time to propagate
  /// across all locations. You can check the status of updates in each location
  /// by calling <code>DescribeFleetPortSettings</code> with a location name.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleetLocations</a> | <a>UpdateFleetAttributes</a> |
  /// <a>UpdateFleetCapacity</a> | <a>UpdateFleetPortSettings</a> |
  /// <a>UpdateRuntimeConfiguration</a> | <a>StopFleetActions</a> |
  /// <a>StartFleetActions</a> | <a>PutScalingPolicy</a> | <a>DeleteFleet</a> |
  /// <a>DeleteFleetLocations</a> | <a>DeleteScalingPolicy</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A unique identifier for the fleet to update port settings for. You can use
  /// either the fleet ID or ARN value.
  ///
  /// Parameter [inboundPermissionAuthorizations] :
  /// A collection of port settings to be added to the fleet resource.
  ///
  /// Parameter [inboundPermissionRevocations] :
  /// A collection of port settings to be removed from the fleet resource.
  Future<UpdateFleetPortSettingsOutput> updateFleetPortSettings({
    required String fleetId,
    List<IpPermission>? inboundPermissionAuthorizations,
    List<IpPermission>? inboundPermissionRevocations,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
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

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>RegisterGameServer</a> | <a>ListGameServers</a> |
  /// <a>ClaimGameServer</a> | <a>DescribeGameServer</a> |
  /// <a>UpdateGameServer</a> | <a>DeregisterGameServer</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
    required String gameServerGroupName,
    required String gameServerId,
    String? gameServerData,
    GameServerHealthCheck? healthCheck,
    GameServerUtilizationStatus? utilizationStatus,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
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
    _s.validateStringLength(
      'gameServerData',
      gameServerData,
      1,
      1024,
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

  /// <b>This operation is used with the GameLift FleetIQ solution and game
  /// server groups.</b>
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameServerGroup</a> | <a>ListGameServerGroups</a> |
  /// <a>DescribeGameServerGroup</a> | <a>UpdateGameServerGroup</a> |
  /// <a>DeleteGameServerGroup</a> | <a>ResumeGameServerGroup</a> |
  /// <a>SuspendGameServerGroup</a> | <a>DescribeGameServerInstances</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
  /// APIs by task</a>
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
    required String gameServerGroupName,
    BalancingStrategy? balancingStrategy,
    GameServerProtectionPolicy? gameServerProtectionPolicy,
    List<InstanceDefinition>? instanceDefinitions,
    String? roleArn,
  }) async {
    ArgumentError.checkNotNull(gameServerGroupName, 'gameServerGroupName');
    _s.validateStringLength(
      'gameServerGroupName',
      gameServerGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      256,
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

  /// Updates the mutable properties of a game session.
  ///
  /// To update a game session, specify the game session ID and the values you
  /// want to change.
  ///
  /// If successful, the updated <code>GameSession</code> object is returned.
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSession</a> | <a>DescribeGameSessions</a> |
  /// <a>DescribeGameSessionDetails</a> | <a>SearchGameSessions</a> |
  /// <a>UpdateGameSession</a> | <a>GetGameSessionLogUrl</a> |
  /// <a>StartGameSessionPlacement</a> | <a>DescribeGameSessionPlacement</a> |
  /// <a>StopGameSessionPlacement</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// A policy that determines whether the game session is accepting new
  /// players.
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
    required String gameSessionId,
    int? maximumPlayerSessionCount,
    String? name,
    PlayerSessionCreationPolicy? playerSessionCreationPolicy,
    ProtectionPolicy? protectionPolicy,
  }) async {
    ArgumentError.checkNotNull(gameSessionId, 'gameSessionId');
    _s.validateStringLength(
      'gameSessionId',
      gameSessionId,
      1,
      256,
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

  /// Updates the configuration of a game session queue, which determines how
  /// the queue processes new game session requests. To update settings, specify
  /// the queue name to be updated and provide the new settings. When updating
  /// destinations, provide a complete list of destinations.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-intro.html">
  /// Using Multi-Region Queues</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateGameSessionQueue</a> | <a>DescribeGameSessionQueues</a> |
  /// <a>UpdateGameSessionQueue</a> | <a>DeleteGameSessionQueue</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
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
  /// Parameter [customEventData] :
  /// Information to be added to all events that are related to this game
  /// session queue.
  ///
  /// Parameter [destinations] :
  /// A list of fleets and/or fleet aliases that can be used to fulfill game
  /// session placement requests in the queue. Destinations are identified by
  /// either a fleet ARN or a fleet alias ARN, and are listed in order of
  /// placement preference. When updating this list, provide a complete list of
  /// destinations.
  ///
  /// Parameter [filterConfiguration] :
  /// A list of locations where a queue is allowed to place new game sessions.
  /// Locations are specified in the form of AWS Region codes, such as
  /// <code>us-west-2</code>. If this parameter is not set, game sessions can be
  /// placed in any queue location. To remove an existing filter configuration,
  /// pass in an empty set.
  ///
  /// Parameter [notificationTarget] :
  /// An SNS topic ARN that is set up to receive game session placement
  /// notifications. See <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queue-notification.html">
  /// Setting up notifications for game session placement</a>.
  ///
  /// Parameter [playerLatencyPolicies] :
  /// A set of policies that act as a sliding cap on player latency. FleetIQ
  /// works to deliver low latency for most players in a game session. These
  /// policies ensure that no individual player can be placed into a game with
  /// unreasonably high latency. Use multiple policies to gradually relax
  /// latency requirements a step at a time. Multiple policies are applied based
  /// on their maximum allowed latency, starting with the lowest value. When
  /// updating policies, provide a complete collection of policies.
  ///
  /// Parameter [priorityConfiguration] :
  /// Custom settings to use when prioritizing destinations and locations for
  /// game session placements. This configuration replaces the FleetIQ default
  /// prioritization process. Priority types that are not explicitly named will
  /// be automatically applied at the end of the prioritization process. To
  /// remove an existing priority configuration, pass in an empty set.
  ///
  /// Parameter [timeoutInSeconds] :
  /// The maximum time, in seconds, that a new game session placement request
  /// remains in the queue. When a request exceeds this time, the game session
  /// placement changes to a <code>TIMED_OUT</code> status.
  Future<UpdateGameSessionQueueOutput> updateGameSessionQueue({
    required String name,
    String? customEventData,
    List<GameSessionQueueDestination>? destinations,
    FilterConfiguration? filterConfiguration,
    String? notificationTarget,
    List<PlayerLatencyPolicy>? playerLatencyPolicies,
    PriorityConfiguration? priorityConfiguration,
    int? timeoutInSeconds,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'customEventData',
      customEventData,
      0,
      256,
    );
    _s.validateStringLength(
      'notificationTarget',
      notificationTarget,
      0,
      300,
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
        if (customEventData != null) 'CustomEventData': customEventData,
        if (destinations != null) 'Destinations': destinations,
        if (filterConfiguration != null)
          'FilterConfiguration': filterConfiguration,
        if (notificationTarget != null)
          'NotificationTarget': notificationTarget,
        if (playerLatencyPolicies != null)
          'PlayerLatencyPolicies': playerLatencyPolicies,
        if (priorityConfiguration != null)
          'PriorityConfiguration': priorityConfiguration,
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
  /// Design a FlexMatch matchmaker</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateMatchmakingConfiguration</a> |
  /// <a>DescribeMatchmakingConfigurations</a> |
  /// <a>UpdateMatchmakingConfiguration</a> |
  /// <a>DeleteMatchmakingConfiguration</a> | <a>CreateMatchmakingRuleSet</a> |
  /// <a>DescribeMatchmakingRuleSets</a> | <a>ValidateMatchmakingRuleSet</a> |
  /// <a>DeleteMatchmakingRuleSet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  ///
  /// Parameter [name] :
  /// A unique identifier for the matchmaking configuration to update. You can
  /// use either the configuration name or ARN value.
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
  /// match, if acceptance is required.
  ///
  /// Parameter [additionalPlayerCount] :
  /// The number of player slots in a match to keep open for future players. For
  /// example, if the configuration's rule set specifies a match for a single
  /// 12-person team, and the additional player count is set to 2, only 10
  /// players are selected for the match. This parameter is not used if
  /// <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
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
  /// A set of custom properties for a game session, formatted as key:value
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
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift game session queue resource and uniquely
  /// identifies it. ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::gamesessionqueue/&lt;queue
  /// name&gt;</code>. Queues can be located in any Region. Queues are used to
  /// start new GameLift-hosted game sessions for matches that are created with
  /// this matchmaking configuration. If <code>FlexMatchMode</code> is set to
  /// <code>STANDALONE</code>, do not set this parameter.
  ///
  /// Parameter [notificationTarget] :
  /// An SNS topic ARN that is set up to receive matchmaking notifications. See
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html">
  /// Setting up notifications for matchmaking</a> for more information.
  ///
  /// Parameter [requestTimeoutSeconds] :
  /// The maximum duration, in seconds, that a matchmaking ticket can remain in
  /// process before timing out. Requests that fail due to timing out can be
  /// resubmitted as needed.
  ///
  /// Parameter [ruleSetName] :
  /// A unique identifier for the matchmaking rule set to use with this
  /// configuration. You can use either the rule set name or ARN value. A
  /// matchmaking configuration can only use rule sets that are defined in the
  /// same Region.
  Future<UpdateMatchmakingConfigurationOutput> updateMatchmakingConfiguration({
    required String name,
    bool? acceptanceRequired,
    int? acceptanceTimeoutSeconds,
    int? additionalPlayerCount,
    BackfillMode? backfillMode,
    String? customEventData,
    String? description,
    FlexMatchMode? flexMatchMode,
    List<GameProperty>? gameProperties,
    String? gameSessionData,
    List<String>? gameSessionQueueArns,
    String? notificationTarget,
    int? requestTimeoutSeconds,
    String? ruleSetName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
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
  /// tells GameLift how to launch server processes on all instances in the
  /// fleet. You can update a fleet's runtime configuration at any time after
  /// the fleet is created; it does not need to be in <code>ACTIVE</code>
  /// status.
  ///
  /// To update runtime configuration, specify the fleet ID and provide a
  /// <code>RuntimeConfiguration</code> with an updated set of server process
  /// configurations.
  ///
  /// If successful, the fleet's runtime configuration settings are updated.
  /// Each instance in the fleet regularly checks for and retrieves updated
  /// runtime configurations. Instances immediately begin complying with the new
  /// configuration by launching new server processes or not replacing existing
  /// processes when they shut down. Updating a fleet's runtime configuration
  /// never affects existing server processes.
  ///
  /// <b>Learn more</b>
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html">Setting
  /// up GameLift fleets</a>
  ///
  /// <b>Related actions</b>
  ///
  /// <a>CreateFleetLocations</a> | <a>UpdateFleetAttributes</a> |
  /// <a>UpdateFleetCapacity</a> | <a>UpdateFleetPortSettings</a> |
  /// <a>UpdateRuntimeConfiguration</a> | <a>StopFleetActions</a> |
  /// <a>StartFleetActions</a> | <a>PutScalingPolicy</a> | <a>DeleteFleet</a> |
  /// <a>DeleteFleetLocations</a> | <a>DeleteScalingPolicy</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidFleetStatusException].
  ///
  /// Parameter [fleetId] :
  /// A unique identifier for the fleet to update runtime configuration for. You
  /// can use either the fleet ID or ARN value.
  ///
  /// Parameter [runtimeConfiguration] :
  /// Instructions for launching server processes on each instance in the fleet.
  /// Server processes run either a custom game build executable or a Realtime
  /// Servers script. The runtime configuration lists the types of server
  /// processes to run on an instance, how to launch them, and the number of
  /// processes to run concurrently.
  Future<UpdateRuntimeConfigurationOutput> updateRuntimeConfiguration({
    required String fleetId,
    required RuntimeConfiguration runtimeConfiguration,
  }) async {
    ArgumentError.checkNotNull(fleetId, 'fleetId');
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
  /// <b>Related actions</b>
  ///
  /// <a>CreateScript</a> | <a>ListScripts</a> | <a>DescribeScript</a> |
  /// <a>UpdateScript</a> | <a>DeleteScript</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidRequestException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [scriptId] :
  /// A unique identifier for the Realtime script to update. You can use either
  /// the script ID or ARN value.
  ///
  /// Parameter [name] :
  /// A descriptive label that is associated with a script. Script names do not
  /// need to be unique.
  ///
  /// Parameter [storageLocation] :
  /// The location of the Amazon S3 bucket where a zipped file containing your
  /// Realtime scripts is stored. The storage location must specify the Amazon
  /// S3 bucket name, the zip file name (the "key"), and a role ARN that allows
  /// Amazon GameLift to access the Amazon S3 storage location. The S3 bucket
  /// must be in the same Region where you want to create a new script. By
  /// default, Amazon GameLift uploads the latest version of the zip file; if
  /// you have S3 object versioning turned on, you can use the
  /// <code>ObjectVersion</code> parameter to specify an earlier version.
  ///
  /// Parameter [version] :
  /// Version information that is associated with a build or script. Version
  /// strings do not need to be unique.
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
    required String scriptId,
    String? name,
    S3Location? storageLocation,
    String? version,
    Uint8List? zipFile,
  }) async {
    ArgumentError.checkNotNull(scriptId, 'scriptId');
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
  /// a rule set</a>
  /// </li>
  /// </ul>
  /// <b>Related actions</b>
  ///
  /// <a>CreateMatchmakingConfiguration</a> |
  /// <a>DescribeMatchmakingConfigurations</a> |
  /// <a>UpdateMatchmakingConfiguration</a> |
  /// <a>DeleteMatchmakingConfiguration</a> | <a>CreateMatchmakingRuleSet</a> |
  /// <a>DescribeMatchmakingRuleSets</a> | <a>ValidateMatchmakingRuleSet</a> |
  /// <a>DeleteMatchmakingRuleSet</a> | <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
  /// APIs by task</a>
  ///
  /// May throw [InternalServiceException].
  /// May throw [UnsupportedRegionException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [ruleSetBody] :
  /// A collection of matchmaking rules to validate, formatted as a JSON string.
  Future<ValidateMatchmakingRuleSetOutput> validateMatchmakingRuleSet({
    required String ruleSetBody,
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

class AcceptMatchOutput {
  AcceptMatchOutput();

  factory AcceptMatchOutput.fromJson(Map<String, dynamic> _) {
    return AcceptMatchOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum AcceptanceType {
  accept,
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
  }
}

extension on String {
  AcceptanceType toAcceptanceType() {
    switch (this) {
      case 'ACCEPT':
        return AcceptanceType.accept;
      case 'REJECT':
        return AcceptanceType.reject;
    }
    throw Exception('$this is not known in enum AcceptanceType');
  }
}

/// Properties that describe an alias resource.
///
/// <b>Related actions</b>
///
/// <a>CreateAlias</a> | <a>ListAliases</a> | <a>DescribeAlias</a> |
/// <a>UpdateAlias</a> | <a>DeleteAlias</a> | <a>ResolveAlias</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class Alias {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift alias resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::alias/alias-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  /// In a GameLift alias ARN, the resource ID matches the alias ID value.
  final String? aliasArn;

  /// A unique identifier for the alias. Alias IDs are unique within a Region.
  final String? aliasId;

  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// A human-readable description of an alias.
  final String? description;

  /// The time that this data object was last modified. Format is a number
  /// expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? lastUpdatedTime;

  /// A descriptive label that is associated with an alias. Alias names do not
  /// need to be unique.
  final String? name;

  /// The routing configuration, including routing type and fleet target, for the
  /// alias.
  final RoutingStrategy? routingStrategy;

  Alias({
    this.aliasArn,
    this.aliasId,
    this.creationTime,
    this.description,
    this.lastUpdatedTime,
    this.name,
    this.routingStrategy,
  });

  factory Alias.fromJson(Map<String, dynamic> json) {
    return Alias(
      aliasArn: json['AliasArn'] as String?,
      aliasId: json['AliasId'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      routingStrategy: json['RoutingStrategy'] != null
          ? RoutingStrategy.fromJson(
              json['RoutingStrategy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasArn = this.aliasArn;
    final aliasId = this.aliasId;
    final creationTime = this.creationTime;
    final description = this.description;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final routingStrategy = this.routingStrategy;
    return {
      if (aliasArn != null) 'AliasArn': aliasArn,
      if (aliasId != null) 'AliasId': aliasId,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (routingStrategy != null) 'RoutingStrategy': routingStrategy,
    };
  }
}

/// Values for use in <a>Player</a> attribute key-value pairs. This object lets
/// you specify an attribute value using any of the valid data types: string,
/// number, string array, or data map. Each <code>AttributeValue</code> object
/// can use only one of the available properties.
class AttributeValue {
  /// For number values, expressed as double.
  final double? n;

  /// For single string values. Maximum string length is 100 characters.
  final String? s;

  /// For a map of up to 10 data type:value pairs. Maximum length for each string
  /// value is 100 characters.
  final Map<String, double>? sdm;

  /// For a list of up to 10 strings. Maximum length for each string is 100
  /// characters. Duplicate values are not recognized; all occurrences of the
  /// repeated value after the first of a repeated value are ignored.
  final List<String>? sl;

  AttributeValue({
    this.n,
    this.s,
    this.sdm,
    this.sl,
  });

  factory AttributeValue.fromJson(Map<String, dynamic> json) {
    return AttributeValue(
      n: json['N'] as double?,
      s: json['S'] as String?,
      sdm: (json['SDM'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as double)),
      sl: (json['SL'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final n = this.n;
    final s = this.s;
    final sdm = this.sdm;
    final sl = this.sl;
    return {
      if (n != null) 'N': n,
      if (s != null) 'S': s,
      if (sdm != null) 'SDM': sdm,
      if (sl != null) 'SL': sl,
    };
  }
}

/// Temporary access credentials used for uploading game build files to Amazon
/// GameLift. They are valid for a limited time. If they expire before you
/// upload your game build, get a new set by calling
/// <a>RequestUploadCredentials</a>.
class AwsCredentials {
  /// Temporary key allowing access to the Amazon GameLift S3 account.
  final String? accessKeyId;

  /// Temporary secret key allowing access to the Amazon GameLift S3 account.
  final String? secretAccessKey;

  /// Token used to associate a specific build ID with the files uploaded using
  /// these credentials.
  final String? sessionToken;

  AwsCredentials({
    this.accessKeyId,
    this.secretAccessKey,
    this.sessionToken,
  });

  factory AwsCredentials.fromJson(Map<String, dynamic> json) {
    return AwsCredentials(
      accessKeyId: json['AccessKeyId'] as String?,
      secretAccessKey: json['SecretAccessKey'] as String?,
      sessionToken: json['SessionToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      if (accessKeyId != null) 'AccessKeyId': accessKeyId,
      if (secretAccessKey != null) 'SecretAccessKey': secretAccessKey,
      if (sessionToken != null) 'SessionToken': sessionToken,
    };
  }
}

enum BackfillMode {
  automatic,
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
  }
}

extension on String {
  BackfillMode toBackfillMode() {
    switch (this) {
      case 'AUTOMATIC':
        return BackfillMode.automatic;
      case 'MANUAL':
        return BackfillMode.manual;
    }
    throw Exception('$this is not known in enum BackfillMode');
  }
}

enum BalancingStrategy {
  spotOnly,
  spotPreferred,
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
  }
}

extension on String {
  BalancingStrategy toBalancingStrategy() {
    switch (this) {
      case 'SPOT_ONLY':
        return BalancingStrategy.spotOnly;
      case 'SPOT_PREFERRED':
        return BalancingStrategy.spotPreferred;
      case 'ON_DEMAND_ONLY':
        return BalancingStrategy.onDemandOnly;
    }
    throw Exception('$this is not known in enum BalancingStrategy');
  }
}

/// Properties describing a custom game build.
///
/// <b>Related actions</b>
///
/// <a>CreateBuild</a> | <a>ListBuilds</a> | <a>DescribeBuild</a> |
/// <a>UpdateBuild</a> | <a>DeleteBuild</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class Build {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift build resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::build/build-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  /// In a GameLift build ARN, the resource ID matches the <i>BuildId</i> value.
  final String? buildArn;

  /// A unique identifier for the build.
  final String? buildId;

  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// A descriptive label that is associated with a build. Build names do not need
  /// to be unique. It can be set using <a>CreateBuild</a> or <a>UpdateBuild</a>.
  final String? name;

  /// Operating system that the game server binaries are built to run on. This
  /// value determines the type of fleet resources that you can use for this
  /// build.
  final OperatingSystem? operatingSystem;

  /// File size of the uploaded game build, expressed in bytes. When the build
  /// status is <code>INITIALIZED</code>, this value is 0.
  final int? sizeOnDisk;

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
  final BuildStatus? status;

  /// Version information that is associated with a build or script. Version
  /// strings do not need to be unique. This value can be set using
  /// <a>CreateBuild</a> or <a>UpdateBuild</a>.
  final String? version;

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

  factory Build.fromJson(Map<String, dynamic> json) {
    return Build(
      buildArn: json['BuildArn'] as String?,
      buildId: json['BuildId'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      name: json['Name'] as String?,
      operatingSystem:
          (json['OperatingSystem'] as String?)?.toOperatingSystem(),
      sizeOnDisk: json['SizeOnDisk'] as int?,
      status: (json['Status'] as String?)?.toBuildStatus(),
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final buildArn = this.buildArn;
    final buildId = this.buildId;
    final creationTime = this.creationTime;
    final name = this.name;
    final operatingSystem = this.operatingSystem;
    final sizeOnDisk = this.sizeOnDisk;
    final status = this.status;
    final version = this.version;
    return {
      if (buildArn != null) 'BuildArn': buildArn,
      if (buildId != null) 'BuildId': buildId,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (name != null) 'Name': name,
      if (operatingSystem != null) 'OperatingSystem': operatingSystem.toValue(),
      if (sizeOnDisk != null) 'SizeOnDisk': sizeOnDisk,
      if (status != null) 'Status': status.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

enum BuildStatus {
  initialized,
  ready,
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
  }
}

extension on String {
  BuildStatus toBuildStatus() {
    switch (this) {
      case 'INITIALIZED':
        return BuildStatus.initialized;
      case 'READY':
        return BuildStatus.ready;
      case 'FAILED':
        return BuildStatus.failed;
    }
    throw Exception('$this is not known in enum BuildStatus');
  }
}

/// Determines whether a TLS/SSL certificate is generated for a fleet. This
/// feature must be enabled when creating the fleet. All instances in a fleet
/// share the same certificate. The certificate can be retrieved by calling the
/// <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk.html">GameLift
/// Server SDK</a> operation <code>GetInstanceCertificate</code>.
///
/// A fleet's certificate configuration is part of <a>FleetAttributes</a>.
class CertificateConfiguration {
  /// Indicates whether a TLS/SSL certificate is generated for a fleet.
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
  final CertificateType certificateType;

  CertificateConfiguration({
    required this.certificateType,
  });

  factory CertificateConfiguration.fromJson(Map<String, dynamic> json) {
    return CertificateConfiguration(
      certificateType: (json['CertificateType'] as String).toCertificateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateType = this.certificateType;
    return {
      'CertificateType': certificateType.toValue(),
    };
  }
}

enum CertificateType {
  disabled,
  generated,
}

extension on CertificateType {
  String toValue() {
    switch (this) {
      case CertificateType.disabled:
        return 'DISABLED';
      case CertificateType.generated:
        return 'GENERATED';
    }
  }
}

extension on String {
  CertificateType toCertificateType() {
    switch (this) {
      case 'DISABLED':
        return CertificateType.disabled;
      case 'GENERATED':
        return CertificateType.generated;
    }
    throw Exception('$this is not known in enum CertificateType');
  }
}

class ClaimGameServerOutput {
  /// Object that describes the newly claimed game server.
  final GameServer? gameServer;

  ClaimGameServerOutput({
    this.gameServer,
  });

  factory ClaimGameServerOutput.fromJson(Map<String, dynamic> json) {
    return ClaimGameServerOutput(
      gameServer: json['GameServer'] != null
          ? GameServer.fromJson(json['GameServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServer = this.gameServer;
    return {
      if (gameServer != null) 'GameServer': gameServer,
    };
  }
}

enum ComparisonOperatorType {
  greaterThanOrEqualToThreshold,
  greaterThanThreshold,
  lessThanThreshold,
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
  }
}

extension on String {
  ComparisonOperatorType toComparisonOperatorType() {
    switch (this) {
      case 'GreaterThanOrEqualToThreshold':
        return ComparisonOperatorType.greaterThanOrEqualToThreshold;
      case 'GreaterThanThreshold':
        return ComparisonOperatorType.greaterThanThreshold;
      case 'LessThanThreshold':
        return ComparisonOperatorType.lessThanThreshold;
      case 'LessThanOrEqualToThreshold':
        return ComparisonOperatorType.lessThanOrEqualToThreshold;
    }
    throw Exception('$this is not known in enum ComparisonOperatorType');
  }
}

/// Represents the returned data in response to a request operation.
class CreateAliasOutput {
  /// The newly created alias resource.
  final Alias? alias;

  CreateAliasOutput({
    this.alias,
  });

  factory CreateAliasOutput.fromJson(Map<String, dynamic> json) {
    return CreateAliasOutput(
      alias: json['Alias'] != null
          ? Alias.fromJson(json['Alias'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    return {
      if (alias != null) 'Alias': alias,
    };
  }
}

/// Represents the returned data in response to a request operation.
class CreateBuildOutput {
  /// The newly created build resource, including a unique build IDs and status.
  final Build? build;

  /// Amazon S3 location for your game build file, including bucket name and key.
  final S3Location? storageLocation;

  /// This element is returned only when the operation is called without a storage
  /// location. It contains credentials to use when you are uploading a build file
  /// to an Amazon S3 bucket that is owned by Amazon GameLift. Credentials have a
  /// limited life span. To refresh these credentials, call
  /// <a>RequestUploadCredentials</a>.
  final AwsCredentials? uploadCredentials;

  CreateBuildOutput({
    this.build,
    this.storageLocation,
    this.uploadCredentials,
  });

  factory CreateBuildOutput.fromJson(Map<String, dynamic> json) {
    return CreateBuildOutput(
      build: json['Build'] != null
          ? Build.fromJson(json['Build'] as Map<String, dynamic>)
          : null,
      storageLocation: json['StorageLocation'] != null
          ? S3Location.fromJson(json['StorageLocation'] as Map<String, dynamic>)
          : null,
      uploadCredentials: json['UploadCredentials'] != null
          ? AwsCredentials.fromJson(
              json['UploadCredentials'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final build = this.build;
    final storageLocation = this.storageLocation;
    final uploadCredentials = this.uploadCredentials;
    return {
      if (build != null) 'Build': build,
      if (storageLocation != null) 'StorageLocation': storageLocation,
      if (uploadCredentials != null) 'UploadCredentials': uploadCredentials,
    };
  }
}

/// Represents the returned data in response to a request operation.
class CreateFleetLocationsOutput {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet that was updated with new locations.
  final String? fleetId;

  /// The remote locations that are being added to the fleet, and the life-cycle
  /// status of each location. For new locations, the status is set to
  /// <code>NEW</code>. During location creation, GameLift updates each location's
  /// status as instances are deployed there and prepared for game hosting. This
  /// list does not include the fleet home Region or any remote locations that
  /// were already added to the fleet.
  final List<LocationState>? locationStates;

  CreateFleetLocationsOutput({
    this.fleetArn,
    this.fleetId,
    this.locationStates,
  });

  factory CreateFleetLocationsOutput.fromJson(Map<String, dynamic> json) {
    return CreateFleetLocationsOutput(
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      locationStates: (json['LocationStates'] as List?)
          ?.whereNotNull()
          .map((e) => LocationState.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final locationStates = this.locationStates;
    return {
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (locationStates != null) 'LocationStates': locationStates,
    };
  }
}

/// Represents the returned data in response to a request operation.
class CreateFleetOutput {
  /// The properties for the new fleet, including the current status. All fleets
  /// are placed in <code>NEW</code> status on creation.
  final FleetAttributes? fleetAttributes;

  /// The fleet's locations and life-cycle status of each location. For new
  /// fleets, the status of all locations is set to <code>NEW</code>. During fleet
  /// creation, GameLift updates each location status as instances are deployed
  /// there and prepared for game hosting. This list includes an entry for the
  /// fleet's home Region. For fleets with no remote locations, only one entry,
  /// representing the home Region, is returned.
  final List<LocationState>? locationStates;

  CreateFleetOutput({
    this.fleetAttributes,
    this.locationStates,
  });

  factory CreateFleetOutput.fromJson(Map<String, dynamic> json) {
    return CreateFleetOutput(
      fleetAttributes: json['FleetAttributes'] != null
          ? FleetAttributes.fromJson(
              json['FleetAttributes'] as Map<String, dynamic>)
          : null,
      locationStates: (json['LocationStates'] as List?)
          ?.whereNotNull()
          .map((e) => LocationState.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fleetAttributes = this.fleetAttributes;
    final locationStates = this.locationStates;
    return {
      if (fleetAttributes != null) 'FleetAttributes': fleetAttributes,
      if (locationStates != null) 'LocationStates': locationStates,
    };
  }
}

class CreateGameServerGroupOutput {
  /// The newly created game server group object, including the new ARN value for
  /// the GameLift FleetIQ game server group and the object's status. The EC2 Auto
  /// Scaling group ARN is initially null, since the group has not yet been
  /// created. This value is added once the game server group status reaches
  /// <code>ACTIVE</code>.
  final GameServerGroup? gameServerGroup;

  CreateGameServerGroupOutput({
    this.gameServerGroup,
  });

  factory CreateGameServerGroupOutput.fromJson(Map<String, dynamic> json) {
    return CreateGameServerGroupOutput(
      gameServerGroup: json['GameServerGroup'] != null
          ? GameServerGroup.fromJson(
              json['GameServerGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServerGroup = this.gameServerGroup;
    return {
      if (gameServerGroup != null) 'GameServerGroup': gameServerGroup,
    };
  }
}

/// Represents the returned data in response to a request operation.
class CreateGameSessionOutput {
  /// Object that describes the newly created game session record.
  final GameSession? gameSession;

  CreateGameSessionOutput({
    this.gameSession,
  });

  factory CreateGameSessionOutput.fromJson(Map<String, dynamic> json) {
    return CreateGameSessionOutput(
      gameSession: json['GameSession'] != null
          ? GameSession.fromJson(json['GameSession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSession = this.gameSession;
    return {
      if (gameSession != null) 'GameSession': gameSession,
    };
  }
}

/// Represents the returned data in response to a request operation.
class CreateGameSessionQueueOutput {
  /// An object that describes the newly created game session queue.
  final GameSessionQueue? gameSessionQueue;

  CreateGameSessionQueueOutput({
    this.gameSessionQueue,
  });

  factory CreateGameSessionQueueOutput.fromJson(Map<String, dynamic> json) {
    return CreateGameSessionQueueOutput(
      gameSessionQueue: json['GameSessionQueue'] != null
          ? GameSessionQueue.fromJson(
              json['GameSessionQueue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSessionQueue = this.gameSessionQueue;
    return {
      if (gameSessionQueue != null) 'GameSessionQueue': gameSessionQueue,
    };
  }
}

/// Represents the returned data in response to a request operation.
class CreateMatchmakingConfigurationOutput {
  /// Object that describes the newly created matchmaking configuration.
  final MatchmakingConfiguration? configuration;

  CreateMatchmakingConfigurationOutput({
    this.configuration,
  });

  factory CreateMatchmakingConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateMatchmakingConfigurationOutput(
      configuration: json['Configuration'] != null
          ? MatchmakingConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      if (configuration != null) 'Configuration': configuration,
    };
  }
}

/// Represents the returned data in response to a request operation.
class CreateMatchmakingRuleSetOutput {
  /// The newly created matchmaking rule set.
  final MatchmakingRuleSet ruleSet;

  CreateMatchmakingRuleSetOutput({
    required this.ruleSet,
  });

  factory CreateMatchmakingRuleSetOutput.fromJson(Map<String, dynamic> json) {
    return CreateMatchmakingRuleSetOutput(
      ruleSet:
          MatchmakingRuleSet.fromJson(json['RuleSet'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleSet = this.ruleSet;
    return {
      'RuleSet': ruleSet,
    };
  }
}

/// Represents the returned data in response to a request operation.
class CreatePlayerSessionOutput {
  /// Object that describes the newly created player session record.
  final PlayerSession? playerSession;

  CreatePlayerSessionOutput({
    this.playerSession,
  });

  factory CreatePlayerSessionOutput.fromJson(Map<String, dynamic> json) {
    return CreatePlayerSessionOutput(
      playerSession: json['PlayerSession'] != null
          ? PlayerSession.fromJson(
              json['PlayerSession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final playerSession = this.playerSession;
    return {
      if (playerSession != null) 'PlayerSession': playerSession,
    };
  }
}

/// Represents the returned data in response to a request operation.
class CreatePlayerSessionsOutput {
  /// A collection of player session objects created for the added players.
  final List<PlayerSession>? playerSessions;

  CreatePlayerSessionsOutput({
    this.playerSessions,
  });

  factory CreatePlayerSessionsOutput.fromJson(Map<String, dynamic> json) {
    return CreatePlayerSessionsOutput(
      playerSessions: (json['PlayerSessions'] as List?)
          ?.whereNotNull()
          .map((e) => PlayerSession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final playerSessions = this.playerSessions;
    return {
      if (playerSessions != null) 'PlayerSessions': playerSessions,
    };
  }
}

class CreateScriptOutput {
  /// The newly created script record with a unique script ID and ARN. The new
  /// script's storage location reflects an Amazon S3 location: (1) If the script
  /// was uploaded from an S3 bucket under your account, the storage location
  /// reflects the information that was provided in the <i>CreateScript</i>
  /// request; (2) If the script file was uploaded from a local zip file, the
  /// storage location reflects an S3 location controls by the Amazon GameLift
  /// service.
  final Script? script;

  CreateScriptOutput({
    this.script,
  });

  factory CreateScriptOutput.fromJson(Map<String, dynamic> json) {
    return CreateScriptOutput(
      script: json['Script'] != null
          ? Script.fromJson(json['Script'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final script = this.script;
    return {
      if (script != null) 'Script': script,
    };
  }
}

/// Represents the returned data in response to a request operation.
class CreateVpcPeeringAuthorizationOutput {
  /// Details on the requested VPC peering authorization, including expiration.
  final VpcPeeringAuthorization? vpcPeeringAuthorization;

  CreateVpcPeeringAuthorizationOutput({
    this.vpcPeeringAuthorization,
  });

  factory CreateVpcPeeringAuthorizationOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateVpcPeeringAuthorizationOutput(
      vpcPeeringAuthorization: json['VpcPeeringAuthorization'] != null
          ? VpcPeeringAuthorization.fromJson(
              json['VpcPeeringAuthorization'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcPeeringAuthorization = this.vpcPeeringAuthorization;
    return {
      if (vpcPeeringAuthorization != null)
        'VpcPeeringAuthorization': vpcPeeringAuthorization,
    };
  }
}

class CreateVpcPeeringConnectionOutput {
  CreateVpcPeeringConnectionOutput();

  factory CreateVpcPeeringConnectionOutput.fromJson(Map<String, dynamic> _) {
    return CreateVpcPeeringConnectionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the returned data in response to a request operation.
class DeleteFleetLocationsOutput {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet that location attributes are being deleted
  /// for.
  final String? fleetId;

  /// The remote locations that are being deleted, with each location status set
  /// to <code>DELETING</code>.
  final List<LocationState>? locationStates;

  DeleteFleetLocationsOutput({
    this.fleetArn,
    this.fleetId,
    this.locationStates,
  });

  factory DeleteFleetLocationsOutput.fromJson(Map<String, dynamic> json) {
    return DeleteFleetLocationsOutput(
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      locationStates: (json['LocationStates'] as List?)
          ?.whereNotNull()
          .map((e) => LocationState.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final locationStates = this.locationStates;
    return {
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (locationStates != null) 'LocationStates': locationStates,
    };
  }
}

class DeleteGameServerGroupOutput {
  /// An object that describes the deleted game server group resource, with status
  /// updated to <code>DELETE_SCHEDULED</code>.
  final GameServerGroup? gameServerGroup;

  DeleteGameServerGroupOutput({
    this.gameServerGroup,
  });

  factory DeleteGameServerGroupOutput.fromJson(Map<String, dynamic> json) {
    return DeleteGameServerGroupOutput(
      gameServerGroup: json['GameServerGroup'] != null
          ? GameServerGroup.fromJson(
              json['GameServerGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServerGroup = this.gameServerGroup;
    return {
      if (gameServerGroup != null) 'GameServerGroup': gameServerGroup,
    };
  }
}

class DeleteGameSessionQueueOutput {
  DeleteGameSessionQueueOutput();

  factory DeleteGameSessionQueueOutput.fromJson(Map<String, dynamic> _) {
    return DeleteGameSessionQueueOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMatchmakingConfigurationOutput {
  DeleteMatchmakingConfigurationOutput();

  factory DeleteMatchmakingConfigurationOutput.fromJson(
      Map<String, dynamic> _) {
    return DeleteMatchmakingConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the returned data in response to a request operation.
class DeleteMatchmakingRuleSetOutput {
  DeleteMatchmakingRuleSetOutput();

  factory DeleteMatchmakingRuleSetOutput.fromJson(Map<String, dynamic> _) {
    return DeleteMatchmakingRuleSetOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteVpcPeeringAuthorizationOutput {
  DeleteVpcPeeringAuthorizationOutput();

  factory DeleteVpcPeeringAuthorizationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteVpcPeeringAuthorizationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteVpcPeeringConnectionOutput {
  DeleteVpcPeeringConnectionOutput();

  factory DeleteVpcPeeringConnectionOutput.fromJson(Map<String, dynamic> _) {
    return DeleteVpcPeeringConnectionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the returned data in response to a request operation.
class DescribeAliasOutput {
  /// The requested alias resource.
  final Alias? alias;

  DescribeAliasOutput({
    this.alias,
  });

  factory DescribeAliasOutput.fromJson(Map<String, dynamic> json) {
    return DescribeAliasOutput(
      alias: json['Alias'] != null
          ? Alias.fromJson(json['Alias'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    return {
      if (alias != null) 'Alias': alias,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeBuildOutput {
  /// Set of properties describing the requested build.
  final Build? build;

  DescribeBuildOutput({
    this.build,
  });

  factory DescribeBuildOutput.fromJson(Map<String, dynamic> json) {
    return DescribeBuildOutput(
      build: json['Build'] != null
          ? Build.fromJson(json['Build'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final build = this.build;
    return {
      if (build != null) 'Build': build,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeEC2InstanceLimitsOutput {
  /// The maximum number of instances for the specified instance type.
  final List<EC2InstanceLimit>? eC2InstanceLimits;

  DescribeEC2InstanceLimitsOutput({
    this.eC2InstanceLimits,
  });

  factory DescribeEC2InstanceLimitsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeEC2InstanceLimitsOutput(
      eC2InstanceLimits: (json['EC2InstanceLimits'] as List?)
          ?.whereNotNull()
          .map((e) => EC2InstanceLimit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eC2InstanceLimits = this.eC2InstanceLimits;
    return {
      if (eC2InstanceLimits != null) 'EC2InstanceLimits': eC2InstanceLimits,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeFleetAttributesOutput {
  /// A collection of objects containing attribute metadata for each requested
  /// fleet ID. Attribute objects are returned only for fleets that currently
  /// exist.
  final List<FleetAttributes>? fleetAttributes;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeFleetAttributesOutput({
    this.fleetAttributes,
    this.nextToken,
  });

  factory DescribeFleetAttributesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeFleetAttributesOutput(
      fleetAttributes: (json['FleetAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => FleetAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetAttributes = this.fleetAttributes;
    final nextToken = this.nextToken;
    return {
      if (fleetAttributes != null) 'FleetAttributes': fleetAttributes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeFleetCapacityOutput {
  /// A collection of objects that contains capacity information for each
  /// requested fleet ID. Capacity objects are returned only for fleets that
  /// currently exist.
  final List<FleetCapacity>? fleetCapacity;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeFleetCapacityOutput({
    this.fleetCapacity,
    this.nextToken,
  });

  factory DescribeFleetCapacityOutput.fromJson(Map<String, dynamic> json) {
    return DescribeFleetCapacityOutput(
      fleetCapacity: (json['FleetCapacity'] as List?)
          ?.whereNotNull()
          .map((e) => FleetCapacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetCapacity = this.fleetCapacity;
    final nextToken = this.nextToken;
    return {
      if (fleetCapacity != null) 'FleetCapacity': fleetCapacity,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeFleetEventsOutput {
  /// A collection of objects containing event log entries for the specified
  /// fleet.
  final List<Event>? events;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeFleetEventsOutput({
    this.events,
    this.nextToken,
  });

  factory DescribeFleetEventsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeFleetEventsOutput(
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      if (events != null) 'Events': events,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeFleetLocationAttributesOutput {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet that location attributes were requested
  /// for.
  final String? fleetId;

  /// Location-specific information on the requested fleet's remote locations.
  final List<LocationAttributes>? locationAttributes;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeFleetLocationAttributesOutput({
    this.fleetArn,
    this.fleetId,
    this.locationAttributes,
    this.nextToken,
  });

  factory DescribeFleetLocationAttributesOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeFleetLocationAttributesOutput(
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      locationAttributes: (json['LocationAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => LocationAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final locationAttributes = this.locationAttributes;
    final nextToken = this.nextToken;
    return {
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (locationAttributes != null) 'LocationAttributes': locationAttributes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeFleetLocationCapacityOutput {
  /// Resource capacity information for the requested fleet location. Capacity
  /// objects are returned only for fleets and locations that currently exist.
  final FleetCapacity? fleetCapacity;

  DescribeFleetLocationCapacityOutput({
    this.fleetCapacity,
  });

  factory DescribeFleetLocationCapacityOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeFleetLocationCapacityOutput(
      fleetCapacity: json['FleetCapacity'] != null
          ? FleetCapacity.fromJson(
              json['FleetCapacity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetCapacity = this.fleetCapacity;
    return {
      if (fleetCapacity != null) 'FleetCapacity': fleetCapacity,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeFleetLocationUtilizationOutput {
  /// Utilization information for the requested fleet location. Utilization
  /// objects are returned only for fleets and locations that currently exist.
  final FleetUtilization? fleetUtilization;

  DescribeFleetLocationUtilizationOutput({
    this.fleetUtilization,
  });

  factory DescribeFleetLocationUtilizationOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeFleetLocationUtilizationOutput(
      fleetUtilization: json['FleetUtilization'] != null
          ? FleetUtilization.fromJson(
              json['FleetUtilization'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetUtilization = this.fleetUtilization;
    return {
      if (fleetUtilization != null) 'FleetUtilization': fleetUtilization,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeFleetPortSettingsOutput {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet that was requested.
  final String? fleetId;

  /// The port settings for the requested fleet ID.
  final List<IpPermission>? inboundPermissions;

  /// The requested fleet location, expressed as an AWS Region code, such as
  /// <code>us-west-2</code>.
  final String? location;

  /// The current status of updates to the fleet's port settings in the requested
  /// fleet location. A status of <code>PENDING_UPDATE</code> indicates that an
  /// update was requested for the fleet but has not yet been completed for the
  /// location.
  final LocationUpdateStatus? updateStatus;

  DescribeFleetPortSettingsOutput({
    this.fleetArn,
    this.fleetId,
    this.inboundPermissions,
    this.location,
    this.updateStatus,
  });

  factory DescribeFleetPortSettingsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeFleetPortSettingsOutput(
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      inboundPermissions: (json['InboundPermissions'] as List?)
          ?.whereNotNull()
          .map((e) => IpPermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['Location'] as String?,
      updateStatus: (json['UpdateStatus'] as String?)?.toLocationUpdateStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final inboundPermissions = this.inboundPermissions;
    final location = this.location;
    final updateStatus = this.updateStatus;
    return {
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (inboundPermissions != null) 'InboundPermissions': inboundPermissions,
      if (location != null) 'Location': location,
      if (updateStatus != null) 'UpdateStatus': updateStatus.toValue(),
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeFleetUtilizationOutput {
  /// A collection of objects containing utilization information for each
  /// requested fleet ID. Utilization objects are returned only for fleets that
  /// currently exist.
  final List<FleetUtilization>? fleetUtilization;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeFleetUtilizationOutput({
    this.fleetUtilization,
    this.nextToken,
  });

  factory DescribeFleetUtilizationOutput.fromJson(Map<String, dynamic> json) {
    return DescribeFleetUtilizationOutput(
      fleetUtilization: (json['FleetUtilization'] as List?)
          ?.whereNotNull()
          .map((e) => FleetUtilization.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetUtilization = this.fleetUtilization;
    final nextToken = this.nextToken;
    return {
      if (fleetUtilization != null) 'FleetUtilization': fleetUtilization,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeGameServerGroupOutput {
  /// An object with the property settings for the requested game server group
  /// resource.
  final GameServerGroup? gameServerGroup;

  DescribeGameServerGroupOutput({
    this.gameServerGroup,
  });

  factory DescribeGameServerGroupOutput.fromJson(Map<String, dynamic> json) {
    return DescribeGameServerGroupOutput(
      gameServerGroup: json['GameServerGroup'] != null
          ? GameServerGroup.fromJson(
              json['GameServerGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServerGroup = this.gameServerGroup;
    return {
      if (gameServerGroup != null) 'GameServerGroup': gameServerGroup,
    };
  }
}

class DescribeGameServerInstancesOutput {
  /// The collection of requested game server instances.
  final List<GameServerInstance>? gameServerInstances;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeGameServerInstancesOutput({
    this.gameServerInstances,
    this.nextToken,
  });

  factory DescribeGameServerInstancesOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeGameServerInstancesOutput(
      gameServerInstances: (json['GameServerInstances'] as List?)
          ?.whereNotNull()
          .map((e) => GameServerInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServerInstances = this.gameServerInstances;
    final nextToken = this.nextToken;
    return {
      if (gameServerInstances != null)
        'GameServerInstances': gameServerInstances,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeGameServerOutput {
  /// Object that describes the requested game server.
  final GameServer? gameServer;

  DescribeGameServerOutput({
    this.gameServer,
  });

  factory DescribeGameServerOutput.fromJson(Map<String, dynamic> json) {
    return DescribeGameServerOutput(
      gameServer: json['GameServer'] != null
          ? GameServer.fromJson(json['GameServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServer = this.gameServer;
    return {
      if (gameServer != null) 'GameServer': gameServer,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeGameSessionDetailsOutput {
  /// A collection of properties for each game session that matches the request.
  final List<GameSessionDetail>? gameSessionDetails;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeGameSessionDetailsOutput({
    this.gameSessionDetails,
    this.nextToken,
  });

  factory DescribeGameSessionDetailsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeGameSessionDetailsOutput(
      gameSessionDetails: (json['GameSessionDetails'] as List?)
          ?.whereNotNull()
          .map((e) => GameSessionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSessionDetails = this.gameSessionDetails;
    final nextToken = this.nextToken;
    return {
      if (gameSessionDetails != null) 'GameSessionDetails': gameSessionDetails,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeGameSessionPlacementOutput {
  /// Object that describes the requested game session placement.
  final GameSessionPlacement? gameSessionPlacement;

  DescribeGameSessionPlacementOutput({
    this.gameSessionPlacement,
  });

  factory DescribeGameSessionPlacementOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeGameSessionPlacementOutput(
      gameSessionPlacement: json['GameSessionPlacement'] != null
          ? GameSessionPlacement.fromJson(
              json['GameSessionPlacement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSessionPlacement = this.gameSessionPlacement;
    return {
      if (gameSessionPlacement != null)
        'GameSessionPlacement': gameSessionPlacement,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeGameSessionQueuesOutput {
  /// A collection of objects that describe the requested game session queues.
  final List<GameSessionQueue>? gameSessionQueues;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeGameSessionQueuesOutput({
    this.gameSessionQueues,
    this.nextToken,
  });

  factory DescribeGameSessionQueuesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeGameSessionQueuesOutput(
      gameSessionQueues: (json['GameSessionQueues'] as List?)
          ?.whereNotNull()
          .map((e) => GameSessionQueue.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSessionQueues = this.gameSessionQueues;
    final nextToken = this.nextToken;
    return {
      if (gameSessionQueues != null) 'GameSessionQueues': gameSessionQueues,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeGameSessionsOutput {
  /// A collection of properties for each game session that matches the request.
  final List<GameSession>? gameSessions;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeGameSessionsOutput({
    this.gameSessions,
    this.nextToken,
  });

  factory DescribeGameSessionsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeGameSessionsOutput(
      gameSessions: (json['GameSessions'] as List?)
          ?.whereNotNull()
          .map((e) => GameSession.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSessions = this.gameSessions;
    final nextToken = this.nextToken;
    return {
      if (gameSessions != null) 'GameSessions': gameSessions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeInstancesOutput {
  /// A collection of objects containing properties for each instance returned.
  final List<Instance>? instances;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeInstancesOutput({
    this.instances,
    this.nextToken,
  });

  factory DescribeInstancesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeInstancesOutput(
      instances: (json['Instances'] as List?)
          ?.whereNotNull()
          .map((e) => Instance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    final nextToken = this.nextToken;
    return {
      if (instances != null) 'Instances': instances,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeMatchmakingConfigurationsOutput {
  /// A collection of requested matchmaking configurations.
  final List<MatchmakingConfiguration>? configurations;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeMatchmakingConfigurationsOutput({
    this.configurations,
    this.nextToken,
  });

  factory DescribeMatchmakingConfigurationsOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeMatchmakingConfigurationsOutput(
      configurations: (json['Configurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MatchmakingConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurations = this.configurations;
    final nextToken = this.nextToken;
    return {
      if (configurations != null) 'Configurations': configurations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeMatchmakingOutput {
  /// A collection of existing matchmaking ticket objects matching the request.
  final List<MatchmakingTicket>? ticketList;

  DescribeMatchmakingOutput({
    this.ticketList,
  });

  factory DescribeMatchmakingOutput.fromJson(Map<String, dynamic> json) {
    return DescribeMatchmakingOutput(
      ticketList: (json['TicketList'] as List?)
          ?.whereNotNull()
          .map((e) => MatchmakingTicket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ticketList = this.ticketList;
    return {
      if (ticketList != null) 'TicketList': ticketList,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeMatchmakingRuleSetsOutput {
  /// A collection of requested matchmaking rule set objects.
  final List<MatchmakingRuleSet> ruleSets;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  DescribeMatchmakingRuleSetsOutput({
    required this.ruleSets,
    this.nextToken,
  });

  factory DescribeMatchmakingRuleSetsOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeMatchmakingRuleSetsOutput(
      ruleSets: (json['RuleSets'] as List)
          .whereNotNull()
          .map((e) => MatchmakingRuleSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleSets = this.ruleSets;
    final nextToken = this.nextToken;
    return {
      'RuleSets': ruleSets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribePlayerSessionsOutput {
  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  /// A collection of objects containing properties for each player session that
  /// matches the request.
  final List<PlayerSession>? playerSessions;

  DescribePlayerSessionsOutput({
    this.nextToken,
    this.playerSessions,
  });

  factory DescribePlayerSessionsOutput.fromJson(Map<String, dynamic> json) {
    return DescribePlayerSessionsOutput(
      nextToken: json['NextToken'] as String?,
      playerSessions: (json['PlayerSessions'] as List?)
          ?.whereNotNull()
          .map((e) => PlayerSession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final playerSessions = this.playerSessions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (playerSessions != null) 'PlayerSessions': playerSessions,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeRuntimeConfigurationOutput {
  /// Instructions that describe how server processes should be launched and
  /// maintained on each instance in the fleet.
  final RuntimeConfiguration? runtimeConfiguration;

  DescribeRuntimeConfigurationOutput({
    this.runtimeConfiguration,
  });

  factory DescribeRuntimeConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeRuntimeConfigurationOutput(
      runtimeConfiguration: json['RuntimeConfiguration'] != null
          ? RuntimeConfiguration.fromJson(
              json['RuntimeConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final runtimeConfiguration = this.runtimeConfiguration;
    return {
      if (runtimeConfiguration != null)
        'RuntimeConfiguration': runtimeConfiguration,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeScalingPoliciesOutput {
  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  /// A collection of objects containing the scaling policies matching the
  /// request.
  final List<ScalingPolicy>? scalingPolicies;

  DescribeScalingPoliciesOutput({
    this.nextToken,
    this.scalingPolicies,
  });

  factory DescribeScalingPoliciesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeScalingPoliciesOutput(
      nextToken: json['NextToken'] as String?,
      scalingPolicies: (json['ScalingPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => ScalingPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scalingPolicies = this.scalingPolicies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (scalingPolicies != null) 'ScalingPolicies': scalingPolicies,
    };
  }
}

class DescribeScriptOutput {
  /// A set of properties describing the requested script.
  final Script? script;

  DescribeScriptOutput({
    this.script,
  });

  factory DescribeScriptOutput.fromJson(Map<String, dynamic> json) {
    return DescribeScriptOutput(
      script: json['Script'] != null
          ? Script.fromJson(json['Script'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final script = this.script;
    return {
      if (script != null) 'Script': script,
    };
  }
}

class DescribeVpcPeeringAuthorizationsOutput {
  /// A collection of objects that describe all valid VPC peering operations for
  /// the current AWS account.
  final List<VpcPeeringAuthorization>? vpcPeeringAuthorizations;

  DescribeVpcPeeringAuthorizationsOutput({
    this.vpcPeeringAuthorizations,
  });

  factory DescribeVpcPeeringAuthorizationsOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeVpcPeeringAuthorizationsOutput(
      vpcPeeringAuthorizations: (json['VpcPeeringAuthorizations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              VpcPeeringAuthorization.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcPeeringAuthorizations = this.vpcPeeringAuthorizations;
    return {
      if (vpcPeeringAuthorizations != null)
        'VpcPeeringAuthorizations': vpcPeeringAuthorizations,
    };
  }
}

/// Represents the returned data in response to a request operation.
class DescribeVpcPeeringConnectionsOutput {
  /// A collection of VPC peering connection records that match the request.
  final List<VpcPeeringConnection>? vpcPeeringConnections;

  DescribeVpcPeeringConnectionsOutput({
    this.vpcPeeringConnections,
  });

  factory DescribeVpcPeeringConnectionsOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeVpcPeeringConnectionsOutput(
      vpcPeeringConnections: (json['VpcPeeringConnections'] as List?)
          ?.whereNotNull()
          .map((e) => VpcPeeringConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcPeeringConnections = this.vpcPeeringConnections;
    return {
      if (vpcPeeringConnections != null)
        'VpcPeeringConnections': vpcPeeringConnections,
    };
  }
}

/// Player information for use when creating player sessions using a game
/// session placement request with <a>StartGameSessionPlacement</a>.
class DesiredPlayerSession {
  /// Developer-defined information related to a player. GameLift does not use
  /// this data, so it can be formatted as needed for use in the game.
  final String? playerData;

  /// A unique identifier for a player to associate with the player session.
  final String? playerId;

  DesiredPlayerSession({
    this.playerData,
    this.playerId,
  });

  factory DesiredPlayerSession.fromJson(Map<String, dynamic> json) {
    return DesiredPlayerSession(
      playerData: json['PlayerData'] as String?,
      playerId: json['PlayerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final playerData = this.playerData;
    final playerId = this.playerId;
    return {
      if (playerData != null) 'PlayerData': playerData,
      if (playerId != null) 'PlayerId': playerId,
    };
  }
}

/// Resource capacity settings. Fleet capacity is measured in EC2 instances.
/// Pending and terminating counts are non-zero when the fleet capacity is
/// adjusting to a scaling event or if access to resources is temporarily
/// affected.
///
/// EC2 instance counts are part of <a>FleetCapacity</a>.
class EC2InstanceCounts {
  /// Actual number of instances that are ready to host game sessions.
  final int? active;

  /// Ideal number of active instances. GameLift will always try to maintain the
  /// desired number of instances. Capacity is scaled up or down by changing the
  /// desired instances.
  final int? desired;

  /// Number of active instances that are not currently hosting a game session.
  final int? idle;

  /// The maximum instance count value allowed.
  final int? maximum;

  /// The minimum instance count value allowed.
  final int? minimum;

  /// Number of instances that are starting but not yet active.
  final int? pending;

  /// Number of instances that are no longer active but haven't yet been
  /// terminated.
  final int? terminating;

  EC2InstanceCounts({
    this.active,
    this.desired,
    this.idle,
    this.maximum,
    this.minimum,
    this.pending,
    this.terminating,
  });

  factory EC2InstanceCounts.fromJson(Map<String, dynamic> json) {
    return EC2InstanceCounts(
      active: json['ACTIVE'] as int?,
      desired: json['DESIRED'] as int?,
      idle: json['IDLE'] as int?,
      maximum: json['MAXIMUM'] as int?,
      minimum: json['MINIMUM'] as int?,
      pending: json['PENDING'] as int?,
      terminating: json['TERMINATING'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final desired = this.desired;
    final idle = this.idle;
    final maximum = this.maximum;
    final minimum = this.minimum;
    final pending = this.pending;
    final terminating = this.terminating;
    return {
      if (active != null) 'ACTIVE': active,
      if (desired != null) 'DESIRED': desired,
      if (idle != null) 'IDLE': idle,
      if (maximum != null) 'MAXIMUM': maximum,
      if (minimum != null) 'MINIMUM': minimum,
      if (pending != null) 'PENDING': pending,
      if (terminating != null) 'TERMINATING': terminating,
    };
  }
}

/// The GameLift service limits for an EC2 instance type and current
/// utilization. GameLift allows AWS accounts a maximum number of instances, per
/// instance type, per AWS Region or location, for use with GameLift. You can
/// request an limit increase for your account by using the <b>Service
/// limits</b> page in the GameLift console.
///
/// <b>Related actions</b>
///
/// <a>DescribeEC2InstanceLimits</a>
class EC2InstanceLimit {
  /// The number of instances for the specified type and location that are
  /// currently being used by the AWS account.
  final int? currentInstances;

  /// The name of an EC2 instance type. See <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a> for detailed descriptions.
  final EC2InstanceType? eC2InstanceType;

  /// The number of instances that is allowed for the specified instance type and
  /// location.
  final int? instanceLimit;

  /// An AWS Region code, such as <code>us-west-2</code>.
  final String? location;

  EC2InstanceLimit({
    this.currentInstances,
    this.eC2InstanceType,
    this.instanceLimit,
    this.location,
  });

  factory EC2InstanceLimit.fromJson(Map<String, dynamic> json) {
    return EC2InstanceLimit(
      currentInstances: json['CurrentInstances'] as int?,
      eC2InstanceType:
          (json['EC2InstanceType'] as String?)?.toEC2InstanceType(),
      instanceLimit: json['InstanceLimit'] as int?,
      location: json['Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentInstances = this.currentInstances;
    final eC2InstanceType = this.eC2InstanceType;
    final instanceLimit = this.instanceLimit;
    final location = this.location;
    return {
      if (currentInstances != null) 'CurrentInstances': currentInstances,
      if (eC2InstanceType != null) 'EC2InstanceType': eC2InstanceType.toValue(),
      if (instanceLimit != null) 'InstanceLimit': instanceLimit,
      if (location != null) 'Location': location,
    };
  }
}

enum EC2InstanceType {
  t2Micro,
  t2Small,
  t2Medium,
  t2Large,
  c3Large,
  c3Xlarge,
  c3_2xlarge,
  c3_4xlarge,
  c3_8xlarge,
  c4Large,
  c4Xlarge,
  c4_2xlarge,
  c4_4xlarge,
  c4_8xlarge,
  c5Large,
  c5Xlarge,
  c5_2xlarge,
  c5_4xlarge,
  c5_9xlarge,
  c5_12xlarge,
  c5_18xlarge,
  c5_24xlarge,
  c5aLarge,
  c5aXlarge,
  c5a_2xlarge,
  c5a_4xlarge,
  c5a_8xlarge,
  c5a_12xlarge,
  c5a_16xlarge,
  c5a_24xlarge,
  r3Large,
  r3Xlarge,
  r3_2xlarge,
  r3_4xlarge,
  r3_8xlarge,
  r4Large,
  r4Xlarge,
  r4_2xlarge,
  r4_4xlarge,
  r4_8xlarge,
  r4_16xlarge,
  r5Large,
  r5Xlarge,
  r5_2xlarge,
  r5_4xlarge,
  r5_8xlarge,
  r5_12xlarge,
  r5_16xlarge,
  r5_24xlarge,
  r5aLarge,
  r5aXlarge,
  r5a_2xlarge,
  r5a_4xlarge,
  r5a_8xlarge,
  r5a_12xlarge,
  r5a_16xlarge,
  r5a_24xlarge,
  m3Medium,
  m3Large,
  m3Xlarge,
  m3_2xlarge,
  m4Large,
  m4Xlarge,
  m4_2xlarge,
  m4_4xlarge,
  m4_10xlarge,
  m5Large,
  m5Xlarge,
  m5_2xlarge,
  m5_4xlarge,
  m5_8xlarge,
  m5_12xlarge,
  m5_16xlarge,
  m5_24xlarge,
  m5aLarge,
  m5aXlarge,
  m5a_2xlarge,
  m5a_4xlarge,
  m5a_8xlarge,
  m5a_12xlarge,
  m5a_16xlarge,
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
  }
}

extension on String {
  EC2InstanceType toEC2InstanceType() {
    switch (this) {
      case 't2.micro':
        return EC2InstanceType.t2Micro;
      case 't2.small':
        return EC2InstanceType.t2Small;
      case 't2.medium':
        return EC2InstanceType.t2Medium;
      case 't2.large':
        return EC2InstanceType.t2Large;
      case 'c3.large':
        return EC2InstanceType.c3Large;
      case 'c3.xlarge':
        return EC2InstanceType.c3Xlarge;
      case 'c3.2xlarge':
        return EC2InstanceType.c3_2xlarge;
      case 'c3.4xlarge':
        return EC2InstanceType.c3_4xlarge;
      case 'c3.8xlarge':
        return EC2InstanceType.c3_8xlarge;
      case 'c4.large':
        return EC2InstanceType.c4Large;
      case 'c4.xlarge':
        return EC2InstanceType.c4Xlarge;
      case 'c4.2xlarge':
        return EC2InstanceType.c4_2xlarge;
      case 'c4.4xlarge':
        return EC2InstanceType.c4_4xlarge;
      case 'c4.8xlarge':
        return EC2InstanceType.c4_8xlarge;
      case 'c5.large':
        return EC2InstanceType.c5Large;
      case 'c5.xlarge':
        return EC2InstanceType.c5Xlarge;
      case 'c5.2xlarge':
        return EC2InstanceType.c5_2xlarge;
      case 'c5.4xlarge':
        return EC2InstanceType.c5_4xlarge;
      case 'c5.9xlarge':
        return EC2InstanceType.c5_9xlarge;
      case 'c5.12xlarge':
        return EC2InstanceType.c5_12xlarge;
      case 'c5.18xlarge':
        return EC2InstanceType.c5_18xlarge;
      case 'c5.24xlarge':
        return EC2InstanceType.c5_24xlarge;
      case 'c5a.large':
        return EC2InstanceType.c5aLarge;
      case 'c5a.xlarge':
        return EC2InstanceType.c5aXlarge;
      case 'c5a.2xlarge':
        return EC2InstanceType.c5a_2xlarge;
      case 'c5a.4xlarge':
        return EC2InstanceType.c5a_4xlarge;
      case 'c5a.8xlarge':
        return EC2InstanceType.c5a_8xlarge;
      case 'c5a.12xlarge':
        return EC2InstanceType.c5a_12xlarge;
      case 'c5a.16xlarge':
        return EC2InstanceType.c5a_16xlarge;
      case 'c5a.24xlarge':
        return EC2InstanceType.c5a_24xlarge;
      case 'r3.large':
        return EC2InstanceType.r3Large;
      case 'r3.xlarge':
        return EC2InstanceType.r3Xlarge;
      case 'r3.2xlarge':
        return EC2InstanceType.r3_2xlarge;
      case 'r3.4xlarge':
        return EC2InstanceType.r3_4xlarge;
      case 'r3.8xlarge':
        return EC2InstanceType.r3_8xlarge;
      case 'r4.large':
        return EC2InstanceType.r4Large;
      case 'r4.xlarge':
        return EC2InstanceType.r4Xlarge;
      case 'r4.2xlarge':
        return EC2InstanceType.r4_2xlarge;
      case 'r4.4xlarge':
        return EC2InstanceType.r4_4xlarge;
      case 'r4.8xlarge':
        return EC2InstanceType.r4_8xlarge;
      case 'r4.16xlarge':
        return EC2InstanceType.r4_16xlarge;
      case 'r5.large':
        return EC2InstanceType.r5Large;
      case 'r5.xlarge':
        return EC2InstanceType.r5Xlarge;
      case 'r5.2xlarge':
        return EC2InstanceType.r5_2xlarge;
      case 'r5.4xlarge':
        return EC2InstanceType.r5_4xlarge;
      case 'r5.8xlarge':
        return EC2InstanceType.r5_8xlarge;
      case 'r5.12xlarge':
        return EC2InstanceType.r5_12xlarge;
      case 'r5.16xlarge':
        return EC2InstanceType.r5_16xlarge;
      case 'r5.24xlarge':
        return EC2InstanceType.r5_24xlarge;
      case 'r5a.large':
        return EC2InstanceType.r5aLarge;
      case 'r5a.xlarge':
        return EC2InstanceType.r5aXlarge;
      case 'r5a.2xlarge':
        return EC2InstanceType.r5a_2xlarge;
      case 'r5a.4xlarge':
        return EC2InstanceType.r5a_4xlarge;
      case 'r5a.8xlarge':
        return EC2InstanceType.r5a_8xlarge;
      case 'r5a.12xlarge':
        return EC2InstanceType.r5a_12xlarge;
      case 'r5a.16xlarge':
        return EC2InstanceType.r5a_16xlarge;
      case 'r5a.24xlarge':
        return EC2InstanceType.r5a_24xlarge;
      case 'm3.medium':
        return EC2InstanceType.m3Medium;
      case 'm3.large':
        return EC2InstanceType.m3Large;
      case 'm3.xlarge':
        return EC2InstanceType.m3Xlarge;
      case 'm3.2xlarge':
        return EC2InstanceType.m3_2xlarge;
      case 'm4.large':
        return EC2InstanceType.m4Large;
      case 'm4.xlarge':
        return EC2InstanceType.m4Xlarge;
      case 'm4.2xlarge':
        return EC2InstanceType.m4_2xlarge;
      case 'm4.4xlarge':
        return EC2InstanceType.m4_4xlarge;
      case 'm4.10xlarge':
        return EC2InstanceType.m4_10xlarge;
      case 'm5.large':
        return EC2InstanceType.m5Large;
      case 'm5.xlarge':
        return EC2InstanceType.m5Xlarge;
      case 'm5.2xlarge':
        return EC2InstanceType.m5_2xlarge;
      case 'm5.4xlarge':
        return EC2InstanceType.m5_4xlarge;
      case 'm5.8xlarge':
        return EC2InstanceType.m5_8xlarge;
      case 'm5.12xlarge':
        return EC2InstanceType.m5_12xlarge;
      case 'm5.16xlarge':
        return EC2InstanceType.m5_16xlarge;
      case 'm5.24xlarge':
        return EC2InstanceType.m5_24xlarge;
      case 'm5a.large':
        return EC2InstanceType.m5aLarge;
      case 'm5a.xlarge':
        return EC2InstanceType.m5aXlarge;
      case 'm5a.2xlarge':
        return EC2InstanceType.m5a_2xlarge;
      case 'm5a.4xlarge':
        return EC2InstanceType.m5a_4xlarge;
      case 'm5a.8xlarge':
        return EC2InstanceType.m5a_8xlarge;
      case 'm5a.12xlarge':
        return EC2InstanceType.m5a_12xlarge;
      case 'm5a.16xlarge':
        return EC2InstanceType.m5a_16xlarge;
      case 'm5a.24xlarge':
        return EC2InstanceType.m5a_24xlarge;
    }
    throw Exception('$this is not known in enum EC2InstanceType');
  }
}

/// Log entry describing an event that involves GameLift resources (such as a
/// fleet). In addition to tracking activity, event codes and messages can
/// provide additional information for troubleshooting and debugging problems.
///
/// <b>Related actions</b>
///
/// <a>DescribeFleetEvents</a>
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
  /// successfully extracted, and the GameLift is now running the build's install
  /// script (if one is included). Failure in this stage prevents a fleet from
  /// moving to <code>ACTIVE</code> status. Logs for this stage list the
  /// installation steps and whether or not the install completed successfully.
  /// Access the logs by using the URL in <i>PreSignedLogUrl</i>.
  /// </li>
  /// <li>
  /// FLEET_CREATION_VALIDATING_RUNTIME_CONFIG -- The build process was
  /// successful, and the GameLift is now verifying that the game server launch
  /// paths, which are specified in the fleet's runtime configuration, exist. If
  /// any listed launch path exists, GameLift tries to launch a game server
  /// process and waits for the process to report ready. Failures in this stage
  /// prevent a fleet from moving to <code>ACTIVE</code> status. Logs for this
  /// stage list the launch paths in the runtime configuration and indicate
  /// whether each is found. Access the logs by using the URL in
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
  /// between the VPC for an GameLift fleet and a VPC in your AWS account.
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
  final EventCode? eventCode;

  /// A unique identifier for a fleet event.
  final String? eventId;

  /// Time stamp indicating when this event occurred. Format is a number expressed
  /// in Unix time as milliseconds (for example <code>"1469498468.057"</code>).
  final DateTime? eventTime;

  /// Additional information related to the event.
  final String? message;

  /// Location of stored logs with additional detail that is related to the event.
  /// This is useful for debugging issues. The URL is valid for 15 minutes. You
  /// can also access fleet creation logs through the GameLift console.
  final String? preSignedLogUrl;

  /// A unique identifier for an event resource, such as a fleet ID.
  final String? resourceId;

  Event({
    this.eventCode,
    this.eventId,
    this.eventTime,
    this.message,
    this.preSignedLogUrl,
    this.resourceId,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventCode: (json['EventCode'] as String?)?.toEventCode(),
      eventId: json['EventId'] as String?,
      eventTime: timeStampFromJson(json['EventTime']),
      message: json['Message'] as String?,
      preSignedLogUrl: json['PreSignedLogUrl'] as String?,
      resourceId: json['ResourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventCode = this.eventCode;
    final eventId = this.eventId;
    final eventTime = this.eventTime;
    final message = this.message;
    final preSignedLogUrl = this.preSignedLogUrl;
    final resourceId = this.resourceId;
    return {
      if (eventCode != null) 'EventCode': eventCode.toValue(),
      if (eventId != null) 'EventId': eventId,
      if (eventTime != null) 'EventTime': unixTimestampToJson(eventTime),
      if (message != null) 'Message': message,
      if (preSignedLogUrl != null) 'PreSignedLogUrl': preSignedLogUrl,
      if (resourceId != null) 'ResourceId': resourceId,
    };
  }
}

enum EventCode {
  genericEvent,
  fleetCreated,
  fleetDeleted,
  fleetScalingEvent,
  fleetStateDownloading,
  fleetStateValidating,
  fleetStateBuilding,
  fleetStateActivating,
  fleetStateActive,
  fleetStateError,
  fleetInitializationFailed,
  fleetBinaryDownloadFailed,
  fleetValidationLaunchPathNotFound,
  fleetValidationExecutableRuntimeFailure,
  fleetValidationTimedOut,
  fleetActivationFailed,
  fleetActivationFailedNoInstances,
  fleetNewGameSessionProtectionPolicyUpdated,
  serverProcessInvalidPath,
  serverProcessSdkInitializationTimeout,
  serverProcessProcessReadyTimeout,
  serverProcessCrashed,
  serverProcessTerminatedUnhealthy,
  serverProcessForceTerminated,
  serverProcessProcessExitTimeout,
  gameSessionActivationTimeout,
  fleetCreationExtractingBuild,
  fleetCreationRunningInstaller,
  fleetCreationValidatingRuntimeConfig,
  fleetVpcPeeringSucceeded,
  fleetVpcPeeringFailed,
  fleetVpcPeeringDeleted,
  instanceInterrupted,
}

extension on EventCode {
  String toValue() {
    switch (this) {
      case EventCode.genericEvent:
        return 'GENERIC_EVENT';
      case EventCode.fleetCreated:
        return 'FLEET_CREATED';
      case EventCode.fleetDeleted:
        return 'FLEET_DELETED';
      case EventCode.fleetScalingEvent:
        return 'FLEET_SCALING_EVENT';
      case EventCode.fleetStateDownloading:
        return 'FLEET_STATE_DOWNLOADING';
      case EventCode.fleetStateValidating:
        return 'FLEET_STATE_VALIDATING';
      case EventCode.fleetStateBuilding:
        return 'FLEET_STATE_BUILDING';
      case EventCode.fleetStateActivating:
        return 'FLEET_STATE_ACTIVATING';
      case EventCode.fleetStateActive:
        return 'FLEET_STATE_ACTIVE';
      case EventCode.fleetStateError:
        return 'FLEET_STATE_ERROR';
      case EventCode.fleetInitializationFailed:
        return 'FLEET_INITIALIZATION_FAILED';
      case EventCode.fleetBinaryDownloadFailed:
        return 'FLEET_BINARY_DOWNLOAD_FAILED';
      case EventCode.fleetValidationLaunchPathNotFound:
        return 'FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND';
      case EventCode.fleetValidationExecutableRuntimeFailure:
        return 'FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE';
      case EventCode.fleetValidationTimedOut:
        return 'FLEET_VALIDATION_TIMED_OUT';
      case EventCode.fleetActivationFailed:
        return 'FLEET_ACTIVATION_FAILED';
      case EventCode.fleetActivationFailedNoInstances:
        return 'FLEET_ACTIVATION_FAILED_NO_INSTANCES';
      case EventCode.fleetNewGameSessionProtectionPolicyUpdated:
        return 'FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED';
      case EventCode.serverProcessInvalidPath:
        return 'SERVER_PROCESS_INVALID_PATH';
      case EventCode.serverProcessSdkInitializationTimeout:
        return 'SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT';
      case EventCode.serverProcessProcessReadyTimeout:
        return 'SERVER_PROCESS_PROCESS_READY_TIMEOUT';
      case EventCode.serverProcessCrashed:
        return 'SERVER_PROCESS_CRASHED';
      case EventCode.serverProcessTerminatedUnhealthy:
        return 'SERVER_PROCESS_TERMINATED_UNHEALTHY';
      case EventCode.serverProcessForceTerminated:
        return 'SERVER_PROCESS_FORCE_TERMINATED';
      case EventCode.serverProcessProcessExitTimeout:
        return 'SERVER_PROCESS_PROCESS_EXIT_TIMEOUT';
      case EventCode.gameSessionActivationTimeout:
        return 'GAME_SESSION_ACTIVATION_TIMEOUT';
      case EventCode.fleetCreationExtractingBuild:
        return 'FLEET_CREATION_EXTRACTING_BUILD';
      case EventCode.fleetCreationRunningInstaller:
        return 'FLEET_CREATION_RUNNING_INSTALLER';
      case EventCode.fleetCreationValidatingRuntimeConfig:
        return 'FLEET_CREATION_VALIDATING_RUNTIME_CONFIG';
      case EventCode.fleetVpcPeeringSucceeded:
        return 'FLEET_VPC_PEERING_SUCCEEDED';
      case EventCode.fleetVpcPeeringFailed:
        return 'FLEET_VPC_PEERING_FAILED';
      case EventCode.fleetVpcPeeringDeleted:
        return 'FLEET_VPC_PEERING_DELETED';
      case EventCode.instanceInterrupted:
        return 'INSTANCE_INTERRUPTED';
    }
  }
}

extension on String {
  EventCode toEventCode() {
    switch (this) {
      case 'GENERIC_EVENT':
        return EventCode.genericEvent;
      case 'FLEET_CREATED':
        return EventCode.fleetCreated;
      case 'FLEET_DELETED':
        return EventCode.fleetDeleted;
      case 'FLEET_SCALING_EVENT':
        return EventCode.fleetScalingEvent;
      case 'FLEET_STATE_DOWNLOADING':
        return EventCode.fleetStateDownloading;
      case 'FLEET_STATE_VALIDATING':
        return EventCode.fleetStateValidating;
      case 'FLEET_STATE_BUILDING':
        return EventCode.fleetStateBuilding;
      case 'FLEET_STATE_ACTIVATING':
        return EventCode.fleetStateActivating;
      case 'FLEET_STATE_ACTIVE':
        return EventCode.fleetStateActive;
      case 'FLEET_STATE_ERROR':
        return EventCode.fleetStateError;
      case 'FLEET_INITIALIZATION_FAILED':
        return EventCode.fleetInitializationFailed;
      case 'FLEET_BINARY_DOWNLOAD_FAILED':
        return EventCode.fleetBinaryDownloadFailed;
      case 'FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND':
        return EventCode.fleetValidationLaunchPathNotFound;
      case 'FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE':
        return EventCode.fleetValidationExecutableRuntimeFailure;
      case 'FLEET_VALIDATION_TIMED_OUT':
        return EventCode.fleetValidationTimedOut;
      case 'FLEET_ACTIVATION_FAILED':
        return EventCode.fleetActivationFailed;
      case 'FLEET_ACTIVATION_FAILED_NO_INSTANCES':
        return EventCode.fleetActivationFailedNoInstances;
      case 'FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED':
        return EventCode.fleetNewGameSessionProtectionPolicyUpdated;
      case 'SERVER_PROCESS_INVALID_PATH':
        return EventCode.serverProcessInvalidPath;
      case 'SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT':
        return EventCode.serverProcessSdkInitializationTimeout;
      case 'SERVER_PROCESS_PROCESS_READY_TIMEOUT':
        return EventCode.serverProcessProcessReadyTimeout;
      case 'SERVER_PROCESS_CRASHED':
        return EventCode.serverProcessCrashed;
      case 'SERVER_PROCESS_TERMINATED_UNHEALTHY':
        return EventCode.serverProcessTerminatedUnhealthy;
      case 'SERVER_PROCESS_FORCE_TERMINATED':
        return EventCode.serverProcessForceTerminated;
      case 'SERVER_PROCESS_PROCESS_EXIT_TIMEOUT':
        return EventCode.serverProcessProcessExitTimeout;
      case 'GAME_SESSION_ACTIVATION_TIMEOUT':
        return EventCode.gameSessionActivationTimeout;
      case 'FLEET_CREATION_EXTRACTING_BUILD':
        return EventCode.fleetCreationExtractingBuild;
      case 'FLEET_CREATION_RUNNING_INSTALLER':
        return EventCode.fleetCreationRunningInstaller;
      case 'FLEET_CREATION_VALIDATING_RUNTIME_CONFIG':
        return EventCode.fleetCreationValidatingRuntimeConfig;
      case 'FLEET_VPC_PEERING_SUCCEEDED':
        return EventCode.fleetVpcPeeringSucceeded;
      case 'FLEET_VPC_PEERING_FAILED':
        return EventCode.fleetVpcPeeringFailed;
      case 'FLEET_VPC_PEERING_DELETED':
        return EventCode.fleetVpcPeeringDeleted;
      case 'INSTANCE_INTERRUPTED':
        return EventCode.instanceInterrupted;
    }
    throw Exception('$this is not known in enum EventCode');
  }
}

/// A list of fleet locations where a game session queue can place new game
/// sessions. You can use a filter to temporarily turn off placements for
/// specific locations. For queues that have multi-location fleets, you can use
/// a filter configuration allow placement with some, but not all of these
/// locations.
///
/// Filter configurations are part of a <a>GameSessionQueue</a>.
class FilterConfiguration {
  /// A list of locations to allow game session placement in, in the form of AWS
  /// Region codes such as <code>us-west-2</code>.
  final List<String>? allowedLocations;

  FilterConfiguration({
    this.allowedLocations,
  });

  factory FilterConfiguration.fromJson(Map<String, dynamic> json) {
    return FilterConfiguration(
      allowedLocations: (json['AllowedLocations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedLocations = this.allowedLocations;
    return {
      if (allowedLocations != null) 'AllowedLocations': allowedLocations,
    };
  }
}

enum FleetAction {
  autoScaling,
}

extension on FleetAction {
  String toValue() {
    switch (this) {
      case FleetAction.autoScaling:
        return 'AUTO_SCALING';
    }
  }
}

extension on String {
  FleetAction toFleetAction() {
    switch (this) {
      case 'AUTO_SCALING':
        return FleetAction.autoScaling;
    }
    throw Exception('$this is not known in enum FleetAction');
  }
}

/// Describes a GameLift fleet of game hosting resources.
///
/// <b>Related actions</b>
///
/// <a>CreateFleet</a> | <a>DescribeFleetAttributes</a>
class FleetAttributes {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// associated with the GameLift build resource that is deployed on instances in
  /// this fleet. In a GameLift build ARN, the resource ID matches the
  /// <code>BuildId</code> value.
  final String? buildArn;

  /// A unique identifier for the build resource that is deployed on instances in
  /// this fleet.
  final String? buildId;

  /// Indicates whether a TLS/SSL certificate was generated for the fleet.
  final CertificateConfiguration? certificateConfiguration;

  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// A human-readable description of the fleet.
  final String? description;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  /// In a GameLift fleet ARN, the resource ID matches the <code>FleetId</code>
  /// value.
  final String? fleetArn;

  /// A unique identifier for the fleet.
  final String? fleetId;

  /// The kind of instances, On-Demand or Spot, that this fleet uses.
  final FleetType? fleetType;

  /// A unique identifier for an AWS IAM role that manages access to your AWS
  /// services. With an instance role ARN set, any application that runs on an
  /// instance in this fleet can assume the role, including install scripts,
  /// server processes, and daemons (background processes). Create a role or look
  /// up a role's ARN by using the <a
  /// href="https://console.aws.amazon.com/iam/">IAM dashboard</a> in the AWS
  /// Management Console. Learn more about using on-box credentials for your game
  /// servers at <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-resources.html">
  /// Access external resources from a game server</a>.
  final String? instanceRoleArn;

  /// The EC2 instance type that determines the computing resources of each
  /// instance in the fleet. Instance type defines the CPU, memory, storage, and
  /// networking capacity. See <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a> for detailed descriptions.
  final EC2InstanceType? instanceType;

  /// <b>This parameter is no longer used.</b> Game session log paths are now
  /// defined using the GameLift server API <code>ProcessReady()</code>
  /// <code>logParameters</code>. See more information in the <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api-ref.html#gamelift-sdk-server-api-ref-dataypes-process">Server
  /// API Reference</a>.
  final List<String>? logPaths;

  /// Name of a metric group that metrics for this fleet are added to. In Amazon
  /// CloudWatch, you can view aggregated metrics for fleets that are in a metric
  /// group. A fleet can be included in only one metric group at a time.
  final List<String>? metricGroups;

  /// A descriptive label that is associated with a fleet. Fleet names do not need
  /// to be unique.
  final String? name;

  /// The type of game session protection to set on all new instances that are
  /// started in the fleet.
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
  final ProtectionPolicy? newGameSessionProtectionPolicy;

  /// The operating system of the fleet's computing resources. A fleet's operating
  /// system is determined by the OS of the build or script that is deployed on
  /// this fleet.
  final OperatingSystem? operatingSystem;

  /// The fleet policy that limits the number of game sessions an individual
  /// player can create over a span of time.
  final ResourceCreationLimitPolicy? resourceCreationLimitPolicy;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// associated with the GameLift script resource that is deployed on instances
  /// in this fleet. In a GameLift script ARN, the resource ID matches the
  /// <code>ScriptId</code> value.
  final String? scriptArn;

  /// A unique identifier for the Realtime script resource that is deployed on
  /// instances in this fleet.
  final String? scriptId;

  /// <b>This parameter is no longer used.</b> Server launch parameters are now
  /// defined using the fleet's <a>RuntimeConfiguration</a> parameter. Requests
  /// that use this parameter instead continue to be valid.
  final String? serverLaunchParameters;

  /// <b>This parameter is no longer used.</b> Server launch paths are now defined
  /// using the fleet's <a>RuntimeConfiguration</a> parameter. Requests that use
  /// this parameter instead continue to be valid.
  final String? serverLaunchPath;

  /// Current status of the fleet. Possible fleet statuses include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>NEW</b> -- A new fleet has been defined and desired instances is set to
  /// 1.
  /// </li>
  /// <li>
  /// <b>DOWNLOADING/VALIDATING/BUILDING/ACTIVATING</b> -- GameLift is setting up
  /// the new fleet, creating new instances with the game build or Realtime script
  /// and starting server processes.
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
  final FleetStatus? status;

  /// A list of fleet activity that has been suspended using
  /// <a>StopFleetActions</a>. This includes fleet auto-scaling.
  final List<FleetAction>? stoppedActions;

  /// A time stamp indicating when this data object was terminated. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? terminationTime;

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

  factory FleetAttributes.fromJson(Map<String, dynamic> json) {
    return FleetAttributes(
      buildArn: json['BuildArn'] as String?,
      buildId: json['BuildId'] as String?,
      certificateConfiguration: json['CertificateConfiguration'] != null
          ? CertificateConfiguration.fromJson(
              json['CertificateConfiguration'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      fleetType: (json['FleetType'] as String?)?.toFleetType(),
      instanceRoleArn: json['InstanceRoleArn'] as String?,
      instanceType: (json['InstanceType'] as String?)?.toEC2InstanceType(),
      logPaths: (json['LogPaths'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      metricGroups: (json['MetricGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String?,
      newGameSessionProtectionPolicy:
          (json['NewGameSessionProtectionPolicy'] as String?)
              ?.toProtectionPolicy(),
      operatingSystem:
          (json['OperatingSystem'] as String?)?.toOperatingSystem(),
      resourceCreationLimitPolicy: json['ResourceCreationLimitPolicy'] != null
          ? ResourceCreationLimitPolicy.fromJson(
              json['ResourceCreationLimitPolicy'] as Map<String, dynamic>)
          : null,
      scriptArn: json['ScriptArn'] as String?,
      scriptId: json['ScriptId'] as String?,
      serverLaunchParameters: json['ServerLaunchParameters'] as String?,
      serverLaunchPath: json['ServerLaunchPath'] as String?,
      status: (json['Status'] as String?)?.toFleetStatus(),
      stoppedActions: (json['StoppedActions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toFleetAction())
          .toList(),
      terminationTime: timeStampFromJson(json['TerminationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final buildArn = this.buildArn;
    final buildId = this.buildId;
    final certificateConfiguration = this.certificateConfiguration;
    final creationTime = this.creationTime;
    final description = this.description;
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final fleetType = this.fleetType;
    final instanceRoleArn = this.instanceRoleArn;
    final instanceType = this.instanceType;
    final logPaths = this.logPaths;
    final metricGroups = this.metricGroups;
    final name = this.name;
    final newGameSessionProtectionPolicy = this.newGameSessionProtectionPolicy;
    final operatingSystem = this.operatingSystem;
    final resourceCreationLimitPolicy = this.resourceCreationLimitPolicy;
    final scriptArn = this.scriptArn;
    final scriptId = this.scriptId;
    final serverLaunchParameters = this.serverLaunchParameters;
    final serverLaunchPath = this.serverLaunchPath;
    final status = this.status;
    final stoppedActions = this.stoppedActions;
    final terminationTime = this.terminationTime;
    return {
      if (buildArn != null) 'BuildArn': buildArn,
      if (buildId != null) 'BuildId': buildId,
      if (certificateConfiguration != null)
        'CertificateConfiguration': certificateConfiguration,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (fleetType != null) 'FleetType': fleetType.toValue(),
      if (instanceRoleArn != null) 'InstanceRoleArn': instanceRoleArn,
      if (instanceType != null) 'InstanceType': instanceType.toValue(),
      if (logPaths != null) 'LogPaths': logPaths,
      if (metricGroups != null) 'MetricGroups': metricGroups,
      if (name != null) 'Name': name,
      if (newGameSessionProtectionPolicy != null)
        'NewGameSessionProtectionPolicy':
            newGameSessionProtectionPolicy.toValue(),
      if (operatingSystem != null) 'OperatingSystem': operatingSystem.toValue(),
      if (resourceCreationLimitPolicy != null)
        'ResourceCreationLimitPolicy': resourceCreationLimitPolicy,
      if (scriptArn != null) 'ScriptArn': scriptArn,
      if (scriptId != null) 'ScriptId': scriptId,
      if (serverLaunchParameters != null)
        'ServerLaunchParameters': serverLaunchParameters,
      if (serverLaunchPath != null) 'ServerLaunchPath': serverLaunchPath,
      if (status != null) 'Status': status.toValue(),
      if (stoppedActions != null)
        'StoppedActions': stoppedActions.map((e) => e.toValue()).toList(),
      if (terminationTime != null)
        'TerminationTime': unixTimestampToJson(terminationTime),
    };
  }
}

/// Current resource capacity settings in a specified fleet or location. The
/// location value might refer to a fleet's remote location or its home Region.
///
/// <b>Related actions</b>
///
/// <a>DescribeFleetCapacity</a> | <a>DescribeFleetLocationCapacity</a> |
/// <a>UpdateFleetCapacity</a>
class FleetCapacity {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet associated with the location.
  final String? fleetId;

  /// The current instance count and capacity settings for the fleet location.
  final EC2InstanceCounts? instanceCounts;

  /// The EC2 instance type that is used for all instances in a fleet. The
  /// instance type determines the computing resources in use, including CPU,
  /// memory, storage, and networking capacity. See <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a> for detailed descriptions.
  final EC2InstanceType? instanceType;

  /// The fleet location for the instance count information, expressed as an AWS
  /// Region code, such as <code>us-west-2</code>.
  final String? location;

  FleetCapacity({
    this.fleetArn,
    this.fleetId,
    this.instanceCounts,
    this.instanceType,
    this.location,
  });

  factory FleetCapacity.fromJson(Map<String, dynamic> json) {
    return FleetCapacity(
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      instanceCounts: json['InstanceCounts'] != null
          ? EC2InstanceCounts.fromJson(
              json['InstanceCounts'] as Map<String, dynamic>)
          : null,
      instanceType: (json['InstanceType'] as String?)?.toEC2InstanceType(),
      location: json['Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final instanceCounts = this.instanceCounts;
    final instanceType = this.instanceType;
    final location = this.location;
    return {
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (instanceCounts != null) 'InstanceCounts': instanceCounts,
      if (instanceType != null) 'InstanceType': instanceType.toValue(),
      if (location != null) 'Location': location,
    };
  }
}

enum FleetStatus {
  $new,
  downloading,
  validating,
  building,
  activating,
  active,
  deleting,
  error,
  terminated,
}

extension on FleetStatus {
  String toValue() {
    switch (this) {
      case FleetStatus.$new:
        return 'NEW';
      case FleetStatus.downloading:
        return 'DOWNLOADING';
      case FleetStatus.validating:
        return 'VALIDATING';
      case FleetStatus.building:
        return 'BUILDING';
      case FleetStatus.activating:
        return 'ACTIVATING';
      case FleetStatus.active:
        return 'ACTIVE';
      case FleetStatus.deleting:
        return 'DELETING';
      case FleetStatus.error:
        return 'ERROR';
      case FleetStatus.terminated:
        return 'TERMINATED';
    }
  }
}

extension on String {
  FleetStatus toFleetStatus() {
    switch (this) {
      case 'NEW':
        return FleetStatus.$new;
      case 'DOWNLOADING':
        return FleetStatus.downloading;
      case 'VALIDATING':
        return FleetStatus.validating;
      case 'BUILDING':
        return FleetStatus.building;
      case 'ACTIVATING':
        return FleetStatus.activating;
      case 'ACTIVE':
        return FleetStatus.active;
      case 'DELETING':
        return FleetStatus.deleting;
      case 'ERROR':
        return FleetStatus.error;
      case 'TERMINATED':
        return FleetStatus.terminated;
    }
    throw Exception('$this is not known in enum FleetStatus');
  }
}

enum FleetType {
  onDemand,
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
  }
}

extension on String {
  FleetType toFleetType() {
    switch (this) {
      case 'ON_DEMAND':
        return FleetType.onDemand;
      case 'SPOT':
        return FleetType.spot;
    }
    throw Exception('$this is not known in enum FleetType');
  }
}

/// Current resource utilization statistics in a specified fleet or location.
/// The location value might refer to a fleet's remote location or its home
/// Region.
///
/// <b>Related actions</b>
///
/// <a>DescribeFleetUtilization</a> | <a>DescribeFleetLocationUtilization</a>
class FleetUtilization {
  /// The number of active game sessions that are currently being hosted across
  /// all instances in the fleet location.
  final int? activeGameSessionCount;

  /// The number of server processes in <code>ACTIVE</code> status that are
  /// currently running across all instances in the fleet location.
  final int? activeServerProcessCount;

  /// The number of active player sessions that are currently being hosted across
  /// all instances in the fleet location.
  final int? currentPlayerSessionCount;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet associated with the location.
  final String? fleetId;

  /// The fleet location for the fleet utilization information, expressed as an
  /// AWS Region code, such as <code>us-west-2</code>.
  final String? location;

  /// The maximum number of players allowed across all game sessions that are
  /// currently being hosted across all instances in the fleet location.
  final int? maximumPlayerSessionCount;

  FleetUtilization({
    this.activeGameSessionCount,
    this.activeServerProcessCount,
    this.currentPlayerSessionCount,
    this.fleetArn,
    this.fleetId,
    this.location,
    this.maximumPlayerSessionCount,
  });

  factory FleetUtilization.fromJson(Map<String, dynamic> json) {
    return FleetUtilization(
      activeGameSessionCount: json['ActiveGameSessionCount'] as int?,
      activeServerProcessCount: json['ActiveServerProcessCount'] as int?,
      currentPlayerSessionCount: json['CurrentPlayerSessionCount'] as int?,
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      location: json['Location'] as String?,
      maximumPlayerSessionCount: json['MaximumPlayerSessionCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeGameSessionCount = this.activeGameSessionCount;
    final activeServerProcessCount = this.activeServerProcessCount;
    final currentPlayerSessionCount = this.currentPlayerSessionCount;
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final location = this.location;
    final maximumPlayerSessionCount = this.maximumPlayerSessionCount;
    return {
      if (activeGameSessionCount != null)
        'ActiveGameSessionCount': activeGameSessionCount,
      if (activeServerProcessCount != null)
        'ActiveServerProcessCount': activeServerProcessCount,
      if (currentPlayerSessionCount != null)
        'CurrentPlayerSessionCount': currentPlayerSessionCount,
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (location != null) 'Location': location,
      if (maximumPlayerSessionCount != null)
        'MaximumPlayerSessionCount': maximumPlayerSessionCount,
    };
  }
}

enum FlexMatchMode {
  standalone,
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
  }
}

extension on String {
  FlexMatchMode toFlexMatchMode() {
    switch (this) {
      case 'STANDALONE':
        return FlexMatchMode.standalone;
      case 'WITH_QUEUE':
        return FlexMatchMode.withQueue;
    }
    throw Exception('$this is not known in enum FlexMatchMode');
  }
}

/// Set of key-value pairs that contain information about a game session. When
/// included in a game session request, these properties communicate details to
/// be used when setting up the new game session. For example, a game property
/// might specify a game mode, level, or map. Game properties are passed to the
/// game server process when initiating a new game session. For more
/// information, see the <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#gamelift-sdk-client-api-create">
/// GameLift Developer Guide</a>.
class GameProperty {
  /// The game property identifier.
  final String key;

  /// The game property value.
  final String value;

  GameProperty({
    required this.key,
    required this.value,
  });

  factory GameProperty.fromJson(Map<String, dynamic> json) {
    return GameProperty(
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

/// <b>This data type is used with the GameLift FleetIQ and game server
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
/// <b>Related actions</b>
///
/// <a>RegisterGameServer</a> | <a>ListGameServers</a> | <a>ClaimGameServer</a>
/// | <a>DescribeGameServer</a> | <a>UpdateGameServer</a> |
/// <a>DeregisterGameServer</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
/// APIs by task</a>
class GameServer {
  /// Indicates when an available game server has been reserved for gameplay but
  /// has not yet started hosting a game. Once it is claimed, the game server
  /// remains in <code>CLAIMED</code> status for a maximum of one minute. During
  /// this time, game clients connect to the game server to start the game and
  /// trigger the game server to update its utilization status. After one minute,
  /// the game server claim status reverts to null.
  final GameServerClaimStatus? claimStatus;

  /// The port and IP address that must be used to establish a client connection
  /// to the game server.
  final String? connectionInfo;

  /// A set of custom game server properties, formatted as a single string value.
  /// This data is passed to a game client or service when it requests information
  /// on game servers using <a>ListGameServers</a> or <a>ClaimGameServer</a>.
  final String? gameServerData;

  /// The ARN identifier for the game server group where the game server is
  /// located.
  final String? gameServerGroupArn;

  /// A unique identifier for the game server group where the game server is
  /// running. Use either the <a>GameServerGroup</a> name or ARN value.
  final String? gameServerGroupName;

  /// A custom string that uniquely identifies the game server. Game server IDs
  /// are developer-defined and are unique across all game server groups in an AWS
  /// account.
  final String? gameServerId;

  /// The unique identifier for the instance where the game server is running.
  /// This ID is available in the instance metadata. EC2 instance IDs use a
  /// 17-character format, for example: <code>i-1234567890abcdef0</code>.
  final String? instanceId;

  /// Timestamp that indicates the last time the game server was claimed with a
  /// <a>ClaimGameServer</a> request. The format is a number expressed in Unix
  /// time as milliseconds (for example <code>"1469498468.057"</code>). This value
  /// is used to calculate when a claimed game server's status should revert to
  /// null.
  final DateTime? lastClaimTime;

  /// Timestamp that indicates the last time the game server was updated with
  /// health status using an <a>UpdateGameServer</a> request. The format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>). After game server registration, this
  /// property is only changed when a game server update specifies a health check
  /// value.
  final DateTime? lastHealthCheckTime;

  /// Timestamp that indicates when the game server was created with a
  /// <a>RegisterGameServer</a> request. The format is a number expressed in Unix
  /// time as milliseconds (for example <code>"1469498468.057"</code>).
  final DateTime? registrationTime;

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
  final GameServerUtilizationStatus? utilizationStatus;

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

  factory GameServer.fromJson(Map<String, dynamic> json) {
    return GameServer(
      claimStatus: (json['ClaimStatus'] as String?)?.toGameServerClaimStatus(),
      connectionInfo: json['ConnectionInfo'] as String?,
      gameServerData: json['GameServerData'] as String?,
      gameServerGroupArn: json['GameServerGroupArn'] as String?,
      gameServerGroupName: json['GameServerGroupName'] as String?,
      gameServerId: json['GameServerId'] as String?,
      instanceId: json['InstanceId'] as String?,
      lastClaimTime: timeStampFromJson(json['LastClaimTime']),
      lastHealthCheckTime: timeStampFromJson(json['LastHealthCheckTime']),
      registrationTime: timeStampFromJson(json['RegistrationTime']),
      utilizationStatus: (json['UtilizationStatus'] as String?)
          ?.toGameServerUtilizationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final claimStatus = this.claimStatus;
    final connectionInfo = this.connectionInfo;
    final gameServerData = this.gameServerData;
    final gameServerGroupArn = this.gameServerGroupArn;
    final gameServerGroupName = this.gameServerGroupName;
    final gameServerId = this.gameServerId;
    final instanceId = this.instanceId;
    final lastClaimTime = this.lastClaimTime;
    final lastHealthCheckTime = this.lastHealthCheckTime;
    final registrationTime = this.registrationTime;
    final utilizationStatus = this.utilizationStatus;
    return {
      if (claimStatus != null) 'ClaimStatus': claimStatus.toValue(),
      if (connectionInfo != null) 'ConnectionInfo': connectionInfo,
      if (gameServerData != null) 'GameServerData': gameServerData,
      if (gameServerGroupArn != null) 'GameServerGroupArn': gameServerGroupArn,
      if (gameServerGroupName != null)
        'GameServerGroupName': gameServerGroupName,
      if (gameServerId != null) 'GameServerId': gameServerId,
      if (instanceId != null) 'InstanceId': instanceId,
      if (lastClaimTime != null)
        'LastClaimTime': unixTimestampToJson(lastClaimTime),
      if (lastHealthCheckTime != null)
        'LastHealthCheckTime': unixTimestampToJson(lastHealthCheckTime),
      if (registrationTime != null)
        'RegistrationTime': unixTimestampToJson(registrationTime),
      if (utilizationStatus != null)
        'UtilizationStatus': utilizationStatus.toValue(),
    };
  }
}

enum GameServerClaimStatus {
  claimed,
}

extension on GameServerClaimStatus {
  String toValue() {
    switch (this) {
      case GameServerClaimStatus.claimed:
        return 'CLAIMED';
    }
  }
}

extension on String {
  GameServerClaimStatus toGameServerClaimStatus() {
    switch (this) {
      case 'CLAIMED':
        return GameServerClaimStatus.claimed;
    }
    throw Exception('$this is not known in enum GameServerClaimStatus');
  }
}

/// <b>This data type is used with the GameLift FleetIQ and game server
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
/// <b>Related actions</b>
///
/// <a>CreateGameServerGroup</a> | <a>ListGameServerGroups</a> |
/// <a>DescribeGameServerGroup</a> | <a>UpdateGameServerGroup</a> |
/// <a>DeleteGameServerGroup</a> | <a>ResumeGameServerGroup</a> |
/// <a>SuspendGameServerGroup</a> | <a>DescribeGameServerInstances</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
/// APIs by task</a>
class GameServerGroup {
  /// A generated unique ID for the EC2 Auto Scaling group that is associated with
  /// this game server group.
  final String? autoScalingGroupArn;

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
  final BalancingStrategy? balancingStrategy;

  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// A generated unique ID for the game server group.
  final String? gameServerGroupArn;

  /// A developer-defined identifier for the game server group. The name is unique
  /// for each Region in each AWS account.
  final String? gameServerGroupName;

  /// A flag that indicates whether instances in the game server group are
  /// protected from early termination. Unprotected instances that have active
  /// game servers running might be terminated during a scale-down event, causing
  /// players to be dropped from the game. Protected instances cannot be
  /// terminated while there are active game servers running except in the event
  /// of a forced game server group deletion (see ). An exception to this is with
  /// Spot Instances, which can be terminated by AWS regardless of protection
  /// status.
  final GameServerProtectionPolicy? gameServerProtectionPolicy;

  /// The set of EC2 instance types that GameLift FleetIQ can use when balancing
  /// and automatically scaling instances in the corresponding Auto Scaling group.
  final List<InstanceDefinition>? instanceDefinitions;

  /// A timestamp that indicates when this game server group was last updated.
  final DateTime? lastUpdatedTime;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// for an IAM role that allows Amazon GameLift to access your EC2 Auto Scaling
  /// groups.
  final String? roleArn;

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
  final GameServerGroupStatus? status;

  /// Additional information about the current game server group status. This
  /// information might provide additional insight on groups that are in
  /// <code>ERROR</code> status.
  final String? statusReason;

  /// A list of activities that are currently suspended for this game server
  /// group. If this property is empty, all activities are occurring.
  final List<GameServerGroupAction>? suspendedActions;

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

  factory GameServerGroup.fromJson(Map<String, dynamic> json) {
    return GameServerGroup(
      autoScalingGroupArn: json['AutoScalingGroupArn'] as String?,
      balancingStrategy:
          (json['BalancingStrategy'] as String?)?.toBalancingStrategy(),
      creationTime: timeStampFromJson(json['CreationTime']),
      gameServerGroupArn: json['GameServerGroupArn'] as String?,
      gameServerGroupName: json['GameServerGroupName'] as String?,
      gameServerProtectionPolicy:
          (json['GameServerProtectionPolicy'] as String?)
              ?.toGameServerProtectionPolicy(),
      instanceDefinitions: (json['InstanceDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      roleArn: json['RoleArn'] as String?,
      status: (json['Status'] as String?)?.toGameServerGroupStatus(),
      statusReason: json['StatusReason'] as String?,
      suspendedActions: (json['SuspendedActions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toGameServerGroupAction())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingGroupArn = this.autoScalingGroupArn;
    final balancingStrategy = this.balancingStrategy;
    final creationTime = this.creationTime;
    final gameServerGroupArn = this.gameServerGroupArn;
    final gameServerGroupName = this.gameServerGroupName;
    final gameServerProtectionPolicy = this.gameServerProtectionPolicy;
    final instanceDefinitions = this.instanceDefinitions;
    final lastUpdatedTime = this.lastUpdatedTime;
    final roleArn = this.roleArn;
    final status = this.status;
    final statusReason = this.statusReason;
    final suspendedActions = this.suspendedActions;
    return {
      if (autoScalingGroupArn != null)
        'AutoScalingGroupArn': autoScalingGroupArn,
      if (balancingStrategy != null)
        'BalancingStrategy': balancingStrategy.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (gameServerGroupArn != null) 'GameServerGroupArn': gameServerGroupArn,
      if (gameServerGroupName != null)
        'GameServerGroupName': gameServerGroupName,
      if (gameServerProtectionPolicy != null)
        'GameServerProtectionPolicy': gameServerProtectionPolicy.toValue(),
      if (instanceDefinitions != null)
        'InstanceDefinitions': instanceDefinitions,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (roleArn != null) 'RoleArn': roleArn,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
      if (suspendedActions != null)
        'SuspendedActions': suspendedActions.map((e) => e.toValue()).toList(),
    };
  }
}

enum GameServerGroupAction {
  replaceInstanceTypes,
}

extension on GameServerGroupAction {
  String toValue() {
    switch (this) {
      case GameServerGroupAction.replaceInstanceTypes:
        return 'REPLACE_INSTANCE_TYPES';
    }
  }
}

extension on String {
  GameServerGroupAction toGameServerGroupAction() {
    switch (this) {
      case 'REPLACE_INSTANCE_TYPES':
        return GameServerGroupAction.replaceInstanceTypes;
    }
    throw Exception('$this is not known in enum GameServerGroupAction');
  }
}

/// <b>This data type is used with the GameLift FleetIQ and game server
/// groups.</b>
///
/// Configuration settings for intelligent automatic scaling that uses target
/// tracking. These settings are used to add an Auto Scaling policy when
/// creating the corresponding Auto Scaling group with
/// <a>CreateGameServerGroup</a>. After the Auto Scaling group is created, all
/// updates to Auto Scaling policies, including changing this policy and adding
/// or removing other policies, is done directly on the Auto Scaling group.
class GameServerGroupAutoScalingPolicy {
  /// Settings for a target-based scaling policy applied to Auto Scaling group.
  /// These settings are used to create a target-based policy that tracks the
  /// GameLift FleetIQ metric <code>"PercentUtilizedGameServers"</code> and
  /// specifies a target value for the metric. As player usage changes, the policy
  /// triggers to adjust the game server group capacity so that the metric returns
  /// to the target value.
  final TargetTrackingConfiguration targetTrackingConfiguration;

  /// Length of time, in seconds, it takes for a new instance to start new game
  /// server processes and register with GameLift FleetIQ. Specifying a warm-up
  /// time can be useful, particularly with game servers that take a long time to
  /// start up, because it avoids prematurely starting new instances.
  final int? estimatedInstanceWarmup;

  GameServerGroupAutoScalingPolicy({
    required this.targetTrackingConfiguration,
    this.estimatedInstanceWarmup,
  });

  factory GameServerGroupAutoScalingPolicy.fromJson(Map<String, dynamic> json) {
    return GameServerGroupAutoScalingPolicy(
      targetTrackingConfiguration: TargetTrackingConfiguration.fromJson(
          json['TargetTrackingConfiguration'] as Map<String, dynamic>),
      estimatedInstanceWarmup: json['EstimatedInstanceWarmup'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetTrackingConfiguration = this.targetTrackingConfiguration;
    final estimatedInstanceWarmup = this.estimatedInstanceWarmup;
    return {
      'TargetTrackingConfiguration': targetTrackingConfiguration,
      if (estimatedInstanceWarmup != null)
        'EstimatedInstanceWarmup': estimatedInstanceWarmup,
    };
  }
}

enum GameServerGroupDeleteOption {
  safeDelete,
  forceDelete,
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
  }
}

extension on String {
  GameServerGroupDeleteOption toGameServerGroupDeleteOption() {
    switch (this) {
      case 'SAFE_DELETE':
        return GameServerGroupDeleteOption.safeDelete;
      case 'FORCE_DELETE':
        return GameServerGroupDeleteOption.forceDelete;
      case 'RETAIN':
        return GameServerGroupDeleteOption.retain;
    }
    throw Exception('$this is not known in enum GameServerGroupDeleteOption');
  }
}

enum GameServerGroupInstanceType {
  c4Large,
  c4Xlarge,
  c4_2xlarge,
  c4_4xlarge,
  c4_8xlarge,
  c5Large,
  c5Xlarge,
  c5_2xlarge,
  c5_4xlarge,
  c5_9xlarge,
  c5_12xlarge,
  c5_18xlarge,
  c5_24xlarge,
  c5aLarge,
  c5aXlarge,
  c5a_2xlarge,
  c5a_4xlarge,
  c5a_8xlarge,
  c5a_12xlarge,
  c5a_16xlarge,
  c5a_24xlarge,
  r4Large,
  r4Xlarge,
  r4_2xlarge,
  r4_4xlarge,
  r4_8xlarge,
  r4_16xlarge,
  r5Large,
  r5Xlarge,
  r5_2xlarge,
  r5_4xlarge,
  r5_8xlarge,
  r5_12xlarge,
  r5_16xlarge,
  r5_24xlarge,
  r5aLarge,
  r5aXlarge,
  r5a_2xlarge,
  r5a_4xlarge,
  r5a_8xlarge,
  r5a_12xlarge,
  r5a_16xlarge,
  r5a_24xlarge,
  m4Large,
  m4Xlarge,
  m4_2xlarge,
  m4_4xlarge,
  m4_10xlarge,
  m5Large,
  m5Xlarge,
  m5_2xlarge,
  m5_4xlarge,
  m5_8xlarge,
  m5_12xlarge,
  m5_16xlarge,
  m5_24xlarge,
  m5aLarge,
  m5aXlarge,
  m5a_2xlarge,
  m5a_4xlarge,
  m5a_8xlarge,
  m5a_12xlarge,
  m5a_16xlarge,
  m5a_24xlarge,
}

extension on GameServerGroupInstanceType {
  String toValue() {
    switch (this) {
      case GameServerGroupInstanceType.c4Large:
        return 'c4.large';
      case GameServerGroupInstanceType.c4Xlarge:
        return 'c4.xlarge';
      case GameServerGroupInstanceType.c4_2xlarge:
        return 'c4.2xlarge';
      case GameServerGroupInstanceType.c4_4xlarge:
        return 'c4.4xlarge';
      case GameServerGroupInstanceType.c4_8xlarge:
        return 'c4.8xlarge';
      case GameServerGroupInstanceType.c5Large:
        return 'c5.large';
      case GameServerGroupInstanceType.c5Xlarge:
        return 'c5.xlarge';
      case GameServerGroupInstanceType.c5_2xlarge:
        return 'c5.2xlarge';
      case GameServerGroupInstanceType.c5_4xlarge:
        return 'c5.4xlarge';
      case GameServerGroupInstanceType.c5_9xlarge:
        return 'c5.9xlarge';
      case GameServerGroupInstanceType.c5_12xlarge:
        return 'c5.12xlarge';
      case GameServerGroupInstanceType.c5_18xlarge:
        return 'c5.18xlarge';
      case GameServerGroupInstanceType.c5_24xlarge:
        return 'c5.24xlarge';
      case GameServerGroupInstanceType.c5aLarge:
        return 'c5a.large';
      case GameServerGroupInstanceType.c5aXlarge:
        return 'c5a.xlarge';
      case GameServerGroupInstanceType.c5a_2xlarge:
        return 'c5a.2xlarge';
      case GameServerGroupInstanceType.c5a_4xlarge:
        return 'c5a.4xlarge';
      case GameServerGroupInstanceType.c5a_8xlarge:
        return 'c5a.8xlarge';
      case GameServerGroupInstanceType.c5a_12xlarge:
        return 'c5a.12xlarge';
      case GameServerGroupInstanceType.c5a_16xlarge:
        return 'c5a.16xlarge';
      case GameServerGroupInstanceType.c5a_24xlarge:
        return 'c5a.24xlarge';
      case GameServerGroupInstanceType.r4Large:
        return 'r4.large';
      case GameServerGroupInstanceType.r4Xlarge:
        return 'r4.xlarge';
      case GameServerGroupInstanceType.r4_2xlarge:
        return 'r4.2xlarge';
      case GameServerGroupInstanceType.r4_4xlarge:
        return 'r4.4xlarge';
      case GameServerGroupInstanceType.r4_8xlarge:
        return 'r4.8xlarge';
      case GameServerGroupInstanceType.r4_16xlarge:
        return 'r4.16xlarge';
      case GameServerGroupInstanceType.r5Large:
        return 'r5.large';
      case GameServerGroupInstanceType.r5Xlarge:
        return 'r5.xlarge';
      case GameServerGroupInstanceType.r5_2xlarge:
        return 'r5.2xlarge';
      case GameServerGroupInstanceType.r5_4xlarge:
        return 'r5.4xlarge';
      case GameServerGroupInstanceType.r5_8xlarge:
        return 'r5.8xlarge';
      case GameServerGroupInstanceType.r5_12xlarge:
        return 'r5.12xlarge';
      case GameServerGroupInstanceType.r5_16xlarge:
        return 'r5.16xlarge';
      case GameServerGroupInstanceType.r5_24xlarge:
        return 'r5.24xlarge';
      case GameServerGroupInstanceType.r5aLarge:
        return 'r5a.large';
      case GameServerGroupInstanceType.r5aXlarge:
        return 'r5a.xlarge';
      case GameServerGroupInstanceType.r5a_2xlarge:
        return 'r5a.2xlarge';
      case GameServerGroupInstanceType.r5a_4xlarge:
        return 'r5a.4xlarge';
      case GameServerGroupInstanceType.r5a_8xlarge:
        return 'r5a.8xlarge';
      case GameServerGroupInstanceType.r5a_12xlarge:
        return 'r5a.12xlarge';
      case GameServerGroupInstanceType.r5a_16xlarge:
        return 'r5a.16xlarge';
      case GameServerGroupInstanceType.r5a_24xlarge:
        return 'r5a.24xlarge';
      case GameServerGroupInstanceType.m4Large:
        return 'm4.large';
      case GameServerGroupInstanceType.m4Xlarge:
        return 'm4.xlarge';
      case GameServerGroupInstanceType.m4_2xlarge:
        return 'm4.2xlarge';
      case GameServerGroupInstanceType.m4_4xlarge:
        return 'm4.4xlarge';
      case GameServerGroupInstanceType.m4_10xlarge:
        return 'm4.10xlarge';
      case GameServerGroupInstanceType.m5Large:
        return 'm5.large';
      case GameServerGroupInstanceType.m5Xlarge:
        return 'm5.xlarge';
      case GameServerGroupInstanceType.m5_2xlarge:
        return 'm5.2xlarge';
      case GameServerGroupInstanceType.m5_4xlarge:
        return 'm5.4xlarge';
      case GameServerGroupInstanceType.m5_8xlarge:
        return 'm5.8xlarge';
      case GameServerGroupInstanceType.m5_12xlarge:
        return 'm5.12xlarge';
      case GameServerGroupInstanceType.m5_16xlarge:
        return 'm5.16xlarge';
      case GameServerGroupInstanceType.m5_24xlarge:
        return 'm5.24xlarge';
      case GameServerGroupInstanceType.m5aLarge:
        return 'm5a.large';
      case GameServerGroupInstanceType.m5aXlarge:
        return 'm5a.xlarge';
      case GameServerGroupInstanceType.m5a_2xlarge:
        return 'm5a.2xlarge';
      case GameServerGroupInstanceType.m5a_4xlarge:
        return 'm5a.4xlarge';
      case GameServerGroupInstanceType.m5a_8xlarge:
        return 'm5a.8xlarge';
      case GameServerGroupInstanceType.m5a_12xlarge:
        return 'm5a.12xlarge';
      case GameServerGroupInstanceType.m5a_16xlarge:
        return 'm5a.16xlarge';
      case GameServerGroupInstanceType.m5a_24xlarge:
        return 'm5a.24xlarge';
    }
  }
}

extension on String {
  GameServerGroupInstanceType toGameServerGroupInstanceType() {
    switch (this) {
      case 'c4.large':
        return GameServerGroupInstanceType.c4Large;
      case 'c4.xlarge':
        return GameServerGroupInstanceType.c4Xlarge;
      case 'c4.2xlarge':
        return GameServerGroupInstanceType.c4_2xlarge;
      case 'c4.4xlarge':
        return GameServerGroupInstanceType.c4_4xlarge;
      case 'c4.8xlarge':
        return GameServerGroupInstanceType.c4_8xlarge;
      case 'c5.large':
        return GameServerGroupInstanceType.c5Large;
      case 'c5.xlarge':
        return GameServerGroupInstanceType.c5Xlarge;
      case 'c5.2xlarge':
        return GameServerGroupInstanceType.c5_2xlarge;
      case 'c5.4xlarge':
        return GameServerGroupInstanceType.c5_4xlarge;
      case 'c5.9xlarge':
        return GameServerGroupInstanceType.c5_9xlarge;
      case 'c5.12xlarge':
        return GameServerGroupInstanceType.c5_12xlarge;
      case 'c5.18xlarge':
        return GameServerGroupInstanceType.c5_18xlarge;
      case 'c5.24xlarge':
        return GameServerGroupInstanceType.c5_24xlarge;
      case 'c5a.large':
        return GameServerGroupInstanceType.c5aLarge;
      case 'c5a.xlarge':
        return GameServerGroupInstanceType.c5aXlarge;
      case 'c5a.2xlarge':
        return GameServerGroupInstanceType.c5a_2xlarge;
      case 'c5a.4xlarge':
        return GameServerGroupInstanceType.c5a_4xlarge;
      case 'c5a.8xlarge':
        return GameServerGroupInstanceType.c5a_8xlarge;
      case 'c5a.12xlarge':
        return GameServerGroupInstanceType.c5a_12xlarge;
      case 'c5a.16xlarge':
        return GameServerGroupInstanceType.c5a_16xlarge;
      case 'c5a.24xlarge':
        return GameServerGroupInstanceType.c5a_24xlarge;
      case 'r4.large':
        return GameServerGroupInstanceType.r4Large;
      case 'r4.xlarge':
        return GameServerGroupInstanceType.r4Xlarge;
      case 'r4.2xlarge':
        return GameServerGroupInstanceType.r4_2xlarge;
      case 'r4.4xlarge':
        return GameServerGroupInstanceType.r4_4xlarge;
      case 'r4.8xlarge':
        return GameServerGroupInstanceType.r4_8xlarge;
      case 'r4.16xlarge':
        return GameServerGroupInstanceType.r4_16xlarge;
      case 'r5.large':
        return GameServerGroupInstanceType.r5Large;
      case 'r5.xlarge':
        return GameServerGroupInstanceType.r5Xlarge;
      case 'r5.2xlarge':
        return GameServerGroupInstanceType.r5_2xlarge;
      case 'r5.4xlarge':
        return GameServerGroupInstanceType.r5_4xlarge;
      case 'r5.8xlarge':
        return GameServerGroupInstanceType.r5_8xlarge;
      case 'r5.12xlarge':
        return GameServerGroupInstanceType.r5_12xlarge;
      case 'r5.16xlarge':
        return GameServerGroupInstanceType.r5_16xlarge;
      case 'r5.24xlarge':
        return GameServerGroupInstanceType.r5_24xlarge;
      case 'r5a.large':
        return GameServerGroupInstanceType.r5aLarge;
      case 'r5a.xlarge':
        return GameServerGroupInstanceType.r5aXlarge;
      case 'r5a.2xlarge':
        return GameServerGroupInstanceType.r5a_2xlarge;
      case 'r5a.4xlarge':
        return GameServerGroupInstanceType.r5a_4xlarge;
      case 'r5a.8xlarge':
        return GameServerGroupInstanceType.r5a_8xlarge;
      case 'r5a.12xlarge':
        return GameServerGroupInstanceType.r5a_12xlarge;
      case 'r5a.16xlarge':
        return GameServerGroupInstanceType.r5a_16xlarge;
      case 'r5a.24xlarge':
        return GameServerGroupInstanceType.r5a_24xlarge;
      case 'm4.large':
        return GameServerGroupInstanceType.m4Large;
      case 'm4.xlarge':
        return GameServerGroupInstanceType.m4Xlarge;
      case 'm4.2xlarge':
        return GameServerGroupInstanceType.m4_2xlarge;
      case 'm4.4xlarge':
        return GameServerGroupInstanceType.m4_4xlarge;
      case 'm4.10xlarge':
        return GameServerGroupInstanceType.m4_10xlarge;
      case 'm5.large':
        return GameServerGroupInstanceType.m5Large;
      case 'm5.xlarge':
        return GameServerGroupInstanceType.m5Xlarge;
      case 'm5.2xlarge':
        return GameServerGroupInstanceType.m5_2xlarge;
      case 'm5.4xlarge':
        return GameServerGroupInstanceType.m5_4xlarge;
      case 'm5.8xlarge':
        return GameServerGroupInstanceType.m5_8xlarge;
      case 'm5.12xlarge':
        return GameServerGroupInstanceType.m5_12xlarge;
      case 'm5.16xlarge':
        return GameServerGroupInstanceType.m5_16xlarge;
      case 'm5.24xlarge':
        return GameServerGroupInstanceType.m5_24xlarge;
      case 'm5a.large':
        return GameServerGroupInstanceType.m5aLarge;
      case 'm5a.xlarge':
        return GameServerGroupInstanceType.m5aXlarge;
      case 'm5a.2xlarge':
        return GameServerGroupInstanceType.m5a_2xlarge;
      case 'm5a.4xlarge':
        return GameServerGroupInstanceType.m5a_4xlarge;
      case 'm5a.8xlarge':
        return GameServerGroupInstanceType.m5a_8xlarge;
      case 'm5a.12xlarge':
        return GameServerGroupInstanceType.m5a_12xlarge;
      case 'm5a.16xlarge':
        return GameServerGroupInstanceType.m5a_16xlarge;
      case 'm5a.24xlarge':
        return GameServerGroupInstanceType.m5a_24xlarge;
    }
    throw Exception('$this is not known in enum GameServerGroupInstanceType');
  }
}

enum GameServerGroupStatus {
  $new,
  activating,
  active,
  deleteScheduled,
  deleting,
  deleted,
  error,
}

extension on GameServerGroupStatus {
  String toValue() {
    switch (this) {
      case GameServerGroupStatus.$new:
        return 'NEW';
      case GameServerGroupStatus.activating:
        return 'ACTIVATING';
      case GameServerGroupStatus.active:
        return 'ACTIVE';
      case GameServerGroupStatus.deleteScheduled:
        return 'DELETE_SCHEDULED';
      case GameServerGroupStatus.deleting:
        return 'DELETING';
      case GameServerGroupStatus.deleted:
        return 'DELETED';
      case GameServerGroupStatus.error:
        return 'ERROR';
    }
  }
}

extension on String {
  GameServerGroupStatus toGameServerGroupStatus() {
    switch (this) {
      case 'NEW':
        return GameServerGroupStatus.$new;
      case 'ACTIVATING':
        return GameServerGroupStatus.activating;
      case 'ACTIVE':
        return GameServerGroupStatus.active;
      case 'DELETE_SCHEDULED':
        return GameServerGroupStatus.deleteScheduled;
      case 'DELETING':
        return GameServerGroupStatus.deleting;
      case 'DELETED':
        return GameServerGroupStatus.deleted;
      case 'ERROR':
        return GameServerGroupStatus.error;
    }
    throw Exception('$this is not known in enum GameServerGroupStatus');
  }
}

enum GameServerHealthCheck {
  healthy,
}

extension on GameServerHealthCheck {
  String toValue() {
    switch (this) {
      case GameServerHealthCheck.healthy:
        return 'HEALTHY';
    }
  }
}

extension on String {
  GameServerHealthCheck toGameServerHealthCheck() {
    switch (this) {
      case 'HEALTHY':
        return GameServerHealthCheck.healthy;
    }
    throw Exception('$this is not known in enum GameServerHealthCheck');
  }
}

/// <b>This data type is used with the GameLift FleetIQ and game server
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
/// <b>Related actions</b>
///
/// <a>CreateGameServerGroup</a> | <a>ListGameServerGroups</a> |
/// <a>DescribeGameServerGroup</a> | <a>UpdateGameServerGroup</a> |
/// <a>DeleteGameServerGroup</a> | <a>ResumeGameServerGroup</a> |
/// <a>SuspendGameServerGroup</a> | <a>DescribeGameServerInstances</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/fleetiqguide/reference-awssdk-fleetiq.html">All
/// APIs by task</a>
class GameServerInstance {
  /// A generated unique identifier for the game server group that includes the
  /// game server instance.
  final String? gameServerGroupArn;

  /// A developer-defined identifier for the game server group that includes the
  /// game server instance. The name is unique for each Region in each AWS
  /// account.
  final String? gameServerGroupName;

  /// The unique identifier for the instance where the game server is running.
  /// This ID is available in the instance metadata. EC2 instance IDs use a
  /// 17-character format, for example: <code>i-1234567890abcdef0</code>.
  final String? instanceId;

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
  final GameServerInstanceStatus? instanceStatus;

  GameServerInstance({
    this.gameServerGroupArn,
    this.gameServerGroupName,
    this.instanceId,
    this.instanceStatus,
  });

  factory GameServerInstance.fromJson(Map<String, dynamic> json) {
    return GameServerInstance(
      gameServerGroupArn: json['GameServerGroupArn'] as String?,
      gameServerGroupName: json['GameServerGroupName'] as String?,
      instanceId: json['InstanceId'] as String?,
      instanceStatus:
          (json['InstanceStatus'] as String?)?.toGameServerInstanceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final gameServerGroupArn = this.gameServerGroupArn;
    final gameServerGroupName = this.gameServerGroupName;
    final instanceId = this.instanceId;
    final instanceStatus = this.instanceStatus;
    return {
      if (gameServerGroupArn != null) 'GameServerGroupArn': gameServerGroupArn,
      if (gameServerGroupName != null)
        'GameServerGroupName': gameServerGroupName,
      if (instanceId != null) 'InstanceId': instanceId,
      if (instanceStatus != null) 'InstanceStatus': instanceStatus.toValue(),
    };
  }
}

enum GameServerInstanceStatus {
  active,
  draining,
  spotTerminating,
}

extension on GameServerInstanceStatus {
  String toValue() {
    switch (this) {
      case GameServerInstanceStatus.active:
        return 'ACTIVE';
      case GameServerInstanceStatus.draining:
        return 'DRAINING';
      case GameServerInstanceStatus.spotTerminating:
        return 'SPOT_TERMINATING';
    }
  }
}

extension on String {
  GameServerInstanceStatus toGameServerInstanceStatus() {
    switch (this) {
      case 'ACTIVE':
        return GameServerInstanceStatus.active;
      case 'DRAINING':
        return GameServerInstanceStatus.draining;
      case 'SPOT_TERMINATING':
        return GameServerInstanceStatus.spotTerminating;
    }
    throw Exception('$this is not known in enum GameServerInstanceStatus');
  }
}

enum GameServerProtectionPolicy {
  noProtection,
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
  }
}

extension on String {
  GameServerProtectionPolicy toGameServerProtectionPolicy() {
    switch (this) {
      case 'NO_PROTECTION':
        return GameServerProtectionPolicy.noProtection;
      case 'FULL_PROTECTION':
        return GameServerProtectionPolicy.fullProtection;
    }
    throw Exception('$this is not known in enum GameServerProtectionPolicy');
  }
}

enum GameServerUtilizationStatus {
  available,
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
  }
}

extension on String {
  GameServerUtilizationStatus toGameServerUtilizationStatus() {
    switch (this) {
      case 'AVAILABLE':
        return GameServerUtilizationStatus.available;
      case 'UTILIZED':
        return GameServerUtilizationStatus.utilized;
    }
    throw Exception('$this is not known in enum GameServerUtilizationStatus');
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
/// <b>Related actions</b>
///
/// <a>CreateGameSession</a> | <a>DescribeGameSessions</a> |
/// <a>DescribeGameSessionDetails</a> | <a>SearchGameSessions</a> |
/// <a>UpdateGameSession</a> | <a>GetGameSessionLogUrl</a> |
/// <a>StartGameSessionPlacement</a> | <a>DescribeGameSessionPlacement</a> |
/// <a>StopGameSessionPlacement</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class GameSession {
  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// A unique identifier for a player. This ID is used to enforce a resource
  /// protection policy (if one exists), that limits the number of game sessions a
  /// player can create.
  final String? creatorId;

  /// Number of players currently in the game session.
  final int? currentPlayerSessionCount;

  /// The DNS identifier assigned to the instance that is running the game
  /// session. Values have the following format:
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
  final String? dnsName;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// associated with the GameLift fleet that this game session is running on.
  final String? fleetArn;

  /// A unique identifier for the fleet that the game session is running on.
  final String? fleetId;

  /// A set of custom properties for a game session, formatted as key:value pairs.
  /// These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session. You
  /// can search for active game sessions based on this custom data with
  /// <a>SearchGameSessions</a>.
  final List<GameProperty>? gameProperties;

  /// A set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the <a>GameSession</a>
  /// object with a request to start a new game session.
  final String? gameSessionData;

  /// A unique identifier for the game session. A game session ARN has the
  /// following format:
  /// <code>arn:aws:gamelift:&lt;region&gt;::gamesession/&lt;fleet
  /// ID&gt;/&lt;custom ID string or idempotency token&gt;</code>.
  final String? gameSessionId;

  /// The IP address of the game session. To connect to a GameLift game server, an
  /// app needs both the IP address and port number.
  final String? ipAddress;

  /// The fleet location where the game session is running. This value might
  /// specify the fleet's home Region or a remote location. Location is expressed
  /// as an AWS Region code such as <code>us-west-2</code>.
  final String? location;

  /// Information about the matchmaking process that was used to create the game
  /// session. It is in JSON syntax, formatted as a string. In addition the
  /// matchmaking configuration used, it contains data on all players assigned to
  /// the match, including player attributes and team assignments. For more
  /// details on matchmaker data, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-server.html#match-server-data">Match
  /// Data</a>. Matchmaker data is useful when requesting match backfills, and is
  /// updated whenever new players are added during a successful backfill (see
  /// <a>StartMatchBackfill</a>).
  final String? matchmakerData;

  /// The maximum number of players that can be connected simultaneously to the
  /// game session.
  final int? maximumPlayerSessionCount;

  /// A descriptive label that is associated with a game session. Session names do
  /// not need to be unique.
  final String? name;

  /// Indicates whether or not the game session is accepting new players.
  final PlayerSessionCreationPolicy? playerSessionCreationPolicy;

  /// The port number for the game session. To connect to a GameLift game server,
  /// an app needs both the IP address and port number.
  final int? port;

  /// Current status of the game session. A game session must have an
  /// <code>ACTIVE</code> status to have player sessions.
  final GameSessionStatus? status;

  /// Provides additional information about game session status.
  /// <code>INTERRUPTED</code> indicates that the game session was hosted on a
  /// spot instance that was reclaimed, causing the active game session to be
  /// terminated.
  final GameSessionStatusReason? statusReason;

  /// A time stamp indicating when this data object was terminated. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? terminationTime;

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
    this.location,
    this.matchmakerData,
    this.maximumPlayerSessionCount,
    this.name,
    this.playerSessionCreationPolicy,
    this.port,
    this.status,
    this.statusReason,
    this.terminationTime,
  });

  factory GameSession.fromJson(Map<String, dynamic> json) {
    return GameSession(
      creationTime: timeStampFromJson(json['CreationTime']),
      creatorId: json['CreatorId'] as String?,
      currentPlayerSessionCount: json['CurrentPlayerSessionCount'] as int?,
      dnsName: json['DnsName'] as String?,
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      gameProperties: (json['GameProperties'] as List?)
          ?.whereNotNull()
          .map((e) => GameProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameSessionData: json['GameSessionData'] as String?,
      gameSessionId: json['GameSessionId'] as String?,
      ipAddress: json['IpAddress'] as String?,
      location: json['Location'] as String?,
      matchmakerData: json['MatchmakerData'] as String?,
      maximumPlayerSessionCount: json['MaximumPlayerSessionCount'] as int?,
      name: json['Name'] as String?,
      playerSessionCreationPolicy:
          (json['PlayerSessionCreationPolicy'] as String?)
              ?.toPlayerSessionCreationPolicy(),
      port: json['Port'] as int?,
      status: (json['Status'] as String?)?.toGameSessionStatus(),
      statusReason:
          (json['StatusReason'] as String?)?.toGameSessionStatusReason(),
      terminationTime: timeStampFromJson(json['TerminationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final creatorId = this.creatorId;
    final currentPlayerSessionCount = this.currentPlayerSessionCount;
    final dnsName = this.dnsName;
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final gameProperties = this.gameProperties;
    final gameSessionData = this.gameSessionData;
    final gameSessionId = this.gameSessionId;
    final ipAddress = this.ipAddress;
    final location = this.location;
    final matchmakerData = this.matchmakerData;
    final maximumPlayerSessionCount = this.maximumPlayerSessionCount;
    final name = this.name;
    final playerSessionCreationPolicy = this.playerSessionCreationPolicy;
    final port = this.port;
    final status = this.status;
    final statusReason = this.statusReason;
    final terminationTime = this.terminationTime;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (creatorId != null) 'CreatorId': creatorId,
      if (currentPlayerSessionCount != null)
        'CurrentPlayerSessionCount': currentPlayerSessionCount,
      if (dnsName != null) 'DnsName': dnsName,
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (gameProperties != null) 'GameProperties': gameProperties,
      if (gameSessionData != null) 'GameSessionData': gameSessionData,
      if (gameSessionId != null) 'GameSessionId': gameSessionId,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (location != null) 'Location': location,
      if (matchmakerData != null) 'MatchmakerData': matchmakerData,
      if (maximumPlayerSessionCount != null)
        'MaximumPlayerSessionCount': maximumPlayerSessionCount,
      if (name != null) 'Name': name,
      if (playerSessionCreationPolicy != null)
        'PlayerSessionCreationPolicy': playerSessionCreationPolicy.toValue(),
      if (port != null) 'Port': port,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason.toValue(),
      if (terminationTime != null)
        'TerminationTime': unixTimestampToJson(terminationTime),
    };
  }
}

/// Connection information for a new game session that is created in response to
/// a <a>StartMatchmaking</a> request. Once a match is made, the FlexMatch
/// engine creates a new game session for it. This information, including the
/// game session endpoint and player sessions for each player in the original
/// matchmaking request, is added to the <a>MatchmakingTicket</a>, which can be
/// retrieved by calling <a>DescribeMatchmaking</a>.
class GameSessionConnectionInfo {
  /// The DNS identifier assigned to the instance that is running the game
  /// session. Values have the following format:
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
  final String? dnsName;

  /// A unique identifier for the game session. Use the game session ID.
  final String? gameSessionArn;

  /// The IP address of the game session. To connect to a GameLift game server, an
  /// app needs both the IP address and port number.
  final String? ipAddress;

  /// A collection of player session IDs, one for each player ID that was included
  /// in the original matchmaking request.
  final List<MatchedPlayerSession>? matchedPlayerSessions;

  /// The port number for the game session. To connect to a GameLift game server,
  /// an app needs both the IP address and port number.
  final int? port;

  GameSessionConnectionInfo({
    this.dnsName,
    this.gameSessionArn,
    this.ipAddress,
    this.matchedPlayerSessions,
    this.port,
  });

  factory GameSessionConnectionInfo.fromJson(Map<String, dynamic> json) {
    return GameSessionConnectionInfo(
      dnsName: json['DnsName'] as String?,
      gameSessionArn: json['GameSessionArn'] as String?,
      ipAddress: json['IpAddress'] as String?,
      matchedPlayerSessions: (json['MatchedPlayerSessions'] as List?)
          ?.whereNotNull()
          .map((e) => MatchedPlayerSession.fromJson(e as Map<String, dynamic>))
          .toList(),
      port: json['Port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dnsName = this.dnsName;
    final gameSessionArn = this.gameSessionArn;
    final ipAddress = this.ipAddress;
    final matchedPlayerSessions = this.matchedPlayerSessions;
    final port = this.port;
    return {
      if (dnsName != null) 'DnsName': dnsName,
      if (gameSessionArn != null) 'GameSessionArn': gameSessionArn,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (matchedPlayerSessions != null)
        'MatchedPlayerSessions': matchedPlayerSessions,
      if (port != null) 'Port': port,
    };
  }
}

/// A game session's properties plus the protection policy currently in force.
class GameSessionDetail {
  /// Object that describes a game session.
  final GameSession? gameSession;

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
  final ProtectionPolicy? protectionPolicy;

  GameSessionDetail({
    this.gameSession,
    this.protectionPolicy,
  });

  factory GameSessionDetail.fromJson(Map<String, dynamic> json) {
    return GameSessionDetail(
      gameSession: json['GameSession'] != null
          ? GameSession.fromJson(json['GameSession'] as Map<String, dynamic>)
          : null,
      protectionPolicy:
          (json['ProtectionPolicy'] as String?)?.toProtectionPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final gameSession = this.gameSession;
    final protectionPolicy = this.protectionPolicy;
    return {
      if (gameSession != null) 'GameSession': gameSession,
      if (protectionPolicy != null)
        'ProtectionPolicy': protectionPolicy.toValue(),
    };
  }
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
class GameSessionPlacement {
  /// The DNS identifier assigned to the instance that is running the game
  /// session. Values have the following format:
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
  final String? dnsName;

  /// Time stamp indicating when this request was completed, canceled, or timed
  /// out.
  final DateTime? endTime;

  /// A set of custom properties for a game session, formatted as key:value pairs.
  /// These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  final List<GameProperty>? gameProperties;

  /// Identifier for the game session created by this placement request. This
  /// value is set once the new game session is placed (placement status is
  /// <code>FULFILLED</code>). This identifier is unique across all Regions. You
  /// can use this value as a <code>GameSessionId</code> value as needed.
  final String? gameSessionArn;

  /// A set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the <a>GameSession</a>
  /// object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>).
  final String? gameSessionData;

  /// A unique identifier for the game session. This value is set once the new
  /// game session is placed (placement status is <code>FULFILLED</code>).
  final String? gameSessionId;

  /// A descriptive label that is associated with a game session. Session names do
  /// not need to be unique.
  final String? gameSessionName;

  /// A descriptive label that is associated with game session queue. Queue names
  /// must be unique within each Region.
  final String? gameSessionQueueName;

  /// Name of the Region where the game session created by this placement request
  /// is running. This value is set once the new game session is placed (placement
  /// status is <code>FULFILLED</code>).
  final String? gameSessionRegion;

  /// The IP address of the game session. To connect to a GameLift game server, an
  /// app needs both the IP address and port number. This value is set once the
  /// new game session is placed (placement status is <code>FULFILLED</code>).
  final String? ipAddress;

  /// Information on the matchmaking process for this game. Data is in JSON
  /// syntax, formatted as a string. It identifies the matchmaking configuration
  /// used to create the match, and contains data on all players assigned to the
  /// match, including player attributes and team assignments. For more details on
  /// matchmaker data, see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-server.html#match-server-data">Match
  /// Data</a>.
  final String? matchmakerData;

  /// The maximum number of players that can be connected simultaneously to the
  /// game session.
  final int? maximumPlayerSessionCount;

  /// A collection of information on player sessions created in response to the
  /// game session placement request. These player sessions are created only once
  /// a new game session is successfully placed (placement status is
  /// <code>FULFILLED</code>). This information includes the player ID (as
  /// provided in the placement request) and the corresponding player session ID.
  /// Retrieve full player sessions by calling <a>DescribePlayerSessions</a> with
  /// the player session ID.
  final List<PlacedPlayerSession>? placedPlayerSessions;

  /// A unique identifier for a game session placement.
  final String? placementId;

  /// A set of values, expressed in milliseconds, that indicates the amount of
  /// latency that a player experiences when connected to AWS Regions.
  final List<PlayerLatency>? playerLatencies;

  /// The port number for the game session. To connect to a GameLift game server,
  /// an app needs both the IP address and port number. This value is set once the
  /// new game session is placed (placement status is <code>FULFILLED</code>).
  final int? port;

  /// Time stamp indicating when this request was placed in the queue. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? startTime;

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
  final GameSessionPlacementState? status;

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

  factory GameSessionPlacement.fromJson(Map<String, dynamic> json) {
    return GameSessionPlacement(
      dnsName: json['DnsName'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      gameProperties: (json['GameProperties'] as List?)
          ?.whereNotNull()
          .map((e) => GameProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameSessionArn: json['GameSessionArn'] as String?,
      gameSessionData: json['GameSessionData'] as String?,
      gameSessionId: json['GameSessionId'] as String?,
      gameSessionName: json['GameSessionName'] as String?,
      gameSessionQueueName: json['GameSessionQueueName'] as String?,
      gameSessionRegion: json['GameSessionRegion'] as String?,
      ipAddress: json['IpAddress'] as String?,
      matchmakerData: json['MatchmakerData'] as String?,
      maximumPlayerSessionCount: json['MaximumPlayerSessionCount'] as int?,
      placedPlayerSessions: (json['PlacedPlayerSessions'] as List?)
          ?.whereNotNull()
          .map((e) => PlacedPlayerSession.fromJson(e as Map<String, dynamic>))
          .toList(),
      placementId: json['PlacementId'] as String?,
      playerLatencies: (json['PlayerLatencies'] as List?)
          ?.whereNotNull()
          .map((e) => PlayerLatency.fromJson(e as Map<String, dynamic>))
          .toList(),
      port: json['Port'] as int?,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toGameSessionPlacementState(),
    );
  }

  Map<String, dynamic> toJson() {
    final dnsName = this.dnsName;
    final endTime = this.endTime;
    final gameProperties = this.gameProperties;
    final gameSessionArn = this.gameSessionArn;
    final gameSessionData = this.gameSessionData;
    final gameSessionId = this.gameSessionId;
    final gameSessionName = this.gameSessionName;
    final gameSessionQueueName = this.gameSessionQueueName;
    final gameSessionRegion = this.gameSessionRegion;
    final ipAddress = this.ipAddress;
    final matchmakerData = this.matchmakerData;
    final maximumPlayerSessionCount = this.maximumPlayerSessionCount;
    final placedPlayerSessions = this.placedPlayerSessions;
    final placementId = this.placementId;
    final playerLatencies = this.playerLatencies;
    final port = this.port;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (dnsName != null) 'DnsName': dnsName,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (gameProperties != null) 'GameProperties': gameProperties,
      if (gameSessionArn != null) 'GameSessionArn': gameSessionArn,
      if (gameSessionData != null) 'GameSessionData': gameSessionData,
      if (gameSessionId != null) 'GameSessionId': gameSessionId,
      if (gameSessionName != null) 'GameSessionName': gameSessionName,
      if (gameSessionQueueName != null)
        'GameSessionQueueName': gameSessionQueueName,
      if (gameSessionRegion != null) 'GameSessionRegion': gameSessionRegion,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (matchmakerData != null) 'MatchmakerData': matchmakerData,
      if (maximumPlayerSessionCount != null)
        'MaximumPlayerSessionCount': maximumPlayerSessionCount,
      if (placedPlayerSessions != null)
        'PlacedPlayerSessions': placedPlayerSessions,
      if (placementId != null) 'PlacementId': placementId,
      if (playerLatencies != null) 'PlayerLatencies': playerLatencies,
      if (port != null) 'Port': port,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum GameSessionPlacementState {
  pending,
  fulfilled,
  cancelled,
  timedOut,
  failed,
}

extension on GameSessionPlacementState {
  String toValue() {
    switch (this) {
      case GameSessionPlacementState.pending:
        return 'PENDING';
      case GameSessionPlacementState.fulfilled:
        return 'FULFILLED';
      case GameSessionPlacementState.cancelled:
        return 'CANCELLED';
      case GameSessionPlacementState.timedOut:
        return 'TIMED_OUT';
      case GameSessionPlacementState.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  GameSessionPlacementState toGameSessionPlacementState() {
    switch (this) {
      case 'PENDING':
        return GameSessionPlacementState.pending;
      case 'FULFILLED':
        return GameSessionPlacementState.fulfilled;
      case 'CANCELLED':
        return GameSessionPlacementState.cancelled;
      case 'TIMED_OUT':
        return GameSessionPlacementState.timedOut;
      case 'FAILED':
        return GameSessionPlacementState.failed;
    }
    throw Exception('$this is not known in enum GameSessionPlacementState');
  }
}

/// Configuration for a game session placement mechanism that processes requests
/// for new game sessions. A queue can be used on its own or as part of a
/// matchmaking solution.
///
/// <b>Related actions</b>
///
/// <a>CreateGameSessionQueue</a> | <a>DescribeGameSessionQueues</a> |
/// <a>UpdateGameSessionQueue</a>
class GameSessionQueue {
  /// Information that is added to all events that are related to this game
  /// session queue.
  final String? customEventData;

  /// A list of fleets and/or fleet aliases that can be used to fulfill game
  /// session placement requests in the queue. Destinations are identified by
  /// either a fleet ARN or a fleet alias ARN, and are listed in order of
  /// placement preference.
  final List<GameSessionQueueDestination>? destinations;

  /// A list of locations where a queue is allowed to place new game sessions.
  /// Locations are specified in the form of AWS Region codes, such as
  /// <code>us-west-2</code>. If this parameter is not set, game sessions can be
  /// placed in any queue location.
  final FilterConfiguration? filterConfiguration;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift game session queue resource and uniquely
  /// identifies it. ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::gamesessionqueue/&lt;queue
  /// name&gt;</code>. In a GameLift game session queue ARN, the resource ID
  /// matches the <i>Name</i> value.
  final String? gameSessionQueueArn;

  /// A descriptive label that is associated with game session queue. Queue names
  /// must be unique within each Region.
  final String? name;

  /// An SNS topic ARN that is set up to receive game session placement
  /// notifications. See <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/queue-notification.html">
  /// Setting up notifications for game session placement</a>.
  final String? notificationTarget;

  /// A set of policies that act as a sliding cap on player latency. FleetIQ works
  /// to deliver low latency for most players in a game session. These policies
  /// ensure that no individual player can be placed into a game with unreasonably
  /// high latency. Use multiple policies to gradually relax latency requirements
  /// a step at a time. Multiple policies are applied based on their maximum
  /// allowed latency, starting with the lowest value.
  final List<PlayerLatencyPolicy>? playerLatencyPolicies;

  /// Custom settings to use when prioritizing destinations and locations for game
  /// session placements. This configuration replaces the FleetIQ default
  /// prioritization process. Priority types that are not explicitly named will be
  /// automatically applied at the end of the prioritization process.
  final PriorityConfiguration? priorityConfiguration;

  /// The maximum time, in seconds, that a new game session placement request
  /// remains in the queue. When a request exceeds this time, the game session
  /// placement changes to a <code>TIMED_OUT</code> status.
  final int? timeoutInSeconds;

  GameSessionQueue({
    this.customEventData,
    this.destinations,
    this.filterConfiguration,
    this.gameSessionQueueArn,
    this.name,
    this.notificationTarget,
    this.playerLatencyPolicies,
    this.priorityConfiguration,
    this.timeoutInSeconds,
  });

  factory GameSessionQueue.fromJson(Map<String, dynamic> json) {
    return GameSessionQueue(
      customEventData: json['CustomEventData'] as String?,
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              GameSessionQueueDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      filterConfiguration: json['FilterConfiguration'] != null
          ? FilterConfiguration.fromJson(
              json['FilterConfiguration'] as Map<String, dynamic>)
          : null,
      gameSessionQueueArn: json['GameSessionQueueArn'] as String?,
      name: json['Name'] as String?,
      notificationTarget: json['NotificationTarget'] as String?,
      playerLatencyPolicies: (json['PlayerLatencyPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => PlayerLatencyPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      priorityConfiguration: json['PriorityConfiguration'] != null
          ? PriorityConfiguration.fromJson(
              json['PriorityConfiguration'] as Map<String, dynamic>)
          : null,
      timeoutInSeconds: json['TimeoutInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final customEventData = this.customEventData;
    final destinations = this.destinations;
    final filterConfiguration = this.filterConfiguration;
    final gameSessionQueueArn = this.gameSessionQueueArn;
    final name = this.name;
    final notificationTarget = this.notificationTarget;
    final playerLatencyPolicies = this.playerLatencyPolicies;
    final priorityConfiguration = this.priorityConfiguration;
    final timeoutInSeconds = this.timeoutInSeconds;
    return {
      if (customEventData != null) 'CustomEventData': customEventData,
      if (destinations != null) 'Destinations': destinations,
      if (filterConfiguration != null)
        'FilterConfiguration': filterConfiguration,
      if (gameSessionQueueArn != null)
        'GameSessionQueueArn': gameSessionQueueArn,
      if (name != null) 'Name': name,
      if (notificationTarget != null) 'NotificationTarget': notificationTarget,
      if (playerLatencyPolicies != null)
        'PlayerLatencyPolicies': playerLatencyPolicies,
      if (priorityConfiguration != null)
        'PriorityConfiguration': priorityConfiguration,
      if (timeoutInSeconds != null) 'TimeoutInSeconds': timeoutInSeconds,
    };
  }
}

/// A fleet or alias designated in a game session queue. Queues fulfill requests
/// for new game sessions by placing a new game session on any of the queue's
/// destinations.
///
/// Destinations are part of a <a>GameSessionQueue</a>.
class GameSessionQueueDestination {
  /// The Amazon Resource Name (ARN) that is assigned to fleet or fleet alias.
  /// ARNs, which include a fleet ID or alias ID and a Region name, provide a
  /// unique identifier across all Regions.
  final String? destinationArn;

  GameSessionQueueDestination({
    this.destinationArn,
  });

  factory GameSessionQueueDestination.fromJson(Map<String, dynamic> json) {
    return GameSessionQueueDestination(
      destinationArn: json['DestinationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationArn = this.destinationArn;
    return {
      if (destinationArn != null) 'DestinationArn': destinationArn,
    };
  }
}

enum GameSessionStatus {
  active,
  activating,
  terminated,
  terminating,
  error,
}

extension on GameSessionStatus {
  String toValue() {
    switch (this) {
      case GameSessionStatus.active:
        return 'ACTIVE';
      case GameSessionStatus.activating:
        return 'ACTIVATING';
      case GameSessionStatus.terminated:
        return 'TERMINATED';
      case GameSessionStatus.terminating:
        return 'TERMINATING';
      case GameSessionStatus.error:
        return 'ERROR';
    }
  }
}

extension on String {
  GameSessionStatus toGameSessionStatus() {
    switch (this) {
      case 'ACTIVE':
        return GameSessionStatus.active;
      case 'ACTIVATING':
        return GameSessionStatus.activating;
      case 'TERMINATED':
        return GameSessionStatus.terminated;
      case 'TERMINATING':
        return GameSessionStatus.terminating;
      case 'ERROR':
        return GameSessionStatus.error;
    }
    throw Exception('$this is not known in enum GameSessionStatus');
  }
}

enum GameSessionStatusReason {
  interrupted,
}

extension on GameSessionStatusReason {
  String toValue() {
    switch (this) {
      case GameSessionStatusReason.interrupted:
        return 'INTERRUPTED';
    }
  }
}

extension on String {
  GameSessionStatusReason toGameSessionStatusReason() {
    switch (this) {
      case 'INTERRUPTED':
        return GameSessionStatusReason.interrupted;
    }
    throw Exception('$this is not known in enum GameSessionStatusReason');
  }
}

/// Represents the returned data in response to a request operation.
class GetGameSessionLogUrlOutput {
  /// Location of the requested game session logs, available for download. This
  /// URL is valid for 15 minutes, after which S3 will reject any download request
  /// using this URL. You can request a new URL any time within the 14-day period
  /// that the logs are retained.
  final String? preSignedUrl;

  GetGameSessionLogUrlOutput({
    this.preSignedUrl,
  });

  factory GetGameSessionLogUrlOutput.fromJson(Map<String, dynamic> json) {
    return GetGameSessionLogUrlOutput(
      preSignedUrl: json['PreSignedUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final preSignedUrl = this.preSignedUrl;
    return {
      if (preSignedUrl != null) 'PreSignedUrl': preSignedUrl,
    };
  }
}

/// Represents the returned data in response to a request operation.
class GetInstanceAccessOutput {
  /// The connection information for a fleet instance, including IP address and
  /// access credentials.
  final InstanceAccess? instanceAccess;

  GetInstanceAccessOutput({
    this.instanceAccess,
  });

  factory GetInstanceAccessOutput.fromJson(Map<String, dynamic> json) {
    return GetInstanceAccessOutput(
      instanceAccess: json['InstanceAccess'] != null
          ? InstanceAccess.fromJson(
              json['InstanceAccess'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceAccess = this.instanceAccess;
    return {
      if (instanceAccess != null) 'InstanceAccess': instanceAccess,
    };
  }
}

/// Represents an EC2 instance of virtual computing resources that hosts one or
/// more game servers. In GameLift, a fleet can contain zero or more instances.
///
/// <b>Related actions</b>
///
/// <a>DescribeInstances</a>
class Instance {
  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// The DNS identifier assigned to the instance that is running the game
  /// session. Values have the following format:
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
  final String? dnsName;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet that the instance is in.
  final String? fleetId;

  /// A unique identifier for the instance.
  final String? instanceId;

  /// IP address that is assigned to the instance.
  final String? ipAddress;

  /// The fleet location of the instance, expressed as an AWS Region code, such as
  /// <code>us-west-2</code>.
  final String? location;

  /// Operating system that is running on this instance.
  final OperatingSystem? operatingSystem;

  /// Current status of the instance. Possible statuses include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>PENDING</b> -- The instance is in the process of being created and
  /// launching server processes as defined in the fleet's run-time configuration.
  /// </li>
  /// <li>
  /// <b>ACTIVE</b> -- The instance has been successfully created and at least one
  /// server process has successfully launched and reported back to GameLift that
  /// it is ready to host a game session. The instance is now considered ready to
  /// host game sessions.
  /// </li>
  /// <li>
  /// <b>TERMINATING</b> -- The instance is in the process of shutting down. This
  /// may happen to reduce capacity during a scaling down event or to recycle
  /// resources in the event of a problem.
  /// </li>
  /// </ul>
  final InstanceStatus? status;

  /// EC2 instance type that defines the computing resources of this instance.
  final EC2InstanceType? type;

  Instance({
    this.creationTime,
    this.dnsName,
    this.fleetArn,
    this.fleetId,
    this.instanceId,
    this.ipAddress,
    this.location,
    this.operatingSystem,
    this.status,
    this.type,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      creationTime: timeStampFromJson(json['CreationTime']),
      dnsName: json['DnsName'] as String?,
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      instanceId: json['InstanceId'] as String?,
      ipAddress: json['IpAddress'] as String?,
      location: json['Location'] as String?,
      operatingSystem:
          (json['OperatingSystem'] as String?)?.toOperatingSystem(),
      status: (json['Status'] as String?)?.toInstanceStatus(),
      type: (json['Type'] as String?)?.toEC2InstanceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dnsName = this.dnsName;
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final instanceId = this.instanceId;
    final ipAddress = this.ipAddress;
    final location = this.location;
    final operatingSystem = this.operatingSystem;
    final status = this.status;
    final type = this.type;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dnsName != null) 'DnsName': dnsName,
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (instanceId != null) 'InstanceId': instanceId,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (location != null) 'Location': location,
      if (operatingSystem != null) 'OperatingSystem': operatingSystem.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Information required to remotely connect to a fleet instance. Access is
/// requested by calling <a>GetInstanceAccess</a>.
class InstanceAccess {
  /// Credentials required to access the instance.
  final InstanceCredentials? credentials;

  /// A unique identifier for the fleet containing the instance being accessed.
  final String? fleetId;

  /// A unique identifier for the instance being accessed.
  final String? instanceId;

  /// IP address that is assigned to the instance.
  final String? ipAddress;

  /// Operating system that is running on the instance.
  final OperatingSystem? operatingSystem;

  InstanceAccess({
    this.credentials,
    this.fleetId,
    this.instanceId,
    this.ipAddress,
    this.operatingSystem,
  });

  factory InstanceAccess.fromJson(Map<String, dynamic> json) {
    return InstanceAccess(
      credentials: json['Credentials'] != null
          ? InstanceCredentials.fromJson(
              json['Credentials'] as Map<String, dynamic>)
          : null,
      fleetId: json['FleetId'] as String?,
      instanceId: json['InstanceId'] as String?,
      ipAddress: json['IpAddress'] as String?,
      operatingSystem:
          (json['OperatingSystem'] as String?)?.toOperatingSystem(),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final fleetId = this.fleetId;
    final instanceId = this.instanceId;
    final ipAddress = this.ipAddress;
    final operatingSystem = this.operatingSystem;
    return {
      if (credentials != null) 'Credentials': credentials,
      if (fleetId != null) 'FleetId': fleetId,
      if (instanceId != null) 'InstanceId': instanceId,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (operatingSystem != null) 'OperatingSystem': operatingSystem.toValue(),
    };
  }
}

/// Set of credentials required to remotely access a fleet instance. Access
/// credentials are requested by calling <a>GetInstanceAccess</a> and returned
/// in an <a>InstanceAccess</a> object.
class InstanceCredentials {
  /// Secret string. For Windows instances, the secret is a password for use with
  /// Windows Remote Desktop. For Linux instances, it is a private key (which must
  /// be saved as a <code>.pem</code> file) for use with SSH.
  final String? secret;

  /// User login string.
  final String? userName;

  InstanceCredentials({
    this.secret,
    this.userName,
  });

  factory InstanceCredentials.fromJson(Map<String, dynamic> json) {
    return InstanceCredentials(
      secret: json['Secret'] as String?,
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final secret = this.secret;
    final userName = this.userName;
    return {
      if (secret != null) 'Secret': secret,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// <b>This data type is used with the GameLift FleetIQ and game server
/// groups.</b>
///
/// An allowed instance type for a <a>GameServerGroup</a>. All game server
/// groups must have at least two instance types defined for it. GameLift
/// FleetIQ periodically evaluates each defined instance type for viability. It
/// then updates the Auto Scaling group with the list of viable instance types.
class InstanceDefinition {
  /// An EC2 instance type designation.
  final GameServerGroupInstanceType instanceType;

  /// Instance weighting that indicates how much this instance type contributes to
  /// the total capacity of a game server group. Instance weights are used by
  /// GameLift FleetIQ to calculate the instance type's cost per unit hour and
  /// better identify the most cost-effective options. For detailed information on
  /// weighting instance capacity, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-weighting.html">Instance
  /// Weighting</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. Default
  /// value is "1".
  final String? weightedCapacity;

  InstanceDefinition({
    required this.instanceType,
    this.weightedCapacity,
  });

  factory InstanceDefinition.fromJson(Map<String, dynamic> json) {
    return InstanceDefinition(
      instanceType:
          (json['InstanceType'] as String).toGameServerGroupInstanceType(),
      weightedCapacity: json['WeightedCapacity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    final weightedCapacity = this.weightedCapacity;
    return {
      'InstanceType': instanceType.toValue(),
      if (weightedCapacity != null) 'WeightedCapacity': weightedCapacity,
    };
  }
}

enum InstanceStatus {
  pending,
  active,
  terminating,
}

extension on InstanceStatus {
  String toValue() {
    switch (this) {
      case InstanceStatus.pending:
        return 'PENDING';
      case InstanceStatus.active:
        return 'ACTIVE';
      case InstanceStatus.terminating:
        return 'TERMINATING';
    }
  }
}

extension on String {
  InstanceStatus toInstanceStatus() {
    switch (this) {
      case 'PENDING':
        return InstanceStatus.pending;
      case 'ACTIVE':
        return InstanceStatus.active;
      case 'TERMINATING':
        return InstanceStatus.terminating;
    }
    throw Exception('$this is not known in enum InstanceStatus');
  }
}

/// A range of IP addresses and port settings that allow inbound traffic to
/// connect to server processes on an instance in a fleet. New game sessions are
/// assigned an IP address/port number combination, which must fall into the
/// fleet's allowed ranges. Fleets with custom game builds must have permissions
/// explicitly set. For Realtime Servers fleets, GameLift automatically opens
/// two port ranges, one for TCP messaging and one for UDP.
///
/// <b>Related actions</b>
///
/// <a>DescribeFleetPortSettings</a>
class IpPermission {
  /// A starting value for a range of allowed port numbers.
  final int fromPort;

  /// A range of allowed IP addresses. This value must be expressed in CIDR
  /// notation. Example: "<code>000.000.000.000/[subnet mask]</code>" or
  /// optionally the shortened version "<code>0.0.0.0/[subnet mask]</code>".
  final String ipRange;

  /// The network communication protocol used by the fleet.
  final IpProtocol protocol;

  /// An ending value for a range of allowed port numbers. Port numbers are
  /// end-inclusive. This value must be higher than <code>FromPort</code>.
  final int toPort;

  IpPermission({
    required this.fromPort,
    required this.ipRange,
    required this.protocol,
    required this.toPort,
  });

  factory IpPermission.fromJson(Map<String, dynamic> json) {
    return IpPermission(
      fromPort: json['FromPort'] as int,
      ipRange: json['IpRange'] as String,
      protocol: (json['Protocol'] as String).toIpProtocol(),
      toPort: json['ToPort'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final fromPort = this.fromPort;
    final ipRange = this.ipRange;
    final protocol = this.protocol;
    final toPort = this.toPort;
    return {
      'FromPort': fromPort,
      'IpRange': ipRange,
      'Protocol': protocol.toValue(),
      'ToPort': toPort,
    };
  }
}

enum IpProtocol {
  tcp,
  udp,
}

extension on IpProtocol {
  String toValue() {
    switch (this) {
      case IpProtocol.tcp:
        return 'TCP';
      case IpProtocol.udp:
        return 'UDP';
    }
  }
}

extension on String {
  IpProtocol toIpProtocol() {
    switch (this) {
      case 'TCP':
        return IpProtocol.tcp;
      case 'UDP':
        return IpProtocol.udp;
    }
    throw Exception('$this is not known in enum IpProtocol');
  }
}

/// <b>This data type is used with the GameLift FleetIQ and game server
/// groups.</b>
///
/// An EC2 launch template that contains configuration settings and game server
/// code to be deployed to all instances in a game server group. The launch
/// template is specified when creating a new game server group with
/// <a>CreateGameServerGroup</a>.
class LaunchTemplateSpecification {
  /// A unique identifier for an existing EC2 launch template.
  final String? launchTemplateId;

  /// A readable identifier for an existing EC2 launch template.
  final String? launchTemplateName;

  /// The version of the EC2 launch template to use. If no version is specified,
  /// the default version will be used. With Amazon EC2, you can specify a default
  /// version for a launch template. If none is set, the default is the first
  /// version created.
  final String? version;

  LaunchTemplateSpecification({
    this.launchTemplateId,
    this.launchTemplateName,
    this.version,
  });

  factory LaunchTemplateSpecification.fromJson(Map<String, dynamic> json) {
    return LaunchTemplateSpecification(
      launchTemplateId: json['LaunchTemplateId'] as String?,
      launchTemplateName: json['LaunchTemplateName'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final launchTemplateId = this.launchTemplateId;
    final launchTemplateName = this.launchTemplateName;
    final version = this.version;
    return {
      if (launchTemplateId != null) 'LaunchTemplateId': launchTemplateId,
      if (launchTemplateName != null) 'LaunchTemplateName': launchTemplateName,
      if (version != null) 'Version': version,
    };
  }
}

/// Represents the returned data in response to a request operation.
class ListAliasesOutput {
  /// A collection of alias resources that match the request parameters.
  final List<Alias>? aliases;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  ListAliasesOutput({
    this.aliases,
    this.nextToken,
  });

  factory ListAliasesOutput.fromJson(Map<String, dynamic> json) {
    return ListAliasesOutput(
      aliases: (json['Aliases'] as List?)
          ?.whereNotNull()
          .map((e) => Alias.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    final nextToken = this.nextToken;
    return {
      if (aliases != null) 'Aliases': aliases,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class ListBuildsOutput {
  /// A collection of build resources that match the request.
  final List<Build>? builds;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  ListBuildsOutput({
    this.builds,
    this.nextToken,
  });

  factory ListBuildsOutput.fromJson(Map<String, dynamic> json) {
    return ListBuildsOutput(
      builds: (json['Builds'] as List?)
          ?.whereNotNull()
          .map((e) => Build.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final builds = this.builds;
    final nextToken = this.nextToken;
    return {
      if (builds != null) 'Builds': builds,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the returned data in response to a request operation.
class ListFleetsOutput {
  /// A set of fleet IDs that match the list request. You can retrieve additional
  /// information about all returned fleets by passing this result set to a
  /// <a>DescribeFleetAttributes</a>, <a>DescribeFleetCapacity</a>, or
  /// <a>DescribeFleetUtilization</a> call.
  final List<String>? fleetIds;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  ListFleetsOutput({
    this.fleetIds,
    this.nextToken,
  });

  factory ListFleetsOutput.fromJson(Map<String, dynamic> json) {
    return ListFleetsOutput(
      fleetIds: (json['FleetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetIds = this.fleetIds;
    final nextToken = this.nextToken;
    return {
      if (fleetIds != null) 'FleetIds': fleetIds,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGameServerGroupsOutput {
  /// A collection of game server group objects that match the request.
  final List<GameServerGroup>? gameServerGroups;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  ListGameServerGroupsOutput({
    this.gameServerGroups,
    this.nextToken,
  });

  factory ListGameServerGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListGameServerGroupsOutput(
      gameServerGroups: (json['GameServerGroups'] as List?)
          ?.whereNotNull()
          .map((e) => GameServerGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServerGroups = this.gameServerGroups;
    final nextToken = this.nextToken;
    return {
      if (gameServerGroups != null) 'GameServerGroups': gameServerGroups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGameServersOutput {
  /// A collection of game server objects that match the request.
  final List<GameServer>? gameServers;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  ListGameServersOutput({
    this.gameServers,
    this.nextToken,
  });

  factory ListGameServersOutput.fromJson(Map<String, dynamic> json) {
    return ListGameServersOutput(
      gameServers: (json['GameServers'] as List?)
          ?.whereNotNull()
          .map((e) => GameServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServers = this.gameServers;
    final nextToken = this.nextToken;
    return {
      if (gameServers != null) 'GameServers': gameServers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListScriptsOutput {
  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  /// A set of properties describing the requested script.
  final List<Script>? scripts;

  ListScriptsOutput({
    this.nextToken,
    this.scripts,
  });

  factory ListScriptsOutput.fromJson(Map<String, dynamic> json) {
    return ListScriptsOutput(
      nextToken: json['NextToken'] as String?,
      scripts: (json['Scripts'] as List?)
          ?.whereNotNull()
          .map((e) => Script.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scripts = this.scripts;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (scripts != null) 'Scripts': scripts,
    };
  }
}

class ListTagsForResourceResponse {
  /// The collection of tags that have been assigned to the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Represents a location in a multi-location fleet.
///
/// <b>Related actions</b>
///
/// <a>DescribeFleetLocationAttributes</a>
class LocationAttributes {
  /// A fleet location and its current life-cycle state.
  final LocationState? locationState;

  /// A list of fleet actions that have been suspended in the fleet location.
  final List<FleetAction>? stoppedActions;

  /// The status of fleet activity updates to the location. The status
  /// <code>PENDING_UPDATE</code> indicates that <a>StopFleetActions</a> or
  /// <a>StartFleetActions</a> has been requested but the update has not yet been
  /// completed for the location.
  final LocationUpdateStatus? updateStatus;

  LocationAttributes({
    this.locationState,
    this.stoppedActions,
    this.updateStatus,
  });

  factory LocationAttributes.fromJson(Map<String, dynamic> json) {
    return LocationAttributes(
      locationState: json['LocationState'] != null
          ? LocationState.fromJson(
              json['LocationState'] as Map<String, dynamic>)
          : null,
      stoppedActions: (json['StoppedActions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toFleetAction())
          .toList(),
      updateStatus: (json['UpdateStatus'] as String?)?.toLocationUpdateStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final locationState = this.locationState;
    final stoppedActions = this.stoppedActions;
    final updateStatus = this.updateStatus;
    return {
      if (locationState != null) 'LocationState': locationState,
      if (stoppedActions != null)
        'StoppedActions': stoppedActions.map((e) => e.toValue()).toList(),
      if (updateStatus != null) 'UpdateStatus': updateStatus.toValue(),
    };
  }
}

/// A remote location where a multi-location fleet can deploy EC2 instances for
/// game hosting.
///
/// <b>Related actions</b>
///
/// <a>CreateFleet</a>
class LocationConfiguration {
  /// An AWS Region code, such as <code>us-west-2</code>.
  final String? location;

  LocationConfiguration({
    this.location,
  });

  factory LocationConfiguration.fromJson(Map<String, dynamic> json) {
    return LocationConfiguration(
      location: json['Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      if (location != null) 'Location': location,
    };
  }
}

/// A fleet location and its life-cycle state. A location state object might be
/// used to describe a fleet's remote location or home Region. Life-cycle state
/// tracks the progress of launching the first instance in a new location and
/// preparing it for game hosting, and then removing all instances and deleting
/// the location from the fleet.
///
/// <b>Related actions</b>
///
/// <a>CreateFleet</a> | <a>CreateFleetLocations</a> |
/// <a>DeleteFleetLocations</a>
class LocationState {
  /// The fleet location, expressed as an AWS Region code such as
  /// <code>us-west-2</code>.
  final String? location;

  /// The life-cycle status of a fleet location.
  final FleetStatus? status;

  LocationState({
    this.location,
    this.status,
  });

  factory LocationState.fromJson(Map<String, dynamic> json) {
    return LocationState(
      location: json['Location'] as String?,
      status: (json['Status'] as String?)?.toFleetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final status = this.status;
    return {
      if (location != null) 'Location': location,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum LocationUpdateStatus {
  pendingUpdate,
}

extension on LocationUpdateStatus {
  String toValue() {
    switch (this) {
      case LocationUpdateStatus.pendingUpdate:
        return 'PENDING_UPDATE';
    }
  }
}

extension on String {
  LocationUpdateStatus toLocationUpdateStatus() {
    switch (this) {
      case 'PENDING_UPDATE':
        return LocationUpdateStatus.pendingUpdate;
    }
    throw Exception('$this is not known in enum LocationUpdateStatus');
  }
}

/// Represents a new player session that is created as a result of a successful
/// FlexMatch match. A successful match automatically creates new player
/// sessions for every player ID in the original matchmaking request.
///
/// When players connect to the match's game session, they must include both
/// player ID and player session ID in order to claim their assigned player
/// slot.
class MatchedPlayerSession {
  /// A unique identifier for a player
  final String? playerId;

  /// A unique identifier for a player session
  final String? playerSessionId;

  MatchedPlayerSession({
    this.playerId,
    this.playerSessionId,
  });

  factory MatchedPlayerSession.fromJson(Map<String, dynamic> json) {
    return MatchedPlayerSession(
      playerId: json['PlayerId'] as String?,
      playerSessionId: json['PlayerSessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final playerId = this.playerId;
    final playerSessionId = this.playerSessionId;
    return {
      if (playerId != null) 'PlayerId': playerId,
      if (playerSessionId != null) 'PlayerSessionId': playerSessionId,
    };
  }
}

/// Guidelines for use with FlexMatch to match players into games. All
/// matchmaking requests must specify a matchmaking configuration.
class MatchmakingConfiguration {
  /// A flag that indicates whether a match that was created with this
  /// configuration must be accepted by the matched players. To require
  /// acceptance, set to TRUE. When this option is enabled, matchmaking tickets
  /// use the status <code>REQUIRES_ACCEPTANCE</code> to indicate when a completed
  /// potential match is waiting for player acceptance.
  final bool? acceptanceRequired;

  /// The length of time (in seconds) to wait for players to accept a proposed
  /// match, if acceptance is required. If any player rejects the match or fails
  /// to accept before the timeout, the ticket continues to look for an acceptable
  /// match.
  final int? acceptanceTimeoutSeconds;

  /// The number of player slots in a match to keep open for future players. For
  /// example, if the configuration's rule set specifies a match for a single
  /// 12-person team, and the additional player count is set to 2, only 10 players
  /// are selected for the match. This parameter is not used when
  /// <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  final int? additionalPlayerCount;

  /// The method used to backfill game sessions created with this matchmaking
  /// configuration. MANUAL indicates that the game makes backfill requests or
  /// does not use the match backfill feature. AUTOMATIC indicates that GameLift
  /// creates <a>StartMatchBackfill</a> requests whenever a game session has one
  /// or more open slots. Learn more about manual and automatic backfill in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-backfill.html">Backfill
  /// existing games with FlexMatch</a>. Automatic backfill is not available when
  /// <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  final BackfillMode? backfillMode;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift matchmaking configuration resource and
  /// uniquely identifies it. ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::matchmakingconfiguration/&lt;matchmaking
  /// configuration name&gt;</code>. In a GameLift configuration ARN, the resource
  /// ID matches the <i>Name</i> value.
  final String? configurationArn;

  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// Information to attach to all events related to the matchmaking
  /// configuration.
  final String? customEventData;

  /// A descriptive label that is associated with matchmaking configuration.
  final String? description;

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
  final FlexMatchMode? flexMatchMode;

  /// A set of custom properties for a game session, formatted as key:value pairs.
  /// These properties are passed to a game server process in the
  /// <a>GameSession</a> object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>). This information is added to the new <a>GameSession</a>
  /// object that is created for a successful match. This parameter is not used
  /// when <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  final List<GameProperty>? gameProperties;

  /// A set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the <a>GameSession</a>
  /// object with a request to start a new game session (see <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession">Start
  /// a Game Session</a>). This information is added to the new <a>GameSession</a>
  /// object that is created for a successful match. This parameter is not used
  /// when <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  final String? gameSessionData;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift game session queue resource and uniquely
  /// identifies it. ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::gamesessionqueue/&lt;queue
  /// name&gt;</code>. Queues can be located in any Region. Queues are used to
  /// start new GameLift-hosted game sessions for matches that are created with
  /// this matchmaking configuration. This property is not set when
  /// <code>FlexMatchMode</code> is set to <code>STANDALONE</code>.
  final List<String>? gameSessionQueueArns;

  /// A unique identifier for the matchmaking configuration. This name is used to
  /// identify the configuration associated with a matchmaking request or ticket.
  final String? name;

  /// An SNS topic ARN that is set up to receive matchmaking notifications.
  final String? notificationTarget;

  /// The maximum duration, in seconds, that a matchmaking ticket can remain in
  /// process before timing out. Requests that fail due to timing out can be
  /// resubmitted as needed.
  final int? requestTimeoutSeconds;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// associated with the GameLift matchmaking rule set resource that this
  /// configuration uses.
  final String? ruleSetArn;

  /// A unique identifier for the matchmaking rule set to use with this
  /// configuration. A matchmaking configuration can only use rule sets that are
  /// defined in the same Region.
  final String? ruleSetName;

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

  factory MatchmakingConfiguration.fromJson(Map<String, dynamic> json) {
    return MatchmakingConfiguration(
      acceptanceRequired: json['AcceptanceRequired'] as bool?,
      acceptanceTimeoutSeconds: json['AcceptanceTimeoutSeconds'] as int?,
      additionalPlayerCount: json['AdditionalPlayerCount'] as int?,
      backfillMode: (json['BackfillMode'] as String?)?.toBackfillMode(),
      configurationArn: json['ConfigurationArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      customEventData: json['CustomEventData'] as String?,
      description: json['Description'] as String?,
      flexMatchMode: (json['FlexMatchMode'] as String?)?.toFlexMatchMode(),
      gameProperties: (json['GameProperties'] as List?)
          ?.whereNotNull()
          .map((e) => GameProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameSessionData: json['GameSessionData'] as String?,
      gameSessionQueueArns: (json['GameSessionQueueArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String?,
      notificationTarget: json['NotificationTarget'] as String?,
      requestTimeoutSeconds: json['RequestTimeoutSeconds'] as int?,
      ruleSetArn: json['RuleSetArn'] as String?,
      ruleSetName: json['RuleSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceRequired = this.acceptanceRequired;
    final acceptanceTimeoutSeconds = this.acceptanceTimeoutSeconds;
    final additionalPlayerCount = this.additionalPlayerCount;
    final backfillMode = this.backfillMode;
    final configurationArn = this.configurationArn;
    final creationTime = this.creationTime;
    final customEventData = this.customEventData;
    final description = this.description;
    final flexMatchMode = this.flexMatchMode;
    final gameProperties = this.gameProperties;
    final gameSessionData = this.gameSessionData;
    final gameSessionQueueArns = this.gameSessionQueueArns;
    final name = this.name;
    final notificationTarget = this.notificationTarget;
    final requestTimeoutSeconds = this.requestTimeoutSeconds;
    final ruleSetArn = this.ruleSetArn;
    final ruleSetName = this.ruleSetName;
    return {
      if (acceptanceRequired != null) 'AcceptanceRequired': acceptanceRequired,
      if (acceptanceTimeoutSeconds != null)
        'AcceptanceTimeoutSeconds': acceptanceTimeoutSeconds,
      if (additionalPlayerCount != null)
        'AdditionalPlayerCount': additionalPlayerCount,
      if (backfillMode != null) 'BackfillMode': backfillMode.toValue(),
      if (configurationArn != null) 'ConfigurationArn': configurationArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (customEventData != null) 'CustomEventData': customEventData,
      if (description != null) 'Description': description,
      if (flexMatchMode != null) 'FlexMatchMode': flexMatchMode.toValue(),
      if (gameProperties != null) 'GameProperties': gameProperties,
      if (gameSessionData != null) 'GameSessionData': gameSessionData,
      if (gameSessionQueueArns != null)
        'GameSessionQueueArns': gameSessionQueueArns,
      if (name != null) 'Name': name,
      if (notificationTarget != null) 'NotificationTarget': notificationTarget,
      if (requestTimeoutSeconds != null)
        'RequestTimeoutSeconds': requestTimeoutSeconds,
      if (ruleSetArn != null) 'RuleSetArn': ruleSetArn,
      if (ruleSetName != null) 'RuleSetName': ruleSetName,
    };
  }
}

enum MatchmakingConfigurationStatus {
  cancelled,
  completed,
  failed,
  placing,
  queued,
  requiresAcceptance,
  searching,
  timedOut,
}

extension on MatchmakingConfigurationStatus {
  String toValue() {
    switch (this) {
      case MatchmakingConfigurationStatus.cancelled:
        return 'CANCELLED';
      case MatchmakingConfigurationStatus.completed:
        return 'COMPLETED';
      case MatchmakingConfigurationStatus.failed:
        return 'FAILED';
      case MatchmakingConfigurationStatus.placing:
        return 'PLACING';
      case MatchmakingConfigurationStatus.queued:
        return 'QUEUED';
      case MatchmakingConfigurationStatus.requiresAcceptance:
        return 'REQUIRES_ACCEPTANCE';
      case MatchmakingConfigurationStatus.searching:
        return 'SEARCHING';
      case MatchmakingConfigurationStatus.timedOut:
        return 'TIMED_OUT';
    }
  }
}

extension on String {
  MatchmakingConfigurationStatus toMatchmakingConfigurationStatus() {
    switch (this) {
      case 'CANCELLED':
        return MatchmakingConfigurationStatus.cancelled;
      case 'COMPLETED':
        return MatchmakingConfigurationStatus.completed;
      case 'FAILED':
        return MatchmakingConfigurationStatus.failed;
      case 'PLACING':
        return MatchmakingConfigurationStatus.placing;
      case 'QUEUED':
        return MatchmakingConfigurationStatus.queued;
      case 'REQUIRES_ACCEPTANCE':
        return MatchmakingConfigurationStatus.requiresAcceptance;
      case 'SEARCHING':
        return MatchmakingConfigurationStatus.searching;
      case 'TIMED_OUT':
        return MatchmakingConfigurationStatus.timedOut;
    }
    throw Exception(
        '$this is not known in enum MatchmakingConfigurationStatus');
  }
}

/// Set of rule statements, used with FlexMatch, that determine how to build
/// your player matches. Each rule set describes a type of group to be created
/// and defines the parameters for acceptable player matches. Rule sets are used
/// in <a>MatchmakingConfiguration</a> objects.
///
/// A rule set may define the following elements for a match. For detailed
/// information and examples showing how to construct a rule set, see <a
/// href="https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html">Build
/// a FlexMatch rule set</a>.
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
class MatchmakingRuleSet {
  /// A collection of matchmaking rules, formatted as a JSON string. Comments are
  /// not allowed in JSON, but most elements support a description field.
  final String ruleSetBody;

  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift matchmaking rule set resource and uniquely
  /// identifies it. ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::matchmakingruleset/&lt;ruleset
  /// name&gt;</code>. In a GameLift rule set ARN, the resource ID matches the
  /// <i>RuleSetName</i> value.
  final String? ruleSetArn;

  /// A unique identifier for the matchmaking rule set
  final String? ruleSetName;

  MatchmakingRuleSet({
    required this.ruleSetBody,
    this.creationTime,
    this.ruleSetArn,
    this.ruleSetName,
  });

  factory MatchmakingRuleSet.fromJson(Map<String, dynamic> json) {
    return MatchmakingRuleSet(
      ruleSetBody: json['RuleSetBody'] as String,
      creationTime: timeStampFromJson(json['CreationTime']),
      ruleSetArn: json['RuleSetArn'] as String?,
      ruleSetName: json['RuleSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleSetBody = this.ruleSetBody;
    final creationTime = this.creationTime;
    final ruleSetArn = this.ruleSetArn;
    final ruleSetName = this.ruleSetName;
    return {
      'RuleSetBody': ruleSetBody,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (ruleSetArn != null) 'RuleSetArn': ruleSetArn,
      if (ruleSetName != null) 'RuleSetName': ruleSetName,
    };
  }
}

/// Ticket generated to track the progress of a matchmaking request. Each ticket
/// is uniquely identified by a ticket ID, supplied by the requester, when
/// creating a matchmaking request with <a>StartMatchmaking</a>. Tickets can be
/// retrieved by calling <a>DescribeMatchmaking</a> with the ticket ID.
class MatchmakingTicket {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// associated with the GameLift matchmaking configuration resource that is used
  /// with this ticket.
  final String? configurationArn;

  /// Name of the <a>MatchmakingConfiguration</a> that is used with this ticket.
  /// Matchmaking configurations determine how players are grouped into a match
  /// and how a new game session is created for the match.
  final String? configurationName;

  /// Time stamp indicating when this matchmaking request stopped being processed
  /// due to success, failure, or cancellation. Format is a number expressed in
  /// Unix time as milliseconds (for example <code>"1469498468.057"</code>).
  final DateTime? endTime;

  /// Average amount of time (in seconds) that players are currently waiting for a
  /// match. If there is not enough recent data, this property may be empty.
  final int? estimatedWaitTime;

  /// Identifier and connection information of the game session created for the
  /// match. This information is added to the ticket only after the matchmaking
  /// request has been successfully completed. This parameter is not set when
  /// FlexMatch is being used without GameLift hosting.
  final GameSessionConnectionInfo? gameSessionConnectionInfo;

  /// A set of <code>Player</code> objects, each representing a player to find
  /// matches for. Players are identified by a unique player ID and may include
  /// latency data for use during matchmaking. If the ticket is in status
  /// <code>COMPLETED</code>, the <code>Player</code> objects include the team the
  /// players were assigned to in the resulting match.
  final List<Player>? players;

  /// Time stamp indicating when this matchmaking request was received. Format is
  /// a number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? startTime;

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
  final MatchmakingConfigurationStatus? status;

  /// Additional information about the current status.
  final String? statusMessage;

  /// Code to explain the current status. For example, a status reason may
  /// indicate when a ticket has returned to <code>SEARCHING</code> status after a
  /// proposed match fails to receive player acceptances.
  final String? statusReason;

  /// A unique identifier for a matchmaking ticket.
  final String? ticketId;

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

  factory MatchmakingTicket.fromJson(Map<String, dynamic> json) {
    return MatchmakingTicket(
      configurationArn: json['ConfigurationArn'] as String?,
      configurationName: json['ConfigurationName'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      estimatedWaitTime: json['EstimatedWaitTime'] as int?,
      gameSessionConnectionInfo: json['GameSessionConnectionInfo'] != null
          ? GameSessionConnectionInfo.fromJson(
              json['GameSessionConnectionInfo'] as Map<String, dynamic>)
          : null,
      players: (json['Players'] as List?)
          ?.whereNotNull()
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toMatchmakingConfigurationStatus(),
      statusMessage: json['StatusMessage'] as String?,
      statusReason: json['StatusReason'] as String?,
      ticketId: json['TicketId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationArn = this.configurationArn;
    final configurationName = this.configurationName;
    final endTime = this.endTime;
    final estimatedWaitTime = this.estimatedWaitTime;
    final gameSessionConnectionInfo = this.gameSessionConnectionInfo;
    final players = this.players;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final statusReason = this.statusReason;
    final ticketId = this.ticketId;
    return {
      if (configurationArn != null) 'ConfigurationArn': configurationArn,
      if (configurationName != null) 'ConfigurationName': configurationName,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (estimatedWaitTime != null) 'EstimatedWaitTime': estimatedWaitTime,
      if (gameSessionConnectionInfo != null)
        'GameSessionConnectionInfo': gameSessionConnectionInfo,
      if (players != null) 'Players': players,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (statusReason != null) 'StatusReason': statusReason,
      if (ticketId != null) 'TicketId': ticketId,
    };
  }
}

enum MetricName {
  activatingGameSessions,
  activeGameSessions,
  activeInstances,
  availableGameSessions,
  availablePlayerSessions,
  currentPlayerSessions,
  idleInstances,
  percentAvailableGameSessions,
  percentIdleInstances,
  queueDepth,
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
  }
}

extension on String {
  MetricName toMetricName() {
    switch (this) {
      case 'ActivatingGameSessions':
        return MetricName.activatingGameSessions;
      case 'ActiveGameSessions':
        return MetricName.activeGameSessions;
      case 'ActiveInstances':
        return MetricName.activeInstances;
      case 'AvailableGameSessions':
        return MetricName.availableGameSessions;
      case 'AvailablePlayerSessions':
        return MetricName.availablePlayerSessions;
      case 'CurrentPlayerSessions':
        return MetricName.currentPlayerSessions;
      case 'IdleInstances':
        return MetricName.idleInstances;
      case 'PercentAvailableGameSessions':
        return MetricName.percentAvailableGameSessions;
      case 'PercentIdleInstances':
        return MetricName.percentIdleInstances;
      case 'QueueDepth':
        return MetricName.queueDepth;
      case 'WaitTime':
        return MetricName.waitTime;
    }
    throw Exception('$this is not known in enum MetricName');
  }
}

enum OperatingSystem {
  windows_2012,
  amazonLinux,
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
  }
}

extension on String {
  OperatingSystem toOperatingSystem() {
    switch (this) {
      case 'WINDOWS_2012':
        return OperatingSystem.windows_2012;
      case 'AMAZON_LINUX':
        return OperatingSystem.amazonLinux;
      case 'AMAZON_LINUX_2':
        return OperatingSystem.amazonLinux_2;
    }
    throw Exception('$this is not known in enum OperatingSystem');
  }
}

/// Information about a player session that was created as part of a
/// <a>StartGameSessionPlacement</a> request. This object contains only the
/// player ID and player session ID. To retrieve full details on a player
/// session, call <a>DescribePlayerSessions</a> with the player session ID.
///
/// <b>Related actions</b>
///
/// <a>CreatePlayerSession</a> | <a>CreatePlayerSessions</a> |
/// <a>DescribePlayerSessions</a> | <a>StartGameSessionPlacement</a> |
/// <a>DescribeGameSessionPlacement</a> | <a>StopGameSessionPlacement</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class PlacedPlayerSession {
  /// A unique identifier for a player that is associated with this player
  /// session.
  final String? playerId;

  /// A unique identifier for a player session.
  final String? playerSessionId;

  PlacedPlayerSession({
    this.playerId,
    this.playerSessionId,
  });

  factory PlacedPlayerSession.fromJson(Map<String, dynamic> json) {
    return PlacedPlayerSession(
      playerId: json['PlayerId'] as String?,
      playerSessionId: json['PlayerSessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final playerId = this.playerId;
    final playerSessionId = this.playerSessionId;
    return {
      if (playerId != null) 'PlayerId': playerId,
      if (playerSessionId != null) 'PlayerSessionId': playerSessionId,
    };
  }
}

/// Represents a player in matchmaking. When starting a matchmaking request, a
/// player has a player ID, attributes, and may have latency data. Team
/// information is added after a match has been successfully completed.
class Player {
  /// A set of values, expressed in milliseconds, that indicates the amount of
  /// latency that a player experiences when connected to AWS Regions. If this
  /// property is present, FlexMatch considers placing the match only in Regions
  /// for which latency is reported.
  ///
  /// If a matchmaker has a rule that evaluates player latency, players must
  /// report latency in order to be matched. If no latency is reported in this
  /// scenario, FlexMatch assumes that no Regions are available to the player and
  /// the ticket is not matchable.
  final Map<String, int>? latencyInMs;

  /// A collection of key:value pairs containing player information for use in
  /// matchmaking. Player attribute keys must match the <i>playerAttributes</i>
  /// used in a matchmaking rule set. Example: <code>"PlayerAttributes": {"skill":
  /// {"N": "23"}, "gameMode": {"S": "deathmatch"}}</code>.
  final Map<String, AttributeValue>? playerAttributes;

  /// A unique identifier for a player
  final String? playerId;

  /// Name of the team that the player is assigned to in a match. Team names are
  /// defined in a matchmaking rule set.
  final String? team;

  Player({
    this.latencyInMs,
    this.playerAttributes,
    this.playerId,
    this.team,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      latencyInMs: (json['LatencyInMs'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
      playerAttributes: (json['PlayerAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      playerId: json['PlayerId'] as String?,
      team: json['Team'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final latencyInMs = this.latencyInMs;
    final playerAttributes = this.playerAttributes;
    final playerId = this.playerId;
    final team = this.team;
    return {
      if (latencyInMs != null) 'LatencyInMs': latencyInMs,
      if (playerAttributes != null) 'PlayerAttributes': playerAttributes,
      if (playerId != null) 'PlayerId': playerId,
      if (team != null) 'Team': team,
    };
  }
}

/// Regional latency information for a player, used when requesting a new game
/// session with <a>StartGameSessionPlacement</a>. This value indicates the
/// amount of time lag that exists when the player is connected to a fleet in
/// the specified Region. The relative difference between a player's latency
/// values for multiple Regions are used to determine which fleets are best
/// suited to place a new game session for the player.
class PlayerLatency {
  /// Amount of time that represents the time lag experienced by the player when
  /// connected to the specified Region.
  final double? latencyInMilliseconds;

  /// A unique identifier for a player associated with the latency data.
  final String? playerId;

  /// Name of the Region that is associated with the latency value.
  final String? regionIdentifier;

  PlayerLatency({
    this.latencyInMilliseconds,
    this.playerId,
    this.regionIdentifier,
  });

  factory PlayerLatency.fromJson(Map<String, dynamic> json) {
    return PlayerLatency(
      latencyInMilliseconds: json['LatencyInMilliseconds'] as double?,
      playerId: json['PlayerId'] as String?,
      regionIdentifier: json['RegionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final latencyInMilliseconds = this.latencyInMilliseconds;
    final playerId = this.playerId;
    final regionIdentifier = this.regionIdentifier;
    return {
      if (latencyInMilliseconds != null)
        'LatencyInMilliseconds': latencyInMilliseconds,
      if (playerId != null) 'PlayerId': playerId,
      if (regionIdentifier != null) 'RegionIdentifier': regionIdentifier,
    };
  }
}

/// Sets a latency cap for individual players when placing a game session. With
/// a latency policy in force, a game session cannot be placed in a fleet
/// location where a player reports latency higher than the cap. Latency
/// policies are used only with placement request that provide player latency
/// information. Player latency policies can be stacked to gradually relax
/// latency requirements over time.
///
/// Latency policies are part of a <a>GameSessionQueue</a>.
class PlayerLatencyPolicy {
  /// The maximum latency value that is allowed for any player, in milliseconds.
  /// All policies must have a value set for this property.
  final int? maximumIndividualPlayerLatencyMilliseconds;

  /// The length of time, in seconds, that the policy is enforced while placing a
  /// new game session. A null value for this property means that the policy is
  /// enforced until the queue times out.
  final int? policyDurationSeconds;

  PlayerLatencyPolicy({
    this.maximumIndividualPlayerLatencyMilliseconds,
    this.policyDurationSeconds,
  });

  factory PlayerLatencyPolicy.fromJson(Map<String, dynamic> json) {
    return PlayerLatencyPolicy(
      maximumIndividualPlayerLatencyMilliseconds:
          json['MaximumIndividualPlayerLatencyMilliseconds'] as int?,
      policyDurationSeconds: json['PolicyDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumIndividualPlayerLatencyMilliseconds =
        this.maximumIndividualPlayerLatencyMilliseconds;
    final policyDurationSeconds = this.policyDurationSeconds;
    return {
      if (maximumIndividualPlayerLatencyMilliseconds != null)
        'MaximumIndividualPlayerLatencyMilliseconds':
            maximumIndividualPlayerLatencyMilliseconds,
      if (policyDurationSeconds != null)
        'PolicyDurationSeconds': policyDurationSeconds,
    };
  }
}

/// Represents a player session. Player sessions are created either for a
/// specific game session, or as part of a game session placement or matchmaking
/// request. A player session can represents a reserved player slot in a game
/// session (when status is <code>RESERVED</code>) or actual player activity in
/// a game session (when status is <code>ACTIVE</code>). A player session
/// object, including player data, is automatically passed to a game session
/// when the player connects to the game session and is validated. After the
/// game session ends, player sessions information is retained for 30 days and
/// then removed.
///
/// <b>Related actions</b>
///
/// <a>CreatePlayerSession</a> | <a>CreatePlayerSessions</a> |
/// <a>DescribePlayerSessions</a> | <a>StartGameSessionPlacement</a> |
/// <a>DescribeGameSessionPlacement</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class PlayerSession {
  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// The DNS identifier assigned to the instance that is running the game
  /// session. Values have the following format:
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
  final String? dnsName;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// associated with the GameLift fleet that the player's game session is running
  /// on.
  final String? fleetArn;

  /// A unique identifier for the fleet that the player's game session is running
  /// on.
  final String? fleetId;

  /// A unique identifier for the game session that the player session is
  /// connected to.
  final String? gameSessionId;

  /// The IP address of the game session. To connect to a GameLift game server, an
  /// app needs both the IP address and port number.
  final String? ipAddress;

  /// Developer-defined information related to a player. GameLift does not use
  /// this data, so it can be formatted as needed for use in the game.
  final String? playerData;

  /// A unique identifier for a player that is associated with this player
  /// session.
  final String? playerId;

  /// A unique identifier for a player session.
  final String? playerSessionId;

  /// Port number for the game session. To connect to a Amazon GameLift server
  /// process, an app needs both the IP address and port number.
  final int? port;

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
  final PlayerSessionStatus? status;

  /// A time stamp indicating when this data object was terminated. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? terminationTime;

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

  factory PlayerSession.fromJson(Map<String, dynamic> json) {
    return PlayerSession(
      creationTime: timeStampFromJson(json['CreationTime']),
      dnsName: json['DnsName'] as String?,
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      gameSessionId: json['GameSessionId'] as String?,
      ipAddress: json['IpAddress'] as String?,
      playerData: json['PlayerData'] as String?,
      playerId: json['PlayerId'] as String?,
      playerSessionId: json['PlayerSessionId'] as String?,
      port: json['Port'] as int?,
      status: (json['Status'] as String?)?.toPlayerSessionStatus(),
      terminationTime: timeStampFromJson(json['TerminationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dnsName = this.dnsName;
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final gameSessionId = this.gameSessionId;
    final ipAddress = this.ipAddress;
    final playerData = this.playerData;
    final playerId = this.playerId;
    final playerSessionId = this.playerSessionId;
    final port = this.port;
    final status = this.status;
    final terminationTime = this.terminationTime;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dnsName != null) 'DnsName': dnsName,
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (gameSessionId != null) 'GameSessionId': gameSessionId,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (playerData != null) 'PlayerData': playerData,
      if (playerId != null) 'PlayerId': playerId,
      if (playerSessionId != null) 'PlayerSessionId': playerSessionId,
      if (port != null) 'Port': port,
      if (status != null) 'Status': status.toValue(),
      if (terminationTime != null)
        'TerminationTime': unixTimestampToJson(terminationTime),
    };
  }
}

enum PlayerSessionCreationPolicy {
  acceptAll,
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
  }
}

extension on String {
  PlayerSessionCreationPolicy toPlayerSessionCreationPolicy() {
    switch (this) {
      case 'ACCEPT_ALL':
        return PlayerSessionCreationPolicy.acceptAll;
      case 'DENY_ALL':
        return PlayerSessionCreationPolicy.denyAll;
    }
    throw Exception('$this is not known in enum PlayerSessionCreationPolicy');
  }
}

enum PlayerSessionStatus {
  reserved,
  active,
  completed,
  timedout,
}

extension on PlayerSessionStatus {
  String toValue() {
    switch (this) {
      case PlayerSessionStatus.reserved:
        return 'RESERVED';
      case PlayerSessionStatus.active:
        return 'ACTIVE';
      case PlayerSessionStatus.completed:
        return 'COMPLETED';
      case PlayerSessionStatus.timedout:
        return 'TIMEDOUT';
    }
  }
}

extension on String {
  PlayerSessionStatus toPlayerSessionStatus() {
    switch (this) {
      case 'RESERVED':
        return PlayerSessionStatus.reserved;
      case 'ACTIVE':
        return PlayerSessionStatus.active;
      case 'COMPLETED':
        return PlayerSessionStatus.completed;
      case 'TIMEDOUT':
        return PlayerSessionStatus.timedout;
    }
    throw Exception('$this is not known in enum PlayerSessionStatus');
  }
}

enum PolicyType {
  ruleBased,
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
  }
}

extension on String {
  PolicyType toPolicyType() {
    switch (this) {
      case 'RuleBased':
        return PolicyType.ruleBased;
      case 'TargetBased':
        return PolicyType.targetBased;
    }
    throw Exception('$this is not known in enum PolicyType');
  }
}

/// Custom prioritization settings for use by a game session queue when placing
/// new game sessions with available game servers. When defined, this
/// configuration replaces the default FleetIQ prioritization process, which is
/// as follows:
///
/// <ul>
/// <li>
/// If player latency data is included in a game session request, destinations
/// and locations are prioritized first based on lowest average latency (1),
/// then on lowest hosting cost (2), then on destination list order (3), and
/// finally on location (alphabetical) (4). This approach ensures that the
/// queue's top priority is to place game sessions where average player latency
/// is lowest, and--if latency is the same--where the hosting cost is less, etc.
/// </li>
/// <li>
/// If player latency data is not included, destinations and locations are
/// prioritized first on destination list order (1), and then on location
/// (alphabetical) (2). This approach ensures that the queue's top priority is
/// to place game sessions on the first destination fleet listed. If that fleet
/// has multiple locations, the game session is placed on the first location
/// (when listed alphabetically).
/// </li>
/// </ul>
/// Changing the priority order will affect how game sessions are placed.
///
/// Priority configurations are part of a <a>GameSessionQueue</a>.
class PriorityConfiguration {
  /// The prioritization order to use for fleet locations, when the
  /// <code>PriorityOrder</code> property includes <code>LOCATION</code>.
  /// Locations are identified by AWS Region codes such as <code>us-west-2</code>.
  /// Each location can only be listed once.
  final List<String>? locationOrder;

  /// The recommended sequence to use when prioritizing where to place new game
  /// sessions. Each type can only be listed once.
  ///
  /// <ul>
  /// <li>
  /// <code>LATENCY</code> -- FleetIQ prioritizes locations where the average
  /// player latency (provided in each game session request) is lowest.
  /// </li>
  /// <li>
  /// <code>COST</code> -- FleetIQ prioritizes destinations with the lowest
  /// current hosting costs. Cost is evaluated based on the location, instance
  /// type, and fleet type (Spot or On-Demand) for each destination in the queue.
  /// </li>
  /// <li>
  /// <code>DESTINATION</code> -- FleetIQ prioritizes based on the order that
  /// destinations are listed in the queue configuration.
  /// </li>
  /// <li>
  /// <code>LOCATION</code> -- FleetIQ prioritizes based on the provided order of
  /// locations, as defined in <code>LocationOrder</code>.
  /// </li>
  /// </ul>
  final List<PriorityType>? priorityOrder;

  PriorityConfiguration({
    this.locationOrder,
    this.priorityOrder,
  });

  factory PriorityConfiguration.fromJson(Map<String, dynamic> json) {
    return PriorityConfiguration(
      locationOrder: (json['LocationOrder'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      priorityOrder: (json['PriorityOrder'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPriorityType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final locationOrder = this.locationOrder;
    final priorityOrder = this.priorityOrder;
    return {
      if (locationOrder != null) 'LocationOrder': locationOrder,
      if (priorityOrder != null)
        'PriorityOrder': priorityOrder.map((e) => e.toValue()).toList(),
    };
  }
}

enum PriorityType {
  latency,
  cost,
  destination,
  location,
}

extension on PriorityType {
  String toValue() {
    switch (this) {
      case PriorityType.latency:
        return 'LATENCY';
      case PriorityType.cost:
        return 'COST';
      case PriorityType.destination:
        return 'DESTINATION';
      case PriorityType.location:
        return 'LOCATION';
    }
  }
}

extension on String {
  PriorityType toPriorityType() {
    switch (this) {
      case 'LATENCY':
        return PriorityType.latency;
      case 'COST':
        return PriorityType.cost;
      case 'DESTINATION':
        return PriorityType.destination;
      case 'LOCATION':
        return PriorityType.location;
    }
    throw Exception('$this is not known in enum PriorityType');
  }
}

enum ProtectionPolicy {
  noProtection,
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
  }
}

extension on String {
  ProtectionPolicy toProtectionPolicy() {
    switch (this) {
      case 'NoProtection':
        return ProtectionPolicy.noProtection;
      case 'FullProtection':
        return ProtectionPolicy.fullProtection;
    }
    throw Exception('$this is not known in enum ProtectionPolicy');
  }
}

/// Represents the returned data in response to a request operation.
class PutScalingPolicyOutput {
  /// A descriptive label that is associated with a fleet's scaling policy. Policy
  /// names do not need to be unique.
  final String? name;

  PutScalingPolicyOutput({
    this.name,
  });

  factory PutScalingPolicyOutput.fromJson(Map<String, dynamic> json) {
    return PutScalingPolicyOutput(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

class RegisterGameServerOutput {
  /// Object that describes the newly registered game server.
  final GameServer? gameServer;

  RegisterGameServerOutput({
    this.gameServer,
  });

  factory RegisterGameServerOutput.fromJson(Map<String, dynamic> json) {
    return RegisterGameServerOutput(
      gameServer: json['GameServer'] != null
          ? GameServer.fromJson(json['GameServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServer = this.gameServer;
    return {
      if (gameServer != null) 'GameServer': gameServer,
    };
  }
}

/// Represents the returned data in response to a request operation.
class RequestUploadCredentialsOutput {
  /// Amazon S3 path and key, identifying where the game build files are stored.
  final S3Location? storageLocation;

  /// AWS credentials required when uploading a game build to the storage
  /// location. These credentials have a limited lifespan and are valid only for
  /// the build they were issued for.
  final AwsCredentials? uploadCredentials;

  RequestUploadCredentialsOutput({
    this.storageLocation,
    this.uploadCredentials,
  });

  factory RequestUploadCredentialsOutput.fromJson(Map<String, dynamic> json) {
    return RequestUploadCredentialsOutput(
      storageLocation: json['StorageLocation'] != null
          ? S3Location.fromJson(json['StorageLocation'] as Map<String, dynamic>)
          : null,
      uploadCredentials: json['UploadCredentials'] != null
          ? AwsCredentials.fromJson(
              json['UploadCredentials'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final storageLocation = this.storageLocation;
    final uploadCredentials = this.uploadCredentials;
    return {
      if (storageLocation != null) 'StorageLocation': storageLocation,
      if (uploadCredentials != null) 'UploadCredentials': uploadCredentials,
    };
  }
}

/// Represents the returned data in response to a request operation.
class ResolveAliasOutput {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// associated with the GameLift fleet resource that this alias points to.
  final String? fleetArn;

  /// The fleet identifier that the alias is pointing to.
  final String? fleetId;

  ResolveAliasOutput({
    this.fleetArn,
    this.fleetId,
  });

  factory ResolveAliasOutput.fromJson(Map<String, dynamic> json) {
    return ResolveAliasOutput(
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    return {
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
    };
  }
}

/// A policy that puts limits on the number of game sessions that a player can
/// create within a specified span of time. With this policy, you can control
/// players' ability to consume available resources.
///
/// The policy is evaluated when a player tries to create a new game session. On
/// receiving a <code>CreateGameSession</code> request, GameLift checks that the
/// player (identified by <code>CreatorId</code>) has created fewer than game
/// session limit in the specified time period.
///
/// The resource creation limit policy is included in <a>FleetAttributes</a>.
class ResourceCreationLimitPolicy {
  /// The maximum number of game sessions that an individual can create during the
  /// policy period.
  final int? newGameSessionsPerCreator;

  /// The time span used in evaluating the resource creation limit policy.
  final int? policyPeriodInMinutes;

  ResourceCreationLimitPolicy({
    this.newGameSessionsPerCreator,
    this.policyPeriodInMinutes,
  });

  factory ResourceCreationLimitPolicy.fromJson(Map<String, dynamic> json) {
    return ResourceCreationLimitPolicy(
      newGameSessionsPerCreator: json['NewGameSessionsPerCreator'] as int?,
      policyPeriodInMinutes: json['PolicyPeriodInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final newGameSessionsPerCreator = this.newGameSessionsPerCreator;
    final policyPeriodInMinutes = this.policyPeriodInMinutes;
    return {
      if (newGameSessionsPerCreator != null)
        'NewGameSessionsPerCreator': newGameSessionsPerCreator,
      if (policyPeriodInMinutes != null)
        'PolicyPeriodInMinutes': policyPeriodInMinutes,
    };
  }
}

class ResumeGameServerGroupOutput {
  /// An object that describes the game server group resource, with the
  /// <code>SuspendedActions</code> property updated to reflect the resumed
  /// activity.
  final GameServerGroup? gameServerGroup;

  ResumeGameServerGroupOutput({
    this.gameServerGroup,
  });

  factory ResumeGameServerGroupOutput.fromJson(Map<String, dynamic> json) {
    return ResumeGameServerGroupOutput(
      gameServerGroup: json['GameServerGroup'] != null
          ? GameServerGroup.fromJson(
              json['GameServerGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServerGroup = this.gameServerGroup;
    return {
      if (gameServerGroup != null) 'GameServerGroup': gameServerGroup,
    };
  }
}

/// The routing configuration for a fleet alias.
///
/// <b>Related actions</b>
///
/// <a>CreateAlias</a> | <a>ListAliases</a> | <a>DescribeAlias</a> |
/// <a>UpdateAlias</a> | <a>DeleteAlias</a> | <a>ResolveAlias</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class RoutingStrategy {
  /// A unique identifier for the fleet that the alias points to. This value is
  /// the fleet ID, not the fleet ARN.
  final String? fleetId;

  /// The message text to be used with a terminal routing strategy.
  final String? message;

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
  final RoutingStrategyType? type;

  RoutingStrategy({
    this.fleetId,
    this.message,
    this.type,
  });

  factory RoutingStrategy.fromJson(Map<String, dynamic> json) {
    return RoutingStrategy(
      fleetId: json['FleetId'] as String?,
      message: json['Message'] as String?,
      type: (json['Type'] as String?)?.toRoutingStrategyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final fleetId = this.fleetId;
    final message = this.message;
    final type = this.type;
    return {
      if (fleetId != null) 'FleetId': fleetId,
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum RoutingStrategyType {
  simple,
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
  }
}

extension on String {
  RoutingStrategyType toRoutingStrategyType() {
    switch (this) {
      case 'SIMPLE':
        return RoutingStrategyType.simple;
      case 'TERMINAL':
        return RoutingStrategyType.terminal;
    }
    throw Exception('$this is not known in enum RoutingStrategyType');
  }
}

/// A collection of server process configurations that describe the set of
/// processes to run on each instance in a fleet. Server processes run either an
/// executable in a custom game build or a Realtime Servers script. GameLift
/// launches the configured processes, manages their life cycle, and replaces
/// them as needed. Each instance checks regularly for an updated runtime
/// configuration.
///
/// A GameLift instance is limited to 50 processes running concurrently. To
/// calculate the total number of processes in a runtime configuration, add the
/// values of the <code>ConcurrentExecutions</code> parameter for each
/// <a>ServerProcess</a>. Learn more about <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-multiprocess.html">
/// Running Multiple Processes on a Fleet</a>.
///
/// <b>Related actions</b>
///
/// <a>DescribeRuntimeConfiguration</a> | <a>UpdateRuntimeConfiguration</a>
class RuntimeConfiguration {
  /// The maximum amount of time (in seconds) allowed to launch a new game session
  /// and have it report ready to host players. During this time, the game session
  /// is in status <code>ACTIVATING</code>. If the game session does not become
  /// active before the timeout, it is ended and the game session status is
  /// changed to <code>TERMINATED</code>.
  final int? gameSessionActivationTimeoutSeconds;

  /// The number of game sessions in status <code>ACTIVATING</code> to allow on an
  /// instance. This setting limits the instance resources that can be used for
  /// new game activations at any one time.
  final int? maxConcurrentGameSessionActivations;

  /// A collection of server process configurations that identify what server
  /// processes to run on each instance in a fleet.
  final List<ServerProcess>? serverProcesses;

  RuntimeConfiguration({
    this.gameSessionActivationTimeoutSeconds,
    this.maxConcurrentGameSessionActivations,
    this.serverProcesses,
  });

  factory RuntimeConfiguration.fromJson(Map<String, dynamic> json) {
    return RuntimeConfiguration(
      gameSessionActivationTimeoutSeconds:
          json['GameSessionActivationTimeoutSeconds'] as int?,
      maxConcurrentGameSessionActivations:
          json['MaxConcurrentGameSessionActivations'] as int?,
      serverProcesses: (json['ServerProcesses'] as List?)
          ?.whereNotNull()
          .map((e) => ServerProcess.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final gameSessionActivationTimeoutSeconds =
        this.gameSessionActivationTimeoutSeconds;
    final maxConcurrentGameSessionActivations =
        this.maxConcurrentGameSessionActivations;
    final serverProcesses = this.serverProcesses;
    return {
      if (gameSessionActivationTimeoutSeconds != null)
        'GameSessionActivationTimeoutSeconds':
            gameSessionActivationTimeoutSeconds,
      if (maxConcurrentGameSessionActivations != null)
        'MaxConcurrentGameSessionActivations':
            maxConcurrentGameSessionActivations,
      if (serverProcesses != null) 'ServerProcesses': serverProcesses,
    };
  }
}

/// The location in Amazon S3 where build or script files are stored for access
/// by Amazon GameLift. This location is specified in <a>CreateBuild</a>,
/// <a>CreateScript</a>, and <a>UpdateScript</a> requests.
class S3Location {
  /// An Amazon S3 bucket identifier. This is the name of the S3 bucket.
  /// <note>
  /// GameLift currently does not support uploading from Amazon S3 buckets with
  /// names that contain a dot (.).
  /// </note>
  final String? bucket;

  /// The name of the zip file that contains the build files or script files.
  final String? key;

  /// The version of the file, if object versioning is turned on for the bucket.
  /// Amazon GameLift uses this information when retrieving files from an S3
  /// bucket that you own. Use this parameter to specify a specific version of the
  /// file. If not set, the latest version of the file is retrieved.
  final String? objectVersion;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// for an IAM role that allows Amazon GameLift to access the S3 bucket.
  final String? roleArn;

  S3Location({
    this.bucket,
    this.key,
    this.objectVersion,
    this.roleArn,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: json['Bucket'] as String?,
      key: json['Key'] as String?,
      objectVersion: json['ObjectVersion'] as String?,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    final objectVersion = this.objectVersion;
    final roleArn = this.roleArn;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (key != null) 'Key': key,
      if (objectVersion != null) 'ObjectVersion': objectVersion,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

enum ScalingAdjustmentType {
  changeInCapacity,
  exactCapacity,
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
  }
}

extension on String {
  ScalingAdjustmentType toScalingAdjustmentType() {
    switch (this) {
      case 'ChangeInCapacity':
        return ScalingAdjustmentType.changeInCapacity;
      case 'ExactCapacity':
        return ScalingAdjustmentType.exactCapacity;
      case 'PercentChangeInCapacity':
        return ScalingAdjustmentType.percentChangeInCapacity;
    }
    throw Exception('$this is not known in enum ScalingAdjustmentType');
  }
}

/// Rule that controls how a fleet is scaled. Scaling policies are uniquely
/// identified by the combination of name and fleet ID.
///
/// <b>Related actions</b>
///
/// <a>DescribeFleetCapacity</a> | <a>UpdateFleetCapacity</a> |
/// <a>DescribeEC2InstanceLimits</a> | <a>PutScalingPolicy</a> |
/// <a>DescribeScalingPolicies</a> | <a>DeleteScalingPolicy</a> |
/// <a>StopFleetActions</a> | <a>StartFleetActions</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class ScalingPolicy {
  /// Comparison operator to use when measuring a metric against the threshold
  /// value.
  final ComparisonOperatorType? comparisonOperator;

  /// Length of time (in minutes) the metric must be at or beyond the threshold
  /// before a scaling event is triggered.
  final int? evaluationPeriods;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet that is associated with this scaling
  /// policy.
  final String? fleetId;

  ///
  final String? location;

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
  final MetricName? metricName;

  /// A descriptive label that is associated with a fleet's scaling policy. Policy
  /// names do not need to be unique.
  final String? name;

  /// The type of scaling policy to create. For a target-based policy, set the
  /// parameter <i>MetricName</i> to 'PercentAvailableGameSessions' and specify a
  /// <i>TargetConfiguration</i>. For a rule-based policy set the following
  /// parameters: <i>MetricName</i>, <i>ComparisonOperator</i>, <i>Threshold</i>,
  /// <i>EvaluationPeriods</i>, <i>ScalingAdjustmentType</i>, and
  /// <i>ScalingAdjustment</i>.
  final PolicyType? policyType;

  /// Amount of adjustment to make, based on the scaling adjustment type.
  final int? scalingAdjustment;

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
  final ScalingAdjustmentType? scalingAdjustmentType;

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
  final ScalingStatusType? status;

  /// An object that contains settings for a target-based scaling policy.
  final TargetConfiguration? targetConfiguration;

  /// Metric value used to trigger a scaling event.
  final double? threshold;

  /// The current status of the fleet's scaling policies in a requested fleet
  /// location. The status <code>PENDING_UPDATE</code> indicates that an update
  /// was requested for the fleet but has not yet been completed for the location.
  final LocationUpdateStatus? updateStatus;

  ScalingPolicy({
    this.comparisonOperator,
    this.evaluationPeriods,
    this.fleetArn,
    this.fleetId,
    this.location,
    this.metricName,
    this.name,
    this.policyType,
    this.scalingAdjustment,
    this.scalingAdjustmentType,
    this.status,
    this.targetConfiguration,
    this.threshold,
    this.updateStatus,
  });

  factory ScalingPolicy.fromJson(Map<String, dynamic> json) {
    return ScalingPolicy(
      comparisonOperator:
          (json['ComparisonOperator'] as String?)?.toComparisonOperatorType(),
      evaluationPeriods: json['EvaluationPeriods'] as int?,
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      location: json['Location'] as String?,
      metricName: (json['MetricName'] as String?)?.toMetricName(),
      name: json['Name'] as String?,
      policyType: (json['PolicyType'] as String?)?.toPolicyType(),
      scalingAdjustment: json['ScalingAdjustment'] as int?,
      scalingAdjustmentType:
          (json['ScalingAdjustmentType'] as String?)?.toScalingAdjustmentType(),
      status: (json['Status'] as String?)?.toScalingStatusType(),
      targetConfiguration: json['TargetConfiguration'] != null
          ? TargetConfiguration.fromJson(
              json['TargetConfiguration'] as Map<String, dynamic>)
          : null,
      threshold: json['Threshold'] as double?,
      updateStatus: (json['UpdateStatus'] as String?)?.toLocationUpdateStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final evaluationPeriods = this.evaluationPeriods;
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final location = this.location;
    final metricName = this.metricName;
    final name = this.name;
    final policyType = this.policyType;
    final scalingAdjustment = this.scalingAdjustment;
    final scalingAdjustmentType = this.scalingAdjustmentType;
    final status = this.status;
    final targetConfiguration = this.targetConfiguration;
    final threshold = this.threshold;
    final updateStatus = this.updateStatus;
    return {
      if (comparisonOperator != null)
        'ComparisonOperator': comparisonOperator.toValue(),
      if (evaluationPeriods != null) 'EvaluationPeriods': evaluationPeriods,
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (location != null) 'Location': location,
      if (metricName != null) 'MetricName': metricName.toValue(),
      if (name != null) 'Name': name,
      if (policyType != null) 'PolicyType': policyType.toValue(),
      if (scalingAdjustment != null) 'ScalingAdjustment': scalingAdjustment,
      if (scalingAdjustmentType != null)
        'ScalingAdjustmentType': scalingAdjustmentType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (targetConfiguration != null)
        'TargetConfiguration': targetConfiguration,
      if (threshold != null) 'Threshold': threshold,
      if (updateStatus != null) 'UpdateStatus': updateStatus.toValue(),
    };
  }
}

enum ScalingStatusType {
  active,
  updateRequested,
  updating,
  deleteRequested,
  deleting,
  deleted,
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
  }
}

extension on String {
  ScalingStatusType toScalingStatusType() {
    switch (this) {
      case 'ACTIVE':
        return ScalingStatusType.active;
      case 'UPDATE_REQUESTED':
        return ScalingStatusType.updateRequested;
      case 'UPDATING':
        return ScalingStatusType.updating;
      case 'DELETE_REQUESTED':
        return ScalingStatusType.deleteRequested;
      case 'DELETING':
        return ScalingStatusType.deleting;
      case 'DELETED':
        return ScalingStatusType.deleted;
      case 'ERROR':
        return ScalingStatusType.error;
    }
    throw Exception('$this is not known in enum ScalingStatusType');
  }
}

/// Properties describing a Realtime script.
///
/// <b>Related actions</b>
///
/// <a>CreateScript</a> | <a>ListScripts</a> | <a>DescribeScript</a> |
/// <a>UpdateScript</a> | <a>DeleteScript</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class Script {
  /// A time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// A descriptive label that is associated with a script. Script names do not
  /// need to be unique.
  final String? name;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift script resource and uniquely identifies it.
  /// ARNs are unique across all Regions. In a GameLift script ARN, the resource
  /// ID matches the <i>ScriptId</i> value.
  final String? scriptArn;

  /// A unique identifier for the Realtime script
  final String? scriptId;

  /// The file size of the uploaded Realtime script, expressed in bytes. When
  /// files are uploaded from an S3 location, this value remains at "0".
  final int? sizeOnDisk;
  final S3Location? storageLocation;

  /// Version information that is associated with a build or script. Version
  /// strings do not need to be unique.
  final String? version;

  Script({
    this.creationTime,
    this.name,
    this.scriptArn,
    this.scriptId,
    this.sizeOnDisk,
    this.storageLocation,
    this.version,
  });

  factory Script.fromJson(Map<String, dynamic> json) {
    return Script(
      creationTime: timeStampFromJson(json['CreationTime']),
      name: json['Name'] as String?,
      scriptArn: json['ScriptArn'] as String?,
      scriptId: json['ScriptId'] as String?,
      sizeOnDisk: json['SizeOnDisk'] as int?,
      storageLocation: json['StorageLocation'] != null
          ? S3Location.fromJson(json['StorageLocation'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final name = this.name;
    final scriptArn = this.scriptArn;
    final scriptId = this.scriptId;
    final sizeOnDisk = this.sizeOnDisk;
    final storageLocation = this.storageLocation;
    final version = this.version;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (name != null) 'Name': name,
      if (scriptArn != null) 'ScriptArn': scriptArn,
      if (scriptId != null) 'ScriptId': scriptId,
      if (sizeOnDisk != null) 'SizeOnDisk': sizeOnDisk,
      if (storageLocation != null) 'StorageLocation': storageLocation,
      if (version != null) 'Version': version,
    };
  }
}

/// Represents the returned data in response to a request operation.
class SearchGameSessionsOutput {
  /// A collection of objects containing game session properties for each session
  /// that matches the request.
  final List<GameSession>? gameSessions;

  /// A token that indicates where to resume retrieving results on the next call
  /// to this operation. If no token is returned, these results represent the end
  /// of the list.
  final String? nextToken;

  SearchGameSessionsOutput({
    this.gameSessions,
    this.nextToken,
  });

  factory SearchGameSessionsOutput.fromJson(Map<String, dynamic> json) {
    return SearchGameSessionsOutput(
      gameSessions: (json['GameSessions'] as List?)
          ?.whereNotNull()
          .map((e) => GameSession.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSessions = this.gameSessions;
    final nextToken = this.nextToken;
    return {
      if (gameSessions != null) 'GameSessions': gameSessions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A set of instructions for launching server processes on each instance in a
/// fleet. Server processes run either an executable in a custom game build or a
/// Realtime Servers script. Server process configurations are part of a fleet's
/// <a>RuntimeConfiguration</a>.
class ServerProcess {
  /// The number of server processes using this configuration that run
  /// concurrently on each instance.
  final int concurrentExecutions;

  /// The location of a game build executable or the Realtime script file that
  /// contains the <code>Init()</code> function. Game builds and Realtime scripts
  /// are installed on instances at the root:
  ///
  /// <ul>
  /// <li>
  /// Windows (custom game builds only): <code>C:\game</code>. Example:
  /// "<code>C:\game\MyGame\server.exe</code>"
  /// </li>
  /// <li>
  /// Linux: <code>/local/game</code>. Examples:
  /// "<code>/local/game/MyGame/server.exe</code>" or
  /// "<code>/local/game/MyRealtimeScript.js</code>"
  /// </li>
  /// </ul>
  final String launchPath;

  /// An optional list of parameters to pass to the server executable or Realtime
  /// script on launch.
  final String? parameters;

  ServerProcess({
    required this.concurrentExecutions,
    required this.launchPath,
    this.parameters,
  });

  factory ServerProcess.fromJson(Map<String, dynamic> json) {
    return ServerProcess(
      concurrentExecutions: json['ConcurrentExecutions'] as int,
      launchPath: json['LaunchPath'] as String,
      parameters: json['Parameters'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final concurrentExecutions = this.concurrentExecutions;
    final launchPath = this.launchPath;
    final parameters = this.parameters;
    return {
      'ConcurrentExecutions': concurrentExecutions,
      'LaunchPath': launchPath,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

enum SortOrder {
  ascending,
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
  }
}

extension on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// Represents the returned data in response to a request operation.
class StartFleetActionsOutput {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet to restart actions on.
  final String? fleetId;

  StartFleetActionsOutput({
    this.fleetArn,
    this.fleetId,
  });

  factory StartFleetActionsOutput.fromJson(Map<String, dynamic> json) {
    return StartFleetActionsOutput(
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    return {
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
    };
  }
}

/// Represents the returned data in response to a request operation.
class StartGameSessionPlacementOutput {
  /// Object that describes the newly created game session placement. This object
  /// includes all the information provided in the request, as well as start/end
  /// time stamps and placement status.
  final GameSessionPlacement? gameSessionPlacement;

  StartGameSessionPlacementOutput({
    this.gameSessionPlacement,
  });

  factory StartGameSessionPlacementOutput.fromJson(Map<String, dynamic> json) {
    return StartGameSessionPlacementOutput(
      gameSessionPlacement: json['GameSessionPlacement'] != null
          ? GameSessionPlacement.fromJson(
              json['GameSessionPlacement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSessionPlacement = this.gameSessionPlacement;
    return {
      if (gameSessionPlacement != null)
        'GameSessionPlacement': gameSessionPlacement,
    };
  }
}

/// Represents the returned data in response to a request operation.
class StartMatchBackfillOutput {
  /// Ticket representing the backfill matchmaking request. This object includes
  /// the information in the request, ticket status, and match results as
  /// generated during the matchmaking process.
  final MatchmakingTicket? matchmakingTicket;

  StartMatchBackfillOutput({
    this.matchmakingTicket,
  });

  factory StartMatchBackfillOutput.fromJson(Map<String, dynamic> json) {
    return StartMatchBackfillOutput(
      matchmakingTicket: json['MatchmakingTicket'] != null
          ? MatchmakingTicket.fromJson(
              json['MatchmakingTicket'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final matchmakingTicket = this.matchmakingTicket;
    return {
      if (matchmakingTicket != null) 'MatchmakingTicket': matchmakingTicket,
    };
  }
}

/// Represents the returned data in response to a request operation.
class StartMatchmakingOutput {
  /// Ticket representing the matchmaking request. This object include the
  /// information included in the request, ticket status, and match results as
  /// generated during the matchmaking process.
  final MatchmakingTicket? matchmakingTicket;

  StartMatchmakingOutput({
    this.matchmakingTicket,
  });

  factory StartMatchmakingOutput.fromJson(Map<String, dynamic> json) {
    return StartMatchmakingOutput(
      matchmakingTicket: json['MatchmakingTicket'] != null
          ? MatchmakingTicket.fromJson(
              json['MatchmakingTicket'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final matchmakingTicket = this.matchmakingTicket;
    return {
      if (matchmakingTicket != null) 'MatchmakingTicket': matchmakingTicket,
    };
  }
}

/// Represents the input for a request operation.
class StopFleetActionsOutput {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet to stop actions on.
  final String? fleetId;

  StopFleetActionsOutput({
    this.fleetArn,
    this.fleetId,
  });

  factory StopFleetActionsOutput.fromJson(Map<String, dynamic> json) {
    return StopFleetActionsOutput(
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    return {
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
    };
  }
}

/// Represents the returned data in response to a request operation.
class StopGameSessionPlacementOutput {
  /// Object that describes the canceled game session placement, with
  /// <code>CANCELLED</code> status and an end time stamp.
  final GameSessionPlacement? gameSessionPlacement;

  StopGameSessionPlacementOutput({
    this.gameSessionPlacement,
  });

  factory StopGameSessionPlacementOutput.fromJson(Map<String, dynamic> json) {
    return StopGameSessionPlacementOutput(
      gameSessionPlacement: json['GameSessionPlacement'] != null
          ? GameSessionPlacement.fromJson(
              json['GameSessionPlacement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSessionPlacement = this.gameSessionPlacement;
    return {
      if (gameSessionPlacement != null)
        'GameSessionPlacement': gameSessionPlacement,
    };
  }
}

class StopMatchmakingOutput {
  StopMatchmakingOutput();

  factory StopMatchmakingOutput.fromJson(Map<String, dynamic> _) {
    return StopMatchmakingOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class SuspendGameServerGroupOutput {
  /// An object that describes the game server group resource, with the
  /// <code>SuspendedActions</code> property updated to reflect the suspended
  /// activity.
  final GameServerGroup? gameServerGroup;

  SuspendGameServerGroupOutput({
    this.gameServerGroup,
  });

  factory SuspendGameServerGroupOutput.fromJson(Map<String, dynamic> json) {
    return SuspendGameServerGroupOutput(
      gameServerGroup: json['GameServerGroup'] != null
          ? GameServerGroup.fromJson(
              json['GameServerGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServerGroup = this.gameServerGroup;
    return {
      if (gameServerGroup != null) 'GameServerGroup': gameServerGroup,
    };
  }
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
/// <b>Related actions</b>
///
/// <a>TagResource</a> | <a>UntagResource</a> | <a>ListTagsForResource</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class Tag {
  /// The key for a developer-defined key:value pair for tagging an AWS resource.
  final String key;

  /// The value for a developer-defined key:value pair for tagging an AWS
  /// resource.
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

/// Settings for a target-based scaling policy (see <a>ScalingPolicy</a>. A
/// target-based policy tracks a particular fleet metric specifies a target
/// value for the metric. As player usage changes, the policy triggers Amazon
/// GameLift to adjust capacity so that the metric returns to the target value.
/// The target configuration specifies settings as needed for the target based
/// policy, including the target value.
///
/// <b>Related actions</b>
///
/// <a>DescribeFleetCapacity</a> | <a>UpdateFleetCapacity</a> |
/// <a>DescribeEC2InstanceLimits</a> | <a>PutScalingPolicy</a> |
/// <a>DescribeScalingPolicies</a> | <a>DeleteScalingPolicy</a> |
/// <a>StopFleetActions</a> | <a>StartFleetActions</a> | <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class TargetConfiguration {
  /// Desired value to use with a target-based scaling policy. The value must be
  /// relevant for whatever metric the scaling policy is using. For example, in a
  /// policy using the metric PercentAvailableGameSessions, the target value
  /// should be the preferred size of the fleet's buffer (the percent of capacity
  /// that should be idle and ready for new game sessions).
  final double targetValue;

  TargetConfiguration({
    required this.targetValue,
  });

  factory TargetConfiguration.fromJson(Map<String, dynamic> json) {
    return TargetConfiguration(
      targetValue: json['TargetValue'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final targetValue = this.targetValue;
    return {
      'TargetValue': targetValue,
    };
  }
}

/// <b>This data type is used with the GameLift FleetIQ and game server
/// groups.</b>
///
/// Settings for a target-based scaling policy as part of a
/// <a>GameServerGroupAutoScalingPolicy</a>. These settings are used to create a
/// target-based policy that tracks the GameLift FleetIQ metric
/// <code>"PercentUtilizedGameServers"</code> and specifies a target value for
/// the metric. As player usage changes, the policy triggers to adjust the game
/// server group capacity so that the metric returns to the target value.
class TargetTrackingConfiguration {
  /// Desired value to use with a game server group target-based scaling policy.
  final double targetValue;

  TargetTrackingConfiguration({
    required this.targetValue,
  });

  factory TargetTrackingConfiguration.fromJson(Map<String, dynamic> json) {
    return TargetTrackingConfiguration(
      targetValue: json['TargetValue'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final targetValue = this.targetValue;
    return {
      'TargetValue': targetValue,
    };
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

/// Represents the returned data in response to a request operation.
class UpdateAliasOutput {
  /// The updated alias resource.
  final Alias? alias;

  UpdateAliasOutput({
    this.alias,
  });

  factory UpdateAliasOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAliasOutput(
      alias: json['Alias'] != null
          ? Alias.fromJson(json['Alias'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    return {
      if (alias != null) 'Alias': alias,
    };
  }
}

/// Represents the returned data in response to a request operation.
class UpdateBuildOutput {
  /// The updated build resource.
  final Build? build;

  UpdateBuildOutput({
    this.build,
  });

  factory UpdateBuildOutput.fromJson(Map<String, dynamic> json) {
    return UpdateBuildOutput(
      build: json['Build'] != null
          ? Build.fromJson(json['Build'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final build = this.build;
    return {
      if (build != null) 'Build': build,
    };
  }
}

/// Represents the returned data in response to a request operation.
class UpdateFleetAttributesOutput {
  /// A unique identifier for the fleet that was updated.
  final String? fleetId;

  UpdateFleetAttributesOutput({
    this.fleetId,
  });

  factory UpdateFleetAttributesOutput.fromJson(Map<String, dynamic> json) {
    return UpdateFleetAttributesOutput(
      fleetId: json['FleetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetId = this.fleetId;
    return {
      if (fleetId != null) 'FleetId': fleetId,
    };
  }
}

/// Represents the returned data in response to a request operation.
class UpdateFleetCapacityOutput {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// that is assigned to a GameLift fleet resource and uniquely identifies it.
  /// ARNs are unique across all Regions. Format is
  /// <code>arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912</code>.
  final String? fleetArn;

  /// A unique identifier for the fleet that was updated.
  final String? fleetId;

  /// The remote location being updated, expressed as an AWS Region code, such as
  /// <code>us-west-2</code>.
  final String? location;

  UpdateFleetCapacityOutput({
    this.fleetArn,
    this.fleetId,
    this.location,
  });

  factory UpdateFleetCapacityOutput.fromJson(Map<String, dynamic> json) {
    return UpdateFleetCapacityOutput(
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      location: json['Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final location = this.location;
    return {
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (location != null) 'Location': location,
    };
  }
}

/// Represents the returned data in response to a request operation.
class UpdateFleetPortSettingsOutput {
  /// A unique identifier for the fleet that was updated.
  final String? fleetId;

  UpdateFleetPortSettingsOutput({
    this.fleetId,
  });

  factory UpdateFleetPortSettingsOutput.fromJson(Map<String, dynamic> json) {
    return UpdateFleetPortSettingsOutput(
      fleetId: json['FleetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetId = this.fleetId;
    return {
      if (fleetId != null) 'FleetId': fleetId,
    };
  }
}

class UpdateGameServerGroupOutput {
  /// An object that describes the game server group resource with updated
  /// properties.
  final GameServerGroup? gameServerGroup;

  UpdateGameServerGroupOutput({
    this.gameServerGroup,
  });

  factory UpdateGameServerGroupOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGameServerGroupOutput(
      gameServerGroup: json['GameServerGroup'] != null
          ? GameServerGroup.fromJson(
              json['GameServerGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServerGroup = this.gameServerGroup;
    return {
      if (gameServerGroup != null) 'GameServerGroup': gameServerGroup,
    };
  }
}

class UpdateGameServerOutput {
  /// Object that describes the newly updated game server.
  final GameServer? gameServer;

  UpdateGameServerOutput({
    this.gameServer,
  });

  factory UpdateGameServerOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGameServerOutput(
      gameServer: json['GameServer'] != null
          ? GameServer.fromJson(json['GameServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameServer = this.gameServer;
    return {
      if (gameServer != null) 'GameServer': gameServer,
    };
  }
}

/// Represents the returned data in response to a request operation.
class UpdateGameSessionOutput {
  /// The updated game session properties.
  final GameSession? gameSession;

  UpdateGameSessionOutput({
    this.gameSession,
  });

  factory UpdateGameSessionOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGameSessionOutput(
      gameSession: json['GameSession'] != null
          ? GameSession.fromJson(json['GameSession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSession = this.gameSession;
    return {
      if (gameSession != null) 'GameSession': gameSession,
    };
  }
}

/// Represents the returned data in response to a request operation.
class UpdateGameSessionQueueOutput {
  /// An object that describes the newly updated game session queue.
  final GameSessionQueue? gameSessionQueue;

  UpdateGameSessionQueueOutput({
    this.gameSessionQueue,
  });

  factory UpdateGameSessionQueueOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGameSessionQueueOutput(
      gameSessionQueue: json['GameSessionQueue'] != null
          ? GameSessionQueue.fromJson(
              json['GameSessionQueue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameSessionQueue = this.gameSessionQueue;
    return {
      if (gameSessionQueue != null) 'GameSessionQueue': gameSessionQueue,
    };
  }
}

/// Represents the returned data in response to a request operation.
class UpdateMatchmakingConfigurationOutput {
  /// The updated matchmaking configuration.
  final MatchmakingConfiguration? configuration;

  UpdateMatchmakingConfigurationOutput({
    this.configuration,
  });

  factory UpdateMatchmakingConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateMatchmakingConfigurationOutput(
      configuration: json['Configuration'] != null
          ? MatchmakingConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      if (configuration != null) 'Configuration': configuration,
    };
  }
}

/// Represents the returned data in response to a request operation.
class UpdateRuntimeConfigurationOutput {
  /// The runtime configuration currently in use by all instances in the fleet. If
  /// the update was successful, all property changes are shown.
  final RuntimeConfiguration? runtimeConfiguration;

  UpdateRuntimeConfigurationOutput({
    this.runtimeConfiguration,
  });

  factory UpdateRuntimeConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateRuntimeConfigurationOutput(
      runtimeConfiguration: json['RuntimeConfiguration'] != null
          ? RuntimeConfiguration.fromJson(
              json['RuntimeConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final runtimeConfiguration = this.runtimeConfiguration;
    return {
      if (runtimeConfiguration != null)
        'RuntimeConfiguration': runtimeConfiguration,
    };
  }
}

class UpdateScriptOutput {
  /// The newly created script record with a unique script ID. The new script's
  /// storage location reflects an Amazon S3 location: (1) If the script was
  /// uploaded from an S3 bucket under your account, the storage location reflects
  /// the information that was provided in the <i>CreateScript</i> request; (2) If
  /// the script file was uploaded from a local zip file, the storage location
  /// reflects an S3 location controls by the Amazon GameLift service.
  final Script? script;

  UpdateScriptOutput({
    this.script,
  });

  factory UpdateScriptOutput.fromJson(Map<String, dynamic> json) {
    return UpdateScriptOutput(
      script: json['Script'] != null
          ? Script.fromJson(json['Script'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final script = this.script;
    return {
      if (script != null) 'Script': script,
    };
  }
}

/// Represents the returned data in response to a request operation.
class ValidateMatchmakingRuleSetOutput {
  /// A response indicating whether the rule set is valid.
  final bool? valid;

  ValidateMatchmakingRuleSetOutput({
    this.valid,
  });

  factory ValidateMatchmakingRuleSetOutput.fromJson(Map<String, dynamic> json) {
    return ValidateMatchmakingRuleSetOutput(
      valid: json['Valid'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final valid = this.valid;
    return {
      if (valid != null) 'Valid': valid,
    };
  }
}

/// Represents an authorization for a VPC peering connection between the VPC for
/// an Amazon GameLift fleet and another VPC on an account you have access to.
/// This authorization must exist and be valid for the peering connection to be
/// established. Authorizations are valid for 24 hours after they are issued.
///
/// <b>Related actions</b>
///
/// <a>CreateVpcPeeringAuthorization</a> |
/// <a>DescribeVpcPeeringAuthorizations</a> |
/// <a>DeleteVpcPeeringAuthorization</a> | <a>CreateVpcPeeringConnection</a> |
/// <a>DescribeVpcPeeringConnections</a> | <a>DeleteVpcPeeringConnection</a> |
/// <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class VpcPeeringAuthorization {
  /// Time stamp indicating when this authorization was issued. Format is a number
  /// expressed in Unix time as milliseconds (for example
  /// <code>"1469498468.057"</code>).
  final DateTime? creationTime;

  /// Time stamp indicating when this authorization expires (24 hours after
  /// issuance). Format is a number expressed in Unix time as milliseconds (for
  /// example <code>"1469498468.057"</code>).
  final DateTime? expirationTime;

  /// A unique identifier for the AWS account that you use to manage your GameLift
  /// fleet. You can find your Account ID in the AWS Management Console under
  /// account settings.
  final String? gameLiftAwsAccountId;

  /// <p/>
  final String? peerVpcAwsAccountId;

  /// A unique identifier for a VPC with resources to be accessed by your GameLift
  /// fleet. The VPC must be in the same Region as your fleet. To look up a VPC
  /// ID, use the <a href="https://console.aws.amazon.com/vpc/">VPC Dashboard</a>
  /// in the AWS Management Console. Learn more about VPC peering in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with GameLift Fleets</a>.
  final String? peerVpcId;

  VpcPeeringAuthorization({
    this.creationTime,
    this.expirationTime,
    this.gameLiftAwsAccountId,
    this.peerVpcAwsAccountId,
    this.peerVpcId,
  });

  factory VpcPeeringAuthorization.fromJson(Map<String, dynamic> json) {
    return VpcPeeringAuthorization(
      creationTime: timeStampFromJson(json['CreationTime']),
      expirationTime: timeStampFromJson(json['ExpirationTime']),
      gameLiftAwsAccountId: json['GameLiftAwsAccountId'] as String?,
      peerVpcAwsAccountId: json['PeerVpcAwsAccountId'] as String?,
      peerVpcId: json['PeerVpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final expirationTime = this.expirationTime;
    final gameLiftAwsAccountId = this.gameLiftAwsAccountId;
    final peerVpcAwsAccountId = this.peerVpcAwsAccountId;
    final peerVpcId = this.peerVpcId;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (expirationTime != null)
        'ExpirationTime': unixTimestampToJson(expirationTime),
      if (gameLiftAwsAccountId != null)
        'GameLiftAwsAccountId': gameLiftAwsAccountId,
      if (peerVpcAwsAccountId != null)
        'PeerVpcAwsAccountId': peerVpcAwsAccountId,
      if (peerVpcId != null) 'PeerVpcId': peerVpcId,
    };
  }
}

/// Represents a peering connection between a VPC on one of your AWS accounts
/// and the VPC for your Amazon GameLift fleets. This record may be for an
/// active peering connection or a pending connection that has not yet been
/// established.
///
/// <b>Related actions</b>
///
/// <a>CreateVpcPeeringAuthorization</a> |
/// <a>DescribeVpcPeeringAuthorizations</a> |
/// <a>DeleteVpcPeeringAuthorization</a> | <a>CreateVpcPeeringConnection</a> |
/// <a>DescribeVpcPeeringConnections</a> | <a>DeleteVpcPeeringConnection</a> |
/// <a
/// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets">All
/// APIs by task</a>
class VpcPeeringConnection {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html">ARN</a>)
  /// associated with the GameLift fleet resource for this connection.
  final String? fleetArn;

  /// A unique identifier for the fleet. This ID determines the ID of the Amazon
  /// GameLift VPC for your fleet.
  final String? fleetId;

  /// A unique identifier for the VPC that contains the Amazon GameLift fleet for
  /// this connection. This VPC is managed by Amazon GameLift and does not appear
  /// in your AWS account.
  final String? gameLiftVpcId;

  /// CIDR block of IPv4 addresses assigned to the VPC peering connection for the
  /// GameLift VPC. The peered VPC also has an IPv4 CIDR block associated with it;
  /// these blocks cannot overlap or the peering connection cannot be created.
  final String? ipV4CidrBlock;

  /// A unique identifier for a VPC with resources to be accessed by your GameLift
  /// fleet. The VPC must be in the same Region as your fleet. To look up a VPC
  /// ID, use the <a href="https://console.aws.amazon.com/vpc/">VPC Dashboard</a>
  /// in the AWS Management Console. Learn more about VPC peering in <a
  /// href="https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html">VPC
  /// Peering with GameLift Fleets</a>.
  final String? peerVpcId;

  /// The status information about the connection. Status indicates if a
  /// connection is pending, successful, or failed.
  final VpcPeeringConnectionStatus? status;

  /// A unique identifier that is automatically assigned to the connection record.
  /// This ID is referenced in VPC peering connection events, and is used when
  /// deleting a connection with <a>DeleteVpcPeeringConnection</a>.
  final String? vpcPeeringConnectionId;

  VpcPeeringConnection({
    this.fleetArn,
    this.fleetId,
    this.gameLiftVpcId,
    this.ipV4CidrBlock,
    this.peerVpcId,
    this.status,
    this.vpcPeeringConnectionId,
  });

  factory VpcPeeringConnection.fromJson(Map<String, dynamic> json) {
    return VpcPeeringConnection(
      fleetArn: json['FleetArn'] as String?,
      fleetId: json['FleetId'] as String?,
      gameLiftVpcId: json['GameLiftVpcId'] as String?,
      ipV4CidrBlock: json['IpV4CidrBlock'] as String?,
      peerVpcId: json['PeerVpcId'] as String?,
      status: json['Status'] != null
          ? VpcPeeringConnectionStatus.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
      vpcPeeringConnectionId: json['VpcPeeringConnectionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    final fleetId = this.fleetId;
    final gameLiftVpcId = this.gameLiftVpcId;
    final ipV4CidrBlock = this.ipV4CidrBlock;
    final peerVpcId = this.peerVpcId;
    final status = this.status;
    final vpcPeeringConnectionId = this.vpcPeeringConnectionId;
    return {
      if (fleetArn != null) 'FleetArn': fleetArn,
      if (fleetId != null) 'FleetId': fleetId,
      if (gameLiftVpcId != null) 'GameLiftVpcId': gameLiftVpcId,
      if (ipV4CidrBlock != null) 'IpV4CidrBlock': ipV4CidrBlock,
      if (peerVpcId != null) 'PeerVpcId': peerVpcId,
      if (status != null) 'Status': status,
      if (vpcPeeringConnectionId != null)
        'VpcPeeringConnectionId': vpcPeeringConnectionId,
    };
  }
}

/// Represents status information for a VPC peering connection. Status is
/// associated with a <a>VpcPeeringConnection</a> object. Status codes and
/// messages are provided from EC2 (see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_VpcPeeringConnectionStateReason.html">VpcPeeringConnectionStateReason</a>).
/// Connection status information is also communicated as a fleet <a>Event</a>.
class VpcPeeringConnectionStatus {
  /// Code indicating the status of a VPC peering connection.
  final String? code;

  /// Additional messaging associated with the connection status.
  final String? message;

  VpcPeeringConnectionStatus({
    this.code,
    this.message,
  });

  factory VpcPeeringConnectionStatus.fromJson(Map<String, dynamic> json) {
    return VpcPeeringConnectionStatus(
      code: json['Code'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code,
      if (message != null) 'Message': message,
    };
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class FleetCapacityExceededException extends _s.GenericAwsException {
  FleetCapacityExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'FleetCapacityExceededException',
            message: message);
}

class GameSessionFullException extends _s.GenericAwsException {
  GameSessionFullException({String? type, String? message})
      : super(type: type, code: 'GameSessionFullException', message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidFleetStatusException extends _s.GenericAwsException {
  InvalidFleetStatusException({String? type, String? message})
      : super(
            type: type, code: 'InvalidFleetStatusException', message: message);
}

class InvalidGameSessionStatusException extends _s.GenericAwsException {
  InvalidGameSessionStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidGameSessionStatusException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class OutOfCapacityException extends _s.GenericAwsException {
  OutOfCapacityException({String? type, String? message})
      : super(type: type, code: 'OutOfCapacityException', message: message);
}

class TaggingFailedException extends _s.GenericAwsException {
  TaggingFailedException({String? type, String? message})
      : super(type: type, code: 'TaggingFailedException', message: message);
}

class TerminalRoutingStrategyException extends _s.GenericAwsException {
  TerminalRoutingStrategyException({String? type, String? message})
      : super(
            type: type,
            code: 'TerminalRoutingStrategyException',
            message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

class UnsupportedRegionException extends _s.GenericAwsException {
  UnsupportedRegionException({String? type, String? message})
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
