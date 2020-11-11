// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'globalaccelerator-2018-08-08.g.dart';

/// This is the <i>AWS Global Accelerator API Reference</i>. This guide is for
/// developers who need detailed information about AWS Global Accelerator API
/// actions, data types, and errors. For more information about Global
/// Accelerator features, see the <a
/// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/Welcome.html">AWS
/// Global Accelerator Developer Guide</a>.
class GlobalAccelerator {
  final _s.JsonProtocol _protocol;
  GlobalAccelerator({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'globalaccelerator',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Advertises an IPv4 address range that is provisioned for use with your AWS
  /// resources through bring your own IP addresses (BYOIP). It can take a few
  /// minutes before traffic to the specified addresses starts routing to AWS
  /// because of propagation delays. To see an AWS CLI example of advertising an
  /// address range, scroll down to <b>Example</b>.
  ///
  /// To stop advertising the BYOIP address range, use <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/api/WithdrawByoipCidr.html">
  /// WithdrawByoipCidr</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html">Bring
  /// Your Own IP Addresses (BYOIP)</a> in the <i>AWS Global Accelerator
  /// Developer Guide</i>.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ByoipCidrNotFoundException].
  /// May throw [IncorrectCidrStateException].
  ///
  /// Parameter [cidr] :
  /// The address range, in CIDR notation. This must be the exact range that you
  /// provisioned. You can't advertise only a portion of the provisioned range.
  Future<AdvertiseByoipCidrResponse> advertiseByoipCidr({
    @_s.required String cidr,
  }) async {
    ArgumentError.checkNotNull(cidr, 'cidr');
    _s.validateStringLength(
      'cidr',
      cidr,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.AdvertiseByoipCidr'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: AdvertiseByoipCidrRequest(
        cidr: cidr,
      ),
    );

    return AdvertiseByoipCidrResponse.fromJson(jsonResponse.body);
  }

  /// Create an accelerator. An accelerator includes one or more listeners that
  /// process inbound connections and direct traffic to one or more endpoint
  /// groups, each of which includes endpoints, such as Network Load Balancers.
  /// To see an AWS CLI example of creating an accelerator, scroll down to
  /// <b>Example</b>.
  ///
  /// If you bring your own IP address ranges to AWS Global Accelerator (BYOIP),
  /// you can assign IP addresses from your own pool to your accelerator as the
  /// static IP address entry points. Only one IP address from each of your IP
  /// address ranges can be used for each accelerator.
  /// <important>
  /// You must specify the US West (Oregon) Region to create or update
  /// accelerators.
  /// </important>
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency—that is, the uniqueness—of an accelerator.
  ///
  /// Parameter [name] :
  /// The name of an accelerator. The name can have a maximum of 32 characters,
  /// must contain only alphanumeric characters or hyphens (-), and must not
  /// begin or end with a hyphen.
  ///
  /// Parameter [enabled] :
  /// Indicates whether an accelerator is enabled. The value is true or false.
  /// The default value is true.
  ///
  /// If the value is set to true, an accelerator cannot be deleted. If set to
  /// false, the accelerator can be deleted.
  ///
  /// Parameter [ipAddressType] :
  /// The value for the address type must be IPv4.
  ///
  /// Parameter [ipAddresses] :
  /// Optionally, if you've added your own IP address pool to Global
  /// Accelerator, you can choose IP addresses from your own pool to use for the
  /// accelerator's static IP addresses. You can specify one or two addresses,
  /// separated by a comma. Do not include the /32 suffix.
  ///
  /// If you specify only one IP address from your IP address range, Global
  /// Accelerator assigns a second static IP address for the accelerator from
  /// the AWS IP address pool.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html">Bring
  /// Your Own IP Addresses (BYOIP)</a> in the <i>AWS Global Accelerator
  /// Developer Guide</i>.
  ///
  /// Parameter [tags] :
  /// Create tags for an accelerator.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html">Tagging
  /// in AWS Global Accelerator</a> in the <i>AWS Global Accelerator Developer
  /// Guide</i>.
  Future<CreateAcceleratorResponse> createAccelerator({
    @_s.required String idempotencyToken,
    @_s.required String name,
    bool enabled,
    IpAddressType ipAddressType,
    List<String> ipAddresses,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.CreateAccelerator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateAcceleratorRequest(
        idempotencyToken: idempotencyToken,
        name: name,
        enabled: enabled,
        ipAddressType: ipAddressType,
        ipAddresses: ipAddresses,
        tags: tags,
      ),
    );

    return CreateAcceleratorResponse.fromJson(jsonResponse.body);
  }

  /// Create an endpoint group for the specified listener. An endpoint group is
  /// a collection of endpoints in one AWS Region. To see an AWS CLI example of
  /// creating an endpoint group, scroll down to <b>Example</b>.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [EndpointGroupAlreadyExistsException].
  /// May throw [ListenerNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [endpointGroupRegion] :
  /// The name of the AWS Region where the endpoint group is located. A listener
  /// can have only one endpoint group in a specific Region.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency—that is, the uniqueness—of the request.
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [endpointConfigurations] :
  /// The list of endpoint objects.
  ///
  /// Parameter [healthCheckIntervalSeconds] :
  /// The time—10 seconds or 30 seconds—between each health check for an
  /// endpoint. The default value is 30.
  ///
  /// Parameter [healthCheckPath] :
  /// If the protocol is HTTP/S, then this specifies the path that is the
  /// destination for health check targets. The default value is slash (/).
  ///
  /// Parameter [healthCheckPort] :
  /// The port that AWS Global Accelerator uses to check the health of endpoints
  /// that are part of this endpoint group. The default port is the listener
  /// port that this endpoint group is associated with. If listener port is a
  /// list of ports, Global Accelerator uses the first port in the list.
  ///
  /// Parameter [healthCheckProtocol] :
  /// The protocol that AWS Global Accelerator uses to check the health of
  /// endpoints that are part of this endpoint group. The default value is TCP.
  ///
  /// Parameter [thresholdCount] :
  /// The number of consecutive health checks required to set the state of a
  /// healthy endpoint to unhealthy, or to set an unhealthy endpoint to healthy.
  /// The default value is 3.
  ///
  /// Parameter [trafficDialPercentage] :
  /// The percentage of traffic to send to an AWS Region. Additional traffic is
  /// distributed to other endpoint groups for this listener.
  ///
  /// Use this action to increase (dial up) or decrease (dial down) traffic to a
  /// specific Region. The percentage is applied to the traffic that would
  /// otherwise have been routed to the Region based on optimal routing.
  ///
  /// The default value is 100.
  Future<CreateEndpointGroupResponse> createEndpointGroup({
    @_s.required String endpointGroupRegion,
    @_s.required String idempotencyToken,
    @_s.required String listenerArn,
    List<EndpointConfiguration> endpointConfigurations,
    int healthCheckIntervalSeconds,
    String healthCheckPath,
    int healthCheckPort,
    HealthCheckProtocol healthCheckProtocol,
    int thresholdCount,
    double trafficDialPercentage,
  }) async {
    ArgumentError.checkNotNull(endpointGroupRegion, 'endpointGroupRegion');
    _s.validateStringLength(
      'endpointGroupRegion',
      endpointGroupRegion,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    _s.validateStringLength(
      'listenerArn',
      listenerArn,
      0,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'healthCheckIntervalSeconds',
      healthCheckIntervalSeconds,
      10,
      30,
    );
    _s.validateStringLength(
      'healthCheckPath',
      healthCheckPath,
      0,
      255,
    );
    _s.validateNumRange(
      'healthCheckPort',
      healthCheckPort,
      1,
      65535,
    );
    _s.validateNumRange(
      'thresholdCount',
      thresholdCount,
      1,
      10,
    );
    _s.validateNumRange(
      'trafficDialPercentage',
      trafficDialPercentage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.CreateEndpointGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateEndpointGroupRequest(
        endpointGroupRegion: endpointGroupRegion,
        idempotencyToken: idempotencyToken,
        listenerArn: listenerArn,
        endpointConfigurations: endpointConfigurations,
        healthCheckIntervalSeconds: healthCheckIntervalSeconds,
        healthCheckPath: healthCheckPath,
        healthCheckPort: healthCheckPort,
        healthCheckProtocol: healthCheckProtocol,
        thresholdCount: thresholdCount,
        trafficDialPercentage: trafficDialPercentage,
      ),
    );

    return CreateEndpointGroupResponse.fromJson(jsonResponse.body);
  }

  /// Create a listener to process inbound connections from clients to an
  /// accelerator. Connections arrive to assigned static IP addresses on a port,
  /// port range, or list of port ranges that you specify. To see an AWS CLI
  /// example of creating a listener, scroll down to <b>Example</b>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InvalidPortRangeException].
  /// May throw [InternalServiceErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of your accelerator.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency—that is, the uniqueness—of the request.
  ///
  /// Parameter [portRanges] :
  /// The list of port ranges to support for connections from clients to your
  /// accelerator.
  ///
  /// Parameter [protocol] :
  /// The protocol for connections from clients to your accelerator.
  ///
  /// Parameter [clientAffinity] :
  /// Client affinity lets you direct all requests from a user to the same
  /// endpoint, if you have stateful applications, regardless of the port and
  /// protocol of the client request. Clienty affinity gives you control over
  /// whether to always route each client to the same specific endpoint.
  ///
  /// AWS Global Accelerator uses a consistent-flow hashing algorithm to choose
  /// the optimal endpoint for a connection. If client affinity is
  /// <code>NONE</code>, Global Accelerator uses the "five-tuple" (5-tuple)
  /// properties—source IP address, source port, destination IP address,
  /// destination port, and protocol—to select the hash value, and then chooses
  /// the best endpoint. However, with this setting, if someone uses different
  /// ports to connect to Global Accelerator, their connections might not be
  /// always routed to the same endpoint because the hash value changes.
  ///
  /// If you want a given client to always be routed to the same endpoint, set
  /// client affinity to <code>SOURCE_IP</code> instead. When you use the
  /// <code>SOURCE_IP</code> setting, Global Accelerator uses the "two-tuple"
  /// (2-tuple) properties— source (client) IP address and destination IP
  /// address—to select the hash value.
  ///
  /// The default value is <code>NONE</code>.
  Future<CreateListenerResponse> createListener({
    @_s.required String acceleratorArn,
    @_s.required String idempotencyToken,
    @_s.required List<PortRange> portRanges,
    @_s.required Protocol protocol,
    ClientAffinity clientAffinity,
  }) async {
    ArgumentError.checkNotNull(acceleratorArn, 'acceleratorArn');
    _s.validateStringLength(
      'acceleratorArn',
      acceleratorArn,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(idempotencyToken, 'idempotencyToken');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(portRanges, 'portRanges');
    ArgumentError.checkNotNull(protocol, 'protocol');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.CreateListener'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateListenerRequest(
        acceleratorArn: acceleratorArn,
        idempotencyToken: idempotencyToken,
        portRanges: portRanges,
        protocol: protocol,
        clientAffinity: clientAffinity,
      ),
    );

    return CreateListenerResponse.fromJson(jsonResponse.body);
  }

  /// Delete an accelerator. Before you can delete an accelerator, you must
  /// disable it and remove all dependent resources (listeners and endpoint
  /// groups). To disable the accelerator, update the accelerator to set
  /// <code>Enabled</code> to false.
  /// <important>
  /// When you create an accelerator, by default, Global Accelerator provides
  /// you with a set of two static IP addresses. Alternatively, you can bring
  /// your own IP address ranges to Global Accelerator and assign IP addresses
  /// from those ranges.
  ///
  /// The IP addresses are assigned to your accelerator for as long as it
  /// exists, even if you disable the accelerator and it no longer accepts or
  /// routes traffic. However, when you <i>delete</i> an accelerator, you lose
  /// the static IP addresses that are assigned to the accelerator, so you can
  /// no longer route traffic by using them. As a best practice, ensure that you
  /// have permissions in place to avoid inadvertently deleting accelerators.
  /// You can use IAM policies with Global Accelerator to limit the users who
  /// have permissions to delete an accelerator. For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/auth-and-access-control.html">Authentication
  /// and Access Control</a> in the <i>AWS Global Accelerator Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [AcceleratorNotDisabledException].
  /// May throw [AssociatedListenerFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of an accelerator.
  Future<void> deleteAccelerator({
    @_s.required String acceleratorArn,
  }) async {
    ArgumentError.checkNotNull(acceleratorArn, 'acceleratorArn');
    _s.validateStringLength(
      'acceleratorArn',
      acceleratorArn,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.DeleteAccelerator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteAcceleratorRequest(
        acceleratorArn: acceleratorArn,
      ),
    );
  }

  /// Delete an endpoint group from a listener.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [EndpointGroupNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [endpointGroupArn] :
  /// The Amazon Resource Name (ARN) of the endpoint group to delete.
  Future<void> deleteEndpointGroup({
    @_s.required String endpointGroupArn,
  }) async {
    ArgumentError.checkNotNull(endpointGroupArn, 'endpointGroupArn');
    _s.validateStringLength(
      'endpointGroupArn',
      endpointGroupArn,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.DeleteEndpointGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteEndpointGroupRequest(
        endpointGroupArn: endpointGroupArn,
      ),
    );
  }

  /// Delete a listener from an accelerator.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ListenerNotFoundException].
  /// May throw [AssociatedEndpointGroupFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  Future<void> deleteListener({
    @_s.required String listenerArn,
  }) async {
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    _s.validateStringLength(
      'listenerArn',
      listenerArn,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.DeleteListener'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteListenerRequest(
        listenerArn: listenerArn,
      ),
    );
  }

  /// Releases the specified address range that you provisioned to use with your
  /// AWS resources through bring your own IP addresses (BYOIP) and deletes the
  /// corresponding address pool. To see an AWS CLI example of deprovisioning an
  /// address range, scroll down to <b>Example</b>.
  ///
  /// Before you can release an address range, you must stop advertising it by
  /// using <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/api/WithdrawByoipCidr.html">WithdrawByoipCidr</a>
  /// and you must not have any accelerators that are using static IP addresses
  /// allocated from its address range.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html">Bring
  /// Your Own IP Addresses (BYOIP)</a> in the <i>AWS Global Accelerator
  /// Developer Guide</i>.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ByoipCidrNotFoundException].
  /// May throw [IncorrectCidrStateException].
  ///
  /// Parameter [cidr] :
  /// The address range, in CIDR notation. The prefix must be the same prefix
  /// that you specified when you provisioned the address range.
  Future<DeprovisionByoipCidrResponse> deprovisionByoipCidr({
    @_s.required String cidr,
  }) async {
    ArgumentError.checkNotNull(cidr, 'cidr');
    _s.validateStringLength(
      'cidr',
      cidr,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.DeprovisionByoipCidr'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeprovisionByoipCidrRequest(
        cidr: cidr,
      ),
    );

    return DeprovisionByoipCidrResponse.fromJson(jsonResponse.body);
  }

  /// Describe an accelerator. To see an AWS CLI example of describing an
  /// accelerator, scroll down to <b>Example</b>.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the accelerator to describe.
  Future<DescribeAcceleratorResponse> describeAccelerator({
    @_s.required String acceleratorArn,
  }) async {
    ArgumentError.checkNotNull(acceleratorArn, 'acceleratorArn');
    _s.validateStringLength(
      'acceleratorArn',
      acceleratorArn,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.DescribeAccelerator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DescribeAcceleratorRequest(
        acceleratorArn: acceleratorArn,
      ),
    );

    return DescribeAcceleratorResponse.fromJson(jsonResponse.body);
  }

  /// Describe the attributes of an accelerator. To see an AWS CLI example of
  /// describing the attributes of an accelerator, scroll down to
  /// <b>Example</b>.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the accelerator with the attributes that
  /// you want to describe.
  Future<DescribeAcceleratorAttributesResponse> describeAcceleratorAttributes({
    @_s.required String acceleratorArn,
  }) async {
    ArgumentError.checkNotNull(acceleratorArn, 'acceleratorArn');
    _s.validateStringLength(
      'acceleratorArn',
      acceleratorArn,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.DescribeAcceleratorAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DescribeAcceleratorAttributesRequest(
        acceleratorArn: acceleratorArn,
      ),
    );

    return DescribeAcceleratorAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Describe an endpoint group. To see an AWS CLI example of describing an
  /// endpoint group, scroll down to <b>Example</b>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [EndpointGroupNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [endpointGroupArn] :
  /// The Amazon Resource Name (ARN) of the endpoint group to describe.
  Future<DescribeEndpointGroupResponse> describeEndpointGroup({
    @_s.required String endpointGroupArn,
  }) async {
    ArgumentError.checkNotNull(endpointGroupArn, 'endpointGroupArn');
    _s.validateStringLength(
      'endpointGroupArn',
      endpointGroupArn,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.DescribeEndpointGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DescribeEndpointGroupRequest(
        endpointGroupArn: endpointGroupArn,
      ),
    );

    return DescribeEndpointGroupResponse.fromJson(jsonResponse.body);
  }

  /// Describe a listener. To see an AWS CLI example of describing a listener,
  /// scroll down to <b>Example</b>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ListenerNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener to describe.
  Future<DescribeListenerResponse> describeListener({
    @_s.required String listenerArn,
  }) async {
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    _s.validateStringLength(
      'listenerArn',
      listenerArn,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.DescribeListener'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DescribeListenerRequest(
        listenerArn: listenerArn,
      ),
    );

    return DescribeListenerResponse.fromJson(jsonResponse.body);
  }

  /// List the accelerators for an AWS account. To see an AWS CLI example of
  /// listing the accelerators for an AWS account, scroll down to
  /// <b>Example</b>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [maxResults] :
  /// The number of Global Accelerator objects that you want to return with this
  /// call. The default value is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListAcceleratorsResponse> listAccelerators({
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
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.ListAccelerators'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListAcceleratorsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return ListAcceleratorsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the IP address ranges that were specified in calls to <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/api/ProvisionByoipCidr.html">ProvisionByoipCidr</a>,
  /// including the current state and a history of state changes.
  ///
  /// To see an AWS CLI example of listing BYOIP CIDR addresses, scroll down to
  /// <b>Example</b>.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListByoipCidrsResponse> listByoipCidrs({
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
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.ListByoipCidrs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListByoipCidrsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return ListByoipCidrsResponse.fromJson(jsonResponse.body);
  }

  /// List the endpoint groups that are associated with a listener. To see an
  /// AWS CLI example of listing the endpoint groups for listener, scroll down
  /// to <b>Example</b>.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [maxResults] :
  /// The number of endpoint group objects that you want to return with this
  /// call. The default value is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListEndpointGroupsResponse> listEndpointGroups({
    @_s.required String listenerArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    _s.validateStringLength(
      'listenerArn',
      listenerArn,
      0,
      255,
      isRequired: true,
    );
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
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.ListEndpointGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListEndpointGroupsRequest(
        listenerArn: listenerArn,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return ListEndpointGroupsResponse.fromJson(jsonResponse.body);
  }

  /// List the listeners for an accelerator. To see an AWS CLI example of
  /// listing the listeners for an accelerator, scroll down to <b>Example</b>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the accelerator for which you want to
  /// list listener objects.
  ///
  /// Parameter [maxResults] :
  /// The number of listener objects that you want to return with this call. The
  /// default value is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListListenersResponse> listListeners({
    @_s.required String acceleratorArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(acceleratorArn, 'acceleratorArn');
    _s.validateStringLength(
      'acceleratorArn',
      acceleratorArn,
      0,
      255,
      isRequired: true,
    );
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
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.ListListeners'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListListenersRequest(
        acceleratorArn: acceleratorArn,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return ListListenersResponse.fromJson(jsonResponse.body);
  }

  /// List all tags for an accelerator. To see an AWS CLI example of listing
  /// tags for an accelerator, scroll down to <b>Example</b>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html">Tagging
  /// in AWS Global Accelerator</a> in the <i>AWS Global Accelerator Developer
  /// Guide</i>.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the accelerator to list tags for. An ARN
  /// uniquely identifies an accelerator.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListTagsForResourceRequest(
        resourceArn: resourceArn,
      ),
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Provisions an IP address range to use with your AWS resources through
  /// bring your own IP addresses (BYOIP) and creates a corresponding address
  /// pool. After the address range is provisioned, it is ready to be advertised
  /// using <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/api/AdvertiseByoipCidr.html">
  /// AdvertiseByoipCidr</a>.
  ///
  /// To see an AWS CLI example of provisioning an address range for BYOIP,
  /// scroll down to <b>Example</b>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html">Bring
  /// Your Own IP Addresses (BYOIP)</a> in the <i>AWS Global Accelerator
  /// Developer Guide</i>.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [IncorrectCidrStateException].
  ///
  /// Parameter [cidr] :
  /// The public IPv4 address range, in CIDR notation. The most specific IP
  /// prefix that you can specify is /24. The address range cannot overlap with
  /// another address range that you've brought to this or another Region.
  ///
  /// Parameter [cidrAuthorizationContext] :
  /// A signed document that proves that you are authorized to bring the
  /// specified IP address range to Amazon using BYOIP.
  Future<ProvisionByoipCidrResponse> provisionByoipCidr({
    @_s.required String cidr,
    @_s.required CidrAuthorizationContext cidrAuthorizationContext,
  }) async {
    ArgumentError.checkNotNull(cidr, 'cidr');
    _s.validateStringLength(
      'cidr',
      cidr,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        cidrAuthorizationContext, 'cidrAuthorizationContext');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.ProvisionByoipCidr'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ProvisionByoipCidrRequest(
        cidr: cidr,
        cidrAuthorizationContext: cidrAuthorizationContext,
      ),
    );

    return ProvisionByoipCidrResponse.fromJson(jsonResponse.body);
  }

  /// Add tags to an accelerator resource. To see an AWS CLI example of adding
  /// tags to an accelerator, scroll down to <b>Example</b>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html">Tagging
  /// in AWS Global Accelerator</a> in the <i>AWS Global Accelerator Developer
  /// Guide</i>.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Global Accelerator resource to add
  /// tags to. An ARN uniquely identifies a resource.
  ///
  /// Parameter [tags] :
  /// The tags to add to a resource. A tag consists of a key and a value that
  /// you define.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: TagResourceRequest(
        resourceArn: resourceArn,
        tags: tags,
      ),
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Remove tags from a Global Accelerator resource. When you specify a tag
  /// key, the action removes both that key and its associated value. To see an
  /// AWS CLI example of removing tags from an accelerator, scroll down to
  /// <b>Example</b>. The operation succeeds even if you attempt to remove tags
  /// from an accelerator that was already removed.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html">Tagging
  /// in AWS Global Accelerator</a> in the <i>AWS Global Accelerator Developer
  /// Guide</i>.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Global Accelerator resource to
  /// remove tags from. An ARN uniquely identifies a resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag key pairs that you want to remove from the specified resources.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UntagResourceRequest(
        resourceArn: resourceArn,
        tagKeys: tagKeys,
      ),
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Update an accelerator. To see an AWS CLI example of updating an
  /// accelerator, scroll down to <b>Example</b>.
  /// <important>
  /// You must specify the US West (Oregon) Region to create or update
  /// accelerators.
  /// </important>
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the accelerator to update.
  ///
  /// Parameter [enabled] :
  /// Indicates whether an accelerator is enabled. The value is true or false.
  /// The default value is true.
  ///
  /// If the value is set to true, the accelerator cannot be deleted. If set to
  /// false, the accelerator can be deleted.
  ///
  /// Parameter [ipAddressType] :
  /// The value for the address type must be IPv4.
  ///
  /// Parameter [name] :
  /// The name of the accelerator. The name can have a maximum of 32 characters,
  /// must contain only alphanumeric characters or hyphens (-), and must not
  /// begin or end with a hyphen.
  Future<UpdateAcceleratorResponse> updateAccelerator({
    @_s.required String acceleratorArn,
    bool enabled,
    IpAddressType ipAddressType,
    String name,
  }) async {
    ArgumentError.checkNotNull(acceleratorArn, 'acceleratorArn');
    _s.validateStringLength(
      'acceleratorArn',
      acceleratorArn,
      0,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.UpdateAccelerator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateAcceleratorRequest(
        acceleratorArn: acceleratorArn,
        enabled: enabled,
        ipAddressType: ipAddressType,
        name: name,
      ),
    );

    return UpdateAcceleratorResponse.fromJson(jsonResponse.body);
  }

  /// Update the attributes for an accelerator. To see an AWS CLI example of
  /// updating an accelerator to enable flow logs, scroll down to
  /// <b>Example</b>.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the accelerator that you want to update.
  ///
  /// Parameter [flowLogsEnabled] :
  /// Update whether flow logs are enabled. The default value is false. If the
  /// value is true, <code>FlowLogsS3Bucket</code> and
  /// <code>FlowLogsS3Prefix</code> must be specified.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/monitoring-global-accelerator.flow-logs.html">Flow
  /// Logs</a> in the <i>AWS Global Accelerator Developer Guide</i>.
  ///
  /// Parameter [flowLogsS3Bucket] :
  /// The name of the Amazon S3 bucket for the flow logs. Attribute is required
  /// if <code>FlowLogsEnabled</code> is <code>true</code>. The bucket must
  /// exist and have a bucket policy that grants AWS Global Accelerator
  /// permission to write to the bucket.
  ///
  /// Parameter [flowLogsS3Prefix] :
  /// Update the prefix for the location in the Amazon S3 bucket for the flow
  /// logs. Attribute is required if <code>FlowLogsEnabled</code> is
  /// <code>true</code>.
  ///
  /// If you don’t specify a prefix, the flow logs are stored in the root of the
  /// bucket. If you specify slash (/) for the S3 bucket prefix, the log file
  /// bucket folder structure will include a double slash (//), like the
  /// following:
  ///
  /// s3-bucket_name//AWSLogs/aws_account_id
  Future<UpdateAcceleratorAttributesResponse> updateAcceleratorAttributes({
    @_s.required String acceleratorArn,
    bool flowLogsEnabled,
    String flowLogsS3Bucket,
    String flowLogsS3Prefix,
  }) async {
    ArgumentError.checkNotNull(acceleratorArn, 'acceleratorArn');
    _s.validateStringLength(
      'acceleratorArn',
      acceleratorArn,
      0,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'flowLogsS3Bucket',
      flowLogsS3Bucket,
      0,
      255,
    );
    _s.validateStringLength(
      'flowLogsS3Prefix',
      flowLogsS3Prefix,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.UpdateAcceleratorAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateAcceleratorAttributesRequest(
        acceleratorArn: acceleratorArn,
        flowLogsEnabled: flowLogsEnabled,
        flowLogsS3Bucket: flowLogsS3Bucket,
        flowLogsS3Prefix: flowLogsS3Prefix,
      ),
    );

    return UpdateAcceleratorAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Update an endpoint group. To see an AWS CLI example of updating an
  /// endpoint group, scroll down to <b>Example</b>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [EndpointGroupNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [endpointGroupArn] :
  /// The Amazon Resource Name (ARN) of the endpoint group.
  ///
  /// Parameter [endpointConfigurations] :
  /// The list of endpoint objects.
  ///
  /// Parameter [healthCheckIntervalSeconds] :
  /// The time—10 seconds or 30 seconds—between each health check for an
  /// endpoint. The default value is 30.
  ///
  /// Parameter [healthCheckPath] :
  /// If the protocol is HTTP/S, then this specifies the path that is the
  /// destination for health check targets. The default value is slash (/).
  ///
  /// Parameter [healthCheckPort] :
  /// The port that AWS Global Accelerator uses to check the health of endpoints
  /// that are part of this endpoint group. The default port is the listener
  /// port that this endpoint group is associated with. If the listener port is
  /// a list of ports, Global Accelerator uses the first port in the list.
  ///
  /// Parameter [healthCheckProtocol] :
  /// The protocol that AWS Global Accelerator uses to check the health of
  /// endpoints that are part of this endpoint group. The default value is TCP.
  ///
  /// Parameter [thresholdCount] :
  /// The number of consecutive health checks required to set the state of a
  /// healthy endpoint to unhealthy, or to set an unhealthy endpoint to healthy.
  /// The default value is 3.
  ///
  /// Parameter [trafficDialPercentage] :
  /// The percentage of traffic to send to an AWS Region. Additional traffic is
  /// distributed to other endpoint groups for this listener.
  ///
  /// Use this action to increase (dial up) or decrease (dial down) traffic to a
  /// specific Region. The percentage is applied to the traffic that would
  /// otherwise have been routed to the Region based on optimal routing.
  ///
  /// The default value is 100.
  Future<UpdateEndpointGroupResponse> updateEndpointGroup({
    @_s.required String endpointGroupArn,
    List<EndpointConfiguration> endpointConfigurations,
    int healthCheckIntervalSeconds,
    String healthCheckPath,
    int healthCheckPort,
    HealthCheckProtocol healthCheckProtocol,
    int thresholdCount,
    double trafficDialPercentage,
  }) async {
    ArgumentError.checkNotNull(endpointGroupArn, 'endpointGroupArn');
    _s.validateStringLength(
      'endpointGroupArn',
      endpointGroupArn,
      0,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'healthCheckIntervalSeconds',
      healthCheckIntervalSeconds,
      10,
      30,
    );
    _s.validateStringLength(
      'healthCheckPath',
      healthCheckPath,
      0,
      255,
    );
    _s.validateNumRange(
      'healthCheckPort',
      healthCheckPort,
      1,
      65535,
    );
    _s.validateNumRange(
      'thresholdCount',
      thresholdCount,
      1,
      10,
    );
    _s.validateNumRange(
      'trafficDialPercentage',
      trafficDialPercentage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.UpdateEndpointGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateEndpointGroupRequest(
        endpointGroupArn: endpointGroupArn,
        endpointConfigurations: endpointConfigurations,
        healthCheckIntervalSeconds: healthCheckIntervalSeconds,
        healthCheckPath: healthCheckPath,
        healthCheckPort: healthCheckPort,
        healthCheckProtocol: healthCheckProtocol,
        thresholdCount: thresholdCount,
        trafficDialPercentage: trafficDialPercentage,
      ),
    );

    return UpdateEndpointGroupResponse.fromJson(jsonResponse.body);
  }

  /// Update a listener. To see an AWS CLI example of updating listener, scroll
  /// down to <b>Example</b>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidPortRangeException].
  /// May throw [ListenerNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener to update.
  ///
  /// Parameter [clientAffinity] :
  /// Client affinity lets you direct all requests from a user to the same
  /// endpoint, if you have stateful applications, regardless of the port and
  /// protocol of the client request. Clienty affinity gives you control over
  /// whether to always route each client to the same specific endpoint.
  ///
  /// AWS Global Accelerator uses a consistent-flow hashing algorithm to choose
  /// the optimal endpoint for a connection. If client affinity is
  /// <code>NONE</code>, Global Accelerator uses the "five-tuple" (5-tuple)
  /// properties—source IP address, source port, destination IP address,
  /// destination port, and protocol—to select the hash value, and then chooses
  /// the best endpoint. However, with this setting, if someone uses different
  /// ports to connect to Global Accelerator, their connections might not be
  /// always routed to the same endpoint because the hash value changes.
  ///
  /// If you want a given client to always be routed to the same endpoint, set
  /// client affinity to <code>SOURCE_IP</code> instead. When you use the
  /// <code>SOURCE_IP</code> setting, Global Accelerator uses the "two-tuple"
  /// (2-tuple) properties— source (client) IP address and destination IP
  /// address—to select the hash value.
  ///
  /// The default value is <code>NONE</code>.
  ///
  /// Parameter [portRanges] :
  /// The updated list of port ranges for the connections from clients to the
  /// accelerator.
  ///
  /// Parameter [protocol] :
  /// The updated protocol for the connections from clients to the accelerator.
  Future<UpdateListenerResponse> updateListener({
    @_s.required String listenerArn,
    ClientAffinity clientAffinity,
    List<PortRange> portRanges,
    Protocol protocol,
  }) async {
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    _s.validateStringLength(
      'listenerArn',
      listenerArn,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.UpdateListener'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateListenerRequest(
        listenerArn: listenerArn,
        clientAffinity: clientAffinity,
        portRanges: portRanges,
        protocol: protocol,
      ),
    );

    return UpdateListenerResponse.fromJson(jsonResponse.body);
  }

  /// Stops advertising an address range that is provisioned as an address pool.
  /// You can perform this operation at most once every 10 seconds, even if you
  /// specify different address ranges each time. To see an AWS CLI example of
  /// withdrawing an address range for BYOIP so it will no longer be advertised
  /// by AWS, scroll down to <b>Example</b>.
  ///
  /// It can take a few minutes before traffic to the specified addresses stops
  /// routing to AWS because of propagation delays.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html">Bring
  /// Your Own IP Addresses (BYOIP)</a> in the <i>AWS Global Accelerator
  /// Developer Guide</i>.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ByoipCidrNotFoundException].
  /// May throw [IncorrectCidrStateException].
  ///
  /// Parameter [cidr] :
  /// The address range, in CIDR notation.
  Future<WithdrawByoipCidrResponse> withdrawByoipCidr({
    @_s.required String cidr,
  }) async {
    ArgumentError.checkNotNull(cidr, 'cidr');
    _s.validateStringLength(
      'cidr',
      cidr,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.WithdrawByoipCidr'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: WithdrawByoipCidrRequest(
        cidr: cidr,
      ),
    );

    return WithdrawByoipCidrResponse.fromJson(jsonResponse.body);
  }
}

/// An accelerator is a complex type that includes one or more listeners that
/// process inbound connections and then direct traffic to one or more endpoint
/// groups, each of which includes endpoints, such as load balancers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Accelerator {
  /// The Amazon Resource Name (ARN) of the accelerator.
  @_s.JsonKey(name: 'AcceleratorArn')
  final String acceleratorArn;

  /// The date and time that the accelerator was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// The Domain Name System (DNS) name that Global Accelerator creates that
  /// points to your accelerator's static IP addresses.
  ///
  /// The naming convention for the DNS name is the following: A lowercase letter
  /// a, followed by a 16-bit random hex string, followed by
  /// .awsglobalaccelerator.com. For example:
  /// a1234567890abcdef.awsglobalaccelerator.com.
  ///
  /// For more information about the default DNS name, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/about-accelerators.html#about-accelerators.dns-addressing">
  /// Support for DNS Addressing in Global Accelerator</a> in the <i>AWS Global
  /// Accelerator Developer Guide</i>.
  @_s.JsonKey(name: 'DnsName')
  final String dnsName;

  /// Indicates whether the accelerator is enabled. The value is true or false.
  /// The default value is true.
  ///
  /// If the value is set to true, the accelerator cannot be deleted. If set to
  /// false, accelerator can be deleted.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The value for the address type must be IPv4.
  @_s.JsonKey(name: 'IpAddressType')
  final IpAddressType ipAddressType;

  /// The static IP addresses that Global Accelerator associates with the
  /// accelerator.
  @_s.JsonKey(name: 'IpSets')
  final List<IpSet> ipSets;

  /// The date and time that the accelerator was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedTime;

  /// The name of the accelerator. The name must contain only alphanumeric
  /// characters or hyphens (-), and must not begin or end with a hyphen.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Describes the deployment status of the accelerator.
  @_s.JsonKey(name: 'Status')
  final AcceleratorStatus status;

  Accelerator({
    this.acceleratorArn,
    this.createdTime,
    this.dnsName,
    this.enabled,
    this.ipAddressType,
    this.ipSets,
    this.lastModifiedTime,
    this.name,
    this.status,
  });
  factory Accelerator.fromJson(Map<String, dynamic> json) =>
      _$AcceleratorFromJson(json);
}

/// Attributes of an accelerator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceleratorAttributes {
  /// Indicates whether flow logs are enabled. The default value is false. If the
  /// value is true, <code>FlowLogsS3Bucket</code> and
  /// <code>FlowLogsS3Prefix</code> must be specified.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/monitoring-global-accelerator.flow-logs.html">Flow
  /// Logs</a> in the <i>AWS Global Accelerator Developer Guide</i>.
  @_s.JsonKey(name: 'FlowLogsEnabled')
  final bool flowLogsEnabled;

  /// The name of the Amazon S3 bucket for the flow logs. Attribute is required if
  /// <code>FlowLogsEnabled</code> is <code>true</code>. The bucket must exist and
  /// have a bucket policy that grants AWS Global Accelerator permission to write
  /// to the bucket.
  @_s.JsonKey(name: 'FlowLogsS3Bucket')
  final String flowLogsS3Bucket;

  /// The prefix for the location in the Amazon S3 bucket for the flow logs.
  /// Attribute is required if <code>FlowLogsEnabled</code> is <code>true</code>.
  ///
  /// If you don’t specify a prefix, the flow logs are stored in the root of the
  /// bucket. If you specify slash (/) for the S3 bucket prefix, the log file
  /// bucket folder structure will include a double slash (//), like the
  /// following:
  ///
  /// s3-bucket_name//AWSLogs/aws_account_id
  @_s.JsonKey(name: 'FlowLogsS3Prefix')
  final String flowLogsS3Prefix;

  AcceleratorAttributes({
    this.flowLogsEnabled,
    this.flowLogsS3Bucket,
    this.flowLogsS3Prefix,
  });
  factory AcceleratorAttributes.fromJson(Map<String, dynamic> json) =>
      _$AcceleratorAttributesFromJson(json);
}

enum AcceleratorStatus {
  @_s.JsonValue('DEPLOYED')
  deployed,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AdvertiseByoipCidrRequest {
  /// The address range, in CIDR notation. This must be the exact range that you
  /// provisioned. You can't advertise only a portion of the provisioned range.
  @_s.JsonKey(name: 'Cidr')
  final String cidr;

  AdvertiseByoipCidrRequest({
    @_s.required this.cidr,
  });
  Map<String, dynamic> toJson() => _$AdvertiseByoipCidrRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdvertiseByoipCidrResponse {
  /// Information about the address range.
  @_s.JsonKey(name: 'ByoipCidr')
  final ByoipCidr byoipCidr;

  AdvertiseByoipCidrResponse({
    this.byoipCidr,
  });
  factory AdvertiseByoipCidrResponse.fromJson(Map<String, dynamic> json) =>
      _$AdvertiseByoipCidrResponseFromJson(json);
}

/// Information about an IP address range that is provisioned for use with your
/// AWS resources through bring your own IP address (BYOIP).
///
/// The following describes each BYOIP <code>State</code> that your IP address
/// range can be in.
///
/// <ul>
/// <li>
/// <b>PENDING_PROVISIONING</b> — You’ve submitted a request to provision an IP
/// address range but it is not yet provisioned with AWS Global Accelerator.
/// </li>
/// <li>
/// <b>READY</b> — The address range is provisioned with AWS Global Accelerator
/// and can be advertised.
/// </li>
/// <li>
/// <b>PENDING_ADVERTISING</b> — You’ve submitted a request for AWS Global
/// Accelerator to advertise an address range but it is not yet being
/// advertised.
/// </li>
/// <li>
/// <b>ADVERTISING</b> — The address range is being advertised by AWS Global
/// Accelerator.
/// </li>
/// <li>
/// <b>PENDING_WITHDRAWING</b> — You’ve submitted a request to withdraw an
/// address range from being advertised but it is still being advertised by AWS
/// Global Accelerator.
/// </li>
/// <li>
/// <b>PENDING_DEPROVISIONING</b> — You’ve submitted a request to deprovision an
/// address range from AWS Global Accelerator but it is still provisioned.
/// </li>
/// <li>
/// <b>DEPROVISIONED</b> — The address range is deprovisioned from AWS Global
/// Accelerator.
/// </li>
/// <li>
/// <b>FAILED_PROVISION </b> — The request to provision the address range from
/// AWS Global Accelerator was not successful. Please make sure that you provide
/// all of the correct information, and try again. If the request fails a second
/// time, contact AWS support.
/// </li>
/// <li>
/// <b>FAILED_ADVERTISING</b> — The request for AWS Global Accelerator to
/// advertise the address range was not successful. Please make sure that you
/// provide all of the correct information, and try again. If the request fails
/// a second time, contact AWS support.
/// </li>
/// <li>
/// <b>FAILED_WITHDRAW</b> — The request to withdraw the address range from
/// advertising by AWS Global Accelerator was not successful. Please make sure
/// that you provide all of the correct information, and try again. If the
/// request fails a second time, contact AWS support.
/// </li>
/// <li>
/// <b>FAILED_DEPROVISION </b> — The request to deprovision the address range
/// from AWS Global Accelerator was not successful. Please make sure that you
/// provide all of the correct information, and try again. If the request fails
/// a second time, contact AWS support.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ByoipCidr {
  /// The address range, in CIDR notation.
  @_s.JsonKey(name: 'Cidr')
  final String cidr;

  /// A history of status changes for an IP address range that that you bring to
  /// AWS Global Accelerator through bring your own IP address (BYOIP).
  @_s.JsonKey(name: 'Events')
  final List<ByoipCidrEvent> events;

  /// The state of the address pool.
  @_s.JsonKey(name: 'State')
  final ByoipCidrState state;

  ByoipCidr({
    this.cidr,
    this.events,
    this.state,
  });
  factory ByoipCidr.fromJson(Map<String, dynamic> json) =>
      _$ByoipCidrFromJson(json);
}

/// A complex type that contains a <code>Message</code> and a
/// <code>Timestamp</code> value for changes that you make in the status an IP
/// address range that you bring to AWS Global Accelerator through bring your
/// own IP address (BYOIP).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ByoipCidrEvent {
  /// A string that contains an <code>Event</code> message describing changes that
  /// you make in the status of an IP address range that you bring to AWS Global
  /// Accelerator through bring your own IP address (BYOIP).
  @_s.JsonKey(name: 'Message')
  final String message;

  /// A timestamp when you make a status change for an IP address range that you
  /// bring to AWS Global Accelerator through bring your own IP address (BYOIP).
  @_s.JsonKey(
      name: 'Timestamp',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime timestamp;

  ByoipCidrEvent({
    this.message,
    this.timestamp,
  });
  factory ByoipCidrEvent.fromJson(Map<String, dynamic> json) =>
      _$ByoipCidrEventFromJson(json);
}

enum ByoipCidrState {
  @_s.JsonValue('PENDING_PROVISIONING')
  pendingProvisioning,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('PENDING_ADVERTISING')
  pendingAdvertising,
  @_s.JsonValue('ADVERTISING')
  advertising,
  @_s.JsonValue('PENDING_WITHDRAWING')
  pendingWithdrawing,
  @_s.JsonValue('PENDING_DEPROVISIONING')
  pendingDeprovisioning,
  @_s.JsonValue('DEPROVISIONED')
  deprovisioned,
  @_s.JsonValue('FAILED_PROVISION')
  failedProvision,
  @_s.JsonValue('FAILED_ADVERTISING')
  failedAdvertising,
  @_s.JsonValue('FAILED_WITHDRAW')
  failedWithdraw,
  @_s.JsonValue('FAILED_DEPROVISION')
  failedDeprovision,
}

/// Provides authorization for Amazon to bring a specific IP address range to a
/// specific AWS account using bring your own IP addresses (BYOIP).
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html">Bring
/// Your Own IP Addresses (BYOIP)</a> in the <i>AWS Global Accelerator Developer
/// Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CidrAuthorizationContext {
  /// The plain-text authorization message for the prefix and account.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The signed authorization message for the prefix and account.
  @_s.JsonKey(name: 'Signature')
  final String signature;

  CidrAuthorizationContext({
    @_s.required this.message,
    @_s.required this.signature,
  });
  Map<String, dynamic> toJson() => _$CidrAuthorizationContextToJson(this);
}

enum ClientAffinity {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SOURCE_IP')
  sourceIp,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateAcceleratorRequest {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency—that is, the uniqueness—of an accelerator.
  @_s.JsonKey(name: 'IdempotencyToken')
  final String idempotencyToken;

  /// The name of an accelerator. The name can have a maximum of 32 characters,
  /// must contain only alphanumeric characters or hyphens (-), and must not begin
  /// or end with a hyphen.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Indicates whether an accelerator is enabled. The value is true or false. The
  /// default value is true.
  ///
  /// If the value is set to true, an accelerator cannot be deleted. If set to
  /// false, the accelerator can be deleted.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The value for the address type must be IPv4.
  @_s.JsonKey(name: 'IpAddressType')
  final IpAddressType ipAddressType;

  /// Optionally, if you've added your own IP address pool to Global Accelerator,
  /// you can choose IP addresses from your own pool to use for the accelerator's
  /// static IP addresses. You can specify one or two addresses, separated by a
  /// comma. Do not include the /32 suffix.
  ///
  /// If you specify only one IP address from your IP address range, Global
  /// Accelerator assigns a second static IP address for the accelerator from the
  /// AWS IP address pool.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html">Bring
  /// Your Own IP Addresses (BYOIP)</a> in the <i>AWS Global Accelerator Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'IpAddresses')
  final List<String> ipAddresses;

  /// Create tags for an accelerator.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html">Tagging
  /// in AWS Global Accelerator</a> in the <i>AWS Global Accelerator Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  CreateAcceleratorRequest({
    @_s.required this.idempotencyToken,
    @_s.required this.name,
    this.enabled,
    this.ipAddressType,
    this.ipAddresses,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateAcceleratorRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAcceleratorResponse {
  /// The accelerator that is created by specifying a listener and the supported
  /// IP address types.
  @_s.JsonKey(name: 'Accelerator')
  final Accelerator accelerator;

  CreateAcceleratorResponse({
    this.accelerator,
  });
  factory CreateAcceleratorResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAcceleratorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateEndpointGroupRequest {
  /// The name of the AWS Region where the endpoint group is located. A listener
  /// can have only one endpoint group in a specific Region.
  @_s.JsonKey(name: 'EndpointGroupRegion')
  final String endpointGroupRegion;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency—that is, the uniqueness—of the request.
  @_s.JsonKey(name: 'IdempotencyToken')
  final String idempotencyToken;

  /// The Amazon Resource Name (ARN) of the listener.
  @_s.JsonKey(name: 'ListenerArn')
  final String listenerArn;

  /// The list of endpoint objects.
  @_s.JsonKey(name: 'EndpointConfigurations')
  final List<EndpointConfiguration> endpointConfigurations;

  /// The time—10 seconds or 30 seconds—between each health check for an endpoint.
  /// The default value is 30.
  @_s.JsonKey(name: 'HealthCheckIntervalSeconds')
  final int healthCheckIntervalSeconds;

  /// If the protocol is HTTP/S, then this specifies the path that is the
  /// destination for health check targets. The default value is slash (/).
  @_s.JsonKey(name: 'HealthCheckPath')
  final String healthCheckPath;

  /// The port that AWS Global Accelerator uses to check the health of endpoints
  /// that are part of this endpoint group. The default port is the listener port
  /// that this endpoint group is associated with. If listener port is a list of
  /// ports, Global Accelerator uses the first port in the list.
  @_s.JsonKey(name: 'HealthCheckPort')
  final int healthCheckPort;

  /// The protocol that AWS Global Accelerator uses to check the health of
  /// endpoints that are part of this endpoint group. The default value is TCP.
  @_s.JsonKey(name: 'HealthCheckProtocol')
  final HealthCheckProtocol healthCheckProtocol;

  /// The number of consecutive health checks required to set the state of a
  /// healthy endpoint to unhealthy, or to set an unhealthy endpoint to healthy.
  /// The default value is 3.
  @_s.JsonKey(name: 'ThresholdCount')
  final int thresholdCount;

  /// The percentage of traffic to send to an AWS Region. Additional traffic is
  /// distributed to other endpoint groups for this listener.
  ///
  /// Use this action to increase (dial up) or decrease (dial down) traffic to a
  /// specific Region. The percentage is applied to the traffic that would
  /// otherwise have been routed to the Region based on optimal routing.
  ///
  /// The default value is 100.
  @_s.JsonKey(name: 'TrafficDialPercentage')
  final double trafficDialPercentage;

  CreateEndpointGroupRequest({
    @_s.required this.endpointGroupRegion,
    @_s.required this.idempotencyToken,
    @_s.required this.listenerArn,
    this.endpointConfigurations,
    this.healthCheckIntervalSeconds,
    this.healthCheckPath,
    this.healthCheckPort,
    this.healthCheckProtocol,
    this.thresholdCount,
    this.trafficDialPercentage,
  });
  Map<String, dynamic> toJson() => _$CreateEndpointGroupRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEndpointGroupResponse {
  /// The information about the endpoint group that was created.
  @_s.JsonKey(name: 'EndpointGroup')
  final EndpointGroup endpointGroup;

  CreateEndpointGroupResponse({
    this.endpointGroup,
  });
  factory CreateEndpointGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEndpointGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateListenerRequest {
  /// The Amazon Resource Name (ARN) of your accelerator.
  @_s.JsonKey(name: 'AcceleratorArn')
  final String acceleratorArn;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency—that is, the uniqueness—of the request.
  @_s.JsonKey(name: 'IdempotencyToken')
  final String idempotencyToken;

  /// The list of port ranges to support for connections from clients to your
  /// accelerator.
  @_s.JsonKey(name: 'PortRanges')
  final List<PortRange> portRanges;

  /// The protocol for connections from clients to your accelerator.
  @_s.JsonKey(name: 'Protocol')
  final Protocol protocol;

  /// Client affinity lets you direct all requests from a user to the same
  /// endpoint, if you have stateful applications, regardless of the port and
  /// protocol of the client request. Clienty affinity gives you control over
  /// whether to always route each client to the same specific endpoint.
  ///
  /// AWS Global Accelerator uses a consistent-flow hashing algorithm to choose
  /// the optimal endpoint for a connection. If client affinity is
  /// <code>NONE</code>, Global Accelerator uses the "five-tuple" (5-tuple)
  /// properties—source IP address, source port, destination IP address,
  /// destination port, and protocol—to select the hash value, and then chooses
  /// the best endpoint. However, with this setting, if someone uses different
  /// ports to connect to Global Accelerator, their connections might not be
  /// always routed to the same endpoint because the hash value changes.
  ///
  /// If you want a given client to always be routed to the same endpoint, set
  /// client affinity to <code>SOURCE_IP</code> instead. When you use the
  /// <code>SOURCE_IP</code> setting, Global Accelerator uses the "two-tuple"
  /// (2-tuple) properties— source (client) IP address and destination IP
  /// address—to select the hash value.
  ///
  /// The default value is <code>NONE</code>.
  @_s.JsonKey(name: 'ClientAffinity')
  final ClientAffinity clientAffinity;

  CreateListenerRequest({
    @_s.required this.acceleratorArn,
    @_s.required this.idempotencyToken,
    @_s.required this.portRanges,
    @_s.required this.protocol,
    this.clientAffinity,
  });
  Map<String, dynamic> toJson() => _$CreateListenerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateListenerResponse {
  /// The listener that you've created.
  @_s.JsonKey(name: 'Listener')
  final Listener listener;

  CreateListenerResponse({
    this.listener,
  });
  factory CreateListenerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateListenerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteAcceleratorRequest {
  /// The Amazon Resource Name (ARN) of an accelerator.
  @_s.JsonKey(name: 'AcceleratorArn')
  final String acceleratorArn;

  DeleteAcceleratorRequest({
    @_s.required this.acceleratorArn,
  });
  Map<String, dynamic> toJson() => _$DeleteAcceleratorRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteEndpointGroupRequest {
  /// The Amazon Resource Name (ARN) of the endpoint group to delete.
  @_s.JsonKey(name: 'EndpointGroupArn')
  final String endpointGroupArn;

  DeleteEndpointGroupRequest({
    @_s.required this.endpointGroupArn,
  });
  Map<String, dynamic> toJson() => _$DeleteEndpointGroupRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteListenerRequest {
  /// The Amazon Resource Name (ARN) of the listener.
  @_s.JsonKey(name: 'ListenerArn')
  final String listenerArn;

  DeleteListenerRequest({
    @_s.required this.listenerArn,
  });
  Map<String, dynamic> toJson() => _$DeleteListenerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeprovisionByoipCidrRequest {
  /// The address range, in CIDR notation. The prefix must be the same prefix that
  /// you specified when you provisioned the address range.
  @_s.JsonKey(name: 'Cidr')
  final String cidr;

  DeprovisionByoipCidrRequest({
    @_s.required this.cidr,
  });
  Map<String, dynamic> toJson() => _$DeprovisionByoipCidrRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeprovisionByoipCidrResponse {
  /// Information about the address range.
  @_s.JsonKey(name: 'ByoipCidr')
  final ByoipCidr byoipCidr;

  DeprovisionByoipCidrResponse({
    this.byoipCidr,
  });
  factory DeprovisionByoipCidrResponse.fromJson(Map<String, dynamic> json) =>
      _$DeprovisionByoipCidrResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeAcceleratorAttributesRequest {
  /// The Amazon Resource Name (ARN) of the accelerator with the attributes that
  /// you want to describe.
  @_s.JsonKey(name: 'AcceleratorArn')
  final String acceleratorArn;

  DescribeAcceleratorAttributesRequest({
    @_s.required this.acceleratorArn,
  });
  Map<String, dynamic> toJson() =>
      _$DescribeAcceleratorAttributesRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAcceleratorAttributesResponse {
  /// The attributes of the accelerator.
  @_s.JsonKey(name: 'AcceleratorAttributes')
  final AcceleratorAttributes acceleratorAttributes;

  DescribeAcceleratorAttributesResponse({
    this.acceleratorAttributes,
  });
  factory DescribeAcceleratorAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAcceleratorAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeAcceleratorRequest {
  /// The Amazon Resource Name (ARN) of the accelerator to describe.
  @_s.JsonKey(name: 'AcceleratorArn')
  final String acceleratorArn;

  DescribeAcceleratorRequest({
    @_s.required this.acceleratorArn,
  });
  Map<String, dynamic> toJson() => _$DescribeAcceleratorRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAcceleratorResponse {
  /// The description of the accelerator.
  @_s.JsonKey(name: 'Accelerator')
  final Accelerator accelerator;

  DescribeAcceleratorResponse({
    this.accelerator,
  });
  factory DescribeAcceleratorResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAcceleratorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeEndpointGroupRequest {
  /// The Amazon Resource Name (ARN) of the endpoint group to describe.
  @_s.JsonKey(name: 'EndpointGroupArn')
  final String endpointGroupArn;

  DescribeEndpointGroupRequest({
    @_s.required this.endpointGroupArn,
  });
  Map<String, dynamic> toJson() => _$DescribeEndpointGroupRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEndpointGroupResponse {
  /// The description of an endpoint group.
  @_s.JsonKey(name: 'EndpointGroup')
  final EndpointGroup endpointGroup;

  DescribeEndpointGroupResponse({
    this.endpointGroup,
  });
  factory DescribeEndpointGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeListenerRequest {
  /// The Amazon Resource Name (ARN) of the listener to describe.
  @_s.JsonKey(name: 'ListenerArn')
  final String listenerArn;

  DescribeListenerRequest({
    @_s.required this.listenerArn,
  });
  Map<String, dynamic> toJson() => _$DescribeListenerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeListenerResponse {
  /// The description of a listener.
  @_s.JsonKey(name: 'Listener')
  final Listener listener;

  DescribeListenerResponse({
    this.listener,
  });
  factory DescribeListenerResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeListenerResponseFromJson(json);
}

/// A complex type for endpoints.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EndpointConfiguration {
  /// Indicates whether client IP address preservation is enabled for an
  /// Application Load Balancer endpoint. The value is true or false. The default
  /// value is true for new accelerators.
  ///
  /// If the value is set to true, the client's IP address is preserved in the
  /// <code>X-Forwarded-For</code> request header as traffic travels to
  /// applications on the Application Load Balancer endpoint fronted by the
  /// accelerator.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/preserve-client-ip-address.html">
  /// Preserve Client IP Addresses in AWS Global Accelerator</a> in the <i>AWS
  /// Global Accelerator Developer Guide</i>.
  @_s.JsonKey(name: 'ClientIPPreservationEnabled')
  final bool clientIPPreservationEnabled;

  /// An ID for the endpoint. If the endpoint is a Network Load Balancer or
  /// Application Load Balancer, this is the Amazon Resource Name (ARN) of the
  /// resource. If the endpoint is an Elastic IP address, this is the Elastic IP
  /// address allocation ID. For EC2 instances, this is the EC2 instance ID.
  ///
  /// An Application Load Balancer can be either internal or internet-facing.
  @_s.JsonKey(name: 'EndpointId')
  final String endpointId;

  /// The weight associated with the endpoint. When you add weights to endpoints,
  /// you configure AWS Global Accelerator to route traffic based on proportions
  /// that you specify. For example, you might specify endpoint weights of 4, 5,
  /// 5, and 6 (sum=20). The result is that 4/20 of your traffic, on average, is
  /// routed to the first endpoint, 5/20 is routed both to the second and third
  /// endpoints, and 6/20 is routed to the last endpoint. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoints-endpoint-weights.html">Endpoint
  /// Weights</a> in the <i>AWS Global Accelerator Developer Guide</i>.
  @_s.JsonKey(name: 'Weight')
  final int weight;

  EndpointConfiguration({
    this.clientIPPreservationEnabled,
    this.endpointId,
    this.weight,
  });
  Map<String, dynamic> toJson() => _$EndpointConfigurationToJson(this);
}

/// A complex type for an endpoint. Each endpoint group can include one or more
/// endpoints, such as load balancers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EndpointDescription {
  /// Indicates whether client IP address preservation is enabled for an
  /// Application Load Balancer endpoint. The value is true or false. The default
  /// value is true for new accelerators.
  ///
  /// If the value is set to true, the client's IP address is preserved in the
  /// <code>X-Forwarded-For</code> request header as traffic travels to
  /// applications on the Application Load Balancer endpoint fronted by the
  /// accelerator.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/introduction-how-it-works-client-ip.html">
  /// Viewing Client IP Addresses in AWS Global Accelerator</a> in the <i>AWS
  /// Global Accelerator Developer Guide</i>.
  @_s.JsonKey(name: 'ClientIPPreservationEnabled')
  final bool clientIPPreservationEnabled;

  /// An ID for the endpoint. If the endpoint is a Network Load Balancer or
  /// Application Load Balancer, this is the Amazon Resource Name (ARN) of the
  /// resource. If the endpoint is an Elastic IP address, this is the Elastic IP
  /// address allocation ID. For EC2 instances, this is the EC2 instance ID.
  ///
  /// An Application Load Balancer can be either internal or internet-facing.
  @_s.JsonKey(name: 'EndpointId')
  final String endpointId;

  /// The reason code associated with why the endpoint is not healthy. If the
  /// endpoint state is healthy, a reason code is not provided.
  ///
  /// If the endpoint state is <b>unhealthy</b>, the reason code can be one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <b>Timeout</b>: The health check requests to the endpoint are timing out
  /// before returning a status.
  /// </li>
  /// <li>
  /// <b>Failed</b>: The health check failed, for example because the endpoint
  /// response was invalid (malformed).
  /// </li>
  /// </ul>
  /// If the endpoint state is <b>initial</b>, the reason code can be one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <b>ProvisioningInProgress</b>: The endpoint is in the process of being
  /// provisioned.
  /// </li>
  /// <li>
  /// <b>InitialHealthChecking</b>: Global Accelerator is still setting up the
  /// minimum number of health checks for the endpoint that are required to
  /// determine its health status.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'HealthReason')
  final String healthReason;

  /// The health status of the endpoint.
  @_s.JsonKey(name: 'HealthState')
  final HealthState healthState;

  /// The weight associated with the endpoint. When you add weights to endpoints,
  /// you configure AWS Global Accelerator to route traffic based on proportions
  /// that you specify. For example, you might specify endpoint weights of 4, 5,
  /// 5, and 6 (sum=20). The result is that 4/20 of your traffic, on average, is
  /// routed to the first endpoint, 5/20 is routed both to the second and third
  /// endpoints, and 6/20 is routed to the last endpoint. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoints-endpoint-weights.html">Endpoint
  /// Weights</a> in the <i>AWS Global Accelerator Developer Guide</i>.
  @_s.JsonKey(name: 'Weight')
  final int weight;

  EndpointDescription({
    this.clientIPPreservationEnabled,
    this.endpointId,
    this.healthReason,
    this.healthState,
    this.weight,
  });
  factory EndpointDescription.fromJson(Map<String, dynamic> json) =>
      _$EndpointDescriptionFromJson(json);
}

/// A complex type for the endpoint group. An AWS Region can have only one
/// endpoint group for a specific listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EndpointGroup {
  /// The list of endpoint objects.
  @_s.JsonKey(name: 'EndpointDescriptions')
  final List<EndpointDescription> endpointDescriptions;

  /// The Amazon Resource Name (ARN) of the endpoint group.
  @_s.JsonKey(name: 'EndpointGroupArn')
  final String endpointGroupArn;

  /// The AWS Region that this endpoint group belongs.
  @_s.JsonKey(name: 'EndpointGroupRegion')
  final String endpointGroupRegion;

  /// The time—10 seconds or 30 seconds—between health checks for each endpoint.
  /// The default value is 30.
  @_s.JsonKey(name: 'HealthCheckIntervalSeconds')
  final int healthCheckIntervalSeconds;

  /// If the protocol is HTTP/S, then this value provides the ping path that
  /// Global Accelerator uses for the destination on the endpoints for health
  /// checks. The default is slash (/).
  @_s.JsonKey(name: 'HealthCheckPath')
  final String healthCheckPath;

  /// The port that Global Accelerator uses to perform health checks on endpoints
  /// that are part of this endpoint group.
  ///
  /// The default port is the port for the listener that this endpoint group is
  /// associated with. If the listener port is a list, Global Accelerator uses the
  /// first specified port in the list of ports.
  @_s.JsonKey(name: 'HealthCheckPort')
  final int healthCheckPort;

  /// The protocol that Global Accelerator uses to perform health checks on
  /// endpoints that are part of this endpoint group. The default value is TCP.
  @_s.JsonKey(name: 'HealthCheckProtocol')
  final HealthCheckProtocol healthCheckProtocol;

  /// The number of consecutive health checks required to set the state of a
  /// healthy endpoint to unhealthy, or to set an unhealthy endpoint to healthy.
  /// The default value is 3.
  @_s.JsonKey(name: 'ThresholdCount')
  final int thresholdCount;

  /// The percentage of traffic to send to an AWS Region. Additional traffic is
  /// distributed to other endpoint groups for this listener.
  ///
  /// Use this action to increase (dial up) or decrease (dial down) traffic to a
  /// specific Region. The percentage is applied to the traffic that would
  /// otherwise have been routed to the Region based on optimal routing.
  ///
  /// The default value is 100.
  @_s.JsonKey(name: 'TrafficDialPercentage')
  final double trafficDialPercentage;

  EndpointGroup({
    this.endpointDescriptions,
    this.endpointGroupArn,
    this.endpointGroupRegion,
    this.healthCheckIntervalSeconds,
    this.healthCheckPath,
    this.healthCheckPort,
    this.healthCheckProtocol,
    this.thresholdCount,
    this.trafficDialPercentage,
  });
  factory EndpointGroup.fromJson(Map<String, dynamic> json) =>
      _$EndpointGroupFromJson(json);
}

enum HealthCheckProtocol {
  @_s.JsonValue('TCP')
  tcp,
  @_s.JsonValue('HTTP')
  http,
  @_s.JsonValue('HTTPS')
  https,
}

enum HealthState {
  @_s.JsonValue('INITIAL')
  initial,
  @_s.JsonValue('HEALTHY')
  healthy,
  @_s.JsonValue('UNHEALTHY')
  unhealthy,
}

enum IpAddressType {
  @_s.JsonValue('IPV4')
  ipv4,
}

/// A complex type for the set of IP addresses for an accelerator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IpSet {
  /// The array of IP addresses in the IP address set. An IP address set can have
  /// a maximum of two IP addresses.
  @_s.JsonKey(name: 'IpAddresses')
  final List<String> ipAddresses;

  /// The types of IP addresses included in this IP set.
  @_s.JsonKey(name: 'IpFamily')
  final String ipFamily;

  IpSet({
    this.ipAddresses,
    this.ipFamily,
  });
  factory IpSet.fromJson(Map<String, dynamic> json) => _$IpSetFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListAcceleratorsRequest {
  /// The number of Global Accelerator objects that you want to return with this
  /// call. The default value is 10.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAcceleratorsRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListAcceleratorsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAcceleratorsResponse {
  /// The list of accelerators for a customer account.
  @_s.JsonKey(name: 'Accelerators')
  final List<Accelerator> accelerators;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAcceleratorsResponse({
    this.accelerators,
    this.nextToken,
  });
  factory ListAcceleratorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAcceleratorsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListByoipCidrsRequest {
  /// The maximum number of results to return with a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The token for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListByoipCidrsRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListByoipCidrsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListByoipCidrsResponse {
  /// Information about your address ranges.
  @_s.JsonKey(name: 'ByoipCidrs')
  final List<ByoipCidr> byoipCidrs;

  /// The token for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListByoipCidrsResponse({
    this.byoipCidrs,
    this.nextToken,
  });
  factory ListByoipCidrsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListByoipCidrsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListEndpointGroupsRequest {
  /// The Amazon Resource Name (ARN) of the listener.
  @_s.JsonKey(name: 'ListenerArn')
  final String listenerArn;

  /// The number of endpoint group objects that you want to return with this call.
  /// The default value is 10.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEndpointGroupsRequest({
    @_s.required this.listenerArn,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListEndpointGroupsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEndpointGroupsResponse {
  /// The list of the endpoint groups associated with a listener.
  @_s.JsonKey(name: 'EndpointGroups')
  final List<EndpointGroup> endpointGroups;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEndpointGroupsResponse({
    this.endpointGroups,
    this.nextToken,
  });
  factory ListEndpointGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEndpointGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListListenersRequest {
  /// The Amazon Resource Name (ARN) of the accelerator for which you want to list
  /// listener objects.
  @_s.JsonKey(name: 'AcceleratorArn')
  final String acceleratorArn;

  /// The number of listener objects that you want to return with this call. The
  /// default value is 10.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListListenersRequest({
    @_s.required this.acceleratorArn,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListListenersRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListListenersResponse {
  /// The list of listeners for an accelerator.
  @_s.JsonKey(name: 'Listeners')
  final List<Listener> listeners;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListListenersResponse({
    this.listeners,
    this.nextToken,
  });
  factory ListListenersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListListenersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListTagsForResourceRequest {
  /// The Amazon Resource Name (ARN) of the accelerator to list tags for. An ARN
  /// uniquely identifies an accelerator.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  ListTagsForResourceRequest({
    @_s.required this.resourceArn,
  });
  Map<String, dynamic> toJson() => _$ListTagsForResourceRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Root level tag for the Tags parameters.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// A complex type for a listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Listener {
  /// Client affinity lets you direct all requests from a user to the same
  /// endpoint, if you have stateful applications, regardless of the port and
  /// protocol of the client request. Clienty affinity gives you control over
  /// whether to always route each client to the same specific endpoint.
  ///
  /// AWS Global Accelerator uses a consistent-flow hashing algorithm to choose
  /// the optimal endpoint for a connection. If client affinity is
  /// <code>NONE</code>, Global Accelerator uses the "five-tuple" (5-tuple)
  /// properties—source IP address, source port, destination IP address,
  /// destination port, and protocol—to select the hash value, and then chooses
  /// the best endpoint. However, with this setting, if someone uses different
  /// ports to connect to Global Accelerator, their connections might not be
  /// always routed to the same endpoint because the hash value changes.
  ///
  /// If you want a given client to always be routed to the same endpoint, set
  /// client affinity to <code>SOURCE_IP</code> instead. When you use the
  /// <code>SOURCE_IP</code> setting, Global Accelerator uses the "two-tuple"
  /// (2-tuple) properties— source (client) IP address and destination IP
  /// address—to select the hash value.
  ///
  /// The default value is <code>NONE</code>.
  @_s.JsonKey(name: 'ClientAffinity')
  final ClientAffinity clientAffinity;

  /// The Amazon Resource Name (ARN) of the listener.
  @_s.JsonKey(name: 'ListenerArn')
  final String listenerArn;

  /// The list of port ranges for the connections from clients to the accelerator.
  @_s.JsonKey(name: 'PortRanges')
  final List<PortRange> portRanges;

  /// The protocol for the connections from clients to the accelerator.
  @_s.JsonKey(name: 'Protocol')
  final Protocol protocol;

  Listener({
    this.clientAffinity,
    this.listenerArn,
    this.portRanges,
    this.protocol,
  });
  factory Listener.fromJson(Map<String, dynamic> json) =>
      _$ListenerFromJson(json);
}

/// A complex type for a range of ports for a listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortRange {
  /// The first port in the range of ports, inclusive.
  @_s.JsonKey(name: 'FromPort')
  final int fromPort;

  /// The last port in the range of ports, inclusive.
  @_s.JsonKey(name: 'ToPort')
  final int toPort;

  PortRange({
    this.fromPort,
    this.toPort,
  });
  factory PortRange.fromJson(Map<String, dynamic> json) =>
      _$PortRangeFromJson(json);

  Map<String, dynamic> toJson() => _$PortRangeToJson(this);
}

enum Protocol {
  @_s.JsonValue('TCP')
  tcp,
  @_s.JsonValue('UDP')
  udp,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ProvisionByoipCidrRequest {
  /// The public IPv4 address range, in CIDR notation. The most specific IP prefix
  /// that you can specify is /24. The address range cannot overlap with another
  /// address range that you've brought to this or another Region.
  @_s.JsonKey(name: 'Cidr')
  final String cidr;

  /// A signed document that proves that you are authorized to bring the specified
  /// IP address range to Amazon using BYOIP.
  @_s.JsonKey(name: 'CidrAuthorizationContext')
  final CidrAuthorizationContext cidrAuthorizationContext;

  ProvisionByoipCidrRequest({
    @_s.required this.cidr,
    @_s.required this.cidrAuthorizationContext,
  });
  Map<String, dynamic> toJson() => _$ProvisionByoipCidrRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisionByoipCidrResponse {
  /// Information about the address range.
  @_s.JsonKey(name: 'ByoipCidr')
  final ByoipCidr byoipCidr;

  ProvisionByoipCidrResponse({
    this.byoipCidr,
  });
  factory ProvisionByoipCidrResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvisionByoipCidrResponseFromJson(json);
}

/// A complex type that contains a <code>Tag</code> key and <code>Tag</code>
/// value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A string that contains a <code>Tag</code> key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// A string that contains a <code>Tag</code> value.
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
    createFactory: false,
    createToJson: true)
class TagResourceRequest {
  /// The Amazon Resource Name (ARN) of the Global Accelerator resource to add
  /// tags to. An ARN uniquely identifies a resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The tags to add to a resource. A tag consists of a key and a value that you
  /// define.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  TagResourceRequest({
    @_s.required this.resourceArn,
    @_s.required this.tags,
  });
  Map<String, dynamic> toJson() => _$TagResourceRequestToJson(this);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UntagResourceRequest {
  /// The Amazon Resource Name (ARN) of the Global Accelerator resource to remove
  /// tags from. An ARN uniquely identifies a resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The tag key pairs that you want to remove from the specified resources.
  @_s.JsonKey(name: 'TagKeys')
  final List<String> tagKeys;

  UntagResourceRequest({
    @_s.required this.resourceArn,
    @_s.required this.tagKeys,
  });
  Map<String, dynamic> toJson() => _$UntagResourceRequestToJson(this);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateAcceleratorAttributesRequest {
  /// The Amazon Resource Name (ARN) of the accelerator that you want to update.
  @_s.JsonKey(name: 'AcceleratorArn')
  final String acceleratorArn;

  /// Update whether flow logs are enabled. The default value is false. If the
  /// value is true, <code>FlowLogsS3Bucket</code> and
  /// <code>FlowLogsS3Prefix</code> must be specified.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/monitoring-global-accelerator.flow-logs.html">Flow
  /// Logs</a> in the <i>AWS Global Accelerator Developer Guide</i>.
  @_s.JsonKey(name: 'FlowLogsEnabled')
  final bool flowLogsEnabled;

  /// The name of the Amazon S3 bucket for the flow logs. Attribute is required if
  /// <code>FlowLogsEnabled</code> is <code>true</code>. The bucket must exist and
  /// have a bucket policy that grants AWS Global Accelerator permission to write
  /// to the bucket.
  @_s.JsonKey(name: 'FlowLogsS3Bucket')
  final String flowLogsS3Bucket;

  /// Update the prefix for the location in the Amazon S3 bucket for the flow
  /// logs. Attribute is required if <code>FlowLogsEnabled</code> is
  /// <code>true</code>.
  ///
  /// If you don’t specify a prefix, the flow logs are stored in the root of the
  /// bucket. If you specify slash (/) for the S3 bucket prefix, the log file
  /// bucket folder structure will include a double slash (//), like the
  /// following:
  ///
  /// s3-bucket_name//AWSLogs/aws_account_id
  @_s.JsonKey(name: 'FlowLogsS3Prefix')
  final String flowLogsS3Prefix;

  UpdateAcceleratorAttributesRequest({
    @_s.required this.acceleratorArn,
    this.flowLogsEnabled,
    this.flowLogsS3Bucket,
    this.flowLogsS3Prefix,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateAcceleratorAttributesRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAcceleratorAttributesResponse {
  /// Updated attributes for the accelerator.
  @_s.JsonKey(name: 'AcceleratorAttributes')
  final AcceleratorAttributes acceleratorAttributes;

  UpdateAcceleratorAttributesResponse({
    this.acceleratorAttributes,
  });
  factory UpdateAcceleratorAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateAcceleratorAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateAcceleratorRequest {
  /// The Amazon Resource Name (ARN) of the accelerator to update.
  @_s.JsonKey(name: 'AcceleratorArn')
  final String acceleratorArn;

  /// Indicates whether an accelerator is enabled. The value is true or false. The
  /// default value is true.
  ///
  /// If the value is set to true, the accelerator cannot be deleted. If set to
  /// false, the accelerator can be deleted.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The value for the address type must be IPv4.
  @_s.JsonKey(name: 'IpAddressType')
  final IpAddressType ipAddressType;

  /// The name of the accelerator. The name can have a maximum of 32 characters,
  /// must contain only alphanumeric characters or hyphens (-), and must not begin
  /// or end with a hyphen.
  @_s.JsonKey(name: 'Name')
  final String name;

  UpdateAcceleratorRequest({
    @_s.required this.acceleratorArn,
    this.enabled,
    this.ipAddressType,
    this.name,
  });
  Map<String, dynamic> toJson() => _$UpdateAcceleratorRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAcceleratorResponse {
  /// Information about the updated accelerator.
  @_s.JsonKey(name: 'Accelerator')
  final Accelerator accelerator;

  UpdateAcceleratorResponse({
    this.accelerator,
  });
  factory UpdateAcceleratorResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAcceleratorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateEndpointGroupRequest {
  /// The Amazon Resource Name (ARN) of the endpoint group.
  @_s.JsonKey(name: 'EndpointGroupArn')
  final String endpointGroupArn;

  /// The list of endpoint objects.
  @_s.JsonKey(name: 'EndpointConfigurations')
  final List<EndpointConfiguration> endpointConfigurations;

  /// The time—10 seconds or 30 seconds—between each health check for an endpoint.
  /// The default value is 30.
  @_s.JsonKey(name: 'HealthCheckIntervalSeconds')
  final int healthCheckIntervalSeconds;

  /// If the protocol is HTTP/S, then this specifies the path that is the
  /// destination for health check targets. The default value is slash (/).
  @_s.JsonKey(name: 'HealthCheckPath')
  final String healthCheckPath;

  /// The port that AWS Global Accelerator uses to check the health of endpoints
  /// that are part of this endpoint group. The default port is the listener port
  /// that this endpoint group is associated with. If the listener port is a list
  /// of ports, Global Accelerator uses the first port in the list.
  @_s.JsonKey(name: 'HealthCheckPort')
  final int healthCheckPort;

  /// The protocol that AWS Global Accelerator uses to check the health of
  /// endpoints that are part of this endpoint group. The default value is TCP.
  @_s.JsonKey(name: 'HealthCheckProtocol')
  final HealthCheckProtocol healthCheckProtocol;

  /// The number of consecutive health checks required to set the state of a
  /// healthy endpoint to unhealthy, or to set an unhealthy endpoint to healthy.
  /// The default value is 3.
  @_s.JsonKey(name: 'ThresholdCount')
  final int thresholdCount;

  /// The percentage of traffic to send to an AWS Region. Additional traffic is
  /// distributed to other endpoint groups for this listener.
  ///
  /// Use this action to increase (dial up) or decrease (dial down) traffic to a
  /// specific Region. The percentage is applied to the traffic that would
  /// otherwise have been routed to the Region based on optimal routing.
  ///
  /// The default value is 100.
  @_s.JsonKey(name: 'TrafficDialPercentage')
  final double trafficDialPercentage;

  UpdateEndpointGroupRequest({
    @_s.required this.endpointGroupArn,
    this.endpointConfigurations,
    this.healthCheckIntervalSeconds,
    this.healthCheckPath,
    this.healthCheckPort,
    this.healthCheckProtocol,
    this.thresholdCount,
    this.trafficDialPercentage,
  });
  Map<String, dynamic> toJson() => _$UpdateEndpointGroupRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEndpointGroupResponse {
  /// The information about the endpoint group that was updated.
  @_s.JsonKey(name: 'EndpointGroup')
  final EndpointGroup endpointGroup;

  UpdateEndpointGroupResponse({
    this.endpointGroup,
  });
  factory UpdateEndpointGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateEndpointGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateListenerRequest {
  /// The Amazon Resource Name (ARN) of the listener to update.
  @_s.JsonKey(name: 'ListenerArn')
  final String listenerArn;

  /// Client affinity lets you direct all requests from a user to the same
  /// endpoint, if you have stateful applications, regardless of the port and
  /// protocol of the client request. Clienty affinity gives you control over
  /// whether to always route each client to the same specific endpoint.
  ///
  /// AWS Global Accelerator uses a consistent-flow hashing algorithm to choose
  /// the optimal endpoint for a connection. If client affinity is
  /// <code>NONE</code>, Global Accelerator uses the "five-tuple" (5-tuple)
  /// properties—source IP address, source port, destination IP address,
  /// destination port, and protocol—to select the hash value, and then chooses
  /// the best endpoint. However, with this setting, if someone uses different
  /// ports to connect to Global Accelerator, their connections might not be
  /// always routed to the same endpoint because the hash value changes.
  ///
  /// If you want a given client to always be routed to the same endpoint, set
  /// client affinity to <code>SOURCE_IP</code> instead. When you use the
  /// <code>SOURCE_IP</code> setting, Global Accelerator uses the "two-tuple"
  /// (2-tuple) properties— source (client) IP address and destination IP
  /// address—to select the hash value.
  ///
  /// The default value is <code>NONE</code>.
  @_s.JsonKey(name: 'ClientAffinity')
  final ClientAffinity clientAffinity;

  /// The updated list of port ranges for the connections from clients to the
  /// accelerator.
  @_s.JsonKey(name: 'PortRanges')
  final List<PortRange> portRanges;

  /// The updated protocol for the connections from clients to the accelerator.
  @_s.JsonKey(name: 'Protocol')
  final Protocol protocol;

  UpdateListenerRequest({
    @_s.required this.listenerArn,
    this.clientAffinity,
    this.portRanges,
    this.protocol,
  });
  Map<String, dynamic> toJson() => _$UpdateListenerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateListenerResponse {
  /// Information for the updated listener.
  @_s.JsonKey(name: 'Listener')
  final Listener listener;

  UpdateListenerResponse({
    this.listener,
  });
  factory UpdateListenerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateListenerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WithdrawByoipCidrRequest {
  /// The address range, in CIDR notation.
  @_s.JsonKey(name: 'Cidr')
  final String cidr;

  WithdrawByoipCidrRequest({
    @_s.required this.cidr,
  });
  Map<String, dynamic> toJson() => _$WithdrawByoipCidrRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WithdrawByoipCidrResponse {
  /// Information about the address pool.
  @_s.JsonKey(name: 'ByoipCidr')
  final ByoipCidr byoipCidr;

  WithdrawByoipCidrResponse({
    this.byoipCidr,
  });
  factory WithdrawByoipCidrResponse.fromJson(Map<String, dynamic> json) =>
      _$WithdrawByoipCidrResponseFromJson(json);
}

class AcceleratorNotDisabledException extends _s.GenericAwsException {
  AcceleratorNotDisabledException({String type, String message})
      : super(
            type: type,
            code: 'AcceleratorNotDisabledException',
            message: message);
}

class AcceleratorNotFoundException extends _s.GenericAwsException {
  AcceleratorNotFoundException({String type, String message})
      : super(
            type: type, code: 'AcceleratorNotFoundException', message: message);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AssociatedEndpointGroupFoundException extends _s.GenericAwsException {
  AssociatedEndpointGroupFoundException({String type, String message})
      : super(
            type: type,
            code: 'AssociatedEndpointGroupFoundException',
            message: message);
}

class AssociatedListenerFoundException extends _s.GenericAwsException {
  AssociatedListenerFoundException({String type, String message})
      : super(
            type: type,
            code: 'AssociatedListenerFoundException',
            message: message);
}

class ByoipCidrNotFoundException extends _s.GenericAwsException {
  ByoipCidrNotFoundException({String type, String message})
      : super(type: type, code: 'ByoipCidrNotFoundException', message: message);
}

class EndpointGroupAlreadyExistsException extends _s.GenericAwsException {
  EndpointGroupAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'EndpointGroupAlreadyExistsException',
            message: message);
}

class EndpointGroupNotFoundException extends _s.GenericAwsException {
  EndpointGroupNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'EndpointGroupNotFoundException',
            message: message);
}

class IncorrectCidrStateException extends _s.GenericAwsException {
  IncorrectCidrStateException({String type, String message})
      : super(
            type: type, code: 'IncorrectCidrStateException', message: message);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String type, String message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String type, String message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidPortRangeException extends _s.GenericAwsException {
  InvalidPortRangeException({String type, String message})
      : super(type: type, code: 'InvalidPortRangeException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ListenerNotFoundException extends _s.GenericAwsException {
  ListenerNotFoundException({String type, String message})
      : super(type: type, code: 'ListenerNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AcceleratorNotDisabledException': (type, message) =>
      AcceleratorNotDisabledException(type: type, message: message),
  'AcceleratorNotFoundException': (type, message) =>
      AcceleratorNotFoundException(type: type, message: message),
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AssociatedEndpointGroupFoundException': (type, message) =>
      AssociatedEndpointGroupFoundException(type: type, message: message),
  'AssociatedListenerFoundException': (type, message) =>
      AssociatedListenerFoundException(type: type, message: message),
  'ByoipCidrNotFoundException': (type, message) =>
      ByoipCidrNotFoundException(type: type, message: message),
  'EndpointGroupAlreadyExistsException': (type, message) =>
      EndpointGroupAlreadyExistsException(type: type, message: message),
  'EndpointGroupNotFoundException': (type, message) =>
      EndpointGroupNotFoundException(type: type, message: message),
  'IncorrectCidrStateException': (type, message) =>
      IncorrectCidrStateException(type: type, message: message),
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidPortRangeException': (type, message) =>
      InvalidPortRangeException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ListenerNotFoundException': (type, message) =>
      ListenerNotFoundException(type: type, message: message),
};
