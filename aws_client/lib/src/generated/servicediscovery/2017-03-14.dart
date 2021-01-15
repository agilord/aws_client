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

part '2017-03-14.g.dart';

/// AWS Cloud Map lets you configure public DNS, private DNS, or HTTP namespaces
/// that your microservice applications run in. When an instance of the service
/// becomes available, you can call the AWS Cloud Map API to register the
/// instance with AWS Cloud Map. For public or private DNS namespaces, AWS Cloud
/// Map automatically creates DNS records and an optional health check. Clients
/// that submit public or private DNS queries, or HTTP requests, for the service
/// receive an answer that contains up to eight healthy records.
class ServiceDiscovery {
  final _s.JsonProtocol _protocol;
  ServiceDiscovery({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'servicediscovery',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an HTTP namespace. Service instances that you register using an
  /// HTTP namespace can be discovered using a <code>DiscoverInstances</code>
  /// request but can't be discovered using DNS.
  ///
  /// For the current quota on the number of namespaces that you can create
  /// using the same AWS account, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS
  /// Cloud Map quotas</a> in the <i>AWS Cloud Map Developer Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [NamespaceAlreadyExists].
  /// May throw [ResourceLimitExceeded].
  /// May throw [DuplicateRequest].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [name] :
  /// The name that you want to assign to this namespace.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>CreateHttpNamespace</code> requests to be retried without the risk
  /// of executing the operation twice. <code>CreatorRequestId</code> can be any
  /// unique string, for example, a date/time stamp.
  ///
  /// Parameter [description] :
  /// A description for the namespace.
  ///
  /// Parameter [tags] :
  /// The tags to add to the namespace. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreateHttpNamespaceResponse> createHttpNamespace({
    @_s.required String name,
    String creatorRequestId,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      0,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.CreateHttpNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateHttpNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a private namespace based on DNS, which will be visible only
  /// inside a specified Amazon VPC. The namespace defines your service naming
  /// scheme. For example, if you name your namespace <code>example.com</code>
  /// and name your service <code>backend</code>, the resulting DNS name for the
  /// service will be <code>backend.example.com</code>. For the current quota on
  /// the number of namespaces that you can create using the same AWS account,
  /// see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS
  /// Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [NamespaceAlreadyExists].
  /// May throw [ResourceLimitExceeded].
  /// May throw [DuplicateRequest].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [name] :
  /// The name that you want to assign to this namespace. When you create a
  /// private DNS namespace, AWS Cloud Map automatically creates an Amazon
  /// Route 53 private hosted zone that has the same name as the namespace.
  ///
  /// Parameter [vpc] :
  /// The ID of the Amazon VPC that you want to associate the namespace with.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>CreatePrivateDnsNamespace</code> requests to be retried without the
  /// risk of executing the operation twice. <code>CreatorRequestId</code> can
  /// be any unique string, for example, a date/time stamp.
  ///
  /// Parameter [description] :
  /// A description for the namespace.
  ///
  /// Parameter [tags] :
  /// The tags to add to the namespace. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreatePrivateDnsNamespaceResponse> createPrivateDnsNamespace({
    @_s.required String name,
    @_s.required String vpc,
    String creatorRequestId,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(vpc, 'vpc');
    _s.validateStringLength(
      'vpc',
      vpc,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      0,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.CreatePrivateDnsNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Vpc': vpc,
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePrivateDnsNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a public namespace based on DNS, which will be visible on the
  /// internet. The namespace defines your service naming scheme. For example,
  /// if you name your namespace <code>example.com</code> and name your service
  /// <code>backend</code>, the resulting DNS name for the service will be
  /// <code>backend.example.com</code>. For the current quota on the number of
  /// namespaces that you can create using the same AWS account, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS
  /// Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [NamespaceAlreadyExists].
  /// May throw [ResourceLimitExceeded].
  /// May throw [DuplicateRequest].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [name] :
  /// The name that you want to assign to this namespace.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>CreatePublicDnsNamespace</code> requests to be retried without the
  /// risk of executing the operation twice. <code>CreatorRequestId</code> can
  /// be any unique string, for example, a date/time stamp.
  ///
  /// Parameter [description] :
  /// A description for the namespace.
  ///
  /// Parameter [tags] :
  /// The tags to add to the namespace. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreatePublicDnsNamespaceResponse> createPublicDnsNamespace({
    @_s.required String name,
    String creatorRequestId,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      0,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.CreatePublicDnsNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePublicDnsNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a service, which defines the configuration for the following
  /// entities:
  ///
  /// <ul>
  /// <li>
  /// For public and private DNS namespaces, one of the following combinations
  /// of DNS records in Amazon Route 53:
  ///
  /// <ul>
  /// <li>
  /// <code>A</code>
  /// </li>
  /// <li>
  /// <code>AAAA</code>
  /// </li>
  /// <li>
  /// <code>A</code> and <code>AAAA</code>
  /// </li>
  /// <li>
  /// <code>SRV</code>
  /// </li>
  /// <li>
  /// <code>CNAME</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Optionally, a health check
  /// </li>
  /// </ul>
  /// After you create the service, you can submit a <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html">RegisterInstance</a>
  /// request, and AWS Cloud Map uses the values in the configuration to create
  /// the specified entities.
  ///
  /// For the current quota on the number of instances that you can register
  /// using the same namespace and using the same service, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS
  /// Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [ResourceLimitExceeded].
  /// May throw [NamespaceNotFound].
  /// May throw [ServiceAlreadyExists].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [name] :
  /// The name that you want to assign to the service.
  ///
  /// If you want AWS Cloud Map to create an <code>SRV</code> record when you
  /// register an instance, and if you're using a system that requires a
  /// specific <code>SRV</code> format, such as <a
  /// href="http://www.haproxy.org/">HAProxy</a>, specify the following for
  /// <code>Name</code>:
  ///
  /// <ul>
  /// <li>
  /// Start the name with an underscore (_), such as
  /// <code>_exampleservice</code>
  /// </li>
  /// <li>
  /// End the name with <i>._protocol</i>, such as <code>._tcp</code>
  /// </li>
  /// </ul>
  /// When you register an instance, AWS Cloud Map creates an <code>SRV</code>
  /// record and assigns a name to the record by concatenating the service name
  /// and the namespace name, for example:
  ///
  /// <code>_exampleservice._tcp.example.com</code>
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>CreateService</code> requests to be retried without the risk of
  /// executing the operation twice. <code>CreatorRequestId</code> can be any
  /// unique string, for example, a date/time stamp.
  ///
  /// Parameter [description] :
  /// A description for the service.
  ///
  /// Parameter [dnsConfig] :
  /// A complex type that contains information about the Amazon Route 53 records
  /// that you want AWS Cloud Map to create when you register an instance.
  ///
  /// Parameter [healthCheckConfig] :
  /// <i>Public DNS and HTTP namespaces only.</i> A complex type that contains
  /// settings for an optional Route 53 health check. If you specify settings
  /// for a health check, AWS Cloud Map associates the health check with all the
  /// Route 53 DNS records that you specify in <code>DnsConfig</code>.
  /// <important>
  /// If you specify a health check configuration, you can specify either
  /// <code>HealthCheckCustomConfig</code> or <code>HealthCheckConfig</code> but
  /// not both.
  /// </important>
  /// For information about the charges for health checks, see <a
  /// href="http://aws.amazon.com/cloud-map/pricing/">AWS Cloud Map Pricing</a>.
  ///
  /// Parameter [healthCheckCustomConfig] :
  /// A complex type that contains information about an optional custom health
  /// check.
  /// <important>
  /// If you specify a health check configuration, you can specify either
  /// <code>HealthCheckCustomConfig</code> or <code>HealthCheckConfig</code> but
  /// not both.
  /// </important>
  /// You can't add, update, or delete a <code>HealthCheckCustomConfig</code>
  /// configuration from an existing service.
  ///
  /// Parameter [namespaceId] :
  /// The ID of the namespace that you want to use to create the service.
  ///
  /// Parameter [tags] :
  /// The tags to add to the service. Each tag consists of a key and an optional
  /// value, both of which you define. Tag keys can have a maximum character
  /// length of 128 characters, and tag values can have a maximum length of 256
  /// characters.
  Future<CreateServiceResponse> createService({
    @_s.required String name,
    String creatorRequestId,
    String description,
    DnsConfig dnsConfig,
    HealthCheckConfig healthCheckConfig,
    HealthCheckCustomConfig healthCheckCustomConfig,
    String namespaceId,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''((?=^.{1,127}$)^([a-zA-Z0-9_][a-zA-Z0-9-_]{0,61}[a-zA-Z0-9_]|[a-zA-Z0-9])(\.([a-zA-Z0-9_][a-zA-Z0-9-_]{0,61}[a-zA-Z0-9_]|[a-zA-Z0-9]))*$)|(^\.$)''',
      isRequired: true,
    );
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      0,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringLength(
      'namespaceId',
      namespaceId,
      0,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.CreateService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (dnsConfig != null) 'DnsConfig': dnsConfig,
        if (healthCheckConfig != null) 'HealthCheckConfig': healthCheckConfig,
        if (healthCheckCustomConfig != null)
          'HealthCheckCustomConfig': healthCheckCustomConfig,
        if (namespaceId != null) 'NamespaceId': namespaceId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateServiceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a namespace from the current account. If the namespace still
  /// contains one or more services, the request fails.
  ///
  /// May throw [InvalidInput].
  /// May throw [NamespaceNotFound].
  /// May throw [ResourceInUse].
  /// May throw [DuplicateRequest].
  ///
  /// Parameter [id] :
  /// The ID of the namespace that you want to delete.
  Future<DeleteNamespaceResponse> deleteNamespace({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.DeleteNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return DeleteNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified service. If the service still contains one or more
  /// registered instances, the request fails.
  ///
  /// May throw [InvalidInput].
  /// May throw [ServiceNotFound].
  /// May throw [ResourceInUse].
  ///
  /// Parameter [id] :
  /// The ID of the service that you want to delete.
  Future<void> deleteService({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.DeleteService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return DeleteServiceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the Amazon Route 53 DNS records and health check, if any, that AWS
  /// Cloud Map created for the specified instance.
  ///
  /// May throw [DuplicateRequest].
  /// May throw [InvalidInput].
  /// May throw [InstanceNotFound].
  /// May throw [ResourceInUse].
  /// May throw [ServiceNotFound].
  ///
  /// Parameter [instanceId] :
  /// The value that you specified for <code>Id</code> in the <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html">RegisterInstance</a>
  /// request.
  ///
  /// Parameter [serviceId] :
  /// The ID of the service that the instance is associated with.
  Future<DeregisterInstanceResponse> deregisterInstance({
    @_s.required String instanceId,
    @_s.required String serviceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceId, 'serviceId');
    _s.validateStringLength(
      'serviceId',
      serviceId,
      0,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.DeregisterInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        'ServiceId': serviceId,
      },
    );

    return DeregisterInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Discovers registered instances for a specified namespace and service. You
  /// can use <code>DiscoverInstances</code> to discover instances for any type
  /// of namespace. For public and private DNS namespaces, you can also use DNS
  /// queries to discover instances.
  ///
  /// May throw [ServiceNotFound].
  /// May throw [NamespaceNotFound].
  /// May throw [InvalidInput].
  /// May throw [RequestLimitExceeded].
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace that you specified when you registered the
  /// instance.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that you specified when you registered the
  /// instance.
  ///
  /// Parameter [healthStatus] :
  /// The health status of the instances that you want to discover.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of instances that you want AWS Cloud Map to return in
  /// the response to a <code>DiscoverInstances</code> request. If you don't
  /// specify a value for <code>MaxResults</code>, AWS Cloud Map returns up to
  /// 100 instances.
  ///
  /// Parameter [optionalParameters] :
  /// Opportunistic filters to scope the results based on custom attributes. If
  /// there are instances that match both the filters specified in both the
  /// <code>QueryParameters</code> parameter and this parameter, they are
  /// returned. Otherwise, these filters are ignored and only instances that
  /// match the filters specified in the <code>QueryParameters</code> parameter
  /// are returned.
  ///
  /// Parameter [queryParameters] :
  /// Filters to scope the results based on custom attributes for the instance.
  /// For example, <code>{version=v1, az=1a}</code>. Only instances that match
  /// all the specified key-value pairs will be returned.
  Future<DiscoverInstancesResponse> discoverInstances({
    @_s.required String namespaceName,
    @_s.required String serviceName,
    HealthStatusFilter healthStatus,
    int maxResults,
    Map<String, String> optionalParameters,
    Map<String, String> queryParameters,
  }) async {
    ArgumentError.checkNotNull(namespaceName, 'namespaceName');
    _s.validateStringLength(
      'namespaceName',
      namespaceName,
      0,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''((?=^.{1,127}$)^([a-zA-Z0-9_][a-zA-Z0-9-_]{0,61}[a-zA-Z0-9_]|[a-zA-Z0-9])(\.([a-zA-Z0-9_][a-zA-Z0-9-_]{0,61}[a-zA-Z0-9_]|[a-zA-Z0-9]))*$)|(^\.$)''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.DiscoverInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NamespaceName': namespaceName,
        'ServiceName': serviceName,
        if (healthStatus != null) 'HealthStatus': healthStatus.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (optionalParameters != null)
          'OptionalParameters': optionalParameters,
        if (queryParameters != null) 'QueryParameters': queryParameters,
      },
    );

    return DiscoverInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a specified instance.
  ///
  /// May throw [InstanceNotFound].
  /// May throw [InvalidInput].
  /// May throw [ServiceNotFound].
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance that you want to get information about.
  ///
  /// Parameter [serviceId] :
  /// The ID of the service that the instance is associated with.
  Future<GetInstanceResponse> getInstance({
    @_s.required String instanceId,
    @_s.required String serviceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceId, 'serviceId');
    _s.validateStringLength(
      'serviceId',
      serviceId,
      0,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.GetInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        'ServiceId': serviceId,
      },
    );

    return GetInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Gets the current health status (<code>Healthy</code>,
  /// <code>Unhealthy</code>, or <code>Unknown</code>) of one or more instances
  /// that are associated with a specified service.
  /// <note>
  /// There is a brief delay between when you register an instance and when the
  /// health status for the instance is available.
  /// </note>
  ///
  /// May throw [InstanceNotFound].
  /// May throw [InvalidInput].
  /// May throw [ServiceNotFound].
  ///
  /// Parameter [serviceId] :
  /// The ID of the service that the instance is associated with.
  ///
  /// Parameter [instances] :
  /// An array that contains the IDs of all the instances that you want to get
  /// the health status for.
  ///
  /// If you omit <code>Instances</code>, AWS Cloud Map returns the health
  /// status for all the instances that are associated with the specified
  /// service.
  /// <note>
  /// To get the IDs for the instances that you've registered by using a
  /// specified service, submit a <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_ListInstances.html">ListInstances</a>
  /// request.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of instances that you want AWS Cloud Map to return in
  /// the response to a <code>GetInstancesHealthStatus</code> request. If you
  /// don't specify a value for <code>MaxResults</code>, AWS Cloud Map returns
  /// up to 100 instances.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>GetInstancesHealthStatus</code> request, omit this
  /// value.
  ///
  /// If more than <code>MaxResults</code> instances match the specified
  /// criteria, you can submit another <code>GetInstancesHealthStatus</code>
  /// request to get the next group of results. Specify the value of
  /// <code>NextToken</code> from the previous response in the next request.
  Future<GetInstancesHealthStatusResponse> getInstancesHealthStatus({
    @_s.required String serviceId,
    List<String> instances,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(serviceId, 'serviceId');
    _s.validateStringLength(
      'serviceId',
      serviceId,
      0,
      64,
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
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.GetInstancesHealthStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceId': serviceId,
        if (instances != null) 'Instances': instances,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetInstancesHealthStatusResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a namespace.
  ///
  /// May throw [InvalidInput].
  /// May throw [NamespaceNotFound].
  ///
  /// Parameter [id] :
  /// The ID of the namespace that you want to get information about.
  Future<GetNamespaceResponse> getNamespace({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.GetNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return GetNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about any operation that returns an operation ID in the
  /// response, such as a <code>CreateService</code> request.
  /// <note>
  /// To get a list of operations that match specified criteria, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html">ListOperations</a>.
  /// </note>
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationNotFound].
  ///
  /// Parameter [operationId] :
  /// The ID of the operation that you want to get more information about.
  Future<GetOperationResponse> getOperation({
    @_s.required String operationId,
  }) async {
    ArgumentError.checkNotNull(operationId, 'operationId');
    _s.validateStringLength(
      'operationId',
      operationId,
      0,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.GetOperation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OperationId': operationId,
      },
    );

    return GetOperationResponse.fromJson(jsonResponse.body);
  }

  /// Gets the settings for a specified service.
  ///
  /// May throw [InvalidInput].
  /// May throw [ServiceNotFound].
  ///
  /// Parameter [id] :
  /// The ID of the service that you want to get settings for.
  Future<GetServiceResponse> getService({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.GetService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return GetServiceResponse.fromJson(jsonResponse.body);
  }

  /// Lists summary information about the instances that you registered by using
  /// a specified service.
  ///
  /// May throw [ServiceNotFound].
  /// May throw [InvalidInput].
  ///
  /// Parameter [serviceId] :
  /// The ID of the service that you want to list instances for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of instances that you want AWS Cloud Map to return in
  /// the response to a <code>ListInstances</code> request. If you don't specify
  /// a value for <code>MaxResults</code>, AWS Cloud Map returns up to 100
  /// instances.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListInstances</code> request, omit this value.
  ///
  /// If more than <code>MaxResults</code> instances match the specified
  /// criteria, you can submit another <code>ListInstances</code> request to get
  /// the next group of results. Specify the value of <code>NextToken</code>
  /// from the previous response in the next request.
  Future<ListInstancesResponse> listInstances({
    @_s.required String serviceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(serviceId, 'serviceId');
    _s.validateStringLength(
      'serviceId',
      serviceId,
      0,
      64,
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
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.ListInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceId': serviceId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Lists summary information about the namespaces that were created by the
  /// current AWS account.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [filters] :
  /// A complex type that contains specifications for the namespaces that you
  /// want to list.
  ///
  /// If you specify more than one filter, a namespace must match all filters to
  /// be returned by <code>ListNamespaces</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of namespaces that you want AWS Cloud Map to return in
  /// the response to a <code>ListNamespaces</code> request. If you don't
  /// specify a value for <code>MaxResults</code>, AWS Cloud Map returns up to
  /// 100 namespaces.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListNamespaces</code> request, omit this value.
  ///
  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListNamespaces</code> request to get the next group of results.
  /// Specify the value of <code>NextToken</code> from the previous response in
  /// the next request.
  /// <note>
  /// AWS Cloud Map gets <code>MaxResults</code> namespaces and then filters
  /// them based on the specified criteria. It's possible that no namespaces in
  /// the first <code>MaxResults</code> namespaces matched the specified
  /// criteria but that subsequent groups of <code>MaxResults</code> namespaces
  /// do contain namespaces that match the criteria.
  /// </note>
  Future<ListNamespacesResponse> listNamespaces({
    List<NamespaceFilter> filters,
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
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.ListNamespaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListNamespacesResponse.fromJson(jsonResponse.body);
  }

  /// Lists operations that match the criteria that you specify.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [filters] :
  /// A complex type that contains specifications for the operations that you
  /// want to list, for example, operations that you started between a specified
  /// start date and end date.
  ///
  /// If you specify more than one filter, an operation must match all filters
  /// to be returned by <code>ListOperations</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items that you want AWS Cloud Map to return in the
  /// response to a <code>ListOperations</code> request. If you don't specify a
  /// value for <code>MaxResults</code>, AWS Cloud Map returns up to 100
  /// operations.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListOperations</code> request, omit this value.
  ///
  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListOperations</code> request to get the next group of results.
  /// Specify the value of <code>NextToken</code> from the previous response in
  /// the next request.
  /// <note>
  /// AWS Cloud Map gets <code>MaxResults</code> operations and then filters
  /// them based on the specified criteria. It's possible that no operations in
  /// the first <code>MaxResults</code> operations matched the specified
  /// criteria but that subsequent groups of <code>MaxResults</code> operations
  /// do contain operations that match the criteria.
  /// </note>
  Future<ListOperationsResponse> listOperations({
    List<OperationFilter> filters,
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
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.ListOperations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListOperationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists summary information for all the services that are associated with
  /// one or more specified namespaces.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [filters] :
  /// A complex type that contains specifications for the namespaces that you
  /// want to list services for.
  ///
  /// If you specify more than one filter, an operation must match all filters
  /// to be returned by <code>ListServices</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of services that you want AWS Cloud Map to return in
  /// the response to a <code>ListServices</code> request. If you don't specify
  /// a value for <code>MaxResults</code>, AWS Cloud Map returns up to 100
  /// services.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListServices</code> request, omit this value.
  ///
  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListServices</code> request to get the next group of results.
  /// Specify the value of <code>NextToken</code> from the previous response in
  /// the next request.
  /// <note>
  /// AWS Cloud Map gets <code>MaxResults</code> services and then filters them
  /// based on the specified criteria. It's possible that no services in the
  /// first <code>MaxResults</code> services matched the specified criteria but
  /// that subsequent groups of <code>MaxResults</code> services do contain
  /// services that match the criteria.
  /// </note>
  Future<ListServicesResponse> listServices({
    List<ServiceFilter> filters,
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
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.ListServices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListServicesResponse.fromJson(jsonResponse.body);
  }

  /// Lists tags for the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidInput].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource that you want to retrieve
  /// tags for.
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
      'X-Amz-Target': 'Route53AutoNaming_v20170314.ListTagsForResource'
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

  /// Creates or updates one or more records and, optionally, creates a health
  /// check based on the settings in a specified service. When you submit a
  /// <code>RegisterInstance</code> request, the following occurs:
  ///
  /// <ul>
  /// <li>
  /// For each DNS record that you define in the service that is specified by
  /// <code>ServiceId</code>, a record is created or updated in the hosted zone
  /// that is associated with the corresponding namespace.
  /// </li>
  /// <li>
  /// If the service includes <code>HealthCheckConfig</code>, a health check is
  /// created based on the settings in the health check configuration.
  /// </li>
  /// <li>
  /// The health check, if any, is associated with each of the new or updated
  /// records.
  /// </li>
  /// </ul> <important>
  /// One <code>RegisterInstance</code> request must complete before you can
  /// submit another request and specify the same service ID and instance ID.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html">CreateService</a>.
  ///
  /// When AWS Cloud Map receives a DNS query for the specified DNS name, it
  /// returns the applicable value:
  ///
  /// <ul>
  /// <li>
  /// <b>If the health check is healthy</b>: returns all the records
  /// </li>
  /// <li>
  /// <b>If the health check is unhealthy</b>: returns the applicable value for
  /// the last healthy instance
  /// </li>
  /// <li>
  /// <b>If you didn't specify a health check configuration</b>: returns all the
  /// records
  /// </li>
  /// </ul>
  /// For the current quota on the number of instances that you can register
  /// using the same namespace and using the same service, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">AWS
  /// Cloud Map Limits</a> in the <i>AWS Cloud Map Developer Guide</i>.
  ///
  /// May throw [DuplicateRequest].
  /// May throw [InvalidInput].
  /// May throw [ResourceInUse].
  /// May throw [ResourceLimitExceeded].
  /// May throw [ServiceNotFound].
  ///
  /// Parameter [attributes] :
  /// A string map that contains the following information for the service that
  /// you specify in <code>ServiceId</code>:
  ///
  /// <ul>
  /// <li>
  /// The attributes that apply to the records that are defined in the service.
  /// </li>
  /// <li>
  /// For each attribute, the applicable value.
  /// </li>
  /// </ul>
  /// Supported attribute keys include the following:
  ///
  /// <b>AWS_ALIAS_DNS_NAME</b>
  ///
  /// If you want AWS Cloud Map to create an Amazon Route 53 alias record that
  /// routes traffic to an Elastic Load Balancing load balancer, specify the DNS
  /// name that is associated with the load balancer. For information about how
  /// to get the DNS name, see "DNSName" in the topic <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html">AliasTarget</a>
  /// in the <i>Route 53 API Reference</i>.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// The configuration for the service that is specified by
  /// <code>ServiceId</code> must include settings for an <code>A</code> record,
  /// an <code>AAAA</code> record, or both.
  /// </li>
  /// <li>
  /// In the service that is specified by <code>ServiceId</code>, the value of
  /// <code>RoutingPolicy</code> must be <code>WEIGHTED</code>.
  /// </li>
  /// <li>
  /// If the service that is specified by <code>ServiceId</code> includes
  /// <code>HealthCheckConfig</code> settings, AWS Cloud Map will create the
  /// Route 53 health check, but it won't associate the health check with the
  /// alias record.
  /// </li>
  /// <li>
  /// Auto naming currently doesn't support creating alias records that route
  /// traffic to AWS resources other than Elastic Load Balancing load balancers.
  /// </li>
  /// <li>
  /// If you specify a value for <code>AWS_ALIAS_DNS_NAME</code>, don't specify
  /// values for any of the <code>AWS_INSTANCE</code> attributes.
  /// </li>
  /// </ul>
  /// <b>AWS_EC2_INSTANCE_ID</b>
  ///
  /// <i>HTTP namespaces only.</i> The Amazon EC2 instance ID for the instance.
  /// If the <code>AWS_EC2_INSTANCE_ID</code> attribute is specified, then the
  /// only other attribute that can be specified is
  /// <code>AWS_INIT_HEALTH_STATUS</code>. When the
  /// <code>AWS_EC2_INSTANCE_ID</code> attribute is specified, then the
  /// <code>AWS_INSTANCE_IPV4</code> attribute will be filled out with the
  /// primary private IPv4 address.
  ///
  /// <b>AWS_INIT_HEALTH_STATUS</b>
  ///
  /// If the service configuration includes
  /// <code>HealthCheckCustomConfig</code>, you can optionally use
  /// <code>AWS_INIT_HEALTH_STATUS</code> to specify the initial status of the
  /// custom health check, <code>HEALTHY</code> or <code>UNHEALTHY</code>. If
  /// you don't specify a value for <code>AWS_INIT_HEALTH_STATUS</code>, the
  /// initial status is <code>HEALTHY</code>.
  ///
  /// <b>AWS_INSTANCE_CNAME</b>
  ///
  /// If the service configuration includes a <code>CNAME</code> record, the
  /// domain name that you want Route 53 to return in response to DNS queries,
  /// for example, <code>example.com</code>.
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>CNAME</code> record.
  ///
  /// <b>AWS_INSTANCE_IPV4</b>
  ///
  /// If the service configuration includes an <code>A</code> record, the IPv4
  /// address that you want Route 53 to return in response to DNS queries, for
  /// example, <code>192.0.2.44</code>.
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>A</code> record. If the service includes
  /// settings for an <code>SRV</code> record, you must specify a value for
  /// <code>AWS_INSTANCE_IPV4</code>, <code>AWS_INSTANCE_IPV6</code>, or both.
  ///
  /// <b>AWS_INSTANCE_IPV6</b>
  ///
  /// If the service configuration includes an <code>AAAA</code> record, the
  /// IPv6 address that you want Route 53 to return in response to DNS queries,
  /// for example, <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>.
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>AAAA</code> record. If the service includes
  /// settings for an <code>SRV</code> record, you must specify a value for
  /// <code>AWS_INSTANCE_IPV4</code>, <code>AWS_INSTANCE_IPV6</code>, or both.
  ///
  /// <b>AWS_INSTANCE_PORT</b>
  ///
  /// If the service includes an <code>SRV</code> record, the value that you
  /// want Route 53 to return for the port.
  ///
  /// If the service includes <code>HealthCheckConfig</code>, the port on the
  /// endpoint that you want Route 53 to send requests to.
  ///
  /// This value is required if you specified settings for an <code>SRV</code>
  /// record or a Route 53 health check when you created the service.
  ///
  /// <b>Custom attributes</b>
  ///
  /// You can add up to 30 custom attributes. For each key-value pair, the
  /// maximum length of the attribute name is 255 characters, and the maximum
  /// length of the attribute value is 1,024 characters. The total size of all
  /// provided attributes (sum of all keys and values) must not exceed 5,000
  /// characters.
  ///
  /// Parameter [instanceId] :
  /// An identifier that you want to associate with the instance. Note the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// If the service that is specified by <code>ServiceId</code> includes
  /// settings for an <code>SRV</code> record, the value of
  /// <code>InstanceId</code> is automatically included as part of the value for
  /// the <code>SRV</code> record. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DnsRecord.html#cloudmap-Type-DnsRecord-Type">DnsRecord
  /// &gt; Type</a>.
  /// </li>
  /// <li>
  /// You can use this value to update an existing instance.
  /// </li>
  /// <li>
  /// To register a new instance, you must specify a value that is unique among
  /// instances that you register by using the same service.
  /// </li>
  /// <li>
  /// If you specify an existing <code>InstanceId</code> and
  /// <code>ServiceId</code>, AWS Cloud Map updates the existing DNS records, if
  /// any. If there's also an existing health check, AWS Cloud Map deletes the
  /// old health check and creates a new one.
  /// <note>
  /// The health check isn't deleted immediately, so it will still appear for a
  /// while if you submit a <code>ListHealthChecks</code> request, for example.
  /// </note> </li>
  /// </ul>
  ///
  /// Parameter [serviceId] :
  /// The ID of the service that you want to use for settings for the instance.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>RegisterInstance</code> requests to be retried without the risk of
  /// executing the operation twice. You must use a unique
  /// <code>CreatorRequestId</code> string every time you submit a
  /// <code>RegisterInstance</code> request if you're registering additional
  /// instances for the same namespace and service.
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
  Future<RegisterInstanceResponse> registerInstance({
    @_s.required Map<String, String> attributes,
    @_s.required String instanceId,
    @_s.required String serviceId,
    String creatorRequestId,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceId, 'serviceId');
    _s.validateStringLength(
      'serviceId',
      serviceId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      0,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.RegisterInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Attributes': attributes,
        'InstanceId': instanceId,
        'ServiceId': serviceId,
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
      },
    );

    return RegisterInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Adds one or more tags to the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidInput].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource that you want to retrieve
  /// tags for.
  ///
  /// Parameter [tags] :
  /// The tags to add to the specified resource. Specifying the tag key is
  /// required. You can set the value of a tag to an empty string, but you can't
  /// set the value of a tag to null.
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
      'X-Amz-Target': 'Route53AutoNaming_v20170314.TagResource'
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

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidInput].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource that you want to retrieve
  /// tags for.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to remove from the specified resource.
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
      'X-Amz-Target': 'Route53AutoNaming_v20170314.UntagResource'
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

  /// Submits a request to change the health status of a custom health check to
  /// healthy or unhealthy.
  ///
  /// You can use <code>UpdateInstanceCustomHealthStatus</code> to change the
  /// status only for custom health checks, which you define using
  /// <code>HealthCheckCustomConfig</code> when you create a service. You can't
  /// use it to change the status for Route 53 health checks, which you define
  /// using <code>HealthCheckConfig</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_HealthCheckCustomConfig.html">HealthCheckCustomConfig</a>.
  ///
  /// May throw [InstanceNotFound].
  /// May throw [ServiceNotFound].
  /// May throw [CustomHealthNotFound].
  /// May throw [InvalidInput].
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance that you want to change the health status for.
  ///
  /// Parameter [serviceId] :
  /// The ID of the service that includes the configuration for the custom
  /// health check that you want to change the status for.
  ///
  /// Parameter [status] :
  /// The new status of the instance, <code>HEALTHY</code> or
  /// <code>UNHEALTHY</code>.
  Future<void> updateInstanceCustomHealthStatus({
    @_s.required String instanceId,
    @_s.required String serviceId,
    @_s.required CustomHealthStatus status,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceId, 'serviceId');
    _s.validateStringLength(
      'serviceId',
      serviceId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'Route53AutoNaming_v20170314.UpdateInstanceCustomHealthStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        'ServiceId': serviceId,
        'Status': status?.toValue() ?? '',
      },
    );
  }

  /// Submits a request to perform the following operations:
  ///
  /// <ul>
  /// <li>
  /// Update the TTL setting for existing <code>DnsRecords</code> configurations
  /// </li>
  /// <li>
  /// Add, update, or delete <code>HealthCheckConfig</code> for a specified
  /// service
  /// <note>
  /// You can't add, update, or delete a <code>HealthCheckCustomConfig</code>
  /// configuration.
  /// </note> </li>
  /// </ul>
  /// For public and private DNS namespaces, note the following:
  ///
  /// <ul>
  /// <li>
  /// If you omit any existing <code>DnsRecords</code> or
  /// <code>HealthCheckConfig</code> configurations from an
  /// <code>UpdateService</code> request, the configurations are deleted from
  /// the service.
  /// </li>
  /// <li>
  /// If you omit an existing <code>HealthCheckCustomConfig</code> configuration
  /// from an <code>UpdateService</code> request, the configuration is not
  /// deleted from the service.
  /// </li>
  /// </ul>
  /// When you update settings for a service, AWS Cloud Map also updates the
  /// corresponding settings in all the records and health checks that were
  /// created by using the specified service.
  ///
  /// May throw [DuplicateRequest].
  /// May throw [InvalidInput].
  /// May throw [ServiceNotFound].
  ///
  /// Parameter [id] :
  /// The ID of the service that you want to update.
  ///
  /// Parameter [service] :
  /// A complex type that contains the new settings for the service.
  Future<UpdateServiceResponse> updateService({
    @_s.required String id,
    @_s.required ServiceChange service,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(service, 'service');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.UpdateService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Service': service,
      },
    );

    return UpdateServiceResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateHttpNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  CreateHttpNamespaceResponse({
    this.operationId,
  });
  factory CreateHttpNamespaceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateHttpNamespaceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePrivateDnsNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  CreatePrivateDnsNamespaceResponse({
    this.operationId,
  });
  factory CreatePrivateDnsNamespaceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreatePrivateDnsNamespaceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePublicDnsNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  CreatePublicDnsNamespaceResponse({
    this.operationId,
  });
  factory CreatePublicDnsNamespaceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreatePublicDnsNamespaceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateServiceResponse {
  /// A complex type that contains information about the new service.
  @_s.JsonKey(name: 'Service')
  final Service service;

  CreateServiceResponse({
    this.service,
  });
  factory CreateServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateServiceResponseFromJson(json);
}

enum CustomHealthStatus {
  @_s.JsonValue('HEALTHY')
  healthy,
  @_s.JsonValue('UNHEALTHY')
  unhealthy,
}

extension on CustomHealthStatus {
  String toValue() {
    switch (this) {
      case CustomHealthStatus.healthy:
        return 'HEALTHY';
      case CustomHealthStatus.unhealthy:
        return 'UNHEALTHY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  DeleteNamespaceResponse({
    this.operationId,
  });
  factory DeleteNamespaceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteNamespaceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteServiceResponse {
  DeleteServiceResponse();
  factory DeleteServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteServiceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterInstanceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  DeregisterInstanceResponse({
    this.operationId,
  });
  factory DeregisterInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeregisterInstanceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DiscoverInstancesResponse {
  /// A complex type that contains one <code>HttpInstanceSummary</code> for each
  /// registered instance.
  @_s.JsonKey(name: 'Instances')
  final List<HttpInstanceSummary> instances;

  DiscoverInstancesResponse({
    this.instances,
  });
  factory DiscoverInstancesResponse.fromJson(Map<String, dynamic> json) =>
      _$DiscoverInstancesResponseFromJson(json);
}

/// A complex type that contains information about the Amazon Route 53 DNS
/// records that you want AWS Cloud Map to create when you register an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DnsConfig {
  /// An array that contains one <code>DnsRecord</code> object for each Route 53
  /// DNS record that you want AWS Cloud Map to create when you register an
  /// instance.
  @_s.JsonKey(name: 'DnsRecords')
  final List<DnsRecord> dnsRecords;

  /// The ID of the namespace to use for DNS configuration.
  @_s.JsonKey(name: 'NamespaceId')
  final String namespaceId;

  /// The routing policy that you want to apply to all Route 53 DNS records that
  /// AWS Cloud Map creates when you register an instance and specify this
  /// service.
  /// <note>
  /// If you want to use this service to register instances that create alias
  /// records, specify <code>WEIGHTED</code> for the routing policy.
  /// </note>
  /// You can specify the following values:
  ///
  /// <b>MULTIVALUE</b>
  ///
  /// If you define a health check for the service and the health check is
  /// healthy, Route 53 returns the applicable value for up to eight instances.
  ///
  /// For example, suppose the service includes configurations for one
  /// <code>A</code> record and a health check, and you use the service to
  /// register 10 instances. Route 53 responds to DNS queries with IP addresses
  /// for up to eight healthy instances. If fewer than eight instances are
  /// healthy, Route 53 responds to every DNS query with the IP addresses for all
  /// of the healthy instances.
  ///
  /// If you don't define a health check for the service, Route 53 assumes that
  /// all instances are healthy and returns the values for up to eight instances.
  ///
  /// For more information about the multivalue routing policy, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-multivalue">Multivalue
  /// Answer Routing</a> in the <i>Route 53 Developer Guide</i>.
  ///
  /// <b>WEIGHTED</b>
  ///
  /// Route 53 returns the applicable value from one randomly selected instance
  /// from among the instances that you registered using the same service.
  /// Currently, all records have the same weight, so you can't route more or less
  /// traffic to any instances.
  ///
  /// For example, suppose the service includes configurations for one
  /// <code>A</code> record and a health check, and you use the service to
  /// register 10 instances. Route 53 responds to DNS queries with the IP address
  /// for one randomly selected instance from among the healthy instances. If no
  /// instances are healthy, Route 53 responds to DNS queries as if all of the
  /// instances were healthy.
  ///
  /// If you don't define a health check for the service, Route 53 assumes that
  /// all instances are healthy and returns the applicable value for one randomly
  /// selected instance.
  ///
  /// For more information about the weighted routing policy, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-weighted">Weighted
  /// Routing</a> in the <i>Route 53 Developer Guide</i>.
  @_s.JsonKey(name: 'RoutingPolicy')
  final RoutingPolicy routingPolicy;

  DnsConfig({
    @_s.required this.dnsRecords,
    this.namespaceId,
    this.routingPolicy,
  });
  factory DnsConfig.fromJson(Map<String, dynamic> json) =>
      _$DnsConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DnsConfigToJson(this);
}

/// A complex type that contains information about changes to the Route 53 DNS
/// records that AWS Cloud Map creates when you register an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DnsConfigChange {
  /// An array that contains one <code>DnsRecord</code> object for each Route 53
  /// record that you want AWS Cloud Map to create when you register an instance.
  @_s.JsonKey(name: 'DnsRecords')
  final List<DnsRecord> dnsRecords;

  DnsConfigChange({
    @_s.required this.dnsRecords,
  });
  Map<String, dynamic> toJson() => _$DnsConfigChangeToJson(this);
}

/// A complex type that contains the ID for the Route 53 hosted zone that AWS
/// Cloud Map creates when you create a namespace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DnsProperties {
  /// The ID for the Route 53 hosted zone that AWS Cloud Map creates when you
  /// create a namespace.
  @_s.JsonKey(name: 'HostedZoneId')
  final String hostedZoneId;

  DnsProperties({
    this.hostedZoneId,
  });
  factory DnsProperties.fromJson(Map<String, dynamic> json) =>
      _$DnsPropertiesFromJson(json);
}

/// A complex type that contains information about the Route 53 DNS records that
/// you want AWS Cloud Map to create when you register an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DnsRecord {
  /// The amount of time, in seconds, that you want DNS resolvers to cache the
  /// settings for this record.
  /// <note>
  /// Alias records don't include a TTL because Route 53 uses the TTL for the AWS
  /// resource that an alias record routes traffic to. If you include the
  /// <code>AWS_ALIAS_DNS_NAME</code> attribute when you submit a <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html">RegisterInstance</a>
  /// request, the <code>TTL</code> value is ignored. Always specify a TTL for the
  /// service; you can use a service to register instances that create either
  /// alias or non-alias records.
  /// </note>
  @_s.JsonKey(name: 'TTL')
  final int ttl;

  /// The type of the resource, which indicates the type of value that Route 53
  /// returns in response to DNS queries. You can specify values for
  /// <code>Type</code> in the following combinations:
  ///
  /// <ul>
  /// <li>
  /// <code>A</code>
  /// </li>
  /// <li>
  /// <code>AAAA</code>
  /// </li>
  /// <li>
  /// <code>A</code> and <code>AAAA</code>
  /// </li>
  /// <li>
  /// <code>SRV</code>
  /// </li>
  /// <li>
  /// <code>CNAME</code>
  /// </li>
  /// </ul>
  /// If you want AWS Cloud Map to create a Route 53 alias record when you
  /// register an instance, specify <code>A</code> or <code>AAAA</code> for
  /// <code>Type</code>.
  ///
  /// You specify other settings, such as the IP address for <code>A</code> and
  /// <code>AAAA</code> records, when you register an instance. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html">RegisterInstance</a>.
  ///
  /// The following values are supported:
  ///
  /// <code>A</code> <b> <code/> </b>
  ///
  /// Route 53 returns the IP address of the resource in IPv4 format, such as
  /// 192.0.2.44.
  ///
  /// <code>AAAA</code> <b> <code/> </b>
  ///
  /// Route 53 returns the IP address of the resource in IPv6 format, such as
  /// 2001:0db8:85a3:0000:0000:abcd:0001:2345.
  ///
  /// <code>CNAME</code> <b> <code/> </b>
  ///
  /// Route 53 returns the domain name of the resource, such as www.example.com.
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// You specify the domain name that you want to route traffic to when you
  /// register an instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html#cloudmap-RegisterInstance-request-Attributes">Attributes</a>
  /// in the topic <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html">RegisterInstance</a>.
  /// </li>
  /// <li>
  /// You must specify <code>WEIGHTED</code> for the value of
  /// <code>RoutingPolicy</code>.
  /// </li>
  /// <li>
  /// You can't specify both <code>CNAME</code> for <code>Type</code> and settings
  /// for <code>HealthCheckConfig</code>. If you do, the request will fail with an
  /// <code>InvalidInput</code> error.
  /// </li>
  /// </ul>
  /// <b>SRV</b>
  ///
  /// Route 53 returns the value for an <code>SRV</code> record. The value for an
  /// <code>SRV</code> record uses the following values:
  ///
  /// <code>priority weight port service-hostname</code>
  ///
  /// Note the following about the values:
  ///
  /// <ul>
  /// <li>
  /// The values of <code>priority</code> and <code>weight</code> are both set to
  /// <code>1</code> and can't be changed.
  /// </li>
  /// <li>
  /// The value of <code>port</code> comes from the value that you specify for the
  /// <code>AWS_INSTANCE_PORT</code> attribute when you submit a <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html">RegisterInstance</a>
  /// request.
  /// </li>
  /// <li>
  /// The value of <code>service-hostname</code> is a concatenation of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// The value that you specify for <code>InstanceId</code> when you register an
  /// instance.
  /// </li>
  /// <li>
  /// The name of the service.
  /// </li>
  /// <li>
  /// The name of the namespace.
  /// </li>
  /// </ul>
  /// For example, if the value of <code>InstanceId</code> is <code>test</code>,
  /// the name of the service is <code>backend</code>, and the name of the
  /// namespace is <code>example.com</code>, the value of
  /// <code>service-hostname</code> is:
  ///
  /// <code>test.backend.example.com</code>
  /// </li>
  /// </ul>
  /// If you specify settings for an <code>SRV</code> record, note the following:
  ///
  /// <ul>
  /// <li>
  /// If you specify values for <code>AWS_INSTANCE_IPV4</code>,
  /// <code>AWS_INSTANCE_IPV6</code>, or both in the <code>RegisterInstance</code>
  /// request, AWS Cloud Map automatically creates <code>A</code> and/or
  /// <code>AAAA</code> records that have the same name as the value of
  /// <code>service-hostname</code> in the <code>SRV</code> record. You can ignore
  /// these records.
  /// </li>
  /// <li>
  /// If you're using a system that requires a specific <code>SRV</code> format,
  /// such as HAProxy, see the <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html#cloudmap-CreateService-request-Name">Name</a>
  /// element in the documentation about <code>CreateService</code> for
  /// information about how to specify the correct name format.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final RecordType type;

  DnsRecord({
    @_s.required this.ttl,
    @_s.required this.type,
  });
  factory DnsRecord.fromJson(Map<String, dynamic> json) =>
      _$DnsRecordFromJson(json);

  Map<String, dynamic> toJson() => _$DnsRecordToJson(this);
}

enum FilterCondition {
  @_s.JsonValue('EQ')
  eq,
  @_s.JsonValue('IN')
  $in,
  @_s.JsonValue('BETWEEN')
  between,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstanceResponse {
  /// A complex type that contains information about a specified instance.
  @_s.JsonKey(name: 'Instance')
  final Instance instance;

  GetInstanceResponse({
    this.instance,
  });
  factory GetInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInstanceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstancesHealthStatusResponse {
  /// If more than <code>MaxResults</code> instances match the specified criteria,
  /// you can submit another <code>GetInstancesHealthStatus</code> request to get
  /// the next group of results. Specify the value of <code>NextToken</code> from
  /// the previous response in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A complex type that contains the IDs and the health status of the instances
  /// that you specified in the <code>GetInstancesHealthStatus</code> request.
  @_s.JsonKey(name: 'Status')
  final Map<String, HealthStatus> status;

  GetInstancesHealthStatusResponse({
    this.nextToken,
    this.status,
  });
  factory GetInstancesHealthStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetInstancesHealthStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetNamespaceResponse {
  /// A complex type that contains information about the specified namespace.
  @_s.JsonKey(name: 'Namespace')
  final Namespace namespace;

  GetNamespaceResponse({
    this.namespace,
  });
  factory GetNamespaceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNamespaceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOperationResponse {
  /// A complex type that contains information about the operation.
  @_s.JsonKey(name: 'Operation')
  final Operation operation;

  GetOperationResponse({
    this.operation,
  });
  factory GetOperationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOperationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServiceResponse {
  /// A complex type that contains information about the service.
  @_s.JsonKey(name: 'Service')
  final Service service;

  GetServiceResponse({
    this.service,
  });
  factory GetServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServiceResponseFromJson(json);
}

/// <i>Public DNS and HTTP namespaces only.</i> A complex type that contains
/// settings for an optional health check. If you specify settings for a health
/// check, AWS Cloud Map associates the health check with the records that you
/// specify in <code>DnsConfig</code>.
/// <important>
/// If you specify a health check configuration, you can specify either
/// <code>HealthCheckCustomConfig</code> or <code>HealthCheckConfig</code> but
/// not both.
/// </important>
/// Health checks are basic Route 53 health checks that monitor an AWS endpoint.
/// For information about pricing for health checks, see <a
/// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
///
/// Note the following about configuring health checks.
///
/// <b> <code>A</code> and <code>AAAA</code> records</b>
///
/// If <code>DnsConfig</code> includes configurations for both <code>A</code>
/// and <code>AAAA</code> records, AWS Cloud Map creates a health check that
/// uses the IPv4 address to check the health of the resource. If the endpoint
/// that is specified by the IPv4 address is unhealthy, Route 53 considers both
/// the <code>A</code> and <code>AAAA</code> records to be unhealthy.
///
/// <b> <code>CNAME</code> records</b>
///
/// You can't specify settings for <code>HealthCheckConfig</code> when the
/// <code>DNSConfig</code> includes <code>CNAME</code> for the value of
/// <code>Type</code>. If you do, the <code>CreateService</code> request will
/// fail with an <code>InvalidInput</code> error.
///
/// <b>Request interval</b>
///
/// A Route 53 health checker in each health-checking region sends a health
/// check request to an endpoint every 30 seconds. On average, your endpoint
/// receives a health check request about every two seconds. However, health
/// checkers don't coordinate with one another, so you'll sometimes see several
/// requests per second followed by a few seconds with no health checks at all.
///
/// <b>Health checking regions</b>
///
/// Health checkers perform checks from all Route 53 health-checking regions.
/// For a list of the current regions, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-Regions">Regions</a>.
///
/// <b>Alias records</b>
///
/// When you register an instance, if you include the
/// <code>AWS_ALIAS_DNS_NAME</code> attribute, AWS Cloud Map creates a Route 53
/// alias record. Note the following:
///
/// <ul>
/// <li>
/// Route 53 automatically sets <code>EvaluateTargetHealth</code> to true for
/// alias records. When <code>EvaluateTargetHealth</code> is true, the alias
/// record inherits the health of the referenced AWS resource. such as an ELB
/// load balancer. For more information, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html#Route53-Type-AliasTarget-EvaluateTargetHealth">EvaluateTargetHealth</a>.
/// </li>
/// <li>
/// If you include <code>HealthCheckConfig</code> and then use the service to
/// register an instance that creates an alias record, Route 53 doesn't create
/// the health check.
/// </li>
/// </ul>
/// <b>Charges for health checks</b>
///
/// Health checks are basic Route 53 health checks that monitor an AWS endpoint.
/// For information about pricing for health checks, see <a
/// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HealthCheckConfig {
  /// The type of health check that you want to create, which indicates how
  /// Route 53 determines whether an endpoint is healthy.
  /// <important>
  /// You can't change the value of <code>Type</code> after you create a health
  /// check.
  /// </important>
  /// You can create the following types of health checks:
  ///
  /// <ul>
  /// <li>
  /// <b>HTTP</b>: Route 53 tries to establish a TCP connection. If successful,
  /// Route 53 submits an HTTP request and waits for an HTTP status code of 200 or
  /// greater and less than 400.
  /// </li>
  /// <li>
  /// <b>HTTPS</b>: Route 53 tries to establish a TCP connection. If successful,
  /// Route 53 submits an HTTPS request and waits for an HTTP status code of 200
  /// or greater and less than 400.
  /// <important>
  /// If you specify HTTPS for the value of <code>Type</code>, the endpoint must
  /// support TLS v1.0 or later.
  /// </important> </li>
  /// <li>
  /// <b>TCP</b>: Route 53 tries to establish a TCP connection.
  ///
  /// If you specify <code>TCP</code> for <code>Type</code>, don't specify a value
  /// for <code>ResourcePath</code>.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How
  /// Route 53 Determines Whether an Endpoint Is Healthy</a> in the <i>Route 53
  /// Developer Guide</i>.
  @_s.JsonKey(name: 'Type')
  final HealthCheckType type;

  /// The number of consecutive health checks that an endpoint must pass or fail
  /// for Route 53 to change the current status of the endpoint from unhealthy to
  /// healthy or vice versa. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How
  /// Route 53 Determines Whether an Endpoint Is Healthy</a> in the <i>Route 53
  /// Developer Guide</i>.
  @_s.JsonKey(name: 'FailureThreshold')
  final int failureThreshold;

  /// The path that you want Route 53 to request when performing health checks.
  /// The path can be any value for which your endpoint will return an HTTP status
  /// code of 2xx or 3xx when the endpoint is healthy, such as the file
  /// <code>/docs/route53-health-check.html</code>. Route 53 automatically adds
  /// the DNS name for the service. If you don't specify a value for
  /// <code>ResourcePath</code>, the default value is <code>/</code>.
  ///
  /// If you specify <code>TCP</code> for <code>Type</code>, you must <i>not</i>
  /// specify a value for <code>ResourcePath</code>.
  @_s.JsonKey(name: 'ResourcePath')
  final String resourcePath;

  HealthCheckConfig({
    @_s.required this.type,
    this.failureThreshold,
    this.resourcePath,
  });
  factory HealthCheckConfig.fromJson(Map<String, dynamic> json) =>
      _$HealthCheckConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HealthCheckConfigToJson(this);
}

/// A complex type that contains information about an optional custom health
/// check. A custom health check, which requires that you use a third-party
/// health checker to evaluate the health of your resources, is useful in the
/// following circumstances:
///
/// <ul>
/// <li>
/// You can't use a health check that is defined by
/// <code>HealthCheckConfig</code> because the resource isn't available over the
/// internet. For example, you can use a custom health check when the instance
/// is in an Amazon VPC. (To check the health of resources in a VPC, the health
/// checker must also be in the VPC.)
/// </li>
/// <li>
/// You want to use a third-party health checker regardless of where your
/// resources are.
/// </li>
/// </ul> <important>
/// If you specify a health check configuration, you can specify either
/// <code>HealthCheckCustomConfig</code> or <code>HealthCheckConfig</code> but
/// not both.
/// </important>
/// To change the status of a custom health check, submit an
/// <code>UpdateInstanceCustomHealthStatus</code> request. AWS Cloud Map doesn't
/// monitor the status of the resource, it just keeps a record of the status
/// specified in the most recent <code>UpdateInstanceCustomHealthStatus</code>
/// request.
///
/// Here's how custom health checks work:
/// <ol>
/// <li>
/// You create a service and specify a value for <code>FailureThreshold</code>.
///
/// The failure threshold indicates the number of 30-second intervals you want
/// AWS Cloud Map to wait between the time that your application sends an <a
/// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_UpdateInstanceCustomHealthStatus.html">UpdateInstanceCustomHealthStatus</a>
/// request and the time that AWS Cloud Map stops routing internet traffic to
/// the corresponding resource.
/// </li>
/// <li>
/// You register an instance.
/// </li>
/// <li>
/// You configure a third-party health checker to monitor the resource that is
/// associated with the new instance.
/// <note>
/// AWS Cloud Map doesn't check the health of the resource directly.
/// </note> </li>
/// <li>
/// The third-party health-checker determines that the resource is unhealthy and
/// notifies your application.
/// </li>
/// <li>
/// Your application submits an <code>UpdateInstanceCustomHealthStatus</code>
/// request.
/// </li>
/// <li>
/// AWS Cloud Map waits for (<code>FailureThreshold</code> x 30) seconds.
/// </li>
/// <li>
/// If another <code>UpdateInstanceCustomHealthStatus</code> request doesn't
/// arrive during that time to change the status back to healthy, AWS Cloud Map
/// stops routing traffic to the resource.
/// </li> </ol>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HealthCheckCustomConfig {
  /// <important>
  /// This parameter has been deprecated and is always set to 1. AWS Cloud Map
  /// waits for approximately 30 seconds after receiving an
  /// <code>UpdateInstanceCustomHealthStatus</code> request before changing the
  /// status of the service instance.
  /// </important>
  /// The number of 30-second intervals that you want AWS Cloud Map to wait after
  /// receiving an <code>UpdateInstanceCustomHealthStatus</code> request before it
  /// changes the health status of a service instance.
  ///
  /// Sending a second or subsequent <code>UpdateInstanceCustomHealthStatus</code>
  /// request with the same value before 30 seconds has passed doesn't accelerate
  /// the change. AWS Cloud Map still waits <code>30</code> seconds after the
  /// first request to make the change.
  @_s.JsonKey(name: 'FailureThreshold')
  final int failureThreshold;

  HealthCheckCustomConfig({
    this.failureThreshold,
  });
  factory HealthCheckCustomConfig.fromJson(Map<String, dynamic> json) =>
      _$HealthCheckCustomConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HealthCheckCustomConfigToJson(this);
}

enum HealthCheckType {
  @_s.JsonValue('HTTP')
  http,
  @_s.JsonValue('HTTPS')
  https,
  @_s.JsonValue('TCP')
  tcp,
}

enum HealthStatus {
  @_s.JsonValue('HEALTHY')
  healthy,
  @_s.JsonValue('UNHEALTHY')
  unhealthy,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

enum HealthStatusFilter {
  @_s.JsonValue('HEALTHY')
  healthy,
  @_s.JsonValue('UNHEALTHY')
  unhealthy,
  @_s.JsonValue('ALL')
  all,
}

extension on HealthStatusFilter {
  String toValue() {
    switch (this) {
      case HealthStatusFilter.healthy:
        return 'HEALTHY';
      case HealthStatusFilter.unhealthy:
        return 'UNHEALTHY';
      case HealthStatusFilter.all:
        return 'ALL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// In a response to a <a
/// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>
/// request, <code>HttpInstanceSummary</code> contains information about one
/// instance that matches the values that you specified in the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HttpInstanceSummary {
  /// If you included any attributes when you registered the instance, the values
  /// of those attributes.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// If you configured health checking in the service, the current health status
  /// of the service instance.
  @_s.JsonKey(name: 'HealthStatus')
  final HealthStatus healthStatus;

  /// The ID of an instance that matches the values that you specified in the
  /// request.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The name of the namespace that you specified when you registered the
  /// instance.
  @_s.JsonKey(name: 'NamespaceName')
  final String namespaceName;

  /// The name of the service that you specified when you registered the instance.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  HttpInstanceSummary({
    this.attributes,
    this.healthStatus,
    this.instanceId,
    this.namespaceName,
    this.serviceName,
  });
  factory HttpInstanceSummary.fromJson(Map<String, dynamic> json) =>
      _$HttpInstanceSummaryFromJson(json);
}

/// A complex type that contains the name of an HTTP namespace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HttpProperties {
  /// The name of an HTTP namespace.
  @_s.JsonKey(name: 'HttpName')
  final String httpName;

  HttpProperties({
    this.httpName,
  });
  factory HttpProperties.fromJson(Map<String, dynamic> json) =>
      _$HttpPropertiesFromJson(json);
}

/// A complex type that contains information about an instance that AWS Cloud
/// Map creates when you submit a <code>RegisterInstance</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Instance {
  /// An identifier that you want to associate with the instance. Note the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// If the service that is specified by <code>ServiceId</code> includes settings
  /// for an <code>SRV</code> record, the value of <code>InstanceId</code> is
  /// automatically included as part of the value for the <code>SRV</code> record.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DnsRecord.html#cloudmap-Type-DnsRecord-Type">DnsRecord
  /// &gt; Type</a>.
  /// </li>
  /// <li>
  /// You can use this value to update an existing instance.
  /// </li>
  /// <li>
  /// To register a new instance, you must specify a value that is unique among
  /// instances that you register by using the same service.
  /// </li>
  /// <li>
  /// If you specify an existing <code>InstanceId</code> and
  /// <code>ServiceId</code>, AWS Cloud Map updates the existing DNS records. If
  /// there's also an existing health check, AWS Cloud Map deletes the old health
  /// check and creates a new one.
  /// <note>
  /// The health check isn't deleted immediately, so it will still appear for a
  /// while if you submit a <code>ListHealthChecks</code> request, for example.
  /// </note> </li>
  /// </ul>
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A string map that contains the following information for the service that
  /// you specify in <code>ServiceId</code>:
  ///
  /// <ul>
  /// <li>
  /// The attributes that apply to the records that are defined in the service.
  /// </li>
  /// <li>
  /// For each attribute, the applicable value.
  /// </li>
  /// </ul>
  /// Supported attribute keys include the following:
  ///
  /// <b>AWS_ALIAS_DNS_NAME</b>
  ///
  /// <b/>
  ///
  /// If you want AWS Cloud Map to create a Route 53 alias record that routes
  /// traffic to an Elastic Load Balancing load balancer, specify the DNS name
  /// that is associated with the load balancer. For information about how to get
  /// the DNS name, see "DNSName" in the topic <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html">AliasTarget</a>.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// The configuration for the service that is specified by
  /// <code>ServiceId</code> must include settings for an <code>A</code> record,
  /// an <code>AAAA</code> record, or both.
  /// </li>
  /// <li>
  /// In the service that is specified by <code>ServiceId</code>, the value of
  /// <code>RoutingPolicy</code> must be <code>WEIGHTED</code>.
  /// </li>
  /// <li>
  /// If the service that is specified by <code>ServiceId</code> includes
  /// <code>HealthCheckConfig</code> settings, AWS Cloud Map will create the
  /// health check, but it won't associate the health check with the alias record.
  /// </li>
  /// <li>
  /// Auto naming currently doesn't support creating alias records that route
  /// traffic to AWS resources other than ELB load balancers.
  /// </li>
  /// <li>
  /// If you specify a value for <code>AWS_ALIAS_DNS_NAME</code>, don't specify
  /// values for any of the <code>AWS_INSTANCE</code> attributes.
  /// </li>
  /// </ul>
  /// <b>AWS_EC2_INSTANCE_ID</b>
  ///
  /// <i>HTTP namespaces only.</i> The Amazon EC2 instance ID for the instance.
  /// The <code>AWS_INSTANCE_IPV4</code> attribute contains the primary private
  /// IPv4 address.
  ///
  /// <b>AWS_INSTANCE_CNAME</b>
  ///
  /// If the service configuration includes a <code>CNAME</code> record, the
  /// domain name that you want Route 53 to return in response to DNS queries, for
  /// example, <code>example.com</code>.
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>CNAME</code> record.
  ///
  /// <b>AWS_INSTANCE_IPV4</b>
  ///
  /// If the service configuration includes an <code>A</code> record, the IPv4
  /// address that you want Route 53 to return in response to DNS queries, for
  /// example, <code>192.0.2.44</code>.
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>A</code> record. If the service includes
  /// settings for an <code>SRV</code> record, you must specify a value for
  /// <code>AWS_INSTANCE_IPV4</code>, <code>AWS_INSTANCE_IPV6</code>, or both.
  ///
  /// <b>AWS_INSTANCE_IPV6</b>
  ///
  /// If the service configuration includes an <code>AAAA</code> record, the IPv6
  /// address that you want Route 53 to return in response to DNS queries, for
  /// example, <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>.
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>AAAA</code> record. If the service includes
  /// settings for an <code>SRV</code> record, you must specify a value for
  /// <code>AWS_INSTANCE_IPV4</code>, <code>AWS_INSTANCE_IPV6</code>, or both.
  ///
  /// <b>AWS_INSTANCE_PORT</b>
  ///
  /// If the service includes an <code>SRV</code> record, the value that you want
  /// Route 53 to return for the port.
  ///
  /// If the service includes <code>HealthCheckConfig</code>, the port on the
  /// endpoint that you want Route 53 to send requests to.
  ///
  /// This value is required if you specified settings for an <code>SRV</code>
  /// record or a Route 53 health check when you created the service.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// A unique string that identifies the request and that allows failed
  /// <code>RegisterInstance</code> requests to be retried without the risk of
  /// executing the operation twice. You must use a unique
  /// <code>CreatorRequestId</code> string every time you submit a
  /// <code>RegisterInstance</code> request if you're registering additional
  /// instances for the same namespace and service. <code>CreatorRequestId</code>
  /// can be any unique string, for example, a date/time stamp.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  Instance({
    @_s.required this.id,
    this.attributes,
    this.creatorRequestId,
  });
  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

/// A complex type that contains information about the instances that you
/// registered by using a specified service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceSummary {
  /// A string map that contains the following information:
  ///
  /// <ul>
  /// <li>
  /// The attributes that are associate with the instance.
  /// </li>
  /// <li>
  /// For each attribute, the applicable value.
  /// </li>
  /// </ul>
  /// Supported attribute keys include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS_ALIAS_DNS_NAME</code>: For an alias record that routes traffic to
  /// an Elastic Load Balancing load balancer, the DNS name that is associated
  /// with the load balancer.
  /// </li>
  /// <li>
  /// <code>AWS_EC2_INSTANCE_ID</code>: (HTTP namespaces only) The Amazon EC2
  /// instance ID for the instance. When the <code>AWS_EC2_INSTANCE_ID</code>
  /// attribute is specified, then the <code>AWS_INSTANCE_IPV4</code> attribute
  /// contains the primary private IPv4 address.
  /// </li>
  /// <li>
  /// <code>AWS_INSTANCE_CNAME</code>: For a <code>CNAME</code> record, the domain
  /// name that Route 53 returns in response to DNS queries, for example,
  /// <code>example.com</code>.
  /// </li>
  /// <li>
  /// <code>AWS_INSTANCE_IPV4</code>: For an <code>A</code> record, the IPv4
  /// address that Route 53 returns in response to DNS queries, for example,
  /// <code>192.0.2.44</code>.
  /// </li>
  /// <li>
  /// <code>AWS_INSTANCE_IPV6</code>: For an <code>AAAA</code> record, the IPv6
  /// address that Route 53 returns in response to DNS queries, for example,
  /// <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>.
  /// </li>
  /// <li>
  /// <code>AWS_INSTANCE_PORT</code>: For an <code>SRV</code> record, the value
  /// that Route 53 returns for the port. In addition, if the service includes
  /// <code>HealthCheckConfig</code>, the port on the endpoint that Route 53 sends
  /// requests to.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// The ID for an instance that you created by using a specified service.
  @_s.JsonKey(name: 'Id')
  final String id;

  InstanceSummary({
    this.attributes,
    this.id,
  });
  factory InstanceSummary.fromJson(Map<String, dynamic> json) =>
      _$InstanceSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInstancesResponse {
  /// Summary information about the instances that are associated with the
  /// specified service.
  @_s.JsonKey(name: 'Instances')
  final List<InstanceSummary> instances;

  /// If more than <code>MaxResults</code> instances match the specified criteria,
  /// you can submit another <code>ListInstances</code> request to get the next
  /// group of results. Specify the value of <code>NextToken</code> from the
  /// previous response in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListInstancesResponse({
    this.instances,
    this.nextToken,
  });
  factory ListInstancesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInstancesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNamespacesResponse {
  /// An array that contains one <code>NamespaceSummary</code> object for each
  /// namespace that matches the specified filter criteria.
  @_s.JsonKey(name: 'Namespaces')
  final List<NamespaceSummary> namespaces;

  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListNamespaces</code> request to get the next group of results.
  /// Specify the value of <code>NextToken</code> from the previous response in
  /// the next request.
  /// <note>
  /// AWS Cloud Map gets <code>MaxResults</code> namespaces and then filters them
  /// based on the specified criteria. It's possible that no namespaces in the
  /// first <code>MaxResults</code> namespaces matched the specified criteria but
  /// that subsequent groups of <code>MaxResults</code> namespaces do contain
  /// namespaces that match the criteria.
  /// </note>
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListNamespacesResponse({
    this.namespaces,
    this.nextToken,
  });
  factory ListNamespacesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNamespacesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOperationsResponse {
  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListOperations</code> request to get the next group of results.
  /// Specify the value of <code>NextToken</code> from the previous response in
  /// the next request.
  /// <note>
  /// AWS Cloud Map gets <code>MaxResults</code> operations and then filters them
  /// based on the specified criteria. It's possible that no operations in the
  /// first <code>MaxResults</code> operations matched the specified criteria but
  /// that subsequent groups of <code>MaxResults</code> operations do contain
  /// operations that match the criteria.
  /// </note>
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Summary information about the operations that match the specified criteria.
  @_s.JsonKey(name: 'Operations')
  final List<OperationSummary> operations;

  ListOperationsResponse({
    this.nextToken,
    this.operations,
  });
  factory ListOperationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOperationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListServicesResponse {
  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListServices</code> request to get the next group of results. Specify
  /// the value of <code>NextToken</code> from the previous response in the next
  /// request.
  /// <note>
  /// AWS Cloud Map gets <code>MaxResults</code> services and then filters them
  /// based on the specified criteria. It's possible that no services in the first
  /// <code>MaxResults</code> services matched the specified criteria but that
  /// subsequent groups of <code>MaxResults</code> services do contain services
  /// that match the criteria.
  /// </note>
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array that contains one <code>ServiceSummary</code> object for each
  /// service that matches the specified filter criteria.
  @_s.JsonKey(name: 'Services')
  final List<ServiceSummary> services;

  ListServicesResponse({
    this.nextToken,
    this.services,
  });
  factory ListServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListServicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags that are assigned to the resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// A complex type that contains information about a specified namespace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Namespace {
  /// The Amazon Resource Name (ARN) that AWS Cloud Map assigns to the namespace
  /// when you create it.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date that the namespace was created, in Unix date/time format and
  /// Coordinated Universal Time (UTC). The value of <code>CreateDate</code> is
  /// accurate to milliseconds. For example, the value <code>1516925490.087</code>
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// A unique string that identifies the request and that allows failed requests
  /// to be retried without the risk of executing an operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// The description that you specify for the namespace when you create it.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of a namespace.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the namespace, such as <code>example.com</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A complex type that contains information that's specific to the type of the
  /// namespace.
  @_s.JsonKey(name: 'Properties')
  final NamespaceProperties properties;

  /// The number of services that are associated with the namespace.
  @_s.JsonKey(name: 'ServiceCount')
  final int serviceCount;

  /// The type of the namespace. The methods for discovering instances depends on
  /// the value that you specify:
  ///
  /// <ul>
  /// <li>
  /// <code>HTTP</code>: Instances can be discovered only programmatically, using
  /// the AWS Cloud Map <code>DiscoverInstances</code> API.
  /// </li>
  /// <li>
  /// <code>DNS_PUBLIC</code>: Instances can be discovered using public DNS
  /// queries and using the <code>DiscoverInstances</code> API.
  /// </li>
  /// <li>
  /// <code>DNS_PRIVATE</code>: Instances can be discovered using DNS queries in
  /// VPCs and using the <code>DiscoverInstances</code> API.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final NamespaceType type;

  Namespace({
    this.arn,
    this.createDate,
    this.creatorRequestId,
    this.description,
    this.id,
    this.name,
    this.properties,
    this.serviceCount,
    this.type,
  });
  factory Namespace.fromJson(Map<String, dynamic> json) =>
      _$NamespaceFromJson(json);
}

/// A complex type that identifies the namespaces that you want to list. You can
/// choose to list public or private namespaces.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NamespaceFilter {
  /// Specify <code>TYPE</code>.
  @_s.JsonKey(name: 'Name')
  final NamespaceFilterName name;

  /// If you specify <code>EQ</code> for <code>Condition</code>, specify either
  /// <code>DNS_PUBLIC</code> or <code>DNS_PRIVATE</code>.
  ///
  /// If you specify <code>IN</code> for <code>Condition</code>, you can specify
  /// <code>DNS_PUBLIC</code>, <code>DNS_PRIVATE</code>, or both.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  /// The operator that you want to use to determine whether
  /// <code>ListNamespaces</code> returns a namespace. Valid values for
  /// <code>condition</code> include:
  ///
  /// <ul>
  /// <li>
  /// <code>EQ</code>: When you specify <code>EQ</code> for the condition, you can
  /// choose to list only public namespaces or private namespaces, but not both.
  /// <code>EQ</code> is the default condition and can be omitted.
  /// </li>
  /// <li>
  /// <code>IN</code>: When you specify <code>IN</code> for the condition, you can
  /// choose to list public namespaces, private namespaces, or both.
  /// </li>
  /// <li>
  /// <code>BETWEEN</code>: Not applicable
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Condition')
  final FilterCondition condition;

  NamespaceFilter({
    @_s.required this.name,
    @_s.required this.values,
    this.condition,
  });
  Map<String, dynamic> toJson() => _$NamespaceFilterToJson(this);
}

enum NamespaceFilterName {
  @_s.JsonValue('TYPE')
  type,
}

/// A complex type that contains information that is specific to the namespace
/// type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NamespaceProperties {
  /// A complex type that contains the ID for the Route 53 hosted zone that AWS
  /// Cloud Map creates when you create a namespace.
  @_s.JsonKey(name: 'DnsProperties')
  final DnsProperties dnsProperties;

  /// A complex type that contains the name of an HTTP namespace.
  @_s.JsonKey(name: 'HttpProperties')
  final HttpProperties httpProperties;

  NamespaceProperties({
    this.dnsProperties,
    this.httpProperties,
  });
  factory NamespaceProperties.fromJson(Map<String, dynamic> json) =>
      _$NamespacePropertiesFromJson(json);
}

/// A complex type that contains information about a namespace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NamespaceSummary {
  /// The Amazon Resource Name (ARN) that AWS Cloud Map assigns to the namespace
  /// when you create it.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the namespace was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// A description for the namespace.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of the namespace.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the namespace. When you create a namespace, AWS Cloud Map
  /// automatically creates a Route 53 hosted zone that has the same name as the
  /// namespace.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'Properties')
  final NamespaceProperties properties;

  /// The number of services that were created using the namespace.
  @_s.JsonKey(name: 'ServiceCount')
  final int serviceCount;

  /// The type of the namespace, either public or private.
  @_s.JsonKey(name: 'Type')
  final NamespaceType type;

  NamespaceSummary({
    this.arn,
    this.createDate,
    this.description,
    this.id,
    this.name,
    this.properties,
    this.serviceCount,
    this.type,
  });
  factory NamespaceSummary.fromJson(Map<String, dynamic> json) =>
      _$NamespaceSummaryFromJson(json);
}

enum NamespaceType {
  @_s.JsonValue('DNS_PUBLIC')
  dnsPublic,
  @_s.JsonValue('DNS_PRIVATE')
  dnsPrivate,
  @_s.JsonValue('HTTP')
  http,
}

/// A complex type that contains information about a specified operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Operation {
  /// The date and time that the request was submitted, in Unix date/time format
  /// and Coordinated Universal Time (UTC). The value of <code>CreateDate</code>
  /// is accurate to milliseconds. For example, the value
  /// <code>1516925490.087</code> represents Friday, January 26, 2018 12:11:30.087
  /// AM.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The code associated with <code>ErrorMessage</code>. Values for
  /// <code>ErrorCode</code> include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ACCESS_DENIED</code>
  /// </li>
  /// <li>
  /// <code>CANNOT_CREATE_HOSTED_ZONE</code>
  /// </li>
  /// <li>
  /// <code>EXPIRED_TOKEN</code>
  /// </li>
  /// <li>
  /// <code>HOSTED_ZONE_NOT_FOUND</code>
  /// </li>
  /// <li>
  /// <code>INTERNAL_FAILURE</code>
  /// </li>
  /// <li>
  /// <code>INVALID_CHANGE_BATCH</code>
  /// </li>
  /// <li>
  /// <code>THROTTLED_REQUEST</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// If the value of <code>Status</code> is <code>FAIL</code>, the reason that
  /// the operation failed.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The ID of the operation that you want to get information about.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The status of the operation. Values include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>SUBMITTED</b>: This is the initial state immediately after you submit a
  /// request.
  /// </li>
  /// <li>
  /// <b>PENDING</b>: AWS Cloud Map is performing the operation.
  /// </li>
  /// <li>
  /// <b>SUCCESS</b>: The operation succeeded.
  /// </li>
  /// <li>
  /// <b>FAIL</b>: The operation failed. For the failure reason, see
  /// <code>ErrorMessage</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final OperationStatus status;

  /// The name of the target entity that is associated with the operation:
  ///
  /// <ul>
  /// <li>
  /// <b>NAMESPACE</b>: The namespace ID is returned in the
  /// <code>ResourceId</code> property.
  /// </li>
  /// <li>
  /// <b>SERVICE</b>: The service ID is returned in the <code>ResourceId</code>
  /// property.
  /// </li>
  /// <li>
  /// <b>INSTANCE</b>: The instance ID is returned in the <code>ResourceId</code>
  /// property.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Targets')
  final Map<OperationTargetType, String> targets;

  /// The name of the operation that is associated with the specified ID.
  @_s.JsonKey(name: 'Type')
  final OperationType type;

  /// The date and time that the value of <code>Status</code> changed to the
  /// current value, in Unix date/time format and Coordinated Universal Time
  /// (UTC). The value of <code>UpdateDate</code> is accurate to milliseconds. For
  /// example, the value <code>1516925490.087</code> represents Friday, January
  /// 26, 2018 12:11:30.087 AM.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdateDate')
  final DateTime updateDate;

  Operation({
    this.createDate,
    this.errorCode,
    this.errorMessage,
    this.id,
    this.status,
    this.targets,
    this.type,
    this.updateDate,
  });
  factory Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);
}

/// A complex type that lets you select the operations that you want to list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OperationFilter {
  /// Specify the operations that you want to get:
  ///
  /// <ul>
  /// <li>
  /// <b>NAMESPACE_ID</b>: Gets operations related to specified namespaces.
  /// </li>
  /// <li>
  /// <b>SERVICE_ID</b>: Gets operations related to specified services.
  /// </li>
  /// <li>
  /// <b>STATUS</b>: Gets operations based on the status of the operations:
  /// <code>SUBMITTED</code>, <code>PENDING</code>, <code>SUCCEED</code>, or
  /// <code>FAIL</code>.
  /// </li>
  /// <li>
  /// <b>TYPE</b>: Gets specified types of operation.
  /// </li>
  /// <li>
  /// <b>UPDATE_DATE</b>: Gets operations that changed status during a specified
  /// date/time range.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Name')
  final OperationFilterName name;

  /// Specify values that are applicable to the value that you specify for
  /// <code>Name</code>:
  ///
  /// <ul>
  /// <li>
  /// <b>NAMESPACE_ID</b>: Specify one namespace ID.
  /// </li>
  /// <li>
  /// <b>SERVICE_ID</b>: Specify one service ID.
  /// </li>
  /// <li>
  /// <b>STATUS</b>: Specify one or more statuses: <code>SUBMITTED</code>,
  /// <code>PENDING</code>, <code>SUCCEED</code>, or <code>FAIL</code>.
  /// </li>
  /// <li>
  /// <b>TYPE</b>: Specify one or more of the following types:
  /// <code>CREATE_NAMESPACE</code>, <code>DELETE_NAMESPACE</code>,
  /// <code>UPDATE_SERVICE</code>, <code>REGISTER_INSTANCE</code>, or
  /// <code>DEREGISTER_INSTANCE</code>.
  /// </li>
  /// <li>
  /// <b>UPDATE_DATE</b>: Specify a start date and an end date in Unix date/time
  /// format and Coordinated Universal Time (UTC). The start date must be the
  /// first value.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  /// The operator that you want to use to determine whether an operation matches
  /// the specified value. Valid values for condition include:
  ///
  /// <ul>
  /// <li>
  /// <code>EQ</code>: When you specify <code>EQ</code> for the condition, you can
  /// specify only one value. <code>EQ</code> is supported for
  /// <code>NAMESPACE_ID</code>, <code>SERVICE_ID</code>, <code>STATUS</code>, and
  /// <code>TYPE</code>. <code>EQ</code> is the default condition and can be
  /// omitted.
  /// </li>
  /// <li>
  /// <code>IN</code>: When you specify <code>IN</code> for the condition, you can
  /// specify a list of one or more values. <code>IN</code> is supported for
  /// <code>STATUS</code> and <code>TYPE</code>. An operation must match one of
  /// the specified values to be returned in the response.
  /// </li>
  /// <li>
  /// <code>BETWEEN</code>: Specify a start date and an end date in Unix date/time
  /// format and Coordinated Universal Time (UTC). The start date must be the
  /// first value. <code>BETWEEN</code> is supported for <code>UPDATE_DATE</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Condition')
  final FilterCondition condition;

  OperationFilter({
    @_s.required this.name,
    @_s.required this.values,
    this.condition,
  });
  Map<String, dynamic> toJson() => _$OperationFilterToJson(this);
}

enum OperationFilterName {
  @_s.JsonValue('NAMESPACE_ID')
  namespaceId,
  @_s.JsonValue('SERVICE_ID')
  serviceId,
  @_s.JsonValue('STATUS')
  status,
  @_s.JsonValue('TYPE')
  type,
  @_s.JsonValue('UPDATE_DATE')
  updateDate,
}

enum OperationStatus {
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAIL')
  fail,
}

/// A complex type that contains information about an operation that matches the
/// criteria that you specified in a <a
/// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html">ListOperations</a>
/// request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OperationSummary {
  /// The ID for an operation.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The status of the operation. Values include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>SUBMITTED</b>: This is the initial state immediately after you submit a
  /// request.
  /// </li>
  /// <li>
  /// <b>PENDING</b>: AWS Cloud Map is performing the operation.
  /// </li>
  /// <li>
  /// <b>SUCCESS</b>: The operation succeeded.
  /// </li>
  /// <li>
  /// <b>FAIL</b>: The operation failed. For the failure reason, see
  /// <code>ErrorMessage</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final OperationStatus status;

  OperationSummary({
    this.id,
    this.status,
  });
  factory OperationSummary.fromJson(Map<String, dynamic> json) =>
      _$OperationSummaryFromJson(json);
}

enum OperationTargetType {
  @_s.JsonValue('NAMESPACE')
  namespace,
  @_s.JsonValue('SERVICE')
  service,
  @_s.JsonValue('INSTANCE')
  instance,
}

enum OperationType {
  @_s.JsonValue('CREATE_NAMESPACE')
  createNamespace,
  @_s.JsonValue('DELETE_NAMESPACE')
  deleteNamespace,
  @_s.JsonValue('UPDATE_SERVICE')
  updateService,
  @_s.JsonValue('REGISTER_INSTANCE')
  registerInstance,
  @_s.JsonValue('DEREGISTER_INSTANCE')
  deregisterInstance,
}

enum RecordType {
  @_s.JsonValue('SRV')
  srv,
  @_s.JsonValue('A')
  a,
  @_s.JsonValue('AAAA')
  aaaa,
  @_s.JsonValue('CNAME')
  cname,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterInstanceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  RegisterInstanceResponse({
    this.operationId,
  });
  factory RegisterInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterInstanceResponseFromJson(json);
}

enum RoutingPolicy {
  @_s.JsonValue('MULTIVALUE')
  multivalue,
  @_s.JsonValue('WEIGHTED')
  weighted,
}

/// A complex type that contains information about the specified service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Service {
  /// The Amazon Resource Name (ARN) that AWS Cloud Map assigns to the service
  /// when you create it.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the service was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreateDate</code> is
  /// accurate to milliseconds. For example, the value <code>1516925490.087</code>
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// A unique string that identifies the request and that allows failed requests
  /// to be retried without the risk of executing the operation twice.
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// The description of the service.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A complex type that contains information about the Route 53 DNS records that
  /// you want AWS Cloud Map to create when you register an instance.
  @_s.JsonKey(name: 'DnsConfig')
  final DnsConfig dnsConfig;

  /// <i>Public DNS and HTTP namespaces only.</i> A complex type that contains
  /// settings for an optional health check. If you specify settings for a health
  /// check, AWS Cloud Map associates the health check with the records that you
  /// specify in <code>DnsConfig</code>.
  ///
  /// For information about the charges for health checks, see <a
  /// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
  @_s.JsonKey(name: 'HealthCheckConfig')
  final HealthCheckConfig healthCheckConfig;

  /// A complex type that contains information about an optional custom health
  /// check.
  /// <important>
  /// If you specify a health check configuration, you can specify either
  /// <code>HealthCheckCustomConfig</code> or <code>HealthCheckConfig</code> but
  /// not both.
  /// </important>
  @_s.JsonKey(name: 'HealthCheckCustomConfig')
  final HealthCheckCustomConfig healthCheckCustomConfig;

  /// The ID that AWS Cloud Map assigned to the service when you created it.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The number of instances that are currently associated with the service.
  /// Instances that were previously associated with the service but that have
  /// been deleted are not included in the count. The count might not reflect
  /// pending registrations and deregistrations.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// The name of the service.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the namespace that was used to create the service.
  @_s.JsonKey(name: 'NamespaceId')
  final String namespaceId;

  Service({
    this.arn,
    this.createDate,
    this.creatorRequestId,
    this.description,
    this.dnsConfig,
    this.healthCheckConfig,
    this.healthCheckCustomConfig,
    this.id,
    this.instanceCount,
    this.name,
    this.namespaceId,
  });
  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

/// A complex type that contains changes to an existing service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ServiceChange {
  /// A description for the service.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A complex type that contains information about the Route 53 DNS records that
  /// you want AWS Cloud Map to create when you register an instance.
  @_s.JsonKey(name: 'DnsConfig')
  final DnsConfigChange dnsConfig;
  @_s.JsonKey(name: 'HealthCheckConfig')
  final HealthCheckConfig healthCheckConfig;

  ServiceChange({
    this.description,
    this.dnsConfig,
    this.healthCheckConfig,
  });
  Map<String, dynamic> toJson() => _$ServiceChangeToJson(this);
}

/// A complex type that lets you specify the namespaces that you want to list
/// services for.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ServiceFilter {
  /// Specify <code>NAMESPACE_ID</code>.
  @_s.JsonKey(name: 'Name')
  final ServiceFilterName name;

  /// The values that are applicable to the value that you specify for
  /// <code>Condition</code> to filter the list of services.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  /// The operator that you want to use to determine whether a service is returned
  /// by <code>ListServices</code>. Valid values for <code>Condition</code>
  /// include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>EQ</code>: When you specify <code>EQ</code>, specify one namespace ID
  /// for <code>Values</code>. <code>EQ</code> is the default condition and can be
  /// omitted.
  /// </li>
  /// <li>
  /// <code>IN</code>: When you specify <code>IN</code>, specify a list of the IDs
  /// for the namespaces that you want <code>ListServices</code> to return a list
  /// of services for.
  /// </li>
  /// <li>
  /// <code>BETWEEN</code>: Not applicable.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Condition')
  final FilterCondition condition;

  ServiceFilter({
    @_s.required this.name,
    @_s.required this.values,
    this.condition,
  });
  Map<String, dynamic> toJson() => _$ServiceFilterToJson(this);
}

enum ServiceFilterName {
  @_s.JsonValue('NAMESPACE_ID')
  namespaceId,
}

/// A complex type that contains information about a specified service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceSummary {
  /// The Amazon Resource Name (ARN) that AWS Cloud Map assigns to the service
  /// when you create it.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the service was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The description that you specify when you create the service.
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'DnsConfig')
  final DnsConfig dnsConfig;
  @_s.JsonKey(name: 'HealthCheckConfig')
  final HealthCheckConfig healthCheckConfig;
  @_s.JsonKey(name: 'HealthCheckCustomConfig')
  final HealthCheckCustomConfig healthCheckCustomConfig;

  /// The ID that AWS Cloud Map assigned to the service when you created it.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The number of instances that are currently associated with the service.
  /// Instances that were previously associated with the service but that have
  /// been deleted are not included in the count. The count might not reflect
  /// pending registrations and deregistrations.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// The name of the service.
  @_s.JsonKey(name: 'Name')
  final String name;

  ServiceSummary({
    this.arn,
    this.createDate,
    this.description,
    this.dnsConfig,
    this.healthCheckConfig,
    this.healthCheckCustomConfig,
    this.id,
    this.instanceCount,
    this.name,
  });
  factory ServiceSummary.fromJson(Map<String, dynamic> json) =>
      _$ServiceSummaryFromJson(json);
}

/// A custom key-value pair associated with a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key identifier, or name, of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The string value associated with the key of the tag. You can set the value
  /// of a tag to an empty string, but you can't set the value of a tag to null.
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
class UpdateServiceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  UpdateServiceResponse({
    this.operationId,
  });
  factory UpdateServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateServiceResponseFromJson(json);
}

class CustomHealthNotFound extends _s.GenericAwsException {
  CustomHealthNotFound({String type, String message})
      : super(type: type, code: 'CustomHealthNotFound', message: message);
}

class DuplicateRequest extends _s.GenericAwsException {
  DuplicateRequest({String type, String message})
      : super(type: type, code: 'DuplicateRequest', message: message);
}

class InstanceNotFound extends _s.GenericAwsException {
  InstanceNotFound({String type, String message})
      : super(type: type, code: 'InstanceNotFound', message: message);
}

class InvalidInput extends _s.GenericAwsException {
  InvalidInput({String type, String message})
      : super(type: type, code: 'InvalidInput', message: message);
}

class NamespaceAlreadyExists extends _s.GenericAwsException {
  NamespaceAlreadyExists({String type, String message})
      : super(type: type, code: 'NamespaceAlreadyExists', message: message);
}

class NamespaceNotFound extends _s.GenericAwsException {
  NamespaceNotFound({String type, String message})
      : super(type: type, code: 'NamespaceNotFound', message: message);
}

class OperationNotFound extends _s.GenericAwsException {
  OperationNotFound({String type, String message})
      : super(type: type, code: 'OperationNotFound', message: message);
}

class RequestLimitExceeded extends _s.GenericAwsException {
  RequestLimitExceeded({String type, String message})
      : super(type: type, code: 'RequestLimitExceeded', message: message);
}

class ResourceInUse extends _s.GenericAwsException {
  ResourceInUse({String type, String message})
      : super(type: type, code: 'ResourceInUse', message: message);
}

class ResourceLimitExceeded extends _s.GenericAwsException {
  ResourceLimitExceeded({String type, String message})
      : super(type: type, code: 'ResourceLimitExceeded', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceAlreadyExists extends _s.GenericAwsException {
  ServiceAlreadyExists({String type, String message})
      : super(type: type, code: 'ServiceAlreadyExists', message: message);
}

class ServiceNotFound extends _s.GenericAwsException {
  ServiceNotFound({String type, String message})
      : super(type: type, code: 'ServiceNotFound', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CustomHealthNotFound': (type, message) =>
      CustomHealthNotFound(type: type, message: message),
  'DuplicateRequest': (type, message) =>
      DuplicateRequest(type: type, message: message),
  'InstanceNotFound': (type, message) =>
      InstanceNotFound(type: type, message: message),
  'InvalidInput': (type, message) => InvalidInput(type: type, message: message),
  'NamespaceAlreadyExists': (type, message) =>
      NamespaceAlreadyExists(type: type, message: message),
  'NamespaceNotFound': (type, message) =>
      NamespaceNotFound(type: type, message: message),
  'OperationNotFound': (type, message) =>
      OperationNotFound(type: type, message: message),
  'RequestLimitExceeded': (type, message) =>
      RequestLimitExceeded(type: type, message: message),
  'ResourceInUse': (type, message) =>
      ResourceInUse(type: type, message: message),
  'ResourceLimitExceeded': (type, message) =>
      ResourceLimitExceeded(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceAlreadyExists': (type, message) =>
      ServiceAlreadyExists(type: type, message: message),
  'ServiceNotFound': (type, message) =>
      ServiceNotFound(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
