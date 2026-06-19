// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Amazon Route 53 Global Resolver is a global, internet-accessible DNS
/// resolver that enables customers to resolve and forward traffic for both
/// public and private domains while ensuring security and authenticity of
/// queries over the internet. Route 53 Global Resolver supports DNS-over-port
/// 53 (Do53), DNS-over-TLS (DoT), and DNS-over-HTTPS (DoH) protocols through
/// global anycast IP addresses.
/// <important>
/// Route 53 Global Resolver is a global service that supports resolvers in
/// multiple Amazon Web Services Regions but you must specify the US East (Ohio)
/// Region to create, update, or otherwise work with Route 53 Global Resolver
/// resources. That is, for example, specify <code>--region us-east-2</code> on
/// Amazon Web Services CLI commands.
/// </important>
class Route53GlobalResolver {
  final _s.RestJsonProtocol _protocol;
  Route53GlobalResolver({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'route53globalresolver',
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

  /// Disassociates a Route 53 private hosted zone from a Route 53 Global
  /// Resolver resource.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the Route 53 private hosted zone to disassociate.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Route 53 Global Resolver resource to
  /// disassociate the hosted zone from.
  Future<DisassociateHostedZoneOutput> disassociateHostedZone({
    required String hostedZoneId,
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/hosted-zone-associations/hosted-zone/${Uri.encodeComponent(hostedZoneId)}/resource-arn/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateHostedZoneOutput.fromJson(response);
  }

  /// Lists the tags associated with a Route 53 Global Resolver resource.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) for the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-all-tags',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Adds or updates tags for a Route 53 Global Resolver resource. Tags are
  /// key-value pairs that help you organize and identify your resources.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the resource to be tagged.
  ///
  /// Parameter [tags] :
  /// An array of user-defined keys and optional values. These tags can be used
  /// for categorization and organization.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a Route 53 Global Resolver resource.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys associated with the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an access source for a DNS view. Access sources define IP
  /// addresses or CIDR ranges that are allowed to send DNS queries to the Route
  /// 53 Global Resolver, along with the permitted DNS protocols.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [cidr] :
  /// The IP address or CIDR range that is allowed to send DNS queries to the
  /// Route 53 Global Resolver.
  ///
  /// Parameter [dnsViewId] :
  /// The ID of the DNS view to associate with this access source.
  ///
  /// Parameter [protocol] :
  /// The DNS protocol that is permitted for this access source. Valid values
  /// are Do53 (DNS over port 53), DoT (DNS over TLS), and DoH (DNS over HTTPS).
  ///
  /// Parameter [clientToken] :
  /// A unique string that identifies the request and ensures idempotency.
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type for this access source. Valid values are IPv4 and IPv6
  /// (if the Route 53 Global Resolver supports dual-stack).
  ///
  /// Parameter [name] :
  /// A descriptive name for the access source.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the access source.
  Future<CreateAccessSourceOutput> createAccessSource({
    required String cidr,
    required String dnsViewId,
    required DnsProtocol protocol,
    String? clientToken,
    IpAddressType? ipAddressType,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'cidr': cidr,
      'dnsViewId': dnsViewId,
      'protocol': protocol.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/access-sources',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessSourceOutput.fromJson(response);
  }

  /// Retrieves information about an access source.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessSourceId] :
  /// The unique identifier of the access source to retrieve.
  Future<GetAccessSourceOutput> getAccessSource({
    required String accessSourceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/access-sources/${Uri.encodeComponent(accessSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessSourceOutput.fromJson(response);
  }

  /// Updates the configuration of an access source.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessSourceId] :
  /// The unique identifier of the access source to update.
  ///
  /// Parameter [cidr] :
  /// The CIDR block for the access source.
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type for the access source.
  ///
  /// Parameter [name] :
  /// The name of the access source.
  ///
  /// Parameter [protocol] :
  /// The protocol for the access source.
  Future<UpdateAccessSourceOutput> updateAccessSource({
    required String accessSourceId,
    String? cidr,
    IpAddressType? ipAddressType,
    String? name,
    DnsProtocol? protocol,
  }) async {
    final $payload = <String, dynamic>{
      if (cidr != null) 'cidr': cidr,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (name != null) 'name': name,
      if (protocol != null) 'protocol': protocol.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/access-sources/${Uri.encodeComponent(accessSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccessSourceOutput.fromJson(response);
  }

  /// Deletes an access source. This operation cannot be undone.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessSourceId] :
  /// The unique identifier of the access source to delete.
  Future<DeleteAccessSourceOutput> deleteAccessSource({
    required String accessSourceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/access-sources/${Uri.encodeComponent(accessSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAccessSourceOutput.fromJson(response);
  }

  /// Lists all access sources with pagination support.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Values to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve in a single call.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used for large sets of results that can't be returned
  /// in a single response.
  Future<ListAccessSourcesOutput> listAccessSources({
    Map<String, List<String>>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/access-sources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessSourcesOutput.fromJson(response);
  }

  /// Creates an access token for a DNS view. Access tokens provide token-based
  /// authentication for DNS-over-HTTPS (DoH) and DNS-over-TLS (DoT) connections
  /// to the Route 53 Global Resolver.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dnsViewId] :
  /// The ID of the DNS view to associate with this token.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency. This means that
  /// making the same request multiple times with the same
  /// <code>clientToken</code> has the same result every time.
  ///
  /// Parameter [expiresAt] :
  /// The date and time when the token expires. Tokens can have a minimum
  /// expiration of 30 days and maximum of 365 days from creation.
  ///
  /// Parameter [name] :
  /// A descriptive name for the access token.
  ///
  /// Parameter [tags] :
  /// An array of user-defined keys and optional values. These tags can be used
  /// for categorization and organization.
  Future<CreateAccessTokenOutput> createAccessToken({
    required String dnsViewId,
    String? clientToken,
    DateTime? expiresAt,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (expiresAt != null) 'expiresAt': iso8601ToJson(expiresAt),
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tokens/${Uri.encodeComponent(dnsViewId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessTokenOutput.fromJson(response);
  }

  /// Retrieves information about an access token.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessTokenId] :
  /// ID of the token.
  Future<GetAccessTokenOutput> getAccessToken({
    required String accessTokenId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tokens/${Uri.encodeComponent(accessTokenId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessTokenOutput.fromJson(response);
  }

  /// Updates the configuration of an access token.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessTokenId] :
  /// The ID of the token.
  ///
  /// Parameter [name] :
  /// The new name of the token.
  Future<UpdateAccessTokenOutput> updateAccessToken({
    required String accessTokenId,
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/tokens/${Uri.encodeComponent(accessTokenId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccessTokenOutput.fromJson(response);
  }

  /// Deletes an access token. This operation cannot be undone.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessTokenId] :
  /// The unique identifier of the access token to delete.
  Future<DeleteAccessTokenOutput> deleteAccessToken({
    required String accessTokenId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tokens/${Uri.encodeComponent(accessTokenId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAccessTokenOutput.fromJson(response);
  }

  /// Lists all access tokens for a DNS view with pagination support.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dnsViewId] :
  /// The ID of the DNS view to list the tokens for.
  ///
  /// Parameter [filters] :
  /// Filtering parameters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve in a single call.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used for large sets of results that can't be returned
  /// in a single response.
  Future<ListAccessTokensOutput> listAccessTokens({
    required String dnsViewId,
    Map<String, List<String>>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tokens/dns-view/${Uri.encodeComponent(dnsViewId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessTokensOutput.fromJson(response);
  }

  /// Creates a DNS view within a Route 53 Global Resolver. A DNS view models
  /// end users, user groups, networks, and devices, and serves as a parent
  /// resource that holds configurations controlling access, authorization, DNS
  /// firewall rules, and forwarding rules.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [globalResolverId] :
  /// The ID of the Route 53 Global Resolver to associate with this DNS view.
  ///
  /// Parameter [name] :
  /// A descriptive name for the DNS view.
  ///
  /// Parameter [clientToken] :
  /// A unique string that identifies the request and ensures idempotency.
  ///
  /// Parameter [description] :
  /// An optional description for the DNS view.
  ///
  /// Parameter [dnssecValidation] :
  /// Whether to enable DNSSEC validation for DNS queries in this DNS view. When
  /// enabled, the resolver verifies the authenticity and integrity of DNS
  /// responses from public name servers for DNSSEC-signed domains.
  ///
  /// Parameter [ednsClientSubnet] :
  /// Whether to enable EDNS Client Subnet injection for DNS queries in this DNS
  /// view. When enabled, client subnet information is forwarded to provide more
  /// accurate geographic-based DNS responses.
  ///
  /// Parameter [firewallRulesFailOpen] :
  /// Determines the behavior when Route 53 Global Resolver cannot apply DNS
  /// firewall rules due to service impairment. When enabled, DNS queries are
  /// allowed through; when disabled, queries are blocked.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the DNS view.
  Future<CreateDNSViewOutput> createDNSView({
    required String globalResolverId,
    required String name,
    String? clientToken,
    String? description,
    DnsSecValidationType? dnssecValidation,
    EdnsClientSubnetType? ednsClientSubnet,
    FirewallRulesFailOpenType? firewallRulesFailOpen,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (dnssecValidation != null) 'dnssecValidation': dnssecValidation.value,
      if (ednsClientSubnet != null) 'ednsClientSubnet': ednsClientSubnet.value,
      if (firewallRulesFailOpen != null)
        'firewallRulesFailOpen': firewallRulesFailOpen.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/dns-views/${Uri.encodeComponent(globalResolverId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDNSViewOutput.fromJson(response);
  }

  /// Retrieves information about a DNS view.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dnsViewId] :
  /// The ID of the DNS view to retrieve information about.
  Future<GetDNSViewOutput> getDNSView({
    required String dnsViewId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dns-views/${Uri.encodeComponent(dnsViewId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDNSViewOutput.fromJson(response);
  }

  /// Updates the configuration of a DNS view.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dnsViewId] :
  /// The unique identifier of the DNS view to update.
  ///
  /// Parameter [description] :
  /// A description of the DNS view.
  ///
  /// Parameter [dnssecValidation] :
  /// Whether to enable DNSSEC validation for the DNS view.
  ///
  /// Parameter [ednsClientSubnet] :
  /// Whether to enable EDNS Client Subnet injection for the DNS view.
  ///
  /// Parameter [firewallRulesFailOpen] :
  /// Whether firewall rules should fail open when they cannot be evaluated.
  ///
  /// Parameter [name] :
  /// The name of the DNS view.
  Future<UpdateDNSViewOutput> updateDNSView({
    required String dnsViewId,
    String? description,
    DnsSecValidationType? dnssecValidation,
    EdnsClientSubnetType? ednsClientSubnet,
    FirewallRulesFailOpenType? firewallRulesFailOpen,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (dnssecValidation != null) 'dnssecValidation': dnssecValidation.value,
      if (ednsClientSubnet != null) 'ednsClientSubnet': ednsClientSubnet.value,
      if (firewallRulesFailOpen != null)
        'firewallRulesFailOpen': firewallRulesFailOpen.value,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/dns-views/${Uri.encodeComponent(dnsViewId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDNSViewOutput.fromJson(response);
  }

  /// Deletes a DNS view. This operation cannot be undone.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dnsViewId] :
  /// The unique identifier of the DNS view to delete.
  Future<DeleteDNSViewOutput> deleteDNSView({
    required String dnsViewId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/dns-views/${Uri.encodeComponent(dnsViewId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDNSViewOutput.fromJson(response);
  }

  /// Lists all DNS views for a Route 53 Global Resolver with pagination
  /// support.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [globalResolverId] :
  /// The Global Resolver ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve in a single call.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used for large sets of results that can't be returned
  /// in a single response.
  Future<ListDNSViewsOutput> listDNSViews({
    required String globalResolverId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/dns-views/resolver/${Uri.encodeComponent(globalResolverId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDNSViewsOutput.fromJson(response);
  }

  /// Disables a DNS view, preventing it from serving DNS queries.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dnsViewId] :
  /// The unique identifier of the DNS view to disable.
  Future<DisableDNSViewOutput> disableDNSView({
    required String dnsViewId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri: '/dns-views/${Uri.encodeComponent(dnsViewId)}/disable',
      exceptionFnMap: _exceptionFns,
    );
    return DisableDNSViewOutput.fromJson(response);
  }

  /// Enables a disabled DNS view, allowing it to serve DNS queries again.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dnsViewId] :
  /// The unique identifier of the DNS view to enable.
  Future<EnableDNSViewOutput> enableDNSView({
    required String dnsViewId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri: '/dns-views/${Uri.encodeComponent(dnsViewId)}/enable',
      exceptionFnMap: _exceptionFns,
    );
    return EnableDNSViewOutput.fromJson(response);
  }

  /// Creates a firewall domain list. Domain lists are reusable sets of domain
  /// specifications that you use in DNS firewall rules to allow, block, or
  /// alert on DNS queries to specific domains.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [globalResolverId] :
  /// The ID of the Route 53 Global Resolver that the domain list will be
  /// associated with.
  ///
  /// Parameter [name] :
  /// A descriptive name for the firewall domain list.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency. This means that
  /// making the same request multiple times with the same
  /// <code>clientToken</code> has the same result every time.
  ///
  /// Parameter [description] :
  /// An optional description for the firewall domain list.
  ///
  /// Parameter [tags] :
  /// An array of user-defined keys and optional values. These tags can be used
  /// for categorization and organization.
  Future<CreateFirewallDomainListOutput> createFirewallDomainList({
    required String globalResolverId,
    required String name,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/firewall-domain-lists/${Uri.encodeComponent(globalResolverId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFirewallDomainListOutput.fromJson(response);
  }

  /// Retrieves information about a firewall domain list.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [firewallDomainListId] :
  /// ID of the domain list.
  Future<GetFirewallDomainListOutput> getFirewallDomainList({
    required String firewallDomainListId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/firewall-domain-lists/${Uri.encodeComponent(firewallDomainListId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFirewallDomainListOutput.fromJson(response);
  }

  /// Deletes a firewall domain list. This operation cannot be undone.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [firewallDomainListId] :
  /// The unique identifier of the firewall domain list to delete.
  Future<DeleteFirewallDomainListOutput> deleteFirewallDomainList({
    required String firewallDomainListId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/firewall-domain-lists/${Uri.encodeComponent(firewallDomainListId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFirewallDomainListOutput.fromJson(response);
  }

  /// Lists all firewall domain lists for a Route 53 Global Resolver with
  /// pagination support.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [globalResolverId] :
  /// The ID of the Global Resolver that contains the DNS view the domain lists
  /// are associated to.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve in a single call.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used for large sets of results that can't be returned
  /// in a single response.
  Future<ListFirewallDomainListsOutput> listFirewallDomainLists({
    String? globalResolverId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (globalResolverId != null) 'global_resolver_id': [globalResolverId],
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/firewall-domain-lists',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFirewallDomainListsOutput.fromJson(response);
  }

  /// Imports a list of domains from an Amazon S3 file into a firewall domain
  /// list. The file should contain one domain per line.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainFileUrl] :
  /// The fully qualified URL of the file in Amazon S3 that contains the list of
  /// domains to import. The file should contain one domain per line.
  ///
  /// Parameter [firewallDomainListId] :
  /// ID of the DNS Firewall domain list that you want to import the domain list
  /// to.
  ///
  /// Parameter [operation] :
  /// This value is <code>REPLACE</code>, and it updates the domain list to
  /// match the list of domains in the imported file.
  Future<ImportFirewallDomainsOutput> importFirewallDomains({
    required String domainFileUrl,
    required String firewallDomainListId,
    required String operation,
  }) async {
    final $payload = <String, dynamic>{
      'domainFileUrl': domainFileUrl,
      'operation': operation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/firewall-domain-lists/${Uri.encodeComponent(firewallDomainListId)}/domains/s3_file_url',
      exceptionFnMap: _exceptionFns,
    );
    return ImportFirewallDomainsOutput.fromJson(response);
  }

  /// Lists all the domains in DNS Firewall domain list you have created.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [firewallDomainListId] :
  /// ID of the DNS Firewall domain list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve in a single call.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used for large sets of results that can't be returned
  /// in a single response.
  Future<ListFirewallDomainsOutput> listFirewallDomains({
    required String firewallDomainListId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/firewall-domain-lists/${Uri.encodeComponent(firewallDomainListId)}/domains',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFirewallDomainsOutput.fromJson(response);
  }

  /// Updates a DNS Firewall domain list from an array of specified domains.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domains] :
  /// A list of the domains. You can add up to 1000 domains per request.
  ///
  /// Parameter [firewallDomainListId] :
  /// The ID of the DNS Firewall domain list to which you want to add the
  /// domains.
  ///
  /// Parameter [operation] :
  /// The operation for updating the domain list. The allowed values are ADD,
  /// REMOVE, and REPLACE.
  Future<UpdateFirewallDomainsOutput> updateFirewallDomains({
    required List<String> domains,
    required String firewallDomainListId,
    required String operation,
  }) async {
    final $payload = <String, dynamic>{
      'domains': domains,
      'operation': operation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/firewall-domain-lists/${Uri.encodeComponent(firewallDomainListId)}/domains',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFirewallDomainsOutput.fromJson(response);
  }

  /// Creates a DNS firewall rule. Firewall rules define actions (ALLOW, BLOCK,
  /// or ALERT) to take on DNS queries that match specified domain lists,
  /// managed domain lists, or advanced threat protections.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The action that DNS Firewall should take on a DNS query when it matches
  /// one of the domains in the rule's domain list:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW</code> - Permit the request to go through.
  /// </li>
  /// <li>
  /// <code>ALERT</code> - Permit the request and send metrics and logs to
  /// CloudWatch.
  /// </li>
  /// <li>
  /// <code>BLOCK</code> - Disallow the request. This option requires additional
  /// details in the rule's <code>BlockResponse</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dnsViewId] :
  /// The ID of the DNS view to associate with this firewall rule.
  ///
  /// Parameter [name] :
  /// A descriptive name for the firewall rule.
  ///
  /// Parameter [blockOverrideDnsType] :
  /// The DNS record's type. This determines the format of the record value that
  /// you provided in <code>BlockOverrideDomain</code>. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  ///
  /// This setting is required if the <code>BlockResponse</code> setting is
  /// <code>OVERRIDE</code>.
  ///
  /// Parameter [blockOverrideDomain] :
  /// The custom DNS record to send back in response to the query. Used for the
  /// rule action <code>BLOCK</code> with a <code>BlockResponse</code> setting
  /// of <code>OVERRIDE</code>.
  ///
  /// This setting is required if the <code>BlockResponse</code> setting is
  /// <code>OVERRIDE</code>.
  ///
  /// Parameter [blockOverrideTtl] :
  /// The recommended amount of time, in seconds, for the DNS resolver or web
  /// browser to cache the provided override record. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  ///
  /// This setting is required if the <code>BlockResponse</code> setting is
  /// <code>OVERRIDE</code>.
  ///
  /// Parameter [blockResponse] :
  /// The response to return when the action is BLOCK. Valid values are NXDOMAIN
  /// (domain does not exist), NODATA (domain exists but no records), or
  /// OVERRIDE (return custom response).
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency. This means that
  /// making the same request multiple times with the same
  /// <code>clientToken</code> has the same result every time.
  ///
  /// Parameter [confidenceThreshold] :
  /// The confidence threshold for advanced threat detection. Valid values are
  /// HIGH, MEDIUM, or LOW, indicating the accuracy level required for threat
  /// detection.
  ///
  /// Parameter [description] :
  /// An optional description for the firewall rule.
  ///
  /// Parameter [dnsAdvancedProtection] :
  /// Whether to enable advanced DNS threat protection for this rule. Advanced
  /// protection can detect and block DNS tunneling and Domain Generation
  /// Algorithm (DGA) threats.
  ///
  /// Parameter [firewallDomainListId] :
  /// The ID of the firewall domain list to use in this rule.
  ///
  /// Parameter [priority] :
  /// The priority of this rule. Rules are evaluated in priority order, with
  /// lower numbers having higher priority. When a DNS query matches multiple
  /// rules, the rule with the highest priority (lowest number) is applied.
  ///
  /// Parameter [qType] :
  /// The DNS query type to match for this rule. Examples include A (IPv4
  /// address), AAAA (IPv6 address), MX (mail exchange), or TXT (text record).
  Future<CreateFirewallRuleOutput> createFirewallRule({
    required FirewallRuleAction action,
    required String dnsViewId,
    required String name,
    BlockOverrideDnsQueryType? blockOverrideDnsType,
    String? blockOverrideDomain,
    int? blockOverrideTtl,
    FirewallBlockResponse? blockResponse,
    String? clientToken,
    ConfidenceThreshold? confidenceThreshold,
    String? description,
    DnsAdvancedProtection? dnsAdvancedProtection,
    String? firewallDomainListId,
    int? priority,
    String? qType,
  }) async {
    _s.validateNumRange(
      'blockOverrideTtl',
      blockOverrideTtl,
      0,
      604800,
    );
    _s.validateNumRange(
      'priority',
      priority,
      1,
      10000,
    );
    final $payload = <String, dynamic>{
      'action': action.value,
      'dnsViewId': dnsViewId,
      'name': name,
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (firewallDomainListId != null)
        'firewallDomainListId': firewallDomainListId,
      if (priority != null) 'priority': priority,
      if (qType != null) 'qType': qType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/firewall-rules',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFirewallRuleOutput.fromJson(response);
  }

  /// Retrieves information about a DNS firewall rule.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [firewallRuleId] :
  /// ID of the DNS Firewall rule.
  Future<GetFirewallRuleOutput> getFirewallRule({
    required String firewallRuleId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/firewall-rules/${Uri.encodeComponent(firewallRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFirewallRuleOutput.fromJson(response);
  }

  /// Updates the configuration of a DNS firewall rule.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [firewallRuleId] :
  /// The ID of the DNS Firewall rule.
  ///
  /// Parameter [action] :
  /// The action that DNS Firewall should take on a DNS query when it matches
  /// one of the domains in the rule's domain list, or a threat in a DNS
  /// Firewall Advanced rule.
  ///
  /// Parameter [blockOverrideDnsType] :
  /// The DNS record's type. This determines the format of the record value that
  /// you provided in <code>BlockOverrideDomain</code>. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  ///
  /// Parameter [blockOverrideDomain] :
  /// The custom DNS record to send back in response to the query. Used for the
  /// rule action <code>BLOCK</code> with a <code>BlockResponse</code> setting
  /// of <code>OVERRIDE</code>.
  ///
  /// Parameter [blockOverrideTtl] :
  /// The recommended amount of time, in seconds, for the DNS resolver or web
  /// browser to cache the provided override record. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  ///
  /// Parameter [blockResponse] :
  /// The way that you want DNS Firewall to block the request. Used for the rule
  /// action setting <code>BLOCK</code>.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency. This means that
  /// making the same request multiple times with the same
  /// <code>clientToken</code> has the same result every time.
  ///
  /// Parameter [confidenceThreshold] :
  /// The confidence threshold for DNS Firewall Advanced. You must provide this
  /// value when you create a DNS Firewall Advanced rule.
  ///
  /// Parameter [description] :
  /// The description for the Firewall rule.
  ///
  /// Parameter [dnsAdvancedProtection] :
  /// The type of the DNS Firewall Advanced rule. Valid values are DGA,
  /// DNS_TUNNELING, and DICTIONARY_DGA.
  ///
  /// Parameter [name] :
  /// The name of the DNS Firewall rule.
  ///
  /// Parameter [priority] :
  /// The setting that determines the processing order of the rule in the rule
  /// group. DNS Firewall processes the rules in a rule group by order of
  /// priority, starting from the lowest setting.
  Future<UpdateFirewallRuleOutput> updateFirewallRule({
    required String firewallRuleId,
    FirewallRuleAction? action,
    BlockOverrideDnsQueryType? blockOverrideDnsType,
    String? blockOverrideDomain,
    int? blockOverrideTtl,
    FirewallBlockResponse? blockResponse,
    String? clientToken,
    ConfidenceThreshold? confidenceThreshold,
    String? description,
    DnsAdvancedProtection? dnsAdvancedProtection,
    String? name,
    int? priority,
  }) async {
    _s.validateNumRange(
      'blockOverrideTtl',
      blockOverrideTtl,
      0,
      604800,
    );
    _s.validateNumRange(
      'priority',
      priority,
      1,
      10000,
    );
    final $payload = <String, dynamic>{
      if (action != null) 'action': action.value,
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/firewall-rules/${Uri.encodeComponent(firewallRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFirewallRuleOutput.fromJson(response);
  }

  /// Deletes a DNS firewall rule. This operation cannot be undone.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [firewallRuleId] :
  /// The unique identifier of the firewall rule to delete.
  Future<DeleteFirewallRuleOutput> deleteFirewallRule({
    required String firewallRuleId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/firewall-rules/${Uri.encodeComponent(firewallRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFirewallRuleOutput.fromJson(response);
  }

  /// Lists all DNS firewall rules for a DNS view with pagination support.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dnsViewId] :
  /// ID of the DNS view.
  ///
  /// Parameter [filters] :
  /// Values to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve in a single call.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used for large sets of results that can't be returned
  /// in a single response.
  Future<ListFirewallRulesOutput> listFirewallRules({
    required String dnsViewId,
    Map<String, List<String>>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'dnsview_id': [dnsViewId],
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/firewall-rules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFirewallRulesOutput.fromJson(response);
  }

  /// Creates multiple DNS firewall rules in a single operation. This is more
  /// efficient than creating rules individually when you need to set up
  /// multiple rules at once.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [firewallRules] :
  /// The <code>BatchCreateFirewallRuleInputItem</code> objects contain the
  /// information for each Firewall rule.
  Future<BatchCreateFirewallRuleOutput> batchCreateFirewallRule({
    required List<BatchCreateFirewallRuleInputItem> firewallRules,
  }) async {
    final $payload = <String, dynamic>{
      'firewallRules': firewallRules,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/firewall-rules/batch-create',
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateFirewallRuleOutput.fromJson(response);
  }

  /// Deletes multiple DNS firewall rules in a single operation. This is more
  /// efficient than deleting rules individually.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [firewallRules] :
  /// An array of the DNS Firewall IDs to be deleted.
  Future<BatchDeleteFirewallRuleOutput> batchDeleteFirewallRule({
    required List<BatchDeleteFirewallRuleInputItem> firewallRules,
  }) async {
    final $payload = <String, dynamic>{
      'firewallRules': firewallRules,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/firewall-rules/batch-delete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteFirewallRuleOutput.fromJson(response);
  }

  /// Updates multiple DNS firewall rules in a single operation. This is more
  /// efficient than updating rules individually.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [firewallRules] :
  /// The DNS Firewall rule IDs to be updated.
  Future<BatchUpdateFirewallRuleOutput> batchUpdateFirewallRule({
    required List<BatchUpdateFirewallRuleInputItem> firewallRules,
  }) async {
    final $payload = <String, dynamic>{
      'firewallRules': firewallRules,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/firewall-rules/batch-update',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateFirewallRuleOutput.fromJson(response);
  }

  /// Creates a new Route 53 Global Resolver instance. A Route 53 Global
  /// Resolver is a global, internet-accessible DNS resolver that provides
  /// secure DNS resolution for both public and private domains through global
  /// anycast IP addresses.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A descriptive name for the Route 53 Global Resolver instance. Maximum
  /// length of 64 characters.
  ///
  /// Parameter [regions] :
  /// List of Amazon Web Services Regions where the Route 53 Global Resolver
  /// will operate. The resolver will be distributed across these Regions to
  /// provide global availability and low-latency DNS resolution.
  ///
  /// Parameter [clientToken] :
  /// A unique string that identifies the request and ensures idempotency. If
  /// you make multiple requests with the same client token, only one Route 53
  /// Global Resolver is created.
  ///
  /// Parameter [description] :
  /// An optional description for the Route 53 Global Resolver instance. Maximum
  /// length of 1024 characters.
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type for the Route 53 Global Resolver. Valid values are
  /// IPV4 (default) or DUAL_STACK for both IPv4 and IPv6 support.
  ///
  /// Parameter [observabilityRegion] :
  /// The Amazon Web Services Region where query resolution logs and metrics
  /// will be aggregated and delivered. If not specified, logging is not
  /// enabled.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the Route 53 Global Resolver. Tags are key-value
  /// pairs that help you organize and identify your resources.
  Future<CreateGlobalResolverOutput> createGlobalResolver({
    required String name,
    required List<String> regions,
    String? clientToken,
    String? description,
    GlobalResolverIpAddressType? ipAddressType,
    String? observabilityRegion,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'regions': regions,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (observabilityRegion != null)
        'observabilityRegion': observabilityRegion,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/global-resolver',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGlobalResolverOutput.fromJson(response);
  }

  /// Retrieves information about a Route 53 Global Resolver instance.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [globalResolverId] :
  /// The ID of the Route 53 Global Resolver to retrieve information about.
  Future<GetGlobalResolverOutput> getGlobalResolver({
    required String globalResolverId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/global-resolver/${Uri.encodeComponent(globalResolverId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGlobalResolverOutput.fromJson(response);
  }

  /// Updates the configuration of a Route 53 Global Resolver instance. You can
  /// modify the name, description, and observability Region.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [globalResolverId] :
  /// The ID of the Global Resolver.
  ///
  /// Parameter [description] :
  /// The description of the Global Resolver.
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type for the Global Resolver. Valid values are IPV4 or
  /// DUAL_STACK for both IPv4 and IPv6 support.
  ///
  /// Parameter [name] :
  /// The name of the Global Resolver.
  ///
  /// Parameter [observabilityRegion] :
  /// The Amazon Web Services Regions in which the users' Global Resolver query
  /// resolution logs will be propagated.
  ///
  /// Parameter [regions] :
  /// The list of Amazon Web Services Regions where the Global Resolver will
  /// operate. The resolver will be distributed across these Regions to provide
  /// global availability and low-latency DNS resolution.
  Future<UpdateGlobalResolverOutput> updateGlobalResolver({
    required String globalResolverId,
    String? description,
    GlobalResolverIpAddressType? ipAddressType,
    String? name,
    String? observabilityRegion,
    List<String>? regions,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (name != null) 'name': name,
      if (observabilityRegion != null)
        'observabilityRegion': observabilityRegion,
      if (regions != null) 'regions': regions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/global-resolver/${Uri.encodeComponent(globalResolverId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGlobalResolverOutput.fromJson(response);
  }

  /// Deletes a Route 53 Global Resolver instance. This operation cannot be
  /// undone. All associated DNS views, access sources, tokens, and firewall
  /// rules are also deleted.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [globalResolverId] :
  /// The unique identifier of the Route 53 Global Resolver to delete.
  Future<DeleteGlobalResolverOutput> deleteGlobalResolver({
    required String globalResolverId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/global-resolver/${Uri.encodeComponent(globalResolverId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGlobalResolverOutput.fromJson(response);
  }

  /// Lists all Route 53 Global Resolver instances in your account with
  /// pagination support.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Route 53 Global Resolver instances to return in the
  /// response. Valid range is 1-100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results. This value is returned in the
  /// response if there are more results to retrieve.
  Future<ListGlobalResolversOutput> listGlobalResolvers({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/global-resolver',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGlobalResolversOutput.fromJson(response);
  }

  /// Associates a Route 53 private hosted zone with a Route 53 Global Resolver
  /// resource. This allows the resolver to resolve DNS queries for the private
  /// hosted zone from anywhere globally.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the Route 53 private hosted zone to associate with the Route 53
  /// Global Resolver resource.
  ///
  /// Parameter [name] :
  /// Name for the private hosted zone association.
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) of the Route 53 Global Resolver the private
  /// hosted zone will be associated to.
  Future<AssociateHostedZoneOutput> associateHostedZone({
    required String hostedZoneId,
    required String name,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'resourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/hosted-zone-associations/${Uri.encodeComponent(hostedZoneId)}',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateHostedZoneOutput.fromJson(response);
  }

  /// Retrieves information about a hosted zone association.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [hostedZoneAssociationId] :
  /// ID of the private hosted zone association.
  Future<GetHostedZoneAssociationOutput> getHostedZoneAssociation({
    required String hostedZoneAssociationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/hosted-zone-associations/${Uri.encodeComponent(hostedZoneAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetHostedZoneAssociationOutput.fromJson(response);
  }

  /// Updates the configuration of a hosted zone association.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [hostedZoneAssociationId] :
  /// The ID of the private hosted zone association.
  ///
  /// Parameter [name] :
  /// The name you want to update the hosted zone association to.
  Future<UpdateHostedZoneAssociationOutput> updateHostedZoneAssociation({
    required String hostedZoneAssociationId,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/hosted-zone-associations/${Uri.encodeComponent(hostedZoneAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateHostedZoneAssociationOutput.fromJson(response);
  }

  /// Lists all hosted zone associations for a Route 53 Global Resolver resource
  /// with pagination support.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the DNS view.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve in a single call.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used for large sets of results that can't be returned
  /// in a single response.
  Future<ListHostedZoneAssociationsOutput> listHostedZoneAssociations({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/hosted-zone-associations/resource-arn/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListHostedZoneAssociationsOutput.fromJson(response);
  }

  /// Retrieves information about an Amazon Web Services-managed firewall domain
  /// list. Managed domain lists contain domains associated with malicious
  /// activity, content categories, or specific threats.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedFirewallDomainListId] :
  /// ID of the Managed Domain List.
  Future<GetManagedFirewallDomainListOutput> getManagedFirewallDomainList({
    required String managedFirewallDomainListId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/managed-firewall-domain-lists/${Uri.encodeComponent(managedFirewallDomainListId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedFirewallDomainListOutput.fromJson(response);
  }

  /// Returns a paginated list of the Amazon Web Services Managed DNS Lists and
  /// the categories for DNS Firewall. The categories are either
  /// <code>THREAT</code> or <code>CONTENT</code>.
  /// <important>
  /// Route 53 Global Resolver is a global service that supports resolvers in
  /// multiple Amazon Web Services Regions but you must specify the US East
  /// (Ohio) Region to create, update, or otherwise work with Route 53 Global
  /// Resolver resources. That is, for example, specify <code>--region
  /// us-east-2</code> on Amazon Web Services CLI commands.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedFirewallDomainListType] :
  /// The category of the Manage DNS list either <code>THREAT</code> or
  /// <code>CONTENT</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve in a single call.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used for large sets of results that can't be returned
  /// in a single response.
  Future<ListManagedFirewallDomainListsOutput> listManagedFirewallDomainLists({
    required String managedFirewallDomainListType,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/list-managed-firewall-domain-lists/${Uri.encodeComponent(managedFirewallDomainListType)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedFirewallDomainListsOutput.fromJson(response);
  }
}

/// @nodoc
class DisassociateHostedZoneOutput {
  /// The date and time when the association was originally created.
  final DateTime createdAt;

  /// The ID of the Route 53 private hosted zone that was disassociated.
  final String hostedZoneId;

  /// The name of the Route 53 private hosted zone that was disassociated.
  final String hostedZoneName;

  /// The unique identifier of the disassociation.
  final String id;

  /// The name of the association that was removed.
  final String name;

  /// The Amazon Resource Name (ARN) of the Route 53 Global Resolver resource that
  /// the hosted zone was disassociated from.
  final String resourceArn;

  /// The final status of the disassociation.
  final HostedZoneAssociationStatus status;

  /// The date and time when the association was last updated before
  /// disassociation.
  final DateTime updatedAt;

  DisassociateHostedZoneOutput({
    required this.createdAt,
    required this.hostedZoneId,
    required this.hostedZoneName,
    required this.id,
    required this.name,
    required this.resourceArn,
    required this.status,
    required this.updatedAt,
  });

  factory DisassociateHostedZoneOutput.fromJson(Map<String, dynamic> json) {
    return DisassociateHostedZoneOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      hostedZoneId: (json['hostedZoneId'] as String?) ?? '',
      hostedZoneName: (json['hostedZoneName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
      status: HostedZoneAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final hostedZoneId = this.hostedZoneId;
    final hostedZoneName = this.hostedZoneName;
    final id = this.id;
    final name = this.name;
    final resourceArn = this.resourceArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'hostedZoneId': hostedZoneId,
      'hostedZoneName': hostedZoneName,
      'id': id,
      'name': name,
      'resourceArn': resourceArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// An array of user-defined keys and optional values. These tags can be used
  /// for categorization and organization.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
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

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateAccessSourceOutput {
  /// The Amazon Resource Name (ARN) of the access source.
  final String arn;

  /// The IP address or CIDR range that is allowed to send DNS queries to the
  /// Route 53 Global Resolver.
  final String cidr;

  /// The date and time when the access source was created.
  final DateTime createdAt;

  /// The ID of the DNS view associated with this access source.
  final String dnsViewId;

  /// The unique identifier for the access source.
  final String id;

  /// The IP address type for this access source (IPv4 or IPv6).
  final IpAddressType ipAddressType;

  /// The DNS protocol that is permitted for this access source (Do53, DoT, or
  /// DoH).
  final DnsProtocol protocol;

  /// The operational status of the access source.
  final CRResourceStatus status;

  /// The date and time when the access source was last updated.
  final DateTime updatedAt;

  /// The descriptive name of the access source.
  final String? name;

  CreateAccessSourceOutput({
    required this.arn,
    required this.cidr,
    required this.createdAt,
    required this.dnsViewId,
    required this.id,
    required this.ipAddressType,
    required this.protocol,
    required this.status,
    required this.updatedAt,
    this.name,
  });

  factory CreateAccessSourceOutput.fromJson(Map<String, dynamic> json) {
    return CreateAccessSourceOutput(
      arn: (json['arn'] as String?) ?? '',
      cidr: (json['cidr'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      ipAddressType:
          IpAddressType.fromString((json['ipAddressType'] as String?) ?? ''),
      protocol: DnsProtocol.fromString((json['protocol'] as String?) ?? ''),
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cidr = this.cidr;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final id = this.id;
    final ipAddressType = this.ipAddressType;
    final protocol = this.protocol;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final name = this.name;
    return {
      'arn': arn,
      'cidr': cidr,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'id': id,
      'ipAddressType': ipAddressType.value,
      'protocol': protocol.value,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class GetAccessSourceOutput {
  /// The Amazon Resource Name (ARN) of the access source.
  final String arn;

  /// The IP range for the rule's parameters in CIDR notation.
  final String cidr;

  /// The time and date the rule was created.
  final DateTime createdAt;

  /// ID for the DNS view that the rule is associated to.
  final String dnsViewId;

  /// ID for the rule.
  final String id;

  /// The IP address type.
  final IpAddressType ipAddressType;

  /// The protocol determines how data is transmitted to a Global Resolver
  /// instance.
  final DnsProtocol protocol;

  /// Information about the status of the rule.
  final CRResourceStatus status;

  /// The time and date the access source was updated.
  final DateTime updatedAt;

  /// Name for the access source.
  final String? name;

  GetAccessSourceOutput({
    required this.arn,
    required this.cidr,
    required this.createdAt,
    required this.dnsViewId,
    required this.id,
    required this.ipAddressType,
    required this.protocol,
    required this.status,
    required this.updatedAt,
    this.name,
  });

  factory GetAccessSourceOutput.fromJson(Map<String, dynamic> json) {
    return GetAccessSourceOutput(
      arn: (json['arn'] as String?) ?? '',
      cidr: (json['cidr'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      ipAddressType:
          IpAddressType.fromString((json['ipAddressType'] as String?) ?? ''),
      protocol: DnsProtocol.fromString((json['protocol'] as String?) ?? ''),
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cidr = this.cidr;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final id = this.id;
    final ipAddressType = this.ipAddressType;
    final protocol = this.protocol;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final name = this.name;
    return {
      'arn': arn,
      'cidr': cidr,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'id': id,
      'ipAddressType': ipAddressType.value,
      'protocol': protocol.value,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class UpdateAccessSourceOutput {
  /// The Amazon Resource Name (ARN) of the updated access source.
  final String arn;

  /// The CIDR block of the updated access source.
  final String cidr;

  /// The date and time when the access source was originally created.
  final DateTime createdAt;

  /// The ID of the DNS view associated with the updated access source.
  final String dnsViewId;

  /// The unique identifier of the updated access source.
  final String id;

  /// The IP address type of the updated access source.
  final IpAddressType ipAddressType;

  /// The protocol of the updated access source.
  final DnsProtocol protocol;

  /// The current status of the updated access source.
  final CRResourceStatus status;

  /// The date and time when the access source was last updated.
  final DateTime updatedAt;

  /// The name of the updated access source.
  final String? name;

  UpdateAccessSourceOutput({
    required this.arn,
    required this.cidr,
    required this.createdAt,
    required this.dnsViewId,
    required this.id,
    required this.ipAddressType,
    required this.protocol,
    required this.status,
    required this.updatedAt,
    this.name,
  });

  factory UpdateAccessSourceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAccessSourceOutput(
      arn: (json['arn'] as String?) ?? '',
      cidr: (json['cidr'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      ipAddressType:
          IpAddressType.fromString((json['ipAddressType'] as String?) ?? ''),
      protocol: DnsProtocol.fromString((json['protocol'] as String?) ?? ''),
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cidr = this.cidr;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final id = this.id;
    final ipAddressType = this.ipAddressType;
    final protocol = this.protocol;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final name = this.name;
    return {
      'arn': arn,
      'cidr': cidr,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'id': id,
      'ipAddressType': ipAddressType.value,
      'protocol': protocol.value,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class DeleteAccessSourceOutput {
  /// The Amazon Resource Name (ARN) of the deleted access source.
  final String arn;

  /// The IP address or CIDR range of the deleted access source.
  final String cidr;

  /// The date and time when the access source was originally created.
  final DateTime createdAt;

  /// The ID of the DNS view that was associated with the deleted access source.
  final String dnsViewId;

  /// The unique identifier of the deleted access source.
  final String id;

  /// The IP address type of the deleted access source (IPv4 or IPv6).
  final IpAddressType ipAddressType;

  /// The DNS protocol that was permitted for the deleted access source.
  final DnsProtocol protocol;

  /// The final status of the deleted access source.
  final CRResourceStatus status;

  /// The date and time when the access source was last updated before deletion.
  final DateTime updatedAt;

  /// The name of the deleted access source.
  final String? name;

  DeleteAccessSourceOutput({
    required this.arn,
    required this.cidr,
    required this.createdAt,
    required this.dnsViewId,
    required this.id,
    required this.ipAddressType,
    required this.protocol,
    required this.status,
    required this.updatedAt,
    this.name,
  });

  factory DeleteAccessSourceOutput.fromJson(Map<String, dynamic> json) {
    return DeleteAccessSourceOutput(
      arn: (json['arn'] as String?) ?? '',
      cidr: (json['cidr'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      ipAddressType:
          IpAddressType.fromString((json['ipAddressType'] as String?) ?? ''),
      protocol: DnsProtocol.fromString((json['protocol'] as String?) ?? ''),
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cidr = this.cidr;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final id = this.id;
    final ipAddressType = this.ipAddressType;
    final protocol = this.protocol;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final name = this.name;
    return {
      'arn': arn,
      'cidr': cidr,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'id': id,
      'ipAddressType': ipAddressType.value,
      'protocol': protocol.value,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class ListAccessSourcesOutput {
  /// An array containing information about the access sources, such as the ID,
  /// CIDR etc.
  final List<AccessSourcesItem> accessSources;

  /// A pagination token used for large sets of results that can't be returned in
  /// a single response. Provide this token in the next call to get the results
  /// not returned in this call.
  final String? nextToken;

  ListAccessSourcesOutput({
    required this.accessSources,
    this.nextToken,
  });

  factory ListAccessSourcesOutput.fromJson(Map<String, dynamic> json) {
    return ListAccessSourcesOutput(
      accessSources: ((json['accessSources'] as List?) ?? const [])
          .nonNulls
          .map((e) => AccessSourcesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessSources = this.accessSources;
    final nextToken = this.nextToken;
    return {
      'accessSources': accessSources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateAccessTokenOutput {
  /// The Amazon Resource Name (ARN) of the access token.
  final String arn;

  /// The date and time when the access token was created.
  final DateTime createdAt;

  /// The ID of the DNS view associated with this access token.
  final String dnsViewId;

  /// The date and time when the access token expires.
  final DateTime expiresAt;

  /// The unique identifier for the access token.
  final String id;

  /// The operational status of the access token.
  final TokenStatus status;

  /// The access token value. This token should be included in DoH and DoT
  /// requests for authentication. Keep this value secure as it provides access to
  /// your Route 53 Global Resolver.
  final String value;

  /// The unique string that identifies the request and ensures idempotency.
  final String? clientToken;

  /// The name of the access token.
  final String? name;

  CreateAccessTokenOutput({
    required this.arn,
    required this.createdAt,
    required this.dnsViewId,
    required this.expiresAt,
    required this.id,
    required this.status,
    required this.value,
    this.clientToken,
    this.name,
  });

  factory CreateAccessTokenOutput.fromJson(Map<String, dynamic> json) {
    return CreateAccessTokenOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      expiresAt: nonNullableTimeStampFromJson(json['expiresAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      status: TokenStatus.fromString((json['status'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
      clientToken: json['clientToken'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final expiresAt = this.expiresAt;
    final id = this.id;
    final status = this.status;
    final value = this.value;
    final clientToken = this.clientToken;
    final name = this.name;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'expiresAt': iso8601ToJson(expiresAt),
      'id': id,
      'status': status.value,
      'value': value,
      if (clientToken != null) 'clientToken': clientToken,
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class GetAccessTokenOutput {
  /// The Amazon Resource Name (ARN) of the token.
  final String arn;

  /// The time and date the token was created.
  final DateTime createdAt;

  /// ID of the DNS view the token is associated to.
  final String dnsViewId;

  /// The token's expiration time and date.
  final DateTime expiresAt;

  /// ID of the Global Resolver.
  final String globalResolverId;

  /// ID of the token.
  final String id;

  /// The operational status of the token.
  final TokenStatus status;

  /// The time and date the token was created.
  final DateTime updatedAt;

  /// The value of the token.
  final String value;

  /// A unique, case-sensitive identifier to ensure idempotency. This means that
  /// making the same request multiple times with the same
  /// <code>clientToken</code> has the same result every time.
  final String? clientToken;

  /// Name of the token.
  final String? name;

  GetAccessTokenOutput({
    required this.arn,
    required this.createdAt,
    required this.dnsViewId,
    required this.expiresAt,
    required this.globalResolverId,
    required this.id,
    required this.status,
    required this.updatedAt,
    required this.value,
    this.clientToken,
    this.name,
  });

  factory GetAccessTokenOutput.fromJson(Map<String, dynamic> json) {
    return GetAccessTokenOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      expiresAt: nonNullableTimeStampFromJson(json['expiresAt'] ?? 0),
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      status: TokenStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      value: (json['value'] as String?) ?? '',
      clientToken: json['clientToken'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final expiresAt = this.expiresAt;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final value = this.value;
    final clientToken = this.clientToken;
    final name = this.name;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'expiresAt': iso8601ToJson(expiresAt),
      'globalResolverId': globalResolverId,
      'id': id,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      'value': value,
      if (clientToken != null) 'clientToken': clientToken,
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class UpdateAccessTokenOutput {
  /// The ID of the token.
  final String id;

  /// The name of the token.
  final String name;

  UpdateAccessTokenOutput({
    required this.id,
    required this.name,
  });

  factory UpdateAccessTokenOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAccessTokenOutput(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      'id': id,
      'name': name,
    };
  }
}

/// @nodoc
class DeleteAccessTokenOutput {
  /// The date and time when the access token was deleted.
  final DateTime deletedAt;

  /// The unique identifier of the deleted access token.
  final String id;

  /// The final status of the deleted access token.
  final TokenStatus status;

  DeleteAccessTokenOutput({
    required this.deletedAt,
    required this.id,
    required this.status,
  });

  factory DeleteAccessTokenOutput.fromJson(Map<String, dynamic> json) {
    return DeleteAccessTokenOutput(
      deletedAt: nonNullableTimeStampFromJson(json['deletedAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      status: TokenStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final deletedAt = this.deletedAt;
    final id = this.id;
    final status = this.status;
    return {
      'deletedAt': iso8601ToJson(deletedAt),
      'id': id,
      'status': status.value,
    };
  }
}

/// @nodoc
class ListAccessTokensOutput {
  /// List of the tokens.
  final List<AccessTokenItem>? accessTokens;

  /// A pagination token used for large sets of results that can't be returned in
  /// a single response. Provide this token in the next call to get the results
  /// not returned in this call.
  final String? nextToken;

  ListAccessTokensOutput({
    this.accessTokens,
    this.nextToken,
  });

  factory ListAccessTokensOutput.fromJson(Map<String, dynamic> json) {
    return ListAccessTokensOutput(
      accessTokens: (json['accessTokens'] as List?)
          ?.nonNulls
          .map((e) => AccessTokenItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessTokens = this.accessTokens;
    final nextToken = this.nextToken;
    return {
      if (accessTokens != null) 'accessTokens': accessTokens,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateDNSViewOutput {
  /// The Amazon Resource Name (ARN) of the DNS view.
  final String arn;

  /// The date and time when the DNS view was created.
  final DateTime createdAt;

  /// Whether DNSSEC validation is enabled for DNS queries in this DNS view.
  final DnsSecValidationType dnssecValidation;

  /// Whether EDNS Client Subnet injection is enabled for DNS queries in this DNS
  /// view.
  final EdnsClientSubnetType ednsClientSubnet;

  /// The behavior when Route 53 Global Resolver cannot apply DNS firewall rules
  /// due to service impairment.
  final FirewallRulesFailOpenType firewallRulesFailOpen;

  /// The ID of the Route 53 Global Resolver instance the DNS view is created for.
  final String globalResolverId;

  /// The unique identifier for the DNS view.
  final String id;

  /// The descriptive name of the DNS view.
  final String name;

  /// The operational status of the DNS view.
  final ProfileResourceStatus status;

  /// The date and time when the DNS view was last updated.
  final DateTime updatedAt;

  /// The unique string that identifies the request and ensures idempotency.
  final String? clientToken;

  /// The description of the DNS view.
  final String? description;

  CreateDNSViewOutput({
    required this.arn,
    required this.createdAt,
    required this.dnssecValidation,
    required this.ednsClientSubnet,
    required this.firewallRulesFailOpen,
    required this.globalResolverId,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.clientToken,
    this.description,
  });

  factory CreateDNSViewOutput.fromJson(Map<String, dynamic> json) {
    return CreateDNSViewOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnssecValidation: DnsSecValidationType.fromString(
          (json['dnssecValidation'] as String?) ?? ''),
      ednsClientSubnet: EdnsClientSubnetType.fromString(
          (json['ednsClientSubnet'] as String?) ?? ''),
      firewallRulesFailOpen: FirewallRulesFailOpenType.fromString(
          (json['firewallRulesFailOpen'] as String?) ?? ''),
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status:
          ProfileResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      clientToken: json['clientToken'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dnssecValidation = this.dnssecValidation;
    final ednsClientSubnet = this.ednsClientSubnet;
    final firewallRulesFailOpen = this.firewallRulesFailOpen;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final clientToken = this.clientToken;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'dnssecValidation': dnssecValidation.value,
      'ednsClientSubnet': ednsClientSubnet.value,
      'firewallRulesFailOpen': firewallRulesFailOpen.value,
      'globalResolverId': globalResolverId,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class GetDNSViewOutput {
  /// Amazon Resource Name (ARN) of the DNS view.
  final String arn;

  /// The time and date the DNS view was creates on.
  final DateTime createdAt;

  /// Specifies whether DNSSEC is enabled or disabled for the DNS view.
  final DnsSecValidationType dnssecValidation;

  /// Specifies whether edns0 client subnet is enabled.
  final EdnsClientSubnetType ednsClientSubnet;

  /// Specifies the DNS Firewall failure mode configuration. When enabled, the DNS
  /// Firewall allows DNS queries to proceed if it's unable to properly evaluate
  /// them. When disabled, the DNS Firewall blocks DNS queries it's unable to
  /// evaluate.
  final FirewallRulesFailOpenType firewallRulesFailOpen;

  /// ID of the Global Resolver the DNS view is associated to.
  final String globalResolverId;

  /// ID of the DNS view.
  final String id;

  /// Name of the DNS view.
  final String name;

  /// Operational status of the DNS view.
  final ProfileResourceStatus status;

  /// The time and date the DNS view was updated on.
  final DateTime updatedAt;

  /// A unique, case-sensitive identifier to ensure idempotency. This means that
  /// making the same request multiple times with the same
  /// <code>clientToken</code> has the same result every time.
  final String? clientToken;

  /// Description of the DNS view.
  final String? description;

  GetDNSViewOutput({
    required this.arn,
    required this.createdAt,
    required this.dnssecValidation,
    required this.ednsClientSubnet,
    required this.firewallRulesFailOpen,
    required this.globalResolverId,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.clientToken,
    this.description,
  });

  factory GetDNSViewOutput.fromJson(Map<String, dynamic> json) {
    return GetDNSViewOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnssecValidation: DnsSecValidationType.fromString(
          (json['dnssecValidation'] as String?) ?? ''),
      ednsClientSubnet: EdnsClientSubnetType.fromString(
          (json['ednsClientSubnet'] as String?) ?? ''),
      firewallRulesFailOpen: FirewallRulesFailOpenType.fromString(
          (json['firewallRulesFailOpen'] as String?) ?? ''),
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status:
          ProfileResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      clientToken: json['clientToken'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dnssecValidation = this.dnssecValidation;
    final ednsClientSubnet = this.ednsClientSubnet;
    final firewallRulesFailOpen = this.firewallRulesFailOpen;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final clientToken = this.clientToken;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'dnssecValidation': dnssecValidation.value,
      'ednsClientSubnet': ednsClientSubnet.value,
      'firewallRulesFailOpen': firewallRulesFailOpen.value,
      'globalResolverId': globalResolverId,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class UpdateDNSViewOutput {
  /// The Amazon Resource Name (ARN) of the updated DNS view.
  final String arn;

  /// The date and time when the DNS view was originally created.
  final DateTime createdAt;

  /// Whether DNSSEC validation is enabled for the updated DNS view.
  final DnsSecValidationType dnssecValidation;

  /// Whether EDNS Client Subnet injection is enabled for the updated DNS view.
  final EdnsClientSubnetType ednsClientSubnet;

  /// Whether firewall rules fail open when they cannot be evaluated for the
  /// updated DNS view.
  final FirewallRulesFailOpenType firewallRulesFailOpen;

  /// The ID of the global resolver associated with the updated DNS view.
  final String globalResolverId;

  /// The unique identifier of the updated DNS view.
  final String id;

  /// The name of the updated DNS view.
  final String name;

  /// The current status of the updated DNS view.
  final ProfileResourceStatus status;

  /// The date and time when the DNS view was last updated.
  final DateTime updatedAt;

  /// The unique string that identifies the request and ensures idempotency.
  final String? clientToken;

  /// The description of the updated DNS view.
  final String? description;

  UpdateDNSViewOutput({
    required this.arn,
    required this.createdAt,
    required this.dnssecValidation,
    required this.ednsClientSubnet,
    required this.firewallRulesFailOpen,
    required this.globalResolverId,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.clientToken,
    this.description,
  });

  factory UpdateDNSViewOutput.fromJson(Map<String, dynamic> json) {
    return UpdateDNSViewOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnssecValidation: DnsSecValidationType.fromString(
          (json['dnssecValidation'] as String?) ?? ''),
      ednsClientSubnet: EdnsClientSubnetType.fromString(
          (json['ednsClientSubnet'] as String?) ?? ''),
      firewallRulesFailOpen: FirewallRulesFailOpenType.fromString(
          (json['firewallRulesFailOpen'] as String?) ?? ''),
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status:
          ProfileResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      clientToken: json['clientToken'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dnssecValidation = this.dnssecValidation;
    final ednsClientSubnet = this.ednsClientSubnet;
    final firewallRulesFailOpen = this.firewallRulesFailOpen;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final clientToken = this.clientToken;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'dnssecValidation': dnssecValidation.value,
      'ednsClientSubnet': ednsClientSubnet.value,
      'firewallRulesFailOpen': firewallRulesFailOpen.value,
      'globalResolverId': globalResolverId,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class DeleteDNSViewOutput {
  /// The Amazon Resource Name (ARN) of the deleted DNS view.
  final String arn;

  /// The date and time when the DNS view was originally created.
  final DateTime createdAt;

  /// Whether DNSSEC validation was enabled for the deleted DNS view.
  final DnsSecValidationType dnssecValidation;

  /// Whether EDNS Client Subnet injection was enabled for the deleted DNS view.
  final EdnsClientSubnetType ednsClientSubnet;

  /// The firewall rules fail-open behavior that was configured for the deleted
  /// DNS view.
  final FirewallRulesFailOpenType firewallRulesFailOpen;

  /// The ID of the Route 53 Global Resolver that the deleted DNS view was
  /// associated with.
  final String globalResolverId;

  /// The unique identifier of the deleted DNS view.
  final String id;

  /// The name of the deleted DNS view.
  final String name;

  /// The final status of the deleted DNS view.
  final ProfileResourceStatus status;

  /// The date and time when the DNS view was last updated before deletion.
  final DateTime updatedAt;

  /// The unique string that identifies the request and ensures idempotency.
  final String? clientToken;

  /// The description of the deleted DNS view.
  final String? description;

  DeleteDNSViewOutput({
    required this.arn,
    required this.createdAt,
    required this.dnssecValidation,
    required this.ednsClientSubnet,
    required this.firewallRulesFailOpen,
    required this.globalResolverId,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.clientToken,
    this.description,
  });

  factory DeleteDNSViewOutput.fromJson(Map<String, dynamic> json) {
    return DeleteDNSViewOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnssecValidation: DnsSecValidationType.fromString(
          (json['dnssecValidation'] as String?) ?? ''),
      ednsClientSubnet: EdnsClientSubnetType.fromString(
          (json['ednsClientSubnet'] as String?) ?? ''),
      firewallRulesFailOpen: FirewallRulesFailOpenType.fromString(
          (json['firewallRulesFailOpen'] as String?) ?? ''),
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status:
          ProfileResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      clientToken: json['clientToken'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dnssecValidation = this.dnssecValidation;
    final ednsClientSubnet = this.ednsClientSubnet;
    final firewallRulesFailOpen = this.firewallRulesFailOpen;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final clientToken = this.clientToken;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'dnssecValidation': dnssecValidation.value,
      'ednsClientSubnet': ednsClientSubnet.value,
      'firewallRulesFailOpen': firewallRulesFailOpen.value,
      'globalResolverId': globalResolverId,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class ListDNSViewsOutput {
  /// An array of information about the DNS views, such as whether DNSSEC is
  /// enabled, creation time, etc.
  final List<DNSViewSummary> dnsViews;

  /// A pagination token used for large sets of results that can't be returned in
  /// a single response. Provide this token in the next call to get the results
  /// not returned in this call.
  final String? nextToken;

  ListDNSViewsOutput({
    required this.dnsViews,
    this.nextToken,
  });

  factory ListDNSViewsOutput.fromJson(Map<String, dynamic> json) {
    return ListDNSViewsOutput(
      dnsViews: ((json['dnsViews'] as List?) ?? const [])
          .nonNulls
          .map((e) => DNSViewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dnsViews = this.dnsViews;
    final nextToken = this.nextToken;
    return {
      'dnsViews': dnsViews,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class DisableDNSViewOutput {
  /// The Amazon Resource Name (ARN) of the disabled DNS view.
  final String arn;

  /// The date and time when the DNS view was originally created.
  final DateTime createdAt;

  /// Whether DNSSEC validation is enabled for the disabled DNS view.
  final DnsSecValidationType dnssecValidation;

  /// Whether EDNS Client Subnet injection is enabled for the disabled DNS view.
  final EdnsClientSubnetType ednsClientSubnet;

  /// The firewall rules fail-open behavior configured for the disabled DNS view.
  final FirewallRulesFailOpenType firewallRulesFailOpen;

  /// The ID of the Route 53 Global Resolver that the disabled DNS view is
  /// associated with.
  final String globalResolverId;

  /// The unique identifier of the disabled DNS view.
  final String id;

  /// The name of the disabled DNS view.
  final String name;

  /// The current status of the disabled DNS view.
  final ProfileResourceStatus status;

  /// The date and time when the DNS view was last updated.
  final DateTime updatedAt;

  /// The unique string that identifies the request and ensures idempotency.
  final String? clientToken;

  /// The description of the disabled DNS view.
  final String? description;

  DisableDNSViewOutput({
    required this.arn,
    required this.createdAt,
    required this.dnssecValidation,
    required this.ednsClientSubnet,
    required this.firewallRulesFailOpen,
    required this.globalResolverId,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.clientToken,
    this.description,
  });

  factory DisableDNSViewOutput.fromJson(Map<String, dynamic> json) {
    return DisableDNSViewOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnssecValidation: DnsSecValidationType.fromString(
          (json['dnssecValidation'] as String?) ?? ''),
      ednsClientSubnet: EdnsClientSubnetType.fromString(
          (json['ednsClientSubnet'] as String?) ?? ''),
      firewallRulesFailOpen: FirewallRulesFailOpenType.fromString(
          (json['firewallRulesFailOpen'] as String?) ?? ''),
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status:
          ProfileResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      clientToken: json['clientToken'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dnssecValidation = this.dnssecValidation;
    final ednsClientSubnet = this.ednsClientSubnet;
    final firewallRulesFailOpen = this.firewallRulesFailOpen;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final clientToken = this.clientToken;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'dnssecValidation': dnssecValidation.value,
      'ednsClientSubnet': ednsClientSubnet.value,
      'firewallRulesFailOpen': firewallRulesFailOpen.value,
      'globalResolverId': globalResolverId,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class EnableDNSViewOutput {
  /// The Amazon Resource Name (ARN) of the enabled DNS view.
  final String arn;

  /// The date and time when the DNS view was originally created.
  final DateTime createdAt;

  /// Whether DNSSEC validation is enabled for the enabled DNS view.
  final DnsSecValidationType dnssecValidation;

  /// Whether EDNS Client Subnet injection is enabled for the enabled DNS view.
  final EdnsClientSubnetType ednsClientSubnet;

  /// The firewall rules fail-open behavior configured for the enabled DNS view.
  final FirewallRulesFailOpenType firewallRulesFailOpen;

  /// The ID of the Route 53 Global Resolver that the enabled DNS view is
  /// associated with.
  final String globalResolverId;

  /// The unique identifier of the enabled DNS view.
  final String id;

  /// The name of the enabled DNS view.
  final String name;

  /// The current status of the enabled DNS view.
  final ProfileResourceStatus status;

  /// The date and time when the DNS view was last updated.
  final DateTime updatedAt;

  /// The unique string that identifies the request and ensures idempotency.
  final String? clientToken;

  /// The description of the enabled DNS view.
  final String? description;

  EnableDNSViewOutput({
    required this.arn,
    required this.createdAt,
    required this.dnssecValidation,
    required this.ednsClientSubnet,
    required this.firewallRulesFailOpen,
    required this.globalResolverId,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.clientToken,
    this.description,
  });

  factory EnableDNSViewOutput.fromJson(Map<String, dynamic> json) {
    return EnableDNSViewOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnssecValidation: DnsSecValidationType.fromString(
          (json['dnssecValidation'] as String?) ?? ''),
      ednsClientSubnet: EdnsClientSubnetType.fromString(
          (json['ednsClientSubnet'] as String?) ?? ''),
      firewallRulesFailOpen: FirewallRulesFailOpenType.fromString(
          (json['firewallRulesFailOpen'] as String?) ?? ''),
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status:
          ProfileResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      clientToken: json['clientToken'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dnssecValidation = this.dnssecValidation;
    final ednsClientSubnet = this.ednsClientSubnet;
    final firewallRulesFailOpen = this.firewallRulesFailOpen;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final clientToken = this.clientToken;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'dnssecValidation': dnssecValidation.value,
      'ednsClientSubnet': ednsClientSubnet.value,
      'firewallRulesFailOpen': firewallRulesFailOpen.value,
      'globalResolverId': globalResolverId,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class CreateFirewallDomainListOutput {
  /// An Amazon Resource Name (ARN) for the domain list.
  final String arn;

  /// The time and date the domain list was created on.
  final DateTime createdAt;

  /// Number of domains in the domain list.
  final int domainCount;

  /// The ID of the Route 53 Global Resolver that the domain list is associated
  /// with.
  final String globalResolverId;

  /// ID of the domain list.
  final String id;

  /// Name of the domain list.
  final String name;

  /// Creation status of the domain list.
  final CRResourceStatus status;

  /// The time and date the domain list was updated.
  final DateTime updatedAt;

  /// Description for the domain list.
  final String? description;

  CreateFirewallDomainListOutput({
    required this.arn,
    required this.createdAt,
    required this.domainCount,
    required this.globalResolverId,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.description,
  });

  factory CreateFirewallDomainListOutput.fromJson(Map<String, dynamic> json) {
    return CreateFirewallDomainListOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      domainCount: (json['domainCount'] as int?) ?? 0,
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainCount = this.domainCount;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'domainCount': domainCount,
      'globalResolverId': globalResolverId,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class GetFirewallDomainListOutput {
  /// Amazon Resource Name (ARN) of the domain list.
  final String arn;

  /// The time and date the domain list was created.
  final DateTime createdAt;

  /// Number of domains in the domain list.
  final int domainCount;

  /// ID of the Global Resolver that the domain list is associated to.
  final String globalResolverId;

  /// ID of the domain list.
  final String id;

  /// Name of the domain list.
  final String name;

  /// Operational status of the domain list.
  final CRResourceStatus status;

  /// The date and time the domain list was updated.
  final DateTime updatedAt;

  /// A unique, case-sensitive identifier to ensure idempotency. This means that
  /// making the same request multiple times with the same
  /// <code>clientToken</code> has the same result every time.
  final String? clientToken;

  /// The description of the domain list.
  final String? description;

  /// Additional information about the status of the domain list.
  final String? statusMessage;

  GetFirewallDomainListOutput({
    required this.arn,
    required this.createdAt,
    required this.domainCount,
    required this.globalResolverId,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.clientToken,
    this.description,
    this.statusMessage,
  });

  factory GetFirewallDomainListOutput.fromJson(Map<String, dynamic> json) {
    return GetFirewallDomainListOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      domainCount: (json['domainCount'] as int?) ?? 0,
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      clientToken: json['clientToken'] as String?,
      description: json['description'] as String?,
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainCount = this.domainCount;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final clientToken = this.clientToken;
    final description = this.description;
    final statusMessage = this.statusMessage;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'domainCount': domainCount,
      'globalResolverId': globalResolverId,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
class DeleteFirewallDomainListOutput {
  /// The Amazon Resource Name (ARN) of the deleted firewall domain list.
  final String arn;

  /// The unique identifier of the deleted firewall domain list.
  final String id;

  /// The name of the deleted firewall domain list.
  final String name;

  /// The final status of the deleted firewall domain list.
  final CRResourceStatus status;

  DeleteFirewallDomainListOutput({
    required this.arn,
    required this.id,
    required this.name,
    required this.status,
  });

  factory DeleteFirewallDomainListOutput.fromJson(Map<String, dynamic> json) {
    return DeleteFirewallDomainListOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'status': status.value,
    };
  }
}

/// @nodoc
class ListFirewallDomainListsOutput {
  /// List of the DNS Firewall domain lists.
  final List<FirewallDomainListsItem> firewallDomainLists;

  /// A pagination token used for large sets of results that can't be returned in
  /// a single response. Provide this token in the next call to get the results
  /// not returned in this call.
  final String? nextToken;

  ListFirewallDomainListsOutput({
    required this.firewallDomainLists,
    this.nextToken,
  });

  factory ListFirewallDomainListsOutput.fromJson(Map<String, dynamic> json) {
    return ListFirewallDomainListsOutput(
      firewallDomainLists: ((json['firewallDomainLists'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              FirewallDomainListsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallDomainLists = this.firewallDomainLists;
    final nextToken = this.nextToken;
    return {
      'firewallDomainLists': firewallDomainLists,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ImportFirewallDomainsOutput {
  /// ID of the DNS Firewall domain list that you imported the domain list to.
  final String id;

  /// Name of the DNS Firewall domain list.
  final String name;

  /// Operational status of the DNS Firewall domain list.
  final CRResourceStatus status;

  ImportFirewallDomainsOutput({
    required this.id,
    required this.name,
    required this.status,
  });

  factory ImportFirewallDomainsOutput.fromJson(Map<String, dynamic> json) {
    return ImportFirewallDomainsOutput(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      'name': name,
      'status': status.value,
    };
  }
}

/// @nodoc
class ListFirewallDomainsOutput {
  /// List of domains in the specified domain list.
  final List<String> domains;

  /// A pagination token used for large sets of results that can't be returned in
  /// a single response. Provide this token in the next call to get the results
  /// not returned in this call.
  final String? nextToken;

  ListFirewallDomainsOutput({
    required this.domains,
    this.nextToken,
  });

  factory ListFirewallDomainsOutput.fromJson(Map<String, dynamic> json) {
    return ListFirewallDomainsOutput(
      domains: ((json['domains'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domains = this.domains;
    final nextToken = this.nextToken;
    return {
      'domains': domains,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class UpdateFirewallDomainsOutput {
  /// The ID of the DNS Firewall domain list.
  final String id;

  /// The name of the domain list.
  final String name;

  /// The operational status of the domain list.
  final CRResourceStatus status;

  UpdateFirewallDomainsOutput({
    required this.id,
    required this.name,
    required this.status,
  });

  factory UpdateFirewallDomainsOutput.fromJson(Map<String, dynamic> json) {
    return UpdateFirewallDomainsOutput(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      'name': name,
      'status': status.value,
    };
  }
}

/// @nodoc
class CreateFirewallRuleOutput {
  /// The action that DNS Firewall takes on DNS queries that match this rule.
  final FirewallRuleAction action;

  /// The date and time when the firewall rule was created.
  final DateTime createdAt;

  /// The ID of the DNS view associated with this firewall rule.
  final String dnsViewId;

  /// The unique identifier for the firewall rule.
  final String id;

  /// The name of the firewall rule.
  final String name;

  /// The priority of the firewall rule.
  final int priority;

  /// The operational status of the firewall rule.
  final CRResourceStatus status;

  /// The date and time when the firewall rule was last updated.
  final DateTime updatedAt;

  /// The DNS record type for the custom response when blockResponse is OVERRIDE.
  final BlockOverrideDnsQueryType? blockOverrideDnsType;

  /// The custom domain to return when the action is BLOCK and blockResponse is
  /// OVERRIDE.
  final String? blockOverrideDomain;

  /// The time-to-live (TTL) value for the custom response when blockResponse is
  /// OVERRIDE.
  final int? blockOverrideTtl;

  /// The response to return when the action is BLOCK.
  final FirewallBlockResponse? blockResponse;

  /// The confidence threshold for advanced threat detection.
  final ConfidenceThreshold? confidenceThreshold;

  /// The description of the firewall rule.
  final String? description;

  /// Whether advanced DNS threat protection is enabled for this rule.
  final DnsAdvancedProtection? dnsAdvancedProtection;

  /// The ID of the firewall domain list used in this rule.
  final String? firewallDomainListId;

  /// The DNS query type that this rule matches.
  final String? queryType;

  CreateFirewallRuleOutput({
    required this.action,
    required this.createdAt,
    required this.dnsViewId,
    required this.id,
    required this.name,
    required this.priority,
    required this.status,
    required this.updatedAt,
    this.blockOverrideDnsType,
    this.blockOverrideDomain,
    this.blockOverrideTtl,
    this.blockResponse,
    this.confidenceThreshold,
    this.description,
    this.dnsAdvancedProtection,
    this.firewallDomainListId,
    this.queryType,
  });

  factory CreateFirewallRuleOutput.fromJson(Map<String, dynamic> json) {
    return CreateFirewallRuleOutput(
      action: FirewallRuleAction.fromString((json['action'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      blockOverrideDnsType: (json['blockOverrideDnsType'] as String?)
          ?.let(BlockOverrideDnsQueryType.fromString),
      blockOverrideDomain: json['blockOverrideDomain'] as String?,
      blockOverrideTtl: json['blockOverrideTtl'] as int?,
      blockResponse: (json['blockResponse'] as String?)
          ?.let(FirewallBlockResponse.fromString),
      confidenceThreshold: (json['confidenceThreshold'] as String?)
          ?.let(ConfidenceThreshold.fromString),
      description: json['description'] as String?,
      dnsAdvancedProtection: (json['dnsAdvancedProtection'] as String?)
          ?.let(DnsAdvancedProtection.fromString),
      firewallDomainListId: json['firewallDomainListId'] as String?,
      queryType: json['queryType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final id = this.id;
    final name = this.name;
    final priority = this.priority;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final blockOverrideDnsType = this.blockOverrideDnsType;
    final blockOverrideDomain = this.blockOverrideDomain;
    final blockOverrideTtl = this.blockOverrideTtl;
    final blockResponse = this.blockResponse;
    final confidenceThreshold = this.confidenceThreshold;
    final description = this.description;
    final dnsAdvancedProtection = this.dnsAdvancedProtection;
    final firewallDomainListId = this.firewallDomainListId;
    final queryType = this.queryType;
    return {
      'action': action.value,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'id': id,
      'name': name,
      'priority': priority,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (firewallDomainListId != null)
        'firewallDomainListId': firewallDomainListId,
      if (queryType != null) 'queryType': queryType,
    };
  }
}

/// @nodoc
class GetFirewallRuleOutput {
  /// The action that DNS Firewall should take on a DNS query when it matches one
  /// of the domains in the rule's domain list, or a threat in a DNS Firewall
  /// Advanced rule.
  final FirewallRuleAction action;

  /// The time and date the DNS Firewall rule was created.
  final DateTime createdAt;

  /// The DNS view ID the DNS Firewall is associated with.
  final String dnsViewId;

  /// ID of the DNS Firewall rule.
  final String id;

  /// The name of the DNS Firewall rule.
  final String name;

  /// The setting that determines the processing order of the rule in the rule
  /// group. DNS Firewall processes the rules in a rule group by order of
  /// priority, starting from the lowest setting.
  final int priority;

  /// The operational status of the DNS Firewall rule.
  final CRResourceStatus status;

  /// The date and time the DNS Firewall rule was updated.
  final DateTime updatedAt;

  /// The DNS record's type. This determines the format of the record value that
  /// you provided in <code>BlockOverrideDomain</code>. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  final BlockOverrideDnsQueryType? blockOverrideDnsType;

  /// The custom DNS record to send back in response to the query. Used for the
  /// rule action <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  final String? blockOverrideDomain;

  /// The recommended amount of time, in seconds, for the DNS resolver or web
  /// browser to cache the provided override record. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  final int? blockOverrideTtl;

  /// The way that you want DNS Firewall to block the request. Used for the rule
  /// action setting <code>BLOCK</code>.
  final FirewallBlockResponse? blockResponse;

  /// The confidence threshold for DNS Firewall Advanced. You must provide this
  /// value when you create a DNS Firewall Advanced rule.
  final ConfidenceThreshold? confidenceThreshold;

  /// The description of the DNS Firewall rule.
  final String? description;

  /// The type of the DNS Firewall Advanced rule. Valid values are DGA,
  /// DNS_TUNNELING, and DICTIONARY_DGA.
  final DnsAdvancedProtection? dnsAdvancedProtection;

  /// The ID of a DNS Firewall domain list.
  final String? firewallDomainListId;

  /// The DNS query type you want the rule to evaluate.
  final String? queryType;

  GetFirewallRuleOutput({
    required this.action,
    required this.createdAt,
    required this.dnsViewId,
    required this.id,
    required this.name,
    required this.priority,
    required this.status,
    required this.updatedAt,
    this.blockOverrideDnsType,
    this.blockOverrideDomain,
    this.blockOverrideTtl,
    this.blockResponse,
    this.confidenceThreshold,
    this.description,
    this.dnsAdvancedProtection,
    this.firewallDomainListId,
    this.queryType,
  });

  factory GetFirewallRuleOutput.fromJson(Map<String, dynamic> json) {
    return GetFirewallRuleOutput(
      action: FirewallRuleAction.fromString((json['action'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      blockOverrideDnsType: (json['blockOverrideDnsType'] as String?)
          ?.let(BlockOverrideDnsQueryType.fromString),
      blockOverrideDomain: json['blockOverrideDomain'] as String?,
      blockOverrideTtl: json['blockOverrideTtl'] as int?,
      blockResponse: (json['blockResponse'] as String?)
          ?.let(FirewallBlockResponse.fromString),
      confidenceThreshold: (json['confidenceThreshold'] as String?)
          ?.let(ConfidenceThreshold.fromString),
      description: json['description'] as String?,
      dnsAdvancedProtection: (json['dnsAdvancedProtection'] as String?)
          ?.let(DnsAdvancedProtection.fromString),
      firewallDomainListId: json['firewallDomainListId'] as String?,
      queryType: json['queryType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final id = this.id;
    final name = this.name;
    final priority = this.priority;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final blockOverrideDnsType = this.blockOverrideDnsType;
    final blockOverrideDomain = this.blockOverrideDomain;
    final blockOverrideTtl = this.blockOverrideTtl;
    final blockResponse = this.blockResponse;
    final confidenceThreshold = this.confidenceThreshold;
    final description = this.description;
    final dnsAdvancedProtection = this.dnsAdvancedProtection;
    final firewallDomainListId = this.firewallDomainListId;
    final queryType = this.queryType;
    return {
      'action': action.value,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'id': id,
      'name': name,
      'priority': priority,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (firewallDomainListId != null)
        'firewallDomainListId': firewallDomainListId,
      if (queryType != null) 'queryType': queryType,
    };
  }
}

/// @nodoc
class UpdateFirewallRuleOutput {
  /// The action that DNS Firewall should take on a DNS query when it matches one
  /// of the domains in the rule's domain list, or a threat in a DNS Firewall
  /// Advanced rule.
  final FirewallRuleAction action;

  /// The time and date the Firewall rule was created.
  final DateTime createdAt;

  /// The ID of the DNS view the Firewall rule is associated with.
  final String dnsViewId;

  /// The ID of the Firewall rule.
  final String id;

  /// The name of the Firewall rule.
  final String name;

  /// The setting that determines the processing order of the rule in the rule
  /// group. DNS Firewall processes the rules in a rule group by order of
  /// priority, starting from the lowest setting.
  final int priority;

  /// The operational status of the firewall rule.
  final CRResourceStatus status;

  /// The time and date the rule was updated.
  final DateTime updatedAt;

  /// The DNS record's type. This determines the format of the record value that
  /// you provided in <code>BlockOverrideDomain</code>. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  final BlockOverrideDnsQueryType? blockOverrideDnsType;

  /// The custom DNS record to send back in response to the query. Used for the
  /// rule action <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  final String? blockOverrideDomain;

  /// The recommended amount of time, in seconds, for the DNS resolver or web
  /// browser to cache the provided override record. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  final int? blockOverrideTtl;

  /// The way that you want DNS Firewall to block the request. Used for the rule
  /// action setting <code>BLOCK</code>.
  final FirewallBlockResponse? blockResponse;

  /// The confidence threshold for DNS Firewall Advanced. You must provide this
  /// value when you create a DNS Firewall Advanced rule.
  final ConfidenceThreshold? confidenceThreshold;

  /// The description of the Firewall rule.
  final String? description;

  /// The type of the DNS Firewall Advanced rule. Valid values are DGA,
  /// DNS_TUNNELING, and DICTIONARY_DGA.
  final DnsAdvancedProtection? dnsAdvancedProtection;

  /// The ID of the domain list associated with the Firewall rule.
  final String? firewallDomainListId;

  /// The DNS query type you want the rule to evaluate.
  final String? queryType;

  UpdateFirewallRuleOutput({
    required this.action,
    required this.createdAt,
    required this.dnsViewId,
    required this.id,
    required this.name,
    required this.priority,
    required this.status,
    required this.updatedAt,
    this.blockOverrideDnsType,
    this.blockOverrideDomain,
    this.blockOverrideTtl,
    this.blockResponse,
    this.confidenceThreshold,
    this.description,
    this.dnsAdvancedProtection,
    this.firewallDomainListId,
    this.queryType,
  });

  factory UpdateFirewallRuleOutput.fromJson(Map<String, dynamic> json) {
    return UpdateFirewallRuleOutput(
      action: FirewallRuleAction.fromString((json['action'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      blockOverrideDnsType: (json['blockOverrideDnsType'] as String?)
          ?.let(BlockOverrideDnsQueryType.fromString),
      blockOverrideDomain: json['blockOverrideDomain'] as String?,
      blockOverrideTtl: json['blockOverrideTtl'] as int?,
      blockResponse: (json['blockResponse'] as String?)
          ?.let(FirewallBlockResponse.fromString),
      confidenceThreshold: (json['confidenceThreshold'] as String?)
          ?.let(ConfidenceThreshold.fromString),
      description: json['description'] as String?,
      dnsAdvancedProtection: (json['dnsAdvancedProtection'] as String?)
          ?.let(DnsAdvancedProtection.fromString),
      firewallDomainListId: json['firewallDomainListId'] as String?,
      queryType: json['queryType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final id = this.id;
    final name = this.name;
    final priority = this.priority;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final blockOverrideDnsType = this.blockOverrideDnsType;
    final blockOverrideDomain = this.blockOverrideDomain;
    final blockOverrideTtl = this.blockOverrideTtl;
    final blockResponse = this.blockResponse;
    final confidenceThreshold = this.confidenceThreshold;
    final description = this.description;
    final dnsAdvancedProtection = this.dnsAdvancedProtection;
    final firewallDomainListId = this.firewallDomainListId;
    final queryType = this.queryType;
    return {
      'action': action.value,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'id': id,
      'name': name,
      'priority': priority,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (firewallDomainListId != null)
        'firewallDomainListId': firewallDomainListId,
      if (queryType != null) 'queryType': queryType,
    };
  }
}

/// @nodoc
class DeleteFirewallRuleOutput {
  /// The action that was configured for the deleted firewall rule.
  final FirewallRuleAction action;

  /// The date and time when the firewall rule was originally created.
  final DateTime createdAt;

  /// The ID of the DNS view that was associated with the deleted firewall rule.
  final String dnsViewId;

  /// The unique identifier of the deleted firewall rule.
  final String id;

  /// The name of the deleted firewall rule.
  final String name;

  /// The priority that was configured for the deleted firewall rule.
  final int priority;

  /// The final status of the deleted firewall rule.
  final CRResourceStatus status;

  /// The date and time when the firewall rule was last updated before deletion.
  final DateTime updatedAt;

  /// The DNS record type that was configured for the deleted firewall rule's
  /// custom response.
  final BlockOverrideDnsQueryType? blockOverrideDnsType;

  /// The custom domain that was configured for the deleted firewall rule's BLOCK
  /// response.
  final String? blockOverrideDomain;

  /// The TTL value that was configured for the deleted firewall rule's custom
  /// response.
  final int? blockOverrideTtl;

  /// The block response type that was configured for the deleted firewall rule.
  final FirewallBlockResponse? blockResponse;

  /// The confidence threshold that was configured for the deleted firewall rule's
  /// advanced threat detection.
  final ConfidenceThreshold? confidenceThreshold;

  /// The description of the deleted firewall rule.
  final String? description;

  /// Whether advanced DNS threat protection was enabled for the deleted firewall
  /// rule.
  final DnsAdvancedProtection? dnsAdvancedProtection;

  /// The ID of the firewall domain list that was associated with the deleted
  /// firewall rule.
  final String? firewallDomainListId;

  /// The DNS query type that the deleted firewall rule was configured to match.
  final String? queryType;

  DeleteFirewallRuleOutput({
    required this.action,
    required this.createdAt,
    required this.dnsViewId,
    required this.id,
    required this.name,
    required this.priority,
    required this.status,
    required this.updatedAt,
    this.blockOverrideDnsType,
    this.blockOverrideDomain,
    this.blockOverrideTtl,
    this.blockResponse,
    this.confidenceThreshold,
    this.description,
    this.dnsAdvancedProtection,
    this.firewallDomainListId,
    this.queryType,
  });

  factory DeleteFirewallRuleOutput.fromJson(Map<String, dynamic> json) {
    return DeleteFirewallRuleOutput(
      action: FirewallRuleAction.fromString((json['action'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      blockOverrideDnsType: (json['blockOverrideDnsType'] as String?)
          ?.let(BlockOverrideDnsQueryType.fromString),
      blockOverrideDomain: json['blockOverrideDomain'] as String?,
      blockOverrideTtl: json['blockOverrideTtl'] as int?,
      blockResponse: (json['blockResponse'] as String?)
          ?.let(FirewallBlockResponse.fromString),
      confidenceThreshold: (json['confidenceThreshold'] as String?)
          ?.let(ConfidenceThreshold.fromString),
      description: json['description'] as String?,
      dnsAdvancedProtection: (json['dnsAdvancedProtection'] as String?)
          ?.let(DnsAdvancedProtection.fromString),
      firewallDomainListId: json['firewallDomainListId'] as String?,
      queryType: json['queryType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final id = this.id;
    final name = this.name;
    final priority = this.priority;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final blockOverrideDnsType = this.blockOverrideDnsType;
    final blockOverrideDomain = this.blockOverrideDomain;
    final blockOverrideTtl = this.blockOverrideTtl;
    final blockResponse = this.blockResponse;
    final confidenceThreshold = this.confidenceThreshold;
    final description = this.description;
    final dnsAdvancedProtection = this.dnsAdvancedProtection;
    final firewallDomainListId = this.firewallDomainListId;
    final queryType = this.queryType;
    return {
      'action': action.value,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'id': id,
      'name': name,
      'priority': priority,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (firewallDomainListId != null)
        'firewallDomainListId': firewallDomainListId,
      if (queryType != null) 'queryType': queryType,
    };
  }
}

/// @nodoc
class ListFirewallRulesOutput {
  /// List of the firewall rules and information about them.
  final List<FirewallRulesItem> firewallRules;

  /// A pagination token used for large sets of results that can't be returned in
  /// a single response. Provide this token in the next call to get the results
  /// not returned in this call.
  final String? nextToken;

  ListFirewallRulesOutput({
    required this.firewallRules,
    this.nextToken,
  });

  factory ListFirewallRulesOutput.fromJson(Map<String, dynamic> json) {
    return ListFirewallRulesOutput(
      firewallRules: ((json['firewallRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => FirewallRulesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRules = this.firewallRules;
    final nextToken = this.nextToken;
    return {
      'firewallRules': firewallRules,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class BatchCreateFirewallRuleOutput {
  /// High level information about the DNS Firewall rules that failed to create.
  final List<BatchCreateFirewallRuleOutputItem> failures;

  /// High level information about the DNS Firewall rules that were created.
  final List<BatchCreateFirewallRuleOutputItem> successes;

  BatchCreateFirewallRuleOutput({
    required this.failures,
    required this.successes,
  });

  factory BatchCreateFirewallRuleOutput.fromJson(Map<String, dynamic> json) {
    return BatchCreateFirewallRuleOutput(
      failures: ((json['failures'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchCreateFirewallRuleOutputItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successes: ((json['successes'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchCreateFirewallRuleOutputItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final successes = this.successes;
    return {
      'failures': failures,
      'successes': successes,
    };
  }
}

/// @nodoc
class BatchDeleteFirewallRuleOutput {
  /// High level information about the DNS Firewall rules that failed to delete.
  final List<BatchDeleteFirewallRuleOutputItem> failures;

  /// High level information about the DNS Firewall rules that were deleted
  /// successfully.
  final List<BatchDeleteFirewallRuleOutputItem> successes;

  BatchDeleteFirewallRuleOutput({
    required this.failures,
    required this.successes,
  });

  factory BatchDeleteFirewallRuleOutput.fromJson(Map<String, dynamic> json) {
    return BatchDeleteFirewallRuleOutput(
      failures: ((json['failures'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchDeleteFirewallRuleOutputItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successes: ((json['successes'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchDeleteFirewallRuleOutputItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final successes = this.successes;
    return {
      'failures': failures,
      'successes': successes,
    };
  }
}

/// @nodoc
class BatchUpdateFirewallRuleOutput {
  /// High level information about the DNS Firewall rules that failed to update.
  final List<BatchUpdateFirewallRuleOutputItem> failures;

  /// High level information about the DNS Firewall rules that were successfully
  /// updated.
  final List<BatchUpdateFirewallRuleOutputItem> successes;

  BatchUpdateFirewallRuleOutput({
    required this.failures,
    required this.successes,
  });

  factory BatchUpdateFirewallRuleOutput.fromJson(Map<String, dynamic> json) {
    return BatchUpdateFirewallRuleOutput(
      failures: ((json['failures'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchUpdateFirewallRuleOutputItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successes: ((json['successes'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchUpdateFirewallRuleOutputItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final successes = this.successes;
    return {
      'failures': failures,
      'successes': successes,
    };
  }
}

/// @nodoc
class CreateGlobalResolverOutput {
  /// The Amazon Resource Name (ARN) of the Route 53 Global Resolver.
  final String arn;

  /// The unique string that identifies the request and ensures idempotency.
  final String clientToken;

  /// The date and time when the Route 53 Global Resolver was created.
  final DateTime createdAt;

  /// The hostname that DNS clients should use for TLS certificate validation when
  /// connecting to the Route 53 Global Resolver. This value resolves to the
  /// global anycast IP addresses for the resolver.
  final String dnsName;

  /// The unique identifier for the Route 53 Global Resolver.
  final String id;

  /// The global anycast IPv4 addresses associated with the Route 53 Global
  /// Resolver. DNS clients can send queries to these addresses from anywhere on
  /// the internet.
  final List<String> ipv4Addresses;

  /// The name of the Route 53 Global Resolver.
  final String name;

  /// The Amazon Web Services Regions where the Route 53 Global Resolver is
  /// deployed and operational.
  final List<String> regions;

  /// The current status of the Route 53 Global Resolver. Possible values are
  /// CREATING (being provisioned), UPDATING (being modified), OPERATIONAL (ready
  /// to serve queries), or DELETING (being removed).
  final CRResourceStatus status;

  /// The date and time when the Route 53 Global Resolver was last updated.
  final DateTime updatedAt;

  /// The description of the Route 53 Global Resolver.
  final String? description;

  /// The IP address type configured for the Route 53 Global Resolver (IPV4 or
  /// DUAL_STACK).
  final GlobalResolverIpAddressType? ipAddressType;

  /// The global anycast IPv6 addresses associated with the Route 53 Global
  /// Resolver. This field is only populated when ipAddressType is DUAL_STACK. DNS
  /// clients can send queries to these addresses from anywhere on the internet.
  final List<String>? ipv6Addresses;

  /// The Amazon Web Services Region where observability data for the Route 53
  /// Global Resolver is stored.
  final String? observabilityRegion;

  CreateGlobalResolverOutput({
    required this.arn,
    required this.clientToken,
    required this.createdAt,
    required this.dnsName,
    required this.id,
    required this.ipv4Addresses,
    required this.name,
    required this.regions,
    required this.status,
    required this.updatedAt,
    this.description,
    this.ipAddressType,
    this.ipv6Addresses,
    this.observabilityRegion,
  });

  factory CreateGlobalResolverOutput.fromJson(Map<String, dynamic> json) {
    return CreateGlobalResolverOutput(
      arn: (json['arn'] as String?) ?? '',
      clientToken: (json['clientToken'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsName: (json['dnsName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      ipv4Addresses: ((json['ipv4Addresses'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      name: (json['name'] as String?) ?? '',
      regions: ((json['regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      ipAddressType: (json['ipAddressType'] as String?)
          ?.let(GlobalResolverIpAddressType.fromString),
      ipv6Addresses: (json['ipv6Addresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      observabilityRegion: json['observabilityRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientToken = this.clientToken;
    final createdAt = this.createdAt;
    final dnsName = this.dnsName;
    final id = this.id;
    final ipv4Addresses = this.ipv4Addresses;
    final name = this.name;
    final regions = this.regions;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final ipAddressType = this.ipAddressType;
    final ipv6Addresses = this.ipv6Addresses;
    final observabilityRegion = this.observabilityRegion;
    return {
      'arn': arn,
      'clientToken': clientToken,
      'createdAt': iso8601ToJson(createdAt),
      'dnsName': dnsName,
      'id': id,
      'ipv4Addresses': ipv4Addresses,
      'name': name,
      'regions': regions,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv6Addresses != null) 'ipv6Addresses': ipv6Addresses,
      if (observabilityRegion != null)
        'observabilityRegion': observabilityRegion,
    };
  }
}

/// @nodoc
class GetGlobalResolverOutput {
  /// The Amazon Resource Name (ARN) of the Global Resolver.
  final String arn;

  /// A unique, case-sensitive identifier to ensure idempotency. This means that
  /// making the same request multiple times with the same
  /// <code>clientToken</code> has the same result every time.
  final String clientToken;

  /// The date and time the Global Resolver was created.
  final DateTime createdAt;

  /// The hostname used by the customers' DNS clients for certification
  /// validation.
  final String dnsName;

  /// The ID of the Global Resolver.
  final String id;

  /// List of anycast IPv4 addresses associated with the Global Resolver instance.
  final List<String> ipv4Addresses;

  /// The name of the Global Resolver.
  final String name;

  /// The Amazon Web Services Regions in which the Global Resolver operate.
  final List<String> regions;

  /// The operational status of the Global Resolver.
  final CRResourceStatus status;

  /// The date and time the Global Resolver was updated.
  final DateTime updatedAt;

  /// The description of the Global Resolver.
  final String? description;

  /// The IP address type configured for the Global Resolver.
  final GlobalResolverIpAddressType? ipAddressType;

  /// List of anycast IPv6 addresses associated with the Global Resolver instance.
  /// This field is only populated when ipAddressType is DUAL_STACK.
  final List<String>? ipv6Addresses;

  /// The Amazon Web Services Regions in which the users' Global Resolver query
  /// resolution logs will be propagated.
  final String? observabilityRegion;

  GetGlobalResolverOutput({
    required this.arn,
    required this.clientToken,
    required this.createdAt,
    required this.dnsName,
    required this.id,
    required this.ipv4Addresses,
    required this.name,
    required this.regions,
    required this.status,
    required this.updatedAt,
    this.description,
    this.ipAddressType,
    this.ipv6Addresses,
    this.observabilityRegion,
  });

  factory GetGlobalResolverOutput.fromJson(Map<String, dynamic> json) {
    return GetGlobalResolverOutput(
      arn: (json['arn'] as String?) ?? '',
      clientToken: (json['clientToken'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsName: (json['dnsName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      ipv4Addresses: ((json['ipv4Addresses'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      name: (json['name'] as String?) ?? '',
      regions: ((json['regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      ipAddressType: (json['ipAddressType'] as String?)
          ?.let(GlobalResolverIpAddressType.fromString),
      ipv6Addresses: (json['ipv6Addresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      observabilityRegion: json['observabilityRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientToken = this.clientToken;
    final createdAt = this.createdAt;
    final dnsName = this.dnsName;
    final id = this.id;
    final ipv4Addresses = this.ipv4Addresses;
    final name = this.name;
    final regions = this.regions;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final ipAddressType = this.ipAddressType;
    final ipv6Addresses = this.ipv6Addresses;
    final observabilityRegion = this.observabilityRegion;
    return {
      'arn': arn,
      'clientToken': clientToken,
      'createdAt': iso8601ToJson(createdAt),
      'dnsName': dnsName,
      'id': id,
      'ipv4Addresses': ipv4Addresses,
      'name': name,
      'regions': regions,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv6Addresses != null) 'ipv6Addresses': ipv6Addresses,
      if (observabilityRegion != null)
        'observabilityRegion': observabilityRegion,
    };
  }
}

/// @nodoc
class UpdateGlobalResolverOutput {
  /// The Amazon Resource Name (ARN) of the Global Resolver.
  final String arn;

  /// A unique, case-sensitive identifier to ensure idempotency. This means that
  /// making the same request multiple times with the same
  /// <code>clientToken</code> has the same result every time.
  final String clientToken;

  /// The time and date the Global Resolverwas created.
  final DateTime createdAt;

  /// The hostname to be used by the customers' DNS clients for certification
  /// validation.
  final String dnsName;

  /// The ID of the Global Resolver.
  final String id;

  /// List of anycast IPv4 addresses associated with the Global Resolver instance.
  final List<String> ipv4Addresses;

  /// Name of the Global Resolver.
  final String name;

  /// The Amazon Web Services Regions in which the Global Resolver will operate.
  final List<String> regions;

  /// The operational status of the Global Resolver.
  final CRResourceStatus status;

  /// The time and date the Global Resolver was updated.
  final DateTime updatedAt;

  /// Description of the Global Resolver.
  final String? description;

  /// The IP address type configured for the updated Global Resolver.
  final GlobalResolverIpAddressType? ipAddressType;

  /// List of anycast IPv6 addresses associated with the updated Global Resolver
  /// instance. This field is only populated when ipAddressType is DUAL_STACK.
  final List<String>? ipv6Addresses;

  /// The Amazon Web Services Regions in which the users' Global Resolver query
  /// resolution logs will be propagated.
  final String? observabilityRegion;

  UpdateGlobalResolverOutput({
    required this.arn,
    required this.clientToken,
    required this.createdAt,
    required this.dnsName,
    required this.id,
    required this.ipv4Addresses,
    required this.name,
    required this.regions,
    required this.status,
    required this.updatedAt,
    this.description,
    this.ipAddressType,
    this.ipv6Addresses,
    this.observabilityRegion,
  });

  factory UpdateGlobalResolverOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGlobalResolverOutput(
      arn: (json['arn'] as String?) ?? '',
      clientToken: (json['clientToken'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsName: (json['dnsName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      ipv4Addresses: ((json['ipv4Addresses'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      name: (json['name'] as String?) ?? '',
      regions: ((json['regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      ipAddressType: (json['ipAddressType'] as String?)
          ?.let(GlobalResolverIpAddressType.fromString),
      ipv6Addresses: (json['ipv6Addresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      observabilityRegion: json['observabilityRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientToken = this.clientToken;
    final createdAt = this.createdAt;
    final dnsName = this.dnsName;
    final id = this.id;
    final ipv4Addresses = this.ipv4Addresses;
    final name = this.name;
    final regions = this.regions;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final ipAddressType = this.ipAddressType;
    final ipv6Addresses = this.ipv6Addresses;
    final observabilityRegion = this.observabilityRegion;
    return {
      'arn': arn,
      'clientToken': clientToken,
      'createdAt': iso8601ToJson(createdAt),
      'dnsName': dnsName,
      'id': id,
      'ipv4Addresses': ipv4Addresses,
      'name': name,
      'regions': regions,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv6Addresses != null) 'ipv6Addresses': ipv6Addresses,
      if (observabilityRegion != null)
        'observabilityRegion': observabilityRegion,
    };
  }
}

/// @nodoc
class DeleteGlobalResolverOutput {
  /// The Amazon Resource Name (ARN) of the deleted Route 53 Global Resolver.
  final String arn;

  /// The unique string that identifies the request and ensures idempotency.
  final String clientToken;

  /// The date and time when the Route 53 Global Resolver was originally created.
  final DateTime createdAt;

  /// The hostname that DNS clients used for TLS certificate validation when
  /// connecting to the deleted Route 53 Global Resolver.
  final String dnsName;

  /// The unique identifier of the deleted Route 53 Global Resolver.
  final String id;

  /// The global anycast IPv4 addresses that were associated with the deleted
  /// Route 53 Global Resolver.
  final List<String> ipv4Addresses;

  /// The name of the deleted Route 53 Global Resolver.
  final String name;

  /// The Amazon Web Services Regions where the deleted Route 53 Global Resolver
  /// was deployed and operational.
  final List<String> regions;

  /// The final status of the deleted Route 53 Global Resolver.
  final CRResourceStatus status;

  /// The date and time when the Route 53 Global Resolver was last updated before
  /// deletion.
  final DateTime updatedAt;

  /// The description of the deleted Route 53 Global Resolver.
  final String? description;

  /// The IP address type that was configured for the deleted Route 53 Global
  /// Resolver.
  final GlobalResolverIpAddressType? ipAddressType;

  /// The global anycast IPv6 addresses that were associated with the deleted
  /// Route 53 Global Resolver.
  final List<String>? ipv6Addresses;

  /// The Amazon Web Services Region where observability data for the deleted
  /// Route 53 Global Resolver was stored.
  final String? observabilityRegion;

  DeleteGlobalResolverOutput({
    required this.arn,
    required this.clientToken,
    required this.createdAt,
    required this.dnsName,
    required this.id,
    required this.ipv4Addresses,
    required this.name,
    required this.regions,
    required this.status,
    required this.updatedAt,
    this.description,
    this.ipAddressType,
    this.ipv6Addresses,
    this.observabilityRegion,
  });

  factory DeleteGlobalResolverOutput.fromJson(Map<String, dynamic> json) {
    return DeleteGlobalResolverOutput(
      arn: (json['arn'] as String?) ?? '',
      clientToken: (json['clientToken'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsName: (json['dnsName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      ipv4Addresses: ((json['ipv4Addresses'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      name: (json['name'] as String?) ?? '',
      regions: ((json['regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      ipAddressType: (json['ipAddressType'] as String?)
          ?.let(GlobalResolverIpAddressType.fromString),
      ipv6Addresses: (json['ipv6Addresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      observabilityRegion: json['observabilityRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientToken = this.clientToken;
    final createdAt = this.createdAt;
    final dnsName = this.dnsName;
    final id = this.id;
    final ipv4Addresses = this.ipv4Addresses;
    final name = this.name;
    final regions = this.regions;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final ipAddressType = this.ipAddressType;
    final ipv6Addresses = this.ipv6Addresses;
    final observabilityRegion = this.observabilityRegion;
    return {
      'arn': arn,
      'clientToken': clientToken,
      'createdAt': iso8601ToJson(createdAt),
      'dnsName': dnsName,
      'id': id,
      'ipv4Addresses': ipv4Addresses,
      'name': name,
      'regions': regions,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv6Addresses != null) 'ipv6Addresses': ipv6Addresses,
      if (observabilityRegion != null)
        'observabilityRegion': observabilityRegion,
    };
  }
}

/// @nodoc
class ListGlobalResolversOutput {
  /// Paginated list of Global Resolvers.
  final List<GlobalResolversItem> globalResolvers;

  /// A pagination token used for large sets of results that can't be returned in
  /// a single response. Provide this token in the next call to get the results
  /// not returned in this call.
  final String? nextToken;

  ListGlobalResolversOutput({
    required this.globalResolvers,
    this.nextToken,
  });

  factory ListGlobalResolversOutput.fromJson(Map<String, dynamic> json) {
    return ListGlobalResolversOutput(
      globalResolvers: ((json['globalResolvers'] as List?) ?? const [])
          .nonNulls
          .map((e) => GlobalResolversItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final globalResolvers = this.globalResolvers;
    final nextToken = this.nextToken;
    return {
      'globalResolvers': globalResolvers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class AssociateHostedZoneOutput {
  /// The date and time the private hosted zone association was created.
  final DateTime createdAt;

  /// ID of the private hosted zone.
  final String hostedZoneId;

  /// Name of the hosted zone (also the domain associated with the hosted zone).
  final String hostedZoneName;

  /// ID of the association.
  final String id;

  /// Name for the private hosted zone association.
  final String name;

  /// An Amazon Resource Name (ARN) of the Route 53 Global Resolver the private
  /// hosted zone is associated to.
  final String resourceArn;

  /// Aggregate status for all the Amazon Web Services Regions in which the Route
  /// 53 Global Resolver exists.
  final HostedZoneAssociationStatus status;

  /// The date and time the private hosted zone association was modified.
  final DateTime updatedAt;

  AssociateHostedZoneOutput({
    required this.createdAt,
    required this.hostedZoneId,
    required this.hostedZoneName,
    required this.id,
    required this.name,
    required this.resourceArn,
    required this.status,
    required this.updatedAt,
  });

  factory AssociateHostedZoneOutput.fromJson(Map<String, dynamic> json) {
    return AssociateHostedZoneOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      hostedZoneId: (json['hostedZoneId'] as String?) ?? '',
      hostedZoneName: (json['hostedZoneName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
      status: HostedZoneAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final hostedZoneId = this.hostedZoneId;
    final hostedZoneName = this.hostedZoneName;
    final id = this.id;
    final name = this.name;
    final resourceArn = this.resourceArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'hostedZoneId': hostedZoneId,
      'hostedZoneName': hostedZoneName,
      'id': id,
      'name': name,
      'resourceArn': resourceArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class GetHostedZoneAssociationOutput {
  /// The time and date the private hosted zone association was created.
  final DateTime createdAt;

  /// ID of the hosted zone associated to the DNS view.
  final String hostedZoneId;

  /// Name of the domain associated with the private hosted zone.
  final String hostedZoneName;

  /// ID of the private hosted zone association.
  final String id;

  /// Name of the private hosted zone association.
  final String name;

  /// Amazon Resource Name (ARN) of the DNS view the private hosted zone is
  /// associated to.
  final String resourceArn;

  /// The operational status of the private hosted zone association.
  final HostedZoneAssociationStatus status;

  /// The time and date the private hosted zone association was updated.
  final DateTime updatedAt;

  GetHostedZoneAssociationOutput({
    required this.createdAt,
    required this.hostedZoneId,
    required this.hostedZoneName,
    required this.id,
    required this.name,
    required this.resourceArn,
    required this.status,
    required this.updatedAt,
  });

  factory GetHostedZoneAssociationOutput.fromJson(Map<String, dynamic> json) {
    return GetHostedZoneAssociationOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      hostedZoneId: (json['hostedZoneId'] as String?) ?? '',
      hostedZoneName: (json['hostedZoneName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
      status: HostedZoneAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final hostedZoneId = this.hostedZoneId;
    final hostedZoneName = this.hostedZoneName;
    final id = this.id;
    final name = this.name;
    final resourceArn = this.resourceArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'hostedZoneId': hostedZoneId,
      'hostedZoneName': hostedZoneName,
      'id': id,
      'name': name,
      'resourceArn': resourceArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class UpdateHostedZoneAssociationOutput {
  /// The time and date the private hosted zone association was created.
  final DateTime createdAt;

  /// The ID of the private hosted zone.
  final String hostedZoneId;

  /// The name of the domain associated with the private hosted zone.
  final String hostedZoneName;

  /// The ID of the private hosted zone association.
  final String id;

  /// The name of the private hosted zone association.
  final String name;

  /// The Amazon Resource Name (ARN) of the private hosted zone association.
  final String resourceArn;

  /// The operational status of the private hosted zone association.
  final HostedZoneAssociationStatus status;

  /// The time and date the private hosted zone association was updated.
  final DateTime updatedAt;

  UpdateHostedZoneAssociationOutput({
    required this.createdAt,
    required this.hostedZoneId,
    required this.hostedZoneName,
    required this.id,
    required this.name,
    required this.resourceArn,
    required this.status,
    required this.updatedAt,
  });

  factory UpdateHostedZoneAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateHostedZoneAssociationOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      hostedZoneId: (json['hostedZoneId'] as String?) ?? '',
      hostedZoneName: (json['hostedZoneName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
      status: HostedZoneAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final hostedZoneId = this.hostedZoneId;
    final hostedZoneName = this.hostedZoneName;
    final id = this.id;
    final name = this.name;
    final resourceArn = this.resourceArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'hostedZoneId': hostedZoneId,
      'hostedZoneName': hostedZoneName,
      'id': id,
      'name': name,
      'resourceArn': resourceArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class ListHostedZoneAssociationsOutput {
  /// List of the private hosted zone associations.
  final List<HostedZoneAssociationSummary> hostedZoneAssociations;

  /// A pagination token used for large sets of results that can't be returned in
  /// a single response. Provide this token in the next call to get the results
  /// not returned in this call.
  final String? nextToken;

  ListHostedZoneAssociationsOutput({
    required this.hostedZoneAssociations,
    this.nextToken,
  });

  factory ListHostedZoneAssociationsOutput.fromJson(Map<String, dynamic> json) {
    return ListHostedZoneAssociationsOutput(
      hostedZoneAssociations: ((json['hostedZoneAssociations'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              HostedZoneAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZoneAssociations = this.hostedZoneAssociations;
    final nextToken = this.nextToken;
    return {
      'hostedZoneAssociations': hostedZoneAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetManagedFirewallDomainListOutput {
  /// ID of the Managed Domain List.
  final String id;

  /// Type of the managed category. This is either <code>THREAT</code> or
  /// <code>CONTENT</code>.
  final String managedListType;

  /// Name of the Managed Domain List.
  final String name;

  /// Description of the Managed Domain List.
  final String? description;

  GetManagedFirewallDomainListOutput({
    required this.id,
    required this.managedListType,
    required this.name,
    this.description,
  });

  factory GetManagedFirewallDomainListOutput.fromJson(
      Map<String, dynamic> json) {
    return GetManagedFirewallDomainListOutput(
      id: (json['id'] as String?) ?? '',
      managedListType: (json['managedListType'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final managedListType = this.managedListType;
    final name = this.name;
    final description = this.description;
    return {
      'id': id,
      'managedListType': managedListType,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class ListManagedFirewallDomainListsOutput {
  /// List of the Managed Domain Lists.
  final List<ManagedFirewallDomainListsItem> managedFirewallDomainLists;

  /// A pagination token used for large sets of results that can't be returned in
  /// a single response. Provide this token in the next call to get the results
  /// not returned in this call.
  final String? nextToken;

  ListManagedFirewallDomainListsOutput({
    required this.managedFirewallDomainLists,
    this.nextToken,
  });

  factory ListManagedFirewallDomainListsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListManagedFirewallDomainListsOutput(
      managedFirewallDomainLists:
          ((json['managedFirewallDomainLists'] as List?) ?? const [])
              .nonNulls
              .map((e) => ManagedFirewallDomainListsItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final managedFirewallDomainLists = this.managedFirewallDomainLists;
    final nextToken = this.nextToken;
    return {
      'managedFirewallDomainLists': managedFirewallDomainLists,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Summary information about a managed firewall domain list.
///
/// @nodoc
class ManagedFirewallDomainListsItem {
  /// The unique identifier of the managed firewall domain list.
  final String id;

  /// The type of the managed firewall domain list.
  final String managedListType;

  /// The name of the managed firewall domain list.
  final String name;

  /// A description of the managed firewall domain list.
  final String? description;

  ManagedFirewallDomainListsItem({
    required this.id,
    required this.managedListType,
    required this.name,
    this.description,
  });

  factory ManagedFirewallDomainListsItem.fromJson(Map<String, dynamic> json) {
    return ManagedFirewallDomainListsItem(
      id: (json['id'] as String?) ?? '',
      managedListType: (json['managedListType'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final managedListType = this.managedListType;
    final name = this.name;
    final description = this.description;
    return {
      'id': id,
      'managedListType': managedListType,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// Summary information about a hosted zone association.
///
/// @nodoc
class HostedZoneAssociationSummary {
  /// The date and time when the hosted zone association was created.
  final DateTime createdAt;

  /// The ID of the hosted zone.
  final String hostedZoneId;

  /// The name of the hosted zone.
  final String hostedZoneName;

  /// The unique identifier of the hosted zone association.
  final String id;

  /// The name of the hosted zone association.
  final String name;

  /// The Amazon Resource Name (ARN) of the resource associated with the hosted
  /// zone.
  final String resourceArn;

  /// The current status of the hosted zone association.
  final HostedZoneAssociationStatus status;

  /// The date and time when the hosted zone association was last updated.
  final DateTime updatedAt;

  HostedZoneAssociationSummary({
    required this.createdAt,
    required this.hostedZoneId,
    required this.hostedZoneName,
    required this.id,
    required this.name,
    required this.resourceArn,
    required this.status,
    required this.updatedAt,
  });

  factory HostedZoneAssociationSummary.fromJson(Map<String, dynamic> json) {
    return HostedZoneAssociationSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      hostedZoneId: (json['hostedZoneId'] as String?) ?? '',
      hostedZoneName: (json['hostedZoneName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
      status: HostedZoneAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final hostedZoneId = this.hostedZoneId;
    final hostedZoneName = this.hostedZoneName;
    final id = this.id;
    final name = this.name;
    final resourceArn = this.resourceArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'hostedZoneId': hostedZoneId,
      'hostedZoneName': hostedZoneName,
      'id': id,
      'name': name,
      'resourceArn': resourceArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class HostedZoneAssociationStatus {
  static const creating = HostedZoneAssociationStatus._('CREATING');
  static const operational = HostedZoneAssociationStatus._('OPERATIONAL');
  static const deleting = HostedZoneAssociationStatus._('DELETING');

  final String value;

  const HostedZoneAssociationStatus._(this.value);

  static const values = [creating, operational, deleting];

  static HostedZoneAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HostedZoneAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is HostedZoneAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a global resolver.
///
/// @nodoc
class GlobalResolversItem {
  /// The Amazon Resource Name (ARN) of the global resolver.
  final String arn;

  /// The unique string that identifies the request and ensures idempotency.
  final String clientToken;

  /// The date and time when the global resolver was created.
  final DateTime createdAt;

  /// The DNS name of the global resolver.
  final String dnsName;

  /// The unique identifier of the global resolver.
  final String id;

  /// The IPv4 addresses assigned to the global resolver.
  final List<String> ipv4Addresses;

  /// The name of the global resolver.
  final String name;

  /// The Amazon Web Services Regions where the global resolver is deployed.
  final List<String> regions;

  /// The current status of the global resolver.
  final CRResourceStatus status;

  /// The date and time when the global resolver was last updated.
  final DateTime updatedAt;

  /// A description of the global resolver.
  final String? description;

  /// The IP address type configured for the global resolver.
  final GlobalResolverIpAddressType? ipAddressType;

  /// The IPv6 addresses assigned to the global resolver. This field is only
  /// populated when ipAddressType is DUAL_STACK.
  final List<String>? ipv6Addresses;

  /// The Amazon Web Services Region where observability data is collected for the
  /// global resolver.
  final String? observabilityRegion;

  GlobalResolversItem({
    required this.arn,
    required this.clientToken,
    required this.createdAt,
    required this.dnsName,
    required this.id,
    required this.ipv4Addresses,
    required this.name,
    required this.regions,
    required this.status,
    required this.updatedAt,
    this.description,
    this.ipAddressType,
    this.ipv6Addresses,
    this.observabilityRegion,
  });

  factory GlobalResolversItem.fromJson(Map<String, dynamic> json) {
    return GlobalResolversItem(
      arn: (json['arn'] as String?) ?? '',
      clientToken: (json['clientToken'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsName: (json['dnsName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      ipv4Addresses: ((json['ipv4Addresses'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      name: (json['name'] as String?) ?? '',
      regions: ((json['regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      ipAddressType: (json['ipAddressType'] as String?)
          ?.let(GlobalResolverIpAddressType.fromString),
      ipv6Addresses: (json['ipv6Addresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      observabilityRegion: json['observabilityRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientToken = this.clientToken;
    final createdAt = this.createdAt;
    final dnsName = this.dnsName;
    final id = this.id;
    final ipv4Addresses = this.ipv4Addresses;
    final name = this.name;
    final regions = this.regions;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final ipAddressType = this.ipAddressType;
    final ipv6Addresses = this.ipv6Addresses;
    final observabilityRegion = this.observabilityRegion;
    return {
      'arn': arn,
      'clientToken': clientToken,
      'createdAt': iso8601ToJson(createdAt),
      'dnsName': dnsName,
      'id': id,
      'ipv4Addresses': ipv4Addresses,
      'name': name,
      'regions': regions,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv6Addresses != null) 'ipv6Addresses': ipv6Addresses,
      if (observabilityRegion != null)
        'observabilityRegion': observabilityRegion,
    };
  }
}

/// @nodoc
class CRResourceStatus {
  static const creating = CRResourceStatus._('CREATING');
  static const operational = CRResourceStatus._('OPERATIONAL');
  static const updating = CRResourceStatus._('UPDATING');
  static const deleting = CRResourceStatus._('DELETING');

  final String value;

  const CRResourceStatus._(this.value);

  static const values = [creating, operational, updating, deleting];

  static CRResourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CRResourceStatus._(value));

  @override
  bool operator ==(other) => other is CRResourceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GlobalResolverIpAddressType {
  static const ipv4 = GlobalResolverIpAddressType._('IPV4');
  static const dualStack = GlobalResolverIpAddressType._('DUAL_STACK');

  final String value;

  const GlobalResolverIpAddressType._(this.value);

  static const values = [ipv4, dualStack];

  static GlobalResolverIpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GlobalResolverIpAddressType._(value));

  @override
  bool operator ==(other) =>
      other is GlobalResolverIpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The result of updating a firewall rule in a batch operation.
///
/// @nodoc
class BatchUpdateFirewallRuleOutputItem {
  /// The response code for the update operation.
  final int code;

  /// The firewall rule that was updated in the batch operation.
  final BatchUpdateFirewallRuleResult firewallRule;

  /// The response message for the update operation.
  final String? message;

  BatchUpdateFirewallRuleOutputItem({
    required this.code,
    required this.firewallRule,
    this.message,
  });

  factory BatchUpdateFirewallRuleOutputItem.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateFirewallRuleOutputItem(
      code: (json['code'] as int?) ?? 0,
      firewallRule: BatchUpdateFirewallRuleResult.fromJson(
          (json['firewallRule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final firewallRule = this.firewallRule;
    final message = this.message;
    return {
      'code': code,
      'firewallRule': firewallRule,
      if (message != null) 'message': message,
    };
  }
}

/// Information about a firewall rule that was updated in a batch operation.
///
/// @nodoc
class BatchUpdateFirewallRuleResult {
  /// The unique identifier of the updated firewall rule.
  final String id;

  /// The action configured for the updated firewall rule.
  final FirewallRuleAction? action;

  /// The DNS record type configured for the updated firewall rule's custom
  /// response.
  final BlockOverrideDnsQueryType? blockOverrideDnsType;

  /// The custom domain name configured for the updated firewall rule's BLOCK
  /// response.
  final String? blockOverrideDomain;

  /// The TTL value configured for the updated firewall rule's custom response.
  final int? blockOverrideTtl;

  /// The type of block response configured for the updated firewall rule.
  final FirewallBlockResponse? blockResponse;

  /// The unique string that identified the request and ensured idempotency.
  final String? clientToken;

  /// The confidence threshold configured for the updated firewall rule's advanced
  /// threat detection.
  final ConfidenceThreshold? confidenceThreshold;

  /// The date and time when the firewall rule was originally created.
  final DateTime? createdAt;

  /// The description of the updated firewall rule.
  final String? description;

  /// Whether advanced DNS threat protection is enabled for the updated firewall
  /// rule.
  final DnsAdvancedProtection? dnsAdvancedProtection;

  /// The ID of the DNS view associated with the updated firewall rule.
  final String? dnsViewId;

  /// The ID of the firewall domain list associated with the updated firewall
  /// rule.
  final String? firewallDomainListId;

  /// The name of the updated firewall rule.
  final String? name;

  /// The priority of the updated firewall rule.
  final int? priority;

  /// The DNS query type that the updated firewall rule matches.
  final String? queryType;

  /// The current status of the updated firewall rule.
  final CRResourceStatus? status;

  /// The date and time when the firewall rule was last updated.
  final DateTime? updatedAt;

  BatchUpdateFirewallRuleResult({
    required this.id,
    this.action,
    this.blockOverrideDnsType,
    this.blockOverrideDomain,
    this.blockOverrideTtl,
    this.blockResponse,
    this.clientToken,
    this.confidenceThreshold,
    this.createdAt,
    this.description,
    this.dnsAdvancedProtection,
    this.dnsViewId,
    this.firewallDomainListId,
    this.name,
    this.priority,
    this.queryType,
    this.status,
    this.updatedAt,
  });

  factory BatchUpdateFirewallRuleResult.fromJson(Map<String, dynamic> json) {
    return BatchUpdateFirewallRuleResult(
      id: (json['id'] as String?) ?? '',
      action: (json['action'] as String?)?.let(FirewallRuleAction.fromString),
      blockOverrideDnsType: (json['blockOverrideDnsType'] as String?)
          ?.let(BlockOverrideDnsQueryType.fromString),
      blockOverrideDomain: json['blockOverrideDomain'] as String?,
      blockOverrideTtl: json['blockOverrideTtl'] as int?,
      blockResponse: (json['blockResponse'] as String?)
          ?.let(FirewallBlockResponse.fromString),
      clientToken: json['clientToken'] as String?,
      confidenceThreshold: (json['confidenceThreshold'] as String?)
          ?.let(ConfidenceThreshold.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      dnsAdvancedProtection: (json['dnsAdvancedProtection'] as String?)
          ?.let(DnsAdvancedProtection.fromString),
      dnsViewId: json['dnsViewId'] as String?,
      firewallDomainListId: json['firewallDomainListId'] as String?,
      name: json['name'] as String?,
      priority: json['priority'] as int?,
      queryType: json['queryType'] as String?,
      status: (json['status'] as String?)?.let(CRResourceStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final action = this.action;
    final blockOverrideDnsType = this.blockOverrideDnsType;
    final blockOverrideDomain = this.blockOverrideDomain;
    final blockOverrideTtl = this.blockOverrideTtl;
    final blockResponse = this.blockResponse;
    final clientToken = this.clientToken;
    final confidenceThreshold = this.confidenceThreshold;
    final createdAt = this.createdAt;
    final description = this.description;
    final dnsAdvancedProtection = this.dnsAdvancedProtection;
    final dnsViewId = this.dnsViewId;
    final firewallDomainListId = this.firewallDomainListId;
    final name = this.name;
    final priority = this.priority;
    final queryType = this.queryType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'id': id,
      if (action != null) 'action': action.value,
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      if (clientToken != null) 'clientToken': clientToken,
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (dnsViewId != null) 'dnsViewId': dnsViewId,
      if (firewallDomainListId != null)
        'firewallDomainListId': firewallDomainListId,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (queryType != null) 'queryType': queryType,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class FirewallRuleAction {
  static const allow = FirewallRuleAction._('ALLOW');
  static const alert = FirewallRuleAction._('ALERT');
  static const block = FirewallRuleAction._('BLOCK');

  final String value;

  const FirewallRuleAction._(this.value);

  static const values = [allow, alert, block];

  static FirewallRuleAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FirewallRuleAction._(value));

  @override
  bool operator ==(other) =>
      other is FirewallRuleAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BlockOverrideDnsQueryType {
  static const cname = BlockOverrideDnsQueryType._('CNAME');

  final String value;

  const BlockOverrideDnsQueryType._(this.value);

  static const values = [cname];

  static BlockOverrideDnsQueryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BlockOverrideDnsQueryType._(value));

  @override
  bool operator ==(other) =>
      other is BlockOverrideDnsQueryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FirewallBlockResponse {
  static const nodata = FirewallBlockResponse._('NODATA');
  static const nxdomain = FirewallBlockResponse._('NXDOMAIN');
  static const $override = FirewallBlockResponse._('OVERRIDE');

  final String value;

  const FirewallBlockResponse._(this.value);

  static const values = [nodata, nxdomain, $override];

  static FirewallBlockResponse fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FirewallBlockResponse._(value));

  @override
  bool operator ==(other) =>
      other is FirewallBlockResponse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConfidenceThreshold {
  static const low = ConfidenceThreshold._('LOW');
  static const medium = ConfidenceThreshold._('MEDIUM');
  static const high = ConfidenceThreshold._('HIGH');

  final String value;

  const ConfidenceThreshold._(this.value);

  static const values = [low, medium, high];

  static ConfidenceThreshold fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfidenceThreshold._(value));

  @override
  bool operator ==(other) =>
      other is ConfidenceThreshold && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DnsAdvancedProtection {
  static const dga = DnsAdvancedProtection._('DGA');
  static const dnsTunneling = DnsAdvancedProtection._('DNS_TUNNELING');
  static const dictionaryDga = DnsAdvancedProtection._('DICTIONARY_DGA');

  final String value;

  const DnsAdvancedProtection._(this.value);

  static const values = [dga, dnsTunneling, dictionaryDga];

  static DnsAdvancedProtection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DnsAdvancedProtection._(value));

  @override
  bool operator ==(other) =>
      other is DnsAdvancedProtection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information for updating a firewall rule in a batch operation.
///
/// @nodoc
class BatchUpdateFirewallRuleInputItem {
  /// The unique identifier of the firewall rule to update.
  final String firewallRuleId;

  /// The action to take when a DNS query matches the firewall rule.
  final FirewallRuleAction? action;

  /// The DNS record type for the custom response when the action is BLOCK.
  final BlockOverrideDnsQueryType? blockOverrideDnsType;

  /// The custom domain name for the BLOCK response.
  final String? blockOverrideDomain;

  /// The TTL value for the custom response when the action is BLOCK.
  final int? blockOverrideTtl;

  /// The type of block response to return when the action is BLOCK.
  final FirewallBlockResponse? blockResponse;

  /// The confidence threshold for advanced threat detection.
  final ConfidenceThreshold? confidenceThreshold;

  /// A description of the firewall rule.
  final String? description;

  /// Whether to enable advanced DNS threat protection for the firewall rule.
  final DnsAdvancedProtection? dnsAdvancedProtection;

  /// A name for the firewall rule.
  final String? name;

  /// The priority of the firewall rule.
  final int? priority;

  BatchUpdateFirewallRuleInputItem({
    required this.firewallRuleId,
    this.action,
    this.blockOverrideDnsType,
    this.blockOverrideDomain,
    this.blockOverrideTtl,
    this.blockResponse,
    this.confidenceThreshold,
    this.description,
    this.dnsAdvancedProtection,
    this.name,
    this.priority,
  });

  Map<String, dynamic> toJson() {
    final firewallRuleId = this.firewallRuleId;
    final action = this.action;
    final blockOverrideDnsType = this.blockOverrideDnsType;
    final blockOverrideDomain = this.blockOverrideDomain;
    final blockOverrideTtl = this.blockOverrideTtl;
    final blockResponse = this.blockResponse;
    final confidenceThreshold = this.confidenceThreshold;
    final description = this.description;
    final dnsAdvancedProtection = this.dnsAdvancedProtection;
    final name = this.name;
    final priority = this.priority;
    return {
      'firewallRuleId': firewallRuleId,
      if (action != null) 'action': action.value,
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
    };
  }
}

/// The result of deleting a firewall rule in a batch operation.
///
/// @nodoc
class BatchDeleteFirewallRuleOutputItem {
  /// The response code for the delete operation.
  final int code;

  /// The firewall rule that was deleted in the batch operation.
  final BatchDeleteFirewallRuleResult firewallRule;

  /// The response message for the delete operation.
  final String? message;

  BatchDeleteFirewallRuleOutputItem({
    required this.code,
    required this.firewallRule,
    this.message,
  });

  factory BatchDeleteFirewallRuleOutputItem.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteFirewallRuleOutputItem(
      code: (json['code'] as int?) ?? 0,
      firewallRule: BatchDeleteFirewallRuleResult.fromJson(
          (json['firewallRule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final firewallRule = this.firewallRule;
    final message = this.message;
    return {
      'code': code,
      'firewallRule': firewallRule,
      if (message != null) 'message': message,
    };
  }
}

/// Information about a firewall rule that was deleted in a batch operation.
///
/// @nodoc
class BatchDeleteFirewallRuleResult {
  /// The unique identifier of the deleted firewall rule.
  final String id;

  /// The unique string that identified the request and ensured idempotency.
  final String? clientToken;

  /// The name of the deleted firewall rule.
  final String? name;

  /// The final status of the deleted firewall rule.
  final CRResourceStatus? status;

  BatchDeleteFirewallRuleResult({
    required this.id,
    this.clientToken,
    this.name,
    this.status,
  });

  factory BatchDeleteFirewallRuleResult.fromJson(Map<String, dynamic> json) {
    return BatchDeleteFirewallRuleResult(
      id: (json['id'] as String?) ?? '',
      clientToken: json['clientToken'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(CRResourceStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final clientToken = this.clientToken;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      if (clientToken != null) 'clientToken': clientToken,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// Information about a DNS Firewall rule to delete in a batch operation.
///
/// @nodoc
class BatchDeleteFirewallRuleInputItem {
  /// The ID of the DNS Firewall rule to delete.
  final String firewallRuleId;

  BatchDeleteFirewallRuleInputItem({
    required this.firewallRuleId,
  });

  Map<String, dynamic> toJson() {
    final firewallRuleId = this.firewallRuleId;
    return {
      'firewallRuleId': firewallRuleId,
    };
  }
}

/// Information about the result of creating a DNS Firewall rule in a batch
/// operation.
///
/// @nodoc
class BatchCreateFirewallRuleOutputItem {
  /// The HTTP response code for the batch operation result.
  final int code;

  /// The firewall rule that was created in the batch operation.
  final BatchCreateFirewallRuleResult firewallRule;

  /// A message describing the result of the batch operation, including error
  /// details if applicable.
  final String? message;

  BatchCreateFirewallRuleOutputItem({
    required this.code,
    required this.firewallRule,
    this.message,
  });

  factory BatchCreateFirewallRuleOutputItem.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateFirewallRuleOutputItem(
      code: (json['code'] as int?) ?? 0,
      firewallRule: BatchCreateFirewallRuleResult.fromJson(
          (json['firewallRule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final firewallRule = this.firewallRule;
    final message = this.message;
    return {
      'code': code,
      'firewallRule': firewallRule,
      if (message != null) 'message': message,
    };
  }
}

/// The result of creating a firewall rule in a batch operation.
///
/// @nodoc
class BatchCreateFirewallRuleResult {
  /// The action configured for the created firewall rule.
  final FirewallRuleAction action;

  /// The unique string that identified the request and ensured idempotency.
  final String clientToken;

  /// The ID of the DNS view associated with the created firewall rule.
  final String dnsViewId;

  /// The name of the created firewall rule.
  final String name;

  /// The DNS record type configured for the created firewall rule's custom
  /// response.
  final BlockOverrideDnsQueryType? blockOverrideDnsType;

  /// The custom domain name configured for the created firewall rule's BLOCK
  /// response.
  final String? blockOverrideDomain;

  /// The TTL value configured for the created firewall rule's custom response.
  final int? blockOverrideTtl;

  /// The type of block response configured for the created firewall rule.
  final FirewallBlockResponse? blockResponse;

  /// The confidence threshold configured for the created firewall rule's advanced
  /// threat detection.
  final ConfidenceThreshold? confidenceThreshold;

  /// The date and time when the firewall rule was created.
  final DateTime? createdAt;

  /// The description of the created firewall rule.
  final String? description;

  /// Whether advanced DNS threat protection is enabled for the created firewall
  /// rule.
  final DnsAdvancedProtection? dnsAdvancedProtection;

  /// The ID of the firewall domain list associated with the created firewall
  /// rule.
  final String? firewallDomainListId;

  /// The unique identifier of the created firewall rule.
  final String? id;

  /// The name of the managed domain list associated with the created firewall
  /// rule.
  final String? managedDomainListName;

  /// The priority of the created firewall rule.
  final int? priority;

  /// The DNS query type that the created firewall rule matches.
  final String? queryType;

  /// The current status of the created firewall rule.
  final CRResourceStatus? status;

  /// The date and time when the firewall rule was last updated.
  final DateTime? updatedAt;

  BatchCreateFirewallRuleResult({
    required this.action,
    required this.clientToken,
    required this.dnsViewId,
    required this.name,
    this.blockOverrideDnsType,
    this.blockOverrideDomain,
    this.blockOverrideTtl,
    this.blockResponse,
    this.confidenceThreshold,
    this.createdAt,
    this.description,
    this.dnsAdvancedProtection,
    this.firewallDomainListId,
    this.id,
    this.managedDomainListName,
    this.priority,
    this.queryType,
    this.status,
    this.updatedAt,
  });

  factory BatchCreateFirewallRuleResult.fromJson(Map<String, dynamic> json) {
    return BatchCreateFirewallRuleResult(
      action: FirewallRuleAction.fromString((json['action'] as String?) ?? ''),
      clientToken: (json['clientToken'] as String?) ?? '',
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      blockOverrideDnsType: (json['blockOverrideDnsType'] as String?)
          ?.let(BlockOverrideDnsQueryType.fromString),
      blockOverrideDomain: json['blockOverrideDomain'] as String?,
      blockOverrideTtl: json['blockOverrideTtl'] as int?,
      blockResponse: (json['blockResponse'] as String?)
          ?.let(FirewallBlockResponse.fromString),
      confidenceThreshold: (json['confidenceThreshold'] as String?)
          ?.let(ConfidenceThreshold.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      dnsAdvancedProtection: (json['dnsAdvancedProtection'] as String?)
          ?.let(DnsAdvancedProtection.fromString),
      firewallDomainListId: json['firewallDomainListId'] as String?,
      id: json['id'] as String?,
      managedDomainListName: json['managedDomainListName'] as String?,
      priority: json['priority'] as int?,
      queryType: json['queryType'] as String?,
      status: (json['status'] as String?)?.let(CRResourceStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final clientToken = this.clientToken;
    final dnsViewId = this.dnsViewId;
    final name = this.name;
    final blockOverrideDnsType = this.blockOverrideDnsType;
    final blockOverrideDomain = this.blockOverrideDomain;
    final blockOverrideTtl = this.blockOverrideTtl;
    final blockResponse = this.blockResponse;
    final confidenceThreshold = this.confidenceThreshold;
    final createdAt = this.createdAt;
    final description = this.description;
    final dnsAdvancedProtection = this.dnsAdvancedProtection;
    final firewallDomainListId = this.firewallDomainListId;
    final id = this.id;
    final managedDomainListName = this.managedDomainListName;
    final priority = this.priority;
    final queryType = this.queryType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'action': action.value,
      'clientToken': clientToken,
      'dnsViewId': dnsViewId,
      'name': name,
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (firewallDomainListId != null)
        'firewallDomainListId': firewallDomainListId,
      if (id != null) 'id': id,
      if (managedDomainListName != null)
        'managedDomainListName': managedDomainListName,
      if (priority != null) 'priority': priority,
      if (queryType != null) 'queryType': queryType,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Information about a DNS Firewall rule to create in a batch operation.
///
/// @nodoc
class BatchCreateFirewallRuleInputItem {
  /// The action to take when a DNS query matches the firewall rule.
  final FirewallRuleAction action;

  /// A unique string that identifies the request and ensures idempotency.
  final String clientToken;

  /// The ID of the DNS view to associate the firewall rule with.
  final String dnsViewId;

  /// A name for the firewall rule.
  final String name;

  /// The DNS record type for the custom response when the action is BLOCK.
  final BlockOverrideDnsQueryType? blockOverrideDnsType;

  /// The custom domain name for the BLOCK response.
  final String? blockOverrideDomain;

  /// The TTL value for the custom response when the action is BLOCK.
  final int? blockOverrideTtl;

  /// The type of block response to return when the action is BLOCK.
  final FirewallBlockResponse? blockResponse;

  /// The confidence threshold for advanced threat detection.
  final ConfidenceThreshold? confidenceThreshold;

  /// A description of the firewall rule.
  final String? description;

  /// Whether to enable advanced DNS threat protection for the firewall rule.
  final DnsAdvancedProtection? dnsAdvancedProtection;

  /// The ID of the firewall domain list to associate with the rule.
  final String? firewallDomainListId;

  /// The priority of the firewall rule.
  final int? priority;

  /// The DNS query type that the firewall rule should match.
  final String? qType;

  BatchCreateFirewallRuleInputItem({
    required this.action,
    required this.clientToken,
    required this.dnsViewId,
    required this.name,
    this.blockOverrideDnsType,
    this.blockOverrideDomain,
    this.blockOverrideTtl,
    this.blockResponse,
    this.confidenceThreshold,
    this.description,
    this.dnsAdvancedProtection,
    this.firewallDomainListId,
    this.priority,
    this.qType,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final clientToken = this.clientToken;
    final dnsViewId = this.dnsViewId;
    final name = this.name;
    final blockOverrideDnsType = this.blockOverrideDnsType;
    final blockOverrideDomain = this.blockOverrideDomain;
    final blockOverrideTtl = this.blockOverrideTtl;
    final blockResponse = this.blockResponse;
    final confidenceThreshold = this.confidenceThreshold;
    final description = this.description;
    final dnsAdvancedProtection = this.dnsAdvancedProtection;
    final firewallDomainListId = this.firewallDomainListId;
    final priority = this.priority;
    final qType = this.qType;
    return {
      'action': action.value,
      'clientToken': clientToken,
      'dnsViewId': dnsViewId,
      'name': name,
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (firewallDomainListId != null)
        'firewallDomainListId': firewallDomainListId,
      if (priority != null) 'priority': priority,
      if (qType != null) 'qType': qType,
    };
  }
}

/// Summary information about a firewall rule.
///
/// @nodoc
class FirewallRulesItem {
  /// The action configured for the firewall rule.
  final FirewallRuleAction action;

  /// The date and time when the firewall rule was created.
  final DateTime createdAt;

  /// The ID of the DNS view associated with the firewall rule.
  final String dnsViewId;

  /// The unique identifier of the firewall rule.
  final String id;

  /// The name of the firewall rule.
  final String name;

  /// The priority of the firewall rule.
  final int priority;

  /// The current status of the firewall rule.
  final CRResourceStatus status;

  /// The date and time when the firewall rule was last updated.
  final DateTime updatedAt;

  /// The DNS record type configured for the firewall rule's custom response.
  final BlockOverrideDnsQueryType? blockOverrideDnsType;

  /// The custom domain name configured for the firewall rule's BLOCK response.
  final String? blockOverrideDomain;

  /// The TTL value configured for the firewall rule's custom response.
  final int? blockOverrideTtl;

  /// The type of block response configured for the firewall rule.
  final FirewallBlockResponse? blockResponse;

  /// The confidence threshold configured for the firewall rule's advanced threat
  /// detection.
  final ConfidenceThreshold? confidenceThreshold;

  /// The description of the firewall rule.
  final String? description;

  /// Whether advanced DNS threat protection is enabled for the firewall rule.
  final DnsAdvancedProtection? dnsAdvancedProtection;

  /// The ID of the firewall domain list associated with the firewall rule.
  final String? firewallDomainListId;

  /// The DNS query type that the firewall rule matches.
  final String? queryType;

  FirewallRulesItem({
    required this.action,
    required this.createdAt,
    required this.dnsViewId,
    required this.id,
    required this.name,
    required this.priority,
    required this.status,
    required this.updatedAt,
    this.blockOverrideDnsType,
    this.blockOverrideDomain,
    this.blockOverrideTtl,
    this.blockResponse,
    this.confidenceThreshold,
    this.description,
    this.dnsAdvancedProtection,
    this.firewallDomainListId,
    this.queryType,
  });

  factory FirewallRulesItem.fromJson(Map<String, dynamic> json) {
    return FirewallRulesItem(
      action: FirewallRuleAction.fromString((json['action'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      blockOverrideDnsType: (json['blockOverrideDnsType'] as String?)
          ?.let(BlockOverrideDnsQueryType.fromString),
      blockOverrideDomain: json['blockOverrideDomain'] as String?,
      blockOverrideTtl: json['blockOverrideTtl'] as int?,
      blockResponse: (json['blockResponse'] as String?)
          ?.let(FirewallBlockResponse.fromString),
      confidenceThreshold: (json['confidenceThreshold'] as String?)
          ?.let(ConfidenceThreshold.fromString),
      description: json['description'] as String?,
      dnsAdvancedProtection: (json['dnsAdvancedProtection'] as String?)
          ?.let(DnsAdvancedProtection.fromString),
      firewallDomainListId: json['firewallDomainListId'] as String?,
      queryType: json['queryType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final id = this.id;
    final name = this.name;
    final priority = this.priority;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final blockOverrideDnsType = this.blockOverrideDnsType;
    final blockOverrideDomain = this.blockOverrideDomain;
    final blockOverrideTtl = this.blockOverrideTtl;
    final blockResponse = this.blockResponse;
    final confidenceThreshold = this.confidenceThreshold;
    final description = this.description;
    final dnsAdvancedProtection = this.dnsAdvancedProtection;
    final firewallDomainListId = this.firewallDomainListId;
    final queryType = this.queryType;
    return {
      'action': action.value,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'id': id,
      'name': name,
      'priority': priority,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (blockOverrideDnsType != null)
        'blockOverrideDnsType': blockOverrideDnsType.value,
      if (blockOverrideDomain != null)
        'blockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'blockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'blockResponse': blockResponse.value,
      if (confidenceThreshold != null)
        'confidenceThreshold': confidenceThreshold.value,
      if (description != null) 'description': description,
      if (dnsAdvancedProtection != null)
        'dnsAdvancedProtection': dnsAdvancedProtection.value,
      if (firewallDomainListId != null)
        'firewallDomainListId': firewallDomainListId,
      if (queryType != null) 'queryType': queryType,
    };
  }
}

/// Summary information about a firewall domain list.
///
/// @nodoc
class FirewallDomainListsItem {
  /// The Amazon Resource Name (ARN) of the firewall domain list.
  final String arn;

  /// The date and time when the firewall domain list was created.
  final DateTime createdAt;

  /// The ID of the global resolver that the firewall domain list is associated
  /// with.
  final String globalResolverId;

  /// The unique identifier of the firewall domain list.
  final String id;

  /// The name of the firewall domain list.
  final String name;

  /// The current status of the firewall domain list.
  final CRResourceStatus status;

  /// The date and time when the firewall domain list was last updated.
  final DateTime updatedAt;

  /// A description of the firewall domain list.
  final String? description;

  FirewallDomainListsItem({
    required this.arn,
    required this.createdAt,
    required this.globalResolverId,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.description,
  });

  factory FirewallDomainListsItem.fromJson(Map<String, dynamic> json) {
    return FirewallDomainListsItem(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'globalResolverId': globalResolverId,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class DnsSecValidationType {
  static const enabled = DnsSecValidationType._('ENABLED');
  static const disabled = DnsSecValidationType._('DISABLED');

  final String value;

  const DnsSecValidationType._(this.value);

  static const values = [enabled, disabled];

  static DnsSecValidationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DnsSecValidationType._(value));

  @override
  bool operator ==(other) =>
      other is DnsSecValidationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EdnsClientSubnetType {
  static const enabled = EdnsClientSubnetType._('ENABLED');
  static const disabled = EdnsClientSubnetType._('DISABLED');

  final String value;

  const EdnsClientSubnetType._(this.value);

  static const values = [enabled, disabled];

  static EdnsClientSubnetType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EdnsClientSubnetType._(value));

  @override
  bool operator ==(other) =>
      other is EdnsClientSubnetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FirewallRulesFailOpenType {
  static const enabled = FirewallRulesFailOpenType._('ENABLED');
  static const disabled = FirewallRulesFailOpenType._('DISABLED');

  final String value;

  const FirewallRulesFailOpenType._(this.value);

  static const values = [enabled, disabled];

  static FirewallRulesFailOpenType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FirewallRulesFailOpenType._(value));

  @override
  bool operator ==(other) =>
      other is FirewallRulesFailOpenType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ProfileResourceStatus {
  static const creating = ProfileResourceStatus._('CREATING');
  static const operational = ProfileResourceStatus._('OPERATIONAL');
  static const updating = ProfileResourceStatus._('UPDATING');
  static const enabling = ProfileResourceStatus._('ENABLING');
  static const disabling = ProfileResourceStatus._('DISABLING');
  static const disabled = ProfileResourceStatus._('DISABLED');
  static const deleting = ProfileResourceStatus._('DELETING');

  final String value;

  const ProfileResourceStatus._(this.value);

  static const values = [
    creating,
    operational,
    updating,
    enabling,
    disabling,
    disabled,
    deleting
  ];

  static ProfileResourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProfileResourceStatus._(value));

  @override
  bool operator ==(other) =>
      other is ProfileResourceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a DNS view.
///
/// @nodoc
class DNSViewSummary {
  /// The Amazon Resource Name (ARN) of the DNS view.
  final String arn;

  /// The unique string that identifies the request and ensures idempotency.
  final String clientToken;

  /// The date and time when the DNS view was created.
  final DateTime createdAt;

  /// Whether DNSSEC validation is enabled for the DNS view.
  final DnsSecValidationType dnssecValidation;

  /// Whether EDNS Client Subnet injection is enabled for the DNS view.
  final EdnsClientSubnetType ednsClientSubnet;

  /// Whether firewall rules fail open when they cannot be evaluated.
  final FirewallRulesFailOpenType firewallRulesFailOpen;

  /// The ID of the global resolver that the DNS view is associated with.
  final String globalResolverId;

  /// The unique identifier of the DNS view.
  final String id;

  /// The name of the DNS view.
  final String name;

  /// The current status of the DNS view.
  final ProfileResourceStatus status;

  /// The date and time when the DNS view was last updated.
  final DateTime updatedAt;

  /// A description of the DNS view.
  final String? description;

  DNSViewSummary({
    required this.arn,
    required this.clientToken,
    required this.createdAt,
    required this.dnssecValidation,
    required this.ednsClientSubnet,
    required this.firewallRulesFailOpen,
    required this.globalResolverId,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.description,
  });

  factory DNSViewSummary.fromJson(Map<String, dynamic> json) {
    return DNSViewSummary(
      arn: (json['arn'] as String?) ?? '',
      clientToken: (json['clientToken'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnssecValidation: DnsSecValidationType.fromString(
          (json['dnssecValidation'] as String?) ?? ''),
      ednsClientSubnet: EdnsClientSubnetType.fromString(
          (json['ednsClientSubnet'] as String?) ?? ''),
      firewallRulesFailOpen: FirewallRulesFailOpenType.fromString(
          (json['firewallRulesFailOpen'] as String?) ?? ''),
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status:
          ProfileResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientToken = this.clientToken;
    final createdAt = this.createdAt;
    final dnssecValidation = this.dnssecValidation;
    final ednsClientSubnet = this.ednsClientSubnet;
    final firewallRulesFailOpen = this.firewallRulesFailOpen;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'arn': arn,
      'clientToken': clientToken,
      'createdAt': iso8601ToJson(createdAt),
      'dnssecValidation': dnssecValidation.value,
      'ednsClientSubnet': ednsClientSubnet.value,
      'firewallRulesFailOpen': firewallRulesFailOpen.value,
      'globalResolverId': globalResolverId,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

/// Summary information about a token.
///
/// @nodoc
class AccessTokenItem {
  /// The Amazon Resource Name (ARN) of the token.
  final String arn;

  /// The date and time when the token was created.
  final DateTime createdAt;

  /// The ID of the DNS view associated with the token.
  final String dnsViewId;

  /// The date and time when the token expires.
  final DateTime expiresAt;

  /// The ID of the global resolver associated with the token.
  final String globalResolverId;

  /// The unique identifier of the token.
  final String id;

  /// The current status of the token.
  final TokenStatus status;

  /// The date and time when the token was last updated.
  final DateTime updatedAt;

  /// The name of the token.
  final String? name;

  AccessTokenItem({
    required this.arn,
    required this.createdAt,
    required this.dnsViewId,
    required this.expiresAt,
    required this.globalResolverId,
    required this.id,
    required this.status,
    required this.updatedAt,
    this.name,
  });

  factory AccessTokenItem.fromJson(Map<String, dynamic> json) {
    return AccessTokenItem(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      expiresAt: nonNullableTimeStampFromJson(json['expiresAt'] ?? 0),
      globalResolverId: (json['globalResolverId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      status: TokenStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final expiresAt = this.expiresAt;
    final globalResolverId = this.globalResolverId;
    final id = this.id;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final name = this.name;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'expiresAt': iso8601ToJson(expiresAt),
      'globalResolverId': globalResolverId,
      'id': id,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class TokenStatus {
  static const creating = TokenStatus._('CREATING');
  static const operational = TokenStatus._('OPERATIONAL');
  static const deleting = TokenStatus._('DELETING');

  final String value;

  const TokenStatus._(this.value);

  static const values = [creating, operational, deleting];

  static TokenStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TokenStatus._(value));

  @override
  bool operator ==(other) => other is TokenStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about an access source.
///
/// @nodoc
class AccessSourcesItem {
  /// The Amazon Resource Name (ARN) of the access source.
  final String arn;

  /// The CIDR block that defines the IP address range for the access source.
  final String cidr;

  /// The date and time when the access source was created.
  final DateTime createdAt;

  /// The ID of the DNS view that the access source is associated with.
  final String dnsViewId;

  /// The unique identifier of the access source.
  final String id;

  /// The IP address type of the access source.
  final IpAddressType ipAddressType;

  /// The protocol used by the access source.
  final DnsProtocol protocol;

  /// The current status of the access source.
  final CRResourceStatus status;

  /// The date and time when the access source was last updated.
  final DateTime updatedAt;

  /// The name of the access source.
  final String? name;

  AccessSourcesItem({
    required this.arn,
    required this.cidr,
    required this.createdAt,
    required this.dnsViewId,
    required this.id,
    required this.ipAddressType,
    required this.protocol,
    required this.status,
    required this.updatedAt,
    this.name,
  });

  factory AccessSourcesItem.fromJson(Map<String, dynamic> json) {
    return AccessSourcesItem(
      arn: (json['arn'] as String?) ?? '',
      cidr: (json['cidr'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dnsViewId: (json['dnsViewId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      ipAddressType:
          IpAddressType.fromString((json['ipAddressType'] as String?) ?? ''),
      protocol: DnsProtocol.fromString((json['protocol'] as String?) ?? ''),
      status: CRResourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cidr = this.cidr;
    final createdAt = this.createdAt;
    final dnsViewId = this.dnsViewId;
    final id = this.id;
    final ipAddressType = this.ipAddressType;
    final protocol = this.protocol;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final name = this.name;
    return {
      'arn': arn,
      'cidr': cidr,
      'createdAt': iso8601ToJson(createdAt),
      'dnsViewId': dnsViewId,
      'id': id,
      'ipAddressType': ipAddressType.value,
      'protocol': protocol.value,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class IpAddressType {
  static const ipv4 = IpAddressType._('IPV4');
  static const ipv6 = IpAddressType._('IPV6');

  final String value;

  const IpAddressType._(this.value);

  static const values = [ipv4, ipv6];

  static IpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IpAddressType._(value));

  @override
  bool operator ==(other) => other is IpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DnsProtocol {
  static const do53 = DnsProtocol._('DO53');
  static const doh = DnsProtocol._('DOH');
  static const dot = DnsProtocol._('DOT');

  final String value;

  const DnsProtocol._(this.value);

  static const values = [do53, doh, dot];

  static DnsProtocol fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DnsProtocol._(value));

  @override
  bool operator ==(other) => other is DnsProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
