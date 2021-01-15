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

part '2018-09-25.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'worklink',
            signingName: 'worklink',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  Future<void> associateDomain({
    @_s.required String acmCertificateArn,
    @_s.required String domainName,
    @_s.required String fleetArn,
    String displayName,
  }) async {
    ArgumentError.checkNotNull(acmCertificateArn, 'acmCertificateArn');
    _s.validateStringPattern(
      'acmCertificateArn',
      acmCertificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=/,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      253,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9]?((?!-)([A-Za-z0-9-]*[A-Za-z0-9])\.)+[a-zA-Z0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
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
    return AssociateDomainResponse.fromJson(response);
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
  Future<AssociateWebsiteAuthorizationProviderResponse>
      associateWebsiteAuthorizationProvider({
    @_s.required AuthorizationProviderType authorizationProviderType,
    @_s.required String fleetArn,
    String domainName,
  }) async {
    ArgumentError.checkNotNull(
        authorizationProviderType, 'authorizationProviderType');
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      253,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9]?((?!-)([A-Za-z0-9-]*[A-Za-z0-9])\.)+[a-zA-Z0-9]+$''',
    );
    final $payload = <String, dynamic>{
      'AuthorizationProviderType': authorizationProviderType?.toValue() ?? '',
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
  Future<AssociateWebsiteCertificateAuthorityResponse>
      associateWebsiteCertificateAuthority({
    @_s.required String certificate,
    @_s.required String fleetArn,
    String displayName,
  }) async {
    ArgumentError.checkNotNull(certificate, 'certificate');
    _s.validateStringLength(
      'certificate',
      certificate,
      1,
      8192,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificate',
      certificate,
      r'''-{5}BEGIN CERTIFICATE-{5}\u000D?\u000A([A-Za-z0-9/+]{64}\u000D?\u000A)*[A-Za-z0-9/+]{1,64}={0,2}\u000D?\u000A-{5}END CERTIFICATE-{5}(\u000D?\u000A)?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
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
  Future<CreateFleetResponse> createFleet({
    @_s.required String fleetName,
    String displayName,
    bool optimizeForEndUserLocation,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(fleetName, 'fleetName');
    _s.validateStringLength(
      'fleetName',
      fleetName,
      1,
      48,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fleetName',
      fleetName,
      r'''^[a-z0-9](?:[a-z0-9\-]{0,46}[a-z0-9])?$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
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
  Future<void> deleteFleet({
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteFleet',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFleetResponse.fromJson(response);
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
  Future<DescribeAuditStreamConfigurationResponse>
      describeAuditStreamConfiguration({
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
  Future<DescribeCompanyNetworkConfigurationResponse>
      describeCompanyNetworkConfiguration({
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
  Future<DescribeDeviceResponse> describeDevice({
    @_s.required String deviceId,
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    _s.validateStringLength(
      'deviceId',
      deviceId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
  Future<DescribeDevicePolicyConfigurationResponse>
      describeDevicePolicyConfiguration({
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
  Future<DescribeDomainResponse> describeDomain({
    @_s.required String domainName,
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      253,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9]?((?!-)([A-Za-z0-9-]*[A-Za-z0-9])\.)+[a-zA-Z0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
  Future<DescribeFleetMetadataResponse> describeFleetMetadata({
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
  Future<DescribeIdentityProviderConfigurationResponse>
      describeIdentityProviderConfiguration({
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
  Future<DescribeWebsiteCertificateAuthorityResponse>
      describeWebsiteCertificateAuthority({
    @_s.required String fleetArn,
    @_s.required String websiteCaId,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(websiteCaId, 'websiteCaId');
    _s.validateStringLength(
      'websiteCaId',
      websiteCaId,
      1,
      256,
      isRequired: true,
    );
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
  Future<void> disassociateDomain({
    @_s.required String domainName,
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      253,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9]?((?!-)([A-Za-z0-9-]*[A-Za-z0-9])\.)+[a-zA-Z0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
    return DisassociateDomainResponse.fromJson(response);
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
  Future<void> disassociateWebsiteAuthorizationProvider({
    @_s.required String authorizationProviderId,
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(
        authorizationProviderId, 'authorizationProviderId');
    _s.validateStringLength(
      'authorizationProviderId',
      authorizationProviderId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
    return DisassociateWebsiteAuthorizationProviderResponse.fromJson(response);
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
  Future<void> disassociateWebsiteCertificateAuthority({
    @_s.required String fleetArn,
    @_s.required String websiteCaId,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(websiteCaId, 'websiteCaId');
    _s.validateStringLength(
      'websiteCaId',
      websiteCaId,
      1,
      256,
      isRequired: true,
    );
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
    return DisassociateWebsiteCertificateAuthorityResponse.fromJson(response);
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
  Future<ListDevicesResponse> listDevices({
    @_s.required String fleetArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\w\-]+''',
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
  Future<ListDomainsResponse> listDomains({
    @_s.required String fleetArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\w\-]+''',
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
  Future<ListFleetsResponse> listFleets({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\w\-]+''',
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
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
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
  Future<ListWebsiteAuthorizationProvidersResponse>
      listWebsiteAuthorizationProviders({
    @_s.required String fleetArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\w\-]+''',
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
  Future<ListWebsiteCertificateAuthoritiesResponse>
      listWebsiteCertificateAuthorities({
    @_s.required String fleetArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\w\-]+''',
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
  Future<void> restoreDomainAccess({
    @_s.required String domainName,
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      253,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9]?((?!-)([A-Za-z0-9-]*[A-Za-z0-9])\.)+[a-zA-Z0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
    return RestoreDomainAccessResponse.fromJson(response);
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
  Future<void> revokeDomainAccess({
    @_s.required String domainName,
    @_s.required String fleetArn,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      253,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9]?((?!-)([A-Za-z0-9-]*[A-Za-z0-9])\.)+[a-zA-Z0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
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
    return RevokeDomainAccessResponse.fromJson(response);
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
  Future<void> signOutUser({
    @_s.required String fleetArn,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      256,
      isRequired: true,
    );
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
    return SignOutUserResponse.fromJson(response);
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
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
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
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
  Future<void> updateAuditStreamConfiguration({
    @_s.required String fleetArn,
    String auditStreamArn,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'auditStreamArn',
      auditStreamArn,
      r'''^arn:aws:kinesis:.+:[0-9]{12}:stream/AmazonWorkLink-.*$''',
    );
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
    return UpdateAuditStreamConfigurationResponse.fromJson(response);
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
  Future<void> updateCompanyNetworkConfiguration({
    @_s.required String fleetArn,
    @_s.required List<String> securityGroupIds,
    @_s.required List<String> subnetIds,
    @_s.required String vpcId,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(securityGroupIds, 'securityGroupIds');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    ArgumentError.checkNotNull(vpcId, 'vpcId');
    _s.validateStringPattern(
      'vpcId',
      vpcId,
      r'''^vpc-([0-9a-f]{8}|[0-9a-f]{17})$''',
      isRequired: true,
    );
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
    return UpdateCompanyNetworkConfigurationResponse.fromJson(response);
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
  Future<void> updateDevicePolicyConfiguration({
    @_s.required String fleetArn,
    String deviceCaCertificate,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'deviceCaCertificate',
      deviceCaCertificate,
      1,
      32768,
    );
    _s.validateStringPattern(
      'deviceCaCertificate',
      deviceCaCertificate,
      r'''(-{5}BEGIN CERTIFICATE-{5}\u000D?\u000A([A-Za-z0-9/+]{64}\u000D?\u000A)*[A-Za-z0-9/+]{1,64}={0,2}\u000D?\u000A-{5}END CERTIFICATE-{5}\u000D?\u000A)*-{5}BEGIN CERTIFICATE-{5}\u000D?\u000A([A-Za-z0-9/+]{64}\u000D?\u000A)*[A-Za-z0-9/+]{1,64}={0,2}\u000D?\u000A-{5}END CERTIFICATE-{5}(\u000D?\u000A)?''',
    );
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
    return UpdateDevicePolicyConfigurationResponse.fromJson(response);
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
  Future<void> updateDomainMetadata({
    @_s.required String domainName,
    @_s.required String fleetArn,
    String displayName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      253,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9]?((?!-)([A-Za-z0-9-]*[A-Za-z0-9])\.)+[a-zA-Z0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
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
    return UpdateDomainMetadataResponse.fromJson(response);
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
  Future<void> updateFleetMetadata({
    @_s.required String fleetArn,
    String displayName,
    bool optimizeForEndUserLocation,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
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
    return UpdateFleetMetadataResponse.fromJson(response);
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
  Future<void> updateIdentityProviderConfiguration({
    @_s.required String fleetArn,
    @_s.required IdentityProviderType identityProviderType,
    String identityProviderSamlMetadata,
  }) async {
    ArgumentError.checkNotNull(fleetArn, 'fleetArn');
    _s.validateStringLength(
      'fleetArn',
      fleetArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityProviderType, 'identityProviderType');
    _s.validateStringLength(
      'identityProviderSamlMetadata',
      identityProviderSamlMetadata,
      1,
      204800,
    );
    final $payload = <String, dynamic>{
      'FleetArn': fleetArn,
      'IdentityProviderType': identityProviderType?.toValue() ?? '',
      if (identityProviderSamlMetadata != null)
        'IdentityProviderSamlMetadata': identityProviderSamlMetadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateIdentityProviderConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIdentityProviderConfigurationResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateDomainResponse {
  AssociateDomainResponse();
  factory AssociateDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateWebsiteAuthorizationProviderResponse {
  /// A unique identifier for the authorization provider.
  @_s.JsonKey(name: 'AuthorizationProviderId')
  final String authorizationProviderId;

  AssociateWebsiteAuthorizationProviderResponse({
    this.authorizationProviderId,
  });
  factory AssociateWebsiteAuthorizationProviderResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateWebsiteAuthorizationProviderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateWebsiteCertificateAuthorityResponse {
  /// A unique identifier for the CA.
  @_s.JsonKey(name: 'WebsiteCaId')
  final String websiteCaId;

  AssociateWebsiteCertificateAuthorityResponse({
    this.websiteCaId,
  });
  factory AssociateWebsiteCertificateAuthorityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateWebsiteCertificateAuthorityResponseFromJson(json);
}

enum AuthorizationProviderType {
  @_s.JsonValue('SAML')
  saml,
}

extension on AuthorizationProviderType {
  String toValue() {
    switch (this) {
      case AuthorizationProviderType.saml:
        return 'SAML';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFleetResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'FleetArn')
  final String fleetArn;

  CreateFleetResponse({
    this.fleetArn,
  });
  factory CreateFleetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFleetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFleetResponse {
  DeleteFleetResponse();
  factory DeleteFleetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFleetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAuditStreamConfigurationResponse {
  /// The ARN of the Amazon Kinesis data stream that will receive the audit
  /// events.
  @_s.JsonKey(name: 'AuditStreamArn')
  final String auditStreamArn;

  DescribeAuditStreamConfigurationResponse({
    this.auditStreamArn,
  });
  factory DescribeAuditStreamConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAuditStreamConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCompanyNetworkConfigurationResponse {
  /// The security groups associated with access to the provided subnets.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The subnets used for X-ENI connections from Amazon WorkLink rendering
  /// containers.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The VPC with connectivity to associated websites.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  DescribeCompanyNetworkConfigurationResponse({
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });
  factory DescribeCompanyNetworkConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeCompanyNetworkConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDevicePolicyConfigurationResponse {
  /// The certificate chain, including intermediate certificates and the root
  /// certificate authority certificate used to issue device certificates.
  @_s.JsonKey(name: 'DeviceCaCertificate')
  final String deviceCaCertificate;

  DescribeDevicePolicyConfigurationResponse({
    this.deviceCaCertificate,
  });
  factory DescribeDevicePolicyConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDevicePolicyConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDeviceResponse {
  /// The date that the device first signed in to Amazon WorkLink.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FirstAccessedTime')
  final DateTime firstAccessedTime;

  /// The date that the device last accessed Amazon WorkLink.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastAccessedTime')
  final DateTime lastAccessedTime;

  /// The manufacturer of the device.
  @_s.JsonKey(name: 'Manufacturer')
  final String manufacturer;

  /// The model of the device.
  @_s.JsonKey(name: 'Model')
  final String model;

  /// The operating system of the device.
  @_s.JsonKey(name: 'OperatingSystem')
  final String operatingSystem;

  /// The operating system version of the device.
  @_s.JsonKey(name: 'OperatingSystemVersion')
  final String operatingSystemVersion;

  /// The operating system patch level of the device.
  @_s.JsonKey(name: 'PatchLevel')
  final String patchLevel;

  /// The current state of the device.
  @_s.JsonKey(name: 'Status')
  final DeviceStatus status;

  /// The user name associated with the device.
  @_s.JsonKey(name: 'Username')
  final String username;

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
  factory DescribeDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDomainResponse {
  /// The ARN of an issued ACM certificate that is valid for the domain being
  /// associated.
  @_s.JsonKey(name: 'AcmCertificateArn')
  final String acmCertificateArn;

  /// The time that the domain was added.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The name to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The name of the domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The current state for the domain.
  @_s.JsonKey(name: 'DomainStatus')
  final DomainStatus domainStatus;

  DescribeDomainResponse({
    this.acmCertificateArn,
    this.createdTime,
    this.displayName,
    this.domainName,
    this.domainStatus,
  });
  factory DescribeDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFleetMetadataResponse {
  /// The identifier used by users to sign in to the Amazon WorkLink app.
  @_s.JsonKey(name: 'CompanyCode')
  final String companyCode;

  /// The time that the fleet was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The name to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The name of the fleet.
  @_s.JsonKey(name: 'FleetName')
  final String fleetName;

  /// The current state of the fleet.
  @_s.JsonKey(name: 'FleetStatus')
  final FleetStatus fleetStatus;

  /// The time that the fleet was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The option to optimize for better performance by routing traffic through the
  /// closest AWS Region to users, which may be outside of your home Region.
  @_s.JsonKey(name: 'OptimizeForEndUserLocation')
  final bool optimizeForEndUserLocation;

  /// The tags attached to the resource. A tag is a key-value pair.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

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
  factory DescribeFleetMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFleetMetadataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeIdentityProviderConfigurationResponse {
  /// The SAML metadata document provided by the user’s identity provider.
  @_s.JsonKey(name: 'IdentityProviderSamlMetadata')
  final String identityProviderSamlMetadata;

  /// The type of identity provider.
  @_s.JsonKey(name: 'IdentityProviderType')
  final IdentityProviderType identityProviderType;

  /// The SAML metadata document uploaded to the user’s identity provider.
  @_s.JsonKey(name: 'ServiceProviderSamlMetadata')
  final String serviceProviderSamlMetadata;

  DescribeIdentityProviderConfigurationResponse({
    this.identityProviderSamlMetadata,
    this.identityProviderType,
    this.serviceProviderSamlMetadata,
  });
  factory DescribeIdentityProviderConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeIdentityProviderConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWebsiteCertificateAuthorityResponse {
  /// The root certificate of the certificate authority.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// The time that the certificate authority was added.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The certificate name to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  DescribeWebsiteCertificateAuthorityResponse({
    this.certificate,
    this.createdTime,
    this.displayName,
  });
  factory DescribeWebsiteCertificateAuthorityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeWebsiteCertificateAuthorityResponseFromJson(json);
}

enum DeviceStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('SIGNED_OUT')
  signedOut,
}

/// The summary of devices.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceSummary {
  /// The ID of the device.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  /// The status of the device.
  @_s.JsonKey(name: 'DeviceStatus')
  final DeviceStatus deviceStatus;

  DeviceSummary({
    this.deviceId,
    this.deviceStatus,
  });
  factory DeviceSummary.fromJson(Map<String, dynamic> json) =>
      _$DeviceSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateDomainResponse {
  DisassociateDomainResponse();
  factory DisassociateDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateWebsiteAuthorizationProviderResponse {
  DisassociateWebsiteAuthorizationProviderResponse();
  factory DisassociateWebsiteAuthorizationProviderResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateWebsiteAuthorizationProviderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateWebsiteCertificateAuthorityResponse {
  DisassociateWebsiteCertificateAuthorityResponse();
  factory DisassociateWebsiteCertificateAuthorityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateWebsiteCertificateAuthorityResponseFromJson(json);
}

enum DomainStatus {
  @_s.JsonValue('PENDING_VALIDATION')
  pendingValidation,
  @_s.JsonValue('ASSOCIATING')
  associating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DISASSOCIATING')
  disassociating,
  @_s.JsonValue('DISASSOCIATED')
  disassociated,
  @_s.JsonValue('FAILED_TO_ASSOCIATE')
  failedToAssociate,
  @_s.JsonValue('FAILED_TO_DISASSOCIATE')
  failedToDisassociate,
}

/// The summary of the domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainSummary {
  /// The time that the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The name of the domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The status of the domain.
  @_s.JsonKey(name: 'DomainStatus')
  final DomainStatus domainStatus;

  /// The name to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  DomainSummary({
    @_s.required this.createdTime,
    @_s.required this.domainName,
    @_s.required this.domainStatus,
    this.displayName,
  });
  factory DomainSummary.fromJson(Map<String, dynamic> json) =>
      _$DomainSummaryFromJson(json);
}

enum FleetStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('FAILED_TO_CREATE')
  failedToCreate,
  @_s.JsonValue('FAILED_TO_DELETE')
  failedToDelete,
}

/// The summary of the fleet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FleetSummary {
  /// The identifier used by users to sign into the Amazon WorkLink app.
  @_s.JsonKey(name: 'CompanyCode')
  final String companyCode;

  /// The time when the fleet was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The name of the fleet to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'FleetArn')
  final String fleetArn;

  /// The name of the fleet.
  @_s.JsonKey(name: 'FleetName')
  final String fleetName;

  /// The status of the fleet.
  @_s.JsonKey(name: 'FleetStatus')
  final FleetStatus fleetStatus;

  /// The time when the fleet was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The tags attached to the resource. A tag is a key-value pair.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

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
  factory FleetSummary.fromJson(Map<String, dynamic> json) =>
      _$FleetSummaryFromJson(json);
}

enum IdentityProviderType {
  @_s.JsonValue('SAML')
  saml,
}

extension on IdentityProviderType {
  String toValue() {
    switch (this) {
      case IdentityProviderType.saml:
        return 'SAML';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDevicesResponse {
  /// Information about the devices.
  @_s.JsonKey(name: 'Devices')
  final List<DeviceSummary> devices;

  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDevicesResponse({
    this.devices,
    this.nextToken,
  });
  factory ListDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDevicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainsResponse {
  /// Information about the domains.
  @_s.JsonKey(name: 'Domains')
  final List<DomainSummary> domains;

  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDomainsResponse({
    this.domains,
    this.nextToken,
  });
  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDomainsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFleetsResponse {
  /// The summary list of the fleets.
  @_s.JsonKey(name: 'FleetSummaryList')
  final List<FleetSummary> fleetSummaryList;

  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFleetsResponse({
    this.fleetSummaryList,
    this.nextToken,
  });
  factory ListFleetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFleetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags attached to the resource. A tag is a key-value pair.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWebsiteAuthorizationProvidersResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The website authorization providers.
  @_s.JsonKey(name: 'WebsiteAuthorizationProviders')
  final List<WebsiteAuthorizationProviderSummary> websiteAuthorizationProviders;

  ListWebsiteAuthorizationProvidersResponse({
    this.nextToken,
    this.websiteAuthorizationProviders,
  });
  factory ListWebsiteAuthorizationProvidersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListWebsiteAuthorizationProvidersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWebsiteCertificateAuthoritiesResponse {
  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the certificates.
  @_s.JsonKey(name: 'WebsiteCertificateAuthorities')
  final List<WebsiteCaSummary> websiteCertificateAuthorities;

  ListWebsiteCertificateAuthoritiesResponse({
    this.nextToken,
    this.websiteCertificateAuthorities,
  });
  factory ListWebsiteCertificateAuthoritiesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListWebsiteCertificateAuthoritiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestoreDomainAccessResponse {
  RestoreDomainAccessResponse();
  factory RestoreDomainAccessResponse.fromJson(Map<String, dynamic> json) =>
      _$RestoreDomainAccessResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RevokeDomainAccessResponse {
  RevokeDomainAccessResponse();
  factory RevokeDomainAccessResponse.fromJson(Map<String, dynamic> json) =>
      _$RevokeDomainAccessResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SignOutUserResponse {
  SignOutUserResponse();
  factory SignOutUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SignOutUserResponseFromJson(json);
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
class UpdateAuditStreamConfigurationResponse {
  UpdateAuditStreamConfigurationResponse();
  factory UpdateAuditStreamConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateAuditStreamConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCompanyNetworkConfigurationResponse {
  UpdateCompanyNetworkConfigurationResponse();
  factory UpdateCompanyNetworkConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCompanyNetworkConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDevicePolicyConfigurationResponse {
  UpdateDevicePolicyConfigurationResponse();
  factory UpdateDevicePolicyConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDevicePolicyConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainMetadataResponse {
  UpdateDomainMetadataResponse();
  factory UpdateDomainMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDomainMetadataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFleetMetadataResponse {
  UpdateFleetMetadataResponse();
  factory UpdateFleetMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFleetMetadataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateIdentityProviderConfigurationResponse {
  UpdateIdentityProviderConfigurationResponse();
  factory UpdateIdentityProviderConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateIdentityProviderConfigurationResponseFromJson(json);
}

/// The summary of the website authorization provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WebsiteAuthorizationProviderSummary {
  /// The authorization provider type.
  @_s.JsonKey(name: 'AuthorizationProviderType')
  final AuthorizationProviderType authorizationProviderType;

  /// A unique identifier for the authorization provider.
  @_s.JsonKey(name: 'AuthorizationProviderId')
  final String authorizationProviderId;

  /// The time of creation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The domain name of the authorization provider. This applies only to
  /// SAML-based authorization providers.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  WebsiteAuthorizationProviderSummary({
    @_s.required this.authorizationProviderType,
    this.authorizationProviderId,
    this.createdTime,
    this.domainName,
  });
  factory WebsiteAuthorizationProviderSummary.fromJson(
          Map<String, dynamic> json) =>
      _$WebsiteAuthorizationProviderSummaryFromJson(json);
}

/// The summary of the certificate authority (CA).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WebsiteCaSummary {
  /// The time when the CA was added.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The name to display.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// A unique identifier for the CA.
  @_s.JsonKey(name: 'WebsiteCaId')
  final String websiteCaId;

  WebsiteCaSummary({
    this.createdTime,
    this.displayName,
    this.websiteCaId,
  });
  factory WebsiteCaSummary.fromJson(Map<String, dynamic> json) =>
      _$WebsiteCaSummaryFromJson(json);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
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

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
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
