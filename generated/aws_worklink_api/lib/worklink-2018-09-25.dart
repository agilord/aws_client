// ignore_for_file: deprecated_member_use_from_same_package
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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon WorkLink is a cloud-based service that provides secure access to
/// internal websites and web apps from iOS and Android phones. In a single
/// step, your users, such as employees, can access internal websites as
/// efficiently as they access any other public website. They enter a URL in
/// their web browser, or choose a link to an internal website in an email.
/// Amazon WorkLink authenticates the user's access and securely renders
/// authorized internal web content in a secure rendering service in the AWS
/// cloud. Amazon WorkLink doesn't download or store any internal web content on
/// mobile devices.
class WorkLink {
  final _s.RestJsonProtocol _protocol;
  WorkLink({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'worklink',
            signingName: 'worklink',
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

  /// Specifies a domain to be associated to Amazon WorkLink.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [acmCertificateArn] :
  /// The ARN of an issued ACM certificate that is valid for the domain being
  /// associated.
  ///
  /// Parameter [domainName] :
  /// The fully qualified domain name (FQDN).
  ///
  /// Parameter [fleetArn] :
  /// The Amazon Resource Name (ARN) of the fleet.
  ///
  /// Parameter [displayName] :
  /// The name to display.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> associateDomain({
    required String acmCertificateArn,
    required String domainName,
    required String fleetArn,
    String? displayName,
  }) async {
    final $payload = <String, dynamic>{
      'AcmCertificateArn': acmCertificateArn,
      'DomainName': domainName,
      'FleetArn': fleetArn,
      if (displayName != null) 'DisplayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/associateDomain',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a website authorization provider with a specified fleet. This
  /// is used to authorize users against associated websites in the company
  /// network.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizationProviderType] :
  /// The authorization provider type.
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [domainName] :
  /// The domain name of the authorization provider. This applies only to
  /// SAML-based authorization providers.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<AssociateWebsiteAuthorizationProviderResponse>
      associateWebsiteAuthorizationProvider({
    required AuthorizationProviderType authorizationProviderType,
    required String fleetArn,
    String? domainName,
  }) async {
    final $payload = <String, dynamic>{
      'AuthorizationProviderType': authorizationProviderType.value,
      'FleetArn': fleetArn,
      if (domainName != null) 'DomainName': domainName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/associateWebsiteAuthorizationProvider',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateWebsiteAuthorizationProviderResponse.fromJson(response);
  }

  /// Imports the root certificate of a certificate authority (CA) used to
  /// obtain TLS certificates used by associated websites within the company
  /// network.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [certificate] :
  /// The root certificate of the CA.
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [displayName] :
  /// The certificate name to display.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<AssociateWebsiteCertificateAuthorityResponse>
      associateWebsiteCertificateAuthority({
    required String certificate,
    required String fleetArn,
    String? displayName,
  }) async {
    final $payload = <String, dynamic>{
      'Certificate': certificate,
      'FleetArn': fleetArn,
      if (displayName != null) 'DisplayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/associateWebsiteCertificateAuthority',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateWebsiteCertificateAuthorityResponse.fromJson(response);
  }

  /// Creates a fleet. A fleet consists of resources and the configuration that
  /// delivers associated websites to authorized users who download and set up
  /// the Amazon WorkLink app.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetName] :
  /// A unique name for the fleet.
  ///
  /// Parameter [displayName] :
  /// The fleet name to display.
  ///
  /// Parameter [optimizeForEndUserLocation] :
  /// The option to optimize for better performance by routing traffic through
  /// the closest AWS Region to users, which may be outside of your home Region.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource. A tag is a key-value pair.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<CreateFleetResponse> createFleet({
    required String fleetName,
    String? displayName,
    bool? optimizeForEndUserLocation,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'FleetName': fleetName,
      if (displayName != null) 'DisplayName': displayName,
      if (optimizeForEndUserLocation != null)
        'OptimizeForEndUserLocation': optimizeForEndUserLocation,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createFleet',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFleetResponse.fromJson(response);
  }

  /// Deletes a fleet. Prevents users from accessing previously associated
  /// websites.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> deleteFleet({
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteFleet',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes the configuration for delivering audit streams to the customer
  /// account.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<DescribeAuditStreamConfigurationResponse>
      describeAuditStreamConfiguration({
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeAuditStreamConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuditStreamConfigurationResponse.fromJson(response);
  }

  /// Describes the networking configuration to access the internal websites
  /// associated with the specified fleet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<DescribeCompanyNetworkConfigurationResponse>
      describeCompanyNetworkConfiguration({
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeCompanyNetworkConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCompanyNetworkConfigurationResponse.fromJson(response);
  }

  /// Provides information about a user's device.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [deviceId] :
  /// A unique identifier for a registered user's device.
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<DescribeDeviceResponse> describeDevice({
    required String deviceId,
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'DeviceId': deviceId,
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeDevice',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDeviceResponse.fromJson(response);
  }

  /// Describes the device policy configuration for the specified fleet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<DescribeDevicePolicyConfigurationResponse>
      describeDevicePolicyConfiguration({
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeDevicePolicyConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDevicePolicyConfigurationResponse.fromJson(response);
  }

  /// Provides information about the domain.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<DescribeDomainResponse> describeDomain({
    required String domainName,
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'DomainName': domainName,
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeDomain',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainResponse.fromJson(response);
  }

  /// Provides basic information for the specified fleet, excluding identity
  /// provider, networking, and device configuration details.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The Amazon Resource Name (ARN) of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<DescribeFleetMetadataResponse> describeFleetMetadata({
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeFleetMetadata',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFleetMetadataResponse.fromJson(response);
  }

  /// Describes the identity provider configuration of the specified fleet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<DescribeIdentityProviderConfigurationResponse>
      describeIdentityProviderConfiguration({
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeIdentityProviderConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeIdentityProviderConfigurationResponse.fromJson(response);
  }

  /// Provides information about the certificate authority.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [websiteCaId] :
  /// A unique identifier for the certificate authority.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<DescribeWebsiteCertificateAuthorityResponse>
      describeWebsiteCertificateAuthority({
    required String fleetArn,
    required String websiteCaId,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      'WebsiteCaId': websiteCaId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeWebsiteCertificateAuthority',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWebsiteCertificateAuthorityResponse.fromJson(response);
  }

  /// Disassociates a domain from Amazon WorkLink. End users lose the ability to
  /// access the domain with Amazon WorkLink.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> disassociateDomain({
    required String domainName,
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'DomainName': domainName,
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disassociateDomain',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a website authorization provider from a specified fleet.
  /// After the disassociation, users can't load any associated websites that
  /// require this authorization provider.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizationProviderId] :
  /// A unique identifier for the authorization provider.
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> disassociateWebsiteAuthorizationProvider({
    required String authorizationProviderId,
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'AuthorizationProviderId': authorizationProviderId,
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disassociateWebsiteAuthorizationProvider',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a certificate authority (CA).
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [websiteCaId] :
  /// A unique identifier for the CA.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> disassociateWebsiteCertificateAuthority({
    required String fleetArn,
    required String websiteCaId,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      'WebsiteCaId': websiteCaId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disassociateWebsiteCertificateAuthority',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a list of devices registered with the specified fleet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<ListDevicesResponse> listDevices({
    required String fleetArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listDevices',
      exceptionFnMap: _exceptionFns,
    );
    return ListDevicesResponse.fromJson(response);
  }

  /// Retrieves a list of domains associated to a specified fleet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<ListDomainsResponse> listDomains({
    required String fleetArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listDomains',
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsResponse.fromJson(response);
  }

  /// Retrieves a list of fleets for the current account and Region.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<ListFleetsResponse> listFleets({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listFleets',
      exceptionFnMap: _exceptionFns,
    );
    return ListFleetsResponse.fromJson(response);
  }

  /// Retrieves a list of tags for the specified resource.
  ///
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Retrieves a list of website authorization providers associated with a
  /// specified fleet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<ListWebsiteAuthorizationProvidersResponse>
      listWebsiteAuthorizationProviders({
    required String fleetArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listWebsiteAuthorizationProviders',
      exceptionFnMap: _exceptionFns,
    );
    return ListWebsiteAuthorizationProvidersResponse.fromJson(response);
  }

  /// Retrieves a list of certificate authorities added for the current account
  /// and Region.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<ListWebsiteCertificateAuthoritiesResponse>
      listWebsiteCertificateAuthorities({
    required String fleetArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listWebsiteCertificateAuthorities',
      exceptionFnMap: _exceptionFns,
    );
    return ListWebsiteCertificateAuthoritiesResponse.fromJson(response);
  }

  /// Moves a domain to ACTIVE status if it was in the INACTIVE status.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> restoreDomainAccess({
    required String domainName,
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'DomainName': domainName,
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/restoreDomainAccess',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Moves a domain to INACTIVE status if it was in the ACTIVE status.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> revokeDomainAccess({
    required String domainName,
    required String fleetArn,
  }) async {
    final $payload = <String, dynamic>{
      'DomainName': domainName,
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/revokeDomainAccess',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Signs the user out from all of their devices. The user can sign in again
  /// if they have valid credentials.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [username] :
  /// The name of the user.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> signOutUser({
    required String fleetArn,
    required String username,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      'Username': username,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/signOutUser',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds or overwrites one or more tags for the specified resource, such as a
  /// fleet. Each tag consists of a key and an optional value. If a resource
  /// already has a tag with the same key, this operation updates its value.
  ///
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the fleet.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource. A tag is a key-value pair.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the fleet.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the audit stream configuration for the fleet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [auditStreamArn] :
  /// The ARN of the Amazon Kinesis data stream that receives the audit events.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> updateAuditStreamConfiguration({
    required String fleetArn,
    String? auditStreamArn,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      if (auditStreamArn != null) 'AuditStreamArn': auditStreamArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateAuditStreamConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the company network configuration for the fleet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [securityGroupIds] :
  /// The security groups associated with access to the provided subnets.
  ///
  /// Parameter [subnetIds] :
  /// The subnets used for X-ENI connections from Amazon WorkLink rendering
  /// containers.
  ///
  /// Parameter [vpcId] :
  /// The VPC with connectivity to associated websites.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> updateCompanyNetworkConfiguration({
    required String fleetArn,
    required List<String> securityGroupIds,
    required List<String> subnetIds,
    required String vpcId,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      'SecurityGroupIds': securityGroupIds,
      'SubnetIds': subnetIds,
      'VpcId': vpcId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateCompanyNetworkConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the device policy configuration for the fleet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [deviceCaCertificate] :
  /// The certificate chain, including intermediate certificates and the root
  /// certificate authority certificate used to issue device certificates.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> updateDevicePolicyConfiguration({
    required String fleetArn,
    String? deviceCaCertificate,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      if (deviceCaCertificate != null)
        'DeviceCaCertificate': deviceCaCertificate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateDevicePolicyConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates domain metadata, such as DisplayName.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [displayName] :
  /// The name to display.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> updateDomainMetadata({
    required String domainName,
    required String fleetArn,
    String? displayName,
  }) async {
    final $payload = <String, dynamic>{
      'DomainName': domainName,
      'FleetArn': fleetArn,
      if (displayName != null) 'DisplayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateDomainMetadata',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates fleet metadata, such as DisplayName.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [displayName] :
  /// The fleet name to display. The existing DisplayName is unset if null is
  /// passed.
  ///
  /// Parameter [optimizeForEndUserLocation] :
  /// The option to optimize for better performance by routing traffic through
  /// the closest AWS Region to users, which may be outside of your home Region.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> updateFleetMetadata({
    required String fleetArn,
    String? displayName,
    bool? optimizeForEndUserLocation,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      if (displayName != null) 'DisplayName': displayName,
      if (optimizeForEndUserLocation != null)
        'OptimizeForEndUserLocation': optimizeForEndUserLocation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateFleetMetadata',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the identity provider configuration for the fleet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [fleetArn] :
  /// The ARN of the fleet.
  ///
  /// Parameter [identityProviderType] :
  /// The type of identity provider.
  ///
  /// Parameter [identityProviderSamlMetadata] :
  /// The SAML metadata document provided by the customer’s identity provider.
  /// The existing IdentityProviderSamlMetadata is unset if null is passed.
  @Deprecated(
      'Amazon WorkLink is no longer supported. This will be removed in a future version of the SDK.')
  Future<void> updateIdentityProviderConfiguration({
    required String fleetArn,
    required IdentityProviderType identityProviderType,
    String? identityProviderSamlMetadata,
  }) async {
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      'IdentityProviderType': identityProviderType.value,
      if (identityProviderSamlMetadata != null)
        'IdentityProviderSamlMetadata': identityProviderSamlMetadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateIdentityProviderConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class AssociateDomainResponse {
  AssociateDomainResponse();

  factory AssociateDomainResponse.fromJson(Map<String, dynamic> _) {
    return AssociateDomainResponse();
  }
}

class AssociateWebsiteAuthorizationProviderResponse {
  /// A unique identifier for the authorization provider.
  final String? authorizationProviderId;

  AssociateWebsiteAuthorizationProviderResponse({
    this.authorizationProviderId,
  });

  factory AssociateWebsiteAuthorizationProviderResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateWebsiteAuthorizationProviderResponse(
      authorizationProviderId: json['AuthorizationProviderId'] as String?,
    );
  }
}

class AssociateWebsiteCertificateAuthorityResponse {
  /// A unique identifier for the CA.
  final String? websiteCaId;

  AssociateWebsiteCertificateAuthorityResponse({
    this.websiteCaId,
  });

  factory AssociateWebsiteCertificateAuthorityResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateWebsiteCertificateAuthorityResponse(
      websiteCaId: json['WebsiteCaId'] as String?,
    );
  }
}

enum AuthorizationProviderType {
  saml('SAML'),
  ;

  final String value;

  const AuthorizationProviderType(this.value);

  static AuthorizationProviderType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AuthorizationProviderType'));
}

class CreateFleetResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  final String? fleetArn;

  CreateFleetResponse({
    this.fleetArn,
  });

  factory CreateFleetResponse.fromJson(Map<String, dynamic> json) {
    return CreateFleetResponse(
      fleetArn: json['FleetArn'] as String?,
    );
  }
}

class DeleteFleetResponse {
  DeleteFleetResponse();

  factory DeleteFleetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFleetResponse();
  }
}

class DescribeAuditStreamConfigurationResponse {
  /// The ARN of the Amazon Kinesis data stream that will receive the audit
  /// events.
  final String? auditStreamArn;

  DescribeAuditStreamConfigurationResponse({
    this.auditStreamArn,
  });

  factory DescribeAuditStreamConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAuditStreamConfigurationResponse(
      auditStreamArn: json['AuditStreamArn'] as String?,
    );
  }
}

class DescribeCompanyNetworkConfigurationResponse {
  /// The security groups associated with access to the provided subnets.
  final List<String>? securityGroupIds;

  /// The subnets used for X-ENI connections from Amazon WorkLink rendering
  /// containers.
  final List<String>? subnetIds;

  /// The VPC with connectivity to associated websites.
  final String? vpcId;

  DescribeCompanyNetworkConfigurationResponse({
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory DescribeCompanyNetworkConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeCompanyNetworkConfigurationResponse(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }
}

class DescribeDevicePolicyConfigurationResponse {
  /// The certificate chain, including intermediate certificates and the root
  /// certificate authority certificate used to issue device certificates.
  final String? deviceCaCertificate;

  DescribeDevicePolicyConfigurationResponse({
    this.deviceCaCertificate,
  });

  factory DescribeDevicePolicyConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDevicePolicyConfigurationResponse(
      deviceCaCertificate: json['DeviceCaCertificate'] as String?,
    );
  }
}

class DescribeDeviceResponse {
  /// The date that the device first signed in to Amazon WorkLink.
  final DateTime? firstAccessedTime;

  /// The date that the device last accessed Amazon WorkLink.
  final DateTime? lastAccessedTime;

  /// The manufacturer of the device.
  final String? manufacturer;

  /// The model of the device.
  final String? model;

  /// The operating system of the device.
  final String? operatingSystem;

  /// The operating system version of the device.
  final String? operatingSystemVersion;

  /// The operating system patch level of the device.
  final String? patchLevel;

  /// The current state of the device.
  final DeviceStatus? status;

  /// The user name associated with the device.
  final String? username;

  DescribeDeviceResponse({
    this.firstAccessedTime,
    this.lastAccessedTime,
    this.manufacturer,
    this.model,
    this.operatingSystem,
    this.operatingSystemVersion,
    this.patchLevel,
    this.status,
    this.username,
  });

  factory DescribeDeviceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDeviceResponse(
      firstAccessedTime: timeStampFromJson(json['FirstAccessedTime']),
      lastAccessedTime: timeStampFromJson(json['LastAccessedTime']),
      manufacturer: json['Manufacturer'] as String?,
      model: json['Model'] as String?,
      operatingSystem: json['OperatingSystem'] as String?,
      operatingSystemVersion: json['OperatingSystemVersion'] as String?,
      patchLevel: json['PatchLevel'] as String?,
      status: (json['Status'] as String?)?.let(DeviceStatus.fromString),
      username: json['Username'] as String?,
    );
  }
}

class DescribeDomainResponse {
  /// The ARN of an issued ACM certificate that is valid for the domain being
  /// associated.
  final String? acmCertificateArn;

  /// The time that the domain was added.
  final DateTime? createdTime;

  /// The name to display.
  final String? displayName;

  /// The name of the domain.
  final String? domainName;

  /// The current state for the domain.
  final DomainStatus? domainStatus;

  DescribeDomainResponse({
    this.acmCertificateArn,
    this.createdTime,
    this.displayName,
    this.domainName,
    this.domainStatus,
  });

  factory DescribeDomainResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDomainResponse(
      acmCertificateArn: json['AcmCertificateArn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      displayName: json['DisplayName'] as String?,
      domainName: json['DomainName'] as String?,
      domainStatus:
          (json['DomainStatus'] as String?)?.let(DomainStatus.fromString),
    );
  }
}

class DescribeFleetMetadataResponse {
  /// The identifier used by users to sign in to the Amazon WorkLink app.
  final String? companyCode;

  /// The time that the fleet was created.
  final DateTime? createdTime;

  /// The name to display.
  final String? displayName;

  /// The name of the fleet.
  final String? fleetName;

  /// The current state of the fleet.
  final FleetStatus? fleetStatus;

  /// The time that the fleet was last updated.
  final DateTime? lastUpdatedTime;

  /// The option to optimize for better performance by routing traffic through the
  /// closest AWS Region to users, which may be outside of your home Region.
  final bool? optimizeForEndUserLocation;

  /// The tags attached to the resource. A tag is a key-value pair.
  final Map<String, String>? tags;

  DescribeFleetMetadataResponse({
    this.companyCode,
    this.createdTime,
    this.displayName,
    this.fleetName,
    this.fleetStatus,
    this.lastUpdatedTime,
    this.optimizeForEndUserLocation,
    this.tags,
  });

  factory DescribeFleetMetadataResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFleetMetadataResponse(
      companyCode: json['CompanyCode'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      displayName: json['DisplayName'] as String?,
      fleetName: json['FleetName'] as String?,
      fleetStatus:
          (json['FleetStatus'] as String?)?.let(FleetStatus.fromString),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      optimizeForEndUserLocation: json['OptimizeForEndUserLocation'] as bool?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class DescribeIdentityProviderConfigurationResponse {
  /// The SAML metadata document provided by the user’s identity provider.
  final String? identityProviderSamlMetadata;

  /// The type of identity provider.
  final IdentityProviderType? identityProviderType;

  /// The SAML metadata document uploaded to the user’s identity provider.
  final String? serviceProviderSamlMetadata;

  DescribeIdentityProviderConfigurationResponse({
    this.identityProviderSamlMetadata,
    this.identityProviderType,
    this.serviceProviderSamlMetadata,
  });

  factory DescribeIdentityProviderConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeIdentityProviderConfigurationResponse(
      identityProviderSamlMetadata:
          json['IdentityProviderSamlMetadata'] as String?,
      identityProviderType: (json['IdentityProviderType'] as String?)
          ?.let(IdentityProviderType.fromString),
      serviceProviderSamlMetadata:
          json['ServiceProviderSamlMetadata'] as String?,
    );
  }
}

class DescribeWebsiteCertificateAuthorityResponse {
  /// The root certificate of the certificate authority.
  final String? certificate;

  /// The time that the certificate authority was added.
  final DateTime? createdTime;

  /// The certificate name to display.
  final String? displayName;

  DescribeWebsiteCertificateAuthorityResponse({
    this.certificate,
    this.createdTime,
    this.displayName,
  });

  factory DescribeWebsiteCertificateAuthorityResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeWebsiteCertificateAuthorityResponse(
      certificate: json['Certificate'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      displayName: json['DisplayName'] as String?,
    );
  }
}

enum DeviceStatus {
  active('ACTIVE'),
  signedOut('SIGNED_OUT'),
  ;

  final String value;

  const DeviceStatus(this.value);

  static DeviceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DeviceStatus'));
}

/// The summary of devices.
class DeviceSummary {
  /// The ID of the device.
  final String? deviceId;

  /// The status of the device.
  final DeviceStatus? deviceStatus;

  DeviceSummary({
    this.deviceId,
    this.deviceStatus,
  });

  factory DeviceSummary.fromJson(Map<String, dynamic> json) {
    return DeviceSummary(
      deviceId: json['DeviceId'] as String?,
      deviceStatus:
          (json['DeviceStatus'] as String?)?.let(DeviceStatus.fromString),
    );
  }
}

class DisassociateDomainResponse {
  DisassociateDomainResponse();

  factory DisassociateDomainResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateDomainResponse();
  }
}

class DisassociateWebsiteAuthorizationProviderResponse {
  DisassociateWebsiteAuthorizationProviderResponse();

  factory DisassociateWebsiteAuthorizationProviderResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateWebsiteAuthorizationProviderResponse();
  }
}

class DisassociateWebsiteCertificateAuthorityResponse {
  DisassociateWebsiteCertificateAuthorityResponse();

  factory DisassociateWebsiteCertificateAuthorityResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateWebsiteCertificateAuthorityResponse();
  }
}

enum DomainStatus {
  pendingValidation('PENDING_VALIDATION'),
  associating('ASSOCIATING'),
  active('ACTIVE'),
  inactive('INACTIVE'),
  disassociating('DISASSOCIATING'),
  disassociated('DISASSOCIATED'),
  failedToAssociate('FAILED_TO_ASSOCIATE'),
  failedToDisassociate('FAILED_TO_DISASSOCIATE'),
  ;

  final String value;

  const DomainStatus(this.value);

  static DomainStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DomainStatus'));
}

/// The summary of the domain.
class DomainSummary {
  /// The time that the domain was created.
  final DateTime createdTime;

  /// The name of the domain.
  final String domainName;

  /// The status of the domain.
  final DomainStatus domainStatus;

  /// The name to display.
  final String? displayName;

  DomainSummary({
    required this.createdTime,
    required this.domainName,
    required this.domainStatus,
    this.displayName,
  });

  factory DomainSummary.fromJson(Map<String, dynamic> json) {
    return DomainSummary(
      createdTime: nonNullableTimeStampFromJson(json['CreatedTime'] as Object),
      domainName: json['DomainName'] as String,
      domainStatus: DomainStatus.fromString((json['DomainStatus'] as String)),
      displayName: json['DisplayName'] as String?,
    );
  }
}

enum FleetStatus {
  creating('CREATING'),
  active('ACTIVE'),
  deleting('DELETING'),
  deleted('DELETED'),
  failedToCreate('FAILED_TO_CREATE'),
  failedToDelete('FAILED_TO_DELETE'),
  ;

  final String value;

  const FleetStatus(this.value);

  static FleetStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum FleetStatus'));
}

/// The summary of the fleet.
class FleetSummary {
  /// The identifier used by users to sign into the Amazon WorkLink app.
  final String? companyCode;

  /// The time when the fleet was created.
  final DateTime? createdTime;

  /// The name of the fleet to display.
  final String? displayName;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String? fleetArn;

  /// The name of the fleet.
  final String? fleetName;

  /// The status of the fleet.
  final FleetStatus? fleetStatus;

  /// The time when the fleet was last updated.
  final DateTime? lastUpdatedTime;

  /// The tags attached to the resource. A tag is a key-value pair.
  final Map<String, String>? tags;

  FleetSummary({
    this.companyCode,
    this.createdTime,
    this.displayName,
    this.fleetArn,
    this.fleetName,
    this.fleetStatus,
    this.lastUpdatedTime,
    this.tags,
  });

  factory FleetSummary.fromJson(Map<String, dynamic> json) {
    return FleetSummary(
      companyCode: json['CompanyCode'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      displayName: json['DisplayName'] as String?,
      fleetArn: json['FleetArn'] as String?,
      fleetName: json['FleetName'] as String?,
      fleetStatus:
          (json['FleetStatus'] as String?)?.let(FleetStatus.fromString),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

enum IdentityProviderType {
  saml('SAML'),
  ;

  final String value;

  const IdentityProviderType(this.value);

  static IdentityProviderType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum IdentityProviderType'));
}

class ListDevicesResponse {
  /// Information about the devices.
  final List<DeviceSummary>? devices;

  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  ListDevicesResponse({
    this.devices,
    this.nextToken,
  });

  factory ListDevicesResponse.fromJson(Map<String, dynamic> json) {
    return ListDevicesResponse(
      devices: (json['Devices'] as List?)
          ?.nonNulls
          .map((e) => DeviceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListDomainsResponse {
  /// Information about the domains.
  final List<DomainSummary>? domains;

  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  ListDomainsResponse({
    this.domains,
    this.nextToken,
  });

  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainsResponse(
      domains: (json['Domains'] as List?)
          ?.nonNulls
          .map((e) => DomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListFleetsResponse {
  /// The summary list of the fleets.
  final List<FleetSummary>? fleetSummaryList;

  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  ListFleetsResponse({
    this.fleetSummaryList,
    this.nextToken,
  });

  factory ListFleetsResponse.fromJson(Map<String, dynamic> json) {
    return ListFleetsResponse(
      fleetSummaryList: (json['FleetSummaryList'] as List?)
          ?.nonNulls
          .map((e) => FleetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListTagsForResourceResponse {
  /// The tags attached to the resource. A tag is a key-value pair.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class ListWebsiteAuthorizationProvidersResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  final String? nextToken;

  /// The website authorization providers.
  final List<WebsiteAuthorizationProviderSummary>?
      websiteAuthorizationProviders;

  ListWebsiteAuthorizationProvidersResponse({
    this.nextToken,
    this.websiteAuthorizationProviders,
  });

  factory ListWebsiteAuthorizationProvidersResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWebsiteAuthorizationProvidersResponse(
      nextToken: json['NextToken'] as String?,
      websiteAuthorizationProviders:
          (json['WebsiteAuthorizationProviders'] as List?)
              ?.nonNulls
              .map((e) => WebsiteAuthorizationProviderSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class ListWebsiteCertificateAuthoritiesResponse {
  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// Information about the certificates.
  final List<WebsiteCaSummary>? websiteCertificateAuthorities;

  ListWebsiteCertificateAuthoritiesResponse({
    this.nextToken,
    this.websiteCertificateAuthorities,
  });

  factory ListWebsiteCertificateAuthoritiesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWebsiteCertificateAuthoritiesResponse(
      nextToken: json['NextToken'] as String?,
      websiteCertificateAuthorities:
          (json['WebsiteCertificateAuthorities'] as List?)
              ?.nonNulls
              .map((e) => WebsiteCaSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class RestoreDomainAccessResponse {
  RestoreDomainAccessResponse();

  factory RestoreDomainAccessResponse.fromJson(Map<String, dynamic> _) {
    return RestoreDomainAccessResponse();
  }
}

class RevokeDomainAccessResponse {
  RevokeDomainAccessResponse();

  factory RevokeDomainAccessResponse.fromJson(Map<String, dynamic> _) {
    return RevokeDomainAccessResponse();
  }
}

class SignOutUserResponse {
  SignOutUserResponse();

  factory SignOutUserResponse.fromJson(Map<String, dynamic> _) {
    return SignOutUserResponse();
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateAuditStreamConfigurationResponse {
  UpdateAuditStreamConfigurationResponse();

  factory UpdateAuditStreamConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateAuditStreamConfigurationResponse();
  }
}

class UpdateCompanyNetworkConfigurationResponse {
  UpdateCompanyNetworkConfigurationResponse();

  factory UpdateCompanyNetworkConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateCompanyNetworkConfigurationResponse();
  }
}

class UpdateDevicePolicyConfigurationResponse {
  UpdateDevicePolicyConfigurationResponse();

  factory UpdateDevicePolicyConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateDevicePolicyConfigurationResponse();
  }
}

class UpdateDomainMetadataResponse {
  UpdateDomainMetadataResponse();

  factory UpdateDomainMetadataResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDomainMetadataResponse();
  }
}

class UpdateFleetMetadataResponse {
  UpdateFleetMetadataResponse();

  factory UpdateFleetMetadataResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFleetMetadataResponse();
  }
}

class UpdateIdentityProviderConfigurationResponse {
  UpdateIdentityProviderConfigurationResponse();

  factory UpdateIdentityProviderConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateIdentityProviderConfigurationResponse();
  }
}

/// The summary of the website authorization provider.
class WebsiteAuthorizationProviderSummary {
  /// The authorization provider type.
  final AuthorizationProviderType authorizationProviderType;

  /// A unique identifier for the authorization provider.
  final String? authorizationProviderId;

  /// The time of creation.
  final DateTime? createdTime;

  /// The domain name of the authorization provider. This applies only to
  /// SAML-based authorization providers.
  final String? domainName;

  WebsiteAuthorizationProviderSummary({
    required this.authorizationProviderType,
    this.authorizationProviderId,
    this.createdTime,
    this.domainName,
  });

  factory WebsiteAuthorizationProviderSummary.fromJson(
      Map<String, dynamic> json) {
    return WebsiteAuthorizationProviderSummary(
      authorizationProviderType: AuthorizationProviderType.fromString(
          (json['AuthorizationProviderType'] as String)),
      authorizationProviderId: json['AuthorizationProviderId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      domainName: json['DomainName'] as String?,
    );
  }
}

/// The summary of the certificate authority (CA).
class WebsiteCaSummary {
  /// The time when the CA was added.
  final DateTime? createdTime;

  /// The name to display.
  final String? displayName;

  /// A unique identifier for the CA.
  final String? websiteCaId;

  WebsiteCaSummary({
    this.createdTime,
    this.displayName,
    this.websiteCaId,
  });

  factory WebsiteCaSummary.fromJson(Map<String, dynamic> json) {
    return WebsiteCaSummary(
      createdTime: timeStampFromJson(json['CreatedTime']),
      displayName: json['DisplayName'] as String?,
      websiteCaId: json['WebsiteCaId'] as String?,
    );
  }
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
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

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
