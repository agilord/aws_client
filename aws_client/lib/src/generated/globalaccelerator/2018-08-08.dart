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

part '2018-08-08.g.dart';

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
          service: _s.ServiceMetadata(
            endpointPrefix: 'globalaccelerator',
            signingName: 'globalaccelerator',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associate a virtual private cloud (VPC) subnet endpoint with your custom
  /// routing accelerator.
  ///
  /// The listener port range must be large enough to support the number of IP
  /// addresses that can be specified in your subnet. The number of ports
  /// required is: subnet size times the number of ports per destination EC2
  /// instances. For example, a subnet defined as /24 requires a listener port
  /// range of at least 255 ports.
  ///
  /// Note: You must have enough remaining listener ports available to map to
  /// the subnet ports, or the call will fail with a LimitExceededException.
  ///
  /// By default, all destinations in a subnet in a custom routing accelerator
  /// cannot receive traffic. To enable all destinations to receive traffic, or
  /// to specify individual port mappings that can receive traffic, see the <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/api/API_AllowCustomRoutingTraffic.html">
  /// AllowCustomRoutingTraffic</a> operation.
  ///
  /// May throw [EndpointAlreadyExistsException].
  /// May throw [EndpointGroupNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [endpointConfigurations] :
  /// The list of endpoint objects to add to a custom routing accelerator.
  ///
  /// Parameter [endpointGroupArn] :
  /// The Amazon Resource Name (ARN) of the endpoint group for the custom
  /// routing endpoint.
  Future<AddCustomRoutingEndpointsResponse> addCustomRoutingEndpoints({
    @_s.required
        List<CustomRoutingEndpointConfiguration> endpointConfigurations,
    @_s.required String endpointGroupArn,
  }) async {
    ArgumentError.checkNotNull(
        endpointConfigurations, 'endpointConfigurations');
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
      'X-Amz-Target': 'GlobalAccelerator_V20180706.AddCustomRoutingEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointConfigurations': endpointConfigurations,
        'EndpointGroupArn': endpointGroupArn,
      },
    );

    return AddCustomRoutingEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Advertises an IPv4 address range that is provisioned for use with your AWS
  /// resources through bring your own IP addresses (BYOIP). It can take a few
  /// minutes before traffic to the specified addresses starts routing to AWS
  /// because of propagation delays.
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
      payload: {
        'Cidr': cidr,
      },
    );

    return AdvertiseByoipCidrResponse.fromJson(jsonResponse.body);
  }

  /// Specify the Amazon EC2 instance (destination) IP addresses and ports for a
  /// VPC subnet endpoint that can receive traffic for a custom routing
  /// accelerator. You can allow traffic to all destinations in the subnet
  /// endpoint, or allow traffic to a specified list of destination IP addresses
  /// and ports in the subnet. Note that you cannot specify IP addresses or
  /// ports outside of the range that you configured for the endpoint group.
  ///
  /// After you make changes, you can verify that the updates are complete by
  /// checking the status of your accelerator: the status changes from
  /// IN_PROGRESS to DEPLOYED.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [endpointGroupArn] :
  /// The Amazon Resource Name (ARN) of the endpoint group.
  ///
  /// Parameter [endpointId] :
  /// An ID for the endpoint. For custom routing accelerators, this is the
  /// virtual private cloud (VPC) subnet ID.
  ///
  /// Parameter [allowAllTrafficToEndpoint] :
  /// Indicates whether all destination IP addresses and ports for a specified
  /// VPC subnet endpoint can receive traffic from a custom routing accelerator.
  /// The value is TRUE or FALSE.
  ///
  /// When set to TRUE, <i>all</i> destinations in the custom routing VPC subnet
  /// can receive traffic. Note that you cannot specify destination IP addresses
  /// and ports when the value is set to TRUE.
  ///
  /// When set to FALSE (or not specified), you <i>must</i> specify a list of
  /// destination IP addresses that are allowed to receive traffic. A list of
  /// ports is optional. If you don't specify a list of ports, the ports that
  /// can accept traffic is the same as the ports configured for the endpoint
  /// group.
  ///
  /// The default value is FALSE.
  ///
  /// Parameter [destinationAddresses] :
  /// A list of specific Amazon EC2 instance IP addresses (destination
  /// addresses) in a subnet that you want to allow to receive traffic. The IP
  /// addresses must be a subset of the IP addresses that you specified for the
  /// endpoint group.
  ///
  /// <code>DestinationAddresses</code> is required if
  /// <code>AllowAllTrafficToEndpoint</code> is <code>FALSE</code> or is not
  /// specified.
  ///
  /// Parameter [destinationPorts] :
  /// A list of specific Amazon EC2 instance ports (destination ports) that you
  /// want to allow to receive traffic.
  Future<void> allowCustomRoutingTraffic({
    @_s.required String endpointGroupArn,
    @_s.required String endpointId,
    bool allowAllTrafficToEndpoint,
    List<String> destinationAddresses,
    List<int> destinationPorts,
  }) async {
    ArgumentError.checkNotNull(endpointGroupArn, 'endpointGroupArn');
    _s.validateStringLength(
      'endpointGroupArn',
      endpointGroupArn,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(endpointId, 'endpointId');
    _s.validateStringLength(
      'endpointId',
      endpointId,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.AllowCustomRoutingTraffic'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointGroupArn': endpointGroupArn,
        'EndpointId': endpointId,
        if (allowAllTrafficToEndpoint != null)
          'AllowAllTrafficToEndpoint': allowAllTrafficToEndpoint,
        if (destinationAddresses != null)
          'DestinationAddresses': destinationAddresses,
        if (destinationPorts != null) 'DestinationPorts': destinationPorts,
      },
    );
  }

  /// Create an accelerator. An accelerator includes one or more listeners that
  /// process inbound connections and direct traffic to one or more endpoint
  /// groups, each of which includes endpoints, such as Network Load Balancers.
  /// <important>
  /// Global Accelerator is a global service that supports endpoints in multiple
  /// AWS Regions but you must specify the US West (Oregon) Region to create or
  /// update accelerators.
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
  /// Optionally, if you've added your own IP address pool to Global Accelerator
  /// (BYOIP), you can choose IP addresses from your own pool to use for the
  /// accelerator's static IP addresses when you create an accelerator. You can
  /// specify one or two addresses, separated by a comma. Do not include the /32
  /// suffix.
  ///
  /// Only one IP address from each of your IP address ranges can be used for
  /// each accelerator. If you specify only one IP address from your IP address
  /// range, Global Accelerator assigns a second static IP address for the
  /// accelerator from the AWS IP address pool.
  ///
  /// Note that you can't update IP addresses for an existing accelerator. To
  /// change them, you must create a new accelerator with the new addresses.
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
      payload: {
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'Name': name,
        if (enabled != null) 'Enabled': enabled,
        if (ipAddressType != null) 'IpAddressType': ipAddressType.toValue(),
        if (ipAddresses != null) 'IpAddresses': ipAddresses,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAcceleratorResponse.fromJson(jsonResponse.body);
  }

  /// Create a custom routing accelerator. A custom routing accelerator directs
  /// traffic to one of possibly thousands of Amazon EC2 instance destinations
  /// running in a single or multiple virtual private clouds (VPC) subnet
  /// endpoints.
  ///
  /// Be aware that, by default, all destination EC2 instances in a VPC subnet
  /// endpoint cannot receive traffic. To enable all destinations to receive
  /// traffic, or to specify individual port mappings that can receive traffic,
  /// see the <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/api/API_AllowCustomRoutingTraffic.html">
  /// AllowCustomRoutingTraffic</a> operation.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency—that is, the uniqueness—of the request.
  ///
  /// Parameter [name] :
  /// The name of a custom routing accelerator. The name can have a maximum of
  /// 64 characters, must contain only alphanumeric characters or hyphens (-),
  /// and must not begin or end with a hyphen.
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
  /// Parameter [tags] :
  /// Create tags for an accelerator.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html">Tagging
  /// in AWS Global Accelerator</a> in the <i>AWS Global Accelerator Developer
  /// Guide</i>.
  Future<CreateCustomRoutingAcceleratorResponse>
      createCustomRoutingAccelerator({
    @_s.required String idempotencyToken,
    @_s.required String name,
    bool enabled,
    IpAddressType ipAddressType,
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
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.CreateCustomRoutingAccelerator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'Name': name,
        if (enabled != null) 'Enabled': enabled,
        if (ipAddressType != null) 'IpAddressType': ipAddressType.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateCustomRoutingAcceleratorResponse.fromJson(jsonResponse.body);
  }

  /// Create an endpoint group for the specified listener for a custom routing
  /// accelerator. An endpoint group is a collection of endpoints in one AWS
  /// Region.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [EndpointGroupAlreadyExistsException].
  /// May throw [ListenerNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidPortRangeException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [destinationConfigurations] :
  /// Sets the port range and protocol for all endpoints (virtual private cloud
  /// subnets) in a custom routing endpoint group to accept client traffic on.
  ///
  /// Parameter [endpointGroupRegion] :
  /// The AWS Region where the endpoint group is located. A listener can have
  /// only one endpoint group in a specific Region.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency—that is, the uniqueness—of the request.
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener for a custom routing
  /// endpoint.
  Future<CreateCustomRoutingEndpointGroupResponse>
      createCustomRoutingEndpointGroup({
    @_s.required
        List<CustomRoutingDestinationConfiguration> destinationConfigurations,
    @_s.required String endpointGroupRegion,
    @_s.required String idempotencyToken,
    @_s.required String listenerArn,
  }) async {
    ArgumentError.checkNotNull(
        destinationConfigurations, 'destinationConfigurations');
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.CreateCustomRoutingEndpointGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationConfigurations': destinationConfigurations,
        'EndpointGroupRegion': endpointGroupRegion,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'ListenerArn': listenerArn,
      },
    );

    return CreateCustomRoutingEndpointGroupResponse.fromJson(jsonResponse.body);
  }

  /// Create a listener to process inbound connections from clients to a custom
  /// routing accelerator. Connections arrive to assigned static IP addresses on
  /// the port range that you specify.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InvalidPortRangeException].
  /// May throw [InternalServiceErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the accelerator for a custom routing
  /// listener.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency—that is, the uniqueness—of the request.
  ///
  /// Parameter [portRanges] :
  /// The port range to support for connections from clients to your
  /// accelerator.
  ///
  /// Separately, you set port ranges for endpoints. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/about-custom-routing-endpoints.html">About
  /// endpoints for custom routing accelerators</a>.
  Future<CreateCustomRoutingListenerResponse> createCustomRoutingListener({
    @_s.required String acceleratorArn,
    @_s.required String idempotencyToken,
    @_s.required List<PortRange> portRanges,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.CreateCustomRoutingListener'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceleratorArn': acceleratorArn,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'PortRanges': portRanges,
      },
    );

    return CreateCustomRoutingListenerResponse.fromJson(jsonResponse.body);
  }

  /// Create an endpoint group for the specified listener. An endpoint group is
  /// a collection of endpoints in one AWS Region. A resource must be valid and
  /// active when you add it as an endpoint.
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
  /// The AWS Region where the endpoint group is located. A listener can have
  /// only one endpoint group in a specific Region.
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
  /// Parameter [portOverrides] :
  /// Override specific listener ports used to route traffic to endpoints that
  /// are part of this endpoint group. For example, you can create a port
  /// override in which the listener receives user traffic on ports 80 and 443,
  /// but your accelerator routes that traffic to ports 1080 and 1443,
  /// respectively, on the endpoints.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoint-groups-port-override.html">
  /// Port overrides</a> in the <i>AWS Global Accelerator Developer Guide</i>.
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
    List<PortOverride> portOverrides,
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
    _s.validateStringPattern(
      'healthCheckPath',
      healthCheckPath,
      r'''^/[-a-zA-Z0-9@:%_\\+.~#?&/=]*$''',
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
      payload: {
        'EndpointGroupRegion': endpointGroupRegion,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'ListenerArn': listenerArn,
        if (endpointConfigurations != null)
          'EndpointConfigurations': endpointConfigurations,
        if (healthCheckIntervalSeconds != null)
          'HealthCheckIntervalSeconds': healthCheckIntervalSeconds,
        if (healthCheckPath != null) 'HealthCheckPath': healthCheckPath,
        if (healthCheckPort != null) 'HealthCheckPort': healthCheckPort,
        if (healthCheckProtocol != null)
          'HealthCheckProtocol': healthCheckProtocol.toValue(),
        if (portOverrides != null) 'PortOverrides': portOverrides,
        if (thresholdCount != null) 'ThresholdCount': thresholdCount,
        if (trafficDialPercentage != null)
          'TrafficDialPercentage': trafficDialPercentage,
      },
    );

    return CreateEndpointGroupResponse.fromJson(jsonResponse.body);
  }

  /// Create a listener to process inbound connections from clients to an
  /// accelerator. Connections arrive to assigned static IP addresses on a port,
  /// port range, or list of port ranges that you specify.
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
  /// protocol of the client request. Client affinity gives you control over
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
      payload: {
        'AcceleratorArn': acceleratorArn,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        'PortRanges': portRanges,
        'Protocol': protocol?.toValue() ?? '',
        if (clientAffinity != null) 'ClientAffinity': clientAffinity.toValue(),
      },
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
      payload: {
        'AcceleratorArn': acceleratorArn,
      },
    );
  }

  /// Delete a custom routing accelerator. Before you can delete an accelerator,
  /// you must disable it and remove all dependent resources (listeners and
  /// endpoint groups). To disable the accelerator, update the accelerator to
  /// set <code>Enabled</code> to false.
  /// <important>
  /// When you create a custom routing accelerator, by default, Global
  /// Accelerator provides you with a set of two static IP addresses.
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
  /// The Amazon Resource Name (ARN) of the custom routing accelerator to
  /// delete.
  Future<void> deleteCustomRoutingAccelerator({
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
          'GlobalAccelerator_V20180706.DeleteCustomRoutingAccelerator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceleratorArn': acceleratorArn,
      },
    );
  }

  /// Delete an endpoint group from a listener for a custom routing accelerator.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [EndpointGroupNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [endpointGroupArn] :
  /// The Amazon Resource Name (ARN) of the endpoint group to delete.
  Future<void> deleteCustomRoutingEndpointGroup({
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
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.DeleteCustomRoutingEndpointGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointGroupArn': endpointGroupArn,
      },
    );
  }

  /// Delete a listener for a custom routing accelerator.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ListenerNotFoundException].
  /// May throw [AssociatedEndpointGroupFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener to delete.
  Future<void> deleteCustomRoutingListener({
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
      'X-Amz-Target': 'GlobalAccelerator_V20180706.DeleteCustomRoutingListener'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ListenerArn': listenerArn,
      },
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
      payload: {
        'EndpointGroupArn': endpointGroupArn,
      },
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
      payload: {
        'ListenerArn': listenerArn,
      },
    );
  }

  /// Specify the Amazon EC2 instance (destination) IP addresses and ports for a
  /// VPC subnet endpoint that cannot receive traffic for a custom routing
  /// accelerator. You can deny traffic to all destinations in the VPC endpoint,
  /// or deny traffic to a specified list of destination IP addresses and ports.
  /// Note that you cannot specify IP addresses or ports outside of the range
  /// that you configured for the endpoint group.
  ///
  /// After you make changes, you can verify that the updates are complete by
  /// checking the status of your accelerator: the status changes from
  /// IN_PROGRESS to DEPLOYED.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [endpointGroupArn] :
  /// The Amazon Resource Name (ARN) of the endpoint group.
  ///
  /// Parameter [endpointId] :
  /// An ID for the endpoint. For custom routing accelerators, this is the
  /// virtual private cloud (VPC) subnet ID.
  ///
  /// Parameter [denyAllTrafficToEndpoint] :
  /// Indicates whether all destination IP addresses and ports for a specified
  /// VPC subnet endpoint <i>cannot</i> receive traffic from a custom routing
  /// accelerator. The value is TRUE or FALSE.
  ///
  /// When set to TRUE, <i>no</i> destinations in the custom routing VPC subnet
  /// can receive traffic. Note that you cannot specify destination IP addresses
  /// and ports when the value is set to TRUE.
  ///
  /// When set to FALSE (or not specified), you <i>must</i> specify a list of
  /// destination IP addresses that cannot receive traffic. A list of ports is
  /// optional. If you don't specify a list of ports, the ports that can accept
  /// traffic is the same as the ports configured for the endpoint group.
  ///
  /// The default value is FALSE.
  ///
  /// Parameter [destinationAddresses] :
  /// A list of specific Amazon EC2 instance IP addresses (destination
  /// addresses) in a subnet that you want to prevent from receiving traffic.
  /// The IP addresses must be a subset of the IP addresses allowed for the VPC
  /// subnet associated with the endpoint group.
  ///
  /// Parameter [destinationPorts] :
  /// A list of specific Amazon EC2 instance ports (destination ports) in a
  /// subnet endpoint that you want to prevent from receiving traffic.
  Future<void> denyCustomRoutingTraffic({
    @_s.required String endpointGroupArn,
    @_s.required String endpointId,
    bool denyAllTrafficToEndpoint,
    List<String> destinationAddresses,
    List<int> destinationPorts,
  }) async {
    ArgumentError.checkNotNull(endpointGroupArn, 'endpointGroupArn');
    _s.validateStringLength(
      'endpointGroupArn',
      endpointGroupArn,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(endpointId, 'endpointId');
    _s.validateStringLength(
      'endpointId',
      endpointId,
      0,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.DenyCustomRoutingTraffic'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointGroupArn': endpointGroupArn,
        'EndpointId': endpointId,
        if (denyAllTrafficToEndpoint != null)
          'DenyAllTrafficToEndpoint': denyAllTrafficToEndpoint,
        if (destinationAddresses != null)
          'DestinationAddresses': destinationAddresses,
        if (destinationPorts != null) 'DestinationPorts': destinationPorts,
      },
    );
  }

  /// Releases the specified address range that you provisioned to use with your
  /// AWS resources through bring your own IP addresses (BYOIP) and deletes the
  /// corresponding address pool.
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
      payload: {
        'Cidr': cidr,
      },
    );

    return DeprovisionByoipCidrResponse.fromJson(jsonResponse.body);
  }

  /// Describe an accelerator.
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
      payload: {
        'AcceleratorArn': acceleratorArn,
      },
    );

    return DescribeAcceleratorResponse.fromJson(jsonResponse.body);
  }

  /// Describe the attributes of an accelerator.
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
      payload: {
        'AcceleratorArn': acceleratorArn,
      },
    );

    return DescribeAcceleratorAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Describe a custom routing accelerator.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the accelerator to describe.
  Future<DescribeCustomRoutingAcceleratorResponse>
      describeCustomRoutingAccelerator({
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
          'GlobalAccelerator_V20180706.DescribeCustomRoutingAccelerator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceleratorArn': acceleratorArn,
      },
    );

    return DescribeCustomRoutingAcceleratorResponse.fromJson(jsonResponse.body);
  }

  /// Describe the attributes of a custom routing accelerator.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the custom routing accelerator to
  /// describe the attributes for.
  Future<DescribeCustomRoutingAcceleratorAttributesResponse>
      describeCustomRoutingAcceleratorAttributes({
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
          'GlobalAccelerator_V20180706.DescribeCustomRoutingAcceleratorAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceleratorArn': acceleratorArn,
      },
    );

    return DescribeCustomRoutingAcceleratorAttributesResponse.fromJson(
        jsonResponse.body);
  }

  /// Describe an endpoint group for a custom routing accelerator.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [EndpointGroupNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [endpointGroupArn] :
  /// The Amazon Resource Name (ARN) of the endpoint group to describe.
  Future<DescribeCustomRoutingEndpointGroupResponse>
      describeCustomRoutingEndpointGroup({
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
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.DescribeCustomRoutingEndpointGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointGroupArn': endpointGroupArn,
      },
    );

    return DescribeCustomRoutingEndpointGroupResponse.fromJson(
        jsonResponse.body);
  }

  /// The description of a listener for a custom routing accelerator.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ListenerNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener to describe.
  Future<DescribeCustomRoutingListenerResponse> describeCustomRoutingListener({
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
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.DescribeCustomRoutingListener'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ListenerArn': listenerArn,
      },
    );

    return DescribeCustomRoutingListenerResponse.fromJson(jsonResponse.body);
  }

  /// Describe an endpoint group.
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
      payload: {
        'EndpointGroupArn': endpointGroupArn,
      },
    );

    return DescribeEndpointGroupResponse.fromJson(jsonResponse.body);
  }

  /// Describe a listener.
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
      payload: {
        'ListenerArn': listenerArn,
      },
    );

    return DescribeListenerResponse.fromJson(jsonResponse.body);
  }

  /// List the accelerators for an AWS account.
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAcceleratorsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the IP address ranges that were specified in calls to <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/api/ProvisionByoipCidr.html">ProvisionByoipCidr</a>,
  /// including the current state and a history of state changes.
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListByoipCidrsResponse.fromJson(jsonResponse.body);
  }

  /// List the custom routing accelerators for an AWS account.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [maxResults] :
  /// The number of custom routing Global Accelerator objects that you want to
  /// return with this call. The default value is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListCustomRoutingAcceleratorsResponse> listCustomRoutingAccelerators({
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
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.ListCustomRoutingAccelerators'
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

    return ListCustomRoutingAcceleratorsResponse.fromJson(jsonResponse.body);
  }

  /// List the endpoint groups that are associated with a listener for a custom
  /// routing accelerator.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener to list endpoint groups
  /// for.
  ///
  /// Parameter [maxResults] :
  /// The number of endpoint group objects that you want to return with this
  /// call. The default value is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListCustomRoutingEndpointGroupsResponse>
      listCustomRoutingEndpointGroups({
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
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.ListCustomRoutingEndpointGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ListenerArn': listenerArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCustomRoutingEndpointGroupsResponse.fromJson(jsonResponse.body);
  }

  /// List the listeners for a custom routing accelerator.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the accelerator to list listeners for.
  ///
  /// Parameter [maxResults] :
  /// The number of listener objects that you want to return with this call. The
  /// default value is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListCustomRoutingListenersResponse> listCustomRoutingListeners({
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
      'X-Amz-Target': 'GlobalAccelerator_V20180706.ListCustomRoutingListeners'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceleratorArn': acceleratorArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCustomRoutingListenersResponse.fromJson(jsonResponse.body);
  }

  /// Provides a complete mapping from the public accelerator IP address and
  /// port to destination EC2 instance IP addresses and ports in the virtual
  /// public cloud (VPC) subnet endpoint for a custom routing accelerator. For
  /// each subnet endpoint that you add, Global Accelerator creates a new static
  /// port mapping for the accelerator. The port mappings don't change after
  /// Global Accelerator generates them, so you can retrieve and cache the full
  /// mapping on your servers.
  ///
  /// If you remove a subnet from your accelerator, Global Accelerator removes
  /// (reclaims) the port mappings. If you add a subnet to your accelerator,
  /// Global Accelerator creates new port mappings (the existing ones don't
  /// change). If you add or remove EC2 instances in your subnet, the port
  /// mappings don't change, because the mappings are created when you add the
  /// subnet to Global Accelerator.
  ///
  /// The mappings also include a flag for each destination denoting which
  /// destination IP addresses and ports are allowed or denied traffic.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidNextTokenException].
  /// May throw [EndpointGroupNotFoundException].
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the accelerator to list the custom
  /// routing port mappings for.
  ///
  /// Parameter [endpointGroupArn] :
  /// The Amazon Resource Name (ARN) of the endpoint group to list the custom
  /// routing port mappings for.
  ///
  /// Parameter [maxResults] :
  /// The number of destination port mappings that you want to return with this
  /// call. The default value is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListCustomRoutingPortMappingsResponse> listCustomRoutingPortMappings({
    @_s.required String acceleratorArn,
    String endpointGroupArn,
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
    _s.validateStringLength(
      'endpointGroupArn',
      endpointGroupArn,
      0,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.ListCustomRoutingPortMappings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceleratorArn': acceleratorArn,
        if (endpointGroupArn != null) 'EndpointGroupArn': endpointGroupArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCustomRoutingPortMappingsResponse.fromJson(jsonResponse.body);
  }

  /// List the port mappings for a specific EC2 instance (destination) in a VPC
  /// subnet endpoint. The response is the mappings for one destination IP
  /// address. This is useful when your subnet endpoint has mappings that span
  /// multiple custom routing accelerators in your account, or for scenarios
  /// where you only want to list the port mappings for a specific destination
  /// instance.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidNextTokenException].
  /// May throw [EndpointNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [destinationAddress] :
  /// The endpoint IP address in a virtual private cloud (VPC) subnet for which
  /// you want to receive back port mappings.
  ///
  /// Parameter [endpointId] :
  /// The ID for the virtual private cloud (VPC) subnet.
  ///
  /// Parameter [maxResults] :
  /// The number of destination port mappings that you want to return with this
  /// call. The default value is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListCustomRoutingPortMappingsByDestinationResponse>
      listCustomRoutingPortMappingsByDestination({
    @_s.required String destinationAddress,
    @_s.required String endpointId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(destinationAddress, 'destinationAddress');
    _s.validateStringLength(
      'destinationAddress',
      destinationAddress,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(endpointId, 'endpointId');
    _s.validateStringLength(
      'endpointId',
      endpointId,
      0,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.ListCustomRoutingPortMappingsByDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationAddress': destinationAddress,
        'EndpointId': endpointId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCustomRoutingPortMappingsByDestinationResponse.fromJson(
        jsonResponse.body);
  }

  /// List the endpoint groups that are associated with a listener.
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
      payload: {
        'ListenerArn': listenerArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEndpointGroupsResponse.fromJson(jsonResponse.body);
  }

  /// List the listeners for an accelerator.
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
      payload: {
        'AcceleratorArn': acceleratorArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListListenersResponse.fromJson(jsonResponse.body);
  }

  /// List all tags for an accelerator.
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
      payload: {
        'ResourceArn': resourceArn,
      },
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
      payload: {
        'Cidr': cidr,
        'CidrAuthorizationContext': cidrAuthorizationContext,
      },
    );

    return ProvisionByoipCidrResponse.fromJson(jsonResponse.body);
  }

  /// Remove endpoints from a custom routing accelerator.
  ///
  /// May throw [EndpointGroupNotFoundException].
  /// May throw [EndpointNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [endpointGroupArn] :
  /// The Amazon Resource Name (ARN) of the endpoint group to remove endpoints
  /// from.
  ///
  /// Parameter [endpointIds] :
  /// The IDs for the endpoints. For custom routing accelerators, endpoint IDs
  /// are the virtual private cloud (VPC) subnet IDs.
  Future<void> removeCustomRoutingEndpoints({
    @_s.required String endpointGroupArn,
    @_s.required List<String> endpointIds,
  }) async {
    ArgumentError.checkNotNull(endpointGroupArn, 'endpointGroupArn');
    _s.validateStringLength(
      'endpointGroupArn',
      endpointGroupArn,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(endpointIds, 'endpointIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.RemoveCustomRoutingEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointGroupArn': endpointGroupArn,
        'EndpointIds': endpointIds,
      },
    );
  }

  /// Add tags to an accelerator resource.
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
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Remove tags from a Global Accelerator resource. When you specify a tag
  /// key, the action removes both that key and its associated value. The
  /// operation succeeds even if you attempt to remove tags from an accelerator
  /// that was already removed.
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
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Update an accelerator.
  /// <important>
  /// Global Accelerator is a global service that supports endpoints in multiple
  /// AWS Regions but you must specify the US West (Oregon) Region to create or
  /// update accelerators.
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
  /// The IP address type, which must be IPv4.
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
      payload: {
        'AcceleratorArn': acceleratorArn,
        if (enabled != null) 'Enabled': enabled,
        if (ipAddressType != null) 'IpAddressType': ipAddressType.toValue(),
        if (name != null) 'Name': name,
      },
    );

    return UpdateAcceleratorResponse.fromJson(jsonResponse.body);
  }

  /// Update the attributes for an accelerator.
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
      payload: {
        'AcceleratorArn': acceleratorArn,
        if (flowLogsEnabled != null) 'FlowLogsEnabled': flowLogsEnabled,
        if (flowLogsS3Bucket != null) 'FlowLogsS3Bucket': flowLogsS3Bucket,
        if (flowLogsS3Prefix != null) 'FlowLogsS3Prefix': flowLogsS3Prefix,
      },
    );

    return UpdateAcceleratorAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Update a custom routing accelerator.
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
  Future<UpdateCustomRoutingAcceleratorResponse>
      updateCustomRoutingAccelerator({
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
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.UpdateCustomRoutingAccelerator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceleratorArn': acceleratorArn,
        if (enabled != null) 'Enabled': enabled,
        if (ipAddressType != null) 'IpAddressType': ipAddressType.toValue(),
        if (name != null) 'Name': name,
      },
    );

    return UpdateCustomRoutingAcceleratorResponse.fromJson(jsonResponse.body);
  }

  /// Update the attributes for a custom routing accelerator.
  ///
  /// May throw [AcceleratorNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [acceleratorArn] :
  /// The Amazon Resource Name (ARN) of the custom routing accelerator to update
  /// attributes for.
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
  /// DOC-EXAMPLE-BUCKET//AWSLogs/aws_account_id
  Future<UpdateCustomRoutingAcceleratorAttributesResponse>
      updateCustomRoutingAcceleratorAttributes({
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
      'X-Amz-Target':
          'GlobalAccelerator_V20180706.UpdateCustomRoutingAcceleratorAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceleratorArn': acceleratorArn,
        if (flowLogsEnabled != null) 'FlowLogsEnabled': flowLogsEnabled,
        if (flowLogsS3Bucket != null) 'FlowLogsS3Bucket': flowLogsS3Bucket,
        if (flowLogsS3Prefix != null) 'FlowLogsS3Prefix': flowLogsS3Prefix,
      },
    );

    return UpdateCustomRoutingAcceleratorAttributesResponse.fromJson(
        jsonResponse.body);
  }

  /// Update a listener for a custom routing accelerator.
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
  /// Parameter [portRanges] :
  /// The updated port range to support for connections from clients to your
  /// accelerator. If you remove ports that are currently being used by a subnet
  /// endpoint, the call fails.
  ///
  /// Separately, you set port ranges for endpoints. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/about-custom-routing-endpoints.html">About
  /// endpoints for custom routing accelerators</a>.
  Future<UpdateCustomRoutingListenerResponse> updateCustomRoutingListener({
    @_s.required String listenerArn,
    @_s.required List<PortRange> portRanges,
  }) async {
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    _s.validateStringLength(
      'listenerArn',
      listenerArn,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(portRanges, 'portRanges');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'GlobalAccelerator_V20180706.UpdateCustomRoutingListener'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ListenerArn': listenerArn,
        'PortRanges': portRanges,
      },
    );

    return UpdateCustomRoutingListenerResponse.fromJson(jsonResponse.body);
  }

  /// Update an endpoint group. A resource must be valid and active when you add
  /// it as an endpoint.
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
  /// The list of endpoint objects. A resource must be valid and active when you
  /// add it as an endpoint.
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
  /// Parameter [portOverrides] :
  /// Override specific listener ports used to route traffic to endpoints that
  /// are part of this endpoint group. For example, you can create a port
  /// override in which the listener receives user traffic on ports 80 and 443,
  /// but your accelerator routes that traffic to ports 1080 and 1443,
  /// respectively, on the endpoints.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoint-groups-port-override.html">
  /// Port overrides</a> in the <i>AWS Global Accelerator Developer Guide</i>.
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
    List<PortOverride> portOverrides,
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
    _s.validateStringPattern(
      'healthCheckPath',
      healthCheckPath,
      r'''^/[-a-zA-Z0-9@:%_\\+.~#?&/=]*$''',
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
      payload: {
        'EndpointGroupArn': endpointGroupArn,
        if (endpointConfigurations != null)
          'EndpointConfigurations': endpointConfigurations,
        if (healthCheckIntervalSeconds != null)
          'HealthCheckIntervalSeconds': healthCheckIntervalSeconds,
        if (healthCheckPath != null) 'HealthCheckPath': healthCheckPath,
        if (healthCheckPort != null) 'HealthCheckPort': healthCheckPort,
        if (healthCheckProtocol != null)
          'HealthCheckProtocol': healthCheckProtocol.toValue(),
        if (portOverrides != null) 'PortOverrides': portOverrides,
        if (thresholdCount != null) 'ThresholdCount': thresholdCount,
        if (trafficDialPercentage != null)
          'TrafficDialPercentage': trafficDialPercentage,
      },
    );

    return UpdateEndpointGroupResponse.fromJson(jsonResponse.body);
  }

  /// Update a listener.
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
  /// protocol of the client request. Client affinity gives you control over
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
      payload: {
        'ListenerArn': listenerArn,
        if (clientAffinity != null) 'ClientAffinity': clientAffinity.toValue(),
        if (portRanges != null) 'PortRanges': portRanges,
        if (protocol != null) 'Protocol': protocol.toValue(),
      },
    );

    return UpdateListenerResponse.fromJson(jsonResponse.body);
  }

  /// Stops advertising an address range that is provisioned as an address pool.
  /// You can perform this operation at most once every 10 seconds, even if you
  /// specify different address ranges each time.
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
      payload: {
        'Cidr': cidr,
      },
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
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
    createFactory: true,
    createToJson: false)
class AddCustomRoutingEndpointsResponse {
  /// The endpoint objects added to the custom routing accelerator.
  @_s.JsonKey(name: 'EndpointDescriptions')
  final List<CustomRoutingEndpointDescription> endpointDescriptions;

  /// The Amazon Resource Name (ARN) of the endpoint group for the custom routing
  /// endpoint.
  @_s.JsonKey(name: 'EndpointGroupArn')
  final String endpointGroupArn;

  AddCustomRoutingEndpointsResponse({
    this.endpointDescriptions,
    this.endpointGroupArn,
  });
  factory AddCustomRoutingEndpointsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddCustomRoutingEndpointsResponseFromJson(json);
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

  /// A history of status changes for an IP address range that you bring to AWS
  /// Global Accelerator through bring your own IP address (BYOIP).
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
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

extension on ClientAffinity {
  String toValue() {
    switch (this) {
      case ClientAffinity.none:
        return 'NONE';
      case ClientAffinity.sourceIp:
        return 'SOURCE_IP';
    }
    throw Exception('Unknown enum value: $this');
  }
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
    createFactory: true,
    createToJson: false)
class CreateCustomRoutingAcceleratorResponse {
  /// The accelerator that is created.
  @_s.JsonKey(name: 'Accelerator')
  final CustomRoutingAccelerator accelerator;

  CreateCustomRoutingAcceleratorResponse({
    this.accelerator,
  });
  factory CreateCustomRoutingAcceleratorResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCustomRoutingAcceleratorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCustomRoutingEndpointGroupResponse {
  /// The information about the endpoint group created for a custom routing
  /// accelerator.
  @_s.JsonKey(name: 'EndpointGroup')
  final CustomRoutingEndpointGroup endpointGroup;

  CreateCustomRoutingEndpointGroupResponse({
    this.endpointGroup,
  });
  factory CreateCustomRoutingEndpointGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCustomRoutingEndpointGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCustomRoutingListenerResponse {
  /// The listener that you've created for a custom routing accelerator.
  @_s.JsonKey(name: 'Listener')
  final CustomRoutingListener listener;

  CreateCustomRoutingListenerResponse({
    this.listener,
  });
  factory CreateCustomRoutingListenerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCustomRoutingListenerResponseFromJson(json);
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

/// Attributes of a custom routing accelerator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomRoutingAccelerator {
  /// The Amazon Resource Name (ARN) of the custom routing accelerator.
  @_s.JsonKey(name: 'AcceleratorArn')
  final String acceleratorArn;

  /// The date and time that the accelerator was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The name of the accelerator. The name must contain only alphanumeric
  /// characters or hyphens (-), and must not begin or end with a hyphen.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Describes the deployment status of the accelerator.
  @_s.JsonKey(name: 'Status')
  final CustomRoutingAcceleratorStatus status;

  CustomRoutingAccelerator({
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
  factory CustomRoutingAccelerator.fromJson(Map<String, dynamic> json) =>
      _$CustomRoutingAcceleratorFromJson(json);
}

/// Attributes of a custom routing accelerator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomRoutingAcceleratorAttributes {
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
  /// DOC-EXAMPLE-BUCKET//AWSLogs/aws_account_id
  @_s.JsonKey(name: 'FlowLogsS3Prefix')
  final String flowLogsS3Prefix;

  CustomRoutingAcceleratorAttributes({
    this.flowLogsEnabled,
    this.flowLogsS3Bucket,
    this.flowLogsS3Prefix,
  });
  factory CustomRoutingAcceleratorAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$CustomRoutingAcceleratorAttributesFromJson(json);
}

enum CustomRoutingAcceleratorStatus {
  @_s.JsonValue('DEPLOYED')
  deployed,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
}

/// For a custom routing accelerator, sets the port range and protocol for all
/// endpoints (virtual private cloud subnets) in an endpoint group to accept
/// client traffic on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CustomRoutingDestinationConfiguration {
  /// The first port, inclusive, in the range of ports for the endpoint group that
  /// is associated with a custom routing accelerator.
  @_s.JsonKey(name: 'FromPort')
  final int fromPort;

  /// The protocol for the endpoint group that is associated with a custom routing
  /// accelerator. The protocol can be either TCP or UDP.
  @_s.JsonKey(name: 'Protocols')
  final List<CustomRoutingProtocol> protocols;

  /// The last port, inclusive, in the range of ports for the endpoint group that
  /// is associated with a custom routing accelerator.
  @_s.JsonKey(name: 'ToPort')
  final int toPort;

  CustomRoutingDestinationConfiguration({
    @_s.required this.fromPort,
    @_s.required this.protocols,
    @_s.required this.toPort,
  });
  Map<String, dynamic> toJson() =>
      _$CustomRoutingDestinationConfigurationToJson(this);
}

/// For a custom routing accelerator, describes the port range and protocol for
/// all endpoints (virtual private cloud subnets) in an endpoint group to accept
/// client traffic on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomRoutingDestinationDescription {
  /// The first port, inclusive, in the range of ports for the endpoint group that
  /// is associated with a custom routing accelerator.
  @_s.JsonKey(name: 'FromPort')
  final int fromPort;

  /// The protocol for the endpoint group that is associated with a custom routing
  /// accelerator. The protocol can be either TCP or UDP.
  @_s.JsonKey(name: 'Protocols')
  final List<Protocol> protocols;

  /// The last port, inclusive, in the range of ports for the endpoint group that
  /// is associated with a custom routing accelerator.
  @_s.JsonKey(name: 'ToPort')
  final int toPort;

  CustomRoutingDestinationDescription({
    this.fromPort,
    this.protocols,
    this.toPort,
  });
  factory CustomRoutingDestinationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$CustomRoutingDestinationDescriptionFromJson(json);
}

enum CustomRoutingDestinationTrafficState {
  @_s.JsonValue('ALLOW')
  allow,
  @_s.JsonValue('DENY')
  deny,
}

/// The list of endpoint objects. For custom routing, this is a list of virtual
/// private cloud (VPC) subnet IDs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CustomRoutingEndpointConfiguration {
  /// An ID for the endpoint. For custom routing accelerators, this is the virtual
  /// private cloud (VPC) subnet ID.
  @_s.JsonKey(name: 'EndpointId')
  final String endpointId;

  CustomRoutingEndpointConfiguration({
    this.endpointId,
  });
  Map<String, dynamic> toJson() =>
      _$CustomRoutingEndpointConfigurationToJson(this);
}

/// A complex type for an endpoint for a custom routing accelerator. Each
/// endpoint group can include one or more endpoints, which are virtual private
/// cloud (VPC) subnets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomRoutingEndpointDescription {
  /// An ID for the endpoint. For custom routing accelerators, this is the virtual
  /// private cloud (VPC) subnet ID.
  @_s.JsonKey(name: 'EndpointId')
  final String endpointId;

  CustomRoutingEndpointDescription({
    this.endpointId,
  });
  factory CustomRoutingEndpointDescription.fromJson(
          Map<String, dynamic> json) =>
      _$CustomRoutingEndpointDescriptionFromJson(json);
}

/// A complex type for the endpoint group for a custom routing accelerator. An
/// AWS Region can have only one endpoint group for a specific listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomRoutingEndpointGroup {
  /// For a custom routing accelerator, describes the port range and protocol for
  /// all endpoints (virtual private cloud subnets) in an endpoint group to accept
  /// client traffic on.
  @_s.JsonKey(name: 'DestinationDescriptions')
  final List<CustomRoutingDestinationDescription> destinationDescriptions;

  /// For a custom routing accelerator, describes the endpoints (virtual private
  /// cloud subnets) in an endpoint group to accept client traffic on.
  @_s.JsonKey(name: 'EndpointDescriptions')
  final List<CustomRoutingEndpointDescription> endpointDescriptions;

  /// The Amazon Resource Name (ARN) of the endpoint group.
  @_s.JsonKey(name: 'EndpointGroupArn')
  final String endpointGroupArn;

  /// The AWS Region where the endpoint group is located.
  @_s.JsonKey(name: 'EndpointGroupRegion')
  final String endpointGroupRegion;

  CustomRoutingEndpointGroup({
    this.destinationDescriptions,
    this.endpointDescriptions,
    this.endpointGroupArn,
    this.endpointGroupRegion,
  });
  factory CustomRoutingEndpointGroup.fromJson(Map<String, dynamic> json) =>
      _$CustomRoutingEndpointGroupFromJson(json);
}

/// A complex type for a listener for a custom routing accelerator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomRoutingListener {
  /// The Amazon Resource Name (ARN) of the listener.
  @_s.JsonKey(name: 'ListenerArn')
  final String listenerArn;

  /// The port range to support for connections from clients to your accelerator.
  ///
  /// Separately, you set port ranges for endpoints. For more information, see <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/about-custom-routing-endpoints.html">About
  /// endpoints for custom routing accelerators</a>.
  @_s.JsonKey(name: 'PortRanges')
  final List<PortRange> portRanges;

  CustomRoutingListener({
    this.listenerArn,
    this.portRanges,
  });
  factory CustomRoutingListener.fromJson(Map<String, dynamic> json) =>
      _$CustomRoutingListenerFromJson(json);
}

enum CustomRoutingProtocol {
  @_s.JsonValue('TCP')
  tcp,
  @_s.JsonValue('UDP')
  udp,
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
    createFactory: true,
    createToJson: false)
class DescribeCustomRoutingAcceleratorAttributesResponse {
  /// The attributes of the custom routing accelerator.
  @_s.JsonKey(name: 'AcceleratorAttributes')
  final CustomRoutingAcceleratorAttributes acceleratorAttributes;

  DescribeCustomRoutingAcceleratorAttributesResponse({
    this.acceleratorAttributes,
  });
  factory DescribeCustomRoutingAcceleratorAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeCustomRoutingAcceleratorAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCustomRoutingAcceleratorResponse {
  /// The description of the custom routing accelerator.
  @_s.JsonKey(name: 'Accelerator')
  final CustomRoutingAccelerator accelerator;

  DescribeCustomRoutingAcceleratorResponse({
    this.accelerator,
  });
  factory DescribeCustomRoutingAcceleratorResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeCustomRoutingAcceleratorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCustomRoutingEndpointGroupResponse {
  /// The description of an endpoint group for a custom routing accelerator.
  @_s.JsonKey(name: 'EndpointGroup')
  final CustomRoutingEndpointGroup endpointGroup;

  DescribeCustomRoutingEndpointGroupResponse({
    this.endpointGroup,
  });
  factory DescribeCustomRoutingEndpointGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeCustomRoutingEndpointGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCustomRoutingListenerResponse {
  /// The description of a listener for a custom routing accelerator.
  @_s.JsonKey(name: 'Listener')
  final CustomRoutingListener listener;

  DescribeCustomRoutingListenerResponse({
    this.listener,
  });
  factory DescribeCustomRoutingListenerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeCustomRoutingListenerResponseFromJson(json);
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

/// The port mappings for a specified endpoint IP address (destination).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DestinationPortMapping {
  /// The Amazon Resource Name (ARN) of the custom routing accelerator that you
  /// have port mappings for.
  @_s.JsonKey(name: 'AcceleratorArn')
  final String acceleratorArn;

  /// The IP address/port combinations (sockets) that map to a given destination
  /// socket address.
  @_s.JsonKey(name: 'AcceleratorSocketAddresses')
  final List<SocketAddress> acceleratorSocketAddresses;

  /// The endpoint IP address/port combination for traffic received on the
  /// accelerator socket address.
  @_s.JsonKey(name: 'DestinationSocketAddress')
  final SocketAddress destinationSocketAddress;

  /// Indicates whether or not a port mapping destination can receive traffic. The
  /// value is either ALLOW, if traffic is allowed to the destination, or DENY, if
  /// traffic is not allowed to the destination.
  @_s.JsonKey(name: 'DestinationTrafficState')
  final CustomRoutingDestinationTrafficState destinationTrafficState;

  /// The Amazon Resource Name (ARN) of the endpoint group.
  @_s.JsonKey(name: 'EndpointGroupArn')
  final String endpointGroupArn;

  /// The AWS Region for the endpoint group.
  @_s.JsonKey(name: 'EndpointGroupRegion')
  final String endpointGroupRegion;

  /// The ID for the virtual private cloud (VPC) subnet.
  @_s.JsonKey(name: 'EndpointId')
  final String endpointId;

  /// The IP address type, which must be IPv4.
  @_s.JsonKey(name: 'IpAddressType')
  final IpAddressType ipAddressType;

  DestinationPortMapping({
    this.acceleratorArn,
    this.acceleratorSocketAddresses,
    this.destinationSocketAddress,
    this.destinationTrafficState,
    this.endpointGroupArn,
    this.endpointGroupRegion,
    this.endpointId,
    this.ipAddressType,
  });
  factory DestinationPortMapping.fromJson(Map<String, dynamic> json) =>
      _$DestinationPortMappingFromJson(json);
}

/// A complex type for endpoints. A resource must be valid and active when you
/// add it as an endpoint.
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
  /// address allocation ID. For Amazon EC2 instances, this is the EC2 instance
  /// ID. A resource must be valid and active when you add it as an endpoint.
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
  /// address allocation ID. For Amazon EC2 instances, this is the EC2 instance
  /// ID.
  ///
  /// An Application Load Balancer can be either internal or internet-facing.
  @_s.JsonKey(name: 'EndpointId')
  final String endpointId;

  /// Returns a null result.
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

  /// The AWS Region where the endpoint group is located.
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

  /// Allows you to override the destination ports used to route traffic to an
  /// endpoint. Using a port override lets you to map a list of external
  /// destination ports (that your users send traffic to) to a list of internal
  /// destination ports that you want an application endpoint to receive traffic
  /// on.
  @_s.JsonKey(name: 'PortOverrides')
  final List<PortOverride> portOverrides;

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
    this.portOverrides,
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

extension on HealthCheckProtocol {
  String toValue() {
    switch (this) {
      case HealthCheckProtocol.tcp:
        return 'TCP';
      case HealthCheckProtocol.http:
        return 'HTTP';
      case HealthCheckProtocol.https:
        return 'HTTPS';
    }
    throw Exception('Unknown enum value: $this');
  }
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

extension on IpAddressType {
  String toValue() {
    switch (this) {
      case IpAddressType.ipv4:
        return 'IPV4';
    }
    throw Exception('Unknown enum value: $this');
  }
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
    createFactory: true,
    createToJson: false)
class ListCustomRoutingAcceleratorsResponse {
  /// The list of custom routing accelerators for a customer account.
  @_s.JsonKey(name: 'Accelerators')
  final List<CustomRoutingAccelerator> accelerators;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCustomRoutingAcceleratorsResponse({
    this.accelerators,
    this.nextToken,
  });
  factory ListCustomRoutingAcceleratorsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCustomRoutingAcceleratorsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCustomRoutingEndpointGroupsResponse {
  /// The list of the endpoint groups associated with a listener for a custom
  /// routing accelerator.
  @_s.JsonKey(name: 'EndpointGroups')
  final List<CustomRoutingEndpointGroup> endpointGroups;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCustomRoutingEndpointGroupsResponse({
    this.endpointGroups,
    this.nextToken,
  });
  factory ListCustomRoutingEndpointGroupsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCustomRoutingEndpointGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCustomRoutingListenersResponse {
  /// The list of listeners for a custom routing accelerator.
  @_s.JsonKey(name: 'Listeners')
  final List<CustomRoutingListener> listeners;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCustomRoutingListenersResponse({
    this.listeners,
    this.nextToken,
  });
  factory ListCustomRoutingListenersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCustomRoutingListenersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCustomRoutingPortMappingsByDestinationResponse {
  /// The port mappings for the endpoint IP address that you specified in the
  /// request.
  @_s.JsonKey(name: 'DestinationPortMappings')
  final List<DestinationPortMapping> destinationPortMappings;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCustomRoutingPortMappingsByDestinationResponse({
    this.destinationPortMappings,
    this.nextToken,
  });
  factory ListCustomRoutingPortMappingsByDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCustomRoutingPortMappingsByDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCustomRoutingPortMappingsResponse {
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The port mappings for a custom routing accelerator.
  @_s.JsonKey(name: 'PortMappings')
  final List<PortMapping> portMappings;

  ListCustomRoutingPortMappingsResponse({
    this.nextToken,
    this.portMappings,
  });
  factory ListCustomRoutingPortMappingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCustomRoutingPortMappingsResponseFromJson(json);
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
  /// protocol of the client request. Client affinity gives you control over
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

/// Returns the ports and associated IP addresses and ports of Amazon EC2
/// instances in your virtual private cloud (VPC) subnets. Custom routing is a
/// port mapping protocol in AWS Global Accelerator that statically associates
/// port ranges with VPC subnets, which allows Global Accelerator to route to
/// specific instances and ports within one or more subnets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PortMapping {
  /// The accelerator port.
  @_s.JsonKey(name: 'AcceleratorPort')
  final int acceleratorPort;

  /// The EC2 instance IP address and port number in the virtual private cloud
  /// (VPC) subnet.
  @_s.JsonKey(name: 'DestinationSocketAddress')
  final SocketAddress destinationSocketAddress;

  /// Indicates whether or not a port mapping destination can receive traffic. The
  /// value is either ALLOW, if traffic is allowed to the destination, or DENY, if
  /// traffic is not allowed to the destination.
  @_s.JsonKey(name: 'DestinationTrafficState')
  final CustomRoutingDestinationTrafficState destinationTrafficState;

  /// The Amazon Resource Name (ARN) of the endpoint group.
  @_s.JsonKey(name: 'EndpointGroupArn')
  final String endpointGroupArn;

  /// The IP address of the VPC subnet (the subnet ID).
  @_s.JsonKey(name: 'EndpointId')
  final String endpointId;

  /// The protocols supported by the endpoint group.
  @_s.JsonKey(name: 'Protocols')
  final List<CustomRoutingProtocol> protocols;

  PortMapping({
    this.acceleratorPort,
    this.destinationSocketAddress,
    this.destinationTrafficState,
    this.endpointGroupArn,
    this.endpointId,
    this.protocols,
  });
  factory PortMapping.fromJson(Map<String, dynamic> json) =>
      _$PortMappingFromJson(json);
}

/// Override specific listener ports used to route traffic to endpoints that are
/// part of an endpoint group. For example, you can create a port override in
/// which the listener receives user traffic on ports 80 and 443, but your
/// accelerator routes that traffic to ports 1080 and 1443, respectively, on the
/// endpoints.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoint-groups-port-override.html">
/// Port overrides</a> in the <i>AWS Global Accelerator Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortOverride {
  /// The endpoint port that you want a listener port to be mapped to. This is the
  /// port on the endpoint, such as the Application Load Balancer or Amazon EC2
  /// instance.
  @_s.JsonKey(name: 'EndpointPort')
  final int endpointPort;

  /// The listener port that you want to map to a specific endpoint port. This is
  /// the port that user traffic arrives to the Global Accelerator on.
  @_s.JsonKey(name: 'ListenerPort')
  final int listenerPort;

  PortOverride({
    this.endpointPort,
    this.listenerPort,
  });
  factory PortOverride.fromJson(Map<String, dynamic> json) =>
      _$PortOverrideFromJson(json);

  Map<String, dynamic> toJson() => _$PortOverrideToJson(this);
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

extension on Protocol {
  String toValue() {
    switch (this) {
      case Protocol.tcp:
        return 'TCP';
      case Protocol.udp:
        return 'UDP';
    }
    throw Exception('Unknown enum value: $this');
  }
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

/// An IP address/port combination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SocketAddress {
  /// The IP address for the socket address.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// The port for the socket address.
  @_s.JsonKey(name: 'Port')
  final int port;

  SocketAddress({
    this.ipAddress,
    this.port,
  });
  factory SocketAddress.fromJson(Map<String, dynamic> json) =>
      _$SocketAddressFromJson(json);
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
    createFactory: true,
    createToJson: false)
class UpdateCustomRoutingAcceleratorAttributesResponse {
  /// Updated custom routing accelerator.
  @_s.JsonKey(name: 'AcceleratorAttributes')
  final CustomRoutingAcceleratorAttributes acceleratorAttributes;

  UpdateCustomRoutingAcceleratorAttributesResponse({
    this.acceleratorAttributes,
  });
  factory UpdateCustomRoutingAcceleratorAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCustomRoutingAcceleratorAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCustomRoutingAcceleratorResponse {
  /// Information about the updated custom routing accelerator.
  @_s.JsonKey(name: 'Accelerator')
  final CustomRoutingAccelerator accelerator;

  UpdateCustomRoutingAcceleratorResponse({
    this.accelerator,
  });
  factory UpdateCustomRoutingAcceleratorResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCustomRoutingAcceleratorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCustomRoutingListenerResponse {
  /// Information for the updated listener for a custom routing accelerator.
  @_s.JsonKey(name: 'Listener')
  final CustomRoutingListener listener;

  UpdateCustomRoutingListenerResponse({
    this.listener,
  });
  factory UpdateCustomRoutingListenerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCustomRoutingListenerResponseFromJson(json);
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

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class EndpointAlreadyExistsException extends _s.GenericAwsException {
  EndpointAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'EndpointAlreadyExistsException',
            message: message);
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

class EndpointNotFoundException extends _s.GenericAwsException {
  EndpointNotFoundException({String type, String message})
      : super(type: type, code: 'EndpointNotFoundException', message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'EndpointAlreadyExistsException': (type, message) =>
      EndpointAlreadyExistsException(type: type, message: message),
  'EndpointGroupAlreadyExistsException': (type, message) =>
      EndpointGroupAlreadyExistsException(type: type, message: message),
  'EndpointGroupNotFoundException': (type, message) =>
      EndpointGroupNotFoundException(type: type, message: message),
  'EndpointNotFoundException': (type, message) =>
      EndpointNotFoundException(type: type, message: message),
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
