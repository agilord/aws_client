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

/// Use the Amazon Elasticsearch Configuration API to create, configure, and
/// manage Elasticsearch domains.
class Elasticsearch {
  final _s.RestJsonProtocol _protocol;
  Elasticsearch({
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
    required String crossClusterSearchConnectionId,
  }) async {
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
    required String domainName,
    required String packageID,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2015-01-01/packages/associate/${Uri.encodeComponent(packageID)}/${Uri.encodeComponent(domainName)}',
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
  /// The account ID to grant access to.
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
          '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}/authorizeVpcEndpointAccess',
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
  /// Parameter [domainName] :
  /// Name of the OpenSearch Service domain configuration request to cancel.
  ///
  /// Parameter [dryRun] :
  /// When set to <b>True</b>, returns the list of change IDs and properties
  /// that will be cancelled without actually cancelling the change.
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
          '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}/config/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelDomainConfigChangeResponse.fromJson(response);
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
    required String domainName,
  }) async {
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
  /// Parameter [autoTuneOptions] :
  /// Specifies Auto-Tune options.
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
  /// Parameter [tagList] :
  /// A list of <code>Tag</code> added during domain creation.
  ///
  /// Parameter [vPCOptions] :
  /// Options to specify the subnets and security groups for VPC endpoint. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-creating-vpc"
  /// target="_blank">Creating a VPC</a> in <i>VPC Endpoints for Amazon
  /// Elasticsearch Service Domains</i>
  Future<CreateElasticsearchDomainResponse> createElasticsearchDomain({
    required String domainName,
    String? accessPolicies,
    Map<String, String>? advancedOptions,
    AdvancedSecurityOptionsInput? advancedSecurityOptions,
    AutoTuneOptionsInput? autoTuneOptions,
    CognitoOptions? cognitoOptions,
    DomainEndpointOptions? domainEndpointOptions,
    EBSOptions? eBSOptions,
    ElasticsearchClusterConfig? elasticsearchClusterConfig,
    String? elasticsearchVersion,
    EncryptionAtRestOptions? encryptionAtRestOptions,
    Map<LogType, LogPublishingOption>? logPublishingOptions,
    NodeToNodeEncryptionOptions? nodeToNodeEncryptionOptions,
    SnapshotOptions? snapshotOptions,
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
      if (tagList != null) 'TagList': tagList,
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
    required String connectionAlias,
    required DomainInformation destinationDomainInfo,
    required DomainInformation sourceDomainInfo,
  }) async {
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
      requestUri: '/2015-01-01/packages',
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
  /// The Amazon Resource Name (ARN) of the domain to grant access to.
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
      requestUri: '/2015-01-01/es/vpcEndpoints',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVpcEndpointResponse.fromJson(response);
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
    required String domainName,
  }) async {
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
    required String crossClusterSearchConnectionId,
  }) async {
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
    required String crossClusterSearchConnectionId,
  }) async {
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
    required String packageID,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2015-01-01/packages/${Uri.encodeComponent(packageID)}',
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
  /// The unique identifier of the endpoint to be deleted.
  Future<DeleteVpcEndpointResponse> deleteVpcEndpoint({
    required String vpcEndpointId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-01-01/es/vpcEndpoints/${Uri.encodeComponent(vpcEndpointId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteVpcEndpointResponse.fromJson(response);
  }

  /// Provides scheduled Auto-Tune action details for the Elasticsearch domain,
  /// such as Auto-Tune action type, description, severity, and scheduled date.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// Specifies the domain name for which you want Auto-Tune action details.
  ///
  /// Parameter [maxResults] :
  /// Set this value to limit the number of results returned. If not specified,
  /// defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// NextToken is sent in case the earlier API call results contain the
  /// NextToken. It is used for pagination.
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
          '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}/autoTunes',
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
    final $query = <String, List<String>>{
      if (changeId != null) 'changeid': [changeId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}/progress',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainChangeProgressResponse.fromJson(response);
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
    required String domainName,
  }) async {
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
    required String domainName,
  }) async {
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
    required List<String> domainNames,
  }) async {
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
    required String elasticsearchVersion,
    required ESPartitionInstanceType instanceType,
    String? domainName,
  }) async {
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
    int? maxResults,
    String? nextToken,
    String? reservedElasticsearchInstanceOfferingId,
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
    int? maxResults,
    String? nextToken,
    String? reservedElasticsearchInstanceId,
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
      requestUri: '/2015-01-01/es/vpcEndpoints/describe',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVpcEndpointsResponse.fromJson(response);
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
    required String domainName,
    required String packageID,
  }) async {
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
    String? domainName,
  }) async {
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
    required String domainName,
  }) async {
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
      requestUri: '/2015-01-01/domain',
      queryParams: $query,
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
    required String elasticsearchVersion,
    String? domainName,
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
    required String arn,
  }) async {
    final $query = <String, List<String>>{
      'arn': [arn],
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

  /// Retrieves information about each principal that is allowed to access a
  /// given Amazon OpenSearch Service domain through the use of an interface VPC
  /// endpoint.
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
  /// Provides an identifier to allow retrieval of paginated results.
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
          '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}/listVpcEndpointAccess',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVpcEndpointAccessResponse.fromJson(response);
  }

  /// Retrieves all Amazon OpenSearch Service-managed VPC endpoints in the
  /// current account and Region.
  ///
  /// May throw [InternalException].
  /// May throw [DisabledOperationException].
  /// May throw [BaseException].
  ///
  /// Parameter [nextToken] :
  /// Identifier to allow retrieval of paginated results.
  Future<ListVpcEndpointsResponse> listVpcEndpoints({
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-01-01/es/vpcEndpoints',
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
  /// Name of the ElasticSearch domain whose VPC endpoints are to be listed.
  ///
  /// Parameter [nextToken] :
  /// Provides an identifier to allow retrieval of paginated results.
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
          '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}/vpcEndpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVpcEndpointsForDomainResponse.fromJson(response);
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
    required String reservationName,
    required String reservedElasticsearchInstanceOfferingId,
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
    required String crossClusterSearchConnectionId,
  }) async {
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
      requestUri: '/2015-01-01/tags-removal',
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
          '/2015-01-01/es/domain/${Uri.encodeComponent(domainName)}/revokeVpcEndpointAccess',
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
    required String domainName,
  }) async {
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
  /// Parameter [autoTuneOptions] :
  /// Specifies Auto-Tune options.
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
  /// Parameter [dryRun] :
  /// This flag, when set to True, specifies whether the
  /// <code>UpdateElasticsearchDomain</code> request should return the results
  /// of validation checks without actually applying the change. This flag, when
  /// set to True, specifies the deployment mechanism through which the update
  /// shall be applied on the domain. This will not actually perform the Update.
  ///
  /// Parameter [eBSOptions] :
  /// Specify the type and size of the EBS volume that you want to use.
  ///
  /// Parameter [elasticsearchClusterConfig] :
  /// The type and number of instances to instantiate for the domain cluster.
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
    required String domainName,
    String? accessPolicies,
    Map<String, String>? advancedOptions,
    AdvancedSecurityOptionsInput? advancedSecurityOptions,
    AutoTuneOptions? autoTuneOptions,
    CognitoOptions? cognitoOptions,
    DomainEndpointOptions? domainEndpointOptions,
    bool? dryRun,
    EBSOptions? eBSOptions,
    ElasticsearchClusterConfig? elasticsearchClusterConfig,
    EncryptionAtRestOptions? encryptionAtRestOptions,
    Map<LogType, LogPublishingOption>? logPublishingOptions,
    NodeToNodeEncryptionOptions? nodeToNodeEncryptionOptions,
    SnapshotOptions? snapshotOptions,
    VPCOptions? vPCOptions,
  }) async {
    final $payload = <String, dynamic>{
      if (accessPolicies != null) 'AccessPolicies': accessPolicies,
      if (advancedOptions != null) 'AdvancedOptions': advancedOptions,
      if (advancedSecurityOptions != null)
        'AdvancedSecurityOptions': advancedSecurityOptions,
      if (autoTuneOptions != null) 'AutoTuneOptions': autoTuneOptions,
      if (cognitoOptions != null) 'CognitoOptions': cognitoOptions,
      if (domainEndpointOptions != null)
        'DomainEndpointOptions': domainEndpointOptions,
      if (dryRun != null) 'DryRun': dryRun,
      if (eBSOptions != null) 'EBSOptions': eBSOptions,
      if (elasticsearchClusterConfig != null)
        'ElasticsearchClusterConfig': elasticsearchClusterConfig,
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
      requestUri: '/2015-01-01/packages/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePackageResponse.fromJson(response);
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
  /// Unique identifier of the VPC endpoint to be updated.
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
      requestUri: '/2015-01-01/es/vpcEndpoints/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVpcEndpointResponse.fromJson(response);
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
    required String domainName,
    required String targetVersion,
    bool? performCheckOnly,
  }) async {
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
class AcceptInboundCrossClusterSearchConnectionResponse {
  /// Specifies the <code><a>InboundCrossClusterSearchConnection</a></code> of
  /// accepted inbound connection.
  final InboundCrossClusterSearchConnection? crossClusterSearchConnection;

  AcceptInboundCrossClusterSearchConnectionResponse({
    this.crossClusterSearchConnection,
  });

  factory AcceptInboundCrossClusterSearchConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return AcceptInboundCrossClusterSearchConnectionResponse(
      crossClusterSearchConnection: json['CrossClusterSearchConnection'] != null
          ? InboundCrossClusterSearchConnection.fromJson(
              json['CrossClusterSearchConnection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final crossClusterSearchConnection = this.crossClusterSearchConnection;
    return {
      if (crossClusterSearchConnection != null)
        'CrossClusterSearchConnection': crossClusterSearchConnection,
    };
  }
}

/// The configured access rules for the domain's document and search endpoints,
/// and the current status of those rules.
class AccessPoliciesStatus {
  /// The access policy configured for the Elasticsearch domain. Access policies
  /// may be resource-based, IP-based, or IAM-based. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-access-policies"
  /// target="_blank"> Configuring Access Policies</a>for more information.
  final String options;

  /// The status of the access policy for the Elasticsearch domain. See
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

/// List of limits that are specific to a given InstanceType and for each of
/// it's <code> <a>InstanceRole</a> </code> .
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
  final String? limitName;

  /// Value for given <code> <a>AdditionalLimit$LimitName</a> </code> .
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
class AdvancedOptionsStatus {
  /// Specifies the status of advanced options for the specified Elasticsearch
  /// domain.
  final Map<String, String> options;

  /// Specifies the status of <code>OptionStatus</code> for advanced options for
  /// the specified Elasticsearch domain.
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

/// Specifies the advanced security configuration: whether advanced security is
/// enabled, whether the internal database option is enabled.
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

/// Specifies the advanced security configuration: whether advanced security is
/// enabled, whether the internal database option is enabled, master username
/// and password (if internal database is enabled), and master user ARN (if IAM
/// is enabled).
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

  /// Specifies the SAML application configuration for the domain.
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

/// Specifies the status of advanced security options for the specified
/// Elasticsearch domain.
class AdvancedSecurityOptionsStatus {
  /// Specifies advanced security options for the specified Elasticsearch domain.
  final AdvancedSecurityOptions options;

  /// Status of the advanced security options for the specified Elasticsearch
  /// domain.
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

/// Container for response returned by <code> <a>AssociatePackage</a> </code>
/// operation.
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

/// Container for response parameters to the
/// <code><a>AuthorizeVpcEndpointAccess</a></code> operation. Contains the
/// account ID and the type of the account being authorized to access the VPC
/// endpoint.
class AuthorizeVpcEndpointAccessResponse {
  /// Information about the account or service that was provided access to the
  /// domain.
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

/// Information about an account or service that has access to an Amazon
/// OpenSearch Service domain through the use of an interface VPC endpoint.
class AuthorizedPrincipal {
  /// The IAM principal that is allowed access to the domain.
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

/// Specifies Auto-Tune type and Auto-Tune action details.
class AutoTune {
  /// Specifies details of the Auto-Tune action. See the <a
  /// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank">Developer Guide</a> for more information.
  final AutoTuneDetails? autoTuneDetails;

  /// Specifies Auto-Tune type. Valid value is SCHEDULED_ACTION.
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

/// Specifies the Auto-Tune desired state. Valid values are ENABLED, DISABLED.
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

/// Specifies details of the Auto-Tune action. See the <a
/// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
/// target="_blank">Developer Guide</a> for more information.
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

/// Specifies Auto-Tune maitenance schedule. See the <a
/// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
/// target="_blank">Developer Guide</a> for more information.
class AutoTuneMaintenanceSchedule {
  /// Specifies cron expression for a recurring maintenance schedule. See the <a
  /// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank">Developer Guide</a> for more information.
  final String? cronExpressionForRecurrence;

  /// Specifies maintenance schedule duration: duration value and duration unit.
  /// See the <a
  /// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank">Developer Guide</a> for more information.
  final Duration? duration;

  /// Specifies timestamp at which Auto-Tune maintenance schedule start.
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

/// Specifies the Auto-Tune options: the Auto-Tune desired state for the domain,
/// rollback state when disabling Auto-Tune options and list of maintenance
/// schedules.
class AutoTuneOptions {
  /// Specifies the Auto-Tune desired state. Valid values are ENABLED, DISABLED.
  final AutoTuneDesiredState? desiredState;

  /// Specifies list of maitenance schedules. See the <a
  /// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank">Developer Guide</a> for more information.
  final List<AutoTuneMaintenanceSchedule>? maintenanceSchedules;

  /// Specifies the rollback state while disabling Auto-Tune for the domain. Valid
  /// values are NO_ROLLBACK, DEFAULT_ROLLBACK.
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

/// Specifies the Auto-Tune options: the Auto-Tune desired state for the domain
/// and list of maintenance schedules.
class AutoTuneOptionsInput {
  /// Specifies the Auto-Tune desired state. Valid values are ENABLED, DISABLED.
  final AutoTuneDesiredState? desiredState;

  /// Specifies list of maitenance schedules. See the <a
  /// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank">Developer Guide</a> for more information.
  final List<AutoTuneMaintenanceSchedule>? maintenanceSchedules;

  AutoTuneOptionsInput({
    this.desiredState,
    this.maintenanceSchedules,
  });

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

/// Specifies the Auto-Tune options: the Auto-Tune desired state for the domain
/// and list of maintenance schedules.
class AutoTuneOptionsOutput {
  /// Specifies the error message while enabling or disabling the Auto-Tune.
  final String? errorMessage;

  /// Specifies the <code>AutoTuneState</code> for the Elasticsearch domain.
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

/// Specifies the status of Auto-Tune options for the specified Elasticsearch
/// domain.
class AutoTuneOptionsStatus {
  /// Specifies Auto-Tune options for the specified Elasticsearch domain.
  final AutoTuneOptions? options;

  /// Specifies Status of the Auto-Tune options for the specified Elasticsearch
  /// domain.
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

/// Specifies the Auto-Tune state for the Elasticsearch domain. For valid states
/// see the <a
/// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
/// target="_blank">Developer Guide</a>.
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

/// Provides the current status of the Auto-Tune options.
class AutoTuneStatus {
  /// Timestamp which tells Auto-Tune options creation date .
  final DateTime creationDate;

  /// Specifies the <code>AutoTuneState</code> for the Elasticsearch domain.
  final AutoTuneState state;

  /// Timestamp which tells Auto-Tune options last updated time.
  final DateTime updateDate;

  /// Specifies the error message while enabling or disabling the Auto-Tune
  /// options.
  final String? errorMessage;

  /// Indicates whether the Elasticsearch domain is being deleted.
  final bool? pendingDeletion;

  /// Specifies the Auto-Tune options latest version.
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

/// Specifies Auto-Tune type. Valid value is SCHEDULED_ACTION.
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

/// Contains the details of the cancelled domain config change.
class CancelDomainConfigChangeResponse {
  /// The unique identifiers of the changes that were cancelled.
  final List<String>? cancelledChangeIds;

  /// The domain change properties that were cancelled.
  final List<CancelledChangeProperty>? cancelledChangeProperties;

  /// Whether or not the request was a dry run. If <b>True</b>, the changes were
  /// not actually cancelled.
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

/// The result of a <code>CancelElasticsearchServiceSoftwareUpdate</code>
/// operation. Contains the status of the update.
class CancelElasticsearchServiceSoftwareUpdateResponse {
  /// The current status of the Elasticsearch service software update.
  final ServiceSoftwareOptions? serviceSoftwareOptions;

  CancelElasticsearchServiceSoftwareUpdateResponse({
    this.serviceSoftwareOptions,
  });

  factory CancelElasticsearchServiceSoftwareUpdateResponse.fromJson(
      Map<String, dynamic> json) {
    return CancelElasticsearchServiceSoftwareUpdateResponse(
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

/// Specifies change details of the domain configuration change.
class ChangeProgressDetails {
  /// The unique change identifier associated with a specific domain configuration
  /// change.
  final String? changeId;

  /// The current status of the configuration change.
  final ConfigChangeStatus? configChangeStatus;

  /// The IAM principal who initiated the configuration change.
  final InitiatedBy? initiatedBy;

  /// The last time that the configuration change was updated.
  final DateTime? lastUpdatedTime;

  /// Contains an optional message associated with the domain configuration
  /// change.
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

  /// The current status of the configuration change.
  final ConfigChangeStatus? configChangeStatus;

  /// The IAM principal who initiated the configuration change.
  final InitiatedBy? initiatedBy;

  /// The last time that the status of the configuration change was updated.
  final DateTime? lastUpdatedTime;

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

/// Options to specify the Cognito user and identity pools for Kibana
/// authentication. For more information, see <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html"
/// target="_blank">Amazon Cognito Authentication for Kibana</a>.
class CognitoOptions {
  /// Specifies the option to enable Cognito for Kibana authentication.
  final bool? enabled;

  /// Specifies the Cognito identity pool ID for Kibana authentication.
  final String? identityPoolId;

  /// Specifies the role ARN that provides Elasticsearch permissions for accessing
  /// Cognito resources.
  final String? roleArn;

  /// Specifies the Cognito user pool ID for Kibana authentication.
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

/// Status of the Cognito options for the specified Elasticsearch domain.
class CognitoOptionsStatus {
  /// Specifies the Cognito options for the specified Elasticsearch domain.
  final CognitoOptions options;

  /// Specifies the status of the Cognito options for the specified Elasticsearch
  /// domain.
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

/// A map from an <code> <a>ElasticsearchVersion</a> </code> to a list of
/// compatible <code> <a>ElasticsearchVersion</a> </code> s to which the domain
/// can be upgraded.
class CompatibleVersionsMap {
  /// The current version of Elasticsearch on which a domain is.
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

/// The result of a <code>CreateElasticsearchDomain</code> operation. Contains
/// the status of the newly created Elasticsearch domain.
class CreateElasticsearchDomainResponse {
  /// The status of the newly created Elasticsearch domain.
  final ElasticsearchDomainStatus? domainStatus;

  CreateElasticsearchDomainResponse({
    this.domainStatus,
  });

  factory CreateElasticsearchDomainResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateElasticsearchDomainResponse(
      domainStatus: json['DomainStatus'] != null
          ? ElasticsearchDomainStatus.fromJson(
              json['DomainStatus'] as Map<String, dynamic>)
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

/// The result of a
/// <code><a>CreateOutboundCrossClusterSearchConnection</a></code> request.
/// Contains the details of the newly created cross-cluster search connection.
class CreateOutboundCrossClusterSearchConnectionResponse {
  /// Specifies the connection alias provided during the create connection
  /// request.
  final String? connectionAlias;

  /// Specifies the <code><a>OutboundCrossClusterSearchConnectionStatus</a></code>
  /// for the newly created connection.
  final OutboundCrossClusterSearchConnectionStatus? connectionStatus;

  /// Unique id for the created outbound connection, which is used for subsequent
  /// operations on connection.
  final String? crossClusterSearchConnectionId;

  /// Specifies the <code><a>DomainInformation</a></code> for the destination
  /// Elasticsearch domain.
  final DomainInformation? destinationDomainInfo;

  /// Specifies the <code><a>DomainInformation</a></code> for the source
  /// Elasticsearch domain.
  final DomainInformation? sourceDomainInfo;

  CreateOutboundCrossClusterSearchConnectionResponse({
    this.connectionAlias,
    this.connectionStatus,
    this.crossClusterSearchConnectionId,
    this.destinationDomainInfo,
    this.sourceDomainInfo,
  });

  factory CreateOutboundCrossClusterSearchConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateOutboundCrossClusterSearchConnectionResponse(
      connectionAlias: json['ConnectionAlias'] as String?,
      connectionStatus: json['ConnectionStatus'] != null
          ? OutboundCrossClusterSearchConnectionStatus.fromJson(
              json['ConnectionStatus'] as Map<String, dynamic>)
          : null,
      crossClusterSearchConnectionId:
          json['CrossClusterSearchConnectionId'] as String?,
      destinationDomainInfo: json['DestinationDomainInfo'] != null
          ? DomainInformation.fromJson(
              json['DestinationDomainInfo'] as Map<String, dynamic>)
          : null,
      sourceDomainInfo: json['SourceDomainInfo'] != null
          ? DomainInformation.fromJson(
              json['SourceDomainInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionAlias = this.connectionAlias;
    final connectionStatus = this.connectionStatus;
    final crossClusterSearchConnectionId = this.crossClusterSearchConnectionId;
    final destinationDomainInfo = this.destinationDomainInfo;
    final sourceDomainInfo = this.sourceDomainInfo;
    return {
      if (connectionAlias != null) 'ConnectionAlias': connectionAlias,
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (crossClusterSearchConnectionId != null)
        'CrossClusterSearchConnectionId': crossClusterSearchConnectionId,
      if (destinationDomainInfo != null)
        'DestinationDomainInfo': destinationDomainInfo,
      if (sourceDomainInfo != null) 'SourceDomainInfo': sourceDomainInfo,
    };
  }
}

/// Container for response returned by <code> <a>CreatePackage</a> </code>
/// operation.
class CreatePackageResponse {
  /// Information about the package <code>PackageDetails</code>.
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

/// Container for response parameters to the
/// <code><a>CreateVpcEndpoint</a></code> operation. Contains the configuration
/// and status of the VPC Endpoint being created.
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

/// The result of a <code>DeleteElasticsearchDomain</code> request. Contains the
/// status of the pending deletion, or no status if the domain and all of its
/// resources have been deleted.
class DeleteElasticsearchDomainResponse {
  /// The status of the Elasticsearch domain being deleted.
  final ElasticsearchDomainStatus? domainStatus;

  DeleteElasticsearchDomainResponse({
    this.domainStatus,
  });

  factory DeleteElasticsearchDomainResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteElasticsearchDomainResponse(
      domainStatus: json['DomainStatus'] != null
          ? ElasticsearchDomainStatus.fromJson(
              json['DomainStatus'] as Map<String, dynamic>)
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

/// The result of a
/// <code><a>DeleteInboundCrossClusterSearchConnection</a></code> operation.
/// Contains details of deleted inbound connection.
class DeleteInboundCrossClusterSearchConnectionResponse {
  /// Specifies the <code><a>InboundCrossClusterSearchConnection</a></code> of
  /// deleted inbound connection.
  final InboundCrossClusterSearchConnection? crossClusterSearchConnection;

  DeleteInboundCrossClusterSearchConnectionResponse({
    this.crossClusterSearchConnection,
  });

  factory DeleteInboundCrossClusterSearchConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteInboundCrossClusterSearchConnectionResponse(
      crossClusterSearchConnection: json['CrossClusterSearchConnection'] != null
          ? InboundCrossClusterSearchConnection.fromJson(
              json['CrossClusterSearchConnection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final crossClusterSearchConnection = this.crossClusterSearchConnection;
    return {
      if (crossClusterSearchConnection != null)
        'CrossClusterSearchConnection': crossClusterSearchConnection,
    };
  }
}

/// The result of a
/// <code><a>DeleteOutboundCrossClusterSearchConnection</a></code> operation.
/// Contains details of deleted outbound connection.
class DeleteOutboundCrossClusterSearchConnectionResponse {
  /// Specifies the <code><a>OutboundCrossClusterSearchConnection</a></code> of
  /// deleted outbound connection.
  final OutboundCrossClusterSearchConnection? crossClusterSearchConnection;

  DeleteOutboundCrossClusterSearchConnectionResponse({
    this.crossClusterSearchConnection,
  });

  factory DeleteOutboundCrossClusterSearchConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteOutboundCrossClusterSearchConnectionResponse(
      crossClusterSearchConnection: json['CrossClusterSearchConnection'] != null
          ? OutboundCrossClusterSearchConnection.fromJson(
              json['CrossClusterSearchConnection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final crossClusterSearchConnection = this.crossClusterSearchConnection;
    return {
      if (crossClusterSearchConnection != null)
        'CrossClusterSearchConnection': crossClusterSearchConnection,
    };
  }
}

/// Container for response parameters to <code> <a>DeletePackage</a> </code>
/// operation.
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

/// Container for response parameters to the
/// <code><a>DeleteVpcEndpoint</a></code> operation. Contains the summarized
/// detail of the VPC Endpoint being deleted.
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

/// The result of <code>DescribeDomainAutoTunes</code> request. See the <a
/// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
/// target="_blank">Developer Guide</a> for more information.
class DescribeDomainAutoTunesResponse {
  /// Specifies the list of setting adjustments that Auto-Tune has made to the
  /// domain. See the <a
  /// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank">Developer Guide</a> for more information.
  final List<AutoTune>? autoTunes;

  /// Specifies an identifier to allow retrieval of paginated results.
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

/// The result of a <code>DescribeElasticsearchDomainConfig</code> request.
/// Contains the configuration information of the requested domain.
class DescribeElasticsearchDomainConfigResponse {
  /// The configuration information of the domain requested in the
  /// <code>DescribeElasticsearchDomainConfig</code> request.
  final ElasticsearchDomainConfig domainConfig;

  DescribeElasticsearchDomainConfigResponse({
    required this.domainConfig,
  });

  factory DescribeElasticsearchDomainConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeElasticsearchDomainConfigResponse(
      domainConfig: ElasticsearchDomainConfig.fromJson(
          json['DomainConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final domainConfig = this.domainConfig;
    return {
      'DomainConfig': domainConfig,
    };
  }
}

/// The result of a <code>DescribeElasticsearchDomain</code> request. Contains
/// the status of the domain specified in the request.
class DescribeElasticsearchDomainResponse {
  /// The current status of the Elasticsearch domain.
  final ElasticsearchDomainStatus domainStatus;

  DescribeElasticsearchDomainResponse({
    required this.domainStatus,
  });

  factory DescribeElasticsearchDomainResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeElasticsearchDomainResponse(
      domainStatus: ElasticsearchDomainStatus.fromJson(
          json['DomainStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final domainStatus = this.domainStatus;
    return {
      'DomainStatus': domainStatus,
    };
  }
}

/// The result of a <code>DescribeElasticsearchDomains</code> request. Contains
/// the status of the specified domains or all domains owned by the account.
class DescribeElasticsearchDomainsResponse {
  /// The status of the domains requested in the
  /// <code>DescribeElasticsearchDomains</code> request.
  final List<ElasticsearchDomainStatus> domainStatusList;

  DescribeElasticsearchDomainsResponse({
    required this.domainStatusList,
  });

  factory DescribeElasticsearchDomainsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeElasticsearchDomainsResponse(
      domainStatusList: (json['DomainStatusList'] as List)
          .whereNotNull()
          .map((e) =>
              ElasticsearchDomainStatus.fromJson(e as Map<String, dynamic>))
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

/// Container for the parameters received from <code>
/// <a>DescribeElasticsearchInstanceTypeLimits</a> </code> operation.
class DescribeElasticsearchInstanceTypeLimitsResponse {
  final Map<String, Limits>? limitsByRole;

  DescribeElasticsearchInstanceTypeLimitsResponse({
    this.limitsByRole,
  });

  factory DescribeElasticsearchInstanceTypeLimitsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeElasticsearchInstanceTypeLimitsResponse(
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

/// The result of a
/// <code><a>DescribeInboundCrossClusterSearchConnections</a></code> request.
/// Contains the list of connections matching the filter criteria.
class DescribeInboundCrossClusterSearchConnectionsResponse {
  /// Consists of list of <code><a>InboundCrossClusterSearchConnection</a></code>
  /// matching the specified filter criteria.
  final List<InboundCrossClusterSearchConnection>?
      crossClusterSearchConnections;

  /// If more results are available and NextToken is present, make the next
  /// request to the same API with the received NextToken to paginate the
  /// remaining results.
  final String? nextToken;

  DescribeInboundCrossClusterSearchConnectionsResponse({
    this.crossClusterSearchConnections,
    this.nextToken,
  });

  factory DescribeInboundCrossClusterSearchConnectionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeInboundCrossClusterSearchConnectionsResponse(
      crossClusterSearchConnections:
          (json['CrossClusterSearchConnections'] as List?)
              ?.whereNotNull()
              .map((e) => InboundCrossClusterSearchConnection.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crossClusterSearchConnections = this.crossClusterSearchConnections;
    final nextToken = this.nextToken;
    return {
      if (crossClusterSearchConnections != null)
        'CrossClusterSearchConnections': crossClusterSearchConnections,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The result of a
/// <code><a>DescribeOutboundCrossClusterSearchConnections</a></code> request.
/// Contains the list of connections matching the filter criteria.
class DescribeOutboundCrossClusterSearchConnectionsResponse {
  /// Consists of list of <code><a>OutboundCrossClusterSearchConnection</a></code>
  /// matching the specified filter criteria.
  final List<OutboundCrossClusterSearchConnection>?
      crossClusterSearchConnections;

  /// If more results are available and NextToken is present, make the next
  /// request to the same API with the received NextToken to paginate the
  /// remaining results.
  final String? nextToken;

  DescribeOutboundCrossClusterSearchConnectionsResponse({
    this.crossClusterSearchConnections,
    this.nextToken,
  });

  factory DescribeOutboundCrossClusterSearchConnectionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOutboundCrossClusterSearchConnectionsResponse(
      crossClusterSearchConnections:
          (json['CrossClusterSearchConnections'] as List?)
              ?.whereNotNull()
              .map((e) => OutboundCrossClusterSearchConnection.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crossClusterSearchConnections = this.crossClusterSearchConnections;
    final nextToken = this.nextToken;
    return {
      if (crossClusterSearchConnections != null)
        'CrossClusterSearchConnections': crossClusterSearchConnections,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Filter to apply in <code>DescribePackage</code> response.
class DescribePackagesFilter {
  /// Any field from <code>PackageDetails</code>.
  final DescribePackagesFilterName? name;

  /// A non-empty list of values for the specified field.
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
    }
    throw Exception('$this is not known in enum DescribePackagesFilterName');
  }
}

/// Container for response returned by <code> <a>DescribePackages</a> </code>
/// operation.
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

/// Container for results from
/// <code>DescribeReservedElasticsearchInstanceOfferings</code>
class DescribeReservedElasticsearchInstanceOfferingsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String? nextToken;

  /// List of reserved Elasticsearch instance offerings
  final List<ReservedElasticsearchInstanceOffering>?
      reservedElasticsearchInstanceOfferings;

  DescribeReservedElasticsearchInstanceOfferingsResponse({
    this.nextToken,
    this.reservedElasticsearchInstanceOfferings,
  });

  factory DescribeReservedElasticsearchInstanceOfferingsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReservedElasticsearchInstanceOfferingsResponse(
      nextToken: json['NextToken'] as String?,
      reservedElasticsearchInstanceOfferings:
          (json['ReservedElasticsearchInstanceOfferings'] as List?)
              ?.whereNotNull()
              .map((e) => ReservedElasticsearchInstanceOffering.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reservedElasticsearchInstanceOfferings =
        this.reservedElasticsearchInstanceOfferings;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (reservedElasticsearchInstanceOfferings != null)
        'ReservedElasticsearchInstanceOfferings':
            reservedElasticsearchInstanceOfferings,
    };
  }
}

/// Container for results from
/// <code>DescribeReservedElasticsearchInstances</code>
class DescribeReservedElasticsearchInstancesResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String? nextToken;

  /// List of reserved Elasticsearch instances.
  final List<ReservedElasticsearchInstance>? reservedElasticsearchInstances;

  DescribeReservedElasticsearchInstancesResponse({
    this.nextToken,
    this.reservedElasticsearchInstances,
  });

  factory DescribeReservedElasticsearchInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReservedElasticsearchInstancesResponse(
      nextToken: json['NextToken'] as String?,
      reservedElasticsearchInstances: (json['ReservedElasticsearchInstances']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ReservedElasticsearchInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reservedElasticsearchInstances = this.reservedElasticsearchInstances;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (reservedElasticsearchInstances != null)
        'ReservedElasticsearchInstances': reservedElasticsearchInstances,
    };
  }
}

/// Container for response parameters to the
/// <code><a>DescribeVpcEndpoints</a></code> operation. Returns a list
/// containing configuration details and status of the VPC Endpoints as well as
/// a list containing error responses of the endpoints that could not be
/// described
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

/// Container for response returned by <code> <a>DissociatePackage</a> </code>
/// operation.
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

/// Options to configure endpoint for the Elasticsearch domain.
class DomainEndpointOptions {
  /// Specify the fully qualified domain for your custom endpoint.
  final String? customEndpoint;

  /// Specify ACM certificate ARN for your custom endpoint.
  final String? customEndpointCertificateArn;

  /// Specify if custom endpoint should be enabled for the Elasticsearch domain.
  final bool? customEndpointEnabled;

  /// Specify if only HTTPS endpoint should be enabled for the Elasticsearch
  /// domain.
  final bool? enforceHTTPS;

  /// Specify the TLS security policy that needs to be applied to the HTTPS
  /// endpoint of Elasticsearch domain. <br/> It can be one of the following
  /// values:
  /// <ul>
  /// <li><b>Policy-Min-TLS-1-0-2019-07: </b> TLS security policy that supports
  /// TLS version 1.0 to TLS version 1.2</li>
  /// <li><b>Policy-Min-TLS-1-2-2019-07: </b> TLS security policy that supports
  /// only TLS version 1.2</li>
  /// <li><b>Policy-Min-TLS-1-2-PFS-2023-10: </b> TLS security policy that
  /// supports TLS version 1.2 to TLS version 1.3 with perfect forward secrecy
  /// cipher suites</li>
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
  /// Options to configure endpoint for the Elasticsearch domain.
  final DomainEndpointOptions options;

  /// The status of the endpoint options for the Elasticsearch domain. See
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
  /// Specifies the <code>DomainName</code>.
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

class DomainInformation {
  final String domainName;
  final String? ownerId;
  final String? region;

  DomainInformation({
    required this.domainName,
    this.ownerId,
    this.region,
  });

  factory DomainInformation.fromJson(Map<String, dynamic> json) {
    return DomainInformation(
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

/// Information on a package that is associated with a domain.
class DomainPackageDetails {
  /// Name of the domain you've associated a package with.
  final String? domainName;

  /// State of the association. Values are
  /// ASSOCIATING/ASSOCIATION_FAILED/ACTIVE/DISSOCIATING/DISSOCIATION_FAILED.
  final DomainPackageStatus? domainPackageStatus;

  /// Additional information if the package is in an error state. Null otherwise.
  final ErrorDetails? errorDetails;

  /// Timestamp of the most-recent update to the association status.
  final DateTime? lastUpdated;

  /// Internal ID of the package.
  final String? packageID;

  /// User specified name of the package.
  final String? packageName;

  /// Currently supports only TXT-DICTIONARY.
  final PackageType? packageType;
  final String? packageVersion;

  /// The relative path on Amazon ES nodes, which can be used as synonym_path when
  /// the package is synonym file.
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

class DryRunResults {
  /// Specifies the deployment mechanism through which the update shall be applied
  /// on the domain. Possible responses are <code>Blue/Green</code> (The update
  /// will require a blue/green deployment.) <code>DynamicUpdate</code> (The
  /// update can be applied in-place without a Blue/Green deployment required.)
  /// <code>Undetermined</code> (The domain is undergoing an update which needs to
  /// complete before the deployment type can be predicted.) <code>None</code>
  /// (The configuration change matches the current configuration and will not
  /// result in any update.)
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

/// Specifies maintenance schedule duration: duration value and duration unit.
/// See the <a
/// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
/// target="_blank">Developer Guide</a> for more information.
class Duration {
  /// Specifies the unit of a maintenance schedule duration. Valid value is HOURS.
  /// See the <a
  /// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank">Developer Guide</a> for more information.
  final TimeUnit? unit;

  /// Integer to specify the value of a maintenance schedule duration. See the <a
  /// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
  /// target="_blank">Developer Guide</a> for more information.
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
/// volumes. For more information, see <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-ebs"
/// target="_blank"> Configuring EBS-based Storage</a>.
class EBSOptions {
  /// Specifies whether EBS-based storage is enabled.
  final bool? eBSEnabled;

  /// Specifies the IOPS for Provisioned IOPS And GP3 EBS volume (SSD).
  final int? iops;

  /// Specifies the Throughput for GP3 EBS volume (SSD).
  final int? throughput;

  /// Integer to specify the size of an EBS volume.
  final int? volumeSize;

  /// Specifies the volume type for EBS-based storage.
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

/// Status of the EBS options for the specified Elasticsearch domain.
class EBSOptionsStatus {
  /// Specifies the EBS options for the specified Elasticsearch domain.
  final EBSOptions options;

  /// Specifies the status of the EBS options for the specified Elasticsearch
  /// domain.
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

enum ESPartitionInstanceType {
  m3MediumElasticsearch,
  m3LargeElasticsearch,
  m3XlargeElasticsearch,
  m3_2xlargeElasticsearch,
  m4LargeElasticsearch,
  m4XlargeElasticsearch,
  m4_2xlargeElasticsearch,
  m4_4xlargeElasticsearch,
  m4_10xlargeElasticsearch,
  m5LargeElasticsearch,
  m5XlargeElasticsearch,
  m5_2xlargeElasticsearch,
  m5_4xlargeElasticsearch,
  m5_12xlargeElasticsearch,
  r5LargeElasticsearch,
  r5XlargeElasticsearch,
  r5_2xlargeElasticsearch,
  r5_4xlargeElasticsearch,
  r5_12xlargeElasticsearch,
  c5LargeElasticsearch,
  c5XlargeElasticsearch,
  c5_2xlargeElasticsearch,
  c5_4xlargeElasticsearch,
  c5_9xlargeElasticsearch,
  c5_18xlargeElasticsearch,
  ultrawarm1MediumElasticsearch,
  ultrawarm1LargeElasticsearch,
  t2MicroElasticsearch,
  t2SmallElasticsearch,
  t2MediumElasticsearch,
  r3LargeElasticsearch,
  r3XlargeElasticsearch,
  r3_2xlargeElasticsearch,
  r3_4xlargeElasticsearch,
  r3_8xlargeElasticsearch,
  i2XlargeElasticsearch,
  i2_2xlargeElasticsearch,
  d2XlargeElasticsearch,
  d2_2xlargeElasticsearch,
  d2_4xlargeElasticsearch,
  d2_8xlargeElasticsearch,
  c4LargeElasticsearch,
  c4XlargeElasticsearch,
  c4_2xlargeElasticsearch,
  c4_4xlargeElasticsearch,
  c4_8xlargeElasticsearch,
  r4LargeElasticsearch,
  r4XlargeElasticsearch,
  r4_2xlargeElasticsearch,
  r4_4xlargeElasticsearch,
  r4_8xlargeElasticsearch,
  r4_16xlargeElasticsearch,
  i3LargeElasticsearch,
  i3XlargeElasticsearch,
  i3_2xlargeElasticsearch,
  i3_4xlargeElasticsearch,
  i3_8xlargeElasticsearch,
  i3_16xlargeElasticsearch,
}

extension ESPartitionInstanceTypeValueExtension on ESPartitionInstanceType {
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
  }
}

extension ESPartitionInstanceTypeFromString on String {
  ESPartitionInstanceType toESPartitionInstanceType() {
    switch (this) {
      case 'm3.medium.elasticsearch':
        return ESPartitionInstanceType.m3MediumElasticsearch;
      case 'm3.large.elasticsearch':
        return ESPartitionInstanceType.m3LargeElasticsearch;
      case 'm3.xlarge.elasticsearch':
        return ESPartitionInstanceType.m3XlargeElasticsearch;
      case 'm3.2xlarge.elasticsearch':
        return ESPartitionInstanceType.m3_2xlargeElasticsearch;
      case 'm4.large.elasticsearch':
        return ESPartitionInstanceType.m4LargeElasticsearch;
      case 'm4.xlarge.elasticsearch':
        return ESPartitionInstanceType.m4XlargeElasticsearch;
      case 'm4.2xlarge.elasticsearch':
        return ESPartitionInstanceType.m4_2xlargeElasticsearch;
      case 'm4.4xlarge.elasticsearch':
        return ESPartitionInstanceType.m4_4xlargeElasticsearch;
      case 'm4.10xlarge.elasticsearch':
        return ESPartitionInstanceType.m4_10xlargeElasticsearch;
      case 'm5.large.elasticsearch':
        return ESPartitionInstanceType.m5LargeElasticsearch;
      case 'm5.xlarge.elasticsearch':
        return ESPartitionInstanceType.m5XlargeElasticsearch;
      case 'm5.2xlarge.elasticsearch':
        return ESPartitionInstanceType.m5_2xlargeElasticsearch;
      case 'm5.4xlarge.elasticsearch':
        return ESPartitionInstanceType.m5_4xlargeElasticsearch;
      case 'm5.12xlarge.elasticsearch':
        return ESPartitionInstanceType.m5_12xlargeElasticsearch;
      case 'r5.large.elasticsearch':
        return ESPartitionInstanceType.r5LargeElasticsearch;
      case 'r5.xlarge.elasticsearch':
        return ESPartitionInstanceType.r5XlargeElasticsearch;
      case 'r5.2xlarge.elasticsearch':
        return ESPartitionInstanceType.r5_2xlargeElasticsearch;
      case 'r5.4xlarge.elasticsearch':
        return ESPartitionInstanceType.r5_4xlargeElasticsearch;
      case 'r5.12xlarge.elasticsearch':
        return ESPartitionInstanceType.r5_12xlargeElasticsearch;
      case 'c5.large.elasticsearch':
        return ESPartitionInstanceType.c5LargeElasticsearch;
      case 'c5.xlarge.elasticsearch':
        return ESPartitionInstanceType.c5XlargeElasticsearch;
      case 'c5.2xlarge.elasticsearch':
        return ESPartitionInstanceType.c5_2xlargeElasticsearch;
      case 'c5.4xlarge.elasticsearch':
        return ESPartitionInstanceType.c5_4xlargeElasticsearch;
      case 'c5.9xlarge.elasticsearch':
        return ESPartitionInstanceType.c5_9xlargeElasticsearch;
      case 'c5.18xlarge.elasticsearch':
        return ESPartitionInstanceType.c5_18xlargeElasticsearch;
      case 'ultrawarm1.medium.elasticsearch':
        return ESPartitionInstanceType.ultrawarm1MediumElasticsearch;
      case 'ultrawarm1.large.elasticsearch':
        return ESPartitionInstanceType.ultrawarm1LargeElasticsearch;
      case 't2.micro.elasticsearch':
        return ESPartitionInstanceType.t2MicroElasticsearch;
      case 't2.small.elasticsearch':
        return ESPartitionInstanceType.t2SmallElasticsearch;
      case 't2.medium.elasticsearch':
        return ESPartitionInstanceType.t2MediumElasticsearch;
      case 'r3.large.elasticsearch':
        return ESPartitionInstanceType.r3LargeElasticsearch;
      case 'r3.xlarge.elasticsearch':
        return ESPartitionInstanceType.r3XlargeElasticsearch;
      case 'r3.2xlarge.elasticsearch':
        return ESPartitionInstanceType.r3_2xlargeElasticsearch;
      case 'r3.4xlarge.elasticsearch':
        return ESPartitionInstanceType.r3_4xlargeElasticsearch;
      case 'r3.8xlarge.elasticsearch':
        return ESPartitionInstanceType.r3_8xlargeElasticsearch;
      case 'i2.xlarge.elasticsearch':
        return ESPartitionInstanceType.i2XlargeElasticsearch;
      case 'i2.2xlarge.elasticsearch':
        return ESPartitionInstanceType.i2_2xlargeElasticsearch;
      case 'd2.xlarge.elasticsearch':
        return ESPartitionInstanceType.d2XlargeElasticsearch;
      case 'd2.2xlarge.elasticsearch':
        return ESPartitionInstanceType.d2_2xlargeElasticsearch;
      case 'd2.4xlarge.elasticsearch':
        return ESPartitionInstanceType.d2_4xlargeElasticsearch;
      case 'd2.8xlarge.elasticsearch':
        return ESPartitionInstanceType.d2_8xlargeElasticsearch;
      case 'c4.large.elasticsearch':
        return ESPartitionInstanceType.c4LargeElasticsearch;
      case 'c4.xlarge.elasticsearch':
        return ESPartitionInstanceType.c4XlargeElasticsearch;
      case 'c4.2xlarge.elasticsearch':
        return ESPartitionInstanceType.c4_2xlargeElasticsearch;
      case 'c4.4xlarge.elasticsearch':
        return ESPartitionInstanceType.c4_4xlargeElasticsearch;
      case 'c4.8xlarge.elasticsearch':
        return ESPartitionInstanceType.c4_8xlargeElasticsearch;
      case 'r4.large.elasticsearch':
        return ESPartitionInstanceType.r4LargeElasticsearch;
      case 'r4.xlarge.elasticsearch':
        return ESPartitionInstanceType.r4XlargeElasticsearch;
      case 'r4.2xlarge.elasticsearch':
        return ESPartitionInstanceType.r4_2xlargeElasticsearch;
      case 'r4.4xlarge.elasticsearch':
        return ESPartitionInstanceType.r4_4xlargeElasticsearch;
      case 'r4.8xlarge.elasticsearch':
        return ESPartitionInstanceType.r4_8xlargeElasticsearch;
      case 'r4.16xlarge.elasticsearch':
        return ESPartitionInstanceType.r4_16xlargeElasticsearch;
      case 'i3.large.elasticsearch':
        return ESPartitionInstanceType.i3LargeElasticsearch;
      case 'i3.xlarge.elasticsearch':
        return ESPartitionInstanceType.i3XlargeElasticsearch;
      case 'i3.2xlarge.elasticsearch':
        return ESPartitionInstanceType.i3_2xlargeElasticsearch;
      case 'i3.4xlarge.elasticsearch':
        return ESPartitionInstanceType.i3_4xlargeElasticsearch;
      case 'i3.8xlarge.elasticsearch':
        return ESPartitionInstanceType.i3_8xlargeElasticsearch;
      case 'i3.16xlarge.elasticsearch':
        return ESPartitionInstanceType.i3_16xlargeElasticsearch;
    }
    throw Exception('$this is not known in enum ESPartitionInstanceType');
  }
}

enum ESWarmPartitionInstanceType {
  ultrawarm1MediumElasticsearch,
  ultrawarm1LargeElasticsearch,
}

extension ESWarmPartitionInstanceTypeValueExtension
    on ESWarmPartitionInstanceType {
  String toValue() {
    switch (this) {
      case ESWarmPartitionInstanceType.ultrawarm1MediumElasticsearch:
        return 'ultrawarm1.medium.elasticsearch';
      case ESWarmPartitionInstanceType.ultrawarm1LargeElasticsearch:
        return 'ultrawarm1.large.elasticsearch';
    }
  }
}

extension ESWarmPartitionInstanceTypeFromString on String {
  ESWarmPartitionInstanceType toESWarmPartitionInstanceType() {
    switch (this) {
      case 'ultrawarm1.medium.elasticsearch':
        return ESWarmPartitionInstanceType.ultrawarm1MediumElasticsearch;
      case 'ultrawarm1.large.elasticsearch':
        return ESWarmPartitionInstanceType.ultrawarm1LargeElasticsearch;
    }
    throw Exception('$this is not known in enum ESWarmPartitionInstanceType');
  }
}

/// Specifies the configuration for the domain cluster, such as the type and
/// number of instances.
class ElasticsearchClusterConfig {
  /// Specifies the <code>ColdStorageOptions</code> config for Elasticsearch
  /// Domain
  final ColdStorageOptions? coldStorageOptions;

  /// Total number of dedicated master nodes, active and on standby, for the
  /// cluster.
  final int? dedicatedMasterCount;

  /// A boolean value to indicate whether a dedicated master node is enabled. See
  /// <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-dedicatedmasternodes"
  /// target="_blank">About Dedicated Master Nodes</a> for more information.
  final bool? dedicatedMasterEnabled;

  /// The instance type for a dedicated master node.
  final ESPartitionInstanceType? dedicatedMasterType;

  /// The number of instances in the specified domain cluster.
  final int? instanceCount;

  /// The instance type for an Elasticsearch cluster. UltraWarm instance types are
  /// not supported for data instances.
  final ESPartitionInstanceType? instanceType;

  /// The number of warm nodes in the cluster.
  final int? warmCount;

  /// True to enable warm storage.
  final bool? warmEnabled;

  /// The instance type for the Elasticsearch cluster's warm nodes.
  final ESWarmPartitionInstanceType? warmType;

  /// Specifies the zone awareness configuration for a domain when zone awareness
  /// is enabled.
  final ZoneAwarenessConfig? zoneAwarenessConfig;

  /// A boolean value to indicate whether zone awareness is enabled. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-zoneawareness"
  /// target="_blank">About Zone Awareness</a> for more information.
  final bool? zoneAwarenessEnabled;

  ElasticsearchClusterConfig({
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

  factory ElasticsearchClusterConfig.fromJson(Map<String, dynamic> json) {
    return ElasticsearchClusterConfig(
      coldStorageOptions: json['ColdStorageOptions'] != null
          ? ColdStorageOptions.fromJson(
              json['ColdStorageOptions'] as Map<String, dynamic>)
          : null,
      dedicatedMasterCount: json['DedicatedMasterCount'] as int?,
      dedicatedMasterEnabled: json['DedicatedMasterEnabled'] as bool?,
      dedicatedMasterType:
          (json['DedicatedMasterType'] as String?)?.toESPartitionInstanceType(),
      instanceCount: json['InstanceCount'] as int?,
      instanceType:
          (json['InstanceType'] as String?)?.toESPartitionInstanceType(),
      warmCount: json['WarmCount'] as int?,
      warmEnabled: json['WarmEnabled'] as bool?,
      warmType: (json['WarmType'] as String?)?.toESWarmPartitionInstanceType(),
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

/// Specifies the configuration status for the specified Elasticsearch domain.
class ElasticsearchClusterConfigStatus {
  /// Specifies the cluster configuration for the specified Elasticsearch domain.
  final ElasticsearchClusterConfig options;

  /// Specifies the status of the configuration for the specified Elasticsearch
  /// domain.
  final OptionStatus status;

  ElasticsearchClusterConfigStatus({
    required this.options,
    required this.status,
  });

  factory ElasticsearchClusterConfigStatus.fromJson(Map<String, dynamic> json) {
    return ElasticsearchClusterConfigStatus(
      options: ElasticsearchClusterConfig.fromJson(
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

/// The configuration of an Elasticsearch domain.
class ElasticsearchDomainConfig {
  /// IAM access policy as a JSON-formatted string.
  final AccessPoliciesStatus? accessPolicies;

  /// Specifies the <code>AdvancedOptions</code> for the domain. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options"
  /// target="_blank">Configuring Advanced Options</a> for more information.
  final AdvancedOptionsStatus? advancedOptions;

  /// Specifies <code>AdvancedSecurityOptions</code> for the domain.
  final AdvancedSecurityOptionsStatus? advancedSecurityOptions;

  /// Specifies <code>AutoTuneOptions</code> for the domain.
  final AutoTuneOptionsStatus? autoTuneOptions;

  /// Specifies change details of the domain configuration change.
  final ChangeProgressDetails? changeProgressDetails;

  /// The <code>CognitoOptions</code> for the specified domain. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html"
  /// target="_blank">Amazon Cognito Authentication for Kibana</a>.
  final CognitoOptionsStatus? cognitoOptions;

  /// Specifies the <code>DomainEndpointOptions</code> for the Elasticsearch
  /// domain.
  final DomainEndpointOptionsStatus? domainEndpointOptions;

  /// Specifies the <code>EBSOptions</code> for the Elasticsearch domain.
  final EBSOptionsStatus? eBSOptions;

  /// Specifies the <code>ElasticsearchClusterConfig</code> for the Elasticsearch
  /// domain.
  final ElasticsearchClusterConfigStatus? elasticsearchClusterConfig;

  /// String of format X.Y to specify version for the Elasticsearch domain.
  final ElasticsearchVersionStatus? elasticsearchVersion;

  /// Specifies the <code>EncryptionAtRestOptions</code> for the Elasticsearch
  /// domain.
  final EncryptionAtRestOptionsStatus? encryptionAtRestOptions;

  /// Log publishing options for the given domain.
  final LogPublishingOptionsStatus? logPublishingOptions;

  /// Information about the domain properties that are currently being modified.
  final List<ModifyingProperties>? modifyingProperties;

  /// Specifies the <code>NodeToNodeEncryptionOptions</code> for the Elasticsearch
  /// domain.
  final NodeToNodeEncryptionOptionsStatus? nodeToNodeEncryptionOptions;

  /// Specifies the <code>SnapshotOptions</code> for the Elasticsearch domain.
  final SnapshotOptionsStatus? snapshotOptions;

  /// The <code>VPCOptions</code> for the specified domain. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html"
  /// target="_blank">VPC Endpoints for Amazon Elasticsearch Service Domains</a>.
  final VPCDerivedInfoStatus? vPCOptions;

  ElasticsearchDomainConfig({
    this.accessPolicies,
    this.advancedOptions,
    this.advancedSecurityOptions,
    this.autoTuneOptions,
    this.changeProgressDetails,
    this.cognitoOptions,
    this.domainEndpointOptions,
    this.eBSOptions,
    this.elasticsearchClusterConfig,
    this.elasticsearchVersion,
    this.encryptionAtRestOptions,
    this.logPublishingOptions,
    this.modifyingProperties,
    this.nodeToNodeEncryptionOptions,
    this.snapshotOptions,
    this.vPCOptions,
  });

  factory ElasticsearchDomainConfig.fromJson(Map<String, dynamic> json) {
    return ElasticsearchDomainConfig(
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
      elasticsearchClusterConfig: json['ElasticsearchClusterConfig'] != null
          ? ElasticsearchClusterConfigStatus.fromJson(
              json['ElasticsearchClusterConfig'] as Map<String, dynamic>)
          : null,
      elasticsearchVersion: json['ElasticsearchVersion'] != null
          ? ElasticsearchVersionStatus.fromJson(
              json['ElasticsearchVersion'] as Map<String, dynamic>)
          : null,
      encryptionAtRestOptions: json['EncryptionAtRestOptions'] != null
          ? EncryptionAtRestOptionsStatus.fromJson(
              json['EncryptionAtRestOptions'] as Map<String, dynamic>)
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
    final cognitoOptions = this.cognitoOptions;
    final domainEndpointOptions = this.domainEndpointOptions;
    final eBSOptions = this.eBSOptions;
    final elasticsearchClusterConfig = this.elasticsearchClusterConfig;
    final elasticsearchVersion = this.elasticsearchVersion;
    final encryptionAtRestOptions = this.encryptionAtRestOptions;
    final logPublishingOptions = this.logPublishingOptions;
    final modifyingProperties = this.modifyingProperties;
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
        'LogPublishingOptions': logPublishingOptions,
      if (modifyingProperties != null)
        'ModifyingProperties': modifyingProperties,
      if (nodeToNodeEncryptionOptions != null)
        'NodeToNodeEncryptionOptions': nodeToNodeEncryptionOptions,
      if (snapshotOptions != null) 'SnapshotOptions': snapshotOptions,
      if (vPCOptions != null) 'VPCOptions': vPCOptions,
    };
  }
}

/// The current status of an Elasticsearch domain.
class ElasticsearchDomainStatus {
  /// The Amazon resource name (ARN) of an Elasticsearch domain. See <a
  /// href="http://docs.aws.amazon.com/IAM/latest/UserGuide/index.html?Using_Identifiers.html"
  /// target="_blank">Identifiers for IAM Entities</a> in <i>Using AWS Identity
  /// and Access Management</i> for more information.
  final String arn;

  /// The unique identifier for the specified Elasticsearch domain.
  final String domainId;

  /// The name of an Elasticsearch domain. Domain names are unique across the
  /// domains owned by an account within an AWS region. Domain names start with a
  /// letter or number and can contain the following characters: a-z (lowercase),
  /// 0-9, and - (hyphen).
  final String domainName;

  /// The type and number of instances in the domain cluster.
  final ElasticsearchClusterConfig elasticsearchClusterConfig;

  /// IAM access policy as a JSON-formatted string.
  final String? accessPolicies;

  /// Specifies the status of the <code>AdvancedOptions</code>
  final Map<String, String>? advancedOptions;

  /// The current status of the Elasticsearch domain's advanced security options.
  final AdvancedSecurityOptions? advancedSecurityOptions;

  /// The current status of the Elasticsearch domain's Auto-Tune options.
  final AutoTuneOptionsOutput? autoTuneOptions;

  /// Specifies change details of the domain configuration change.
  final ChangeProgressDetails? changeProgressDetails;

  /// The <code>CognitoOptions</code> for the specified domain. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html"
  /// target="_blank">Amazon Cognito Authentication for Kibana</a>.
  final CognitoOptions? cognitoOptions;

  /// The domain creation status. <code>True</code> if the creation of an
  /// Elasticsearch domain is complete. <code>False</code> if domain creation is
  /// still in progress.
  final bool? created;

  /// The domain deletion status. <code>True</code> if a delete request has been
  /// received for the domain but resource cleanup is still in progress.
  /// <code>False</code> if the domain has not been deleted. Once domain deletion
  /// is complete, the status of the domain is no longer returned.
  final bool? deleted;

  /// The current status of the Elasticsearch domain's endpoint options.
  final DomainEndpointOptions? domainEndpointOptions;

  /// The status of any changes that are currently in progress for the domain.
  final DomainProcessingStatusType? domainProcessingStatus;

  /// The <code>EBSOptions</code> for the specified domain. See <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-ebs"
  /// target="_blank">Configuring EBS-based Storage</a> for more information.
  final EBSOptions? eBSOptions;
  final String? elasticsearchVersion;

  /// Specifies the status of the <code>EncryptionAtRestOptions</code>.
  final EncryptionAtRestOptions? encryptionAtRestOptions;

  /// The Elasticsearch domain endpoint that you use to submit index and search
  /// requests.
  final String? endpoint;

  /// Map containing the Elasticsearch domain endpoints used to submit index and
  /// search requests. Example <code>key, value</code>:
  /// <code>'vpc','vpc-endpoint-h2dsd34efgyghrtguk5gt6j2foh4.us-east-1.es.amazonaws.com'</code>.
  final Map<String, String>? endpoints;

  /// Log publishing options for the given domain.
  final Map<LogType, LogPublishingOption>? logPublishingOptions;

  /// Information about the domain properties that are currently being modified.
  final List<ModifyingProperties>? modifyingProperties;

  /// Specifies the status of the <code>NodeToNodeEncryptionOptions</code>.
  final NodeToNodeEncryptionOptions? nodeToNodeEncryptionOptions;

  /// The status of the Elasticsearch domain configuration. <code>True</code> if
  /// Amazon Elasticsearch Service is processing configuration changes.
  /// <code>False</code> if the configuration is active.
  final bool? processing;

  /// The current status of the Elasticsearch domain's service software.
  final ServiceSoftwareOptions? serviceSoftwareOptions;

  /// Specifies the status of the <code>SnapshotOptions</code>
  final SnapshotOptions? snapshotOptions;

  /// The status of an Elasticsearch domain version upgrade. <code>True</code> if
  /// Amazon Elasticsearch Service is undergoing a version upgrade.
  /// <code>False</code> if the configuration is active.
  final bool? upgradeProcessing;

  /// The <code>VPCOptions</code> for the specified domain. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html"
  /// target="_blank">VPC Endpoints for Amazon Elasticsearch Service Domains</a>.
  final VPCDerivedInfo? vPCOptions;

  ElasticsearchDomainStatus({
    required this.arn,
    required this.domainId,
    required this.domainName,
    required this.elasticsearchClusterConfig,
    this.accessPolicies,
    this.advancedOptions,
    this.advancedSecurityOptions,
    this.autoTuneOptions,
    this.changeProgressDetails,
    this.cognitoOptions,
    this.created,
    this.deleted,
    this.domainEndpointOptions,
    this.domainProcessingStatus,
    this.eBSOptions,
    this.elasticsearchVersion,
    this.encryptionAtRestOptions,
    this.endpoint,
    this.endpoints,
    this.logPublishingOptions,
    this.modifyingProperties,
    this.nodeToNodeEncryptionOptions,
    this.processing,
    this.serviceSoftwareOptions,
    this.snapshotOptions,
    this.upgradeProcessing,
    this.vPCOptions,
  });

  factory ElasticsearchDomainStatus.fromJson(Map<String, dynamic> json) {
    return ElasticsearchDomainStatus(
      arn: json['ARN'] as String,
      domainId: json['DomainId'] as String,
      domainName: json['DomainName'] as String,
      elasticsearchClusterConfig: ElasticsearchClusterConfig.fromJson(
          json['ElasticsearchClusterConfig'] as Map<String, dynamic>),
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
      domainProcessingStatus: (json['DomainProcessingStatus'] as String?)
          ?.toDomainProcessingStatusType(),
      eBSOptions: json['EBSOptions'] != null
          ? EBSOptions.fromJson(json['EBSOptions'] as Map<String, dynamic>)
          : null,
      elasticsearchVersion: json['ElasticsearchVersion'] as String?,
      encryptionAtRestOptions: json['EncryptionAtRestOptions'] != null
          ? EncryptionAtRestOptions.fromJson(
              json['EncryptionAtRestOptions'] as Map<String, dynamic>)
          : null,
      endpoint: json['Endpoint'] as String?,
      endpoints: (json['Endpoints'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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
    final domainId = this.domainId;
    final domainName = this.domainName;
    final elasticsearchClusterConfig = this.elasticsearchClusterConfig;
    final accessPolicies = this.accessPolicies;
    final advancedOptions = this.advancedOptions;
    final advancedSecurityOptions = this.advancedSecurityOptions;
    final autoTuneOptions = this.autoTuneOptions;
    final changeProgressDetails = this.changeProgressDetails;
    final cognitoOptions = this.cognitoOptions;
    final created = this.created;
    final deleted = this.deleted;
    final domainEndpointOptions = this.domainEndpointOptions;
    final domainProcessingStatus = this.domainProcessingStatus;
    final eBSOptions = this.eBSOptions;
    final elasticsearchVersion = this.elasticsearchVersion;
    final encryptionAtRestOptions = this.encryptionAtRestOptions;
    final endpoint = this.endpoint;
    final endpoints = this.endpoints;
    final logPublishingOptions = this.logPublishingOptions;
    final modifyingProperties = this.modifyingProperties;
    final nodeToNodeEncryptionOptions = this.nodeToNodeEncryptionOptions;
    final processing = this.processing;
    final serviceSoftwareOptions = this.serviceSoftwareOptions;
    final snapshotOptions = this.snapshotOptions;
    final upgradeProcessing = this.upgradeProcessing;
    final vPCOptions = this.vPCOptions;
    return {
      'ARN': arn,
      'DomainId': domainId,
      'DomainName': domainName,
      'ElasticsearchClusterConfig': elasticsearchClusterConfig,
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
      if (domainProcessingStatus != null)
        'DomainProcessingStatus': domainProcessingStatus.toValue(),
      if (eBSOptions != null) 'EBSOptions': eBSOptions,
      if (elasticsearchVersion != null)
        'ElasticsearchVersion': elasticsearchVersion,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (endpoint != null) 'Endpoint': endpoint,
      if (endpoints != null) 'Endpoints': endpoints,
      if (logPublishingOptions != null)
        'LogPublishingOptions':
            logPublishingOptions.map((k, e) => MapEntry(k.toValue(), e)),
      if (modifyingProperties != null)
        'ModifyingProperties': modifyingProperties,
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

/// Status of the Elasticsearch version options for the specified Elasticsearch
/// domain.
class ElasticsearchVersionStatus {
  /// Specifies the Elasticsearch version for the specified Elasticsearch domain.
  final String options;

  /// Specifies the status of the Elasticsearch version options for the specified
  /// Elasticsearch domain.
  final OptionStatus status;

  ElasticsearchVersionStatus({
    required this.options,
    required this.status,
  });

  factory ElasticsearchVersionStatus.fromJson(Map<String, dynamic> json) {
    return ElasticsearchVersionStatus(
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

/// Specifies the Encryption At Rest Options.
class EncryptionAtRestOptions {
  /// Specifies the option to enable Encryption At Rest.
  final bool? enabled;

  /// Specifies the KMS Key ID for Encryption At Rest options.
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

/// Status of the Encryption At Rest options for the specified Elasticsearch
/// domain.
class EncryptionAtRestOptionsStatus {
  /// Specifies the Encryption At Rest options for the specified Elasticsearch
  /// domain.
  final EncryptionAtRestOptions options;

  /// Specifies the status of the Encryption At Rest options for the specified
  /// Elasticsearch domain.
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
/// cross-cluster search connections. Multiple values can be specified per
/// filter. A cross-cluster search connection must match at least one of the
/// specified values for it to be returned from an operation.
class Filter {
  /// Specifies the name of the filter.
  final String? name;

  /// Contains one or more values for the filter.
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

/// Container for response returned by <code>
/// <a>GetCompatibleElasticsearchVersions</a> </code> operation.
class GetCompatibleElasticsearchVersionsResponse {
  /// A map of compatible Elasticsearch versions returned as part of the <code>
  /// <a>GetCompatibleElasticsearchVersions</a> </code> operation.
  final List<CompatibleVersionsMap>? compatibleElasticsearchVersions;

  GetCompatibleElasticsearchVersionsResponse({
    this.compatibleElasticsearchVersions,
  });

  factory GetCompatibleElasticsearchVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCompatibleElasticsearchVersionsResponse(
      compatibleElasticsearchVersions: (json['CompatibleElasticsearchVersions']
              as List?)
          ?.whereNotNull()
          .map((e) => CompatibleVersionsMap.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleElasticsearchVersions =
        this.compatibleElasticsearchVersions;
    return {
      if (compatibleElasticsearchVersions != null)
        'CompatibleElasticsearchVersions': compatibleElasticsearchVersions,
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

/// Container for response returned by <code> <a>GetUpgradeHistory</a> </code>
/// operation.
class GetUpgradeHistoryResponse {
  /// Pagination token that needs to be supplied to the next call to get the next
  /// page of results
  final String? nextToken;

  /// A list of <code> <a>UpgradeHistory</a> </code> objects corresponding to each
  /// Upgrade or Upgrade Eligibility Check performed on a domain returned as part
  /// of <code> <a>GetUpgradeHistoryResponse</a> </code> object.
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

/// Container for response returned by <code> <a>GetUpgradeStatus</a> </code>
/// operation.
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
  final UpgradeStatus? stepStatus;

  /// A string that describes the update briefly
  final String? upgradeName;

  /// Represents one of 3 steps that an Upgrade or Upgrade Eligibility Check does
  /// through:
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

/// Specifies details of an inbound connection.
class InboundCrossClusterSearchConnection {
  /// Specifies the <code><a>InboundCrossClusterSearchConnectionStatus</a></code>
  /// for the outbound connection.
  final InboundCrossClusterSearchConnectionStatus? connectionStatus;

  /// Specifies the connection id for the inbound cross-cluster search connection.
  final String? crossClusterSearchConnectionId;

  /// Specifies the <code><a>DomainInformation</a></code> for the destination
  /// Elasticsearch domain.
  final DomainInformation? destinationDomainInfo;

  /// Specifies the <code><a>DomainInformation</a></code> for the source
  /// Elasticsearch domain.
  final DomainInformation? sourceDomainInfo;

  InboundCrossClusterSearchConnection({
    this.connectionStatus,
    this.crossClusterSearchConnectionId,
    this.destinationDomainInfo,
    this.sourceDomainInfo,
  });

  factory InboundCrossClusterSearchConnection.fromJson(
      Map<String, dynamic> json) {
    return InboundCrossClusterSearchConnection(
      connectionStatus: json['ConnectionStatus'] != null
          ? InboundCrossClusterSearchConnectionStatus.fromJson(
              json['ConnectionStatus'] as Map<String, dynamic>)
          : null,
      crossClusterSearchConnectionId:
          json['CrossClusterSearchConnectionId'] as String?,
      destinationDomainInfo: json['DestinationDomainInfo'] != null
          ? DomainInformation.fromJson(
              json['DestinationDomainInfo'] as Map<String, dynamic>)
          : null,
      sourceDomainInfo: json['SourceDomainInfo'] != null
          ? DomainInformation.fromJson(
              json['SourceDomainInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionStatus = this.connectionStatus;
    final crossClusterSearchConnectionId = this.crossClusterSearchConnectionId;
    final destinationDomainInfo = this.destinationDomainInfo;
    final sourceDomainInfo = this.sourceDomainInfo;
    return {
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (crossClusterSearchConnectionId != null)
        'CrossClusterSearchConnectionId': crossClusterSearchConnectionId,
      if (destinationDomainInfo != null)
        'DestinationDomainInfo': destinationDomainInfo,
      if (sourceDomainInfo != null) 'SourceDomainInfo': sourceDomainInfo,
    };
  }
}

/// Specifies the coonection status of an inbound cross-cluster search
/// connection.
class InboundCrossClusterSearchConnectionStatus {
  /// Specifies verbose information for the inbound connection status.
  final String? message;

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
  final InboundCrossClusterSearchConnectionStatusCode? statusCode;

  InboundCrossClusterSearchConnectionStatus({
    this.message,
    this.statusCode,
  });

  factory InboundCrossClusterSearchConnectionStatus.fromJson(
      Map<String, dynamic> json) {
    return InboundCrossClusterSearchConnectionStatus(
      message: json['Message'] as String?,
      statusCode: (json['StatusCode'] as String?)
          ?.toInboundCrossClusterSearchConnectionStatusCode(),
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

enum InboundCrossClusterSearchConnectionStatusCode {
  pendingAcceptance,
  approved,
  rejecting,
  rejected,
  deleting,
  deleted,
}

extension InboundCrossClusterSearchConnectionStatusCodeValueExtension
    on InboundCrossClusterSearchConnectionStatusCode {
  String toValue() {
    switch (this) {
      case InboundCrossClusterSearchConnectionStatusCode.pendingAcceptance:
        return 'PENDING_ACCEPTANCE';
      case InboundCrossClusterSearchConnectionStatusCode.approved:
        return 'APPROVED';
      case InboundCrossClusterSearchConnectionStatusCode.rejecting:
        return 'REJECTING';
      case InboundCrossClusterSearchConnectionStatusCode.rejected:
        return 'REJECTED';
      case InboundCrossClusterSearchConnectionStatusCode.deleting:
        return 'DELETING';
      case InboundCrossClusterSearchConnectionStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension InboundCrossClusterSearchConnectionStatusCodeFromString on String {
  InboundCrossClusterSearchConnectionStatusCode
      toInboundCrossClusterSearchConnectionStatusCode() {
    switch (this) {
      case 'PENDING_ACCEPTANCE':
        return InboundCrossClusterSearchConnectionStatusCode.pendingAcceptance;
      case 'APPROVED':
        return InboundCrossClusterSearchConnectionStatusCode.approved;
      case 'REJECTING':
        return InboundCrossClusterSearchConnectionStatusCode.rejecting;
      case 'REJECTED':
        return InboundCrossClusterSearchConnectionStatusCode.rejected;
      case 'DELETING':
        return InboundCrossClusterSearchConnectionStatusCode.deleting;
      case 'DELETED':
        return InboundCrossClusterSearchConnectionStatusCode.deleted;
    }
    throw Exception(
        '$this is not known in enum InboundCrossClusterSearchConnectionStatusCode');
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

/// InstanceCountLimits represents the limits on number of instances that be
/// created in Amazon Elasticsearch for given InstanceType.
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

/// InstanceLimits represents the list of instance related attributes that are
/// available for given InstanceType.
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

/// Limits for given InstanceType and for each of it's role. <br/> Limits
/// contains following <code> <a>StorageTypes,</a> </code> <code>
/// <a>InstanceLimits</a> </code> and <code> <a>AdditionalLimits</a> </code>
class Limits {
  /// List of additional limits that are specific to a given InstanceType and for
  /// each of it's <code> <a>InstanceRole</a> </code> .
  final List<AdditionalLimit>? additionalLimits;
  final InstanceLimits? instanceLimits;

  /// StorageType represents the list of storage related types and attributes that
  /// are available for given InstanceType.
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

/// Container for response parameters to <code> <a>ListDomainsForPackage</a>
/// </code> operation.
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

/// Container for the parameters returned by <code>
/// <a>ListElasticsearchInstanceTypes</a> </code> operation.
class ListElasticsearchInstanceTypesResponse {
  /// List of instance types supported by Amazon Elasticsearch service for given
  /// <code> <a>ElasticsearchVersion</a> </code>
  final List<ESPartitionInstanceType>? elasticsearchInstanceTypes;

  /// In case if there are more results available NextToken would be present, make
  /// further request to the same API with received NextToken to paginate
  /// remaining results.
  final String? nextToken;

  ListElasticsearchInstanceTypesResponse({
    this.elasticsearchInstanceTypes,
    this.nextToken,
  });

  factory ListElasticsearchInstanceTypesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListElasticsearchInstanceTypesResponse(
      elasticsearchInstanceTypes: (json['ElasticsearchInstanceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toESPartitionInstanceType())
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final elasticsearchInstanceTypes = this.elasticsearchInstanceTypes;
    final nextToken = this.nextToken;
    return {
      if (elasticsearchInstanceTypes != null)
        'ElasticsearchInstanceTypes':
            elasticsearchInstanceTypes.map((e) => e.toValue()).toList(),
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Container for the parameters for response received from <code>
/// <a>ListElasticsearchVersions</a> </code> operation.
class ListElasticsearchVersionsResponse {
  final List<String>? elasticsearchVersions;
  final String? nextToken;

  ListElasticsearchVersionsResponse({
    this.elasticsearchVersions,
    this.nextToken,
  });

  factory ListElasticsearchVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListElasticsearchVersionsResponse(
      elasticsearchVersions: (json['ElasticsearchVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final elasticsearchVersions = this.elasticsearchVersions;
    final nextToken = this.nextToken;
    return {
      if (elasticsearchVersions != null)
        'ElasticsearchVersions': elasticsearchVersions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Container for response parameters to <code> <a>ListPackagesForDomain</a>
/// </code> operation.
class ListPackagesForDomainResponse {
  /// List of <code>DomainPackageDetails</code> objects.
  final List<DomainPackageDetails>? domainPackageDetailsList;

  /// Pagination token that needs to be supplied to the next call to get the next
  /// page of results.
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
/// requested Elasticsearch domains.
class ListTagsResponse {
  /// List of <code>Tag</code> for the requested Elasticsearch domain.
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

/// Container for response parameters to the
/// <code><a>ListVpcEndpointAccess</a></code> operation. Returns a list of
/// accounts id and account type authorized to manage VPC endpoints.
class ListVpcEndpointAccessResponse {
  /// List of <code>AuthorizedPrincipal</code> describing the details of the
  /// permissions to manage VPC endpoints against the specified domain.
  final List<AuthorizedPrincipal> authorizedPrincipalList;

  /// Provides an identifier to allow retrieval of paginated results.
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

/// Container for response parameters to the
/// <code><a>ListVpcEndpointsForDomain</a></code> operation. Returns a list
/// containing summarized details of the VPC endpoints.
class ListVpcEndpointsForDomainResponse {
  /// Information about each endpoint associated with the domain.
  final String nextToken;

  /// Provides list of <code>VpcEndpointSummary</code> summarizing details of the
  /// VPC endpoints.
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

/// Container for response parameters to the
/// <code><a>ListVpcEndpoints</a></code> operation. Returns a list containing
/// summarized details of the VPC endpoints.
class ListVpcEndpointsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
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

/// Log Publishing option that is set for given domain. <br/>Attributes and
/// their details:
/// <ul>
/// <li>CloudWatchLogsLogGroupArn: ARN of the Cloudwatch log group to which log
/// needs to be published.</li>
/// <li>Enabled: Whether the log publishing for given log type is enabled or
/// not</li>
/// </ul>
class LogPublishingOption {
  final String? cloudWatchLogsLogGroupArn;

  /// Specifies whether given log publishing option is enabled or not.
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
  /// The log publishing options configured for the Elasticsearch domain.
  final Map<LogType, LogPublishingOption>? options;

  /// The status of the log publishing options for the Elasticsearch domain. See
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

/// Credentials for the master user: username and password, ARN, or both.
class MasterUserOptions {
  /// ARN for the master user (if IAM is enabled).
  final String? masterUserARN;

  /// The master user's username, which is stored in the Amazon Elasticsearch
  /// Service domain's internal database.
  final String? masterUserName;

  /// The master user's password, which is stored in the Amazon Elasticsearch
  /// Service domain's internal database.
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
  /// <li><b>PLAIN_TEXT</b>: Contain direct values such as "1", "True", or
  /// "c5.large.search".</li>
  /// <li><b>STRINGIFIED_JSON</b>: Contain content in JSON format, such as
  /// {"Enabled":"True"}".</li>
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

/// Specifies the node-to-node encryption options.
class NodeToNodeEncryptionOptions {
  /// Specify true to enable node-to-node encryption.
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

/// Status of the node-to-node encryption options for the specified
/// Elasticsearch domain.
class NodeToNodeEncryptionOptionsStatus {
  /// Specifies the node-to-node encryption options for the specified
  /// Elasticsearch domain.
  final NodeToNodeEncryptionOptions options;

  /// Specifies the status of the node-to-node encryption options for the
  /// specified Elasticsearch domain.
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

/// The state of a requested change. One of the following:
///
/// <ul>
/// <li>Processing: The request change is still in-process.</li>
/// <li>Active: The request change is processed and deployed to the
/// Elasticsearch domain.</li>
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

/// Provides the current status of the entity.
class OptionStatus {
  /// Timestamp which tells the creation date for the entity.
  final DateTime creationDate;

  /// Provides the <code>OptionState</code> for the Elasticsearch domain.
  final OptionState state;

  /// Timestamp which tells the last updated time for the entity.
  final DateTime updateDate;

  /// Indicates whether the Elasticsearch domain is being deleted.
  final bool? pendingDeletion;

  /// Specifies the latest version for the entity.
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

/// Specifies details of an outbound connection.
class OutboundCrossClusterSearchConnection {
  /// Specifies the connection alias for the outbound cross-cluster search
  /// connection.
  final String? connectionAlias;

  /// Specifies the <code><a>OutboundCrossClusterSearchConnectionStatus</a></code>
  /// for the outbound connection.
  final OutboundCrossClusterSearchConnectionStatus? connectionStatus;

  /// Specifies the connection id for the outbound cross-cluster search
  /// connection.
  final String? crossClusterSearchConnectionId;

  /// Specifies the <code><a>DomainInformation</a></code> for the destination
  /// Elasticsearch domain.
  final DomainInformation? destinationDomainInfo;

  /// Specifies the <code><a>DomainInformation</a></code> for the source
  /// Elasticsearch domain.
  final DomainInformation? sourceDomainInfo;

  OutboundCrossClusterSearchConnection({
    this.connectionAlias,
    this.connectionStatus,
    this.crossClusterSearchConnectionId,
    this.destinationDomainInfo,
    this.sourceDomainInfo,
  });

  factory OutboundCrossClusterSearchConnection.fromJson(
      Map<String, dynamic> json) {
    return OutboundCrossClusterSearchConnection(
      connectionAlias: json['ConnectionAlias'] as String?,
      connectionStatus: json['ConnectionStatus'] != null
          ? OutboundCrossClusterSearchConnectionStatus.fromJson(
              json['ConnectionStatus'] as Map<String, dynamic>)
          : null,
      crossClusterSearchConnectionId:
          json['CrossClusterSearchConnectionId'] as String?,
      destinationDomainInfo: json['DestinationDomainInfo'] != null
          ? DomainInformation.fromJson(
              json['DestinationDomainInfo'] as Map<String, dynamic>)
          : null,
      sourceDomainInfo: json['SourceDomainInfo'] != null
          ? DomainInformation.fromJson(
              json['SourceDomainInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionAlias = this.connectionAlias;
    final connectionStatus = this.connectionStatus;
    final crossClusterSearchConnectionId = this.crossClusterSearchConnectionId;
    final destinationDomainInfo = this.destinationDomainInfo;
    final sourceDomainInfo = this.sourceDomainInfo;
    return {
      if (connectionAlias != null) 'ConnectionAlias': connectionAlias,
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (crossClusterSearchConnectionId != null)
        'CrossClusterSearchConnectionId': crossClusterSearchConnectionId,
      if (destinationDomainInfo != null)
        'DestinationDomainInfo': destinationDomainInfo,
      if (sourceDomainInfo != null) 'SourceDomainInfo': sourceDomainInfo,
    };
  }
}

/// Specifies the connection status of an outbound cross-cluster search
/// connection.
class OutboundCrossClusterSearchConnectionStatus {
  /// Specifies verbose information for the outbound connection status.
  final String? message;

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
  final OutboundCrossClusterSearchConnectionStatusCode? statusCode;

  OutboundCrossClusterSearchConnectionStatus({
    this.message,
    this.statusCode,
  });

  factory OutboundCrossClusterSearchConnectionStatus.fromJson(
      Map<String, dynamic> json) {
    return OutboundCrossClusterSearchConnectionStatus(
      message: json['Message'] as String?,
      statusCode: (json['StatusCode'] as String?)
          ?.toOutboundCrossClusterSearchConnectionStatusCode(),
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

enum OutboundCrossClusterSearchConnectionStatusCode {
  pendingAcceptance,
  validating,
  validationFailed,
  provisioning,
  active,
  rejected,
  deleting,
  deleted,
}

extension OutboundCrossClusterSearchConnectionStatusCodeValueExtension
    on OutboundCrossClusterSearchConnectionStatusCode {
  String toValue() {
    switch (this) {
      case OutboundCrossClusterSearchConnectionStatusCode.pendingAcceptance:
        return 'PENDING_ACCEPTANCE';
      case OutboundCrossClusterSearchConnectionStatusCode.validating:
        return 'VALIDATING';
      case OutboundCrossClusterSearchConnectionStatusCode.validationFailed:
        return 'VALIDATION_FAILED';
      case OutboundCrossClusterSearchConnectionStatusCode.provisioning:
        return 'PROVISIONING';
      case OutboundCrossClusterSearchConnectionStatusCode.active:
        return 'ACTIVE';
      case OutboundCrossClusterSearchConnectionStatusCode.rejected:
        return 'REJECTED';
      case OutboundCrossClusterSearchConnectionStatusCode.deleting:
        return 'DELETING';
      case OutboundCrossClusterSearchConnectionStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension OutboundCrossClusterSearchConnectionStatusCodeFromString on String {
  OutboundCrossClusterSearchConnectionStatusCode
      toOutboundCrossClusterSearchConnectionStatusCode() {
    switch (this) {
      case 'PENDING_ACCEPTANCE':
        return OutboundCrossClusterSearchConnectionStatusCode.pendingAcceptance;
      case 'VALIDATING':
        return OutboundCrossClusterSearchConnectionStatusCode.validating;
      case 'VALIDATION_FAILED':
        return OutboundCrossClusterSearchConnectionStatusCode.validationFailed;
      case 'PROVISIONING':
        return OutboundCrossClusterSearchConnectionStatusCode.provisioning;
      case 'ACTIVE':
        return OutboundCrossClusterSearchConnectionStatusCode.active;
      case 'REJECTED':
        return OutboundCrossClusterSearchConnectionStatusCode.rejected;
      case 'DELETING':
        return OutboundCrossClusterSearchConnectionStatusCode.deleting;
      case 'DELETED':
        return OutboundCrossClusterSearchConnectionStatusCode.deleted;
    }
    throw Exception(
        '$this is not known in enum OutboundCrossClusterSearchConnectionStatusCode');
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
  final String? availablePackageVersion;

  /// Timestamp which tells creation date of the package.
  final DateTime? createdAt;

  /// Additional information if the package is in an error state. Null otherwise.
  final ErrorDetails? errorDetails;
  final DateTime? lastUpdatedAt;

  /// User-specified description of the package.
  final String? packageDescription;

  /// Internal ID of the package.
  final String? packageID;

  /// User specified name of the package.
  final String? packageName;

  /// Current state of the package. Values are
  /// COPYING/COPY_FAILED/AVAILABLE/DELETING/DELETE_FAILED
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

/// The S3 location for importing the package specified as
/// <code>S3BucketName</code> and <code>S3Key</code>
class PackageSource {
  /// Name of the bucket containing the package.
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
}

extension PackageTypeValueExtension on PackageType {
  String toValue() {
    switch (this) {
      case PackageType.txtDictionary:
        return 'TXT-DICTIONARY';
    }
  }
}

extension PackageTypeFromString on String {
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
  /// A message associated with the version.
  final String? commitMessage;

  /// Timestamp which tells creation time of the package version.
  final DateTime? createdAt;

  /// Version of the package.
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

/// Specifies the type of AWS account permitted to manage VPC endpoints.:
/// <ul>
/// <li>AWS_ACCOUNT: Indicates that the account is owned by an AWS user.</li>
/// <li>AWS_SERVICE: Indicates the the account is owned by an AWS service.</li>
/// </ul>
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

/// Represents the output of a
/// <code>PurchaseReservedElasticsearchInstanceOffering</code> operation.
class PurchaseReservedElasticsearchInstanceOfferingResponse {
  /// The customer-specified identifier used to track this reservation.
  final String? reservationName;

  /// Details of the reserved Elasticsearch instance which was purchased.
  final String? reservedElasticsearchInstanceId;

  PurchaseReservedElasticsearchInstanceOfferingResponse({
    this.reservationName,
    this.reservedElasticsearchInstanceId,
  });

  factory PurchaseReservedElasticsearchInstanceOfferingResponse.fromJson(
      Map<String, dynamic> json) {
    return PurchaseReservedElasticsearchInstanceOfferingResponse(
      reservationName: json['ReservationName'] as String?,
      reservedElasticsearchInstanceId:
          json['ReservedElasticsearchInstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reservationName = this.reservationName;
    final reservedElasticsearchInstanceId =
        this.reservedElasticsearchInstanceId;
    return {
      if (reservationName != null) 'ReservationName': reservationName,
      if (reservedElasticsearchInstanceId != null)
        'ReservedElasticsearchInstanceId': reservedElasticsearchInstanceId,
    };
  }
}

/// Contains the specific price and frequency of a recurring charges for a
/// reserved Elasticsearch instance, or for a reserved Elasticsearch instance
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

/// The result of a
/// <code><a>RejectInboundCrossClusterSearchConnection</a></code> operation.
/// Contains details of rejected inbound connection.
class RejectInboundCrossClusterSearchConnectionResponse {
  /// Specifies the <code><a>InboundCrossClusterSearchConnection</a></code> of
  /// rejected inbound connection.
  final InboundCrossClusterSearchConnection? crossClusterSearchConnection;

  RejectInboundCrossClusterSearchConnectionResponse({
    this.crossClusterSearchConnection,
  });

  factory RejectInboundCrossClusterSearchConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return RejectInboundCrossClusterSearchConnectionResponse(
      crossClusterSearchConnection: json['CrossClusterSearchConnection'] != null
          ? InboundCrossClusterSearchConnection.fromJson(
              json['CrossClusterSearchConnection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final crossClusterSearchConnection = this.crossClusterSearchConnection;
    return {
      if (crossClusterSearchConnection != null)
        'CrossClusterSearchConnection': crossClusterSearchConnection,
    };
  }
}

/// Details of a reserved Elasticsearch instance.
class ReservedElasticsearchInstance {
  /// The currency code for the reserved Elasticsearch instance offering.
  final String? currencyCode;

  /// The duration, in seconds, for which the Elasticsearch instance is reserved.
  final int? duration;

  /// The number of Elasticsearch instances that have been reserved.
  final int? elasticsearchInstanceCount;

  /// The Elasticsearch instance type offered by the reserved instance offering.
  final ESPartitionInstanceType? elasticsearchInstanceType;

  /// The upfront fixed charge you will paid to purchase the specific reserved
  /// Elasticsearch instance offering.
  final double? fixedPrice;

  /// The payment option as defined in the reserved Elasticsearch instance
  /// offering.
  final ReservedElasticsearchInstancePaymentOption? paymentOption;

  /// The charge to your account regardless of whether you are creating any
  /// domains using the instance offering.
  final List<RecurringCharge>? recurringCharges;

  /// The customer-specified identifier to track this reservation.
  final String? reservationName;

  /// The unique identifier for the reservation.
  final String? reservedElasticsearchInstanceId;

  /// The offering identifier.
  final String? reservedElasticsearchInstanceOfferingId;

  /// The time the reservation started.
  final DateTime? startTime;

  /// The state of the reserved Elasticsearch instance.
  final String? state;

  /// The rate you are charged for each hour for the domain that is using this
  /// reserved instance.
  final double? usagePrice;

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

  factory ReservedElasticsearchInstance.fromJson(Map<String, dynamic> json) {
    return ReservedElasticsearchInstance(
      currencyCode: json['CurrencyCode'] as String?,
      duration: json['Duration'] as int?,
      elasticsearchInstanceCount: json['ElasticsearchInstanceCount'] as int?,
      elasticsearchInstanceType: (json['ElasticsearchInstanceType'] as String?)
          ?.toESPartitionInstanceType(),
      fixedPrice: json['FixedPrice'] as double?,
      paymentOption: (json['PaymentOption'] as String?)
          ?.toReservedElasticsearchInstancePaymentOption(),
      recurringCharges: (json['RecurringCharges'] as List?)
          ?.whereNotNull()
          .map((e) => RecurringCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      reservationName: json['ReservationName'] as String?,
      reservedElasticsearchInstanceId:
          json['ReservedElasticsearchInstanceId'] as String?,
      reservedElasticsearchInstanceOfferingId:
          json['ReservedElasticsearchInstanceOfferingId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      state: json['State'] as String?,
      usagePrice: json['UsagePrice'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final elasticsearchInstanceCount = this.elasticsearchInstanceCount;
    final elasticsearchInstanceType = this.elasticsearchInstanceType;
    final fixedPrice = this.fixedPrice;
    final paymentOption = this.paymentOption;
    final recurringCharges = this.recurringCharges;
    final reservationName = this.reservationName;
    final reservedElasticsearchInstanceId =
        this.reservedElasticsearchInstanceId;
    final reservedElasticsearchInstanceOfferingId =
        this.reservedElasticsearchInstanceOfferingId;
    final startTime = this.startTime;
    final state = this.state;
    final usagePrice = this.usagePrice;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (duration != null) 'Duration': duration,
      if (elasticsearchInstanceCount != null)
        'ElasticsearchInstanceCount': elasticsearchInstanceCount,
      if (elasticsearchInstanceType != null)
        'ElasticsearchInstanceType': elasticsearchInstanceType.toValue(),
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (paymentOption != null) 'PaymentOption': paymentOption.toValue(),
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservationName != null) 'ReservationName': reservationName,
      if (reservedElasticsearchInstanceId != null)
        'ReservedElasticsearchInstanceId': reservedElasticsearchInstanceId,
      if (reservedElasticsearchInstanceOfferingId != null)
        'ReservedElasticsearchInstanceOfferingId':
            reservedElasticsearchInstanceOfferingId,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state,
      if (usagePrice != null) 'UsagePrice': usagePrice,
    };
  }
}

/// Details of a reserved Elasticsearch instance offering.
class ReservedElasticsearchInstanceOffering {
  /// The currency code for the reserved Elasticsearch instance offering.
  final String? currencyCode;

  /// The duration, in seconds, for which the offering will reserve the
  /// Elasticsearch instance.
  final int? duration;

  /// The Elasticsearch instance type offered by the reserved instance offering.
  final ESPartitionInstanceType? elasticsearchInstanceType;

  /// The upfront fixed charge you will pay to purchase the specific reserved
  /// Elasticsearch instance offering.
  final double? fixedPrice;

  /// Payment option for the reserved Elasticsearch instance offering
  final ReservedElasticsearchInstancePaymentOption? paymentOption;

  /// The charge to your account regardless of whether you are creating any
  /// domains using the instance offering.
  final List<RecurringCharge>? recurringCharges;

  /// The Elasticsearch reserved instance offering identifier.
  final String? reservedElasticsearchInstanceOfferingId;

  /// The rate you are charged for each hour the domain that is using the offering
  /// is running.
  final double? usagePrice;

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
      Map<String, dynamic> json) {
    return ReservedElasticsearchInstanceOffering(
      currencyCode: json['CurrencyCode'] as String?,
      duration: json['Duration'] as int?,
      elasticsearchInstanceType: (json['ElasticsearchInstanceType'] as String?)
          ?.toESPartitionInstanceType(),
      fixedPrice: json['FixedPrice'] as double?,
      paymentOption: (json['PaymentOption'] as String?)
          ?.toReservedElasticsearchInstancePaymentOption(),
      recurringCharges: (json['RecurringCharges'] as List?)
          ?.whereNotNull()
          .map((e) => RecurringCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      reservedElasticsearchInstanceOfferingId:
          json['ReservedElasticsearchInstanceOfferingId'] as String?,
      usagePrice: json['UsagePrice'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final elasticsearchInstanceType = this.elasticsearchInstanceType;
    final fixedPrice = this.fixedPrice;
    final paymentOption = this.paymentOption;
    final recurringCharges = this.recurringCharges;
    final reservedElasticsearchInstanceOfferingId =
        this.reservedElasticsearchInstanceOfferingId;
    final usagePrice = this.usagePrice;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (duration != null) 'Duration': duration,
      if (elasticsearchInstanceType != null)
        'ElasticsearchInstanceType': elasticsearchInstanceType.toValue(),
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (paymentOption != null) 'PaymentOption': paymentOption.toValue(),
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservedElasticsearchInstanceOfferingId != null)
        'ReservedElasticsearchInstanceOfferingId':
            reservedElasticsearchInstanceOfferingId,
      if (usagePrice != null) 'UsagePrice': usagePrice,
    };
  }
}

enum ReservedElasticsearchInstancePaymentOption {
  allUpfront,
  partialUpfront,
  noUpfront,
}

extension ReservedElasticsearchInstancePaymentOptionValueExtension
    on ReservedElasticsearchInstancePaymentOption {
  String toValue() {
    switch (this) {
      case ReservedElasticsearchInstancePaymentOption.allUpfront:
        return 'ALL_UPFRONT';
      case ReservedElasticsearchInstancePaymentOption.partialUpfront:
        return 'PARTIAL_UPFRONT';
      case ReservedElasticsearchInstancePaymentOption.noUpfront:
        return 'NO_UPFRONT';
    }
  }
}

extension ReservedElasticsearchInstancePaymentOptionFromString on String {
  ReservedElasticsearchInstancePaymentOption
      toReservedElasticsearchInstancePaymentOption() {
    switch (this) {
      case 'ALL_UPFRONT':
        return ReservedElasticsearchInstancePaymentOption.allUpfront;
      case 'PARTIAL_UPFRONT':
        return ReservedElasticsearchInstancePaymentOption.partialUpfront;
      case 'NO_UPFRONT':
        return ReservedElasticsearchInstancePaymentOption.noUpfront;
    }
    throw Exception(
        '$this is not known in enum ReservedElasticsearchInstancePaymentOption');
  }
}

/// Container for response parameters to the
/// <code><a>RevokeVpcEndpointAccess</a></code> operation. The response body for
/// this operation is empty.
class RevokeVpcEndpointAccessResponse {
  RevokeVpcEndpointAccessResponse();

  factory RevokeVpcEndpointAccessResponse.fromJson(Map<String, dynamic> _) {
    return RevokeVpcEndpointAccessResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies the rollback state while disabling Auto-Tune for the domain. Valid
/// values are NO_ROLLBACK, DEFAULT_ROLLBACK.
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

/// Specifies the SAML Identity Provider's information.
class SAMLIdp {
  /// The unique Entity ID of the application in SAML Identity Provider.
  final String entityId;

  /// The Metadata of the SAML application in xml format.
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

/// Specifies the SAML application configuration for the domain.
class SAMLOptionsInput {
  /// True if SAML is enabled.
  final bool? enabled;

  /// Specifies the SAML Identity Provider's information.
  final SAMLIdp? idp;

  /// The backend role to which the SAML master user is mapped to.
  final String? masterBackendRole;

  /// The SAML master username, which is stored in the Amazon Elasticsearch
  /// Service domain's internal database.
  final String? masterUserName;

  /// The key to use for matching the SAML Roles attribute.
  final String? rolesKey;

  /// The duration, in minutes, after which a user session becomes inactive.
  /// Acceptable values are between 1 and 1440, and the default value is 60.
  final int? sessionTimeoutMinutes;

  /// The key to use for matching the SAML Subject attribute.
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

  /// Describes the SAML Identity Provider's information.
  final SAMLIdp? idp;

  /// The key used for matching the SAML Roles attribute.
  final String? rolesKey;

  /// The duration, in minutes, after which a user session becomes inactive.
  final int? sessionTimeoutMinutes;

  /// The key used for matching the SAML Subject attribute.
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

/// Specifies Auto-Tune action type. Valid values are JVM_HEAP_SIZE_TUNING and
/// JVM_YOUNG_GEN_TUNING.
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

/// Specifies details of the scheduled Auto-Tune action. See the <a
/// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
/// target="_blank">Developer Guide</a> for more information.
class ScheduledAutoTuneDetails {
  /// Specifies Auto-Tune action description.
  final String? action;

  /// Specifies Auto-Tune action type. Valid values are JVM_HEAP_SIZE_TUNING and
  /// JVM_YOUNG_GEN_TUNING.
  final ScheduledAutoTuneActionType? actionType;

  /// Specifies timestamp for the Auto-Tune action scheduled for the domain.
  final DateTime? date;

  /// Specifies Auto-Tune action severity. Valid values are LOW, MEDIUM and HIGH.
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

/// Specifies Auto-Tune action severity. Valid values are LOW, MEDIUM and HIGH.
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

/// The current options of an Elasticsearch domain service software options.
class ServiceSoftwareOptions {
  /// Timestamp, in Epoch time, until which you can manually request a service
  /// software update. After this date, we automatically update your service
  /// software.
  final DateTime? automatedUpdateDate;

  /// <code>True</code> if you are able to cancel your service software version
  /// update. <code>False</code> if you are not able to cancel your service
  /// software version.
  final bool? cancellable;

  /// The current service software version that is present on the domain.
  final String? currentVersion;

  /// The description of the <code>UpdateStatus</code>.
  final String? description;

  /// The new service software version if one is available.
  final String? newVersion;

  /// <code>True</code> if a service software is never automatically updated.
  /// <code>False</code> if a service software is automatically updated after
  /// <code>AutomatedUpdateDate</code>.
  final bool? optionalDeployment;

  /// <code>True</code> if you are able to update you service software version.
  /// <code>False</code> if you are not able to update your service software
  /// version.
  final bool? updateAvailable;

  /// The status of your service software update. This field can take the
  /// following values: <code>ELIGIBLE</code>, <code>PENDING_UPDATE</code>,
  /// <code>IN_PROGRESS</code>, <code>COMPLETED</code>, and
  /// <code>NOT_ELIGIBLE</code>.
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

/// Specifies the time, in UTC format, when the service takes a daily automated
/// snapshot of the specified Elasticsearch domain. Default value is
/// <code>0</code> hours.
class SnapshotOptions {
  /// Specifies the time, in UTC format, when the service takes a daily automated
  /// snapshot of the specified Elasticsearch domain. Default value is
  /// <code>0</code> hours.
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
  /// Specifies the daily snapshot options specified for the Elasticsearch domain.
  final SnapshotOptions options;

  /// Specifies the status of a daily automated snapshot.
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

/// The result of a <code>StartElasticsearchServiceSoftwareUpdate</code>
/// operation. Contains the status of the update.
class StartElasticsearchServiceSoftwareUpdateResponse {
  /// The current status of the Elasticsearch service software update.
  final ServiceSoftwareOptions? serviceSoftwareOptions;

  StartElasticsearchServiceSoftwareUpdateResponse({
    this.serviceSoftwareOptions,
  });

  factory StartElasticsearchServiceSoftwareUpdateResponse.fromJson(
      Map<String, dynamic> json) {
    return StartElasticsearchServiceSoftwareUpdateResponse(
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

/// StorageTypes represents the list of storage related types and their
/// attributes that are available for given InstanceType.
class StorageType {
  final String? storageSubTypeName;

  /// List of limits that are applicable for given storage type.
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

/// Limits that are applicable for given storage type.
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
  /// storage type.It can be empty if it is not applicable.
  /// <li>MaximumThroughput</li> Maximum amount of Throughput that is applicable
  /// for given storage type.It can be empty if it is not applicable.
  /// <li>MinimumThroughput</li> Minimum amount of Throughput that is applicable
  /// for given storage type.It can be empty if it is not applicable. </ol>
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

/// Specifies a key value pair for a resource tag.
class Tag {
  /// Specifies the <code>TagKey</code>, the name of the tag. Tag keys must be
  /// unique for the Elasticsearch domain to which they are attached.
  final String key;

  /// Specifies the <code>TagValue</code>, the value assigned to the corresponding
  /// tag key. Tag values can be null and do not have to be unique in a tag set.
  /// For example, you can have a key value pair in a tag set of <code>project :
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

/// Specifies the unit of a maintenance schedule duration. Valid value is HOUR.
/// See the <a
/// href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/auto-tune.html"
/// target="_blank">Developer Guide</a> for more information.
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

/// The result of an <code>UpdateElasticsearchDomain</code> request. Contains
/// the status of the Elasticsearch domain being updated.
class UpdateElasticsearchDomainConfigResponse {
  /// The status of the updated Elasticsearch domain.
  final ElasticsearchDomainConfig domainConfig;

  /// Contains result of DryRun.
  final DryRunResults? dryRunResults;

  UpdateElasticsearchDomainConfigResponse({
    required this.domainConfig,
    this.dryRunResults,
  });

  factory UpdateElasticsearchDomainConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateElasticsearchDomainConfigResponse(
      domainConfig: ElasticsearchDomainConfig.fromJson(
          json['DomainConfig'] as Map<String, dynamic>),
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

/// Container for response returned by <code> <a>UpdatePackage</a> </code>
/// operation.
class UpdatePackageResponse {
  /// Information about the package <code>PackageDetails</code>.
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

/// Contains the configuration and status of the VPC endpoint being updated.
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

/// Container for response returned by <code> <a>UpgradeElasticsearchDomain</a>
/// </code> operation.
class UpgradeElasticsearchDomainResponse {
  final ChangeProgressDetails? changeProgressDetails;
  final String? domainName;

  /// This flag, when set to True, indicates that an Upgrade Eligibility Check
  /// needs to be performed. This will not actually perform the Upgrade.
  final bool? performCheckOnly;

  /// The version of Elasticsearch that you intend to upgrade the domain to.
  final String? targetVersion;

  UpgradeElasticsearchDomainResponse({
    this.changeProgressDetails,
    this.domainName,
    this.performCheckOnly,
    this.targetVersion,
  });

  factory UpgradeElasticsearchDomainResponse.fromJson(
      Map<String, dynamic> json) {
    return UpgradeElasticsearchDomainResponse(
      changeProgressDetails: json['ChangeProgressDetails'] != null
          ? ChangeProgressDetails.fromJson(
              json['ChangeProgressDetails'] as Map<String, dynamic>)
          : null,
      domainName: json['DomainName'] as String?,
      performCheckOnly: json['PerformCheckOnly'] as bool?,
      targetVersion: json['TargetVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeProgressDetails = this.changeProgressDetails;
    final domainName = this.domainName;
    final performCheckOnly = this.performCheckOnly;
    final targetVersion = this.targetVersion;
    return {
      if (changeProgressDetails != null)
        'ChangeProgressDetails': changeProgressDetails,
      if (domainName != null) 'DomainName': domainName,
      if (performCheckOnly != null) 'PerformCheckOnly': performCheckOnly,
      if (targetVersion != null) 'TargetVersion': targetVersion,
    };
  }
}

/// History of the last 10 Upgrades and Upgrade Eligibility Checks.
class UpgradeHistory {
  /// UTC Timestamp at which the Upgrade API call was made in
  /// "yyyy-MM-ddTHH:mm:ssZ" format.
  final DateTime? startTimestamp;

  /// A list of <code> <a>UpgradeStepItem</a> </code> s representing information
  /// about each step performed as pard of a specific Upgrade or Upgrade
  /// Eligibility Check.
  final List<UpgradeStepItem>? stepsList;

  /// A string that describes the update briefly
  final String? upgradeName;

  /// The overall status of the update. The status can take one of the following
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

/// Represents a single step of the Upgrade or Upgrade Eligibility Check
/// workflow.
class UpgradeStepItem {
  /// A list of strings containing detailed information about the errors
  /// encountered in a particular step.
  final List<String>? issues;

  /// The Floating point value representing progress percentage of a particular
  /// step.
  final double? progressPercent;

  /// Represents one of 3 steps that an Upgrade or Upgrade Eligibility Check does
  /// through:
  /// <ul>
  /// <li>PreUpgradeCheck</li>
  /// <li>Snapshot</li>
  /// <li>Upgrade</li>
  /// </ul>
  final UpgradeStep? upgradeStep;

  /// The status of a particular step during an upgrade. The status can take one
  /// of the following values:
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

/// Options to specify the subnets and security groups for VPC endpoint. For
/// more information, see <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html"
/// target="_blank"> VPC Endpoints for Amazon Elasticsearch Service Domains</a>.
class VPCDerivedInfo {
  /// The availability zones for the Elasticsearch domain. Exists only if the
  /// domain was created with VPCOptions.
  final List<String>? availabilityZones;

  /// Specifies the security groups for VPC endpoint.
  final List<String>? securityGroupIds;

  /// Specifies the subnets for VPC endpoint.
  final List<String>? subnetIds;

  /// The VPC Id for the Elasticsearch domain. Exists only if the domain was
  /// created with VPCOptions.
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

/// Status of the VPC options for the specified Elasticsearch domain.
class VPCDerivedInfoStatus {
  /// Specifies the VPC options for the specified Elasticsearch domain.
  final VPCDerivedInfo options;

  /// Specifies the status of the VPC options for the specified Elasticsearch
  /// domain.
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

/// Options to specify the subnets and security groups for VPC endpoint. For
/// more information, see <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html"
/// target="_blank"> VPC Endpoints for Amazon Elasticsearch Service Domains</a>.
class VPCOptions {
  /// Specifies the security groups for VPC endpoint.
  final List<String>? securityGroupIds;

  /// Specifies the subnets for VPC endpoint.
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

/// The type of EBS volume, standard, gp2, gp3 or io1. See <a
/// href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-ebs"
/// target="_blank">Configuring EBS-based Storage</a>for more information.
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

/// Specifies the error code of the failure encountered while describing the VPC
/// endpoint:
/// <ul>
/// <li>ENDPOINT_NOT_FOUND: Indicates that the requested VPC endpoint does not
/// exist.</li>
/// <li>SERVER_ERROR: Indicates the describe endpoint operation failed due to an
/// internal server error.</li>
/// </ul>
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

/// Specifies the current status of the VPC endpoint:
/// <ul>
/// <li>CREATING: Indicates that the VPC endpoint is currently being
/// created.</li>
/// <li>CREATE_FAILED: Indicates that the VPC endpoint creation failed.</li>
/// <li>ACTIVE: Indicates that the VPC endpoint is currently active.</li>
/// <li>UPDATING: Indicates that the VPC endpoint is currently being
/// updated.</li>
/// <li>UPDATE_FAILED: Indicates that the VPC endpoint update failed.</li>
/// <li>DELETING: Indicates that the VPC endpoint is currently being
/// deleted.</li>
/// <li>DELETE_FAILED: Indicates that the VPC endpoint deletion failed.</li>
/// </ul>
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

/// Specifies the zone awareness configuration for the domain cluster, such as
/// the number of availability zones.
class ZoneAwarenessConfig {
  /// An integer value to indicate the number of availability zones for a domain
  /// when zone awareness is enabled. This should be equal to number of subnets if
  /// VPC endpoints is enabled
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
