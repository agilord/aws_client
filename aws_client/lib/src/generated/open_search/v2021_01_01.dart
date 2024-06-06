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

/// Use the Amazon OpenSearch Service configuration API to create, configure,
/// and manage OpenSearch Service domains. The endpoint for configuration
/// service requests is Region specific: es.<i>region</i>.amazonaws.com. For
/// example, es.us-east-1.amazonaws.com. For a current list of supported Regions
/// and endpoints, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#service-regions">Amazon
/// Web Services service endpoints</a>.
class OpenSearch {
  final _s.RestJsonProtocol _protocol;
  OpenSearch({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'es',
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

  /// Allows the destination Amazon OpenSearch Service domain owner to accept an
  /// inbound cross-cluster search connection request. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cross-cluster-search.html">Cross-cluster
  /// search for Amazon OpenSearch Service</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the inbound connection to accept.
  Future<AcceptInboundConnectionResponse> acceptInboundConnection({
    required String connectionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2021-01-01/opensearch/cc/inboundConnection/${Uri.encodeComponent(connectionId)}/accept',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptInboundConnectionResponse.fromJson(response);
  }

  /// Creates a new direct-query data source to the specified domain. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/direct-query-s3-creating.html">Creating
  /// Amazon OpenSearch Service data source integrations with Amazon S3</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  /// May throw [DependencyFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [dataSourceType] :
  /// The type of data source.
  ///
  /// Parameter [domainName] :
  /// The name of the domain to add the data source to.
  ///
  /// Parameter [name] :
  /// A name for the data source.
  ///
  /// Parameter [description] :
  /// A description of the data source.
  Future<AddDataSourceResponse> addDataSource({
    required DataSourceType dataSourceType,
    required String domainName,
    required String name,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'DataSourceType': dataSourceType,
      'Name': name,
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/dataSource',
      exceptionFnMap: _exceptionFns,
    );
    return AddDataSourceResponse.fromJson(response);
  }

  /// Attaches tags to an existing Amazon OpenSearch Service domain. Tags are a
  /// set of case-sensitive key-value pairs. A domain can have up to 10 tags.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-awsresourcetagging.html">Tagging
  /// Amazon OpenSearch Service domains</a>.
  ///
  /// May throw [BaseException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [arn] :
  /// Amazon Resource Name (ARN) for the OpenSearch Service domain to which you
  /// want to attach resource tags.
  ///
  /// Parameter [tagList] :
  /// List of resource tags.
  Future<void> addTags({
    required String arn,
    required List<Tag> tagList,
  }) async {
    final $payload = <String, dynamic>{
      'ARN': arn,
      'TagList': tagList,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/tags',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a package with an Amazon OpenSearch Service domain. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/custom-packages.html">Custom
  /// packages for Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [domainName] :
  /// Name of the domain to associate the package with.
  ///
  /// Parameter [packageID] :
  /// Internal ID of the package to associate with a domain. Use
  /// <code>DescribePackages</code> to find this value.
  Future<AssociatePackageResponse> associatePackage({
    required String domainName,
    required String packageID,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2021-01-01/packages/associate/${Uri.encodeComponent(packageID)}/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return AssociatePackageResponse.fromJson(response);
  }

  /// Provides access to an Amazon OpenSearch Service domain through the use of
  /// an interface VPC endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  /// May throw [BaseException].
  ///
  /// Parameter [account] :
  /// The Amazon Web Services account ID to grant access to.
  ///
  /// Parameter [domainName] :
  /// The name of the OpenSearch Service domain to provide access to.
  Future<AuthorizeVpcEndpointAccessResponse> authorizeVpcEndpointAccess({
    required String account,
    required String domainName,
  }) async {
    final $payload = <String, dynamic>{
      'Account': account,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/authorizeVpcEndpointAccess',
      exceptionFnMap: _exceptionFns,
    );
    return AuthorizeVpcEndpointAccessResponse.fromJson(response);
  }

  /// Cancels a pending configuration change on an Amazon OpenSearch Service
  /// domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [dryRun] :
  /// When set to <code>True</code>, returns the list of change IDs and
  /// properties that will be cancelled without actually cancelling the change.
  Future<CancelDomainConfigChangeResponse> cancelDomainConfigChange({
    required String domainName,
    bool? dryRun,
  }) async {
    final $payload = <String, dynamic>{
      if (dryRun != null) 'DryRun': dryRun,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/config/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelDomainConfigChangeResponse.fromJson(response);
  }

  /// Cancels a scheduled service software update for an Amazon OpenSearch
  /// Service domain. You can only perform this operation before the
  /// <code>AutomatedUpdateDate</code> and when the domain's
  /// <code>UpdateStatus</code> is <code>PENDING_UPDATE</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/service-software.html">Service
  /// software updates in Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// Name of the OpenSearch Service domain that you want to cancel the service
  /// software update on.
  Future<CancelServiceSoftwareUpdateResponse> cancelServiceSoftwareUpdate({
    required String domainName,
  }) async {
    final $payload = <String, dynamic>{
      'DomainName': domainName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/serviceSoftwareUpdate/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelServiceSoftwareUpdateResponse.fromJson(response);
  }

  /// Creates an Amazon OpenSearch Service domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html">Creating
  /// and managing Amazon OpenSearch Service domains</a>.
  ///
  /// May throw [BaseException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// Name of the OpenSearch Service domain to create. Domain names are unique
  /// across the domains owned by an account within an Amazon Web Services
  /// Region.
  ///
  /// Parameter [accessPolicies] :
  /// Identity and Access Management (IAM) policy document specifying the access
  /// policies for the new domain.
  ///
  /// Parameter [advancedOptions] :
  /// Key-value pairs to specify advanced configuration options. The following
  /// key-value pairs are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>"rest.action.multi.allow_explicit_index": "true" | "false"</code> -
  /// Note the use of a string rather than a boolean. Specifies whether explicit
  /// references to indexes are allowed inside the body of HTTP requests. If you
  /// want to configure access policies for domain sub-resources, such as
  /// specific indexes and domain APIs, you must disable this property. Default
  /// is true.
  /// </li>
  /// <li>
  /// <code>"indices.fielddata.cache.size": "80" </code> - Note the use of a
  /// string rather than a boolean. Specifies the percentage of heap space
  /// allocated to field data. Default is unbounded.
  /// </li>
  /// <li>
  /// <code>"indices.query.bool.max_clause_count": "1024"</code> - Note the use
  /// of a string rather than a boolean. Specifies the maximum number of clauses
  /// allowed in a Lucene boolean query. Default is 1,024. Queries with more
  /// than the permitted number of clauses result in a
  /// <code>TooManyClauses</code> error.
  /// </li>
  /// <li>
  /// <code>"override_main_response_version": "true" | "false"</code> - Note the
  /// use of a string rather than a boolean. Specifies whether the domain
  /// reports its version as 7.10 to allow Elasticsearch OSS clients and plugins
  /// to continue working with it. Default is false when creating a domain and
  /// true when upgrading a domain.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-advanced-options">Advanced
  /// cluster parameters</a>.
  ///
  /// Parameter [advancedSecurityOptions] :
  /// Options for fine-grained access control.
  ///
  /// Parameter [autoTuneOptions] :
  /// Options for Auto-Tune.
  ///
  /// Parameter [clusterConfig] :
  /// Container for the cluster configuration of a domain.
  ///
  /// Parameter [cognitoOptions] :
  /// Key-value pairs to configure Amazon Cognito authentication. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cognito-auth.html">Configuring
  /// Amazon Cognito authentication for OpenSearch Dashboards</a>.
  ///
  /// Parameter [domainEndpointOptions] :
  /// Additional options for the domain endpoint, such as whether to require
  /// HTTPS for all traffic.
  ///
  /// Parameter [eBSOptions] :
  /// Container for the parameters required to enable EBS-based storage for an
  /// OpenSearch Service domain.
  ///
  /// Parameter [encryptionAtRestOptions] :
  /// Key-value pairs to enable encryption at rest.
  ///
  /// Parameter [engineVersion] :
  /// String of format Elasticsearch_X.Y or OpenSearch_X.Y to specify the engine
  /// version for the OpenSearch Service domain. For example,
  /// <code>OpenSearch_1.0</code> or <code>Elasticsearch_7.9</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomains">Creating
  /// and managing Amazon OpenSearch Service domains</a>.
  ///
  /// Parameter [iPAddressType] :
  /// Specify either dual stack or IPv4 as your IP address type. Dual stack
  /// allows you to share domain resources across IPv4 and IPv6 address types,
  /// and is the recommended option. If you set your IP address type to dual
  /// stack, you can't change your address type later.
  ///
  /// Parameter [logPublishingOptions] :
  /// Key-value pairs to configure log publishing.
  ///
  /// Parameter [nodeToNodeEncryptionOptions] :
  /// Enables node-to-node encryption.
  ///
  /// Parameter [offPeakWindowOptions] :
  /// Specifies a daily 10-hour time block during which OpenSearch Service can
  /// perform configuration changes on the domain, including service software
  /// updates and Auto-Tune enhancements that require a blue/green deployment.
  /// If no options are specified, the default start time of 10:00 P.M. local
  /// time (for the Region that the domain is created in) is used.
  ///
  /// Parameter [snapshotOptions] :
  /// DEPRECATED. Container for the parameters required to configure automated
  /// snapshots of domain indexes.
  ///
  /// Parameter [softwareUpdateOptions] :
  /// Software update options for the domain.
  ///
  /// Parameter [tagList] :
  /// List of tags to add to the domain upon creation.
  ///
  /// Parameter [vPCOptions] :
  /// Container for the values required to configure VPC access domains. If you
  /// don't specify these values, OpenSearch Service creates the domain with a
  /// public endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html">Launching
  /// your Amazon OpenSearch Service domains using a VPC</a>.
  Future<CreateDomainResponse> createDomain({
    required String domainName,
    String? accessPolicies,
    Map<String, String>? advancedOptions,
    AdvancedSecurityOptionsInput? advancedSecurityOptions,
    AutoTuneOptionsInput? autoTuneOptions,
    ClusterConfig? clusterConfig,
    CognitoOptions? cognitoOptions,
    DomainEndpointOptions? domainEndpointOptions,
    EBSOptions? eBSOptions,
    EncryptionAtRestOptions? encryptionAtRestOptions,
    String? engineVersion,
    IPAddressType? iPAddressType,
    Map<LogType, LogPublishingOption>? logPublishingOptions,
    NodeToNodeEncryptionOptions? nodeToNodeEncryptionOptions,
    OffPeakWindowOptions? offPeakWindowOptions,
    SnapshotOptions? snapshotOptions,
    SoftwareUpdateOptions? softwareUpdateOptions,
    List<Tag>? tagList,
    VPCOptions? vPCOptions,
  }) async {
    final $payload = <String, dynamic>{
      'DomainName': domainName,
      if (accessPolicies != null) 'AccessPolicies': accessPolicies,
      if (advancedOptions != null) 'AdvancedOptions': advancedOptions,
      if (advancedSecurityOptions != null)
        'AdvancedSecurityOptions': advancedSecurityOptions,
      if (autoTuneOptions != null) 'AutoTuneOptions': autoTuneOptions,
      if (clusterConfig != null) 'ClusterConfig': clusterConfig,
      if (cognitoOptions != null) 'CognitoOptions': cognitoOptions,
      if (domainEndpointOptions != null)
        'DomainEndpointOptions': domainEndpointOptions,
      if (eBSOptions != null) 'EBSOptions': eBSOptions,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iPAddressType != null) 'IPAddressType': iPAddressType.toValue(),
      if (logPublishingOptions != null)
        'LogPublishingOptions':
            logPublishingOptions.map((k, e) => MapEntry(k.toValue(), e)),
      if (nodeToNodeEncryptionOptions != null)
        'NodeToNodeEncryptionOptions': nodeToNodeEncryptionOptions,
      if (offPeakWindowOptions != null)
        'OffPeakWindowOptions': offPeakWindowOptions,
      if (snapshotOptions != null) 'SnapshotOptions': snapshotOptions,
      if (softwareUpdateOptions != null)
        'SoftwareUpdateOptions': softwareUpdateOptions,
      if (tagList != null) 'TagList': tagList,
      if (vPCOptions != null) 'VPCOptions': vPCOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/domain',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainResponse.fromJson(response);
  }

  /// Creates a new cross-cluster search connection from a source Amazon
  /// OpenSearch Service domain to a destination domain. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cross-cluster-search.html">Cross-cluster
  /// search for Amazon OpenSearch Service</a>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionAlias] :
  /// Name of the connection.
  ///
  /// Parameter [localDomainInfo] :
  /// Name and Region of the source (local) domain.
  ///
  /// Parameter [remoteDomainInfo] :
  /// Name and Region of the destination (remote) domain.
  ///
  /// Parameter [connectionMode] :
  /// The connection mode.
  ///
  /// Parameter [connectionProperties] :
  /// The <code>ConnectionProperties</code> for the outbound connection.
  Future<CreateOutboundConnectionResponse> createOutboundConnection({
    required String connectionAlias,
    required DomainInformationContainer localDomainInfo,
    required DomainInformationContainer remoteDomainInfo,
    ConnectionMode? connectionMode,
    ConnectionProperties? connectionProperties,
  }) async {
    final $payload = <String, dynamic>{
      'ConnectionAlias': connectionAlias,
      'LocalDomainInfo': localDomainInfo,
      'RemoteDomainInfo': remoteDomainInfo,
      if (connectionMode != null) 'ConnectionMode': connectionMode.toValue(),
      if (connectionProperties != null)
        'ConnectionProperties': connectionProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/cc/outboundConnection',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOutboundConnectionResponse.fromJson(response);
  }

  /// Creates a package for use with Amazon OpenSearch Service domains. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/custom-packages.html">Custom
  /// packages for Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageName] :
  /// Unique name for the package.
  ///
  /// Parameter [packageSource] :
  /// The Amazon S3 location from which to import the package.
  ///
  /// Parameter [packageType] :
  /// The type of package.
  ///
  /// Parameter [packageDescription] :
  /// Description of the package.
  Future<CreatePackageResponse> createPackage({
    required String packageName,
    required PackageSource packageSource,
    required PackageType packageType,
    String? packageDescription,
  }) async {
    final $payload = <String, dynamic>{
      'PackageName': packageName,
      'PackageSource': packageSource,
      'PackageType': packageType.toValue(),
      if (packageDescription != null) 'PackageDescription': packageDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/packages',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePackageResponse.fromJson(response);
  }

  /// Creates an Amazon OpenSearch Service-managed VPC endpoint.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  /// May throw [DisabledOperationException].
  /// May throw [BaseException].
  ///
  /// Parameter [domainArn] :
  /// The Amazon Resource Name (ARN) of the domain to create the endpoint for.
  ///
  /// Parameter [vpcOptions] :
  /// Options to specify the subnets and security groups for the endpoint.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier to ensure idempotency of the request.
  Future<CreateVpcEndpointResponse> createVpcEndpoint({
    required String domainArn,
    required VPCOptions vpcOptions,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'DomainArn': domainArn,
      'VpcOptions': vpcOptions,
      if (clientToken != null) 'ClientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/vpcEndpoints',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVpcEndpointResponse.fromJson(response);
  }

  /// Deletes a direct-query data source. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/direct-query-s3-delete.html">Deleting
  /// an Amazon OpenSearch Service data source with Amazon S3</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  /// May throw [DependencyFailureException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [name] :
  /// The name of the data source to delete.
  Future<DeleteDataSourceResponse> deleteDataSource({
    required String domainName,
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/dataSource/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataSourceResponse.fromJson(response);
  }

  /// Deletes an Amazon OpenSearch Service domain and all of its data. You can't
  /// recover a domain after you delete it.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain you want to permanently delete.
  Future<DeleteDomainResponse> deleteDomain({
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainResponse.fromJson(response);
  }

  /// Allows the destination Amazon OpenSearch Service domain owner to delete an
  /// existing inbound cross-cluster search connection. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cross-cluster-search.html">Cross-cluster
  /// search for Amazon OpenSearch Service</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the inbound connection to permanently delete.
  Future<DeleteInboundConnectionResponse> deleteInboundConnection({
    required String connectionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2021-01-01/opensearch/cc/inboundConnection/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInboundConnectionResponse.fromJson(response);
  }

  /// Allows the source Amazon OpenSearch Service domain owner to delete an
  /// existing outbound cross-cluster search connection. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cross-cluster-search.html">Cross-cluster
  /// search for Amazon OpenSearch Service</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the outbound connection you want to permanently delete.
  Future<DeleteOutboundConnectionResponse> deleteOutboundConnection({
    required String connectionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2021-01-01/opensearch/cc/outboundConnection/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteOutboundConnectionResponse.fromJson(response);
  }

  /// Deletes an Amazon OpenSearch Service package. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/custom-packages.html">Custom
  /// packages for Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [packageID] :
  /// The internal ID of the package you want to delete. Use
  /// <code>DescribePackages</code> to find this value.
  Future<DeletePackageResponse> deletePackage({
    required String packageID,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2021-01-01/packages/${Uri.encodeComponent(packageID)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePackageResponse.fromJson(response);
  }

  /// Deletes an Amazon OpenSearch Service-managed interface VPC endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [BaseException].
  ///
  /// Parameter [vpcEndpointId] :
  /// The unique identifier of the endpoint.
  Future<DeleteVpcEndpointResponse> deleteVpcEndpoint({
    required String vpcEndpointId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2021-01-01/opensearch/vpcEndpoints/${Uri.encodeComponent(vpcEndpointId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteVpcEndpointResponse.fromJson(response);
  }

  /// Describes the domain configuration for the specified Amazon OpenSearch
  /// Service domain, including the domain ID, domain service endpoint, and
  /// domain ARN.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want information about.
  Future<DescribeDomainResponse> describeDomain({
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainResponse.fromJson(response);
  }

  /// Returns the list of optimizations that Auto-Tune has made to an Amazon
  /// OpenSearch Service domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html">Auto-Tune
  /// for Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// Name of the domain that you want Auto-Tune details about.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>DescribeDomainAutoTunes</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>DescribeDomainAutoTunes</code>
  /// operations, which returns results in the next page.
  Future<DescribeDomainAutoTunesResponse> describeDomainAutoTunes({
    required String domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/autoTunes',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainAutoTunesResponse.fromJson(response);
  }

  /// Returns information about the current blue/green deployment happening on
  /// an Amazon OpenSearch Service domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-configuration-changes.html">Making
  /// configuration changes in Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain to get progress information for.
  ///
  /// Parameter [changeId] :
  /// The specific change ID for which you want to get progress information. If
  /// omitted, the request returns information about the most recent
  /// configuration change.
  Future<DescribeDomainChangeProgressResponse> describeDomainChangeProgress({
    required String domainName,
    String? changeId,
  }) async {
    final $query = <String, List<String>>{
      if (changeId != null) 'changeid': [changeId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/progress',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainChangeProgressResponse.fromJson(response);
  }

  /// Returns the configuration of an Amazon OpenSearch Service domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// Name of the OpenSearch Service domain configuration that you want to
  /// describe.
  Future<DescribeDomainConfigResponse> describeDomainConfig({
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/config',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainConfigResponse.fromJson(response);
  }

  /// Returns information about domain and node health, the standby Availability
  /// Zone, number of nodes per Availability Zone, and shard count per node.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  Future<DescribeDomainHealthResponse> describeDomainHealth({
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/health',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainHealthResponse.fromJson(response);
  }

  /// Returns information about domain and nodes, including data nodes, master
  /// nodes, ultrawarm nodes, Availability Zone(s), standby nodes, node
  /// configurations, and node states.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  /// May throw [DependencyFailureException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  Future<DescribeDomainNodesResponse> describeDomainNodes({
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/nodes',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainNodesResponse.fromJson(response);
  }

  /// Returns domain configuration information about the specified Amazon
  /// OpenSearch Service domains.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainNames] :
  /// Array of OpenSearch Service domain names that you want information about.
  /// You must specify at least one domain name.
  Future<DescribeDomainsResponse> describeDomains({
    required List<String> domainNames,
  }) async {
    final $payload = <String, dynamic>{
      'DomainNames': domainNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/domain-info',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainsResponse.fromJson(response);
  }

  /// Describes the progress of a pre-update dry run analysis on an Amazon
  /// OpenSearch Service domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-configuration-changes#dryrun">Determining
  /// whether a change will cause a blue/green deployment</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [dryRunId] :
  /// The unique identifier of the dry run.
  ///
  /// Parameter [loadDryRunConfig] :
  /// Whether to include the configuration of the dry run in the response. The
  /// configuration specifies the updates that you're planning to make on the
  /// domain.
  Future<DescribeDryRunProgressResponse> describeDryRunProgress({
    required String domainName,
    String? dryRunId,
    bool? loadDryRunConfig,
  }) async {
    final $query = <String, List<String>>{
      if (dryRunId != null) 'dryRunId': [dryRunId],
      if (loadDryRunConfig != null)
        'loadDryRunConfig': [loadDryRunConfig.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/dryRun',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDryRunProgressResponse.fromJson(response);
  }

  /// Lists all the inbound cross-cluster search connections for a destination
  /// (remote) Amazon OpenSearch Service domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cross-cluster-search.html">Cross-cluster
  /// search for Amazon OpenSearch Service</a>.
  ///
  /// May throw [InvalidPaginationTokenException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [filters] :
  /// A list of filters used to match properties for inbound cross-cluster
  /// connections.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>DescribeInboundConnections</code> operation returns
  /// a <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent
  /// <code>DescribeInboundConnections</code> operations, which returns results
  /// in the next page.
  Future<DescribeInboundConnectionsResponse> describeInboundConnections({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/cc/inboundConnection/search',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInboundConnectionsResponse.fromJson(response);
  }

  /// Describes the instance count, storage, and master node limits for a given
  /// OpenSearch or Elasticsearch version and instance type.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [engineVersion] :
  /// Version of OpenSearch or Elasticsearch, in the format Elasticsearch_X.Y or
  /// OpenSearch_X.Y. Defaults to the latest version of OpenSearch.
  ///
  /// Parameter [instanceType] :
  /// The OpenSearch Service instance type for which you need limit information.
  ///
  /// Parameter [domainName] :
  /// The name of the domain. Only specify if you need the limits for an
  /// existing domain.
  Future<DescribeInstanceTypeLimitsResponse> describeInstanceTypeLimits({
    required String engineVersion,
    required OpenSearchPartitionInstanceType instanceType,
    String? domainName,
  }) async {
    final $query = <String, List<String>>{
      if (domainName != null) 'domainName': [domainName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/instanceTypeLimits/${Uri.encodeComponent(engineVersion)}/${Uri.encodeComponent(instanceType.toValue())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInstanceTypeLimitsResponse.fromJson(response);
  }

  /// Lists all the outbound cross-cluster connections for a local (source)
  /// Amazon OpenSearch Service domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cross-cluster-search.html">Cross-cluster
  /// search for Amazon OpenSearch Service</a>.
  ///
  /// May throw [InvalidPaginationTokenException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [filters] :
  /// List of filter names and values that you can use for requests.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>DescribeOutboundConnections</code> operation returns
  /// a <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent
  /// <code>DescribeOutboundConnections</code> operations, which returns results
  /// in the next page.
  Future<DescribeOutboundConnectionsResponse> describeOutboundConnections({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/cc/outboundConnection/search',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOutboundConnectionsResponse.fromJson(response);
  }

  /// Describes all packages available to OpenSearch Service. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/custom-packages.html">Custom
  /// packages for Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Only returns packages that match the
  /// <code>DescribePackagesFilterList</code> values.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>DescribePackageFilters</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>DescribePackageFilters</code>
  /// operations, which returns results in the next page.
  Future<DescribePackagesResponse> describePackages({
    List<DescribePackagesFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/packages/describe',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackagesResponse.fromJson(response);
  }

  /// Describes the available Amazon OpenSearch Service Reserved Instance
  /// offerings for a given Region. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/ri.html">Reserved
  /// Instances in Amazon OpenSearch Service</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>DescribeReservedInstanceOfferings</code> operation
  /// returns a <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent
  /// <code>DescribeReservedInstanceOfferings</code> operations, which returns
  /// results in the next page.
  ///
  /// Parameter [reservedInstanceOfferingId] :
  /// The Reserved Instance identifier filter value. Use this parameter to show
  /// only the available instance types that match the specified reservation
  /// identifier.
  Future<DescribeReservedInstanceOfferingsResponse>
      describeReservedInstanceOfferings({
    int? maxResults,
    String? nextToken,
    String? reservedInstanceOfferingId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (reservedInstanceOfferingId != null)
        'offeringId': [reservedInstanceOfferingId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2021-01-01/opensearch/reservedInstanceOfferings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReservedInstanceOfferingsResponse.fromJson(response);
  }

  /// Describes the Amazon OpenSearch Service instances that you have reserved
  /// in a given Region. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/ri.html">Reserved
  /// Instances in Amazon OpenSearch Service</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>DescribeReservedInstances</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent
  /// <code>DescribeReservedInstances</code> operations, which returns results
  /// in the next page.
  ///
  /// Parameter [reservedInstanceId] :
  /// The reserved instance identifier filter value. Use this parameter to show
  /// only the reservation that matches the specified reserved OpenSearch
  /// instance ID.
  Future<DescribeReservedInstancesResponse> describeReservedInstances({
    int? maxResults,
    String? nextToken,
    String? reservedInstanceId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (reservedInstanceId != null) 'reservationId': [reservedInstanceId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2021-01-01/opensearch/reservedInstances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReservedInstancesResponse.fromJson(response);
  }

  /// Describes one or more Amazon OpenSearch Service-managed VPC endpoints.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalException].
  /// May throw [DisabledOperationException].
  /// May throw [BaseException].
  ///
  /// Parameter [vpcEndpointIds] :
  /// The unique identifiers of the endpoints to get information about.
  Future<DescribeVpcEndpointsResponse> describeVpcEndpoints({
    required List<String> vpcEndpointIds,
  }) async {
    final $payload = <String, dynamic>{
      'VpcEndpointIds': vpcEndpointIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/vpcEndpoints/describe',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVpcEndpointsResponse.fromJson(response);
  }

  /// Removes a package from the specified Amazon OpenSearch Service domain. The
  /// package can't be in use with any OpenSearch index for the dissociation to
  /// succeed. The package is still available in OpenSearch Service for
  /// association later. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/custom-packages.html">Custom
  /// packages for Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [domainName] :
  /// Name of the domain to dissociate the package from.
  ///
  /// Parameter [packageID] :
  /// Internal ID of the package to dissociate from the domain. Use
  /// <code>ListPackagesForDomain</code> to find this value.
  Future<DissociatePackageResponse> dissociatePackage({
    required String domainName,
    required String packageID,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2021-01-01/packages/dissociate/${Uri.encodeComponent(packageID)}/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DissociatePackageResponse.fromJson(response);
  }

  /// Returns a map of OpenSearch or Elasticsearch versions and the versions you
  /// can upgrade them to.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [domainName] :
  /// The name of an existing domain. Provide this parameter to limit the
  /// results to a single domain.
  Future<GetCompatibleVersionsResponse> getCompatibleVersions({
    String? domainName,
  }) async {
    final $query = <String, List<String>>{
      if (domainName != null) 'domainName': [domainName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2021-01-01/opensearch/compatibleVersions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCompatibleVersionsResponse.fromJson(response);
  }

  /// Retrieves information about a direct query data source.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  /// May throw [DependencyFailureException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [name] :
  /// The name of the data source to get information about.
  Future<GetDataSourceResponse> getDataSource({
    required String domainName,
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/dataSource/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataSourceResponse.fromJson(response);
  }

  /// The status of the maintenance action.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [maintenanceId] :
  /// The request ID of the maintenance action.
  Future<GetDomainMaintenanceStatusResponse> getDomainMaintenanceStatus({
    required String domainName,
    required String maintenanceId,
  }) async {
    final $query = <String, List<String>>{
      'maintenanceId': [maintenanceId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/domainMaintenance',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainMaintenanceStatusResponse.fromJson(response);
  }

  /// Returns a list of Amazon OpenSearch Service package versions, along with
  /// their creation time, commit message, and plugin properties (if the package
  /// is a zip plugin package). For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/custom-packages.html">Custom
  /// packages for Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageID] :
  /// The unique identifier of the package.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>GetPackageVersionHistory</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>GetPackageVersionHistory</code>
  /// operations, which returns results in the next page.
  Future<GetPackageVersionHistoryResponse> getPackageVersionHistory({
    required String packageID,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/packages/${Uri.encodeComponent(packageID)}/history',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPackageVersionHistoryResponse.fromJson(response);
  }

  /// Retrieves the complete history of the last 10 upgrades performed on an
  /// Amazon OpenSearch Service domain.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [domainName] :
  /// The name of an existing domain.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>GetUpgradeHistory</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>GetUpgradeHistory</code>
  /// operations, which returns results in the next page.
  Future<GetUpgradeHistoryResponse> getUpgradeHistory({
    required String domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/upgradeDomain/${Uri.encodeComponent(domainName)}/history',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetUpgradeHistoryResponse.fromJson(response);
  }

  /// Returns the most recent status of the last upgrade or upgrade eligibility
  /// check performed on an Amazon OpenSearch Service domain.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [domainName] :
  /// The domain of the domain to get upgrade status information for.
  Future<GetUpgradeStatusResponse> getUpgradeStatus({
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/upgradeDomain/${Uri.encodeComponent(domainName)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetUpgradeStatusResponse.fromJson(response);
  }

  /// Lists direct-query data sources for a specific domain. For more
  /// information, see For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/direct-query-s3.html">Working
  /// with Amazon OpenSearch Service direct queries with Amazon S3</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  /// May throw [DependencyFailureException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  Future<ListDataSourcesResponse> listDataSources({
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/dataSource',
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSourcesResponse.fromJson(response);
  }

  /// A list of maintenance actions for the domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [action] :
  /// The name of the action.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListDomainMaintenances</code> operation returns a
  /// <code>nextToken</code>, include the returned <code>nextToken</code> in
  /// subsequent <code>ListDomainMaintenances</code> operations, which returns
  /// results in the next page.
  ///
  /// Parameter [status] :
  /// The status of the action.
  Future<ListDomainMaintenancesResponse> listDomainMaintenances({
    required String domainName,
    MaintenanceType? action,
    int? maxResults,
    String? nextToken,
    MaintenanceStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (action != null) 'action': [action.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/domainMaintenances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainMaintenancesResponse.fromJson(response);
  }

  /// Returns the names of all Amazon OpenSearch Service domains owned by the
  /// current user in the active Region.
  ///
  /// May throw [BaseException].
  /// May throw [ValidationException].
  ///
  /// Parameter [engineType] :
  /// Filters the output by domain engine type.
  Future<ListDomainNamesResponse> listDomainNames({
    EngineType? engineType,
  }) async {
    final $query = <String, List<String>>{
      if (engineType != null) 'engineType': [engineType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2021-01-01/domain',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainNamesResponse.fromJson(response);
  }

  /// Lists all Amazon OpenSearch Service domains associated with a given
  /// package. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/custom-packages.html">Custom
  /// packages for Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageID] :
  /// The unique identifier of the package for which to list associated domains.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListDomainsForPackage</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListDomainsForPackage</code>
  /// operations, which returns results in the next page.
  Future<ListDomainsForPackageResponse> listDomainsForPackage({
    required String packageID,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/packages/${Uri.encodeComponent(packageID)}/domains',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsForPackageResponse.fromJson(response);
  }

  /// Lists all instance types and available features for a given OpenSearch or
  /// Elasticsearch version.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [engineVersion] :
  /// The version of OpenSearch or Elasticsearch, in the format
  /// Elasticsearch_X.Y or OpenSearch_X.Y. Defaults to the latest version of
  /// OpenSearch.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [instanceType] :
  /// An optional parameter that lists information for a given instance type.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListInstanceTypeDetails</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListInstanceTypeDetails</code>
  /// operations, which returns results in the next page.
  ///
  /// Parameter [retrieveAZs] :
  /// An optional parameter that specifies the Availability Zones for the
  /// domain.
  Future<ListInstanceTypeDetailsResponse> listInstanceTypeDetails({
    required String engineVersion,
    String? domainName,
    String? instanceType,
    int? maxResults,
    String? nextToken,
    bool? retrieveAZs,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (domainName != null) 'domainName': [domainName],
      if (instanceType != null) 'instanceType': [instanceType],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (retrieveAZs != null) 'retrieveAZs': [retrieveAZs.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/instanceTypeDetails/${Uri.encodeComponent(engineVersion)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInstanceTypeDetailsResponse.fromJson(response);
  }

  /// Lists all packages associated with an Amazon OpenSearch Service domain.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/custom-packages.html">Custom
  /// packages for Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain for which you want to list associated packages.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListPackagesForDomain</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListPackagesForDomain</code>
  /// operations, which returns results in the next page.
  Future<ListPackagesForDomainResponse> listPackagesForDomain({
    required String domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/domain/${Uri.encodeComponent(domainName)}/packages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackagesForDomainResponse.fromJson(response);
  }

  /// Retrieves a list of configuration changes that are scheduled for a domain.
  /// These changes can be <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/service-software.html">service
  /// software updates</a> or <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html#auto-tune-types">blue/green
  /// Auto-Tune enhancements</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListScheduledActions</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListScheduledActions</code>
  /// operations, which returns results in the next page.
  Future<ListScheduledActionsResponse> listScheduledActions({
    required String domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/scheduledActions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScheduledActionsResponse.fromJson(response);
  }

  /// Returns all resource tags for an Amazon OpenSearch Service domain. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-awsresourcetagging.html">Tagging
  /// Amazon OpenSearch Service domains</a>.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [arn] :
  /// Amazon Resource Name (ARN) for the domain to view tags for.
  Future<ListTagsResponse> listTags({
    required String arn,
  }) async {
    final $query = <String, List<String>>{
      'arn': [arn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2021-01-01/tags/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsResponse.fromJson(response);
  }

  /// Lists all versions of OpenSearch and Elasticsearch that Amazon OpenSearch
  /// Service supports.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListVersions</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListVersions</code> operations,
  /// which returns results in the next page.
  Future<ListVersionsResponse> listVersions({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2021-01-01/opensearch/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVersionsResponse.fromJson(response);
  }

  /// Retrieves information about each Amazon Web Services principal that is
  /// allowed to access a given Amazon OpenSearch Service domain through the use
  /// of an interface VPC endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [BaseException].
  ///
  /// Parameter [domainName] :
  /// The name of the OpenSearch Service domain to retrieve access information
  /// for.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListVpcEndpointAccess</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListVpcEndpointAccess</code>
  /// operations, which returns results in the next page.
  Future<ListVpcEndpointAccessResponse> listVpcEndpointAccess({
    required String domainName,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/listVpcEndpointAccess',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVpcEndpointAccessResponse.fromJson(response);
  }

  /// Retrieves all Amazon OpenSearch Service-managed VPC endpoints in the
  /// current Amazon Web Services account and Region.
  ///
  /// May throw [InternalException].
  /// May throw [DisabledOperationException].
  /// May throw [BaseException].
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListVpcEndpoints</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListVpcEndpoints</code>
  /// operations, which returns results in the next page.
  Future<ListVpcEndpointsResponse> listVpcEndpoints({
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2021-01-01/opensearch/vpcEndpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVpcEndpointsResponse.fromJson(response);
  }

  /// Retrieves all Amazon OpenSearch Service-managed VPC endpoints associated
  /// with a particular domain.
  ///
  /// May throw [InternalException].
  /// May throw [DisabledOperationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [BaseException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain to list associated VPC endpoints for.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListEndpointsForDomain</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListEndpointsForDomain</code>
  /// operations, which returns results in the next page.
  Future<ListVpcEndpointsForDomainResponse> listVpcEndpointsForDomain({
    required String domainName,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/vpcEndpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVpcEndpointsForDomainResponse.fromJson(response);
  }

  /// Allows you to purchase Amazon OpenSearch Service Reserved Instances.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [reservationName] :
  /// A customer-specified identifier to track this reservation.
  ///
  /// Parameter [reservedInstanceOfferingId] :
  /// The ID of the Reserved Instance offering to purchase.
  ///
  /// Parameter [instanceCount] :
  /// The number of OpenSearch instances to reserve.
  Future<PurchaseReservedInstanceOfferingResponse>
      purchaseReservedInstanceOffering({
    required String reservationName,
    required String reservedInstanceOfferingId,
    int? instanceCount,
  }) async {
    _s.validateNumRange(
      'instanceCount',
      instanceCount,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'ReservationName': reservationName,
      'ReservedInstanceOfferingId': reservedInstanceOfferingId,
      if (instanceCount != null) 'InstanceCount': instanceCount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/purchaseReservedInstanceOffering',
      exceptionFnMap: _exceptionFns,
    );
    return PurchaseReservedInstanceOfferingResponse.fromJson(response);
  }

  /// Allows the remote Amazon OpenSearch Service domain owner to reject an
  /// inbound cross-cluster connection request.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionId] :
  /// The unique identifier of the inbound connection to reject.
  Future<RejectInboundConnectionResponse> rejectInboundConnection({
    required String connectionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2021-01-01/opensearch/cc/inboundConnection/${Uri.encodeComponent(connectionId)}/reject',
      exceptionFnMap: _exceptionFns,
    );
    return RejectInboundConnectionResponse.fromJson(response);
  }

  /// Removes the specified set of tags from an Amazon OpenSearch Service
  /// domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains.html#managedomains-awsresorcetagging">
  /// Tagging Amazon OpenSearch Service domains</a>.
  ///
  /// May throw [BaseException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the domain from which you want to delete
  /// the specified tags.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the domain.
  Future<void> removeTags({
    required String arn,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'ARN': arn,
      'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/tags-removal',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Revokes access to an Amazon OpenSearch Service domain that was provided
  /// through an interface VPC endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [BaseException].
  ///
  /// Parameter [account] :
  /// The account ID to revoke access from.
  ///
  /// Parameter [domainName] :
  /// The name of the OpenSearch Service domain.
  Future<void> revokeVpcEndpointAccess({
    required String account,
    required String domainName,
  }) async {
    final $payload = <String, dynamic>{
      'Account': account,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/revokeVpcEndpointAccess',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts the node maintenance process on the data node. These processes can
  /// include a node reboot, an Opensearch or Elasticsearch process restart, or
  /// a Dashboard or Kibana restart.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [action] :
  /// The name of the action.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [nodeId] :
  /// The ID of the data node.
  Future<StartDomainMaintenanceResponse> startDomainMaintenance({
    required MaintenanceType action,
    required String domainName,
    String? nodeId,
  }) async {
    final $payload = <String, dynamic>{
      'Action': action.toValue(),
      if (nodeId != null) 'NodeId': nodeId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/domainMaintenance',
      exceptionFnMap: _exceptionFns,
    );
    return StartDomainMaintenanceResponse.fromJson(response);
  }

  /// Schedules a service software update for an Amazon OpenSearch Service
  /// domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/service-software.html">Service
  /// software updates in Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to update to the latest service
  /// software.
  ///
  /// Parameter [desiredStartTime] :
  /// The Epoch timestamp when you want the service software update to start.
  /// You only need to specify this parameter if you set <code>ScheduleAt</code>
  /// to <code>TIMESTAMP</code>.
  ///
  /// Parameter [scheduleAt] :
  /// When to start the service software update.
  ///
  /// <ul>
  /// <li>
  /// <code>NOW</code> - Immediately schedules the update to happen in the
  /// current hour if there's capacity available.
  /// </li>
  /// <li>
  /// <code>TIMESTAMP</code> - Lets you specify a custom date and time to apply
  /// the update. If you specify this value, you must also provide a value for
  /// <code>DesiredStartTime</code>.
  /// </li>
  /// <li>
  /// <code>OFF_PEAK_WINDOW</code> - Marks the update to be picked up during an
  /// upcoming off-peak window. There's no guarantee that the update will happen
  /// during the next immediate window. Depending on capacity, it might happen
  /// in subsequent days.
  /// </li>
  /// </ul>
  /// Default: <code>NOW</code> if you don't specify a value for
  /// <code>DesiredStartTime</code>, and <code>TIMESTAMP</code> if you do.
  Future<StartServiceSoftwareUpdateResponse> startServiceSoftwareUpdate({
    required String domainName,
    int? desiredStartTime,
    ScheduleAt? scheduleAt,
  }) async {
    final $payload = <String, dynamic>{
      'DomainName': domainName,
      if (desiredStartTime != null) 'DesiredStartTime': desiredStartTime,
      if (scheduleAt != null) 'ScheduleAt': scheduleAt.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/serviceSoftwareUpdate/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartServiceSoftwareUpdateResponse.fromJson(response);
  }

  /// Updates a direct-query data source. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/direct-query-s3-creating.html">Working
  /// with Amazon OpenSearch Service data source integrations with Amazon
  /// S3</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  /// May throw [DependencyFailureException].
  ///
  /// Parameter [dataSourceType] :
  /// The type of data source.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [name] :
  /// The name of the data source to modify.
  ///
  /// Parameter [description] :
  /// A new description of the data source.
  ///
  /// Parameter [status] :
  /// The status of the data source update request.
  Future<UpdateDataSourceResponse> updateDataSource({
    required DataSourceType dataSourceType,
    required String domainName,
    required String name,
    String? description,
    DataSourceStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      'DataSourceType': dataSourceType,
      if (description != null) 'Description': description,
      if (status != null) 'Status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/dataSource/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataSourceResponse.fromJson(response);
  }

  /// Modifies the cluster configuration of the specified Amazon OpenSearch
  /// Service domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you're updating.
  ///
  /// Parameter [accessPolicies] :
  /// Identity and Access Management (IAM) access policy as a JSON-formatted
  /// string.
  ///
  /// Parameter [advancedOptions] :
  /// Key-value pairs to specify advanced configuration options. The following
  /// key-value pairs are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>"rest.action.multi.allow_explicit_index": "true" | "false"</code> -
  /// Note the use of a string rather than a boolean. Specifies whether explicit
  /// references to indexes are allowed inside the body of HTTP requests. If you
  /// want to configure access policies for domain sub-resources, such as
  /// specific indexes and domain APIs, you must disable this property. Default
  /// is true.
  /// </li>
  /// <li>
  /// <code>"indices.fielddata.cache.size": "80" </code> - Note the use of a
  /// string rather than a boolean. Specifies the percentage of heap space
  /// allocated to field data. Default is unbounded.
  /// </li>
  /// <li>
  /// <code>"indices.query.bool.max_clause_count": "1024"</code> - Note the use
  /// of a string rather than a boolean. Specifies the maximum number of clauses
  /// allowed in a Lucene boolean query. Default is 1,024. Queries with more
  /// than the permitted number of clauses result in a
  /// <code>TooManyClauses</code> error.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-advanced-options">Advanced
  /// cluster parameters</a>.
  ///
  /// Parameter [advancedSecurityOptions] :
  /// Options for fine-grained access control.
  ///
  /// Parameter [autoTuneOptions] :
  /// Options for Auto-Tune.
  ///
  /// Parameter [clusterConfig] :
  /// Changes that you want to make to the cluster configuration, such as the
  /// instance type and number of EC2 instances.
  ///
  /// Parameter [cognitoOptions] :
  /// Key-value pairs to configure Amazon Cognito authentication for OpenSearch
  /// Dashboards.
  ///
  /// Parameter [domainEndpointOptions] :
  /// Additional options for the domain endpoint, such as whether to require
  /// HTTPS for all traffic.
  ///
  /// Parameter [dryRun] :
  /// This flag, when set to True, specifies whether the
  /// <code>UpdateDomain</code> request should return the results of a dry run
  /// analysis without actually applying the change. A dry run determines what
  /// type of deployment the update will cause.
  ///
  /// Parameter [dryRunMode] :
  /// The type of dry run to perform.
  ///
  /// <ul>
  /// <li>
  /// <code>Basic</code> only returns the type of deployment (blue/green or
  /// dynamic) that the update will cause.
  /// </li>
  /// <li>
  /// <code>Verbose</code> runs an additional check to validate the changes
  /// you're making. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-configuration-changes#validation-check">Validating
  /// a domain update</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [eBSOptions] :
  /// The type and size of the EBS volume to attach to instances in the domain.
  ///
  /// Parameter [encryptionAtRestOptions] :
  /// Encryption at rest options for the domain.
  ///
  /// Parameter [iPAddressType] :
  /// Specify either dual stack or IPv4 as your IP address type. Dual stack
  /// allows you to share domain resources across IPv4 and IPv6 address types,
  /// and is the recommended option. If your IP address type is currently set to
  /// dual stack, you can't change it.
  ///
  /// Parameter [logPublishingOptions] :
  /// Options to publish OpenSearch logs to Amazon CloudWatch Logs.
  ///
  /// Parameter [nodeToNodeEncryptionOptions] :
  /// Node-to-node encryption options for the domain.
  ///
  /// Parameter [offPeakWindowOptions] :
  /// Off-peak window options for the domain.
  ///
  /// Parameter [snapshotOptions] :
  /// Option to set the time, in UTC format, for the daily automated snapshot.
  /// Default value is <code>0</code> hours.
  ///
  /// Parameter [softwareUpdateOptions] :
  /// Service software update options for the domain.
  ///
  /// Parameter [vPCOptions] :
  /// Options to specify the subnets and security groups for a VPC endpoint. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html">Launching
  /// your Amazon OpenSearch Service domains using a VPC</a>.
  Future<UpdateDomainConfigResponse> updateDomainConfig({
    required String domainName,
    String? accessPolicies,
    Map<String, String>? advancedOptions,
    AdvancedSecurityOptionsInput? advancedSecurityOptions,
    AutoTuneOptions? autoTuneOptions,
    ClusterConfig? clusterConfig,
    CognitoOptions? cognitoOptions,
    DomainEndpointOptions? domainEndpointOptions,
    bool? dryRun,
    DryRunMode? dryRunMode,
    EBSOptions? eBSOptions,
    EncryptionAtRestOptions? encryptionAtRestOptions,
    IPAddressType? iPAddressType,
    Map<LogType, LogPublishingOption>? logPublishingOptions,
    NodeToNodeEncryptionOptions? nodeToNodeEncryptionOptions,
    OffPeakWindowOptions? offPeakWindowOptions,
    SnapshotOptions? snapshotOptions,
    SoftwareUpdateOptions? softwareUpdateOptions,
    VPCOptions? vPCOptions,
  }) async {
    final $payload = <String, dynamic>{
      if (accessPolicies != null) 'AccessPolicies': accessPolicies,
      if (advancedOptions != null) 'AdvancedOptions': advancedOptions,
      if (advancedSecurityOptions != null)
        'AdvancedSecurityOptions': advancedSecurityOptions,
      if (autoTuneOptions != null) 'AutoTuneOptions': autoTuneOptions,
      if (clusterConfig != null) 'ClusterConfig': clusterConfig,
      if (cognitoOptions != null) 'CognitoOptions': cognitoOptions,
      if (domainEndpointOptions != null)
        'DomainEndpointOptions': domainEndpointOptions,
      if (dryRun != null) 'DryRun': dryRun,
      if (dryRunMode != null) 'DryRunMode': dryRunMode.toValue(),
      if (eBSOptions != null) 'EBSOptions': eBSOptions,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (iPAddressType != null) 'IPAddressType': iPAddressType.toValue(),
      if (logPublishingOptions != null)
        'LogPublishingOptions':
            logPublishingOptions.map((k, e) => MapEntry(k.toValue(), e)),
      if (nodeToNodeEncryptionOptions != null)
        'NodeToNodeEncryptionOptions': nodeToNodeEncryptionOptions,
      if (offPeakWindowOptions != null)
        'OffPeakWindowOptions': offPeakWindowOptions,
      if (snapshotOptions != null) 'SnapshotOptions': snapshotOptions,
      if (softwareUpdateOptions != null)
        'SoftwareUpdateOptions': softwareUpdateOptions,
      if (vPCOptions != null) 'VPCOptions': vPCOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/config',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDomainConfigResponse.fromJson(response);
  }

  /// Updates a package for use with Amazon OpenSearch Service domains. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/custom-packages.html">Custom
  /// packages for Amazon OpenSearch Service</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageID] :
  /// The unique identifier for the package.
  ///
  /// Parameter [packageSource] :
  /// Amazon S3 bucket and key for the package.
  ///
  /// Parameter [commitMessage] :
  /// Commit message for the updated file, which is shown as part of
  /// <code>GetPackageVersionHistoryResponse</code>.
  ///
  /// Parameter [packageDescription] :
  /// A new description of the package.
  Future<UpdatePackageResponse> updatePackage({
    required String packageID,
    required PackageSource packageSource,
    String? commitMessage,
    String? packageDescription,
  }) async {
    final $payload = <String, dynamic>{
      'PackageID': packageID,
      'PackageSource': packageSource,
      if (commitMessage != null) 'CommitMessage': commitMessage,
      if (packageDescription != null) 'PackageDescription': packageDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/packages/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePackageResponse.fromJson(response);
  }

  /// Reschedules a planned domain configuration change for a later time. This
  /// change can be a scheduled <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/service-software.html">service
  /// software update</a> or a <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html#auto-tune-types">blue/green
  /// Auto-Tune enhancement</a>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [SlotNotAvailableException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionID] :
  /// The unique identifier of the action to reschedule. To retrieve this ID,
  /// send a <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/APIReference/API_ListScheduledActions.html">ListScheduledActions</a>
  /// request.
  ///
  /// Parameter [actionType] :
  /// The type of action to reschedule. Can be one of
  /// <code>SERVICE_SOFTWARE_UPDATE</code>, <code>JVM_HEAP_SIZE_TUNING</code>,
  /// or <code>JVM_YOUNG_GEN_TUNING</code>. To retrieve this value, send a <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/APIReference/API_ListScheduledActions.html">ListScheduledActions</a>
  /// request.
  ///
  /// Parameter [domainName] :
  /// The name of the domain to reschedule an action for.
  ///
  /// Parameter [scheduleAt] :
  /// When to schedule the action.
  ///
  /// <ul>
  /// <li>
  /// <code>NOW</code> - Immediately schedules the update to happen in the
  /// current hour if there's capacity available.
  /// </li>
  /// <li>
  /// <code>TIMESTAMP</code> - Lets you specify a custom date and time to apply
  /// the update. If you specify this value, you must also provide a value for
  /// <code>DesiredStartTime</code>.
  /// </li>
  /// <li>
  /// <code>OFF_PEAK_WINDOW</code> - Marks the action to be picked up during an
  /// upcoming off-peak window. There's no guarantee that the change will be
  /// implemented during the next immediate window. Depending on capacity, it
  /// might happen in subsequent days.
  /// </li>
  /// </ul>
  ///
  /// Parameter [desiredStartTime] :
  /// The time to implement the change, in Coordinated Universal Time (UTC).
  /// Only specify this parameter if you set <code>ScheduleAt</code> to
  /// <code>TIMESTAMP</code>.
  Future<UpdateScheduledActionResponse> updateScheduledAction({
    required String actionID,
    required ActionType actionType,
    required String domainName,
    required ScheduleAt scheduleAt,
    int? desiredStartTime,
  }) async {
    final $payload = <String, dynamic>{
      'ActionID': actionID,
      'ActionType': actionType.toValue(),
      'ScheduleAt': scheduleAt.toValue(),
      if (desiredStartTime != null) 'DesiredStartTime': desiredStartTime,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/scheduledAction/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateScheduledActionResponse.fromJson(response);
  }

  /// Modifies an Amazon OpenSearch Service-managed interface VPC endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [BaseException].
  ///
  /// Parameter [vpcEndpointId] :
  /// The unique identifier of the endpoint.
  ///
  /// Parameter [vpcOptions] :
  /// The security groups and/or subnets to add, remove, or modify.
  Future<UpdateVpcEndpointResponse> updateVpcEndpoint({
    required String vpcEndpointId,
    required VPCOptions vpcOptions,
  }) async {
    final $payload = <String, dynamic>{
      'VpcEndpointId': vpcEndpointId,
      'VpcOptions': vpcOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/vpcEndpoints/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVpcEndpointResponse.fromJson(response);
  }

  /// Allows you to either upgrade your Amazon OpenSearch Service domain or
  /// perform an upgrade eligibility check to a compatible version of OpenSearch
  /// or Elasticsearch.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [domainName] :
  /// Name of the OpenSearch Service domain that you want to upgrade.
  ///
  /// Parameter [targetVersion] :
  /// OpenSearch or Elasticsearch version to which you want to upgrade, in the
  /// format Opensearch_X.Y or Elasticsearch_X.Y.
  ///
  /// Parameter [advancedOptions] :
  /// Only supports the <code>override_main_response_version</code> parameter
  /// and not other advanced options. You can only include this option when
  /// upgrading to an OpenSearch version. Specifies whether the domain reports
  /// its version as 7.10 so that it continues to work with Elasticsearch OSS
  /// clients and plugins.
  ///
  /// Parameter [performCheckOnly] :
  /// When true, indicates that an upgrade eligibility check needs to be
  /// performed. Does not actually perform the upgrade.
  Future<UpgradeDomainResponse> upgradeDomain({
    required String domainName,
    required String targetVersion,
    Map<String, String>? advancedOptions,
    bool? performCheckOnly,
  }) async {
    final $payload = <String, dynamic>{
      'DomainName': domainName,
      'TargetVersion': targetVersion,
      if (advancedOptions != null) 'AdvancedOptions': advancedOptions,
      if (performCheckOnly != null) 'PerformCheckOnly': performCheckOnly,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/upgradeDomain',
      exceptionFnMap: _exceptionFns,
    );
    return UpgradeDomainResponse.fromJson(response);
  }
}

/// Information about an Amazon OpenSearch Service domain.
class AWSDomainInformation {
  /// Name of the domain.
  final String domainName;

  /// The Amazon Web Services account ID of the domain owner.
  final String? ownerId;

  /// The Amazon Web Services Region in which the domain is located.
  final String? region;

  AWSDomainInformation({
    required this.domainName,
    this.ownerId,
    this.region,
  });

  factory AWSDomainInformation.fromJson(Map<String, dynamic> json) {
    return AWSDomainInformation(
      domainName: json['DomainName'] as String,
      ownerId: json['OwnerId'] as String?,
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final ownerId = this.ownerId;
    final region = this.region;
    return {
      'DomainName': domainName,
      if (ownerId != null) 'OwnerId': ownerId,
      if (region != null) 'Region': region,
    };
  }
}

/// Contains details about the accepted inbound connection.
class AcceptInboundConnectionResponse {
  /// Information about the accepted inbound connection.
  final InboundConnection? connection;

  AcceptInboundConnectionResponse({
    this.connection,
  });

  factory AcceptInboundConnectionResponse.fromJson(Map<String, dynamic> json) {
    return AcceptInboundConnectionResponse(
      connection: json['Connection'] != null
          ? InboundConnection.fromJson(
              json['Connection'] as Map<String, dynamic>)
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

/// The configured access rules for the domain's search endpoint, and the
/// current status of those rules.
class AccessPoliciesStatus {
  /// The access policy configured for the domain. Access policies can be
  /// resource-based, IP-based, or IAM-based. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-access-policies">Configuring
  /// access policies</a>.
  final String options;

  /// The status of the access policy for the domain.
  final OptionStatus status;

  AccessPoliciesStatus({
    required this.options,
    required this.status,
  });

  factory AccessPoliciesStatus.fromJson(Map<String, dynamic> json) {
    return AccessPoliciesStatus(
      options: json['Options'] as String,
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

enum ActionSeverity {
  high,
  medium,
  low,
}

extension ActionSeverityValueExtension on ActionSeverity {
  String toValue() {
    switch (this) {
      case ActionSeverity.high:
        return 'HIGH';
      case ActionSeverity.medium:
        return 'MEDIUM';
      case ActionSeverity.low:
        return 'LOW';
    }
  }
}

extension ActionSeverityFromString on String {
  ActionSeverity toActionSeverity() {
    switch (this) {
      case 'HIGH':
        return ActionSeverity.high;
      case 'MEDIUM':
        return ActionSeverity.medium;
      case 'LOW':
        return ActionSeverity.low;
    }
    throw Exception('$this is not known in enum ActionSeverity');
  }
}

enum ActionStatus {
  pendingUpdate,
  inProgress,
  failed,
  completed,
  notEligible,
  eligible,
}

extension ActionStatusValueExtension on ActionStatus {
  String toValue() {
    switch (this) {
      case ActionStatus.pendingUpdate:
        return 'PENDING_UPDATE';
      case ActionStatus.inProgress:
        return 'IN_PROGRESS';
      case ActionStatus.failed:
        return 'FAILED';
      case ActionStatus.completed:
        return 'COMPLETED';
      case ActionStatus.notEligible:
        return 'NOT_ELIGIBLE';
      case ActionStatus.eligible:
        return 'ELIGIBLE';
    }
  }
}

extension ActionStatusFromString on String {
  ActionStatus toActionStatus() {
    switch (this) {
      case 'PENDING_UPDATE':
        return ActionStatus.pendingUpdate;
      case 'IN_PROGRESS':
        return ActionStatus.inProgress;
      case 'FAILED':
        return ActionStatus.failed;
      case 'COMPLETED':
        return ActionStatus.completed;
      case 'NOT_ELIGIBLE':
        return ActionStatus.notEligible;
      case 'ELIGIBLE':
        return ActionStatus.eligible;
    }
    throw Exception('$this is not known in enum ActionStatus');
  }
}

enum ActionType {
  serviceSoftwareUpdate,
  jvmHeapSizeTuning,
  jvmYoungGenTuning,
}

extension ActionTypeValueExtension on ActionType {
  String toValue() {
    switch (this) {
      case ActionType.serviceSoftwareUpdate:
        return 'SERVICE_SOFTWARE_UPDATE';
      case ActionType.jvmHeapSizeTuning:
        return 'JVM_HEAP_SIZE_TUNING';
      case ActionType.jvmYoungGenTuning:
        return 'JVM_YOUNG_GEN_TUNING';
    }
  }
}

extension ActionTypeFromString on String {
  ActionType toActionType() {
    switch (this) {
      case 'SERVICE_SOFTWARE_UPDATE':
        return ActionType.serviceSoftwareUpdate;
      case 'JVM_HEAP_SIZE_TUNING':
        return ActionType.jvmHeapSizeTuning;
      case 'JVM_YOUNG_GEN_TUNING':
        return ActionType.jvmYoungGenTuning;
    }
    throw Exception('$this is not known in enum ActionType');
  }
}

/// The result of an <code>AddDataSource</code> operation.
class AddDataSourceResponse {
  /// A message associated with creation of the data source.
  final String? message;

  AddDataSourceResponse({
    this.message,
  });

  factory AddDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return AddDataSourceResponse(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// List of limits that are specific to a given instance type.
class AdditionalLimit {
  /// <ul>
  /// <li>
  /// <code>MaximumNumberOfDataNodesSupported</code> - This attribute only applies
  /// to master nodes and specifies the maximum number of data nodes of a given
  /// instance type a master node can support.
  /// </li>
  /// <li>
  /// <code>MaximumNumberOfDataNodesWithoutMasterNode</code> - This attribute only
  /// applies to data nodes and specifies the maximum number of data nodes of a
  /// given instance type can exist without a master node governing them.
  /// </li>
  /// </ul>
  final String? limitName;

  /// The values of the additional instance type limits.
  final List<String>? limitValues;

  AdditionalLimit({
    this.limitName,
    this.limitValues,
  });

  factory AdditionalLimit.fromJson(Map<String, dynamic> json) {
    return AdditionalLimit(
      limitName: json['LimitName'] as String?,
      limitValues: (json['LimitValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final limitName = this.limitName;
    final limitValues = this.limitValues;
    return {
      if (limitName != null) 'LimitName': limitName,
      if (limitValues != null) 'LimitValues': limitValues,
    };
  }
}

/// Status of the advanced options for the specified domain. The following
/// options are available:
///
/// <ul>
/// <li>
/// <code>"rest.action.multi.allow_explicit_index": "true" | "false"</code> -
/// Note the use of a string rather than a boolean. Specifies whether explicit
/// references to indexes are allowed inside the body of HTTP requests. If you
/// want to configure access policies for domain sub-resources, such as specific
/// indexes and domain APIs, you must disable this property. Default is true.
/// </li>
/// <li>
/// <code>"indices.fielddata.cache.size": "80" </code> - Note the use of a
/// string rather than a boolean. Specifies the percentage of heap space
/// allocated to field data. Default is unbounded.
/// </li>
/// <li>
/// <code>"indices.query.bool.max_clause_count": "1024"</code> - Note the use of
/// a string rather than a boolean. Specifies the maximum number of clauses
/// allowed in a Lucene boolean query. Default is 1,024. Queries with more than
/// the permitted number of clauses result in a <code>TooManyClauses</code>
/// error.
/// </li>
/// <li>
/// <code>"override_main_response_version": "true" | "false"</code> - Note the
/// use of a string rather than a boolean. Specifies whether the domain reports
/// its version as 7.10 to allow Elasticsearch OSS clients and plugins to
/// continue working with it. Default is false when creating a domain and true
/// when upgrading a domain.
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-advanced-options">Advanced
/// cluster parameters</a>.
class AdvancedOptionsStatus {
  /// The status of advanced options for the specified domain.
  final Map<String, String> options;

  /// The status of advanced options for the specified domain.
  final OptionStatus status;

  AdvancedOptionsStatus({
    required this.options,
    required this.status,
  });

  factory AdvancedOptionsStatus.fromJson(Map<String, dynamic> json) {
    return AdvancedOptionsStatus(
      options: (json['Options'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// Container for fine-grained access control settings.
class AdvancedSecurityOptions {
  /// Date and time when the migration period will be disabled. Only necessary
  /// when <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/fgac.html#fgac-enabling-existing">enabling
  /// fine-grained access control on an existing domain</a>.
  final DateTime? anonymousAuthDisableDate;

  /// True if a 30-day migration period is enabled, during which administrators
  /// can create role mappings. Only necessary when <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/fgac.html#fgac-enabling-existing">enabling
  /// fine-grained access control on an existing domain</a>.
  final bool? anonymousAuthEnabled;

  /// True if fine-grained access control is enabled.
  final bool? enabled;

  /// True if the internal user database is enabled.
  final bool? internalUserDatabaseEnabled;

  /// Container for information about the SAML configuration for OpenSearch
  /// Dashboards.
  final SAMLOptionsOutput? sAMLOptions;

  AdvancedSecurityOptions({
    this.anonymousAuthDisableDate,
    this.anonymousAuthEnabled,
    this.enabled,
    this.internalUserDatabaseEnabled,
    this.sAMLOptions,
  });

  factory AdvancedSecurityOptions.fromJson(Map<String, dynamic> json) {
    return AdvancedSecurityOptions(
      anonymousAuthDisableDate:
          timeStampFromJson(json['AnonymousAuthDisableDate']),
      anonymousAuthEnabled: json['AnonymousAuthEnabled'] as bool?,
      enabled: json['Enabled'] as bool?,
      internalUserDatabaseEnabled: json['InternalUserDatabaseEnabled'] as bool?,
      sAMLOptions: json['SAMLOptions'] != null
          ? SAMLOptionsOutput.fromJson(
              json['SAMLOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final anonymousAuthDisableDate = this.anonymousAuthDisableDate;
    final anonymousAuthEnabled = this.anonymousAuthEnabled;
    final enabled = this.enabled;
    final internalUserDatabaseEnabled = this.internalUserDatabaseEnabled;
    final sAMLOptions = this.sAMLOptions;
    return {
      if (anonymousAuthDisableDate != null)
        'AnonymousAuthDisableDate':
            unixTimestampToJson(anonymousAuthDisableDate),
      if (anonymousAuthEnabled != null)
        'AnonymousAuthEnabled': anonymousAuthEnabled,
      if (enabled != null) 'Enabled': enabled,
      if (internalUserDatabaseEnabled != null)
        'InternalUserDatabaseEnabled': internalUserDatabaseEnabled,
      if (sAMLOptions != null) 'SAMLOptions': sAMLOptions,
    };
  }
}

/// Options for enabling and configuring fine-grained access control. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/fgac.html">Fine-grained
/// access control in Amazon OpenSearch Service</a>.
class AdvancedSecurityOptionsInput {
  /// True to enable a 30-day migration period during which administrators can
  /// create role mappings. Only necessary when <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/fgac.html#fgac-enabling-existing">enabling
  /// fine-grained access control on an existing domain</a>.
  final bool? anonymousAuthEnabled;

  /// True to enable fine-grained access control.
  final bool? enabled;

  /// True to enable the internal user database.
  final bool? internalUserDatabaseEnabled;

  /// Container for information about the master user.
  final MasterUserOptions? masterUserOptions;

  /// Container for information about the SAML configuration for OpenSearch
  /// Dashboards.
  final SAMLOptionsInput? sAMLOptions;

  AdvancedSecurityOptionsInput({
    this.anonymousAuthEnabled,
    this.enabled,
    this.internalUserDatabaseEnabled,
    this.masterUserOptions,
    this.sAMLOptions,
  });

  Map<String, dynamic> toJson() {
    final anonymousAuthEnabled = this.anonymousAuthEnabled;
    final enabled = this.enabled;
    final internalUserDatabaseEnabled = this.internalUserDatabaseEnabled;
    final masterUserOptions = this.masterUserOptions;
    final sAMLOptions = this.sAMLOptions;
    return {
      if (anonymousAuthEnabled != null)
        'AnonymousAuthEnabled': anonymousAuthEnabled,
      if (enabled != null) 'Enabled': enabled,
      if (internalUserDatabaseEnabled != null)
        'InternalUserDatabaseEnabled': internalUserDatabaseEnabled,
      if (masterUserOptions != null) 'MasterUserOptions': masterUserOptions,
      if (sAMLOptions != null) 'SAMLOptions': sAMLOptions,
    };
  }
}

/// The status of fine-grained access control settings for a domain.
class AdvancedSecurityOptionsStatus {
  /// Container for fine-grained access control settings.
  final AdvancedSecurityOptions options;

  /// Status of the fine-grained access control settings for a domain.
  final OptionStatus status;

  AdvancedSecurityOptionsStatus({
    required this.options,
    required this.status,
  });

  factory AdvancedSecurityOptionsStatus.fromJson(Map<String, dynamic> json) {
    return AdvancedSecurityOptionsStatus(
      options: AdvancedSecurityOptions.fromJson(
          json['Options'] as Map<String, dynamic>),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// Container for the response returned by the <code>AssociatePackage</code>
/// operation.
class AssociatePackageResponse {
  /// Information about a package that is associated with a domain.
  final DomainPackageDetails? domainPackageDetails;

  AssociatePackageResponse({
    this.domainPackageDetails,
  });

  factory AssociatePackageResponse.fromJson(Map<String, dynamic> json) {
    return AssociatePackageResponse(
      domainPackageDetails: json['DomainPackageDetails'] != null
          ? DomainPackageDetails.fromJson(
              json['DomainPackageDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainPackageDetails = this.domainPackageDetails;
    return {
      if (domainPackageDetails != null)
        'DomainPackageDetails': domainPackageDetails,
    };
  }
}

class AuthorizeVpcEndpointAccessResponse {
  /// Information about the Amazon Web Services account or service that was
  /// provided access to the domain.
  final AuthorizedPrincipal authorizedPrincipal;

  AuthorizeVpcEndpointAccessResponse({
    required this.authorizedPrincipal,
  });

  factory AuthorizeVpcEndpointAccessResponse.fromJson(
      Map<String, dynamic> json) {
    return AuthorizeVpcEndpointAccessResponse(
      authorizedPrincipal: AuthorizedPrincipal.fromJson(
          json['AuthorizedPrincipal'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizedPrincipal = this.authorizedPrincipal;
    return {
      'AuthorizedPrincipal': authorizedPrincipal,
    };
  }
}

/// Information about an Amazon Web Services account or service that has access
/// to an Amazon OpenSearch Service domain through the use of an interface VPC
/// endpoint.
class AuthorizedPrincipal {
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html">IAM
  /// principal</a> that is allowed access to the domain.
  final String? principal;

  /// The type of principal.
  final PrincipalType? principalType;

  AuthorizedPrincipal({
    this.principal,
    this.principalType,
  });

  factory AuthorizedPrincipal.fromJson(Map<String, dynamic> json) {
    return AuthorizedPrincipal(
      principal: json['Principal'] as String?,
      principalType: (json['PrincipalType'] as String?)?.toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final principal = this.principal;
    final principalType = this.principalType;
    return {
      if (principal != null) 'Principal': principal,
      if (principalType != null) 'PrincipalType': principalType.toValue(),
    };
  }
}

/// Information about an Auto-Tune action. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html">Auto-Tune
/// for Amazon OpenSearch Service</a>.
class AutoTune {
  /// Details about an Auto-Tune action.
  final AutoTuneDetails? autoTuneDetails;

  /// The type of Auto-Tune action.
  final AutoTuneType? autoTuneType;

  AutoTune({
    this.autoTuneDetails,
    this.autoTuneType,
  });

  factory AutoTune.fromJson(Map<String, dynamic> json) {
    return AutoTune(
      autoTuneDetails: json['AutoTuneDetails'] != null
          ? AutoTuneDetails.fromJson(
              json['AutoTuneDetails'] as Map<String, dynamic>)
          : null,
      autoTuneType: (json['AutoTuneType'] as String?)?.toAutoTuneType(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoTuneDetails = this.autoTuneDetails;
    final autoTuneType = this.autoTuneType;
    return {
      if (autoTuneDetails != null) 'AutoTuneDetails': autoTuneDetails,
      if (autoTuneType != null) 'AutoTuneType': autoTuneType.toValue(),
    };
  }
}

/// The Auto-Tune desired state. Valid values are ENABLED and DISABLED.
enum AutoTuneDesiredState {
  enabled,
  disabled,
}

extension AutoTuneDesiredStateValueExtension on AutoTuneDesiredState {
  String toValue() {
    switch (this) {
      case AutoTuneDesiredState.enabled:
        return 'ENABLED';
      case AutoTuneDesiredState.disabled:
        return 'DISABLED';
    }
  }
}

extension AutoTuneDesiredStateFromString on String {
  AutoTuneDesiredState toAutoTuneDesiredState() {
    switch (this) {
      case 'ENABLED':
        return AutoTuneDesiredState.enabled;
      case 'DISABLED':
        return AutoTuneDesiredState.disabled;
    }
    throw Exception('$this is not known in enum AutoTuneDesiredState');
  }
}

/// Specifies details about a scheduled Auto-Tune action. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html">Auto-Tune
/// for Amazon OpenSearch Service</a>.
class AutoTuneDetails {
  /// Container for details about a scheduled Auto-Tune action.
  final ScheduledAutoTuneDetails? scheduledAutoTuneDetails;

  AutoTuneDetails({
    this.scheduledAutoTuneDetails,
  });

  factory AutoTuneDetails.fromJson(Map<String, dynamic> json) {
    return AutoTuneDetails(
      scheduledAutoTuneDetails: json['ScheduledAutoTuneDetails'] != null
          ? ScheduledAutoTuneDetails.fromJson(
              json['ScheduledAutoTuneDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledAutoTuneDetails = this.scheduledAutoTuneDetails;
    return {
      if (scheduledAutoTuneDetails != null)
        'ScheduledAutoTuneDetails': scheduledAutoTuneDetails,
    };
  }
}

/// <note>
/// This object is deprecated. Use the domain's <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/off-peak.html">off-peak
/// window</a> to schedule Auto-Tune optimizations. For migration instructions,
/// see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/off-peak.html#off-peak-migrate">Migrating
/// from Auto-Tune maintenance windows</a>.
/// </note>
/// The Auto-Tune maintenance schedule. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html">Auto-Tune
/// for Amazon OpenSearch Service</a>.
class AutoTuneMaintenanceSchedule {
  /// A cron expression for a recurring maintenance schedule during which
  /// Auto-Tune can deploy changes.
  final String? cronExpressionForRecurrence;

  /// The duration of the maintenance schedule. For example, <code>"Duration":
  /// {"Value": 2, "Unit": "HOURS"}</code>.
  final Duration? duration;

  /// The Epoch timestamp at which the Auto-Tune maintenance schedule starts.
  final DateTime? startAt;

  AutoTuneMaintenanceSchedule({
    this.cronExpressionForRecurrence,
    this.duration,
    this.startAt,
  });

  factory AutoTuneMaintenanceSchedule.fromJson(Map<String, dynamic> json) {
    return AutoTuneMaintenanceSchedule(
      cronExpressionForRecurrence:
          json['CronExpressionForRecurrence'] as String?,
      duration: json['Duration'] != null
          ? Duration.fromJson(json['Duration'] as Map<String, dynamic>)
          : null,
      startAt: timeStampFromJson(json['StartAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final cronExpressionForRecurrence = this.cronExpressionForRecurrence;
    final duration = this.duration;
    final startAt = this.startAt;
    return {
      if (cronExpressionForRecurrence != null)
        'CronExpressionForRecurrence': cronExpressionForRecurrence,
      if (duration != null) 'Duration': duration,
      if (startAt != null) 'StartAt': unixTimestampToJson(startAt),
    };
  }
}

/// Auto-Tune settings when updating a domain. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html">Auto-Tune
/// for Amazon OpenSearch Service</a>.
class AutoTuneOptions {
  /// Whether Auto-Tune is enabled or disabled.
  final AutoTuneDesiredState? desiredState;

  /// DEPRECATED. Use <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/off-peak.html">off-peak
  /// window</a> instead.
  ///
  /// A list of maintenance schedules during which Auto-Tune can deploy changes.
  final List<AutoTuneMaintenanceSchedule>? maintenanceSchedules;

  /// When disabling Auto-Tune, specify <code>NO_ROLLBACK</code> to retain all
  /// prior Auto-Tune settings or <code>DEFAULT_ROLLBACK</code> to revert to the
  /// OpenSearch Service defaults. If you specify <code>DEFAULT_ROLLBACK</code>,
  /// you must include a <code>MaintenanceSchedule</code> in the request.
  /// Otherwise, OpenSearch Service is unable to perform the rollback.
  final RollbackOnDisable? rollbackOnDisable;

  /// Whether to use the domain's <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/APIReference/API_OffPeakWindow.html">off-peak
  /// window</a> to deploy configuration changes on the domain rather than a
  /// maintenance schedule.
  final bool? useOffPeakWindow;

  AutoTuneOptions({
    this.desiredState,
    this.maintenanceSchedules,
    this.rollbackOnDisable,
    this.useOffPeakWindow,
  });

  factory AutoTuneOptions.fromJson(Map<String, dynamic> json) {
    return AutoTuneOptions(
      desiredState: (json['DesiredState'] as String?)?.toAutoTuneDesiredState(),
      maintenanceSchedules: (json['MaintenanceSchedules'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AutoTuneMaintenanceSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      rollbackOnDisable:
          (json['RollbackOnDisable'] as String?)?.toRollbackOnDisable(),
      useOffPeakWindow: json['UseOffPeakWindow'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final desiredState = this.desiredState;
    final maintenanceSchedules = this.maintenanceSchedules;
    final rollbackOnDisable = this.rollbackOnDisable;
    final useOffPeakWindow = this.useOffPeakWindow;
    return {
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (maintenanceSchedules != null)
        'MaintenanceSchedules': maintenanceSchedules,
      if (rollbackOnDisable != null)
        'RollbackOnDisable': rollbackOnDisable.toValue(),
      if (useOffPeakWindow != null) 'UseOffPeakWindow': useOffPeakWindow,
    };
  }
}

/// Options for configuring Auto-Tune. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html">Auto-Tune
/// for Amazon OpenSearch Service</a>
class AutoTuneOptionsInput {
  /// Whether Auto-Tune is enabled or disabled.
  final AutoTuneDesiredState? desiredState;

  /// A list of maintenance schedules during which Auto-Tune can deploy changes.
  /// Maintenance windows are deprecated and have been replaced with <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/off-peak.html">off-peak
  /// windows</a>.
  final List<AutoTuneMaintenanceSchedule>? maintenanceSchedules;

  /// Whether to schedule Auto-Tune optimizations that require blue/green
  /// deployments during the domain's configured daily off-peak window.
  final bool? useOffPeakWindow;

  AutoTuneOptionsInput({
    this.desiredState,
    this.maintenanceSchedules,
    this.useOffPeakWindow,
  });

  Map<String, dynamic> toJson() {
    final desiredState = this.desiredState;
    final maintenanceSchedules = this.maintenanceSchedules;
    final useOffPeakWindow = this.useOffPeakWindow;
    return {
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (maintenanceSchedules != null)
        'MaintenanceSchedules': maintenanceSchedules,
      if (useOffPeakWindow != null) 'UseOffPeakWindow': useOffPeakWindow,
    };
  }
}

/// The Auto-Tune settings for a domain, displayed when enabling or disabling
/// Auto-Tune.
class AutoTuneOptionsOutput {
  /// Any errors that occurred while enabling or disabling Auto-Tune.
  final String? errorMessage;

  /// The current state of Auto-Tune on the domain.
  final AutoTuneState? state;

  /// Whether the domain's off-peak window will be used to deploy Auto-Tune
  /// changes rather than a maintenance schedule.
  final bool? useOffPeakWindow;

  AutoTuneOptionsOutput({
    this.errorMessage,
    this.state,
    this.useOffPeakWindow,
  });

  factory AutoTuneOptionsOutput.fromJson(Map<String, dynamic> json) {
    return AutoTuneOptionsOutput(
      errorMessage: json['ErrorMessage'] as String?,
      state: (json['State'] as String?)?.toAutoTuneState(),
      useOffPeakWindow: json['UseOffPeakWindow'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final state = this.state;
    final useOffPeakWindow = this.useOffPeakWindow;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (state != null) 'State': state.toValue(),
      if (useOffPeakWindow != null) 'UseOffPeakWindow': useOffPeakWindow,
    };
  }
}

/// The Auto-Tune status for the domain.
class AutoTuneOptionsStatus {
  /// Auto-Tune settings for updating a domain.
  final AutoTuneOptions? options;

  /// The current status of Auto-Tune for a domain.
  final AutoTuneStatus? status;

  AutoTuneOptionsStatus({
    this.options,
    this.status,
  });

  factory AutoTuneOptionsStatus.fromJson(Map<String, dynamic> json) {
    return AutoTuneOptionsStatus(
      options: json['Options'] != null
          ? AutoTuneOptions.fromJson(json['Options'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? AutoTuneStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      if (options != null) 'Options': options,
      if (status != null) 'Status': status,
    };
  }
}

/// The Auto-Tune state for the domain. For valid states see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html">Auto-Tune
/// for Amazon OpenSearch Service</a>.
enum AutoTuneState {
  enabled,
  disabled,
  enableInProgress,
  disableInProgress,
  disabledAndRollbackScheduled,
  disabledAndRollbackInProgress,
  disabledAndRollbackComplete,
  disabledAndRollbackError,
  error,
}

extension AutoTuneStateValueExtension on AutoTuneState {
  String toValue() {
    switch (this) {
      case AutoTuneState.enabled:
        return 'ENABLED';
      case AutoTuneState.disabled:
        return 'DISABLED';
      case AutoTuneState.enableInProgress:
        return 'ENABLE_IN_PROGRESS';
      case AutoTuneState.disableInProgress:
        return 'DISABLE_IN_PROGRESS';
      case AutoTuneState.disabledAndRollbackScheduled:
        return 'DISABLED_AND_ROLLBACK_SCHEDULED';
      case AutoTuneState.disabledAndRollbackInProgress:
        return 'DISABLED_AND_ROLLBACK_IN_PROGRESS';
      case AutoTuneState.disabledAndRollbackComplete:
        return 'DISABLED_AND_ROLLBACK_COMPLETE';
      case AutoTuneState.disabledAndRollbackError:
        return 'DISABLED_AND_ROLLBACK_ERROR';
      case AutoTuneState.error:
        return 'ERROR';
    }
  }
}

extension AutoTuneStateFromString on String {
  AutoTuneState toAutoTuneState() {
    switch (this) {
      case 'ENABLED':
        return AutoTuneState.enabled;
      case 'DISABLED':
        return AutoTuneState.disabled;
      case 'ENABLE_IN_PROGRESS':
        return AutoTuneState.enableInProgress;
      case 'DISABLE_IN_PROGRESS':
        return AutoTuneState.disableInProgress;
      case 'DISABLED_AND_ROLLBACK_SCHEDULED':
        return AutoTuneState.disabledAndRollbackScheduled;
      case 'DISABLED_AND_ROLLBACK_IN_PROGRESS':
        return AutoTuneState.disabledAndRollbackInProgress;
      case 'DISABLED_AND_ROLLBACK_COMPLETE':
        return AutoTuneState.disabledAndRollbackComplete;
      case 'DISABLED_AND_ROLLBACK_ERROR':
        return AutoTuneState.disabledAndRollbackError;
      case 'ERROR':
        return AutoTuneState.error;
    }
    throw Exception('$this is not known in enum AutoTuneState');
  }
}

/// The current status of Auto-Tune for the domain. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html">Auto-Tune
/// for Amazon OpenSearch Service</a>.
class AutoTuneStatus {
  /// Date and time when Auto-Tune was enabled for the domain.
  final DateTime creationDate;

  /// The current state of Auto-Tune on the domain.
  final AutoTuneState state;

  /// Date and time when the Auto-Tune options were last updated for the domain.
  final DateTime updateDate;

  /// Any errors that occurred while enabling or disabling Auto-Tune.
  final String? errorMessage;

  /// Indicates whether the domain is being deleted.
  final bool? pendingDeletion;

  /// The latest version of the Auto-Tune options.
  final int? updateVersion;

  AutoTuneStatus({
    required this.creationDate,
    required this.state,
    required this.updateDate,
    this.errorMessage,
    this.pendingDeletion,
    this.updateVersion,
  });

  factory AutoTuneStatus.fromJson(Map<String, dynamic> json) {
    return AutoTuneStatus(
      creationDate:
          nonNullableTimeStampFromJson(json['CreationDate'] as Object),
      state: (json['State'] as String).toAutoTuneState(),
      updateDate: nonNullableTimeStampFromJson(json['UpdateDate'] as Object),
      errorMessage: json['ErrorMessage'] as String?,
      pendingDeletion: json['PendingDeletion'] as bool?,
      updateVersion: json['UpdateVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final state = this.state;
    final updateDate = this.updateDate;
    final errorMessage = this.errorMessage;
    final pendingDeletion = this.pendingDeletion;
    final updateVersion = this.updateVersion;
    return {
      'CreationDate': unixTimestampToJson(creationDate),
      'State': state.toValue(),
      'UpdateDate': unixTimestampToJson(updateDate),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (pendingDeletion != null) 'PendingDeletion': pendingDeletion,
      if (updateVersion != null) 'UpdateVersion': updateVersion,
    };
  }
}

/// Specifies the Auto-Tune type. Valid value is SCHEDULED_ACTION.
enum AutoTuneType {
  scheduledAction,
}

extension AutoTuneTypeValueExtension on AutoTuneType {
  String toValue() {
    switch (this) {
      case AutoTuneType.scheduledAction:
        return 'SCHEDULED_ACTION';
    }
  }
}

extension AutoTuneTypeFromString on String {
  AutoTuneType toAutoTuneType() {
    switch (this) {
      case 'SCHEDULED_ACTION':
        return AutoTuneType.scheduledAction;
    }
    throw Exception('$this is not known in enum AutoTuneType');
  }
}

/// Information about an Availability Zone on a domain.
class AvailabilityZoneInfo {
  /// The name of the Availability Zone.
  final String? availabilityZoneName;

  /// The number of data nodes active in the Availability Zone.
  final String? availableDataNodeCount;

  /// The total number of data nodes configured in the Availability Zone.
  final String? configuredDataNodeCount;

  /// The total number of primary and replica shards in the Availability Zone.
  final String? totalShards;

  /// The total number of primary and replica shards that aren't allocated to any
  /// of the nodes in the Availability Zone.
  final String? totalUnAssignedShards;

  /// The current state of the Availability Zone. Current options are
  /// <code>Active</code> and <code>StandBy</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>Active</code> - Data nodes in the Availability Zone are in use.
  /// </li>
  /// <li>
  /// <code>StandBy</code> - Data nodes in the Availability Zone are in a standby
  /// state.
  /// </li>
  /// <li>
  /// <code>NotAvailable</code> - Unable to retrieve information.
  /// </li>
  /// </ul>
  final ZoneStatus? zoneStatus;

  AvailabilityZoneInfo({
    this.availabilityZoneName,
    this.availableDataNodeCount,
    this.configuredDataNodeCount,
    this.totalShards,
    this.totalUnAssignedShards,
    this.zoneStatus,
  });

  factory AvailabilityZoneInfo.fromJson(Map<String, dynamic> json) {
    return AvailabilityZoneInfo(
      availabilityZoneName: json['AvailabilityZoneName'] as String?,
      availableDataNodeCount: json['AvailableDataNodeCount'] as String?,
      configuredDataNodeCount: json['ConfiguredDataNodeCount'] as String?,
      totalShards: json['TotalShards'] as String?,
      totalUnAssignedShards: json['TotalUnAssignedShards'] as String?,
      zoneStatus: (json['ZoneStatus'] as String?)?.toZoneStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneName = this.availabilityZoneName;
    final availableDataNodeCount = this.availableDataNodeCount;
    final configuredDataNodeCount = this.configuredDataNodeCount;
    final totalShards = this.totalShards;
    final totalUnAssignedShards = this.totalUnAssignedShards;
    final zoneStatus = this.zoneStatus;
    return {
      if (availabilityZoneName != null)
        'AvailabilityZoneName': availabilityZoneName,
      if (availableDataNodeCount != null)
        'AvailableDataNodeCount': availableDataNodeCount,
      if (configuredDataNodeCount != null)
        'ConfiguredDataNodeCount': configuredDataNodeCount,
      if (totalShards != null) 'TotalShards': totalShards,
      if (totalUnAssignedShards != null)
        'TotalUnAssignedShards': totalUnAssignedShards,
      if (zoneStatus != null) 'ZoneStatus': zoneStatus.toValue(),
    };
  }
}

class CancelDomainConfigChangeResponse {
  /// The unique identifiers of the changes that were cancelled.
  final List<String>? cancelledChangeIds;

  /// The domain change properties that were cancelled.
  final List<CancelledChangeProperty>? cancelledChangeProperties;

  /// Whether or not the request was a dry run. If <code>True</code>, the changes
  /// were not actually cancelled.
  final bool? dryRun;

  CancelDomainConfigChangeResponse({
    this.cancelledChangeIds,
    this.cancelledChangeProperties,
    this.dryRun,
  });

  factory CancelDomainConfigChangeResponse.fromJson(Map<String, dynamic> json) {
    return CancelDomainConfigChangeResponse(
      cancelledChangeIds: (json['CancelledChangeIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cancelledChangeProperties: (json['CancelledChangeProperties'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CancelledChangeProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      dryRun: json['DryRun'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final cancelledChangeIds = this.cancelledChangeIds;
    final cancelledChangeProperties = this.cancelledChangeProperties;
    final dryRun = this.dryRun;
    return {
      if (cancelledChangeIds != null) 'CancelledChangeIds': cancelledChangeIds,
      if (cancelledChangeProperties != null)
        'CancelledChangeProperties': cancelledChangeProperties,
      if (dryRun != null) 'DryRun': dryRun,
    };
  }
}

/// Container for the response to a <code>CancelServiceSoftwareUpdate</code>
/// operation. Contains the status of the update.
class CancelServiceSoftwareUpdateResponse {
  /// Container for the state of your domain relative to the latest service
  /// software.
  final ServiceSoftwareOptions? serviceSoftwareOptions;

  CancelServiceSoftwareUpdateResponse({
    this.serviceSoftwareOptions,
  });

  factory CancelServiceSoftwareUpdateResponse.fromJson(
      Map<String, dynamic> json) {
    return CancelServiceSoftwareUpdateResponse(
      serviceSoftwareOptions: json['ServiceSoftwareOptions'] != null
          ? ServiceSoftwareOptions.fromJson(
              json['ServiceSoftwareOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSoftwareOptions = this.serviceSoftwareOptions;
    return {
      if (serviceSoftwareOptions != null)
        'ServiceSoftwareOptions': serviceSoftwareOptions,
    };
  }
}

/// A property change that was cancelled for an Amazon OpenSearch Service
/// domain.
class CancelledChangeProperty {
  /// The current value of the property, after the change was cancelled.
  final String? activeValue;

  /// The pending value of the property that was cancelled. This would have been
  /// the eventual value of the property if the chance had not been cancelled.
  final String? cancelledValue;

  /// The name of the property whose change was cancelled.
  final String? propertyName;

  CancelledChangeProperty({
    this.activeValue,
    this.cancelledValue,
    this.propertyName,
  });

  factory CancelledChangeProperty.fromJson(Map<String, dynamic> json) {
    return CancelledChangeProperty(
      activeValue: json['ActiveValue'] as String?,
      cancelledValue: json['CancelledValue'] as String?,
      propertyName: json['PropertyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeValue = this.activeValue;
    final cancelledValue = this.cancelledValue;
    final propertyName = this.propertyName;
    return {
      if (activeValue != null) 'ActiveValue': activeValue,
      if (cancelledValue != null) 'CancelledValue': cancelledValue,
      if (propertyName != null) 'PropertyName': propertyName,
    };
  }
}

/// Container for information about a configuration change happening on a
/// domain.
class ChangeProgressDetails {
  /// The ID of the configuration change.
  final String? changeId;

  /// The current status of the configuration change.
  final ConfigChangeStatus? configChangeStatus;

  /// The IAM principal who initiated the configuration change.
  final InitiatedBy? initiatedBy;

  /// The last time that the configuration change was updated.
  final DateTime? lastUpdatedTime;

  /// A message corresponding to the status of the configuration change.
  final String? message;

  /// The time that the configuration change was initiated, in Universal
  /// Coordinated Time (UTC).
  final DateTime? startTime;

  ChangeProgressDetails({
    this.changeId,
    this.configChangeStatus,
    this.initiatedBy,
    this.lastUpdatedTime,
    this.message,
    this.startTime,
  });

  factory ChangeProgressDetails.fromJson(Map<String, dynamic> json) {
    return ChangeProgressDetails(
      changeId: json['ChangeId'] as String?,
      configChangeStatus:
          (json['ConfigChangeStatus'] as String?)?.toConfigChangeStatus(),
      initiatedBy: (json['InitiatedBy'] as String?)?.toInitiatedBy(),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      message: json['Message'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final changeId = this.changeId;
    final configChangeStatus = this.configChangeStatus;
    final initiatedBy = this.initiatedBy;
    final lastUpdatedTime = this.lastUpdatedTime;
    final message = this.message;
    final startTime = this.startTime;
    return {
      if (changeId != null) 'ChangeId': changeId,
      if (configChangeStatus != null)
        'ConfigChangeStatus': configChangeStatus.toValue(),
      if (initiatedBy != null) 'InitiatedBy': initiatedBy.toValue(),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (message != null) 'Message': message,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// Progress details for each stage of a domain update.
class ChangeProgressStage {
  /// The description of the stage.
  final String? description;

  /// The most recent updated timestamp of the stage.
  final DateTime? lastUpdated;

  /// The name of the stage.
  final String? name;

  /// The status of the stage.
  final String? status;

  ChangeProgressStage({
    this.description,
    this.lastUpdated,
    this.name,
    this.status,
  });

  factory ChangeProgressStage.fromJson(Map<String, dynamic> json) {
    return ChangeProgressStage(
      description: json['Description'] as String?,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      name: json['Name'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final lastUpdated = this.lastUpdated;
    final name = this.name;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (name != null) 'Name': name,
      if (status != null) 'Status': status,
    };
  }
}

/// The progress details of a specific domain configuration change.
class ChangeProgressStatusDetails {
  /// The unique change identifier associated with a specific domain configuration
  /// change.
  final String? changeId;

  /// The specific stages that the domain is going through to perform the
  /// configuration change.
  final List<ChangeProgressStage>? changeProgressStages;

  /// The list of properties in the domain configuration change that have
  /// completed.
  final List<String>? completedProperties;

  /// The current status of the configuration change.
  final ConfigChangeStatus? configChangeStatus;

  /// The IAM principal who initiated the configuration change.
  final InitiatedBy? initiatedBy;

  /// The last time that the status of the configuration change was updated.
  final DateTime? lastUpdatedTime;

  /// The list of properties in the domain configuration change that are still
  /// pending.
  final List<String>? pendingProperties;

  /// The time at which the configuration change is made on the domain.
  final DateTime? startTime;

  /// The overall status of the domain configuration change.
  final OverallChangeStatus? status;

  /// The total number of stages required for the configuration change.
  final int? totalNumberOfStages;

  ChangeProgressStatusDetails({
    this.changeId,
    this.changeProgressStages,
    this.completedProperties,
    this.configChangeStatus,
    this.initiatedBy,
    this.lastUpdatedTime,
    this.pendingProperties,
    this.startTime,
    this.status,
    this.totalNumberOfStages,
  });

  factory ChangeProgressStatusDetails.fromJson(Map<String, dynamic> json) {
    return ChangeProgressStatusDetails(
      changeId: json['ChangeId'] as String?,
      changeProgressStages: (json['ChangeProgressStages'] as List?)
          ?.whereNotNull()
          .map((e) => ChangeProgressStage.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedProperties: (json['CompletedProperties'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      configChangeStatus:
          (json['ConfigChangeStatus'] as String?)?.toConfigChangeStatus(),
      initiatedBy: (json['InitiatedBy'] as String?)?.toInitiatedBy(),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      pendingProperties: (json['PendingProperties'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toOverallChangeStatus(),
      totalNumberOfStages: json['TotalNumberOfStages'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeId = this.changeId;
    final changeProgressStages = this.changeProgressStages;
    final completedProperties = this.completedProperties;
    final configChangeStatus = this.configChangeStatus;
    final initiatedBy = this.initiatedBy;
    final lastUpdatedTime = this.lastUpdatedTime;
    final pendingProperties = this.pendingProperties;
    final startTime = this.startTime;
    final status = this.status;
    final totalNumberOfStages = this.totalNumberOfStages;
    return {
      if (changeId != null) 'ChangeId': changeId,
      if (changeProgressStages != null)
        'ChangeProgressStages': changeProgressStages,
      if (completedProperties != null)
        'CompletedProperties': completedProperties,
      if (configChangeStatus != null)
        'ConfigChangeStatus': configChangeStatus.toValue(),
      if (initiatedBy != null) 'InitiatedBy': initiatedBy.toValue(),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (pendingProperties != null) 'PendingProperties': pendingProperties,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (totalNumberOfStages != null)
        'TotalNumberOfStages': totalNumberOfStages,
    };
  }
}

/// Container for the cluster configuration of an OpenSearch Service domain. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html">Creating
/// and managing Amazon OpenSearch Service domains</a>.
class ClusterConfig {
  /// Container for cold storage configuration options.
  final ColdStorageOptions? coldStorageOptions;

  /// Number of dedicated master nodes in the cluster. This number must be greater
  /// than 2 and not 4, otherwise you receive a validation exception.
  final int? dedicatedMasterCount;

  /// Indicates whether dedicated master nodes are enabled for the
  /// cluster.<code>True</code> if the cluster will use a dedicated master
  /// node.<code>False</code> if the cluster will not.
  final bool? dedicatedMasterEnabled;

  /// OpenSearch Service instance type of the dedicated master nodes in the
  /// cluster.
  final OpenSearchPartitionInstanceType? dedicatedMasterType;

  /// Number of data nodes in the cluster. This number must be greater than 1,
  /// otherwise you receive a validation exception.
  final int? instanceCount;

  /// Instance type of data nodes in the cluster.
  final OpenSearchPartitionInstanceType? instanceType;

  /// A boolean that indicates whether a multi-AZ domain is turned on with a
  /// standby AZ. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-multiaz.html">Configuring
  /// a multi-AZ domain in Amazon OpenSearch Service</a>.
  final bool? multiAZWithStandbyEnabled;

  /// The number of warm nodes in the cluster.
  final int? warmCount;

  /// Whether to enable warm storage for the cluster.
  final bool? warmEnabled;

  /// The instance type for the cluster's warm nodes.
  final OpenSearchWarmPartitionInstanceType? warmType;

  /// Container for zone awareness configuration options. Only required if
  /// <code>ZoneAwarenessEnabled</code> is <code>true</code>.
  final ZoneAwarenessConfig? zoneAwarenessConfig;

  /// Indicates whether multiple Availability Zones are enabled. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-multiaz.html">Configuring
  /// a multi-AZ domain in Amazon OpenSearch Service</a>.
  final bool? zoneAwarenessEnabled;

  ClusterConfig({
    this.coldStorageOptions,
    this.dedicatedMasterCount,
    this.dedicatedMasterEnabled,
    this.dedicatedMasterType,
    this.instanceCount,
    this.instanceType,
    this.multiAZWithStandbyEnabled,
    this.warmCount,
    this.warmEnabled,
    this.warmType,
    this.zoneAwarenessConfig,
    this.zoneAwarenessEnabled,
  });

  factory ClusterConfig.fromJson(Map<String, dynamic> json) {
    return ClusterConfig(
      coldStorageOptions: json['ColdStorageOptions'] != null
          ? ColdStorageOptions.fromJson(
              json['ColdStorageOptions'] as Map<String, dynamic>)
          : null,
      dedicatedMasterCount: json['DedicatedMasterCount'] as int?,
      dedicatedMasterEnabled: json['DedicatedMasterEnabled'] as bool?,
      dedicatedMasterType: (json['DedicatedMasterType'] as String?)
          ?.toOpenSearchPartitionInstanceType(),
      instanceCount: json['InstanceCount'] as int?,
      instanceType: (json['InstanceType'] as String?)
          ?.toOpenSearchPartitionInstanceType(),
      multiAZWithStandbyEnabled: json['MultiAZWithStandbyEnabled'] as bool?,
      warmCount: json['WarmCount'] as int?,
      warmEnabled: json['WarmEnabled'] as bool?,
      warmType: (json['WarmType'] as String?)
          ?.toOpenSearchWarmPartitionInstanceType(),
      zoneAwarenessConfig: json['ZoneAwarenessConfig'] != null
          ? ZoneAwarenessConfig.fromJson(
              json['ZoneAwarenessConfig'] as Map<String, dynamic>)
          : null,
      zoneAwarenessEnabled: json['ZoneAwarenessEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final coldStorageOptions = this.coldStorageOptions;
    final dedicatedMasterCount = this.dedicatedMasterCount;
    final dedicatedMasterEnabled = this.dedicatedMasterEnabled;
    final dedicatedMasterType = this.dedicatedMasterType;
    final instanceCount = this.instanceCount;
    final instanceType = this.instanceType;
    final multiAZWithStandbyEnabled = this.multiAZWithStandbyEnabled;
    final warmCount = this.warmCount;
    final warmEnabled = this.warmEnabled;
    final warmType = this.warmType;
    final zoneAwarenessConfig = this.zoneAwarenessConfig;
    final zoneAwarenessEnabled = this.zoneAwarenessEnabled;
    return {
      if (coldStorageOptions != null) 'ColdStorageOptions': coldStorageOptions,
      if (dedicatedMasterCount != null)
        'DedicatedMasterCount': dedicatedMasterCount,
      if (dedicatedMasterEnabled != null)
        'DedicatedMasterEnabled': dedicatedMasterEnabled,
      if (dedicatedMasterType != null)
        'DedicatedMasterType': dedicatedMasterType.toValue(),
      if (instanceCount != null) 'InstanceCount': instanceCount,
      if (instanceType != null) 'InstanceType': instanceType.toValue(),
      if (multiAZWithStandbyEnabled != null)
        'MultiAZWithStandbyEnabled': multiAZWithStandbyEnabled,
      if (warmCount != null) 'WarmCount': warmCount,
      if (warmEnabled != null) 'WarmEnabled': warmEnabled,
      if (warmType != null) 'WarmType': warmType.toValue(),
      if (zoneAwarenessConfig != null)
        'ZoneAwarenessConfig': zoneAwarenessConfig,
      if (zoneAwarenessEnabled != null)
        'ZoneAwarenessEnabled': zoneAwarenessEnabled,
    };
  }
}

/// The cluster configuration status for a domain.
class ClusterConfigStatus {
  /// Cluster configuration options for the specified domain.
  final ClusterConfig options;

  /// The status of cluster configuration options for the specified domain.
  final OptionStatus status;

  ClusterConfigStatus({
    required this.options,
    required this.status,
  });

  factory ClusterConfigStatus.fromJson(Map<String, dynamic> json) {
    return ClusterConfigStatus(
      options: ClusterConfig.fromJson(json['Options'] as Map<String, dynamic>),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// Container for the parameters required to enable Cognito authentication for
/// an OpenSearch Service domain. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cognito-auth.html">Configuring
/// Amazon Cognito authentication for OpenSearch Dashboards</a>.
class CognitoOptions {
  /// Whether to enable or disable Amazon Cognito authentication for OpenSearch
  /// Dashboards.
  final bool? enabled;

  /// The Amazon Cognito identity pool ID that you want OpenSearch Service to use
  /// for OpenSearch Dashboards authentication.
  final String? identityPoolId;

  /// The <code>AmazonOpenSearchServiceCognitoAccess</code> role that allows
  /// OpenSearch Service to configure your user pool and identity pool.
  final String? roleArn;

  /// The Amazon Cognito user pool ID that you want OpenSearch Service to use for
  /// OpenSearch Dashboards authentication.
  final String? userPoolId;

  CognitoOptions({
    this.enabled,
    this.identityPoolId,
    this.roleArn,
    this.userPoolId,
  });

  factory CognitoOptions.fromJson(Map<String, dynamic> json) {
    return CognitoOptions(
      enabled: json['Enabled'] as bool?,
      identityPoolId: json['IdentityPoolId'] as String?,
      roleArn: json['RoleArn'] as String?,
      userPoolId: json['UserPoolId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final identityPoolId = this.identityPoolId;
    final roleArn = this.roleArn;
    final userPoolId = this.userPoolId;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (roleArn != null) 'RoleArn': roleArn,
      if (userPoolId != null) 'UserPoolId': userPoolId,
    };
  }
}

/// The status of the Cognito options for the specified domain.
class CognitoOptionsStatus {
  /// Cognito options for the specified domain.
  final CognitoOptions options;

  /// The status of the Cognito options for the specified domain.
  final OptionStatus status;

  CognitoOptionsStatus({
    required this.options,
    required this.status,
  });

  factory CognitoOptionsStatus.fromJson(Map<String, dynamic> json) {
    return CognitoOptionsStatus(
      options: CognitoOptions.fromJson(json['Options'] as Map<String, dynamic>),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// Container for the parameters required to enable cold storage for an
/// OpenSearch Service domain. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cold-storage.html">Cold
/// storage for Amazon OpenSearch Service</a>.
class ColdStorageOptions {
  /// Whether to enable or disable cold storage on the domain. You must enable
  /// UltraWarm storage to enable cold storage.
  final bool enabled;

  ColdStorageOptions({
    required this.enabled,
  });

  factory ColdStorageOptions.fromJson(Map<String, dynamic> json) {
    return ColdStorageOptions(
      enabled: json['Enabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      'Enabled': enabled,
    };
  }
}

/// A map of OpenSearch or Elasticsearch versions and the versions you can
/// upgrade them to.
class CompatibleVersionsMap {
  /// The current version that the OpenSearch Service domain is running.
  final String? sourceVersion;

  /// The possible versions that you can upgrade the domain to.
  final List<String>? targetVersions;

  CompatibleVersionsMap({
    this.sourceVersion,
    this.targetVersions,
  });

  factory CompatibleVersionsMap.fromJson(Map<String, dynamic> json) {
    return CompatibleVersionsMap(
      sourceVersion: json['SourceVersion'] as String?,
      targetVersions: (json['TargetVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceVersion = this.sourceVersion;
    final targetVersions = this.targetVersions;
    return {
      if (sourceVersion != null) 'SourceVersion': sourceVersion,
      if (targetVersions != null) 'TargetVersions': targetVersions,
    };
  }
}

enum ConfigChangeStatus {
  pending,
  initializing,
  validating,
  validationFailed,
  applyingChanges,
  completed,
  pendingUserInput,
  cancelled,
}

extension ConfigChangeStatusValueExtension on ConfigChangeStatus {
  String toValue() {
    switch (this) {
      case ConfigChangeStatus.pending:
        return 'Pending';
      case ConfigChangeStatus.initializing:
        return 'Initializing';
      case ConfigChangeStatus.validating:
        return 'Validating';
      case ConfigChangeStatus.validationFailed:
        return 'ValidationFailed';
      case ConfigChangeStatus.applyingChanges:
        return 'ApplyingChanges';
      case ConfigChangeStatus.completed:
        return 'Completed';
      case ConfigChangeStatus.pendingUserInput:
        return 'PendingUserInput';
      case ConfigChangeStatus.cancelled:
        return 'Cancelled';
    }
  }
}

extension ConfigChangeStatusFromString on String {
  ConfigChangeStatus toConfigChangeStatus() {
    switch (this) {
      case 'Pending':
        return ConfigChangeStatus.pending;
      case 'Initializing':
        return ConfigChangeStatus.initializing;
      case 'Validating':
        return ConfigChangeStatus.validating;
      case 'ValidationFailed':
        return ConfigChangeStatus.validationFailed;
      case 'ApplyingChanges':
        return ConfigChangeStatus.applyingChanges;
      case 'Completed':
        return ConfigChangeStatus.completed;
      case 'PendingUserInput':
        return ConfigChangeStatus.pendingUserInput;
      case 'Cancelled':
        return ConfigChangeStatus.cancelled;
    }
    throw Exception('$this is not known in enum ConfigChangeStatus');
  }
}

/// The connection mode for the cross-cluster connection.
///
/// <ul>
/// <li>
/// <b>DIRECT</b> - Used for cross-cluster search or cross-cluster replication.
/// </li>
/// <li>
/// <b>VPC_ENDPOINT</b> - Used for remote reindex between Amazon OpenSearch
/// Service VPC domains.
/// </li>
/// </ul>
enum ConnectionMode {
  direct,
  vpcEndpoint,
}

extension ConnectionModeValueExtension on ConnectionMode {
  String toValue() {
    switch (this) {
      case ConnectionMode.direct:
        return 'DIRECT';
      case ConnectionMode.vpcEndpoint:
        return 'VPC_ENDPOINT';
    }
  }
}

extension ConnectionModeFromString on String {
  ConnectionMode toConnectionMode() {
    switch (this) {
      case 'DIRECT':
        return ConnectionMode.direct;
      case 'VPC_ENDPOINT':
        return ConnectionMode.vpcEndpoint;
    }
    throw Exception('$this is not known in enum ConnectionMode');
  }
}

/// The connection properties of an outbound connection.
class ConnectionProperties {
  /// The connection properties for cross cluster search.
  final CrossClusterSearchConnectionProperties? crossClusterSearch;

  /// <important>
  /// The Endpoint attribute cannot be modified.
  /// </important>
  /// The endpoint of the remote domain. Applicable for VPC_ENDPOINT connection
  /// mode.
  final String? endpoint;

  ConnectionProperties({
    this.crossClusterSearch,
    this.endpoint,
  });

  factory ConnectionProperties.fromJson(Map<String, dynamic> json) {
    return ConnectionProperties(
      crossClusterSearch: json['CrossClusterSearch'] != null
          ? CrossClusterSearchConnectionProperties.fromJson(
              json['CrossClusterSearch'] as Map<String, dynamic>)
          : null,
      endpoint: json['Endpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crossClusterSearch = this.crossClusterSearch;
    final endpoint = this.endpoint;
    return {
      if (crossClusterSearch != null) 'CrossClusterSearch': crossClusterSearch,
      if (endpoint != null) 'Endpoint': endpoint,
    };
  }
}

/// The result of a <code>CreateDomain</code> operation. Contains the status of
/// the newly created domain.
class CreateDomainResponse {
  /// The status of the newly created domain.
  final DomainStatus? domainStatus;

  CreateDomainResponse({
    this.domainStatus,
  });

  factory CreateDomainResponse.fromJson(Map<String, dynamic> json) {
    return CreateDomainResponse(
      domainStatus: json['DomainStatus'] != null
          ? DomainStatus.fromJson(json['DomainStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainStatus = this.domainStatus;
    return {
      if (domainStatus != null) 'DomainStatus': domainStatus,
    };
  }
}

/// The result of a <code>CreateOutboundConnection</code> request. Contains
/// details about the newly created cross-cluster connection.
class CreateOutboundConnectionResponse {
  /// Name of the connection.
  final String? connectionAlias;

  /// The unique identifier for the created outbound connection, which is used for
  /// subsequent operations on the connection.
  final String? connectionId;

  /// The connection mode.
  final ConnectionMode? connectionMode;

  /// The <code>ConnectionProperties</code> for the newly created connection.
  final ConnectionProperties? connectionProperties;

  /// The status of the connection.
  final OutboundConnectionStatus? connectionStatus;

  /// Information about the source (local) domain.
  final DomainInformationContainer? localDomainInfo;

  /// Information about the destination (remote) domain.
  final DomainInformationContainer? remoteDomainInfo;

  CreateOutboundConnectionResponse({
    this.connectionAlias,
    this.connectionId,
    this.connectionMode,
    this.connectionProperties,
    this.connectionStatus,
    this.localDomainInfo,
    this.remoteDomainInfo,
  });

  factory CreateOutboundConnectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateOutboundConnectionResponse(
      connectionAlias: json['ConnectionAlias'] as String?,
      connectionId: json['ConnectionId'] as String?,
      connectionMode: (json['ConnectionMode'] as String?)?.toConnectionMode(),
      connectionProperties: json['ConnectionProperties'] != null
          ? ConnectionProperties.fromJson(
              json['ConnectionProperties'] as Map<String, dynamic>)
          : null,
      connectionStatus: json['ConnectionStatus'] != null
          ? OutboundConnectionStatus.fromJson(
              json['ConnectionStatus'] as Map<String, dynamic>)
          : null,
      localDomainInfo: json['LocalDomainInfo'] != null
          ? DomainInformationContainer.fromJson(
              json['LocalDomainInfo'] as Map<String, dynamic>)
          : null,
      remoteDomainInfo: json['RemoteDomainInfo'] != null
          ? DomainInformationContainer.fromJson(
              json['RemoteDomainInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionAlias = this.connectionAlias;
    final connectionId = this.connectionId;
    final connectionMode = this.connectionMode;
    final connectionProperties = this.connectionProperties;
    final connectionStatus = this.connectionStatus;
    final localDomainInfo = this.localDomainInfo;
    final remoteDomainInfo = this.remoteDomainInfo;
    return {
      if (connectionAlias != null) 'ConnectionAlias': connectionAlias,
      if (connectionId != null) 'ConnectionId': connectionId,
      if (connectionMode != null) 'ConnectionMode': connectionMode.toValue(),
      if (connectionProperties != null)
        'ConnectionProperties': connectionProperties,
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (localDomainInfo != null) 'LocalDomainInfo': localDomainInfo,
      if (remoteDomainInfo != null) 'RemoteDomainInfo': remoteDomainInfo,
    };
  }
}

/// Container for the response returned by the <code>CreatePackage</code>
/// operation.
class CreatePackageResponse {
  /// Basic information about an OpenSearch Service package.
  final PackageDetails? packageDetails;

  CreatePackageResponse({
    this.packageDetails,
  });

  factory CreatePackageResponse.fromJson(Map<String, dynamic> json) {
    return CreatePackageResponse(
      packageDetails: json['PackageDetails'] != null
          ? PackageDetails.fromJson(
              json['PackageDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final packageDetails = this.packageDetails;
    return {
      if (packageDetails != null) 'PackageDetails': packageDetails,
    };
  }
}

class CreateVpcEndpointResponse {
  /// Information about the newly created VPC endpoint.
  final VpcEndpoint vpcEndpoint;

  CreateVpcEndpointResponse({
    required this.vpcEndpoint,
  });

  factory CreateVpcEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateVpcEndpointResponse(
      vpcEndpoint:
          VpcEndpoint.fromJson(json['VpcEndpoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcEndpoint = this.vpcEndpoint;
    return {
      'VpcEndpoint': vpcEndpoint,
    };
  }
}

/// Cross-cluster search specific connection properties.
class CrossClusterSearchConnectionProperties {
  /// The status of the <code>SkipUnavailable</code> setting for the outbound
  /// connection. This feature allows you to specify some clusters as optional and
  /// ensure that your cross-cluster queries return partial results despite
  /// failures on one or more remote clusters.
  final SkipUnavailableStatus? skipUnavailable;

  CrossClusterSearchConnectionProperties({
    this.skipUnavailable,
  });

  factory CrossClusterSearchConnectionProperties.fromJson(
      Map<String, dynamic> json) {
    return CrossClusterSearchConnectionProperties(
      skipUnavailable:
          (json['SkipUnavailable'] as String?)?.toSkipUnavailableStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final skipUnavailable = this.skipUnavailable;
    return {
      if (skipUnavailable != null) 'SkipUnavailable': skipUnavailable.toValue(),
    };
  }
}

/// Details about a direct-query data source.
class DataSourceDetails {
  /// The type of data source.
  final DataSourceType? dataSourceType;

  /// A description of the data source.
  final String? description;

  /// The name of the data source.
  final String? name;

  /// The status of the data source.
  final DataSourceStatus? status;

  DataSourceDetails({
    this.dataSourceType,
    this.description,
    this.name,
    this.status,
  });

  factory DataSourceDetails.fromJson(Map<String, dynamic> json) {
    return DataSourceDetails(
      dataSourceType: json['DataSourceType'] != null
          ? DataSourceType.fromJson(
              json['DataSourceType'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toDataSourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceType = this.dataSourceType;
    final description = this.description;
    final name = this.name;
    final status = this.status;
    return {
      if (dataSourceType != null) 'DataSourceType': dataSourceType,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum DataSourceStatus {
  active,
  disabled,
}

extension DataSourceStatusValueExtension on DataSourceStatus {
  String toValue() {
    switch (this) {
      case DataSourceStatus.active:
        return 'ACTIVE';
      case DataSourceStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension DataSourceStatusFromString on String {
  DataSourceStatus toDataSourceStatus() {
    switch (this) {
      case 'ACTIVE':
        return DataSourceStatus.active;
      case 'DISABLED':
        return DataSourceStatus.disabled;
    }
    throw Exception('$this is not known in enum DataSourceStatus');
  }
}

/// The type of data source.
class DataSourceType {
  /// An Amazon S3 data source.
  final S3GlueDataCatalog? s3GlueDataCatalog;

  DataSourceType({
    this.s3GlueDataCatalog,
  });

  factory DataSourceType.fromJson(Map<String, dynamic> json) {
    return DataSourceType(
      s3GlueDataCatalog: json['S3GlueDataCatalog'] != null
          ? S3GlueDataCatalog.fromJson(
              json['S3GlueDataCatalog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3GlueDataCatalog = this.s3GlueDataCatalog;
    return {
      if (s3GlueDataCatalog != null) 'S3GlueDataCatalog': s3GlueDataCatalog,
    };
  }
}

/// The result of a <code>GetDataSource</code> operation.
class DeleteDataSourceResponse {
  /// A message associated with deletion of the data source.
  final String? message;

  DeleteDataSourceResponse({
    this.message,
  });

  factory DeleteDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDataSourceResponse(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The results of a <code>DeleteDomain</code> request. Contains the status of
/// the pending deletion, or a "domain not found" error if the domain and all of
/// its resources have been deleted.
class DeleteDomainResponse {
  /// The status of the domain being deleted.
  final DomainStatus? domainStatus;

  DeleteDomainResponse({
    this.domainStatus,
  });

  factory DeleteDomainResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDomainResponse(
      domainStatus: json['DomainStatus'] != null
          ? DomainStatus.fromJson(json['DomainStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainStatus = this.domainStatus;
    return {
      if (domainStatus != null) 'DomainStatus': domainStatus,
    };
  }
}

/// The results of a <code>DeleteInboundConnection</code> operation. Contains
/// details about the deleted inbound connection.
class DeleteInboundConnectionResponse {
  /// The deleted inbound connection.
  final InboundConnection? connection;

  DeleteInboundConnectionResponse({
    this.connection,
  });

  factory DeleteInboundConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteInboundConnectionResponse(
      connection: json['Connection'] != null
          ? InboundConnection.fromJson(
              json['Connection'] as Map<String, dynamic>)
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

/// Details about the deleted outbound connection.
class DeleteOutboundConnectionResponse {
  /// The deleted inbound connection.
  final OutboundConnection? connection;

  DeleteOutboundConnectionResponse({
    this.connection,
  });

  factory DeleteOutboundConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteOutboundConnectionResponse(
      connection: json['Connection'] != null
          ? OutboundConnection.fromJson(
              json['Connection'] as Map<String, dynamic>)
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

/// Container for the response parameters to the <code>DeletePackage</code>
/// operation.
class DeletePackageResponse {
  /// Information about the deleted package.
  final PackageDetails? packageDetails;

  DeletePackageResponse({
    this.packageDetails,
  });

  factory DeletePackageResponse.fromJson(Map<String, dynamic> json) {
    return DeletePackageResponse(
      packageDetails: json['PackageDetails'] != null
          ? PackageDetails.fromJson(
              json['PackageDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final packageDetails = this.packageDetails;
    return {
      if (packageDetails != null) 'PackageDetails': packageDetails,
    };
  }
}

class DeleteVpcEndpointResponse {
  /// Information about the deleted endpoint, including its current status
  /// (<code>DELETING</code> or <code>DELETE_FAILED</code>).
  final VpcEndpointSummary vpcEndpointSummary;

  DeleteVpcEndpointResponse({
    required this.vpcEndpointSummary,
  });

  factory DeleteVpcEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVpcEndpointResponse(
      vpcEndpointSummary: VpcEndpointSummary.fromJson(
          json['VpcEndpointSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcEndpointSummary = this.vpcEndpointSummary;
    return {
      'VpcEndpointSummary': vpcEndpointSummary,
    };
  }
}

enum DeploymentStatus {
  pendingUpdate,
  inProgress,
  completed,
  notEligible,
  eligible,
}

extension DeploymentStatusValueExtension on DeploymentStatus {
  String toValue() {
    switch (this) {
      case DeploymentStatus.pendingUpdate:
        return 'PENDING_UPDATE';
      case DeploymentStatus.inProgress:
        return 'IN_PROGRESS';
      case DeploymentStatus.completed:
        return 'COMPLETED';
      case DeploymentStatus.notEligible:
        return 'NOT_ELIGIBLE';
      case DeploymentStatus.eligible:
        return 'ELIGIBLE';
    }
  }
}

extension DeploymentStatusFromString on String {
  DeploymentStatus toDeploymentStatus() {
    switch (this) {
      case 'PENDING_UPDATE':
        return DeploymentStatus.pendingUpdate;
      case 'IN_PROGRESS':
        return DeploymentStatus.inProgress;
      case 'COMPLETED':
        return DeploymentStatus.completed;
      case 'NOT_ELIGIBLE':
        return DeploymentStatus.notEligible;
      case 'ELIGIBLE':
        return DeploymentStatus.eligible;
    }
    throw Exception('$this is not known in enum DeploymentStatus');
  }
}

/// The result of a <code>DescribeDomainAutoTunes</code> request.
class DescribeDomainAutoTunesResponse {
  /// The list of setting adjustments that Auto-Tune has made to the domain.
  final List<AutoTune>? autoTunes;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  DescribeDomainAutoTunesResponse({
    this.autoTunes,
    this.nextToken,
  });

  factory DescribeDomainAutoTunesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDomainAutoTunesResponse(
      autoTunes: (json['AutoTunes'] as List?)
          ?.whereNotNull()
          .map((e) => AutoTune.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoTunes = this.autoTunes;
    final nextToken = this.nextToken;
    return {
      if (autoTunes != null) 'AutoTunes': autoTunes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The result of a <code>DescribeDomainChangeProgress</code> request. Contains
/// progress information for the requested domain change.
class DescribeDomainChangeProgressResponse {
  /// Container for information about the stages of a configuration change
  /// happening on a domain.
  final ChangeProgressStatusDetails? changeProgressStatus;

  DescribeDomainChangeProgressResponse({
    this.changeProgressStatus,
  });

  factory DescribeDomainChangeProgressResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDomainChangeProgressResponse(
      changeProgressStatus: json['ChangeProgressStatus'] != null
          ? ChangeProgressStatusDetails.fromJson(
              json['ChangeProgressStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeProgressStatus = this.changeProgressStatus;
    return {
      if (changeProgressStatus != null)
        'ChangeProgressStatus': changeProgressStatus,
    };
  }
}

/// Contains the configuration information of the requested domain.
class DescribeDomainConfigResponse {
  /// Container for the configuration of the OpenSearch Service domain.
  final DomainConfig domainConfig;

  DescribeDomainConfigResponse({
    required this.domainConfig,
  });

  factory DescribeDomainConfigResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDomainConfigResponse(
      domainConfig:
          DomainConfig.fromJson(json['DomainConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final domainConfig = this.domainConfig;
    return {
      'DomainConfig': domainConfig,
    };
  }
}

/// The result of a <code>DescribeDomainHealth</code> request. Contains health
/// information for the requested domain.
class DescribeDomainHealthResponse {
  /// The number of active Availability Zones configured for the domain. If the
  /// service is unable to fetch this information, it will return
  /// <code>NotAvailable</code>.
  final String? activeAvailabilityZoneCount;

  /// The number of Availability Zones configured for the domain. If the service
  /// is unable to fetch this information, it will return
  /// <code>NotAvailable</code>.
  final String? availabilityZoneCount;

  /// The current health status of your cluster.
  ///
  /// <ul>
  /// <li>
  /// <code>Red</code> - At least one primary shard is not allocated to any node.
  /// </li>
  /// <li>
  /// <code>Yellow</code> - All primary shards are allocated to nodes, but some
  /// replicas aren’t.
  /// </li>
  /// <li>
  /// <code>Green</code> - All primary shards and their replicas are allocated to
  /// nodes.
  /// </li>
  /// <li>
  /// <code>NotAvailable</code> - Unable to retrieve cluster health.
  /// </li>
  /// </ul>
  final DomainHealth? clusterHealth;

  /// The number of data nodes configured for the domain. If the service is unable
  /// to fetch this information, it will return <code>NotAvailable</code>.
  final String? dataNodeCount;

  /// A boolean that indicates if dedicated master nodes are activated for the
  /// domain.
  final bool? dedicatedMaster;

  /// The current state of the domain.
  ///
  /// <ul>
  /// <li>
  /// <code>Processing</code> - The domain has updates in progress.
  /// </li>
  /// <li>
  /// <code>Active</code> - Requested changes have been processed and deployed to
  /// the domain.
  /// </li>
  /// </ul>
  final DomainState? domainState;

  /// A list of <code>EnvironmentInfo</code> for the domain.
  final List<EnvironmentInfo>? environmentInformation;

  /// The number of nodes that can be elected as a master node. If dedicated
  /// master nodes is turned on, this value is the number of dedicated master
  /// nodes configured for the domain. If the service is unable to fetch this
  /// information, it will return <code>NotAvailable</code>.
  final String? masterEligibleNodeCount;

  /// Indicates whether the domain has an elected master node.
  ///
  /// <ul>
  /// <li>
  /// <b>Available</b> - The domain has an elected master node.
  /// </li>
  /// <li>
  /// <b>UnAvailable</b> - The master node hasn't yet been elected, and a quorum
  /// to elect a new master node hasn't been reached.
  /// </li>
  /// </ul>
  final MasterNodeStatus? masterNode;

  /// The number of standby Availability Zones configured for the domain. If the
  /// service is unable to fetch this information, it will return
  /// <code>NotAvailable</code>.
  final String? standByAvailabilityZoneCount;

  /// The total number of primary and replica shards for the domain.
  final String? totalShards;

  /// The total number of primary and replica shards not allocated to any of the
  /// nodes for the cluster.
  final String? totalUnAssignedShards;

  /// The number of warm nodes configured for the domain.
  final String? warmNodeCount;

  DescribeDomainHealthResponse({
    this.activeAvailabilityZoneCount,
    this.availabilityZoneCount,
    this.clusterHealth,
    this.dataNodeCount,
    this.dedicatedMaster,
    this.domainState,
    this.environmentInformation,
    this.masterEligibleNodeCount,
    this.masterNode,
    this.standByAvailabilityZoneCount,
    this.totalShards,
    this.totalUnAssignedShards,
    this.warmNodeCount,
  });

  factory DescribeDomainHealthResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDomainHealthResponse(
      activeAvailabilityZoneCount:
          json['ActiveAvailabilityZoneCount'] as String?,
      availabilityZoneCount: json['AvailabilityZoneCount'] as String?,
      clusterHealth: (json['ClusterHealth'] as String?)?.toDomainHealth(),
      dataNodeCount: json['DataNodeCount'] as String?,
      dedicatedMaster: json['DedicatedMaster'] as bool?,
      domainState: (json['DomainState'] as String?)?.toDomainState(),
      environmentInformation: (json['EnvironmentInformation'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      masterEligibleNodeCount: json['MasterEligibleNodeCount'] as String?,
      masterNode: (json['MasterNode'] as String?)?.toMasterNodeStatus(),
      standByAvailabilityZoneCount:
          json['StandByAvailabilityZoneCount'] as String?,
      totalShards: json['TotalShards'] as String?,
      totalUnAssignedShards: json['TotalUnAssignedShards'] as String?,
      warmNodeCount: json['WarmNodeCount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeAvailabilityZoneCount = this.activeAvailabilityZoneCount;
    final availabilityZoneCount = this.availabilityZoneCount;
    final clusterHealth = this.clusterHealth;
    final dataNodeCount = this.dataNodeCount;
    final dedicatedMaster = this.dedicatedMaster;
    final domainState = this.domainState;
    final environmentInformation = this.environmentInformation;
    final masterEligibleNodeCount = this.masterEligibleNodeCount;
    final masterNode = this.masterNode;
    final standByAvailabilityZoneCount = this.standByAvailabilityZoneCount;
    final totalShards = this.totalShards;
    final totalUnAssignedShards = this.totalUnAssignedShards;
    final warmNodeCount = this.warmNodeCount;
    return {
      if (activeAvailabilityZoneCount != null)
        'ActiveAvailabilityZoneCount': activeAvailabilityZoneCount,
      if (availabilityZoneCount != null)
        'AvailabilityZoneCount': availabilityZoneCount,
      if (clusterHealth != null) 'ClusterHealth': clusterHealth.toValue(),
      if (dataNodeCount != null) 'DataNodeCount': dataNodeCount,
      if (dedicatedMaster != null) 'DedicatedMaster': dedicatedMaster,
      if (domainState != null) 'DomainState': domainState.toValue(),
      if (environmentInformation != null)
        'EnvironmentInformation': environmentInformation,
      if (masterEligibleNodeCount != null)
        'MasterEligibleNodeCount': masterEligibleNodeCount,
      if (masterNode != null) 'MasterNode': masterNode.toValue(),
      if (standByAvailabilityZoneCount != null)
        'StandByAvailabilityZoneCount': standByAvailabilityZoneCount,
      if (totalShards != null) 'TotalShards': totalShards,
      if (totalUnAssignedShards != null)
        'TotalUnAssignedShards': totalUnAssignedShards,
      if (warmNodeCount != null) 'WarmNodeCount': warmNodeCount,
    };
  }
}

/// The result of a <code>DescribeDomainNodes</code> request. Contains
/// information about the nodes on the requested domain.
class DescribeDomainNodesResponse {
  /// Contains nodes information list <code>DomainNodesStatusList</code> with
  /// details about the all nodes on the requested domain.
  final List<DomainNodesStatus>? domainNodesStatusList;

  DescribeDomainNodesResponse({
    this.domainNodesStatusList,
  });

  factory DescribeDomainNodesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDomainNodesResponse(
      domainNodesStatusList: (json['DomainNodesStatusList'] as List?)
          ?.whereNotNull()
          .map((e) => DomainNodesStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainNodesStatusList = this.domainNodesStatusList;
    return {
      if (domainNodesStatusList != null)
        'DomainNodesStatusList': domainNodesStatusList,
    };
  }
}

/// Contains the status of the domain specified in the request.
class DescribeDomainResponse {
  /// List that contains the status of each specified OpenSearch Service domain.
  final DomainStatus domainStatus;

  DescribeDomainResponse({
    required this.domainStatus,
  });

  factory DescribeDomainResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDomainResponse(
      domainStatus:
          DomainStatus.fromJson(json['DomainStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final domainStatus = this.domainStatus;
    return {
      'DomainStatus': domainStatus,
    };
  }
}

/// Contains the status of the specified domains or all domains owned by the
/// account.
class DescribeDomainsResponse {
  /// The status of the requested domains.
  final List<DomainStatus> domainStatusList;

  DescribeDomainsResponse({
    required this.domainStatusList,
  });

  factory DescribeDomainsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDomainsResponse(
      domainStatusList: (json['DomainStatusList'] as List)
          .whereNotNull()
          .map((e) => DomainStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainStatusList = this.domainStatusList;
    return {
      'DomainStatusList': domainStatusList,
    };
  }
}

class DescribeDryRunProgressResponse {
  /// Details about the changes you're planning to make on the domain.
  final DomainStatus? dryRunConfig;

  /// The current status of the dry run, including any validation errors.
  final DryRunProgressStatus? dryRunProgressStatus;

  /// The results of the dry run.
  final DryRunResults? dryRunResults;

  DescribeDryRunProgressResponse({
    this.dryRunConfig,
    this.dryRunProgressStatus,
    this.dryRunResults,
  });

  factory DescribeDryRunProgressResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDryRunProgressResponse(
      dryRunConfig: json['DryRunConfig'] != null
          ? DomainStatus.fromJson(json['DryRunConfig'] as Map<String, dynamic>)
          : null,
      dryRunProgressStatus: json['DryRunProgressStatus'] != null
          ? DryRunProgressStatus.fromJson(
              json['DryRunProgressStatus'] as Map<String, dynamic>)
          : null,
      dryRunResults: json['DryRunResults'] != null
          ? DryRunResults.fromJson(
              json['DryRunResults'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dryRunConfig = this.dryRunConfig;
    final dryRunProgressStatus = this.dryRunProgressStatus;
    final dryRunResults = this.dryRunResults;
    return {
      if (dryRunConfig != null) 'DryRunConfig': dryRunConfig,
      if (dryRunProgressStatus != null)
        'DryRunProgressStatus': dryRunProgressStatus,
      if (dryRunResults != null) 'DryRunResults': dryRunResults,
    };
  }
}

/// Contains a list of connections matching the filter criteria.
class DescribeInboundConnectionsResponse {
  /// List of inbound connections.
  final List<InboundConnection>? connections;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  DescribeInboundConnectionsResponse({
    this.connections,
    this.nextToken,
  });

  factory DescribeInboundConnectionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeInboundConnectionsResponse(
      connections: (json['Connections'] as List?)
          ?.whereNotNull()
          .map((e) => InboundConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    final nextToken = this.nextToken;
    return {
      if (connections != null) 'Connections': connections,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Container for the parameters received from the
/// <code>DescribeInstanceTypeLimits</code> operation.
class DescribeInstanceTypeLimitsResponse {
  /// Map that contains all applicable instance type limits.<code>data</code>
  /// refers to data nodes.<code>master</code> refers to dedicated master nodes.
  final Map<String, Limits>? limitsByRole;

  DescribeInstanceTypeLimitsResponse({
    this.limitsByRole,
  });

  factory DescribeInstanceTypeLimitsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeInstanceTypeLimitsResponse(
      limitsByRole: (json['LimitsByRole'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Limits.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final limitsByRole = this.limitsByRole;
    return {
      if (limitsByRole != null) 'LimitsByRole': limitsByRole,
    };
  }
}

/// Contains a list of connections matching the filter criteria.
class DescribeOutboundConnectionsResponse {
  /// List of outbound connections that match the filter criteria.
  final List<OutboundConnection>? connections;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  DescribeOutboundConnectionsResponse({
    this.connections,
    this.nextToken,
  });

  factory DescribeOutboundConnectionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOutboundConnectionsResponse(
      connections: (json['Connections'] as List?)
          ?.whereNotNull()
          .map((e) => OutboundConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    final nextToken = this.nextToken;
    return {
      if (connections != null) 'Connections': connections,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A filter to apply to the <code>DescribePackage</code> response.
class DescribePackagesFilter {
  /// Any field from <code>PackageDetails</code>.
  final DescribePackagesFilterName? name;

  /// A non-empty list of values for the specified filter field.
  final List<String>? value;

  DescribePackagesFilter({
    this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum DescribePackagesFilterName {
  packageID,
  packageName,
  packageStatus,
  packageType,
  engineVersion,
}

extension DescribePackagesFilterNameValueExtension
    on DescribePackagesFilterName {
  String toValue() {
    switch (this) {
      case DescribePackagesFilterName.packageID:
        return 'PackageID';
      case DescribePackagesFilterName.packageName:
        return 'PackageName';
      case DescribePackagesFilterName.packageStatus:
        return 'PackageStatus';
      case DescribePackagesFilterName.packageType:
        return 'PackageType';
      case DescribePackagesFilterName.engineVersion:
        return 'EngineVersion';
    }
  }
}

extension DescribePackagesFilterNameFromString on String {
  DescribePackagesFilterName toDescribePackagesFilterName() {
    switch (this) {
      case 'PackageID':
        return DescribePackagesFilterName.packageID;
      case 'PackageName':
        return DescribePackagesFilterName.packageName;
      case 'PackageStatus':
        return DescribePackagesFilterName.packageStatus;
      case 'PackageType':
        return DescribePackagesFilterName.packageType;
      case 'EngineVersion':
        return DescribePackagesFilterName.engineVersion;
    }
    throw Exception('$this is not known in enum DescribePackagesFilterName');
  }
}

/// Container for the response returned by the <code>DescribePackages</code>
/// operation.
class DescribePackagesResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// Basic information about a package.
  final List<PackageDetails>? packageDetailsList;

  DescribePackagesResponse({
    this.nextToken,
    this.packageDetailsList,
  });

  factory DescribePackagesResponse.fromJson(Map<String, dynamic> json) {
    return DescribePackagesResponse(
      nextToken: json['NextToken'] as String?,
      packageDetailsList: (json['PackageDetailsList'] as List?)
          ?.whereNotNull()
          .map((e) => PackageDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final packageDetailsList = this.packageDetailsList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (packageDetailsList != null) 'PackageDetailsList': packageDetailsList,
    };
  }
}

/// Container for results of a <code>DescribeReservedInstanceOfferings</code>
/// request.
class DescribeReservedInstanceOfferingsResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// List of Reserved Instance offerings.
  final List<ReservedInstanceOffering>? reservedInstanceOfferings;

  DescribeReservedInstanceOfferingsResponse({
    this.nextToken,
    this.reservedInstanceOfferings,
  });

  factory DescribeReservedInstanceOfferingsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReservedInstanceOfferingsResponse(
      nextToken: json['NextToken'] as String?,
      reservedInstanceOfferings: (json['ReservedInstanceOfferings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ReservedInstanceOffering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reservedInstanceOfferings = this.reservedInstanceOfferings;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (reservedInstanceOfferings != null)
        'ReservedInstanceOfferings': reservedInstanceOfferings,
    };
  }
}

/// Container for results from <code>DescribeReservedInstances</code>
class DescribeReservedInstancesResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// List of Reserved Instances in the current Region.
  final List<ReservedInstance>? reservedInstances;

  DescribeReservedInstancesResponse({
    this.nextToken,
    this.reservedInstances,
  });

  factory DescribeReservedInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReservedInstancesResponse(
      nextToken: json['NextToken'] as String?,
      reservedInstances: (json['ReservedInstances'] as List?)
          ?.whereNotNull()
          .map((e) => ReservedInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reservedInstances = this.reservedInstances;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (reservedInstances != null) 'ReservedInstances': reservedInstances,
    };
  }
}

class DescribeVpcEndpointsResponse {
  /// Any errors associated with the request.
  final List<VpcEndpointError> vpcEndpointErrors;

  /// Information about each requested VPC endpoint.
  final List<VpcEndpoint> vpcEndpoints;

  DescribeVpcEndpointsResponse({
    required this.vpcEndpointErrors,
    required this.vpcEndpoints,
  });

  factory DescribeVpcEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeVpcEndpointsResponse(
      vpcEndpointErrors: (json['VpcEndpointErrors'] as List)
          .whereNotNull()
          .map((e) => VpcEndpointError.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcEndpoints: (json['VpcEndpoints'] as List)
          .whereNotNull()
          .map((e) => VpcEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcEndpointErrors = this.vpcEndpointErrors;
    final vpcEndpoints = this.vpcEndpoints;
    return {
      'VpcEndpointErrors': vpcEndpointErrors,
      'VpcEndpoints': vpcEndpoints,
    };
  }
}

/// Container for the response returned by an <code>DissociatePackage</code>
/// operation.
class DissociatePackageResponse {
  /// Information about a package that has been dissociated from the domain.
  final DomainPackageDetails? domainPackageDetails;

  DissociatePackageResponse({
    this.domainPackageDetails,
  });

  factory DissociatePackageResponse.fromJson(Map<String, dynamic> json) {
    return DissociatePackageResponse(
      domainPackageDetails: json['DomainPackageDetails'] != null
          ? DomainPackageDetails.fromJson(
              json['DomainPackageDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainPackageDetails = this.domainPackageDetails;
    return {
      if (domainPackageDetails != null)
        'DomainPackageDetails': domainPackageDetails,
    };
  }
}

/// Container for the configuration of an OpenSearch Service domain.
class DomainConfig {
  /// Specifies the access policies for the domain.
  final AccessPoliciesStatus? accessPolicies;

  /// Key-value pairs to specify advanced configuration options. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-advanced-options">Advanced
  /// options</a>.
  final AdvancedOptionsStatus? advancedOptions;

  /// Container for fine-grained access control settings for the domain.
  final AdvancedSecurityOptionsStatus? advancedSecurityOptions;

  /// Container for Auto-Tune settings for the domain.
  final AutoTuneOptionsStatus? autoTuneOptions;

  /// Container for information about the progress of an existing configuration
  /// change.
  final ChangeProgressDetails? changeProgressDetails;

  /// Container for the cluster configuration of a the domain.
  final ClusterConfigStatus? clusterConfig;

  /// Container for Amazon Cognito options for the domain.
  final CognitoOptionsStatus? cognitoOptions;

  /// Additional options for the domain endpoint, such as whether to require HTTPS
  /// for all traffic.
  final DomainEndpointOptionsStatus? domainEndpointOptions;

  /// Container for EBS options configured for the domain.
  final EBSOptionsStatus? eBSOptions;

  /// Key-value pairs to enable encryption at rest.
  final EncryptionAtRestOptionsStatus? encryptionAtRestOptions;

  /// The OpenSearch or Elasticsearch version that the domain is running.
  final VersionStatus? engineVersion;

  /// Choose either dual stack or IPv4 as your IP address type. Dual stack allows
  /// you to share domain resources across IPv4 and IPv6 address types, and is the
  /// recommended option. If you set your IP address type to dual stack, you can't
  /// change your address type later.
  final IPAddressTypeStatus? iPAddressType;

  /// Key-value pairs to configure log publishing.
  final LogPublishingOptionsStatus? logPublishingOptions;

  /// Information about the domain properties that are currently being modified.
  final List<ModifyingProperties>? modifyingProperties;

  /// Whether node-to-node encryption is enabled or disabled.
  final NodeToNodeEncryptionOptionsStatus? nodeToNodeEncryptionOptions;

  /// Container for off-peak window options for the domain.
  final OffPeakWindowOptionsStatus? offPeakWindowOptions;

  /// DEPRECATED. Container for parameters required to configure automated
  /// snapshots of domain indexes.
  final SnapshotOptionsStatus? snapshotOptions;

  /// Software update options for the domain.
  final SoftwareUpdateOptionsStatus? softwareUpdateOptions;

  /// The current VPC options for the domain and the status of any updates to
  /// their configuration.
  final VPCDerivedInfoStatus? vPCOptions;

  DomainConfig({
    this.accessPolicies,
    this.advancedOptions,
    this.advancedSecurityOptions,
    this.autoTuneOptions,
    this.changeProgressDetails,
    this.clusterConfig,
    this.cognitoOptions,
    this.domainEndpointOptions,
    this.eBSOptions,
    this.encryptionAtRestOptions,
    this.engineVersion,
    this.iPAddressType,
    this.logPublishingOptions,
    this.modifyingProperties,
    this.nodeToNodeEncryptionOptions,
    this.offPeakWindowOptions,
    this.snapshotOptions,
    this.softwareUpdateOptions,
    this.vPCOptions,
  });

  factory DomainConfig.fromJson(Map<String, dynamic> json) {
    return DomainConfig(
      accessPolicies: json['AccessPolicies'] != null
          ? AccessPoliciesStatus.fromJson(
              json['AccessPolicies'] as Map<String, dynamic>)
          : null,
      advancedOptions: json['AdvancedOptions'] != null
          ? AdvancedOptionsStatus.fromJson(
              json['AdvancedOptions'] as Map<String, dynamic>)
          : null,
      advancedSecurityOptions: json['AdvancedSecurityOptions'] != null
          ? AdvancedSecurityOptionsStatus.fromJson(
              json['AdvancedSecurityOptions'] as Map<String, dynamic>)
          : null,
      autoTuneOptions: json['AutoTuneOptions'] != null
          ? AutoTuneOptionsStatus.fromJson(
              json['AutoTuneOptions'] as Map<String, dynamic>)
          : null,
      changeProgressDetails: json['ChangeProgressDetails'] != null
          ? ChangeProgressDetails.fromJson(
              json['ChangeProgressDetails'] as Map<String, dynamic>)
          : null,
      clusterConfig: json['ClusterConfig'] != null
          ? ClusterConfigStatus.fromJson(
              json['ClusterConfig'] as Map<String, dynamic>)
          : null,
      cognitoOptions: json['CognitoOptions'] != null
          ? CognitoOptionsStatus.fromJson(
              json['CognitoOptions'] as Map<String, dynamic>)
          : null,
      domainEndpointOptions: json['DomainEndpointOptions'] != null
          ? DomainEndpointOptionsStatus.fromJson(
              json['DomainEndpointOptions'] as Map<String, dynamic>)
          : null,
      eBSOptions: json['EBSOptions'] != null
          ? EBSOptionsStatus.fromJson(
              json['EBSOptions'] as Map<String, dynamic>)
          : null,
      encryptionAtRestOptions: json['EncryptionAtRestOptions'] != null
          ? EncryptionAtRestOptionsStatus.fromJson(
              json['EncryptionAtRestOptions'] as Map<String, dynamic>)
          : null,
      engineVersion: json['EngineVersion'] != null
          ? VersionStatus.fromJson(
              json['EngineVersion'] as Map<String, dynamic>)
          : null,
      iPAddressType: json['IPAddressType'] != null
          ? IPAddressTypeStatus.fromJson(
              json['IPAddressType'] as Map<String, dynamic>)
          : null,
      logPublishingOptions: json['LogPublishingOptions'] != null
          ? LogPublishingOptionsStatus.fromJson(
              json['LogPublishingOptions'] as Map<String, dynamic>)
          : null,
      modifyingProperties: (json['ModifyingProperties'] as List?)
          ?.whereNotNull()
          .map((e) => ModifyingProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeToNodeEncryptionOptions: json['NodeToNodeEncryptionOptions'] != null
          ? NodeToNodeEncryptionOptionsStatus.fromJson(
              json['NodeToNodeEncryptionOptions'] as Map<String, dynamic>)
          : null,
      offPeakWindowOptions: json['OffPeakWindowOptions'] != null
          ? OffPeakWindowOptionsStatus.fromJson(
              json['OffPeakWindowOptions'] as Map<String, dynamic>)
          : null,
      snapshotOptions: json['SnapshotOptions'] != null
          ? SnapshotOptionsStatus.fromJson(
              json['SnapshotOptions'] as Map<String, dynamic>)
          : null,
      softwareUpdateOptions: json['SoftwareUpdateOptions'] != null
          ? SoftwareUpdateOptionsStatus.fromJson(
              json['SoftwareUpdateOptions'] as Map<String, dynamic>)
          : null,
      vPCOptions: json['VPCOptions'] != null
          ? VPCDerivedInfoStatus.fromJson(
              json['VPCOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicies = this.accessPolicies;
    final advancedOptions = this.advancedOptions;
    final advancedSecurityOptions = this.advancedSecurityOptions;
    final autoTuneOptions = this.autoTuneOptions;
    final changeProgressDetails = this.changeProgressDetails;
    final clusterConfig = this.clusterConfig;
    final cognitoOptions = this.cognitoOptions;
    final domainEndpointOptions = this.domainEndpointOptions;
    final eBSOptions = this.eBSOptions;
    final encryptionAtRestOptions = this.encryptionAtRestOptions;
    final engineVersion = this.engineVersion;
    final iPAddressType = this.iPAddressType;
    final logPublishingOptions = this.logPublishingOptions;
    final modifyingProperties = this.modifyingProperties;
    final nodeToNodeEncryptionOptions = this.nodeToNodeEncryptionOptions;
    final offPeakWindowOptions = this.offPeakWindowOptions;
    final snapshotOptions = this.snapshotOptions;
    final softwareUpdateOptions = this.softwareUpdateOptions;
    final vPCOptions = this.vPCOptions;
    return {
      if (accessPolicies != null) 'AccessPolicies': accessPolicies,
      if (advancedOptions != null) 'AdvancedOptions': advancedOptions,
      if (advancedSecurityOptions != null)
        'AdvancedSecurityOptions': advancedSecurityOptions,
      if (autoTuneOptions != null) 'AutoTuneOptions': autoTuneOptions,
      if (changeProgressDetails != null)
        'ChangeProgressDetails': changeProgressDetails,
      if (clusterConfig != null) 'ClusterConfig': clusterConfig,
      if (cognitoOptions != null) 'CognitoOptions': cognitoOptions,
      if (domainEndpointOptions != null)
        'DomainEndpointOptions': domainEndpointOptions,
      if (eBSOptions != null) 'EBSOptions': eBSOptions,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iPAddressType != null) 'IPAddressType': iPAddressType,
      if (logPublishingOptions != null)
        'LogPublishingOptions': logPublishingOptions,
      if (modifyingProperties != null)
        'ModifyingProperties': modifyingProperties,
      if (nodeToNodeEncryptionOptions != null)
        'NodeToNodeEncryptionOptions': nodeToNodeEncryptionOptions,
      if (offPeakWindowOptions != null)
        'OffPeakWindowOptions': offPeakWindowOptions,
      if (snapshotOptions != null) 'SnapshotOptions': snapshotOptions,
      if (softwareUpdateOptions != null)
        'SoftwareUpdateOptions': softwareUpdateOptions,
      if (vPCOptions != null) 'VPCOptions': vPCOptions,
    };
  }
}

/// Options to configure a custom endpoint for an OpenSearch Service domain.
class DomainEndpointOptions {
  /// The fully qualified URL for the custom endpoint.
  final String? customEndpoint;

  /// The ARN for your security certificate, managed in Amazon Web Services
  /// Certificate Manager (ACM).
  final String? customEndpointCertificateArn;

  /// Whether to enable a custom endpoint for the domain.
  final bool? customEndpointEnabled;

  /// True to require that all traffic to the domain arrive over HTTPS.
  final bool? enforceHTTPS;

  /// Specify the TLS security policy to apply to the HTTPS endpoint of the
  /// domain. The policy can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <b>Policy-Min-TLS-1-0-2019-07:</b> TLS security policy that supports TLS
  /// version 1.0 to TLS version 1.2
  /// </li>
  /// <li>
  /// <b>Policy-Min-TLS-1-2-2019-07:</b> TLS security policy that supports only
  /// TLS version 1.2
  /// </li>
  /// <li>
  /// <b>Policy-Min-TLS-1-2-PFS-2023-10:</b> TLS security policy that supports TLS
  /// version 1.2 to TLS version 1.3 with perfect forward secrecy cipher suites
  /// </li>
  /// </ul>
  final TLSSecurityPolicy? tLSSecurityPolicy;

  DomainEndpointOptions({
    this.customEndpoint,
    this.customEndpointCertificateArn,
    this.customEndpointEnabled,
    this.enforceHTTPS,
    this.tLSSecurityPolicy,
  });

  factory DomainEndpointOptions.fromJson(Map<String, dynamic> json) {
    return DomainEndpointOptions(
      customEndpoint: json['CustomEndpoint'] as String?,
      customEndpointCertificateArn:
          json['CustomEndpointCertificateArn'] as String?,
      customEndpointEnabled: json['CustomEndpointEnabled'] as bool?,
      enforceHTTPS: json['EnforceHTTPS'] as bool?,
      tLSSecurityPolicy:
          (json['TLSSecurityPolicy'] as String?)?.toTLSSecurityPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final customEndpoint = this.customEndpoint;
    final customEndpointCertificateArn = this.customEndpointCertificateArn;
    final customEndpointEnabled = this.customEndpointEnabled;
    final enforceHTTPS = this.enforceHTTPS;
    final tLSSecurityPolicy = this.tLSSecurityPolicy;
    return {
      if (customEndpoint != null) 'CustomEndpoint': customEndpoint,
      if (customEndpointCertificateArn != null)
        'CustomEndpointCertificateArn': customEndpointCertificateArn,
      if (customEndpointEnabled != null)
        'CustomEndpointEnabled': customEndpointEnabled,
      if (enforceHTTPS != null) 'EnforceHTTPS': enforceHTTPS,
      if (tLSSecurityPolicy != null)
        'TLSSecurityPolicy': tLSSecurityPolicy.toValue(),
    };
  }
}

/// The configured endpoint options for a domain and their current status.
class DomainEndpointOptionsStatus {
  /// Options to configure the endpoint for a domain.
  final DomainEndpointOptions options;

  /// The status of the endpoint options for a domain.
  final OptionStatus status;

  DomainEndpointOptionsStatus({
    required this.options,
    required this.status,
  });

  factory DomainEndpointOptionsStatus.fromJson(Map<String, dynamic> json) {
    return DomainEndpointOptionsStatus(
      options: DomainEndpointOptions.fromJson(
          json['Options'] as Map<String, dynamic>),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

enum DomainHealth {
  red,
  yellow,
  green,
  notAvailable,
}

extension DomainHealthValueExtension on DomainHealth {
  String toValue() {
    switch (this) {
      case DomainHealth.red:
        return 'Red';
      case DomainHealth.yellow:
        return 'Yellow';
      case DomainHealth.green:
        return 'Green';
      case DomainHealth.notAvailable:
        return 'NotAvailable';
    }
  }
}

extension DomainHealthFromString on String {
  DomainHealth toDomainHealth() {
    switch (this) {
      case 'Red':
        return DomainHealth.red;
      case 'Yellow':
        return DomainHealth.yellow;
      case 'Green':
        return DomainHealth.green;
      case 'NotAvailable':
        return DomainHealth.notAvailable;
    }
    throw Exception('$this is not known in enum DomainHealth');
  }
}

/// Information about an OpenSearch Service domain.
class DomainInfo {
  /// Name of the domain.
  final String? domainName;

  /// The type of search engine that the domain is running.<code>OpenSearch</code>
  /// for an OpenSearch engine, or <code>Elasticsearch</code> for a legacy
  /// Elasticsearch OSS engine.
  final EngineType? engineType;

  DomainInfo({
    this.domainName,
    this.engineType,
  });

  factory DomainInfo.fromJson(Map<String, dynamic> json) {
    return DomainInfo(
      domainName: json['DomainName'] as String?,
      engineType: (json['EngineType'] as String?)?.toEngineType(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final engineType = this.engineType;
    return {
      if (domainName != null) 'DomainName': domainName,
      if (engineType != null) 'EngineType': engineType.toValue(),
    };
  }
}

/// Container for information about an OpenSearch Service domain.
class DomainInformationContainer {
  /// Information about an Amazon OpenSearch Service domain.
  final AWSDomainInformation? awsDomainInformation;

  DomainInformationContainer({
    this.awsDomainInformation,
  });

  factory DomainInformationContainer.fromJson(Map<String, dynamic> json) {
    return DomainInformationContainer(
      awsDomainInformation: json['AWSDomainInformation'] != null
          ? AWSDomainInformation.fromJson(
              json['AWSDomainInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsDomainInformation = this.awsDomainInformation;
    return {
      if (awsDomainInformation != null)
        'AWSDomainInformation': awsDomainInformation,
    };
  }
}

/// Container for the domain maintenance details.
class DomainMaintenanceDetails {
  /// The name of the action.
  final MaintenanceType? action;

  /// The time at which the action was created.
  final DateTime? createdAt;

  /// The name of the domain.
  final String? domainName;

  /// The ID of the requested action.
  final String? maintenanceId;

  /// The ID of the data node.
  final String? nodeId;

  /// The status of the action.
  final MaintenanceStatus? status;

  /// The status message for the action.
  final String? statusMessage;

  /// The time at which the action was updated.
  final DateTime? updatedAt;

  DomainMaintenanceDetails({
    this.action,
    this.createdAt,
    this.domainName,
    this.maintenanceId,
    this.nodeId,
    this.status,
    this.statusMessage,
    this.updatedAt,
  });

  factory DomainMaintenanceDetails.fromJson(Map<String, dynamic> json) {
    return DomainMaintenanceDetails(
      action: (json['Action'] as String?)?.toMaintenanceType(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      domainName: json['DomainName'] as String?,
      maintenanceId: json['MaintenanceId'] as String?,
      nodeId: json['NodeId'] as String?,
      status: (json['Status'] as String?)?.toMaintenanceStatus(),
      statusMessage: json['StatusMessage'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final maintenanceId = this.maintenanceId;
    final nodeId = this.nodeId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updatedAt = this.updatedAt;
    return {
      if (action != null) 'Action': action.toValue(),
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (domainName != null) 'DomainName': domainName,
      if (maintenanceId != null) 'MaintenanceId': maintenanceId,
      if (nodeId != null) 'NodeId': nodeId,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Container for information about nodes on the domain.
class DomainNodesStatus {
  /// The Availability Zone of the node.
  final String? availabilityZone;

  /// The instance type information of the node.
  final OpenSearchPartitionInstanceType? instanceType;

  /// The ID of the node.
  final String? nodeId;

  /// Indicates if the node is active or in standby.
  final NodeStatus? nodeStatus;

  /// Indicates whether the nodes is a data, master, or ultrawarm node.
  final NodeType? nodeType;

  /// The storage size of the node, in GiB.
  final String? storageSize;

  /// Indicates if the node has EBS or instance storage.
  final String? storageType;

  /// If the nodes has EBS storage, indicates if the volume type is GP2 or GP3.
  /// Only applicable for data nodes.
  final VolumeType? storageVolumeType;

  DomainNodesStatus({
    this.availabilityZone,
    this.instanceType,
    this.nodeId,
    this.nodeStatus,
    this.nodeType,
    this.storageSize,
    this.storageType,
    this.storageVolumeType,
  });

  factory DomainNodesStatus.fromJson(Map<String, dynamic> json) {
    return DomainNodesStatus(
      availabilityZone: json['AvailabilityZone'] as String?,
      instanceType: (json['InstanceType'] as String?)
          ?.toOpenSearchPartitionInstanceType(),
      nodeId: json['NodeId'] as String?,
      nodeStatus: (json['NodeStatus'] as String?)?.toNodeStatus(),
      nodeType: (json['NodeType'] as String?)?.toNodeType(),
      storageSize: json['StorageSize'] as String?,
      storageType: json['StorageType'] as String?,
      storageVolumeType: (json['StorageVolumeType'] as String?)?.toVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final instanceType = this.instanceType;
    final nodeId = this.nodeId;
    final nodeStatus = this.nodeStatus;
    final nodeType = this.nodeType;
    final storageSize = this.storageSize;
    final storageType = this.storageType;
    final storageVolumeType = this.storageVolumeType;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (instanceType != null) 'InstanceType': instanceType.toValue(),
      if (nodeId != null) 'NodeId': nodeId,
      if (nodeStatus != null) 'NodeStatus': nodeStatus.toValue(),
      if (nodeType != null) 'NodeType': nodeType.toValue(),
      if (storageSize != null) 'StorageSize': storageSize,
      if (storageType != null) 'StorageType': storageType,
      if (storageVolumeType != null)
        'StorageVolumeType': storageVolumeType.toValue(),
    };
  }
}

/// Information about a package that is associated with a domain. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/custom-packages.html">Custom
/// packages for Amazon OpenSearch Service</a>.
class DomainPackageDetails {
  /// Name of the domain that the package is associated with.
  final String? domainName;

  /// State of the association.
  final DomainPackageStatus? domainPackageStatus;

  /// Additional information if the package is in an error state. Null otherwise.
  final ErrorDetails? errorDetails;

  /// Timestamp of the most recent update to the package association status.
  final DateTime? lastUpdated;

  /// Internal ID of the package.
  final String? packageID;

  /// User-specified name of the package.
  final String? packageName;

  /// The type of package.
  final PackageType? packageType;

  /// The current version of the package.
  final String? packageVersion;

  /// The relative path of the package on the OpenSearch Service cluster nodes.
  /// This is <code>synonym_path</code> when the package is for synonym files.
  final String? referencePath;

  DomainPackageDetails({
    this.domainName,
    this.domainPackageStatus,
    this.errorDetails,
    this.lastUpdated,
    this.packageID,
    this.packageName,
    this.packageType,
    this.packageVersion,
    this.referencePath,
  });

  factory DomainPackageDetails.fromJson(Map<String, dynamic> json) {
    return DomainPackageDetails(
      domainName: json['DomainName'] as String?,
      domainPackageStatus:
          (json['DomainPackageStatus'] as String?)?.toDomainPackageStatus(),
      errorDetails: json['ErrorDetails'] != null
          ? ErrorDetails.fromJson(json['ErrorDetails'] as Map<String, dynamic>)
          : null,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      packageID: json['PackageID'] as String?,
      packageName: json['PackageName'] as String?,
      packageType: (json['PackageType'] as String?)?.toPackageType(),
      packageVersion: json['PackageVersion'] as String?,
      referencePath: json['ReferencePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final domainPackageStatus = this.domainPackageStatus;
    final errorDetails = this.errorDetails;
    final lastUpdated = this.lastUpdated;
    final packageID = this.packageID;
    final packageName = this.packageName;
    final packageType = this.packageType;
    final packageVersion = this.packageVersion;
    final referencePath = this.referencePath;
    return {
      if (domainName != null) 'DomainName': domainName,
      if (domainPackageStatus != null)
        'DomainPackageStatus': domainPackageStatus.toValue(),
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (packageID != null) 'PackageID': packageID,
      if (packageName != null) 'PackageName': packageName,
      if (packageType != null) 'PackageType': packageType.toValue(),
      if (packageVersion != null) 'PackageVersion': packageVersion,
      if (referencePath != null) 'ReferencePath': referencePath,
    };
  }
}

enum DomainPackageStatus {
  associating,
  associationFailed,
  active,
  dissociating,
  dissociationFailed,
}

extension DomainPackageStatusValueExtension on DomainPackageStatus {
  String toValue() {
    switch (this) {
      case DomainPackageStatus.associating:
        return 'ASSOCIATING';
      case DomainPackageStatus.associationFailed:
        return 'ASSOCIATION_FAILED';
      case DomainPackageStatus.active:
        return 'ACTIVE';
      case DomainPackageStatus.dissociating:
        return 'DISSOCIATING';
      case DomainPackageStatus.dissociationFailed:
        return 'DISSOCIATION_FAILED';
    }
  }
}

extension DomainPackageStatusFromString on String {
  DomainPackageStatus toDomainPackageStatus() {
    switch (this) {
      case 'ASSOCIATING':
        return DomainPackageStatus.associating;
      case 'ASSOCIATION_FAILED':
        return DomainPackageStatus.associationFailed;
      case 'ACTIVE':
        return DomainPackageStatus.active;
      case 'DISSOCIATING':
        return DomainPackageStatus.dissociating;
      case 'DISSOCIATION_FAILED':
        return DomainPackageStatus.dissociationFailed;
    }
    throw Exception('$this is not known in enum DomainPackageStatus');
  }
}

enum DomainProcessingStatusType {
  creating,
  active,
  modifying,
  upgradingEngineVersion,
  updatingServiceSoftware,
  isolated,
  deleting,
}

extension DomainProcessingStatusTypeValueExtension
    on DomainProcessingStatusType {
  String toValue() {
    switch (this) {
      case DomainProcessingStatusType.creating:
        return 'Creating';
      case DomainProcessingStatusType.active:
        return 'Active';
      case DomainProcessingStatusType.modifying:
        return 'Modifying';
      case DomainProcessingStatusType.upgradingEngineVersion:
        return 'UpgradingEngineVersion';
      case DomainProcessingStatusType.updatingServiceSoftware:
        return 'UpdatingServiceSoftware';
      case DomainProcessingStatusType.isolated:
        return 'Isolated';
      case DomainProcessingStatusType.deleting:
        return 'Deleting';
    }
  }
}

extension DomainProcessingStatusTypeFromString on String {
  DomainProcessingStatusType toDomainProcessingStatusType() {
    switch (this) {
      case 'Creating':
        return DomainProcessingStatusType.creating;
      case 'Active':
        return DomainProcessingStatusType.active;
      case 'Modifying':
        return DomainProcessingStatusType.modifying;
      case 'UpgradingEngineVersion':
        return DomainProcessingStatusType.upgradingEngineVersion;
      case 'UpdatingServiceSoftware':
        return DomainProcessingStatusType.updatingServiceSoftware;
      case 'Isolated':
        return DomainProcessingStatusType.isolated;
      case 'Deleting':
        return DomainProcessingStatusType.deleting;
    }
    throw Exception('$this is not known in enum DomainProcessingStatusType');
  }
}

enum DomainState {
  active,
  processing,
  notAvailable,
}

extension DomainStateValueExtension on DomainState {
  String toValue() {
    switch (this) {
      case DomainState.active:
        return 'Active';
      case DomainState.processing:
        return 'Processing';
      case DomainState.notAvailable:
        return 'NotAvailable';
    }
  }
}

extension DomainStateFromString on String {
  DomainState toDomainState() {
    switch (this) {
      case 'Active':
        return DomainState.active;
      case 'Processing':
        return DomainState.processing;
      case 'NotAvailable':
        return DomainState.notAvailable;
    }
    throw Exception('$this is not known in enum DomainState');
  }
}

/// The current status of an OpenSearch Service domain.
class DomainStatus {
  /// The Amazon Resource Name (ARN) of the domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// identifiers </a> in the <i>AWS Identity and Access Management User
  /// Guide</i>.
  final String arn;

  /// Container for the cluster configuration of the domain.
  final ClusterConfig clusterConfig;

  /// Unique identifier for the domain.
  final String domainId;

  /// Name of the domain. Domain names are unique across all domains owned by the
  /// same account within an Amazon Web Services Region.
  final String domainName;

  /// Identity and Access Management (IAM) policy document specifying the access
  /// policies for the domain.
  final String? accessPolicies;

  /// Key-value pairs that specify advanced configuration options.
  final Map<String, String>? advancedOptions;

  /// Settings for fine-grained access control.
  final AdvancedSecurityOptions? advancedSecurityOptions;

  /// Auto-Tune settings for the domain.
  final AutoTuneOptionsOutput? autoTuneOptions;

  /// Information about a configuration change happening on the domain.
  final ChangeProgressDetails? changeProgressDetails;

  /// Key-value pairs to configure Amazon Cognito authentication for OpenSearch
  /// Dashboards.
  final CognitoOptions? cognitoOptions;

  /// Creation status of an OpenSearch Service domain. True if domain creation is
  /// complete. False if domain creation is still in progress.
  final bool? created;

  /// Deletion status of an OpenSearch Service domain. True if domain deletion is
  /// complete. False if domain deletion is still in progress. Once deletion is
  /// complete, the status of the domain is no longer returned.
  final bool? deleted;

  /// Additional options for the domain endpoint, such as whether to require HTTPS
  /// for all traffic.
  final DomainEndpointOptions? domainEndpointOptions;

  /// The dual stack hosted zone ID for the domain.
  final String? domainEndpointV2HostedZoneId;

  /// The status of any changes that are currently in progress for the domain.
  final DomainProcessingStatusType? domainProcessingStatus;

  /// Container for EBS-based storage settings for the domain.
  final EBSOptions? eBSOptions;

  /// Encryption at rest settings for the domain.
  final EncryptionAtRestOptions? encryptionAtRestOptions;

  /// Domain-specific endpoint used to submit index, search, and data upload
  /// requests to the domain.
  final String? endpoint;

  /// If <code>IPAddressType</code> to set to <code>dualstack</code>, a version 2
  /// domain endpoint is provisioned. This endpoint functions like a normal
  /// endpoint, except that it works with both IPv4 and IPv6 IP addresses. Normal
  /// endpoints work only with IPv4 IP addresses.
  final String? endpointV2;

  /// The key-value pair that exists if the OpenSearch Service domain uses VPC
  /// endpoints. For example:
  ///
  /// <ul>
  /// <li>
  /// <b>IPv4 IP addresses</b> -
  /// <code>'vpc','vpc-endpoint-h2dsd34efgyghrtguk5gt6j2foh4.us-east-1.es.amazonaws.com'</code>
  /// </li>
  /// <li>
  /// <b>Dual stack IP addresses</b> -
  /// <code>'vpcv2':'vpc-endpoint-h2dsd34efgyghrtguk5gt6j2foh4.aos.us-east-1.on.aws'</code>
  /// </li>
  /// </ul>
  final Map<String, String>? endpoints;

  /// Version of OpenSearch or Elasticsearch that the domain is running, in the
  /// format <code>Elasticsearch_X.Y</code> or <code>OpenSearch_X.Y</code>.
  final String? engineVersion;

  /// The type of IP addresses supported by the endpoint for the domain.
  final IPAddressType? iPAddressType;

  /// Log publishing options for the domain.
  final Map<LogType, LogPublishingOption>? logPublishingOptions;

  /// Information about the domain properties that are currently being modified.
  final List<ModifyingProperties>? modifyingProperties;

  /// Whether node-to-node encryption is enabled or disabled.
  final NodeToNodeEncryptionOptions? nodeToNodeEncryptionOptions;

  /// Options that specify a custom 10-hour window during which OpenSearch Service
  /// can perform configuration changes on the domain.
  final OffPeakWindowOptions? offPeakWindowOptions;

  /// The status of the domain configuration. True if OpenSearch Service is
  /// processing configuration changes. False if the configuration is active.
  final bool? processing;

  /// The current status of the domain's service software.
  final ServiceSoftwareOptions? serviceSoftwareOptions;

  /// DEPRECATED. Container for parameters required to configure automated
  /// snapshots of domain indexes.
  final SnapshotOptions? snapshotOptions;

  /// Service software update options for the domain.
  final SoftwareUpdateOptions? softwareUpdateOptions;

  /// The status of a domain version upgrade to a new version of OpenSearch or
  /// Elasticsearch. True if OpenSearch Service is in the process of a version
  /// upgrade. False if the configuration is active.
  final bool? upgradeProcessing;

  /// The VPC configuration for the domain.
  final VPCDerivedInfo? vPCOptions;

  DomainStatus({
    required this.arn,
    required this.clusterConfig,
    required this.domainId,
    required this.domainName,
    this.accessPolicies,
    this.advancedOptions,
    this.advancedSecurityOptions,
    this.autoTuneOptions,
    this.changeProgressDetails,
    this.cognitoOptions,
    this.created,
    this.deleted,
    this.domainEndpointOptions,
    this.domainEndpointV2HostedZoneId,
    this.domainProcessingStatus,
    this.eBSOptions,
    this.encryptionAtRestOptions,
    this.endpoint,
    this.endpointV2,
    this.endpoints,
    this.engineVersion,
    this.iPAddressType,
    this.logPublishingOptions,
    this.modifyingProperties,
    this.nodeToNodeEncryptionOptions,
    this.offPeakWindowOptions,
    this.processing,
    this.serviceSoftwareOptions,
    this.snapshotOptions,
    this.softwareUpdateOptions,
    this.upgradeProcessing,
    this.vPCOptions,
  });

  factory DomainStatus.fromJson(Map<String, dynamic> json) {
    return DomainStatus(
      arn: json['ARN'] as String,
      clusterConfig:
          ClusterConfig.fromJson(json['ClusterConfig'] as Map<String, dynamic>),
      domainId: json['DomainId'] as String,
      domainName: json['DomainName'] as String,
      accessPolicies: json['AccessPolicies'] as String?,
      advancedOptions: (json['AdvancedOptions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      advancedSecurityOptions: json['AdvancedSecurityOptions'] != null
          ? AdvancedSecurityOptions.fromJson(
              json['AdvancedSecurityOptions'] as Map<String, dynamic>)
          : null,
      autoTuneOptions: json['AutoTuneOptions'] != null
          ? AutoTuneOptionsOutput.fromJson(
              json['AutoTuneOptions'] as Map<String, dynamic>)
          : null,
      changeProgressDetails: json['ChangeProgressDetails'] != null
          ? ChangeProgressDetails.fromJson(
              json['ChangeProgressDetails'] as Map<String, dynamic>)
          : null,
      cognitoOptions: json['CognitoOptions'] != null
          ? CognitoOptions.fromJson(
              json['CognitoOptions'] as Map<String, dynamic>)
          : null,
      created: json['Created'] as bool?,
      deleted: json['Deleted'] as bool?,
      domainEndpointOptions: json['DomainEndpointOptions'] != null
          ? DomainEndpointOptions.fromJson(
              json['DomainEndpointOptions'] as Map<String, dynamic>)
          : null,
      domainEndpointV2HostedZoneId:
          json['DomainEndpointV2HostedZoneId'] as String?,
      domainProcessingStatus: (json['DomainProcessingStatus'] as String?)
          ?.toDomainProcessingStatusType(),
      eBSOptions: json['EBSOptions'] != null
          ? EBSOptions.fromJson(json['EBSOptions'] as Map<String, dynamic>)
          : null,
      encryptionAtRestOptions: json['EncryptionAtRestOptions'] != null
          ? EncryptionAtRestOptions.fromJson(
              json['EncryptionAtRestOptions'] as Map<String, dynamic>)
          : null,
      endpoint: json['Endpoint'] as String?,
      endpointV2: json['EndpointV2'] as String?,
      endpoints: (json['Endpoints'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      engineVersion: json['EngineVersion'] as String?,
      iPAddressType: (json['IPAddressType'] as String?)?.toIPAddressType(),
      logPublishingOptions:
          (json['LogPublishingOptions'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(k.toLogType(),
                  LogPublishingOption.fromJson(e as Map<String, dynamic>))),
      modifyingProperties: (json['ModifyingProperties'] as List?)
          ?.whereNotNull()
          .map((e) => ModifyingProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeToNodeEncryptionOptions: json['NodeToNodeEncryptionOptions'] != null
          ? NodeToNodeEncryptionOptions.fromJson(
              json['NodeToNodeEncryptionOptions'] as Map<String, dynamic>)
          : null,
      offPeakWindowOptions: json['OffPeakWindowOptions'] != null
          ? OffPeakWindowOptions.fromJson(
              json['OffPeakWindowOptions'] as Map<String, dynamic>)
          : null,
      processing: json['Processing'] as bool?,
      serviceSoftwareOptions: json['ServiceSoftwareOptions'] != null
          ? ServiceSoftwareOptions.fromJson(
              json['ServiceSoftwareOptions'] as Map<String, dynamic>)
          : null,
      snapshotOptions: json['SnapshotOptions'] != null
          ? SnapshotOptions.fromJson(
              json['SnapshotOptions'] as Map<String, dynamic>)
          : null,
      softwareUpdateOptions: json['SoftwareUpdateOptions'] != null
          ? SoftwareUpdateOptions.fromJson(
              json['SoftwareUpdateOptions'] as Map<String, dynamic>)
          : null,
      upgradeProcessing: json['UpgradeProcessing'] as bool?,
      vPCOptions: json['VPCOptions'] != null
          ? VPCDerivedInfo.fromJson(json['VPCOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterConfig = this.clusterConfig;
    final domainId = this.domainId;
    final domainName = this.domainName;
    final accessPolicies = this.accessPolicies;
    final advancedOptions = this.advancedOptions;
    final advancedSecurityOptions = this.advancedSecurityOptions;
    final autoTuneOptions = this.autoTuneOptions;
    final changeProgressDetails = this.changeProgressDetails;
    final cognitoOptions = this.cognitoOptions;
    final created = this.created;
    final deleted = this.deleted;
    final domainEndpointOptions = this.domainEndpointOptions;
    final domainEndpointV2HostedZoneId = this.domainEndpointV2HostedZoneId;
    final domainProcessingStatus = this.domainProcessingStatus;
    final eBSOptions = this.eBSOptions;
    final encryptionAtRestOptions = this.encryptionAtRestOptions;
    final endpoint = this.endpoint;
    final endpointV2 = this.endpointV2;
    final endpoints = this.endpoints;
    final engineVersion = this.engineVersion;
    final iPAddressType = this.iPAddressType;
    final logPublishingOptions = this.logPublishingOptions;
    final modifyingProperties = this.modifyingProperties;
    final nodeToNodeEncryptionOptions = this.nodeToNodeEncryptionOptions;
    final offPeakWindowOptions = this.offPeakWindowOptions;
    final processing = this.processing;
    final serviceSoftwareOptions = this.serviceSoftwareOptions;
    final snapshotOptions = this.snapshotOptions;
    final softwareUpdateOptions = this.softwareUpdateOptions;
    final upgradeProcessing = this.upgradeProcessing;
    final vPCOptions = this.vPCOptions;
    return {
      'ARN': arn,
      'ClusterConfig': clusterConfig,
      'DomainId': domainId,
      'DomainName': domainName,
      if (accessPolicies != null) 'AccessPolicies': accessPolicies,
      if (advancedOptions != null) 'AdvancedOptions': advancedOptions,
      if (advancedSecurityOptions != null)
        'AdvancedSecurityOptions': advancedSecurityOptions,
      if (autoTuneOptions != null) 'AutoTuneOptions': autoTuneOptions,
      if (changeProgressDetails != null)
        'ChangeProgressDetails': changeProgressDetails,
      if (cognitoOptions != null) 'CognitoOptions': cognitoOptions,
      if (created != null) 'Created': created,
      if (deleted != null) 'Deleted': deleted,
      if (domainEndpointOptions != null)
        'DomainEndpointOptions': domainEndpointOptions,
      if (domainEndpointV2HostedZoneId != null)
        'DomainEndpointV2HostedZoneId': domainEndpointV2HostedZoneId,
      if (domainProcessingStatus != null)
        'DomainProcessingStatus': domainProcessingStatus.toValue(),
      if (eBSOptions != null) 'EBSOptions': eBSOptions,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (endpoint != null) 'Endpoint': endpoint,
      if (endpointV2 != null) 'EndpointV2': endpointV2,
      if (endpoints != null) 'Endpoints': endpoints,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iPAddressType != null) 'IPAddressType': iPAddressType.toValue(),
      if (logPublishingOptions != null)
        'LogPublishingOptions':
            logPublishingOptions.map((k, e) => MapEntry(k.toValue(), e)),
      if (modifyingProperties != null)
        'ModifyingProperties': modifyingProperties,
      if (nodeToNodeEncryptionOptions != null)
        'NodeToNodeEncryptionOptions': nodeToNodeEncryptionOptions,
      if (offPeakWindowOptions != null)
        'OffPeakWindowOptions': offPeakWindowOptions,
      if (processing != null) 'Processing': processing,
      if (serviceSoftwareOptions != null)
        'ServiceSoftwareOptions': serviceSoftwareOptions,
      if (snapshotOptions != null) 'SnapshotOptions': snapshotOptions,
      if (softwareUpdateOptions != null)
        'SoftwareUpdateOptions': softwareUpdateOptions,
      if (upgradeProcessing != null) 'UpgradeProcessing': upgradeProcessing,
      if (vPCOptions != null) 'VPCOptions': vPCOptions,
    };
  }
}

enum DryRunMode {
  basic,
  verbose,
}

extension DryRunModeValueExtension on DryRunMode {
  String toValue() {
    switch (this) {
      case DryRunMode.basic:
        return 'Basic';
      case DryRunMode.verbose:
        return 'Verbose';
    }
  }
}

extension DryRunModeFromString on String {
  DryRunMode toDryRunMode() {
    switch (this) {
      case 'Basic':
        return DryRunMode.basic;
      case 'Verbose':
        return DryRunMode.verbose;
    }
    throw Exception('$this is not known in enum DryRunMode');
  }
}

/// Information about the progress of a pre-upgrade dry run analysis.
class DryRunProgressStatus {
  /// The timestamp when the dry run was initiated.
  final String creationDate;

  /// The unique identifier of the dry run.
  final String dryRunId;

  /// The current status of the dry run.
  final String dryRunStatus;

  /// The timestamp when the dry run was last updated.
  final String updateDate;

  /// Any validation failures that occurred as a result of the dry run.
  final List<ValidationFailure>? validationFailures;

  DryRunProgressStatus({
    required this.creationDate,
    required this.dryRunId,
    required this.dryRunStatus,
    required this.updateDate,
    this.validationFailures,
  });

  factory DryRunProgressStatus.fromJson(Map<String, dynamic> json) {
    return DryRunProgressStatus(
      creationDate: json['CreationDate'] as String,
      dryRunId: json['DryRunId'] as String,
      dryRunStatus: json['DryRunStatus'] as String,
      updateDate: json['UpdateDate'] as String,
      validationFailures: (json['ValidationFailures'] as List?)
          ?.whereNotNull()
          .map((e) => ValidationFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final dryRunId = this.dryRunId;
    final dryRunStatus = this.dryRunStatus;
    final updateDate = this.updateDate;
    final validationFailures = this.validationFailures;
    return {
      'CreationDate': creationDate,
      'DryRunId': dryRunId,
      'DryRunStatus': dryRunStatus,
      'UpdateDate': updateDate,
      if (validationFailures != null) 'ValidationFailures': validationFailures,
    };
  }
}

/// Results of a dry run performed in an update domain request.
class DryRunResults {
  /// Specifies the way in which OpenSearch Service will apply an update. Possible
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <b>Blue/Green</b> - The update requires a blue/green deployment.
  /// </li>
  /// <li>
  /// <b>DynamicUpdate</b> - No blue/green deployment required
  /// </li>
  /// <li>
  /// <b>Undetermined</b> - The domain is in the middle of an update and can't
  /// predict the deployment type. Try again after the update is complete.
  /// </li>
  /// <li>
  /// <b>None</b> - The request doesn't include any configuration changes.
  /// </li>
  /// </ul>
  final String? deploymentType;

  /// A message corresponding to the deployment type.
  final String? message;

  DryRunResults({
    this.deploymentType,
    this.message,
  });

  factory DryRunResults.fromJson(Map<String, dynamic> json) {
    return DryRunResults(
      deploymentType: json['DeploymentType'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentType = this.deploymentType;
    final message = this.message;
    return {
      if (deploymentType != null) 'DeploymentType': deploymentType,
      if (message != null) 'Message': message,
    };
  }
}

/// The duration of a maintenance schedule. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html">Auto-Tune
/// for Amazon OpenSearch Service</a>.
class Duration {
  /// The unit of measurement for the duration of a maintenance schedule.
  final TimeUnit? unit;

  /// Integer to specify the value of a maintenance schedule duration.
  final int? value;

  Duration({
    this.unit,
    this.value,
  });

  factory Duration.fromJson(Map<String, dynamic> json) {
    return Duration(
      unit: (json['Unit'] as String?)?.toTimeUnit(),
      value: json['Value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      if (unit != null) 'Unit': unit.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

/// Container for the parameters required to enable EBS-based storage for an
/// OpenSearch Service domain.
class EBSOptions {
  /// Indicates whether EBS volumes are attached to data nodes in an OpenSearch
  /// Service domain.
  final bool? eBSEnabled;

  /// Specifies the baseline input/output (I/O) performance of EBS volumes
  /// attached to data nodes. Applicable only for the <code>gp3</code> and
  /// provisioned IOPS EBS volume types.
  final int? iops;

  /// Specifies the throughput (in MiB/s) of the EBS volumes attached to data
  /// nodes. Applicable only for the <code>gp3</code> volume type.
  final int? throughput;

  /// Specifies the size (in GiB) of EBS volumes attached to data nodes.
  final int? volumeSize;

  /// Specifies the type of EBS volumes attached to data nodes.
  final VolumeType? volumeType;

  EBSOptions({
    this.eBSEnabled,
    this.iops,
    this.throughput,
    this.volumeSize,
    this.volumeType,
  });

  factory EBSOptions.fromJson(Map<String, dynamic> json) {
    return EBSOptions(
      eBSEnabled: json['EBSEnabled'] as bool?,
      iops: json['Iops'] as int?,
      throughput: json['Throughput'] as int?,
      volumeSize: json['VolumeSize'] as int?,
      volumeType: (json['VolumeType'] as String?)?.toVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final eBSEnabled = this.eBSEnabled;
    final iops = this.iops;
    final throughput = this.throughput;
    final volumeSize = this.volumeSize;
    final volumeType = this.volumeType;
    return {
      if (eBSEnabled != null) 'EBSEnabled': eBSEnabled,
      if (iops != null) 'Iops': iops,
      if (throughput != null) 'Throughput': throughput,
      if (volumeSize != null) 'VolumeSize': volumeSize,
      if (volumeType != null) 'VolumeType': volumeType.toValue(),
    };
  }
}

/// The status of the EBS options for the specified OpenSearch Service domain.
class EBSOptionsStatus {
  /// The configured EBS options for the specified domain.
  final EBSOptions options;

  /// The status of the EBS options for the specified domain.
  final OptionStatus status;

  EBSOptionsStatus({
    required this.options,
    required this.status,
  });

  factory EBSOptionsStatus.fromJson(Map<String, dynamic> json) {
    return EBSOptionsStatus(
      options: EBSOptions.fromJson(json['Options'] as Map<String, dynamic>),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// Specifies whether the domain should encrypt data at rest, and if so, the Key
/// Management Service (KMS) key to use. Can only be used when creating a new
/// domain or enabling encryption at rest for the first time on an existing
/// domain. You can't modify this parameter after it's already been specified.
class EncryptionAtRestOptions {
  /// True to enable encryption at rest.
  final bool? enabled;

  /// The KMS key ID. Takes the form
  /// <code>1a2a3a4-1a2a-3a4a-5a6a-1a2a3a4a5a6a</code>.
  final String? kmsKeyId;

  EncryptionAtRestOptions({
    this.enabled,
    this.kmsKeyId,
  });

  factory EncryptionAtRestOptions.fromJson(Map<String, dynamic> json) {
    return EncryptionAtRestOptions(
      enabled: json['Enabled'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final kmsKeyId = this.kmsKeyId;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

/// Status of the encryption at rest options for the specified OpenSearch
/// Service domain.
class EncryptionAtRestOptionsStatus {
  /// Encryption at rest options for the specified domain.
  final EncryptionAtRestOptions options;

  /// The status of the encryption at rest options for the specified domain.
  final OptionStatus status;

  EncryptionAtRestOptionsStatus({
    required this.options,
    required this.status,
  });

  factory EncryptionAtRestOptionsStatus.fromJson(Map<String, dynamic> json) {
    return EncryptionAtRestOptionsStatus(
      options: EncryptionAtRestOptions.fromJson(
          json['Options'] as Map<String, dynamic>),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

enum EngineType {
  openSearch,
  elasticsearch,
}

extension EngineTypeValueExtension on EngineType {
  String toValue() {
    switch (this) {
      case EngineType.openSearch:
        return 'OpenSearch';
      case EngineType.elasticsearch:
        return 'Elasticsearch';
    }
  }
}

extension EngineTypeFromString on String {
  EngineType toEngineType() {
    switch (this) {
      case 'OpenSearch':
        return EngineType.openSearch;
      case 'Elasticsearch':
        return EngineType.elasticsearch;
    }
    throw Exception('$this is not known in enum EngineType');
  }
}

/// Information about the active domain environment.
class EnvironmentInfo {
  /// A list of <code>AvailabilityZoneInfo</code> for the domain.
  final List<AvailabilityZoneInfo>? availabilityZoneInformation;

  EnvironmentInfo({
    this.availabilityZoneInformation,
  });

  factory EnvironmentInfo.fromJson(Map<String, dynamic> json) {
    return EnvironmentInfo(
      availabilityZoneInformation: (json['AvailabilityZoneInformation']
              as List?)
          ?.whereNotNull()
          .map((e) => AvailabilityZoneInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneInformation = this.availabilityZoneInformation;
    return {
      if (availabilityZoneInformation != null)
        'AvailabilityZoneInformation': availabilityZoneInformation,
    };
  }
}

/// Additional information if the package is in an error state. Null otherwise.
class ErrorDetails {
  /// A message describing the error.
  final String? errorMessage;

  /// The type of error that occurred.
  final String? errorType;

  ErrorDetails({
    this.errorMessage,
    this.errorType,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      errorMessage: json['ErrorMessage'] as String?,
      errorType: json['ErrorType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (errorType != null) 'ErrorType': errorType,
    };
  }
}

/// A filter used to limit results when describing inbound or outbound
/// cross-cluster connections. You can specify multiple values per filter. A
/// cross-cluster connection must match at least one of the specified values for
/// it to be returned from an operation.
class Filter {
  /// The name of the filter.
  final String? name;

  /// One or more values for the filter.
  final List<String>? values;

  Filter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name,
      if (values != null) 'Values': values,
    };
  }
}

/// Container for the response returned by the
/// <code>GetCompatibleVersions</code> operation.
class GetCompatibleVersionsResponse {
  /// A map of OpenSearch or Elasticsearch versions and the versions you can
  /// upgrade them to.
  final List<CompatibleVersionsMap>? compatibleVersions;

  GetCompatibleVersionsResponse({
    this.compatibleVersions,
  });

  factory GetCompatibleVersionsResponse.fromJson(Map<String, dynamic> json) {
    return GetCompatibleVersionsResponse(
      compatibleVersions: (json['CompatibleVersions'] as List?)
          ?.whereNotNull()
          .map((e) => CompatibleVersionsMap.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleVersions = this.compatibleVersions;
    return {
      if (compatibleVersions != null) 'CompatibleVersions': compatibleVersions,
    };
  }
}

/// The result of a <code>GetDataSource</code> operation.
class GetDataSourceResponse {
  /// The type of data source.
  final DataSourceType? dataSourceType;

  /// A description of the data source.
  final String? description;

  /// The name of the data source.
  final String? name;

  /// The status of the data source response.
  final DataSourceStatus? status;

  GetDataSourceResponse({
    this.dataSourceType,
    this.description,
    this.name,
    this.status,
  });

  factory GetDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return GetDataSourceResponse(
      dataSourceType: json['DataSourceType'] != null
          ? DataSourceType.fromJson(
              json['DataSourceType'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toDataSourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceType = this.dataSourceType;
    final description = this.description;
    final name = this.name;
    final status = this.status;
    return {
      if (dataSourceType != null) 'DataSourceType': dataSourceType,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// The result of a <code>GetDomainMaintenanceStatus</code> request that
/// information about the requested action.
class GetDomainMaintenanceStatusResponse {
  /// The action name.
  final MaintenanceType? action;

  /// The time at which the action was created.
  final DateTime? createdAt;

  /// The node ID of the maintenance action.
  final String? nodeId;

  /// The status of the maintenance action.
  final MaintenanceStatus? status;

  /// The status message of the maintenance action.
  final String? statusMessage;

  /// The time at which the action was updated.
  final DateTime? updatedAt;

  GetDomainMaintenanceStatusResponse({
    this.action,
    this.createdAt,
    this.nodeId,
    this.status,
    this.statusMessage,
    this.updatedAt,
  });

  factory GetDomainMaintenanceStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDomainMaintenanceStatusResponse(
      action: (json['Action'] as String?)?.toMaintenanceType(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      nodeId: json['NodeId'] as String?,
      status: (json['Status'] as String?)?.toMaintenanceStatus(),
      statusMessage: json['StatusMessage'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdAt = this.createdAt;
    final nodeId = this.nodeId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updatedAt = this.updatedAt;
    return {
      if (action != null) 'Action': action.toValue(),
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (nodeId != null) 'NodeId': nodeId,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Container for response returned by <code>GetPackageVersionHistory</code>
/// operation.
class GetPackageVersionHistoryResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// The unique identifier of the package.
  final String? packageID;

  /// A list of package versions, along with their creation time and commit
  /// message.
  final List<PackageVersionHistory>? packageVersionHistoryList;

  GetPackageVersionHistoryResponse({
    this.nextToken,
    this.packageID,
    this.packageVersionHistoryList,
  });

  factory GetPackageVersionHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetPackageVersionHistoryResponse(
      nextToken: json['NextToken'] as String?,
      packageID: json['PackageID'] as String?,
      packageVersionHistoryList: (json['PackageVersionHistoryList'] as List?)
          ?.whereNotNull()
          .map((e) => PackageVersionHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final packageID = this.packageID;
    final packageVersionHistoryList = this.packageVersionHistoryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (packageID != null) 'PackageID': packageID,
      if (packageVersionHistoryList != null)
        'PackageVersionHistoryList': packageVersionHistoryList,
    };
  }
}

/// Container for the response returned by the <code>GetUpgradeHistory</code>
/// operation.
class GetUpgradeHistoryResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// A list of objects corresponding to each upgrade or upgrade eligibility check
  /// performed on a domain.
  final List<UpgradeHistory>? upgradeHistories;

  GetUpgradeHistoryResponse({
    this.nextToken,
    this.upgradeHistories,
  });

  factory GetUpgradeHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetUpgradeHistoryResponse(
      nextToken: json['NextToken'] as String?,
      upgradeHistories: (json['UpgradeHistories'] as List?)
          ?.whereNotNull()
          .map((e) => UpgradeHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final upgradeHistories = this.upgradeHistories;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (upgradeHistories != null) 'UpgradeHistories': upgradeHistories,
    };
  }
}

/// Container for the response returned by the <code>GetUpgradeStatus</code>
/// operation.
class GetUpgradeStatusResponse {
  /// The status of the current step that an upgrade is on.
  final UpgradeStatus? stepStatus;

  /// A string that describes the update.
  final String? upgradeName;

  /// One of three steps that an upgrade or upgrade eligibility check goes
  /// through.
  final UpgradeStep? upgradeStep;

  GetUpgradeStatusResponse({
    this.stepStatus,
    this.upgradeName,
    this.upgradeStep,
  });

  factory GetUpgradeStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetUpgradeStatusResponse(
      stepStatus: (json['StepStatus'] as String?)?.toUpgradeStatus(),
      upgradeName: json['UpgradeName'] as String?,
      upgradeStep: (json['UpgradeStep'] as String?)?.toUpgradeStep(),
    );
  }

  Map<String, dynamic> toJson() {
    final stepStatus = this.stepStatus;
    final upgradeName = this.upgradeName;
    final upgradeStep = this.upgradeStep;
    return {
      if (stepStatus != null) 'StepStatus': stepStatus.toValue(),
      if (upgradeName != null) 'UpgradeName': upgradeName,
      if (upgradeStep != null) 'UpgradeStep': upgradeStep.toValue(),
    };
  }
}

enum IPAddressType {
  ipv4,
  dualstack,
}

extension IPAddressTypeValueExtension on IPAddressType {
  String toValue() {
    switch (this) {
      case IPAddressType.ipv4:
        return 'ipv4';
      case IPAddressType.dualstack:
        return 'dualstack';
    }
  }
}

extension IPAddressTypeFromString on String {
  IPAddressType toIPAddressType() {
    switch (this) {
      case 'ipv4':
        return IPAddressType.ipv4;
      case 'dualstack':
        return IPAddressType.dualstack;
    }
    throw Exception('$this is not known in enum IPAddressType');
  }
}

/// The IP address type status for the domain.
class IPAddressTypeStatus {
  /// The IP address options for the domain.
  final IPAddressType options;
  final OptionStatus status;

  IPAddressTypeStatus({
    required this.options,
    required this.status,
  });

  factory IPAddressTypeStatus.fromJson(Map<String, dynamic> json) {
    return IPAddressTypeStatus(
      options: (json['Options'] as String).toIPAddressType(),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options.toValue(),
      'Status': status,
    };
  }
}

/// Describes an inbound cross-cluster connection for Amazon OpenSearch Service.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cross-cluster-search.html">Cross-cluster
/// search for Amazon OpenSearch Service</a>.
class InboundConnection {
  /// The unique identifier of the connection.
  final String? connectionId;

  /// The connection mode.
  final ConnectionMode? connectionMode;

  /// The current status of the connection.
  final InboundConnectionStatus? connectionStatus;

  /// Information about the source (local) domain.
  final DomainInformationContainer? localDomainInfo;

  /// Information about the destination (remote) domain.
  final DomainInformationContainer? remoteDomainInfo;

  InboundConnection({
    this.connectionId,
    this.connectionMode,
    this.connectionStatus,
    this.localDomainInfo,
    this.remoteDomainInfo,
  });

  factory InboundConnection.fromJson(Map<String, dynamic> json) {
    return InboundConnection(
      connectionId: json['ConnectionId'] as String?,
      connectionMode: (json['ConnectionMode'] as String?)?.toConnectionMode(),
      connectionStatus: json['ConnectionStatus'] != null
          ? InboundConnectionStatus.fromJson(
              json['ConnectionStatus'] as Map<String, dynamic>)
          : null,
      localDomainInfo: json['LocalDomainInfo'] != null
          ? DomainInformationContainer.fromJson(
              json['LocalDomainInfo'] as Map<String, dynamic>)
          : null,
      remoteDomainInfo: json['RemoteDomainInfo'] != null
          ? DomainInformationContainer.fromJson(
              json['RemoteDomainInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionId = this.connectionId;
    final connectionMode = this.connectionMode;
    final connectionStatus = this.connectionStatus;
    final localDomainInfo = this.localDomainInfo;
    final remoteDomainInfo = this.remoteDomainInfo;
    return {
      if (connectionId != null) 'ConnectionId': connectionId,
      if (connectionMode != null) 'ConnectionMode': connectionMode.toValue(),
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (localDomainInfo != null) 'LocalDomainInfo': localDomainInfo,
      if (remoteDomainInfo != null) 'RemoteDomainInfo': remoteDomainInfo,
    };
  }
}

/// The status of an inbound cross-cluster connection for OpenSearch Service.
class InboundConnectionStatus {
  /// Information about the connection.
  final String? message;

  /// The status code for the connection. Can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>PENDING_ACCEPTANCE</b> - Inbound connection is not yet accepted by the
  /// remote domain owner.
  /// </li>
  /// <li>
  /// <b>APPROVED</b>: Inbound connection is pending acceptance by the remote
  /// domain owner.
  /// </li>
  /// <li>
  /// <b>PROVISIONING</b>: Inbound connection is being provisioned.
  /// </li>
  /// <li>
  /// <b>ACTIVE</b>: Inbound connection is active and ready to use.
  /// </li>
  /// <li>
  /// <b>REJECTING</b>: Inbound connection rejection is in process.
  /// </li>
  /// <li>
  /// <b>REJECTED</b>: Inbound connection is rejected.
  /// </li>
  /// <li>
  /// <b>DELETING</b>: Inbound connection deletion is in progress.
  /// </li>
  /// <li>
  /// <b>DELETED</b>: Inbound connection is deleted and can no longer be used.
  /// </li>
  /// </ul>
  final InboundConnectionStatusCode? statusCode;

  InboundConnectionStatus({
    this.message,
    this.statusCode,
  });

  factory InboundConnectionStatus.fromJson(Map<String, dynamic> json) {
    return InboundConnectionStatus(
      message: json['Message'] as String?,
      statusCode:
          (json['StatusCode'] as String?)?.toInboundConnectionStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final statusCode = this.statusCode;
    return {
      if (message != null) 'Message': message,
      if (statusCode != null) 'StatusCode': statusCode.toValue(),
    };
  }
}

enum InboundConnectionStatusCode {
  pendingAcceptance,
  approved,
  provisioning,
  active,
  rejecting,
  rejected,
  deleting,
  deleted,
}

extension InboundConnectionStatusCodeValueExtension
    on InboundConnectionStatusCode {
  String toValue() {
    switch (this) {
      case InboundConnectionStatusCode.pendingAcceptance:
        return 'PENDING_ACCEPTANCE';
      case InboundConnectionStatusCode.approved:
        return 'APPROVED';
      case InboundConnectionStatusCode.provisioning:
        return 'PROVISIONING';
      case InboundConnectionStatusCode.active:
        return 'ACTIVE';
      case InboundConnectionStatusCode.rejecting:
        return 'REJECTING';
      case InboundConnectionStatusCode.rejected:
        return 'REJECTED';
      case InboundConnectionStatusCode.deleting:
        return 'DELETING';
      case InboundConnectionStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension InboundConnectionStatusCodeFromString on String {
  InboundConnectionStatusCode toInboundConnectionStatusCode() {
    switch (this) {
      case 'PENDING_ACCEPTANCE':
        return InboundConnectionStatusCode.pendingAcceptance;
      case 'APPROVED':
        return InboundConnectionStatusCode.approved;
      case 'PROVISIONING':
        return InboundConnectionStatusCode.provisioning;
      case 'ACTIVE':
        return InboundConnectionStatusCode.active;
      case 'REJECTING':
        return InboundConnectionStatusCode.rejecting;
      case 'REJECTED':
        return InboundConnectionStatusCode.rejected;
      case 'DELETING':
        return InboundConnectionStatusCode.deleting;
      case 'DELETED':
        return InboundConnectionStatusCode.deleted;
    }
    throw Exception('$this is not known in enum InboundConnectionStatusCode');
  }
}

enum InitiatedBy {
  customer,
  service,
}

extension InitiatedByValueExtension on InitiatedBy {
  String toValue() {
    switch (this) {
      case InitiatedBy.customer:
        return 'CUSTOMER';
      case InitiatedBy.service:
        return 'SERVICE';
    }
  }
}

extension InitiatedByFromString on String {
  InitiatedBy toInitiatedBy() {
    switch (this) {
      case 'CUSTOMER':
        return InitiatedBy.customer;
      case 'SERVICE':
        return InitiatedBy.service;
    }
    throw Exception('$this is not known in enum InitiatedBy');
  }
}

/// Limits on the number of instances that can be created in OpenSearch Service
/// for a given instance type.
class InstanceCountLimits {
  /// The minimum allowed number of instances.
  final int? maximumInstanceCount;

  /// The maximum allowed number of instances.
  final int? minimumInstanceCount;

  InstanceCountLimits({
    this.maximumInstanceCount,
    this.minimumInstanceCount,
  });

  factory InstanceCountLimits.fromJson(Map<String, dynamic> json) {
    return InstanceCountLimits(
      maximumInstanceCount: json['MaximumInstanceCount'] as int?,
      minimumInstanceCount: json['MinimumInstanceCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumInstanceCount = this.maximumInstanceCount;
    final minimumInstanceCount = this.minimumInstanceCount;
    return {
      if (maximumInstanceCount != null)
        'MaximumInstanceCount': maximumInstanceCount,
      if (minimumInstanceCount != null)
        'MinimumInstanceCount': minimumInstanceCount,
    };
  }
}

/// Instance-related attributes that are available for a given instance type.
class InstanceLimits {
  /// Limits on the number of instances that can be created for a given instance
  /// type.
  final InstanceCountLimits? instanceCountLimits;

  InstanceLimits({
    this.instanceCountLimits,
  });

  factory InstanceLimits.fromJson(Map<String, dynamic> json) {
    return InstanceLimits(
      instanceCountLimits: json['InstanceCountLimits'] != null
          ? InstanceCountLimits.fromJson(
              json['InstanceCountLimits'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceCountLimits = this.instanceCountLimits;
    return {
      if (instanceCountLimits != null)
        'InstanceCountLimits': instanceCountLimits,
    };
  }
}

/// Lists all instance types and available features for a given OpenSearch or
/// Elasticsearch version.
class InstanceTypeDetails {
  /// Whether fine-grained access control is supported for the instance type.
  final bool? advancedSecurityEnabled;

  /// Whether logging is supported for the instance type.
  final bool? appLogsEnabled;

  /// The supported Availability Zones for the instance type.
  final List<String>? availabilityZones;

  /// Whether Amazon Cognito access is supported for the instance type.
  final bool? cognitoEnabled;

  /// Whether encryption at rest and node-to-node encryption are supported for the
  /// instance type.
  final bool? encryptionEnabled;

  /// Whether the instance acts as a data node, a dedicated master node, or an
  /// UltraWarm node.
  final List<String>? instanceRole;

  /// The instance type.
  final OpenSearchPartitionInstanceType? instanceType;

  /// Whether UltraWarm is supported for the instance type.
  final bool? warmEnabled;

  InstanceTypeDetails({
    this.advancedSecurityEnabled,
    this.appLogsEnabled,
    this.availabilityZones,
    this.cognitoEnabled,
    this.encryptionEnabled,
    this.instanceRole,
    this.instanceType,
    this.warmEnabled,
  });

  factory InstanceTypeDetails.fromJson(Map<String, dynamic> json) {
    return InstanceTypeDetails(
      advancedSecurityEnabled: json['AdvancedSecurityEnabled'] as bool?,
      appLogsEnabled: json['AppLogsEnabled'] as bool?,
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cognitoEnabled: json['CognitoEnabled'] as bool?,
      encryptionEnabled: json['EncryptionEnabled'] as bool?,
      instanceRole: (json['InstanceRole'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      instanceType: (json['InstanceType'] as String?)
          ?.toOpenSearchPartitionInstanceType(),
      warmEnabled: json['WarmEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final advancedSecurityEnabled = this.advancedSecurityEnabled;
    final appLogsEnabled = this.appLogsEnabled;
    final availabilityZones = this.availabilityZones;
    final cognitoEnabled = this.cognitoEnabled;
    final encryptionEnabled = this.encryptionEnabled;
    final instanceRole = this.instanceRole;
    final instanceType = this.instanceType;
    final warmEnabled = this.warmEnabled;
    return {
      if (advancedSecurityEnabled != null)
        'AdvancedSecurityEnabled': advancedSecurityEnabled,
      if (appLogsEnabled != null) 'AppLogsEnabled': appLogsEnabled,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (cognitoEnabled != null) 'CognitoEnabled': cognitoEnabled,
      if (encryptionEnabled != null) 'EncryptionEnabled': encryptionEnabled,
      if (instanceRole != null) 'InstanceRole': instanceRole,
      if (instanceType != null) 'InstanceType': instanceType.toValue(),
      if (warmEnabled != null) 'WarmEnabled': warmEnabled,
    };
  }
}

/// Limits for a given instance type and for each of its roles.
class Limits {
  /// List of additional limits that are specific to a given instance type for
  /// each of its instance roles.
  final List<AdditionalLimit>? additionalLimits;

  /// The limits for a given instance type.
  final InstanceLimits? instanceLimits;

  /// Storage-related attributes that are available for a given instance type.
  final List<StorageType>? storageTypes;

  Limits({
    this.additionalLimits,
    this.instanceLimits,
    this.storageTypes,
  });

  factory Limits.fromJson(Map<String, dynamic> json) {
    return Limits(
      additionalLimits: (json['AdditionalLimits'] as List?)
          ?.whereNotNull()
          .map((e) => AdditionalLimit.fromJson(e as Map<String, dynamic>))
          .toList(),
      instanceLimits: json['InstanceLimits'] != null
          ? InstanceLimits.fromJson(
              json['InstanceLimits'] as Map<String, dynamic>)
          : null,
      storageTypes: (json['StorageTypes'] as List?)
          ?.whereNotNull()
          .map((e) => StorageType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalLimits = this.additionalLimits;
    final instanceLimits = this.instanceLimits;
    final storageTypes = this.storageTypes;
    return {
      if (additionalLimits != null) 'AdditionalLimits': additionalLimits,
      if (instanceLimits != null) 'InstanceLimits': instanceLimits,
      if (storageTypes != null) 'StorageTypes': storageTypes,
    };
  }
}

/// The result of a <code>ListDataSources</code> operation.
class ListDataSourcesResponse {
  /// A list of data sources associated with specified domain.
  final List<DataSourceDetails>? dataSources;

  ListDataSourcesResponse({
    this.dataSources,
  });

  factory ListDataSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSourcesResponse(
      dataSources: (json['DataSources'] as List?)
          ?.whereNotNull()
          .map((e) => DataSourceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSources = this.dataSources;
    return {
      if (dataSources != null) 'DataSources': dataSources,
    };
  }
}

/// The result of a <code>ListDomainMaintenances</code> request that contains
/// information about the requested actions.
class ListDomainMaintenancesResponse {
  /// A list of the submitted maintenance actions.
  final List<DomainMaintenanceDetails>? domainMaintenances;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListDomainMaintenancesResponse({
    this.domainMaintenances,
    this.nextToken,
  });

  factory ListDomainMaintenancesResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainMaintenancesResponse(
      domainMaintenances: (json['DomainMaintenances'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DomainMaintenanceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainMaintenances = this.domainMaintenances;
    final nextToken = this.nextToken;
    return {
      if (domainMaintenances != null) 'DomainMaintenances': domainMaintenances,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The results of a <code>ListDomainNames</code> operation. Contains the names
/// of all domains owned by this account and their respective engine types.
class ListDomainNamesResponse {
  /// The names of all OpenSearch Service domains owned by the current user and
  /// their respective engine types.
  final List<DomainInfo>? domainNames;

  ListDomainNamesResponse({
    this.domainNames,
  });

  factory ListDomainNamesResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainNamesResponse(
      domainNames: (json['DomainNames'] as List?)
          ?.whereNotNull()
          .map((e) => DomainInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainNames = this.domainNames;
    return {
      if (domainNames != null) 'DomainNames': domainNames,
    };
  }
}

/// Container for the response parameters to the
/// <code>ListDomainsForPackage</code> operation.
class ListDomainsForPackageResponse {
  /// Information about all domains associated with a package.
  final List<DomainPackageDetails>? domainPackageDetailsList;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListDomainsForPackageResponse({
    this.domainPackageDetailsList,
    this.nextToken,
  });

  factory ListDomainsForPackageResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainsForPackageResponse(
      domainPackageDetailsList: (json['DomainPackageDetailsList'] as List?)
          ?.whereNotNull()
          .map((e) => DomainPackageDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainPackageDetailsList = this.domainPackageDetailsList;
    final nextToken = this.nextToken;
    return {
      if (domainPackageDetailsList != null)
        'DomainPackageDetailsList': domainPackageDetailsList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListInstanceTypeDetailsResponse {
  /// Lists all supported instance types and features for the given OpenSearch or
  /// Elasticsearch version.
  final List<InstanceTypeDetails>? instanceTypeDetails;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListInstanceTypeDetailsResponse({
    this.instanceTypeDetails,
    this.nextToken,
  });

  factory ListInstanceTypeDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ListInstanceTypeDetailsResponse(
      instanceTypeDetails: (json['InstanceTypeDetails'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceTypeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceTypeDetails = this.instanceTypeDetails;
    final nextToken = this.nextToken;
    return {
      if (instanceTypeDetails != null)
        'InstanceTypeDetails': instanceTypeDetails,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Container for the response parameters to the
/// <code>ListPackagesForDomain</code> operation.
class ListPackagesForDomainResponse {
  /// List of all packages associated with a domain.
  final List<DomainPackageDetails>? domainPackageDetailsList;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListPackagesForDomainResponse({
    this.domainPackageDetailsList,
    this.nextToken,
  });

  factory ListPackagesForDomainResponse.fromJson(Map<String, dynamic> json) {
    return ListPackagesForDomainResponse(
      domainPackageDetailsList: (json['DomainPackageDetailsList'] as List?)
          ?.whereNotNull()
          .map((e) => DomainPackageDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainPackageDetailsList = this.domainPackageDetailsList;
    final nextToken = this.nextToken;
    return {
      if (domainPackageDetailsList != null)
        'DomainPackageDetailsList': domainPackageDetailsList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListScheduledActionsResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// A list of actions that are scheduled for the domain.
  final List<ScheduledAction>? scheduledActions;

  ListScheduledActionsResponse({
    this.nextToken,
    this.scheduledActions,
  });

  factory ListScheduledActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListScheduledActionsResponse(
      nextToken: json['NextToken'] as String?,
      scheduledActions: (json['ScheduledActions'] as List?)
          ?.whereNotNull()
          .map((e) => ScheduledAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scheduledActions = this.scheduledActions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (scheduledActions != null) 'ScheduledActions': scheduledActions,
    };
  }
}

/// The results of a <code>ListTags</code> operation.
class ListTagsResponse {
  /// List of resource tags associated with the specified domain.
  final List<Tag>? tagList;

  ListTagsResponse({
    this.tagList,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
      tagList: (json['TagList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      if (tagList != null) 'TagList': tagList,
    };
  }
}

/// Container for the parameters for response received from the
/// <code>ListVersions</code> operation.
class ListVersionsResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// A list of all versions of OpenSearch and Elasticsearch that Amazon
  /// OpenSearch Service supports.
  final List<String>? versions;

  ListVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListVersionsResponse(
      nextToken: json['NextToken'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (versions != null) 'Versions': versions,
    };
  }
}

class ListVpcEndpointAccessResponse {
  /// A list of <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html">IAM
  /// principals</a> that can currently access the domain.
  final List<AuthorizedPrincipal> authorizedPrincipalList;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String nextToken;

  ListVpcEndpointAccessResponse({
    required this.authorizedPrincipalList,
    required this.nextToken,
  });

  factory ListVpcEndpointAccessResponse.fromJson(Map<String, dynamic> json) {
    return ListVpcEndpointAccessResponse(
      authorizedPrincipalList: (json['AuthorizedPrincipalList'] as List)
          .whereNotNull()
          .map((e) => AuthorizedPrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizedPrincipalList = this.authorizedPrincipalList;
    final nextToken = this.nextToken;
    return {
      'AuthorizedPrincipalList': authorizedPrincipalList,
      'NextToken': nextToken,
    };
  }
}

class ListVpcEndpointsForDomainResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String nextToken;

  /// Information about each endpoint associated with the domain.
  final List<VpcEndpointSummary> vpcEndpointSummaryList;

  ListVpcEndpointsForDomainResponse({
    required this.nextToken,
    required this.vpcEndpointSummaryList,
  });

  factory ListVpcEndpointsForDomainResponse.fromJson(
      Map<String, dynamic> json) {
    return ListVpcEndpointsForDomainResponse(
      nextToken: json['NextToken'] as String,
      vpcEndpointSummaryList: (json['VpcEndpointSummaryList'] as List)
          .whereNotNull()
          .map((e) => VpcEndpointSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final vpcEndpointSummaryList = this.vpcEndpointSummaryList;
    return {
      'NextToken': nextToken,
      'VpcEndpointSummaryList': vpcEndpointSummaryList,
    };
  }
}

class ListVpcEndpointsResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Send the request again using the returned token to retrieve the next
  /// page.
  final String nextToken;

  /// Information about each endpoint.
  final List<VpcEndpointSummary> vpcEndpointSummaryList;

  ListVpcEndpointsResponse({
    required this.nextToken,
    required this.vpcEndpointSummaryList,
  });

  factory ListVpcEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListVpcEndpointsResponse(
      nextToken: json['NextToken'] as String,
      vpcEndpointSummaryList: (json['VpcEndpointSummaryList'] as List)
          .whereNotNull()
          .map((e) => VpcEndpointSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final vpcEndpointSummaryList = this.vpcEndpointSummaryList;
    return {
      'NextToken': nextToken,
      'VpcEndpointSummaryList': vpcEndpointSummaryList,
    };
  }
}

/// Specifies whether the Amazon OpenSearch Service domain publishes the
/// OpenSearch application and slow logs to Amazon CloudWatch. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createdomain-configure-slow-logs.html">Monitoring
/// OpenSearch logs with Amazon CloudWatch Logs</a>.
/// <note>
/// After you enable log publishing, you still have to enable the collection of
/// slow logs using the OpenSearch REST API.
/// </note>
class LogPublishingOption {
  /// The Amazon Resource Name (ARN) of the CloudWatch Logs group to publish logs
  /// to.
  final String? cloudWatchLogsLogGroupArn;

  /// Whether the log should be published.
  final bool? enabled;

  LogPublishingOption({
    this.cloudWatchLogsLogGroupArn,
    this.enabled,
  });

  factory LogPublishingOption.fromJson(Map<String, dynamic> json) {
    return LogPublishingOption(
      cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String?,
      enabled: json['Enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsLogGroupArn = this.cloudWatchLogsLogGroupArn;
    final enabled = this.enabled;
    return {
      if (cloudWatchLogsLogGroupArn != null)
        'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// The configured log publishing options for the domain and their current
/// status.
class LogPublishingOptionsStatus {
  /// The log publishing options configured for the domain.
  final Map<LogType, LogPublishingOption>? options;

  /// The status of the log publishing options for the domain.
  final OptionStatus? status;

  LogPublishingOptionsStatus({
    this.options,
    this.status,
  });

  factory LogPublishingOptionsStatus.fromJson(Map<String, dynamic> json) {
    return LogPublishingOptionsStatus(
      options: (json['Options'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toLogType(),
              LogPublishingOption.fromJson(e as Map<String, dynamic>))),
      status: json['Status'] != null
          ? OptionStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      if (options != null)
        'Options': options.map((k, e) => MapEntry(k.toValue(), e)),
      if (status != null) 'Status': status,
    };
  }
}

/// The type of log file. Can be one of the following:
///
/// <ul>
/// <li>
/// <b>INDEX_SLOW_LOGS</b> - Index slow logs contain insert requests that took
/// more time than the configured index query log threshold to execute.
/// </li>
/// <li>
/// <b>SEARCH_SLOW_LOGS</b> - Search slow logs contain search queries that took
/// more time than the configured search query log threshold to execute.
/// </li>
/// <li>
/// <b>ES_APPLICATION_LOGS</b> - OpenSearch application logs contain information
/// about errors and warnings raised during the operation of the service and can
/// be useful for troubleshooting.
/// </li>
/// <li>
/// <b>AUDIT_LOGS</b> - Audit logs contain records of user requests for access
/// to the domain.
/// </li>
/// </ul>
enum LogType {
  indexSlowLogs,
  searchSlowLogs,
  esApplicationLogs,
  auditLogs,
}

extension LogTypeValueExtension on LogType {
  String toValue() {
    switch (this) {
      case LogType.indexSlowLogs:
        return 'INDEX_SLOW_LOGS';
      case LogType.searchSlowLogs:
        return 'SEARCH_SLOW_LOGS';
      case LogType.esApplicationLogs:
        return 'ES_APPLICATION_LOGS';
      case LogType.auditLogs:
        return 'AUDIT_LOGS';
    }
  }
}

extension LogTypeFromString on String {
  LogType toLogType() {
    switch (this) {
      case 'INDEX_SLOW_LOGS':
        return LogType.indexSlowLogs;
      case 'SEARCH_SLOW_LOGS':
        return LogType.searchSlowLogs;
      case 'ES_APPLICATION_LOGS':
        return LogType.esApplicationLogs;
      case 'AUDIT_LOGS':
        return LogType.auditLogs;
    }
    throw Exception('$this is not known in enum LogType');
  }
}

enum MaintenanceStatus {
  pending,
  inProgress,
  completed,
  failed,
  timedOut,
}

extension MaintenanceStatusValueExtension on MaintenanceStatus {
  String toValue() {
    switch (this) {
      case MaintenanceStatus.pending:
        return 'PENDING';
      case MaintenanceStatus.inProgress:
        return 'IN_PROGRESS';
      case MaintenanceStatus.completed:
        return 'COMPLETED';
      case MaintenanceStatus.failed:
        return 'FAILED';
      case MaintenanceStatus.timedOut:
        return 'TIMED_OUT';
    }
  }
}

extension MaintenanceStatusFromString on String {
  MaintenanceStatus toMaintenanceStatus() {
    switch (this) {
      case 'PENDING':
        return MaintenanceStatus.pending;
      case 'IN_PROGRESS':
        return MaintenanceStatus.inProgress;
      case 'COMPLETED':
        return MaintenanceStatus.completed;
      case 'FAILED':
        return MaintenanceStatus.failed;
      case 'TIMED_OUT':
        return MaintenanceStatus.timedOut;
    }
    throw Exception('$this is not known in enum MaintenanceStatus');
  }
}

enum MaintenanceType {
  rebootNode,
  restartSearchProcess,
  restartDashboard,
}

extension MaintenanceTypeValueExtension on MaintenanceType {
  String toValue() {
    switch (this) {
      case MaintenanceType.rebootNode:
        return 'REBOOT_NODE';
      case MaintenanceType.restartSearchProcess:
        return 'RESTART_SEARCH_PROCESS';
      case MaintenanceType.restartDashboard:
        return 'RESTART_DASHBOARD';
    }
  }
}

extension MaintenanceTypeFromString on String {
  MaintenanceType toMaintenanceType() {
    switch (this) {
      case 'REBOOT_NODE':
        return MaintenanceType.rebootNode;
      case 'RESTART_SEARCH_PROCESS':
        return MaintenanceType.restartSearchProcess;
      case 'RESTART_DASHBOARD':
        return MaintenanceType.restartDashboard;
    }
    throw Exception('$this is not known in enum MaintenanceType');
  }
}

enum MasterNodeStatus {
  available,
  unAvailable,
}

extension MasterNodeStatusValueExtension on MasterNodeStatus {
  String toValue() {
    switch (this) {
      case MasterNodeStatus.available:
        return 'Available';
      case MasterNodeStatus.unAvailable:
        return 'UnAvailable';
    }
  }
}

extension MasterNodeStatusFromString on String {
  MasterNodeStatus toMasterNodeStatus() {
    switch (this) {
      case 'Available':
        return MasterNodeStatus.available;
      case 'UnAvailable':
        return MasterNodeStatus.unAvailable;
    }
    throw Exception('$this is not known in enum MasterNodeStatus');
  }
}

/// Credentials for the master user for a domain.
class MasterUserOptions {
  /// Amazon Resource Name (ARN) for the master user. Only specify if
  /// <code>InternalUserDatabaseEnabled</code> is <code>false</code>.
  final String? masterUserARN;

  /// User name for the master user. Only specify if
  /// <code>InternalUserDatabaseEnabled</code> is <code>true</code>.
  final String? masterUserName;

  /// Password for the master user. Only specify if
  /// <code>InternalUserDatabaseEnabled</code> is <code>true</code>.
  final String? masterUserPassword;

  MasterUserOptions({
    this.masterUserARN,
    this.masterUserName,
    this.masterUserPassword,
  });

  Map<String, dynamic> toJson() {
    final masterUserARN = this.masterUserARN;
    final masterUserName = this.masterUserName;
    final masterUserPassword = this.masterUserPassword;
    return {
      if (masterUserARN != null) 'MasterUserARN': masterUserARN,
      if (masterUserName != null) 'MasterUserName': masterUserName,
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
    };
  }
}

/// Information about the domain properties that are currently being modified.
class ModifyingProperties {
  /// The current value of the domain property that is being modified.
  final String? activeValue;

  /// The name of the property that is currently being modified.
  final String? name;

  /// The value that the property that is currently being modified will eventually
  /// have.
  final String? pendingValue;

  /// The type of value that is currently being modified. Properties can have two
  /// types:
  ///
  /// <ul>
  /// <li>
  /// <code>PLAIN_TEXT</code>: Contain direct values such as "1", "True", or
  /// "c5.large.search".
  /// </li>
  /// <li>
  /// <code>STRINGIFIED_JSON</code>: Contain content in JSON format, such as
  /// {"Enabled":"True"}".
  /// </li>
  /// </ul>
  final PropertyValueType? valueType;

  ModifyingProperties({
    this.activeValue,
    this.name,
    this.pendingValue,
    this.valueType,
  });

  factory ModifyingProperties.fromJson(Map<String, dynamic> json) {
    return ModifyingProperties(
      activeValue: json['ActiveValue'] as String?,
      name: json['Name'] as String?,
      pendingValue: json['PendingValue'] as String?,
      valueType: (json['ValueType'] as String?)?.toPropertyValueType(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeValue = this.activeValue;
    final name = this.name;
    final pendingValue = this.pendingValue;
    final valueType = this.valueType;
    return {
      if (activeValue != null) 'ActiveValue': activeValue,
      if (name != null) 'Name': name,
      if (pendingValue != null) 'PendingValue': pendingValue,
      if (valueType != null) 'ValueType': valueType.toValue(),
    };
  }
}

enum NodeStatus {
  active,
  standBy,
  notAvailable,
}

extension NodeStatusValueExtension on NodeStatus {
  String toValue() {
    switch (this) {
      case NodeStatus.active:
        return 'Active';
      case NodeStatus.standBy:
        return 'StandBy';
      case NodeStatus.notAvailable:
        return 'NotAvailable';
    }
  }
}

extension NodeStatusFromString on String {
  NodeStatus toNodeStatus() {
    switch (this) {
      case 'Active':
        return NodeStatus.active;
      case 'StandBy':
        return NodeStatus.standBy;
      case 'NotAvailable':
        return NodeStatus.notAvailable;
    }
    throw Exception('$this is not known in enum NodeStatus');
  }
}

/// Enables or disables node-to-node encryption. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/ntn.html">Node-to-node
/// encryption for Amazon OpenSearch Service</a>.
class NodeToNodeEncryptionOptions {
  /// True to enable node-to-node encryption.
  final bool? enabled;

  NodeToNodeEncryptionOptions({
    this.enabled,
  });

  factory NodeToNodeEncryptionOptions.fromJson(Map<String, dynamic> json) {
    return NodeToNodeEncryptionOptions(
      enabled: json['Enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Status of the node-to-node encryption options for the specified domain.
class NodeToNodeEncryptionOptionsStatus {
  /// The node-to-node encryption options for the specified domain.
  final NodeToNodeEncryptionOptions options;

  /// The status of the node-to-node encryption options for the specified domain.
  final OptionStatus status;

  NodeToNodeEncryptionOptionsStatus({
    required this.options,
    required this.status,
  });

  factory NodeToNodeEncryptionOptionsStatus.fromJson(
      Map<String, dynamic> json) {
    return NodeToNodeEncryptionOptionsStatus(
      options: NodeToNodeEncryptionOptions.fromJson(
          json['Options'] as Map<String, dynamic>),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

enum NodeType {
  data,
  ultrawarm,
  master,
}

extension NodeTypeValueExtension on NodeType {
  String toValue() {
    switch (this) {
      case NodeType.data:
        return 'Data';
      case NodeType.ultrawarm:
        return 'Ultrawarm';
      case NodeType.master:
        return 'Master';
    }
  }
}

extension NodeTypeFromString on String {
  NodeType toNodeType() {
    switch (this) {
      case 'Data':
        return NodeType.data;
      case 'Ultrawarm':
        return NodeType.ultrawarm;
      case 'Master':
        return NodeType.master;
    }
    throw Exception('$this is not known in enum NodeType');
  }
}

/// A custom 10-hour, low-traffic window during which OpenSearch Service can
/// perform mandatory configuration changes on the domain. These actions can
/// include scheduled service software updates and blue/green Auto-Tune
/// enhancements. OpenSearch Service will schedule these actions during the
/// window that you specify.
///
/// If you don't specify a window start time, it defaults to 10:00 P.M. local
/// time.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/off-peak.html">Defining
/// off-peak maintenance windows for Amazon OpenSearch Service</a>.
class OffPeakWindow {
  /// A custom start time for the off-peak window, in Coordinated Universal Time
  /// (UTC). The window length will always be 10 hours, so you can't specify an
  /// end time. For example, if you specify 11:00 P.M. UTC as a start time, the
  /// end time will automatically be set to 9:00 A.M.
  final WindowStartTime? windowStartTime;

  OffPeakWindow({
    this.windowStartTime,
  });

  factory OffPeakWindow.fromJson(Map<String, dynamic> json) {
    return OffPeakWindow(
      windowStartTime: json['WindowStartTime'] != null
          ? WindowStartTime.fromJson(
              json['WindowStartTime'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final windowStartTime = this.windowStartTime;
    return {
      if (windowStartTime != null) 'WindowStartTime': windowStartTime,
    };
  }
}

/// Options for a domain's <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/APIReference/API_OffPeakWindow.html">off-peak
/// window</a>, during which OpenSearch Service can perform mandatory
/// configuration changes on the domain.
class OffPeakWindowOptions {
  /// Whether to enable an off-peak window.
  ///
  /// This option is only available when modifying a domain created prior to
  /// February 16, 2023, not when creating a new domain. All domains created after
  /// this date have the off-peak window enabled by default. You can't disable the
  /// off-peak window after it's enabled for a domain.
  final bool? enabled;

  /// Off-peak window settings for the domain.
  final OffPeakWindow? offPeakWindow;

  OffPeakWindowOptions({
    this.enabled,
    this.offPeakWindow,
  });

  factory OffPeakWindowOptions.fromJson(Map<String, dynamic> json) {
    return OffPeakWindowOptions(
      enabled: json['Enabled'] as bool?,
      offPeakWindow: json['OffPeakWindow'] != null
          ? OffPeakWindow.fromJson(
              json['OffPeakWindow'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final offPeakWindow = this.offPeakWindow;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (offPeakWindow != null) 'OffPeakWindow': offPeakWindow,
    };
  }
}

/// The status of <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/APIReference/API_OffPeakWindow.html">off-peak
/// window</a> options for a domain.
class OffPeakWindowOptionsStatus {
  /// The domain's off-peak window configuration.
  final OffPeakWindowOptions? options;

  /// The current status of off-peak window options.
  final OptionStatus? status;

  OffPeakWindowOptionsStatus({
    this.options,
    this.status,
  });

  factory OffPeakWindowOptionsStatus.fromJson(Map<String, dynamic> json) {
    return OffPeakWindowOptionsStatus(
      options: json['Options'] != null
          ? OffPeakWindowOptions.fromJson(
              json['Options'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? OptionStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      if (options != null) 'Options': options,
      if (status != null) 'Status': status,
    };
  }
}

enum OpenSearchPartitionInstanceType {
  m3MediumSearch,
  m3LargeSearch,
  m3XlargeSearch,
  m3_2xlargeSearch,
  m4LargeSearch,
  m4XlargeSearch,
  m4_2xlargeSearch,
  m4_4xlargeSearch,
  m4_10xlargeSearch,
  m5LargeSearch,
  m5XlargeSearch,
  m5_2xlargeSearch,
  m5_4xlargeSearch,
  m5_12xlargeSearch,
  m5_24xlargeSearch,
  r5LargeSearch,
  r5XlargeSearch,
  r5_2xlargeSearch,
  r5_4xlargeSearch,
  r5_12xlargeSearch,
  r5_24xlargeSearch,
  c5LargeSearch,
  c5XlargeSearch,
  c5_2xlargeSearch,
  c5_4xlargeSearch,
  c5_9xlargeSearch,
  c5_18xlargeSearch,
  t3NanoSearch,
  t3MicroSearch,
  t3SmallSearch,
  t3MediumSearch,
  t3LargeSearch,
  t3XlargeSearch,
  t3_2xlargeSearch,
  or1MediumSearch,
  or1LargeSearch,
  or1XlargeSearch,
  or1_2xlargeSearch,
  or1_4xlargeSearch,
  or1_8xlargeSearch,
  or1_12xlargeSearch,
  or1_16xlargeSearch,
  ultrawarm1MediumSearch,
  ultrawarm1LargeSearch,
  ultrawarm1XlargeSearch,
  t2MicroSearch,
  t2SmallSearch,
  t2MediumSearch,
  r3LargeSearch,
  r3XlargeSearch,
  r3_2xlargeSearch,
  r3_4xlargeSearch,
  r3_8xlargeSearch,
  i2XlargeSearch,
  i2_2xlargeSearch,
  d2XlargeSearch,
  d2_2xlargeSearch,
  d2_4xlargeSearch,
  d2_8xlargeSearch,
  c4LargeSearch,
  c4XlargeSearch,
  c4_2xlargeSearch,
  c4_4xlargeSearch,
  c4_8xlargeSearch,
  r4LargeSearch,
  r4XlargeSearch,
  r4_2xlargeSearch,
  r4_4xlargeSearch,
  r4_8xlargeSearch,
  r4_16xlargeSearch,
  i3LargeSearch,
  i3XlargeSearch,
  i3_2xlargeSearch,
  i3_4xlargeSearch,
  i3_8xlargeSearch,
  i3_16xlargeSearch,
  r6gLargeSearch,
  r6gXlargeSearch,
  r6g_2xlargeSearch,
  r6g_4xlargeSearch,
  r6g_8xlargeSearch,
  r6g_12xlargeSearch,
  m6gLargeSearch,
  m6gXlargeSearch,
  m6g_2xlargeSearch,
  m6g_4xlargeSearch,
  m6g_8xlargeSearch,
  m6g_12xlargeSearch,
  c6gLargeSearch,
  c6gXlargeSearch,
  c6g_2xlargeSearch,
  c6g_4xlargeSearch,
  c6g_8xlargeSearch,
  c6g_12xlargeSearch,
  r6gdLargeSearch,
  r6gdXlargeSearch,
  r6gd_2xlargeSearch,
  r6gd_4xlargeSearch,
  r6gd_8xlargeSearch,
  r6gd_12xlargeSearch,
  r6gd_16xlargeSearch,
  t4gSmallSearch,
  t4gMediumSearch,
}

extension OpenSearchPartitionInstanceTypeValueExtension
    on OpenSearchPartitionInstanceType {
  String toValue() {
    switch (this) {
      case OpenSearchPartitionInstanceType.m3MediumSearch:
        return 'm3.medium.search';
      case OpenSearchPartitionInstanceType.m3LargeSearch:
        return 'm3.large.search';
      case OpenSearchPartitionInstanceType.m3XlargeSearch:
        return 'm3.xlarge.search';
      case OpenSearchPartitionInstanceType.m3_2xlargeSearch:
        return 'm3.2xlarge.search';
      case OpenSearchPartitionInstanceType.m4LargeSearch:
        return 'm4.large.search';
      case OpenSearchPartitionInstanceType.m4XlargeSearch:
        return 'm4.xlarge.search';
      case OpenSearchPartitionInstanceType.m4_2xlargeSearch:
        return 'm4.2xlarge.search';
      case OpenSearchPartitionInstanceType.m4_4xlargeSearch:
        return 'm4.4xlarge.search';
      case OpenSearchPartitionInstanceType.m4_10xlargeSearch:
        return 'm4.10xlarge.search';
      case OpenSearchPartitionInstanceType.m5LargeSearch:
        return 'm5.large.search';
      case OpenSearchPartitionInstanceType.m5XlargeSearch:
        return 'm5.xlarge.search';
      case OpenSearchPartitionInstanceType.m5_2xlargeSearch:
        return 'm5.2xlarge.search';
      case OpenSearchPartitionInstanceType.m5_4xlargeSearch:
        return 'm5.4xlarge.search';
      case OpenSearchPartitionInstanceType.m5_12xlargeSearch:
        return 'm5.12xlarge.search';
      case OpenSearchPartitionInstanceType.m5_24xlargeSearch:
        return 'm5.24xlarge.search';
      case OpenSearchPartitionInstanceType.r5LargeSearch:
        return 'r5.large.search';
      case OpenSearchPartitionInstanceType.r5XlargeSearch:
        return 'r5.xlarge.search';
      case OpenSearchPartitionInstanceType.r5_2xlargeSearch:
        return 'r5.2xlarge.search';
      case OpenSearchPartitionInstanceType.r5_4xlargeSearch:
        return 'r5.4xlarge.search';
      case OpenSearchPartitionInstanceType.r5_12xlargeSearch:
        return 'r5.12xlarge.search';
      case OpenSearchPartitionInstanceType.r5_24xlargeSearch:
        return 'r5.24xlarge.search';
      case OpenSearchPartitionInstanceType.c5LargeSearch:
        return 'c5.large.search';
      case OpenSearchPartitionInstanceType.c5XlargeSearch:
        return 'c5.xlarge.search';
      case OpenSearchPartitionInstanceType.c5_2xlargeSearch:
        return 'c5.2xlarge.search';
      case OpenSearchPartitionInstanceType.c5_4xlargeSearch:
        return 'c5.4xlarge.search';
      case OpenSearchPartitionInstanceType.c5_9xlargeSearch:
        return 'c5.9xlarge.search';
      case OpenSearchPartitionInstanceType.c5_18xlargeSearch:
        return 'c5.18xlarge.search';
      case OpenSearchPartitionInstanceType.t3NanoSearch:
        return 't3.nano.search';
      case OpenSearchPartitionInstanceType.t3MicroSearch:
        return 't3.micro.search';
      case OpenSearchPartitionInstanceType.t3SmallSearch:
        return 't3.small.search';
      case OpenSearchPartitionInstanceType.t3MediumSearch:
        return 't3.medium.search';
      case OpenSearchPartitionInstanceType.t3LargeSearch:
        return 't3.large.search';
      case OpenSearchPartitionInstanceType.t3XlargeSearch:
        return 't3.xlarge.search';
      case OpenSearchPartitionInstanceType.t3_2xlargeSearch:
        return 't3.2xlarge.search';
      case OpenSearchPartitionInstanceType.or1MediumSearch:
        return 'or1.medium.search';
      case OpenSearchPartitionInstanceType.or1LargeSearch:
        return 'or1.large.search';
      case OpenSearchPartitionInstanceType.or1XlargeSearch:
        return 'or1.xlarge.search';
      case OpenSearchPartitionInstanceType.or1_2xlargeSearch:
        return 'or1.2xlarge.search';
      case OpenSearchPartitionInstanceType.or1_4xlargeSearch:
        return 'or1.4xlarge.search';
      case OpenSearchPartitionInstanceType.or1_8xlargeSearch:
        return 'or1.8xlarge.search';
      case OpenSearchPartitionInstanceType.or1_12xlargeSearch:
        return 'or1.12xlarge.search';
      case OpenSearchPartitionInstanceType.or1_16xlargeSearch:
        return 'or1.16xlarge.search';
      case OpenSearchPartitionInstanceType.ultrawarm1MediumSearch:
        return 'ultrawarm1.medium.search';
      case OpenSearchPartitionInstanceType.ultrawarm1LargeSearch:
        return 'ultrawarm1.large.search';
      case OpenSearchPartitionInstanceType.ultrawarm1XlargeSearch:
        return 'ultrawarm1.xlarge.search';
      case OpenSearchPartitionInstanceType.t2MicroSearch:
        return 't2.micro.search';
      case OpenSearchPartitionInstanceType.t2SmallSearch:
        return 't2.small.search';
      case OpenSearchPartitionInstanceType.t2MediumSearch:
        return 't2.medium.search';
      case OpenSearchPartitionInstanceType.r3LargeSearch:
        return 'r3.large.search';
      case OpenSearchPartitionInstanceType.r3XlargeSearch:
        return 'r3.xlarge.search';
      case OpenSearchPartitionInstanceType.r3_2xlargeSearch:
        return 'r3.2xlarge.search';
      case OpenSearchPartitionInstanceType.r3_4xlargeSearch:
        return 'r3.4xlarge.search';
      case OpenSearchPartitionInstanceType.r3_8xlargeSearch:
        return 'r3.8xlarge.search';
      case OpenSearchPartitionInstanceType.i2XlargeSearch:
        return 'i2.xlarge.search';
      case OpenSearchPartitionInstanceType.i2_2xlargeSearch:
        return 'i2.2xlarge.search';
      case OpenSearchPartitionInstanceType.d2XlargeSearch:
        return 'd2.xlarge.search';
      case OpenSearchPartitionInstanceType.d2_2xlargeSearch:
        return 'd2.2xlarge.search';
      case OpenSearchPartitionInstanceType.d2_4xlargeSearch:
        return 'd2.4xlarge.search';
      case OpenSearchPartitionInstanceType.d2_8xlargeSearch:
        return 'd2.8xlarge.search';
      case OpenSearchPartitionInstanceType.c4LargeSearch:
        return 'c4.large.search';
      case OpenSearchPartitionInstanceType.c4XlargeSearch:
        return 'c4.xlarge.search';
      case OpenSearchPartitionInstanceType.c4_2xlargeSearch:
        return 'c4.2xlarge.search';
      case OpenSearchPartitionInstanceType.c4_4xlargeSearch:
        return 'c4.4xlarge.search';
      case OpenSearchPartitionInstanceType.c4_8xlargeSearch:
        return 'c4.8xlarge.search';
      case OpenSearchPartitionInstanceType.r4LargeSearch:
        return 'r4.large.search';
      case OpenSearchPartitionInstanceType.r4XlargeSearch:
        return 'r4.xlarge.search';
      case OpenSearchPartitionInstanceType.r4_2xlargeSearch:
        return 'r4.2xlarge.search';
      case OpenSearchPartitionInstanceType.r4_4xlargeSearch:
        return 'r4.4xlarge.search';
      case OpenSearchPartitionInstanceType.r4_8xlargeSearch:
        return 'r4.8xlarge.search';
      case OpenSearchPartitionInstanceType.r4_16xlargeSearch:
        return 'r4.16xlarge.search';
      case OpenSearchPartitionInstanceType.i3LargeSearch:
        return 'i3.large.search';
      case OpenSearchPartitionInstanceType.i3XlargeSearch:
        return 'i3.xlarge.search';
      case OpenSearchPartitionInstanceType.i3_2xlargeSearch:
        return 'i3.2xlarge.search';
      case OpenSearchPartitionInstanceType.i3_4xlargeSearch:
        return 'i3.4xlarge.search';
      case OpenSearchPartitionInstanceType.i3_8xlargeSearch:
        return 'i3.8xlarge.search';
      case OpenSearchPartitionInstanceType.i3_16xlargeSearch:
        return 'i3.16xlarge.search';
      case OpenSearchPartitionInstanceType.r6gLargeSearch:
        return 'r6g.large.search';
      case OpenSearchPartitionInstanceType.r6gXlargeSearch:
        return 'r6g.xlarge.search';
      case OpenSearchPartitionInstanceType.r6g_2xlargeSearch:
        return 'r6g.2xlarge.search';
      case OpenSearchPartitionInstanceType.r6g_4xlargeSearch:
        return 'r6g.4xlarge.search';
      case OpenSearchPartitionInstanceType.r6g_8xlargeSearch:
        return 'r6g.8xlarge.search';
      case OpenSearchPartitionInstanceType.r6g_12xlargeSearch:
        return 'r6g.12xlarge.search';
      case OpenSearchPartitionInstanceType.m6gLargeSearch:
        return 'm6g.large.search';
      case OpenSearchPartitionInstanceType.m6gXlargeSearch:
        return 'm6g.xlarge.search';
      case OpenSearchPartitionInstanceType.m6g_2xlargeSearch:
        return 'm6g.2xlarge.search';
      case OpenSearchPartitionInstanceType.m6g_4xlargeSearch:
        return 'm6g.4xlarge.search';
      case OpenSearchPartitionInstanceType.m6g_8xlargeSearch:
        return 'm6g.8xlarge.search';
      case OpenSearchPartitionInstanceType.m6g_12xlargeSearch:
        return 'm6g.12xlarge.search';
      case OpenSearchPartitionInstanceType.c6gLargeSearch:
        return 'c6g.large.search';
      case OpenSearchPartitionInstanceType.c6gXlargeSearch:
        return 'c6g.xlarge.search';
      case OpenSearchPartitionInstanceType.c6g_2xlargeSearch:
        return 'c6g.2xlarge.search';
      case OpenSearchPartitionInstanceType.c6g_4xlargeSearch:
        return 'c6g.4xlarge.search';
      case OpenSearchPartitionInstanceType.c6g_8xlargeSearch:
        return 'c6g.8xlarge.search';
      case OpenSearchPartitionInstanceType.c6g_12xlargeSearch:
        return 'c6g.12xlarge.search';
      case OpenSearchPartitionInstanceType.r6gdLargeSearch:
        return 'r6gd.large.search';
      case OpenSearchPartitionInstanceType.r6gdXlargeSearch:
        return 'r6gd.xlarge.search';
      case OpenSearchPartitionInstanceType.r6gd_2xlargeSearch:
        return 'r6gd.2xlarge.search';
      case OpenSearchPartitionInstanceType.r6gd_4xlargeSearch:
        return 'r6gd.4xlarge.search';
      case OpenSearchPartitionInstanceType.r6gd_8xlargeSearch:
        return 'r6gd.8xlarge.search';
      case OpenSearchPartitionInstanceType.r6gd_12xlargeSearch:
        return 'r6gd.12xlarge.search';
      case OpenSearchPartitionInstanceType.r6gd_16xlargeSearch:
        return 'r6gd.16xlarge.search';
      case OpenSearchPartitionInstanceType.t4gSmallSearch:
        return 't4g.small.search';
      case OpenSearchPartitionInstanceType.t4gMediumSearch:
        return 't4g.medium.search';
    }
  }
}

extension OpenSearchPartitionInstanceTypeFromString on String {
  OpenSearchPartitionInstanceType toOpenSearchPartitionInstanceType() {
    switch (this) {
      case 'm3.medium.search':
        return OpenSearchPartitionInstanceType.m3MediumSearch;
      case 'm3.large.search':
        return OpenSearchPartitionInstanceType.m3LargeSearch;
      case 'm3.xlarge.search':
        return OpenSearchPartitionInstanceType.m3XlargeSearch;
      case 'm3.2xlarge.search':
        return OpenSearchPartitionInstanceType.m3_2xlargeSearch;
      case 'm4.large.search':
        return OpenSearchPartitionInstanceType.m4LargeSearch;
      case 'm4.xlarge.search':
        return OpenSearchPartitionInstanceType.m4XlargeSearch;
      case 'm4.2xlarge.search':
        return OpenSearchPartitionInstanceType.m4_2xlargeSearch;
      case 'm4.4xlarge.search':
        return OpenSearchPartitionInstanceType.m4_4xlargeSearch;
      case 'm4.10xlarge.search':
        return OpenSearchPartitionInstanceType.m4_10xlargeSearch;
      case 'm5.large.search':
        return OpenSearchPartitionInstanceType.m5LargeSearch;
      case 'm5.xlarge.search':
        return OpenSearchPartitionInstanceType.m5XlargeSearch;
      case 'm5.2xlarge.search':
        return OpenSearchPartitionInstanceType.m5_2xlargeSearch;
      case 'm5.4xlarge.search':
        return OpenSearchPartitionInstanceType.m5_4xlargeSearch;
      case 'm5.12xlarge.search':
        return OpenSearchPartitionInstanceType.m5_12xlargeSearch;
      case 'm5.24xlarge.search':
        return OpenSearchPartitionInstanceType.m5_24xlargeSearch;
      case 'r5.large.search':
        return OpenSearchPartitionInstanceType.r5LargeSearch;
      case 'r5.xlarge.search':
        return OpenSearchPartitionInstanceType.r5XlargeSearch;
      case 'r5.2xlarge.search':
        return OpenSearchPartitionInstanceType.r5_2xlargeSearch;
      case 'r5.4xlarge.search':
        return OpenSearchPartitionInstanceType.r5_4xlargeSearch;
      case 'r5.12xlarge.search':
        return OpenSearchPartitionInstanceType.r5_12xlargeSearch;
      case 'r5.24xlarge.search':
        return OpenSearchPartitionInstanceType.r5_24xlargeSearch;
      case 'c5.large.search':
        return OpenSearchPartitionInstanceType.c5LargeSearch;
      case 'c5.xlarge.search':
        return OpenSearchPartitionInstanceType.c5XlargeSearch;
      case 'c5.2xlarge.search':
        return OpenSearchPartitionInstanceType.c5_2xlargeSearch;
      case 'c5.4xlarge.search':
        return OpenSearchPartitionInstanceType.c5_4xlargeSearch;
      case 'c5.9xlarge.search':
        return OpenSearchPartitionInstanceType.c5_9xlargeSearch;
      case 'c5.18xlarge.search':
        return OpenSearchPartitionInstanceType.c5_18xlargeSearch;
      case 't3.nano.search':
        return OpenSearchPartitionInstanceType.t3NanoSearch;
      case 't3.micro.search':
        return OpenSearchPartitionInstanceType.t3MicroSearch;
      case 't3.small.search':
        return OpenSearchPartitionInstanceType.t3SmallSearch;
      case 't3.medium.search':
        return OpenSearchPartitionInstanceType.t3MediumSearch;
      case 't3.large.search':
        return OpenSearchPartitionInstanceType.t3LargeSearch;
      case 't3.xlarge.search':
        return OpenSearchPartitionInstanceType.t3XlargeSearch;
      case 't3.2xlarge.search':
        return OpenSearchPartitionInstanceType.t3_2xlargeSearch;
      case 'or1.medium.search':
        return OpenSearchPartitionInstanceType.or1MediumSearch;
      case 'or1.large.search':
        return OpenSearchPartitionInstanceType.or1LargeSearch;
      case 'or1.xlarge.search':
        return OpenSearchPartitionInstanceType.or1XlargeSearch;
      case 'or1.2xlarge.search':
        return OpenSearchPartitionInstanceType.or1_2xlargeSearch;
      case 'or1.4xlarge.search':
        return OpenSearchPartitionInstanceType.or1_4xlargeSearch;
      case 'or1.8xlarge.search':
        return OpenSearchPartitionInstanceType.or1_8xlargeSearch;
      case 'or1.12xlarge.search':
        return OpenSearchPartitionInstanceType.or1_12xlargeSearch;
      case 'or1.16xlarge.search':
        return OpenSearchPartitionInstanceType.or1_16xlargeSearch;
      case 'ultrawarm1.medium.search':
        return OpenSearchPartitionInstanceType.ultrawarm1MediumSearch;
      case 'ultrawarm1.large.search':
        return OpenSearchPartitionInstanceType.ultrawarm1LargeSearch;
      case 'ultrawarm1.xlarge.search':
        return OpenSearchPartitionInstanceType.ultrawarm1XlargeSearch;
      case 't2.micro.search':
        return OpenSearchPartitionInstanceType.t2MicroSearch;
      case 't2.small.search':
        return OpenSearchPartitionInstanceType.t2SmallSearch;
      case 't2.medium.search':
        return OpenSearchPartitionInstanceType.t2MediumSearch;
      case 'r3.large.search':
        return OpenSearchPartitionInstanceType.r3LargeSearch;
      case 'r3.xlarge.search':
        return OpenSearchPartitionInstanceType.r3XlargeSearch;
      case 'r3.2xlarge.search':
        return OpenSearchPartitionInstanceType.r3_2xlargeSearch;
      case 'r3.4xlarge.search':
        return OpenSearchPartitionInstanceType.r3_4xlargeSearch;
      case 'r3.8xlarge.search':
        return OpenSearchPartitionInstanceType.r3_8xlargeSearch;
      case 'i2.xlarge.search':
        return OpenSearchPartitionInstanceType.i2XlargeSearch;
      case 'i2.2xlarge.search':
        return OpenSearchPartitionInstanceType.i2_2xlargeSearch;
      case 'd2.xlarge.search':
        return OpenSearchPartitionInstanceType.d2XlargeSearch;
      case 'd2.2xlarge.search':
        return OpenSearchPartitionInstanceType.d2_2xlargeSearch;
      case 'd2.4xlarge.search':
        return OpenSearchPartitionInstanceType.d2_4xlargeSearch;
      case 'd2.8xlarge.search':
        return OpenSearchPartitionInstanceType.d2_8xlargeSearch;
      case 'c4.large.search':
        return OpenSearchPartitionInstanceType.c4LargeSearch;
      case 'c4.xlarge.search':
        return OpenSearchPartitionInstanceType.c4XlargeSearch;
      case 'c4.2xlarge.search':
        return OpenSearchPartitionInstanceType.c4_2xlargeSearch;
      case 'c4.4xlarge.search':
        return OpenSearchPartitionInstanceType.c4_4xlargeSearch;
      case 'c4.8xlarge.search':
        return OpenSearchPartitionInstanceType.c4_8xlargeSearch;
      case 'r4.large.search':
        return OpenSearchPartitionInstanceType.r4LargeSearch;
      case 'r4.xlarge.search':
        return OpenSearchPartitionInstanceType.r4XlargeSearch;
      case 'r4.2xlarge.search':
        return OpenSearchPartitionInstanceType.r4_2xlargeSearch;
      case 'r4.4xlarge.search':
        return OpenSearchPartitionInstanceType.r4_4xlargeSearch;
      case 'r4.8xlarge.search':
        return OpenSearchPartitionInstanceType.r4_8xlargeSearch;
      case 'r4.16xlarge.search':
        return OpenSearchPartitionInstanceType.r4_16xlargeSearch;
      case 'i3.large.search':
        return OpenSearchPartitionInstanceType.i3LargeSearch;
      case 'i3.xlarge.search':
        return OpenSearchPartitionInstanceType.i3XlargeSearch;
      case 'i3.2xlarge.search':
        return OpenSearchPartitionInstanceType.i3_2xlargeSearch;
      case 'i3.4xlarge.search':
        return OpenSearchPartitionInstanceType.i3_4xlargeSearch;
      case 'i3.8xlarge.search':
        return OpenSearchPartitionInstanceType.i3_8xlargeSearch;
      case 'i3.16xlarge.search':
        return OpenSearchPartitionInstanceType.i3_16xlargeSearch;
      case 'r6g.large.search':
        return OpenSearchPartitionInstanceType.r6gLargeSearch;
      case 'r6g.xlarge.search':
        return OpenSearchPartitionInstanceType.r6gXlargeSearch;
      case 'r6g.2xlarge.search':
        return OpenSearchPartitionInstanceType.r6g_2xlargeSearch;
      case 'r6g.4xlarge.search':
        return OpenSearchPartitionInstanceType.r6g_4xlargeSearch;
      case 'r6g.8xlarge.search':
        return OpenSearchPartitionInstanceType.r6g_8xlargeSearch;
      case 'r6g.12xlarge.search':
        return OpenSearchPartitionInstanceType.r6g_12xlargeSearch;
      case 'm6g.large.search':
        return OpenSearchPartitionInstanceType.m6gLargeSearch;
      case 'm6g.xlarge.search':
        return OpenSearchPartitionInstanceType.m6gXlargeSearch;
      case 'm6g.2xlarge.search':
        return OpenSearchPartitionInstanceType.m6g_2xlargeSearch;
      case 'm6g.4xlarge.search':
        return OpenSearchPartitionInstanceType.m6g_4xlargeSearch;
      case 'm6g.8xlarge.search':
        return OpenSearchPartitionInstanceType.m6g_8xlargeSearch;
      case 'm6g.12xlarge.search':
        return OpenSearchPartitionInstanceType.m6g_12xlargeSearch;
      case 'c6g.large.search':
        return OpenSearchPartitionInstanceType.c6gLargeSearch;
      case 'c6g.xlarge.search':
        return OpenSearchPartitionInstanceType.c6gXlargeSearch;
      case 'c6g.2xlarge.search':
        return OpenSearchPartitionInstanceType.c6g_2xlargeSearch;
      case 'c6g.4xlarge.search':
        return OpenSearchPartitionInstanceType.c6g_4xlargeSearch;
      case 'c6g.8xlarge.search':
        return OpenSearchPartitionInstanceType.c6g_8xlargeSearch;
      case 'c6g.12xlarge.search':
        return OpenSearchPartitionInstanceType.c6g_12xlargeSearch;
      case 'r6gd.large.search':
        return OpenSearchPartitionInstanceType.r6gdLargeSearch;
      case 'r6gd.xlarge.search':
        return OpenSearchPartitionInstanceType.r6gdXlargeSearch;
      case 'r6gd.2xlarge.search':
        return OpenSearchPartitionInstanceType.r6gd_2xlargeSearch;
      case 'r6gd.4xlarge.search':
        return OpenSearchPartitionInstanceType.r6gd_4xlargeSearch;
      case 'r6gd.8xlarge.search':
        return OpenSearchPartitionInstanceType.r6gd_8xlargeSearch;
      case 'r6gd.12xlarge.search':
        return OpenSearchPartitionInstanceType.r6gd_12xlargeSearch;
      case 'r6gd.16xlarge.search':
        return OpenSearchPartitionInstanceType.r6gd_16xlargeSearch;
      case 't4g.small.search':
        return OpenSearchPartitionInstanceType.t4gSmallSearch;
      case 't4g.medium.search':
        return OpenSearchPartitionInstanceType.t4gMediumSearch;
    }
    throw Exception(
        '$this is not known in enum OpenSearchPartitionInstanceType');
  }
}

enum OpenSearchWarmPartitionInstanceType {
  ultrawarm1MediumSearch,
  ultrawarm1LargeSearch,
  ultrawarm1XlargeSearch,
}

extension OpenSearchWarmPartitionInstanceTypeValueExtension
    on OpenSearchWarmPartitionInstanceType {
  String toValue() {
    switch (this) {
      case OpenSearchWarmPartitionInstanceType.ultrawarm1MediumSearch:
        return 'ultrawarm1.medium.search';
      case OpenSearchWarmPartitionInstanceType.ultrawarm1LargeSearch:
        return 'ultrawarm1.large.search';
      case OpenSearchWarmPartitionInstanceType.ultrawarm1XlargeSearch:
        return 'ultrawarm1.xlarge.search';
    }
  }
}

extension OpenSearchWarmPartitionInstanceTypeFromString on String {
  OpenSearchWarmPartitionInstanceType toOpenSearchWarmPartitionInstanceType() {
    switch (this) {
      case 'ultrawarm1.medium.search':
        return OpenSearchWarmPartitionInstanceType.ultrawarm1MediumSearch;
      case 'ultrawarm1.large.search':
        return OpenSearchWarmPartitionInstanceType.ultrawarm1LargeSearch;
      case 'ultrawarm1.xlarge.search':
        return OpenSearchWarmPartitionInstanceType.ultrawarm1XlargeSearch;
    }
    throw Exception(
        '$this is not known in enum OpenSearchWarmPartitionInstanceType');
  }
}

/// The state of a requested domain configuration change. Can be one of the
/// following:
///
/// <ul>
/// <li>
/// <b>Processing</b> - The requested change is still in progress.
/// </li>
/// <li>
/// <b>Active</b> - The requested change is processed and deployed to the
/// domain.
/// </li>
/// </ul>
enum OptionState {
  requiresIndexDocuments,
  processing,
  active,
}

extension OptionStateValueExtension on OptionState {
  String toValue() {
    switch (this) {
      case OptionState.requiresIndexDocuments:
        return 'RequiresIndexDocuments';
      case OptionState.processing:
        return 'Processing';
      case OptionState.active:
        return 'Active';
    }
  }
}

extension OptionStateFromString on String {
  OptionState toOptionState() {
    switch (this) {
      case 'RequiresIndexDocuments':
        return OptionState.requiresIndexDocuments;
      case 'Processing':
        return OptionState.processing;
      case 'Active':
        return OptionState.active;
    }
    throw Exception('$this is not known in enum OptionState');
  }
}

/// Provides the current status of an entity.
class OptionStatus {
  /// The timestamp when the entity was created.
  final DateTime creationDate;

  /// The state of the entity.
  final OptionState state;

  /// The timestamp of the last time the entity was updated.
  final DateTime updateDate;

  /// Indicates whether the entity is being deleted.
  final bool? pendingDeletion;

  /// The latest version of the entity.
  final int? updateVersion;

  OptionStatus({
    required this.creationDate,
    required this.state,
    required this.updateDate,
    this.pendingDeletion,
    this.updateVersion,
  });

  factory OptionStatus.fromJson(Map<String, dynamic> json) {
    return OptionStatus(
      creationDate:
          nonNullableTimeStampFromJson(json['CreationDate'] as Object),
      state: (json['State'] as String).toOptionState(),
      updateDate: nonNullableTimeStampFromJson(json['UpdateDate'] as Object),
      pendingDeletion: json['PendingDeletion'] as bool?,
      updateVersion: json['UpdateVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final state = this.state;
    final updateDate = this.updateDate;
    final pendingDeletion = this.pendingDeletion;
    final updateVersion = this.updateVersion;
    return {
      'CreationDate': unixTimestampToJson(creationDate),
      'State': state.toValue(),
      'UpdateDate': unixTimestampToJson(updateDate),
      if (pendingDeletion != null) 'PendingDeletion': pendingDeletion,
      if (updateVersion != null) 'UpdateVersion': updateVersion,
    };
  }
}

/// Specifies details about an outbound cross-cluster connection.
class OutboundConnection {
  /// Name of the connection.
  final String? connectionAlias;

  /// Unique identifier of the connection.
  final String? connectionId;

  /// The connection mode.
  final ConnectionMode? connectionMode;

  /// Properties for the outbound connection.
  final ConnectionProperties? connectionProperties;

  /// Status of the connection.
  final OutboundConnectionStatus? connectionStatus;

  /// Information about the source (local) domain.
  final DomainInformationContainer? localDomainInfo;

  /// Information about the destination (remote) domain.
  final DomainInformationContainer? remoteDomainInfo;

  OutboundConnection({
    this.connectionAlias,
    this.connectionId,
    this.connectionMode,
    this.connectionProperties,
    this.connectionStatus,
    this.localDomainInfo,
    this.remoteDomainInfo,
  });

  factory OutboundConnection.fromJson(Map<String, dynamic> json) {
    return OutboundConnection(
      connectionAlias: json['ConnectionAlias'] as String?,
      connectionId: json['ConnectionId'] as String?,
      connectionMode: (json['ConnectionMode'] as String?)?.toConnectionMode(),
      connectionProperties: json['ConnectionProperties'] != null
          ? ConnectionProperties.fromJson(
              json['ConnectionProperties'] as Map<String, dynamic>)
          : null,
      connectionStatus: json['ConnectionStatus'] != null
          ? OutboundConnectionStatus.fromJson(
              json['ConnectionStatus'] as Map<String, dynamic>)
          : null,
      localDomainInfo: json['LocalDomainInfo'] != null
          ? DomainInformationContainer.fromJson(
              json['LocalDomainInfo'] as Map<String, dynamic>)
          : null,
      remoteDomainInfo: json['RemoteDomainInfo'] != null
          ? DomainInformationContainer.fromJson(
              json['RemoteDomainInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionAlias = this.connectionAlias;
    final connectionId = this.connectionId;
    final connectionMode = this.connectionMode;
    final connectionProperties = this.connectionProperties;
    final connectionStatus = this.connectionStatus;
    final localDomainInfo = this.localDomainInfo;
    final remoteDomainInfo = this.remoteDomainInfo;
    return {
      if (connectionAlias != null) 'ConnectionAlias': connectionAlias,
      if (connectionId != null) 'ConnectionId': connectionId,
      if (connectionMode != null) 'ConnectionMode': connectionMode.toValue(),
      if (connectionProperties != null)
        'ConnectionProperties': connectionProperties,
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (localDomainInfo != null) 'LocalDomainInfo': localDomainInfo,
      if (remoteDomainInfo != null) 'RemoteDomainInfo': remoteDomainInfo,
    };
  }
}

/// The status of an outbound cross-cluster connection.
class OutboundConnectionStatus {
  /// Verbose information for the outbound connection.
  final String? message;

  /// The status code for the outbound connection. Can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>VALIDATING</b> - The outbound connection request is being validated.
  /// </li>
  /// <li>
  /// <b>VALIDATION_FAILED</b> - Validation failed for the connection request.
  /// </li>
  /// <li>
  /// <b>PENDING_ACCEPTANCE</b>: Outbound connection request is validated and is
  /// not yet accepted by the remote domain owner.
  /// </li>
  /// <li>
  /// <b>APPROVED</b> - Outbound connection has been approved by the remote domain
  /// owner for getting provisioned.
  /// </li>
  /// <li>
  /// <b>PROVISIONING</b> - Outbound connection request is in process.
  /// </li>
  /// <li>
  /// <b>ACTIVE</b> - Outbound connection is active and ready to use.
  /// </li>
  /// <li>
  /// <b>REJECTING</b> - Outbound connection rejection by remote domain owner is
  /// in progress.
  /// </li>
  /// <li>
  /// <b>REJECTED</b> - Outbound connection request is rejected by remote domain
  /// owner.
  /// </li>
  /// <li>
  /// <b>DELETING</b> - Outbound connection deletion is in progress.
  /// </li>
  /// <li>
  /// <b>DELETED</b> - Outbound connection is deleted and can no longer be used.
  /// </li>
  /// </ul>
  final OutboundConnectionStatusCode? statusCode;

  OutboundConnectionStatus({
    this.message,
    this.statusCode,
  });

  factory OutboundConnectionStatus.fromJson(Map<String, dynamic> json) {
    return OutboundConnectionStatus(
      message: json['Message'] as String?,
      statusCode:
          (json['StatusCode'] as String?)?.toOutboundConnectionStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final statusCode = this.statusCode;
    return {
      if (message != null) 'Message': message,
      if (statusCode != null) 'StatusCode': statusCode.toValue(),
    };
  }
}

enum OutboundConnectionStatusCode {
  validating,
  validationFailed,
  pendingAcceptance,
  approved,
  provisioning,
  active,
  rejecting,
  rejected,
  deleting,
  deleted,
}

extension OutboundConnectionStatusCodeValueExtension
    on OutboundConnectionStatusCode {
  String toValue() {
    switch (this) {
      case OutboundConnectionStatusCode.validating:
        return 'VALIDATING';
      case OutboundConnectionStatusCode.validationFailed:
        return 'VALIDATION_FAILED';
      case OutboundConnectionStatusCode.pendingAcceptance:
        return 'PENDING_ACCEPTANCE';
      case OutboundConnectionStatusCode.approved:
        return 'APPROVED';
      case OutboundConnectionStatusCode.provisioning:
        return 'PROVISIONING';
      case OutboundConnectionStatusCode.active:
        return 'ACTIVE';
      case OutboundConnectionStatusCode.rejecting:
        return 'REJECTING';
      case OutboundConnectionStatusCode.rejected:
        return 'REJECTED';
      case OutboundConnectionStatusCode.deleting:
        return 'DELETING';
      case OutboundConnectionStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension OutboundConnectionStatusCodeFromString on String {
  OutboundConnectionStatusCode toOutboundConnectionStatusCode() {
    switch (this) {
      case 'VALIDATING':
        return OutboundConnectionStatusCode.validating;
      case 'VALIDATION_FAILED':
        return OutboundConnectionStatusCode.validationFailed;
      case 'PENDING_ACCEPTANCE':
        return OutboundConnectionStatusCode.pendingAcceptance;
      case 'APPROVED':
        return OutboundConnectionStatusCode.approved;
      case 'PROVISIONING':
        return OutboundConnectionStatusCode.provisioning;
      case 'ACTIVE':
        return OutboundConnectionStatusCode.active;
      case 'REJECTING':
        return OutboundConnectionStatusCode.rejecting;
      case 'REJECTED':
        return OutboundConnectionStatusCode.rejected;
      case 'DELETING':
        return OutboundConnectionStatusCode.deleting;
      case 'DELETED':
        return OutboundConnectionStatusCode.deleted;
    }
    throw Exception('$this is not known in enum OutboundConnectionStatusCode');
  }
}

/// The overall status value of the domain configuration change.
enum OverallChangeStatus {
  pending,
  processing,
  completed,
  failed,
}

extension OverallChangeStatusValueExtension on OverallChangeStatus {
  String toValue() {
    switch (this) {
      case OverallChangeStatus.pending:
        return 'PENDING';
      case OverallChangeStatus.processing:
        return 'PROCESSING';
      case OverallChangeStatus.completed:
        return 'COMPLETED';
      case OverallChangeStatus.failed:
        return 'FAILED';
    }
  }
}

extension OverallChangeStatusFromString on String {
  OverallChangeStatus toOverallChangeStatus() {
    switch (this) {
      case 'PENDING':
        return OverallChangeStatus.pending;
      case 'PROCESSING':
        return OverallChangeStatus.processing;
      case 'COMPLETED':
        return OverallChangeStatus.completed;
      case 'FAILED':
        return OverallChangeStatus.failed;
    }
    throw Exception('$this is not known in enum OverallChangeStatus');
  }
}

/// Basic information about a package.
class PackageDetails {
  /// The package version.
  final String? availablePackageVersion;

  /// If the package is a <code>ZIP-PLUGIN</code> package, additional information
  /// about plugin properties.
  final PluginProperties? availablePluginProperties;

  /// The timestamp when the package was created.
  final DateTime? createdAt;

  /// Version of OpenSearch or Elasticsearch, in the format Elasticsearch_X.Y or
  /// OpenSearch_X.Y. Defaults to the latest version of OpenSearch.
  final String? engineVersion;

  /// Additional information if the package is in an error state. Null otherwise.
  final ErrorDetails? errorDetails;

  /// Date and time when the package was last updated.
  final DateTime? lastUpdatedAt;

  /// User-specified description of the package.
  final String? packageDescription;

  /// The unique identifier of the package.
  final String? packageID;

  /// The user-specified name of the package.
  final String? packageName;

  /// The current status of the package. The available options are
  /// <code>AVAILABLE</code>, <code>COPYING</code>, <code>COPY_FAILED</code>,
  /// <code>VALIDATNG</code>, <code>VALIDATION_FAILED</code>,
  /// <code>DELETING</code>, and <code>DELETE_FAILED</code>.
  final PackageStatus? packageStatus;

  /// The type of package.
  final PackageType? packageType;

  PackageDetails({
    this.availablePackageVersion,
    this.availablePluginProperties,
    this.createdAt,
    this.engineVersion,
    this.errorDetails,
    this.lastUpdatedAt,
    this.packageDescription,
    this.packageID,
    this.packageName,
    this.packageStatus,
    this.packageType,
  });

  factory PackageDetails.fromJson(Map<String, dynamic> json) {
    return PackageDetails(
      availablePackageVersion: json['AvailablePackageVersion'] as String?,
      availablePluginProperties: json['AvailablePluginProperties'] != null
          ? PluginProperties.fromJson(
              json['AvailablePluginProperties'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      engineVersion: json['EngineVersion'] as String?,
      errorDetails: json['ErrorDetails'] != null
          ? ErrorDetails.fromJson(json['ErrorDetails'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      packageDescription: json['PackageDescription'] as String?,
      packageID: json['PackageID'] as String?,
      packageName: json['PackageName'] as String?,
      packageStatus: (json['PackageStatus'] as String?)?.toPackageStatus(),
      packageType: (json['PackageType'] as String?)?.toPackageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final availablePackageVersion = this.availablePackageVersion;
    final availablePluginProperties = this.availablePluginProperties;
    final createdAt = this.createdAt;
    final engineVersion = this.engineVersion;
    final errorDetails = this.errorDetails;
    final lastUpdatedAt = this.lastUpdatedAt;
    final packageDescription = this.packageDescription;
    final packageID = this.packageID;
    final packageName = this.packageName;
    final packageStatus = this.packageStatus;
    final packageType = this.packageType;
    return {
      if (availablePackageVersion != null)
        'AvailablePackageVersion': availablePackageVersion,
      if (availablePluginProperties != null)
        'AvailablePluginProperties': availablePluginProperties,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (packageDescription != null) 'PackageDescription': packageDescription,
      if (packageID != null) 'PackageID': packageID,
      if (packageName != null) 'PackageName': packageName,
      if (packageStatus != null) 'PackageStatus': packageStatus.toValue(),
      if (packageType != null) 'PackageType': packageType.toValue(),
    };
  }
}

/// The Amazon S3 location to import the package from.
class PackageSource {
  /// The name of the Amazon S3 bucket containing the package.
  final String? s3BucketName;

  /// Key (file name) of the package.
  final String? s3Key;

  PackageSource({
    this.s3BucketName,
    this.s3Key,
  });

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final s3Key = this.s3Key;
    return {
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3Key != null) 'S3Key': s3Key,
    };
  }
}

enum PackageStatus {
  copying,
  copyFailed,
  validating,
  validationFailed,
  available,
  deleting,
  deleted,
  deleteFailed,
}

extension PackageStatusValueExtension on PackageStatus {
  String toValue() {
    switch (this) {
      case PackageStatus.copying:
        return 'COPYING';
      case PackageStatus.copyFailed:
        return 'COPY_FAILED';
      case PackageStatus.validating:
        return 'VALIDATING';
      case PackageStatus.validationFailed:
        return 'VALIDATION_FAILED';
      case PackageStatus.available:
        return 'AVAILABLE';
      case PackageStatus.deleting:
        return 'DELETING';
      case PackageStatus.deleted:
        return 'DELETED';
      case PackageStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension PackageStatusFromString on String {
  PackageStatus toPackageStatus() {
    switch (this) {
      case 'COPYING':
        return PackageStatus.copying;
      case 'COPY_FAILED':
        return PackageStatus.copyFailed;
      case 'VALIDATING':
        return PackageStatus.validating;
      case 'VALIDATION_FAILED':
        return PackageStatus.validationFailed;
      case 'AVAILABLE':
        return PackageStatus.available;
      case 'DELETING':
        return PackageStatus.deleting;
      case 'DELETED':
        return PackageStatus.deleted;
      case 'DELETE_FAILED':
        return PackageStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum PackageStatus');
  }
}

enum PackageType {
  txtDictionary,
  zipPlugin,
}

extension PackageTypeValueExtension on PackageType {
  String toValue() {
    switch (this) {
      case PackageType.txtDictionary:
        return 'TXT-DICTIONARY';
      case PackageType.zipPlugin:
        return 'ZIP-PLUGIN';
    }
  }
}

extension PackageTypeFromString on String {
  PackageType toPackageType() {
    switch (this) {
      case 'TXT-DICTIONARY':
        return PackageType.txtDictionary;
      case 'ZIP-PLUGIN':
        return PackageType.zipPlugin;
    }
    throw Exception('$this is not known in enum PackageType');
  }
}

/// Details about a package version.
class PackageVersionHistory {
  /// A message associated with the package version when it was uploaded.
  final String? commitMessage;

  /// The date and time when the package was created.
  final DateTime? createdAt;

  /// The package version.
  final String? packageVersion;

  /// Additional information about plugin properties if the package is a
  /// <code>ZIP-PLUGIN</code> package.
  final PluginProperties? pluginProperties;

  PackageVersionHistory({
    this.commitMessage,
    this.createdAt,
    this.packageVersion,
    this.pluginProperties,
  });

  factory PackageVersionHistory.fromJson(Map<String, dynamic> json) {
    return PackageVersionHistory(
      commitMessage: json['CommitMessage'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      packageVersion: json['PackageVersion'] as String?,
      pluginProperties: json['PluginProperties'] != null
          ? PluginProperties.fromJson(
              json['PluginProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final commitMessage = this.commitMessage;
    final createdAt = this.createdAt;
    final packageVersion = this.packageVersion;
    final pluginProperties = this.pluginProperties;
    return {
      if (commitMessage != null) 'CommitMessage': commitMessage,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (packageVersion != null) 'PackageVersion': packageVersion,
      if (pluginProperties != null) 'PluginProperties': pluginProperties,
    };
  }
}

/// Basic information about the plugin.
class PluginProperties {
  /// The name of the class to load.
  final String? className;

  /// The description of the plugin.
  final String? description;

  /// The name of the plugin.
  final String? name;

  /// The uncompressed size of the plugin.
  final int? uncompressedSizeInBytes;

  /// The version of the plugin.
  final String? version;

  PluginProperties({
    this.className,
    this.description,
    this.name,
    this.uncompressedSizeInBytes,
    this.version,
  });

  factory PluginProperties.fromJson(Map<String, dynamic> json) {
    return PluginProperties(
      className: json['ClassName'] as String?,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      uncompressedSizeInBytes: json['UncompressedSizeInBytes'] as int?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final className = this.className;
    final description = this.description;
    final name = this.name;
    final uncompressedSizeInBytes = this.uncompressedSizeInBytes;
    final version = this.version;
    return {
      if (className != null) 'ClassName': className,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (uncompressedSizeInBytes != null)
        'UncompressedSizeInBytes': uncompressedSizeInBytes,
      if (version != null) 'Version': version,
    };
  }
}

enum PrincipalType {
  awsAccount,
  awsService,
}

extension PrincipalTypeValueExtension on PrincipalType {
  String toValue() {
    switch (this) {
      case PrincipalType.awsAccount:
        return 'AWS_ACCOUNT';
      case PrincipalType.awsService:
        return 'AWS_SERVICE';
    }
  }
}

extension PrincipalTypeFromString on String {
  PrincipalType toPrincipalType() {
    switch (this) {
      case 'AWS_ACCOUNT':
        return PrincipalType.awsAccount;
      case 'AWS_SERVICE':
        return PrincipalType.awsService;
    }
    throw Exception('$this is not known in enum PrincipalType');
  }
}

enum PropertyValueType {
  plainText,
  stringifiedJson,
}

extension PropertyValueTypeValueExtension on PropertyValueType {
  String toValue() {
    switch (this) {
      case PropertyValueType.plainText:
        return 'PLAIN_TEXT';
      case PropertyValueType.stringifiedJson:
        return 'STRINGIFIED_JSON';
    }
  }
}

extension PropertyValueTypeFromString on String {
  PropertyValueType toPropertyValueType() {
    switch (this) {
      case 'PLAIN_TEXT':
        return PropertyValueType.plainText;
      case 'STRINGIFIED_JSON':
        return PropertyValueType.stringifiedJson;
    }
    throw Exception('$this is not known in enum PropertyValueType');
  }
}

/// Represents the output of a <code>PurchaseReservedInstanceOffering</code>
/// operation.
class PurchaseReservedInstanceOfferingResponse {
  /// The customer-specified identifier used to track this reservation.
  final String? reservationName;

  /// The ID of the Reserved Instance offering that was purchased.
  final String? reservedInstanceId;

  PurchaseReservedInstanceOfferingResponse({
    this.reservationName,
    this.reservedInstanceId,
  });

  factory PurchaseReservedInstanceOfferingResponse.fromJson(
      Map<String, dynamic> json) {
    return PurchaseReservedInstanceOfferingResponse(
      reservationName: json['ReservationName'] as String?,
      reservedInstanceId: json['ReservedInstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reservationName = this.reservationName;
    final reservedInstanceId = this.reservedInstanceId;
    return {
      if (reservationName != null) 'ReservationName': reservationName,
      if (reservedInstanceId != null) 'ReservedInstanceId': reservedInstanceId,
    };
  }
}

/// Contains the specific price and frequency of a recurring charges for an
/// OpenSearch Reserved Instance, or for a Reserved Instance offering.
class RecurringCharge {
  /// The monetary amount of the recurring charge.
  final double? recurringChargeAmount;

  /// The frequency of the recurring charge.
  final String? recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });

  factory RecurringCharge.fromJson(Map<String, dynamic> json) {
    return RecurringCharge(
      recurringChargeAmount: json['RecurringChargeAmount'] as double?,
      recurringChargeFrequency: json['RecurringChargeFrequency'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recurringChargeAmount = this.recurringChargeAmount;
    final recurringChargeFrequency = this.recurringChargeFrequency;
    return {
      if (recurringChargeAmount != null)
        'RecurringChargeAmount': recurringChargeAmount,
      if (recurringChargeFrequency != null)
        'RecurringChargeFrequency': recurringChargeFrequency,
    };
  }
}

/// Represents the output of a <code>RejectInboundConnection</code> operation.
class RejectInboundConnectionResponse {
  /// Contains details about the rejected inbound connection.
  final InboundConnection? connection;

  RejectInboundConnectionResponse({
    this.connection,
  });

  factory RejectInboundConnectionResponse.fromJson(Map<String, dynamic> json) {
    return RejectInboundConnectionResponse(
      connection: json['Connection'] != null
          ? InboundConnection.fromJson(
              json['Connection'] as Map<String, dynamic>)
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

/// Details of an OpenSearch Reserved Instance.
class ReservedInstance {
  /// The unique identifier of the billing subscription.
  final int? billingSubscriptionId;

  /// The currency code for the offering.
  final String? currencyCode;

  /// The duration, in seconds, for which the OpenSearch instance is reserved.
  final int? duration;

  /// The upfront fixed charge you will paid to purchase the specific Reserved
  /// Instance offering.
  final double? fixedPrice;

  /// The number of OpenSearch instances that have been reserved.
  final int? instanceCount;

  /// The OpenSearch instance type offered by theReserved Instance offering.
  final OpenSearchPartitionInstanceType? instanceType;

  /// The payment option as defined in the Reserved Instance offering.
  final ReservedInstancePaymentOption? paymentOption;

  /// The recurring charge to your account, regardless of whether you create any
  /// domains using the Reserved Instance offering.
  final List<RecurringCharge>? recurringCharges;

  /// The customer-specified identifier to track this reservation.
  final String? reservationName;

  /// The unique identifier for the reservation.
  final String? reservedInstanceId;

  /// The unique identifier of the Reserved Instance offering.
  final String? reservedInstanceOfferingId;

  /// The date and time when the reservation was purchased.
  final DateTime? startTime;

  /// The state of the Reserved Instance.
  final String? state;

  /// The hourly rate at which you're charged for the domain using this Reserved
  /// Instance.
  final double? usagePrice;

  ReservedInstance({
    this.billingSubscriptionId,
    this.currencyCode,
    this.duration,
    this.fixedPrice,
    this.instanceCount,
    this.instanceType,
    this.paymentOption,
    this.recurringCharges,
    this.reservationName,
    this.reservedInstanceId,
    this.reservedInstanceOfferingId,
    this.startTime,
    this.state,
    this.usagePrice,
  });

  factory ReservedInstance.fromJson(Map<String, dynamic> json) {
    return ReservedInstance(
      billingSubscriptionId: json['BillingSubscriptionId'] as int?,
      currencyCode: json['CurrencyCode'] as String?,
      duration: json['Duration'] as int?,
      fixedPrice: json['FixedPrice'] as double?,
      instanceCount: json['InstanceCount'] as int?,
      instanceType: (json['InstanceType'] as String?)
          ?.toOpenSearchPartitionInstanceType(),
      paymentOption:
          (json['PaymentOption'] as String?)?.toReservedInstancePaymentOption(),
      recurringCharges: (json['RecurringCharges'] as List?)
          ?.whereNotNull()
          .map((e) => RecurringCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      reservationName: json['ReservationName'] as String?,
      reservedInstanceId: json['ReservedInstanceId'] as String?,
      reservedInstanceOfferingId: json['ReservedInstanceOfferingId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      state: json['State'] as String?,
      usagePrice: json['UsagePrice'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingSubscriptionId = this.billingSubscriptionId;
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final fixedPrice = this.fixedPrice;
    final instanceCount = this.instanceCount;
    final instanceType = this.instanceType;
    final paymentOption = this.paymentOption;
    final recurringCharges = this.recurringCharges;
    final reservationName = this.reservationName;
    final reservedInstanceId = this.reservedInstanceId;
    final reservedInstanceOfferingId = this.reservedInstanceOfferingId;
    final startTime = this.startTime;
    final state = this.state;
    final usagePrice = this.usagePrice;
    return {
      if (billingSubscriptionId != null)
        'BillingSubscriptionId': billingSubscriptionId,
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (duration != null) 'Duration': duration,
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (instanceCount != null) 'InstanceCount': instanceCount,
      if (instanceType != null) 'InstanceType': instanceType.toValue(),
      if (paymentOption != null) 'PaymentOption': paymentOption.toValue(),
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservationName != null) 'ReservationName': reservationName,
      if (reservedInstanceId != null) 'ReservedInstanceId': reservedInstanceId,
      if (reservedInstanceOfferingId != null)
        'ReservedInstanceOfferingId': reservedInstanceOfferingId,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state,
      if (usagePrice != null) 'UsagePrice': usagePrice,
    };
  }
}

/// Details of an OpenSearch Reserved Instance offering.
class ReservedInstanceOffering {
  /// The currency code for the Reserved Instance offering.
  final String? currencyCode;

  /// The duration, in seconds, for which the offering will reserve the OpenSearch
  /// instance.
  final int? duration;

  /// The upfront fixed charge you will pay to purchase the specific Reserved
  /// Instance offering.
  final double? fixedPrice;

  /// The OpenSearch instance type offered by the Reserved Instance offering.
  final OpenSearchPartitionInstanceType? instanceType;

  /// Payment option for the Reserved Instance offering
  final ReservedInstancePaymentOption? paymentOption;

  /// The recurring charge to your account, regardless of whether you creates any
  /// domains using the offering.
  final List<RecurringCharge>? recurringCharges;

  /// The unique identifier of the Reserved Instance offering.
  final String? reservedInstanceOfferingId;

  /// The hourly rate at which you're charged for the domain using this Reserved
  /// Instance.
  final double? usagePrice;

  ReservedInstanceOffering({
    this.currencyCode,
    this.duration,
    this.fixedPrice,
    this.instanceType,
    this.paymentOption,
    this.recurringCharges,
    this.reservedInstanceOfferingId,
    this.usagePrice,
  });

  factory ReservedInstanceOffering.fromJson(Map<String, dynamic> json) {
    return ReservedInstanceOffering(
      currencyCode: json['CurrencyCode'] as String?,
      duration: json['Duration'] as int?,
      fixedPrice: json['FixedPrice'] as double?,
      instanceType: (json['InstanceType'] as String?)
          ?.toOpenSearchPartitionInstanceType(),
      paymentOption:
          (json['PaymentOption'] as String?)?.toReservedInstancePaymentOption(),
      recurringCharges: (json['RecurringCharges'] as List?)
          ?.whereNotNull()
          .map((e) => RecurringCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      reservedInstanceOfferingId: json['ReservedInstanceOfferingId'] as String?,
      usagePrice: json['UsagePrice'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final fixedPrice = this.fixedPrice;
    final instanceType = this.instanceType;
    final paymentOption = this.paymentOption;
    final recurringCharges = this.recurringCharges;
    final reservedInstanceOfferingId = this.reservedInstanceOfferingId;
    final usagePrice = this.usagePrice;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (duration != null) 'Duration': duration,
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (instanceType != null) 'InstanceType': instanceType.toValue(),
      if (paymentOption != null) 'PaymentOption': paymentOption.toValue(),
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservedInstanceOfferingId != null)
        'ReservedInstanceOfferingId': reservedInstanceOfferingId,
      if (usagePrice != null) 'UsagePrice': usagePrice,
    };
  }
}

enum ReservedInstancePaymentOption {
  allUpfront,
  partialUpfront,
  noUpfront,
}

extension ReservedInstancePaymentOptionValueExtension
    on ReservedInstancePaymentOption {
  String toValue() {
    switch (this) {
      case ReservedInstancePaymentOption.allUpfront:
        return 'ALL_UPFRONT';
      case ReservedInstancePaymentOption.partialUpfront:
        return 'PARTIAL_UPFRONT';
      case ReservedInstancePaymentOption.noUpfront:
        return 'NO_UPFRONT';
    }
  }
}

extension ReservedInstancePaymentOptionFromString on String {
  ReservedInstancePaymentOption toReservedInstancePaymentOption() {
    switch (this) {
      case 'ALL_UPFRONT':
        return ReservedInstancePaymentOption.allUpfront;
      case 'PARTIAL_UPFRONT':
        return ReservedInstancePaymentOption.partialUpfront;
      case 'NO_UPFRONT':
        return ReservedInstancePaymentOption.noUpfront;
    }
    throw Exception('$this is not known in enum ReservedInstancePaymentOption');
  }
}

class RevokeVpcEndpointAccessResponse {
  RevokeVpcEndpointAccessResponse();

  factory RevokeVpcEndpointAccessResponse.fromJson(Map<String, dynamic> _) {
    return RevokeVpcEndpointAccessResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The rollback state while disabling Auto-Tune for the domain.
enum RollbackOnDisable {
  noRollback,
  defaultRollback,
}

extension RollbackOnDisableValueExtension on RollbackOnDisable {
  String toValue() {
    switch (this) {
      case RollbackOnDisable.noRollback:
        return 'NO_ROLLBACK';
      case RollbackOnDisable.defaultRollback:
        return 'DEFAULT_ROLLBACK';
    }
  }
}

extension RollbackOnDisableFromString on String {
  RollbackOnDisable toRollbackOnDisable() {
    switch (this) {
      case 'NO_ROLLBACK':
        return RollbackOnDisable.noRollback;
      case 'DEFAULT_ROLLBACK':
        return RollbackOnDisable.defaultRollback;
    }
    throw Exception('$this is not known in enum RollbackOnDisable');
  }
}

/// Information about the Amazon S3 Glue Data Catalog.
class S3GlueDataCatalog {
  /// &gt;The Amazon Resource Name (ARN) for the S3 Glue Data Catalog.
  final String? roleArn;

  S3GlueDataCatalog({
    this.roleArn,
  });

  factory S3GlueDataCatalog.fromJson(Map<String, dynamic> json) {
    return S3GlueDataCatalog(
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    return {
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

/// The SAML identity povider information.
class SAMLIdp {
  /// The unique entity ID of the application in the SAML identity provider.
  final String entityId;

  /// The metadata of the SAML application, in XML format.
  final String metadataContent;

  SAMLIdp({
    required this.entityId,
    required this.metadataContent,
  });

  factory SAMLIdp.fromJson(Map<String, dynamic> json) {
    return SAMLIdp(
      entityId: json['EntityId'] as String,
      metadataContent: json['MetadataContent'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final metadataContent = this.metadataContent;
    return {
      'EntityId': entityId,
      'MetadataContent': metadataContent,
    };
  }
}

/// The SAML authentication configuration for an Amazon OpenSearch Service
/// domain.
class SAMLOptionsInput {
  /// True to enable SAML authentication for a domain.
  final bool? enabled;

  /// The SAML Identity Provider's information.
  final SAMLIdp? idp;

  /// The backend role that the SAML master user is mapped to.
  final String? masterBackendRole;

  /// The SAML master user name, which is stored in the domain's internal user
  /// database.
  final String? masterUserName;

  /// Element of the SAML assertion to use for backend roles. Default is
  /// <code>roles</code>.
  final String? rolesKey;

  /// The duration, in minutes, after which a user session becomes inactive.
  /// Acceptable values are between 1 and 1440, and the default value is 60.
  final int? sessionTimeoutMinutes;

  /// Element of the SAML assertion to use for the user name. Default is
  /// <code>NameID</code>.
  final String? subjectKey;

  SAMLOptionsInput({
    this.enabled,
    this.idp,
    this.masterBackendRole,
    this.masterUserName,
    this.rolesKey,
    this.sessionTimeoutMinutes,
    this.subjectKey,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final idp = this.idp;
    final masterBackendRole = this.masterBackendRole;
    final masterUserName = this.masterUserName;
    final rolesKey = this.rolesKey;
    final sessionTimeoutMinutes = this.sessionTimeoutMinutes;
    final subjectKey = this.subjectKey;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (idp != null) 'Idp': idp,
      if (masterBackendRole != null) 'MasterBackendRole': masterBackendRole,
      if (masterUserName != null) 'MasterUserName': masterUserName,
      if (rolesKey != null) 'RolesKey': rolesKey,
      if (sessionTimeoutMinutes != null)
        'SessionTimeoutMinutes': sessionTimeoutMinutes,
      if (subjectKey != null) 'SubjectKey': subjectKey,
    };
  }
}

/// Describes the SAML application configured for the domain.
class SAMLOptionsOutput {
  /// True if SAML is enabled.
  final bool? enabled;

  /// Describes the SAML identity provider's information.
  final SAMLIdp? idp;

  /// The key used for matching the SAML roles attribute.
  final String? rolesKey;

  /// The duration, in minutes, after which a user session becomes inactive.
  final int? sessionTimeoutMinutes;

  /// The key used for matching the SAML subject attribute.
  final String? subjectKey;

  SAMLOptionsOutput({
    this.enabled,
    this.idp,
    this.rolesKey,
    this.sessionTimeoutMinutes,
    this.subjectKey,
  });

  factory SAMLOptionsOutput.fromJson(Map<String, dynamic> json) {
    return SAMLOptionsOutput(
      enabled: json['Enabled'] as bool?,
      idp: json['Idp'] != null
          ? SAMLIdp.fromJson(json['Idp'] as Map<String, dynamic>)
          : null,
      rolesKey: json['RolesKey'] as String?,
      sessionTimeoutMinutes: json['SessionTimeoutMinutes'] as int?,
      subjectKey: json['SubjectKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final idp = this.idp;
    final rolesKey = this.rolesKey;
    final sessionTimeoutMinutes = this.sessionTimeoutMinutes;
    final subjectKey = this.subjectKey;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (idp != null) 'Idp': idp,
      if (rolesKey != null) 'RolesKey': rolesKey,
      if (sessionTimeoutMinutes != null)
        'SessionTimeoutMinutes': sessionTimeoutMinutes,
      if (subjectKey != null) 'SubjectKey': subjectKey,
    };
  }
}

enum ScheduleAt {
  now,
  timestamp,
  offPeakWindow,
}

extension ScheduleAtValueExtension on ScheduleAt {
  String toValue() {
    switch (this) {
      case ScheduleAt.now:
        return 'NOW';
      case ScheduleAt.timestamp:
        return 'TIMESTAMP';
      case ScheduleAt.offPeakWindow:
        return 'OFF_PEAK_WINDOW';
    }
  }
}

extension ScheduleAtFromString on String {
  ScheduleAt toScheduleAt() {
    switch (this) {
      case 'NOW':
        return ScheduleAt.now;
      case 'TIMESTAMP':
        return ScheduleAt.timestamp;
      case 'OFF_PEAK_WINDOW':
        return ScheduleAt.offPeakWindow;
    }
    throw Exception('$this is not known in enum ScheduleAt');
  }
}

/// Information about a scheduled configuration change for an OpenSearch Service
/// domain. This actions can be a <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/service-software.html">service
/// software update</a> or a <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html#auto-tune-types">blue/green
/// Auto-Tune enhancement</a>.
class ScheduledAction {
  /// The unique identifier of the scheduled action.
  final String id;

  /// The time when the change is scheduled to happen.
  final int scheduledTime;

  /// The severity of the action.
  final ActionSeverity severity;

  /// The type of action that will be taken on the domain.
  final ActionType type;

  /// Whether or not the scheduled action is cancellable.
  final bool? cancellable;

  /// A description of the action to be taken.
  final String? description;

  /// Whether the action is required or optional.
  final bool? mandatory;

  /// Whether the action was scheduled manually (<code>CUSTOMER</code>, or by
  /// OpenSearch Service automatically (<code>SYSTEM</code>).
  final ScheduledBy? scheduledBy;

  /// The current status of the scheduled action.
  final ActionStatus? status;

  ScheduledAction({
    required this.id,
    required this.scheduledTime,
    required this.severity,
    required this.type,
    this.cancellable,
    this.description,
    this.mandatory,
    this.scheduledBy,
    this.status,
  });

  factory ScheduledAction.fromJson(Map<String, dynamic> json) {
    return ScheduledAction(
      id: json['Id'] as String,
      scheduledTime: json['ScheduledTime'] as int,
      severity: (json['Severity'] as String).toActionSeverity(),
      type: (json['Type'] as String).toActionType(),
      cancellable: json['Cancellable'] as bool?,
      description: json['Description'] as String?,
      mandatory: json['Mandatory'] as bool?,
      scheduledBy: (json['ScheduledBy'] as String?)?.toScheduledBy(),
      status: (json['Status'] as String?)?.toActionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final scheduledTime = this.scheduledTime;
    final severity = this.severity;
    final type = this.type;
    final cancellable = this.cancellable;
    final description = this.description;
    final mandatory = this.mandatory;
    final scheduledBy = this.scheduledBy;
    final status = this.status;
    return {
      'Id': id,
      'ScheduledTime': scheduledTime,
      'Severity': severity.toValue(),
      'Type': type.toValue(),
      if (cancellable != null) 'Cancellable': cancellable,
      if (description != null) 'Description': description,
      if (mandatory != null) 'Mandatory': mandatory,
      if (scheduledBy != null) 'ScheduledBy': scheduledBy.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// The Auto-Tune action type.
enum ScheduledAutoTuneActionType {
  jvmHeapSizeTuning,
  jvmYoungGenTuning,
}

extension ScheduledAutoTuneActionTypeValueExtension
    on ScheduledAutoTuneActionType {
  String toValue() {
    switch (this) {
      case ScheduledAutoTuneActionType.jvmHeapSizeTuning:
        return 'JVM_HEAP_SIZE_TUNING';
      case ScheduledAutoTuneActionType.jvmYoungGenTuning:
        return 'JVM_YOUNG_GEN_TUNING';
    }
  }
}

extension ScheduledAutoTuneActionTypeFromString on String {
  ScheduledAutoTuneActionType toScheduledAutoTuneActionType() {
    switch (this) {
      case 'JVM_HEAP_SIZE_TUNING':
        return ScheduledAutoTuneActionType.jvmHeapSizeTuning;
      case 'JVM_YOUNG_GEN_TUNING':
        return ScheduledAutoTuneActionType.jvmYoungGenTuning;
    }
    throw Exception('$this is not known in enum ScheduledAutoTuneActionType');
  }
}

/// Specifies details about a scheduled Auto-Tune action. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html">Auto-Tune
/// for Amazon OpenSearch Service</a>.
class ScheduledAutoTuneDetails {
  /// A description of the Auto-Tune action.
  final String? action;

  /// The type of Auto-Tune action.
  final ScheduledAutoTuneActionType? actionType;

  /// The date and time when the Auto-Tune action is scheduled for the domain.
  final DateTime? date;

  /// The severity of the Auto-Tune action. Valid values are <code>LOW</code>,
  /// <code>MEDIUM</code>, and <code>HIGH</code>.
  final ScheduledAutoTuneSeverityType? severity;

  ScheduledAutoTuneDetails({
    this.action,
    this.actionType,
    this.date,
    this.severity,
  });

  factory ScheduledAutoTuneDetails.fromJson(Map<String, dynamic> json) {
    return ScheduledAutoTuneDetails(
      action: json['Action'] as String?,
      actionType:
          (json['ActionType'] as String?)?.toScheduledAutoTuneActionType(),
      date: timeStampFromJson(json['Date']),
      severity:
          (json['Severity'] as String?)?.toScheduledAutoTuneSeverityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final actionType = this.actionType;
    final date = this.date;
    final severity = this.severity;
    return {
      if (action != null) 'Action': action,
      if (actionType != null) 'ActionType': actionType.toValue(),
      if (date != null) 'Date': unixTimestampToJson(date),
      if (severity != null) 'Severity': severity.toValue(),
    };
  }
}

/// The Auto-Tune action severity.
enum ScheduledAutoTuneSeverityType {
  low,
  medium,
  high,
}

extension ScheduledAutoTuneSeverityTypeValueExtension
    on ScheduledAutoTuneSeverityType {
  String toValue() {
    switch (this) {
      case ScheduledAutoTuneSeverityType.low:
        return 'LOW';
      case ScheduledAutoTuneSeverityType.medium:
        return 'MEDIUM';
      case ScheduledAutoTuneSeverityType.high:
        return 'HIGH';
    }
  }
}

extension ScheduledAutoTuneSeverityTypeFromString on String {
  ScheduledAutoTuneSeverityType toScheduledAutoTuneSeverityType() {
    switch (this) {
      case 'LOW':
        return ScheduledAutoTuneSeverityType.low;
      case 'MEDIUM':
        return ScheduledAutoTuneSeverityType.medium;
      case 'HIGH':
        return ScheduledAutoTuneSeverityType.high;
    }
    throw Exception('$this is not known in enum ScheduledAutoTuneSeverityType');
  }
}

enum ScheduledBy {
  customer,
  system,
}

extension ScheduledByValueExtension on ScheduledBy {
  String toValue() {
    switch (this) {
      case ScheduledBy.customer:
        return 'CUSTOMER';
      case ScheduledBy.system:
        return 'SYSTEM';
    }
  }
}

extension ScheduledByFromString on String {
  ScheduledBy toScheduledBy() {
    switch (this) {
      case 'CUSTOMER':
        return ScheduledBy.customer;
      case 'SYSTEM':
        return ScheduledBy.system;
    }
    throw Exception('$this is not known in enum ScheduledBy');
  }
}

/// The current status of the service software for an Amazon OpenSearch Service
/// domain. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/service-software.html">Service
/// software updates in Amazon OpenSearch Service</a>.
class ServiceSoftwareOptions {
  /// The timestamp, in Epoch time, until which you can manually request a service
  /// software update. After this date, we automatically update your service
  /// software.
  final DateTime? automatedUpdateDate;

  /// True if you're able to cancel your service software version update. False if
  /// you can't cancel your service software update.
  final bool? cancellable;

  /// The current service software version present on the domain.
  final String? currentVersion;

  /// A description of the service software update status.
  final String? description;

  /// The new service software version, if one is available.
  final String? newVersion;

  /// True if a service software is never automatically updated. False if a
  /// service software is automatically updated after the automated update date.
  final bool? optionalDeployment;

  /// True if you're able to update your service software version. False if you
  /// can't update your service software version.
  final bool? updateAvailable;

  /// The status of your service software update.
  final DeploymentStatus? updateStatus;

  ServiceSoftwareOptions({
    this.automatedUpdateDate,
    this.cancellable,
    this.currentVersion,
    this.description,
    this.newVersion,
    this.optionalDeployment,
    this.updateAvailable,
    this.updateStatus,
  });

  factory ServiceSoftwareOptions.fromJson(Map<String, dynamic> json) {
    return ServiceSoftwareOptions(
      automatedUpdateDate: timeStampFromJson(json['AutomatedUpdateDate']),
      cancellable: json['Cancellable'] as bool?,
      currentVersion: json['CurrentVersion'] as String?,
      description: json['Description'] as String?,
      newVersion: json['NewVersion'] as String?,
      optionalDeployment: json['OptionalDeployment'] as bool?,
      updateAvailable: json['UpdateAvailable'] as bool?,
      updateStatus: (json['UpdateStatus'] as String?)?.toDeploymentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final automatedUpdateDate = this.automatedUpdateDate;
    final cancellable = this.cancellable;
    final currentVersion = this.currentVersion;
    final description = this.description;
    final newVersion = this.newVersion;
    final optionalDeployment = this.optionalDeployment;
    final updateAvailable = this.updateAvailable;
    final updateStatus = this.updateStatus;
    return {
      if (automatedUpdateDate != null)
        'AutomatedUpdateDate': unixTimestampToJson(automatedUpdateDate),
      if (cancellable != null) 'Cancellable': cancellable,
      if (currentVersion != null) 'CurrentVersion': currentVersion,
      if (description != null) 'Description': description,
      if (newVersion != null) 'NewVersion': newVersion,
      if (optionalDeployment != null) 'OptionalDeployment': optionalDeployment,
      if (updateAvailable != null) 'UpdateAvailable': updateAvailable,
      if (updateStatus != null) 'UpdateStatus': updateStatus.toValue(),
    };
  }
}

/// The status of <code>SkipUnavailable</code> setting for the outbound
/// connection.
///
/// <ul>
/// <li>
/// <b>ENABLED</b> - The <code>SkipUnavailable</code> setting is enabled for the
/// connection.
/// </li>
/// <li>
/// <b>DISABLED</b> - The <code>SkipUnavailable</code> setting is disabled for
/// the connection.
/// </li>
/// </ul>
enum SkipUnavailableStatus {
  enabled,
  disabled,
}

extension SkipUnavailableStatusValueExtension on SkipUnavailableStatus {
  String toValue() {
    switch (this) {
      case SkipUnavailableStatus.enabled:
        return 'ENABLED';
      case SkipUnavailableStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension SkipUnavailableStatusFromString on String {
  SkipUnavailableStatus toSkipUnavailableStatus() {
    switch (this) {
      case 'ENABLED':
        return SkipUnavailableStatus.enabled;
      case 'DISABLED':
        return SkipUnavailableStatus.disabled;
    }
    throw Exception('$this is not known in enum SkipUnavailableStatus');
  }
}

/// The time, in UTC format, when OpenSearch Service takes a daily automated
/// snapshot of the specified domain. Default is <code>0</code> hours.
class SnapshotOptions {
  /// The time, in UTC format, when OpenSearch Service takes a daily automated
  /// snapshot of the specified domain. Default is <code>0</code> hours.
  final int? automatedSnapshotStartHour;

  SnapshotOptions({
    this.automatedSnapshotStartHour,
  });

  factory SnapshotOptions.fromJson(Map<String, dynamic> json) {
    return SnapshotOptions(
      automatedSnapshotStartHour: json['AutomatedSnapshotStartHour'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final automatedSnapshotStartHour = this.automatedSnapshotStartHour;
    return {
      if (automatedSnapshotStartHour != null)
        'AutomatedSnapshotStartHour': automatedSnapshotStartHour,
    };
  }
}

/// Container for information about a daily automated snapshot for an OpenSearch
/// Service domain.
class SnapshotOptionsStatus {
  /// The daily snapshot options specified for the domain.
  final SnapshotOptions options;

  /// The status of a daily automated snapshot.
  final OptionStatus status;

  SnapshotOptionsStatus({
    required this.options,
    required this.status,
  });

  factory SnapshotOptionsStatus.fromJson(Map<String, dynamic> json) {
    return SnapshotOptionsStatus(
      options:
          SnapshotOptions.fromJson(json['Options'] as Map<String, dynamic>),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// Options for configuring service software updates for a domain.
class SoftwareUpdateOptions {
  /// Whether automatic service software updates are enabled for the domain.
  final bool? autoSoftwareUpdateEnabled;

  SoftwareUpdateOptions({
    this.autoSoftwareUpdateEnabled,
  });

  factory SoftwareUpdateOptions.fromJson(Map<String, dynamic> json) {
    return SoftwareUpdateOptions(
      autoSoftwareUpdateEnabled: json['AutoSoftwareUpdateEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoSoftwareUpdateEnabled = this.autoSoftwareUpdateEnabled;
    return {
      if (autoSoftwareUpdateEnabled != null)
        'AutoSoftwareUpdateEnabled': autoSoftwareUpdateEnabled,
    };
  }
}

/// The status of the service software options for a domain.
class SoftwareUpdateOptionsStatus {
  /// The service software update options for a domain.
  final SoftwareUpdateOptions? options;

  /// The status of service software update options, including creation date and
  /// last updated date.
  final OptionStatus? status;

  SoftwareUpdateOptionsStatus({
    this.options,
    this.status,
  });

  factory SoftwareUpdateOptionsStatus.fromJson(Map<String, dynamic> json) {
    return SoftwareUpdateOptionsStatus(
      options: json['Options'] != null
          ? SoftwareUpdateOptions.fromJson(
              json['Options'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? OptionStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      if (options != null) 'Options': options,
      if (status != null) 'Status': status,
    };
  }
}

/// The result of a <code>StartDomainMaintenance</code> request that information
/// about the requested action.
class StartDomainMaintenanceResponse {
  /// The request ID of requested action.
  final String? maintenanceId;

  StartDomainMaintenanceResponse({
    this.maintenanceId,
  });

  factory StartDomainMaintenanceResponse.fromJson(Map<String, dynamic> json) {
    return StartDomainMaintenanceResponse(
      maintenanceId: json['MaintenanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final maintenanceId = this.maintenanceId;
    return {
      if (maintenanceId != null) 'MaintenanceId': maintenanceId,
    };
  }
}

/// Represents the output of a <code>StartServiceSoftwareUpdate</code>
/// operation. Contains the status of the update.
class StartServiceSoftwareUpdateResponse {
  /// The current status of the OpenSearch Service software update.
  final ServiceSoftwareOptions? serviceSoftwareOptions;

  StartServiceSoftwareUpdateResponse({
    this.serviceSoftwareOptions,
  });

  factory StartServiceSoftwareUpdateResponse.fromJson(
      Map<String, dynamic> json) {
    return StartServiceSoftwareUpdateResponse(
      serviceSoftwareOptions: json['ServiceSoftwareOptions'] != null
          ? ServiceSoftwareOptions.fromJson(
              json['ServiceSoftwareOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSoftwareOptions = this.serviceSoftwareOptions;
    return {
      if (serviceSoftwareOptions != null)
        'ServiceSoftwareOptions': serviceSoftwareOptions,
    };
  }
}

/// A list of storage types for an Amazon OpenSearch Service domain that are
/// available for a given intance type.
class StorageType {
  /// The storage sub-type, such as <code>gp3</code> or <code>io1</code>.
  final String? storageSubTypeName;

  /// Limits that are applicable for the given storage type.
  final List<StorageTypeLimit>? storageTypeLimits;

  /// The name of the storage type.
  final String? storageTypeName;

  StorageType({
    this.storageSubTypeName,
    this.storageTypeLimits,
    this.storageTypeName,
  });

  factory StorageType.fromJson(Map<String, dynamic> json) {
    return StorageType(
      storageSubTypeName: json['StorageSubTypeName'] as String?,
      storageTypeLimits: (json['StorageTypeLimits'] as List?)
          ?.whereNotNull()
          .map((e) => StorageTypeLimit.fromJson(e as Map<String, dynamic>))
          .toList(),
      storageTypeName: json['StorageTypeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final storageSubTypeName = this.storageSubTypeName;
    final storageTypeLimits = this.storageTypeLimits;
    final storageTypeName = this.storageTypeName;
    return {
      if (storageSubTypeName != null) 'StorageSubTypeName': storageSubTypeName,
      if (storageTypeLimits != null) 'StorageTypeLimits': storageTypeLimits,
      if (storageTypeName != null) 'StorageTypeName': storageTypeName,
    };
  }
}

/// Limits that are applicable for the given Amazon OpenSearch Service storage
/// type.
class StorageTypeLimit {
  /// Name of storage limits that are applicable for the given storage type. If
  /// <code>StorageType</code> is <code>ebs</code>, the following options are
  /// available:
  ///
  /// <ul>
  /// <li>
  /// <b>MinimumVolumeSize</b> - Minimum volume size that is available for the
  /// given storage type. Can be empty if not applicable.
  /// </li>
  /// <li>
  /// <b>MaximumVolumeSize</b> - Maximum volume size that is available for the
  /// given storage type. Can be empty if not applicable.
  /// </li>
  /// <li>
  /// <b>MaximumIops</b> - Maximum amount of IOPS that is available for the given
  /// the storage type. Can be empty if not applicable.
  /// </li>
  /// <li>
  /// <b>MinimumIops</b> - Minimum amount of IOPS that is available for the given
  /// the storage type. Can be empty if not applicable.
  /// </li>
  /// <li>
  /// <b>MaximumThroughput</b> - Maximum amount of throughput that is available
  /// for the given the storage type. Can be empty if not applicable.
  /// </li>
  /// <li>
  /// <b>MinimumThroughput</b> - Minimum amount of throughput that is available
  /// for the given the storage type. Can be empty if not applicable.
  /// </li>
  /// </ul>
  final String? limitName;

  /// The limit values.
  final List<String>? limitValues;

  StorageTypeLimit({
    this.limitName,
    this.limitValues,
  });

  factory StorageTypeLimit.fromJson(Map<String, dynamic> json) {
    return StorageTypeLimit(
      limitName: json['LimitName'] as String?,
      limitValues: (json['LimitValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final limitName = this.limitName;
    final limitValues = this.limitValues;
    return {
      if (limitName != null) 'LimitName': limitName,
      if (limitValues != null) 'LimitValues': limitValues,
    };
  }
}

enum TLSSecurityPolicy {
  policyMinTls_1_0_2019_07,
  policyMinTls_1_2_2019_07,
  policyMinTls_1_2Pfs_2023_10,
}

extension TLSSecurityPolicyValueExtension on TLSSecurityPolicy {
  String toValue() {
    switch (this) {
      case TLSSecurityPolicy.policyMinTls_1_0_2019_07:
        return 'Policy-Min-TLS-1-0-2019-07';
      case TLSSecurityPolicy.policyMinTls_1_2_2019_07:
        return 'Policy-Min-TLS-1-2-2019-07';
      case TLSSecurityPolicy.policyMinTls_1_2Pfs_2023_10:
        return 'Policy-Min-TLS-1-2-PFS-2023-10';
    }
  }
}

extension TLSSecurityPolicyFromString on String {
  TLSSecurityPolicy toTLSSecurityPolicy() {
    switch (this) {
      case 'Policy-Min-TLS-1-0-2019-07':
        return TLSSecurityPolicy.policyMinTls_1_0_2019_07;
      case 'Policy-Min-TLS-1-2-2019-07':
        return TLSSecurityPolicy.policyMinTls_1_2_2019_07;
      case 'Policy-Min-TLS-1-2-PFS-2023-10':
        return TLSSecurityPolicy.policyMinTls_1_2Pfs_2023_10;
    }
    throw Exception('$this is not known in enum TLSSecurityPolicy');
  }
}

/// A tag (key-value pair) for an Amazon OpenSearch Service resource.
class Tag {
  /// The tag key. Tag keys must be unique for the domain to which they are
  /// attached.
  final String key;

  /// The value assigned to the corresponding tag key. Tag values can be null and
  /// don't have to be unique in a tag set. For example, you can have a key value
  /// pair in a tag set of <code>project : Trinity</code> and <code>cost-center :
  /// Trinity</code>
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

/// The unit of a maintenance schedule duration. Valid value is
/// <code>HOUR</code>.
enum TimeUnit {
  hours,
}

extension TimeUnitValueExtension on TimeUnit {
  String toValue() {
    switch (this) {
      case TimeUnit.hours:
        return 'HOURS';
    }
  }
}

extension TimeUnitFromString on String {
  TimeUnit toTimeUnit() {
    switch (this) {
      case 'HOURS':
        return TimeUnit.hours;
    }
    throw Exception('$this is not known in enum TimeUnit');
  }
}

/// The result of an <code>UpdateDataSource</code> operation.
class UpdateDataSourceResponse {
  /// A message associated with the updated data source.
  final String? message;

  UpdateDataSourceResponse({
    this.message,
  });

  factory UpdateDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataSourceResponse(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The results of an <code>UpdateDomain</code> request. Contains the status of
/// the domain being updated.
class UpdateDomainConfigResponse {
  /// The status of the updated domain.
  final DomainConfig domainConfig;

  /// The status of the dry run being performed on the domain, if any.
  final DryRunProgressStatus? dryRunProgressStatus;

  /// Results of the dry run performed in the update domain request.
  final DryRunResults? dryRunResults;

  UpdateDomainConfigResponse({
    required this.domainConfig,
    this.dryRunProgressStatus,
    this.dryRunResults,
  });

  factory UpdateDomainConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainConfigResponse(
      domainConfig:
          DomainConfig.fromJson(json['DomainConfig'] as Map<String, dynamic>),
      dryRunProgressStatus: json['DryRunProgressStatus'] != null
          ? DryRunProgressStatus.fromJson(
              json['DryRunProgressStatus'] as Map<String, dynamic>)
          : null,
      dryRunResults: json['DryRunResults'] != null
          ? DryRunResults.fromJson(
              json['DryRunResults'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainConfig = this.domainConfig;
    final dryRunProgressStatus = this.dryRunProgressStatus;
    final dryRunResults = this.dryRunResults;
    return {
      'DomainConfig': domainConfig,
      if (dryRunProgressStatus != null)
        'DryRunProgressStatus': dryRunProgressStatus,
      if (dryRunResults != null) 'DryRunResults': dryRunResults,
    };
  }
}

/// Container for the response returned by the <code>UpdatePackage</code>
/// operation.
class UpdatePackageResponse {
  /// Information about a package.
  final PackageDetails? packageDetails;

  UpdatePackageResponse({
    this.packageDetails,
  });

  factory UpdatePackageResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePackageResponse(
      packageDetails: json['PackageDetails'] != null
          ? PackageDetails.fromJson(
              json['PackageDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final packageDetails = this.packageDetails;
    return {
      if (packageDetails != null) 'PackageDetails': packageDetails,
    };
  }
}

class UpdateScheduledActionResponse {
  /// Information about the rescheduled action.
  final ScheduledAction? scheduledAction;

  UpdateScheduledActionResponse({
    this.scheduledAction,
  });

  factory UpdateScheduledActionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateScheduledActionResponse(
      scheduledAction: json['ScheduledAction'] != null
          ? ScheduledAction.fromJson(
              json['ScheduledAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledAction = this.scheduledAction;
    return {
      if (scheduledAction != null) 'ScheduledAction': scheduledAction,
    };
  }
}

class UpdateVpcEndpointResponse {
  /// The endpoint to be updated.
  final VpcEndpoint vpcEndpoint;

  UpdateVpcEndpointResponse({
    required this.vpcEndpoint,
  });

  factory UpdateVpcEndpointResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVpcEndpointResponse(
      vpcEndpoint:
          VpcEndpoint.fromJson(json['VpcEndpoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcEndpoint = this.vpcEndpoint;
    return {
      'VpcEndpoint': vpcEndpoint,
    };
  }
}

/// Container for the response returned by <code>UpgradeDomain</code> operation.
class UpgradeDomainResponse {
  /// The advanced options configuration for the domain.
  final Map<String, String>? advancedOptions;

  /// Container for information about a configuration change happening on a
  /// domain.
  final ChangeProgressDetails? changeProgressDetails;

  /// The name of the domain that was upgraded.
  final String? domainName;

  /// When true, indicates that an upgrade eligibility check was performed.
  final bool? performCheckOnly;

  /// OpenSearch or Elasticsearch version that the domain was upgraded to.
  final String? targetVersion;

  /// The unique identifier of the domain upgrade.
  final String? upgradeId;

  UpgradeDomainResponse({
    this.advancedOptions,
    this.changeProgressDetails,
    this.domainName,
    this.performCheckOnly,
    this.targetVersion,
    this.upgradeId,
  });

  factory UpgradeDomainResponse.fromJson(Map<String, dynamic> json) {
    return UpgradeDomainResponse(
      advancedOptions: (json['AdvancedOptions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      changeProgressDetails: json['ChangeProgressDetails'] != null
          ? ChangeProgressDetails.fromJson(
              json['ChangeProgressDetails'] as Map<String, dynamic>)
          : null,
      domainName: json['DomainName'] as String?,
      performCheckOnly: json['PerformCheckOnly'] as bool?,
      targetVersion: json['TargetVersion'] as String?,
      upgradeId: json['UpgradeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final advancedOptions = this.advancedOptions;
    final changeProgressDetails = this.changeProgressDetails;
    final domainName = this.domainName;
    final performCheckOnly = this.performCheckOnly;
    final targetVersion = this.targetVersion;
    final upgradeId = this.upgradeId;
    return {
      if (advancedOptions != null) 'AdvancedOptions': advancedOptions,
      if (changeProgressDetails != null)
        'ChangeProgressDetails': changeProgressDetails,
      if (domainName != null) 'DomainName': domainName,
      if (performCheckOnly != null) 'PerformCheckOnly': performCheckOnly,
      if (targetVersion != null) 'TargetVersion': targetVersion,
      if (upgradeId != null) 'UpgradeId': upgradeId,
    };
  }
}

/// History of the last 10 upgrades and upgrade eligibility checks for an Amazon
/// OpenSearch Service domain.
class UpgradeHistory {
  /// UTC timestamp at which the upgrade API call was made, in the format
  /// <code>yyyy-MM-ddTHH:mm:ssZ</code>.
  final DateTime? startTimestamp;

  /// A list of each step performed as part of a specific upgrade or upgrade
  /// eligibility check.
  final List<UpgradeStepItem>? stepsList;

  /// A string that describes the upgrade.
  final String? upgradeName;

  /// The current status of the upgrade. The status can take one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// In Progress
  /// </li>
  /// <li>
  /// Succeeded
  /// </li>
  /// <li>
  /// Succeeded with Issues
  /// </li>
  /// <li>
  /// Failed
  /// </li>
  /// </ul>
  final UpgradeStatus? upgradeStatus;

  UpgradeHistory({
    this.startTimestamp,
    this.stepsList,
    this.upgradeName,
    this.upgradeStatus,
  });

  factory UpgradeHistory.fromJson(Map<String, dynamic> json) {
    return UpgradeHistory(
      startTimestamp: timeStampFromJson(json['StartTimestamp']),
      stepsList: (json['StepsList'] as List?)
          ?.whereNotNull()
          .map((e) => UpgradeStepItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      upgradeName: json['UpgradeName'] as String?,
      upgradeStatus: (json['UpgradeStatus'] as String?)?.toUpgradeStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final startTimestamp = this.startTimestamp;
    final stepsList = this.stepsList;
    final upgradeName = this.upgradeName;
    final upgradeStatus = this.upgradeStatus;
    return {
      if (startTimestamp != null)
        'StartTimestamp': unixTimestampToJson(startTimestamp),
      if (stepsList != null) 'StepsList': stepsList,
      if (upgradeName != null) 'UpgradeName': upgradeName,
      if (upgradeStatus != null) 'UpgradeStatus': upgradeStatus.toValue(),
    };
  }
}

enum UpgradeStatus {
  inProgress,
  succeeded,
  succeededWithIssues,
  failed,
}

extension UpgradeStatusValueExtension on UpgradeStatus {
  String toValue() {
    switch (this) {
      case UpgradeStatus.inProgress:
        return 'IN_PROGRESS';
      case UpgradeStatus.succeeded:
        return 'SUCCEEDED';
      case UpgradeStatus.succeededWithIssues:
        return 'SUCCEEDED_WITH_ISSUES';
      case UpgradeStatus.failed:
        return 'FAILED';
    }
  }
}

extension UpgradeStatusFromString on String {
  UpgradeStatus toUpgradeStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return UpgradeStatus.inProgress;
      case 'SUCCEEDED':
        return UpgradeStatus.succeeded;
      case 'SUCCEEDED_WITH_ISSUES':
        return UpgradeStatus.succeededWithIssues;
      case 'FAILED':
        return UpgradeStatus.failed;
    }
    throw Exception('$this is not known in enum UpgradeStatus');
  }
}

enum UpgradeStep {
  preUpgradeCheck,
  snapshot,
  upgrade,
}

extension UpgradeStepValueExtension on UpgradeStep {
  String toValue() {
    switch (this) {
      case UpgradeStep.preUpgradeCheck:
        return 'PRE_UPGRADE_CHECK';
      case UpgradeStep.snapshot:
        return 'SNAPSHOT';
      case UpgradeStep.upgrade:
        return 'UPGRADE';
    }
  }
}

extension UpgradeStepFromString on String {
  UpgradeStep toUpgradeStep() {
    switch (this) {
      case 'PRE_UPGRADE_CHECK':
        return UpgradeStep.preUpgradeCheck;
      case 'SNAPSHOT':
        return UpgradeStep.snapshot;
      case 'UPGRADE':
        return UpgradeStep.upgrade;
    }
    throw Exception('$this is not known in enum UpgradeStep');
  }
}

/// Represents a single step of an upgrade or upgrade eligibility check
/// workflow.
class UpgradeStepItem {
  /// A list of strings containing detailed information about the errors
  /// encountered in a particular step.
  final List<String>? issues;

  /// The floating point value representing the progress percentage of a
  /// particular step.
  final double? progressPercent;

  /// One of three steps that an upgrade or upgrade eligibility check goes
  /// through:
  ///
  /// <ul>
  /// <li>
  /// PreUpgradeCheck
  /// </li>
  /// <li>
  /// Snapshot
  /// </li>
  /// <li>
  /// Upgrade
  /// </li>
  /// </ul>
  final UpgradeStep? upgradeStep;

  /// The current status of the upgrade. The status can take one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// In Progress
  /// </li>
  /// <li>
  /// Succeeded
  /// </li>
  /// <li>
  /// Succeeded with Issues
  /// </li>
  /// <li>
  /// Failed
  /// </li>
  /// </ul>
  final UpgradeStatus? upgradeStepStatus;

  UpgradeStepItem({
    this.issues,
    this.progressPercent,
    this.upgradeStep,
    this.upgradeStepStatus,
  });

  factory UpgradeStepItem.fromJson(Map<String, dynamic> json) {
    return UpgradeStepItem(
      issues: (json['Issues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      progressPercent: json['ProgressPercent'] as double?,
      upgradeStep: (json['UpgradeStep'] as String?)?.toUpgradeStep(),
      upgradeStepStatus:
          (json['UpgradeStepStatus'] as String?)?.toUpgradeStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final issues = this.issues;
    final progressPercent = this.progressPercent;
    final upgradeStep = this.upgradeStep;
    final upgradeStepStatus = this.upgradeStepStatus;
    return {
      if (issues != null) 'Issues': issues,
      if (progressPercent != null) 'ProgressPercent': progressPercent,
      if (upgradeStep != null) 'UpgradeStep': upgradeStep.toValue(),
      if (upgradeStepStatus != null)
        'UpgradeStepStatus': upgradeStepStatus.toValue(),
    };
  }
}

/// Information about the subnets and security groups for an Amazon OpenSearch
/// Service domain provisioned within a virtual private cloud (VPC). For more
/// information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html">Launching
/// your Amazon OpenSearch Service domains using a VPC</a>. This information
/// only exists if the domain was created with <code>VPCOptions</code>.
class VPCDerivedInfo {
  /// The list of Availability Zones associated with the VPC subnets.
  final List<String>? availabilityZones;

  /// The list of security group IDs associated with the VPC endpoints for the
  /// domain.
  final List<String>? securityGroupIds;

  /// A list of subnet IDs associated with the VPC endpoints for the domain.
  final List<String>? subnetIds;

  /// The ID for your VPC. Amazon VPC generates this value when you create a VPC.
  final String? vPCId;

  VPCDerivedInfo({
    this.availabilityZones,
    this.securityGroupIds,
    this.subnetIds,
    this.vPCId,
  });

  factory VPCDerivedInfo.fromJson(Map<String, dynamic> json) {
    return VPCDerivedInfo(
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vPCId: json['VPCId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vPCId = this.vPCId;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vPCId != null) 'VPCId': vPCId,
    };
  }
}

/// Status of the VPC options for a specified domain.
class VPCDerivedInfoStatus {
  /// The VPC options for the specified domain.
  final VPCDerivedInfo options;

  /// The status of the VPC options for the specified domain.
  final OptionStatus status;

  VPCDerivedInfoStatus({
    required this.options,
    required this.status,
  });

  factory VPCDerivedInfoStatus.fromJson(Map<String, dynamic> json) {
    return VPCDerivedInfoStatus(
      options: VPCDerivedInfo.fromJson(json['Options'] as Map<String, dynamic>),
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// Options to specify the subnets and security groups for an Amazon OpenSearch
/// Service VPC endpoint. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html">Launching
/// your Amazon OpenSearch Service domains using a VPC</a>.
class VPCOptions {
  /// The list of security group IDs associated with the VPC endpoints for the
  /// domain. If you do not provide a security group ID, OpenSearch Service uses
  /// the default security group for the VPC.
  final List<String>? securityGroupIds;

  /// A list of subnet IDs associated with the VPC endpoints for the domain. If
  /// your domain uses multiple Availability Zones, you need to provide two subnet
  /// IDs, one per zone. Otherwise, provide only one.
  final List<String>? subnetIds;

  VPCOptions({
    this.securityGroupIds,
    this.subnetIds,
  });

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

/// A validation failure that occurred as the result of a pre-update validation
/// check (verbose dry run) on a domain.
class ValidationFailure {
  /// The error code of the failure.
  final String? code;

  /// A message corresponding to the failure.
  final String? message;

  ValidationFailure({
    this.code,
    this.message,
  });

  factory ValidationFailure.fromJson(Map<String, dynamic> json) {
    return ValidationFailure(
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

/// The status of the the OpenSearch or Elasticsearch version options for the
/// specified Amazon OpenSearch Service domain.
class VersionStatus {
  /// The OpenSearch or Elasticsearch version for the specified domain.
  final String options;

  /// The status of the version options for the specified domain.
  final OptionStatus status;

  VersionStatus({
    required this.options,
    required this.status,
  });

  factory VersionStatus.fromJson(Map<String, dynamic> json) {
    return VersionStatus(
      options: json['Options'] as String,
      status: OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final status = this.status;
    return {
      'Options': options,
      'Status': status,
    };
  }
}

/// The type of EBS volume that a domain uses. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/opensearch-createupdatedomains.html#opensearch-createdomain-configure-ebs">Configuring
/// EBS-based storage</a>.
enum VolumeType {
  standard,
  gp2,
  io1,
  gp3,
}

extension VolumeTypeValueExtension on VolumeType {
  String toValue() {
    switch (this) {
      case VolumeType.standard:
        return 'standard';
      case VolumeType.gp2:
        return 'gp2';
      case VolumeType.io1:
        return 'io1';
      case VolumeType.gp3:
        return 'gp3';
    }
  }
}

extension VolumeTypeFromString on String {
  VolumeType toVolumeType() {
    switch (this) {
      case 'standard':
        return VolumeType.standard;
      case 'gp2':
        return VolumeType.gp2;
      case 'io1':
        return VolumeType.io1;
      case 'gp3':
        return VolumeType.gp3;
    }
    throw Exception('$this is not known in enum VolumeType');
  }
}

/// The connection endpoint for connecting to an Amazon OpenSearch Service
/// domain through a proxy.
class VpcEndpoint {
  /// The Amazon Resource Name (ARN) of the domain associated with the endpoint.
  final String? domainArn;

  /// The connection endpoint ID for connecting to the domain.
  final String? endpoint;

  /// The current status of the endpoint.
  final VpcEndpointStatus? status;

  /// The unique identifier of the endpoint.
  final String? vpcEndpointId;

  /// The creator of the endpoint.
  final String? vpcEndpointOwner;

  /// Options to specify the subnets and security groups for an Amazon OpenSearch
  /// Service VPC endpoint.
  final VPCDerivedInfo? vpcOptions;

  VpcEndpoint({
    this.domainArn,
    this.endpoint,
    this.status,
    this.vpcEndpointId,
    this.vpcEndpointOwner,
    this.vpcOptions,
  });

  factory VpcEndpoint.fromJson(Map<String, dynamic> json) {
    return VpcEndpoint(
      domainArn: json['DomainArn'] as String?,
      endpoint: json['Endpoint'] as String?,
      status: (json['Status'] as String?)?.toVpcEndpointStatus(),
      vpcEndpointId: json['VpcEndpointId'] as String?,
      vpcEndpointOwner: json['VpcEndpointOwner'] as String?,
      vpcOptions: json['VpcOptions'] != null
          ? VPCDerivedInfo.fromJson(json['VpcOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainArn = this.domainArn;
    final endpoint = this.endpoint;
    final status = this.status;
    final vpcEndpointId = this.vpcEndpointId;
    final vpcEndpointOwner = this.vpcEndpointOwner;
    final vpcOptions = this.vpcOptions;
    return {
      if (domainArn != null) 'DomainArn': domainArn,
      if (endpoint != null) 'Endpoint': endpoint,
      if (status != null) 'Status': status.toValue(),
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
      if (vpcEndpointOwner != null) 'VpcEndpointOwner': vpcEndpointOwner,
      if (vpcOptions != null) 'VpcOptions': vpcOptions,
    };
  }
}

/// Error information when attempting to describe an Amazon OpenSearch
/// Service-managed VPC endpoint.
class VpcEndpointError {
  /// The code associated with the error.
  final VpcEndpointErrorCode? errorCode;

  /// A message describing the error.
  final String? errorMessage;

  /// The unique identifier of the endpoint.
  final String? vpcEndpointId;

  VpcEndpointError({
    this.errorCode,
    this.errorMessage,
    this.vpcEndpointId,
  });

  factory VpcEndpointError.fromJson(Map<String, dynamic> json) {
    return VpcEndpointError(
      errorCode: (json['ErrorCode'] as String?)?.toVpcEndpointErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      vpcEndpointId: json['VpcEndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
    };
  }
}

enum VpcEndpointErrorCode {
  endpointNotFound,
  serverError,
}

extension VpcEndpointErrorCodeValueExtension on VpcEndpointErrorCode {
  String toValue() {
    switch (this) {
      case VpcEndpointErrorCode.endpointNotFound:
        return 'ENDPOINT_NOT_FOUND';
      case VpcEndpointErrorCode.serverError:
        return 'SERVER_ERROR';
    }
  }
}

extension VpcEndpointErrorCodeFromString on String {
  VpcEndpointErrorCode toVpcEndpointErrorCode() {
    switch (this) {
      case 'ENDPOINT_NOT_FOUND':
        return VpcEndpointErrorCode.endpointNotFound;
      case 'SERVER_ERROR':
        return VpcEndpointErrorCode.serverError;
    }
    throw Exception('$this is not known in enum VpcEndpointErrorCode');
  }
}

enum VpcEndpointStatus {
  creating,
  createFailed,
  active,
  updating,
  updateFailed,
  deleting,
  deleteFailed,
}

extension VpcEndpointStatusValueExtension on VpcEndpointStatus {
  String toValue() {
    switch (this) {
      case VpcEndpointStatus.creating:
        return 'CREATING';
      case VpcEndpointStatus.createFailed:
        return 'CREATE_FAILED';
      case VpcEndpointStatus.active:
        return 'ACTIVE';
      case VpcEndpointStatus.updating:
        return 'UPDATING';
      case VpcEndpointStatus.updateFailed:
        return 'UPDATE_FAILED';
      case VpcEndpointStatus.deleting:
        return 'DELETING';
      case VpcEndpointStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension VpcEndpointStatusFromString on String {
  VpcEndpointStatus toVpcEndpointStatus() {
    switch (this) {
      case 'CREATING':
        return VpcEndpointStatus.creating;
      case 'CREATE_FAILED':
        return VpcEndpointStatus.createFailed;
      case 'ACTIVE':
        return VpcEndpointStatus.active;
      case 'UPDATING':
        return VpcEndpointStatus.updating;
      case 'UPDATE_FAILED':
        return VpcEndpointStatus.updateFailed;
      case 'DELETING':
        return VpcEndpointStatus.deleting;
      case 'DELETE_FAILED':
        return VpcEndpointStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum VpcEndpointStatus');
  }
}

/// Summary information for an Amazon OpenSearch Service-managed VPC endpoint.
class VpcEndpointSummary {
  /// The Amazon Resource Name (ARN) of the domain associated with the endpoint.
  final String? domainArn;

  /// The current status of the endpoint.
  final VpcEndpointStatus? status;

  /// The unique identifier of the endpoint.
  final String? vpcEndpointId;

  /// The creator of the endpoint.
  final String? vpcEndpointOwner;

  VpcEndpointSummary({
    this.domainArn,
    this.status,
    this.vpcEndpointId,
    this.vpcEndpointOwner,
  });

  factory VpcEndpointSummary.fromJson(Map<String, dynamic> json) {
    return VpcEndpointSummary(
      domainArn: json['DomainArn'] as String?,
      status: (json['Status'] as String?)?.toVpcEndpointStatus(),
      vpcEndpointId: json['VpcEndpointId'] as String?,
      vpcEndpointOwner: json['VpcEndpointOwner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainArn = this.domainArn;
    final status = this.status;
    final vpcEndpointId = this.vpcEndpointId;
    final vpcEndpointOwner = this.vpcEndpointOwner;
    return {
      if (domainArn != null) 'DomainArn': domainArn,
      if (status != null) 'Status': status.toValue(),
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
      if (vpcEndpointOwner != null) 'VpcEndpointOwner': vpcEndpointOwner,
    };
  }
}

/// The desired start time for an <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/APIReference/API_OffPeakWindow.html">off-peak
/// maintenance window</a>.
class WindowStartTime {
  /// The start hour of the window in Coordinated Universal Time (UTC), using
  /// 24-hour time. For example, <code>17</code> refers to 5:00 P.M. UTC.
  final int hours;

  /// The start minute of the window, in UTC.
  final int minutes;

  WindowStartTime({
    required this.hours,
    required this.minutes,
  });

  factory WindowStartTime.fromJson(Map<String, dynamic> json) {
    return WindowStartTime(
      hours: json['Hours'] as int,
      minutes: json['Minutes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final hours = this.hours;
    final minutes = this.minutes;
    return {
      'Hours': hours,
      'Minutes': minutes,
    };
  }
}

/// The zone awareness configuration for an Amazon OpenSearch Service domain.
class ZoneAwarenessConfig {
  /// If you enabled multiple Availability Zones, this value is the number of
  /// zones that you want the domain to use. Valid values are <code>2</code> and
  /// <code>3</code>. If your domain is provisioned within a VPC, this value be
  /// equal to number of subnets.
  final int? availabilityZoneCount;

  ZoneAwarenessConfig({
    this.availabilityZoneCount,
  });

  factory ZoneAwarenessConfig.fromJson(Map<String, dynamic> json) {
    return ZoneAwarenessConfig(
      availabilityZoneCount: json['AvailabilityZoneCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneCount = this.availabilityZoneCount;
    return {
      if (availabilityZoneCount != null)
        'AvailabilityZoneCount': availabilityZoneCount,
    };
  }
}

enum ZoneStatus {
  active,
  standBy,
  notAvailable,
}

extension ZoneStatusValueExtension on ZoneStatus {
  String toValue() {
    switch (this) {
      case ZoneStatus.active:
        return 'Active';
      case ZoneStatus.standBy:
        return 'StandBy';
      case ZoneStatus.notAvailable:
        return 'NotAvailable';
    }
  }
}

extension ZoneStatusFromString on String {
  ZoneStatus toZoneStatus() {
    switch (this) {
      case 'Active':
        return ZoneStatus.active;
      case 'StandBy':
        return ZoneStatus.standBy;
      case 'NotAvailable':
        return ZoneStatus.notAvailable;
    }
    throw Exception('$this is not known in enum ZoneStatus');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BaseException extends _s.GenericAwsException {
  BaseException({String? type, String? message})
      : super(type: type, code: 'BaseException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class DependencyFailureException extends _s.GenericAwsException {
  DependencyFailureException({String? type, String? message})
      : super(type: type, code: 'DependencyFailureException', message: message);
}

class DisabledOperationException extends _s.GenericAwsException {
  DisabledOperationException({String? type, String? message})
      : super(type: type, code: 'DisabledOperationException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class InvalidTypeException extends _s.GenericAwsException {
  InvalidTypeException({String? type, String? message})
      : super(type: type, code: 'InvalidTypeException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class SlotNotAvailableException extends _s.GenericAwsException {
  SlotNotAvailableException({String? type, String? message})
      : super(type: type, code: 'SlotNotAvailableException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BaseException': (type, message) =>
      BaseException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DependencyFailureException': (type, message) =>
      DependencyFailureException(type: type, message: message),
  'DisabledOperationException': (type, message) =>
      DisabledOperationException(type: type, message: message),
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'InvalidPaginationTokenException': (type, message) =>
      InvalidPaginationTokenException(type: type, message: message),
  'InvalidTypeException': (type, message) =>
      InvalidTypeException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'SlotNotAvailableException': (type, message) =>
      SlotNotAvailableException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
