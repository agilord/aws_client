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

part '2015-01-01.g.dart';

/// Use the Amazon Elasticsearch Configuration API to create, configure, and
/// manage Elasticsearch domains.
class Elasticsearch {
  final _s.RestJsonProtocol _protocol;
  Elasticsearch({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'es',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Allows the destination domain owner to accept an inbound cross-cluster
  /// search connection request.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [crossClusterSearchConnectionId] :
  /// The id of the inbound connection that you want to accept.
  Future<AcceptInboundCrossClusterSearchConnectionResponse>
      acceptInboundCrossClusterSearchConnection({
    @_s.required String crossClusterSearchConnectionId,
  }) async {
    ArgumentError.checkNotNull(
        crossClusterSearchConnectionId, 'crossClusterSearchConnectionId');
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2015-01-01/es/ccs/inboundConnection/${Uri.encodeComponent(crossClusterSearchConnectionId)}/accept',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptInboundCrossClusterSearchConnectionResponse.fromJson(response);
  }

  /// Attaches tags to an existing Elasticsearch domain. Tags are a set of
  /// case-sensitive key value pairs. An Elasticsearch domain may have up to 10
  /// tags. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-awsresorcetagging"
  /// target="_blank"> Tagging Amazon Elasticsearch Service Domains for more
  /// information.</a>
  ///
  /// May throw [BaseException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [arn] :
  /// Specify the <code>ARN</code> for which you want to add the tags.
  ///
  /// Parameter [tagList] :
  /// List of <code>Tag</code> that need to be added for the Elasticsearch
  /// domain.
  Future<void> addTags({
    @_s.required String arn,
    @_s.required List<Tag> tagList,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    ArgumentError.checkNotNull(tagList, 'tagList');
    final $payload = <String, dynamic>{
      'ARN': arn,
      'TagList': tagList,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/tags',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a package with an Amazon ES domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [domainName] :
  /// Name of the domain that you want to associate the package with.
  ///
  /// Parameter [packageID] :
  /// Internal ID of the package that you want to associate with a domain. Use
  /// <code>DescribePackages</code> to find this value.
  Future<AssociatePackageResponse> associatePackage({
    @_s.required String domainName,
    @_s.required String packageID,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(packageID, 'packageID');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2015-01-01/packages/associate/${Uri.encodeComponent(packageID)}/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return AssociatePackageResponse.fromJson(response);
  }

  /// Cancels a scheduled service software update for an Amazon ES domain. You
  /// can only perform this operation before the
  /// <code>AutomatedUpdateDate</code> and when the <code>UpdateStatus</code> is
  /// in the <code>PENDING_UPDATE</code> state.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to stop the latest service software
  /// update on.
  Future<CancelElasticsearchServiceSoftwareUpdateResponse>
      cancelElasticsearchServiceSoftwareUpdate({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'DomainName': domainName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/es/serviceSoftwareUpdate/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelElasticsearchServiceSoftwareUpdateResponse.fromJson(response);
  }

  /// Creates a new Elasticsearch domain. For more information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains"
  /// target="_blank">Creating Elasticsearch Domains</a> in the <i>Amazon
  /// Elasticsearch Service Developer Guide</i>.
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
  /// The name of the Elasticsearch domain that you are creating. Domain names
  /// are unique across the domains owned by an account within an AWS region.
  /// Domain names must start with a lowercase letter and can contain the
  /// following characters: a-z (lowercase), 0-9, and - (hyphen).
  ///
  /// Parameter [accessPolicies] :
  /// IAM access policy as a JSON-formatted string.
  ///
  /// Parameter [advancedOptions] :
  /// Option to allow references to indices in an HTTP request body. Must be
  /// <code>false</code> when configuring access to individual sub-resources. By
  /// default, the value is <code>true</code>. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options"
  /// target="_blank">Configuration Advanced Options</a> for more information.
  ///
  /// Parameter [advancedSecurityOptions] :
  /// Specifies advanced security options.
  ///
  /// Parameter [cognitoOptions] :
  /// Options to specify the Cognito user and identity pools for Kibana
  /// authentication. For more information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html"
  /// target="_blank">Amazon Cognito Authentication for Kibana</a>.
  ///
  /// Parameter [domainEndpointOptions] :
  /// Options to specify configuration that will be applied to the domain
  /// endpoint.
  ///
  /// Parameter [eBSOptions] :
  /// Options to enable, disable and specify the type and size of EBS storage
  /// volumes.
  ///
  /// Parameter [elasticsearchClusterConfig] :
  /// Configuration options for an Elasticsearch domain. Specifies the instance
  /// type and number of instances in the domain cluster.
  ///
  /// Parameter [elasticsearchVersion] :
  /// String of format X.Y to specify version for the Elasticsearch domain eg.
  /// "1.5" or "2.3". For more information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains"
  /// target="_blank">Creating Elasticsearch Domains</a> in the <i>Amazon
  /// Elasticsearch Service Developer Guide</i>.
  ///
  /// Parameter [encryptionAtRestOptions] :
  /// Specifies the Encryption At Rest Options.
  ///
  /// Parameter [logPublishingOptions] :
  /// Map of <code>LogType</code> and <code>LogPublishingOption</code>, each
  /// containing options to publish a given type of Elasticsearch log.
  ///
  /// Parameter [nodeToNodeEncryptionOptions] :
  /// Specifies the NodeToNodeEncryptionOptions.
  ///
  /// Parameter [snapshotOptions] :
  /// Option to set time, in UTC format, of the daily automated snapshot.
  /// Default value is 0 hours.
  ///
  /// Parameter [vPCOptions] :
  /// Options to specify the subnets and security groups for VPC endpoint. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-creating-vpc"
  /// target="_blank">Creating a VPC</a> in <i>VPC Endpoints for Amazon
  /// Elasticsearch Service Domains</i>
  Future<CreateElasticsearchDomainResponse> createElasticsearchDomain({
    @_s.required String domainName,
    String accessPolicies,
    Map<String, String> advancedOptions,
    AdvancedSecurityOptionsInput advancedSecurityOptions,
    CognitoOptions cognitoOptions,
    DomainEndpointOptions domainEndpointOptions,
    EBSOptions eBSOptions,
    ElasticsearchClusterConfig elasticsearchClusterConfig,
    String elasticsearchVersion,
    EncryptionAtRestOptions encryptionAtRestOptions,
    Map<LogType, LogPublishingOption> logPublishingOptions,
    NodeToNodeEncryptionOptions nodeToNodeEncryptionOptions,
    SnapshotOptions snapshotOptions,
    VPCOptions vPCOptions,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'DomainName': domainName,
      if (accessPolicies != null) 'AccessPolicies': accessPolicies,
      if (advancedOptions != null) 'AdvancedOptions': advancedOptions,
      if (advancedSecurityOptions != null)
        'AdvancedSecurityOptions': advancedSecurityOptions,
      if (cognitoOptions != null) 'CognitoOptions': cognitoOptions,
      if (domainEndpointOptions != null)
        'DomainEndpointOptions': domainEndpointOptions,
      if (eBSOptions != null) 'EBSOptions': eBSOptions,
      if (elasticsearchClusterConfig != null)
        'ElasticsearchClusterConfig': elasticsearchClusterConfig,
      if (elasticsearchVersion != null)
        'ElasticsearchVersion': elasticsearchVersion,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (logPublishingOptions != null)
        'LogPublishingOptions':
            logPublishingOptions.map((k, e) => MapEntry(k.toValue(), e)),
      if (nodeToNodeEncryptionOptions != null)
        'NodeToNodeEncryptionOptions': nodeToNodeEncryptionOptions,
      if (snapshotOptions != null) 'SnapshotOptions': snapshotOptions,
      if (vPCOptions != null) 'VPCOptions': vPCOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/es/domain',
      exceptionFnMap: _exceptionFns,
    );
    return CreateElasticsearchDomainResponse.fromJson(response);
  }

  /// Creates a new cross-cluster search connection from a source domain to a
  /// destination domain.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionAlias] :
  /// Specifies the connection alias that will be used by the customer for this
  /// connection.
  ///
  /// Parameter [destinationDomainInfo] :
  /// Specifies the <code><a>DomainInformation</a></code> for the destination
  /// Elasticsearch domain.
  ///
  /// Parameter [sourceDomainInfo] :
  /// Specifies the <code><a>DomainInformation</a></code> for the source
  /// Elasticsearch domain.
  Future<CreateOutboundCrossClusterSearchConnectionResponse>
      createOutboundCrossClusterSearchConnection({
    @_s.required String connectionAlias,
    @_s.required DomainInformation destinationDomainInfo,
    @_s.required DomainInformation sourceDomainInfo,
  }) async {
    ArgumentError.checkNotNull(connectionAlias, 'connectionAlias');
    _s.validateStringLength(
      'connectionAlias',
      connectionAlias,
      0,
      20,
      isRequired: true,
    );
    ArgumentError.checkNotNull(destinationDomainInfo, 'destinationDomainInfo');
    ArgumentError.checkNotNull(sourceDomainInfo, 'sourceDomainInfo');
    final $payload = <String, dynamic>{
      'ConnectionAlias': connectionAlias,
      'DestinationDomainInfo': destinationDomainInfo,
      'SourceDomainInfo': sourceDomainInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/es/ccs/outboundConnection',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOutboundCrossClusterSearchConnectionResponse.fromJson(
        response);
  }

  /// Create a package for use with Amazon ES domains.
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
  /// Unique identifier for the package.
  ///
  /// Parameter [packageSource] :
  /// The customer S3 location <code>PackageSource</code> for importing the
  /// package.
  ///
  /// Parameter [packageType] :
  /// Type of package. Currently supports only TXT-DICTIONARY.
  ///
  /// Parameter [packageDescription] :
  /// Description of the package.
  Future<CreatePackageResponse> createPackage({
    @_s.required String packageName,
    @_s.required PackageSource packageSource,
    @_s.required PackageType packageType,
    String packageDescription,
  }) async {
    ArgumentError.checkNotNull(packageName, 'packageName');
    _s.validateStringLength(
      'packageName',
      packageName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'packageName',
      packageName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(packageSource, 'packageSource');
    ArgumentError.checkNotNull(packageType, 'packageType');
    _s.validateStringLength(
      'packageDescription',
      packageDescription,
      0,
      1024,
    );
    final $payload = <String, dynamic>{
      'PackageName': packageName,
      'PackageSource': packageSource,
      'PackageType': packageType?.toValue() ?? '',
      if (packageDescription != null) 'PackageDescription': packageDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/packages',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePackageResponse.fromJson(response);
  }

  /// Permanently deletes the specified Elasticsearch domain and all of its
  /// data. Once a domain is deleted, it cannot be recovered.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the Elasticsearch domain that you want to permanently delete.
  Future<DeleteElasticsearchDomainResponse> deleteElasticsearchDomain({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteElasticsearchDomainResponse.fromJson(response);
  }

  /// Deletes the service-linked role that Elasticsearch Service uses to manage
  /// and maintain VPC domains. Role deletion will fail if any existing VPC
  /// domains use the role. You must delete any such Elasticsearch domains
  /// before deleting the role. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-enabling-slr"
  /// target="_blank">Deleting Elasticsearch Service Role</a> in <i>VPC
  /// Endpoints for Amazon Elasticsearch Service Domains</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ValidationException].
  Future<void> deleteElasticsearchServiceRole() async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2015-01-01/es/role',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Allows the destination domain owner to delete an existing inbound
  /// cross-cluster search connection.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [crossClusterSearchConnectionId] :
  /// The id of the inbound connection that you want to permanently delete.
  Future<DeleteInboundCrossClusterSearchConnectionResponse>
      deleteInboundCrossClusterSearchConnection({
    @_s.required String crossClusterSearchConnectionId,
  }) async {
    ArgumentError.checkNotNull(
        crossClusterSearchConnectionId, 'crossClusterSearchConnectionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-01-01/es/ccs/inboundConnection/${Uri.encodeComponent(crossClusterSearchConnectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInboundCrossClusterSearchConnectionResponse.fromJson(response);
  }

  /// Allows the source domain owner to delete an existing outbound
  /// cross-cluster search connection.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [crossClusterSearchConnectionId] :
  /// The id of the outbound connection that you want to permanently delete.
  Future<DeleteOutboundCrossClusterSearchConnectionResponse>
      deleteOutboundCrossClusterSearchConnection({
    @_s.required String crossClusterSearchConnectionId,
  }) async {
    ArgumentError.checkNotNull(
        crossClusterSearchConnectionId, 'crossClusterSearchConnectionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-01-01/es/ccs/outboundConnection/${Uri.encodeComponent(crossClusterSearchConnectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteOutboundCrossClusterSearchConnectionResponse.fromJson(
        response);
  }

  /// Delete the package.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [packageID] :
  /// Internal ID of the package that you want to delete. Use
  /// <code>DescribePackages</code> to find this value.
  Future<DeletePackageResponse> deletePackage({
    @_s.required String packageID,
  }) async {
    ArgumentError.checkNotNull(packageID, 'packageID');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2015-01-01/packages/${Uri.encodeComponent(packageID)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePackageResponse.fromJson(response);
  }

  /// Returns domain configuration information about the specified Elasticsearch
  /// domain, including the domain ID, domain endpoint, and domain ARN.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the Elasticsearch domain for which you want information.
  Future<DescribeElasticsearchDomainResponse> describeElasticsearchDomain({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeElasticsearchDomainResponse.fromJson(response);
  }

  /// Provides cluster configuration information about the specified
  /// Elasticsearch domain, such as the state, creation date, update version,
  /// and update date for cluster options.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The Elasticsearch domain that you want to get information about.
  Future<DescribeElasticsearchDomainConfigResponse>
      describeElasticsearchDomainConfig({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}/config',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeElasticsearchDomainConfigResponse.fromJson(response);
  }

  /// Returns domain configuration information about the specified Elasticsearch
  /// domains, including the domain ID, domain endpoint, and domain ARN.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainNames] :
  /// The Elasticsearch domains for which you want information.
  Future<DescribeElasticsearchDomainsResponse> describeElasticsearchDomains({
    @_s.required List<String> domainNames,
  }) async {
    ArgumentError.checkNotNull(domainNames, 'domainNames');
    final $payload = <String, dynamic>{
      'DomainNames': domainNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/es/domain-info',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeElasticsearchDomainsResponse.fromJson(response);
  }

  /// Describe Elasticsearch Limits for a given InstanceType and
  /// ElasticsearchVersion. When modifying existing Domain, specify the <code>
  /// <a>DomainName</a> </code> to know what Limits are supported for modifying.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [elasticsearchVersion] :
  /// Version of Elasticsearch for which <code> <a>Limits</a> </code> are
  /// needed.
  ///
  /// Parameter [instanceType] :
  /// The instance type for an Elasticsearch cluster for which Elasticsearch
  /// <code> <a>Limits</a> </code> are needed.
  ///
  /// Parameter [domainName] :
  /// DomainName represents the name of the Domain that we are trying to modify.
  /// This should be present only if we are querying for Elasticsearch <code>
  /// <a>Limits</a> </code> for existing domain.
  Future<DescribeElasticsearchInstanceTypeLimitsResponse>
      describeElasticsearchInstanceTypeLimits({
    @_s.required String elasticsearchVersion,
    @_s.required ESPartitionInstanceType instanceType,
    String domainName,
  }) async {
    ArgumentError.checkNotNull(elasticsearchVersion, 'elasticsearchVersion');
    ArgumentError.checkNotNull(instanceType, 'instanceType');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
    );
    final $query = <String, List<String>>{
      if (domainName != null) 'domainName': [domainName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-01-01/es/instanceTypeLimits/${Uri.encodeComponent(elasticsearchVersion)}/${Uri.encodeComponent(instanceType.toValue())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeElasticsearchInstanceTypeLimitsResponse.fromJson(response);
  }

  /// Lists all the inbound cross-cluster search connections for a destination
  /// domain.
  ///
  /// May throw [InvalidPaginationTokenException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [filters] :
  /// A list of filters used to match properties for inbound cross-cluster
  /// search connection. Available <code><a>Filter</a></code> names for this
  /// operation are:
  /// <ul>
  /// <li>cross-cluster-search-connection-id</li>
  /// <li>source-domain-info.domain-name</li>
  /// <li>source-domain-info.owner-id</li>
  /// <li>source-domain-info.region</li>
  /// <li>destination-domain-info.domain-name</li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. If not specified,
  /// defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// NextToken is sent in case the earlier API call results contain the
  /// NextToken. It is used for pagination.
  Future<DescribeInboundCrossClusterSearchConnectionsResponse>
      describeInboundCrossClusterSearchConnections({
    List<Filter> filters,
    int maxResults,
    String nextToken,
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
      requestUri: '/2015-01-01/es/ccs/inboundConnection/search',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInboundCrossClusterSearchConnectionsResponse.fromJson(
        response);
  }

  /// Lists all the outbound cross-cluster search connections for a source
  /// domain.
  ///
  /// May throw [InvalidPaginationTokenException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [filters] :
  /// A list of filters used to match properties for outbound cross-cluster
  /// search connection. Available <code><a>Filter</a></code> names for this
  /// operation are:
  /// <ul>
  /// <li>cross-cluster-search-connection-id</li>
  /// <li>destination-domain-info.domain-name</li>
  /// <li>destination-domain-info.owner-id</li>
  /// <li>destination-domain-info.region</li>
  /// <li>source-domain-info.domain-name</li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. If not specified,
  /// defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// NextToken is sent in case the earlier API call results contain the
  /// NextToken. It is used for pagination.
  Future<DescribeOutboundCrossClusterSearchConnectionsResponse>
      describeOutboundCrossClusterSearchConnections({
    List<Filter> filters,
    int maxResults,
    String nextToken,
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
      requestUri: '/2015-01-01/es/ccs/outboundConnection/search',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOutboundCrossClusterSearchConnectionsResponse.fromJson(
        response);
  }

  /// Describes all packages available to Amazon ES. Includes options for
  /// filtering, limiting the number of results, and pagination.
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
  /// Limits results to a maximum number of packages.
  ///
  /// Parameter [nextToken] :
  /// Used for pagination. Only necessary if a previous API call includes a
  /// non-null NextToken value. If provided, returns results for the next page.
  Future<DescribePackagesResponse> describePackages({
    List<DescribePackagesFilter> filters,
    int maxResults,
    String nextToken,
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
      requestUri: '/2015-01-01/packages/describe',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackagesResponse.fromJson(response);
  }

  /// Lists available reserved Elasticsearch instance offerings.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. If not specified,
  /// defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// NextToken should be sent in case if earlier API call produced result
  /// containing NextToken. It is used for pagination.
  ///
  /// Parameter [reservedElasticsearchInstanceOfferingId] :
  /// The offering identifier filter value. Use this parameter to show only the
  /// available offering that matches the specified reservation identifier.
  Future<DescribeReservedElasticsearchInstanceOfferingsResponse>
      describeReservedElasticsearchInstanceOfferings({
    int maxResults,
    String nextToken,
    String reservedElasticsearchInstanceOfferingId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringPattern(
      'reservedElasticsearchInstanceOfferingId',
      reservedElasticsearchInstanceOfferingId,
      r'''\p{XDigit}{8}-\p{XDigit}{4}-\p{XDigit}{4}-\p{XDigit}{4}-\p{XDigit}{12}''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (reservedElasticsearchInstanceOfferingId != null)
        'offeringId': [reservedElasticsearchInstanceOfferingId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-01-01/es/reservedInstanceOfferings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReservedElasticsearchInstanceOfferingsResponse.fromJson(
        response);
  }

  /// Returns information about reserved Elasticsearch instances for this
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. If not specified,
  /// defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// NextToken should be sent in case if earlier API call produced result
  /// containing NextToken. It is used for pagination.
  ///
  /// Parameter [reservedElasticsearchInstanceId] :
  /// The reserved instance identifier filter value. Use this parameter to show
  /// only the reservation that matches the specified reserved Elasticsearch
  /// instance ID.
  Future<DescribeReservedElasticsearchInstancesResponse>
      describeReservedElasticsearchInstances({
    int maxResults,
    String nextToken,
    String reservedElasticsearchInstanceId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringPattern(
      'reservedElasticsearchInstanceId',
      reservedElasticsearchInstanceId,
      r'''\p{XDigit}{8}-\p{XDigit}{4}-\p{XDigit}{4}-\p{XDigit}{4}-\p{XDigit}{12}''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (reservedElasticsearchInstanceId != null)
        'reservationId': [reservedElasticsearchInstanceId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-01-01/es/reservedInstances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReservedElasticsearchInstancesResponse.fromJson(response);
  }

  /// Dissociates a package from the Amazon ES domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [domainName] :
  /// Name of the domain that you want to associate the package with.
  ///
  /// Parameter [packageID] :
  /// Internal ID of the package that you want to associate with a domain. Use
  /// <code>DescribePackages</code> to find this value.
  Future<DissociatePackageResponse> dissociatePackage({
    @_s.required String domainName,
    @_s.required String packageID,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(packageID, 'packageID');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2015-01-01/packages/dissociate/${Uri.encodeComponent(packageID)}/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DissociatePackageResponse.fromJson(response);
  }

  /// Returns a list of upgrade compatible Elastisearch versions. You can
  /// optionally pass a <code> <a>DomainName</a> </code> to get all upgrade
  /// compatible Elasticsearch versions for that specific domain.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  Future<GetCompatibleElasticsearchVersionsResponse>
      getCompatibleElasticsearchVersions({
    String domainName,
  }) async {
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
    );
    final $query = <String, List<String>>{
      if (domainName != null) 'domainName': [domainName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-01-01/es/compatibleVersions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCompatibleElasticsearchVersionsResponse.fromJson(response);
  }

  /// Returns a list of versions of the package, along with their creation time
  /// and commit message.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageID] :
  /// Returns an audit history of versions of the package.
  ///
  /// Parameter [maxResults] :
  /// Limits results to a maximum number of versions.
  ///
  /// Parameter [nextToken] :
  /// Used for pagination. Only necessary if a previous API call includes a
  /// non-null NextToken value. If provided, returns results for the next page.
  Future<GetPackageVersionHistoryResponse> getPackageVersionHistory({
    @_s.required String packageID,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(packageID, 'packageID');
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
          '/2015-01-01/packages/${Uri.encodeComponent(packageID)}/history',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPackageVersionHistoryResponse.fromJson(response);
  }

  /// Retrieves the complete history of the last 10 upgrades that were performed
  /// on the domain.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  Future<GetUpgradeHistoryResponse> getUpgradeHistory({
    @_s.required String domainName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
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
          '/2015-01-01/es/upgradeDomain/${Uri.encodeComponent(domainName)}/history',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetUpgradeHistoryResponse.fromJson(response);
  }

  /// Retrieves the latest status of the last upgrade or upgrade eligibility
  /// check that was performed on the domain.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  Future<GetUpgradeStatusResponse> getUpgradeStatus({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-01-01/es/upgradeDomain/${Uri.encodeComponent(domainName)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetUpgradeStatusResponse.fromJson(response);
  }

  /// Returns the name of all Elasticsearch domains owned by the current user's
  /// account.
  ///
  /// May throw [BaseException].
  /// May throw [ValidationException].
  Future<ListDomainNamesResponse> listDomainNames() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-01-01/domain',
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainNamesResponse.fromJson(response);
  }

  /// Lists all Amazon ES domains associated with the package.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageID] :
  /// The package for which to list domains.
  ///
  /// Parameter [maxResults] :
  /// Limits results to a maximum number of domains.
  ///
  /// Parameter [nextToken] :
  /// Used for pagination. Only necessary if a previous API call includes a
  /// non-null NextToken value. If provided, returns results for the next page.
  Future<ListDomainsForPackageResponse> listDomainsForPackage({
    @_s.required String packageID,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(packageID, 'packageID');
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
          '/2015-01-01/packages/${Uri.encodeComponent(packageID)}/domains',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsForPackageResponse.fromJson(response);
  }

  /// List all Elasticsearch instance types that are supported for given
  /// ElasticsearchVersion
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [elasticsearchVersion] :
  /// Version of Elasticsearch for which list of supported elasticsearch
  /// instance types are needed.
  ///
  /// Parameter [domainName] :
  /// DomainName represents the name of the Domain that we are trying to modify.
  /// This should be present only if we are querying for list of available
  /// Elasticsearch instance types when modifying existing domain.
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. Value provided
  /// must be greater than 30 else it wont be honored.
  ///
  /// Parameter [nextToken] :
  /// NextToken should be sent in case if earlier API call produced result
  /// containing NextToken. It is used for pagination.
  Future<ListElasticsearchInstanceTypesResponse>
      listElasticsearchInstanceTypes({
    @_s.required String elasticsearchVersion,
    String domainName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(elasticsearchVersion, 'elasticsearchVersion');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (domainName != null) 'domainName': [domainName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-01-01/es/instanceTypes/${Uri.encodeComponent(elasticsearchVersion)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListElasticsearchInstanceTypesResponse.fromJson(response);
  }

  /// List all supported Elasticsearch versions
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. Value provided
  /// must be greater than 10 else it wont be honored.
  Future<ListElasticsearchVersionsResponse> listElasticsearchVersions({
    int maxResults,
    String nextToken,
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
      requestUri: '/2015-01-01/es/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListElasticsearchVersionsResponse.fromJson(response);
  }

  /// Lists all packages associated with the Amazon ES domain.
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
  /// Limits results to a maximum number of packages.
  ///
  /// Parameter [nextToken] :
  /// Used for pagination. Only necessary if a previous API call includes a
  /// non-null NextToken value. If provided, returns results for the next page.
  Future<ListPackagesForDomainResponse> listPackagesForDomain({
    @_s.required String domainName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
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
          '/2015-01-01/domain/${Uri.encodeComponent(domainName)}/packages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackagesForDomainResponse.fromJson(response);
  }

  /// Returns all tags for the given Elasticsearch domain.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [arn] :
  /// Specify the <code>ARN</code> for the Elasticsearch domain to which the
  /// tags are attached that you want to view.
  Future<ListTagsResponse> listTags({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    final $query = <String, List<String>>{
      if (arn != null) 'arn': [arn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-01-01/tags/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsResponse.fromJson(response);
  }

  /// Allows you to purchase reserved Elasticsearch instances.
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
  /// Parameter [reservedElasticsearchInstanceOfferingId] :
  /// The ID of the reserved Elasticsearch instance offering to purchase.
  ///
  /// Parameter [instanceCount] :
  /// The number of Elasticsearch instances to reserve.
  Future<PurchaseReservedElasticsearchInstanceOfferingResponse>
      purchaseReservedElasticsearchInstanceOffering({
    @_s.required String reservationName,
    @_s.required String reservedElasticsearchInstanceOfferingId,
    int instanceCount,
  }) async {
    ArgumentError.checkNotNull(reservationName, 'reservationName');
    _s.validateStringLength(
      'reservationName',
      reservationName,
      5,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(reservedElasticsearchInstanceOfferingId,
        'reservedElasticsearchInstanceOfferingId');
    _s.validateStringPattern(
      'reservedElasticsearchInstanceOfferingId',
      reservedElasticsearchInstanceOfferingId,
      r'''\p{XDigit}{8}-\p{XDigit}{4}-\p{XDigit}{4}-\p{XDigit}{4}-\p{XDigit}{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'instanceCount',
      instanceCount,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'ReservationName': reservationName,
      'ReservedElasticsearchInstanceOfferingId':
          reservedElasticsearchInstanceOfferingId,
      if (instanceCount != null) 'InstanceCount': instanceCount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/es/purchaseReservedInstanceOffering',
      exceptionFnMap: _exceptionFns,
    );
    return PurchaseReservedElasticsearchInstanceOfferingResponse.fromJson(
        response);
  }

  /// Allows the destination domain owner to reject an inbound cross-cluster
  /// search connection request.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [crossClusterSearchConnectionId] :
  /// The id of the inbound connection that you want to reject.
  Future<RejectInboundCrossClusterSearchConnectionResponse>
      rejectInboundCrossClusterSearchConnection({
    @_s.required String crossClusterSearchConnectionId,
  }) async {
    ArgumentError.checkNotNull(
        crossClusterSearchConnectionId, 'crossClusterSearchConnectionId');
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2015-01-01/es/ccs/inboundConnection/${Uri.encodeComponent(crossClusterSearchConnectionId)}/reject',
      exceptionFnMap: _exceptionFns,
    );
    return RejectInboundCrossClusterSearchConnectionResponse.fromJson(response);
  }

  /// Removes the specified set of tags from the specified Elasticsearch domain.
  ///
  /// May throw [BaseException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [arn] :
  /// Specifies the <code>ARN</code> for the Elasticsearch domain from which you
  /// want to delete the specified tags.
  ///
  /// Parameter [tagKeys] :
  /// Specifies the <code>TagKey</code> list which you want to remove from the
  /// Elasticsearch domain.
  Future<void> removeTags({
    @_s.required String arn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $payload = <String, dynamic>{
      'ARN': arn,
      'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/tags-removal',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Schedules a service software update for an Amazon ES domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to update to the latest service
  /// software.
  Future<StartElasticsearchServiceSoftwareUpdateResponse>
      startElasticsearchServiceSoftwareUpdate({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'DomainName': domainName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/es/serviceSoftwareUpdate/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartElasticsearchServiceSoftwareUpdateResponse.fromJson(response);
  }

  /// Modifies the cluster configuration of the specified Elasticsearch domain,
  /// setting as setting the instance type and the number of instances.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the Elasticsearch domain that you are updating.
  ///
  /// Parameter [accessPolicies] :
  /// IAM access policy as a JSON-formatted string.
  ///
  /// Parameter [advancedOptions] :
  /// Modifies the advanced option to allow references to indices in an HTTP
  /// request body. Must be <code>false</code> when configuring access to
  /// individual sub-resources. By default, the value is <code>true</code>. See
  /// <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options"
  /// target="_blank">Configuration Advanced Options</a> for more information.
  ///
  /// Parameter [advancedSecurityOptions] :
  /// Specifies advanced security options.
  ///
  /// Parameter [cognitoOptions] :
  /// Options to specify the Cognito user and identity pools for Kibana
  /// authentication. For more information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html"
  /// target="_blank">Amazon Cognito Authentication for Kibana</a>.
  ///
  /// Parameter [domainEndpointOptions] :
  /// Options to specify configuration that will be applied to the domain
  /// endpoint.
  ///
  /// Parameter [eBSOptions] :
  /// Specify the type and size of the EBS volume that you want to use.
  ///
  /// Parameter [elasticsearchClusterConfig] :
  /// The type and number of instances to instantiate for the domain cluster.
  ///
  /// Parameter [logPublishingOptions] :
  /// Map of <code>LogType</code> and <code>LogPublishingOption</code>, each
  /// containing options to publish a given type of Elasticsearch log.
  ///
  /// Parameter [snapshotOptions] :
  /// Option to set the time, in UTC format, for the daily automated snapshot.
  /// Default value is <code>0</code> hours.
  ///
  /// Parameter [vPCOptions] :
  /// Options to specify the subnets and security groups for VPC endpoint. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-creating-vpc"
  /// target="_blank">Creating a VPC</a> in <i>VPC Endpoints for Amazon
  /// Elasticsearch Service Domains</i>
  Future<UpdateElasticsearchDomainConfigResponse>
      updateElasticsearchDomainConfig({
    @_s.required String domainName,
    String accessPolicies,
    Map<String, String> advancedOptions,
    AdvancedSecurityOptionsInput advancedSecurityOptions,
    CognitoOptions cognitoOptions,
    DomainEndpointOptions domainEndpointOptions,
    EBSOptions eBSOptions,
    ElasticsearchClusterConfig elasticsearchClusterConfig,
    Map<LogType, LogPublishingOption> logPublishingOptions,
    SnapshotOptions snapshotOptions,
    VPCOptions vPCOptions,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (accessPolicies != null) 'AccessPolicies': accessPolicies,
      if (advancedOptions != null) 'AdvancedOptions': advancedOptions,
      if (advancedSecurityOptions != null)
        'AdvancedSecurityOptions': advancedSecurityOptions,
      if (cognitoOptions != null) 'CognitoOptions': cognitoOptions,
      if (domainEndpointOptions != null)
        'DomainEndpointOptions': domainEndpointOptions,
      if (eBSOptions != null) 'EBSOptions': eBSOptions,
      if (elasticsearchClusterConfig != null)
        'ElasticsearchClusterConfig': elasticsearchClusterConfig,
      if (logPublishingOptions != null)
        'LogPublishingOptions':
            logPublishingOptions.map((k, e) => MapEntry(k.toValue(), e)),
      if (snapshotOptions != null) 'SnapshotOptions': snapshotOptions,
      if (vPCOptions != null) 'VPCOptions': vPCOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}/config',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateElasticsearchDomainConfigResponse.fromJson(response);
  }

  /// Updates a package for use with Amazon ES domains.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageID] :
  /// Unique identifier for the package.
  ///
  /// Parameter [commitMessage] :
  /// An info message for the new version which will be shown as part of
  /// <code>GetPackageVersionHistoryResponse</code>.
  ///
  /// Parameter [packageDescription] :
  /// New description of the package.
  Future<UpdatePackageResponse> updatePackage({
    @_s.required String packageID,
    @_s.required PackageSource packageSource,
    String commitMessage,
    String packageDescription,
  }) async {
    ArgumentError.checkNotNull(packageID, 'packageID');
    ArgumentError.checkNotNull(packageSource, 'packageSource');
    _s.validateStringLength(
      'commitMessage',
      commitMessage,
      0,
      160,
    );
    _s.validateStringLength(
      'packageDescription',
      packageDescription,
      0,
      1024,
    );
    final $payload = <String, dynamic>{
      'PackageID': packageID,
      'PackageSource': packageSource,
      if (commitMessage != null) 'CommitMessage': commitMessage,
      if (packageDescription != null) 'PackageDescription': packageDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/packages/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePackageResponse.fromJson(response);
  }

  /// Allows you to either upgrade your domain or perform an Upgrade eligibility
  /// check to a compatible Elasticsearch version.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [targetVersion] :
  /// The version of Elasticsearch that you intend to upgrade the domain to.
  ///
  /// Parameter [performCheckOnly] :
  /// This flag, when set to True, indicates that an Upgrade Eligibility Check
  /// needs to be performed. This will not actually perform the Upgrade.
  Future<UpgradeElasticsearchDomainResponse> upgradeElasticsearchDomain({
    @_s.required String domainName,
    @_s.required String targetVersion,
    bool performCheckOnly,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''[a-z][a-z0-9\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetVersion, 'targetVersion');
    final $payload = <String, dynamic>{
      'DomainName': domainName,
      'TargetVersion': targetVersion,
      if (performCheckOnly != null) 'PerformCheckOnly': performCheckOnly,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-01-01/es/upgradeDomain',
      exceptionFnMap: _exceptionFns,
    );
    return UpgradeElasticsearchDomainResponse.fromJson(response);
  }
}

/// The result of a
/// <code><a>AcceptInboundCrossClusterSearchConnection</a></code> operation.
/// Contains details of accepted inbound connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptInboundCrossClusterSearchConnectionResponse {
  /// Specifies the <code><a>InboundCrossClusterSearchConnection</a></code> of
  /// accepted inbound connection.
  @_s.JsonKey(name: 'CrossClusterSearchConnection')
  final InboundCrossClusterSearchConnection crossClusterSearchConnection;

  AcceptInboundCrossClusterSearchConnectionResponse({
    this.crossClusterSearchConnection,
  });
  factory AcceptInboundCrossClusterSearchConnectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AcceptInboundCrossClusterSearchConnectionResponseFromJson(json);
}

/// The configured access rules for the domain's document and search endpoints,
/// and the current status of those rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccessPoliciesStatus {
  /// The access policy configured for the Elasticsearch domain. Access policies
  /// may be resource-based, IP-based, or IAM-based. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-access-policies"
  /// target="_blank"> Configuring Access Policies</a>for more information.
  @_s.JsonKey(name: 'Options')
  final String options;

  /// The status of the access policy for the Elasticsearch domain. See
  /// <code>OptionStatus</code> for the status information that's included.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  AccessPoliciesStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory AccessPoliciesStatus.fromJson(Map<String, dynamic> json) =>
      _$AccessPoliciesStatusFromJson(json);
}

/// List of limits that are specific to a given InstanceType and for each of
/// it's <code> <a>InstanceRole</a> </code> .
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdditionalLimit {
  /// Name of Additional Limit is specific to a given InstanceType and for each of
  /// it's <code> <a>InstanceRole</a> </code> etc. <br/> Attributes and their
  /// details: <br/>
  /// <ul>
  /// <li>MaximumNumberOfDataNodesSupported</li> This attribute will be present in
  /// Master node only to specify how much data nodes upto which given <code>
  /// <a>ESPartitionInstanceType</a> </code> can support as master node.
  /// <li>MaximumNumberOfDataNodesWithoutMasterNode</li> This attribute will be
  /// present in Data node only to specify how much data nodes of given <code>
  /// <a>ESPartitionInstanceType</a> </code> upto which you don't need any master
  /// nodes to govern them.
  /// </ul>
  @_s.JsonKey(name: 'LimitName')
  final String limitName;

  /// Value for given <code> <a>AdditionalLimit$LimitName</a> </code> .
  @_s.JsonKey(name: 'LimitValues')
  final List<String> limitValues;

  AdditionalLimit({
    this.limitName,
    this.limitValues,
  });
  factory AdditionalLimit.fromJson(Map<String, dynamic> json) =>
      _$AdditionalLimitFromJson(json);
}

/// Status of the advanced options for the specified Elasticsearch domain.
/// Currently, the following advanced options are available:
///
/// <ul>
/// <li>Option to allow references to indices in an HTTP request body. Must be
/// <code>false</code> when configuring access to individual sub-resources. By
/// default, the value is <code>true</code>. See <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options"
/// target="_blank">Configuration Advanced Options</a> for more
/// information.</li>
/// <li>Option to specify the percentage of heap space that is allocated to
/// field data. By default, this setting is unbounded.</li>
/// </ul>
/// For more information, see <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options">Configuring
/// Advanced Options</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdvancedOptionsStatus {
  /// Specifies the status of advanced options for the specified Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'Options')
  final Map<String, String> options;

  /// Specifies the status of <code>OptionStatus</code> for advanced options for
  /// the specified Elasticsearch domain.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  AdvancedOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory AdvancedOptionsStatus.fromJson(Map<String, dynamic> json) =>
      _$AdvancedOptionsStatusFromJson(json);
}

/// Specifies the advanced security configuration: whether advanced security is
/// enabled, whether the internal database option is enabled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdvancedSecurityOptions {
  /// True if advanced security is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// True if the internal user database is enabled.
  @_s.JsonKey(name: 'InternalUserDatabaseEnabled')
  final bool internalUserDatabaseEnabled;

  /// Describes the SAML application configured for a domain.
  @_s.JsonKey(name: 'SAMLOptions')
  final SAMLOptionsOutput sAMLOptions;

  AdvancedSecurityOptions({
    this.enabled,
    this.internalUserDatabaseEnabled,
    this.sAMLOptions,
  });
  factory AdvancedSecurityOptions.fromJson(Map<String, dynamic> json) =>
      _$AdvancedSecurityOptionsFromJson(json);
}

/// Specifies the advanced security configuration: whether advanced security is
/// enabled, whether the internal database option is enabled, master username
/// and password (if internal database is enabled), and master user ARN (if IAM
/// is enabled).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AdvancedSecurityOptionsInput {
  /// True if advanced security is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// True if the internal user database is enabled.
  @_s.JsonKey(name: 'InternalUserDatabaseEnabled')
  final bool internalUserDatabaseEnabled;

  /// Credentials for the master user: username and password, ARN, or both.
  @_s.JsonKey(name: 'MasterUserOptions')
  final MasterUserOptions masterUserOptions;

  /// Specifies the SAML application configuration for the domain.
  @_s.JsonKey(name: 'SAMLOptions')
  final SAMLOptionsInput sAMLOptions;

  AdvancedSecurityOptionsInput({
    this.enabled,
    this.internalUserDatabaseEnabled,
    this.masterUserOptions,
    this.sAMLOptions,
  });
  Map<String, dynamic> toJson() => _$AdvancedSecurityOptionsInputToJson(this);
}

/// Specifies the status of advanced security options for the specified
/// Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdvancedSecurityOptionsStatus {
  /// Specifies advanced security options for the specified Elasticsearch domain.
  @_s.JsonKey(name: 'Options')
  final AdvancedSecurityOptions options;

  /// Status of the advanced security options for the specified Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  AdvancedSecurityOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory AdvancedSecurityOptionsStatus.fromJson(Map<String, dynamic> json) =>
      _$AdvancedSecurityOptionsStatusFromJson(json);
}

/// Container for response returned by <code> <a>AssociatePackage</a> </code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociatePackageResponse {
  /// <code>DomainPackageDetails</code>
  @_s.JsonKey(name: 'DomainPackageDetails')
  final DomainPackageDetails domainPackageDetails;

  AssociatePackageResponse({
    this.domainPackageDetails,
  });
  factory AssociatePackageResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociatePackageResponseFromJson(json);
}

/// The result of a <code>CancelElasticsearchServiceSoftwareUpdate</code>
/// operation. Contains the status of the update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelElasticsearchServiceSoftwareUpdateResponse {
  /// The current status of the Elasticsearch service software update.
  @_s.JsonKey(name: 'ServiceSoftwareOptions')
  final ServiceSoftwareOptions serviceSoftwareOptions;

  CancelElasticsearchServiceSoftwareUpdateResponse({
    this.serviceSoftwareOptions,
  });
  factory CancelElasticsearchServiceSoftwareUpdateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CancelElasticsearchServiceSoftwareUpdateResponseFromJson(json);
}

/// Options to specify the Cognito user and identity pools for Kibana
/// authentication. For more information, see <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html"
/// target="_blank">Amazon Cognito Authentication for Kibana</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CognitoOptions {
  /// Specifies the option to enable Cognito for Kibana authentication.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Specifies the Cognito identity pool ID for Kibana authentication.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  /// Specifies the role ARN that provides Elasticsearch permissions for accessing
  /// Cognito resources.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Specifies the Cognito user pool ID for Kibana authentication.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  CognitoOptions({
    this.enabled,
    this.identityPoolId,
    this.roleArn,
    this.userPoolId,
  });
  factory CognitoOptions.fromJson(Map<String, dynamic> json) =>
      _$CognitoOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$CognitoOptionsToJson(this);
}

/// Status of the Cognito options for the specified Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CognitoOptionsStatus {
  /// Specifies the Cognito options for the specified Elasticsearch domain.
  @_s.JsonKey(name: 'Options')
  final CognitoOptions options;

  /// Specifies the status of the Cognito options for the specified Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  CognitoOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory CognitoOptionsStatus.fromJson(Map<String, dynamic> json) =>
      _$CognitoOptionsStatusFromJson(json);
}

/// A map from an <code> <a>ElasticsearchVersion</a> </code> to a list of
/// compatible <code> <a>ElasticsearchVersion</a> </code> s to which the domain
/// can be upgraded.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompatibleVersionsMap {
  /// The current version of Elasticsearch on which a domain is.
  @_s.JsonKey(name: 'SourceVersion')
  final String sourceVersion;
  @_s.JsonKey(name: 'TargetVersions')
  final List<String> targetVersions;

  CompatibleVersionsMap({
    this.sourceVersion,
    this.targetVersions,
  });
  factory CompatibleVersionsMap.fromJson(Map<String, dynamic> json) =>
      _$CompatibleVersionsMapFromJson(json);
}

/// The result of a <code>CreateElasticsearchDomain</code> operation. Contains
/// the status of the newly created Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateElasticsearchDomainResponse {
  /// The status of the newly created Elasticsearch domain.
  @_s.JsonKey(name: 'DomainStatus')
  final ElasticsearchDomainStatus domainStatus;

  CreateElasticsearchDomainResponse({
    this.domainStatus,
  });
  factory CreateElasticsearchDomainResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateElasticsearchDomainResponseFromJson(json);
}

/// The result of a
/// <code><a>CreateOutboundCrossClusterSearchConnection</a></code> request.
/// Contains the details of the newly created cross-cluster search connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateOutboundCrossClusterSearchConnectionResponse {
  /// Specifies the connection alias provided during the create connection
  /// request.
  @_s.JsonKey(name: 'ConnectionAlias')
  final String connectionAlias;

  /// Specifies the <code><a>OutboundCrossClusterSearchConnectionStatus</a></code>
  /// for the newly created connection.
  @_s.JsonKey(name: 'ConnectionStatus')
  final OutboundCrossClusterSearchConnectionStatus connectionStatus;

  /// Unique id for the created outbound connection, which is used for subsequent
  /// operations on connection.
  @_s.JsonKey(name: 'CrossClusterSearchConnectionId')
  final String crossClusterSearchConnectionId;

  /// Specifies the <code><a>DomainInformation</a></code> for the destination
  /// Elasticsearch domain.
  @_s.JsonKey(name: 'DestinationDomainInfo')
  final DomainInformation destinationDomainInfo;

  /// Specifies the <code><a>DomainInformation</a></code> for the source
  /// Elasticsearch domain.
  @_s.JsonKey(name: 'SourceDomainInfo')
  final DomainInformation sourceDomainInfo;

  CreateOutboundCrossClusterSearchConnectionResponse({
    this.connectionAlias,
    this.connectionStatus,
    this.crossClusterSearchConnectionId,
    this.destinationDomainInfo,
    this.sourceDomainInfo,
  });
  factory CreateOutboundCrossClusterSearchConnectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateOutboundCrossClusterSearchConnectionResponseFromJson(json);
}

/// Container for response returned by <code> <a>CreatePackage</a> </code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePackageResponse {
  /// Information about the package <code>PackageDetails</code>.
  @_s.JsonKey(name: 'PackageDetails')
  final PackageDetails packageDetails;

  CreatePackageResponse({
    this.packageDetails,
  });
  factory CreatePackageResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePackageResponseFromJson(json);
}

/// The result of a <code>DeleteElasticsearchDomain</code> request. Contains the
/// status of the pending deletion, or no status if the domain and all of its
/// resources have been deleted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteElasticsearchDomainResponse {
  /// The status of the Elasticsearch domain being deleted.
  @_s.JsonKey(name: 'DomainStatus')
  final ElasticsearchDomainStatus domainStatus;

  DeleteElasticsearchDomainResponse({
    this.domainStatus,
  });
  factory DeleteElasticsearchDomainResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteElasticsearchDomainResponseFromJson(json);
}

/// The result of a
/// <code><a>DeleteInboundCrossClusterSearchConnection</a></code> operation.
/// Contains details of deleted inbound connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInboundCrossClusterSearchConnectionResponse {
  /// Specifies the <code><a>InboundCrossClusterSearchConnection</a></code> of
  /// deleted inbound connection.
  @_s.JsonKey(name: 'CrossClusterSearchConnection')
  final InboundCrossClusterSearchConnection crossClusterSearchConnection;

  DeleteInboundCrossClusterSearchConnectionResponse({
    this.crossClusterSearchConnection,
  });
  factory DeleteInboundCrossClusterSearchConnectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteInboundCrossClusterSearchConnectionResponseFromJson(json);
}

/// The result of a
/// <code><a>DeleteOutboundCrossClusterSearchConnection</a></code> operation.
/// Contains details of deleted outbound connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteOutboundCrossClusterSearchConnectionResponse {
  /// Specifies the <code><a>OutboundCrossClusterSearchConnection</a></code> of
  /// deleted outbound connection.
  @_s.JsonKey(name: 'CrossClusterSearchConnection')
  final OutboundCrossClusterSearchConnection crossClusterSearchConnection;

  DeleteOutboundCrossClusterSearchConnectionResponse({
    this.crossClusterSearchConnection,
  });
  factory DeleteOutboundCrossClusterSearchConnectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteOutboundCrossClusterSearchConnectionResponseFromJson(json);
}

/// Container for response parameters to <code> <a>DeletePackage</a> </code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePackageResponse {
  /// <code>PackageDetails</code>
  @_s.JsonKey(name: 'PackageDetails')
  final PackageDetails packageDetails;

  DeletePackageResponse({
    this.packageDetails,
  });
  factory DeletePackageResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePackageResponseFromJson(json);
}

enum DeploymentStatus {
  @_s.JsonValue('PENDING_UPDATE')
  pendingUpdate,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('NOT_ELIGIBLE')
  notEligible,
  @_s.JsonValue('ELIGIBLE')
  eligible,
}

/// The result of a <code>DescribeElasticsearchDomainConfig</code> request.
/// Contains the configuration information of the requested domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeElasticsearchDomainConfigResponse {
  /// The configuration information of the domain requested in the
  /// <code>DescribeElasticsearchDomainConfig</code> request.
  @_s.JsonKey(name: 'DomainConfig')
  final ElasticsearchDomainConfig domainConfig;

  DescribeElasticsearchDomainConfigResponse({
    @_s.required this.domainConfig,
  });
  factory DescribeElasticsearchDomainConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeElasticsearchDomainConfigResponseFromJson(json);
}

/// The result of a <code>DescribeElasticsearchDomain</code> request. Contains
/// the status of the domain specified in the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeElasticsearchDomainResponse {
  /// The current status of the Elasticsearch domain.
  @_s.JsonKey(name: 'DomainStatus')
  final ElasticsearchDomainStatus domainStatus;

  DescribeElasticsearchDomainResponse({
    @_s.required this.domainStatus,
  });
  factory DescribeElasticsearchDomainResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeElasticsearchDomainResponseFromJson(json);
}

/// The result of a <code>DescribeElasticsearchDomains</code> request. Contains
/// the status of the specified domains or all domains owned by the account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeElasticsearchDomainsResponse {
  /// The status of the domains requested in the
  /// <code>DescribeElasticsearchDomains</code> request.
  @_s.JsonKey(name: 'DomainStatusList')
  final List<ElasticsearchDomainStatus> domainStatusList;

  DescribeElasticsearchDomainsResponse({
    @_s.required this.domainStatusList,
  });
  factory DescribeElasticsearchDomainsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeElasticsearchDomainsResponseFromJson(json);
}

/// Container for the parameters received from <code>
/// <a>DescribeElasticsearchInstanceTypeLimits</a> </code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeElasticsearchInstanceTypeLimitsResponse {
  @_s.JsonKey(name: 'LimitsByRole')
  final Map<String, Limits> limitsByRole;

  DescribeElasticsearchInstanceTypeLimitsResponse({
    this.limitsByRole,
  });
  factory DescribeElasticsearchInstanceTypeLimitsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeElasticsearchInstanceTypeLimitsResponseFromJson(json);
}

/// The result of a
/// <code><a>DescribeInboundCrossClusterSearchConnections</a></code> request.
/// Contains the list of connections matching the filter criteria.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInboundCrossClusterSearchConnectionsResponse {
  /// Consists of list of <code><a>InboundCrossClusterSearchConnection</a></code>
  /// matching the specified filter criteria.
  @_s.JsonKey(name: 'CrossClusterSearchConnections')
  final List<InboundCrossClusterSearchConnection> crossClusterSearchConnections;

  /// If more results are available and NextToken is present, make the next
  /// request to the same API with the received NextToken to paginate the
  /// remaining results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeInboundCrossClusterSearchConnectionsResponse({
    this.crossClusterSearchConnections,
    this.nextToken,
  });
  factory DescribeInboundCrossClusterSearchConnectionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInboundCrossClusterSearchConnectionsResponseFromJson(json);
}

/// The result of a
/// <code><a>DescribeOutboundCrossClusterSearchConnections</a></code> request.
/// Contains the list of connections matching the filter criteria.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOutboundCrossClusterSearchConnectionsResponse {
  /// Consists of list of <code><a>OutboundCrossClusterSearchConnection</a></code>
  /// matching the specified filter criteria.
  @_s.JsonKey(name: 'CrossClusterSearchConnections')
  final List<OutboundCrossClusterSearchConnection>
      crossClusterSearchConnections;

  /// If more results are available and NextToken is present, make the next
  /// request to the same API with the received NextToken to paginate the
  /// remaining results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeOutboundCrossClusterSearchConnectionsResponse({
    this.crossClusterSearchConnections,
    this.nextToken,
  });
  factory DescribeOutboundCrossClusterSearchConnectionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOutboundCrossClusterSearchConnectionsResponseFromJson(json);
}

/// Filter to apply in <code>DescribePackage</code> response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribePackagesFilter {
  /// Any field from <code>PackageDetails</code>.
  @_s.JsonKey(name: 'Name')
  final DescribePackagesFilterName name;

  /// A list of values for the specified field.
  @_s.JsonKey(name: 'Value')
  final List<String> value;

  DescribePackagesFilter({
    this.name,
    this.value,
  });
  Map<String, dynamic> toJson() => _$DescribePackagesFilterToJson(this);
}

enum DescribePackagesFilterName {
  @_s.JsonValue('PackageID')
  packageID,
  @_s.JsonValue('PackageName')
  packageName,
  @_s.JsonValue('PackageStatus')
  packageStatus,
}

/// Container for response returned by <code> <a>DescribePackages</a> </code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePackagesResponse {
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of <code>PackageDetails</code> objects.
  @_s.JsonKey(name: 'PackageDetailsList')
  final List<PackageDetails> packageDetailsList;

  DescribePackagesResponse({
    this.nextToken,
    this.packageDetailsList,
  });
  factory DescribePackagesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribePackagesResponseFromJson(json);
}

/// Container for results from
/// <code>DescribeReservedElasticsearchInstanceOfferings</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReservedElasticsearchInstanceOfferingsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of reserved Elasticsearch instance offerings
  @_s.JsonKey(name: 'ReservedElasticsearchInstanceOfferings')
  final List<ReservedElasticsearchInstanceOffering>
      reservedElasticsearchInstanceOfferings;

  DescribeReservedElasticsearchInstanceOfferingsResponse({
    this.nextToken,
    this.reservedElasticsearchInstanceOfferings,
  });
  factory DescribeReservedElasticsearchInstanceOfferingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeReservedElasticsearchInstanceOfferingsResponseFromJson(json);
}

/// Container for results from
/// <code>DescribeReservedElasticsearchInstances</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReservedElasticsearchInstancesResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of reserved Elasticsearch instances.
  @_s.JsonKey(name: 'ReservedElasticsearchInstances')
  final List<ReservedElasticsearchInstance> reservedElasticsearchInstances;

  DescribeReservedElasticsearchInstancesResponse({
    this.nextToken,
    this.reservedElasticsearchInstances,
  });
  factory DescribeReservedElasticsearchInstancesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeReservedElasticsearchInstancesResponseFromJson(json);
}

/// Container for response returned by <code> <a>DissociatePackage</a> </code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DissociatePackageResponse {
  /// <code>DomainPackageDetails</code>
  @_s.JsonKey(name: 'DomainPackageDetails')
  final DomainPackageDetails domainPackageDetails;

  DissociatePackageResponse({
    this.domainPackageDetails,
  });
  factory DissociatePackageResponse.fromJson(Map<String, dynamic> json) =>
      _$DissociatePackageResponseFromJson(json);
}

/// Options to configure endpoint for the Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DomainEndpointOptions {
  /// Specify the fully qualified domain for your custom endpoint.
  @_s.JsonKey(name: 'CustomEndpoint')
  final String customEndpoint;

  /// Specify ACM certificate ARN for your custom endpoint.
  @_s.JsonKey(name: 'CustomEndpointCertificateArn')
  final String customEndpointCertificateArn;

  /// Specify if custom endpoint should be enabled for the Elasticsearch domain.
  @_s.JsonKey(name: 'CustomEndpointEnabled')
  final bool customEndpointEnabled;

  /// Specify if only HTTPS endpoint should be enabled for the Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'EnforceHTTPS')
  final bool enforceHTTPS;

  /// Specify the TLS security policy that needs to be applied to the HTTPS
  /// endpoint of Elasticsearch domain. <br/> It can be one of the following
  /// values:
  /// <ul>
  /// <li><b>Policy-Min-TLS-1-0-2019-07: </b> TLS security policy which supports
  /// TLSv1.0 and higher.</li>
  /// <li><b>Policy-Min-TLS-1-2-2019-07: </b> TLS security policy which supports
  /// only TLSv1.2</li>
  /// </ul>
  @_s.JsonKey(name: 'TLSSecurityPolicy')
  final TLSSecurityPolicy tLSSecurityPolicy;

  DomainEndpointOptions({
    this.customEndpoint,
    this.customEndpointCertificateArn,
    this.customEndpointEnabled,
    this.enforceHTTPS,
    this.tLSSecurityPolicy,
  });
  factory DomainEndpointOptions.fromJson(Map<String, dynamic> json) =>
      _$DomainEndpointOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$DomainEndpointOptionsToJson(this);
}

/// The configured endpoint options for the domain and their current status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainEndpointOptionsStatus {
  /// Options to configure endpoint for the Elasticsearch domain.
  @_s.JsonKey(name: 'Options')
  final DomainEndpointOptions options;

  /// The status of the endpoint options for the Elasticsearch domain. See
  /// <code>OptionStatus</code> for the status information that's included.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  DomainEndpointOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory DomainEndpointOptionsStatus.fromJson(Map<String, dynamic> json) =>
      _$DomainEndpointOptionsStatusFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainInfo {
  /// Specifies the <code>DomainName</code>.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  DomainInfo({
    this.domainName,
  });
  factory DomainInfo.fromJson(Map<String, dynamic> json) =>
      _$DomainInfoFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DomainInformation {
  @_s.JsonKey(name: 'DomainName')
  final String domainName;
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;
  @_s.JsonKey(name: 'Region')
  final String region;

  DomainInformation({
    @_s.required this.domainName,
    this.ownerId,
    this.region,
  });
  factory DomainInformation.fromJson(Map<String, dynamic> json) =>
      _$DomainInformationFromJson(json);

  Map<String, dynamic> toJson() => _$DomainInformationToJson(this);
}

/// Information on a package that is associated with a domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainPackageDetails {
  /// Name of the domain you've associated a package with.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// State of the association. Values are
  /// ASSOCIATING/ASSOCIATION_FAILED/ACTIVE/DISSOCIATING/DISSOCIATION_FAILED.
  @_s.JsonKey(name: 'DomainPackageStatus')
  final DomainPackageStatus domainPackageStatus;

  /// Additional information if the package is in an error state. Null otherwise.
  @_s.JsonKey(name: 'ErrorDetails')
  final ErrorDetails errorDetails;

  /// Timestamp of the most-recent update to the association status.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdated')
  final DateTime lastUpdated;

  /// Internal ID of the package.
  @_s.JsonKey(name: 'PackageID')
  final String packageID;

  /// User specified name of the package.
  @_s.JsonKey(name: 'PackageName')
  final String packageName;

  /// Currently supports only TXT-DICTIONARY.
  @_s.JsonKey(name: 'PackageType')
  final PackageType packageType;
  @_s.JsonKey(name: 'PackageVersion')
  final String packageVersion;

  /// The relative path on Amazon ES nodes, which can be used as synonym_path when
  /// the package is synonym file.
  @_s.JsonKey(name: 'ReferencePath')
  final String referencePath;

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
  factory DomainPackageDetails.fromJson(Map<String, dynamic> json) =>
      _$DomainPackageDetailsFromJson(json);
}

enum DomainPackageStatus {
  @_s.JsonValue('ASSOCIATING')
  associating,
  @_s.JsonValue('ASSOCIATION_FAILED')
  associationFailed,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DISSOCIATING')
  dissociating,
  @_s.JsonValue('DISSOCIATION_FAILED')
  dissociationFailed,
}

/// Options to enable, disable, and specify the properties of EBS storage
/// volumes. For more information, see <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-ebs"
/// target="_blank"> Configuring EBS-based Storage</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EBSOptions {
  /// Specifies whether EBS-based storage is enabled.
  @_s.JsonKey(name: 'EBSEnabled')
  final bool eBSEnabled;

  /// Specifies the IOPD for a Provisioned IOPS EBS volume (SSD).
  @_s.JsonKey(name: 'Iops')
  final int iops;

  /// Integer to specify the size of an EBS volume.
  @_s.JsonKey(name: 'VolumeSize')
  final int volumeSize;

  /// Specifies the volume type for EBS-based storage.
  @_s.JsonKey(name: 'VolumeType')
  final VolumeType volumeType;

  EBSOptions({
    this.eBSEnabled,
    this.iops,
    this.volumeSize,
    this.volumeType,
  });
  factory EBSOptions.fromJson(Map<String, dynamic> json) =>
      _$EBSOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$EBSOptionsToJson(this);
}

/// Status of the EBS options for the specified Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EBSOptionsStatus {
  /// Specifies the EBS options for the specified Elasticsearch domain.
  @_s.JsonKey(name: 'Options')
  final EBSOptions options;

  /// Specifies the status of the EBS options for the specified Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  EBSOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory EBSOptionsStatus.fromJson(Map<String, dynamic> json) =>
      _$EBSOptionsStatusFromJson(json);
}

enum ESPartitionInstanceType {
  @_s.JsonValue('m3.medium.elasticsearch')
  m3MediumElasticsearch,
  @_s.JsonValue('m3.large.elasticsearch')
  m3LargeElasticsearch,
  @_s.JsonValue('m3.xlarge.elasticsearch')
  m3XlargeElasticsearch,
  @_s.JsonValue('m3.2xlarge.elasticsearch')
  m3_2xlargeElasticsearch,
  @_s.JsonValue('m4.large.elasticsearch')
  m4LargeElasticsearch,
  @_s.JsonValue('m4.xlarge.elasticsearch')
  m4XlargeElasticsearch,
  @_s.JsonValue('m4.2xlarge.elasticsearch')
  m4_2xlargeElasticsearch,
  @_s.JsonValue('m4.4xlarge.elasticsearch')
  m4_4xlargeElasticsearch,
  @_s.JsonValue('m4.10xlarge.elasticsearch')
  m4_10xlargeElasticsearch,
  @_s.JsonValue('m5.large.elasticsearch')
  m5LargeElasticsearch,
  @_s.JsonValue('m5.xlarge.elasticsearch')
  m5XlargeElasticsearch,
  @_s.JsonValue('m5.2xlarge.elasticsearch')
  m5_2xlargeElasticsearch,
  @_s.JsonValue('m5.4xlarge.elasticsearch')
  m5_4xlargeElasticsearch,
  @_s.JsonValue('m5.12xlarge.elasticsearch')
  m5_12xlargeElasticsearch,
  @_s.JsonValue('r5.large.elasticsearch')
  r5LargeElasticsearch,
  @_s.JsonValue('r5.xlarge.elasticsearch')
  r5XlargeElasticsearch,
  @_s.JsonValue('r5.2xlarge.elasticsearch')
  r5_2xlargeElasticsearch,
  @_s.JsonValue('r5.4xlarge.elasticsearch')
  r5_4xlargeElasticsearch,
  @_s.JsonValue('r5.12xlarge.elasticsearch')
  r5_12xlargeElasticsearch,
  @_s.JsonValue('c5.large.elasticsearch')
  c5LargeElasticsearch,
  @_s.JsonValue('c5.xlarge.elasticsearch')
  c5XlargeElasticsearch,
  @_s.JsonValue('c5.2xlarge.elasticsearch')
  c5_2xlargeElasticsearch,
  @_s.JsonValue('c5.4xlarge.elasticsearch')
  c5_4xlargeElasticsearch,
  @_s.JsonValue('c5.9xlarge.elasticsearch')
  c5_9xlargeElasticsearch,
  @_s.JsonValue('c5.18xlarge.elasticsearch')
  c5_18xlargeElasticsearch,
  @_s.JsonValue('ultrawarm1.medium.elasticsearch')
  ultrawarm1MediumElasticsearch,
  @_s.JsonValue('ultrawarm1.large.elasticsearch')
  ultrawarm1LargeElasticsearch,
  @_s.JsonValue('t2.micro.elasticsearch')
  t2MicroElasticsearch,
  @_s.JsonValue('t2.small.elasticsearch')
  t2SmallElasticsearch,
  @_s.JsonValue('t2.medium.elasticsearch')
  t2MediumElasticsearch,
  @_s.JsonValue('r3.large.elasticsearch')
  r3LargeElasticsearch,
  @_s.JsonValue('r3.xlarge.elasticsearch')
  r3XlargeElasticsearch,
  @_s.JsonValue('r3.2xlarge.elasticsearch')
  r3_2xlargeElasticsearch,
  @_s.JsonValue('r3.4xlarge.elasticsearch')
  r3_4xlargeElasticsearch,
  @_s.JsonValue('r3.8xlarge.elasticsearch')
  r3_8xlargeElasticsearch,
  @_s.JsonValue('i2.xlarge.elasticsearch')
  i2XlargeElasticsearch,
  @_s.JsonValue('i2.2xlarge.elasticsearch')
  i2_2xlargeElasticsearch,
  @_s.JsonValue('d2.xlarge.elasticsearch')
  d2XlargeElasticsearch,
  @_s.JsonValue('d2.2xlarge.elasticsearch')
  d2_2xlargeElasticsearch,
  @_s.JsonValue('d2.4xlarge.elasticsearch')
  d2_4xlargeElasticsearch,
  @_s.JsonValue('d2.8xlarge.elasticsearch')
  d2_8xlargeElasticsearch,
  @_s.JsonValue('c4.large.elasticsearch')
  c4LargeElasticsearch,
  @_s.JsonValue('c4.xlarge.elasticsearch')
  c4XlargeElasticsearch,
  @_s.JsonValue('c4.2xlarge.elasticsearch')
  c4_2xlargeElasticsearch,
  @_s.JsonValue('c4.4xlarge.elasticsearch')
  c4_4xlargeElasticsearch,
  @_s.JsonValue('c4.8xlarge.elasticsearch')
  c4_8xlargeElasticsearch,
  @_s.JsonValue('r4.large.elasticsearch')
  r4LargeElasticsearch,
  @_s.JsonValue('r4.xlarge.elasticsearch')
  r4XlargeElasticsearch,
  @_s.JsonValue('r4.2xlarge.elasticsearch')
  r4_2xlargeElasticsearch,
  @_s.JsonValue('r4.4xlarge.elasticsearch')
  r4_4xlargeElasticsearch,
  @_s.JsonValue('r4.8xlarge.elasticsearch')
  r4_8xlargeElasticsearch,
  @_s.JsonValue('r4.16xlarge.elasticsearch')
  r4_16xlargeElasticsearch,
  @_s.JsonValue('i3.large.elasticsearch')
  i3LargeElasticsearch,
  @_s.JsonValue('i3.xlarge.elasticsearch')
  i3XlargeElasticsearch,
  @_s.JsonValue('i3.2xlarge.elasticsearch')
  i3_2xlargeElasticsearch,
  @_s.JsonValue('i3.4xlarge.elasticsearch')
  i3_4xlargeElasticsearch,
  @_s.JsonValue('i3.8xlarge.elasticsearch')
  i3_8xlargeElasticsearch,
  @_s.JsonValue('i3.16xlarge.elasticsearch')
  i3_16xlargeElasticsearch,
}

extension on ESPartitionInstanceType {
  String toValue() {
    switch (this) {
      case ESPartitionInstanceType.m3MediumElasticsearch:
        return 'm3.medium.elasticsearch';
      case ESPartitionInstanceType.m3LargeElasticsearch:
        return 'm3.large.elasticsearch';
      case ESPartitionInstanceType.m3XlargeElasticsearch:
        return 'm3.xlarge.elasticsearch';
      case ESPartitionInstanceType.m3_2xlargeElasticsearch:
        return 'm3.2xlarge.elasticsearch';
      case ESPartitionInstanceType.m4LargeElasticsearch:
        return 'm4.large.elasticsearch';
      case ESPartitionInstanceType.m4XlargeElasticsearch:
        return 'm4.xlarge.elasticsearch';
      case ESPartitionInstanceType.m4_2xlargeElasticsearch:
        return 'm4.2xlarge.elasticsearch';
      case ESPartitionInstanceType.m4_4xlargeElasticsearch:
        return 'm4.4xlarge.elasticsearch';
      case ESPartitionInstanceType.m4_10xlargeElasticsearch:
        return 'm4.10xlarge.elasticsearch';
      case ESPartitionInstanceType.m5LargeElasticsearch:
        return 'm5.large.elasticsearch';
      case ESPartitionInstanceType.m5XlargeElasticsearch:
        return 'm5.xlarge.elasticsearch';
      case ESPartitionInstanceType.m5_2xlargeElasticsearch:
        return 'm5.2xlarge.elasticsearch';
      case ESPartitionInstanceType.m5_4xlargeElasticsearch:
        return 'm5.4xlarge.elasticsearch';
      case ESPartitionInstanceType.m5_12xlargeElasticsearch:
        return 'm5.12xlarge.elasticsearch';
      case ESPartitionInstanceType.r5LargeElasticsearch:
        return 'r5.large.elasticsearch';
      case ESPartitionInstanceType.r5XlargeElasticsearch:
        return 'r5.xlarge.elasticsearch';
      case ESPartitionInstanceType.r5_2xlargeElasticsearch:
        return 'r5.2xlarge.elasticsearch';
      case ESPartitionInstanceType.r5_4xlargeElasticsearch:
        return 'r5.4xlarge.elasticsearch';
      case ESPartitionInstanceType.r5_12xlargeElasticsearch:
        return 'r5.12xlarge.elasticsearch';
      case ESPartitionInstanceType.c5LargeElasticsearch:
        return 'c5.large.elasticsearch';
      case ESPartitionInstanceType.c5XlargeElasticsearch:
        return 'c5.xlarge.elasticsearch';
      case ESPartitionInstanceType.c5_2xlargeElasticsearch:
        return 'c5.2xlarge.elasticsearch';
      case ESPartitionInstanceType.c5_4xlargeElasticsearch:
        return 'c5.4xlarge.elasticsearch';
      case ESPartitionInstanceType.c5_9xlargeElasticsearch:
        return 'c5.9xlarge.elasticsearch';
      case ESPartitionInstanceType.c5_18xlargeElasticsearch:
        return 'c5.18xlarge.elasticsearch';
      case ESPartitionInstanceType.ultrawarm1MediumElasticsearch:
        return 'ultrawarm1.medium.elasticsearch';
      case ESPartitionInstanceType.ultrawarm1LargeElasticsearch:
        return 'ultrawarm1.large.elasticsearch';
      case ESPartitionInstanceType.t2MicroElasticsearch:
        return 't2.micro.elasticsearch';
      case ESPartitionInstanceType.t2SmallElasticsearch:
        return 't2.small.elasticsearch';
      case ESPartitionInstanceType.t2MediumElasticsearch:
        return 't2.medium.elasticsearch';
      case ESPartitionInstanceType.r3LargeElasticsearch:
        return 'r3.large.elasticsearch';
      case ESPartitionInstanceType.r3XlargeElasticsearch:
        return 'r3.xlarge.elasticsearch';
      case ESPartitionInstanceType.r3_2xlargeElasticsearch:
        return 'r3.2xlarge.elasticsearch';
      case ESPartitionInstanceType.r3_4xlargeElasticsearch:
        return 'r3.4xlarge.elasticsearch';
      case ESPartitionInstanceType.r3_8xlargeElasticsearch:
        return 'r3.8xlarge.elasticsearch';
      case ESPartitionInstanceType.i2XlargeElasticsearch:
        return 'i2.xlarge.elasticsearch';
      case ESPartitionInstanceType.i2_2xlargeElasticsearch:
        return 'i2.2xlarge.elasticsearch';
      case ESPartitionInstanceType.d2XlargeElasticsearch:
        return 'd2.xlarge.elasticsearch';
      case ESPartitionInstanceType.d2_2xlargeElasticsearch:
        return 'd2.2xlarge.elasticsearch';
      case ESPartitionInstanceType.d2_4xlargeElasticsearch:
        return 'd2.4xlarge.elasticsearch';
      case ESPartitionInstanceType.d2_8xlargeElasticsearch:
        return 'd2.8xlarge.elasticsearch';
      case ESPartitionInstanceType.c4LargeElasticsearch:
        return 'c4.large.elasticsearch';
      case ESPartitionInstanceType.c4XlargeElasticsearch:
        return 'c4.xlarge.elasticsearch';
      case ESPartitionInstanceType.c4_2xlargeElasticsearch:
        return 'c4.2xlarge.elasticsearch';
      case ESPartitionInstanceType.c4_4xlargeElasticsearch:
        return 'c4.4xlarge.elasticsearch';
      case ESPartitionInstanceType.c4_8xlargeElasticsearch:
        return 'c4.8xlarge.elasticsearch';
      case ESPartitionInstanceType.r4LargeElasticsearch:
        return 'r4.large.elasticsearch';
      case ESPartitionInstanceType.r4XlargeElasticsearch:
        return 'r4.xlarge.elasticsearch';
      case ESPartitionInstanceType.r4_2xlargeElasticsearch:
        return 'r4.2xlarge.elasticsearch';
      case ESPartitionInstanceType.r4_4xlargeElasticsearch:
        return 'r4.4xlarge.elasticsearch';
      case ESPartitionInstanceType.r4_8xlargeElasticsearch:
        return 'r4.8xlarge.elasticsearch';
      case ESPartitionInstanceType.r4_16xlargeElasticsearch:
        return 'r4.16xlarge.elasticsearch';
      case ESPartitionInstanceType.i3LargeElasticsearch:
        return 'i3.large.elasticsearch';
      case ESPartitionInstanceType.i3XlargeElasticsearch:
        return 'i3.xlarge.elasticsearch';
      case ESPartitionInstanceType.i3_2xlargeElasticsearch:
        return 'i3.2xlarge.elasticsearch';
      case ESPartitionInstanceType.i3_4xlargeElasticsearch:
        return 'i3.4xlarge.elasticsearch';
      case ESPartitionInstanceType.i3_8xlargeElasticsearch:
        return 'i3.8xlarge.elasticsearch';
      case ESPartitionInstanceType.i3_16xlargeElasticsearch:
        return 'i3.16xlarge.elasticsearch';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ESWarmPartitionInstanceType {
  @_s.JsonValue('ultrawarm1.medium.elasticsearch')
  ultrawarm1MediumElasticsearch,
  @_s.JsonValue('ultrawarm1.large.elasticsearch')
  ultrawarm1LargeElasticsearch,
}

/// Specifies the configuration for the domain cluster, such as the type and
/// number of instances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ElasticsearchClusterConfig {
  /// Total number of dedicated master nodes, active and on standby, for the
  /// cluster.
  @_s.JsonKey(name: 'DedicatedMasterCount')
  final int dedicatedMasterCount;

  /// A boolean value to indicate whether a dedicated master node is enabled. See
  /// <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-dedicatedmasternodes"
  /// target="_blank">About Dedicated Master Nodes</a> for more information.
  @_s.JsonKey(name: 'DedicatedMasterEnabled')
  final bool dedicatedMasterEnabled;

  /// The instance type for a dedicated master node.
  @_s.JsonKey(name: 'DedicatedMasterType')
  final ESPartitionInstanceType dedicatedMasterType;

  /// The number of instances in the specified domain cluster.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// The instance type for an Elasticsearch cluster. UltraWarm instance types are
  /// not supported for data instances.
  @_s.JsonKey(name: 'InstanceType')
  final ESPartitionInstanceType instanceType;

  /// The number of warm nodes in the cluster.
  @_s.JsonKey(name: 'WarmCount')
  final int warmCount;

  /// True to enable warm storage.
  @_s.JsonKey(name: 'WarmEnabled')
  final bool warmEnabled;

  /// The instance type for the Elasticsearch cluster's warm nodes.
  @_s.JsonKey(name: 'WarmType')
  final ESWarmPartitionInstanceType warmType;

  /// Specifies the zone awareness configuration for a domain when zone awareness
  /// is enabled.
  @_s.JsonKey(name: 'ZoneAwarenessConfig')
  final ZoneAwarenessConfig zoneAwarenessConfig;

  /// A boolean value to indicate whether zone awareness is enabled. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-zoneawareness"
  /// target="_blank">About Zone Awareness</a> for more information.
  @_s.JsonKey(name: 'ZoneAwarenessEnabled')
  final bool zoneAwarenessEnabled;

  ElasticsearchClusterConfig({
    this.dedicatedMasterCount,
    this.dedicatedMasterEnabled,
    this.dedicatedMasterType,
    this.instanceCount,
    this.instanceType,
    this.warmCount,
    this.warmEnabled,
    this.warmType,
    this.zoneAwarenessConfig,
    this.zoneAwarenessEnabled,
  });
  factory ElasticsearchClusterConfig.fromJson(Map<String, dynamic> json) =>
      _$ElasticsearchClusterConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticsearchClusterConfigToJson(this);
}

/// Specifies the configuration status for the specified Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ElasticsearchClusterConfigStatus {
  /// Specifies the cluster configuration for the specified Elasticsearch domain.
  @_s.JsonKey(name: 'Options')
  final ElasticsearchClusterConfig options;

  /// Specifies the status of the configuration for the specified Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  ElasticsearchClusterConfigStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory ElasticsearchClusterConfigStatus.fromJson(
          Map<String, dynamic> json) =>
      _$ElasticsearchClusterConfigStatusFromJson(json);
}

/// The configuration of an Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ElasticsearchDomainConfig {
  /// IAM access policy as a JSON-formatted string.
  @_s.JsonKey(name: 'AccessPolicies')
  final AccessPoliciesStatus accessPolicies;

  /// Specifies the <code>AdvancedOptions</code> for the domain. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options"
  /// target="_blank">Configuring Advanced Options</a> for more information.
  @_s.JsonKey(name: 'AdvancedOptions')
  final AdvancedOptionsStatus advancedOptions;

  /// Specifies <code>AdvancedSecurityOptions</code> for the domain.
  @_s.JsonKey(name: 'AdvancedSecurityOptions')
  final AdvancedSecurityOptionsStatus advancedSecurityOptions;

  /// The <code>CognitoOptions</code> for the specified domain. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html"
  /// target="_blank">Amazon Cognito Authentication for Kibana</a>.
  @_s.JsonKey(name: 'CognitoOptions')
  final CognitoOptionsStatus cognitoOptions;

  /// Specifies the <code>DomainEndpointOptions</code> for the Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'DomainEndpointOptions')
  final DomainEndpointOptionsStatus domainEndpointOptions;

  /// Specifies the <code>EBSOptions</code> for the Elasticsearch domain.
  @_s.JsonKey(name: 'EBSOptions')
  final EBSOptionsStatus eBSOptions;

  /// Specifies the <code>ElasticsearchClusterConfig</code> for the Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'ElasticsearchClusterConfig')
  final ElasticsearchClusterConfigStatus elasticsearchClusterConfig;

  /// String of format X.Y to specify version for the Elasticsearch domain.
  @_s.JsonKey(name: 'ElasticsearchVersion')
  final ElasticsearchVersionStatus elasticsearchVersion;

  /// Specifies the <code>EncryptionAtRestOptions</code> for the Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'EncryptionAtRestOptions')
  final EncryptionAtRestOptionsStatus encryptionAtRestOptions;

  /// Log publishing options for the given domain.
  @_s.JsonKey(name: 'LogPublishingOptions')
  final LogPublishingOptionsStatus logPublishingOptions;

  /// Specifies the <code>NodeToNodeEncryptionOptions</code> for the Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'NodeToNodeEncryptionOptions')
  final NodeToNodeEncryptionOptionsStatus nodeToNodeEncryptionOptions;

  /// Specifies the <code>SnapshotOptions</code> for the Elasticsearch domain.
  @_s.JsonKey(name: 'SnapshotOptions')
  final SnapshotOptionsStatus snapshotOptions;

  /// The <code>VPCOptions</code> for the specified domain. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html"
  /// target="_blank">VPC Endpoints for Amazon Elasticsearch Service Domains</a>.
  @_s.JsonKey(name: 'VPCOptions')
  final VPCDerivedInfoStatus vPCOptions;

  ElasticsearchDomainConfig({
    this.accessPolicies,
    this.advancedOptions,
    this.advancedSecurityOptions,
    this.cognitoOptions,
    this.domainEndpointOptions,
    this.eBSOptions,
    this.elasticsearchClusterConfig,
    this.elasticsearchVersion,
    this.encryptionAtRestOptions,
    this.logPublishingOptions,
    this.nodeToNodeEncryptionOptions,
    this.snapshotOptions,
    this.vPCOptions,
  });
  factory ElasticsearchDomainConfig.fromJson(Map<String, dynamic> json) =>
      _$ElasticsearchDomainConfigFromJson(json);
}

/// The current status of an Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ElasticsearchDomainStatus {
  /// The Amazon resource name (ARN) of an Elasticsearch domain. See <a
  /// href="http://docs.aws.amazon.com/IAM/latest/UserGuide/index.html?Using_Identifiers.html"
  /// target="_blank">Identifiers for IAM Entities</a> in <i>Using AWS Identity
  /// and Access Management</i> for more information.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The unique identifier for the specified Elasticsearch domain.
  @_s.JsonKey(name: 'DomainId')
  final String domainId;

  /// The name of an Elasticsearch domain. Domain names are unique across the
  /// domains owned by an account within an AWS region. Domain names start with a
  /// letter or number and can contain the following characters: a-z (lowercase),
  /// 0-9, and - (hyphen).
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The type and number of instances in the domain cluster.
  @_s.JsonKey(name: 'ElasticsearchClusterConfig')
  final ElasticsearchClusterConfig elasticsearchClusterConfig;

  /// IAM access policy as a JSON-formatted string.
  @_s.JsonKey(name: 'AccessPolicies')
  final String accessPolicies;

  /// Specifies the status of the <code>AdvancedOptions</code>
  @_s.JsonKey(name: 'AdvancedOptions')
  final Map<String, String> advancedOptions;

  /// The current status of the Elasticsearch domain's advanced security options.
  @_s.JsonKey(name: 'AdvancedSecurityOptions')
  final AdvancedSecurityOptions advancedSecurityOptions;

  /// The <code>CognitoOptions</code> for the specified domain. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html"
  /// target="_blank">Amazon Cognito Authentication for Kibana</a>.
  @_s.JsonKey(name: 'CognitoOptions')
  final CognitoOptions cognitoOptions;

  /// The domain creation status. <code>True</code> if the creation of an
  /// Elasticsearch domain is complete. <code>False</code> if domain creation is
  /// still in progress.
  @_s.JsonKey(name: 'Created')
  final bool created;

  /// The domain deletion status. <code>True</code> if a delete request has been
  /// received for the domain but resource cleanup is still in progress.
  /// <code>False</code> if the domain has not been deleted. Once domain deletion
  /// is complete, the status of the domain is no longer returned.
  @_s.JsonKey(name: 'Deleted')
  final bool deleted;

  /// The current status of the Elasticsearch domain's endpoint options.
  @_s.JsonKey(name: 'DomainEndpointOptions')
  final DomainEndpointOptions domainEndpointOptions;

  /// The <code>EBSOptions</code> for the specified domain. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-ebs"
  /// target="_blank">Configuring EBS-based Storage</a> for more information.
  @_s.JsonKey(name: 'EBSOptions')
  final EBSOptions eBSOptions;
  @_s.JsonKey(name: 'ElasticsearchVersion')
  final String elasticsearchVersion;

  /// Specifies the status of the <code>EncryptionAtRestOptions</code>.
  @_s.JsonKey(name: 'EncryptionAtRestOptions')
  final EncryptionAtRestOptions encryptionAtRestOptions;

  /// The Elasticsearch domain endpoint that you use to submit index and search
  /// requests.
  @_s.JsonKey(name: 'Endpoint')
  final String endpoint;

  /// Map containing the Elasticsearch domain endpoints used to submit index and
  /// search requests. Example <code>key, value</code>:
  /// <code>'vpc','vpc-endpoint-h2dsd34efgyghrtguk5gt6j2foh4.us-east-1.es.amazonaws.com'</code>.
  @_s.JsonKey(name: 'Endpoints')
  final Map<String, String> endpoints;

  /// Log publishing options for the given domain.
  @_s.JsonKey(name: 'LogPublishingOptions')
  final Map<LogType, LogPublishingOption> logPublishingOptions;

  /// Specifies the status of the <code>NodeToNodeEncryptionOptions</code>.
  @_s.JsonKey(name: 'NodeToNodeEncryptionOptions')
  final NodeToNodeEncryptionOptions nodeToNodeEncryptionOptions;

  /// The status of the Elasticsearch domain configuration. <code>True</code> if
  /// Amazon Elasticsearch Service is processing configuration changes.
  /// <code>False</code> if the configuration is active.
  @_s.JsonKey(name: 'Processing')
  final bool processing;

  /// The current status of the Elasticsearch domain's service software.
  @_s.JsonKey(name: 'ServiceSoftwareOptions')
  final ServiceSoftwareOptions serviceSoftwareOptions;

  /// Specifies the status of the <code>SnapshotOptions</code>
  @_s.JsonKey(name: 'SnapshotOptions')
  final SnapshotOptions snapshotOptions;

  /// The status of an Elasticsearch domain version upgrade. <code>True</code> if
  /// Amazon Elasticsearch Service is undergoing a version upgrade.
  /// <code>False</code> if the configuration is active.
  @_s.JsonKey(name: 'UpgradeProcessing')
  final bool upgradeProcessing;

  /// The <code>VPCOptions</code> for the specified domain. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html"
  /// target="_blank">VPC Endpoints for Amazon Elasticsearch Service Domains</a>.
  @_s.JsonKey(name: 'VPCOptions')
  final VPCDerivedInfo vPCOptions;

  ElasticsearchDomainStatus({
    @_s.required this.arn,
    @_s.required this.domainId,
    @_s.required this.domainName,
    @_s.required this.elasticsearchClusterConfig,
    this.accessPolicies,
    this.advancedOptions,
    this.advancedSecurityOptions,
    this.cognitoOptions,
    this.created,
    this.deleted,
    this.domainEndpointOptions,
    this.eBSOptions,
    this.elasticsearchVersion,
    this.encryptionAtRestOptions,
    this.endpoint,
    this.endpoints,
    this.logPublishingOptions,
    this.nodeToNodeEncryptionOptions,
    this.processing,
    this.serviceSoftwareOptions,
    this.snapshotOptions,
    this.upgradeProcessing,
    this.vPCOptions,
  });
  factory ElasticsearchDomainStatus.fromJson(Map<String, dynamic> json) =>
      _$ElasticsearchDomainStatusFromJson(json);
}

/// Status of the Elasticsearch version options for the specified Elasticsearch
/// domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ElasticsearchVersionStatus {
  /// Specifies the Elasticsearch version for the specified Elasticsearch domain.
  @_s.JsonKey(name: 'Options')
  final String options;

  /// Specifies the status of the Elasticsearch version options for the specified
  /// Elasticsearch domain.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  ElasticsearchVersionStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory ElasticsearchVersionStatus.fromJson(Map<String, dynamic> json) =>
      _$ElasticsearchVersionStatusFromJson(json);
}

/// Specifies the Encryption At Rest Options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionAtRestOptions {
  /// Specifies the option to enable Encryption At Rest.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Specifies the KMS Key ID for Encryption At Rest options.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  EncryptionAtRestOptions({
    this.enabled,
    this.kmsKeyId,
  });
  factory EncryptionAtRestOptions.fromJson(Map<String, dynamic> json) =>
      _$EncryptionAtRestOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionAtRestOptionsToJson(this);
}

/// Status of the Encryption At Rest options for the specified Elasticsearch
/// domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EncryptionAtRestOptionsStatus {
  /// Specifies the Encryption At Rest options for the specified Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'Options')
  final EncryptionAtRestOptions options;

  /// Specifies the status of the Encryption At Rest options for the specified
  /// Elasticsearch domain.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  EncryptionAtRestOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory EncryptionAtRestOptionsStatus.fromJson(Map<String, dynamic> json) =>
      _$EncryptionAtRestOptionsStatusFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorDetails {
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;
  @_s.JsonKey(name: 'ErrorType')
  final String errorType;

  ErrorDetails({
    this.errorMessage,
    this.errorType,
  });
  factory ErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsFromJson(json);
}

/// A filter used to limit results when describing inbound or outbound
/// cross-cluster search connections. Multiple values can be specified per
/// filter. A cross-cluster search connection must match at least one of the
/// specified values for it to be returned from an operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// Specifies the name of the filter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Contains one or more values for the filter.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

/// Container for response returned by <code>
/// <a>GetCompatibleElasticsearchVersions</a> </code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCompatibleElasticsearchVersionsResponse {
  /// A map of compatible Elasticsearch versions returned as part of the <code>
  /// <a>GetCompatibleElasticsearchVersions</a> </code> operation.
  @_s.JsonKey(name: 'CompatibleElasticsearchVersions')
  final List<CompatibleVersionsMap> compatibleElasticsearchVersions;

  GetCompatibleElasticsearchVersionsResponse({
    this.compatibleElasticsearchVersions,
  });
  factory GetCompatibleElasticsearchVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCompatibleElasticsearchVersionsResponseFromJson(json);
}

/// Container for response returned by <code> <a>GetPackageVersionHistory</a>
/// </code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPackageVersionHistoryResponse {
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'PackageID')
  final String packageID;

  /// List of <code>PackageVersionHistory</code> objects.
  @_s.JsonKey(name: 'PackageVersionHistoryList')
  final List<PackageVersionHistory> packageVersionHistoryList;

  GetPackageVersionHistoryResponse({
    this.nextToken,
    this.packageID,
    this.packageVersionHistoryList,
  });
  factory GetPackageVersionHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetPackageVersionHistoryResponseFromJson(json);
}

/// Container for response returned by <code> <a>GetUpgradeHistory</a> </code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUpgradeHistoryResponse {
  /// Pagination token that needs to be supplied to the next call to get the next
  /// page of results
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code> <a>UpgradeHistory</a> </code> objects corresponding to each
  /// Upgrade or Upgrade Eligibility Check performed on a domain returned as part
  /// of <code> <a>GetUpgradeHistoryResponse</a> </code> object.
  @_s.JsonKey(name: 'UpgradeHistories')
  final List<UpgradeHistory> upgradeHistories;

  GetUpgradeHistoryResponse({
    this.nextToken,
    this.upgradeHistories,
  });
  factory GetUpgradeHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUpgradeHistoryResponseFromJson(json);
}

/// Container for response returned by <code> <a>GetUpgradeStatus</a> </code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUpgradeStatusResponse {
  /// One of 4 statuses that a step can go through returned as part of the <code>
  /// <a>GetUpgradeStatusResponse</a> </code> object. The status can take one of
  /// the following values:
  /// <ul>
  /// <li>In Progress</li>
  /// <li>Succeeded</li>
  /// <li>Succeeded with Issues</li>
  /// <li>Failed</li>
  /// </ul>
  @_s.JsonKey(name: 'StepStatus')
  final UpgradeStatus stepStatus;

  /// A string that describes the update briefly
  @_s.JsonKey(name: 'UpgradeName')
  final String upgradeName;

  /// Represents one of 3 steps that an Upgrade or Upgrade Eligibility Check does
  /// through:
  /// <ul>
  /// <li>PreUpgradeCheck</li>
  /// <li>Snapshot</li>
  /// <li>Upgrade</li>
  /// </ul>
  @_s.JsonKey(name: 'UpgradeStep')
  final UpgradeStep upgradeStep;

  GetUpgradeStatusResponse({
    this.stepStatus,
    this.upgradeName,
    this.upgradeStep,
  });
  factory GetUpgradeStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUpgradeStatusResponseFromJson(json);
}

/// Specifies details of an inbound connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InboundCrossClusterSearchConnection {
  /// Specifies the <code><a>InboundCrossClusterSearchConnectionStatus</a></code>
  /// for the outbound connection.
  @_s.JsonKey(name: 'ConnectionStatus')
  final InboundCrossClusterSearchConnectionStatus connectionStatus;

  /// Specifies the connection id for the inbound cross-cluster search connection.
  @_s.JsonKey(name: 'CrossClusterSearchConnectionId')
  final String crossClusterSearchConnectionId;

  /// Specifies the <code><a>DomainInformation</a></code> for the destination
  /// Elasticsearch domain.
  @_s.JsonKey(name: 'DestinationDomainInfo')
  final DomainInformation destinationDomainInfo;

  /// Specifies the <code><a>DomainInformation</a></code> for the source
  /// Elasticsearch domain.
  @_s.JsonKey(name: 'SourceDomainInfo')
  final DomainInformation sourceDomainInfo;

  InboundCrossClusterSearchConnection({
    this.connectionStatus,
    this.crossClusterSearchConnectionId,
    this.destinationDomainInfo,
    this.sourceDomainInfo,
  });
  factory InboundCrossClusterSearchConnection.fromJson(
          Map<String, dynamic> json) =>
      _$InboundCrossClusterSearchConnectionFromJson(json);
}

/// Specifies the coonection status of an inbound cross-cluster search
/// connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InboundCrossClusterSearchConnectionStatus {
  /// Specifies verbose information for the inbound connection status.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The state code for inbound connection. This can be one of the following:
  ///
  /// <ul>
  /// <li>PENDING_ACCEPTANCE: Inbound connection is not yet accepted by
  /// destination domain owner.</li>
  /// <li>APPROVED: Inbound connection is pending acceptance by destination domain
  /// owner.</li>
  /// <li>REJECTING: Inbound connection rejection is in process.</li>
  /// <li>REJECTED: Inbound connection is rejected.</li>
  /// <li>DELETING: Inbound connection deletion is in progress.</li>
  /// <li>DELETED: Inbound connection is deleted and cannot be used further.</li>
  /// </ul>
  @_s.JsonKey(name: 'StatusCode')
  final InboundCrossClusterSearchConnectionStatusCode statusCode;

  InboundCrossClusterSearchConnectionStatus({
    this.message,
    this.statusCode,
  });
  factory InboundCrossClusterSearchConnectionStatus.fromJson(
          Map<String, dynamic> json) =>
      _$InboundCrossClusterSearchConnectionStatusFromJson(json);
}

enum InboundCrossClusterSearchConnectionStatusCode {
  @_s.JsonValue('PENDING_ACCEPTANCE')
  pendingAcceptance,
  @_s.JsonValue('APPROVED')
  approved,
  @_s.JsonValue('REJECTING')
  rejecting,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

/// InstanceCountLimits represents the limits on number of instances that be
/// created in Amazon Elasticsearch for given InstanceType.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceCountLimits {
  @_s.JsonKey(name: 'MaximumInstanceCount')
  final int maximumInstanceCount;
  @_s.JsonKey(name: 'MinimumInstanceCount')
  final int minimumInstanceCount;

  InstanceCountLimits({
    this.maximumInstanceCount,
    this.minimumInstanceCount,
  });
  factory InstanceCountLimits.fromJson(Map<String, dynamic> json) =>
      _$InstanceCountLimitsFromJson(json);
}

/// InstanceLimits represents the list of instance related attributes that are
/// available for given InstanceType.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceLimits {
  @_s.JsonKey(name: 'InstanceCountLimits')
  final InstanceCountLimits instanceCountLimits;

  InstanceLimits({
    this.instanceCountLimits,
  });
  factory InstanceLimits.fromJson(Map<String, dynamic> json) =>
      _$InstanceLimitsFromJson(json);
}

/// Limits for given InstanceType and for each of it's role. <br/> Limits
/// contains following <code> <a>StorageTypes,</a> </code> <code>
/// <a>InstanceLimits</a> </code> and <code> <a>AdditionalLimits</a> </code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Limits {
  /// List of additional limits that are specific to a given InstanceType and for
  /// each of it's <code> <a>InstanceRole</a> </code> .
  @_s.JsonKey(name: 'AdditionalLimits')
  final List<AdditionalLimit> additionalLimits;
  @_s.JsonKey(name: 'InstanceLimits')
  final InstanceLimits instanceLimits;

  /// StorageType represents the list of storage related types and attributes that
  /// are available for given InstanceType.
  @_s.JsonKey(name: 'StorageTypes')
  final List<StorageType> storageTypes;

  Limits({
    this.additionalLimits,
    this.instanceLimits,
    this.storageTypes,
  });
  factory Limits.fromJson(Map<String, dynamic> json) => _$LimitsFromJson(json);
}

/// The result of a <code>ListDomainNames</code> operation. Contains the names
/// of all Elasticsearch domains owned by this account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainNamesResponse {
  /// List of Elasticsearch domain names.
  @_s.JsonKey(name: 'DomainNames')
  final List<DomainInfo> domainNames;

  ListDomainNamesResponse({
    this.domainNames,
  });
  factory ListDomainNamesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDomainNamesResponseFromJson(json);
}

/// Container for response parameters to <code> <a>ListDomainsForPackage</a>
/// </code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainsForPackageResponse {
  /// List of <code>DomainPackageDetails</code> objects.
  @_s.JsonKey(name: 'DomainPackageDetailsList')
  final List<DomainPackageDetails> domainPackageDetailsList;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDomainsForPackageResponse({
    this.domainPackageDetailsList,
    this.nextToken,
  });
  factory ListDomainsForPackageResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDomainsForPackageResponseFromJson(json);
}

/// Container for the parameters returned by <code>
/// <a>ListElasticsearchInstanceTypes</a> </code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListElasticsearchInstanceTypesResponse {
  /// List of instance types supported by Amazon Elasticsearch service for given
  /// <code> <a>ElasticsearchVersion</a> </code>
  @_s.JsonKey(name: 'ElasticsearchInstanceTypes')
  final List<ESPartitionInstanceType> elasticsearchInstanceTypes;

  /// In case if there are more results available NextToken would be present, make
  /// further request to the same API with received NextToken to paginate
  /// remaining results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListElasticsearchInstanceTypesResponse({
    this.elasticsearchInstanceTypes,
    this.nextToken,
  });
  factory ListElasticsearchInstanceTypesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListElasticsearchInstanceTypesResponseFromJson(json);
}

/// Container for the parameters for response received from <code>
/// <a>ListElasticsearchVersions</a> </code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListElasticsearchVersionsResponse {
  @_s.JsonKey(name: 'ElasticsearchVersions')
  final List<String> elasticsearchVersions;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListElasticsearchVersionsResponse({
    this.elasticsearchVersions,
    this.nextToken,
  });
  factory ListElasticsearchVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListElasticsearchVersionsResponseFromJson(json);
}

/// Container for response parameters to <code> <a>ListPackagesForDomain</a>
/// </code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPackagesForDomainResponse {
  /// List of <code>DomainPackageDetails</code> objects.
  @_s.JsonKey(name: 'DomainPackageDetailsList')
  final List<DomainPackageDetails> domainPackageDetailsList;

  /// Pagination token that needs to be supplied to the next call to get the next
  /// page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListPackagesForDomainResponse({
    this.domainPackageDetailsList,
    this.nextToken,
  });
  factory ListPackagesForDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPackagesForDomainResponseFromJson(json);
}

/// The result of a <code>ListTags</code> operation. Contains tags for all
/// requested Elasticsearch domains.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsResponse {
  /// List of <code>Tag</code> for the requested Elasticsearch domain.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  ListTagsResponse({
    this.tagList,
  });
  factory ListTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsResponseFromJson(json);
}

/// Log Publishing option that is set for given domain. <br/>Attributes and
/// their details:
/// <ul>
/// <li>CloudWatchLogsLogGroupArn: ARN of the Cloudwatch log group to which log
/// needs to be published.</li>
/// <li>Enabled: Whether the log publishing for given log type is enabled or
/// not</li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LogPublishingOption {
  @_s.JsonKey(name: 'CloudWatchLogsLogGroupArn')
  final String cloudWatchLogsLogGroupArn;

  /// Specifies whether given log publishing option is enabled or not.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  LogPublishingOption({
    this.cloudWatchLogsLogGroupArn,
    this.enabled,
  });
  factory LogPublishingOption.fromJson(Map<String, dynamic> json) =>
      _$LogPublishingOptionFromJson(json);

  Map<String, dynamic> toJson() => _$LogPublishingOptionToJson(this);
}

/// The configured log publishing options for the domain and their current
/// status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogPublishingOptionsStatus {
  /// The log publishing options configured for the Elasticsearch domain.
  @_s.JsonKey(name: 'Options')
  final Map<LogType, LogPublishingOption> options;

  /// The status of the log publishing options for the Elasticsearch domain. See
  /// <code>OptionStatus</code> for the status information that's included.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  LogPublishingOptionsStatus({
    this.options,
    this.status,
  });
  factory LogPublishingOptionsStatus.fromJson(Map<String, dynamic> json) =>
      _$LogPublishingOptionsStatusFromJson(json);
}

/// Type of Log File, it can be one of the following:
/// <ul>
/// <li>INDEX_SLOW_LOGS: Index slow logs contain insert requests that took more
/// time than configured index query log threshold to execute.</li>
/// <li>SEARCH_SLOW_LOGS: Search slow logs contain search queries that took more
/// time than configured search query log threshold to execute.</li>
/// <li>ES_APPLICATION_LOGS: Elasticsearch application logs contain information
/// about errors and warnings raised during the operation of the service and can
/// be useful for troubleshooting.</li>
/// <li>AUDIT_LOGS: Audit logs contain records of user requests for access from
/// the domain.</li>
/// </ul>
enum LogType {
  @_s.JsonValue('INDEX_SLOW_LOGS')
  indexSlowLogs,
  @_s.JsonValue('SEARCH_SLOW_LOGS')
  searchSlowLogs,
  @_s.JsonValue('ES_APPLICATION_LOGS')
  esApplicationLogs,
  @_s.JsonValue('AUDIT_LOGS')
  auditLogs,
}

extension on LogType {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Credentials for the master user: username and password, ARN, or both.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MasterUserOptions {
  /// ARN for the master user (if IAM is enabled).
  @_s.JsonKey(name: 'MasterUserARN')
  final String masterUserARN;

  /// The master user's username, which is stored in the Amazon Elasticsearch
  /// Service domain's internal database.
  @_s.JsonKey(name: 'MasterUserName')
  final String masterUserName;

  /// The master user's password, which is stored in the Amazon Elasticsearch
  /// Service domain's internal database.
  @_s.JsonKey(name: 'MasterUserPassword')
  final String masterUserPassword;

  MasterUserOptions({
    this.masterUserARN,
    this.masterUserName,
    this.masterUserPassword,
  });
  Map<String, dynamic> toJson() => _$MasterUserOptionsToJson(this);
}

/// Specifies the node-to-node encryption options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NodeToNodeEncryptionOptions {
  /// Specify true to enable node-to-node encryption.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  NodeToNodeEncryptionOptions({
    this.enabled,
  });
  factory NodeToNodeEncryptionOptions.fromJson(Map<String, dynamic> json) =>
      _$NodeToNodeEncryptionOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$NodeToNodeEncryptionOptionsToJson(this);
}

/// Status of the node-to-node encryption options for the specified
/// Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodeToNodeEncryptionOptionsStatus {
  /// Specifies the node-to-node encryption options for the specified
  /// Elasticsearch domain.
  @_s.JsonKey(name: 'Options')
  final NodeToNodeEncryptionOptions options;

  /// Specifies the status of the node-to-node encryption options for the
  /// specified Elasticsearch domain.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  NodeToNodeEncryptionOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory NodeToNodeEncryptionOptionsStatus.fromJson(
          Map<String, dynamic> json) =>
      _$NodeToNodeEncryptionOptionsStatusFromJson(json);
}

/// The state of a requested change. One of the following:
///
/// <ul>
/// <li>Processing: The request change is still in-process.</li>
/// <li>Active: The request change is processed and deployed to the
/// Elasticsearch domain.</li>
/// </ul>
enum OptionState {
  @_s.JsonValue('RequiresIndexDocuments')
  requiresIndexDocuments,
  @_s.JsonValue('Processing')
  processing,
  @_s.JsonValue('Active')
  active,
}

/// Provides the current status of the entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OptionStatus {
  /// Timestamp which tells the creation date for the entity.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// Provides the <code>OptionState</code> for the Elasticsearch domain.
  @_s.JsonKey(name: 'State')
  final OptionState state;

  /// Timestamp which tells the last updated time for the entity.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdateDate')
  final DateTime updateDate;

  /// Indicates whether the Elasticsearch domain is being deleted.
  @_s.JsonKey(name: 'PendingDeletion')
  final bool pendingDeletion;

  /// Specifies the latest version for the entity.
  @_s.JsonKey(name: 'UpdateVersion')
  final int updateVersion;

  OptionStatus({
    @_s.required this.creationDate,
    @_s.required this.state,
    @_s.required this.updateDate,
    this.pendingDeletion,
    this.updateVersion,
  });
  factory OptionStatus.fromJson(Map<String, dynamic> json) =>
      _$OptionStatusFromJson(json);
}

/// Specifies details of an outbound connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutboundCrossClusterSearchConnection {
  /// Specifies the connection alias for the outbound cross-cluster search
  /// connection.
  @_s.JsonKey(name: 'ConnectionAlias')
  final String connectionAlias;

  /// Specifies the <code><a>OutboundCrossClusterSearchConnectionStatus</a></code>
  /// for the outbound connection.
  @_s.JsonKey(name: 'ConnectionStatus')
  final OutboundCrossClusterSearchConnectionStatus connectionStatus;

  /// Specifies the connection id for the outbound cross-cluster search
  /// connection.
  @_s.JsonKey(name: 'CrossClusterSearchConnectionId')
  final String crossClusterSearchConnectionId;

  /// Specifies the <code><a>DomainInformation</a></code> for the destination
  /// Elasticsearch domain.
  @_s.JsonKey(name: 'DestinationDomainInfo')
  final DomainInformation destinationDomainInfo;

  /// Specifies the <code><a>DomainInformation</a></code> for the source
  /// Elasticsearch domain.
  @_s.JsonKey(name: 'SourceDomainInfo')
  final DomainInformation sourceDomainInfo;

  OutboundCrossClusterSearchConnection({
    this.connectionAlias,
    this.connectionStatus,
    this.crossClusterSearchConnectionId,
    this.destinationDomainInfo,
    this.sourceDomainInfo,
  });
  factory OutboundCrossClusterSearchConnection.fromJson(
          Map<String, dynamic> json) =>
      _$OutboundCrossClusterSearchConnectionFromJson(json);
}

/// Specifies the connection status of an outbound cross-cluster search
/// connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutboundCrossClusterSearchConnectionStatus {
  /// Specifies verbose information for the outbound connection status.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The state code for outbound connection. This can be one of the following:
  ///
  /// <ul>
  /// <li>VALIDATING: The outbound connection request is being validated.</li>
  /// <li>VALIDATION_FAILED: Validation failed for the connection request.</li>
  /// <li>PENDING_ACCEPTANCE: Outbound connection request is validated and is not
  /// yet accepted by destination domain owner.</li>
  /// <li>PROVISIONING: Outbound connection request is in process.</li>
  /// <li>ACTIVE: Outbound connection is active and ready to use.</li>
  /// <li>REJECTED: Outbound connection request is rejected by destination domain
  /// owner.</li>
  /// <li>DELETING: Outbound connection deletion is in progress.</li>
  /// <li>DELETED: Outbound connection is deleted and cannot be used further.</li>
  /// </ul>
  @_s.JsonKey(name: 'StatusCode')
  final OutboundCrossClusterSearchConnectionStatusCode statusCode;

  OutboundCrossClusterSearchConnectionStatus({
    this.message,
    this.statusCode,
  });
  factory OutboundCrossClusterSearchConnectionStatus.fromJson(
          Map<String, dynamic> json) =>
      _$OutboundCrossClusterSearchConnectionStatusFromJson(json);
}

enum OutboundCrossClusterSearchConnectionStatusCode {
  @_s.JsonValue('PENDING_ACCEPTANCE')
  pendingAcceptance,
  @_s.JsonValue('VALIDATING')
  validating,
  @_s.JsonValue('VALIDATION_FAILED')
  validationFailed,
  @_s.JsonValue('PROVISIONING')
  provisioning,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Basic information about a package.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PackageDetails {
  @_s.JsonKey(name: 'AvailablePackageVersion')
  final String availablePackageVersion;

  /// Timestamp which tells creation date of the package.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// Additional information if the package is in an error state. Null otherwise.
  @_s.JsonKey(name: 'ErrorDetails')
  final ErrorDetails errorDetails;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// User-specified description of the package.
  @_s.JsonKey(name: 'PackageDescription')
  final String packageDescription;

  /// Internal ID of the package.
  @_s.JsonKey(name: 'PackageID')
  final String packageID;

  /// User specified name of the package.
  @_s.JsonKey(name: 'PackageName')
  final String packageName;

  /// Current state of the package. Values are
  /// COPYING/COPY_FAILED/AVAILABLE/DELETING/DELETE_FAILED
  @_s.JsonKey(name: 'PackageStatus')
  final PackageStatus packageStatus;

  /// Currently supports only TXT-DICTIONARY.
  @_s.JsonKey(name: 'PackageType')
  final PackageType packageType;

  PackageDetails({
    this.availablePackageVersion,
    this.createdAt,
    this.errorDetails,
    this.lastUpdatedAt,
    this.packageDescription,
    this.packageID,
    this.packageName,
    this.packageStatus,
    this.packageType,
  });
  factory PackageDetails.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailsFromJson(json);
}

/// The S3 location for importing the package specified as
/// <code>S3BucketName</code> and <code>S3Key</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PackageSource {
  /// Name of the bucket containing the package.
  @_s.JsonKey(name: 'S3BucketName')
  final String s3BucketName;

  /// Key (file name) of the package.
  @_s.JsonKey(name: 'S3Key')
  final String s3Key;

  PackageSource({
    this.s3BucketName,
    this.s3Key,
  });
  Map<String, dynamic> toJson() => _$PackageSourceToJson(this);
}

enum PackageStatus {
  @_s.JsonValue('COPYING')
  copying,
  @_s.JsonValue('COPY_FAILED')
  copyFailed,
  @_s.JsonValue('VALIDATING')
  validating,
  @_s.JsonValue('VALIDATION_FAILED')
  validationFailed,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
}

enum PackageType {
  @_s.JsonValue('TXT-DICTIONARY')
  txtDictionary,
}

extension on PackageType {
  String toValue() {
    switch (this) {
      case PackageType.txtDictionary:
        return 'TXT-DICTIONARY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details of a package version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PackageVersionHistory {
  /// A message associated with the version.
  @_s.JsonKey(name: 'CommitMessage')
  final String commitMessage;

  /// Timestamp which tells creation time of the package version.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// Version of the package.
  @_s.JsonKey(name: 'PackageVersion')
  final String packageVersion;

  PackageVersionHistory({
    this.commitMessage,
    this.createdAt,
    this.packageVersion,
  });
  factory PackageVersionHistory.fromJson(Map<String, dynamic> json) =>
      _$PackageVersionHistoryFromJson(json);
}

/// Represents the output of a
/// <code>PurchaseReservedElasticsearchInstanceOffering</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PurchaseReservedElasticsearchInstanceOfferingResponse {
  /// The customer-specified identifier used to track this reservation.
  @_s.JsonKey(name: 'ReservationName')
  final String reservationName;

  /// Details of the reserved Elasticsearch instance which was purchased.
  @_s.JsonKey(name: 'ReservedElasticsearchInstanceId')
  final String reservedElasticsearchInstanceId;

  PurchaseReservedElasticsearchInstanceOfferingResponse({
    this.reservationName,
    this.reservedElasticsearchInstanceId,
  });
  factory PurchaseReservedElasticsearchInstanceOfferingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PurchaseReservedElasticsearchInstanceOfferingResponseFromJson(json);
}

/// Contains the specific price and frequency of a recurring charges for a
/// reserved Elasticsearch instance, or for a reserved Elasticsearch instance
/// offering.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecurringCharge {
  /// The monetary amount of the recurring charge.
  @_s.JsonKey(name: 'RecurringChargeAmount')
  final double recurringChargeAmount;

  /// The frequency of the recurring charge.
  @_s.JsonKey(name: 'RecurringChargeFrequency')
  final String recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });
  factory RecurringCharge.fromJson(Map<String, dynamic> json) =>
      _$RecurringChargeFromJson(json);
}

/// The result of a
/// <code><a>RejectInboundCrossClusterSearchConnection</a></code> operation.
/// Contains details of rejected inbound connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RejectInboundCrossClusterSearchConnectionResponse {
  /// Specifies the <code><a>InboundCrossClusterSearchConnection</a></code> of
  /// rejected inbound connection.
  @_s.JsonKey(name: 'CrossClusterSearchConnection')
  final InboundCrossClusterSearchConnection crossClusterSearchConnection;

  RejectInboundCrossClusterSearchConnectionResponse({
    this.crossClusterSearchConnection,
  });
  factory RejectInboundCrossClusterSearchConnectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RejectInboundCrossClusterSearchConnectionResponseFromJson(json);
}

/// Details of a reserved Elasticsearch instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservedElasticsearchInstance {
  /// The currency code for the reserved Elasticsearch instance offering.
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;

  /// The duration, in seconds, for which the Elasticsearch instance is reserved.
  @_s.JsonKey(name: 'Duration')
  final int duration;

  /// The number of Elasticsearch instances that have been reserved.
  @_s.JsonKey(name: 'ElasticsearchInstanceCount')
  final int elasticsearchInstanceCount;

  /// The Elasticsearch instance type offered by the reserved instance offering.
  @_s.JsonKey(name: 'ElasticsearchInstanceType')
  final ESPartitionInstanceType elasticsearchInstanceType;

  /// The upfront fixed charge you will paid to purchase the specific reserved
  /// Elasticsearch instance offering.
  @_s.JsonKey(name: 'FixedPrice')
  final double fixedPrice;

  /// The payment option as defined in the reserved Elasticsearch instance
  /// offering.
  @_s.JsonKey(name: 'PaymentOption')
  final ReservedElasticsearchInstancePaymentOption paymentOption;

  /// The charge to your account regardless of whether you are creating any
  /// domains using the instance offering.
  @_s.JsonKey(name: 'RecurringCharges')
  final List<RecurringCharge> recurringCharges;

  /// The customer-specified identifier to track this reservation.
  @_s.JsonKey(name: 'ReservationName')
  final String reservationName;

  /// The unique identifier for the reservation.
  @_s.JsonKey(name: 'ReservedElasticsearchInstanceId')
  final String reservedElasticsearchInstanceId;

  /// The offering identifier.
  @_s.JsonKey(name: 'ReservedElasticsearchInstanceOfferingId')
  final String reservedElasticsearchInstanceOfferingId;

  /// The time the reservation started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The state of the reserved Elasticsearch instance.
  @_s.JsonKey(name: 'State')
  final String state;

  /// The rate you are charged for each hour for the domain that is using this
  /// reserved instance.
  @_s.JsonKey(name: 'UsagePrice')
  final double usagePrice;

  ReservedElasticsearchInstance({
    this.currencyCode,
    this.duration,
    this.elasticsearchInstanceCount,
    this.elasticsearchInstanceType,
    this.fixedPrice,
    this.paymentOption,
    this.recurringCharges,
    this.reservationName,
    this.reservedElasticsearchInstanceId,
    this.reservedElasticsearchInstanceOfferingId,
    this.startTime,
    this.state,
    this.usagePrice,
  });
  factory ReservedElasticsearchInstance.fromJson(Map<String, dynamic> json) =>
      _$ReservedElasticsearchInstanceFromJson(json);
}

/// Details of a reserved Elasticsearch instance offering.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservedElasticsearchInstanceOffering {
  /// The currency code for the reserved Elasticsearch instance offering.
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;

  /// The duration, in seconds, for which the offering will reserve the
  /// Elasticsearch instance.
  @_s.JsonKey(name: 'Duration')
  final int duration;

  /// The Elasticsearch instance type offered by the reserved instance offering.
  @_s.JsonKey(name: 'ElasticsearchInstanceType')
  final ESPartitionInstanceType elasticsearchInstanceType;

  /// The upfront fixed charge you will pay to purchase the specific reserved
  /// Elasticsearch instance offering.
  @_s.JsonKey(name: 'FixedPrice')
  final double fixedPrice;

  /// Payment option for the reserved Elasticsearch instance offering
  @_s.JsonKey(name: 'PaymentOption')
  final ReservedElasticsearchInstancePaymentOption paymentOption;

  /// The charge to your account regardless of whether you are creating any
  /// domains using the instance offering.
  @_s.JsonKey(name: 'RecurringCharges')
  final List<RecurringCharge> recurringCharges;

  /// The Elasticsearch reserved instance offering identifier.
  @_s.JsonKey(name: 'ReservedElasticsearchInstanceOfferingId')
  final String reservedElasticsearchInstanceOfferingId;

  /// The rate you are charged for each hour the domain that is using the offering
  /// is running.
  @_s.JsonKey(name: 'UsagePrice')
  final double usagePrice;

  ReservedElasticsearchInstanceOffering({
    this.currencyCode,
    this.duration,
    this.elasticsearchInstanceType,
    this.fixedPrice,
    this.paymentOption,
    this.recurringCharges,
    this.reservedElasticsearchInstanceOfferingId,
    this.usagePrice,
  });
  factory ReservedElasticsearchInstanceOffering.fromJson(
          Map<String, dynamic> json) =>
      _$ReservedElasticsearchInstanceOfferingFromJson(json);
}

enum ReservedElasticsearchInstancePaymentOption {
  @_s.JsonValue('ALL_UPFRONT')
  allUpfront,
  @_s.JsonValue('PARTIAL_UPFRONT')
  partialUpfront,
  @_s.JsonValue('NO_UPFRONT')
  noUpfront,
}

/// Specifies the SAML Identity Provider's information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SAMLIdp {
  /// The unique Entity ID of the application in SAML Identity Provider.
  @_s.JsonKey(name: 'EntityId')
  final String entityId;

  /// The Metadata of the SAML application in xml format.
  @_s.JsonKey(name: 'MetadataContent')
  final String metadataContent;

  SAMLIdp({
    @_s.required this.entityId,
    @_s.required this.metadataContent,
  });
  factory SAMLIdp.fromJson(Map<String, dynamic> json) =>
      _$SAMLIdpFromJson(json);

  Map<String, dynamic> toJson() => _$SAMLIdpToJson(this);
}

/// Specifies the SAML application configuration for the domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SAMLOptionsInput {
  /// True if SAML is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Specifies the SAML Identity Provider's information.
  @_s.JsonKey(name: 'Idp')
  final SAMLIdp idp;

  /// The backend role to which the SAML master user is mapped to.
  @_s.JsonKey(name: 'MasterBackendRole')
  final String masterBackendRole;

  /// The SAML master username, which is stored in the Amazon Elasticsearch
  /// Service domain's internal database.
  @_s.JsonKey(name: 'MasterUserName')
  final String masterUserName;

  /// The key to use for matching the SAML Roles attribute.
  @_s.JsonKey(name: 'RolesKey')
  final String rolesKey;

  /// The duration, in minutes, after which a user session becomes inactive.
  /// Acceptable values are between 1 and 1440, and the default value is 60.
  @_s.JsonKey(name: 'SessionTimeoutMinutes')
  final int sessionTimeoutMinutes;

  /// The key to use for matching the SAML Subject attribute.
  @_s.JsonKey(name: 'SubjectKey')
  final String subjectKey;

  SAMLOptionsInput({
    this.enabled,
    this.idp,
    this.masterBackendRole,
    this.masterUserName,
    this.rolesKey,
    this.sessionTimeoutMinutes,
    this.subjectKey,
  });
  Map<String, dynamic> toJson() => _$SAMLOptionsInputToJson(this);
}

/// Describes the SAML application configured for the domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SAMLOptionsOutput {
  /// True if SAML is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Describes the SAML Identity Provider's information.
  @_s.JsonKey(name: 'Idp')
  final SAMLIdp idp;

  /// The key used for matching the SAML Roles attribute.
  @_s.JsonKey(name: 'RolesKey')
  final String rolesKey;

  /// The duration, in minutes, after which a user session becomes inactive.
  @_s.JsonKey(name: 'SessionTimeoutMinutes')
  final int sessionTimeoutMinutes;

  /// The key used for matching the SAML Subject attribute.
  @_s.JsonKey(name: 'SubjectKey')
  final String subjectKey;

  SAMLOptionsOutput({
    this.enabled,
    this.idp,
    this.rolesKey,
    this.sessionTimeoutMinutes,
    this.subjectKey,
  });
  factory SAMLOptionsOutput.fromJson(Map<String, dynamic> json) =>
      _$SAMLOptionsOutputFromJson(json);
}

/// The current options of an Elasticsearch domain service software options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceSoftwareOptions {
  /// Timestamp, in Epoch time, until which you can manually request a service
  /// software update. After this date, we automatically update your service
  /// software.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'AutomatedUpdateDate')
  final DateTime automatedUpdateDate;

  /// <code>True</code> if you are able to cancel your service software version
  /// update. <code>False</code> if you are not able to cancel your service
  /// software version.
  @_s.JsonKey(name: 'Cancellable')
  final bool cancellable;

  /// The current service software version that is present on the domain.
  @_s.JsonKey(name: 'CurrentVersion')
  final String currentVersion;

  /// The description of the <code>UpdateStatus</code>.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The new service software version if one is available.
  @_s.JsonKey(name: 'NewVersion')
  final String newVersion;

  /// <code>True</code> if a service software is never automatically updated.
  /// <code>False</code> if a service software is automatically updated after
  /// <code>AutomatedUpdateDate</code>.
  @_s.JsonKey(name: 'OptionalDeployment')
  final bool optionalDeployment;

  /// <code>True</code> if you are able to update you service software version.
  /// <code>False</code> if you are not able to update your service software
  /// version.
  @_s.JsonKey(name: 'UpdateAvailable')
  final bool updateAvailable;

  /// The status of your service software update. This field can take the
  /// following values: <code>ELIGIBLE</code>, <code>PENDING_UPDATE</code>,
  /// <code>IN_PROGRESS</code>, <code>COMPLETED</code>, and
  /// <code>NOT_ELIGIBLE</code>.
  @_s.JsonKey(name: 'UpdateStatus')
  final DeploymentStatus updateStatus;

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
  factory ServiceSoftwareOptions.fromJson(Map<String, dynamic> json) =>
      _$ServiceSoftwareOptionsFromJson(json);
}

/// Specifies the time, in UTC format, when the service takes a daily automated
/// snapshot of the specified Elasticsearch domain. Default value is
/// <code>0</code> hours.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SnapshotOptions {
  /// Specifies the time, in UTC format, when the service takes a daily automated
  /// snapshot of the specified Elasticsearch domain. Default value is
  /// <code>0</code> hours.
  @_s.JsonKey(name: 'AutomatedSnapshotStartHour')
  final int automatedSnapshotStartHour;

  SnapshotOptions({
    this.automatedSnapshotStartHour,
  });
  factory SnapshotOptions.fromJson(Map<String, dynamic> json) =>
      _$SnapshotOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$SnapshotOptionsToJson(this);
}

/// Status of a daily automated snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SnapshotOptionsStatus {
  /// Specifies the daily snapshot options specified for the Elasticsearch domain.
  @_s.JsonKey(name: 'Options')
  final SnapshotOptions options;

  /// Specifies the status of a daily automated snapshot.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  SnapshotOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory SnapshotOptionsStatus.fromJson(Map<String, dynamic> json) =>
      _$SnapshotOptionsStatusFromJson(json);
}

/// The result of a <code>StartElasticsearchServiceSoftwareUpdate</code>
/// operation. Contains the status of the update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartElasticsearchServiceSoftwareUpdateResponse {
  /// The current status of the Elasticsearch service software update.
  @_s.JsonKey(name: 'ServiceSoftwareOptions')
  final ServiceSoftwareOptions serviceSoftwareOptions;

  StartElasticsearchServiceSoftwareUpdateResponse({
    this.serviceSoftwareOptions,
  });
  factory StartElasticsearchServiceSoftwareUpdateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartElasticsearchServiceSoftwareUpdateResponseFromJson(json);
}

/// StorageTypes represents the list of storage related types and their
/// attributes that are available for given InstanceType.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StorageType {
  @_s.JsonKey(name: 'StorageSubTypeName')
  final String storageSubTypeName;

  /// List of limits that are applicable for given storage type.
  @_s.JsonKey(name: 'StorageTypeLimits')
  final List<StorageTypeLimit> storageTypeLimits;
  @_s.JsonKey(name: 'StorageTypeName')
  final String storageTypeName;

  StorageType({
    this.storageSubTypeName,
    this.storageTypeLimits,
    this.storageTypeName,
  });
  factory StorageType.fromJson(Map<String, dynamic> json) =>
      _$StorageTypeFromJson(json);
}

/// Limits that are applicable for given storage type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StorageTypeLimit {
  /// Name of storage limits that are applicable for given storage type. If <code>
  /// <a>StorageType</a> </code> is ebs, following storage options are applicable
  /// <ol>
  /// <li>MinimumVolumeSize</li> Minimum amount of volume size that is applicable
  /// for given storage type.It can be empty if it is not applicable.
  /// <li>MaximumVolumeSize</li> Maximum amount of volume size that is applicable
  /// for given storage type.It can be empty if it is not applicable.
  /// <li>MaximumIops</li> Maximum amount of Iops that is applicable for given
  /// storage type.It can be empty if it is not applicable.
  /// <li>MinimumIops</li> Minimum amount of Iops that is applicable for given
  /// storage type.It can be empty if it is not applicable. </ol>
  @_s.JsonKey(name: 'LimitName')
  final String limitName;

  /// Values for the <code> <a>StorageTypeLimit$LimitName</a> </code> .
  @_s.JsonKey(name: 'LimitValues')
  final List<String> limitValues;

  StorageTypeLimit({
    this.limitName,
    this.limitValues,
  });
  factory StorageTypeLimit.fromJson(Map<String, dynamic> json) =>
      _$StorageTypeLimitFromJson(json);
}

enum TLSSecurityPolicy {
  @_s.JsonValue('Policy-Min-TLS-1-0-2019-07')
  policyMinTls_1_0_2019_07,
  @_s.JsonValue('Policy-Min-TLS-1-2-2019-07')
  policyMinTls_1_2_2019_07,
}

/// Specifies a key value pair for a resource tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// Specifies the <code>TagKey</code>, the name of the tag. Tag keys must be
  /// unique for the Elasticsearch domain to which they are attached.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Specifies the <code>TagValue</code>, the value assigned to the corresponding
  /// tag key. Tag values can be null and do not have to be unique in a tag set.
  /// For example, you can have a key value pair in a tag set of <code>project :
  /// Trinity</code> and <code>cost-center : Trinity</code>
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// The result of an <code>UpdateElasticsearchDomain</code> request. Contains
/// the status of the Elasticsearch domain being updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateElasticsearchDomainConfigResponse {
  /// The status of the updated Elasticsearch domain.
  @_s.JsonKey(name: 'DomainConfig')
  final ElasticsearchDomainConfig domainConfig;

  UpdateElasticsearchDomainConfigResponse({
    @_s.required this.domainConfig,
  });
  factory UpdateElasticsearchDomainConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateElasticsearchDomainConfigResponseFromJson(json);
}

/// Container for response returned by <code> <a>UpdatePackage</a> </code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePackageResponse {
  /// Information about the package <code>PackageDetails</code>.
  @_s.JsonKey(name: 'PackageDetails')
  final PackageDetails packageDetails;

  UpdatePackageResponse({
    this.packageDetails,
  });
  factory UpdatePackageResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePackageResponseFromJson(json);
}

/// Container for response returned by <code> <a>UpgradeElasticsearchDomain</a>
/// </code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpgradeElasticsearchDomainResponse {
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// This flag, when set to True, indicates that an Upgrade Eligibility Check
  /// needs to be performed. This will not actually perform the Upgrade.
  @_s.JsonKey(name: 'PerformCheckOnly')
  final bool performCheckOnly;

  /// The version of Elasticsearch that you intend to upgrade the domain to.
  @_s.JsonKey(name: 'TargetVersion')
  final String targetVersion;

  UpgradeElasticsearchDomainResponse({
    this.domainName,
    this.performCheckOnly,
    this.targetVersion,
  });
  factory UpgradeElasticsearchDomainResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpgradeElasticsearchDomainResponseFromJson(json);
}

/// History of the last 10 Upgrades and Upgrade Eligibility Checks.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpgradeHistory {
  /// UTC Timestamp at which the Upgrade API call was made in
  /// "yyyy-MM-ddTHH:mm:ssZ" format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTimestamp')
  final DateTime startTimestamp;

  /// A list of <code> <a>UpgradeStepItem</a> </code> s representing information
  /// about each step performed as pard of a specific Upgrade or Upgrade
  /// Eligibility Check.
  @_s.JsonKey(name: 'StepsList')
  final List<UpgradeStepItem> stepsList;

  /// A string that describes the update briefly
  @_s.JsonKey(name: 'UpgradeName')
  final String upgradeName;

  /// The overall status of the update. The status can take one of the following
  /// values:
  /// <ul>
  /// <li>In Progress</li>
  /// <li>Succeeded</li>
  /// <li>Succeeded with Issues</li>
  /// <li>Failed</li>
  /// </ul>
  @_s.JsonKey(name: 'UpgradeStatus')
  final UpgradeStatus upgradeStatus;

  UpgradeHistory({
    this.startTimestamp,
    this.stepsList,
    this.upgradeName,
    this.upgradeStatus,
  });
  factory UpgradeHistory.fromJson(Map<String, dynamic> json) =>
      _$UpgradeHistoryFromJson(json);
}

enum UpgradeStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('SUCCEEDED_WITH_ISSUES')
  succeededWithIssues,
  @_s.JsonValue('FAILED')
  failed,
}

enum UpgradeStep {
  @_s.JsonValue('PRE_UPGRADE_CHECK')
  preUpgradeCheck,
  @_s.JsonValue('SNAPSHOT')
  snapshot,
  @_s.JsonValue('UPGRADE')
  upgrade,
}

/// Represents a single step of the Upgrade or Upgrade Eligibility Check
/// workflow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpgradeStepItem {
  /// A list of strings containing detailed information about the errors
  /// encountered in a particular step.
  @_s.JsonKey(name: 'Issues')
  final List<String> issues;

  /// The Floating point value representing progress percentage of a particular
  /// step.
  @_s.JsonKey(name: 'ProgressPercent')
  final double progressPercent;

  /// Represents one of 3 steps that an Upgrade or Upgrade Eligibility Check does
  /// through:
  /// <ul>
  /// <li>PreUpgradeCheck</li>
  /// <li>Snapshot</li>
  /// <li>Upgrade</li>
  /// </ul>
  @_s.JsonKey(name: 'UpgradeStep')
  final UpgradeStep upgradeStep;

  /// The status of a particular step during an upgrade. The status can take one
  /// of the following values:
  /// <ul>
  /// <li>In Progress</li>
  /// <li>Succeeded</li>
  /// <li>Succeeded with Issues</li>
  /// <li>Failed</li>
  /// </ul>
  @_s.JsonKey(name: 'UpgradeStepStatus')
  final UpgradeStatus upgradeStepStatus;

  UpgradeStepItem({
    this.issues,
    this.progressPercent,
    this.upgradeStep,
    this.upgradeStepStatus,
  });
  factory UpgradeStepItem.fromJson(Map<String, dynamic> json) =>
      _$UpgradeStepItemFromJson(json);
}

/// Options to specify the subnets and security groups for VPC endpoint. For
/// more information, see <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html"
/// target="_blank"> VPC Endpoints for Amazon Elasticsearch Service Domains</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VPCDerivedInfo {
  /// The availability zones for the Elasticsearch domain. Exists only if the
  /// domain was created with VPCOptions.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  /// Specifies the security groups for VPC endpoint.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// Specifies the subnets for VPC endpoint.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The VPC Id for the Elasticsearch domain. Exists only if the domain was
  /// created with VPCOptions.
  @_s.JsonKey(name: 'VPCId')
  final String vPCId;

  VPCDerivedInfo({
    this.availabilityZones,
    this.securityGroupIds,
    this.subnetIds,
    this.vPCId,
  });
  factory VPCDerivedInfo.fromJson(Map<String, dynamic> json) =>
      _$VPCDerivedInfoFromJson(json);
}

/// Status of the VPC options for the specified Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VPCDerivedInfoStatus {
  /// Specifies the VPC options for the specified Elasticsearch domain.
  @_s.JsonKey(name: 'Options')
  final VPCDerivedInfo options;

  /// Specifies the status of the VPC options for the specified Elasticsearch
  /// domain.
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  VPCDerivedInfoStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory VPCDerivedInfoStatus.fromJson(Map<String, dynamic> json) =>
      _$VPCDerivedInfoStatusFromJson(json);
}

/// Options to specify the subnets and security groups for VPC endpoint. For
/// more information, see <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html"
/// target="_blank"> VPC Endpoints for Amazon Elasticsearch Service Domains</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VPCOptions {
  /// Specifies the security groups for VPC endpoint.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// Specifies the subnets for VPC endpoint.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  VPCOptions({
    this.securityGroupIds,
    this.subnetIds,
  });
  Map<String, dynamic> toJson() => _$VPCOptionsToJson(this);
}

/// The type of EBS volume, standard, gp2, or io1. See <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-ebs"
/// target="_blank">Configuring EBS-based Storage</a>for more information.
enum VolumeType {
  @_s.JsonValue('standard')
  standard,
  @_s.JsonValue('gp2')
  gp2,
  @_s.JsonValue('io1')
  io1,
}

/// Specifies the zone awareness configuration for the domain cluster, such as
/// the number of availability zones.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ZoneAwarenessConfig {
  /// An integer value to indicate the number of availability zones for a domain
  /// when zone awareness is enabled. This should be equal to number of subnets if
  /// VPC endpoints is enabled
  @_s.JsonKey(name: 'AvailabilityZoneCount')
  final int availabilityZoneCount;

  ZoneAwarenessConfig({
    this.availabilityZoneCount,
  });
  factory ZoneAwarenessConfig.fromJson(Map<String, dynamic> json) =>
      _$ZoneAwarenessConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ZoneAwarenessConfigToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BaseException extends _s.GenericAwsException {
  BaseException({String type, String message})
      : super(type: type, code: 'BaseException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class DisabledOperationException extends _s.GenericAwsException {
  DisabledOperationException({String type, String message})
      : super(type: type, code: 'DisabledOperationException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String type, String message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String type, String message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class InvalidTypeException extends _s.GenericAwsException {
  InvalidTypeException({String type, String message})
      : super(type: type, code: 'InvalidTypeException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BaseException': (type, message) =>
      BaseException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
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
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
