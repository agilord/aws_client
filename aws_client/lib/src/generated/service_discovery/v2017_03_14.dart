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

/// With Cloud Map, you can configure public DNS, private DNS, or HTTP
/// namespaces that your microservice applications run in. When an instance
/// becomes available, you can call the Cloud Map API to register the instance
/// with Cloud Map. For public or private DNS namespaces, Cloud Map
/// automatically creates DNS records and an optional health check. Clients that
/// submit public or private DNS queries, or HTTP requests, for the service
/// receive an answer that contains up to eight healthy records.
class ServiceDiscovery {
  final _s.JsonProtocol _protocol;
  ServiceDiscovery({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'servicediscovery',
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

  /// Creates an HTTP namespace. Service instances registered using an HTTP
  /// namespace can be discovered using a <code>DiscoverInstances</code> request
  /// but can't be discovered using DNS.
  ///
  /// For the current quota on the number of namespaces that you can create
  /// using the same Amazon Web Services account, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">Cloud
  /// Map quotas</a> in the <i>Cloud Map Developer Guide</i>.
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
  /// of running the operation twice. <code>CreatorRequestId</code> can be any
  /// unique string (for example, a date/time stamp).
  ///
  /// Parameter [description] :
  /// A description for the namespace.
  ///
  /// Parameter [tags] :
  /// The tags to add to the namespace. Each tag consists of a key and an
  /// optional value that you define. Tags keys can be up to 128 characters in
  /// length, and tag values can be up to 256 characters in length.
  Future<CreateHttpNamespaceResponse> createHttpNamespace({
    required String name,
    String? creatorRequestId,
    String? description,
    List<Tag>? tags,
  }) async {
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

  /// Creates a private namespace based on DNS, which is visible only inside a
  /// specified Amazon VPC. The namespace defines your service naming scheme.
  /// For example, if you name your namespace <code>example.com</code> and name
  /// your service <code>backend</code>, the resulting DNS name for the service
  /// is <code>backend.example.com</code>. Service instances that are registered
  /// using a private DNS namespace can be discovered using either a
  /// <code>DiscoverInstances</code> request or using DNS. For the current quota
  /// on the number of namespaces that you can create using the same Amazon Web
  /// Services account, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">Cloud
  /// Map quotas</a> in the <i>Cloud Map Developer Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [NamespaceAlreadyExists].
  /// May throw [ResourceLimitExceeded].
  /// May throw [DuplicateRequest].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [name] :
  /// The name that you want to assign to this namespace. When you create a
  /// private DNS namespace, Cloud Map automatically creates an Amazon Route 53
  /// private hosted zone that has the same name as the namespace.
  ///
  /// Parameter [vpc] :
  /// The ID of the Amazon VPC that you want to associate the namespace with.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>CreatePrivateDnsNamespace</code> requests to be retried without the
  /// risk of running the operation twice. <code>CreatorRequestId</code> can be
  /// any unique string (for example, a date/timestamp).
  ///
  /// Parameter [description] :
  /// A description for the namespace.
  ///
  /// Parameter [properties] :
  /// Properties for the private DNS namespace.
  ///
  /// Parameter [tags] :
  /// The tags to add to the namespace. Each tag consists of a key and an
  /// optional value that you define. Tags keys can be up to 128 characters in
  /// length, and tag values can be up to 256 characters in length.
  Future<CreatePrivateDnsNamespaceResponse> createPrivateDnsNamespace({
    required String name,
    required String vpc,
    String? creatorRequestId,
    String? description,
    PrivateDnsNamespaceProperties? properties,
    List<Tag>? tags,
  }) async {
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
        if (properties != null) 'Properties': properties,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePrivateDnsNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a public namespace based on DNS, which is visible on the internet.
  /// The namespace defines your service naming scheme. For example, if you name
  /// your namespace <code>example.com</code> and name your service
  /// <code>backend</code>, the resulting DNS name for the service is
  /// <code>backend.example.com</code>. You can discover instances that were
  /// registered with a public DNS namespace by using either a
  /// <code>DiscoverInstances</code> request or using DNS. For the current quota
  /// on the number of namespaces that you can create using the same Amazon Web
  /// Services account, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">Cloud
  /// Map quotas</a> in the <i>Cloud Map Developer Guide</i>.
  /// <important>
  /// The <code>CreatePublicDnsNamespace</code> API operation is not supported
  /// in the Amazon Web Services GovCloud (US) Regions.
  /// </important>
  ///
  /// May throw [InvalidInput].
  /// May throw [NamespaceAlreadyExists].
  /// May throw [ResourceLimitExceeded].
  /// May throw [DuplicateRequest].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [name] :
  /// The name that you want to assign to this namespace.
  /// <note>
  /// Do not include sensitive information in the name. The name is publicly
  /// available using DNS queries.
  /// </note>
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>CreatePublicDnsNamespace</code> requests to be retried without the
  /// risk of running the operation twice. <code>CreatorRequestId</code> can be
  /// any unique string (for example, a date/timestamp).
  ///
  /// Parameter [description] :
  /// A description for the namespace.
  ///
  /// Parameter [properties] :
  /// Properties for the public DNS namespace.
  ///
  /// Parameter [tags] :
  /// The tags to add to the namespace. Each tag consists of a key and an
  /// optional value that you define. Tags keys can be up to 128 characters in
  /// length, and tag values can be up to 256 characters in length.
  Future<CreatePublicDnsNamespaceResponse> createPublicDnsNamespace({
    required String name,
    String? creatorRequestId,
    String? description,
    PublicDnsNamespaceProperties? properties,
    List<Tag>? tags,
  }) async {
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
        if (properties != null) 'Properties': properties,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePublicDnsNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a service. This action defines the configuration for the following
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
  /// request, and Cloud Map uses the values in the configuration to create the
  /// specified entities.
  ///
  /// For the current quota on the number of instances that you can register
  /// using the same namespace and using the same service, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">Cloud
  /// Map quotas</a> in the <i>Cloud Map Developer Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [ResourceLimitExceeded].
  /// May throw [NamespaceNotFound].
  /// May throw [ServiceAlreadyExists].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [name] :
  /// The name that you want to assign to the service.
  /// <note>
  /// Do not include sensitive information in the name if the namespace is
  /// discoverable by public DNS queries.
  /// </note>
  /// If you want Cloud Map to create an <code>SRV</code> record when you
  /// register an instance and you're using a system that requires a specific
  /// <code>SRV</code> format, such as <a
  /// href="http://www.haproxy.org/">HAProxy</a>, specify the following for
  /// <code>Name</code>:
  ///
  /// <ul>
  /// <li>
  /// Start the name with an underscore (_), such as
  /// <code>_exampleservice</code>.
  /// </li>
  /// <li>
  /// End the name with <i>._protocol</i>, such as <code>._tcp</code>.
  /// </li>
  /// </ul>
  /// When you register an instance, Cloud Map creates an <code>SRV</code>
  /// record and assigns a name to the record by concatenating the service name
  /// and the namespace name (for example,
  ///
  /// <code>_exampleservice._tcp.example.com</code>).
  /// <note>
  /// For services that are accessible by DNS queries, you can't create multiple
  /// services with names that differ only by case (such as EXAMPLE and
  /// example). Otherwise, these services have the same DNS name and can't be
  /// distinguished. However, if you use a namespace that's only accessible by
  /// API calls, then you can create services that with names that differ only
  /// by case.
  /// </note>
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>CreateService</code> requests to be retried without the risk of
  /// running the operation twice. <code>CreatorRequestId</code> can be any
  /// unique string (for example, a date/timestamp).
  ///
  /// Parameter [description] :
  /// A description for the service.
  ///
  /// Parameter [dnsConfig] :
  /// A complex type that contains information about the Amazon Route 53 records
  /// that you want Cloud Map to create when you register an instance.
  ///
  /// Parameter [healthCheckConfig] :
  /// <i>Public DNS and HTTP namespaces only.</i> A complex type that contains
  /// settings for an optional Route 53 health check. If you specify settings
  /// for a health check, Cloud Map associates the health check with all the
  /// Route 53 DNS records that you specify in <code>DnsConfig</code>.
  /// <important>
  /// If you specify a health check configuration, you can specify either
  /// <code>HealthCheckCustomConfig</code> or <code>HealthCheckConfig</code> but
  /// not both.
  /// </important>
  /// For information about the charges for health checks, see <a
  /// href="http://aws.amazon.com/cloud-map/pricing/">Cloud Map Pricing</a>.
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
  /// The ID of the namespace that you want to use to create the service. The
  /// namespace ID must be specified, but it can be specified either here or in
  /// the <code>DnsConfig</code> object.
  ///
  /// Parameter [tags] :
  /// The tags to add to the service. Each tag consists of a key and an optional
  /// value that you define. Tags keys can be up to 128 characters in length,
  /// and tag values can be up to 256 characters in length.
  ///
  /// Parameter [type] :
  /// If present, specifies that the service instances are only discoverable
  /// using the <code>DiscoverInstances</code> API operation. No DNS records is
  /// registered for the service instances. The only valid value is
  /// <code>HTTP</code>.
  Future<CreateServiceResponse> createService({
    required String name,
    String? creatorRequestId,
    String? description,
    DnsConfig? dnsConfig,
    HealthCheckConfig? healthCheckConfig,
    HealthCheckCustomConfig? healthCheckCustomConfig,
    String? namespaceId,
    List<Tag>? tags,
    ServiceTypeOption? type,
  }) async {
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
        if (type != null) 'Type': type.toValue(),
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
    required String id,
  }) async {
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
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.DeleteService'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );
  }

  /// Deletes the Amazon Route 53 DNS records and health check, if any, that
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
    required String instanceId,
    required String serviceId,
  }) async {
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
  /// of namespace. <code>DiscoverInstances</code> returns a randomized list of
  /// instances allowing customers to distribute traffic evenly across
  /// instances. For public and private DNS namespaces, you can also use DNS
  /// queries to discover instances.
  ///
  /// May throw [ServiceNotFound].
  /// May throw [NamespaceNotFound].
  /// May throw [InvalidInput].
  /// May throw [RequestLimitExceeded].
  ///
  /// Parameter [namespaceName] :
  /// The <code>HttpName</code> name of the namespace. It's found in the
  /// <code>HttpProperties</code> member of the <code>Properties</code> member
  /// of the namespace. In most cases, <code>Name</code> and
  /// <code>HttpName</code> match. However, if you reuse <code>Name</code> for
  /// namespace creation, a generated hash is added to <code>HttpName</code> to
  /// distinguish the two.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that you specified when you registered the
  /// instance.
  ///
  /// Parameter [healthStatus] :
  /// The health status of the instances that you want to discover. This
  /// parameter is ignored for services that don't have a health check
  /// configured, and all instances are returned.
  /// <dl> <dt>HEALTHY</dt> <dd>
  /// Returns healthy instances.
  /// </dd> <dt>UNHEALTHY</dt> <dd>
  /// Returns unhealthy instances.
  /// </dd> <dt>ALL</dt> <dd>
  /// Returns all instances.
  /// </dd> <dt>HEALTHY_OR_ELSE_ALL</dt> <dd>
  /// Returns healthy instances, unless none are reporting a healthy state. In
  /// that case, return all instances. This is also called failing open.
  /// </dd> </dl>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of instances that you want Cloud Map to return in the
  /// response to a <code>DiscoverInstances</code> request. If you don't specify
  /// a value for <code>MaxResults</code>, Cloud Map returns up to 100
  /// instances.
  ///
  /// Parameter [optionalParameters] :
  /// Opportunistic filters to scope the results based on custom attributes. If
  /// there are instances that match both the filters specified in both the
  /// <code>QueryParameters</code> parameter and this parameter, all of these
  /// instances are returned. Otherwise, the filters are ignored, and only
  /// instances that match the filters that are specified in the
  /// <code>QueryParameters</code> parameter are returned.
  ///
  /// Parameter [queryParameters] :
  /// Filters to scope the results based on custom attributes for the instance
  /// (for example, <code>{version=v1, az=1a}</code>). Only instances that match
  /// all the specified key-value pairs are returned.
  Future<DiscoverInstancesResponse> discoverInstances({
    required String namespaceName,
    required String serviceName,
    HealthStatusFilter? healthStatus,
    int? maxResults,
    Map<String, String>? optionalParameters,
    Map<String, String>? queryParameters,
  }) async {
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

  /// Discovers the increasing revision associated with an instance.
  ///
  /// May throw [ServiceNotFound].
  /// May throw [NamespaceNotFound].
  /// May throw [InvalidInput].
  /// May throw [RequestLimitExceeded].
  ///
  /// Parameter [namespaceName] :
  /// The <code>HttpName</code> name of the namespace. It's found in the
  /// <code>HttpProperties</code> member of the <code>Properties</code> member
  /// of the namespace.
  ///
  /// Parameter [serviceName] :
  /// The name of the service that you specified when you registered the
  /// instance.
  Future<DiscoverInstancesRevisionResponse> discoverInstancesRevision({
    required String namespaceName,
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.DiscoverInstancesRevision'
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
      },
    );

    return DiscoverInstancesRevisionResponse.fromJson(jsonResponse.body);
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
    required String instanceId,
    required String serviceId,
  }) async {
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
  /// There's a brief delay between when you register an instance and when the
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
  /// If you omit <code>Instances</code>, Cloud Map returns the health status
  /// for all the instances that are associated with the specified service.
  /// <note>
  /// To get the IDs for the instances that you've registered by using a
  /// specified service, submit a <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_ListInstances.html">ListInstances</a>
  /// request.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of instances that you want Cloud Map to return in the
  /// response to a <code>GetInstancesHealthStatus</code> request. If you don't
  /// specify a value for <code>MaxResults</code>, Cloud Map returns up to 100
  /// instances.
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
    required String serviceId,
    List<String>? instances,
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
    required String id,
  }) async {
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
  /// response, such as a <code>CreateHttpNamespace</code> request.
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
    required String operationId,
  }) async {
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
    required String id,
  }) async {
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
  /// The maximum number of instances that you want Cloud Map to return in the
  /// response to a <code>ListInstances</code> request. If you don't specify a
  /// value for <code>MaxResults</code>, Cloud Map returns up to 100 instances.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListInstances</code> request, omit this value.
  ///
  /// If more than <code>MaxResults</code> instances match the specified
  /// criteria, you can submit another <code>ListInstances</code> request to get
  /// the next group of results. Specify the value of <code>NextToken</code>
  /// from the previous response in the next request.
  Future<ListInstancesResponse> listInstances({
    required String serviceId,
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
  /// current Amazon Web Services account.
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
  /// The maximum number of namespaces that you want Cloud Map to return in the
  /// response to a <code>ListNamespaces</code> request. If you don't specify a
  /// value for <code>MaxResults</code>, Cloud Map returns up to 100 namespaces.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListNamespaces</code> request, omit this value.
  ///
  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListNamespaces</code> request to get the next group of results.
  /// Specify the value of <code>NextToken</code> from the previous response in
  /// the next request.
  /// <note>
  /// Cloud Map gets <code>MaxResults</code> namespaces and then filters them
  /// based on the specified criteria. It's possible that no namespaces in the
  /// first <code>MaxResults</code> namespaces matched the specified criteria
  /// but that subsequent groups of <code>MaxResults</code> namespaces do
  /// contain namespaces that match the criteria.
  /// </note>
  Future<ListNamespacesResponse> listNamespaces({
    List<NamespaceFilter>? filters,
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
  /// The maximum number of items that you want Cloud Map to return in the
  /// response to a <code>ListOperations</code> request. If you don't specify a
  /// value for <code>MaxResults</code>, Cloud Map returns up to 100 operations.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListOperations</code> request, omit this value.
  ///
  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListOperations</code> request to get the next group of results.
  /// Specify the value of <code>NextToken</code> from the previous response in
  /// the next request.
  /// <note>
  /// Cloud Map gets <code>MaxResults</code> operations and then filters them
  /// based on the specified criteria. It's possible that no operations in the
  /// first <code>MaxResults</code> operations matched the specified criteria
  /// but that subsequent groups of <code>MaxResults</code> operations do
  /// contain operations that match the criteria.
  /// </note>
  Future<ListOperationsResponse> listOperations({
    List<OperationFilter>? filters,
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
  /// one or more namespaces.
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
  /// The maximum number of services that you want Cloud Map to return in the
  /// response to a <code>ListServices</code> request. If you don't specify a
  /// value for <code>MaxResults</code>, Cloud Map returns up to 100 services.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListServices</code> request, omit this value.
  ///
  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListServices</code> request to get the next group of results.
  /// Specify the value of <code>NextToken</code> from the previous response in
  /// the next request.
  /// <note>
  /// Cloud Map gets <code>MaxResults</code> services and then filters them
  /// based on the specified criteria. It's possible that no services in the
  /// first <code>MaxResults</code> services matched the specified criteria but
  /// that subsequent groups of <code>MaxResults</code> services do contain
  /// services that match the criteria.
  /// </note>
  Future<ListServicesResponse> listServices({
    List<ServiceFilter>? filters,
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
    required String resourceARN,
  }) async {
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
  /// For each DNS record that you define in the service that's specified by
  /// <code>ServiceId</code>, a record is created or updated in the hosted zone
  /// that's associated with the corresponding namespace.
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
  /// When Cloud Map receives a DNS query for the specified DNS name, it returns
  /// the applicable value:
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
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html">Cloud
  /// Map quotas</a> in the <i>Cloud Map Developer Guide</i>.
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
  /// </ul> <important>
  /// Do not include sensitive information in the attributes if the namespace is
  /// discoverable by public DNS queries.
  /// </important>
  /// The following are the supported attribute keys.
  /// <dl> <dt>AWS_ALIAS_DNS_NAME</dt> <dd>
  /// If you want Cloud Map to create an Amazon Route 53 alias record that
  /// routes traffic to an Elastic Load Balancing load balancer, specify the DNS
  /// name that's associated with the load balancer. For information about how
  /// to get the DNS name, see "DNSName" in the topic <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html">AliasTarget</a>
  /// in the <i>Route 53 API Reference</i>.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// The configuration for the service that's specified by
  /// <code>ServiceId</code> must include settings for an <code>A</code> record,
  /// an <code>AAAA</code> record, or both.
  /// </li>
  /// <li>
  /// In the service that's specified by <code>ServiceId</code>, the value of
  /// <code>RoutingPolicy</code> must be <code>WEIGHTED</code>.
  /// </li>
  /// <li>
  /// If the service that's specified by <code>ServiceId</code> includes
  /// <code>HealthCheckConfig</code> settings, Cloud Map will create the
  /// Route 53 health check, but it doesn't associate the health check with the
  /// alias record.
  /// </li>
  /// <li>
  /// Cloud Map currently doesn't support creating alias records that route
  /// traffic to Amazon Web Services resources other than Elastic Load Balancing
  /// load balancers.
  /// </li>
  /// <li>
  /// If you specify a value for <code>AWS_ALIAS_DNS_NAME</code>, don't specify
  /// values for any of the <code>AWS_INSTANCE</code> attributes.
  /// </li>
  /// <li>
  /// The <code>AWS_ALIAS_DNS_NAME</code> is not supported in the GovCloud (US)
  /// Regions.
  /// </li>
  /// </ul> </dd> <dt>AWS_EC2_INSTANCE_ID</dt> <dd>
  /// <i>HTTP namespaces only.</i> The Amazon EC2 instance ID for the instance.
  /// If the <code>AWS_EC2_INSTANCE_ID</code> attribute is specified, then the
  /// only other attribute that can be specified is
  /// <code>AWS_INIT_HEALTH_STATUS</code>. When the
  /// <code>AWS_EC2_INSTANCE_ID</code> attribute is specified, then the
  /// <code>AWS_INSTANCE_IPV4</code> attribute will be filled out with the
  /// primary private IPv4 address.
  /// </dd> <dt>AWS_INIT_HEALTH_STATUS</dt> <dd>
  /// If the service configuration includes
  /// <code>HealthCheckCustomConfig</code>, you can optionally use
  /// <code>AWS_INIT_HEALTH_STATUS</code> to specify the initial status of the
  /// custom health check, <code>HEALTHY</code> or <code>UNHEALTHY</code>. If
  /// you don't specify a value for <code>AWS_INIT_HEALTH_STATUS</code>, the
  /// initial status is <code>HEALTHY</code>.
  /// </dd> <dt>AWS_INSTANCE_CNAME</dt> <dd>
  /// If the service configuration includes a <code>CNAME</code> record, the
  /// domain name that you want Route 53 to return in response to DNS queries
  /// (for example, <code>example.com</code>).
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>CNAME</code> record.
  /// </dd> <dt>AWS_INSTANCE_IPV4</dt> <dd>
  /// If the service configuration includes an <code>A</code> record, the IPv4
  /// address that you want Route 53 to return in response to DNS queries (for
  /// example, <code>192.0.2.44</code>).
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>A</code> record. If the service includes
  /// settings for an <code>SRV</code> record, you must specify a value for
  /// <code>AWS_INSTANCE_IPV4</code>, <code>AWS_INSTANCE_IPV6</code>, or both.
  /// </dd> <dt>AWS_INSTANCE_IPV6</dt> <dd>
  /// If the service configuration includes an <code>AAAA</code> record, the
  /// IPv6 address that you want Route 53 to return in response to DNS queries
  /// (for example, <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>).
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>AAAA</code> record. If the service includes
  /// settings for an <code>SRV</code> record, you must specify a value for
  /// <code>AWS_INSTANCE_IPV4</code>, <code>AWS_INSTANCE_IPV6</code>, or both.
  /// </dd> <dt>AWS_INSTANCE_PORT</dt> <dd>
  /// If the service includes an <code>SRV</code> record, the value that you
  /// want Route 53 to return for the port.
  ///
  /// If the service includes <code>HealthCheckConfig</code>, the port on the
  /// endpoint that you want Route 53 to send requests to.
  ///
  /// This value is required if you specified settings for an <code>SRV</code>
  /// record or a Route 53 health check when you created the service.
  /// </dd> <dt>Custom attributes</dt> <dd>
  /// You can add up to 30 custom attributes. For each key-value pair, the
  /// maximum length of the attribute name is 255 characters, and the maximum
  /// length of the attribute value is 1,024 characters. The total size of all
  /// provided attributes (sum of all keys and values) must not exceed 5,000
  /// characters.
  /// </dd> </dl>
  ///
  /// Parameter [instanceId] :
  /// An identifier that you want to associate with the instance. Note the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// If the service that's specified by <code>ServiceId</code> includes
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
  /// To register a new instance, you must specify a value that's unique among
  /// instances that you register by using the same service.
  /// </li>
  /// <li>
  /// If you specify an existing <code>InstanceId</code> and
  /// <code>ServiceId</code>, Cloud Map updates the existing DNS records, if
  /// any. If there's also an existing health check, Cloud Map deletes the old
  /// health check and creates a new one.
  /// <note>
  /// The health check isn't deleted immediately, so it will still appear for a
  /// while if you submit a <code>ListHealthChecks</code> request, for example.
  /// </note> </li>
  /// </ul> <note>
  /// Do not include sensitive information in <code>InstanceId</code> if the
  /// namespace is discoverable by public DNS queries and any <code>Type</code>
  /// member of <code>DnsRecord</code> for the service contains <code>SRV</code>
  /// because the <code>InstanceId</code> is discoverable by public DNS queries.
  /// </note>
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
  /// <code>CreatorRequestId</code> can be any unique string (for example, a
  /// date/time stamp).
  Future<RegisterInstanceResponse> registerInstance({
    required Map<String, String> attributes,
    required String instanceId,
    required String serviceId,
    String? creatorRequestId,
  }) async {
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
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.TagResource'
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
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.UntagResource'
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

  /// Updates an HTTP namespace.
  ///
  /// May throw [InvalidInput].
  /// May throw [NamespaceNotFound].
  /// May throw [ResourceInUse].
  /// May throw [DuplicateRequest].
  ///
  /// Parameter [id] :
  /// The ID of the namespace that you want to update.
  ///
  /// Parameter [namespace] :
  /// Updated properties for the the HTTP namespace.
  ///
  /// Parameter [updaterRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>UpdateHttpNamespace</code> requests to be retried without the risk
  /// of running the operation twice. <code>UpdaterRequestId</code> can be any
  /// unique string (for example, a date/timestamp).
  Future<UpdateHttpNamespaceResponse> updateHttpNamespace({
    required String id,
    required HttpNamespaceChange namespace,
    String? updaterRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.UpdateHttpNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Namespace': namespace,
        'UpdaterRequestId': updaterRequestId ?? _s.generateIdempotencyToken(),
      },
    );

    return UpdateHttpNamespaceResponse.fromJson(jsonResponse.body);
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
    required String instanceId,
    required String serviceId,
    required CustomHealthStatus status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'Route53AutoNaming_v20170314.UpdateInstanceCustomHealthStatus'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        'ServiceId': serviceId,
        'Status': status.toValue(),
      },
    );
  }

  /// Updates a private DNS namespace.
  ///
  /// May throw [InvalidInput].
  /// May throw [NamespaceNotFound].
  /// May throw [ResourceInUse].
  /// May throw [DuplicateRequest].
  ///
  /// Parameter [id] :
  /// The ID of the namespace that you want to update.
  ///
  /// Parameter [namespace] :
  /// Updated properties for the private DNS namespace.
  ///
  /// Parameter [updaterRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>UpdatePrivateDnsNamespace</code> requests to be retried without the
  /// risk of running the operation twice. <code>UpdaterRequestId</code> can be
  /// any unique string (for example, a date/timestamp).
  Future<UpdatePrivateDnsNamespaceResponse> updatePrivateDnsNamespace({
    required String id,
    required PrivateDnsNamespaceChange namespace,
    String? updaterRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.UpdatePrivateDnsNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Namespace': namespace,
        'UpdaterRequestId': updaterRequestId ?? _s.generateIdempotencyToken(),
      },
    );

    return UpdatePrivateDnsNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Updates a public DNS namespace.
  ///
  /// May throw [InvalidInput].
  /// May throw [NamespaceNotFound].
  /// May throw [ResourceInUse].
  /// May throw [DuplicateRequest].
  ///
  /// Parameter [id] :
  /// The ID of the namespace being updated.
  ///
  /// Parameter [namespace] :
  /// Updated properties for the public DNS namespace.
  ///
  /// Parameter [updaterRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// <code>UpdatePublicDnsNamespace</code> requests to be retried without the
  /// risk of running the operation twice. <code>UpdaterRequestId</code> can be
  /// any unique string (for example, a date/timestamp).
  Future<UpdatePublicDnsNamespaceResponse> updatePublicDnsNamespace({
    required String id,
    required PublicDnsNamespaceChange namespace,
    String? updaterRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53AutoNaming_v20170314.UpdatePublicDnsNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Namespace': namespace,
        'UpdaterRequestId': updaterRequestId ?? _s.generateIdempotencyToken(),
      },
    );

    return UpdatePublicDnsNamespaceResponse.fromJson(jsonResponse.body);
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
  /// from an <code>UpdateService</code> request, the configuration isn't
  /// deleted from the service.
  /// </li>
  /// </ul>
  /// When you update settings for a service, Cloud Map also updates the
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
    required String id,
    required ServiceChange service,
  }) async {
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

class CreateHttpNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  final String? operationId;

  CreateHttpNamespaceResponse({
    this.operationId,
  });

  factory CreateHttpNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateHttpNamespaceResponse(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class CreatePrivateDnsNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  final String? operationId;

  CreatePrivateDnsNamespaceResponse({
    this.operationId,
  });

  factory CreatePrivateDnsNamespaceResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePrivateDnsNamespaceResponse(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class CreatePublicDnsNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  final String? operationId;

  CreatePublicDnsNamespaceResponse({
    this.operationId,
  });

  factory CreatePublicDnsNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return CreatePublicDnsNamespaceResponse(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class CreateServiceResponse {
  /// A complex type that contains information about the new service.
  final Service? service;

  CreateServiceResponse({
    this.service,
  });

  factory CreateServiceResponse.fromJson(Map<String, dynamic> json) {
    return CreateServiceResponse(
      service: json['Service'] != null
          ? Service.fromJson(json['Service'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      if (service != null) 'Service': service,
    };
  }
}

enum CustomHealthStatus {
  healthy,
  unhealthy,
}

extension CustomHealthStatusValueExtension on CustomHealthStatus {
  String toValue() {
    switch (this) {
      case CustomHealthStatus.healthy:
        return 'HEALTHY';
      case CustomHealthStatus.unhealthy:
        return 'UNHEALTHY';
    }
  }
}

extension CustomHealthStatusFromString on String {
  CustomHealthStatus toCustomHealthStatus() {
    switch (this) {
      case 'HEALTHY':
        return CustomHealthStatus.healthy;
      case 'UNHEALTHY':
        return CustomHealthStatus.unhealthy;
    }
    throw Exception('$this is not known in enum CustomHealthStatus');
  }
}

class DeleteNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  final String? operationId;

  DeleteNamespaceResponse({
    this.operationId,
  });

  factory DeleteNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNamespaceResponse(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class DeleteServiceResponse {
  DeleteServiceResponse();

  factory DeleteServiceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteServiceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeregisterInstanceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  final String? operationId;

  DeregisterInstanceResponse({
    this.operationId,
  });

  factory DeregisterInstanceResponse.fromJson(Map<String, dynamic> json) {
    return DeregisterInstanceResponse(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class DiscoverInstancesResponse {
  /// A complex type that contains one <code>HttpInstanceSummary</code> for each
  /// registered instance.
  final List<HttpInstanceSummary>? instances;

  /// The increasing revision associated to the response Instances list. If a new
  /// instance is registered or deregistered, the <code>InstancesRevision</code>
  /// updates. The health status updates don't update
  /// <code>InstancesRevision</code>.
  final int? instancesRevision;

  DiscoverInstancesResponse({
    this.instances,
    this.instancesRevision,
  });

  factory DiscoverInstancesResponse.fromJson(Map<String, dynamic> json) {
    return DiscoverInstancesResponse(
      instances: (json['Instances'] as List?)
          ?.whereNotNull()
          .map((e) => HttpInstanceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      instancesRevision: json['InstancesRevision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    final instancesRevision = this.instancesRevision;
    return {
      if (instances != null) 'Instances': instances,
      if (instancesRevision != null) 'InstancesRevision': instancesRevision,
    };
  }
}

class DiscoverInstancesRevisionResponse {
  /// The increasing revision associated to the response Instances list. If a new
  /// instance is registered or deregistered, the <code>InstancesRevision</code>
  /// updates. The health status updates don't update
  /// <code>InstancesRevision</code>.
  final int? instancesRevision;

  DiscoverInstancesRevisionResponse({
    this.instancesRevision,
  });

  factory DiscoverInstancesRevisionResponse.fromJson(
      Map<String, dynamic> json) {
    return DiscoverInstancesRevisionResponse(
      instancesRevision: json['InstancesRevision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final instancesRevision = this.instancesRevision;
    return {
      if (instancesRevision != null) 'InstancesRevision': instancesRevision,
    };
  }
}

/// A complex type that contains information about the Amazon Route 53 DNS
/// records that you want Cloud Map to create when you register an instance.
/// <important>
/// The record types of a service can only be changed by deleting the service
/// and recreating it with a new <code>Dnsconfig</code>.
/// </important>
class DnsConfig {
  /// An array that contains one <code>DnsRecord</code> object for each Route 53
  /// DNS record that you want Cloud Map to create when you register an instance.
  final List<DnsRecord> dnsRecords;

  /// <i>Use NamespaceId in <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_Service.html">Service</a>
  /// instead.</i>
  ///
  /// The ID of the namespace to use for DNS configuration.
  final String? namespaceId;

  /// The routing policy that you want to apply to all Route 53 DNS records that
  /// Cloud Map creates when you register an instance and specify this service.
  /// <note>
  /// If you want to use this service to register instances that create alias
  /// records, specify <code>WEIGHTED</code> for the routing policy.
  /// </note>
  /// You can specify the following values:
  /// <dl> <dt>MULTIVALUE</dt> <dd>
  /// If you define a health check for the service and the health check is
  /// healthy, Route 53 returns the applicable value for up to eight instances.
  ///
  /// For example, suppose that the service includes configurations for one
  /// <code>A</code> record and a health check. You use the service to register 10
  /// instances. Route 53 responds to DNS queries with IP addresses for up to
  /// eight healthy instances. If fewer than eight instances are healthy, Route 53
  /// responds to every DNS query with the IP addresses for all of the healthy
  /// instances.
  ///
  /// If you don't define a health check for the service, Route 53 assumes that
  /// all instances are healthy and returns the values for up to eight instances.
  ///
  /// For more information about the multivalue routing policy, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-multivalue">Multivalue
  /// Answer Routing</a> in the <i>Route 53 Developer Guide</i>.
  /// </dd> <dt>WEIGHTED</dt> <dd>
  /// Route 53 returns the applicable value from one randomly selected instance
  /// from among the instances that you registered using the same service.
  /// Currently, all records have the same weight, so you can't route more or less
  /// traffic to any instances.
  ///
  /// For example, suppose that the service includes configurations for one
  /// <code>A</code> record and a health check. You use the service to register 10
  /// instances. Route 53 responds to DNS queries with the IP address for one
  /// randomly selected instance from among the healthy instances. If no instances
  /// are healthy, Route 53 responds to DNS queries as if all of the instances
  /// were healthy.
  ///
  /// If you don't define a health check for the service, Route 53 assumes that
  /// all instances are healthy and returns the applicable value for one randomly
  /// selected instance.
  ///
  /// For more information about the weighted routing policy, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-weighted">Weighted
  /// Routing</a> in the <i>Route 53 Developer Guide</i>.
  /// </dd> </dl>
  final RoutingPolicy? routingPolicy;

  DnsConfig({
    required this.dnsRecords,
    this.namespaceId,
    this.routingPolicy,
  });

  factory DnsConfig.fromJson(Map<String, dynamic> json) {
    return DnsConfig(
      dnsRecords: (json['DnsRecords'] as List)
          .whereNotNull()
          .map((e) => DnsRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      namespaceId: json['NamespaceId'] as String?,
      routingPolicy: (json['RoutingPolicy'] as String?)?.toRoutingPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final dnsRecords = this.dnsRecords;
    final namespaceId = this.namespaceId;
    final routingPolicy = this.routingPolicy;
    return {
      'DnsRecords': dnsRecords,
      if (namespaceId != null) 'NamespaceId': namespaceId,
      if (routingPolicy != null) 'RoutingPolicy': routingPolicy.toValue(),
    };
  }
}

/// A complex type that contains information about changes to the Route 53 DNS
/// records that Cloud Map creates when you register an instance.
class DnsConfigChange {
  /// An array that contains one <code>DnsRecord</code> object for each Route 53
  /// record that you want Cloud Map to create when you register an instance.
  final List<DnsRecord> dnsRecords;

  DnsConfigChange({
    required this.dnsRecords,
  });

  Map<String, dynamic> toJson() {
    final dnsRecords = this.dnsRecords;
    return {
      'DnsRecords': dnsRecords,
    };
  }
}

/// A complex type that contains the ID for the Route 53 hosted zone that Cloud
/// Map creates when you create a namespace.
class DnsProperties {
  /// The ID for the Route 53 hosted zone that Cloud Map creates when you create a
  /// namespace.
  final String? hostedZoneId;

  /// Start of Authority (SOA) record for the hosted zone.
  final SOA? soa;

  DnsProperties({
    this.hostedZoneId,
    this.soa,
  });

  factory DnsProperties.fromJson(Map<String, dynamic> json) {
    return DnsProperties(
      hostedZoneId: json['HostedZoneId'] as String?,
      soa: json['SOA'] != null
          ? SOA.fromJson(json['SOA'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final soa = this.soa;
    return {
      if (hostedZoneId != null) 'HostedZoneId': hostedZoneId,
      if (soa != null) 'SOA': soa,
    };
  }
}

/// A complex type that contains information about the Route 53 DNS records that
/// you want Cloud Map to create when you register an instance.
class DnsRecord {
  /// The amount of time, in seconds, that you want DNS resolvers to cache the
  /// settings for this record.
  /// <note>
  /// Alias records don't include a TTL because Route 53 uses the TTL for the
  /// Amazon Web Services resource that an alias record routes traffic to. If you
  /// include the <code>AWS_ALIAS_DNS_NAME</code> attribute when you submit a <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html">RegisterInstance</a>
  /// request, the <code>TTL</code> value is ignored. Always specify a TTL for the
  /// service; you can use a service to register instances that create either
  /// alias or non-alias records.
  /// </note>
  final int ttl;

  /// The type of the resource, which indicates the type of value that Route 53
  /// returns in response to DNS queries. You can specify values for
  /// <code>Type</code> in the following combinations:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>A</code> </b>
  /// </li>
  /// <li>
  /// <b> <code>AAAA</code> </b>
  /// </li>
  /// <li>
  /// <b> <code>A</code> </b> and <b> <code>AAAA</code> </b>
  /// </li>
  /// <li>
  /// <b> <code>SRV</code> </b>
  /// </li>
  /// <li>
  /// <b> <code>CNAME</code> </b>
  /// </li>
  /// </ul>
  /// If you want Cloud Map to create a Route 53 alias record when you register an
  /// instance, specify <code>A</code> or <code>AAAA</code> for <code>Type</code>.
  ///
  /// You specify other settings, such as the IP address for <code>A</code> and
  /// <code>AAAA</code> records, when you register an instance. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html">RegisterInstance</a>.
  ///
  /// The following values are supported:
  /// <dl> <dt>A</dt> <dd>
  /// Route 53 returns the IP address of the resource in IPv4 format, such as
  /// 192.0.2.44.
  /// </dd> <dt>AAAA</dt> <dd>
  /// Route 53 returns the IP address of the resource in IPv6 format, such as
  /// 2001:0db8:85a3:0000:0000:abcd:0001:2345.
  /// </dd> <dt>CNAME</dt> <dd>
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
  /// </ul> </dd> <dt>SRV</dt> <dd>
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
  /// <code>service-hostname</code> is the following:
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
  /// request, Cloud Map automatically creates <code>A</code> and/or
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
  /// </ul> </dd> </dl>
  final RecordType type;

  DnsRecord({
    required this.ttl,
    required this.type,
  });

  factory DnsRecord.fromJson(Map<String, dynamic> json) {
    return DnsRecord(
      ttl: json['TTL'] as int,
      type: (json['Type'] as String).toRecordType(),
    );
  }

  Map<String, dynamic> toJson() {
    final ttl = this.ttl;
    final type = this.type;
    return {
      'TTL': ttl,
      'Type': type.toValue(),
    };
  }
}

enum FilterCondition {
  eq,
  $in,
  between,
  beginsWith,
}

extension FilterConditionValueExtension on FilterCondition {
  String toValue() {
    switch (this) {
      case FilterCondition.eq:
        return 'EQ';
      case FilterCondition.$in:
        return 'IN';
      case FilterCondition.between:
        return 'BETWEEN';
      case FilterCondition.beginsWith:
        return 'BEGINS_WITH';
    }
  }
}

extension FilterConditionFromString on String {
  FilterCondition toFilterCondition() {
    switch (this) {
      case 'EQ':
        return FilterCondition.eq;
      case 'IN':
        return FilterCondition.$in;
      case 'BETWEEN':
        return FilterCondition.between;
      case 'BEGINS_WITH':
        return FilterCondition.beginsWith;
    }
    throw Exception('$this is not known in enum FilterCondition');
  }
}

class GetInstanceResponse {
  /// A complex type that contains information about a specified instance.
  final Instance? instance;

  GetInstanceResponse({
    this.instance,
  });

  factory GetInstanceResponse.fromJson(Map<String, dynamic> json) {
    return GetInstanceResponse(
      instance: json['Instance'] != null
          ? Instance.fromJson(json['Instance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      if (instance != null) 'Instance': instance,
    };
  }
}

class GetInstancesHealthStatusResponse {
  /// If more than <code>MaxResults</code> instances match the specified criteria,
  /// you can submit another <code>GetInstancesHealthStatus</code> request to get
  /// the next group of results. Specify the value of <code>NextToken</code> from
  /// the previous response in the next request.
  final String? nextToken;

  /// A complex type that contains the IDs and the health status of the instances
  /// that you specified in the <code>GetInstancesHealthStatus</code> request.
  final Map<String, HealthStatus>? status;

  GetInstancesHealthStatusResponse({
    this.nextToken,
    this.status,
  });

  factory GetInstancesHealthStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetInstancesHealthStatusResponse(
      nextToken: json['NextToken'] as String?,
      status: (json['Status'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, (e as String).toHealthStatus())),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final status = this.status;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (status != null)
        'Status': status.map((k, e) => MapEntry(k, e.toValue())),
    };
  }
}

class GetNamespaceResponse {
  /// A complex type that contains information about the specified namespace.
  final Namespace? namespace;

  GetNamespaceResponse({
    this.namespace,
  });

  factory GetNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return GetNamespaceResponse(
      namespace: json['Namespace'] != null
          ? Namespace.fromJson(json['Namespace'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      if (namespace != null) 'Namespace': namespace,
    };
  }
}

class GetOperationResponse {
  /// A complex type that contains information about the operation.
  final Operation? operation;

  GetOperationResponse({
    this.operation,
  });

  factory GetOperationResponse.fromJson(Map<String, dynamic> json) {
    return GetOperationResponse(
      operation: json['Operation'] != null
          ? Operation.fromJson(json['Operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'Operation': operation,
    };
  }
}

class GetServiceResponse {
  /// A complex type that contains information about the service.
  final Service? service;

  GetServiceResponse({
    this.service,
  });

  factory GetServiceResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceResponse(
      service: json['Service'] != null
          ? Service.fromJson(json['Service'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      if (service != null) 'Service': service,
    };
  }
}

/// <i>Public DNS and HTTP namespaces only.</i> A complex type that contains
/// settings for an optional health check. If you specify settings for a health
/// check, Cloud Map associates the health check with the records that you
/// specify in <code>DnsConfig</code>.
/// <important>
/// If you specify a health check configuration, you can specify either
/// <code>HealthCheckCustomConfig</code> or <code>HealthCheckConfig</code> but
/// not both.
/// </important>
/// Health checks are basic Route 53 health checks that monitor an Amazon Web
/// Services endpoint. For information about pricing for health checks, see <a
/// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
///
/// Note the following about configuring health checks.
/// <dl> <dt>A and AAAA records</dt> <dd>
/// If <code>DnsConfig</code> includes configurations for both <code>A</code>
/// and <code>AAAA</code> records, Cloud Map creates a health check that uses
/// the IPv4 address to check the health of the resource. If the endpoint
/// tthat's specified by the IPv4 address is unhealthy, Route 53 considers both
/// the <code>A</code> and <code>AAAA</code> records to be unhealthy.
/// </dd> <dt>CNAME records</dt> <dd>
/// You can't specify settings for <code>HealthCheckConfig</code> when the
/// <code>DNSConfig</code> includes <code>CNAME</code> for the value of
/// <code>Type</code>. If you do, the <code>CreateService</code> request will
/// fail with an <code>InvalidInput</code> error.
/// </dd> <dt>Request interval</dt> <dd>
/// A Route 53 health checker in each health-checking Amazon Web Services Region
/// sends a health check request to an endpoint every 30 seconds. On average,
/// your endpoint receives a health check request about every two seconds.
/// However, health checkers don't coordinate with one another. Therefore, you
/// might sometimes see several requests in one second that's followed by a few
/// seconds with no health checks at all.
/// </dd> <dt>Health checking regions</dt> <dd>
/// Health checkers perform checks from all Route 53 health-checking Regions.
/// For a list of the current Regions, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-Regions">Regions</a>.
/// </dd> <dt>Alias records</dt> <dd>
/// When you register an instance, if you include the
/// <code>AWS_ALIAS_DNS_NAME</code> attribute, Cloud Map creates a Route 53
/// alias record. Note the following:
///
/// <ul>
/// <li>
/// Route 53 automatically sets <code>EvaluateTargetHealth</code> to true for
/// alias records. When <code>EvaluateTargetHealth</code> is true, the alias
/// record inherits the health of the referenced Amazon Web Services resource.
/// such as an ELB load balancer. For more information, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html#Route53-Type-AliasTarget-EvaluateTargetHealth">EvaluateTargetHealth</a>.
/// </li>
/// <li>
/// If you include <code>HealthCheckConfig</code> and then use the service to
/// register an instance that creates an alias record, Route 53 doesn't create
/// the health check.
/// </li>
/// </ul> </dd> <dt>Charges for health checks</dt> <dd>
/// Health checks are basic Route 53 health checks that monitor an Amazon Web
/// Services endpoint. For information about pricing for health checks, see <a
/// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
/// </dd> </dl>
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
  final HealthCheckType type;

  /// The number of consecutive health checks that an endpoint must pass or fail
  /// for Route 53 to change the current status of the endpoint from unhealthy to
  /// healthy or the other way around. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How
  /// Route 53 Determines Whether an Endpoint Is Healthy</a> in the <i>Route 53
  /// Developer Guide</i>.
  final int? failureThreshold;

  /// The path that you want Route 53 to request when performing health checks.
  /// The path can be any value that your endpoint returns an HTTP status code of
  /// a 2xx or 3xx format for when the endpoint is healthy. An example file is
  /// <code>/docs/route53-health-check.html</code>. Route 53 automatically adds
  /// the DNS name for the service. If you don't specify a value for
  /// <code>ResourcePath</code>, the default value is <code>/</code>.
  ///
  /// If you specify <code>TCP</code> for <code>Type</code>, you must <i>not</i>
  /// specify a value for <code>ResourcePath</code>.
  final String? resourcePath;

  HealthCheckConfig({
    required this.type,
    this.failureThreshold,
    this.resourcePath,
  });

  factory HealthCheckConfig.fromJson(Map<String, dynamic> json) {
    return HealthCheckConfig(
      type: (json['Type'] as String).toHealthCheckType(),
      failureThreshold: json['FailureThreshold'] as int?,
      resourcePath: json['ResourcePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final failureThreshold = this.failureThreshold;
    final resourcePath = this.resourcePath;
    return {
      'Type': type.toValue(),
      if (failureThreshold != null) 'FailureThreshold': failureThreshold,
      if (resourcePath != null) 'ResourcePath': resourcePath,
    };
  }
}

/// A complex type that contains information about an optional custom health
/// check. A custom health check, which requires that you use a third-party
/// health checker to evaluate the health of your resources, is useful in the
/// following circumstances:
///
/// <ul>
/// <li>
/// You can't use a health check that's defined by
/// <code>HealthCheckConfig</code> because the resource isn't available over the
/// internet. For example, you can use a custom health check when the instance
/// is in an Amazon VPC. (To check the health of resources in a VPC, the health
/// checker must also be in the VPC.)
/// </li>
/// <li>
/// You want to use a third-party health checker regardless of where your
/// resources are located.
/// </li>
/// </ul> <important>
/// If you specify a health check configuration, you can specify either
/// <code>HealthCheckCustomConfig</code> or <code>HealthCheckConfig</code> but
/// not both.
/// </important>
/// To change the status of a custom health check, submit an
/// <code>UpdateInstanceCustomHealthStatus</code> request. Cloud Map doesn't
/// monitor the status of the resource, it just keeps a record of the status
/// specified in the most recent <code>UpdateInstanceCustomHealthStatus</code>
/// request.
///
/// Here's how custom health checks work:
/// <ol>
/// <li>
/// You create a service.
/// </li>
/// <li>
/// You register an instance.
/// </li>
/// <li>
/// You configure a third-party health checker to monitor the resource that's
/// associated with the new instance.
/// <note>
/// Cloud Map doesn't check the health of the resource directly.
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
/// Cloud Map waits for 30 seconds.
/// </li>
/// <li>
/// If another <code>UpdateInstanceCustomHealthStatus</code> request doesn't
/// arrive during that time to change the status back to healthy, Cloud Map
/// stops routing traffic to the resource.
/// </li> </ol>
class HealthCheckCustomConfig {
  /// <important>
  /// This parameter is no longer supported and is always set to 1. Cloud Map
  /// waits for approximately 30 seconds after receiving an
  /// <code>UpdateInstanceCustomHealthStatus</code> request before changing the
  /// status of the service instance.
  /// </important>
  /// The number of 30-second intervals that you want Cloud Map to wait after
  /// receiving an <code>UpdateInstanceCustomHealthStatus</code> request before it
  /// changes the health status of a service instance.
  ///
  /// Sending a second or subsequent <code>UpdateInstanceCustomHealthStatus</code>
  /// request with the same value before 30 seconds has passed doesn't accelerate
  /// the change. Cloud Map still waits <code>30</code> seconds after the first
  /// request to make the change.
  final int? failureThreshold;

  HealthCheckCustomConfig({
    this.failureThreshold,
  });

  factory HealthCheckCustomConfig.fromJson(Map<String, dynamic> json) {
    return HealthCheckCustomConfig(
      failureThreshold: json['FailureThreshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureThreshold = this.failureThreshold;
    return {
      if (failureThreshold != null) 'FailureThreshold': failureThreshold,
    };
  }
}

enum HealthCheckType {
  http,
  https,
  tcp,
}

extension HealthCheckTypeValueExtension on HealthCheckType {
  String toValue() {
    switch (this) {
      case HealthCheckType.http:
        return 'HTTP';
      case HealthCheckType.https:
        return 'HTTPS';
      case HealthCheckType.tcp:
        return 'TCP';
    }
  }
}

extension HealthCheckTypeFromString on String {
  HealthCheckType toHealthCheckType() {
    switch (this) {
      case 'HTTP':
        return HealthCheckType.http;
      case 'HTTPS':
        return HealthCheckType.https;
      case 'TCP':
        return HealthCheckType.tcp;
    }
    throw Exception('$this is not known in enum HealthCheckType');
  }
}

enum HealthStatus {
  healthy,
  unhealthy,
  unknown,
}

extension HealthStatusValueExtension on HealthStatus {
  String toValue() {
    switch (this) {
      case HealthStatus.healthy:
        return 'HEALTHY';
      case HealthStatus.unhealthy:
        return 'UNHEALTHY';
      case HealthStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension HealthStatusFromString on String {
  HealthStatus toHealthStatus() {
    switch (this) {
      case 'HEALTHY':
        return HealthStatus.healthy;
      case 'UNHEALTHY':
        return HealthStatus.unhealthy;
      case 'UNKNOWN':
        return HealthStatus.unknown;
    }
    throw Exception('$this is not known in enum HealthStatus');
  }
}

enum HealthStatusFilter {
  healthy,
  unhealthy,
  all,
  healthyOrElseAll,
}

extension HealthStatusFilterValueExtension on HealthStatusFilter {
  String toValue() {
    switch (this) {
      case HealthStatusFilter.healthy:
        return 'HEALTHY';
      case HealthStatusFilter.unhealthy:
        return 'UNHEALTHY';
      case HealthStatusFilter.all:
        return 'ALL';
      case HealthStatusFilter.healthyOrElseAll:
        return 'HEALTHY_OR_ELSE_ALL';
    }
  }
}

extension HealthStatusFilterFromString on String {
  HealthStatusFilter toHealthStatusFilter() {
    switch (this) {
      case 'HEALTHY':
        return HealthStatusFilter.healthy;
      case 'UNHEALTHY':
        return HealthStatusFilter.unhealthy;
      case 'ALL':
        return HealthStatusFilter.all;
      case 'HEALTHY_OR_ELSE_ALL':
        return HealthStatusFilter.healthyOrElseAll;
    }
    throw Exception('$this is not known in enum HealthStatusFilter');
  }
}

/// In a response to a <a
/// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>
/// request, <code>HttpInstanceSummary</code> contains information about one
/// instance that matches the values that you specified in the request.
class HttpInstanceSummary {
  /// If you included any attributes when you registered the instance, the values
  /// of those attributes.
  final Map<String, String>? attributes;

  /// If you configured health checking in the service, the current health status
  /// of the service instance.
  final HealthStatus? healthStatus;

  /// The ID of an instance that matches the values that you specified in the
  /// request.
  final String? instanceId;

  /// <code/> <code/> <code/>
  ///
  /// The <code>HttpName</code> name of the namespace. It's found in the
  /// <code>HttpProperties</code> member of the <code>Properties</code> member of
  /// the namespace.
  final String? namespaceName;

  /// The name of the service that you specified when you registered the instance.
  final String? serviceName;

  HttpInstanceSummary({
    this.attributes,
    this.healthStatus,
    this.instanceId,
    this.namespaceName,
    this.serviceName,
  });

  factory HttpInstanceSummary.fromJson(Map<String, dynamic> json) {
    return HttpInstanceSummary(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      healthStatus: (json['HealthStatus'] as String?)?.toHealthStatus(),
      instanceId: json['InstanceId'] as String?,
      namespaceName: json['NamespaceName'] as String?,
      serviceName: json['ServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final healthStatus = this.healthStatus;
    final instanceId = this.instanceId;
    final namespaceName = this.namespaceName;
    final serviceName = this.serviceName;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (healthStatus != null) 'HealthStatus': healthStatus.toValue(),
      if (instanceId != null) 'InstanceId': instanceId,
      if (namespaceName != null) 'NamespaceName': namespaceName,
      if (serviceName != null) 'ServiceName': serviceName,
    };
  }
}

/// Updated properties for the HTTP namespace.
class HttpNamespaceChange {
  /// An updated description for the HTTP namespace.
  final String description;

  HttpNamespaceChange({
    required this.description,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    return {
      'Description': description,
    };
  }
}

/// A complex type that contains the name of an HTTP namespace.
class HttpProperties {
  /// The name of an HTTP namespace.
  final String? httpName;

  HttpProperties({
    this.httpName,
  });

  factory HttpProperties.fromJson(Map<String, dynamic> json) {
    return HttpProperties(
      httpName: json['HttpName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final httpName = this.httpName;
    return {
      if (httpName != null) 'HttpName': httpName,
    };
  }
}

/// A complex type that contains information about an instance that Cloud Map
/// creates when you submit a <code>RegisterInstance</code> request.
class Instance {
  /// An identifier that you want to associate with the instance. Note the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// If the service that's specified by <code>ServiceId</code> includes settings
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
  /// To register a new instance, you must specify a value that's unique among
  /// instances that you register by using the same service.
  /// </li>
  /// <li>
  /// If you specify an existing <code>InstanceId</code> and
  /// <code>ServiceId</code>, Cloud Map updates the existing DNS records. If
  /// there's also an existing health check, Cloud Map deletes the old health
  /// check and creates a new one.
  /// <note>
  /// The health check isn't deleted immediately, so it will still appear for a
  /// while if you submit a <code>ListHealthChecks</code> request, for example.
  /// </note> </li>
  /// </ul>
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
  /// </ul> <note>
  /// Do not include sensitive information in the attributes if the namespace is
  /// discoverable by public DNS queries.
  /// </note>
  /// Supported attribute keys include the following:
  /// <dl> <dt>AWS_ALIAS_DNS_NAME</dt> <dd>
  /// If you want Cloud Map to create a Route 53 alias record that routes traffic
  /// to an Elastic Load Balancing load balancer, specify the DNS name that's
  /// associated with the load balancer. For information about how to get the DNS
  /// name, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html#Route53-Type-AliasTarget-DNSName">AliasTarget-&gt;DNSName</a>
  /// in the <i>Route 53 API Reference</i>.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// The configuration for the service that's specified by <code>ServiceId</code>
  /// must include settings for an <code>A</code> record, an <code>AAAA</code>
  /// record, or both.
  /// </li>
  /// <li>
  /// In the service that's specified by <code>ServiceId</code>, the value of
  /// <code>RoutingPolicy</code> must be <code>WEIGHTED</code>.
  /// </li>
  /// <li>
  /// If the service that's specified by <code>ServiceId</code> includes
  /// <code>HealthCheckConfig</code> settings, Cloud Map creates the health check,
  /// but it won't associate the health check with the alias record.
  /// </li>
  /// <li>
  /// Auto naming currently doesn't support creating alias records that route
  /// traffic to Amazon Web Services resources other than ELB load balancers.
  /// </li>
  /// <li>
  /// If you specify a value for <code>AWS_ALIAS_DNS_NAME</code>, don't specify
  /// values for any of the <code>AWS_INSTANCE</code> attributes.
  /// </li>
  /// </ul> </dd> <dt>AWS_EC2_INSTANCE_ID</dt> <dd>
  /// <i>HTTP namespaces only.</i> The Amazon EC2 instance ID for the instance.
  /// The <code>AWS_INSTANCE_IPV4</code> attribute contains the primary private
  /// IPv4 address.
  /// </dd> <dt>AWS_INIT_HEALTH_STATUS</dt> <dd>
  /// If the service configuration includes <code>HealthCheckCustomConfig</code>,
  /// you can optionally use <code>AWS_INIT_HEALTH_STATUS</code> to specify the
  /// initial status of the custom health check, <code>HEALTHY</code> or
  /// <code>UNHEALTHY</code>. If you don't specify a value for
  /// <code>AWS_INIT_HEALTH_STATUS</code>, the initial status is
  /// <code>HEALTHY</code>.
  /// </dd> <dt>AWS_INSTANCE_CNAME</dt> <dd>
  /// If the service configuration includes a <code>CNAME</code> record, the
  /// domain name that you want Route 53 to return in response to DNS queries (for
  /// example, <code>example.com</code>).
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>CNAME</code> record.
  /// </dd> <dt>AWS_INSTANCE_IPV4</dt> <dd>
  /// If the service configuration includes an <code>A</code> record, the IPv4
  /// address that you want Route 53 to return in response to DNS queries (for
  /// example, <code>192.0.2.44</code>).
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>A</code> record. If the service includes
  /// settings for an <code>SRV</code> record, you must specify a value for
  /// <code>AWS_INSTANCE_IPV4</code>, <code>AWS_INSTANCE_IPV6</code>, or both.
  /// </dd> <dt>AWS_INSTANCE_IPV6</dt> <dd>
  /// If the service configuration includes an <code>AAAA</code> record, the IPv6
  /// address that you want Route 53 to return in response to DNS queries (for
  /// example, <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>).
  ///
  /// This value is required if the service specified by <code>ServiceId</code>
  /// includes settings for an <code>AAAA</code> record. If the service includes
  /// settings for an <code>SRV</code> record, you must specify a value for
  /// <code>AWS_INSTANCE_IPV4</code>, <code>AWS_INSTANCE_IPV6</code>, or both.
  /// </dd> <dt>AWS_INSTANCE_PORT</dt> <dd>
  /// If the service includes an <code>SRV</code> record, the value that you want
  /// Route 53 to return for the port.
  ///
  /// If the service includes <code>HealthCheckConfig</code>, the port on the
  /// endpoint that you want Route 53 to send requests to.
  ///
  /// This value is required if you specified settings for an <code>SRV</code>
  /// record or a Route 53 health check when you created the service.
  /// </dd> </dl>
  final Map<String, String>? attributes;

  /// A unique string that identifies the request and that allows failed
  /// <code>RegisterInstance</code> requests to be retried without the risk of
  /// executing the operation twice. You must use a unique
  /// <code>CreatorRequestId</code> string every time you submit a
  /// <code>RegisterInstance</code> request if you're registering additional
  /// instances for the same namespace and service. <code>CreatorRequestId</code>
  /// can be any unique string (for example, a date/time stamp).
  final String? creatorRequestId;

  Instance({
    required this.id,
    this.attributes,
    this.creatorRequestId,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      id: json['Id'] as String,
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      creatorRequestId: json['CreatorRequestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final attributes = this.attributes;
    final creatorRequestId = this.creatorRequestId;
    return {
      'Id': id,
      if (attributes != null) 'Attributes': attributes,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
    };
  }
}

/// A complex type that contains information about the instances that you
/// registered by using a specified service.
class InstanceSummary {
  /// A string map that contains the following information:
  ///
  /// <ul>
  /// <li>
  /// The attributes that are associated with the instance.
  /// </li>
  /// <li>
  /// For each attribute, the applicable value.
  /// </li>
  /// </ul>
  /// Supported attribute keys include the following:
  /// <dl> <dt>AWS_ALIAS_DNS_NAME</dt> <dd>
  /// For an alias record that routes traffic to an Elastic Load Balancing load
  /// balancer, the DNS name that's associated with the load balancer.
  /// </dd> <dt>AWS_EC2_INSTANCE_ID (HTTP namespaces only)</dt> <dd>
  /// The Amazon EC2 instance ID for the instance. When the
  /// <code>AWS_EC2_INSTANCE_ID</code> attribute is specified, then the
  /// <code>AWS_INSTANCE_IPV4</code> attribute contains the primary private IPv4
  /// address.
  /// </dd> <dt>AWS_INIT_HEALTH_STATUS</dt> <dd>
  /// If the service configuration includes <code>HealthCheckCustomConfig</code>,
  /// you can optionally use <code>AWS_INIT_HEALTH_STATUS</code> to specify the
  /// initial status of the custom health check, <code>HEALTHY</code> or
  /// <code>UNHEALTHY</code>. If you don't specify a value for
  /// <code>AWS_INIT_HEALTH_STATUS</code>, the initial status is
  /// <code>HEALTHY</code>.
  /// </dd> <dt>AWS_INSTANCE_CNAME</dt> <dd>
  /// For a <code>CNAME</code> record, the domain name that Route 53 returns in
  /// response to DNS queries (for example, <code>example.com</code>).
  /// </dd> <dt>AWS_INSTANCE_IPV4</dt> <dd>
  /// For an <code>A</code> record, the IPv4 address that Route 53 returns in
  /// response to DNS queries (for example, <code>192.0.2.44</code>).
  /// </dd> <dt>AWS_INSTANCE_IPV6</dt> <dd>
  /// For an <code>AAAA</code> record, the IPv6 address that Route 53 returns in
  /// response to DNS queries (for example,
  /// <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>).
  /// </dd> <dt>AWS_INSTANCE_PORT</dt> <dd>
  /// For an <code>SRV</code> record, the value that Route 53 returns for the
  /// port. In addition, if the service includes <code>HealthCheckConfig</code>,
  /// the port on the endpoint that Route 53 sends requests to.
  /// </dd> </dl>
  final Map<String, String>? attributes;

  /// The ID for an instance that you created by using a specified service.
  final String? id;

  InstanceSummary({
    this.attributes,
    this.id,
  });

  factory InstanceSummary.fromJson(Map<String, dynamic> json) {
    return InstanceSummary(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final id = this.id;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (id != null) 'Id': id,
    };
  }
}

class ListInstancesResponse {
  /// Summary information about the instances that are associated with the
  /// specified service.
  final List<InstanceSummary>? instances;

  /// If more than <code>MaxResults</code> instances match the specified criteria,
  /// you can submit another <code>ListInstances</code> request to get the next
  /// group of results. Specify the value of <code>NextToken</code> from the
  /// previous response in the next request.
  final String? nextToken;

  ListInstancesResponse({
    this.instances,
    this.nextToken,
  });

  factory ListInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListInstancesResponse(
      instances: (json['Instances'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceSummary.fromJson(e as Map<String, dynamic>))
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

class ListNamespacesResponse {
  /// An array that contains one <code>NamespaceSummary</code> object for each
  /// namespace that matches the specified filter criteria.
  final List<NamespaceSummary>? namespaces;

  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListNamespaces</code> request to get the next group of results.
  /// Specify the value of <code>NextToken</code> from the previous response in
  /// the next request.
  /// <note>
  /// Cloud Map gets <code>MaxResults</code> namespaces and then filters them
  /// based on the specified criteria. It's possible that no namespaces in the
  /// first <code>MaxResults</code> namespaces matched the specified criteria but
  /// that subsequent groups of <code>MaxResults</code> namespaces do contain
  /// namespaces that match the criteria.
  /// </note>
  final String? nextToken;

  ListNamespacesResponse({
    this.namespaces,
    this.nextToken,
  });

  factory ListNamespacesResponse.fromJson(Map<String, dynamic> json) {
    return ListNamespacesResponse(
      namespaces: (json['Namespaces'] as List?)
          ?.whereNotNull()
          .map((e) => NamespaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespaces = this.namespaces;
    final nextToken = this.nextToken;
    return {
      if (namespaces != null) 'Namespaces': namespaces,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListOperationsResponse {
  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListOperations</code> request to get the next group of results.
  /// Specify the value of <code>NextToken</code> from the previous response in
  /// the next request.
  /// <note>
  /// Cloud Map gets <code>MaxResults</code> operations and then filters them
  /// based on the specified criteria. It's possible that no operations in the
  /// first <code>MaxResults</code> operations matched the specified criteria but
  /// that subsequent groups of <code>MaxResults</code> operations do contain
  /// operations that match the criteria.
  /// </note>
  final String? nextToken;

  /// Summary information about the operations that match the specified criteria.
  final List<OperationSummary>? operations;

  ListOperationsResponse({
    this.nextToken,
    this.operations,
  });

  factory ListOperationsResponse.fromJson(Map<String, dynamic> json) {
    return ListOperationsResponse(
      nextToken: json['NextToken'] as String?,
      operations: (json['Operations'] as List?)
          ?.whereNotNull()
          .map((e) => OperationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final operations = this.operations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (operations != null) 'Operations': operations,
    };
  }
}

class ListServicesResponse {
  /// If the response contains <code>NextToken</code>, submit another
  /// <code>ListServices</code> request to get the next group of results. Specify
  /// the value of <code>NextToken</code> from the previous response in the next
  /// request.
  /// <note>
  /// Cloud Map gets <code>MaxResults</code> services and then filters them based
  /// on the specified criteria. It's possible that no services in the first
  /// <code>MaxResults</code> services matched the specified criteria but that
  /// subsequent groups of <code>MaxResults</code> services do contain services
  /// that match the criteria.
  /// </note>
  final String? nextToken;

  /// An array that contains one <code>ServiceSummary</code> object for each
  /// service that matches the specified filter criteria.
  final List<ServiceSummary>? services;

  ListServicesResponse({
    this.nextToken,
    this.services,
  });

  factory ListServicesResponse.fromJson(Map<String, dynamic> json) {
    return ListServicesResponse(
      nextToken: json['NextToken'] as String?,
      services: (json['Services'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final services = this.services;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (services != null) 'Services': services,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags that are assigned to the resource.
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

/// A complex type that contains information about a specified namespace.
class Namespace {
  /// The Amazon Resource Name (ARN) that Cloud Map assigns to the namespace when
  /// you create it.
  final String? arn;

  /// The date that the namespace was created, in Unix date/time format and
  /// Coordinated Universal Time (UTC). The value of <code>CreateDate</code> is
  /// accurate to milliseconds. For example, the value <code>1516925490.087</code>
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? createDate;

  /// A unique string that identifies the request and that allows failed requests
  /// to be retried without the risk of running an operation twice.
  final String? creatorRequestId;

  /// The description that you specify for the namespace when you create it.
  final String? description;

  /// The ID of a namespace.
  final String? id;

  /// The name of the namespace, such as <code>example.com</code>.
  final String? name;

  /// A complex type that contains information that's specific to the type of the
  /// namespace.
  final NamespaceProperties? properties;

  /// The number of services that are associated with the namespace.
  final int? serviceCount;

  /// The type of the namespace. The methods for discovering instances depends on
  /// the value that you specify:
  /// <dl> <dt>HTTP</dt> <dd>
  /// Instances can be discovered only programmatically, using the Cloud Map
  /// <code>DiscoverInstances</code> API.
  /// </dd> <dt>DNS_PUBLIC</dt> <dd>
  /// Instances can be discovered using public DNS queries and using the
  /// <code>DiscoverInstances</code> API.
  /// </dd> <dt>DNS_PRIVATE</dt> <dd>
  /// Instances can be discovered using DNS queries in VPCs and using the
  /// <code>DiscoverInstances</code> API.
  /// </dd> </dl>
  final NamespaceType? type;

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

  factory Namespace.fromJson(Map<String, dynamic> json) {
    return Namespace(
      arn: json['Arn'] as String?,
      createDate: timeStampFromJson(json['CreateDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      properties: json['Properties'] != null
          ? NamespaceProperties.fromJson(
              json['Properties'] as Map<String, dynamic>)
          : null,
      serviceCount: json['ServiceCount'] as int?,
      type: (json['Type'] as String?)?.toNamespaceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createDate = this.createDate;
    final creatorRequestId = this.creatorRequestId;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final properties = this.properties;
    final serviceCount = this.serviceCount;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (properties != null) 'Properties': properties,
      if (serviceCount != null) 'ServiceCount': serviceCount,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// A complex type that identifies the namespaces that you want to list. You can
/// choose to list public or private namespaces.
class NamespaceFilter {
  /// Specify the namespaces that you want to get using one of the following.
  ///
  /// <ul>
  /// <li>
  /// <code>TYPE</code>: Gets the namespaces of the specified type.
  /// </li>
  /// <li>
  /// <code>NAME</code>: Gets the namespaces with the specified name.
  /// </li>
  /// <li>
  /// <code>HTTP_NAME</code>: Gets the namespaces with the specified HTTP name.
  /// </li>
  /// </ul>
  final NamespaceFilterName name;

  /// Specify the values that are applicable to the value that you specify for
  /// <code>Name</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>TYPE</code>: Specify <code>HTTP</code>, <code>DNS_PUBLIC</code>, or
  /// <code>DNS_PRIVATE</code>.
  /// </li>
  /// <li>
  /// <code>NAME</code>: Specify the name of the namespace, which is found in
  /// <code>Namespace.Name</code>.
  /// </li>
  /// <li>
  /// <code>HTTP_NAME</code>: Specify the HTTP name of the namespace, which is
  /// found in <code>Namespace.Properties.HttpProperties.HttpName</code>.
  /// </li>
  /// </ul>
  final List<String> values;

  /// Specify the operator that you want to use to determine whether a namespace
  /// matches the specified value. Valid values for <code>Condition</code> are one
  /// of the following.
  ///
  /// <ul>
  /// <li>
  /// <code>EQ</code>: When you specify <code>EQ</code> for
  /// <code>Condition</code>, you can specify only one value. <code>EQ</code> is
  /// supported for <code>TYPE</code>, <code>NAME</code>, and
  /// <code>HTTP_NAME</code>. <code>EQ</code> is the default condition and can be
  /// omitted.
  /// </li>
  /// <li>
  /// <code>BEGINS_WITH</code>: When you specify <code>BEGINS_WITH</code> for
  /// <code>Condition</code>, you can specify only one value.
  /// <code>BEGINS_WITH</code> is supported for <code>TYPE</code>,
  /// <code>NAME</code>, and <code>HTTP_NAME</code>.
  /// </li>
  /// </ul>
  final FilterCondition? condition;

  NamespaceFilter({
    required this.name,
    required this.values,
    this.condition,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final condition = this.condition;
    return {
      'Name': name.toValue(),
      'Values': values,
      if (condition != null) 'Condition': condition.toValue(),
    };
  }
}

enum NamespaceFilterName {
  type,
  name,
  httpName,
}

extension NamespaceFilterNameValueExtension on NamespaceFilterName {
  String toValue() {
    switch (this) {
      case NamespaceFilterName.type:
        return 'TYPE';
      case NamespaceFilterName.name:
        return 'NAME';
      case NamespaceFilterName.httpName:
        return 'HTTP_NAME';
    }
  }
}

extension NamespaceFilterNameFromString on String {
  NamespaceFilterName toNamespaceFilterName() {
    switch (this) {
      case 'TYPE':
        return NamespaceFilterName.type;
      case 'NAME':
        return NamespaceFilterName.name;
      case 'HTTP_NAME':
        return NamespaceFilterName.httpName;
    }
    throw Exception('$this is not known in enum NamespaceFilterName');
  }
}

/// A complex type that contains information that's specific to the namespace
/// type.
class NamespaceProperties {
  /// A complex type that contains the ID for the Route 53 hosted zone that Cloud
  /// Map creates when you create a namespace.
  final DnsProperties? dnsProperties;

  /// A complex type that contains the name of an HTTP namespace.
  final HttpProperties? httpProperties;

  NamespaceProperties({
    this.dnsProperties,
    this.httpProperties,
  });

  factory NamespaceProperties.fromJson(Map<String, dynamic> json) {
    return NamespaceProperties(
      dnsProperties: json['DnsProperties'] != null
          ? DnsProperties.fromJson(
              json['DnsProperties'] as Map<String, dynamic>)
          : null,
      httpProperties: json['HttpProperties'] != null
          ? HttpProperties.fromJson(
              json['HttpProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dnsProperties = this.dnsProperties;
    final httpProperties = this.httpProperties;
    return {
      if (dnsProperties != null) 'DnsProperties': dnsProperties,
      if (httpProperties != null) 'HttpProperties': httpProperties,
    };
  }
}

/// A complex type that contains information about a namespace.
class NamespaceSummary {
  /// The Amazon Resource Name (ARN) that Cloud Map assigns to the namespace when
  /// you create it.
  final String? arn;

  /// The date and time that the namespace was created.
  final DateTime? createDate;

  /// A description for the namespace.
  final String? description;

  /// The ID of the namespace.
  final String? id;

  /// The name of the namespace. When you create a namespace, Cloud Map
  /// automatically creates a Route 53 hosted zone that has the same name as the
  /// namespace.
  final String? name;

  /// The properties of the namespace.
  final NamespaceProperties? properties;

  /// The number of services that were created using the namespace.
  final int? serviceCount;

  /// The type of the namespace, either public or private.
  final NamespaceType? type;

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

  factory NamespaceSummary.fromJson(Map<String, dynamic> json) {
    return NamespaceSummary(
      arn: json['Arn'] as String?,
      createDate: timeStampFromJson(json['CreateDate']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      properties: json['Properties'] != null
          ? NamespaceProperties.fromJson(
              json['Properties'] as Map<String, dynamic>)
          : null,
      serviceCount: json['ServiceCount'] as int?,
      type: (json['Type'] as String?)?.toNamespaceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createDate = this.createDate;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final properties = this.properties;
    final serviceCount = this.serviceCount;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (properties != null) 'Properties': properties,
      if (serviceCount != null) 'ServiceCount': serviceCount,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum NamespaceType {
  dnsPublic,
  dnsPrivate,
  http,
}

extension NamespaceTypeValueExtension on NamespaceType {
  String toValue() {
    switch (this) {
      case NamespaceType.dnsPublic:
        return 'DNS_PUBLIC';
      case NamespaceType.dnsPrivate:
        return 'DNS_PRIVATE';
      case NamespaceType.http:
        return 'HTTP';
    }
  }
}

extension NamespaceTypeFromString on String {
  NamespaceType toNamespaceType() {
    switch (this) {
      case 'DNS_PUBLIC':
        return NamespaceType.dnsPublic;
      case 'DNS_PRIVATE':
        return NamespaceType.dnsPrivate;
      case 'HTTP':
        return NamespaceType.http;
    }
    throw Exception('$this is not known in enum NamespaceType');
  }
}

/// A complex type that contains information about a specified operation.
class Operation {
  /// The date and time that the request was submitted, in Unix date/time format
  /// and Coordinated Universal Time (UTC). The value of <code>CreateDate</code>
  /// is accurate to milliseconds. For example, the value
  /// <code>1516925490.087</code> represents Friday, January 26, 2018 12:11:30.087
  /// AM.
  final DateTime? createDate;

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
  final String? errorCode;

  /// If the value of <code>Status</code> is <code>FAIL</code>, the reason that
  /// the operation failed.
  final String? errorMessage;

  /// The ID of the operation that you want to get information about.
  final String? id;

  /// The status of the operation. Values include the following:
  /// <dl> <dt>SUBMITTED</dt> <dd>
  /// This is the initial state that occurs immediately after you submit a
  /// request.
  /// </dd> <dt>PENDING</dt> <dd>
  /// Cloud Map is performing the operation.
  /// </dd> <dt>SUCCESS</dt> <dd>
  /// The operation succeeded.
  /// </dd> <dt>FAIL</dt> <dd>
  /// The operation failed. For the failure reason, see <code>ErrorMessage</code>.
  /// </dd> </dl>
  final OperationStatus? status;

  /// The name of the target entity that's associated with the operation:
  /// <dl> <dt>NAMESPACE</dt> <dd>
  /// The namespace ID is returned in the <code>ResourceId</code> property.
  /// </dd> <dt>SERVICE</dt> <dd>
  /// The service ID is returned in the <code>ResourceId</code> property.
  /// </dd> <dt>INSTANCE</dt> <dd>
  /// The instance ID is returned in the <code>ResourceId</code> property.
  /// </dd> </dl>
  final Map<OperationTargetType, String>? targets;

  /// The name of the operation that's associated with the specified ID.
  final OperationType? type;

  /// The date and time that the value of <code>Status</code> changed to the
  /// current value, in Unix date/time format and Coordinated Universal Time
  /// (UTC). The value of <code>UpdateDate</code> is accurate to milliseconds. For
  /// example, the value <code>1516925490.087</code> represents Friday, January
  /// 26, 2018 12:11:30.087 AM.
  final DateTime? updateDate;

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

  factory Operation.fromJson(Map<String, dynamic> json) {
    return Operation(
      createDate: timeStampFromJson(json['CreateDate']),
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      id: json['Id'] as String?,
      status: (json['Status'] as String?)?.toOperationStatus(),
      targets: (json['Targets'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toOperationTargetType(), e as String)),
      type: (json['Type'] as String?)?.toOperationType(),
      updateDate: timeStampFromJson(json['UpdateDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final createDate = this.createDate;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    final status = this.status;
    final targets = this.targets;
    final type = this.type;
    final updateDate = this.updateDate;
    return {
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (id != null) 'Id': id,
      if (status != null) 'Status': status.toValue(),
      if (targets != null)
        'Targets': targets.map((k, e) => MapEntry(k.toValue(), e)),
      if (type != null) 'Type': type.toValue(),
      if (updateDate != null) 'UpdateDate': unixTimestampToJson(updateDate),
    };
  }
}

/// A complex type that lets you select the operations that you want to list.
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
  final FilterCondition? condition;

  OperationFilter({
    required this.name,
    required this.values,
    this.condition,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final condition = this.condition;
    return {
      'Name': name.toValue(),
      'Values': values,
      if (condition != null) 'Condition': condition.toValue(),
    };
  }
}

enum OperationFilterName {
  namespaceId,
  serviceId,
  status,
  type,
  updateDate,
}

extension OperationFilterNameValueExtension on OperationFilterName {
  String toValue() {
    switch (this) {
      case OperationFilterName.namespaceId:
        return 'NAMESPACE_ID';
      case OperationFilterName.serviceId:
        return 'SERVICE_ID';
      case OperationFilterName.status:
        return 'STATUS';
      case OperationFilterName.type:
        return 'TYPE';
      case OperationFilterName.updateDate:
        return 'UPDATE_DATE';
    }
  }
}

extension OperationFilterNameFromString on String {
  OperationFilterName toOperationFilterName() {
    switch (this) {
      case 'NAMESPACE_ID':
        return OperationFilterName.namespaceId;
      case 'SERVICE_ID':
        return OperationFilterName.serviceId;
      case 'STATUS':
        return OperationFilterName.status;
      case 'TYPE':
        return OperationFilterName.type;
      case 'UPDATE_DATE':
        return OperationFilterName.updateDate;
    }
    throw Exception('$this is not known in enum OperationFilterName');
  }
}

enum OperationStatus {
  submitted,
  pending,
  success,
  fail,
}

extension OperationStatusValueExtension on OperationStatus {
  String toValue() {
    switch (this) {
      case OperationStatus.submitted:
        return 'SUBMITTED';
      case OperationStatus.pending:
        return 'PENDING';
      case OperationStatus.success:
        return 'SUCCESS';
      case OperationStatus.fail:
        return 'FAIL';
    }
  }
}

extension OperationStatusFromString on String {
  OperationStatus toOperationStatus() {
    switch (this) {
      case 'SUBMITTED':
        return OperationStatus.submitted;
      case 'PENDING':
        return OperationStatus.pending;
      case 'SUCCESS':
        return OperationStatus.success;
      case 'FAIL':
        return OperationStatus.fail;
    }
    throw Exception('$this is not known in enum OperationStatus');
  }
}

/// A complex type that contains information about an operation that matches the
/// criteria that you specified in a <a
/// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html">ListOperations</a>
/// request.
class OperationSummary {
  /// The ID for an operation.
  final String? id;

  /// The status of the operation. Values include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>SUBMITTED</b>: This is the initial state immediately after you submit a
  /// request.
  /// </li>
  /// <li>
  /// <b>PENDING</b>: Cloud Map is performing the operation.
  /// </li>
  /// <li>
  /// <b>SUCCESS</b>: The operation succeeded.
  /// </li>
  /// <li>
  /// <b>FAIL</b>: The operation failed. For the failure reason, see
  /// <code>ErrorMessage</code>.
  /// </li>
  /// </ul>
  final OperationStatus? status;

  OperationSummary({
    this.id,
    this.status,
  });

  factory OperationSummary.fromJson(Map<String, dynamic> json) {
    return OperationSummary(
      id: json['Id'] as String?,
      status: (json['Status'] as String?)?.toOperationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final status = this.status;
    return {
      if (id != null) 'Id': id,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum OperationTargetType {
  namespace,
  service,
  instance,
}

extension OperationTargetTypeValueExtension on OperationTargetType {
  String toValue() {
    switch (this) {
      case OperationTargetType.namespace:
        return 'NAMESPACE';
      case OperationTargetType.service:
        return 'SERVICE';
      case OperationTargetType.instance:
        return 'INSTANCE';
    }
  }
}

extension OperationTargetTypeFromString on String {
  OperationTargetType toOperationTargetType() {
    switch (this) {
      case 'NAMESPACE':
        return OperationTargetType.namespace;
      case 'SERVICE':
        return OperationTargetType.service;
      case 'INSTANCE':
        return OperationTargetType.instance;
    }
    throw Exception('$this is not known in enum OperationTargetType');
  }
}

enum OperationType {
  createNamespace,
  deleteNamespace,
  updateNamespace,
  updateService,
  registerInstance,
  deregisterInstance,
}

extension OperationTypeValueExtension on OperationType {
  String toValue() {
    switch (this) {
      case OperationType.createNamespace:
        return 'CREATE_NAMESPACE';
      case OperationType.deleteNamespace:
        return 'DELETE_NAMESPACE';
      case OperationType.updateNamespace:
        return 'UPDATE_NAMESPACE';
      case OperationType.updateService:
        return 'UPDATE_SERVICE';
      case OperationType.registerInstance:
        return 'REGISTER_INSTANCE';
      case OperationType.deregisterInstance:
        return 'DEREGISTER_INSTANCE';
    }
  }
}

extension OperationTypeFromString on String {
  OperationType toOperationType() {
    switch (this) {
      case 'CREATE_NAMESPACE':
        return OperationType.createNamespace;
      case 'DELETE_NAMESPACE':
        return OperationType.deleteNamespace;
      case 'UPDATE_NAMESPACE':
        return OperationType.updateNamespace;
      case 'UPDATE_SERVICE':
        return OperationType.updateService;
      case 'REGISTER_INSTANCE':
        return OperationType.registerInstance;
      case 'DEREGISTER_INSTANCE':
        return OperationType.deregisterInstance;
    }
    throw Exception('$this is not known in enum OperationType');
  }
}

/// Updated properties for the private DNS namespace.
class PrivateDnsNamespaceChange {
  /// An updated description for the private DNS namespace.
  final String? description;

  /// Properties to be updated in the private DNS namespace.
  final PrivateDnsNamespacePropertiesChange? properties;

  PrivateDnsNamespaceChange({
    this.description,
    this.properties,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    final properties = this.properties;
    return {
      if (description != null) 'Description': description,
      if (properties != null) 'Properties': properties,
    };
  }
}

/// DNS properties for the private DNS namespace.
class PrivateDnsNamespaceProperties {
  /// DNS properties for the private DNS namespace.
  final PrivateDnsPropertiesMutable dnsProperties;

  PrivateDnsNamespaceProperties({
    required this.dnsProperties,
  });

  Map<String, dynamic> toJson() {
    final dnsProperties = this.dnsProperties;
    return {
      'DnsProperties': dnsProperties,
    };
  }
}

/// Updated properties for the private DNS namespace.
class PrivateDnsNamespacePropertiesChange {
  /// Updated DNS properties for the private DNS namespace.
  final PrivateDnsPropertiesMutableChange dnsProperties;

  PrivateDnsNamespacePropertiesChange({
    required this.dnsProperties,
  });

  Map<String, dynamic> toJson() {
    final dnsProperties = this.dnsProperties;
    return {
      'DnsProperties': dnsProperties,
    };
  }
}

/// DNS properties for the private DNS namespace.
class PrivateDnsPropertiesMutable {
  /// Fields for the Start of Authority (SOA) record for the hosted zone for the
  /// private DNS namespace.
  final SOA soa;

  PrivateDnsPropertiesMutable({
    required this.soa,
  });

  Map<String, dynamic> toJson() {
    final soa = this.soa;
    return {
      'SOA': soa,
    };
  }
}

/// Updated DNS properties for the private DNS namespace.
class PrivateDnsPropertiesMutableChange {
  /// Updated fields for the Start of Authority (SOA) record for the hosted zone
  /// for the private DNS namespace.
  final SOAChange soa;

  PrivateDnsPropertiesMutableChange({
    required this.soa,
  });

  Map<String, dynamic> toJson() {
    final soa = this.soa;
    return {
      'SOA': soa,
    };
  }
}

/// Updated properties for the public DNS namespace.
class PublicDnsNamespaceChange {
  /// An updated description for the public DNS namespace.
  final String? description;

  /// Properties to be updated in the public DNS namespace.
  final PublicDnsNamespacePropertiesChange? properties;

  PublicDnsNamespaceChange({
    this.description,
    this.properties,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    final properties = this.properties;
    return {
      if (description != null) 'Description': description,
      if (properties != null) 'Properties': properties,
    };
  }
}

/// DNS properties for the public DNS namespace.
class PublicDnsNamespaceProperties {
  /// DNS properties for the public DNS namespace.
  final PublicDnsPropertiesMutable dnsProperties;

  PublicDnsNamespaceProperties({
    required this.dnsProperties,
  });

  Map<String, dynamic> toJson() {
    final dnsProperties = this.dnsProperties;
    return {
      'DnsProperties': dnsProperties,
    };
  }
}

/// Updated properties for the public DNS namespace.
class PublicDnsNamespacePropertiesChange {
  /// Updated DNS properties for the hosted zone for the public DNS namespace.
  final PublicDnsPropertiesMutableChange dnsProperties;

  PublicDnsNamespacePropertiesChange({
    required this.dnsProperties,
  });

  Map<String, dynamic> toJson() {
    final dnsProperties = this.dnsProperties;
    return {
      'DnsProperties': dnsProperties,
    };
  }
}

/// DNS properties for the public DNS namespace.
class PublicDnsPropertiesMutable {
  /// Start of Authority (SOA) record for the hosted zone for the public DNS
  /// namespace.
  final SOA soa;

  PublicDnsPropertiesMutable({
    required this.soa,
  });

  Map<String, dynamic> toJson() {
    final soa = this.soa;
    return {
      'SOA': soa,
    };
  }
}

/// Updated DNS properties for the public DNS namespace.
class PublicDnsPropertiesMutableChange {
  /// Updated fields for the Start of Authority (SOA) record for the hosted zone
  /// for the public DNS namespace.
  final SOAChange soa;

  PublicDnsPropertiesMutableChange({
    required this.soa,
  });

  Map<String, dynamic> toJson() {
    final soa = this.soa;
    return {
      'SOA': soa,
    };
  }
}

enum RecordType {
  srv,
  a,
  aaaa,
  cname,
}

extension RecordTypeValueExtension on RecordType {
  String toValue() {
    switch (this) {
      case RecordType.srv:
        return 'SRV';
      case RecordType.a:
        return 'A';
      case RecordType.aaaa:
        return 'AAAA';
      case RecordType.cname:
        return 'CNAME';
    }
  }
}

extension RecordTypeFromString on String {
  RecordType toRecordType() {
    switch (this) {
      case 'SRV':
        return RecordType.srv;
      case 'A':
        return RecordType.a;
      case 'AAAA':
        return RecordType.aaaa;
      case 'CNAME':
        return RecordType.cname;
    }
    throw Exception('$this is not known in enum RecordType');
  }
}

class RegisterInstanceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  final String? operationId;

  RegisterInstanceResponse({
    this.operationId,
  });

  factory RegisterInstanceResponse.fromJson(Map<String, dynamic> json) {
    return RegisterInstanceResponse(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

enum RoutingPolicy {
  multivalue,
  weighted,
}

extension RoutingPolicyValueExtension on RoutingPolicy {
  String toValue() {
    switch (this) {
      case RoutingPolicy.multivalue:
        return 'MULTIVALUE';
      case RoutingPolicy.weighted:
        return 'WEIGHTED';
    }
  }
}

extension RoutingPolicyFromString on String {
  RoutingPolicy toRoutingPolicy() {
    switch (this) {
      case 'MULTIVALUE':
        return RoutingPolicy.multivalue;
      case 'WEIGHTED':
        return RoutingPolicy.weighted;
    }
    throw Exception('$this is not known in enum RoutingPolicy');
  }
}

/// Start of Authority (SOA) properties for a public or private DNS namespace.
class SOA {
  /// The time to live (TTL) for purposes of negative caching.
  final int ttl;

  SOA({
    required this.ttl,
  });

  factory SOA.fromJson(Map<String, dynamic> json) {
    return SOA(
      ttl: json['TTL'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final ttl = this.ttl;
    return {
      'TTL': ttl,
    };
  }
}

/// Updated Start of Authority (SOA) properties for a public or private DNS
/// namespace.
class SOAChange {
  /// The updated time to live (TTL) for purposes of negative caching.
  final int ttl;

  SOAChange({
    required this.ttl,
  });

  Map<String, dynamic> toJson() {
    final ttl = this.ttl;
    return {
      'TTL': ttl,
    };
  }
}

/// A complex type that contains information about the specified service.
class Service {
  /// The Amazon Resource Name (ARN) that Cloud Map assigns to the service when
  /// you create it.
  final String? arn;

  /// The date and time that the service was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreateDate</code> is
  /// accurate to milliseconds. For example, the value <code>1516925490.087</code>
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? createDate;

  /// A unique string that identifies the request and that allows failed requests
  /// to be retried without the risk of running the operation twice.
  /// <code>CreatorRequestId</code> can be any unique string (for example, a
  /// date/timestamp).
  final String? creatorRequestId;

  /// The description of the service.
  final String? description;

  /// A complex type that contains information about the Route 53 DNS records that
  /// you want Cloud Map to create when you register an instance.
  /// <important>
  /// The record types of a service can only be changed by deleting the service
  /// and recreating it with a new <code>Dnsconfig</code>.
  /// </important>
  final DnsConfig? dnsConfig;

  /// <i>Public DNS and HTTP namespaces only.</i> A complex type that contains
  /// settings for an optional health check. If you specify settings for a health
  /// check, Cloud Map associates the health check with the records that you
  /// specify in <code>DnsConfig</code>.
  ///
  /// For information about the charges for health checks, see <a
  /// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
  final HealthCheckConfig? healthCheckConfig;

  /// A complex type that contains information about an optional custom health
  /// check.
  /// <important>
  /// If you specify a health check configuration, you can specify either
  /// <code>HealthCheckCustomConfig</code> or <code>HealthCheckConfig</code> but
  /// not both.
  /// </important>
  final HealthCheckCustomConfig? healthCheckCustomConfig;

  /// The ID that Cloud Map assigned to the service when you created it.
  final String? id;

  /// The number of instances that are currently associated with the service.
  /// Instances that were previously associated with the service but that are
  /// deleted aren't included in the count. The count might not reflect pending
  /// registrations and deregistrations.
  final int? instanceCount;

  /// The name of the service.
  final String? name;

  /// The ID of the namespace that was used to create the service.
  final String? namespaceId;

  /// Describes the systems that can be used to discover the service instances.
  /// <dl> <dt>DNS_HTTP</dt> <dd>
  /// The service instances can be discovered using either DNS queries or the
  /// <code>DiscoverInstances</code> API operation.
  /// </dd> <dt>HTTP</dt> <dd>
  /// The service instances can only be discovered using the
  /// <code>DiscoverInstances</code> API operation.
  /// </dd> <dt>DNS</dt> <dd>
  /// Reserved.
  /// </dd> </dl>
  final ServiceType? type;

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
    this.type,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      arn: json['Arn'] as String?,
      createDate: timeStampFromJson(json['CreateDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      description: json['Description'] as String?,
      dnsConfig: json['DnsConfig'] != null
          ? DnsConfig.fromJson(json['DnsConfig'] as Map<String, dynamic>)
          : null,
      healthCheckConfig: json['HealthCheckConfig'] != null
          ? HealthCheckConfig.fromJson(
              json['HealthCheckConfig'] as Map<String, dynamic>)
          : null,
      healthCheckCustomConfig: json['HealthCheckCustomConfig'] != null
          ? HealthCheckCustomConfig.fromJson(
              json['HealthCheckCustomConfig'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      instanceCount: json['InstanceCount'] as int?,
      name: json['Name'] as String?,
      namespaceId: json['NamespaceId'] as String?,
      type: (json['Type'] as String?)?.toServiceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createDate = this.createDate;
    final creatorRequestId = this.creatorRequestId;
    final description = this.description;
    final dnsConfig = this.dnsConfig;
    final healthCheckConfig = this.healthCheckConfig;
    final healthCheckCustomConfig = this.healthCheckCustomConfig;
    final id = this.id;
    final instanceCount = this.instanceCount;
    final name = this.name;
    final namespaceId = this.namespaceId;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (description != null) 'Description': description,
      if (dnsConfig != null) 'DnsConfig': dnsConfig,
      if (healthCheckConfig != null) 'HealthCheckConfig': healthCheckConfig,
      if (healthCheckCustomConfig != null)
        'HealthCheckCustomConfig': healthCheckCustomConfig,
      if (id != null) 'Id': id,
      if (instanceCount != null) 'InstanceCount': instanceCount,
      if (name != null) 'Name': name,
      if (namespaceId != null) 'NamespaceId': namespaceId,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// A complex type that contains changes to an existing service.
class ServiceChange {
  /// A description for the service.
  final String? description;

  /// Information about the Route 53 DNS records that you want Cloud Map to create
  /// when you register an instance.
  final DnsConfigChange? dnsConfig;

  /// <i>Public DNS and HTTP namespaces only.</i> Settings for an optional health
  /// check. If you specify settings for a health check, Cloud Map associates the
  /// health check with the records that you specify in <code>DnsConfig</code>.
  final HealthCheckConfig? healthCheckConfig;

  ServiceChange({
    this.description,
    this.dnsConfig,
    this.healthCheckConfig,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    final dnsConfig = this.dnsConfig;
    final healthCheckConfig = this.healthCheckConfig;
    return {
      if (description != null) 'Description': description,
      if (dnsConfig != null) 'DnsConfig': dnsConfig,
      if (healthCheckConfig != null) 'HealthCheckConfig': healthCheckConfig,
    };
  }
}

/// A complex type that lets you specify the namespaces that you want to list
/// services for.
class ServiceFilter {
  /// Specify <code>NAMESPACE_ID</code>.
  final ServiceFilterName name;

  /// The values that are applicable to the value that you specify for
  /// <code>Condition</code> to filter the list of services.
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
  /// </ul>
  final FilterCondition? condition;

  ServiceFilter({
    required this.name,
    required this.values,
    this.condition,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final condition = this.condition;
    return {
      'Name': name.toValue(),
      'Values': values,
      if (condition != null) 'Condition': condition.toValue(),
    };
  }
}

enum ServiceFilterName {
  namespaceId,
}

extension ServiceFilterNameValueExtension on ServiceFilterName {
  String toValue() {
    switch (this) {
      case ServiceFilterName.namespaceId:
        return 'NAMESPACE_ID';
    }
  }
}

extension ServiceFilterNameFromString on String {
  ServiceFilterName toServiceFilterName() {
    switch (this) {
      case 'NAMESPACE_ID':
        return ServiceFilterName.namespaceId;
    }
    throw Exception('$this is not known in enum ServiceFilterName');
  }
}

/// A complex type that contains information about a specified service.
class ServiceSummary {
  /// The Amazon Resource Name (ARN) that Cloud Map assigns to the service when
  /// you create it.
  final String? arn;

  /// The date and time that the service was created.
  final DateTime? createDate;

  /// The description that you specify when you create the service.
  final String? description;

  /// Information about the Route 53 DNS records that you want Cloud Map to create
  /// when you register an instance.
  final DnsConfig? dnsConfig;

  /// <i>Public DNS and HTTP namespaces only.</i> Settings for an optional health
  /// check. If you specify settings for a health check, Cloud Map associates the
  /// health check with the records that you specify in <code>DnsConfig</code>.
  final HealthCheckConfig? healthCheckConfig;

  /// Information about an optional custom health check. A custom health check,
  /// which requires that you use a third-party health checker to evaluate the
  /// health of your resources, is useful in the following circumstances:
  ///
  /// <ul>
  /// <li>
  /// You can't use a health check that's defined by
  /// <code>HealthCheckConfig</code> because the resource isn't available over the
  /// internet. For example, you can use a custom health check when the instance
  /// is in an Amazon VPC. (To check the health of resources in a VPC, the health
  /// checker must also be in the VPC.)
  /// </li>
  /// <li>
  /// You want to use a third-party health checker regardless of where your
  /// resources are located.
  /// </li>
  /// </ul> <important>
  /// If you specify a health check configuration, you can specify either
  /// <code>HealthCheckCustomConfig</code> or <code>HealthCheckConfig</code> but
  /// not both.
  /// </important>
  final HealthCheckCustomConfig? healthCheckCustomConfig;

  /// The ID that Cloud Map assigned to the service when you created it.
  final String? id;

  /// The number of instances that are currently associated with the service.
  /// Instances that were previously associated with the service but that are
  /// deleted aren't included in the count. The count might not reflect pending
  /// registrations and deregistrations.
  final int? instanceCount;

  /// The name of the service.
  final String? name;

  /// Describes the systems that can be used to discover the service instances.
  /// <dl> <dt>DNS_HTTP</dt> <dd>
  /// The service instances can be discovered using either DNS queries or the
  /// <code>DiscoverInstances</code> API operation.
  /// </dd> <dt>HTTP</dt> <dd>
  /// The service instances can only be discovered using the
  /// <code>DiscoverInstances</code> API operation.
  /// </dd> <dt>DNS</dt> <dd>
  /// Reserved.
  /// </dd> </dl>
  final ServiceType? type;

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
    this.type,
  });

  factory ServiceSummary.fromJson(Map<String, dynamic> json) {
    return ServiceSummary(
      arn: json['Arn'] as String?,
      createDate: timeStampFromJson(json['CreateDate']),
      description: json['Description'] as String?,
      dnsConfig: json['DnsConfig'] != null
          ? DnsConfig.fromJson(json['DnsConfig'] as Map<String, dynamic>)
          : null,
      healthCheckConfig: json['HealthCheckConfig'] != null
          ? HealthCheckConfig.fromJson(
              json['HealthCheckConfig'] as Map<String, dynamic>)
          : null,
      healthCheckCustomConfig: json['HealthCheckCustomConfig'] != null
          ? HealthCheckCustomConfig.fromJson(
              json['HealthCheckCustomConfig'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      instanceCount: json['InstanceCount'] as int?,
      name: json['Name'] as String?,
      type: (json['Type'] as String?)?.toServiceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createDate = this.createDate;
    final description = this.description;
    final dnsConfig = this.dnsConfig;
    final healthCheckConfig = this.healthCheckConfig;
    final healthCheckCustomConfig = this.healthCheckCustomConfig;
    final id = this.id;
    final instanceCount = this.instanceCount;
    final name = this.name;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (description != null) 'Description': description,
      if (dnsConfig != null) 'DnsConfig': dnsConfig,
      if (healthCheckConfig != null) 'HealthCheckConfig': healthCheckConfig,
      if (healthCheckCustomConfig != null)
        'HealthCheckCustomConfig': healthCheckCustomConfig,
      if (id != null) 'Id': id,
      if (instanceCount != null) 'InstanceCount': instanceCount,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ServiceType {
  http,
  dnsHttp,
  dns,
}

extension ServiceTypeValueExtension on ServiceType {
  String toValue() {
    switch (this) {
      case ServiceType.http:
        return 'HTTP';
      case ServiceType.dnsHttp:
        return 'DNS_HTTP';
      case ServiceType.dns:
        return 'DNS';
    }
  }
}

extension ServiceTypeFromString on String {
  ServiceType toServiceType() {
    switch (this) {
      case 'HTTP':
        return ServiceType.http;
      case 'DNS_HTTP':
        return ServiceType.dnsHttp;
      case 'DNS':
        return ServiceType.dns;
    }
    throw Exception('$this is not known in enum ServiceType');
  }
}

enum ServiceTypeOption {
  http,
}

extension ServiceTypeOptionValueExtension on ServiceTypeOption {
  String toValue() {
    switch (this) {
      case ServiceTypeOption.http:
        return 'HTTP';
    }
  }
}

extension ServiceTypeOptionFromString on String {
  ServiceTypeOption toServiceTypeOption() {
    switch (this) {
      case 'HTTP':
        return ServiceTypeOption.http;
    }
    throw Exception('$this is not known in enum ServiceTypeOption');
  }
}

/// A custom key-value pair that's associated with a resource.
class Tag {
  /// The key identifier, or name, of the tag.
  final String key;

  /// The string value that's associated with the key of the tag. You can set the
  /// value of a tag to an empty string, but you can't set the value of a tag to
  /// null.
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateHttpNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  final String? operationId;

  UpdateHttpNamespaceResponse({
    this.operationId,
  });

  factory UpdateHttpNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateHttpNamespaceResponse(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class UpdatePrivateDnsNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  final String? operationId;

  UpdatePrivateDnsNamespaceResponse({
    this.operationId,
  });

  factory UpdatePrivateDnsNamespaceResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdatePrivateDnsNamespaceResponse(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class UpdatePublicDnsNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  final String? operationId;

  UpdatePublicDnsNamespaceResponse({
    this.operationId,
  });

  factory UpdatePublicDnsNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePublicDnsNamespaceResponse(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class UpdateServiceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html">GetOperation</a>.
  final String? operationId;

  UpdateServiceResponse({
    this.operationId,
  });

  factory UpdateServiceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServiceResponse(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class CustomHealthNotFound extends _s.GenericAwsException {
  CustomHealthNotFound({String? type, String? message})
      : super(type: type, code: 'CustomHealthNotFound', message: message);
}

class DuplicateRequest extends _s.GenericAwsException {
  DuplicateRequest({String? type, String? message})
      : super(type: type, code: 'DuplicateRequest', message: message);
}

class InstanceNotFound extends _s.GenericAwsException {
  InstanceNotFound({String? type, String? message})
      : super(type: type, code: 'InstanceNotFound', message: message);
}

class InvalidInput extends _s.GenericAwsException {
  InvalidInput({String? type, String? message})
      : super(type: type, code: 'InvalidInput', message: message);
}

class NamespaceAlreadyExists extends _s.GenericAwsException {
  NamespaceAlreadyExists({String? type, String? message})
      : super(type: type, code: 'NamespaceAlreadyExists', message: message);
}

class NamespaceNotFound extends _s.GenericAwsException {
  NamespaceNotFound({String? type, String? message})
      : super(type: type, code: 'NamespaceNotFound', message: message);
}

class OperationNotFound extends _s.GenericAwsException {
  OperationNotFound({String? type, String? message})
      : super(type: type, code: 'OperationNotFound', message: message);
}

class RequestLimitExceeded extends _s.GenericAwsException {
  RequestLimitExceeded({String? type, String? message})
      : super(type: type, code: 'RequestLimitExceeded', message: message);
}

class ResourceInUse extends _s.GenericAwsException {
  ResourceInUse({String? type, String? message})
      : super(type: type, code: 'ResourceInUse', message: message);
}

class ResourceLimitExceeded extends _s.GenericAwsException {
  ResourceLimitExceeded({String? type, String? message})
      : super(type: type, code: 'ResourceLimitExceeded', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceAlreadyExists extends _s.GenericAwsException {
  ServiceAlreadyExists({String? type, String? message})
      : super(type: type, code: 'ServiceAlreadyExists', message: message);
}

class ServiceNotFound extends _s.GenericAwsException {
  ServiceNotFound({String? type, String? message})
      : super(type: type, code: 'ServiceNotFound', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
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
