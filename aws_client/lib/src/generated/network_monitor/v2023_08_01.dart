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

/// Amazon CloudWatch Network Monitor is an Amazon Web Services active network
/// monitoring service that identifies if a network issues exists within the
/// Amazon Web Services network or your own company network. Within Network
/// Monitor you'll choose the source VPCs and subnets from the Amazon Web
/// Services network in which you operate and then you'll choose the destination
/// IP addresses from your on-premises network. From these sources and
/// destinations, Network Monitor creates a monitor containing all the possible
/// source and destination combinations, each of which is called a probe, within
/// a single monitor. These probes then monitor network traffic to help you
/// identify where network issues might be affecting your traffic.
///
/// Before you begin, ensure the Amazon Web Services CLI is configured in the
/// Amazon Web Services Account where you will create the Network Monitor
/// resource. Network Monitor doesn’t support creation on cross-account
/// resources, but you can create a Network Monitor in any subnet belonging to a
/// VPC owned by your Account.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/what-is-network-monitor.html">Using
/// Amazon CloudWatch Network Monitor</a> in the <i>Amazon CloudWatch User
/// Guide</i>.
class CloudWatchNetworkMonitor {
  final _s.RestJsonProtocol _protocol;
  CloudWatchNetworkMonitor({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'networkmonitor',
            signingName: 'networkmonitor',
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

  /// Creates a monitor between a source subnet and destination IP address.
  /// Within a monitor you'll create one or more probes that monitor network
  /// traffic between your source Amazon Web Services VPC subnets and your
  /// destination IP addresses. Each probe then aggregates and sends metrics to
  /// Amazon CloudWatch.
  ///
  /// You can also create a monitor with probes using this command. For each
  /// probe, you define the following:
  ///
  /// <ul>
  /// <li>
  /// <code>source</code>—The subnet IDs where the probes will be created.
  /// </li>
  /// <li>
  /// <code>destination</code>— The target destination IP address for the probe.
  /// </li>
  /// <li>
  /// <code>destinationPort</code>—Required only if the protocol is
  /// <code>TCP</code>.
  /// </li>
  /// <li>
  /// <code>protocol</code>—The communication protocol between the source and
  /// destination. This will be either <code>TCP</code> or <code>ICMP</code>.
  /// </li>
  /// <li>
  /// <code>packetSize</code>—The size of the packets. This must be a number
  /// between <code>56</code> and <code>8500</code>.
  /// </li>
  /// <li>
  /// (Optional) <code>tags</code> —Key-value pairs created and assigned to the
  /// probe.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [monitorName] :
  /// The name identifying the monitor. It can contain only letters, underscores
  /// (_), or dashes (-), and can be up to 200 characters.
  ///
  /// Parameter [aggregationPeriod] :
  /// The time, in seconds, that metrics are aggregated and sent to Amazon
  /// CloudWatch. Valid values are either <code>30</code> or <code>60</code>.
  /// <code>60</code> is the default if no period is chosen.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure the idempotency of the
  /// request. Only returned if a client token was provided in the request.
  ///
  /// Parameter [probes] :
  /// Displays a list of all of the probes created for a monitor.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs created and assigned to the monitor.
  Future<CreateMonitorOutput> createMonitor({
    required String monitorName,
    int? aggregationPeriod,
    String? clientToken,
    List<CreateMonitorProbeInput>? probes,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'aggregationPeriod',
      aggregationPeriod,
      30,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'monitorName': monitorName,
      if (aggregationPeriod != null) 'aggregationPeriod': aggregationPeriod,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (probes != null) 'probes': probes,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/monitors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMonitorOutput.fromJson(response);
  }

  /// Create a probe within a monitor. Once you create a probe, and it begins
  /// monitoring your network traffic, you'll incur billing charges for that
  /// probe. This action requires the <code>monitorName</code> parameter. Run
  /// <code>ListMonitors</code> to get a list of monitor names. Note the name of
  /// the <code>monitorName</code> you want to create the probe for.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor to associated with the probe.
  ///
  /// Parameter [probe] :
  /// Describes the details of an individual probe for a monitor.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure the idempotency of the
  /// request. Only returned if a client token was provided in the request.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs created and assigned to the probe.
  Future<CreateProbeOutput> createProbe({
    required String monitorName,
    required ProbeInput probe,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'probe': probe,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/monitors/${Uri.encodeComponent(monitorName)}/probes',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProbeOutput.fromJson(response);
  }

  /// Deletes a specified monitor.
  ///
  /// This action requires the <code>monitorName</code> parameter. Run
  /// <code>ListMonitors</code> to get a list of monitor names.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor to delete.
  Future<void> deleteMonitor({
    required String monitorName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/monitors/${Uri.encodeComponent(monitorName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified probe. Once a probe is deleted you'll no longer
  /// incur any billing fees for that probe.
  ///
  /// This action requires both the <code>monitorName</code> and
  /// <code>probeId</code> parameters. Run <code>ListMonitors</code> to get a
  /// list of monitor names. Run <code>GetMonitor</code> to get a list of probes
  /// and probe IDs. You can only delete a single probe at a time using this
  /// action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor to delete.
  ///
  /// Parameter [probeId] :
  /// The ID of the probe to delete.
  Future<void> deleteProbe({
    required String monitorName,
    required String probeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/monitors/${Uri.encodeComponent(monitorName)}/probes/${Uri.encodeComponent(probeId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns details about a specific monitor.
  ///
  /// This action requires the <code>monitorName</code> parameter. Run
  /// <code>ListMonitors</code> to get a list of monitor names.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor that details are returned for.
  Future<GetMonitorOutput> getMonitor({
    required String monitorName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/monitors/${Uri.encodeComponent(monitorName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMonitorOutput.fromJson(response);
  }

  /// Returns the details about a probe. This action requires both the
  /// <code>monitorName</code> and <code>probeId</code> parameters. Run
  /// <code>ListMonitors</code> to get a list of monitor names. Run
  /// <code>GetMonitor</code> to get a list of probes and probe IDs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor associated with the probe. Run
  /// <code>ListMonitors</code> to get a list of monitor names.
  ///
  /// Parameter [probeId] :
  /// The ID of the probe to get information about. Run <code>GetMonitor</code>
  /// action to get a list of probes and probe IDs for the monitor.
  Future<GetProbeOutput> getProbe({
    required String monitorName,
    required String probeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/monitors/${Uri.encodeComponent(monitorName)}/probes/${Uri.encodeComponent(probeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProbeOutput.fromJson(response);
  }

  /// Returns a list of all of your monitors.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// If <code>MaxResults</code> is given a value larger than 100, only 100
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [state] :
  /// The list of all monitors and their states.
  Future<ListMonitorsOutput> listMonitors({
    int? maxResults,
    String? nextToken,
    String? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (state != null) 'state': [state],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/monitors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMonitorsOutput.fromJson(response);
  }

  /// Lists the tags assigned to this resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The
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

  /// Adds key-value pairs to a monitor or probe.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the monitor or probe to tag.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs assigned to the monitor or probe.
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

  /// Removes a key-value pair from a monitor or probe.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the monitor or probe that the tag should be removed from.
  ///
  /// Parameter [tagKeys] :
  /// The key-value pa
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

  /// Updates the <code>aggregationPeriod</code> for a monitor. Monitors support
  /// an <code>aggregationPeriod</code> of either <code>30</code> or
  /// <code>60</code> seconds. This action requires the <code>monitorName</code>
  /// and <code>probeId</code> parameter. Run <code>ListMonitors</code> to get a
  /// list of monitor names.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [aggregationPeriod] :
  /// The aggregation time, in seconds, to change to. This must be either
  /// <code>30</code> or <code>60</code>.
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor to update.
  Future<UpdateMonitorOutput> updateMonitor({
    required int aggregationPeriod,
    required String monitorName,
  }) async {
    _s.validateNumRange(
      'aggregationPeriod',
      aggregationPeriod,
      30,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'aggregationPeriod': aggregationPeriod,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/monitors/${Uri.encodeComponent(monitorName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMonitorOutput.fromJson(response);
  }

  /// Updates a monitor probe. This action requires both the
  /// <code>monitorName</code> and <code>probeId</code> parameters. Run
  /// <code>ListMonitors</code> to get a list of monitor names. Run
  /// <code>GetMonitor</code> to get a list of probes and probe IDs.
  ///
  /// You can update the following para create a monitor with probes using this
  /// command. For each probe, you define the following:
  ///
  /// <ul>
  /// <li>
  /// <code>state</code>—The state of the probe.
  /// </li>
  /// <li>
  /// <code>destination</code>— The target destination IP address for the probe.
  /// </li>
  /// <li>
  /// <code>destinationPort</code>—Required only if the protocol is
  /// <code>TCP</code>.
  /// </li>
  /// <li>
  /// <code>protocol</code>—The communication protocol between the source and
  /// destination. This will be either <code>TCP</code> or <code>ICMP</code>.
  /// </li>
  /// <li>
  /// <code>packetSize</code>—The size of the packets. This must be a number
  /// between <code>56</code> and <code>8500</code>.
  /// </li>
  /// <li>
  /// (Optional) <code>tags</code> —Key-value pairs created and assigned to the
  /// probe.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor that the probe was updated for.
  ///
  /// Parameter [probeId] :
  /// The ID of the probe to update.
  ///
  /// Parameter [destination] :
  /// The updated IP address for the probe destination. This must be either an
  /// IPv4 or IPv6 address.
  ///
  /// Parameter [destinationPort] :
  /// The updated port for the probe destination. This is required only if the
  /// <code>protocol</code> is <code>TCP</code> and must be a number between
  /// <code>1</code> and <code>65536</code>.
  ///
  /// Parameter [packetSize] :
  /// he updated packets size for network traffic between the source and
  /// destination. This must be a number between <code>56</code> and
  /// <code>8500</code>.
  ///
  /// Parameter [protocol] :
  /// The updated network protocol for the destination. This can be either
  /// <code>TCP</code> or <code>ICMP</code>. If the protocol is
  /// <code>TCP</code>, then <code>port</code> is also required.
  ///
  /// Parameter [state] :
  /// The state of the probe update.
  Future<UpdateProbeOutput> updateProbe({
    required String monitorName,
    required String probeId,
    String? destination,
    int? destinationPort,
    int? packetSize,
    Protocol? protocol,
    ProbeState? state,
  }) async {
    _s.validateNumRange(
      'destinationPort',
      destinationPort,
      0,
      65536,
    );
    _s.validateNumRange(
      'packetSize',
      packetSize,
      56,
      8500,
    );
    final $payload = <String, dynamic>{
      if (destination != null) 'destination': destination,
      if (destinationPort != null) 'destinationPort': destinationPort,
      if (packetSize != null) 'packetSize': packetSize,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (state != null) 'state': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/monitors/${Uri.encodeComponent(monitorName)}/probes/${Uri.encodeComponent(probeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProbeOutput.fromJson(response);
  }
}

enum AddressFamily {
  ipv4,
  ipv6,
}

extension AddressFamilyValueExtension on AddressFamily {
  String toValue() {
    switch (this) {
      case AddressFamily.ipv4:
        return 'IPV4';
      case AddressFamily.ipv6:
        return 'IPV6';
    }
  }
}

extension AddressFamilyFromString on String {
  AddressFamily toAddressFamily() {
    switch (this) {
      case 'IPV4':
        return AddressFamily.ipv4;
      case 'IPV6':
        return AddressFamily.ipv6;
    }
    throw Exception('$this is not known in enum AddressFamily');
  }
}

class CreateMonitorOutput {
  /// The ARN of the monitor.
  final String monitorArn;

  /// The name of the monitor.
  final String monitorName;

  /// The state of the monitor.
  final MonitorState state;

  /// The number of seconds that metrics are aggregated by and sent to Amazon
  /// CloudWatch. This will be either <code>30</code> or <code>60</code>.
  final int? aggregationPeriod;

  /// The list of key-value pairs assigned to the monitor.
  final Map<String, String>? tags;

  CreateMonitorOutput({
    required this.monitorArn,
    required this.monitorName,
    required this.state,
    this.aggregationPeriod,
    this.tags,
  });

  factory CreateMonitorOutput.fromJson(Map<String, dynamic> json) {
    return CreateMonitorOutput(
      monitorArn: json['monitorArn'] as String,
      monitorName: json['monitorName'] as String,
      state: (json['state'] as String).toMonitorState(),
      aggregationPeriod: json['aggregationPeriod'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final state = this.state;
    final aggregationPeriod = this.aggregationPeriod;
    final tags = this.tags;
    return {
      'monitorArn': monitorArn,
      'monitorName': monitorName,
      'state': state.toValue(),
      if (aggregationPeriod != null) 'aggregationPeriod': aggregationPeriod,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Creates a monitor probe.
class CreateMonitorProbeInput {
  /// The destination IP address. This must be either <code>IPV4</code> or
  /// <code>IPV6</code>.
  final String destination;

  /// The protocol used for the network traffic between the <code>source</code>
  /// and <code>destination</code>. This must be either <code>TCP</code> or
  /// <code>ICMP</code>.
  final Protocol protocol;

  /// The ARN of the subnet.
  final String sourceArn;

  /// The port associated with the <code>destination</code>. This is required only
  /// if the <code>protocol</code> is <code>TCP</code> and must be a number
  /// between <code>1</code> and <code>65536</code>.
  final int? destinationPort;

  /// The size of the packets sent between the source and destination. This must
  /// be a number between <code>56</code> and <code>8500</code>.
  final int? packetSize;

  /// The list of key-value pairs created and assigned to the monitor.
  final Map<String, String>? probeTags;

  CreateMonitorProbeInput({
    required this.destination,
    required this.protocol,
    required this.sourceArn,
    this.destinationPort,
    this.packetSize,
    this.probeTags,
  });

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final protocol = this.protocol;
    final sourceArn = this.sourceArn;
    final destinationPort = this.destinationPort;
    final packetSize = this.packetSize;
    final probeTags = this.probeTags;
    return {
      'destination': destination,
      'protocol': protocol.toValue(),
      'sourceArn': sourceArn,
      if (destinationPort != null) 'destinationPort': destinationPort,
      if (packetSize != null) 'packetSize': packetSize,
      if (probeTags != null) 'probeTags': probeTags,
    };
  }
}

class CreateProbeOutput {
  /// The destination IP address for the monitor. This must be either an IPv4 or
  /// IPv6 address.
  final String destination;

  /// The protocol used for the network traffic between the <code>source</code>
  /// and <code>destination</code>. This must be either <code>TCP</code> or
  /// <code>ICMP</code>.
  final Protocol protocol;

  /// The ARN of the probe.
  final String sourceArn;

  /// Indicates whether the IP address is <code>IPV4</code> or <code>IPV6</code>.
  final AddressFamily? addressFamily;

  /// The time and date that the probe was created.
  final DateTime? createdAt;

  /// The port associated with the <code>destination</code>. This is required only
  /// if the <code>protocol</code> is <code>TCP</code> and must be a number
  /// between <code>1</code> and <code>65536</code>.
  final int? destinationPort;

  /// The time and date when the probe was last modified.
  final DateTime? modifiedAt;

  /// The size of the packets sent between the source and destination. This must
  /// be a number between <code>56</code> and <code>8500</code>.
  final int? packetSize;

  /// The ARN of the probe.
  final String? probeArn;

  /// The ID of the probe for which details are returned.
  final String? probeId;

  /// The state of the probe.
  final ProbeState? state;

  /// The list of key-value pairs assigned to the probe.
  final Map<String, String>? tags;

  /// The ID of the source VPC or subnet.
  final String? vpcId;

  CreateProbeOutput({
    required this.destination,
    required this.protocol,
    required this.sourceArn,
    this.addressFamily,
    this.createdAt,
    this.destinationPort,
    this.modifiedAt,
    this.packetSize,
    this.probeArn,
    this.probeId,
    this.state,
    this.tags,
    this.vpcId,
  });

  factory CreateProbeOutput.fromJson(Map<String, dynamic> json) {
    return CreateProbeOutput(
      destination: json['destination'] as String,
      protocol: (json['protocol'] as String).toProtocol(),
      sourceArn: json['sourceArn'] as String,
      addressFamily: (json['addressFamily'] as String?)?.toAddressFamily(),
      createdAt: timeStampFromJson(json['createdAt']),
      destinationPort: json['destinationPort'] as int?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      packetSize: json['packetSize'] as int?,
      probeArn: json['probeArn'] as String?,
      probeId: json['probeId'] as String?,
      state: (json['state'] as String?)?.toProbeState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final protocol = this.protocol;
    final sourceArn = this.sourceArn;
    final addressFamily = this.addressFamily;
    final createdAt = this.createdAt;
    final destinationPort = this.destinationPort;
    final modifiedAt = this.modifiedAt;
    final packetSize = this.packetSize;
    final probeArn = this.probeArn;
    final probeId = this.probeId;
    final state = this.state;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      'destination': destination,
      'protocol': protocol.toValue(),
      'sourceArn': sourceArn,
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (destinationPort != null) 'destinationPort': destinationPort,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (packetSize != null) 'packetSize': packetSize,
      if (probeArn != null) 'probeArn': probeArn,
      if (probeId != null) 'probeId': probeId,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class DeleteMonitorOutput {
  DeleteMonitorOutput();

  factory DeleteMonitorOutput.fromJson(Map<String, dynamic> _) {
    return DeleteMonitorOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProbeOutput {
  DeleteProbeOutput();

  factory DeleteProbeOutput.fromJson(Map<String, dynamic> _) {
    return DeleteProbeOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetMonitorOutput {
  /// The aggregation period for the specified monitor.
  final int aggregationPeriod;

  /// The time and date when the monitor was created.
  final DateTime createdAt;

  /// The time and date when the monitor was last modified.
  final DateTime modifiedAt;

  /// The ARN of the selected monitor.
  final String monitorArn;

  /// The name of the monitor.
  final String monitorName;

  /// Lists the status of the <code>state</code> of each monitor.
  final MonitorState state;

  /// The details about each probe associated with that monitor.
  final List<Probe>? probes;

  /// The list of key-value pairs assigned to the monitor.
  final Map<String, String>? tags;

  GetMonitorOutput({
    required this.aggregationPeriod,
    required this.createdAt,
    required this.modifiedAt,
    required this.monitorArn,
    required this.monitorName,
    required this.state,
    this.probes,
    this.tags,
  });

  factory GetMonitorOutput.fromJson(Map<String, dynamic> json) {
    return GetMonitorOutput(
      aggregationPeriod: json['aggregationPeriod'] as int,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      monitorArn: json['monitorArn'] as String,
      monitorName: json['monitorName'] as String,
      state: (json['state'] as String).toMonitorState(),
      probes: (json['probes'] as List?)
          ?.whereNotNull()
          .map((e) => Probe.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationPeriod = this.aggregationPeriod;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final state = this.state;
    final probes = this.probes;
    final tags = this.tags;
    return {
      'aggregationPeriod': aggregationPeriod,
      'createdAt': unixTimestampToJson(createdAt),
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'monitorArn': monitorArn,
      'monitorName': monitorName,
      'state': state.toValue(),
      if (probes != null) 'probes': probes,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetProbeOutput {
  /// The destination IP address for the monitor. This must be either an IPv4 or
  /// IPv6 address.
  final String destination;

  /// The protocol used for the network traffic between the <code>source</code>
  /// and <code>destination</code>. This must be either <code>TCP</code> or
  /// <code>ICMP</code>.
  final Protocol protocol;

  /// The ARN of the probe.
  final String sourceArn;

  /// Indicates whether the IP address is <code>IPV4</code> or <code>IPV6</code>.
  final AddressFamily? addressFamily;

  /// The time and date that the probe was created.
  final DateTime? createdAt;

  /// The port associated with the <code>destination</code>. This is required only
  /// if the <code>protocol</code> is <code>TCP</code> and must be a number
  /// between <code>1</code> and <code>65536</code>.
  final int? destinationPort;

  /// The time and date that the probe was last modified.
  final DateTime? modifiedAt;

  /// The size of the packets sent between the source and destination. This must
  /// be a number between <code>56</code> and <code>8500</code>.
  final int? packetSize;

  /// The ARN of the probe.
  final String? probeArn;

  /// The ID of the probe for which details are returned.
  final String? probeId;

  /// The state of the probe.
  final ProbeState? state;

  /// The list of key-value pairs assigned to the probe.
  final Map<String, String>? tags;

  /// The ID of the source VPC or subnet.
  final String? vpcId;

  GetProbeOutput({
    required this.destination,
    required this.protocol,
    required this.sourceArn,
    this.addressFamily,
    this.createdAt,
    this.destinationPort,
    this.modifiedAt,
    this.packetSize,
    this.probeArn,
    this.probeId,
    this.state,
    this.tags,
    this.vpcId,
  });

  factory GetProbeOutput.fromJson(Map<String, dynamic> json) {
    return GetProbeOutput(
      destination: json['destination'] as String,
      protocol: (json['protocol'] as String).toProtocol(),
      sourceArn: json['sourceArn'] as String,
      addressFamily: (json['addressFamily'] as String?)?.toAddressFamily(),
      createdAt: timeStampFromJson(json['createdAt']),
      destinationPort: json['destinationPort'] as int?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      packetSize: json['packetSize'] as int?,
      probeArn: json['probeArn'] as String?,
      probeId: json['probeId'] as String?,
      state: (json['state'] as String?)?.toProbeState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final protocol = this.protocol;
    final sourceArn = this.sourceArn;
    final addressFamily = this.addressFamily;
    final createdAt = this.createdAt;
    final destinationPort = this.destinationPort;
    final modifiedAt = this.modifiedAt;
    final packetSize = this.packetSize;
    final probeArn = this.probeArn;
    final probeId = this.probeId;
    final state = this.state;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      'destination': destination,
      'protocol': protocol.toValue(),
      'sourceArn': sourceArn,
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (destinationPort != null) 'destinationPort': destinationPort,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (packetSize != null) 'packetSize': packetSize,
      if (probeArn != null) 'probeArn': probeArn,
      if (probeId != null) 'probeId': probeId,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class ListMonitorsOutput {
  /// Lists individual details about each of your monitors.
  final List<MonitorSummary> monitors;

  /// The token for the next page of results.
  final String? nextToken;

  ListMonitorsOutput({
    required this.monitors,
    this.nextToken,
  });

  factory ListMonitorsOutput.fromJson(Map<String, dynamic> json) {
    return ListMonitorsOutput(
      monitors: (json['monitors'] as List)
          .whereNotNull()
          .map((e) => MonitorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitors = this.monitors;
    final nextToken = this.nextToken;
    return {
      'monitors': monitors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// Lists the tags assigned to the resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

enum MonitorState {
  pending,
  active,
  inactive,
  error,
  deleting,
}

extension MonitorStateValueExtension on MonitorState {
  String toValue() {
    switch (this) {
      case MonitorState.pending:
        return 'PENDING';
      case MonitorState.active:
        return 'ACTIVE';
      case MonitorState.inactive:
        return 'INACTIVE';
      case MonitorState.error:
        return 'ERROR';
      case MonitorState.deleting:
        return 'DELETING';
    }
  }
}

extension MonitorStateFromString on String {
  MonitorState toMonitorState() {
    switch (this) {
      case 'PENDING':
        return MonitorState.pending;
      case 'ACTIVE':
        return MonitorState.active;
      case 'INACTIVE':
        return MonitorState.inactive;
      case 'ERROR':
        return MonitorState.error;
      case 'DELETING':
        return MonitorState.deleting;
    }
    throw Exception('$this is not known in enum MonitorState');
  }
}

/// Displays summary information about a monitor.
class MonitorSummary {
  /// The ARN of the monitor.
  final String monitorArn;

  /// The name of the monitor.
  final String monitorName;

  /// The state of the monitor.
  final MonitorState state;

  /// The time, in seconds, that metrics are collected and sent to Amazon
  /// CloudWatch. Valid values are either <code>30</code> or <code>60</code>.
  final int? aggregationPeriod;

  /// The list of key-value pairs assigned to the monitor.
  final Map<String, String>? tags;

  MonitorSummary({
    required this.monitorArn,
    required this.monitorName,
    required this.state,
    this.aggregationPeriod,
    this.tags,
  });

  factory MonitorSummary.fromJson(Map<String, dynamic> json) {
    return MonitorSummary(
      monitorArn: json['monitorArn'] as String,
      monitorName: json['monitorName'] as String,
      state: (json['state'] as String).toMonitorState(),
      aggregationPeriod: json['aggregationPeriod'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final state = this.state;
    final aggregationPeriod = this.aggregationPeriod;
    final tags = this.tags;
    return {
      'monitorArn': monitorArn,
      'monitorName': monitorName,
      'state': state.toValue(),
      if (aggregationPeriod != null) 'aggregationPeriod': aggregationPeriod,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes information about a network monitor probe.
class Probe {
  /// The destination for the probe. This should be either an <code>IPV4</code> or
  /// <code>IPV6</code>.
  final String destination;

  /// The network protocol for the destination. This can be either
  /// <code>TCP</code> or <code>ICMP</code>. If the protocol is <code>TCP</code>,
  /// then <code>port</code> is also required.
  final Protocol protocol;

  /// The ARN of the probe source subnet.
  final String sourceArn;

  /// The IPv4 or IPv6 address for the probe.
  final AddressFamily? addressFamily;

  /// The time and date the probe was created.
  final DateTime? createdAt;

  /// The destination port for the probe. This is required only if the
  /// <code>protocol</code> is <code>TCP</code> and must be a number between
  /// <code>1</code> and <code>65536</code>.
  final int? destinationPort;

  /// The time and date that the probe was last modified.
  final DateTime? modifiedAt;

  /// The size of the packets traveling between the <code>source</code> and
  /// <code>destination</code>. This must be a number between <code>56</code> and
  final int? packetSize;

  /// The ARN of the probe.
  final String? probeArn;

  /// The ID of the probe.
  final String? probeId;

  /// The state of the probe.
  final ProbeState? state;

  /// The list of key-value pairs created and assigned to the probe.
  final Map<String, String>? tags;

  /// The ID of the source VPC subnet.
  final String? vpcId;

  Probe({
    required this.destination,
    required this.protocol,
    required this.sourceArn,
    this.addressFamily,
    this.createdAt,
    this.destinationPort,
    this.modifiedAt,
    this.packetSize,
    this.probeArn,
    this.probeId,
    this.state,
    this.tags,
    this.vpcId,
  });

  factory Probe.fromJson(Map<String, dynamic> json) {
    return Probe(
      destination: json['destination'] as String,
      protocol: (json['protocol'] as String).toProtocol(),
      sourceArn: json['sourceArn'] as String,
      addressFamily: (json['addressFamily'] as String?)?.toAddressFamily(),
      createdAt: timeStampFromJson(json['createdAt']),
      destinationPort: json['destinationPort'] as int?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      packetSize: json['packetSize'] as int?,
      probeArn: json['probeArn'] as String?,
      probeId: json['probeId'] as String?,
      state: (json['state'] as String?)?.toProbeState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final protocol = this.protocol;
    final sourceArn = this.sourceArn;
    final addressFamily = this.addressFamily;
    final createdAt = this.createdAt;
    final destinationPort = this.destinationPort;
    final modifiedAt = this.modifiedAt;
    final packetSize = this.packetSize;
    final probeArn = this.probeArn;
    final probeId = this.probeId;
    final state = this.state;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      'destination': destination,
      'protocol': protocol.toValue(),
      'sourceArn': sourceArn,
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (destinationPort != null) 'destinationPort': destinationPort,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (packetSize != null) 'packetSize': packetSize,
      if (probeArn != null) 'probeArn': probeArn,
      if (probeId != null) 'probeId': probeId,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Defines a probe when creating a probe or monitor.
class ProbeInput {
  /// The destination IP address. This must be either <code>IPV4</code> or
  /// <code>IPV6</code>.
  final String destination;

  /// The protocol used for the network traffic between the <code>source</code>
  /// and <code>destination</code>. This must be either <code>TCP</code> or
  /// <code>ICMP</code>.
  final Protocol protocol;

  /// The ARN of the subnet.
  final String sourceArn;

  /// The port associated with the <code>destination</code>. This is required only
  /// if the <code>protocol</code> is <code>TCP</code> and must be a number
  /// between <code>1</code> and <code>65536</code>.
  final int? destinationPort;

  /// The size of the packets sent between the source and destination. This must
  /// be a number between <code>56</code> and <code>8500</code>.
  final int? packetSize;

  /// The list of key-value pairs created and assigned to the monitor.
  final Map<String, String>? tags;

  ProbeInput({
    required this.destination,
    required this.protocol,
    required this.sourceArn,
    this.destinationPort,
    this.packetSize,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final protocol = this.protocol;
    final sourceArn = this.sourceArn;
    final destinationPort = this.destinationPort;
    final packetSize = this.packetSize;
    final tags = this.tags;
    return {
      'destination': destination,
      'protocol': protocol.toValue(),
      'sourceArn': sourceArn,
      if (destinationPort != null) 'destinationPort': destinationPort,
      if (packetSize != null) 'packetSize': packetSize,
      if (tags != null) 'tags': tags,
    };
  }
}

enum ProbeState {
  pending,
  active,
  inactive,
  error,
  deleting,
  deleted,
}

extension ProbeStateValueExtension on ProbeState {
  String toValue() {
    switch (this) {
      case ProbeState.pending:
        return 'PENDING';
      case ProbeState.active:
        return 'ACTIVE';
      case ProbeState.inactive:
        return 'INACTIVE';
      case ProbeState.error:
        return 'ERROR';
      case ProbeState.deleting:
        return 'DELETING';
      case ProbeState.deleted:
        return 'DELETED';
    }
  }
}

extension ProbeStateFromString on String {
  ProbeState toProbeState() {
    switch (this) {
      case 'PENDING':
        return ProbeState.pending;
      case 'ACTIVE':
        return ProbeState.active;
      case 'INACTIVE':
        return ProbeState.inactive;
      case 'ERROR':
        return ProbeState.error;
      case 'DELETING':
        return ProbeState.deleting;
      case 'DELETED':
        return ProbeState.deleted;
    }
    throw Exception('$this is not known in enum ProbeState');
  }
}

enum Protocol {
  tcp,
  icmp,
}

extension ProtocolValueExtension on Protocol {
  String toValue() {
    switch (this) {
      case Protocol.tcp:
        return 'TCP';
      case Protocol.icmp:
        return 'ICMP';
    }
  }
}

extension ProtocolFromString on String {
  Protocol toProtocol() {
    switch (this) {
      case 'TCP':
        return Protocol.tcp;
      case 'ICMP':
        return Protocol.icmp;
    }
    throw Exception('$this is not known in enum Protocol');
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

class UpdateMonitorOutput {
  /// The ARN of the monitor that was updated.
  final String monitorArn;

  /// The name of the monitor that was updated.
  final String monitorName;

  /// The state of the updated monitor.
  final MonitorState state;

  /// The changed aggregation period.
  final int? aggregationPeriod;

  /// The list of key-value pairs associated with the monitor.
  final Map<String, String>? tags;

  UpdateMonitorOutput({
    required this.monitorArn,
    required this.monitorName,
    required this.state,
    this.aggregationPeriod,
    this.tags,
  });

  factory UpdateMonitorOutput.fromJson(Map<String, dynamic> json) {
    return UpdateMonitorOutput(
      monitorArn: json['monitorArn'] as String,
      monitorName: json['monitorName'] as String,
      state: (json['state'] as String).toMonitorState(),
      aggregationPeriod: json['aggregationPeriod'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final state = this.state;
    final aggregationPeriod = this.aggregationPeriod;
    final tags = this.tags;
    return {
      'monitorArn': monitorArn,
      'monitorName': monitorName,
      'state': state.toValue(),
      if (aggregationPeriod != null) 'aggregationPeriod': aggregationPeriod,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateProbeOutput {
  /// The updated destination IP address for the probe.
  final String destination;

  /// The updated protocol for the probe.
  final Protocol protocol;

  /// The updated ARN of the source subnet.
  final String sourceArn;

  /// The updated IP address family. This must be either <code>IPV4</code> or
  /// <code>IPV6</code>.
  final AddressFamily? addressFamily;

  /// The time and date that the probe was created.
  final DateTime? createdAt;

  /// The updated destination port. This must be a number between <code>1</code>
  /// and <code>65536</code>.
  final int? destinationPort;

  /// The time and date that the probe was last updated.
  final DateTime? modifiedAt;

  /// The updated packet size for the probe.
  final int? packetSize;

  /// The updated ARN of the probe.
  final String? probeArn;

  /// The updated ID of the probe.
  final String? probeId;

  /// The state of the updated probe.
  final ProbeState? state;

  /// Update tags for a probe.
  final Map<String, String>? tags;

  /// The updated ID of the source VPC subnet ID.
  final String? vpcId;

  UpdateProbeOutput({
    required this.destination,
    required this.protocol,
    required this.sourceArn,
    this.addressFamily,
    this.createdAt,
    this.destinationPort,
    this.modifiedAt,
    this.packetSize,
    this.probeArn,
    this.probeId,
    this.state,
    this.tags,
    this.vpcId,
  });

  factory UpdateProbeOutput.fromJson(Map<String, dynamic> json) {
    return UpdateProbeOutput(
      destination: json['destination'] as String,
      protocol: (json['protocol'] as String).toProtocol(),
      sourceArn: json['sourceArn'] as String,
      addressFamily: (json['addressFamily'] as String?)?.toAddressFamily(),
      createdAt: timeStampFromJson(json['createdAt']),
      destinationPort: json['destinationPort'] as int?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      packetSize: json['packetSize'] as int?,
      probeArn: json['probeArn'] as String?,
      probeId: json['probeId'] as String?,
      state: (json['state'] as String?)?.toProbeState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final protocol = this.protocol;
    final sourceArn = this.sourceArn;
    final addressFamily = this.addressFamily;
    final createdAt = this.createdAt;
    final destinationPort = this.destinationPort;
    final modifiedAt = this.modifiedAt;
    final packetSize = this.packetSize;
    final probeArn = this.probeArn;
    final probeId = this.probeId;
    final state = this.state;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      'destination': destination,
      'protocol': protocol.toValue(),
      'sourceArn': sourceArn,
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (destinationPort != null) 'destinationPort': destinationPort,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (packetSize != null) 'packetSize': packetSize,
      if (probeArn != null) 'probeArn': probeArn,
      if (probeId != null) 'probeId': probeId,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (vpcId != null) 'vpcId': vpcId,
    };
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
