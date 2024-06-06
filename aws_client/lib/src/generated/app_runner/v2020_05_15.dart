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

/// App Runner is an application service that provides a fast, simple, and
/// cost-effective way to go directly from an existing container image or source
/// code to a running service in the Amazon Web Services Cloud in seconds. You
/// don't need to learn new technologies, decide which compute service to use,
/// or understand how to provision and configure Amazon Web Services resources.
class AppRunner {
  final _s.JsonProtocol _protocol;
  AppRunner({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'apprunner',
            signingName: 'apprunner',
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

  /// Associate your own domain name with the App Runner subdomain URL of your
  /// App Runner service.
  ///
  /// After you call <code>AssociateCustomDomain</code> and receive a successful
  /// response, use the information in the <a>CustomDomain</a> record that's
  /// returned to add CNAME records to your Domain Name System (DNS). For each
  /// mapped domain name, add a mapping to the target App Runner subdomain and
  /// one or more certificate validation records. App Runner then performs DNS
  /// validation to verify that you own or control the domain name that you
  /// associated. App Runner tracks domain validity in a certificate stored in
  /// <a href="https://docs.aws.amazon.com/acm/latest/userguide">AWS Certificate
  /// Manager (ACM)</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [domainName] :
  /// A custom domain endpoint to associate. Specify a root domain (for example,
  /// <code>example.com</code>), a subdomain (for example,
  /// <code>login.example.com</code> or <code>admin.login.example.com</code>),
  /// or a wildcard (for example, <code>*.example.com</code>).
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) of the App Runner service that you want to
  /// associate a custom domain name with.
  ///
  /// Parameter [enableWWWSubdomain] :
  /// Set to <code>true</code> to associate the subdomain
  /// <code>www.<i>DomainName</i> </code> with the App Runner service in
  /// addition to the base domain.
  ///
  /// Default: <code>true</code>
  Future<AssociateCustomDomainResponse> associateCustomDomain({
    required String domainName,
    required String serviceArn,
    bool? enableWWWSubdomain,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.AssociateCustomDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'ServiceArn': serviceArn,
        if (enableWWWSubdomain != null)
          'EnableWWWSubdomain': enableWWWSubdomain,
      },
    );

    return AssociateCustomDomainResponse.fromJson(jsonResponse.body);
  }

  /// Create an App Runner automatic scaling configuration resource. App Runner
  /// requires this resource when you create or update App Runner services and
  /// you require non-default auto scaling settings. You can share an auto
  /// scaling configuration across multiple services.
  ///
  /// Create multiple revisions of a configuration by calling this action
  /// multiple times using the same <code>AutoScalingConfigurationName</code>.
  /// The call returns incremental <code>AutoScalingConfigurationRevision</code>
  /// values. When you create a service and configure an auto scaling
  /// configuration resource, the service uses the latest active revision of the
  /// auto scaling configuration by default. You can optionally configure the
  /// service to use a specific revision.
  ///
  /// Configure a higher <code>MinSize</code> to increase the spread of your App
  /// Runner service over more Availability Zones in the Amazon Web Services
  /// Region. The tradeoff is a higher minimal cost.
  ///
  /// Configure a lower <code>MaxSize</code> to control your cost. The tradeoff
  /// is lower responsiveness during peak demand.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [autoScalingConfigurationName] :
  /// A name for the auto scaling configuration. When you use it for the first
  /// time in an Amazon Web Services Region, App Runner creates revision number
  /// <code>1</code> of this name. When you use the same name in subsequent
  /// calls, App Runner creates incremental revisions of the configuration.
  /// <note>
  /// Prior to the release of <a
  /// href="https://docs.aws.amazon.com/apprunner/latest/relnotes/release-2023-09-22-auto-scale-config.html">Auto
  /// scale configuration enhancements</a>, the name
  /// <code>DefaultConfiguration</code> was reserved.
  ///
  /// This restriction is no longer in place. You can now manage
  /// <code>DefaultConfiguration</code> the same way you manage your custom auto
  /// scaling configurations. This means you can do the following with the
  /// <code>DefaultConfiguration</code> that App Runner provides:
  ///
  /// <ul>
  /// <li>
  /// Create new revisions of the <code>DefaultConfiguration</code>.
  /// </li>
  /// <li>
  /// Delete the revisions of the <code>DefaultConfiguration</code>.
  /// </li>
  /// <li>
  /// Delete the auto scaling configuration for which the App Runner
  /// <code>DefaultConfiguration</code> was created.
  /// </li>
  /// <li>
  /// If you delete the auto scaling configuration you can create another custom
  /// auto scaling configuration with the same <code>DefaultConfiguration</code>
  /// name. The original <code>DefaultConfiguration</code> resource provided by
  /// App Runner remains in your account unless you make changes to it.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [maxConcurrency] :
  /// The maximum number of concurrent requests that you want an instance to
  /// process. If the number of concurrent requests exceeds this limit, App
  /// Runner scales up your service.
  ///
  /// Default: <code>100</code>
  ///
  /// Parameter [maxSize] :
  /// The maximum number of instances that your service scales up to. At most
  /// <code>MaxSize</code> instances actively serve traffic for your service.
  ///
  /// Default: <code>25</code>
  ///
  /// Parameter [minSize] :
  /// The minimum number of instances that App Runner provisions for your
  /// service. The service always has at least <code>MinSize</code> provisioned
  /// instances. Some of them actively serve traffic. The rest of them
  /// (provisioned and inactive instances) are a cost-effective compute capacity
  /// reserve and are ready to be quickly activated. You pay for memory usage of
  /// all the provisioned instances. You pay for CPU usage of only the active
  /// subset.
  ///
  /// App Runner temporarily doubles the number of provisioned instances during
  /// deployments, to maintain the same capacity for both old and new code.
  ///
  /// Default: <code>1</code>
  ///
  /// Parameter [tags] :
  /// A list of metadata items that you can associate with your auto scaling
  /// configuration resource. A tag is a key-value pair.
  Future<CreateAutoScalingConfigurationResponse>
      createAutoScalingConfiguration({
    required String autoScalingConfigurationName,
    int? maxConcurrency,
    int? maxSize,
    int? minSize,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'maxConcurrency',
      maxConcurrency,
      1,
      200,
    );
    _s.validateNumRange(
      'maxSize',
      maxSize,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minSize',
      minSize,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.CreateAutoScalingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutoScalingConfigurationName': autoScalingConfigurationName,
        if (maxConcurrency != null) 'MaxConcurrency': maxConcurrency,
        if (maxSize != null) 'MaxSize': maxSize,
        if (minSize != null) 'MinSize': minSize,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAutoScalingConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Create an App Runner connection resource. App Runner requires a connection
  /// resource when you create App Runner services that access private
  /// repositories from certain third-party providers. You can share a
  /// connection across multiple services.
  ///
  /// A connection resource is needed to access GitHub and Bitbucket
  /// repositories. Both require a user interface approval process through the
  /// App Runner console before you can use the connection.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [connectionName] :
  /// A name for the new connection. It must be unique across all App Runner
  /// connections for the Amazon Web Services account in the Amazon Web Services
  /// Region.
  ///
  /// Parameter [providerType] :
  /// The source repository provider.
  ///
  /// Parameter [tags] :
  /// A list of metadata items that you can associate with your connection
  /// resource. A tag is a key-value pair.
  Future<CreateConnectionResponse> createConnection({
    required String connectionName,
    required ProviderType providerType,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.CreateConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionName': connectionName,
        'ProviderType': providerType.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Create an App Runner observability configuration resource. App Runner
  /// requires this resource when you create or update App Runner services and
  /// you want to enable non-default observability features. You can share an
  /// observability configuration across multiple services.
  ///
  /// Create multiple revisions of a configuration by calling this action
  /// multiple times using the same <code>ObservabilityConfigurationName</code>.
  /// The call returns incremental
  /// <code>ObservabilityConfigurationRevision</code> values. When you create a
  /// service and configure an observability configuration resource, the service
  /// uses the latest active revision of the observability configuration by
  /// default. You can optionally configure the service to use a specific
  /// revision.
  ///
  /// The observability configuration resource is designed to configure multiple
  /// features (currently one feature, tracing). This action takes optional
  /// parameters that describe the configuration of these features (currently
  /// one parameter, <code>TraceConfiguration</code>). If you don't specify a
  /// feature parameter, App Runner doesn't enable the feature.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [observabilityConfigurationName] :
  /// A name for the observability configuration. When you use it for the first
  /// time in an Amazon Web Services Region, App Runner creates revision number
  /// <code>1</code> of this name. When you use the same name in subsequent
  /// calls, App Runner creates incremental revisions of the configuration.
  /// <note>
  /// The name <code>DefaultConfiguration</code> is reserved. You can't use it
  /// to create a new observability configuration, and you can't create a
  /// revision of it.
  ///
  /// When you want to use your own observability configuration for your App
  /// Runner service, <i>create a configuration with a different name</i>, and
  /// then provide it when you create or update your service.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A list of metadata items that you can associate with your observability
  /// configuration resource. A tag is a key-value pair.
  ///
  /// Parameter [traceConfiguration] :
  /// The configuration of the tracing feature within this observability
  /// configuration. If you don't specify it, App Runner doesn't enable tracing.
  Future<CreateObservabilityConfigurationResponse>
      createObservabilityConfiguration({
    required String observabilityConfigurationName,
    List<Tag>? tags,
    TraceConfiguration? traceConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.CreateObservabilityConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ObservabilityConfigurationName': observabilityConfigurationName,
        if (tags != null) 'Tags': tags,
        if (traceConfiguration != null)
          'TraceConfiguration': traceConfiguration,
      },
    );

    return CreateObservabilityConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Create an App Runner service. After the service is created, the action
  /// also automatically starts a deployment.
  ///
  /// This is an asynchronous operation. On a successful call, you can use the
  /// returned <code>OperationId</code> and the <a
  /// href="https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html">ListOperations</a>
  /// call to track the operation's progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [serviceName] :
  /// A name for the App Runner service. It must be unique across all the
  /// running App Runner services in your Amazon Web Services account in the
  /// Amazon Web Services Region.
  ///
  /// Parameter [sourceConfiguration] :
  /// The source to deploy to the App Runner service. It can be a code or an
  /// image repository.
  ///
  /// Parameter [autoScalingConfigurationArn] :
  /// The Amazon Resource Name (ARN) of an App Runner automatic scaling
  /// configuration resource that you want to associate with your service. If
  /// not provided, App Runner associates the latest revision of a default auto
  /// scaling configuration.
  ///
  /// Specify an ARN with a name and a revision number to associate that
  /// revision. For example:
  /// <code>arn:aws:apprunner:us-east-1:123456789012:autoscalingconfiguration/high-availability/3</code>
  ///
  /// Specify just the name to associate the latest revision. For example:
  /// <code>arn:aws:apprunner:us-east-1:123456789012:autoscalingconfiguration/high-availability</code>
  ///
  /// Parameter [encryptionConfiguration] :
  /// An optional custom encryption key that App Runner uses to encrypt the copy
  /// of your source repository that it maintains and your service logs. By
  /// default, App Runner uses an Amazon Web Services managed key.
  ///
  /// Parameter [healthCheckConfiguration] :
  /// The settings for the health check that App Runner performs to monitor the
  /// health of the App Runner service.
  ///
  /// Parameter [instanceConfiguration] :
  /// The runtime configuration of instances (scaling units) of your service.
  ///
  /// Parameter [networkConfiguration] :
  /// Configuration settings related to network traffic of the web application
  /// that the App Runner service runs.
  ///
  /// Parameter [observabilityConfiguration] :
  /// The observability configuration of your service.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the App
  /// Runner service resource. A tag is a key-value pair.
  Future<CreateServiceResponse> createService({
    required String serviceName,
    required SourceConfiguration sourceConfiguration,
    String? autoScalingConfigurationArn,
    EncryptionConfiguration? encryptionConfiguration,
    HealthCheckConfiguration? healthCheckConfiguration,
    InstanceConfiguration? instanceConfiguration,
    NetworkConfiguration? networkConfiguration,
    ServiceObservabilityConfiguration? observabilityConfiguration,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.CreateService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceName': serviceName,
        'SourceConfiguration': sourceConfiguration,
        if (autoScalingConfigurationArn != null)
          'AutoScalingConfigurationArn': autoScalingConfigurationArn,
        if (encryptionConfiguration != null)
          'EncryptionConfiguration': encryptionConfiguration,
        if (healthCheckConfiguration != null)
          'HealthCheckConfiguration': healthCheckConfiguration,
        if (instanceConfiguration != null)
          'InstanceConfiguration': instanceConfiguration,
        if (networkConfiguration != null)
          'NetworkConfiguration': networkConfiguration,
        if (observabilityConfiguration != null)
          'ObservabilityConfiguration': observabilityConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateServiceResponse.fromJson(jsonResponse.body);
  }

  /// Create an App Runner VPC connector resource. App Runner requires this
  /// resource when you want to associate your App Runner service to a custom
  /// Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [subnets] :
  /// A list of IDs of subnets that App Runner should use when it associates
  /// your service with a custom Amazon VPC. Specify IDs of subnets of a single
  /// Amazon VPC. App Runner determines the Amazon VPC from the subnets you
  /// specify.
  /// <note>
  /// App Runner currently only provides support for IPv4.
  /// </note>
  ///
  /// Parameter [vpcConnectorName] :
  /// A name for the VPC connector.
  ///
  /// Parameter [securityGroups] :
  /// A list of IDs of security groups that App Runner should use for access to
  /// Amazon Web Services resources under the specified subnets. If not
  /// specified, App Runner uses the default security group of the Amazon VPC.
  /// The default security group allows all outbound traffic.
  ///
  /// Parameter [tags] :
  /// A list of metadata items that you can associate with your VPC connector
  /// resource. A tag is a key-value pair.
  Future<CreateVpcConnectorResponse> createVpcConnector({
    required List<String> subnets,
    required String vpcConnectorName,
    List<String>? securityGroups,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.CreateVpcConnector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Subnets': subnets,
        'VpcConnectorName': vpcConnectorName,
        if (securityGroups != null) 'SecurityGroups': securityGroups,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateVpcConnectorResponse.fromJson(jsonResponse.body);
  }

  /// Create an App Runner VPC Ingress Connection resource. App Runner requires
  /// this resource when you want to associate your App Runner service with an
  /// Amazon VPC endpoint.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [ingressVpcConfiguration] :
  /// Specifications for the customer’s Amazon VPC and the related Amazon Web
  /// Services PrivateLink VPC endpoint that are used to create the VPC Ingress
  /// Connection resource.
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) for this App Runner service that is used to
  /// create the VPC Ingress Connection resource.
  ///
  /// Parameter [vpcIngressConnectionName] :
  /// A name for the VPC Ingress Connection resource. It must be unique across
  /// all the active VPC Ingress Connections in your Amazon Web Services account
  /// in the Amazon Web Services Region.
  ///
  /// Parameter [tags] :
  /// An optional list of metadata items that you can associate with the VPC
  /// Ingress Connection resource. A tag is a key-value pair.
  Future<CreateVpcIngressConnectionResponse> createVpcIngressConnection({
    required IngressVpcConfiguration ingressVpcConfiguration,
    required String serviceArn,
    required String vpcIngressConnectionName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.CreateVpcIngressConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IngressVpcConfiguration': ingressVpcConfiguration,
        'ServiceArn': serviceArn,
        'VpcIngressConnectionName': vpcIngressConnectionName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateVpcIngressConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Delete an App Runner automatic scaling configuration resource. You can
  /// delete a top level auto scaling configuration, a specific revision of one,
  /// or all revisions associated with the top level configuration. You can't
  /// delete the default auto scaling configuration or a configuration that's
  /// used by one or more App Runner services.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [autoScalingConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the App Runner auto scaling
  /// configuration that you want to delete.
  ///
  /// The ARN can be a full auto scaling configuration ARN, or a partial ARN
  /// ending with either <code>.../<i>name</i> </code> or
  /// <code>.../<i>name</i>/<i>revision</i> </code>. If a revision isn't
  /// specified, the latest active revision is deleted.
  ///
  /// Parameter [deleteAllRevisions] :
  /// Set to <code>true</code> to delete all of the revisions associated with
  /// the <code>AutoScalingConfigurationArn</code> parameter value.
  ///
  /// When <code>DeleteAllRevisions</code> is set to <code>true</code>, the only
  /// valid value for the Amazon Resource Name (ARN) is a partial ARN ending
  /// with: <code>.../name</code>.
  Future<DeleteAutoScalingConfigurationResponse>
      deleteAutoScalingConfiguration({
    required String autoScalingConfigurationArn,
    bool? deleteAllRevisions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DeleteAutoScalingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutoScalingConfigurationArn': autoScalingConfigurationArn,
        if (deleteAllRevisions != null)
          'DeleteAllRevisions': deleteAllRevisions,
      },
    );

    return DeleteAutoScalingConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Delete an App Runner connection. You must first ensure that there are no
  /// running App Runner services that use this connection. If there are any,
  /// the <code>DeleteConnection</code> action fails.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [connectionArn] :
  /// The Amazon Resource Name (ARN) of the App Runner connection that you want
  /// to delete.
  Future<DeleteConnectionResponse> deleteConnection({
    required String connectionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DeleteConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionArn': connectionArn,
      },
    );

    return DeleteConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Delete an App Runner observability configuration resource. You can delete
  /// a specific revision or the latest active revision. You can't delete a
  /// configuration that's used by one or more App Runner services.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [observabilityConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the App Runner observability
  /// configuration that you want to delete.
  ///
  /// The ARN can be a full observability configuration ARN, or a partial ARN
  /// ending with either <code>.../<i>name</i> </code> or
  /// <code>.../<i>name</i>/<i>revision</i> </code>. If a revision isn't
  /// specified, the latest active revision is deleted.
  Future<DeleteObservabilityConfigurationResponse>
      deleteObservabilityConfiguration({
    required String observabilityConfigurationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DeleteObservabilityConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ObservabilityConfigurationArn': observabilityConfigurationArn,
      },
    );

    return DeleteObservabilityConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Delete an App Runner service.
  ///
  /// This is an asynchronous operation. On a successful call, you can use the
  /// returned <code>OperationId</code> and the <a>ListOperations</a> call to
  /// track the operation's progress.
  /// <note>
  /// Make sure that you don't have any active VPCIngressConnections associated
  /// with the service you want to delete.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) of the App Runner service that you want to
  /// delete.
  Future<DeleteServiceResponse> deleteService({
    required String serviceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DeleteService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceArn': serviceArn,
      },
    );

    return DeleteServiceResponse.fromJson(jsonResponse.body);
  }

  /// Delete an App Runner VPC connector resource. You can't delete a connector
  /// that's used by one or more App Runner services.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [vpcConnectorArn] :
  /// The Amazon Resource Name (ARN) of the App Runner VPC connector that you
  /// want to delete.
  ///
  /// The ARN must be a full VPC connector ARN.
  Future<DeleteVpcConnectorResponse> deleteVpcConnector({
    required String vpcConnectorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DeleteVpcConnector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VpcConnectorArn': vpcConnectorArn,
      },
    );

    return DeleteVpcConnectorResponse.fromJson(jsonResponse.body);
  }

  /// Delete an App Runner VPC Ingress Connection resource that's associated
  /// with an App Runner service. The VPC Ingress Connection must be in one of
  /// the following states to be deleted:
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code>
  /// </li>
  /// <li>
  /// <code>FAILED_CREATION</code>
  /// </li>
  /// <li>
  /// <code>FAILED_UPDATE</code>
  /// </li>
  /// <li>
  /// <code>FAILED_DELETION</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [vpcIngressConnectionArn] :
  /// The Amazon Resource Name (ARN) of the App Runner VPC Ingress Connection
  /// that you want to delete.
  Future<DeleteVpcIngressConnectionResponse> deleteVpcIngressConnection({
    required String vpcIngressConnectionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DeleteVpcIngressConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VpcIngressConnectionArn': vpcIngressConnectionArn,
      },
    );

    return DeleteVpcIngressConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Return a full description of an App Runner automatic scaling configuration
  /// resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [autoScalingConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the App Runner auto scaling
  /// configuration that you want a description for.
  ///
  /// The ARN can be a full auto scaling configuration ARN, or a partial ARN
  /// ending with either <code>.../<i>name</i> </code> or
  /// <code>.../<i>name</i>/<i>revision</i> </code>. If a revision isn't
  /// specified, the latest active revision is described.
  Future<DescribeAutoScalingConfigurationResponse>
      describeAutoScalingConfiguration({
    required String autoScalingConfigurationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DescribeAutoScalingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutoScalingConfigurationArn': autoScalingConfigurationArn,
      },
    );

    return DescribeAutoScalingConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Return a description of custom domain names that are associated with an
  /// App Runner service.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) of the App Runner service that you want
  /// associated custom domain names to be described for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that each response (result page) can
  /// include. It's used for a paginated request.
  ///
  /// If you don't specify <code>MaxResults</code>, the request retrieves all
  /// available results in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token from a previous result page. It's used for a paginated request.
  /// The request retrieves the next result page. All other parameter values
  /// must be identical to the ones that are specified in the initial request.
  ///
  /// If you don't specify <code>NextToken</code>, the request retrieves the
  /// first result page.
  Future<DescribeCustomDomainsResponse> describeCustomDomains({
    required String serviceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      5,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DescribeCustomDomains'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceArn': serviceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeCustomDomainsResponse.fromJson(jsonResponse.body);
  }

  /// Return a full description of an App Runner observability configuration
  /// resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [observabilityConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the App Runner observability
  /// configuration that you want a description for.
  ///
  /// The ARN can be a full observability configuration ARN, or a partial ARN
  /// ending with either <code>.../<i>name</i> </code> or
  /// <code>.../<i>name</i>/<i>revision</i> </code>. If a revision isn't
  /// specified, the latest active revision is described.
  Future<DescribeObservabilityConfigurationResponse>
      describeObservabilityConfiguration({
    required String observabilityConfigurationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DescribeObservabilityConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ObservabilityConfigurationArn': observabilityConfigurationArn,
      },
    );

    return DescribeObservabilityConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Return a full description of an App Runner service.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) of the App Runner service that you want a
  /// description for.
  Future<DescribeServiceResponse> describeService({
    required String serviceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DescribeService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceArn': serviceArn,
      },
    );

    return DescribeServiceResponse.fromJson(jsonResponse.body);
  }

  /// Return a description of an App Runner VPC connector resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [vpcConnectorArn] :
  /// The Amazon Resource Name (ARN) of the App Runner VPC connector that you
  /// want a description for.
  ///
  /// The ARN must be a full VPC connector ARN.
  Future<DescribeVpcConnectorResponse> describeVpcConnector({
    required String vpcConnectorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DescribeVpcConnector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VpcConnectorArn': vpcConnectorArn,
      },
    );

    return DescribeVpcConnectorResponse.fromJson(jsonResponse.body);
  }

  /// Return a full description of an App Runner VPC Ingress Connection
  /// resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [vpcIngressConnectionArn] :
  /// The Amazon Resource Name (ARN) of the App Runner VPC Ingress Connection
  /// that you want a description for.
  Future<DescribeVpcIngressConnectionResponse> describeVpcIngressConnection({
    required String vpcIngressConnectionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DescribeVpcIngressConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VpcIngressConnectionArn': vpcIngressConnectionArn,
      },
    );

    return DescribeVpcIngressConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Disassociate a custom domain name from an App Runner service.
  ///
  /// Certificates tracking domain validity are associated with a custom domain
  /// and are stored in <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide">AWS Certificate
  /// Manager (ACM)</a>. These certificates aren't deleted as part of this
  /// action. App Runner delays certificate deletion for 30 days after a domain
  /// is disassociated from your service.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [domainName] :
  /// The domain name that you want to disassociate from the App Runner service.
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) of the App Runner service that you want to
  /// disassociate a custom domain name from.
  Future<DisassociateCustomDomainResponse> disassociateCustomDomain({
    required String domainName,
    required String serviceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.DisassociateCustomDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'ServiceArn': serviceArn,
      },
    );

    return DisassociateCustomDomainResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of active App Runner automatic scaling configurations in
  /// your Amazon Web Services account. You can query the revisions for a
  /// specific configuration name or the revisions for all active configurations
  /// in your account. You can optionally query only the latest revision of each
  /// requested name.
  ///
  /// To retrieve a full description of a particular configuration revision,
  /// call and provide one of the ARNs returned by
  /// <code>ListAutoScalingConfigurations</code>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [autoScalingConfigurationName] :
  /// The name of the App Runner auto scaling configuration that you want to
  /// list. If specified, App Runner lists revisions that share this name. If
  /// not specified, App Runner returns revisions of all active configurations.
  ///
  /// Parameter [latestOnly] :
  /// Set to <code>true</code> to list only the latest revision for each
  /// requested configuration name.
  ///
  /// Set to <code>false</code> to list all revisions for each requested
  /// configuration name.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in each response (result page).
  /// It's used for a paginated request.
  ///
  /// If you don't specify <code>MaxResults</code>, the request retrieves all
  /// available results in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token from a previous result page. It's used for a paginated request.
  /// The request retrieves the next result page. All other parameter values
  /// must be identical to the ones that are specified in the initial request.
  ///
  /// If you don't specify <code>NextToken</code>, the request retrieves the
  /// first result page.
  Future<ListAutoScalingConfigurationsResponse> listAutoScalingConfigurations({
    String? autoScalingConfigurationName,
    bool? latestOnly,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.ListAutoScalingConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (autoScalingConfigurationName != null)
          'AutoScalingConfigurationName': autoScalingConfigurationName,
        if (latestOnly != null) 'LatestOnly': latestOnly,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAutoScalingConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of App Runner connections that are associated with your
  /// Amazon Web Services account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [connectionName] :
  /// If specified, only this connection is returned. If not specified, the
  /// result isn't filtered by name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in each response (result page).
  /// Used for a paginated request.
  ///
  /// If you don't specify <code>MaxResults</code>, the request retrieves all
  /// available results in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token from a previous result page. Used for a paginated request. The
  /// request retrieves the next result page. All other parameter values must be
  /// identical to the ones specified in the initial request.
  ///
  /// If you don't specify <code>NextToken</code>, the request retrieves the
  /// first result page.
  Future<ListConnectionsResponse> listConnections({
    String? connectionName,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.ListConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (connectionName != null) 'ConnectionName': connectionName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListConnectionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of active App Runner observability configurations in your
  /// Amazon Web Services account. You can query the revisions for a specific
  /// configuration name or the revisions for all active configurations in your
  /// account. You can optionally query only the latest revision of each
  /// requested name.
  ///
  /// To retrieve a full description of a particular configuration revision,
  /// call and provide one of the ARNs returned by
  /// <code>ListObservabilityConfigurations</code>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [latestOnly] :
  /// Set to <code>true</code> to list only the latest revision for each
  /// requested configuration name.
  ///
  /// Set to <code>false</code> to list all revisions for each requested
  /// configuration name.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in each response (result page).
  /// It's used for a paginated request.
  ///
  /// If you don't specify <code>MaxResults</code>, the request retrieves all
  /// available results in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token from a previous result page. It's used for a paginated request.
  /// The request retrieves the next result page. All other parameter values
  /// must be identical to the ones that are specified in the initial request.
  ///
  /// If you don't specify <code>NextToken</code>, the request retrieves the
  /// first result page.
  ///
  /// Parameter [observabilityConfigurationName] :
  /// The name of the App Runner observability configuration that you want to
  /// list. If specified, App Runner lists revisions that share this name. If
  /// not specified, App Runner returns revisions of all active configurations.
  Future<ListObservabilityConfigurationsResponse>
      listObservabilityConfigurations({
    bool? latestOnly,
    int? maxResults,
    String? nextToken,
    String? observabilityConfigurationName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.ListObservabilityConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (latestOnly != null) 'LatestOnly': latestOnly,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (observabilityConfigurationName != null)
          'ObservabilityConfigurationName': observabilityConfigurationName,
      },
    );

    return ListObservabilityConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Return a list of operations that occurred on an App Runner service.
  ///
  /// The resulting list of <a>OperationSummary</a> objects is sorted in reverse
  /// chronological order. The first object on the list represents the last
  /// started operation.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) of the App Runner service that you want a
  /// list of operations for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in each response (result page).
  /// It's used for a paginated request.
  ///
  /// If you don't specify <code>MaxResults</code>, the request retrieves all
  /// available results in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token from a previous result page. It's used for a paginated request.
  /// The request retrieves the next result page. All other parameter values
  /// must be identical to the ones specified in the initial request.
  ///
  /// If you don't specify <code>NextToken</code>, the request retrieves the
  /// first result page.
  Future<ListOperationsResponse> listOperations({
    required String serviceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.ListOperations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceArn': serviceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListOperationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of running App Runner services in your Amazon Web Services
  /// account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in each response (result page).
  /// It's used for a paginated request.
  ///
  /// If you don't specify <code>MaxResults</code>, the request retrieves all
  /// available results in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token from a previous result page. Used for a paginated request. The
  /// request retrieves the next result page. All other parameter values must be
  /// identical to the ones specified in the initial request.
  ///
  /// If you don't specify <code>NextToken</code>, the request retrieves the
  /// first result page.
  Future<ListServicesResponse> listServices({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.ListServices'
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

    return ListServicesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the associated App Runner services using an auto scaling
  /// configuration.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [autoScalingConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the App Runner auto scaling
  /// configuration that you want to list the services for.
  ///
  /// The ARN can be a full auto scaling configuration ARN, or a partial ARN
  /// ending with either <code>.../<i>name</i> </code> or
  /// <code>.../<i>name</i>/<i>revision</i> </code>. If a revision isn't
  /// specified, the latest active revision is used.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in each response (result page).
  /// It's used for a paginated request.
  ///
  /// If you don't specify <code>MaxResults</code>, the request retrieves all
  /// available results in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token from a previous result page. It's used for a paginated request.
  /// The request retrieves the next result page. All other parameter values
  /// must be identical to the ones specified in the initial request.
  ///
  /// If you don't specify <code>NextToken</code>, the request retrieves the
  /// first result page.
  Future<ListServicesForAutoScalingConfigurationResponse>
      listServicesForAutoScalingConfiguration({
    required String autoScalingConfigurationArn,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.ListServicesForAutoScalingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutoScalingConfigurationArn': autoScalingConfigurationArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListServicesForAutoScalingConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// List tags that are associated with for an App Runner resource. The
  /// response contains a list of tag key-value pairs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that a tag list is
  /// requested for.
  ///
  /// It must be the ARN of an App Runner resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.ListTagsForResource'
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

  /// Returns a list of App Runner VPC connectors in your Amazon Web Services
  /// account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in each response (result page).
  /// It's used for a paginated request.
  ///
  /// If you don't specify <code>MaxResults</code>, the request retrieves all
  /// available results in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token from a previous result page. It's used for a paginated request.
  /// The request retrieves the next result page. All other parameter values
  /// must be identical to the ones that are specified in the initial request.
  ///
  /// If you don't specify <code>NextToken</code>, the request retrieves the
  /// first result page.
  Future<ListVpcConnectorsResponse> listVpcConnectors({
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.ListVpcConnectors'
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

    return ListVpcConnectorsResponse.fromJson(jsonResponse.body);
  }

  /// Return a list of App Runner VPC Ingress Connections in your Amazon Web
  /// Services account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [filter] :
  /// The VPC Ingress Connections to be listed based on either the Service Arn
  /// or Vpc Endpoint Id, or both.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in each response (result page).
  /// It's used for a paginated request.
  ///
  /// If you don't specify <code>MaxResults</code>, the request retrieves all
  /// available results in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token from a previous result page. It's used for a paginated request.
  /// The request retrieves the next result page. All other parameter values
  /// must be identical to the ones that are specified in the initial request.
  ///
  /// If you don't specify <code>NextToken</code>, the request retrieves the
  /// first result page.
  Future<ListVpcIngressConnectionsResponse> listVpcIngressConnections({
    ListVpcIngressConnectionsFilter? filter,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.ListVpcIngressConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListVpcIngressConnectionsResponse.fromJson(jsonResponse.body);
  }

  /// Pause an active App Runner service. App Runner reduces compute capacity
  /// for the service to zero and loses state (for example, ephemeral storage is
  /// removed).
  ///
  /// This is an asynchronous operation. On a successful call, you can use the
  /// returned <code>OperationId</code> and the <a>ListOperations</a> call to
  /// track the operation's progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) of the App Runner service that you want to
  /// pause.
  Future<PauseServiceResponse> pauseService({
    required String serviceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.PauseService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceArn': serviceArn,
      },
    );

    return PauseServiceResponse.fromJson(jsonResponse.body);
  }

  /// Resume an active App Runner service. App Runner provisions compute
  /// capacity for the service.
  ///
  /// This is an asynchronous operation. On a successful call, you can use the
  /// returned <code>OperationId</code> and the <a>ListOperations</a> call to
  /// track the operation's progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) of the App Runner service that you want to
  /// resume.
  Future<ResumeServiceResponse> resumeService({
    required String serviceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.ResumeService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceArn': serviceArn,
      },
    );

    return ResumeServiceResponse.fromJson(jsonResponse.body);
  }

  /// Initiate a manual deployment of the latest commit in a source code
  /// repository or the latest image in a source image repository to an App
  /// Runner service.
  ///
  /// For a source code repository, App Runner retrieves the commit and builds a
  /// Docker image. For a source image repository, App Runner retrieves the
  /// latest Docker image. In both cases, App Runner then deploys the new image
  /// to your service and starts a new container instance.
  ///
  /// This is an asynchronous operation. On a successful call, you can use the
  /// returned <code>OperationId</code> and the <a>ListOperations</a> call to
  /// track the operation's progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) of the App Runner service that you want to
  /// manually deploy to.
  Future<StartDeploymentResponse> startDeployment({
    required String serviceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.StartDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceArn': serviceArn,
      },
    );

    return StartDeploymentResponse.fromJson(jsonResponse.body);
  }

  /// Add tags to, or update the tag values of, an App Runner resource. A tag is
  /// a key-value pair.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to update
  /// tags for.
  ///
  /// It must be the ARN of an App Runner resource.
  ///
  /// Parameter [tags] :
  /// A list of tag key-value pairs to add or update. If a key is new to the
  /// resource, the tag is added with the provided value. If a key is already
  /// associated with the resource, the value of the tag is updated.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.TagResource'
    };
    await _protocol.send(
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
  }

  /// Remove tags from an App Runner resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to remove
  /// tags from.
  ///
  /// It must be the ARN of an App Runner resource.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys that you want to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.UntagResource'
    };
    await _protocol.send(
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
  }

  /// Update an auto scaling configuration to be the default. The existing
  /// default auto scaling configuration will be set to non-default
  /// automatically.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [autoScalingConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the App Runner auto scaling
  /// configuration that you want to set as the default.
  ///
  /// The ARN can be a full auto scaling configuration ARN, or a partial ARN
  /// ending with either <code>.../<i>name</i> </code> or
  /// <code>.../<i>name</i>/<i>revision</i> </code>. If a revision isn't
  /// specified, the latest active revision is set as the default.
  Future<UpdateDefaultAutoScalingConfigurationResponse>
      updateDefaultAutoScalingConfiguration({
    required String autoScalingConfigurationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.UpdateDefaultAutoScalingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutoScalingConfigurationArn': autoScalingConfigurationArn,
      },
    );

    return UpdateDefaultAutoScalingConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Update an App Runner service. You can update the source configuration and
  /// instance configuration of the service. You can also update the ARN of the
  /// auto scaling configuration resource that's associated with the service.
  /// However, you can't change the name or the encryption configuration of the
  /// service. These can be set only when you create the service.
  ///
  /// To update the tags applied to your service, use the separate actions
  /// <a>TagResource</a> and <a>UntagResource</a>.
  ///
  /// This is an asynchronous operation. On a successful call, you can use the
  /// returned <code>OperationId</code> and the <a>ListOperations</a> call to
  /// track the operation's progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [serviceArn] :
  /// The Amazon Resource Name (ARN) of the App Runner service that you want to
  /// update.
  ///
  /// Parameter [autoScalingConfigurationArn] :
  /// The Amazon Resource Name (ARN) of an App Runner automatic scaling
  /// configuration resource that you want to associate with the App Runner
  /// service.
  ///
  /// Parameter [healthCheckConfiguration] :
  /// The settings for the health check that App Runner performs to monitor the
  /// health of the App Runner service.
  ///
  /// Parameter [instanceConfiguration] :
  /// The runtime configuration to apply to instances (scaling units) of your
  /// service.
  ///
  /// Parameter [networkConfiguration] :
  /// Configuration settings related to network traffic of the web application
  /// that the App Runner service runs.
  ///
  /// Parameter [observabilityConfiguration] :
  /// The observability configuration of your service.
  ///
  /// Parameter [sourceConfiguration] :
  /// The source configuration to apply to the App Runner service.
  ///
  /// You can change the configuration of the code or image repository that the
  /// service uses. However, you can't switch from code to image or the other
  /// way around. This means that you must provide the same structure member of
  /// <code>SourceConfiguration</code> that you originally included when you
  /// created the service. Specifically, you can include either
  /// <code>CodeRepository</code> or <code>ImageRepository</code>. To update the
  /// source configuration, set the values to members of the structure that you
  /// include.
  Future<UpdateServiceResponse> updateService({
    required String serviceArn,
    String? autoScalingConfigurationArn,
    HealthCheckConfiguration? healthCheckConfiguration,
    InstanceConfiguration? instanceConfiguration,
    NetworkConfiguration? networkConfiguration,
    ServiceObservabilityConfiguration? observabilityConfiguration,
    SourceConfiguration? sourceConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.UpdateService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceArn': serviceArn,
        if (autoScalingConfigurationArn != null)
          'AutoScalingConfigurationArn': autoScalingConfigurationArn,
        if (healthCheckConfiguration != null)
          'HealthCheckConfiguration': healthCheckConfiguration,
        if (instanceConfiguration != null)
          'InstanceConfiguration': instanceConfiguration,
        if (networkConfiguration != null)
          'NetworkConfiguration': networkConfiguration,
        if (observabilityConfiguration != null)
          'ObservabilityConfiguration': observabilityConfiguration,
        if (sourceConfiguration != null)
          'SourceConfiguration': sourceConfiguration,
      },
    );

    return UpdateServiceResponse.fromJson(jsonResponse.body);
  }

  /// Update an existing App Runner VPC Ingress Connection resource. The VPC
  /// Ingress Connection must be in one of the following states to be updated:
  ///
  /// <ul>
  /// <li>
  /// AVAILABLE
  /// </li>
  /// <li>
  /// FAILED_CREATION
  /// </li>
  /// <li>
  /// FAILED_UPDATE
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [ingressVpcConfiguration] :
  /// Specifications for the customer’s Amazon VPC and the related Amazon Web
  /// Services PrivateLink VPC endpoint that are used to update the VPC Ingress
  /// Connection resource.
  ///
  /// Parameter [vpcIngressConnectionArn] :
  /// The Amazon Resource Name (Arn) for the App Runner VPC Ingress Connection
  /// resource that you want to update.
  Future<UpdateVpcIngressConnectionResponse> updateVpcIngressConnection({
    required IngressVpcConfiguration ingressVpcConfiguration,
    required String vpcIngressConnectionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AppRunner.UpdateVpcIngressConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IngressVpcConfiguration': ingressVpcConfiguration,
        'VpcIngressConnectionArn': vpcIngressConnectionArn,
      },
    );

    return UpdateVpcIngressConnectionResponse.fromJson(jsonResponse.body);
  }
}

class AssociateCustomDomainResponse {
  /// A description of the domain name that's being associated.
  final CustomDomain customDomain;

  /// The App Runner subdomain of the App Runner service. The custom domain name
  /// is mapped to this target name.
  final String dNSTarget;

  /// The Amazon Resource Name (ARN) of the App Runner service with which a custom
  /// domain name is associated.
  final String serviceArn;

  /// DNS Target records for the custom domains of this Amazon VPC.
  final List<VpcDNSTarget> vpcDNSTargets;

  AssociateCustomDomainResponse({
    required this.customDomain,
    required this.dNSTarget,
    required this.serviceArn,
    required this.vpcDNSTargets,
  });

  factory AssociateCustomDomainResponse.fromJson(Map<String, dynamic> json) {
    return AssociateCustomDomainResponse(
      customDomain:
          CustomDomain.fromJson(json['CustomDomain'] as Map<String, dynamic>),
      dNSTarget: json['DNSTarget'] as String,
      serviceArn: json['ServiceArn'] as String,
      vpcDNSTargets: (json['VpcDNSTargets'] as List)
          .whereNotNull()
          .map((e) => VpcDNSTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customDomain = this.customDomain;
    final dNSTarget = this.dNSTarget;
    final serviceArn = this.serviceArn;
    final vpcDNSTargets = this.vpcDNSTargets;
    return {
      'CustomDomain': customDomain,
      'DNSTarget': dNSTarget,
      'ServiceArn': serviceArn,
      'VpcDNSTargets': vpcDNSTargets,
    };
  }
}

/// Describes resources needed to authenticate access to some source
/// repositories. The specific resource depends on the repository provider.
class AuthenticationConfiguration {
  /// The Amazon Resource Name (ARN) of the IAM role that grants the App Runner
  /// service access to a source repository. It's required for ECR image
  /// repositories (but not for ECR Public repositories).
  final String? accessRoleArn;

  /// The Amazon Resource Name (ARN) of the App Runner connection that enables the
  /// App Runner service to connect to a source repository. It's required for
  /// GitHub code repositories.
  final String? connectionArn;

  AuthenticationConfiguration({
    this.accessRoleArn,
    this.connectionArn,
  });

  factory AuthenticationConfiguration.fromJson(Map<String, dynamic> json) {
    return AuthenticationConfiguration(
      accessRoleArn: json['AccessRoleArn'] as String?,
      connectionArn: json['ConnectionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessRoleArn = this.accessRoleArn;
    final connectionArn = this.connectionArn;
    return {
      if (accessRoleArn != null) 'AccessRoleArn': accessRoleArn,
      if (connectionArn != null) 'ConnectionArn': connectionArn,
    };
  }
}

/// Describes an App Runner automatic scaling configuration resource.
///
/// A higher <code>MinSize</code> increases the spread of your App Runner
/// service over more Availability Zones in the Amazon Web Services Region. The
/// tradeoff is a higher minimal cost.
///
/// A lower <code>MaxSize</code> controls your cost. The tradeoff is lower
/// responsiveness during peak demand.
///
/// Multiple revisions of a configuration might have the same
/// <code>AutoScalingConfigurationName</code> and different
/// <code>AutoScalingConfigurationRevision</code> values.
class AutoScalingConfiguration {
  /// The Amazon Resource Name (ARN) of this auto scaling configuration.
  final String? autoScalingConfigurationArn;

  /// The customer-provided auto scaling configuration name. It can be used in
  /// multiple revisions of a configuration.
  final String? autoScalingConfigurationName;

  /// The revision of this auto scaling configuration. It's unique among all the
  /// active configurations (<code>"Status": "ACTIVE"</code>) that share the same
  /// <code>AutoScalingConfigurationName</code>.
  final int? autoScalingConfigurationRevision;

  /// The time when the auto scaling configuration was created. It's in Unix time
  /// stamp format.
  final DateTime? createdAt;

  /// The time when the auto scaling configuration was deleted. It's in Unix time
  /// stamp format.
  final DateTime? deletedAt;

  /// Indicates if this auto scaling configuration has an App Runner service
  /// associated with it. A value of <code>true</code> indicates one or more
  /// services are associated. A value of <code>false</code> indicates no services
  /// are associated.
  final bool? hasAssociatedService;

  /// Indicates if this auto scaling configuration should be used as the default
  /// for a new App Runner service that does not have an auto scaling
  /// configuration ARN specified during creation. Each account can have only one
  /// default <code>AutoScalingConfiguration</code> per region. The default
  /// <code>AutoScalingConfiguration</code> can be any revision under the same
  /// <code>AutoScalingConfigurationName</code>.
  final bool? isDefault;

  /// It's set to <code>true</code> for the configuration with the highest
  /// <code>Revision</code> among all configurations that share the same
  /// <code>AutoScalingConfigurationName</code>. It's set to <code>false</code>
  /// otherwise.
  final bool? latest;

  /// The maximum number of concurrent requests that an instance processes. If the
  /// number of concurrent requests exceeds this limit, App Runner scales the
  /// service up.
  final int? maxConcurrency;

  /// The maximum number of instances that a service scales up to. At most
  /// <code>MaxSize</code> instances actively serve traffic for your service.
  final int? maxSize;

  /// The minimum number of instances that App Runner provisions for a service.
  /// The service always has at least <code>MinSize</code> provisioned instances.
  /// Some of them actively serve traffic. The rest of them (provisioned and
  /// inactive instances) are a cost-effective compute capacity reserve and are
  /// ready to be quickly activated. You pay for memory usage of all the
  /// provisioned instances. You pay for CPU usage of only the active subset.
  ///
  /// App Runner temporarily doubles the number of provisioned instances during
  /// deployments, to maintain the same capacity for both old and new code.
  final int? minSize;

  /// The current state of the auto scaling configuration. If the status of a
  /// configuration revision is <code>INACTIVE</code>, it was deleted and can't be
  /// used. Inactive configuration revisions are permanently removed some time
  /// after they are deleted.
  final AutoScalingConfigurationStatus? status;

  AutoScalingConfiguration({
    this.autoScalingConfigurationArn,
    this.autoScalingConfigurationName,
    this.autoScalingConfigurationRevision,
    this.createdAt,
    this.deletedAt,
    this.hasAssociatedService,
    this.isDefault,
    this.latest,
    this.maxConcurrency,
    this.maxSize,
    this.minSize,
    this.status,
  });

  factory AutoScalingConfiguration.fromJson(Map<String, dynamic> json) {
    return AutoScalingConfiguration(
      autoScalingConfigurationArn:
          json['AutoScalingConfigurationArn'] as String?,
      autoScalingConfigurationName:
          json['AutoScalingConfigurationName'] as String?,
      autoScalingConfigurationRevision:
          json['AutoScalingConfigurationRevision'] as int?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      deletedAt: timeStampFromJson(json['DeletedAt']),
      hasAssociatedService: json['HasAssociatedService'] as bool?,
      isDefault: json['IsDefault'] as bool?,
      latest: json['Latest'] as bool?,
      maxConcurrency: json['MaxConcurrency'] as int?,
      maxSize: json['MaxSize'] as int?,
      minSize: json['MinSize'] as int?,
      status: (json['Status'] as String?)?.toAutoScalingConfigurationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingConfigurationArn = this.autoScalingConfigurationArn;
    final autoScalingConfigurationName = this.autoScalingConfigurationName;
    final autoScalingConfigurationRevision =
        this.autoScalingConfigurationRevision;
    final createdAt = this.createdAt;
    final deletedAt = this.deletedAt;
    final hasAssociatedService = this.hasAssociatedService;
    final isDefault = this.isDefault;
    final latest = this.latest;
    final maxConcurrency = this.maxConcurrency;
    final maxSize = this.maxSize;
    final minSize = this.minSize;
    final status = this.status;
    return {
      if (autoScalingConfigurationArn != null)
        'AutoScalingConfigurationArn': autoScalingConfigurationArn,
      if (autoScalingConfigurationName != null)
        'AutoScalingConfigurationName': autoScalingConfigurationName,
      if (autoScalingConfigurationRevision != null)
        'AutoScalingConfigurationRevision': autoScalingConfigurationRevision,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (deletedAt != null) 'DeletedAt': unixTimestampToJson(deletedAt),
      if (hasAssociatedService != null)
        'HasAssociatedService': hasAssociatedService,
      if (isDefault != null) 'IsDefault': isDefault,
      if (latest != null) 'Latest': latest,
      if (maxConcurrency != null) 'MaxConcurrency': maxConcurrency,
      if (maxSize != null) 'MaxSize': maxSize,
      if (minSize != null) 'MinSize': minSize,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum AutoScalingConfigurationStatus {
  active,
  inactive,
}

extension AutoScalingConfigurationStatusValueExtension
    on AutoScalingConfigurationStatus {
  String toValue() {
    switch (this) {
      case AutoScalingConfigurationStatus.active:
        return 'ACTIVE';
      case AutoScalingConfigurationStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension AutoScalingConfigurationStatusFromString on String {
  AutoScalingConfigurationStatus toAutoScalingConfigurationStatus() {
    switch (this) {
      case 'ACTIVE':
        return AutoScalingConfigurationStatus.active;
      case 'INACTIVE':
        return AutoScalingConfigurationStatus.inactive;
    }
    throw Exception(
        '$this is not known in enum AutoScalingConfigurationStatus');
  }
}

/// Provides summary information about an App Runner automatic scaling
/// configuration resource.
///
/// This type contains limited information about an auto scaling configuration.
/// It includes only identification information, without configuration details.
/// It's returned by the <a>ListAutoScalingConfigurations</a> action. Complete
/// configuration information is returned by the
/// <a>CreateAutoScalingConfiguration</a>,
/// <a>DescribeAutoScalingConfiguration</a>, and
/// <a>DeleteAutoScalingConfiguration</a> actions using the
/// <a>AutoScalingConfiguration</a> type.
class AutoScalingConfigurationSummary {
  /// The Amazon Resource Name (ARN) of this auto scaling configuration.
  final String? autoScalingConfigurationArn;

  /// The customer-provided auto scaling configuration name. It can be used in
  /// multiple revisions of a configuration.
  final String? autoScalingConfigurationName;

  /// The revision of this auto scaling configuration. It's unique among all the
  /// active configurations (<code>"Status": "ACTIVE"</code>) with the same
  /// <code>AutoScalingConfigurationName</code>.
  final int? autoScalingConfigurationRevision;

  /// The time when the auto scaling configuration was created. It's in Unix time
  /// stamp format.
  final DateTime? createdAt;

  /// Indicates if this auto scaling configuration has an App Runner service
  /// associated with it. A value of <code>true</code> indicates one or more
  /// services are associated. A value of <code>false</code> indicates no services
  /// are associated.
  final bool? hasAssociatedService;

  /// Indicates if this auto scaling configuration should be used as the default
  /// for a new App Runner service that does not have an auto scaling
  /// configuration ARN specified during creation. Each account can have only one
  /// default <code>AutoScalingConfiguration</code> per region. The default
  /// <code>AutoScalingConfiguration</code> can be any revision under the same
  /// <code>AutoScalingConfigurationName</code>.
  final bool? isDefault;

  /// The current state of the auto scaling configuration. If the status of a
  /// configuration revision is <code>INACTIVE</code>, it was deleted and can't be
  /// used. Inactive configuration revisions are permanently removed some time
  /// after they are deleted.
  final AutoScalingConfigurationStatus? status;

  AutoScalingConfigurationSummary({
    this.autoScalingConfigurationArn,
    this.autoScalingConfigurationName,
    this.autoScalingConfigurationRevision,
    this.createdAt,
    this.hasAssociatedService,
    this.isDefault,
    this.status,
  });

  factory AutoScalingConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return AutoScalingConfigurationSummary(
      autoScalingConfigurationArn:
          json['AutoScalingConfigurationArn'] as String?,
      autoScalingConfigurationName:
          json['AutoScalingConfigurationName'] as String?,
      autoScalingConfigurationRevision:
          json['AutoScalingConfigurationRevision'] as int?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      hasAssociatedService: json['HasAssociatedService'] as bool?,
      isDefault: json['IsDefault'] as bool?,
      status: (json['Status'] as String?)?.toAutoScalingConfigurationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingConfigurationArn = this.autoScalingConfigurationArn;
    final autoScalingConfigurationName = this.autoScalingConfigurationName;
    final autoScalingConfigurationRevision =
        this.autoScalingConfigurationRevision;
    final createdAt = this.createdAt;
    final hasAssociatedService = this.hasAssociatedService;
    final isDefault = this.isDefault;
    final status = this.status;
    return {
      if (autoScalingConfigurationArn != null)
        'AutoScalingConfigurationArn': autoScalingConfigurationArn,
      if (autoScalingConfigurationName != null)
        'AutoScalingConfigurationName': autoScalingConfigurationName,
      if (autoScalingConfigurationRevision != null)
        'AutoScalingConfigurationRevision': autoScalingConfigurationRevision,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (hasAssociatedService != null)
        'HasAssociatedService': hasAssociatedService,
      if (isDefault != null) 'IsDefault': isDefault,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Describes a certificate CNAME record to add to your DNS. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_AssociateCustomDomain.html">AssociateCustomDomain</a>.
class CertificateValidationRecord {
  /// The certificate CNAME record name.
  final String? name;

  /// The current state of the certificate CNAME record validation. It should
  /// change to <code>SUCCESS</code> after App Runner completes validation with
  /// your DNS.
  final CertificateValidationRecordStatus? status;

  /// The record type, always <code>CNAME</code>.
  final String? type;

  /// The certificate CNAME record value.
  final String? value;

  CertificateValidationRecord({
    this.name,
    this.status,
    this.type,
    this.value,
  });

  factory CertificateValidationRecord.fromJson(Map<String, dynamic> json) {
    return CertificateValidationRecord(
      name: json['Name'] as String?,
      status:
          (json['Status'] as String?)?.toCertificateValidationRecordStatus(),
      type: json['Type'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type,
      if (value != null) 'Value': value,
    };
  }
}

enum CertificateValidationRecordStatus {
  pendingValidation,
  success,
  failed,
}

extension CertificateValidationRecordStatusValueExtension
    on CertificateValidationRecordStatus {
  String toValue() {
    switch (this) {
      case CertificateValidationRecordStatus.pendingValidation:
        return 'PENDING_VALIDATION';
      case CertificateValidationRecordStatus.success:
        return 'SUCCESS';
      case CertificateValidationRecordStatus.failed:
        return 'FAILED';
    }
  }
}

extension CertificateValidationRecordStatusFromString on String {
  CertificateValidationRecordStatus toCertificateValidationRecordStatus() {
    switch (this) {
      case 'PENDING_VALIDATION':
        return CertificateValidationRecordStatus.pendingValidation;
      case 'SUCCESS':
        return CertificateValidationRecordStatus.success;
      case 'FAILED':
        return CertificateValidationRecordStatus.failed;
    }
    throw Exception(
        '$this is not known in enum CertificateValidationRecordStatus');
  }
}

/// Describes the configuration that App Runner uses to build and run an App
/// Runner service from a source code repository.
class CodeConfiguration {
  /// The source of the App Runner configuration. Values are interpreted as
  /// follows:
  ///
  /// <ul>
  /// <li>
  /// <code>REPOSITORY</code> – App Runner reads configuration values from the
  /// <code>apprunner.yaml</code> file in the source code repository and ignores
  /// <code>CodeConfigurationValues</code>.
  /// </li>
  /// <li>
  /// <code>API</code> – App Runner uses configuration values provided in
  /// <code>CodeConfigurationValues</code> and ignores the
  /// <code>apprunner.yaml</code> file in the source code repository.
  /// </li>
  /// </ul>
  final ConfigurationSource configurationSource;

  /// The basic configuration for building and running the App Runner service. Use
  /// it to quickly launch an App Runner service without providing a
  /// <code>apprunner.yaml</code> file in the source code repository (or ignoring
  /// the file if it exists).
  final CodeConfigurationValues? codeConfigurationValues;

  CodeConfiguration({
    required this.configurationSource,
    this.codeConfigurationValues,
  });

  factory CodeConfiguration.fromJson(Map<String, dynamic> json) {
    return CodeConfiguration(
      configurationSource:
          (json['ConfigurationSource'] as String).toConfigurationSource(),
      codeConfigurationValues: json['CodeConfigurationValues'] != null
          ? CodeConfigurationValues.fromJson(
              json['CodeConfigurationValues'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSource = this.configurationSource;
    final codeConfigurationValues = this.codeConfigurationValues;
    return {
      'ConfigurationSource': configurationSource.toValue(),
      if (codeConfigurationValues != null)
        'CodeConfigurationValues': codeConfigurationValues,
    };
  }
}

/// Describes the basic configuration needed for building and running an App
/// Runner service. This type doesn't support the full set of possible
/// configuration options. Fur full configuration capabilities, use a
/// <code>apprunner.yaml</code> file in the source code repository.
class CodeConfigurationValues {
  /// A runtime environment type for building and running an App Runner service.
  /// It represents a programming language runtime.
  final Runtime runtime;

  /// The command App Runner runs to build your application.
  final String? buildCommand;

  /// The port that your application listens to in the container.
  ///
  /// Default: <code>8080</code>
  final String? port;

  /// An array of key-value pairs representing the secrets and parameters that get
  /// referenced to your service as an environment variable. The supported values
  /// are either the full Amazon Resource Name (ARN) of the Secrets Manager secret
  /// or the full ARN of the parameter in the Amazon Web Services Systems Manager
  /// Parameter Store.
  /// <note>
  /// <ul>
  /// <li>
  /// If the Amazon Web Services Systems Manager Parameter Store parameter exists
  /// in the same Amazon Web Services Region as the service that you're launching,
  /// you can use either the full ARN or name of the secret. If the parameter
  /// exists in a different Region, then the full ARN must be specified.
  /// </li>
  /// <li>
  /// Currently, cross account referencing of Amazon Web Services Systems Manager
  /// Parameter Store parameter is not supported.
  /// </li>
  /// </ul> </note>
  final Map<String, String>? runtimeEnvironmentSecrets;

  /// The environment variables that are available to your running App Runner
  /// service. An array of key-value pairs.
  final Map<String, String>? runtimeEnvironmentVariables;

  /// The command App Runner runs to start your application.
  final String? startCommand;

  CodeConfigurationValues({
    required this.runtime,
    this.buildCommand,
    this.port,
    this.runtimeEnvironmentSecrets,
    this.runtimeEnvironmentVariables,
    this.startCommand,
  });

  factory CodeConfigurationValues.fromJson(Map<String, dynamic> json) {
    return CodeConfigurationValues(
      runtime: (json['Runtime'] as String).toRuntime(),
      buildCommand: json['BuildCommand'] as String?,
      port: json['Port'] as String?,
      runtimeEnvironmentSecrets:
          (json['RuntimeEnvironmentSecrets'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      runtimeEnvironmentVariables:
          (json['RuntimeEnvironmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      startCommand: json['StartCommand'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final runtime = this.runtime;
    final buildCommand = this.buildCommand;
    final port = this.port;
    final runtimeEnvironmentSecrets = this.runtimeEnvironmentSecrets;
    final runtimeEnvironmentVariables = this.runtimeEnvironmentVariables;
    final startCommand = this.startCommand;
    return {
      'Runtime': runtime.toValue(),
      if (buildCommand != null) 'BuildCommand': buildCommand,
      if (port != null) 'Port': port,
      if (runtimeEnvironmentSecrets != null)
        'RuntimeEnvironmentSecrets': runtimeEnvironmentSecrets,
      if (runtimeEnvironmentVariables != null)
        'RuntimeEnvironmentVariables': runtimeEnvironmentVariables,
      if (startCommand != null) 'StartCommand': startCommand,
    };
  }
}

/// Describes a source code repository.
class CodeRepository {
  /// The location of the repository that contains the source code.
  final String repositoryUrl;

  /// The version that should be used within the source code repository.
  final SourceCodeVersion sourceCodeVersion;

  /// Configuration for building and running the service from a source code
  /// repository.
  /// <note>
  /// <code>CodeConfiguration</code> is required only for
  /// <code>CreateService</code> request.
  /// </note>
  final CodeConfiguration? codeConfiguration;

  /// The path of the directory that stores source code and configuration files.
  /// The build and start commands also execute from here. The path is absolute
  /// from root and, if not specified, defaults to the repository root.
  final String? sourceDirectory;

  CodeRepository({
    required this.repositoryUrl,
    required this.sourceCodeVersion,
    this.codeConfiguration,
    this.sourceDirectory,
  });

  factory CodeRepository.fromJson(Map<String, dynamic> json) {
    return CodeRepository(
      repositoryUrl: json['RepositoryUrl'] as String,
      sourceCodeVersion: SourceCodeVersion.fromJson(
          json['SourceCodeVersion'] as Map<String, dynamic>),
      codeConfiguration: json['CodeConfiguration'] != null
          ? CodeConfiguration.fromJson(
              json['CodeConfiguration'] as Map<String, dynamic>)
          : null,
      sourceDirectory: json['SourceDirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryUrl = this.repositoryUrl;
    final sourceCodeVersion = this.sourceCodeVersion;
    final codeConfiguration = this.codeConfiguration;
    final sourceDirectory = this.sourceDirectory;
    return {
      'RepositoryUrl': repositoryUrl,
      'SourceCodeVersion': sourceCodeVersion,
      if (codeConfiguration != null) 'CodeConfiguration': codeConfiguration,
      if (sourceDirectory != null) 'SourceDirectory': sourceDirectory,
    };
  }
}

enum ConfigurationSource {
  repository,
  api,
}

extension ConfigurationSourceValueExtension on ConfigurationSource {
  String toValue() {
    switch (this) {
      case ConfigurationSource.repository:
        return 'REPOSITORY';
      case ConfigurationSource.api:
        return 'API';
    }
  }
}

extension ConfigurationSourceFromString on String {
  ConfigurationSource toConfigurationSource() {
    switch (this) {
      case 'REPOSITORY':
        return ConfigurationSource.repository;
      case 'API':
        return ConfigurationSource.api;
    }
    throw Exception('$this is not known in enum ConfigurationSource');
  }
}

/// Describes an App Runner connection resource.
class Connection {
  /// The Amazon Resource Name (ARN) of this connection.
  final String? connectionArn;

  /// The customer-provided connection name.
  final String? connectionName;

  /// The App Runner connection creation time, expressed as a Unix time stamp.
  final DateTime? createdAt;

  /// The source repository provider.
  final ProviderType? providerType;

  /// The current state of the App Runner connection. When the state is
  /// <code>AVAILABLE</code>, you can use the connection to create an App Runner
  /// service.
  final ConnectionStatus? status;

  Connection({
    this.connectionArn,
    this.connectionName,
    this.createdAt,
    this.providerType,
    this.status,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      connectionArn: json['ConnectionArn'] as String?,
      connectionName: json['ConnectionName'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      providerType: (json['ProviderType'] as String?)?.toProviderType(),
      status: (json['Status'] as String?)?.toConnectionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final connectionName = this.connectionName;
    final createdAt = this.createdAt;
    final providerType = this.providerType;
    final status = this.status;
    return {
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionName != null) 'ConnectionName': connectionName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (providerType != null) 'ProviderType': providerType.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ConnectionStatus {
  pendingHandshake,
  available,
  error,
  deleted,
}

extension ConnectionStatusValueExtension on ConnectionStatus {
  String toValue() {
    switch (this) {
      case ConnectionStatus.pendingHandshake:
        return 'PENDING_HANDSHAKE';
      case ConnectionStatus.available:
        return 'AVAILABLE';
      case ConnectionStatus.error:
        return 'ERROR';
      case ConnectionStatus.deleted:
        return 'DELETED';
    }
  }
}

extension ConnectionStatusFromString on String {
  ConnectionStatus toConnectionStatus() {
    switch (this) {
      case 'PENDING_HANDSHAKE':
        return ConnectionStatus.pendingHandshake;
      case 'AVAILABLE':
        return ConnectionStatus.available;
      case 'ERROR':
        return ConnectionStatus.error;
      case 'DELETED':
        return ConnectionStatus.deleted;
    }
    throw Exception('$this is not known in enum ConnectionStatus');
  }
}

/// Provides summary information about an App Runner connection resource.
class ConnectionSummary {
  /// The Amazon Resource Name (ARN) of this connection.
  final String? connectionArn;

  /// The customer-provided connection name.
  final String? connectionName;

  /// The App Runner connection creation time, expressed as a Unix time stamp.
  final DateTime? createdAt;

  /// The source repository provider.
  final ProviderType? providerType;

  /// The current state of the App Runner connection. When the state is
  /// <code>AVAILABLE</code>, you can use the connection to create an App Runner
  /// service.
  final ConnectionStatus? status;

  ConnectionSummary({
    this.connectionArn,
    this.connectionName,
    this.createdAt,
    this.providerType,
    this.status,
  });

  factory ConnectionSummary.fromJson(Map<String, dynamic> json) {
    return ConnectionSummary(
      connectionArn: json['ConnectionArn'] as String?,
      connectionName: json['ConnectionName'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      providerType: (json['ProviderType'] as String?)?.toProviderType(),
      status: (json['Status'] as String?)?.toConnectionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final connectionName = this.connectionName;
    final createdAt = this.createdAt;
    final providerType = this.providerType;
    final status = this.status;
    return {
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionName != null) 'ConnectionName': connectionName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (providerType != null) 'ProviderType': providerType.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class CreateAutoScalingConfigurationResponse {
  /// A description of the App Runner auto scaling configuration that's created by
  /// this request.
  final AutoScalingConfiguration autoScalingConfiguration;

  CreateAutoScalingConfigurationResponse({
    required this.autoScalingConfiguration,
  });

  factory CreateAutoScalingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAutoScalingConfigurationResponse(
      autoScalingConfiguration: AutoScalingConfiguration.fromJson(
          json['AutoScalingConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingConfiguration = this.autoScalingConfiguration;
    return {
      'AutoScalingConfiguration': autoScalingConfiguration,
    };
  }
}

class CreateConnectionResponse {
  /// A description of the App Runner connection that's created by this request.
  final Connection connection;

  CreateConnectionResponse({
    required this.connection,
  });

  factory CreateConnectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateConnectionResponse(
      connection:
          Connection.fromJson(json['Connection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'Connection': connection,
    };
  }
}

class CreateObservabilityConfigurationResponse {
  /// A description of the App Runner observability configuration that's created
  /// by this request.
  final ObservabilityConfiguration observabilityConfiguration;

  CreateObservabilityConfigurationResponse({
    required this.observabilityConfiguration,
  });

  factory CreateObservabilityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateObservabilityConfigurationResponse(
      observabilityConfiguration: ObservabilityConfiguration.fromJson(
          json['ObservabilityConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final observabilityConfiguration = this.observabilityConfiguration;
    return {
      'ObservabilityConfiguration': observabilityConfiguration,
    };
  }
}

class CreateServiceResponse {
  /// The unique ID of the asynchronous operation that this request started. You
  /// can use it combined with the <a
  /// href="https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html">ListOperations</a>
  /// call to track the operation's progress.
  final String operationId;

  /// A description of the App Runner service that's created by this request.
  final Service service;

  CreateServiceResponse({
    required this.operationId,
    required this.service,
  });

  factory CreateServiceResponse.fromJson(Map<String, dynamic> json) {
    return CreateServiceResponse(
      operationId: json['OperationId'] as String,
      service: Service.fromJson(json['Service'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    final service = this.service;
    return {
      'OperationId': operationId,
      'Service': service,
    };
  }
}

class CreateVpcConnectorResponse {
  /// A description of the App Runner VPC connector that's created by this
  /// request.
  final VpcConnector vpcConnector;

  CreateVpcConnectorResponse({
    required this.vpcConnector,
  });

  factory CreateVpcConnectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateVpcConnectorResponse(
      vpcConnector:
          VpcConnector.fromJson(json['VpcConnector'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcConnector = this.vpcConnector;
    return {
      'VpcConnector': vpcConnector,
    };
  }
}

class CreateVpcIngressConnectionResponse {
  /// A description of the App Runner VPC Ingress Connection resource that's
  /// created by this request.
  final VpcIngressConnection vpcIngressConnection;

  CreateVpcIngressConnectionResponse({
    required this.vpcIngressConnection,
  });

  factory CreateVpcIngressConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateVpcIngressConnectionResponse(
      vpcIngressConnection: VpcIngressConnection.fromJson(
          json['VpcIngressConnection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcIngressConnection = this.vpcIngressConnection;
    return {
      'VpcIngressConnection': vpcIngressConnection,
    };
  }
}

/// Describes a custom domain that's associated with an App Runner service.
class CustomDomain {
  /// An associated custom domain endpoint. It can be a root domain (for example,
  /// <code>example.com</code>), a subdomain (for example,
  /// <code>login.example.com</code> or <code>admin.login.example.com</code>), or
  /// a wildcard (for example, <code>*.example.com</code>).
  final String domainName;

  /// When <code>true</code>, the subdomain <code>www.<i>DomainName</i> </code> is
  /// associated with the App Runner service in addition to the base domain.
  final bool enableWWWSubdomain;

  /// The current state of the domain name association.
  final CustomDomainAssociationStatus status;

  /// A list of certificate CNAME records that's used for this domain name.
  final List<CertificateValidationRecord>? certificateValidationRecords;

  CustomDomain({
    required this.domainName,
    required this.enableWWWSubdomain,
    required this.status,
    this.certificateValidationRecords,
  });

  factory CustomDomain.fromJson(Map<String, dynamic> json) {
    return CustomDomain(
      domainName: json['DomainName'] as String,
      enableWWWSubdomain: json['EnableWWWSubdomain'] as bool,
      status: (json['Status'] as String).toCustomDomainAssociationStatus(),
      certificateValidationRecords: (json['CertificateValidationRecords']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              CertificateValidationRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final enableWWWSubdomain = this.enableWWWSubdomain;
    final status = this.status;
    final certificateValidationRecords = this.certificateValidationRecords;
    return {
      'DomainName': domainName,
      'EnableWWWSubdomain': enableWWWSubdomain,
      'Status': status.toValue(),
      if (certificateValidationRecords != null)
        'CertificateValidationRecords': certificateValidationRecords,
    };
  }
}

enum CustomDomainAssociationStatus {
  creating,
  createFailed,
  active,
  deleting,
  deleteFailed,
  pendingCertificateDnsValidation,
  bindingCertificate,
}

extension CustomDomainAssociationStatusValueExtension
    on CustomDomainAssociationStatus {
  String toValue() {
    switch (this) {
      case CustomDomainAssociationStatus.creating:
        return 'CREATING';
      case CustomDomainAssociationStatus.createFailed:
        return 'CREATE_FAILED';
      case CustomDomainAssociationStatus.active:
        return 'ACTIVE';
      case CustomDomainAssociationStatus.deleting:
        return 'DELETING';
      case CustomDomainAssociationStatus.deleteFailed:
        return 'DELETE_FAILED';
      case CustomDomainAssociationStatus.pendingCertificateDnsValidation:
        return 'PENDING_CERTIFICATE_DNS_VALIDATION';
      case CustomDomainAssociationStatus.bindingCertificate:
        return 'BINDING_CERTIFICATE';
    }
  }
}

extension CustomDomainAssociationStatusFromString on String {
  CustomDomainAssociationStatus toCustomDomainAssociationStatus() {
    switch (this) {
      case 'CREATING':
        return CustomDomainAssociationStatus.creating;
      case 'CREATE_FAILED':
        return CustomDomainAssociationStatus.createFailed;
      case 'ACTIVE':
        return CustomDomainAssociationStatus.active;
      case 'DELETING':
        return CustomDomainAssociationStatus.deleting;
      case 'DELETE_FAILED':
        return CustomDomainAssociationStatus.deleteFailed;
      case 'PENDING_CERTIFICATE_DNS_VALIDATION':
        return CustomDomainAssociationStatus.pendingCertificateDnsValidation;
      case 'BINDING_CERTIFICATE':
        return CustomDomainAssociationStatus.bindingCertificate;
    }
    throw Exception('$this is not known in enum CustomDomainAssociationStatus');
  }
}

class DeleteAutoScalingConfigurationResponse {
  /// A description of the App Runner auto scaling configuration that this request
  /// just deleted.
  final AutoScalingConfiguration autoScalingConfiguration;

  DeleteAutoScalingConfigurationResponse({
    required this.autoScalingConfiguration,
  });

  factory DeleteAutoScalingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteAutoScalingConfigurationResponse(
      autoScalingConfiguration: AutoScalingConfiguration.fromJson(
          json['AutoScalingConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingConfiguration = this.autoScalingConfiguration;
    return {
      'AutoScalingConfiguration': autoScalingConfiguration,
    };
  }
}

class DeleteConnectionResponse {
  /// A description of the App Runner connection that this request just deleted.
  final Connection? connection;

  DeleteConnectionResponse({
    this.connection,
  });

  factory DeleteConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteConnectionResponse(
      connection: json['Connection'] != null
          ? Connection.fromJson(json['Connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'Connection': connection,
    };
  }
}

class DeleteObservabilityConfigurationResponse {
  /// A description of the App Runner observability configuration that this
  /// request just deleted.
  final ObservabilityConfiguration observabilityConfiguration;

  DeleteObservabilityConfigurationResponse({
    required this.observabilityConfiguration,
  });

  factory DeleteObservabilityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteObservabilityConfigurationResponse(
      observabilityConfiguration: ObservabilityConfiguration.fromJson(
          json['ObservabilityConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final observabilityConfiguration = this.observabilityConfiguration;
    return {
      'ObservabilityConfiguration': observabilityConfiguration,
    };
  }
}

class DeleteServiceResponse {
  /// The unique ID of the asynchronous operation that this request started. You
  /// can use it combined with the <a>ListOperations</a> call to track the
  /// operation's progress.
  final String operationId;

  /// A description of the App Runner service that this request just deleted.
  final Service service;

  DeleteServiceResponse({
    required this.operationId,
    required this.service,
  });

  factory DeleteServiceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteServiceResponse(
      operationId: json['OperationId'] as String,
      service: Service.fromJson(json['Service'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    final service = this.service;
    return {
      'OperationId': operationId,
      'Service': service,
    };
  }
}

class DeleteVpcConnectorResponse {
  /// A description of the App Runner VPC connector that this request just
  /// deleted.
  final VpcConnector vpcConnector;

  DeleteVpcConnectorResponse({
    required this.vpcConnector,
  });

  factory DeleteVpcConnectorResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVpcConnectorResponse(
      vpcConnector:
          VpcConnector.fromJson(json['VpcConnector'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcConnector = this.vpcConnector;
    return {
      'VpcConnector': vpcConnector,
    };
  }
}

class DeleteVpcIngressConnectionResponse {
  /// A description of the App Runner VPC Ingress Connection that this request
  /// just deleted.
  final VpcIngressConnection vpcIngressConnection;

  DeleteVpcIngressConnectionResponse({
    required this.vpcIngressConnection,
  });

  factory DeleteVpcIngressConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteVpcIngressConnectionResponse(
      vpcIngressConnection: VpcIngressConnection.fromJson(
          json['VpcIngressConnection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcIngressConnection = this.vpcIngressConnection;
    return {
      'VpcIngressConnection': vpcIngressConnection,
    };
  }
}

class DescribeAutoScalingConfigurationResponse {
  /// A full description of the App Runner auto scaling configuration that you
  /// specified in this request.
  final AutoScalingConfiguration autoScalingConfiguration;

  DescribeAutoScalingConfigurationResponse({
    required this.autoScalingConfiguration,
  });

  factory DescribeAutoScalingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAutoScalingConfigurationResponse(
      autoScalingConfiguration: AutoScalingConfiguration.fromJson(
          json['AutoScalingConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingConfiguration = this.autoScalingConfiguration;
    return {
      'AutoScalingConfiguration': autoScalingConfiguration,
    };
  }
}

class DescribeCustomDomainsResponse {
  /// A list of descriptions of custom domain names that are associated with the
  /// service. In a paginated request, the request returns up to
  /// <code>MaxResults</code> records per call.
  final List<CustomDomain> customDomains;

  /// The App Runner subdomain of the App Runner service. The associated custom
  /// domain names are mapped to this target name.
  final String dNSTarget;

  /// The Amazon Resource Name (ARN) of the App Runner service whose associated
  /// custom domain names you want to describe.
  final String serviceArn;

  /// DNS Target records for the custom domains of this Amazon VPC.
  final List<VpcDNSTarget> vpcDNSTargets;

  /// The token that you can pass in a subsequent request to get the next result
  /// page. It's returned in a paginated request.
  final String? nextToken;

  DescribeCustomDomainsResponse({
    required this.customDomains,
    required this.dNSTarget,
    required this.serviceArn,
    required this.vpcDNSTargets,
    this.nextToken,
  });

  factory DescribeCustomDomainsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCustomDomainsResponse(
      customDomains: (json['CustomDomains'] as List)
          .whereNotNull()
          .map((e) => CustomDomain.fromJson(e as Map<String, dynamic>))
          .toList(),
      dNSTarget: json['DNSTarget'] as String,
      serviceArn: json['ServiceArn'] as String,
      vpcDNSTargets: (json['VpcDNSTargets'] as List)
          .whereNotNull()
          .map((e) => VpcDNSTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customDomains = this.customDomains;
    final dNSTarget = this.dNSTarget;
    final serviceArn = this.serviceArn;
    final vpcDNSTargets = this.vpcDNSTargets;
    final nextToken = this.nextToken;
    return {
      'CustomDomains': customDomains,
      'DNSTarget': dNSTarget,
      'ServiceArn': serviceArn,
      'VpcDNSTargets': vpcDNSTargets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeObservabilityConfigurationResponse {
  /// A full description of the App Runner observability configuration that you
  /// specified in this request.
  final ObservabilityConfiguration observabilityConfiguration;

  DescribeObservabilityConfigurationResponse({
    required this.observabilityConfiguration,
  });

  factory DescribeObservabilityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeObservabilityConfigurationResponse(
      observabilityConfiguration: ObservabilityConfiguration.fromJson(
          json['ObservabilityConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final observabilityConfiguration = this.observabilityConfiguration;
    return {
      'ObservabilityConfiguration': observabilityConfiguration,
    };
  }
}

class DescribeServiceResponse {
  /// A full description of the App Runner service that you specified in this
  /// request.
  final Service service;

  DescribeServiceResponse({
    required this.service,
  });

  factory DescribeServiceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeServiceResponse(
      service: Service.fromJson(json['Service'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      'Service': service,
    };
  }
}

class DescribeVpcConnectorResponse {
  /// A description of the App Runner VPC connector that you specified in this
  /// request.
  final VpcConnector vpcConnector;

  DescribeVpcConnectorResponse({
    required this.vpcConnector,
  });

  factory DescribeVpcConnectorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeVpcConnectorResponse(
      vpcConnector:
          VpcConnector.fromJson(json['VpcConnector'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcConnector = this.vpcConnector;
    return {
      'VpcConnector': vpcConnector,
    };
  }
}

class DescribeVpcIngressConnectionResponse {
  /// A description of the App Runner VPC Ingress Connection that you specified in
  /// this request.
  final VpcIngressConnection vpcIngressConnection;

  DescribeVpcIngressConnectionResponse({
    required this.vpcIngressConnection,
  });

  factory DescribeVpcIngressConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeVpcIngressConnectionResponse(
      vpcIngressConnection: VpcIngressConnection.fromJson(
          json['VpcIngressConnection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcIngressConnection = this.vpcIngressConnection;
    return {
      'VpcIngressConnection': vpcIngressConnection,
    };
  }
}

class DisassociateCustomDomainResponse {
  /// A description of the domain name that's being disassociated.
  final CustomDomain customDomain;

  /// The App Runner subdomain of the App Runner service. The disassociated custom
  /// domain name was mapped to this target name.
  final String dNSTarget;

  /// The Amazon Resource Name (ARN) of the App Runner service that a custom
  /// domain name is disassociated from.
  final String serviceArn;

  /// DNS Target records for the custom domains of this Amazon VPC.
  final List<VpcDNSTarget> vpcDNSTargets;

  DisassociateCustomDomainResponse({
    required this.customDomain,
    required this.dNSTarget,
    required this.serviceArn,
    required this.vpcDNSTargets,
  });

  factory DisassociateCustomDomainResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateCustomDomainResponse(
      customDomain:
          CustomDomain.fromJson(json['CustomDomain'] as Map<String, dynamic>),
      dNSTarget: json['DNSTarget'] as String,
      serviceArn: json['ServiceArn'] as String,
      vpcDNSTargets: (json['VpcDNSTargets'] as List)
          .whereNotNull()
          .map((e) => VpcDNSTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customDomain = this.customDomain;
    final dNSTarget = this.dNSTarget;
    final serviceArn = this.serviceArn;
    final vpcDNSTargets = this.vpcDNSTargets;
    return {
      'CustomDomain': customDomain,
      'DNSTarget': dNSTarget,
      'ServiceArn': serviceArn,
      'VpcDNSTargets': vpcDNSTargets,
    };
  }
}

/// Describes configuration settings related to outbound network traffic of an
/// App Runner service.
class EgressConfiguration {
  /// The type of egress configuration.
  ///
  /// Set to <code>DEFAULT</code> for access to resources hosted on public
  /// networks.
  ///
  /// Set to <code>VPC</code> to associate your service to a custom VPC specified
  /// by <code>VpcConnectorArn</code>.
  final EgressType? egressType;

  /// The Amazon Resource Name (ARN) of the App Runner VPC connector that you want
  /// to associate with your App Runner service. Only valid when <code>EgressType
  /// = VPC</code>.
  final String? vpcConnectorArn;

  EgressConfiguration({
    this.egressType,
    this.vpcConnectorArn,
  });

  factory EgressConfiguration.fromJson(Map<String, dynamic> json) {
    return EgressConfiguration(
      egressType: (json['EgressType'] as String?)?.toEgressType(),
      vpcConnectorArn: json['VpcConnectorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final egressType = this.egressType;
    final vpcConnectorArn = this.vpcConnectorArn;
    return {
      if (egressType != null) 'EgressType': egressType.toValue(),
      if (vpcConnectorArn != null) 'VpcConnectorArn': vpcConnectorArn,
    };
  }
}

enum EgressType {
  $default,
  vpc,
}

extension EgressTypeValueExtension on EgressType {
  String toValue() {
    switch (this) {
      case EgressType.$default:
        return 'DEFAULT';
      case EgressType.vpc:
        return 'VPC';
    }
  }
}

extension EgressTypeFromString on String {
  EgressType toEgressType() {
    switch (this) {
      case 'DEFAULT':
        return EgressType.$default;
      case 'VPC':
        return EgressType.vpc;
    }
    throw Exception('$this is not known in enum EgressType');
  }
}

/// Describes a custom encryption key that App Runner uses to encrypt copies of
/// the source repository and service logs.
class EncryptionConfiguration {
  /// The ARN of the KMS key that's used for encryption.
  final String kmsKey;

  EncryptionConfiguration({
    required this.kmsKey,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      kmsKey: json['KmsKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKey = this.kmsKey;
    return {
      'KmsKey': kmsKey,
    };
  }
}

/// Describes the settings for the health check that App Runner performs to
/// monitor the health of a service.
class HealthCheckConfiguration {
  /// The number of consecutive checks that must succeed before App Runner decides
  /// that the service is healthy.
  ///
  /// Default: <code>1</code>
  final int? healthyThreshold;

  /// The time interval, in seconds, between health checks.
  ///
  /// Default: <code>5</code>
  final int? interval;

  /// The URL that health check requests are sent to.
  ///
  /// <code>Path</code> is only applicable when you set <code>Protocol</code> to
  /// <code>HTTP</code>.
  ///
  /// Default: <code>"/"</code>
  final String? path;

  /// The IP protocol that App Runner uses to perform health checks for your
  /// service.
  ///
  /// If you set <code>Protocol</code> to <code>HTTP</code>, App Runner sends
  /// health check requests to the HTTP path specified by <code>Path</code>.
  ///
  /// Default: <code>TCP</code>
  final HealthCheckProtocol? protocol;

  /// The time, in seconds, to wait for a health check response before deciding it
  /// failed.
  ///
  /// Default: <code>2</code>
  final int? timeout;

  /// The number of consecutive checks that must fail before App Runner decides
  /// that the service is unhealthy.
  ///
  /// Default: <code>5</code>
  final int? unhealthyThreshold;

  HealthCheckConfiguration({
    this.healthyThreshold,
    this.interval,
    this.path,
    this.protocol,
    this.timeout,
    this.unhealthyThreshold,
  });

  factory HealthCheckConfiguration.fromJson(Map<String, dynamic> json) {
    return HealthCheckConfiguration(
      healthyThreshold: json['HealthyThreshold'] as int?,
      interval: json['Interval'] as int?,
      path: json['Path'] as String?,
      protocol: (json['Protocol'] as String?)?.toHealthCheckProtocol(),
      timeout: json['Timeout'] as int?,
      unhealthyThreshold: json['UnhealthyThreshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthyThreshold = this.healthyThreshold;
    final interval = this.interval;
    final path = this.path;
    final protocol = this.protocol;
    final timeout = this.timeout;
    final unhealthyThreshold = this.unhealthyThreshold;
    return {
      if (healthyThreshold != null) 'HealthyThreshold': healthyThreshold,
      if (interval != null) 'Interval': interval,
      if (path != null) 'Path': path,
      if (protocol != null) 'Protocol': protocol.toValue(),
      if (timeout != null) 'Timeout': timeout,
      if (unhealthyThreshold != null) 'UnhealthyThreshold': unhealthyThreshold,
    };
  }
}

enum HealthCheckProtocol {
  tcp,
  http,
}

extension HealthCheckProtocolValueExtension on HealthCheckProtocol {
  String toValue() {
    switch (this) {
      case HealthCheckProtocol.tcp:
        return 'TCP';
      case HealthCheckProtocol.http:
        return 'HTTP';
    }
  }
}

extension HealthCheckProtocolFromString on String {
  HealthCheckProtocol toHealthCheckProtocol() {
    switch (this) {
      case 'TCP':
        return HealthCheckProtocol.tcp;
      case 'HTTP':
        return HealthCheckProtocol.http;
    }
    throw Exception('$this is not known in enum HealthCheckProtocol');
  }
}

/// Describes the configuration that App Runner uses to run an App Runner
/// service using an image pulled from a source image repository.
class ImageConfiguration {
  /// The port that your application listens to in the container.
  ///
  /// Default: <code>8080</code>
  final String? port;

  /// An array of key-value pairs representing the secrets and parameters that get
  /// referenced to your service as an environment variable. The supported values
  /// are either the full Amazon Resource Name (ARN) of the Secrets Manager secret
  /// or the full ARN of the parameter in the Amazon Web Services Systems Manager
  /// Parameter Store.
  /// <note>
  /// <ul>
  /// <li>
  /// If the Amazon Web Services Systems Manager Parameter Store parameter exists
  /// in the same Amazon Web Services Region as the service that you're launching,
  /// you can use either the full ARN or name of the secret. If the parameter
  /// exists in a different Region, then the full ARN must be specified.
  /// </li>
  /// <li>
  /// Currently, cross account referencing of Amazon Web Services Systems Manager
  /// Parameter Store parameter is not supported.
  /// </li>
  /// </ul> </note>
  final Map<String, String>? runtimeEnvironmentSecrets;

  /// Environment variables that are available to your running App Runner service.
  /// An array of key-value pairs.
  final Map<String, String>? runtimeEnvironmentVariables;

  /// An optional command that App Runner runs to start the application in the
  /// source image. If specified, this command overrides the Docker image’s
  /// default start command.
  final String? startCommand;

  ImageConfiguration({
    this.port,
    this.runtimeEnvironmentSecrets,
    this.runtimeEnvironmentVariables,
    this.startCommand,
  });

  factory ImageConfiguration.fromJson(Map<String, dynamic> json) {
    return ImageConfiguration(
      port: json['Port'] as String?,
      runtimeEnvironmentSecrets:
          (json['RuntimeEnvironmentSecrets'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      runtimeEnvironmentVariables:
          (json['RuntimeEnvironmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      startCommand: json['StartCommand'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final runtimeEnvironmentSecrets = this.runtimeEnvironmentSecrets;
    final runtimeEnvironmentVariables = this.runtimeEnvironmentVariables;
    final startCommand = this.startCommand;
    return {
      if (port != null) 'Port': port,
      if (runtimeEnvironmentSecrets != null)
        'RuntimeEnvironmentSecrets': runtimeEnvironmentSecrets,
      if (runtimeEnvironmentVariables != null)
        'RuntimeEnvironmentVariables': runtimeEnvironmentVariables,
      if (startCommand != null) 'StartCommand': startCommand,
    };
  }
}

/// Describes a source image repository.
class ImageRepository {
  /// The identifier of an image.
  ///
  /// For an image in Amazon Elastic Container Registry (Amazon ECR), this is an
  /// image name. For the image name format, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-pull-ecr-image.html">Pulling
  /// an image</a> in the <i>Amazon ECR User Guide</i>.
  final String imageIdentifier;

  /// The type of the image repository. This reflects the repository provider and
  /// whether the repository is private or public.
  final ImageRepositoryType imageRepositoryType;

  /// Configuration for running the identified image.
  final ImageConfiguration? imageConfiguration;

  ImageRepository({
    required this.imageIdentifier,
    required this.imageRepositoryType,
    this.imageConfiguration,
  });

  factory ImageRepository.fromJson(Map<String, dynamic> json) {
    return ImageRepository(
      imageIdentifier: json['ImageIdentifier'] as String,
      imageRepositoryType:
          (json['ImageRepositoryType'] as String).toImageRepositoryType(),
      imageConfiguration: json['ImageConfiguration'] != null
          ? ImageConfiguration.fromJson(
              json['ImageConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imageIdentifier = this.imageIdentifier;
    final imageRepositoryType = this.imageRepositoryType;
    final imageConfiguration = this.imageConfiguration;
    return {
      'ImageIdentifier': imageIdentifier,
      'ImageRepositoryType': imageRepositoryType.toValue(),
      if (imageConfiguration != null) 'ImageConfiguration': imageConfiguration,
    };
  }
}

enum ImageRepositoryType {
  ecr,
  ecrPublic,
}

extension ImageRepositoryTypeValueExtension on ImageRepositoryType {
  String toValue() {
    switch (this) {
      case ImageRepositoryType.ecr:
        return 'ECR';
      case ImageRepositoryType.ecrPublic:
        return 'ECR_PUBLIC';
    }
  }
}

extension ImageRepositoryTypeFromString on String {
  ImageRepositoryType toImageRepositoryType() {
    switch (this) {
      case 'ECR':
        return ImageRepositoryType.ecr;
      case 'ECR_PUBLIC':
        return ImageRepositoryType.ecrPublic;
    }
    throw Exception('$this is not known in enum ImageRepositoryType');
  }
}

/// Network configuration settings for inbound network traffic.
class IngressConfiguration {
  /// Specifies whether your App Runner service is publicly accessible. To make
  /// the service publicly accessible set it to <code>True</code>. To make the
  /// service privately accessible, from only within an Amazon VPC set it to
  /// <code>False</code>.
  final bool? isPubliclyAccessible;

  IngressConfiguration({
    this.isPubliclyAccessible,
  });

  factory IngressConfiguration.fromJson(Map<String, dynamic> json) {
    return IngressConfiguration(
      isPubliclyAccessible: json['IsPubliclyAccessible'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final isPubliclyAccessible = this.isPubliclyAccessible;
    return {
      if (isPubliclyAccessible != null)
        'IsPubliclyAccessible': isPubliclyAccessible,
    };
  }
}

/// The configuration of your VPC and the associated VPC endpoint. The VPC
/// endpoint is an Amazon Web Services PrivateLink resource that allows access
/// to your App Runner services from within an Amazon VPC.
class IngressVpcConfiguration {
  /// The ID of the VPC endpoint that your App Runner service connects to.
  final String? vpcEndpointId;

  /// The ID of the VPC that is used for the VPC endpoint.
  final String? vpcId;

  IngressVpcConfiguration({
    this.vpcEndpointId,
    this.vpcId,
  });

  factory IngressVpcConfiguration.fromJson(Map<String, dynamic> json) {
    return IngressVpcConfiguration(
      vpcEndpointId: json['VpcEndpointId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcEndpointId = this.vpcEndpointId;
    final vpcId = this.vpcId;
    return {
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Describes the runtime configuration of an App Runner service instance
/// (scaling unit).
class InstanceConfiguration {
  /// The number of CPU units reserved for each instance of your App Runner
  /// service.
  ///
  /// Default: <code>1 vCPU</code>
  final String? cpu;

  /// The Amazon Resource Name (ARN) of an IAM role that provides permissions to
  /// your App Runner service. These are permissions that your code needs when it
  /// calls any Amazon Web Services APIs.
  final String? instanceRoleArn;

  /// The amount of memory, in MB or GB, reserved for each instance of your App
  /// Runner service.
  ///
  /// Default: <code>2 GB</code>
  final String? memory;

  InstanceConfiguration({
    this.cpu,
    this.instanceRoleArn,
    this.memory,
  });

  factory InstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return InstanceConfiguration(
      cpu: json['Cpu'] as String?,
      instanceRoleArn: json['InstanceRoleArn'] as String?,
      memory: json['Memory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpu = this.cpu;
    final instanceRoleArn = this.instanceRoleArn;
    final memory = this.memory;
    return {
      if (cpu != null) 'Cpu': cpu,
      if (instanceRoleArn != null) 'InstanceRoleArn': instanceRoleArn,
      if (memory != null) 'Memory': memory,
    };
  }
}

enum IpAddressType {
  ipv4,
  dualStack,
}

extension IpAddressTypeValueExtension on IpAddressType {
  String toValue() {
    switch (this) {
      case IpAddressType.ipv4:
        return 'IPV4';
      case IpAddressType.dualStack:
        return 'DUAL_STACK';
    }
  }
}

extension IpAddressTypeFromString on String {
  IpAddressType toIpAddressType() {
    switch (this) {
      case 'IPV4':
        return IpAddressType.ipv4;
      case 'DUAL_STACK':
        return IpAddressType.dualStack;
    }
    throw Exception('$this is not known in enum IpAddressType');
  }
}

class ListAutoScalingConfigurationsResponse {
  /// A list of summary information records for auto scaling configurations. In a
  /// paginated request, the request returns up to <code>MaxResults</code> records
  /// for each call.
  final List<AutoScalingConfigurationSummary>
      autoScalingConfigurationSummaryList;

  /// The token that you can pass in a subsequent request to get the next result
  /// page. It's returned in a paginated request.
  final String? nextToken;

  ListAutoScalingConfigurationsResponse({
    required this.autoScalingConfigurationSummaryList,
    this.nextToken,
  });

  factory ListAutoScalingConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAutoScalingConfigurationsResponse(
      autoScalingConfigurationSummaryList:
          (json['AutoScalingConfigurationSummaryList'] as List)
              .whereNotNull()
              .map((e) => AutoScalingConfigurationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingConfigurationSummaryList =
        this.autoScalingConfigurationSummaryList;
    final nextToken = this.nextToken;
    return {
      'AutoScalingConfigurationSummaryList':
          autoScalingConfigurationSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListConnectionsResponse {
  /// A list of summary information records for connections. In a paginated
  /// request, the request returns up to <code>MaxResults</code> records for each
  /// call.
  final List<ConnectionSummary> connectionSummaryList;

  /// The token that you can pass in a subsequent request to get the next result
  /// page. Returned in a paginated request.
  final String? nextToken;

  ListConnectionsResponse({
    required this.connectionSummaryList,
    this.nextToken,
  });

  factory ListConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectionsResponse(
      connectionSummaryList: (json['ConnectionSummaryList'] as List)
          .whereNotNull()
          .map((e) => ConnectionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionSummaryList = this.connectionSummaryList;
    final nextToken = this.nextToken;
    return {
      'ConnectionSummaryList': connectionSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListObservabilityConfigurationsResponse {
  /// A list of summary information records for observability configurations. In a
  /// paginated request, the request returns up to <code>MaxResults</code> records
  /// for each call.
  final List<ObservabilityConfigurationSummary>
      observabilityConfigurationSummaryList;

  /// The token that you can pass in a subsequent request to get the next result
  /// page. It's returned in a paginated request.
  final String? nextToken;

  ListObservabilityConfigurationsResponse({
    required this.observabilityConfigurationSummaryList,
    this.nextToken,
  });

  factory ListObservabilityConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListObservabilityConfigurationsResponse(
      observabilityConfigurationSummaryList:
          (json['ObservabilityConfigurationSummaryList'] as List)
              .whereNotNull()
              .map((e) => ObservabilityConfigurationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final observabilityConfigurationSummaryList =
        this.observabilityConfigurationSummaryList;
    final nextToken = this.nextToken;
    return {
      'ObservabilityConfigurationSummaryList':
          observabilityConfigurationSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListOperationsResponse {
  /// The token that you can pass in a subsequent request to get the next result
  /// page. It's returned in a paginated request.
  final String? nextToken;

  /// A list of operation summary information records. In a paginated request, the
  /// request returns up to <code>MaxResults</code> records for each call.
  final List<OperationSummary>? operationSummaryList;

  ListOperationsResponse({
    this.nextToken,
    this.operationSummaryList,
  });

  factory ListOperationsResponse.fromJson(Map<String, dynamic> json) {
    return ListOperationsResponse(
      nextToken: json['NextToken'] as String?,
      operationSummaryList: (json['OperationSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => OperationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final operationSummaryList = this.operationSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (operationSummaryList != null)
        'OperationSummaryList': operationSummaryList,
    };
  }
}

class ListServicesForAutoScalingConfigurationResponse {
  /// A list of service ARN records. In a paginated request, the request returns
  /// up to <code>MaxResults</code> records for each call.
  final List<String> serviceArnList;

  /// The token that you can pass in a subsequent request to get the next result
  /// page. It's returned in a paginated request.
  final String? nextToken;

  ListServicesForAutoScalingConfigurationResponse({
    required this.serviceArnList,
    this.nextToken,
  });

  factory ListServicesForAutoScalingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListServicesForAutoScalingConfigurationResponse(
      serviceArnList: (json['ServiceArnList'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceArnList = this.serviceArnList;
    final nextToken = this.nextToken;
    return {
      'ServiceArnList': serviceArnList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListServicesResponse {
  /// A list of service summary information records. In a paginated request, the
  /// request returns up to <code>MaxResults</code> records for each call.
  final List<ServiceSummary> serviceSummaryList;

  /// The token that you can pass in a subsequent request to get the next result
  /// page. It's returned in a paginated request.
  final String? nextToken;

  ListServicesResponse({
    required this.serviceSummaryList,
    this.nextToken,
  });

  factory ListServicesResponse.fromJson(Map<String, dynamic> json) {
    return ListServicesResponse(
      serviceSummaryList: (json['ServiceSummaryList'] as List)
          .whereNotNull()
          .map((e) => ServiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSummaryList = this.serviceSummaryList;
    final nextToken = this.nextToken;
    return {
      'ServiceSummaryList': serviceSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of the tag key-value pairs that are associated with the resource.
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

class ListVpcConnectorsResponse {
  /// A list of information records for VPC connectors. In a paginated request,
  /// the request returns up to <code>MaxResults</code> records for each call.
  final List<VpcConnector> vpcConnectors;

  /// The token that you can pass in a subsequent request to get the next result
  /// page. It's returned in a paginated request.
  final String? nextToken;

  ListVpcConnectorsResponse({
    required this.vpcConnectors,
    this.nextToken,
  });

  factory ListVpcConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListVpcConnectorsResponse(
      vpcConnectors: (json['VpcConnectors'] as List)
          .whereNotNull()
          .map((e) => VpcConnector.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcConnectors = this.vpcConnectors;
    final nextToken = this.nextToken;
    return {
      'VpcConnectors': vpcConnectors,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Returns a list of VPC Ingress Connections based on the filter provided. It
/// can return either <code>ServiceArn</code> or <code>VpcEndpointId</code>, or
/// both.
class ListVpcIngressConnectionsFilter {
  /// The Amazon Resource Name (ARN) of a service to filter by.
  final String? serviceArn;

  /// The ID of a VPC Endpoint to filter by.
  final String? vpcEndpointId;

  ListVpcIngressConnectionsFilter({
    this.serviceArn,
    this.vpcEndpointId,
  });

  Map<String, dynamic> toJson() {
    final serviceArn = this.serviceArn;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      if (serviceArn != null) 'ServiceArn': serviceArn,
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
    };
  }
}

class ListVpcIngressConnectionsResponse {
  /// A list of summary information records for VPC Ingress Connections. In a
  /// paginated request, the request returns up to <code>MaxResults</code> records
  /// for each call.
  final List<VpcIngressConnectionSummary> vpcIngressConnectionSummaryList;

  /// The token that you can pass in a subsequent request to get the next result
  /// page. It's returned in a paginated request.
  final String? nextToken;

  ListVpcIngressConnectionsResponse({
    required this.vpcIngressConnectionSummaryList,
    this.nextToken,
  });

  factory ListVpcIngressConnectionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListVpcIngressConnectionsResponse(
      vpcIngressConnectionSummaryList: (json['VpcIngressConnectionSummaryList']
              as List)
          .whereNotNull()
          .map((e) =>
              VpcIngressConnectionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcIngressConnectionSummaryList =
        this.vpcIngressConnectionSummaryList;
    final nextToken = this.nextToken;
    return {
      'VpcIngressConnectionSummaryList': vpcIngressConnectionSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Describes configuration settings related to network traffic of an App Runner
/// service. Consists of embedded objects for each configurable network feature.
class NetworkConfiguration {
  /// Network configuration settings for outbound message traffic.
  final EgressConfiguration? egressConfiguration;

  /// Network configuration settings for inbound message traffic.
  final IngressConfiguration? ingressConfiguration;

  /// App Runner provides you with the option to choose between <i>Internet
  /// Protocol version 4 (IPv4)</i> and <i>dual stack</i> (IPv4 and IPv6) for your
  /// incoming public network configuration. This is an optional parameter. If you
  /// do not specify an <code>IpAddressType</code>, it defaults to select IPv4.
  /// <note>
  /// Currently, App Runner supports dual stack for only Public endpoint. Only
  /// IPv4 is supported for Private endpoint. If you update a service that's using
  /// dual-stack Public endpoint to a Private endpoint, your App Runner service
  /// will default to support only IPv4 for Private endpoint and fail to receive
  /// traffic originating from IPv6 endpoint.
  /// </note>
  final IpAddressType? ipAddressType;

  NetworkConfiguration({
    this.egressConfiguration,
    this.ingressConfiguration,
    this.ipAddressType,
  });

  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConfiguration(
      egressConfiguration: json['EgressConfiguration'] != null
          ? EgressConfiguration.fromJson(
              json['EgressConfiguration'] as Map<String, dynamic>)
          : null,
      ingressConfiguration: json['IngressConfiguration'] != null
          ? IngressConfiguration.fromJson(
              json['IngressConfiguration'] as Map<String, dynamic>)
          : null,
      ipAddressType: (json['IpAddressType'] as String?)?.toIpAddressType(),
    );
  }

  Map<String, dynamic> toJson() {
    final egressConfiguration = this.egressConfiguration;
    final ingressConfiguration = this.ingressConfiguration;
    final ipAddressType = this.ipAddressType;
    return {
      if (egressConfiguration != null)
        'EgressConfiguration': egressConfiguration,
      if (ingressConfiguration != null)
        'IngressConfiguration': ingressConfiguration,
      if (ipAddressType != null) 'IpAddressType': ipAddressType.toValue(),
    };
  }
}

/// Describes an App Runner observability configuration resource. Multiple
/// revisions of a configuration have the same
/// <code>ObservabilityConfigurationName</code> and different
/// <code>ObservabilityConfigurationRevision</code> values.
///
/// The resource is designed to configure multiple features (currently one
/// feature, tracing). This type contains optional members that describe the
/// configuration of these features (currently one member,
/// <code>TraceConfiguration</code>). If a feature member isn't specified, the
/// feature isn't enabled.
class ObservabilityConfiguration {
  /// The time when the observability configuration was created. It's in Unix time
  /// stamp format.
  final DateTime? createdAt;

  /// The time when the observability configuration was deleted. It's in Unix time
  /// stamp format.
  final DateTime? deletedAt;

  /// It's set to <code>true</code> for the configuration with the highest
  /// <code>Revision</code> among all configurations that share the same
  /// <code>ObservabilityConfigurationName</code>. It's set to <code>false</code>
  /// otherwise.
  final bool? latest;

  /// The Amazon Resource Name (ARN) of this observability configuration.
  final String? observabilityConfigurationArn;

  /// The customer-provided observability configuration name. It can be used in
  /// multiple revisions of a configuration.
  final String? observabilityConfigurationName;

  /// The revision of this observability configuration. It's unique among all the
  /// active configurations (<code>"Status": "ACTIVE"</code>) that share the same
  /// <code>ObservabilityConfigurationName</code>.
  final int? observabilityConfigurationRevision;

  /// The current state of the observability configuration. If the status of a
  /// configuration revision is <code>INACTIVE</code>, it was deleted and can't be
  /// used. Inactive configuration revisions are permanently removed some time
  /// after they are deleted.
  final ObservabilityConfigurationStatus? status;

  /// The configuration of the tracing feature within this observability
  /// configuration. If not specified, tracing isn't enabled.
  final TraceConfiguration? traceConfiguration;

  ObservabilityConfiguration({
    this.createdAt,
    this.deletedAt,
    this.latest,
    this.observabilityConfigurationArn,
    this.observabilityConfigurationName,
    this.observabilityConfigurationRevision,
    this.status,
    this.traceConfiguration,
  });

  factory ObservabilityConfiguration.fromJson(Map<String, dynamic> json) {
    return ObservabilityConfiguration(
      createdAt: timeStampFromJson(json['CreatedAt']),
      deletedAt: timeStampFromJson(json['DeletedAt']),
      latest: json['Latest'] as bool?,
      observabilityConfigurationArn:
          json['ObservabilityConfigurationArn'] as String?,
      observabilityConfigurationName:
          json['ObservabilityConfigurationName'] as String?,
      observabilityConfigurationRevision:
          json['ObservabilityConfigurationRevision'] as int?,
      status: (json['Status'] as String?)?.toObservabilityConfigurationStatus(),
      traceConfiguration: json['TraceConfiguration'] != null
          ? TraceConfiguration.fromJson(
              json['TraceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deletedAt = this.deletedAt;
    final latest = this.latest;
    final observabilityConfigurationArn = this.observabilityConfigurationArn;
    final observabilityConfigurationName = this.observabilityConfigurationName;
    final observabilityConfigurationRevision =
        this.observabilityConfigurationRevision;
    final status = this.status;
    final traceConfiguration = this.traceConfiguration;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (deletedAt != null) 'DeletedAt': unixTimestampToJson(deletedAt),
      if (latest != null) 'Latest': latest,
      if (observabilityConfigurationArn != null)
        'ObservabilityConfigurationArn': observabilityConfigurationArn,
      if (observabilityConfigurationName != null)
        'ObservabilityConfigurationName': observabilityConfigurationName,
      if (observabilityConfigurationRevision != null)
        'ObservabilityConfigurationRevision':
            observabilityConfigurationRevision,
      if (status != null) 'Status': status.toValue(),
      if (traceConfiguration != null) 'TraceConfiguration': traceConfiguration,
    };
  }
}

enum ObservabilityConfigurationStatus {
  active,
  inactive,
}

extension ObservabilityConfigurationStatusValueExtension
    on ObservabilityConfigurationStatus {
  String toValue() {
    switch (this) {
      case ObservabilityConfigurationStatus.active:
        return 'ACTIVE';
      case ObservabilityConfigurationStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension ObservabilityConfigurationStatusFromString on String {
  ObservabilityConfigurationStatus toObservabilityConfigurationStatus() {
    switch (this) {
      case 'ACTIVE':
        return ObservabilityConfigurationStatus.active;
      case 'INACTIVE':
        return ObservabilityConfigurationStatus.inactive;
    }
    throw Exception(
        '$this is not known in enum ObservabilityConfigurationStatus');
  }
}

/// Provides summary information about an App Runner observability configuration
/// resource.
///
/// This type contains limited information about an observability configuration.
/// It includes only identification information, without configuration details.
/// It's returned by the <a>ListObservabilityConfigurations</a> action. Complete
/// configuration information is returned by the
/// <a>CreateObservabilityConfiguration</a>,
/// <a>DescribeObservabilityConfiguration</a>, and
/// <a>DeleteObservabilityConfiguration</a> actions using the
/// <a>ObservabilityConfiguration</a> type.
class ObservabilityConfigurationSummary {
  /// The Amazon Resource Name (ARN) of this observability configuration.
  final String? observabilityConfigurationArn;

  /// The customer-provided observability configuration name. It can be used in
  /// multiple revisions of a configuration.
  final String? observabilityConfigurationName;

  /// The revision of this observability configuration. It's unique among all the
  /// active configurations (<code>"Status": "ACTIVE"</code>) that share the same
  /// <code>ObservabilityConfigurationName</code>.
  final int? observabilityConfigurationRevision;

  ObservabilityConfigurationSummary({
    this.observabilityConfigurationArn,
    this.observabilityConfigurationName,
    this.observabilityConfigurationRevision,
  });

  factory ObservabilityConfigurationSummary.fromJson(
      Map<String, dynamic> json) {
    return ObservabilityConfigurationSummary(
      observabilityConfigurationArn:
          json['ObservabilityConfigurationArn'] as String?,
      observabilityConfigurationName:
          json['ObservabilityConfigurationName'] as String?,
      observabilityConfigurationRevision:
          json['ObservabilityConfigurationRevision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final observabilityConfigurationArn = this.observabilityConfigurationArn;
    final observabilityConfigurationName = this.observabilityConfigurationName;
    final observabilityConfigurationRevision =
        this.observabilityConfigurationRevision;
    return {
      if (observabilityConfigurationArn != null)
        'ObservabilityConfigurationArn': observabilityConfigurationArn,
      if (observabilityConfigurationName != null)
        'ObservabilityConfigurationName': observabilityConfigurationName,
      if (observabilityConfigurationRevision != null)
        'ObservabilityConfigurationRevision':
            observabilityConfigurationRevision,
    };
  }
}

enum OperationStatus {
  pending,
  inProgress,
  failed,
  succeeded,
  rollbackInProgress,
  rollbackFailed,
  rollbackSucceeded,
}

extension OperationStatusValueExtension on OperationStatus {
  String toValue() {
    switch (this) {
      case OperationStatus.pending:
        return 'PENDING';
      case OperationStatus.inProgress:
        return 'IN_PROGRESS';
      case OperationStatus.failed:
        return 'FAILED';
      case OperationStatus.succeeded:
        return 'SUCCEEDED';
      case OperationStatus.rollbackInProgress:
        return 'ROLLBACK_IN_PROGRESS';
      case OperationStatus.rollbackFailed:
        return 'ROLLBACK_FAILED';
      case OperationStatus.rollbackSucceeded:
        return 'ROLLBACK_SUCCEEDED';
    }
  }
}

extension OperationStatusFromString on String {
  OperationStatus toOperationStatus() {
    switch (this) {
      case 'PENDING':
        return OperationStatus.pending;
      case 'IN_PROGRESS':
        return OperationStatus.inProgress;
      case 'FAILED':
        return OperationStatus.failed;
      case 'SUCCEEDED':
        return OperationStatus.succeeded;
      case 'ROLLBACK_IN_PROGRESS':
        return OperationStatus.rollbackInProgress;
      case 'ROLLBACK_FAILED':
        return OperationStatus.rollbackFailed;
      case 'ROLLBACK_SUCCEEDED':
        return OperationStatus.rollbackSucceeded;
    }
    throw Exception('$this is not known in enum OperationStatus');
  }
}

/// Provides summary information for an operation that occurred on an App Runner
/// service.
class OperationSummary {
  /// The time when the operation ended. It's in the Unix time stamp format.
  final DateTime? endedAt;

  /// A unique ID of this operation. It's unique in the scope of the App Runner
  /// service.
  final String? id;

  /// The time when the operation started. It's in the Unix time stamp format.
  final DateTime? startedAt;

  /// The current state of the operation.
  final OperationStatus? status;

  /// The Amazon Resource Name (ARN) of the resource that the operation acted on
  /// (for example, an App Runner service).
  final String? targetArn;

  /// The type of operation. It indicates a specific action that occured.
  final OperationType? type;

  /// The time when the operation was last updated. It's in the Unix time stamp
  /// format.
  final DateTime? updatedAt;

  OperationSummary({
    this.endedAt,
    this.id,
    this.startedAt,
    this.status,
    this.targetArn,
    this.type,
    this.updatedAt,
  });

  factory OperationSummary.fromJson(Map<String, dynamic> json) {
    return OperationSummary(
      endedAt: timeStampFromJson(json['EndedAt']),
      id: json['Id'] as String?,
      startedAt: timeStampFromJson(json['StartedAt']),
      status: (json['Status'] as String?)?.toOperationStatus(),
      targetArn: json['TargetArn'] as String?,
      type: (json['Type'] as String?)?.toOperationType(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final endedAt = this.endedAt;
    final id = this.id;
    final startedAt = this.startedAt;
    final status = this.status;
    final targetArn = this.targetArn;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (endedAt != null) 'EndedAt': unixTimestampToJson(endedAt),
      if (id != null) 'Id': id,
      if (startedAt != null) 'StartedAt': unixTimestampToJson(startedAt),
      if (status != null) 'Status': status.toValue(),
      if (targetArn != null) 'TargetArn': targetArn,
      if (type != null) 'Type': type.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum OperationType {
  startDeployment,
  createService,
  pauseService,
  resumeService,
  deleteService,
  updateService,
}

extension OperationTypeValueExtension on OperationType {
  String toValue() {
    switch (this) {
      case OperationType.startDeployment:
        return 'START_DEPLOYMENT';
      case OperationType.createService:
        return 'CREATE_SERVICE';
      case OperationType.pauseService:
        return 'PAUSE_SERVICE';
      case OperationType.resumeService:
        return 'RESUME_SERVICE';
      case OperationType.deleteService:
        return 'DELETE_SERVICE';
      case OperationType.updateService:
        return 'UPDATE_SERVICE';
    }
  }
}

extension OperationTypeFromString on String {
  OperationType toOperationType() {
    switch (this) {
      case 'START_DEPLOYMENT':
        return OperationType.startDeployment;
      case 'CREATE_SERVICE':
        return OperationType.createService;
      case 'PAUSE_SERVICE':
        return OperationType.pauseService;
      case 'RESUME_SERVICE':
        return OperationType.resumeService;
      case 'DELETE_SERVICE':
        return OperationType.deleteService;
      case 'UPDATE_SERVICE':
        return OperationType.updateService;
    }
    throw Exception('$this is not known in enum OperationType');
  }
}

class PauseServiceResponse {
  /// A description of the App Runner service that this request just paused.
  final Service service;

  /// The unique ID of the asynchronous operation that this request started. You
  /// can use it combined with the <a>ListOperations</a> call to track the
  /// operation's progress.
  final String? operationId;

  PauseServiceResponse({
    required this.service,
    this.operationId,
  });

  factory PauseServiceResponse.fromJson(Map<String, dynamic> json) {
    return PauseServiceResponse(
      service: Service.fromJson(json['Service'] as Map<String, dynamic>),
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    final operationId = this.operationId;
    return {
      'Service': service,
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

enum ProviderType {
  github,
  bitbucket,
}

extension ProviderTypeValueExtension on ProviderType {
  String toValue() {
    switch (this) {
      case ProviderType.github:
        return 'GITHUB';
      case ProviderType.bitbucket:
        return 'BITBUCKET';
    }
  }
}

extension ProviderTypeFromString on String {
  ProviderType toProviderType() {
    switch (this) {
      case 'GITHUB':
        return ProviderType.github;
      case 'BITBUCKET':
        return ProviderType.bitbucket;
    }
    throw Exception('$this is not known in enum ProviderType');
  }
}

class ResumeServiceResponse {
  /// A description of the App Runner service that this request just resumed.
  final Service service;

  /// The unique ID of the asynchronous operation that this request started. You
  /// can use it combined with the <a>ListOperations</a> call to track the
  /// operation's progress.
  final String? operationId;

  ResumeServiceResponse({
    required this.service,
    this.operationId,
  });

  factory ResumeServiceResponse.fromJson(Map<String, dynamic> json) {
    return ResumeServiceResponse(
      service: Service.fromJson(json['Service'] as Map<String, dynamic>),
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    final operationId = this.operationId;
    return {
      'Service': service,
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

enum Runtime {
  python_3,
  nodejs_12,
  nodejs_14,
  corretto_8,
  corretto_11,
  nodejs_16,
  go_1,
  dotnet_6,
  php_81,
  ruby_31,
  python_311,
  nodejs_18,
}

extension RuntimeValueExtension on Runtime {
  String toValue() {
    switch (this) {
      case Runtime.python_3:
        return 'PYTHON_3';
      case Runtime.nodejs_12:
        return 'NODEJS_12';
      case Runtime.nodejs_14:
        return 'NODEJS_14';
      case Runtime.corretto_8:
        return 'CORRETTO_8';
      case Runtime.corretto_11:
        return 'CORRETTO_11';
      case Runtime.nodejs_16:
        return 'NODEJS_16';
      case Runtime.go_1:
        return 'GO_1';
      case Runtime.dotnet_6:
        return 'DOTNET_6';
      case Runtime.php_81:
        return 'PHP_81';
      case Runtime.ruby_31:
        return 'RUBY_31';
      case Runtime.python_311:
        return 'PYTHON_311';
      case Runtime.nodejs_18:
        return 'NODEJS_18';
    }
  }
}

extension RuntimeFromString on String {
  Runtime toRuntime() {
    switch (this) {
      case 'PYTHON_3':
        return Runtime.python_3;
      case 'NODEJS_12':
        return Runtime.nodejs_12;
      case 'NODEJS_14':
        return Runtime.nodejs_14;
      case 'CORRETTO_8':
        return Runtime.corretto_8;
      case 'CORRETTO_11':
        return Runtime.corretto_11;
      case 'NODEJS_16':
        return Runtime.nodejs_16;
      case 'GO_1':
        return Runtime.go_1;
      case 'DOTNET_6':
        return Runtime.dotnet_6;
      case 'PHP_81':
        return Runtime.php_81;
      case 'RUBY_31':
        return Runtime.ruby_31;
      case 'PYTHON_311':
        return Runtime.python_311;
      case 'NODEJS_18':
        return Runtime.nodejs_18;
    }
    throw Exception('$this is not known in enum Runtime');
  }
}

/// Describes an App Runner service. It can describe a service in any state,
/// including deleted services.
///
/// This type contains the full information about a service, including
/// configuration details. It's returned by the <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_CreateService.html">CreateService</a>,
/// <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_DescribeService.html">DescribeService</a>,
/// and <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_DeleteService.html">DeleteService</a>
/// actions. A subset of this information is returned by the <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_ListServices.html">ListServices</a>
/// action using the <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_ServiceSummary.html">ServiceSummary</a>
/// type.
class Service {
  /// Summary information for the App Runner automatic scaling configuration
  /// resource that's associated with this service.
  final AutoScalingConfigurationSummary autoScalingConfigurationSummary;

  /// The time when the App Runner service was created. It's in the Unix time
  /// stamp format.
  final DateTime createdAt;

  /// The runtime configuration of instances (scaling units) of this service.
  final InstanceConfiguration instanceConfiguration;

  /// Configuration settings related to network traffic of the web application
  /// that this service runs.
  final NetworkConfiguration networkConfiguration;

  /// The Amazon Resource Name (ARN) of this service.
  final String serviceArn;

  /// An ID that App Runner generated for this service. It's unique within the
  /// Amazon Web Services Region.
  final String serviceId;

  /// The customer-provided service name.
  final String serviceName;

  /// The source deployed to the App Runner service. It can be a code or an image
  /// repository.
  final SourceConfiguration sourceConfiguration;

  /// The current state of the App Runner service. These particular values mean
  /// the following.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_FAILED</code> – The service failed to create. The failed
  /// service isn't usable, and still counts towards your service quota. To
  /// troubleshoot this failure, read the failure events and logs, change any
  /// parameters that need to be fixed, and rebuild your service using
  /// <code>UpdateService</code>.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> – The service failed to delete and can't be
  /// successfully recovered. Retry the service deletion call to ensure that all
  /// related resources are removed.
  /// </li>
  /// </ul>
  final ServiceStatus status;

  /// The time when the App Runner service was last updated at. It's in the Unix
  /// time stamp format.
  final DateTime updatedAt;

  /// The time when the App Runner service was deleted. It's in the Unix time
  /// stamp format.
  final DateTime? deletedAt;

  /// The encryption key that App Runner uses to encrypt the service logs and the
  /// copy of the source repository that App Runner maintains for the service. It
  /// can be either a customer-provided encryption key or an Amazon Web Services
  /// managed key.
  final EncryptionConfiguration? encryptionConfiguration;

  /// The settings for the health check that App Runner performs to monitor the
  /// health of this service.
  final HealthCheckConfiguration? healthCheckConfiguration;

  /// The observability configuration of this service.
  final ServiceObservabilityConfiguration? observabilityConfiguration;

  /// A subdomain URL that App Runner generated for this service. You can use this
  /// URL to access your service web application.
  final String? serviceUrl;

  Service({
    required this.autoScalingConfigurationSummary,
    required this.createdAt,
    required this.instanceConfiguration,
    required this.networkConfiguration,
    required this.serviceArn,
    required this.serviceId,
    required this.serviceName,
    required this.sourceConfiguration,
    required this.status,
    required this.updatedAt,
    this.deletedAt,
    this.encryptionConfiguration,
    this.healthCheckConfiguration,
    this.observabilityConfiguration,
    this.serviceUrl,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      autoScalingConfigurationSummary: AutoScalingConfigurationSummary.fromJson(
          json['AutoScalingConfigurationSummary'] as Map<String, dynamic>),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      instanceConfiguration: InstanceConfiguration.fromJson(
          json['InstanceConfiguration'] as Map<String, dynamic>),
      networkConfiguration: NetworkConfiguration.fromJson(
          json['NetworkConfiguration'] as Map<String, dynamic>),
      serviceArn: json['ServiceArn'] as String,
      serviceId: json['ServiceId'] as String,
      serviceName: json['ServiceName'] as String,
      sourceConfiguration: SourceConfiguration.fromJson(
          json['SourceConfiguration'] as Map<String, dynamic>),
      status: (json['Status'] as String).toServiceStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] as Object),
      deletedAt: timeStampFromJson(json['DeletedAt']),
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      healthCheckConfiguration: json['HealthCheckConfiguration'] != null
          ? HealthCheckConfiguration.fromJson(
              json['HealthCheckConfiguration'] as Map<String, dynamic>)
          : null,
      observabilityConfiguration: json['ObservabilityConfiguration'] != null
          ? ServiceObservabilityConfiguration.fromJson(
              json['ObservabilityConfiguration'] as Map<String, dynamic>)
          : null,
      serviceUrl: json['ServiceUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingConfigurationSummary =
        this.autoScalingConfigurationSummary;
    final createdAt = this.createdAt;
    final instanceConfiguration = this.instanceConfiguration;
    final networkConfiguration = this.networkConfiguration;
    final serviceArn = this.serviceArn;
    final serviceId = this.serviceId;
    final serviceName = this.serviceName;
    final sourceConfiguration = this.sourceConfiguration;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final deletedAt = this.deletedAt;
    final encryptionConfiguration = this.encryptionConfiguration;
    final healthCheckConfiguration = this.healthCheckConfiguration;
    final observabilityConfiguration = this.observabilityConfiguration;
    final serviceUrl = this.serviceUrl;
    return {
      'AutoScalingConfigurationSummary': autoScalingConfigurationSummary,
      'CreatedAt': unixTimestampToJson(createdAt),
      'InstanceConfiguration': instanceConfiguration,
      'NetworkConfiguration': networkConfiguration,
      'ServiceArn': serviceArn,
      'ServiceId': serviceId,
      'ServiceName': serviceName,
      'SourceConfiguration': sourceConfiguration,
      'Status': status.toValue(),
      'UpdatedAt': unixTimestampToJson(updatedAt),
      if (deletedAt != null) 'DeletedAt': unixTimestampToJson(deletedAt),
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (healthCheckConfiguration != null)
        'HealthCheckConfiguration': healthCheckConfiguration,
      if (observabilityConfiguration != null)
        'ObservabilityConfiguration': observabilityConfiguration,
      if (serviceUrl != null) 'ServiceUrl': serviceUrl,
    };
  }
}

/// Describes the observability configuration of an App Runner service. These
/// are additional observability features, like tracing, that you choose to
/// enable. They're configured in a separate resource that you associate with
/// your service.
class ServiceObservabilityConfiguration {
  /// When <code>true</code>, an observability configuration resource is
  /// associated with the service, and an
  /// <code>ObservabilityConfigurationArn</code> is specified.
  final bool observabilityEnabled;

  /// The Amazon Resource Name (ARN) of the observability configuration that is
  /// associated with the service. Specified only when
  /// <code>ObservabilityEnabled</code> is <code>true</code>.
  ///
  /// Specify an ARN with a name and a revision number to associate that revision.
  /// For example:
  /// <code>arn:aws:apprunner:us-east-1:123456789012:observabilityconfiguration/xray-tracing/3</code>
  ///
  /// Specify just the name to associate the latest revision. For example:
  /// <code>arn:aws:apprunner:us-east-1:123456789012:observabilityconfiguration/xray-tracing</code>
  final String? observabilityConfigurationArn;

  ServiceObservabilityConfiguration({
    required this.observabilityEnabled,
    this.observabilityConfigurationArn,
  });

  factory ServiceObservabilityConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServiceObservabilityConfiguration(
      observabilityEnabled: json['ObservabilityEnabled'] as bool,
      observabilityConfigurationArn:
          json['ObservabilityConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final observabilityEnabled = this.observabilityEnabled;
    final observabilityConfigurationArn = this.observabilityConfigurationArn;
    return {
      'ObservabilityEnabled': observabilityEnabled,
      if (observabilityConfigurationArn != null)
        'ObservabilityConfigurationArn': observabilityConfigurationArn,
    };
  }
}

enum ServiceStatus {
  createFailed,
  running,
  deleted,
  deleteFailed,
  paused,
  operationInProgress,
}

extension ServiceStatusValueExtension on ServiceStatus {
  String toValue() {
    switch (this) {
      case ServiceStatus.createFailed:
        return 'CREATE_FAILED';
      case ServiceStatus.running:
        return 'RUNNING';
      case ServiceStatus.deleted:
        return 'DELETED';
      case ServiceStatus.deleteFailed:
        return 'DELETE_FAILED';
      case ServiceStatus.paused:
        return 'PAUSED';
      case ServiceStatus.operationInProgress:
        return 'OPERATION_IN_PROGRESS';
    }
  }
}

extension ServiceStatusFromString on String {
  ServiceStatus toServiceStatus() {
    switch (this) {
      case 'CREATE_FAILED':
        return ServiceStatus.createFailed;
      case 'RUNNING':
        return ServiceStatus.running;
      case 'DELETED':
        return ServiceStatus.deleted;
      case 'DELETE_FAILED':
        return ServiceStatus.deleteFailed;
      case 'PAUSED':
        return ServiceStatus.paused;
      case 'OPERATION_IN_PROGRESS':
        return ServiceStatus.operationInProgress;
    }
    throw Exception('$this is not known in enum ServiceStatus');
  }
}

/// Provides summary information for an App Runner service.
///
/// This type contains limited information about a service. It doesn't include
/// configuration details. It's returned by the <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_ListServices.html">ListServices</a>
/// action. Complete service information is returned by the <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_CreateService.html">CreateService</a>,
/// <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_DescribeService.html">DescribeService</a>,
/// and <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_DeleteService.html">DeleteService</a>
/// actions using the <a
/// href="https://docs.aws.amazon.com/apprunner/latest/api/API_Service.html">Service</a>
/// type.
class ServiceSummary {
  /// The time when the App Runner service was created. It's in the Unix time
  /// stamp format.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of this service.
  final String? serviceArn;

  /// An ID that App Runner generated for this service. It's unique within the
  /// Amazon Web Services Region.
  final String? serviceId;

  /// The customer-provided service name.
  final String? serviceName;

  /// A subdomain URL that App Runner generated for this service. You can use this
  /// URL to access your service web application.
  final String? serviceUrl;

  /// The current state of the App Runner service. These particular values mean
  /// the following.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_FAILED</code> – The service failed to create. The failed
  /// service isn't usable, and still counts towards your service quota. To
  /// troubleshoot this failure, read the failure events and logs, change any
  /// parameters that need to be fixed, and rebuild your service using
  /// <code>UpdateService</code>.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> – The service failed to delete and can't be
  /// successfully recovered. Retry the service deletion call to ensure that all
  /// related resources are removed.
  /// </li>
  /// </ul>
  final ServiceStatus? status;

  /// The time when the App Runner service was last updated. It's in theUnix time
  /// stamp format.
  final DateTime? updatedAt;

  ServiceSummary({
    this.createdAt,
    this.serviceArn,
    this.serviceId,
    this.serviceName,
    this.serviceUrl,
    this.status,
    this.updatedAt,
  });

  factory ServiceSummary.fromJson(Map<String, dynamic> json) {
    return ServiceSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      serviceArn: json['ServiceArn'] as String?,
      serviceId: json['ServiceId'] as String?,
      serviceName: json['ServiceName'] as String?,
      serviceUrl: json['ServiceUrl'] as String?,
      status: (json['Status'] as String?)?.toServiceStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final serviceArn = this.serviceArn;
    final serviceId = this.serviceId;
    final serviceName = this.serviceName;
    final serviceUrl = this.serviceUrl;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (serviceArn != null) 'ServiceArn': serviceArn,
      if (serviceId != null) 'ServiceId': serviceId,
      if (serviceName != null) 'ServiceName': serviceName,
      if (serviceUrl != null) 'ServiceUrl': serviceUrl,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Identifies a version of code that App Runner refers to within a source code
/// repository.
class SourceCodeVersion {
  /// The type of version identifier.
  ///
  /// For a git-based repository, branches represent versions.
  final SourceCodeVersionType type;

  /// A source code version.
  ///
  /// For a git-based repository, a branch name maps to a specific version. App
  /// Runner uses the most recent commit to the branch.
  final String value;

  SourceCodeVersion({
    required this.type,
    required this.value,
  });

  factory SourceCodeVersion.fromJson(Map<String, dynamic> json) {
    return SourceCodeVersion(
      type: (json['Type'] as String).toSourceCodeVersionType(),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum SourceCodeVersionType {
  branch,
}

extension SourceCodeVersionTypeValueExtension on SourceCodeVersionType {
  String toValue() {
    switch (this) {
      case SourceCodeVersionType.branch:
        return 'BRANCH';
    }
  }
}

extension SourceCodeVersionTypeFromString on String {
  SourceCodeVersionType toSourceCodeVersionType() {
    switch (this) {
      case 'BRANCH':
        return SourceCodeVersionType.branch;
    }
    throw Exception('$this is not known in enum SourceCodeVersionType');
  }
}

/// Describes the source deployed to an App Runner service. It can be a code or
/// an image repository.
class SourceConfiguration {
  /// Describes the resources that are needed to authenticate access to some
  /// source repositories.
  final AuthenticationConfiguration? authenticationConfiguration;

  /// If <code>true</code>, continuous integration from the source repository is
  /// enabled for the App Runner service. Each repository change (including any
  /// source code commit or new image version) starts a deployment.
  ///
  /// Default: App Runner sets to <code>false</code> for a source image that uses
  /// an ECR Public repository or an ECR repository that's in an Amazon Web
  /// Services account other than the one that the service is in. App Runner sets
  /// to <code>true</code> in all other cases (which currently include a source
  /// code repository or a source image using a same-account ECR repository).
  final bool? autoDeploymentsEnabled;

  /// The description of a source code repository.
  ///
  /// You must provide either this member or <code>ImageRepository</code> (but not
  /// both).
  final CodeRepository? codeRepository;

  /// The description of a source image repository.
  ///
  /// You must provide either this member or <code>CodeRepository</code> (but not
  /// both).
  final ImageRepository? imageRepository;

  SourceConfiguration({
    this.authenticationConfiguration,
    this.autoDeploymentsEnabled,
    this.codeRepository,
    this.imageRepository,
  });

  factory SourceConfiguration.fromJson(Map<String, dynamic> json) {
    return SourceConfiguration(
      authenticationConfiguration: json['AuthenticationConfiguration'] != null
          ? AuthenticationConfiguration.fromJson(
              json['AuthenticationConfiguration'] as Map<String, dynamic>)
          : null,
      autoDeploymentsEnabled: json['AutoDeploymentsEnabled'] as bool?,
      codeRepository: json['CodeRepository'] != null
          ? CodeRepository.fromJson(
              json['CodeRepository'] as Map<String, dynamic>)
          : null,
      imageRepository: json['ImageRepository'] != null
          ? ImageRepository.fromJson(
              json['ImageRepository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationConfiguration = this.authenticationConfiguration;
    final autoDeploymentsEnabled = this.autoDeploymentsEnabled;
    final codeRepository = this.codeRepository;
    final imageRepository = this.imageRepository;
    return {
      if (authenticationConfiguration != null)
        'AuthenticationConfiguration': authenticationConfiguration,
      if (autoDeploymentsEnabled != null)
        'AutoDeploymentsEnabled': autoDeploymentsEnabled,
      if (codeRepository != null) 'CodeRepository': codeRepository,
      if (imageRepository != null) 'ImageRepository': imageRepository,
    };
  }
}

class StartDeploymentResponse {
  /// The unique ID of the asynchronous operation that this request started. You
  /// can use it combined with the <a>ListOperations</a> call to track the
  /// operation's progress.
  final String operationId;

  StartDeploymentResponse({
    required this.operationId,
  });

  factory StartDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return StartDeploymentResponse(
      operationId: json['OperationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      'OperationId': operationId,
    };
  }
}

/// Describes a tag that is applied to an App Runner resource. A tag is a
/// metadata item consisting of a key-value pair.
class Tag {
  /// The key of the tag.
  final String? key;

  /// The value of the tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
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

/// Describes the configuration of the tracing feature within an App Runner
/// observability configuration.
class TraceConfiguration {
  /// The implementation provider chosen for tracing App Runner services.
  final TracingVendor vendor;

  TraceConfiguration({
    required this.vendor,
  });

  factory TraceConfiguration.fromJson(Map<String, dynamic> json) {
    return TraceConfiguration(
      vendor: (json['Vendor'] as String).toTracingVendor(),
    );
  }

  Map<String, dynamic> toJson() {
    final vendor = this.vendor;
    return {
      'Vendor': vendor.toValue(),
    };
  }
}

enum TracingVendor {
  awsxray,
}

extension TracingVendorValueExtension on TracingVendor {
  String toValue() {
    switch (this) {
      case TracingVendor.awsxray:
        return 'AWSXRAY';
    }
  }
}

extension TracingVendorFromString on String {
  TracingVendor toTracingVendor() {
    switch (this) {
      case 'AWSXRAY':
        return TracingVendor.awsxray;
    }
    throw Exception('$this is not known in enum TracingVendor');
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

class UpdateDefaultAutoScalingConfigurationResponse {
  /// A description of the App Runner auto scaling configuration that was set as
  /// default.
  final AutoScalingConfiguration autoScalingConfiguration;

  UpdateDefaultAutoScalingConfigurationResponse({
    required this.autoScalingConfiguration,
  });

  factory UpdateDefaultAutoScalingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDefaultAutoScalingConfigurationResponse(
      autoScalingConfiguration: AutoScalingConfiguration.fromJson(
          json['AutoScalingConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingConfiguration = this.autoScalingConfiguration;
    return {
      'AutoScalingConfiguration': autoScalingConfiguration,
    };
  }
}

class UpdateServiceResponse {
  /// The unique ID of the asynchronous operation that this request started. You
  /// can use it combined with the <a>ListOperations</a> call to track the
  /// operation's progress.
  final String operationId;

  /// A description of the App Runner service updated by this request. All
  /// configuration values in the returned <code>Service</code> structure reflect
  /// configuration changes that are being applied by this request.
  final Service service;

  UpdateServiceResponse({
    required this.operationId,
    required this.service,
  });

  factory UpdateServiceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServiceResponse(
      operationId: json['OperationId'] as String,
      service: Service.fromJson(json['Service'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    final service = this.service;
    return {
      'OperationId': operationId,
      'Service': service,
    };
  }
}

class UpdateVpcIngressConnectionResponse {
  /// A description of the App Runner VPC Ingress Connection resource that's
  /// updated by this request.
  final VpcIngressConnection vpcIngressConnection;

  UpdateVpcIngressConnectionResponse({
    required this.vpcIngressConnection,
  });

  factory UpdateVpcIngressConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateVpcIngressConnectionResponse(
      vpcIngressConnection: VpcIngressConnection.fromJson(
          json['VpcIngressConnection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcIngressConnection = this.vpcIngressConnection;
    return {
      'VpcIngressConnection': vpcIngressConnection,
    };
  }
}

/// Describes an App Runner VPC connector resource. A VPC connector describes
/// the Amazon Virtual Private Cloud (Amazon VPC) that an App Runner service is
/// associated with, and the subnets and security group that are used.
///
/// Multiple revisions of a connector might have the same <code>Name</code> and
/// different <code>Revision</code> values.
/// <note>
/// At this time, App Runner supports only one revision per name.
/// </note>
class VpcConnector {
  /// The time when the VPC connector was created. It's in Unix time stamp format.
  final DateTime? createdAt;

  /// The time when the VPC connector was deleted. It's in Unix time stamp format.
  final DateTime? deletedAt;

  /// A list of IDs of security groups that App Runner uses for access to Amazon
  /// Web Services resources under the specified subnets. If not specified, App
  /// Runner uses the default security group of the Amazon VPC. The default
  /// security group allows all outbound traffic.
  final List<String>? securityGroups;

  /// The current state of the VPC connector. If the status of a connector
  /// revision is <code>INACTIVE</code>, it was deleted and can't be used.
  /// Inactive connector revisions are permanently removed some time after they
  /// are deleted.
  final VpcConnectorStatus? status;

  /// A list of IDs of subnets that App Runner uses for your service. All IDs are
  /// of subnets of a single Amazon VPC.
  final List<String>? subnets;

  /// The Amazon Resource Name (ARN) of this VPC connector.
  final String? vpcConnectorArn;

  /// The customer-provided VPC connector name.
  final String? vpcConnectorName;

  /// The revision of this VPC connector. It's unique among all the active
  /// connectors (<code>"Status": "ACTIVE"</code>) that share the same
  /// <code>Name</code>.
  /// <note>
  /// At this time, App Runner supports only one revision per name.
  /// </note>
  final int? vpcConnectorRevision;

  VpcConnector({
    this.createdAt,
    this.deletedAt,
    this.securityGroups,
    this.status,
    this.subnets,
    this.vpcConnectorArn,
    this.vpcConnectorName,
    this.vpcConnectorRevision,
  });

  factory VpcConnector.fromJson(Map<String, dynamic> json) {
    return VpcConnector(
      createdAt: timeStampFromJson(json['CreatedAt']),
      deletedAt: timeStampFromJson(json['DeletedAt']),
      securityGroups: (json['SecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.toVpcConnectorStatus(),
      subnets: (json['Subnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcConnectorArn: json['VpcConnectorArn'] as String?,
      vpcConnectorName: json['VpcConnectorName'] as String?,
      vpcConnectorRevision: json['VpcConnectorRevision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deletedAt = this.deletedAt;
    final securityGroups = this.securityGroups;
    final status = this.status;
    final subnets = this.subnets;
    final vpcConnectorArn = this.vpcConnectorArn;
    final vpcConnectorName = this.vpcConnectorName;
    final vpcConnectorRevision = this.vpcConnectorRevision;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (deletedAt != null) 'DeletedAt': unixTimestampToJson(deletedAt),
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (status != null) 'Status': status.toValue(),
      if (subnets != null) 'Subnets': subnets,
      if (vpcConnectorArn != null) 'VpcConnectorArn': vpcConnectorArn,
      if (vpcConnectorName != null) 'VpcConnectorName': vpcConnectorName,
      if (vpcConnectorRevision != null)
        'VpcConnectorRevision': vpcConnectorRevision,
    };
  }
}

enum VpcConnectorStatus {
  active,
  inactive,
}

extension VpcConnectorStatusValueExtension on VpcConnectorStatus {
  String toValue() {
    switch (this) {
      case VpcConnectorStatus.active:
        return 'ACTIVE';
      case VpcConnectorStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension VpcConnectorStatusFromString on String {
  VpcConnectorStatus toVpcConnectorStatus() {
    switch (this) {
      case 'ACTIVE':
        return VpcConnectorStatus.active;
      case 'INACTIVE':
        return VpcConnectorStatus.inactive;
    }
    throw Exception('$this is not known in enum VpcConnectorStatus');
  }
}

/// DNS Target record for a custom domain of this Amazon VPC.
class VpcDNSTarget {
  /// The domain name of your target DNS that is associated with the Amazon VPC.
  final String? domainName;

  /// The ID of the Amazon VPC that is associated with the custom domain name of
  /// the target DNS.
  final String? vpcId;

  /// The Amazon Resource Name (ARN) of the VPC Ingress Connection that is
  /// associated with your service.
  final String? vpcIngressConnectionArn;

  VpcDNSTarget({
    this.domainName,
    this.vpcId,
    this.vpcIngressConnectionArn,
  });

  factory VpcDNSTarget.fromJson(Map<String, dynamic> json) {
    return VpcDNSTarget(
      domainName: json['DomainName'] as String?,
      vpcId: json['VpcId'] as String?,
      vpcIngressConnectionArn: json['VpcIngressConnectionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final vpcId = this.vpcId;
    final vpcIngressConnectionArn = this.vpcIngressConnectionArn;
    return {
      if (domainName != null) 'DomainName': domainName,
      if (vpcId != null) 'VpcId': vpcId,
      if (vpcIngressConnectionArn != null)
        'VpcIngressConnectionArn': vpcIngressConnectionArn,
    };
  }
}

/// The App Runner resource that specifies an App Runner endpoint for incoming
/// traffic. It establishes a connection between a VPC interface endpoint and a
/// App Runner service, to make your App Runner service accessible from only
/// within an Amazon VPC.
class VpcIngressConnection {
  /// The Account Id you use to create the VPC Ingress Connection resource.
  final String? accountId;

  /// The time when the VPC Ingress Connection was created. It's in the Unix time
  /// stamp format.
  ///
  /// <ul>
  /// <li>
  /// Type: Timestamp
  /// </li>
  /// <li>
  /// Required: Yes
  /// </li>
  /// </ul>
  final DateTime? createdAt;

  /// The time when the App Runner service was deleted. It's in the Unix time
  /// stamp format.
  ///
  /// <ul>
  /// <li>
  /// Type: Timestamp
  /// </li>
  /// <li>
  /// Required: No
  /// </li>
  /// </ul>
  final DateTime? deletedAt;

  /// The domain name associated with the VPC Ingress Connection resource.
  final String? domainName;

  /// Specifications for the customer’s VPC and related PrivateLink VPC endpoint
  /// that are used to associate with the VPC Ingress Connection resource.
  final IngressVpcConfiguration? ingressVpcConfiguration;

  /// The Amazon Resource Name (ARN) of the service associated with the VPC
  /// Ingress Connection.
  final String? serviceArn;

  /// The current status of the VPC Ingress Connection. The VPC Ingress Connection
  /// displays one of the following statuses: <code>AVAILABLE</code>,
  /// <code>PENDING_CREATION</code>, <code>PENDING_UPDATE</code>,
  /// <code>PENDING_DELETION</code>,<code>FAILED_CREATION</code>,
  /// <code>FAILED_UPDATE</code>, <code>FAILED_DELETION</code>, and
  /// <code>DELETED</code>..
  final VpcIngressConnectionStatus? status;

  /// The Amazon Resource Name (ARN) of the VPC Ingress Connection.
  final String? vpcIngressConnectionArn;

  /// The customer-provided VPC Ingress Connection name.
  final String? vpcIngressConnectionName;

  VpcIngressConnection({
    this.accountId,
    this.createdAt,
    this.deletedAt,
    this.domainName,
    this.ingressVpcConfiguration,
    this.serviceArn,
    this.status,
    this.vpcIngressConnectionArn,
    this.vpcIngressConnectionName,
  });

  factory VpcIngressConnection.fromJson(Map<String, dynamic> json) {
    return VpcIngressConnection(
      accountId: json['AccountId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      deletedAt: timeStampFromJson(json['DeletedAt']),
      domainName: json['DomainName'] as String?,
      ingressVpcConfiguration: json['IngressVpcConfiguration'] != null
          ? IngressVpcConfiguration.fromJson(
              json['IngressVpcConfiguration'] as Map<String, dynamic>)
          : null,
      serviceArn: json['ServiceArn'] as String?,
      status: (json['Status'] as String?)?.toVpcIngressConnectionStatus(),
      vpcIngressConnectionArn: json['VpcIngressConnectionArn'] as String?,
      vpcIngressConnectionName: json['VpcIngressConnectionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final createdAt = this.createdAt;
    final deletedAt = this.deletedAt;
    final domainName = this.domainName;
    final ingressVpcConfiguration = this.ingressVpcConfiguration;
    final serviceArn = this.serviceArn;
    final status = this.status;
    final vpcIngressConnectionArn = this.vpcIngressConnectionArn;
    final vpcIngressConnectionName = this.vpcIngressConnectionName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (deletedAt != null) 'DeletedAt': unixTimestampToJson(deletedAt),
      if (domainName != null) 'DomainName': domainName,
      if (ingressVpcConfiguration != null)
        'IngressVpcConfiguration': ingressVpcConfiguration,
      if (serviceArn != null) 'ServiceArn': serviceArn,
      if (status != null) 'Status': status.toValue(),
      if (vpcIngressConnectionArn != null)
        'VpcIngressConnectionArn': vpcIngressConnectionArn,
      if (vpcIngressConnectionName != null)
        'VpcIngressConnectionName': vpcIngressConnectionName,
    };
  }
}

enum VpcIngressConnectionStatus {
  available,
  pendingCreation,
  pendingUpdate,
  pendingDeletion,
  failedCreation,
  failedUpdate,
  failedDeletion,
  deleted,
}

extension VpcIngressConnectionStatusValueExtension
    on VpcIngressConnectionStatus {
  String toValue() {
    switch (this) {
      case VpcIngressConnectionStatus.available:
        return 'AVAILABLE';
      case VpcIngressConnectionStatus.pendingCreation:
        return 'PENDING_CREATION';
      case VpcIngressConnectionStatus.pendingUpdate:
        return 'PENDING_UPDATE';
      case VpcIngressConnectionStatus.pendingDeletion:
        return 'PENDING_DELETION';
      case VpcIngressConnectionStatus.failedCreation:
        return 'FAILED_CREATION';
      case VpcIngressConnectionStatus.failedUpdate:
        return 'FAILED_UPDATE';
      case VpcIngressConnectionStatus.failedDeletion:
        return 'FAILED_DELETION';
      case VpcIngressConnectionStatus.deleted:
        return 'DELETED';
    }
  }
}

extension VpcIngressConnectionStatusFromString on String {
  VpcIngressConnectionStatus toVpcIngressConnectionStatus() {
    switch (this) {
      case 'AVAILABLE':
        return VpcIngressConnectionStatus.available;
      case 'PENDING_CREATION':
        return VpcIngressConnectionStatus.pendingCreation;
      case 'PENDING_UPDATE':
        return VpcIngressConnectionStatus.pendingUpdate;
      case 'PENDING_DELETION':
        return VpcIngressConnectionStatus.pendingDeletion;
      case 'FAILED_CREATION':
        return VpcIngressConnectionStatus.failedCreation;
      case 'FAILED_UPDATE':
        return VpcIngressConnectionStatus.failedUpdate;
      case 'FAILED_DELETION':
        return VpcIngressConnectionStatus.failedDeletion;
      case 'DELETED':
        return VpcIngressConnectionStatus.deleted;
    }
    throw Exception('$this is not known in enum VpcIngressConnectionStatus');
  }
}

/// Provides summary information about an VPC Ingress Connection, which includes
/// its VPC Ingress Connection ARN and its associated Service ARN.
class VpcIngressConnectionSummary {
  /// The Amazon Resource Name (ARN) of the service associated with the VPC
  /// Ingress Connection.
  final String? serviceArn;

  /// The Amazon Resource Name (ARN) of the VPC Ingress Connection.
  final String? vpcIngressConnectionArn;

  VpcIngressConnectionSummary({
    this.serviceArn,
    this.vpcIngressConnectionArn,
  });

  factory VpcIngressConnectionSummary.fromJson(Map<String, dynamic> json) {
    return VpcIngressConnectionSummary(
      serviceArn: json['ServiceArn'] as String?,
      vpcIngressConnectionArn: json['VpcIngressConnectionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceArn = this.serviceArn;
    final vpcIngressConnectionArn = this.vpcIngressConnectionArn;
    return {
      if (serviceArn != null) 'ServiceArn': serviceArn,
      if (vpcIngressConnectionArn != null)
        'VpcIngressConnectionArn': vpcIngressConnectionArn,
    };
  }
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidStateException': (type, message) =>
      InvalidStateException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
};
