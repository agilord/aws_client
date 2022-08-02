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

/// Use the Amazon OpenSearch configuration API to create, configure, and manage
/// Amazon OpenSearch Service domains.
class OpenSearch {
  final _s.RestJsonProtocol _protocol;
  OpenSearch({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'es',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Allows the remote domain owner to accept an inbound cross-cluster
  /// connection request.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the inbound connection you want to accept.
  Future<AcceptInboundConnectionResponse> acceptInboundConnection({
    required String connectionId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2021-01-01/opensearch/cc/inboundConnection/${Uri.encodeComponent(connectionId)}/accept',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptInboundConnectionResponse.fromJson(response);
  }

  /// Attaches tags to an existing domain. Tags are a set of case-sensitive key
  /// value pairs. An domain can have up to 10 tags. See <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains.html#managedomains-awsresorcetagging"
  /// target="_blank"> Tagging Amazon OpenSearch Service domains</a> for more
  /// information.
  ///
  /// May throw [BaseException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [arn] :
  /// Specify the <code>ARN</code> of the domain you want to add tags to.
  ///
  /// Parameter [tagList] :
  /// List of <code>Tag</code> to add to the domain.
  Future<void> addTags({
    required String arn,
    required List<Tag> tagList,
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
      requestUri: '/2021-01-01/tags',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a package with an Amazon OpenSearch Service domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain to associate the package with.
  ///
  /// Parameter [packageID] :
  /// Internal ID of the package to associate with a domain. Use
  /// <code>DescribePackages</code> to find this value.
  Future<AssociatePackageResponse> associatePackage({
    required String domainName,
    required String packageID,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    ArgumentError.checkNotNull(packageID, 'packageID');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2021-01-01/packages/associate/${Uri.encodeComponent(packageID)}/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return AssociatePackageResponse.fromJson(response);
  }

  /// Cancels a scheduled service software update for an Amazon OpenSearch
  /// Service domain. You can only perform this operation before the
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
  Future<CancelServiceSoftwareUpdateResponse> cancelServiceSoftwareUpdate({
    required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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

  /// Creates a new Amazon OpenSearch Service domain. For more information, see
  /// <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html"
  /// target="_blank">Creating and managing Amazon OpenSearch Service domains
  /// </a> in the <i>Amazon OpenSearch Service Developer Guide</i>.
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
  /// The name of the Amazon OpenSearch Service domain you're creating. Domain
  /// names are unique across the domains owned by an account within an AWS
  /// region. Domain names must start with a lowercase letter and can contain
  /// the following characters: a-z (lowercase), 0-9, and - (hyphen).
  ///
  /// Parameter [accessPolicies] :
  /// IAM access policy as a JSON-formatted string.
  ///
  /// Parameter [advancedOptions] :
  /// Option to allow references to indices in an HTTP request body. Must be
  /// <code>false</code> when configuring access to individual sub-resources. By
  /// default, the value is <code>true</code>. See <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-advanced-options"
  /// target="_blank">Advanced cluster parameters </a> for more information.
  ///
  /// Parameter [advancedSecurityOptions] :
  /// Specifies advanced security options.
  ///
  /// Parameter [autoTuneOptions] :
  /// Specifies Auto-Tune options.
  ///
  /// Parameter [clusterConfig] :
  /// Configuration options for a domain. Specifies the instance type and number
  /// of instances in the domain.
  ///
  /// Parameter [cognitoOptions] :
  /// Options to specify the Cognito user and identity pools for OpenSearch
  /// Dashboards authentication. For more information, see <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/cognito-auth.html"
  /// target="_blank">Configuring Amazon Cognito authentication for OpenSearch
  /// Dashboards</a>.
  ///
  /// Parameter [domainEndpointOptions] :
  /// Options to specify configurations that will be applied to the domain
  /// endpoint.
  ///
  /// Parameter [eBSOptions] :
  /// Options to enable, disable, and specify the type and size of EBS storage
  /// volumes.
  ///
  /// Parameter [encryptionAtRestOptions] :
  /// Options for encryption of data at rest.
  ///
  /// Parameter [engineVersion] :
  /// String of format Elasticsearch_X.Y or OpenSearch_X.Y to specify the engine
  /// version for the Amazon OpenSearch Service domain. For example,
  /// "OpenSearch_1.0" or "Elasticsearch_7.9". For more information, see <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomains"
  /// target="_blank">Creating and managing Amazon OpenSearch Service domains
  /// </a>.
  ///
  /// Parameter [logPublishingOptions] :
  /// Map of <code>LogType</code> and <code>LogPublishingOption</code>, each
  /// containing options to publish a given type of OpenSearch log.
  ///
  /// Parameter [nodeToNodeEncryptionOptions] :
  /// Node-to-node encryption options.
  ///
  /// Parameter [snapshotOptions] :
  /// Option to set time, in UTC format, of the daily automated snapshot.
  /// Default value is 0 hours.
  ///
  /// Parameter [tagList] :
  /// A list of <code>Tag</code> added during domain creation.
  ///
  /// Parameter [vPCOptions] :
  /// Options to specify the subnets and security groups for a VPC endpoint. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html"
  /// target="_blank">Launching your Amazon OpenSearch Service domains using a
  /// VPC </a>.
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
    Map<LogType, LogPublishingOption>? logPublishingOptions,
    NodeToNodeEncryptionOptions? nodeToNodeEncryptionOptions,
    SnapshotOptions? snapshotOptions,
    List<Tag>? tagList,
    VPCOptions? vPCOptions,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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
      if (logPublishingOptions != null)
        'LogPublishingOptions':
            logPublishingOptions.map((k, e) => MapEntry(k.toValue(), e)),
      if (nodeToNodeEncryptionOptions != null)
        'NodeToNodeEncryptionOptions': nodeToNodeEncryptionOptions,
      if (snapshotOptions != null) 'SnapshotOptions': snapshotOptions,
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

  /// Creates a new cross-cluster connection from a local OpenSearch domain to a
  /// remote OpenSearch domain.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionAlias] :
  /// The connection alias used used by the customer for this cross-cluster
  /// connection.
  ///
  /// Parameter [localDomainInfo] :
  /// The <code> <a>AWSDomainInformation</a> </code> for the local OpenSearch
  /// domain.
  ///
  /// Parameter [remoteDomainInfo] :
  /// The <code> <a>AWSDomainInformation</a> </code> for the remote OpenSearch
  /// domain.
  Future<CreateOutboundConnectionResponse> createOutboundConnection({
    required String connectionAlias,
    required DomainInformationContainer localDomainInfo,
    required DomainInformationContainer remoteDomainInfo,
  }) async {
    ArgumentError.checkNotNull(connectionAlias, 'connectionAlias');
    ArgumentError.checkNotNull(localDomainInfo, 'localDomainInfo');
    ArgumentError.checkNotNull(remoteDomainInfo, 'remoteDomainInfo');
    final $payload = <String, dynamic>{
      'ConnectionAlias': connectionAlias,
      'LocalDomainInfo': localDomainInfo,
      'RemoteDomainInfo': remoteDomainInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/cc/outboundConnection',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOutboundConnectionResponse.fromJson(response);
  }

  /// Create a package for use with Amazon OpenSearch Service domains.
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
  /// The Amazon S3 location from which to import the package.
  ///
  /// Parameter [packageType] :
  /// Type of package. Currently supports only TXT-DICTIONARY.
  ///
  /// Parameter [packageDescription] :
  /// Description of the package.
  Future<CreatePackageResponse> createPackage({
    required String packageName,
    required PackageSource packageSource,
    required PackageType packageType,
    String? packageDescription,
  }) async {
    ArgumentError.checkNotNull(packageName, 'packageName');
    ArgumentError.checkNotNull(packageSource, 'packageSource');
    ArgumentError.checkNotNull(packageType, 'packageType');
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

  /// Permanently deletes the specified domain and all of its data. Once a
  /// domain is deleted, it cannot be recovered.
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainResponse.fromJson(response);
  }

  /// Allows the remote domain owner to delete an existing inbound cross-cluster
  /// connection.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the inbound connection to permanently delete.
  Future<DeleteInboundConnectionResponse> deleteInboundConnection({
    required String connectionId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2021-01-01/opensearch/cc/inboundConnection/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInboundConnectionResponse.fromJson(response);
  }

  /// Allows the local domain owner to delete an existing outbound cross-cluster
  /// connection.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the outbound connection you want to permanently delete.
  Future<DeleteOutboundConnectionResponse> deleteOutboundConnection({
    required String connectionId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2021-01-01/opensearch/cc/outboundConnection/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteOutboundConnectionResponse.fromJson(response);
  }

  /// Deletes the package.
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
    ArgumentError.checkNotNull(packageID, 'packageID');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2021-01-01/packages/${Uri.encodeComponent(packageID)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePackageResponse.fromJson(response);
  }

  /// Returns domain configuration information about the specified domain,
  /// including the domain ID, domain endpoint, and domain ARN.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain for which you want information.
  Future<DescribeDomainResponse> describeDomain({
    required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainResponse.fromJson(response);
  }

  /// Provides scheduled Auto-Tune action details for the domain, such as
  /// Auto-Tune action type, description, severity, and scheduled date.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The domain name for which you want Auto-Tune action details.
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. If not specified,
  /// defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// NextToken is sent in case the earlier API call results contain the
  /// NextToken. Used for pagination.
  Future<DescribeDomainAutoTunesResponse> describeDomainAutoTunes({
    required String domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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

  /// Returns information about the current blue/green deployment happening on a
  /// domain, including a change ID, status, and progress stages.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The domain you want to get the progress information about.
  ///
  /// Parameter [changeId] :
  /// The specific change ID for which you want to get progress information.
  /// This is an optional parameter. If omitted, the service returns information
  /// about the most recent configuration change.
  Future<DescribeDomainChangeProgressResponse> describeDomainChangeProgress({
    required String domainName,
    String? changeId,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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

  /// Provides cluster configuration information about the specified domain,
  /// such as the state, creation date, update version, and update date for
  /// cluster options.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The domain you want to get information about.
  Future<DescribeDomainConfigResponse> describeDomainConfig({
    required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/config',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainConfigResponse.fromJson(response);
  }

  /// Returns domain configuration information about the specified domains,
  /// including the domain ID, domain endpoint, and domain ARN.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainNames] :
  /// The domains for which you want information.
  Future<DescribeDomainsResponse> describeDomains({
    required List<String> domainNames,
  }) async {
    ArgumentError.checkNotNull(domainNames, 'domainNames');
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

  /// Lists all the inbound cross-cluster connections for a remote domain.
  ///
  /// May throw [InvalidPaginationTokenException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [filters] :
  /// A list of filters used to match properties for inbound cross-cluster
  /// connections. Available <code> <a>Filter</a> </code> values are:
  /// <ul>
  /// <li>connection-id</li>
  /// <li>local-domain-info.domain-name</li>
  /// <li>local-domain-info.owner-id</li>
  /// <li>local-domain-info.region</li>
  /// <li>remote-domain-info.domain-name</li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. If not specified,
  /// defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// If more results are available and NextToken is present, make the next
  /// request to the same API with the received NextToken to paginate the
  /// remaining results.
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

  /// Describe the limits for a given instance type and OpenSearch or
  /// Elasticsearch version. When modifying an existing domain, specify the
  /// <code> <a>DomainName</a> </code> to see which limits you can modify.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [engineVersion] :
  /// Version of OpenSearch for which <code> <a>Limits</a> </code> are needed.
  ///
  /// Parameter [instanceType] :
  /// The instance type for an OpenSearch cluster for which OpenSearch <code>
  /// <a>Limits</a> </code> are needed.
  ///
  /// Parameter [domainName] :
  /// The name of the domain you want to modify. Only include this value if
  /// you're querying OpenSearch <code> <a>Limits</a> </code> for an existing
  /// domain.
  Future<DescribeInstanceTypeLimitsResponse> describeInstanceTypeLimits({
    required String engineVersion,
    required OpenSearchPartitionInstanceType instanceType,
    String? domainName,
  }) async {
    ArgumentError.checkNotNull(engineVersion, 'engineVersion');
    ArgumentError.checkNotNull(instanceType, 'instanceType');
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

  /// Lists all the outbound cross-cluster connections for a local domain.
  ///
  /// May throw [InvalidPaginationTokenException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [filters] :
  /// A list of filters used to match properties for outbound cross-cluster
  /// connections. Available <code> <a>Filter</a> </code> names for this
  /// operation are:
  /// <ul>
  /// <li>connection-id</li>
  /// <li>remote-domain-info.domain-name</li>
  /// <li>remote-domain-info.owner-id</li>
  /// <li>remote-domain-info.region</li>
  /// <li>local-domain-info.domain-name</li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. If not specified,
  /// defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// NextToken is sent in case the earlier API call results contain the
  /// NextToken parameter. Used for pagination.
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

  /// Describes all packages available to Amazon OpenSearch Service domains.
  /// Includes options for filtering, limiting the number of results, and
  /// pagination.
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

  /// Lists available reserved OpenSearch instance offerings.
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
  /// Provides an identifier to allow retrieval of paginated results.
  ///
  /// Parameter [reservedInstanceOfferingId] :
  /// The offering identifier filter value. Use this parameter to show only the
  /// available offering that matches the specified reservation identifier.
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

  /// Returns information about reserved OpenSearch instances for this account.
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
  /// Provides an identifier to allow retrieval of paginated results.
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

  /// Dissociates a package from the Amazon OpenSearch Service domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain to associate the package with.
  ///
  /// Parameter [packageID] :
  /// The internal ID of the package to associate with a domain. Use
  /// <code>DescribePackages</code> to find this value.
  Future<DissociatePackageResponse> dissociatePackage({
    required String domainName,
    required String packageID,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    ArgumentError.checkNotNull(packageID, 'packageID');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2021-01-01/packages/dissociate/${Uri.encodeComponent(packageID)}/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DissociatePackageResponse.fromJson(response);
  }

  /// Returns a list of upgrade-compatible versions of OpenSearch/Elasticsearch.
  /// You can optionally pass a <code> <a>DomainName</a> </code> to get all
  /// upgrade-compatible versions of OpenSearch/Elasticsearch for that specific
  /// domain.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
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

  /// Returns a list of package versions, along with their creation time and
  /// commit message.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageID] :
  /// Returns an audit history of package versions.
  ///
  /// Parameter [maxResults] :
  /// Limits results to a maximum number of package versions.
  ///
  /// Parameter [nextToken] :
  /// Used for pagination. Only necessary if a previous API call includes a
  /// non-null NextToken value. If provided, returns results for the next page.
  Future<GetPackageVersionHistoryResponse> getPackageVersionHistory({
    required String packageID,
    int? maxResults,
    String? nextToken,
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
          '/2021-01-01/packages/${Uri.encodeComponent(packageID)}/history',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPackageVersionHistoryResponse.fromJson(response);
  }

  /// Retrieves the complete history of the last 10 upgrades performed on the
  /// domain.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  Future<GetUpgradeHistoryResponse> getUpgradeHistory({
    required String domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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

  /// Retrieves the latest status of the last upgrade or upgrade eligibility
  /// check performed on the domain.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  Future<GetUpgradeStatusResponse> getUpgradeStatus({
    required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-01-01/opensearch/upgradeDomain/${Uri.encodeComponent(domainName)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetUpgradeStatusResponse.fromJson(response);
  }

  /// Returns the names of all domains owned by the current user's account.
  ///
  /// May throw [BaseException].
  /// May throw [ValidationException].
  ///
  /// Parameter [engineType] :
  /// Optional parameter to filter the output by domain engine type. Acceptable
  /// values are 'Elasticsearch' and 'OpenSearch'.
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

  /// Lists all Amazon OpenSearch Service domains associated with the package.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageID] :
  /// The package for which to list associated domains.
  ///
  /// Parameter [maxResults] :
  /// Limits the results to a maximum number of domains.
  ///
  /// Parameter [nextToken] :
  /// Used for pagination. Only necessary if a previous API call includes a
  /// non-null NextToken value. If provided, returns results for the next page.
  Future<ListDomainsForPackageResponse> listDomainsForPackage({
    required String packageID,
    int? maxResults,
    String? nextToken,
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
          '/2021-01-01/packages/${Uri.encodeComponent(packageID)}/domains',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsForPackageResponse.fromJson(response);
  }

  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<ListInstanceTypeDetailsResponse> listInstanceTypeDetails({
    required String engineVersion,
    String? domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(engineVersion, 'engineVersion');
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
          '/2021-01-01/opensearch/instanceTypeDetails/${Uri.encodeComponent(engineVersion)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInstanceTypeDetailsResponse.fromJson(response);
  }

  /// Lists all packages associated with the Amazon OpenSearch Service domain.
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
    required String domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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

  /// Returns all tags for the given domain.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [arn] :
  /// Specify the <code>ARN</code> of the domain that the tags you want to view
  /// are attached to.
  Future<ListTagsResponse> listTags({
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
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

  /// List all supported versions of OpenSearch and Elasticsearch.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. Value must be
  /// greater than 10 or it won't be honored.
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

  /// Allows you to purchase reserved OpenSearch instances.
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
  /// The ID of the reserved OpenSearch instance offering to purchase.
  ///
  /// Parameter [instanceCount] :
  /// The number of OpenSearch instances to reserve.
  Future<PurchaseReservedInstanceOfferingResponse>
      purchaseReservedInstanceOffering({
    required String reservationName,
    required String reservedInstanceOfferingId,
    int? instanceCount,
  }) async {
    ArgumentError.checkNotNull(reservationName, 'reservationName');
    ArgumentError.checkNotNull(
        reservedInstanceOfferingId, 'reservedInstanceOfferingId');
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

  /// Allows the remote domain owner to reject an inbound cross-cluster
  /// connection request.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the inbound connection to reject.
  Future<RejectInboundConnectionResponse> rejectInboundConnection({
    required String connectionId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2021-01-01/opensearch/cc/inboundConnection/${Uri.encodeComponent(connectionId)}/reject',
      exceptionFnMap: _exceptionFns,
    );
    return RejectInboundConnectionResponse.fromJson(response);
  }

  /// Removes the specified set of tags from the given domain.
  ///
  /// May throw [BaseException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [arn] :
  /// The <code>ARN</code> of the domain from which you want to delete the
  /// specified tags.
  ///
  /// Parameter [tagKeys] :
  /// The <code>TagKey</code> list you want to remove from the domain.
  Future<void> removeTags({
    required String arn,
    required List<String> tagKeys,
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
      requestUri: '/2021-01-01/tags-removal',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Schedules a service software update for an Amazon OpenSearch Service
  /// domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to update to the latest service
  /// software.
  Future<StartServiceSoftwareUpdateResponse> startServiceSoftwareUpdate({
    required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final $payload = <String, dynamic>{
      'DomainName': domainName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2021-01-01/opensearch/serviceSoftwareUpdate/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartServiceSoftwareUpdateResponse.fromJson(response);
  }

  /// Modifies the cluster configuration of the specified domain, such as
  /// setting the instance type and the number of instances.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain you're updating.
  ///
  /// Parameter [accessPolicies] :
  /// IAM access policy as a JSON-formatted string.
  ///
  /// Parameter [advancedOptions] :
  /// Modifies the advanced option to allow references to indices in an HTTP
  /// request body. Must be <code>false</code> when configuring access to
  /// individual sub-resources. By default, the value is <code>true</code>. See
  /// <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-advanced-options"
  /// target="_blank">Advanced options </a> for more information.
  ///
  /// Parameter [advancedSecurityOptions] :
  /// Specifies advanced security options.
  ///
  /// Parameter [autoTuneOptions] :
  /// Specifies Auto-Tune options.
  ///
  /// Parameter [clusterConfig] :
  /// The type and number of instances to instantiate for the domain cluster.
  ///
  /// Parameter [cognitoOptions] :
  /// Options to specify the Cognito user and identity pools for OpenSearch
  /// Dashboards authentication. For more information, see <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/cognito-auth.html"
  /// target="_blank">Configuring Amazon Cognito authentication for OpenSearch
  /// Dashboards</a>.
  ///
  /// Parameter [domainEndpointOptions] :
  /// Options to specify configuration that will be applied to the domain
  /// endpoint.
  ///
  /// Parameter [dryRun] :
  /// This flag, when set to True, specifies whether the
  /// <code>UpdateDomain</code> request should return the results of validation
  /// checks (DryRunResults) without actually applying the change.
  ///
  /// Parameter [eBSOptions] :
  /// Specify the type and size of the EBS volume to use.
  ///
  /// Parameter [encryptionAtRestOptions] :
  /// Specifies encryption of data at rest options.
  ///
  /// Parameter [logPublishingOptions] :
  /// Map of <code>LogType</code> and <code>LogPublishingOption</code>, each
  /// containing options to publish a given type of OpenSearch log.
  ///
  /// Parameter [nodeToNodeEncryptionOptions] :
  /// Specifies node-to-node encryption options.
  ///
  /// Parameter [snapshotOptions] :
  /// Option to set the time, in UTC format, for the daily automated snapshot.
  /// Default value is <code>0</code> hours.
  ///
  /// Parameter [vPCOptions] :
  /// Options to specify the subnets and security groups for the VPC endpoint.
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html"
  /// target="_blank">Launching your Amazon OpenSearch Service domains using a
  /// VPC </a>.
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
    EBSOptions? eBSOptions,
    EncryptionAtRestOptions? encryptionAtRestOptions,
    Map<LogType, LogPublishingOption>? logPublishingOptions,
    NodeToNodeEncryptionOptions? nodeToNodeEncryptionOptions,
    SnapshotOptions? snapshotOptions,
    VPCOptions? vPCOptions,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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
      if (eBSOptions != null) 'EBSOptions': eBSOptions,
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
      requestUri:
          '/2021-01-01/opensearch/domain/${Uri.encodeComponent(domainName)}/config',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDomainConfigResponse.fromJson(response);
  }

  /// Updates a package for use with Amazon OpenSearch Service domains.
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
  /// Parameter [commitMessage] :
  /// A commit message for the new version which is shown as part of
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
    ArgumentError.checkNotNull(packageID, 'packageID');
    ArgumentError.checkNotNull(packageSource, 'packageSource');
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

  /// Allows you to either upgrade your domain or perform an upgrade eligibility
  /// check to a compatible version of OpenSearch or Elasticsearch.
  ///
  /// May throw [BaseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  ///
  /// Parameter [targetVersion] :
  /// The version of OpenSearch you intend to upgrade the domain to.
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    ArgumentError.checkNotNull(targetVersion, 'targetVersion');
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

class AWSDomainInformation {
  final String domainName;
  final String? ownerId;
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

/// The result of an <code> <a>AcceptInboundConnection</a> </code> operation.
/// Contains details about the accepted inbound connection.
class AcceptInboundConnectionResponse {
  /// The <code> <a>InboundConnection</a> </code> of the accepted inbound
  /// connection.
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

/// The configured access rules for the domain's document and search endpoints,
/// and the current status of those rules.
class AccessPoliciesStatus {
  /// The access policy configured for the domain. Access policies can be
  /// resource-based, IP-based, or IAM-based. See <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-access-policies"
  /// target="_blank"> Configuring access policies</a>for more information.
  final String options;

  /// The status of the access policy for the domain. See
  /// <code>OptionStatus</code> for the status information that's included.
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

/// List of limits that are specific to a given InstanceType and for each of its
/// <code> <a>InstanceRole</a> </code> .
class AdditionalLimit {
  /// Additional limit is specific to a given InstanceType and for each of its
  /// <code> <a>InstanceRole</a> </code> etc. <br/> Attributes and their details:
  /// <br/>
  /// <ul>
  /// <li>MaximumNumberOfDataNodesSupported</li> This attribute is present on the
  /// master node only to specify how much data nodes up to which given <code>
  /// <a>ESPartitionInstanceType</a> </code> can support as master node.
  /// <li>MaximumNumberOfDataNodesWithoutMasterNode</li> This attribute is present
  /// on data node only to specify how much data nodes of given <code>
  /// <a>ESPartitionInstanceType</a> </code> up to which you don't need any master
  /// nodes to govern them.
  /// </ul>
  final String? limitName;

  /// Value for a given <code> <a>AdditionalLimit$LimitName</a> </code> .
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

/// Status of the advanced options for the specified domain. Currently, the
/// following advanced options are available:
///
/// <ul>
/// <li>Option to allow references to indices in an HTTP request body. Must be
/// <code>false</code> when configuring access to individual sub-resources. By
/// default, the value is <code>true</code>. See <a
/// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-advanced-options"
/// target="_blank">Advanced cluster parameters </a> for more information. </li>
/// <li>Option to specify the percentage of heap space allocated to field data.
/// By default, this setting is unbounded. </li>
/// </ul>
/// For more information, see <a
/// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-advanced-options">
/// Advanced cluster parameters</a>.
class AdvancedOptionsStatus {
  /// The status of advanced options for the specified domain.
  final Map<String, String> options;

  /// The <code>OptionStatus</code> for advanced options for the specified domain.
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

/// The advanced security configuration: whether advanced security is enabled,
/// whether the internal database option is enabled.
class AdvancedSecurityOptions {
  /// Specifies the Anonymous Auth Disable Date when Anonymous Auth is enabled.
  final DateTime? anonymousAuthDisableDate;

  /// True if Anonymous auth is enabled. Anonymous auth can be enabled only when
  /// AdvancedSecurity is enabled on existing domains.
  final bool? anonymousAuthEnabled;

  /// True if advanced security is enabled.
  final bool? enabled;

  /// True if the internal user database is enabled.
  final bool? internalUserDatabaseEnabled;

  /// Describes the SAML application configured for a domain.
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

/// The advanced security configuration: whether advanced security is enabled,
/// whether the internal database option is enabled, master username and
/// password (if internal database is enabled), and master user ARN (if IAM is
/// enabled).
class AdvancedSecurityOptionsInput {
  /// True if Anonymous auth is enabled. Anonymous auth can be enabled only when
  /// AdvancedSecurity is enabled on existing domains.
  final bool? anonymousAuthEnabled;

  /// True if advanced security is enabled.
  final bool? enabled;

  /// True if the internal user database is enabled.
  final bool? internalUserDatabaseEnabled;

  /// Credentials for the master user: username and password, ARN, or both.
  final MasterUserOptions? masterUserOptions;

  /// The SAML application configuration for the domain.
  final SAMLOptionsInput? sAMLOptions;

  AdvancedSecurityOptionsInput({
    this.anonymousAuthEnabled,
    this.enabled,
    this.internalUserDatabaseEnabled,
    this.masterUserOptions,
    this.sAMLOptions,
  });

  factory AdvancedSecurityOptionsInput.fromJson(Map<String, dynamic> json) {
    return AdvancedSecurityOptionsInput(
      anonymousAuthEnabled: json['AnonymousAuthEnabled'] as bool?,
      enabled: json['Enabled'] as bool?,
      internalUserDatabaseEnabled: json['InternalUserDatabaseEnabled'] as bool?,
      masterUserOptions: json['MasterUserOptions'] != null
          ? MasterUserOptions.fromJson(
              json['MasterUserOptions'] as Map<String, dynamic>)
          : null,
      sAMLOptions: json['SAMLOptions'] != null
          ? SAMLOptionsInput.fromJson(
              json['SAMLOptions'] as Map<String, dynamic>)
          : null,
    );
  }

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

/// The status of advanced security options for the specified domain.
class AdvancedSecurityOptionsStatus {
  /// Advanced security options for the specified domain.
  final AdvancedSecurityOptions options;

  /// Status of the advanced security options for the specified domain.
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

/// Container for the response returned by <code> <a>AssociatePackage</a>
/// </code> operation.
class AssociatePackageResponse {
  /// <code>DomainPackageDetails</code>
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

/// Specifies the Auto-Tune type and Auto-Tune action details.
class AutoTune {
  /// Specifies details about the Auto-Tune action. See <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
  /// information.
  final AutoTuneDetails? autoTuneDetails;

  /// Specifies the Auto-Tune type. Valid value is SCHEDULED_ACTION.
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

extension on AutoTuneDesiredState {
  String toValue() {
    switch (this) {
      case AutoTuneDesiredState.enabled:
        return 'ENABLED';
      case AutoTuneDesiredState.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
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

/// Specifies details about the Auto-Tune action. See <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
/// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
/// information.
class AutoTuneDetails {
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

/// Specifies the Auto-Tune maintenance schedule. See <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
/// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
/// information.
class AutoTuneMaintenanceSchedule {
  /// A cron expression for a recurring maintenance schedule. See <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
  /// information.
  final String? cronExpressionForRecurrence;

  /// Specifies maintenance schedule duration: duration value and duration unit.
  /// See <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
  /// information.
  final Duration? duration;

  /// The timestamp at which the Auto-Tune maintenance schedule starts.
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

/// The Auto-Tune options: the Auto-Tune desired state for the domain, rollback
/// state when disabling Auto-Tune options and list of maintenance schedules.
class AutoTuneOptions {
  /// The Auto-Tune desired state. Valid values are ENABLED and DISABLED.
  final AutoTuneDesiredState? desiredState;

  /// A list of maintenance schedules. See <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
  /// information.
  final List<AutoTuneMaintenanceSchedule>? maintenanceSchedules;

  /// The rollback state while disabling Auto-Tune for the domain. Valid values
  /// are NO_ROLLBACK and DEFAULT_ROLLBACK.
  final RollbackOnDisable? rollbackOnDisable;

  AutoTuneOptions({
    this.desiredState,
    this.maintenanceSchedules,
    this.rollbackOnDisable,
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
    );
  }

  Map<String, dynamic> toJson() {
    final desiredState = this.desiredState;
    final maintenanceSchedules = this.maintenanceSchedules;
    final rollbackOnDisable = this.rollbackOnDisable;
    return {
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (maintenanceSchedules != null)
        'MaintenanceSchedules': maintenanceSchedules,
      if (rollbackOnDisable != null)
        'RollbackOnDisable': rollbackOnDisable.toValue(),
    };
  }
}

/// The Auto-Tune options: the Auto-Tune desired state for the domain and list
/// of maintenance schedules.
class AutoTuneOptionsInput {
  /// The Auto-Tune desired state. Valid values are ENABLED and DISABLED.
  final AutoTuneDesiredState? desiredState;

  /// A list of maintenance schedules. See <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
  /// information.
  final List<AutoTuneMaintenanceSchedule>? maintenanceSchedules;

  AutoTuneOptionsInput({
    this.desiredState,
    this.maintenanceSchedules,
  });

  factory AutoTuneOptionsInput.fromJson(Map<String, dynamic> json) {
    return AutoTuneOptionsInput(
      desiredState: (json['DesiredState'] as String?)?.toAutoTuneDesiredState(),
      maintenanceSchedules: (json['MaintenanceSchedules'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AutoTuneMaintenanceSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final desiredState = this.desiredState;
    final maintenanceSchedules = this.maintenanceSchedules;
    return {
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (maintenanceSchedules != null)
        'MaintenanceSchedules': maintenanceSchedules,
    };
  }
}

/// The Auto-Tune options: the Auto-Tune desired state for the domain and list
/// of maintenance schedules.
class AutoTuneOptionsOutput {
  /// The error message while enabling or disabling Auto-Tune.
  final String? errorMessage;

  /// The <code>AutoTuneState</code> for the domain.
  final AutoTuneState? state;

  AutoTuneOptionsOutput({
    this.errorMessage,
    this.state,
  });

  factory AutoTuneOptionsOutput.fromJson(Map<String, dynamic> json) {
    return AutoTuneOptionsOutput(
      errorMessage: json['ErrorMessage'] as String?,
      state: (json['State'] as String?)?.toAutoTuneState(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final state = this.state;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// The Auto-Tune status for the domain.
class AutoTuneOptionsStatus {
  /// Specifies Auto-Tune options for the domain.
  final AutoTuneOptions? options;

  /// The status of the Auto-Tune options for the domain.
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
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
/// target="_blank"> Auto-Tune for Amazon OpenSearch Service</a>.
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

extension on AutoTuneState {
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

extension on String {
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

/// Provides the current Auto-Tune status for the domain.
class AutoTuneStatus {
  /// The timestamp of the Auto-Tune options creation date.
  final DateTime creationDate;

  /// The <code>AutoTuneState</code> for the domain.
  final AutoTuneState state;

  /// The timestamp of when the Auto-Tune options were last updated.
  final DateTime updateDate;

  /// The error message while enabling or disabling Auto-Tune.
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

extension on AutoTuneType {
  String toValue() {
    switch (this) {
      case AutoTuneType.scheduledAction:
        return 'SCHEDULED_ACTION';
    }
  }
}

extension on String {
  AutoTuneType toAutoTuneType() {
    switch (this) {
      case 'SCHEDULED_ACTION':
        return AutoTuneType.scheduledAction;
    }
    throw Exception('$this is not known in enum AutoTuneType');
  }
}

/// The result of a <code>CancelServiceSoftwareUpdate</code> operation. Contains
/// the status of the update.
class CancelServiceSoftwareUpdateResponse {
  /// The current status of the OpenSearch service software update.
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

/// Specifies change details of the domain configuration change.
class ChangeProgressDetails {
  /// The unique change identifier associated with a specific domain configuration
  /// change.
  final String? changeId;

  /// Contains an optional message associated with the domain configuration
  /// change.
  final String? message;

  ChangeProgressDetails({
    this.changeId,
    this.message,
  });

  factory ChangeProgressDetails.fromJson(Map<String, dynamic> json) {
    return ChangeProgressDetails(
      changeId: json['ChangeId'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeId = this.changeId;
    final message = this.message;
    return {
      if (changeId != null) 'ChangeId': changeId,
      if (message != null) 'Message': message,
    };
  }
}

/// A progress stage details of a specific domain configuration change.
class ChangeProgressStage {
  /// The description of the progress stage.
  final String? description;

  /// The last updated timestamp of the progress stage.
  final DateTime? lastUpdated;

  /// The name of the specific progress stage.
  final String? name;

  /// The overall status of a specific progress stage.
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

  /// The list of properties involved in the domain configuration change that are
  /// completed.
  final List<String>? completedProperties;

  /// The list of properties involved in the domain configuration change that are
  /// still in pending.
  final List<String>? pendingProperties;

  /// The time at which the configuration change is made on the domain.
  final DateTime? startTime;

  /// The overall status of the domain configuration change. This field can take
  /// the following values: <code>PENDING</code>, <code>PROCESSING</code>,
  /// <code>COMPLETED</code> and <code>FAILED</code>
  final OverallChangeStatus? status;

  /// The total number of stages required for the configuration change.
  final int? totalNumberOfStages;

  ChangeProgressStatusDetails({
    this.changeId,
    this.changeProgressStages,
    this.completedProperties,
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
      if (pendingProperties != null) 'PendingProperties': pendingProperties,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (totalNumberOfStages != null)
        'TotalNumberOfStages': totalNumberOfStages,
    };
  }
}

/// The configuration for the domain cluster, such as the type and number of
/// instances.
class ClusterConfig {
  /// Specifies the <code>ColdStorageOptions</code> config for a Domain
  final ColdStorageOptions? coldStorageOptions;

  /// Total number of dedicated master nodes, active and on standby, for the
  /// cluster.
  final int? dedicatedMasterCount;

  /// A boolean value to indicate whether a dedicated master node is enabled. See
  /// <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains.html#managedomains-dedicatedmasternodes"
  /// target="_blank">Dedicated master nodes in Amazon OpenSearch Service </a> for
  /// more information.
  final bool? dedicatedMasterEnabled;

  /// The instance type for a dedicated master node.
  final OpenSearchPartitionInstanceType? dedicatedMasterType;

  /// The number of instances in the specified domain cluster.
  final int? instanceCount;

  /// The instance type for an OpenSearch cluster. UltraWarm instance types are
  /// not supported for data instances.
  final OpenSearchPartitionInstanceType? instanceType;

  /// The number of UltraWarm nodes in the cluster.
  final int? warmCount;

  /// True to enable UltraWarm storage.
  final bool? warmEnabled;

  /// The instance type for the OpenSearch cluster's warm nodes.
  final OpenSearchWarmPartitionInstanceType? warmType;

  /// The zone awareness configuration for a domain when zone awareness is
  /// enabled.
  final ZoneAwarenessConfig? zoneAwarenessConfig;

  /// A boolean value to indicate whether zone awareness is enabled. See <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-multiaz.html"
  /// target="_blank">Configuring a multi-AZ domain in Amazon OpenSearch Service
  /// </a> for more information.
  final bool? zoneAwarenessEnabled;

  ClusterConfig({
    this.coldStorageOptions,
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

/// The configuration status for the specified domain.
class ClusterConfigStatus {
  /// The cluster configuration for the specified domain.
  final ClusterConfig options;

  /// The cluster configuration status for the specified domain.
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

/// Options to specify the Cognito user and identity pools for OpenSearch
/// Dashboards authentication. For more information, see <a
/// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/cognito-auth.html"
/// target="_blank">Configuring Amazon Cognito authentication for OpenSearch
/// Dashboards</a>.
class CognitoOptions {
  /// The option to enable Cognito for OpenSearch Dashboards authentication.
  final bool? enabled;

  /// The Cognito identity pool ID for OpenSearch Dashboards authentication.
  final String? identityPoolId;

  /// The role ARN that provides OpenSearch permissions for accessing Cognito
  /// resources.
  final String? roleArn;

  /// The Cognito user pool ID for OpenSearch Dashboards authentication.
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

/// Specifies the configuration for cold storage options such as enabled
class ColdStorageOptions {
  /// Enable cold storage option. Accepted values true or false
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

/// A map from an <code> <a>EngineVersion</a> </code> to a list of compatible
/// <code> <a>EngineVersion</a> </code> s to which the domain can be upgraded.
class CompatibleVersionsMap {
  /// The current version of OpenSearch a domain is on.
  final String? sourceVersion;
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

/// The result of a <code>CreateDomain</code> operation. Contains the status of
/// the newly created Amazon OpenSearch Service domain.
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

/// The result of a <code> <a>CreateOutboundConnection</a> </code> request.
/// Contains the details about the newly created cross-cluster connection.
class CreateOutboundConnectionResponse {
  /// The connection alias provided during the create connection request.
  final String? connectionAlias;

  /// The unique ID for the created outbound connection, which is used for
  /// subsequent operations on the connection.
  final String? connectionId;

  /// The <code> <a>OutboundConnectionStatus</a> </code> for the newly created
  /// connection.
  final OutboundConnectionStatus? connectionStatus;

  /// The <code> <a>AWSDomainInformation</a> </code> for the local OpenSearch
  /// domain.
  final DomainInformationContainer? localDomainInfo;

  /// The <code> <a>AWSDomainInformation</a> </code> for the remote OpenSearch
  /// domain.
  final DomainInformationContainer? remoteDomainInfo;

  CreateOutboundConnectionResponse({
    this.connectionAlias,
    this.connectionId,
    this.connectionStatus,
    this.localDomainInfo,
    this.remoteDomainInfo,
  });

  factory CreateOutboundConnectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateOutboundConnectionResponse(
      connectionAlias: json['ConnectionAlias'] as String?,
      connectionId: json['ConnectionId'] as String?,
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
    final connectionStatus = this.connectionStatus;
    final localDomainInfo = this.localDomainInfo;
    final remoteDomainInfo = this.remoteDomainInfo;
    return {
      if (connectionAlias != null) 'ConnectionAlias': connectionAlias,
      if (connectionId != null) 'ConnectionId': connectionId,
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (localDomainInfo != null) 'LocalDomainInfo': localDomainInfo,
      if (remoteDomainInfo != null) 'RemoteDomainInfo': remoteDomainInfo,
    };
  }
}

/// Container for the response returned by the <code> <a>CreatePackage</a>
/// </code> operation.
class CreatePackageResponse {
  /// Information about the package.
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

/// The result of a <code>DeleteDomain</code> request. Contains the status of
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

/// The result of a <code> <a>DeleteInboundConnection</a> </code> operation.
/// Contains details about the deleted inbound connection.
class DeleteInboundConnectionResponse {
  /// The <code> <a>InboundConnection</a> </code> of the deleted inbound
  /// connection.
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

/// The result of a <code> <a>DeleteOutboundConnection</a> </code> operation.
/// Contains details about the deleted outbound connection.
class DeleteOutboundConnectionResponse {
  /// The <code> <a>OutboundConnection</a> </code> of the deleted outbound
  /// connection.
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

/// Container for the response parameters to the <code> <a>DeletePackage</a>
/// </code> operation.
class DeletePackageResponse {
  /// <code>PackageDetails</code>
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

enum DeploymentStatus {
  pendingUpdate,
  inProgress,
  completed,
  notEligible,
  eligible,
}

extension on DeploymentStatus {
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

extension on String {
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

/// The result of a <code>DescribeDomainAutoTunes</code> request. See <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
/// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
/// information.
class DescribeDomainAutoTunesResponse {
  /// The list of setting adjustments that Auto-Tune has made to the domain. See
  /// <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
  /// information.
  final List<AutoTune>? autoTunes;

  /// An identifier to allow retrieval of paginated results.
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
/// the progress information of the requested domain change.
class DescribeDomainChangeProgressResponse {
  /// Progress information for the configuration change that is requested in the
  /// <code>DescribeDomainChangeProgress</code> request.
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

/// The result of a <code>DescribeDomainConfig</code> request. Contains the
/// configuration information of the requested domain.
class DescribeDomainConfigResponse {
  /// The configuration information of the domain requested in the
  /// <code>DescribeDomainConfig</code> request.
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

/// The result of a <code>DescribeDomain</code> request. Contains the status of
/// the domain specified in the request.
class DescribeDomainResponse {
  /// The current status of the domain.
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

/// The result of a <code>DescribeDomains</code> request. Contains the status of
/// the specified domains or all domains owned by the account.
class DescribeDomainsResponse {
  /// The status of the domains requested in the <code>DescribeDomains</code>
  /// request.
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

/// The result of a <code> <a>DescribeInboundConnections</a> </code> request.
/// Contains a list of connections matching the filter criteria.
class DescribeInboundConnectionsResponse {
  /// A list of <code> <a>InboundConnection</a> </code> matching the specified
  /// filter criteria.
  final List<InboundConnection>? connections;

  /// If more results are available and NextToken is present, make the next
  /// request to the same API with the received NextToken to paginate the
  /// remaining results.
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

/// Container for the parameters received from the <code>
/// <a>DescribeInstanceTypeLimits</a> </code> operation.
class DescribeInstanceTypeLimitsResponse {
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

/// The result of a <code> <a>DescribeOutboundConnections</a> </code> request.
/// Contains the list of connections matching the filter criteria.
class DescribeOutboundConnectionsResponse {
  /// A list of <code> <a>OutboundConnection</a> </code> matching the specified
  /// filter criteria.
  final List<OutboundConnection>? connections;

  /// If more results are available and NextToken is present, make the next
  /// request to the same API with the received NextToken to paginate the
  /// remaining results.
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

  /// A list of values for the specified field.
  final List<String>? value;

  DescribePackagesFilter({
    this.name,
    this.value,
  });

  factory DescribePackagesFilter.fromJson(Map<String, dynamic> json) {
    return DescribePackagesFilter(
      name: (json['Name'] as String?)?.toDescribePackagesFilterName(),
      value: (json['Value'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

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
}

extension on DescribePackagesFilterName {
  String toValue() {
    switch (this) {
      case DescribePackagesFilterName.packageID:
        return 'PackageID';
      case DescribePackagesFilterName.packageName:
        return 'PackageName';
      case DescribePackagesFilterName.packageStatus:
        return 'PackageStatus';
    }
  }
}

extension on String {
  DescribePackagesFilterName toDescribePackagesFilterName() {
    switch (this) {
      case 'PackageID':
        return DescribePackagesFilterName.packageID;
      case 'PackageName':
        return DescribePackagesFilterName.packageName;
      case 'PackageStatus':
        return DescribePackagesFilterName.packageStatus;
    }
    throw Exception('$this is not known in enum DescribePackagesFilterName');
  }
}

/// Container for the response returned by the <code> <a>DescribePackages</a>
/// </code> operation.
class DescribePackagesResponse {
  final String? nextToken;

  /// List of <code>PackageDetails</code> objects.
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

/// Container for results from <code>DescribeReservedInstanceOfferings</code>
class DescribeReservedInstanceOfferingsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String? nextToken;

  /// List of reserved OpenSearch instance offerings
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
  /// Provides an identifier to allow retrieval of paginated results.
  final String? nextToken;

  /// List of reserved OpenSearch instances.
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

/// Container for the response returned by <code> <a>DissociatePackage</a>
/// </code> operation.
class DissociatePackageResponse {
  /// <code>DomainPackageDetails</code>
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

/// The configuration of a domain.
class DomainConfig {
  /// IAM access policy as a JSON-formatted string.
  final AccessPoliciesStatus? accessPolicies;

  /// The <code>AdvancedOptions</code> for the domain. See <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#createdomain-configure-advanced-options"
  /// target="_blank">Advanced options </a> for more information.
  final AdvancedOptionsStatus? advancedOptions;

  /// Specifies <code>AdvancedSecurityOptions</code> for the domain.
  final AdvancedSecurityOptionsStatus? advancedSecurityOptions;

  /// Specifies <code>AutoTuneOptions</code> for the domain.
  final AutoTuneOptionsStatus? autoTuneOptions;

  /// Specifies change details of the domain configuration change.
  final ChangeProgressDetails? changeProgressDetails;

  /// The <code>ClusterConfig</code> for the domain.
  final ClusterConfigStatus? clusterConfig;

  /// The <code>CognitoOptions</code> for the specified domain. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/cognito-auth.html"
  /// target="_blank">Configuring Amazon Cognito authentication for OpenSearch
  /// Dashboards</a>.
  final CognitoOptionsStatus? cognitoOptions;

  /// The <code>DomainEndpointOptions</code> for the domain.
  final DomainEndpointOptionsStatus? domainEndpointOptions;

  /// The <code>EBSOptions</code> for the domain.
  final EBSOptionsStatus? eBSOptions;

  /// The <code>EncryptionAtRestOptions</code> for the domain.
  final EncryptionAtRestOptionsStatus? encryptionAtRestOptions;

  /// String of format Elasticsearch_X.Y or OpenSearch_X.Y to specify the engine
  /// version for the OpenSearch or Elasticsearch domain.
  final VersionStatus? engineVersion;

  /// Log publishing options for the given domain.
  final LogPublishingOptionsStatus? logPublishingOptions;

  /// The <code>NodeToNodeEncryptionOptions</code> for the domain.
  final NodeToNodeEncryptionOptionsStatus? nodeToNodeEncryptionOptions;

  /// The <code>SnapshotOptions</code> for the domain.
  final SnapshotOptionsStatus? snapshotOptions;

  /// The <code>VPCOptions</code> for the specified domain. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html"
  /// target="_blank"> Launching your Amazon OpenSearch Service domains using a
  /// VPC</a>.
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
    this.logPublishingOptions,
    this.nodeToNodeEncryptionOptions,
    this.snapshotOptions,
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
      logPublishingOptions: json['LogPublishingOptions'] != null
          ? LogPublishingOptionsStatus.fromJson(
              json['LogPublishingOptions'] as Map<String, dynamic>)
          : null,
      nodeToNodeEncryptionOptions: json['NodeToNodeEncryptionOptions'] != null
          ? NodeToNodeEncryptionOptionsStatus.fromJson(
              json['NodeToNodeEncryptionOptions'] as Map<String, dynamic>)
          : null,
      snapshotOptions: json['SnapshotOptions'] != null
          ? SnapshotOptionsStatus.fromJson(
              json['SnapshotOptions'] as Map<String, dynamic>)
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
    final logPublishingOptions = this.logPublishingOptions;
    final nodeToNodeEncryptionOptions = this.nodeToNodeEncryptionOptions;
    final snapshotOptions = this.snapshotOptions;
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
      if (logPublishingOptions != null)
        'LogPublishingOptions': logPublishingOptions,
      if (nodeToNodeEncryptionOptions != null)
        'NodeToNodeEncryptionOptions': nodeToNodeEncryptionOptions,
      if (snapshotOptions != null) 'SnapshotOptions': snapshotOptions,
      if (vPCOptions != null) 'VPCOptions': vPCOptions,
    };
  }
}

/// Options to configure the endpoint for the domain.
class DomainEndpointOptions {
  /// The fully qualified domain for your custom endpoint.
  final String? customEndpoint;

  /// The ACM certificate ARN for your custom endpoint.
  final String? customEndpointCertificateArn;

  /// Whether to enable a custom endpoint for the domain.
  final bool? customEndpointEnabled;

  /// Whether only HTTPS endpoint should be enabled for the domain.
  final bool? enforceHTTPS;

  /// Specify the TLS security policy to apply to the HTTPS endpoint of the
  /// domain. <br/> Can be one of the following values:
  /// <ul>
  /// <li> <b>Policy-Min-TLS-1-0-2019-07:</b> TLS security policy which supports
  /// TLSv1.0 and higher. </li>
  /// <li> <b>Policy-Min-TLS-1-2-2019-07:</b> TLS security policy which supports
  /// only TLSv1.2 </li>
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

/// The configured endpoint options for the domain and their current status.
class DomainEndpointOptionsStatus {
  /// Options to configure the endpoint for the domain.
  final DomainEndpointOptions options;

  /// The status of the endpoint options for the domain. See
  /// <code>OptionStatus</code> for the status information that's included.
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

class DomainInfo {
  /// The <code>DomainName</code>.
  final String? domainName;

  /// Specifies the <code>EngineType</code> of the domain.
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

class DomainInformationContainer {
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

/// Information on a package associated with a domain.
class DomainPackageDetails {
  /// The name of the domain you've associated a package with.
  final String? domainName;

  /// State of the association. Values are ASSOCIATING, ASSOCIATION_FAILED,
  /// ACTIVE, DISSOCIATING, and DISSOCIATION_FAILED.
  final DomainPackageStatus? domainPackageStatus;

  /// Additional information if the package is in an error state. Null otherwise.
  final ErrorDetails? errorDetails;

  /// The timestamp of the most recent update to the package association status.
  final DateTime? lastUpdated;

  /// The internal ID of the package.
  final String? packageID;

  /// User-specified name of the package.
  final String? packageName;

  /// Currently supports only TXT-DICTIONARY.
  final PackageType? packageType;
  final String? packageVersion;

  /// The relative path on Amazon OpenSearch Service nodes, which can be used as
  /// synonym_path when the package is a synonym file.
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

extension on DomainPackageStatus {
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

extension on String {
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

/// The current status of a domain.
class DomainStatus {
  /// The Amazon Resource Name (ARN) of a domain. See <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html"
  /// target="_blank">IAM identifiers </a> in the <i>AWS Identity and Access
  /// Management User Guide</i> for more information.
  final String arn;

  /// The type and number of instances in the domain.
  final ClusterConfig clusterConfig;

  /// The unique identifier for the specified domain.
  final String domainId;

  /// The name of a domain. Domain names are unique across the domains owned by an
  /// account within an AWS region. Domain names start with a letter or number and
  /// can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).
  final String domainName;

  /// IAM access policy as a JSON-formatted string.
  final String? accessPolicies;

  /// The status of the <code>AdvancedOptions</code>.
  final Map<String, String>? advancedOptions;

  /// The current status of the domain's advanced security options.
  final AdvancedSecurityOptions? advancedSecurityOptions;

  /// The current status of the domain's Auto-Tune options.
  final AutoTuneOptionsOutput? autoTuneOptions;

  /// Specifies change details of the domain configuration change.
  final ChangeProgressDetails? changeProgressDetails;

  /// The <code>CognitoOptions</code> for the specified domain. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/cognito-auth.html"
  /// target="_blank">Configuring Amazon Cognito authentication for OpenSearch
  /// Dashboards</a>.
  final CognitoOptions? cognitoOptions;

  /// The domain creation status. <code>True</code> if the creation of a domain is
  /// complete. <code> False </code> if domain creation is still in progress.
  final bool? created;

  /// The domain deletion status. <code>True</code> if a delete request has been
  /// received for the domain but resource cleanup is still in progress.
  /// <code>False</code> if the domain has not been deleted. Once domain deletion
  /// is complete, the status of the domain is no longer returned.
  final bool? deleted;

  /// The current status of the domain's endpoint options.
  final DomainEndpointOptions? domainEndpointOptions;

  /// The <code>EBSOptions</code> for the specified domain.
  final EBSOptions? eBSOptions;

  /// The status of the <code>EncryptionAtRestOptions</code>.
  final EncryptionAtRestOptions? encryptionAtRestOptions;

  /// The domain endpoint that you use to submit index and search requests.
  final String? endpoint;

  /// Map containing the domain endpoints used to submit index and search
  /// requests. Example <code>key, value</code>:
  /// <code>'vpc','vpc-endpoint-h2dsd34efgyghrtguk5gt6j2foh4.us-east-1.es.amazonaws.com'</code>.
  final Map<String, String>? endpoints;
  final String? engineVersion;

  /// Log publishing options for the given domain.
  final Map<LogType, LogPublishingOption>? logPublishingOptions;

  /// The status of the <code>NodeToNodeEncryptionOptions</code>.
  final NodeToNodeEncryptionOptions? nodeToNodeEncryptionOptions;

  /// The status of the domain configuration. <code>True</code> if Amazon
  /// OpenSearch Service is processing configuration changes. <code>False</code>
  /// if the configuration is active.
  final bool? processing;

  /// The current status of the domain's service software.
  final ServiceSoftwareOptions? serviceSoftwareOptions;

  /// The status of the <code>SnapshotOptions</code>.
  final SnapshotOptions? snapshotOptions;

  /// The status of a domain version upgrade. <code>True</code> if Amazon
  /// OpenSearch Service is undergoing a version upgrade. <code>False</code> if
  /// the configuration is active.
  final bool? upgradeProcessing;

  /// The <code>VPCOptions</code> for the specified domain. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html"
  /// target="_blank"> Launching your Amazon OpenSearch Service domains using a
  /// VPC</a>.
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
    this.eBSOptions,
    this.encryptionAtRestOptions,
    this.endpoint,
    this.endpoints,
    this.engineVersion,
    this.logPublishingOptions,
    this.nodeToNodeEncryptionOptions,
    this.processing,
    this.serviceSoftwareOptions,
    this.snapshotOptions,
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
      eBSOptions: json['EBSOptions'] != null
          ? EBSOptions.fromJson(json['EBSOptions'] as Map<String, dynamic>)
          : null,
      encryptionAtRestOptions: json['EncryptionAtRestOptions'] != null
          ? EncryptionAtRestOptions.fromJson(
              json['EncryptionAtRestOptions'] as Map<String, dynamic>)
          : null,
      endpoint: json['Endpoint'] as String?,
      endpoints: (json['Endpoints'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      engineVersion: json['EngineVersion'] as String?,
      logPublishingOptions:
          (json['LogPublishingOptions'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(k.toLogType(),
                  LogPublishingOption.fromJson(e as Map<String, dynamic>))),
      nodeToNodeEncryptionOptions: json['NodeToNodeEncryptionOptions'] != null
          ? NodeToNodeEncryptionOptions.fromJson(
              json['NodeToNodeEncryptionOptions'] as Map<String, dynamic>)
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
    final eBSOptions = this.eBSOptions;
    final encryptionAtRestOptions = this.encryptionAtRestOptions;
    final endpoint = this.endpoint;
    final endpoints = this.endpoints;
    final engineVersion = this.engineVersion;
    final logPublishingOptions = this.logPublishingOptions;
    final nodeToNodeEncryptionOptions = this.nodeToNodeEncryptionOptions;
    final processing = this.processing;
    final serviceSoftwareOptions = this.serviceSoftwareOptions;
    final snapshotOptions = this.snapshotOptions;
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
      if (eBSOptions != null) 'EBSOptions': eBSOptions,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (endpoint != null) 'Endpoint': endpoint,
      if (endpoints != null) 'Endpoints': endpoints,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (logPublishingOptions != null)
        'LogPublishingOptions':
            logPublishingOptions.map((k, e) => MapEntry(k.toValue(), e)),
      if (nodeToNodeEncryptionOptions != null)
        'NodeToNodeEncryptionOptions': nodeToNodeEncryptionOptions,
      if (processing != null) 'Processing': processing,
      if (serviceSoftwareOptions != null)
        'ServiceSoftwareOptions': serviceSoftwareOptions,
      if (snapshotOptions != null) 'SnapshotOptions': snapshotOptions,
      if (upgradeProcessing != null) 'UpgradeProcessing': upgradeProcessing,
      if (vPCOptions != null) 'VPCOptions': vPCOptions,
    };
  }
}

class DryRunResults {
  /// Specifies the way in which Amazon OpenSearch Service applies the update.
  /// Possible responses are <code>Blue/Green</code> (the update requires a
  /// blue/green deployment), <code>DynamicUpdate</code> (no blue/green required),
  /// <code>Undetermined</code> (the domain is undergoing an update and can't
  /// predict the deployment type; try again after the update is complete), and
  /// <code>None</code> (the request doesn't include any configuration changes).
  final String? deploymentType;

  /// Contains an optional message associated with the DryRunResults.
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

/// The maintenance schedule duration: duration value and duration unit. See <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
/// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
/// information.
class Duration {
  /// The unit of a maintenance schedule duration. Valid value is HOURS. See <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
  /// information.
  final TimeUnit? unit;

  /// Integer to specify the value of a maintenance schedule duration. See <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
  /// information.
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

/// Options to enable, disable, and specify the properties of EBS storage
/// volumes.
class EBSOptions {
  /// Whether EBS-based storage is enabled.
  final bool? eBSEnabled;

  /// The IOPS for Provisioned IOPS And GP3 EBS volume (SSD).
  final int? iops;

  /// The Throughput for GP3 EBS volume (SSD).
  final int? throughput;

  /// Integer to specify the size of an EBS volume.
  final int? volumeSize;

  /// The volume type for EBS-based storage.
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

/// Status of the EBS options for the specified domain.
class EBSOptionsStatus {
  /// The EBS options for the specified domain.
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

/// Specifies encryption at rest options.
class EncryptionAtRestOptions {
  /// The option to enable encryption at rest.
  final bool? enabled;

  /// The KMS key ID for encryption at rest options.
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

/// Status of the encryption At Rest options for the specified domain.
class EncryptionAtRestOptionsStatus {
  /// The Encryption At Rest options for the specified domain.
  final EncryptionAtRestOptions options;

  /// The status of the Encryption At Rest options for the specified domain.
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

extension on EngineType {
  String toValue() {
    switch (this) {
      case EngineType.openSearch:
        return 'OpenSearch';
      case EngineType.elasticsearch:
        return 'Elasticsearch';
    }
  }
}

extension on String {
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

class ErrorDetails {
  final String? errorMessage;
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
/// cross-cluster connections. Multiple values can be specified per filter. A
/// cross-cluster connection must match at least one of the specified values for
/// it to be returned from an operation.
class Filter {
  /// The name of the filter.
  final String? name;

  /// Contains one or more values for the filter.
  final List<String>? values;

  Filter({
    this.name,
    this.values,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      name: json['Name'] as String?,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name,
      if (values != null) 'Values': values,
    };
  }
}

/// Container for the response returned by the <code>
/// <a>GetCompatibleVersions</a> </code> operation.
class GetCompatibleVersionsResponse {
  /// A map of compatible OpenSearch versions returned as part of the <code>
  /// <a>GetCompatibleVersions</a> </code> operation.
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

/// Container for response returned by <code> <a>GetPackageVersionHistory</a>
/// </code> operation.
class GetPackageVersionHistoryResponse {
  final String? nextToken;
  final String? packageID;

  /// List of <code>PackageVersionHistory</code> objects.
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

/// Container for the response returned by the <code> <a>GetUpgradeHistory</a>
/// </code> operation.
class GetUpgradeHistoryResponse {
  /// Pagination token that needs to be supplied to the next call to get the next
  /// page of results.
  final String? nextToken;

  /// A list of <code> <a>UpgradeHistory</a> </code> objects corresponding to each
  /// upgrade or upgrade eligibility check performed on a domain returned as part
  /// of the <code> <a>GetUpgradeHistoryResponse</a> </code> object.
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

/// Container for the response returned by the <code> <a>GetUpgradeStatus</a>
/// </code> operation.
class GetUpgradeStatusResponse {
  /// One of four statuses an upgrade have, returned as part of the <code>
  /// <a>GetUpgradeStatusResponse</a> </code> object. The status can take one of
  /// the following values:
  /// <ul>
  /// <li>In Progress</li>
  /// <li>Succeeded</li>
  /// <li>Succeeded with Issues</li>
  /// <li>Failed</li>
  /// </ul>
  final UpgradeStatus? stepStatus;

  /// A string that briefly describes the update.
  final String? upgradeName;

  /// One of three steps an upgrade or upgrade eligibility check goes through:
  /// <ul>
  /// <li>PreUpgradeCheck</li>
  /// <li>Snapshot</li>
  /// <li>Upgrade</li>
  /// </ul>
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

/// Details of an inbound connection.
class InboundConnection {
  /// The connection ID for the inbound cross-cluster connection.
  final String? connectionId;

  /// The <code> <a>InboundConnectionStatus</a> </code> for the outbound
  /// connection.
  final InboundConnectionStatus? connectionStatus;

  /// The <code> <a>AWSDomainInformation</a> </code> for the local OpenSearch
  /// domain.
  final DomainInformationContainer? localDomainInfo;

  /// The <code> <a>AWSDomainInformation</a> </code> for the remote OpenSearch
  /// domain.
  final DomainInformationContainer? remoteDomainInfo;

  InboundConnection({
    this.connectionId,
    this.connectionStatus,
    this.localDomainInfo,
    this.remoteDomainInfo,
  });

  factory InboundConnection.fromJson(Map<String, dynamic> json) {
    return InboundConnection(
      connectionId: json['ConnectionId'] as String?,
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
    final connectionStatus = this.connectionStatus;
    final localDomainInfo = this.localDomainInfo;
    final remoteDomainInfo = this.remoteDomainInfo;
    return {
      if (connectionId != null) 'ConnectionId': connectionId,
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (localDomainInfo != null) 'LocalDomainInfo': localDomainInfo,
      if (remoteDomainInfo != null) 'RemoteDomainInfo': remoteDomainInfo,
    };
  }
}

/// The connection status of an inbound cross-cluster connection.
class InboundConnectionStatus {
  /// Verbose information for the inbound connection status.
  final String? message;

  /// The state code for the inbound connection. Can be one of the following:
  ///
  /// <ul>
  /// <li>PENDING_ACCEPTANCE: Inbound connection is not yet accepted by the remote
  /// domain owner.</li>
  /// <li>APPROVED: Inbound connection is pending acceptance by the remote domain
  /// owner.</li>
  /// <li>PROVISIONING: Inbound connection provisioning is in progress.</li>
  /// <li>ACTIVE: Inbound connection is active and ready to use.</li>
  /// <li>REJECTING: Inbound connection rejection is in process.</li>
  /// <li>REJECTED: Inbound connection is rejected.</li>
  /// <li>DELETING: Inbound connection deletion is in progress.</li>
  /// <li>DELETED: Inbound connection is deleted and can no longer be used.</li>
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

extension on InboundConnectionStatusCode {
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

extension on String {
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

/// InstanceCountLimits represents the limits on the number of instances that
/// can be created in Amazon OpenSearch Service for a given InstanceType.
class InstanceCountLimits {
  final int? maximumInstanceCount;
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

/// InstanceLimits represents the list of instance-related attributes that are
/// available for a given InstanceType.
class InstanceLimits {
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

class InstanceTypeDetails {
  final bool? advancedSecurityEnabled;
  final bool? appLogsEnabled;
  final bool? cognitoEnabled;
  final bool? encryptionEnabled;
  final List<String>? instanceRole;
  final OpenSearchPartitionInstanceType? instanceType;
  final bool? warmEnabled;

  InstanceTypeDetails({
    this.advancedSecurityEnabled,
    this.appLogsEnabled,
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
    final cognitoEnabled = this.cognitoEnabled;
    final encryptionEnabled = this.encryptionEnabled;
    final instanceRole = this.instanceRole;
    final instanceType = this.instanceType;
    final warmEnabled = this.warmEnabled;
    return {
      if (advancedSecurityEnabled != null)
        'AdvancedSecurityEnabled': advancedSecurityEnabled,
      if (appLogsEnabled != null) 'AppLogsEnabled': appLogsEnabled,
      if (cognitoEnabled != null) 'CognitoEnabled': cognitoEnabled,
      if (encryptionEnabled != null) 'EncryptionEnabled': encryptionEnabled,
      if (instanceRole != null) 'InstanceRole': instanceRole,
      if (instanceType != null) 'InstanceType': instanceType.toValue(),
      if (warmEnabled != null) 'WarmEnabled': warmEnabled,
    };
  }
}

/// Limits for a given InstanceType and for each of its roles. <br/> Limits
/// contains the following: <code> <a>StorageTypes</a> </code>, <code>
/// <a>InstanceLimits</a> </code>, and <code> <a>AdditionalLimits</a> </code>
class Limits {
  /// List of additional limits that are specific to a given InstanceType and for
  /// each of its <code> <a>InstanceRole</a> </code> .
  final List<AdditionalLimit>? additionalLimits;
  final InstanceLimits? instanceLimits;

  /// Storage-related types and attributes that are available for a given
  /// InstanceType.
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

/// The result of a <code>ListDomainNames</code> operation. Contains the names
/// of all domains owned by this account and their respective engine types.
class ListDomainNamesResponse {
  /// List of domain names and respective engine types.
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

/// Container for the response parameters to the <code>
/// <a>ListDomainsForPackage</a> </code> operation.
class ListDomainsForPackageResponse {
  /// List of <code>DomainPackageDetails</code> objects.
  final List<DomainPackageDetails>? domainPackageDetailsList;
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
  final List<InstanceTypeDetails>? instanceTypeDetails;
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

/// Container for the response parameters to the <code>
/// <a>ListPackagesForDomain</a> </code> operation.
class ListPackagesForDomainResponse {
  /// List of <code>DomainPackageDetails</code> objects.
  final List<DomainPackageDetails>? domainPackageDetailsList;

  /// Pagination token to supply to the next call to get the next page of results.
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

/// The result of a <code>ListTags</code> operation. Contains tags for all
/// requested domains.
class ListTagsResponse {
  /// List of <code>Tag</code> for the requested domain.
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

/// Container for the parameters for response received from the <code>
/// <a>ListVersions</a> </code> operation.
class ListVersionsResponse {
  final String? nextToken;
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

/// Log Publishing option that is set for a given domain. <br/>Attributes and
/// their details:
/// <ul>
/// <li>CloudWatchLogsLogGroupArn: ARN of the Cloudwatch log group to publish
/// logs to.</li>
/// <li>Enabled: Whether the log publishing for a given log type is enabled or
/// not.</li>
/// </ul>
class LogPublishingOption {
  final String? cloudWatchLogsLogGroupArn;

  /// Whether the given log publishing option is enabled or not.
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

  /// The status of the log publishing options for the domain. See
  /// <code>OptionStatus</code> for the status information that's included.
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

/// Type of log file. Can be one of the following:
/// <ul>
/// <li>INDEX_SLOW_LOGS: Index slow logs contain insert requests that took more
/// time than configured index query log threshold to execute. </li>
/// <li>SEARCH_SLOW_LOGS: Search slow logs contain search queries that took more
/// time than configured search query log threshold to execute. </li>
/// <li>ES_APPLICATION_LOGS: OpenSearch application logs contain information
/// about errors and warnings raised during the operation of the service and can
/// be useful for troubleshooting. </li>
/// <li>AUDIT_LOGS: Audit logs contain records of user requests for access from
/// the domain.</li>
/// </ul>
enum LogType {
  indexSlowLogs,
  searchSlowLogs,
  esApplicationLogs,
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
  }
}

extension on String {
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

/// Credentials for the master user: username and password, ARN, or both.
class MasterUserOptions {
  /// ARN for the master user (if IAM is enabled).
  final String? masterUserARN;

  /// The master user's username, which is stored in the Amazon OpenSearch Service
  /// domain's internal database.
  final String? masterUserName;

  /// The master user's password, which is stored in the Amazon OpenSearch Service
  /// domain's internal database.
  final String? masterUserPassword;

  MasterUserOptions({
    this.masterUserARN,
    this.masterUserName,
    this.masterUserPassword,
  });

  factory MasterUserOptions.fromJson(Map<String, dynamic> json) {
    return MasterUserOptions(
      masterUserARN: json['MasterUserARN'] as String?,
      masterUserName: json['MasterUserName'] as String?,
      masterUserPassword: json['MasterUserPassword'] as String?,
    );
  }

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

/// The node-to-node encryption options.
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

extension on OpenSearchPartitionInstanceType {
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

extension on String {
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

extension on OpenSearchWarmPartitionInstanceType {
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

extension on String {
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

/// The state of a requested change. One of the following:
///
/// <ul>
/// <li>Processing: The request change is still in progress.</li>
/// <li>Active: The request change is processed and deployed to the domain.</li>
/// </ul>
enum OptionState {
  requiresIndexDocuments,
  processing,
  active,
}

extension on OptionState {
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

extension on String {
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

/// Provides the current status of the entity.
class OptionStatus {
  /// The timestamp of when the entity was created.
  final DateTime creationDate;

  /// Provides the <code>OptionState</code> for the domain.
  final OptionState state;

  /// The timestamp of the last time the entity was updated.
  final DateTime updateDate;

  /// Indicates whether the domain is being deleted.
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

/// Specifies details about an outbound connection.
class OutboundConnection {
  /// The connection alias for the outbound cross-cluster connection.
  final String? connectionAlias;

  /// The connection ID for the outbound cross-cluster connection.
  final String? connectionId;

  /// The <code> <a>OutboundConnectionStatus</a> </code> for the outbound
  /// connection.
  final OutboundConnectionStatus? connectionStatus;

  /// The <code> <a>DomainInformation</a> </code> for the local OpenSearch domain.
  final DomainInformationContainer? localDomainInfo;

  /// The <code> <a>DomainInformation</a> </code> for the remote OpenSearch
  /// domain.
  final DomainInformationContainer? remoteDomainInfo;

  OutboundConnection({
    this.connectionAlias,
    this.connectionId,
    this.connectionStatus,
    this.localDomainInfo,
    this.remoteDomainInfo,
  });

  factory OutboundConnection.fromJson(Map<String, dynamic> json) {
    return OutboundConnection(
      connectionAlias: json['ConnectionAlias'] as String?,
      connectionId: json['ConnectionId'] as String?,
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
    final connectionStatus = this.connectionStatus;
    final localDomainInfo = this.localDomainInfo;
    final remoteDomainInfo = this.remoteDomainInfo;
    return {
      if (connectionAlias != null) 'ConnectionAlias': connectionAlias,
      if (connectionId != null) 'ConnectionId': connectionId,
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (localDomainInfo != null) 'LocalDomainInfo': localDomainInfo,
      if (remoteDomainInfo != null) 'RemoteDomainInfo': remoteDomainInfo,
    };
  }
}

/// The connection status of an outbound cross-cluster connection.
class OutboundConnectionStatus {
  /// Verbose information for the outbound connection status.
  final String? message;

  /// The state code for the outbound connection. Can be one of the following:
  ///
  /// <ul>
  /// <li>VALIDATING: The outbound connection request is being validated.</li>
  /// <li>VALIDATION_FAILED: Validation failed for the connection request.</li>
  /// <li>PENDING_ACCEPTANCE: Outbound connection request is validated and is not
  /// yet accepted by the remote domain owner. </li>
  /// <li>APPROVED: Outbound connection has been approved by the remote domain
  /// owner for getting provisioned.</li>
  /// <li>PROVISIONING: Outbound connection request is in process.</li>
  /// <li>ACTIVE: Outbound connection is active and ready to use.</li>
  /// <li>REJECTING: Outbound connection rejection by remote domain owner is in
  /// progress.</li>
  /// <li>REJECTED: Outbound connection request is rejected by remote domain
  /// owner.</li>
  /// <li>DELETING: Outbound connection deletion is in progress.</li>
  /// <li>DELETED: Outbound connection is deleted and can no longer be used.</li>
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

extension on OutboundConnectionStatusCode {
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

extension on String {
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

extension on OverallChangeStatus {
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

extension on String {
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
  final String? availablePackageVersion;

  /// The timestamp of when the package was created.
  final DateTime? createdAt;

  /// Additional information if the package is in an error state. Null otherwise.
  final ErrorDetails? errorDetails;
  final DateTime? lastUpdatedAt;

  /// User-specified description of the package.
  final String? packageDescription;

  /// Internal ID of the package.
  final String? packageID;

  /// User-specified name of the package.
  final String? packageName;

  /// Current state of the package. Values are COPYING, COPY_FAILED, AVAILABLE,
  /// DELETING, and DELETE_FAILED.
  final PackageStatus? packageStatus;

  /// Currently supports only TXT-DICTIONARY.
  final PackageType? packageType;

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

  factory PackageDetails.fromJson(Map<String, dynamic> json) {
    return PackageDetails(
      availablePackageVersion: json['AvailablePackageVersion'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
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
    final createdAt = this.createdAt;
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
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
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

/// The Amazon S3 location for importing the package specified as
/// <code>S3BucketName</code> and <code>S3Key</code>
class PackageSource {
  /// The name of the Amazon S3 bucket containing the package.
  final String? s3BucketName;

  /// Key (file name) of the package.
  final String? s3Key;

  PackageSource({
    this.s3BucketName,
    this.s3Key,
  });

  factory PackageSource.fromJson(Map<String, dynamic> json) {
    return PackageSource(
      s3BucketName: json['S3BucketName'] as String?,
      s3Key: json['S3Key'] as String?,
    );
  }

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

extension on PackageStatus {
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

extension on String {
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
}

extension on PackageType {
  String toValue() {
    switch (this) {
      case PackageType.txtDictionary:
        return 'TXT-DICTIONARY';
    }
  }
}

extension on String {
  PackageType toPackageType() {
    switch (this) {
      case 'TXT-DICTIONARY':
        return PackageType.txtDictionary;
    }
    throw Exception('$this is not known in enum PackageType');
  }
}

/// Details of a package version.
class PackageVersionHistory {
  /// A message associated with the package version.
  final String? commitMessage;

  /// The timestamp of when the package was created.
  final DateTime? createdAt;

  /// The package version.
  final String? packageVersion;

  PackageVersionHistory({
    this.commitMessage,
    this.createdAt,
    this.packageVersion,
  });

  factory PackageVersionHistory.fromJson(Map<String, dynamic> json) {
    return PackageVersionHistory(
      commitMessage: json['CommitMessage'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      packageVersion: json['PackageVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitMessage = this.commitMessage;
    final createdAt = this.createdAt;
    final packageVersion = this.packageVersion;
    return {
      if (commitMessage != null) 'CommitMessage': commitMessage,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (packageVersion != null) 'PackageVersion': packageVersion,
    };
  }
}

/// Represents the output of a <code>PurchaseReservedInstanceOffering</code>
/// operation.
class PurchaseReservedInstanceOfferingResponse {
  /// The customer-specified identifier used to track this reservation.
  final String? reservationName;

  /// Details of the reserved OpenSearch instance which was purchased.
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

/// Contains the specific price and frequency of a recurring charges for a
/// reserved OpenSearch instance, or for a reserved OpenSearch instance
/// offering.
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

/// The result of a <code> <a>RejectInboundConnection</a> </code> operation.
/// Contains details about the rejected inbound connection.
class RejectInboundConnectionResponse {
  /// The <code> <a>InboundConnection</a> </code> of the rejected inbound
  /// connection.
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

/// Details of a reserved OpenSearch instance.
class ReservedInstance {
  final int? billingSubscriptionId;

  /// The currency code for the reserved OpenSearch instance offering.
  final String? currencyCode;

  /// The duration, in seconds, for which the OpenSearch instance is reserved.
  final int? duration;

  /// The upfront fixed charge you will paid to purchase the specific reserved
  /// OpenSearch instance offering.
  final double? fixedPrice;

  /// The number of OpenSearch instances that have been reserved.
  final int? instanceCount;

  /// The OpenSearch instance type offered by the reserved instance offering.
  final OpenSearchPartitionInstanceType? instanceType;

  /// The payment option as defined in the reserved OpenSearch instance offering.
  final ReservedInstancePaymentOption? paymentOption;

  /// The charge to your account regardless of whether you are creating any
  /// domains using the instance offering.
  final List<RecurringCharge>? recurringCharges;

  /// The customer-specified identifier to track this reservation.
  final String? reservationName;

  /// The unique identifier for the reservation.
  final String? reservedInstanceId;

  /// The offering identifier.
  final String? reservedInstanceOfferingId;

  /// The time the reservation started.
  final DateTime? startTime;

  /// The state of the reserved OpenSearch instance.
  final String? state;

  /// The rate you are charged for each hour for the domain that is using this
  /// reserved instance.
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

/// Details of a reserved OpenSearch instance offering.
class ReservedInstanceOffering {
  /// The currency code for the reserved OpenSearch instance offering.
  final String? currencyCode;

  /// The duration, in seconds, for which the offering will reserve the OpenSearch
  /// instance.
  final int? duration;

  /// The upfront fixed charge you will pay to purchase the specific reserved
  /// OpenSearch instance offering.
  final double? fixedPrice;

  /// The OpenSearch instance type offered by the reserved instance offering.
  final OpenSearchPartitionInstanceType? instanceType;

  /// Payment option for the reserved OpenSearch instance offering
  final ReservedInstancePaymentOption? paymentOption;

  /// The charge to your account regardless of whether you are creating any
  /// domains using the instance offering.
  final List<RecurringCharge>? recurringCharges;

  /// The OpenSearch reserved instance offering identifier.
  final String? reservedInstanceOfferingId;

  /// The rate you are charged for each hour the domain that is using the offering
  /// is running.
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

extension on ReservedInstancePaymentOption {
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

extension on String {
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

/// The rollback state while disabling Auto-Tune for the domain. Valid values
/// are NO_ROLLBACK and DEFAULT_ROLLBACK.
enum RollbackOnDisable {
  noRollback,
  defaultRollback,
}

extension on RollbackOnDisable {
  String toValue() {
    switch (this) {
      case RollbackOnDisable.noRollback:
        return 'NO_ROLLBACK';
      case RollbackOnDisable.defaultRollback:
        return 'DEFAULT_ROLLBACK';
    }
  }
}

extension on String {
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

/// The SAML identity povider's information.
class SAMLIdp {
  /// The unique entity ID of the application in SAML identity provider.
  final String entityId;

  /// The metadata of the SAML application in XML format.
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

/// The SAML application configuration for the domain.
class SAMLOptionsInput {
  /// True if SAML is enabled.
  final bool? enabled;

  /// The SAML Identity Provider's information.
  final SAMLIdp? idp;

  /// The backend role that the SAML master user is mapped to.
  final String? masterBackendRole;

  /// The SAML master username, which is stored in the Amazon OpenSearch Service
  /// domain's internal database.
  final String? masterUserName;

  /// Element of the SAML assertion to use for backend roles. Default is roles.
  final String? rolesKey;

  /// The duration, in minutes, after which a user session becomes inactive.
  /// Acceptable values are between 1 and 1440, and the default value is 60.
  final int? sessionTimeoutMinutes;

  /// Element of the SAML assertion to use for username. Default is NameID.
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

  factory SAMLOptionsInput.fromJson(Map<String, dynamic> json) {
    return SAMLOptionsInput(
      enabled: json['Enabled'] as bool?,
      idp: json['Idp'] != null
          ? SAMLIdp.fromJson(json['Idp'] as Map<String, dynamic>)
          : null,
      masterBackendRole: json['MasterBackendRole'] as String?,
      masterUserName: json['MasterUserName'] as String?,
      rolesKey: json['RolesKey'] as String?,
      sessionTimeoutMinutes: json['SessionTimeoutMinutes'] as int?,
      subjectKey: json['SubjectKey'] as String?,
    );
  }

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

/// The Auto-Tune action type. Valid values are JVM_HEAP_SIZE_TUNING, and
/// JVM_YOUNG_GEN_TUNING.
enum ScheduledAutoTuneActionType {
  jvmHeapSizeTuning,
  jvmYoungGenTuning,
}

extension on ScheduledAutoTuneActionType {
  String toValue() {
    switch (this) {
      case ScheduledAutoTuneActionType.jvmHeapSizeTuning:
        return 'JVM_HEAP_SIZE_TUNING';
      case ScheduledAutoTuneActionType.jvmYoungGenTuning:
        return 'JVM_YOUNG_GEN_TUNING';
    }
  }
}

extension on String {
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

/// Specifies details about the scheduled Auto-Tune action. See <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
/// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
/// information.
class ScheduledAutoTuneDetails {
  /// The Auto-Tune action description.
  final String? action;

  /// The Auto-Tune action type. Valid values are JVM_HEAP_SIZE_TUNING and
  /// JVM_YOUNG_GEN_TUNING.
  final ScheduledAutoTuneActionType? actionType;

  /// The timestamp of the Auto-Tune action scheduled for the domain.
  final DateTime? date;

  /// The Auto-Tune action severity. Valid values are LOW, MEDIUM, and HIGH.
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

/// The Auto-Tune action severity. Valid values are LOW, MEDIUM, and HIGH.
enum ScheduledAutoTuneSeverityType {
  low,
  medium,
  high,
}

extension on ScheduledAutoTuneSeverityType {
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

extension on String {
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

/// The current options of an domain service software options.
class ServiceSoftwareOptions {
  /// The timestamp, in Epoch time, until which you can manually request a service
  /// software update. After this date, we automatically update your service
  /// software.
  final DateTime? automatedUpdateDate;

  /// <code>True</code> if you're able to cancel your service software version
  /// update. <code>False</code> if you can't cancel your service software update.
  final bool? cancellable;

  /// The current service software version present on the domain.
  final String? currentVersion;

  /// The description of the <code>UpdateStatus</code>.
  final String? description;

  /// The new service software version if one is available.
  final String? newVersion;

  /// <code>True</code> if a service software is never automatically updated.
  /// <code>False</code> if a service software is automatically updated after
  /// <code>AutomatedUpdateDate</code>.
  final bool? optionalDeployment;

  /// <code>True</code> if you're able to update your service software version.
  /// <code>False</code> if you can't update your service software version.
  final bool? updateAvailable;

  /// The status of your service software update. This field can take the
  /// following values: <code> ELIGIBLE</code>, <code>PENDING_UPDATE</code>,
  /// <code>IN_PROGRESS</code>, <code>COMPLETED</code>, and <code>
  /// NOT_ELIGIBLE</code>.
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

/// The time, in UTC format, when the service takes a daily automated snapshot
/// of the specified domain. Default is <code>0</code> hours.
class SnapshotOptions {
  /// The time, in UTC format, when the service takes a daily automated snapshot
  /// of the specified domain. Default is <code>0</code> hours.
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

/// Status of a daily automated snapshot.
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

/// The result of a <code>StartServiceSoftwareUpdate</code> operation. Contains
/// the status of the update.
class StartServiceSoftwareUpdateResponse {
  /// The current status of the OpenSearch service software update.
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

/// StorageTypes represents the list of storage-related types and their
/// attributes that are available for a given InstanceType.
class StorageType {
  final String? storageSubTypeName;

  /// Limits that are applicable for the given storage type.
  final List<StorageTypeLimit>? storageTypeLimits;
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

/// Limits that are applicable for the given storage type.
class StorageTypeLimit {
  /// Name of storage limits that are applicable for the given storage type. If
  /// <code> <a>StorageType</a> </code> is "ebs", the following storage options
  /// are applicable: <ol>
  /// <li>MinimumVolumeSize</li> Minimum amount of volume size that is applicable
  /// for the given storage type. Can be empty if not applicable.
  /// <li>MaximumVolumeSize</li> Maximum amount of volume size that is applicable
  /// for the given storage type. Can be empty if not applicable.
  /// <li>MaximumIops</li> Maximum amount of Iops that is applicable for given the
  /// storage type. Can be empty if not applicable.
  /// <li>MinimumIops</li> Minimum amount of Iops that is applicable for given the
  /// storage type. Can be empty if not applicable.
  /// <li>MaximumThroughput</li> Maximum amount of Throughput that is applicable
  /// for given the storage type. Can be empty if not applicable.
  /// <li>MinimumThroughput</li> Minimum amount of Throughput that is applicable
  /// for given the storage type. Can be empty if not applicable. </ol>
  final String? limitName;

  /// Values for the <code> <a>StorageTypeLimit$LimitName</a> </code> .
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
}

extension on TLSSecurityPolicy {
  String toValue() {
    switch (this) {
      case TLSSecurityPolicy.policyMinTls_1_0_2019_07:
        return 'Policy-Min-TLS-1-0-2019-07';
      case TLSSecurityPolicy.policyMinTls_1_2_2019_07:
        return 'Policy-Min-TLS-1-2-2019-07';
    }
  }
}

extension on String {
  TLSSecurityPolicy toTLSSecurityPolicy() {
    switch (this) {
      case 'Policy-Min-TLS-1-0-2019-07':
        return TLSSecurityPolicy.policyMinTls_1_0_2019_07;
      case 'Policy-Min-TLS-1-2-2019-07':
        return TLSSecurityPolicy.policyMinTls_1_2_2019_07;
    }
    throw Exception('$this is not known in enum TLSSecurityPolicy');
  }
}

/// A key value pair for a resource tag.
class Tag {
  /// The <code>TagKey</code>, the name of the tag. Tag keys must be unique for
  /// the domain to which they are attached.
  final String key;

  /// The <code>TagValue</code>, the value assigned to the corresponding tag key.
  /// Tag values can be null and don't have to be unique in a tag set. For
  /// example, you can have a key value pair in a tag set of <code>project :
  /// Trinity</code> and <code>cost-center : Trinity</code>
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

/// The unit of a maintenance schedule duration. Valid value is HOUR. See <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/auto-tune.html"
/// target="_blank"> Auto-Tune for Amazon OpenSearch Service </a> for more
/// information.
enum TimeUnit {
  hours,
}

extension on TimeUnit {
  String toValue() {
    switch (this) {
      case TimeUnit.hours:
        return 'HOURS';
    }
  }
}

extension on String {
  TimeUnit toTimeUnit() {
    switch (this) {
      case 'HOURS':
        return TimeUnit.hours;
    }
    throw Exception('$this is not known in enum TimeUnit');
  }
}

/// The result of an <code>UpdateDomain</code> request. Contains the status of
/// the domain being updated.
class UpdateDomainConfigResponse {
  /// The status of the updated domain.
  final DomainConfig domainConfig;

  /// Contains result of DryRun.
  final DryRunResults? dryRunResults;

  UpdateDomainConfigResponse({
    required this.domainConfig,
    this.dryRunResults,
  });

  factory UpdateDomainConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainConfigResponse(
      domainConfig:
          DomainConfig.fromJson(json['DomainConfig'] as Map<String, dynamic>),
      dryRunResults: json['DryRunResults'] != null
          ? DryRunResults.fromJson(
              json['DryRunResults'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainConfig = this.domainConfig;
    final dryRunResults = this.dryRunResults;
    return {
      'DomainConfig': domainConfig,
      if (dryRunResults != null) 'DryRunResults': dryRunResults,
    };
  }
}

/// Container for the response returned by the <code> <a>UpdatePackage</a>
/// </code> operation.
class UpdatePackageResponse {
  /// Information about the package.
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

/// Container for response returned by <code> <a>UpgradeDomain</a> </code>
/// operation.
class UpgradeDomainResponse {
  final Map<String, String>? advancedOptions;
  final ChangeProgressDetails? changeProgressDetails;
  final String? domainName;

  /// When true, indicates that an upgrade eligibility check needs to be
  /// performed. Does not actually perform the upgrade.
  final bool? performCheckOnly;

  /// The version of OpenSearch that you intend to upgrade the domain to.
  final String? targetVersion;
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

/// History of the last 10 upgrades and upgrade eligibility checks.
class UpgradeHistory {
  /// UTC timestamp at which the upgrade API call was made in
  /// "yyyy-MM-ddTHH:mm:ssZ" format.
  final DateTime? startTimestamp;

  /// A list of <code> <a>UpgradeStepItem</a> </code> s representing information
  /// about each step performed as part of a specific upgrade or upgrade
  /// eligibility check.
  final List<UpgradeStepItem>? stepsList;

  /// A string that briefly describes the upgrade.
  final String? upgradeName;

  /// The current status of the upgrade. The status can take one of the following
  /// values:
  /// <ul>
  /// <li>In Progress</li>
  /// <li>Succeeded</li>
  /// <li>Succeeded with Issues</li>
  /// <li>Failed</li>
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

extension on UpgradeStatus {
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

extension on String {
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

extension on UpgradeStep {
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

extension on String {
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

/// Represents a single step of the upgrade or upgrade eligibility check
/// workflow.
class UpgradeStepItem {
  /// A list of strings containing detailed information about the errors
  /// encountered in a particular step.
  final List<String>? issues;

  /// The floating point value representing the progress percentage of a
  /// particular step.
  final double? progressPercent;

  /// One of three steps an upgrade or upgrade eligibility check goes through:
  /// <ul>
  /// <li>PreUpgradeCheck</li>
  /// <li>Snapshot</li>
  /// <li>Upgrade</li>
  /// </ul>
  final UpgradeStep? upgradeStep;

  /// The current status of the upgrade. The status can take one of the following
  /// values:
  /// <ul>
  /// <li>In Progress</li>
  /// <li>Succeeded</li>
  /// <li>Succeeded with Issues</li>
  /// <li>Failed</li>
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

/// Options to specify the subnets and security groups for the VPC endpoint. For
/// more information, see <a
/// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html"
/// target="_blank"> Launching your Amazon OpenSearch Service domains using a
/// VPC</a>.
class VPCDerivedInfo {
  /// The Availability Zones for the domain. Exists only if the domain was created
  /// with <code>VPCOptions</code>.
  final List<String>? availabilityZones;

  /// The security groups for the VPC endpoint.
  final List<String>? securityGroupIds;

  /// The subnets for the VPC endpoint.
  final List<String>? subnetIds;

  /// The VPC ID for the domain. Exists only if the domain was created with
  /// <code>VPCOptions</code>.
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

/// Status of the VPC options for the specified domain.
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

/// Options to specify the subnets and security groups for the VPC endpoint. For
/// more information, see <a
/// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/vpc.html"
/// target="_blank"> Launching your Amazon OpenSearch Service domains using a
/// VPC</a>.
class VPCOptions {
  /// The security groups for the VPC endpoint.
  final List<String>? securityGroupIds;

  /// The subnets for the VPC endpoint.
  final List<String>? subnetIds;

  VPCOptions({
    this.securityGroupIds,
    this.subnetIds,
  });

  factory VPCOptions.fromJson(Map<String, dynamic> json) {
    return VPCOptions(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

/// The status of the OpenSearch version options for the specified OpenSearch
/// domain.
class VersionStatus {
  /// The OpenSearch version for the specified OpenSearch domain.
  final String options;

  /// The status of the OpenSearch version options for the specified OpenSearch
  /// domain.
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

/// The type of EBS volume, standard, gp2, gp3 or io1. See <a
/// href="http://docs.aws.amazon.com/opensearch-service/latest/developerguide/opensearch-createupdatedomains.html#opensearch-createdomain-configure-ebs"
/// target="_blank">Configuring EBS-based Storage</a> for more information.
enum VolumeType {
  standard,
  gp2,
  io1,
  gp3,
}

extension on VolumeType {
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

extension on String {
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

/// The zone awareness configuration for the domain cluster, such as the number
/// of availability zones.
class ZoneAwarenessConfig {
  /// An integer value to indicate the number of availability zones for a domain
  /// when zone awareness is enabled. This should be equal to number of subnets if
  /// VPC endpoints is enabled.
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
