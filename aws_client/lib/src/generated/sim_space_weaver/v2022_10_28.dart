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

/// SimSpace Weaver (SimSpace Weaver) is a service that you can use to build and
/// run large-scale spatial simulations in the Amazon Web Services Cloud. For
/// example, you can create crowd simulations, large real-world environments,
/// and immersive and interactive experiences. For more information about
/// SimSpace Weaver, see the <i> <a
/// href="https://docs.aws.amazon.com/simspaceweaver/latest/userguide/">SimSpace
/// Weaver User Guide</a> </i>.
///
/// This API reference describes the API operations and data types that you can
/// use to communicate directly with SimSpace Weaver.
///
/// SimSpace Weaver also provides the SimSpace Weaver app SDK, which you use for
/// app development. The SimSpace Weaver app SDK API reference is included in
/// the SimSpace Weaver app SDK documentation. This documentation is part of the
/// SimSpace Weaver app SDK distributable package.
class SimSpaceWeaver {
  final _s.RestJsonProtocol _protocol;
  SimSpaceWeaver({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'simspaceweaver',
            signingName: 'simspaceweaver',
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

  /// Creates a snapshot of the specified simulation. A snapshot is a file that
  /// contains simulation state data at a specific time. The state data saved in
  /// a snapshot includes entity data from the State Fabric, the simulation
  /// configuration specified in the schema, and the clock tick number. You can
  /// use the snapshot to initialize a new simulation. For more information
  /// about snapshots, see <a
  /// href="https://docs.aws.amazon.com/simspaceweaver/latest/userguide/working-with_snapshots.html">Snapshots</a>
  /// in the <i>SimSpace Weaver User Guide</i>.
  ///
  /// You specify a <code>Destination</code> when you create a snapshot. The
  /// <code>Destination</code> is the name of an Amazon S3 bucket and an
  /// optional <code>ObjectKeyPrefix</code>. The <code>ObjectKeyPrefix</code> is
  /// usually the name of a folder in the bucket. SimSpace Weaver creates a
  /// <code>snapshot</code> folder inside the <code>Destination</code> and
  /// places the snapshot file there.
  ///
  /// The snapshot file is an Amazon S3 object. It has an object key with the
  /// form: <code>
  /// <i>object-key-prefix</i>/snapshot/<i>simulation-name</i>-<i>YYMMdd</i>-<i>HHmm</i>-<i>ss</i>.zip</code>,
  /// where:
  ///
  /// <ul>
  /// <li>
  /// <code> <i>YY</i> </code> is the 2-digit year
  /// </li>
  /// <li>
  /// <code> <i>MM</i> </code> is the 2-digit month
  /// </li>
  /// <li>
  /// <code> <i>dd</i> </code> is the 2-digit day of the month
  /// </li>
  /// <li>
  /// <code> <i>HH</i> </code> is the 2-digit hour (24-hour clock)
  /// </li>
  /// <li>
  /// <code> <i>mm</i> </code> is the 2-digit minutes
  /// </li>
  /// <li>
  /// <code> <i>ss</i> </code> is the 2-digit seconds
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [destination] :
  /// The Amazon S3 bucket and optional folder (object key prefix) where
  /// SimSpace Weaver creates the snapshot file.
  ///
  /// The Amazon S3 bucket must be in the same Amazon Web Services Region as the
  /// simulation.
  ///
  /// Parameter [simulation] :
  /// The name of the simulation.
  Future<void> createSnapshot({
    required S3Destination destination,
    required String simulation,
  }) async {
    final $payload = <String, dynamic>{
      'Destination': destination,
      'Simulation': simulation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createsnapshot',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the instance of the given custom app.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [app] :
  /// The name of the app.
  ///
  /// Parameter [domain] :
  /// The name of the domain of the app.
  ///
  /// Parameter [simulation] :
  /// The name of the simulation of the app.
  Future<void> deleteApp({
    required String app,
    required String domain,
    required String simulation,
  }) async {
    final $query = <String, List<String>>{
      'app': [app],
      'domain': [domain],
      'simulation': [simulation],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/deleteapp',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes all SimSpace Weaver resources assigned to the given simulation.
  /// <note>
  /// Your simulation uses resources in other Amazon Web Services. This API
  /// operation doesn't delete resources in other Amazon Web Services.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [simulation] :
  /// The name of the simulation.
  Future<void> deleteSimulation({
    required String simulation,
  }) async {
    final $query = <String, List<String>>{
      'simulation': [simulation],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/deletesimulation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the state of the given custom app.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [app] :
  /// The name of the app.
  ///
  /// Parameter [domain] :
  /// The name of the domain of the app.
  ///
  /// Parameter [simulation] :
  /// The name of the simulation of the app.
  Future<DescribeAppOutput> describeApp({
    required String app,
    required String domain,
    required String simulation,
  }) async {
    final $query = <String, List<String>>{
      'app': [app],
      'domain': [domain],
      'simulation': [simulation],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/describeapp',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppOutput.fromJson(response);
  }

  /// Returns the current state of the given simulation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [simulation] :
  /// The name of the simulation.
  Future<DescribeSimulationOutput> describeSimulation({
    required String simulation,
  }) async {
    final $query = <String, List<String>>{
      'simulation': [simulation],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/describesimulation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSimulationOutput.fromJson(response);
  }

  /// Lists all custom apps or service apps for the given simulation and domain.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [simulation] :
  /// The name of the simulation that you want to list apps for.
  ///
  /// Parameter [domain] :
  /// The name of the domain that you want to list apps for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of apps to list.
  ///
  /// Parameter [nextToken] :
  /// If SimSpace Weaver returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an <i>HTTP 400
  /// ValidationException</i> error.
  Future<ListAppsOutput> listApps({
    required String simulation,
    String? domain,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      'simulation': [simulation],
      if (domain != null) 'domain': [domain],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/listapps',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppsOutput.fromJson(response);
  }

  /// Lists the SimSpace Weaver simulations in the Amazon Web Services account
  /// used to make the API call.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of simulations to list.
  ///
  /// Parameter [nextToken] :
  /// If SimSpace Weaver returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an <i>HTTP 400
  /// ValidationException</i> error.
  Future<ListSimulationsOutput> listSimulations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/listsimulations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSimulationsOutput.fromJson(response);
  }

  /// Lists all tags on a SimSpace Weaver resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. For more information about
  /// ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Starts a custom app with the configuration specified in the simulation
  /// schema.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [domain] :
  /// The name of the domain of the app.
  ///
  /// Parameter [name] :
  /// The name of the app.
  ///
  /// Parameter [simulation] :
  /// The name of the simulation of the app.
  ///
  /// Parameter [clientToken] :
  /// A value that you provide to ensure that repeated calls to this API
  /// operation using the same parameters complete only once. A
  /// <code>ClientToken</code> is also known as an <i>idempotency token</i>. A
  /// <code>ClientToken</code> expires after 24 hours.
  ///
  /// Parameter [description] :
  /// The description of the app.
  Future<StartAppOutput> startApp({
    required String domain,
    required String name,
    required String simulation,
    String? clientToken,
    String? description,
    LaunchOverrides? launchOverrides,
  }) async {
    final $payload = <String, dynamic>{
      'Domain': domain,
      'Name': name,
      'Simulation': simulation,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (launchOverrides != null) 'LaunchOverrides': launchOverrides,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/startapp',
      exceptionFnMap: _exceptionFns,
    );
    return StartAppOutput.fromJson(response);
  }

  /// Starts the simulation clock.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [simulation] :
  /// The name of the simulation.
  Future<void> startClock({
    required String simulation,
  }) async {
    final $payload = <String, dynamic>{
      'Simulation': simulation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/startclock',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a simulation with the given name. You must choose to start your
  /// simulation from a schema or from a snapshot. For more information about
  /// the schema, see the <a
  /// href="https://docs.aws.amazon.com/simspaceweaver/latest/userguide/schema-reference.html">schema
  /// reference</a> in the <i>SimSpace Weaver User Guide</i>. For more
  /// information about snapshots, see <a
  /// href="https://docs.aws.amazon.com/simspaceweaver/latest/userguide/working-with_snapshots.html">Snapshots</a>
  /// in the <i>SimSpace Weaver User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the simulation.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that the simulation assumes to perform actions. For more information
  /// about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>. For more information about IAM roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// roles</a> in the <i>Identity and Access Management User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A value that you provide to ensure that repeated calls to this API
  /// operation using the same parameters complete only once. A
  /// <code>ClientToken</code> is also known as an <i>idempotency token</i>. A
  /// <code>ClientToken</code> expires after 24 hours.
  ///
  /// Parameter [description] :
  /// The description of the simulation.
  ///
  /// Parameter [maximumDuration] :
  /// The maximum running time of the simulation, specified as a number of
  /// minutes (m or M), hours (h or H), or days (d or D). The simulation stops
  /// when it reaches this limit. The maximum value is <code>14D</code>, or its
  /// equivalent in the other units. The default value is <code>14D</code>. A
  /// value equivalent to <code>0</code> makes the simulation immediately
  /// transition to <code>Stopping</code> as soon as it reaches
  /// <code>Started</code>.
  ///
  /// Parameter [schemaS3Location] :
  /// The location of the simulation schema in Amazon Simple Storage Service
  /// (Amazon S3). For more information about Amazon S3, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html">
  /// <i>Amazon Simple Storage Service User Guide</i> </a>.
  ///
  /// Provide a <code>SchemaS3Location</code> to start your simulation from a
  /// schema.
  ///
  /// If you provide a <code>SchemaS3Location</code> then you can't provide a
  /// <code>SnapshotS3Location</code>.
  ///
  /// Parameter [snapshotS3Location] :
  /// The location of the snapshot .zip file in Amazon Simple Storage Service
  /// (Amazon S3). For more information about Amazon S3, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html">
  /// <i>Amazon Simple Storage Service User Guide</i> </a>.
  ///
  /// Provide a <code>SnapshotS3Location</code> to start your simulation from a
  /// snapshot.
  ///
  /// The Amazon S3 bucket must be in the same Amazon Web Services Region as the
  /// simulation.
  ///
  /// If you provide a <code>SnapshotS3Location</code> then you can't provide a
  /// <code>SchemaS3Location</code>.
  ///
  /// Parameter [tags] :
  /// A list of tags for the simulation. For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<StartSimulationOutput> startSimulation({
    required String name,
    required String roleArn,
    String? clientToken,
    String? description,
    String? maximumDuration,
    S3Location? schemaS3Location,
    S3Location? snapshotS3Location,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'RoleArn': roleArn,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (maximumDuration != null) 'MaximumDuration': maximumDuration,
      if (schemaS3Location != null) 'SchemaS3Location': schemaS3Location,
      if (snapshotS3Location != null) 'SnapshotS3Location': snapshotS3Location,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/startsimulation',
      exceptionFnMap: _exceptionFns,
    );
    return StartSimulationOutput.fromJson(response);
  }

  /// Stops the given custom app and shuts down all of its allocated compute
  /// resources.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [app] :
  /// The name of the app.
  ///
  /// Parameter [domain] :
  /// The name of the domain of the app.
  ///
  /// Parameter [simulation] :
  /// The name of the simulation of the app.
  Future<void> stopApp({
    required String app,
    required String domain,
    required String simulation,
  }) async {
    final $payload = <String, dynamic>{
      'App': app,
      'Domain': domain,
      'Simulation': simulation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/stopapp',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops the simulation clock.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [simulation] :
  /// The name of the simulation.
  Future<void> stopClock({
    required String simulation,
  }) async {
    final $payload = <String, dynamic>{
      'Simulation': simulation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/stopclock',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops the given simulation.
  /// <important>
  /// You can't restart a simulation after you stop it. If you want to restart a
  /// simulation, then you must stop it, delete it, and start a new instance of
  /// it.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [simulation] :
  /// The name of the simulation.
  Future<void> stopSimulation({
    required String simulation,
  }) async {
    final $payload = <String, dynamic>{
      'Simulation': simulation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/stopsimulation',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds tags to a SimSpace Weaver resource. For more information about tags,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// May throw [TooManyTagsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to add tags
  /// to. For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the resource.
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

  /// Removes tags from a SimSpace Weaver resource. For more information about
  /// tags, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to remove
  /// tags from. For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the resource.
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
}

enum ClockStatus {
  unknown,
  starting,
  started,
  stopping,
  stopped,
}

extension ClockStatusValueExtension on ClockStatus {
  String toValue() {
    switch (this) {
      case ClockStatus.unknown:
        return 'UNKNOWN';
      case ClockStatus.starting:
        return 'STARTING';
      case ClockStatus.started:
        return 'STARTED';
      case ClockStatus.stopping:
        return 'STOPPING';
      case ClockStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension ClockStatusFromString on String {
  ClockStatus toClockStatus() {
    switch (this) {
      case 'UNKNOWN':
        return ClockStatus.unknown;
      case 'STARTING':
        return ClockStatus.starting;
      case 'STARTED':
        return ClockStatus.started;
      case 'STOPPING':
        return ClockStatus.stopping;
      case 'STOPPED':
        return ClockStatus.stopped;
    }
    throw Exception('$this is not known in enum ClockStatus');
  }
}

enum ClockTargetStatus {
  unknown,
  started,
  stopped,
}

extension ClockTargetStatusValueExtension on ClockTargetStatus {
  String toValue() {
    switch (this) {
      case ClockTargetStatus.unknown:
        return 'UNKNOWN';
      case ClockTargetStatus.started:
        return 'STARTED';
      case ClockTargetStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension ClockTargetStatusFromString on String {
  ClockTargetStatus toClockTargetStatus() {
    switch (this) {
      case 'UNKNOWN':
        return ClockTargetStatus.unknown;
      case 'STARTED':
        return ClockTargetStatus.started;
      case 'STOPPED':
        return ClockTargetStatus.stopped;
    }
    throw Exception('$this is not known in enum ClockTargetStatus');
  }
}

/// The Amazon CloudWatch Logs log group for the simulation. For more
/// information about log groups, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html">Working
/// with log groups and log streams</a> in the <i>Amazon CloudWatch Logs User
/// Guide</i>.
class CloudWatchLogsLogGroup {
  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch Logs log group for
  /// the simulation. For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>. For more information about log groups, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html">Working
  /// with log groups and log streams</a> in the <i>Amazon CloudWatch Logs User
  /// Guide</i>.
  final String? logGroupArn;

  CloudWatchLogsLogGroup({
    this.logGroupArn,
  });

  factory CloudWatchLogsLogGroup.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsLogGroup(
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

class CreateSnapshotOutput {
  CreateSnapshotOutput();

  factory CreateSnapshotOutput.fromJson(Map<String, dynamic> _) {
    return CreateSnapshotOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAppOutput {
  DeleteAppOutput();

  factory DeleteAppOutput.fromJson(Map<String, dynamic> _) {
    return DeleteAppOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSimulationOutput {
  DeleteSimulationOutput();

  factory DeleteSimulationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteSimulationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAppOutput {
  /// The description of the app.
  final String? description;

  /// The name of the domain of the app.
  final String? domain;

  /// Information about the network endpoint for the custom app. You can use the
  /// endpoint to connect to the custom app.
  final SimulationAppEndpointInfo? endpointInfo;
  final LaunchOverrides? launchOverrides;

  /// The name of the app.
  final String? name;

  /// The name of the simulation of the app.
  final String? simulation;

  /// The current lifecycle state of the custom app.
  final SimulationAppStatus? status;

  /// The desired lifecycle state of the custom app.
  final SimulationAppTargetStatus? targetStatus;

  DescribeAppOutput({
    this.description,
    this.domain,
    this.endpointInfo,
    this.launchOverrides,
    this.name,
    this.simulation,
    this.status,
    this.targetStatus,
  });

  factory DescribeAppOutput.fromJson(Map<String, dynamic> json) {
    return DescribeAppOutput(
      description: json['Description'] as String?,
      domain: json['Domain'] as String?,
      endpointInfo: json['EndpointInfo'] != null
          ? SimulationAppEndpointInfo.fromJson(
              json['EndpointInfo'] as Map<String, dynamic>)
          : null,
      launchOverrides: json['LaunchOverrides'] != null
          ? LaunchOverrides.fromJson(
              json['LaunchOverrides'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      simulation: json['Simulation'] as String?,
      status: (json['Status'] as String?)?.toSimulationAppStatus(),
      targetStatus:
          (json['TargetStatus'] as String?)?.toSimulationAppTargetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final domain = this.domain;
    final endpointInfo = this.endpointInfo;
    final launchOverrides = this.launchOverrides;
    final name = this.name;
    final simulation = this.simulation;
    final status = this.status;
    final targetStatus = this.targetStatus;
    return {
      if (description != null) 'Description': description,
      if (domain != null) 'Domain': domain,
      if (endpointInfo != null) 'EndpointInfo': endpointInfo,
      if (launchOverrides != null) 'LaunchOverrides': launchOverrides,
      if (name != null) 'Name': name,
      if (simulation != null) 'Simulation': simulation,
      if (status != null) 'Status': status.toValue(),
      if (targetStatus != null) 'TargetStatus': targetStatus.toValue(),
    };
  }
}

class DescribeSimulationOutput {
  /// The Amazon Resource Name (ARN) of the simulation. For more information about
  /// ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The time when the simulation was created, expressed as the number of seconds
  /// and milliseconds in UTC since the Unix epoch (0:0:0.000, January 1, 1970).
  final DateTime? creationTime;

  /// The description of the simulation.
  final String? description;

  /// A universally unique identifier (UUID) for this simulation.
  final String? executionId;

  /// A collection of additional state information, such as domain and clock
  /// configuration.
  final LiveSimulationState? liveSimulationState;

  /// Settings that control how SimSpace Weaver handles your simulation log data.
  final LoggingConfiguration? loggingConfiguration;

  /// The maximum running time of the simulation, specified as a number of minutes
  /// (m or M), hours (h or H), or days (d or D). The simulation stops when it
  /// reaches this limit. The maximum value is <code>14D</code>, or its equivalent
  /// in the other units. The default value is <code>14D</code>. A value
  /// equivalent to <code>0</code> makes the simulation immediately transition to
  /// <code>Stopping</code> as soon as it reaches <code>Started</code>.
  final String? maximumDuration;

  /// The name of the simulation.
  final String? name;

  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that the simulation assumes to perform actions. For more information
  /// about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>. For more information about IAM roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// roles</a> in the <i>Identity and Access Management User Guide</i>.
  final String? roleArn;

  /// An error message that SimSpace Weaver returns only if there is a problem
  /// with the simulation schema.
  final String? schemaError;

  /// The location of the simulation schema in Amazon Simple Storage Service
  /// (Amazon S3). For more information about Amazon S3, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html">
  /// <i>Amazon Simple Storage Service User Guide</i> </a>.
  final S3Location? schemaS3Location;
  final S3Location? snapshotS3Location;

  /// An error message that SimSpace Weaver returns only if a problem occurs when
  /// the simulation is in the <code>STARTING</code> state.
  final String? startError;

  /// The current lifecycle state of the simulation.
  final SimulationStatus? status;

  /// The desired lifecycle state of the simulation.
  final SimulationTargetStatus? targetStatus;

  DescribeSimulationOutput({
    this.arn,
    this.creationTime,
    this.description,
    this.executionId,
    this.liveSimulationState,
    this.loggingConfiguration,
    this.maximumDuration,
    this.name,
    this.roleArn,
    this.schemaError,
    this.schemaS3Location,
    this.snapshotS3Location,
    this.startError,
    this.status,
    this.targetStatus,
  });

  factory DescribeSimulationOutput.fromJson(Map<String, dynamic> json) {
    return DescribeSimulationOutput(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      executionId: json['ExecutionId'] as String?,
      liveSimulationState: json['LiveSimulationState'] != null
          ? LiveSimulationState.fromJson(
              json['LiveSimulationState'] as Map<String, dynamic>)
          : null,
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
      maximumDuration: json['MaximumDuration'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      schemaError: json['SchemaError'] as String?,
      schemaS3Location: json['SchemaS3Location'] != null
          ? S3Location.fromJson(
              json['SchemaS3Location'] as Map<String, dynamic>)
          : null,
      snapshotS3Location: json['SnapshotS3Location'] != null
          ? S3Location.fromJson(
              json['SnapshotS3Location'] as Map<String, dynamic>)
          : null,
      startError: json['StartError'] as String?,
      status: (json['Status'] as String?)?.toSimulationStatus(),
      targetStatus:
          (json['TargetStatus'] as String?)?.toSimulationTargetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final executionId = this.executionId;
    final liveSimulationState = this.liveSimulationState;
    final loggingConfiguration = this.loggingConfiguration;
    final maximumDuration = this.maximumDuration;
    final name = this.name;
    final roleArn = this.roleArn;
    final schemaError = this.schemaError;
    final schemaS3Location = this.schemaS3Location;
    final snapshotS3Location = this.snapshotS3Location;
    final startError = this.startError;
    final status = this.status;
    final targetStatus = this.targetStatus;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (executionId != null) 'ExecutionId': executionId,
      if (liveSimulationState != null)
        'LiveSimulationState': liveSimulationState,
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
      if (maximumDuration != null) 'MaximumDuration': maximumDuration,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (schemaError != null) 'SchemaError': schemaError,
      if (schemaS3Location != null) 'SchemaS3Location': schemaS3Location,
      if (snapshotS3Location != null) 'SnapshotS3Location': snapshotS3Location,
      if (startError != null) 'StartError': startError,
      if (status != null) 'Status': status.toValue(),
      if (targetStatus != null) 'TargetStatus': targetStatus.toValue(),
    };
  }
}

/// A collection of app instances that run the same executable app code and have
/// the same launch options and commands.
///
/// For more information about domains, see <a
/// href="https://docs.aws.amazon.com/simspaceweaver/latest/userguide/what-is_key-concepts.html#what-is_key-concepts_domains">Key
/// concepts: Domains</a> in the <i>SimSpace Weaver User Guide</i>.
class Domain {
  /// The type of lifecycle management for apps in the domain. Indicates whether
  /// apps in this domain are <i>managed</i> (SimSpace Weaver starts and stops the
  /// apps) or <i>unmanaged</i> (you must start and stop the apps).
  /// <p class="title"> <b>Lifecycle types</b>
  ///
  /// <ul>
  /// <li>
  /// <code>PerWorker</code> – Managed: SimSpace Weaver starts one app on each
  /// worker.
  /// </li>
  /// <li>
  /// <code>BySpatialSubdivision</code> – Managed: SimSpace Weaver starts one app
  /// for each spatial partition.
  /// </li>
  /// <li>
  /// <code>ByRequest</code> – Unmanaged: You use the <code>StartApp</code> API to
  /// start the apps and use the <code>StopApp</code> API to stop the apps.
  /// </li>
  /// </ul>
  final LifecycleManagementStrategy? lifecycle;

  /// The name of the domain.
  final String? name;

  Domain({
    this.lifecycle,
    this.name,
  });

  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(
      lifecycle:
          (json['Lifecycle'] as String?)?.toLifecycleManagementStrategy(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycle = this.lifecycle;
    final name = this.name;
    return {
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (name != null) 'Name': name,
    };
  }
}

/// Options that apply when the app starts. These options override default
/// behavior.
class LaunchOverrides {
  /// App launch commands and command line parameters that override the launch
  /// command configured in the simulation schema.
  final List<String>? launchCommands;

  LaunchOverrides({
    this.launchCommands,
  });

  factory LaunchOverrides.fromJson(Map<String, dynamic> json) {
    return LaunchOverrides(
      launchCommands: (json['LaunchCommands'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final launchCommands = this.launchCommands;
    return {
      if (launchCommands != null) 'LaunchCommands': launchCommands,
    };
  }
}

enum LifecycleManagementStrategy {
  unknown,
  perWorker,
  bySpatialSubdivision,
  byRequest,
}

extension LifecycleManagementStrategyValueExtension
    on LifecycleManagementStrategy {
  String toValue() {
    switch (this) {
      case LifecycleManagementStrategy.unknown:
        return 'Unknown';
      case LifecycleManagementStrategy.perWorker:
        return 'PerWorker';
      case LifecycleManagementStrategy.bySpatialSubdivision:
        return 'BySpatialSubdivision';
      case LifecycleManagementStrategy.byRequest:
        return 'ByRequest';
    }
  }
}

extension LifecycleManagementStrategyFromString on String {
  LifecycleManagementStrategy toLifecycleManagementStrategy() {
    switch (this) {
      case 'Unknown':
        return LifecycleManagementStrategy.unknown;
      case 'PerWorker':
        return LifecycleManagementStrategy.perWorker;
      case 'BySpatialSubdivision':
        return LifecycleManagementStrategy.bySpatialSubdivision;
      case 'ByRequest':
        return LifecycleManagementStrategy.byRequest;
    }
    throw Exception('$this is not known in enum LifecycleManagementStrategy');
  }
}

class ListAppsOutput {
  /// The list of apps for the given simulation and domain.
  final List<SimulationAppMetadata>? apps;

  /// If SimSpace Weaver returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an <i>HTTP 400
  /// ValidationException</i> error.
  final String? nextToken;

  ListAppsOutput({
    this.apps,
    this.nextToken,
  });

  factory ListAppsOutput.fromJson(Map<String, dynamic> json) {
    return ListAppsOutput(
      apps: (json['Apps'] as List?)
          ?.whereNotNull()
          .map((e) => SimulationAppMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apps = this.apps;
    final nextToken = this.nextToken;
    return {
      if (apps != null) 'Apps': apps,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSimulationsOutput {
  /// If SimSpace Weaver returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an <i>HTTP 400
  /// ValidationException</i> error.
  final String? nextToken;

  /// The list of simulations.
  final List<SimulationMetadata>? simulations;

  ListSimulationsOutput({
    this.nextToken,
    this.simulations,
  });

  factory ListSimulationsOutput.fromJson(Map<String, dynamic> json) {
    return ListSimulationsOutput(
      nextToken: json['NextToken'] as String?,
      simulations: (json['Simulations'] as List?)
          ?.whereNotNull()
          .map((e) => SimulationMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final simulations = this.simulations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (simulations != null) 'Simulations': simulations,
    };
  }
}

class ListTagsForResourceOutput {
  /// The list of tags for the resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

/// A collection of additional state information, such as domain and clock
/// configuration.
class LiveSimulationState {
  /// A list of simulation clocks.
  /// <note>
  /// At this time, a simulation has only one clock.
  /// </note>
  final List<SimulationClock>? clocks;

  /// A list of domains for the simulation. For more information about domains,
  /// see <a
  /// href="https://docs.aws.amazon.com/simspaceweaver/latest/userguide/what-is_key-concepts.html#what-is_key-concepts_domains">Key
  /// concepts: Domains</a> in the <i>SimSpace Weaver User Guide</i>.
  final List<Domain>? domains;

  LiveSimulationState({
    this.clocks,
    this.domains,
  });

  factory LiveSimulationState.fromJson(Map<String, dynamic> json) {
    return LiveSimulationState(
      clocks: (json['Clocks'] as List?)
          ?.whereNotNull()
          .map((e) => SimulationClock.fromJson(e as Map<String, dynamic>))
          .toList(),
      domains: (json['Domains'] as List?)
          ?.whereNotNull()
          .map((e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clocks = this.clocks;
    final domains = this.domains;
    return {
      if (clocks != null) 'Clocks': clocks,
      if (domains != null) 'Domains': domains,
    };
  }
}

/// The location where SimSpace Weaver sends simulation log data.
class LogDestination {
  /// An Amazon CloudWatch Logs log group that stores simulation log data. For
  /// more information about log groups, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html">Working
  /// with log groups and log streams</a> in the <i>Amazon CloudWatch Logs User
  /// Guide</i>.
  final CloudWatchLogsLogGroup? cloudWatchLogsLogGroup;

  LogDestination({
    this.cloudWatchLogsLogGroup,
  });

  factory LogDestination.fromJson(Map<String, dynamic> json) {
    return LogDestination(
      cloudWatchLogsLogGroup: json['CloudWatchLogsLogGroup'] != null
          ? CloudWatchLogsLogGroup.fromJson(
              json['CloudWatchLogsLogGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsLogGroup = this.cloudWatchLogsLogGroup;
    return {
      if (cloudWatchLogsLogGroup != null)
        'CloudWatchLogsLogGroup': cloudWatchLogsLogGroup,
    };
  }
}

/// The logging configuration for a simulation.
class LoggingConfiguration {
  /// A list of the locations where SimSpace Weaver sends simulation log data.
  final List<LogDestination>? destinations;

  LoggingConfiguration({
    this.destinations,
  });

  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) => LogDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    return {
      if (destinations != null) 'Destinations': destinations,
    };
  }
}

/// An Amazon S3 bucket and optional folder (object key prefix) where SimSpace
/// Weaver creates a file.
class S3Destination {
  /// The name of an Amazon S3 bucket. For more information about buckets, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-buckets-s3.html">Creating,
  /// configuring, and working with Amazon S3 buckets</a> in the <i>Amazon Simple
  /// Storage Service User Guide</i>.
  final String bucketName;

  /// A string prefix for an Amazon S3 object key. It's usually a folder name. For
  /// more information about folders in Amazon S3, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-folders.html">Organizing
  /// objects in the Amazon S3 console using folders</a> in the <i>Amazon Simple
  /// Storage Service User Guide</i>.
  final String? objectKeyPrefix;

  S3Destination({
    required this.bucketName,
    this.objectKeyPrefix,
  });

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final objectKeyPrefix = this.objectKeyPrefix;
    return {
      'BucketName': bucketName,
      if (objectKeyPrefix != null) 'ObjectKeyPrefix': objectKeyPrefix,
    };
  }
}

/// A location in Amazon Simple Storage Service (Amazon S3) where SimSpace
/// Weaver stores simulation data, such as your app .zip files and schema file.
/// For more information about Amazon S3, see the <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html">
/// <i>Amazon Simple Storage Service User Guide</i> </a>.
class S3Location {
  /// The name of an Amazon S3 bucket. For more information about buckets, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-buckets-s3.html">Creating,
  /// configuring, and working with Amazon S3 buckets</a> in the <i>Amazon Simple
  /// Storage Service User Guide</i>.
  final String bucketName;

  /// The key name of an object in Amazon S3. For more information about Amazon S3
  /// objects and object keys, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/uploading-downloading-objects.html">Uploading,
  /// downloading, and working with objects in Amazon S3</a> in the <i>Amazon
  /// Simple Storage Service User Guide</i>.
  final String objectKey;

  S3Location({
    required this.bucketName,
    required this.objectKey,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucketName: json['BucketName'] as String,
      objectKey: json['ObjectKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final objectKey = this.objectKey;
    return {
      'BucketName': bucketName,
      'ObjectKey': objectKey,
    };
  }
}

/// Information about the network endpoint that you can use to connect to your
/// custom or service app. For more information about SimSpace Weaver apps, see
/// <a
/// href="https://docs.aws.amazon.com/simspaceweaver/latest/userguide/what-is_key-concepts.html#what-is_key-concepts_apps">Key
/// concepts: Apps</a> in the <i>SimSpace Weaver User Guide</i>..
class SimulationAppEndpointInfo {
  /// The IP address of the app. SimSpace Weaver dynamically assigns this IP
  /// address when the app starts.
  final String? address;

  /// The inbound TCP/UDP port numbers of the app. The combination of an IP
  /// address and a port number form a network endpoint.
  final List<SimulationAppPortMapping>? ingressPortMappings;

  SimulationAppEndpointInfo({
    this.address,
    this.ingressPortMappings,
  });

  factory SimulationAppEndpointInfo.fromJson(Map<String, dynamic> json) {
    return SimulationAppEndpointInfo(
      address: json['Address'] as String?,
      ingressPortMappings: (json['IngressPortMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SimulationAppPortMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final ingressPortMappings = this.ingressPortMappings;
    return {
      if (address != null) 'Address': address,
      if (ingressPortMappings != null)
        'IngressPortMappings': ingressPortMappings,
    };
  }
}

/// A collection of metadata about the app.
class SimulationAppMetadata {
  /// The domain of the app. For more information about domains, see <a
  /// href="https://docs.aws.amazon.com/simspaceweaver/latest/userguide/what-is_key-concepts.html#what-is_key-concepts_domains">Key
  /// concepts: Domains</a> in the <i>SimSpace Weaver User Guide</i>.
  final String? domain;

  /// The name of the app.
  final String? name;

  /// The name of the simulation of the app.
  final String? simulation;

  /// The current status of the app.
  final SimulationAppStatus? status;

  /// The desired status of the app.
  final SimulationAppTargetStatus? targetStatus;

  SimulationAppMetadata({
    this.domain,
    this.name,
    this.simulation,
    this.status,
    this.targetStatus,
  });

  factory SimulationAppMetadata.fromJson(Map<String, dynamic> json) {
    return SimulationAppMetadata(
      domain: json['Domain'] as String?,
      name: json['Name'] as String?,
      simulation: json['Simulation'] as String?,
      status: (json['Status'] as String?)?.toSimulationAppStatus(),
      targetStatus:
          (json['TargetStatus'] as String?)?.toSimulationAppTargetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final name = this.name;
    final simulation = this.simulation;
    final status = this.status;
    final targetStatus = this.targetStatus;
    return {
      if (domain != null) 'Domain': domain,
      if (name != null) 'Name': name,
      if (simulation != null) 'Simulation': simulation,
      if (status != null) 'Status': status.toValue(),
      if (targetStatus != null) 'TargetStatus': targetStatus.toValue(),
    };
  }
}

/// A collection of TCP/UDP ports for a custom or service app.
class SimulationAppPortMapping {
  /// The TCP/UDP port number of the running app. SimSpace Weaver dynamically
  /// assigns this port number when the app starts. SimSpace Weaver maps the
  /// <code>Declared</code> port to the <code>Actual</code> port. Clients connect
  /// to the app using the app's IP address and the <code>Actual</code> port
  /// number.
  final int? actual;

  /// The TCP/UDP port number of the app, declared in the simulation schema.
  /// SimSpace Weaver maps the <code>Declared</code> port to the
  /// <code>Actual</code> port. The source code for the app should bind to the
  /// <code>Declared</code> port.
  final int? declared;

  SimulationAppPortMapping({
    this.actual,
    this.declared,
  });

  factory SimulationAppPortMapping.fromJson(Map<String, dynamic> json) {
    return SimulationAppPortMapping(
      actual: json['Actual'] as int?,
      declared: json['Declared'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final actual = this.actual;
    final declared = this.declared;
    return {
      if (actual != null) 'Actual': actual,
      if (declared != null) 'Declared': declared,
    };
  }
}

enum SimulationAppStatus {
  starting,
  started,
  stopping,
  stopped,
  error,
  unknown,
}

extension SimulationAppStatusValueExtension on SimulationAppStatus {
  String toValue() {
    switch (this) {
      case SimulationAppStatus.starting:
        return 'STARTING';
      case SimulationAppStatus.started:
        return 'STARTED';
      case SimulationAppStatus.stopping:
        return 'STOPPING';
      case SimulationAppStatus.stopped:
        return 'STOPPED';
      case SimulationAppStatus.error:
        return 'ERROR';
      case SimulationAppStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension SimulationAppStatusFromString on String {
  SimulationAppStatus toSimulationAppStatus() {
    switch (this) {
      case 'STARTING':
        return SimulationAppStatus.starting;
      case 'STARTED':
        return SimulationAppStatus.started;
      case 'STOPPING':
        return SimulationAppStatus.stopping;
      case 'STOPPED':
        return SimulationAppStatus.stopped;
      case 'ERROR':
        return SimulationAppStatus.error;
      case 'UNKNOWN':
        return SimulationAppStatus.unknown;
    }
    throw Exception('$this is not known in enum SimulationAppStatus');
  }
}

enum SimulationAppTargetStatus {
  unknown,
  started,
  stopped,
}

extension SimulationAppTargetStatusValueExtension on SimulationAppTargetStatus {
  String toValue() {
    switch (this) {
      case SimulationAppTargetStatus.unknown:
        return 'UNKNOWN';
      case SimulationAppTargetStatus.started:
        return 'STARTED';
      case SimulationAppTargetStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension SimulationAppTargetStatusFromString on String {
  SimulationAppTargetStatus toSimulationAppTargetStatus() {
    switch (this) {
      case 'UNKNOWN':
        return SimulationAppTargetStatus.unknown;
      case 'STARTED':
        return SimulationAppTargetStatus.started;
      case 'STOPPED':
        return SimulationAppTargetStatus.stopped;
    }
    throw Exception('$this is not known in enum SimulationAppTargetStatus');
  }
}

/// Status information about the simulation clock.
class SimulationClock {
  /// The current status of the simulation clock.
  final ClockStatus? status;

  /// The desired status of the simulation clock.
  final ClockTargetStatus? targetStatus;

  SimulationClock({
    this.status,
    this.targetStatus,
  });

  factory SimulationClock.fromJson(Map<String, dynamic> json) {
    return SimulationClock(
      status: (json['Status'] as String?)?.toClockStatus(),
      targetStatus: (json['TargetStatus'] as String?)?.toClockTargetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final targetStatus = this.targetStatus;
    return {
      if (status != null) 'Status': status.toValue(),
      if (targetStatus != null) 'TargetStatus': targetStatus.toValue(),
    };
  }
}

/// A collection of data about the simulation.
class SimulationMetadata {
  /// The Amazon Resource Name (ARN) of the simulation. For more information about
  /// ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The time when the simulation was created, expressed as the number of seconds
  /// and milliseconds in UTC since the Unix epoch (0:0:0.000, January 1, 1970).
  final DateTime? creationTime;

  /// The name of the simulation.
  final String? name;

  /// The current status of the simulation.
  final SimulationStatus? status;

  /// The desired status of the simulation.
  final SimulationTargetStatus? targetStatus;

  SimulationMetadata({
    this.arn,
    this.creationTime,
    this.name,
    this.status,
    this.targetStatus,
  });

  factory SimulationMetadata.fromJson(Map<String, dynamic> json) {
    return SimulationMetadata(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toSimulationStatus(),
      targetStatus:
          (json['TargetStatus'] as String?)?.toSimulationTargetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final name = this.name;
    final status = this.status;
    final targetStatus = this.targetStatus;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (targetStatus != null) 'TargetStatus': targetStatus.toValue(),
    };
  }
}

enum SimulationStatus {
  unknown,
  starting,
  started,
  stopping,
  stopped,
  failed,
  deleting,
  deleted,
  snapshotInProgress,
}

extension SimulationStatusValueExtension on SimulationStatus {
  String toValue() {
    switch (this) {
      case SimulationStatus.unknown:
        return 'UNKNOWN';
      case SimulationStatus.starting:
        return 'STARTING';
      case SimulationStatus.started:
        return 'STARTED';
      case SimulationStatus.stopping:
        return 'STOPPING';
      case SimulationStatus.stopped:
        return 'STOPPED';
      case SimulationStatus.failed:
        return 'FAILED';
      case SimulationStatus.deleting:
        return 'DELETING';
      case SimulationStatus.deleted:
        return 'DELETED';
      case SimulationStatus.snapshotInProgress:
        return 'SNAPSHOT_IN_PROGRESS';
    }
  }
}

extension SimulationStatusFromString on String {
  SimulationStatus toSimulationStatus() {
    switch (this) {
      case 'UNKNOWN':
        return SimulationStatus.unknown;
      case 'STARTING':
        return SimulationStatus.starting;
      case 'STARTED':
        return SimulationStatus.started;
      case 'STOPPING':
        return SimulationStatus.stopping;
      case 'STOPPED':
        return SimulationStatus.stopped;
      case 'FAILED':
        return SimulationStatus.failed;
      case 'DELETING':
        return SimulationStatus.deleting;
      case 'DELETED':
        return SimulationStatus.deleted;
      case 'SNAPSHOT_IN_PROGRESS':
        return SimulationStatus.snapshotInProgress;
    }
    throw Exception('$this is not known in enum SimulationStatus');
  }
}

enum SimulationTargetStatus {
  unknown,
  started,
  stopped,
  deleted,
}

extension SimulationTargetStatusValueExtension on SimulationTargetStatus {
  String toValue() {
    switch (this) {
      case SimulationTargetStatus.unknown:
        return 'UNKNOWN';
      case SimulationTargetStatus.started:
        return 'STARTED';
      case SimulationTargetStatus.stopped:
        return 'STOPPED';
      case SimulationTargetStatus.deleted:
        return 'DELETED';
    }
  }
}

extension SimulationTargetStatusFromString on String {
  SimulationTargetStatus toSimulationTargetStatus() {
    switch (this) {
      case 'UNKNOWN':
        return SimulationTargetStatus.unknown;
      case 'STARTED':
        return SimulationTargetStatus.started;
      case 'STOPPED':
        return SimulationTargetStatus.stopped;
      case 'DELETED':
        return SimulationTargetStatus.deleted;
    }
    throw Exception('$this is not known in enum SimulationTargetStatus');
  }
}

class StartAppOutput {
  /// The name of the domain of the app.
  final String? domain;

  /// The name of the app.
  final String? name;

  /// The name of the simulation of the app.
  final String? simulation;

  StartAppOutput({
    this.domain,
    this.name,
    this.simulation,
  });

  factory StartAppOutput.fromJson(Map<String, dynamic> json) {
    return StartAppOutput(
      domain: json['Domain'] as String?,
      name: json['Name'] as String?,
      simulation: json['Simulation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final name = this.name;
    final simulation = this.simulation;
    return {
      if (domain != null) 'Domain': domain,
      if (name != null) 'Name': name,
      if (simulation != null) 'Simulation': simulation,
    };
  }
}

class StartClockOutput {
  StartClockOutput();

  factory StartClockOutput.fromJson(Map<String, dynamic> _) {
    return StartClockOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartSimulationOutput {
  /// The Amazon Resource Name (ARN) of the simulation. For more information about
  /// ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The time when the simulation was created, expressed as the number of seconds
  /// and milliseconds in UTC since the Unix epoch (0:0:0.000, January 1, 1970).
  final DateTime? creationTime;

  /// A universally unique identifier (UUID) for this simulation.
  final String? executionId;

  StartSimulationOutput({
    this.arn,
    this.creationTime,
    this.executionId,
  });

  factory StartSimulationOutput.fromJson(Map<String, dynamic> json) {
    return StartSimulationOutput(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      executionId: json['ExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final executionId = this.executionId;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (executionId != null) 'ExecutionId': executionId,
    };
  }
}

class StopAppOutput {
  StopAppOutput();

  factory StopAppOutput.fromJson(Map<String, dynamic> _) {
    return StopAppOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopClockOutput {
  StopClockOutput();

  factory StopClockOutput.fromJson(Map<String, dynamic> _) {
    return StopClockOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopSimulationOutput {
  StopSimulationOutput();

  factory StopSimulationOutput.fromJson(Map<String, dynamic> _) {
    return StopSimulationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
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

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
