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

part '2018-08-01.g.dart';

/// AWS License Manager makes it easier to manage licenses from software vendors
/// across multiple AWS accounts and on-premises servers.
class LicenseManager {
  final _s.JsonProtocol _protocol;
  LicenseManager({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'license-manager',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Accepts the specified grant.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [grantArn] :
  /// Amazon Resource Name (ARN) of the grant.
  Future<AcceptGrantResponse> acceptGrant({
    @_s.required String grantArn,
  }) async {
    ArgumentError.checkNotNull(grantArn, 'grantArn');
    _s.validateStringLength(
      'grantArn',
      grantArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'grantArn',
      grantArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.AcceptGrant'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GrantArn': grantArn,
      },
    );

    return AcceptGrantResponse.fromJson(jsonResponse.body);
  }

  /// Checks in the specified license. Check in a license when it is no longer
  /// in use.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [licenseConsumptionToken] :
  /// License consumption token.
  ///
  /// Parameter [beneficiary] :
  /// License beneficiary.
  Future<void> checkInLicense({
    @_s.required String licenseConsumptionToken,
    String beneficiary,
  }) async {
    ArgumentError.checkNotNull(
        licenseConsumptionToken, 'licenseConsumptionToken');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CheckInLicense'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConsumptionToken': licenseConsumptionToken,
        if (beneficiary != null) 'Beneficiary': beneficiary,
      },
    );

    return CheckInLicenseResponse.fromJson(jsonResponse.body);
  }

  /// Checks out the specified license for offline use.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NoEntitlementsAllowedException].
  /// May throw [EntitlementNotAllowedException].
  /// May throw [UnsupportedDigitalSignatureMethodException].
  /// May throw [RedirectException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [digitalSignatureMethod] :
  /// Digital signature method. The possible value is JSON Web Signature (JWS)
  /// algorithm PS384. For more information, see <a
  /// href="https://tools.ietf.org/html/rfc7518#section-3.5">RFC 7518 Digital
  /// Signature with RSASSA-PSS</a>.
  ///
  /// Parameter [entitlements] :
  /// License entitlements. Partial checkouts are not supported.
  ///
  /// Parameter [licenseArn] :
  /// Amazon Resource Name (ARN) of the license. The license must use the borrow
  /// consumption configuration.
  ///
  /// Parameter [checkoutMetadata] :
  /// Information about constraints.
  ///
  /// Parameter [nodeId] :
  /// Node ID.
  Future<CheckoutBorrowLicenseResponse> checkoutBorrowLicense({
    @_s.required String clientToken,
    @_s.required DigitalSignatureMethod digitalSignatureMethod,
    @_s.required List<EntitlementData> entitlements,
    @_s.required String licenseArn,
    List<Metadata> checkoutMetadata,
    String nodeId,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''[a-zA-Z0-9]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        digitalSignatureMethod, 'digitalSignatureMethod');
    ArgumentError.checkNotNull(entitlements, 'entitlements');
    ArgumentError.checkNotNull(licenseArn, 'licenseArn');
    _s.validateStringLength(
      'licenseArn',
      licenseArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'licenseArn',
      licenseArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CheckoutBorrowLicense'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'DigitalSignatureMethod': digitalSignatureMethod?.toValue() ?? '',
        'Entitlements': entitlements,
        'LicenseArn': licenseArn,
        if (checkoutMetadata != null) 'CheckoutMetadata': checkoutMetadata,
        if (nodeId != null) 'NodeId': nodeId,
      },
    );

    return CheckoutBorrowLicenseResponse.fromJson(jsonResponse.body);
  }

  /// Checks out the specified license.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NoEntitlementsAllowedException].
  /// May throw [UnsupportedDigitalSignatureMethodException].
  /// May throw [RedirectException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [checkoutType] :
  /// Checkout type.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [entitlements] :
  /// License entitlements.
  ///
  /// Parameter [keyFingerprint] :
  /// Key fingerprint identifying the license.
  ///
  /// Parameter [productSKU] :
  /// Product SKU.
  ///
  /// Parameter [beneficiary] :
  /// License beneficiary.
  ///
  /// Parameter [nodeId] :
  /// Node ID.
  Future<CheckoutLicenseResponse> checkoutLicense({
    @_s.required CheckoutType checkoutType,
    @_s.required String clientToken,
    @_s.required List<EntitlementData> entitlements,
    @_s.required String keyFingerprint,
    @_s.required String productSKU,
    String beneficiary,
    String nodeId,
  }) async {
    ArgumentError.checkNotNull(checkoutType, 'checkoutType');
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''[a-zA-Z0-9]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(entitlements, 'entitlements');
    ArgumentError.checkNotNull(keyFingerprint, 'keyFingerprint');
    ArgumentError.checkNotNull(productSKU, 'productSKU');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CheckoutLicense'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CheckoutType': checkoutType?.toValue() ?? '',
        'ClientToken': clientToken,
        'Entitlements': entitlements,
        'KeyFingerprint': keyFingerprint,
        'ProductSKU': productSKU,
        if (beneficiary != null) 'Beneficiary': beneficiary,
        if (nodeId != null) 'NodeId': nodeId,
      },
    );

    return CheckoutLicenseResponse.fromJson(jsonResponse.body);
  }

  /// Creates a grant for the specified license. A grant shares the use of
  /// license entitlements with specific AWS accounts.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [RateLimitExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [allowedOperations] :
  /// Allowed operations for the grant.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [grantName] :
  /// Grant name.
  ///
  /// Parameter [homeRegion] :
  /// Home Region of the grant.
  ///
  /// Parameter [licenseArn] :
  /// Amazon Resource Name (ARN) of the license.
  ///
  /// Parameter [principals] :
  /// The grant principals.
  Future<CreateGrantResponse> createGrant({
    @_s.required List<AllowedOperation> allowedOperations,
    @_s.required String clientToken,
    @_s.required String grantName,
    @_s.required String homeRegion,
    @_s.required String licenseArn,
    @_s.required List<String> principals,
  }) async {
    ArgumentError.checkNotNull(allowedOperations, 'allowedOperations');
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    ArgumentError.checkNotNull(grantName, 'grantName');
    ArgumentError.checkNotNull(homeRegion, 'homeRegion');
    ArgumentError.checkNotNull(licenseArn, 'licenseArn');
    _s.validateStringLength(
      'licenseArn',
      licenseArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'licenseArn',
      licenseArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principals, 'principals');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CreateGrant'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AllowedOperations':
            allowedOperations?.map((e) => e?.toValue() ?? '')?.toList(),
        'ClientToken': clientToken,
        'GrantName': grantName,
        'HomeRegion': homeRegion,
        'LicenseArn': licenseArn,
        'Principals': principals,
      },
    );

    return CreateGrantResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new version of the specified grant.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [grantArn] :
  /// Amazon Resource Name (ARN) of the grant.
  ///
  /// Parameter [allowedOperations] :
  /// Allowed operations for the grant.
  ///
  /// Parameter [grantName] :
  /// Grant name.
  ///
  /// Parameter [sourceVersion] :
  /// Current version of the grant.
  ///
  /// Parameter [status] :
  /// Grant status.
  Future<CreateGrantVersionResponse> createGrantVersion({
    @_s.required String clientToken,
    @_s.required String grantArn,
    List<AllowedOperation> allowedOperations,
    String grantName,
    String sourceVersion,
    GrantStatus status,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    ArgumentError.checkNotNull(grantArn, 'grantArn');
    _s.validateStringLength(
      'grantArn',
      grantArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'grantArn',
      grantArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CreateGrantVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'GrantArn': grantArn,
        if (allowedOperations != null)
          'AllowedOperations':
              allowedOperations.map((e) => e?.toValue() ?? '').toList(),
        if (grantName != null) 'GrantName': grantName,
        if (sourceVersion != null) 'SourceVersion': sourceVersion,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return CreateGrantVersionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a license.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [RedirectException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [beneficiary] :
  /// License beneficiary.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [consumptionConfiguration] :
  /// Configuration for consumption of the license. Choose a provisional
  /// configuration for workloads running with continuous connectivity. Choose a
  /// borrow configuration for workloads with offline usage.
  ///
  /// Parameter [entitlements] :
  /// License entitlements.
  ///
  /// Parameter [homeRegion] :
  /// Home Region for the license.
  ///
  /// Parameter [issuer] :
  /// License issuer.
  ///
  /// Parameter [licenseName] :
  /// License name.
  ///
  /// Parameter [productName] :
  /// Product name.
  ///
  /// Parameter [productSKU] :
  /// Product SKU.
  ///
  /// Parameter [validity] :
  /// Date and time range during which the license is valid, in ISO8601-UTC
  /// format.
  ///
  /// Parameter [licenseMetadata] :
  /// Information about the license.
  Future<CreateLicenseResponse> createLicense({
    @_s.required String beneficiary,
    @_s.required String clientToken,
    @_s.required ConsumptionConfiguration consumptionConfiguration,
    @_s.required List<Entitlement> entitlements,
    @_s.required String homeRegion,
    @_s.required Issuer issuer,
    @_s.required String licenseName,
    @_s.required String productName,
    @_s.required String productSKU,
    @_s.required DatetimeRange validity,
    List<Metadata> licenseMetadata,
  }) async {
    ArgumentError.checkNotNull(beneficiary, 'beneficiary');
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    ArgumentError.checkNotNull(
        consumptionConfiguration, 'consumptionConfiguration');
    ArgumentError.checkNotNull(entitlements, 'entitlements');
    ArgumentError.checkNotNull(homeRegion, 'homeRegion');
    ArgumentError.checkNotNull(issuer, 'issuer');
    ArgumentError.checkNotNull(licenseName, 'licenseName');
    ArgumentError.checkNotNull(productName, 'productName');
    ArgumentError.checkNotNull(productSKU, 'productSKU');
    ArgumentError.checkNotNull(validity, 'validity');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CreateLicense'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Beneficiary': beneficiary,
        'ClientToken': clientToken,
        'ConsumptionConfiguration': consumptionConfiguration,
        'Entitlements': entitlements,
        'HomeRegion': homeRegion,
        'Issuer': issuer,
        'LicenseName': licenseName,
        'ProductName': productName,
        'ProductSKU': productSKU,
        'Validity': validity,
        if (licenseMetadata != null) 'LicenseMetadata': licenseMetadata,
      },
    );

    return CreateLicenseResponse.fromJson(jsonResponse.body);
  }

  /// Creates a license configuration.
  ///
  /// A license configuration is an abstraction of a customer license agreement
  /// that can be consumed and enforced by License Manager. Components include
  /// specifications for the license type (licensing by instance, socket, CPU,
  /// or vCPU), allowed tenancy (shared tenancy, Dedicated Instance, Dedicated
  /// Host, or all of these), license affinity to host (how long a license must
  /// be associated with a host), and the number of licenses purchased and used.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseCountingType] :
  /// Dimension used to track the license inventory.
  ///
  /// Parameter [name] :
  /// Name of the license configuration.
  ///
  /// Parameter [description] :
  /// Description of the license configuration.
  ///
  /// Parameter [disassociateWhenNotFound] :
  /// When true, disassociates a resource when software is uninstalled.
  ///
  /// Parameter [licenseCount] :
  /// Number of licenses managed by the license configuration.
  ///
  /// Parameter [licenseCountHardLimit] :
  /// Indicates whether hard or soft license enforcement is used. Exceeding a
  /// hard limit blocks the launch of new instances.
  ///
  /// Parameter [licenseRules] :
  /// License rules. The syntax is #name=value (for example,
  /// #allowedTenancy=EC2-DedicatedHost). The available rules vary by dimension,
  /// as follows.
  ///
  /// <ul>
  /// <li>
  /// <code>Cores</code> dimension: <code>allowedTenancy</code> |
  /// <code>licenseAffinityToHost</code> | <code>maximumCores</code> |
  /// <code>minimumCores</code>
  /// </li>
  /// <li>
  /// <code>Instances</code> dimension: <code>allowedTenancy</code> |
  /// <code>maximumCores</code> | <code>minimumCores</code> |
  /// <code>maximumSockets</code> | <code>minimumSockets</code> |
  /// <code>maximumVcpus</code> | <code>minimumVcpus</code>
  /// </li>
  /// <li>
  /// <code>Sockets</code> dimension: <code>allowedTenancy</code> |
  /// <code>licenseAffinityToHost</code> | <code>maximumSockets</code> |
  /// <code>minimumSockets</code>
  /// </li>
  /// <li>
  /// <code>vCPUs</code> dimension: <code>allowedTenancy</code> |
  /// <code>honorVcpuOptimization</code> | <code>maximumVcpus</code> |
  /// <code>minimumVcpus</code>
  /// </li>
  /// </ul>
  /// The unit for <code>licenseAffinityToHost</code> is days and the range is 1
  /// to 180. The possible values for <code>allowedTenancy</code> are
  /// <code>EC2-Default</code>, <code>EC2-DedicatedHost</code>, and
  /// <code>EC2-DedicatedInstance</code>. The possible values for
  /// <code>honorVcpuOptimization</code> are <code>True</code> and
  /// <code>False</code>.
  ///
  /// Parameter [productInformationList] :
  /// Product information.
  ///
  /// Parameter [tags] :
  /// Tags to add to the license configuration.
  Future<CreateLicenseConfigurationResponse> createLicenseConfiguration({
    @_s.required LicenseCountingType licenseCountingType,
    @_s.required String name,
    String description,
    bool disassociateWhenNotFound,
    int licenseCount,
    bool licenseCountHardLimit,
    List<String> licenseRules,
    List<ProductInformation> productInformationList,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(licenseCountingType, 'licenseCountingType');
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CreateLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseCountingType': licenseCountingType?.toValue() ?? '',
        'Name': name,
        if (description != null) 'Description': description,
        if (disassociateWhenNotFound != null)
          'DisassociateWhenNotFound': disassociateWhenNotFound,
        if (licenseCount != null) 'LicenseCount': licenseCount,
        if (licenseCountHardLimit != null)
          'LicenseCountHardLimit': licenseCountHardLimit,
        if (licenseRules != null) 'LicenseRules': licenseRules,
        if (productInformationList != null)
          'ProductInformationList': productInformationList,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLicenseConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new version of the specified license.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RedirectException].
  /// May throw [ConflictException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [consumptionConfiguration] :
  /// Configuration for consumption of the license. Choose a provisional
  /// configuration for workloads running with continuous connectivity. Choose a
  /// borrow configuration for workloads with offline usage.
  ///
  /// Parameter [entitlements] :
  /// License entitlements.
  ///
  /// Parameter [homeRegion] :
  /// Home Region of the license.
  ///
  /// Parameter [issuer] :
  /// License issuer.
  ///
  /// Parameter [licenseArn] :
  /// Amazon Resource Name (ARN) of the license.
  ///
  /// Parameter [licenseName] :
  /// License name.
  ///
  /// Parameter [productName] :
  /// Product name.
  ///
  /// Parameter [status] :
  /// License status.
  ///
  /// Parameter [validity] :
  /// Date and time range during which the license is valid, in ISO8601-UTC
  /// format.
  ///
  /// Parameter [licenseMetadata] :
  /// Information about the license.
  ///
  /// Parameter [sourceVersion] :
  /// Current version of the license.
  Future<CreateLicenseVersionResponse> createLicenseVersion({
    @_s.required String clientToken,
    @_s.required ConsumptionConfiguration consumptionConfiguration,
    @_s.required List<Entitlement> entitlements,
    @_s.required String homeRegion,
    @_s.required Issuer issuer,
    @_s.required String licenseArn,
    @_s.required String licenseName,
    @_s.required String productName,
    @_s.required LicenseStatus status,
    @_s.required DatetimeRange validity,
    List<Metadata> licenseMetadata,
    String sourceVersion,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    ArgumentError.checkNotNull(
        consumptionConfiguration, 'consumptionConfiguration');
    ArgumentError.checkNotNull(entitlements, 'entitlements');
    ArgumentError.checkNotNull(homeRegion, 'homeRegion');
    ArgumentError.checkNotNull(issuer, 'issuer');
    ArgumentError.checkNotNull(licenseArn, 'licenseArn');
    _s.validateStringLength(
      'licenseArn',
      licenseArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'licenseArn',
      licenseArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(licenseName, 'licenseName');
    ArgumentError.checkNotNull(productName, 'productName');
    ArgumentError.checkNotNull(status, 'status');
    ArgumentError.checkNotNull(validity, 'validity');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CreateLicenseVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'ConsumptionConfiguration': consumptionConfiguration,
        'Entitlements': entitlements,
        'HomeRegion': homeRegion,
        'Issuer': issuer,
        'LicenseArn': licenseArn,
        'LicenseName': licenseName,
        'ProductName': productName,
        'Status': status?.toValue() ?? '',
        'Validity': validity,
        if (licenseMetadata != null) 'LicenseMetadata': licenseMetadata,
        if (sourceVersion != null) 'SourceVersion': sourceVersion,
      },
    );

    return CreateLicenseVersionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a long-lived token.
  ///
  /// A refresh token is a JWT token used to get an access token. With an access
  /// token, you can call AssumeRoleWithWebIdentity to get role credentials that
  /// you can use to call License Manager to manage the specified license.
  ///
  /// May throw [ValidationException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RedirectException].
  ///
  /// Parameter [clientToken] :
  /// Idempotency token, valid for 10 minutes.
  ///
  /// Parameter [licenseArn] :
  /// Amazon Resource Name (ARN) of the license. The ARN is mapped to the aud
  /// claim of the JWT token.
  ///
  /// Parameter [expirationInDays] :
  /// Token expiration, in days, counted from token creation. The default is 365
  /// days.
  ///
  /// Parameter [roleArns] :
  /// Amazon Resource Name (ARN) of the IAM roles to embed in the token. License
  /// Manager does not check whether the roles are in use.
  ///
  /// Parameter [tokenProperties] :
  /// Data specified by the caller to be included in the JWT token. The data is
  /// mapped to the amr claim of the JWT token.
  Future<CreateTokenResponse> createToken({
    @_s.required String clientToken,
    @_s.required String licenseArn,
    int expirationInDays,
    List<String> roleArns,
    List<String> tokenProperties,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      60,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(licenseArn, 'licenseArn');
    _s.validateStringLength(
      'licenseArn',
      licenseArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'licenseArn',
      licenseArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CreateToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'LicenseArn': licenseArn,
        if (expirationInDays != null) 'ExpirationInDays': expirationInDays,
        if (roleArns != null) 'RoleArns': roleArns,
        if (tokenProperties != null) 'TokenProperties': tokenProperties,
      },
    );

    return CreateTokenResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified grant.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [grantArn] :
  /// Amazon Resource Name (ARN) of the grant.
  ///
  /// Parameter [version] :
  /// Current version of the grant.
  Future<DeleteGrantResponse> deleteGrant({
    @_s.required String grantArn,
    @_s.required String version,
  }) async {
    ArgumentError.checkNotNull(grantArn, 'grantArn');
    _s.validateStringLength(
      'grantArn',
      grantArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'grantArn',
      grantArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(version, 'version');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.DeleteGrant'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GrantArn': grantArn,
        'Version': version,
      },
    );

    return DeleteGrantResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified license.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [RedirectException].
  /// May throw [ConflictException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseArn] :
  /// Amazon Resource Name (ARN) of the license.
  ///
  /// Parameter [sourceVersion] :
  /// Current version of the license.
  Future<DeleteLicenseResponse> deleteLicense({
    @_s.required String licenseArn,
    @_s.required String sourceVersion,
  }) async {
    ArgumentError.checkNotNull(licenseArn, 'licenseArn');
    _s.validateStringLength(
      'licenseArn',
      licenseArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'licenseArn',
      licenseArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceVersion, 'sourceVersion');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.DeleteLicense'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseArn': licenseArn,
        'SourceVersion': sourceVersion,
      },
    );

    return DeleteLicenseResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified license configuration.
  ///
  /// You cannot delete a license configuration that is in use.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// ID of the license configuration.
  Future<void> deleteLicenseConfiguration({
    @_s.required String licenseConfigurationArn,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.DeleteLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
      },
    );

    return DeleteLicenseConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified token. Must be called in the license home Region.
  ///
  /// May throw [ValidationException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RedirectException].
  ///
  /// Parameter [tokenId] :
  /// Token ID.
  Future<void> deleteToken({
    @_s.required String tokenId,
  }) async {
    ArgumentError.checkNotNull(tokenId, 'tokenId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.DeleteToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TokenId': tokenId,
      },
    );

    return DeleteTokenResponse.fromJson(jsonResponse.body);
  }

  /// Extends the expiration date for license consumption.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [licenseConsumptionToken] :
  /// License consumption token.
  ///
  /// Parameter [dryRun] :
  /// Checks whether you have the required permissions for the action, without
  /// actually making the request. Provides an error response if you do not have
  /// the required permissions.
  Future<ExtendLicenseConsumptionResponse> extendLicenseConsumption({
    @_s.required String licenseConsumptionToken,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(
        licenseConsumptionToken, 'licenseConsumptionToken');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ExtendLicenseConsumption'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConsumptionToken': licenseConsumptionToken,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );

    return ExtendLicenseConsumptionResponse.fromJson(jsonResponse.body);
  }

  /// Gets a temporary access token to use with AssumeRoleWithWebIdentity.
  /// Access tokens are valid for one hour.
  ///
  /// May throw [ValidationException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [token] :
  /// Refresh token, encoded as a JWT token.
  ///
  /// Parameter [tokenProperties] :
  /// Token properties to validate against those present in the JWT token.
  Future<GetAccessTokenResponse> getAccessToken({
    @_s.required String token,
    List<String> tokenProperties,
  }) async {
    ArgumentError.checkNotNull(token, 'token');
    _s.validateStringLength(
      'token',
      token,
      0,
      4096,
      isRequired: true,
    );
    _s.validateStringPattern(
      'token',
      token,
      r'''\S+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.GetAccessToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Token': token,
        if (tokenProperties != null) 'TokenProperties': tokenProperties,
      },
    );

    return GetAccessTokenResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information about the specified grant.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [grantArn] :
  /// Amazon Resource Name (ARN) of the grant.
  ///
  /// Parameter [version] :
  /// Grant version.
  Future<GetGrantResponse> getGrant({
    @_s.required String grantArn,
    String version,
  }) async {
    ArgumentError.checkNotNull(grantArn, 'grantArn');
    _s.validateStringLength(
      'grantArn',
      grantArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'grantArn',
      grantArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.GetGrant'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GrantArn': grantArn,
        if (version != null) 'Version': version,
      },
    );

    return GetGrantResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information about the specified license.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [licenseArn] :
  /// Amazon Resource Name (ARN) of the license.
  ///
  /// Parameter [version] :
  /// License version.
  Future<GetLicenseResponse> getLicense({
    @_s.required String licenseArn,
    String version,
  }) async {
    ArgumentError.checkNotNull(licenseArn, 'licenseArn');
    _s.validateStringLength(
      'licenseArn',
      licenseArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'licenseArn',
      licenseArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.GetLicense'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseArn': licenseArn,
        if (version != null) 'Version': version,
      },
    );

    return GetLicenseResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information about the specified license configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  Future<GetLicenseConfigurationResponse> getLicenseConfiguration({
    @_s.required String licenseConfigurationArn,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.GetLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
      },
    );

    return GetLicenseConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information about the usage of the specified license.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [licenseArn] :
  /// Amazon Resource Name (ARN) of the license.
  Future<GetLicenseUsageResponse> getLicenseUsage({
    @_s.required String licenseArn,
  }) async {
    ArgumentError.checkNotNull(licenseArn, 'licenseArn');
    _s.validateStringLength(
      'licenseArn',
      licenseArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'licenseArn',
      licenseArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.GetLicenseUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseArn': licenseArn,
      },
    );

    return GetLicenseUsageResponse.fromJson(jsonResponse.body);
  }

  /// Gets the License Manager settings for the current Region.
  ///
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  Future<GetServiceSettingsResponse> getServiceSettings() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.GetServiceSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetServiceSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the resource associations for the specified license configuration.
  ///
  /// Resource associations need not consume licenses from a license
  /// configuration. For example, an AMI or a stopped instance might not consume
  /// a license (depending on the license rules).
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [FilterLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// Amazon Resource Name (ARN) of a license configuration.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListAssociationsForLicenseConfigurationResponse>
      listAssociationsForLicenseConfiguration({
    @_s.required String licenseConfigurationArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSLicenseManager.ListAssociationsForLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAssociationsForLicenseConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the grants distributed for the specified license.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>LicenseARN</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>PrincipalARN</code>
  /// </li>
  /// <li>
  /// <code>ParentARN</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [grantArns] :
  /// Amazon Resource Names (ARNs) of the grants.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListDistributedGrantsResponse> listDistributedGrants({
    List<Filter> filters,
    List<String> grantArns,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListDistributedGrants'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (grantArns != null) 'GrantArns': grantArns,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDistributedGrantsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the license configuration operations that failed.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// Amazon Resource Name of the license configuration.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListFailuresForLicenseConfigurationOperationsResponse>
      listFailuresForLicenseConfigurationOperations({
    @_s.required String licenseConfigurationArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSLicenseManager.ListFailuresForLicenseConfigurationOperations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFailuresForLicenseConfigurationOperationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the license configurations for your account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [FilterLimitExceededException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters and logical operators
  /// are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>licenseCountingType</code> - The dimension on which licenses are
  /// counted. Possible values are <code>vCPU</code> | <code>Instance</code> |
  /// <code>Core</code> | <code>Socket</code>. Logical operators are
  /// <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>enforceLicenseCount</code> - A Boolean value that indicates whether
  /// hard license enforcement is used. Logical operators are
  /// <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>usagelimitExceeded</code> - A Boolean value that indicates whether
  /// the available licenses have been exceeded. Logical operators are
  /// <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [licenseConfigurationArns] :
  /// Amazon Resource Names (ARN) of the license configurations.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListLicenseConfigurationsResponse> listLicenseConfigurations({
    List<Filter> filters,
    List<String> licenseConfigurationArns,
    int maxResults,
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListLicenseConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (licenseConfigurationArns != null)
          'LicenseConfigurationArns': licenseConfigurationArns,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLicenseConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Describes the license configurations for the specified resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of a resource that has an associated license
  /// configuration.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListLicenseSpecificationsForResourceResponse>
      listLicenseSpecificationsForResource({
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListLicenseSpecificationsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLicenseSpecificationsForResourceResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists all versions of the specified license.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [licenseArn] :
  /// Amazon Resource Name (ARN) of the license.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListLicenseVersionsResponse> listLicenseVersions({
    @_s.required String licenseArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(licenseArn, 'licenseArn');
    _s.validateStringLength(
      'licenseArn',
      licenseArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'licenseArn',
      licenseArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListLicenseVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseArn': licenseArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLicenseVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the licenses for your account.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>Beneficiary</code>
  /// </li>
  /// <li>
  /// <code>ProductSKU</code>
  /// </li>
  /// <li>
  /// <code>KeyFingerprint</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [licenseArns] :
  /// Amazon Resource Names (ARNs) of the licenses.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListLicensesResponse> listLicenses({
    List<Filter> filters,
    List<String> licenseArns,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListLicenses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (licenseArns != null) 'LicenseArns': licenseArns,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLicensesResponse.fromJson(jsonResponse.body);
  }

  /// Lists grants that are received but not accepted.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>LicenseARN</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [grantArns] :
  /// Amazon Resource Names (ARNs) of the grants.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListReceivedGrantsResponse> listReceivedGrants({
    List<Filter> filters,
    List<String> grantArns,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListReceivedGrants'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (grantArns != null) 'GrantArns': grantArns,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListReceivedGrantsResponse.fromJson(jsonResponse.body);
  }

  /// Lists received licenses.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>ProductSKU</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>KeyFingerprint</code>
  /// </li>
  /// <li>
  /// <code>Issuer</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [licenseArns] :
  /// Amazon Resource Names (ARNs) of the licenses.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListReceivedLicensesResponse> listReceivedLicenses({
    List<Filter> filters,
    List<String> licenseArns,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListReceivedLicenses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (licenseArns != null) 'LicenseArns': licenseArns,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListReceivedLicensesResponse.fromJson(jsonResponse.body);
  }

  /// Lists resources managed using Systems Manager inventory.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [FilterLimitExceededException].
  /// May throw [FailedDependencyException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters and logical operators
  /// are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>account_id</code> - The ID of the AWS account that owns the
  /// resource. Logical operators are <code>EQUALS</code> |
  /// <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>application_name</code> - The name of the application. Logical
  /// operators are <code>EQUALS</code> | <code>BEGINS_WITH</code>.
  /// </li>
  /// <li>
  /// <code>license_included</code> - The type of license included. Logical
  /// operators are <code>EQUALS</code> | <code>NOT_EQUALS</code>. Possible
  /// values are <code>sql-server-enterprise</code> |
  /// <code>sql-server-standard</code> | <code>sql-server-web</code> |
  /// <code>windows-server-datacenter</code>.
  /// </li>
  /// <li>
  /// <code>platform</code> - The platform of the resource. Logical operators
  /// are <code>EQUALS</code> | <code>BEGINS_WITH</code>.
  /// </li>
  /// <li>
  /// <code>resource_id</code> - The ID of the resource. Logical operators are
  /// <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>tag:&lt;key&gt;</code> - The key/value combination of a tag assigned
  /// to the resource. Logical operators are <code>EQUALS</code> (single
  /// account) or <code>EQUALS</code> | <code>NOT_EQUALS</code> (cross account).
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListResourceInventoryResponse> listResourceInventory({
    List<InventoryFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListResourceInventory'
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

    return ListResourceInventoryResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags for the specified license configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListTagsForResource'
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

  /// Lists your tokens.
  ///
  /// May throw [ValidationException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filter is supported:
  ///
  /// <ul>
  /// <li>
  /// <code>licenseArns</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  ///
  /// Parameter [tokenIds] :
  /// Token IDs.
  Future<ListTokensResponse> listTokens({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    List<String> tokenIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListTokens'
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
        if (tokenIds != null) 'TokenIds': tokenIds,
      },
    );

    return ListTokensResponse.fromJson(jsonResponse.body);
  }

  /// Lists all license usage records for a license configuration, displaying
  /// license consumption details by resource at a selected point in time. Use
  /// this action to audit the current license consumption for any license
  /// inventory and configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [FilterLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters and logical operators
  /// are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>resourceArn</code> - The ARN of the license configuration resource.
  /// Logical operators are <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>resourceType</code> - The resource type (<code>EC2_INSTANCE</code> |
  /// <code>EC2_HOST</code> | <code>EC2_AMI</code> |
  /// <code>SYSTEMS_MANAGER_MANAGED_INSTANCE</code>). Logical operators are
  /// <code>EQUALS</code> | <code>NOT_EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>resourceAccount</code> - The ID of the account that owns the
  /// resource. Logical operators are <code>EQUALS</code> |
  /// <code>NOT_EQUALS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListUsageForLicenseConfigurationResponse>
      listUsageForLicenseConfiguration({
    @_s.required String licenseConfigurationArn,
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListUsageForLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListUsageForLicenseConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Rejects the specified grant.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  ///
  /// Parameter [grantArn] :
  /// Amazon Resource Name (ARN) of the grant.
  Future<RejectGrantResponse> rejectGrant({
    @_s.required String grantArn,
  }) async {
    ArgumentError.checkNotNull(grantArn, 'grantArn');
    _s.validateStringLength(
      'grantArn',
      grantArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'grantArn',
      grantArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.RejectGrant'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GrantArn': grantArn,
      },
    );

    return RejectGrantResponse.fromJson(jsonResponse.body);
  }

  /// Adds the specified tags to the specified license configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes the specified tags from the specified license configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  ///
  /// Parameter [tagKeys] :
  /// Keys identifying the tags to remove.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the attributes of an existing license configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  /// May throw [ResourceLimitExceededException].
  ///
  /// Parameter [licenseConfigurationArn] :
  /// Amazon Resource Name (ARN) of the license configuration.
  ///
  /// Parameter [description] :
  /// New description of the license configuration.
  ///
  /// Parameter [disassociateWhenNotFound] :
  /// When true, disassociates a resource when software is uninstalled.
  ///
  /// Parameter [licenseConfigurationStatus] :
  /// New status of the license configuration.
  ///
  /// Parameter [licenseCount] :
  /// New number of licenses managed by the license configuration.
  ///
  /// Parameter [licenseCountHardLimit] :
  /// New hard limit of the number of available licenses.
  ///
  /// Parameter [licenseRules] :
  /// New license rule. The only rule that you can add after you create a
  /// license configuration is licenseAffinityToHost.
  ///
  /// Parameter [name] :
  /// New name of the license configuration.
  ///
  /// Parameter [productInformationList] :
  /// New product information.
  Future<void> updateLicenseConfiguration({
    @_s.required String licenseConfigurationArn,
    String description,
    bool disassociateWhenNotFound,
    LicenseConfigurationStatus licenseConfigurationStatus,
    int licenseCount,
    bool licenseCountHardLimit,
    List<String> licenseRules,
    String name,
    List<ProductInformation> productInformationList,
  }) async {
    ArgumentError.checkNotNull(
        licenseConfigurationArn, 'licenseConfigurationArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UpdateLicenseConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
        if (description != null) 'Description': description,
        if (disassociateWhenNotFound != null)
          'DisassociateWhenNotFound': disassociateWhenNotFound,
        if (licenseConfigurationStatus != null)
          'LicenseConfigurationStatus': licenseConfigurationStatus.toValue(),
        if (licenseCount != null) 'LicenseCount': licenseCount,
        if (licenseCountHardLimit != null)
          'LicenseCountHardLimit': licenseCountHardLimit,
        if (licenseRules != null) 'LicenseRules': licenseRules,
        if (name != null) 'Name': name,
        if (productInformationList != null)
          'ProductInformationList': productInformationList,
      },
    );

    return UpdateLicenseConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Adds or removes the specified license configurations for the specified AWS
  /// resource.
  ///
  /// You can update the license specifications of AMIs, instances, and hosts.
  /// You cannot update the license specifications for launch templates and AWS
  /// CloudFormation templates, as they send license configurations to the
  /// operation that creates the resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidResourceStateException].
  /// May throw [LicenseUsageException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the AWS resource.
  ///
  /// Parameter [addLicenseSpecifications] :
  /// ARNs of the license configurations to add.
  ///
  /// Parameter [removeLicenseSpecifications] :
  /// ARNs of the license configurations to remove.
  Future<void> updateLicenseSpecificationsForResource({
    @_s.required String resourceArn,
    List<LicenseSpecification> addLicenseSpecifications,
    List<LicenseSpecification> removeLicenseSpecifications,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UpdateLicenseSpecificationsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (addLicenseSpecifications != null)
          'AddLicenseSpecifications': addLicenseSpecifications,
        if (removeLicenseSpecifications != null)
          'RemoveLicenseSpecifications': removeLicenseSpecifications,
      },
    );

    return UpdateLicenseSpecificationsForResourceResponse.fromJson(
        jsonResponse.body);
  }

  /// Updates License Manager settings for the current Region.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [enableCrossAccountsDiscovery] :
  /// Activates cross-account discovery.
  ///
  /// Parameter [organizationConfiguration] :
  /// Enables integration with AWS Organizations for cross-account discovery.
  ///
  /// Parameter [s3BucketArn] :
  /// Amazon Resource Name (ARN) of the Amazon S3 bucket where the License
  /// Manager information is stored.
  ///
  /// Parameter [snsTopicArn] :
  /// Amazon Resource Name (ARN) of the Amazon SNS topic used for License
  /// Manager alerts.
  Future<void> updateServiceSettings({
    bool enableCrossAccountsDiscovery,
    OrganizationConfiguration organizationConfiguration,
    String s3BucketArn,
    String snsTopicArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UpdateServiceSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (enableCrossAccountsDiscovery != null)
          'EnableCrossAccountsDiscovery': enableCrossAccountsDiscovery,
        if (organizationConfiguration != null)
          'OrganizationConfiguration': organizationConfiguration,
        if (s3BucketArn != null) 'S3BucketArn': s3BucketArn,
        if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      },
    );

    return UpdateServiceSettingsResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptGrantResponse {
  /// Grant ARN.
  @_s.JsonKey(name: 'GrantArn')
  final String grantArn;

  /// Grant status.
  @_s.JsonKey(name: 'Status')
  final GrantStatus status;

  /// Grant version.
  @_s.JsonKey(name: 'Version')
  final String version;

  AcceptGrantResponse({
    this.grantArn,
    this.status,
    this.version,
  });
  factory AcceptGrantResponse.fromJson(Map<String, dynamic> json) =>
      _$AcceptGrantResponseFromJson(json);
}

enum AllowedOperation {
  @_s.JsonValue('CreateGrant')
  createGrant,
  @_s.JsonValue('CheckoutLicense')
  checkoutLicense,
  @_s.JsonValue('CheckoutBorrowLicense')
  checkoutBorrowLicense,
  @_s.JsonValue('CheckInLicense')
  checkInLicense,
  @_s.JsonValue('ExtendConsumptionLicense')
  extendConsumptionLicense,
  @_s.JsonValue('ListPurchasedLicenses')
  listPurchasedLicenses,
  @_s.JsonValue('CreateToken')
  createToken,
}

extension on AllowedOperation {
  String toValue() {
    switch (this) {
      case AllowedOperation.createGrant:
        return 'CreateGrant';
      case AllowedOperation.checkoutLicense:
        return 'CheckoutLicense';
      case AllowedOperation.checkoutBorrowLicense:
        return 'CheckoutBorrowLicense';
      case AllowedOperation.checkInLicense:
        return 'CheckInLicense';
      case AllowedOperation.extendConsumptionLicense:
        return 'ExtendConsumptionLicense';
      case AllowedOperation.listPurchasedLicenses:
        return 'ListPurchasedLicenses';
      case AllowedOperation.createToken:
        return 'CreateToken';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes automated discovery.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutomatedDiscoveryInformation {
  /// Time that automated discovery last ran.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastRunTime')
  final DateTime lastRunTime;

  AutomatedDiscoveryInformation({
    this.lastRunTime,
  });
  factory AutomatedDiscoveryInformation.fromJson(Map<String, dynamic> json) =>
      _$AutomatedDiscoveryInformationFromJson(json);
}

/// Details about a borrow configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BorrowConfiguration {
  /// Indicates whether early check-ins are allowed.
  @_s.JsonKey(name: 'AllowEarlyCheckIn')
  final bool allowEarlyCheckIn;

  /// Maximum time for the borrow configuration, in minutes.
  @_s.JsonKey(name: 'MaxTimeToLiveInMinutes')
  final int maxTimeToLiveInMinutes;

  BorrowConfiguration({
    @_s.required this.allowEarlyCheckIn,
    @_s.required this.maxTimeToLiveInMinutes,
  });
  factory BorrowConfiguration.fromJson(Map<String, dynamic> json) =>
      _$BorrowConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$BorrowConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CheckInLicenseResponse {
  CheckInLicenseResponse();
  factory CheckInLicenseResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckInLicenseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CheckoutBorrowLicenseResponse {
  /// Information about constraints.
  @_s.JsonKey(name: 'CheckoutMetadata')
  final List<Metadata> checkoutMetadata;

  /// Allowed license entitlements.
  @_s.JsonKey(name: 'EntitlementsAllowed')
  final List<EntitlementData> entitlementsAllowed;

  /// Date and time at which the license checkout expires.
  @_s.JsonKey(name: 'Expiration')
  final String expiration;

  /// Date and time at which the license checkout is issued.
  @_s.JsonKey(name: 'IssuedAt')
  final String issuedAt;

  /// Amazon Resource Name (ARN) of the license.
  @_s.JsonKey(name: 'LicenseArn')
  final String licenseArn;

  /// License consumption token.
  @_s.JsonKey(name: 'LicenseConsumptionToken')
  final String licenseConsumptionToken;

  /// Node ID.
  @_s.JsonKey(name: 'NodeId')
  final String nodeId;

  /// Signed token.
  @_s.JsonKey(name: 'SignedToken')
  final String signedToken;

  CheckoutBorrowLicenseResponse({
    this.checkoutMetadata,
    this.entitlementsAllowed,
    this.expiration,
    this.issuedAt,
    this.licenseArn,
    this.licenseConsumptionToken,
    this.nodeId,
    this.signedToken,
  });
  factory CheckoutBorrowLicenseResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutBorrowLicenseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CheckoutLicenseResponse {
  /// Checkout type.
  @_s.JsonKey(name: 'CheckoutType')
  final CheckoutType checkoutType;

  /// Allowed license entitlements.
  @_s.JsonKey(name: 'EntitlementsAllowed')
  final List<EntitlementData> entitlementsAllowed;

  /// Date and time at which the license checkout expires.
  @_s.JsonKey(name: 'Expiration')
  final String expiration;

  /// Date and time at which the license checkout is issued.
  @_s.JsonKey(name: 'IssuedAt')
  final String issuedAt;

  /// License consumption token.
  @_s.JsonKey(name: 'LicenseConsumptionToken')
  final String licenseConsumptionToken;

  /// Node ID.
  @_s.JsonKey(name: 'NodeId')
  final String nodeId;

  /// Signed token.
  @_s.JsonKey(name: 'SignedToken')
  final String signedToken;

  CheckoutLicenseResponse({
    this.checkoutType,
    this.entitlementsAllowed,
    this.expiration,
    this.issuedAt,
    this.licenseConsumptionToken,
    this.nodeId,
    this.signedToken,
  });
  factory CheckoutLicenseResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutLicenseResponseFromJson(json);
}

enum CheckoutType {
  @_s.JsonValue('PROVISIONAL')
  provisional,
}

extension on CheckoutType {
  String toValue() {
    switch (this) {
      case CheckoutType.provisional:
        return 'PROVISIONAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details about license consumption.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConsumedLicenseSummary {
  /// Number of licenses consumed by the resource.
  @_s.JsonKey(name: 'ConsumedLicenses')
  final int consumedLicenses;

  /// Resource type of the resource consuming a license.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  ConsumedLicenseSummary({
    this.consumedLicenses,
    this.resourceType,
  });
  factory ConsumedLicenseSummary.fromJson(Map<String, dynamic> json) =>
      _$ConsumedLicenseSummaryFromJson(json);
}

/// Details about a consumption configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConsumptionConfiguration {
  /// Details about a borrow configuration.
  @_s.JsonKey(name: 'BorrowConfiguration')
  final BorrowConfiguration borrowConfiguration;

  /// Details about a provisional configuration.
  @_s.JsonKey(name: 'ProvisionalConfiguration')
  final ProvisionalConfiguration provisionalConfiguration;

  /// Renewal frequency.
  @_s.JsonKey(name: 'RenewType')
  final RenewType renewType;

  ConsumptionConfiguration({
    this.borrowConfiguration,
    this.provisionalConfiguration,
    this.renewType,
  });
  factory ConsumptionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConsumptionConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGrantResponse {
  /// Grant ARN.
  @_s.JsonKey(name: 'GrantArn')
  final String grantArn;

  /// Grant status.
  @_s.JsonKey(name: 'Status')
  final GrantStatus status;

  /// Grant version.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateGrantResponse({
    this.grantArn,
    this.status,
    this.version,
  });
  factory CreateGrantResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGrantResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGrantVersionResponse {
  /// Grant ARN.
  @_s.JsonKey(name: 'GrantArn')
  final String grantArn;

  /// Grant status.
  @_s.JsonKey(name: 'Status')
  final GrantStatus status;

  /// New version of the grant.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateGrantVersionResponse({
    this.grantArn,
    this.status,
    this.version,
  });
  factory CreateGrantVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGrantVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLicenseConfigurationResponse {
  /// Amazon Resource Name (ARN) of the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationArn')
  final String licenseConfigurationArn;

  CreateLicenseConfigurationResponse({
    this.licenseConfigurationArn,
  });
  factory CreateLicenseConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateLicenseConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLicenseResponse {
  /// Amazon Resource Name (ARN) of the license.
  @_s.JsonKey(name: 'LicenseArn')
  final String licenseArn;

  /// License status.
  @_s.JsonKey(name: 'Status')
  final LicenseStatus status;

  /// License version.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateLicenseResponse({
    this.licenseArn,
    this.status,
    this.version,
  });
  factory CreateLicenseResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLicenseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLicenseVersionResponse {
  /// License ARN.
  @_s.JsonKey(name: 'LicenseArn')
  final String licenseArn;

  /// License status.
  @_s.JsonKey(name: 'Status')
  final LicenseStatus status;

  /// New version of the license.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateLicenseVersionResponse({
    this.licenseArn,
    this.status,
    this.version,
  });
  factory CreateLicenseVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLicenseVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTokenResponse {
  /// Refresh token, encoded as a JWT token.
  @_s.JsonKey(name: 'Token')
  final String token;

  /// Token ID.
  @_s.JsonKey(name: 'TokenId')
  final String tokenId;

  /// Token type.
  @_s.JsonKey(name: 'TokenType')
  final TokenType tokenType;

  CreateTokenResponse({
    this.token,
    this.tokenId,
    this.tokenType,
  });
  factory CreateTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTokenResponseFromJson(json);
}

/// Describes a time range, in ISO8601-UTC format.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatetimeRange {
  /// Start of the time range.
  @_s.JsonKey(name: 'Begin')
  final String begin;

  /// End of the time range.
  @_s.JsonKey(name: 'End')
  final String end;

  DatetimeRange({
    @_s.required this.begin,
    this.end,
  });
  factory DatetimeRange.fromJson(Map<String, dynamic> json) =>
      _$DatetimeRangeFromJson(json);

  Map<String, dynamic> toJson() => _$DatetimeRangeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGrantResponse {
  /// Grant ARN.
  @_s.JsonKey(name: 'GrantArn')
  final String grantArn;

  /// Grant status.
  @_s.JsonKey(name: 'Status')
  final GrantStatus status;

  /// Grant version.
  @_s.JsonKey(name: 'Version')
  final String version;

  DeleteGrantResponse({
    this.grantArn,
    this.status,
    this.version,
  });
  factory DeleteGrantResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteGrantResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLicenseConfigurationResponse {
  DeleteLicenseConfigurationResponse();
  factory DeleteLicenseConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteLicenseConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLicenseResponse {
  /// Date on which the license is deleted.
  @_s.JsonKey(name: 'DeletionDate')
  final String deletionDate;

  /// License status.
  @_s.JsonKey(name: 'Status')
  final LicenseDeletionStatus status;

  DeleteLicenseResponse({
    this.deletionDate,
    this.status,
  });
  factory DeleteLicenseResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteLicenseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTokenResponse {
  DeleteTokenResponse();
  factory DeleteTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTokenResponseFromJson(json);
}

enum DigitalSignatureMethod {
  @_s.JsonValue('JWT_PS384')
  jwtPs384,
}

extension on DigitalSignatureMethod {
  String toValue() {
    switch (this) {
      case DigitalSignatureMethod.jwtPs384:
        return 'JWT_PS384';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a resource entitled for use with a license.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Entitlement {
  /// Entitlement name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Entitlement unit.
  @_s.JsonKey(name: 'Unit')
  final EntitlementUnit unit;

  /// Indicates whether check-ins are allowed.
  @_s.JsonKey(name: 'AllowCheckIn')
  final bool allowCheckIn;

  /// Maximum entitlement count. Use if the unit is not None.
  @_s.JsonKey(name: 'MaxCount')
  final int maxCount;

  /// Indicates whether overages are allowed.
  @_s.JsonKey(name: 'Overage')
  final bool overage;

  /// Entitlement resource. Use only if the unit is None.
  @_s.JsonKey(name: 'Value')
  final String value;

  Entitlement({
    @_s.required this.name,
    @_s.required this.unit,
    this.allowCheckIn,
    this.maxCount,
    this.overage,
    this.value,
  });
  factory Entitlement.fromJson(Map<String, dynamic> json) =>
      _$EntitlementFromJson(json);

  Map<String, dynamic> toJson() => _$EntitlementToJson(this);
}

/// Data associated with an entitlement resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EntitlementData {
  /// Entitlement data name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Entitlement data unit.
  @_s.JsonKey(name: 'Unit')
  final EntitlementDataUnit unit;

  /// Entitlement data value.
  @_s.JsonKey(name: 'Value')
  final String value;

  EntitlementData({
    @_s.required this.name,
    @_s.required this.unit,
    this.value,
  });
  factory EntitlementData.fromJson(Map<String, dynamic> json) =>
      _$EntitlementDataFromJson(json);

  Map<String, dynamic> toJson() => _$EntitlementDataToJson(this);
}

enum EntitlementDataUnit {
  @_s.JsonValue('Count')
  count,
  @_s.JsonValue('None')
  none,
  @_s.JsonValue('Seconds')
  seconds,
  @_s.JsonValue('Microseconds')
  microseconds,
  @_s.JsonValue('Milliseconds')
  milliseconds,
  @_s.JsonValue('Bytes')
  bytes,
  @_s.JsonValue('Kilobytes')
  kilobytes,
  @_s.JsonValue('Megabytes')
  megabytes,
  @_s.JsonValue('Gigabytes')
  gigabytes,
  @_s.JsonValue('Terabytes')
  terabytes,
  @_s.JsonValue('Bits')
  bits,
  @_s.JsonValue('Kilobits')
  kilobits,
  @_s.JsonValue('Megabits')
  megabits,
  @_s.JsonValue('Gigabits')
  gigabits,
  @_s.JsonValue('Terabits')
  terabits,
  @_s.JsonValue('Percent')
  percent,
  @_s.JsonValue('Bytes/Second')
  bytesSecond,
  @_s.JsonValue('Kilobytes/Second')
  kilobytesSecond,
  @_s.JsonValue('Megabytes/Second')
  megabytesSecond,
  @_s.JsonValue('Gigabytes/Second')
  gigabytesSecond,
  @_s.JsonValue('Terabytes/Second')
  terabytesSecond,
  @_s.JsonValue('Bits/Second')
  bitsSecond,
  @_s.JsonValue('Kilobits/Second')
  kilobitsSecond,
  @_s.JsonValue('Megabits/Second')
  megabitsSecond,
  @_s.JsonValue('Gigabits/Second')
  gigabitsSecond,
  @_s.JsonValue('Terabits/Second')
  terabitsSecond,
  @_s.JsonValue('Count/Second')
  countSecond,
}

enum EntitlementUnit {
  @_s.JsonValue('Count')
  count,
  @_s.JsonValue('None')
  none,
  @_s.JsonValue('Seconds')
  seconds,
  @_s.JsonValue('Microseconds')
  microseconds,
  @_s.JsonValue('Milliseconds')
  milliseconds,
  @_s.JsonValue('Bytes')
  bytes,
  @_s.JsonValue('Kilobytes')
  kilobytes,
  @_s.JsonValue('Megabytes')
  megabytes,
  @_s.JsonValue('Gigabytes')
  gigabytes,
  @_s.JsonValue('Terabytes')
  terabytes,
  @_s.JsonValue('Bits')
  bits,
  @_s.JsonValue('Kilobits')
  kilobits,
  @_s.JsonValue('Megabits')
  megabits,
  @_s.JsonValue('Gigabits')
  gigabits,
  @_s.JsonValue('Terabits')
  terabits,
  @_s.JsonValue('Percent')
  percent,
  @_s.JsonValue('Bytes/Second')
  bytesSecond,
  @_s.JsonValue('Kilobytes/Second')
  kilobytesSecond,
  @_s.JsonValue('Megabytes/Second')
  megabytesSecond,
  @_s.JsonValue('Gigabytes/Second')
  gigabytesSecond,
  @_s.JsonValue('Terabytes/Second')
  terabytesSecond,
  @_s.JsonValue('Bits/Second')
  bitsSecond,
  @_s.JsonValue('Kilobits/Second')
  kilobitsSecond,
  @_s.JsonValue('Megabits/Second')
  megabitsSecond,
  @_s.JsonValue('Gigabits/Second')
  gigabitsSecond,
  @_s.JsonValue('Terabits/Second')
  terabitsSecond,
  @_s.JsonValue('Count/Second')
  countSecond,
}

/// Usage associated with an entitlement resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EntitlementUsage {
  /// Resource usage consumed.
  @_s.JsonKey(name: 'ConsumedValue')
  final String consumedValue;

  /// Entitlement usage name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Entitlement usage unit.
  @_s.JsonKey(name: 'Unit')
  final EntitlementDataUnit unit;

  /// Maximum entitlement usage count.
  @_s.JsonKey(name: 'MaxCount')
  final String maxCount;

  EntitlementUsage({
    @_s.required this.consumedValue,
    @_s.required this.name,
    @_s.required this.unit,
    this.maxCount,
  });
  factory EntitlementUsage.fromJson(Map<String, dynamic> json) =>
      _$EntitlementUsageFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExtendLicenseConsumptionResponse {
  /// Date and time at which the license consumption expires.
  @_s.JsonKey(name: 'Expiration')
  final String expiration;

  /// License consumption token.
  @_s.JsonKey(name: 'LicenseConsumptionToken')
  final String licenseConsumptionToken;

  ExtendLicenseConsumptionResponse({
    this.expiration,
    this.licenseConsumptionToken,
  });
  factory ExtendLicenseConsumptionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ExtendLicenseConsumptionResponseFromJson(json);
}

/// A filter name and value pair that is used to return more specific results
/// from a describe operation. Filters can be used to match a set of resources
/// by specific criteria, such as tags, attributes, or IDs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// Name of the filter. Filter names are case-sensitive.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Filter values. Filter values are case-sensitive.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAccessTokenResponse {
  /// Temporary access token.
  @_s.JsonKey(name: 'AccessToken')
  final String accessToken;

  GetAccessTokenResponse({
    this.accessToken,
  });
  factory GetAccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccessTokenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGrantResponse {
  /// Grant details.
  @_s.JsonKey(name: 'Grant')
  final Grant grant;

  GetGrantResponse({
    this.grant,
  });
  factory GetGrantResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGrantResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLicenseConfigurationResponse {
  /// Automated discovery information.
  @_s.JsonKey(name: 'AutomatedDiscoveryInformation')
  final AutomatedDiscoveryInformation automatedDiscoveryInformation;

  /// Summaries of the licenses consumed by resources.
  @_s.JsonKey(name: 'ConsumedLicenseSummaryList')
  final List<ConsumedLicenseSummary> consumedLicenseSummaryList;

  /// Number of licenses assigned to resources.
  @_s.JsonKey(name: 'ConsumedLicenses')
  final int consumedLicenses;

  /// Description of the license configuration.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// When true, disassociates a resource when software is uninstalled.
  @_s.JsonKey(name: 'DisassociateWhenNotFound')
  final bool disassociateWhenNotFound;

  /// Amazon Resource Name (ARN) of the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationArn')
  final String licenseConfigurationArn;

  /// Unique ID for the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationId')
  final String licenseConfigurationId;

  /// Number of available licenses.
  @_s.JsonKey(name: 'LicenseCount')
  final int licenseCount;

  /// Sets the number of available licenses as a hard limit.
  @_s.JsonKey(name: 'LicenseCountHardLimit')
  final bool licenseCountHardLimit;

  /// Dimension on which the licenses are counted.
  @_s.JsonKey(name: 'LicenseCountingType')
  final LicenseCountingType licenseCountingType;

  /// License rules.
  @_s.JsonKey(name: 'LicenseRules')
  final List<String> licenseRules;

  /// Summaries of the managed resources.
  @_s.JsonKey(name: 'ManagedResourceSummaryList')
  final List<ManagedResourceSummary> managedResourceSummaryList;

  /// Name of the license configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Account ID of the owner of the license configuration.
  @_s.JsonKey(name: 'OwnerAccountId')
  final String ownerAccountId;

  /// Product information.
  @_s.JsonKey(name: 'ProductInformationList')
  final List<ProductInformation> productInformationList;

  /// License configuration status.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// Tags for the license configuration.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  GetLicenseConfigurationResponse({
    this.automatedDiscoveryInformation,
    this.consumedLicenseSummaryList,
    this.consumedLicenses,
    this.description,
    this.disassociateWhenNotFound,
    this.licenseConfigurationArn,
    this.licenseConfigurationId,
    this.licenseCount,
    this.licenseCountHardLimit,
    this.licenseCountingType,
    this.licenseRules,
    this.managedResourceSummaryList,
    this.name,
    this.ownerAccountId,
    this.productInformationList,
    this.status,
    this.tags,
  });
  factory GetLicenseConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLicenseConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLicenseResponse {
  /// License details.
  @_s.JsonKey(name: 'License')
  final License license;

  GetLicenseResponse({
    this.license,
  });
  factory GetLicenseResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLicenseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLicenseUsageResponse {
  /// License usage details.
  @_s.JsonKey(name: 'LicenseUsage')
  final LicenseUsage licenseUsage;

  GetLicenseUsageResponse({
    this.licenseUsage,
  });
  factory GetLicenseUsageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLicenseUsageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServiceSettingsResponse {
  /// Indicates whether cross-account discovery is enabled.
  @_s.JsonKey(name: 'EnableCrossAccountsDiscovery')
  final bool enableCrossAccountsDiscovery;

  /// Amazon Resource Name (ARN) of the AWS resource share. The License Manager
  /// master account will provide member accounts with access to this share.
  @_s.JsonKey(name: 'LicenseManagerResourceShareArn')
  final String licenseManagerResourceShareArn;

  /// Indicates whether AWS Organizations is integrated with License Manager for
  /// cross-account discovery.
  @_s.JsonKey(name: 'OrganizationConfiguration')
  final OrganizationConfiguration organizationConfiguration;

  /// Regional S3 bucket path for storing reports, license trail event data,
  /// discovery data, and so on.
  @_s.JsonKey(name: 'S3BucketArn')
  final String s3BucketArn;

  /// SNS topic configured to receive notifications from License Manager.
  @_s.JsonKey(name: 'SnsTopicArn')
  final String snsTopicArn;

  GetServiceSettingsResponse({
    this.enableCrossAccountsDiscovery,
    this.licenseManagerResourceShareArn,
    this.organizationConfiguration,
    this.s3BucketArn,
    this.snsTopicArn,
  });
  factory GetServiceSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServiceSettingsResponseFromJson(json);
}

/// Describes a grant.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Grant {
  /// Amazon Resource Name (ARN) of the grant.
  @_s.JsonKey(name: 'GrantArn')
  final String grantArn;

  /// Grant name.
  @_s.JsonKey(name: 'GrantName')
  final String grantName;

  /// Grant status.
  @_s.JsonKey(name: 'GrantStatus')
  final GrantStatus grantStatus;

  /// Granted operations.
  @_s.JsonKey(name: 'GrantedOperations')
  final List<AllowedOperation> grantedOperations;

  /// The grantee principal ARN.
  @_s.JsonKey(name: 'GranteePrincipalArn')
  final String granteePrincipalArn;

  /// Home Region of the grant.
  @_s.JsonKey(name: 'HomeRegion')
  final String homeRegion;

  /// License ARN.
  @_s.JsonKey(name: 'LicenseArn')
  final String licenseArn;

  /// Parent ARN.
  @_s.JsonKey(name: 'ParentArn')
  final String parentArn;

  /// Grant version.
  @_s.JsonKey(name: 'Version')
  final String version;

  /// Grant status reason.
  @_s.JsonKey(name: 'StatusReason')
  final String statusReason;

  Grant({
    @_s.required this.grantArn,
    @_s.required this.grantName,
    @_s.required this.grantStatus,
    @_s.required this.grantedOperations,
    @_s.required this.granteePrincipalArn,
    @_s.required this.homeRegion,
    @_s.required this.licenseArn,
    @_s.required this.parentArn,
    @_s.required this.version,
    this.statusReason,
  });
  factory Grant.fromJson(Map<String, dynamic> json) => _$GrantFromJson(json);
}

enum GrantStatus {
  @_s.JsonValue('PENDING_WORKFLOW')
  pendingWorkflow,
  @_s.JsonValue('PENDING_ACCEPT')
  pendingAccept,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('FAILED_WORKFLOW')
  failedWorkflow,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('PENDING_DELETE')
  pendingDelete,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on GrantStatus {
  String toValue() {
    switch (this) {
      case GrantStatus.pendingWorkflow:
        return 'PENDING_WORKFLOW';
      case GrantStatus.pendingAccept:
        return 'PENDING_ACCEPT';
      case GrantStatus.rejected:
        return 'REJECTED';
      case GrantStatus.active:
        return 'ACTIVE';
      case GrantStatus.failedWorkflow:
        return 'FAILED_WORKFLOW';
      case GrantStatus.deleted:
        return 'DELETED';
      case GrantStatus.pendingDelete:
        return 'PENDING_DELETE';
      case GrantStatus.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a license that is granted to a grantee.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GrantedLicense {
  /// Granted license beneficiary.
  @_s.JsonKey(name: 'Beneficiary')
  final String beneficiary;

  /// Configuration for consumption of the license.
  @_s.JsonKey(name: 'ConsumptionConfiguration')
  final ConsumptionConfiguration consumptionConfiguration;

  /// Creation time of the granted license.
  @_s.JsonKey(name: 'CreateTime')
  final String createTime;

  /// License entitlements.
  @_s.JsonKey(name: 'Entitlements')
  final List<Entitlement> entitlements;

  /// Home Region of the granted license.
  @_s.JsonKey(name: 'HomeRegion')
  final String homeRegion;

  /// Granted license issuer.
  @_s.JsonKey(name: 'Issuer')
  final IssuerDetails issuer;

  /// Amazon Resource Name (ARN) of the license.
  @_s.JsonKey(name: 'LicenseArn')
  final String licenseArn;

  /// Granted license metadata.
  @_s.JsonKey(name: 'LicenseMetadata')
  final List<Metadata> licenseMetadata;

  /// License name.
  @_s.JsonKey(name: 'LicenseName')
  final String licenseName;

  /// Product name.
  @_s.JsonKey(name: 'ProductName')
  final String productName;

  /// Product SKU.
  @_s.JsonKey(name: 'ProductSKU')
  final String productSKU;

  /// Granted license received metadata.
  @_s.JsonKey(name: 'ReceivedMetadata')
  final ReceivedMetadata receivedMetadata;

  /// Granted license status.
  @_s.JsonKey(name: 'Status')
  final LicenseStatus status;

  /// Date and time range during which the granted license is valid, in
  /// ISO8601-UTC format.
  @_s.JsonKey(name: 'Validity')
  final DatetimeRange validity;

  /// Version of the granted license.
  @_s.JsonKey(name: 'Version')
  final String version;

  GrantedLicense({
    this.beneficiary,
    this.consumptionConfiguration,
    this.createTime,
    this.entitlements,
    this.homeRegion,
    this.issuer,
    this.licenseArn,
    this.licenseMetadata,
    this.licenseName,
    this.productName,
    this.productSKU,
    this.receivedMetadata,
    this.status,
    this.validity,
    this.version,
  });
  factory GrantedLicense.fromJson(Map<String, dynamic> json) =>
      _$GrantedLicenseFromJson(json);
}

/// An inventory filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InventoryFilter {
  /// Condition of the filter.
  @_s.JsonKey(name: 'Condition')
  final InventoryFilterCondition condition;

  /// Name of the filter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Value of the filter.
  @_s.JsonKey(name: 'Value')
  final String value;

  InventoryFilter({
    @_s.required this.condition,
    @_s.required this.name,
    this.value,
  });
  Map<String, dynamic> toJson() => _$InventoryFilterToJson(this);
}

enum InventoryFilterCondition {
  @_s.JsonValue('EQUALS')
  equals,
  @_s.JsonValue('NOT_EQUALS')
  notEquals,
  @_s.JsonValue('BEGINS_WITH')
  beginsWith,
  @_s.JsonValue('CONTAINS')
  contains,
}

/// Details about the issuer of a license.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Issuer {
  /// Issuer name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Asymmetric CMK from AWS Key Management Service. The CMK must have a key
  /// usage of sign and verify, and support the RSASSA-PSS SHA-256 signing
  /// algorithm.
  @_s.JsonKey(name: 'SignKey')
  final String signKey;

  Issuer({
    @_s.required this.name,
    this.signKey,
  });
  Map<String, dynamic> toJson() => _$IssuerToJson(this);
}

/// Details associated with the issuer of a license.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IssuerDetails {
  /// Issuer key fingerprint.
  @_s.JsonKey(name: 'KeyFingerprint')
  final String keyFingerprint;

  /// Issuer name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Asymmetric CMK from AWS Key Management Service. The CMK must have a key
  /// usage of sign and verify, and support the RSASSA-PSS SHA-256 signing
  /// algorithm.
  @_s.JsonKey(name: 'SignKey')
  final String signKey;

  IssuerDetails({
    this.keyFingerprint,
    this.name,
    this.signKey,
  });
  factory IssuerDetails.fromJson(Map<String, dynamic> json) =>
      _$IssuerDetailsFromJson(json);
}

/// Software license that is managed in AWS License Manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class License {
  /// License beneficiary.
  @_s.JsonKey(name: 'Beneficiary')
  final String beneficiary;

  /// Configuration for consumption of the license.
  @_s.JsonKey(name: 'ConsumptionConfiguration')
  final ConsumptionConfiguration consumptionConfiguration;

  /// License creation time.
  @_s.JsonKey(name: 'CreateTime')
  final String createTime;

  /// License entitlements.
  @_s.JsonKey(name: 'Entitlements')
  final List<Entitlement> entitlements;

  /// Home Region of the license.
  @_s.JsonKey(name: 'HomeRegion')
  final String homeRegion;

  /// License issuer.
  @_s.JsonKey(name: 'Issuer')
  final IssuerDetails issuer;

  /// Amazon Resource Name (ARN) of the license.
  @_s.JsonKey(name: 'LicenseArn')
  final String licenseArn;

  /// License metadata.
  @_s.JsonKey(name: 'LicenseMetadata')
  final List<Metadata> licenseMetadata;

  /// License name.
  @_s.JsonKey(name: 'LicenseName')
  final String licenseName;

  /// Product name.
  @_s.JsonKey(name: 'ProductName')
  final String productName;

  /// Product SKU.
  @_s.JsonKey(name: 'ProductSKU')
  final String productSKU;

  /// License status.
  @_s.JsonKey(name: 'Status')
  final LicenseStatus status;

  /// Date and time range during which the license is valid, in ISO8601-UTC
  /// format.
  @_s.JsonKey(name: 'Validity')
  final DatetimeRange validity;

  /// License version.
  @_s.JsonKey(name: 'Version')
  final String version;

  License({
    this.beneficiary,
    this.consumptionConfiguration,
    this.createTime,
    this.entitlements,
    this.homeRegion,
    this.issuer,
    this.licenseArn,
    this.licenseMetadata,
    this.licenseName,
    this.productName,
    this.productSKU,
    this.status,
    this.validity,
    this.version,
  });
  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);
}

/// A license configuration is an abstraction of a customer license agreement
/// that can be consumed and enforced by License Manager. Components include
/// specifications for the license type (licensing by instance, socket, CPU, or
/// vCPU), allowed tenancy (shared tenancy, Dedicated Instance, Dedicated Host,
/// or all of these), host affinity (how long a VM must be associated with a
/// host), and the number of licenses purchased and used.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LicenseConfiguration {
  /// Automated discovery information.
  @_s.JsonKey(name: 'AutomatedDiscoveryInformation')
  final AutomatedDiscoveryInformation automatedDiscoveryInformation;

  /// Summaries for licenses consumed by various resources.
  @_s.JsonKey(name: 'ConsumedLicenseSummaryList')
  final List<ConsumedLicenseSummary> consumedLicenseSummaryList;

  /// Number of licenses consumed.
  @_s.JsonKey(name: 'ConsumedLicenses')
  final int consumedLicenses;

  /// Description of the license configuration.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// When true, disassociates a resource when software is uninstalled.
  @_s.JsonKey(name: 'DisassociateWhenNotFound')
  final bool disassociateWhenNotFound;

  /// Amazon Resource Name (ARN) of the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationArn')
  final String licenseConfigurationArn;

  /// Unique ID of the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationId')
  final String licenseConfigurationId;

  /// Number of licenses managed by the license configuration.
  @_s.JsonKey(name: 'LicenseCount')
  final int licenseCount;

  /// Number of available licenses as a hard limit.
  @_s.JsonKey(name: 'LicenseCountHardLimit')
  final bool licenseCountHardLimit;

  /// Dimension to use to track the license inventory.
  @_s.JsonKey(name: 'LicenseCountingType')
  final LicenseCountingType licenseCountingType;

  /// License rules.
  @_s.JsonKey(name: 'LicenseRules')
  final List<String> licenseRules;

  /// Summaries for managed resources.
  @_s.JsonKey(name: 'ManagedResourceSummaryList')
  final List<ManagedResourceSummary> managedResourceSummaryList;

  /// Name of the license configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Account ID of the license configuration's owner.
  @_s.JsonKey(name: 'OwnerAccountId')
  final String ownerAccountId;

  /// Product information.
  @_s.JsonKey(name: 'ProductInformationList')
  final List<ProductInformation> productInformationList;

  /// Status of the license configuration.
  @_s.JsonKey(name: 'Status')
  final String status;

  LicenseConfiguration({
    this.automatedDiscoveryInformation,
    this.consumedLicenseSummaryList,
    this.consumedLicenses,
    this.description,
    this.disassociateWhenNotFound,
    this.licenseConfigurationArn,
    this.licenseConfigurationId,
    this.licenseCount,
    this.licenseCountHardLimit,
    this.licenseCountingType,
    this.licenseRules,
    this.managedResourceSummaryList,
    this.name,
    this.ownerAccountId,
    this.productInformationList,
    this.status,
  });
  factory LicenseConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LicenseConfigurationFromJson(json);
}

/// Describes an association with a license configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LicenseConfigurationAssociation {
  /// Scope of AMI associations. The possible value is <code>cross-account</code>.
  @_s.JsonKey(name: 'AmiAssociationScope')
  final String amiAssociationScope;

  /// Time when the license configuration was associated with the resource.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'AssociationTime')
  final DateTime associationTime;

  /// Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// ID of the AWS account that owns the resource consuming licenses.
  @_s.JsonKey(name: 'ResourceOwnerId')
  final String resourceOwnerId;

  /// Type of server resource.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  LicenseConfigurationAssociation({
    this.amiAssociationScope,
    this.associationTime,
    this.resourceArn,
    this.resourceOwnerId,
    this.resourceType,
  });
  factory LicenseConfigurationAssociation.fromJson(Map<String, dynamic> json) =>
      _$LicenseConfigurationAssociationFromJson(json);
}

enum LicenseConfigurationStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on LicenseConfigurationStatus {
  String toValue() {
    switch (this) {
      case LicenseConfigurationStatus.available:
        return 'AVAILABLE';
      case LicenseConfigurationStatus.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details about the usage of a resource associated with a license
/// configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LicenseConfigurationUsage {
  /// Time when the license configuration was initially associated with the
  /// resource.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'AssociationTime')
  final DateTime associationTime;

  /// Number of licenses consumed by the resource.
  @_s.JsonKey(name: 'ConsumedLicenses')
  final int consumedLicenses;

  /// Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// ID of the account that owns the resource.
  @_s.JsonKey(name: 'ResourceOwnerId')
  final String resourceOwnerId;

  /// Status of the resource.
  @_s.JsonKey(name: 'ResourceStatus')
  final String resourceStatus;

  /// Type of resource.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  LicenseConfigurationUsage({
    this.associationTime,
    this.consumedLicenses,
    this.resourceArn,
    this.resourceOwnerId,
    this.resourceStatus,
    this.resourceType,
  });
  factory LicenseConfigurationUsage.fromJson(Map<String, dynamic> json) =>
      _$LicenseConfigurationUsageFromJson(json);
}

enum LicenseCountingType {
  @_s.JsonValue('vCPU')
  vcpu,
  @_s.JsonValue('Instance')
  instance,
  @_s.JsonValue('Core')
  core,
  @_s.JsonValue('Socket')
  socket,
}

extension on LicenseCountingType {
  String toValue() {
    switch (this) {
      case LicenseCountingType.vcpu:
        return 'vCPU';
      case LicenseCountingType.instance:
        return 'Instance';
      case LicenseCountingType.core:
        return 'Core';
      case LicenseCountingType.socket:
        return 'Socket';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum LicenseDeletionStatus {
  @_s.JsonValue('PENDING_DELETE')
  pendingDelete,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Describes the failure of a license operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LicenseOperationFailure {
  /// Error message.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// Failure time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FailureTime')
  final DateTime failureTime;

  /// Reserved.
  @_s.JsonKey(name: 'MetadataList')
  final List<Metadata> metadataList;

  /// Name of the operation.
  @_s.JsonKey(name: 'OperationName')
  final String operationName;

  /// The requester is "License Manager Automated Discovery".
  @_s.JsonKey(name: 'OperationRequestedBy')
  final String operationRequestedBy;

  /// Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// ID of the AWS account that owns the resource.
  @_s.JsonKey(name: 'ResourceOwnerId')
  final String resourceOwnerId;

  /// Resource type.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  LicenseOperationFailure({
    this.errorMessage,
    this.failureTime,
    this.metadataList,
    this.operationName,
    this.operationRequestedBy,
    this.resourceArn,
    this.resourceOwnerId,
    this.resourceType,
  });
  factory LicenseOperationFailure.fromJson(Map<String, dynamic> json) =>
      _$LicenseOperationFailureFromJson(json);
}

/// Details for associating a license configuration with a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LicenseSpecification {
  /// Amazon Resource Name (ARN) of the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationArn')
  final String licenseConfigurationArn;

  /// Scope of AMI associations. The possible value is <code>cross-account</code>.
  @_s.JsonKey(name: 'AmiAssociationScope')
  final String amiAssociationScope;

  LicenseSpecification({
    @_s.required this.licenseConfigurationArn,
    this.amiAssociationScope,
  });
  factory LicenseSpecification.fromJson(Map<String, dynamic> json) =>
      _$LicenseSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseSpecificationToJson(this);
}

enum LicenseStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('PENDING_AVAILABLE')
  pendingAvailable,
  @_s.JsonValue('DEACTIVATED')
  deactivated,
  @_s.JsonValue('SUSPENDED')
  suspended,
  @_s.JsonValue('EXPIRED')
  expired,
  @_s.JsonValue('PENDING_DELETE')
  pendingDelete,
  @_s.JsonValue('DELETED')
  deleted,
}

extension on LicenseStatus {
  String toValue() {
    switch (this) {
      case LicenseStatus.available:
        return 'AVAILABLE';
      case LicenseStatus.pendingAvailable:
        return 'PENDING_AVAILABLE';
      case LicenseStatus.deactivated:
        return 'DEACTIVATED';
      case LicenseStatus.suspended:
        return 'SUSPENDED';
      case LicenseStatus.expired:
        return 'EXPIRED';
      case LicenseStatus.pendingDelete:
        return 'PENDING_DELETE';
      case LicenseStatus.deleted:
        return 'DELETED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the entitlement usage associated with a license.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LicenseUsage {
  /// License entitlement usages.
  @_s.JsonKey(name: 'EntitlementUsages')
  final List<EntitlementUsage> entitlementUsages;

  LicenseUsage({
    this.entitlementUsages,
  });
  factory LicenseUsage.fromJson(Map<String, dynamic> json) =>
      _$LicenseUsageFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssociationsForLicenseConfigurationResponse {
  /// Information about the associations for the license configuration.
  @_s.JsonKey(name: 'LicenseConfigurationAssociations')
  final List<LicenseConfigurationAssociation> licenseConfigurationAssociations;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAssociationsForLicenseConfigurationResponse({
    this.licenseConfigurationAssociations,
    this.nextToken,
  });
  factory ListAssociationsForLicenseConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAssociationsForLicenseConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDistributedGrantsResponse {
  /// Distributed grant details.
  @_s.JsonKey(name: 'Grants')
  final List<Grant> grants;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDistributedGrantsResponse({
    this.grants,
    this.nextToken,
  });
  factory ListDistributedGrantsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDistributedGrantsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFailuresForLicenseConfigurationOperationsResponse {
  /// License configuration operations that failed.
  @_s.JsonKey(name: 'LicenseOperationFailureList')
  final List<LicenseOperationFailure> licenseOperationFailureList;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFailuresForLicenseConfigurationOperationsResponse({
    this.licenseOperationFailureList,
    this.nextToken,
  });
  factory ListFailuresForLicenseConfigurationOperationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListFailuresForLicenseConfigurationOperationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLicenseConfigurationsResponse {
  /// Information about the license configurations.
  @_s.JsonKey(name: 'LicenseConfigurations')
  final List<LicenseConfiguration> licenseConfigurations;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLicenseConfigurationsResponse({
    this.licenseConfigurations,
    this.nextToken,
  });
  factory ListLicenseConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListLicenseConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLicenseSpecificationsForResourceResponse {
  /// License configurations associated with a resource.
  @_s.JsonKey(name: 'LicenseSpecifications')
  final List<LicenseSpecification> licenseSpecifications;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLicenseSpecificationsForResourceResponse({
    this.licenseSpecifications,
    this.nextToken,
  });
  factory ListLicenseSpecificationsForResourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListLicenseSpecificationsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLicenseVersionsResponse {
  /// License details.
  @_s.JsonKey(name: 'Licenses')
  final List<License> licenses;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLicenseVersionsResponse({
    this.licenses,
    this.nextToken,
  });
  factory ListLicenseVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLicenseVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLicensesResponse {
  /// License details.
  @_s.JsonKey(name: 'Licenses')
  final List<License> licenses;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLicensesResponse({
    this.licenses,
    this.nextToken,
  });
  factory ListLicensesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLicensesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListReceivedGrantsResponse {
  /// Received grant details.
  @_s.JsonKey(name: 'Grants')
  final List<Grant> grants;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListReceivedGrantsResponse({
    this.grants,
    this.nextToken,
  });
  factory ListReceivedGrantsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListReceivedGrantsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListReceivedLicensesResponse {
  /// Received license details.
  @_s.JsonKey(name: 'Licenses')
  final List<GrantedLicense> licenses;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListReceivedLicensesResponse({
    this.licenses,
    this.nextToken,
  });
  factory ListReceivedLicensesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListReceivedLicensesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceInventoryResponse {
  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the resources.
  @_s.JsonKey(name: 'ResourceInventoryList')
  final List<ResourceInventory> resourceInventoryList;

  ListResourceInventoryResponse({
    this.nextToken,
    this.resourceInventoryList,
  });
  factory ListResourceInventoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourceInventoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Information about the tags.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

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
class ListTokensResponse {
  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Received token details.
  @_s.JsonKey(name: 'Tokens')
  final List<TokenData> tokens;

  ListTokensResponse({
    this.nextToken,
    this.tokens,
  });
  factory ListTokensResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTokensResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsageForLicenseConfigurationResponse {
  /// Information about the license configurations.
  @_s.JsonKey(name: 'LicenseConfigurationUsageList')
  final List<LicenseConfigurationUsage> licenseConfigurationUsageList;

  /// Token for the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListUsageForLicenseConfigurationResponse({
    this.licenseConfigurationUsageList,
    this.nextToken,
  });
  factory ListUsageForLicenseConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListUsageForLicenseConfigurationResponseFromJson(json);
}

/// Summary information about a managed resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ManagedResourceSummary {
  /// Number of resources associated with licenses.
  @_s.JsonKey(name: 'AssociationCount')
  final int associationCount;

  /// Type of resource associated with a license.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  ManagedResourceSummary({
    this.associationCount,
    this.resourceType,
  });
  factory ManagedResourceSummary.fromJson(Map<String, dynamic> json) =>
      _$ManagedResourceSummaryFromJson(json);
}

/// Describes key/value pairs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Metadata {
  /// The key name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value.
  @_s.JsonKey(name: 'Value')
  final String value;

  Metadata({
    this.name,
    this.value,
  });
  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

/// Configuration information for AWS Organizations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OrganizationConfiguration {
  /// Enables AWS Organization integration.
  @_s.JsonKey(name: 'EnableIntegration')
  final bool enableIntegration;

  OrganizationConfiguration({
    @_s.required this.enableIntegration,
  });
  factory OrganizationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$OrganizationConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationConfigurationToJson(this);
}

/// Describes product information for a license configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProductInformation {
  /// Product information filters.
  ///
  /// The following filters and logical operators are supported when the resource
  /// type is <code>SSM_MANAGED</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>Application Name</code> - The name of the application. Logical
  /// operator is <code>EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>Application Publisher</code> - The publisher of the application.
  /// Logical operator is <code>EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>Application Version</code> - The version of the application. Logical
  /// operator is <code>EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>Platform Name</code> - The name of the platform. Logical operator is
  /// <code>EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>Platform Type</code> - The platform type. Logical operator is
  /// <code>EQUALS</code>.
  /// </li>
  /// <li>
  /// <code>License Included</code> - The type of license included. Logical
  /// operators are <code>EQUALS</code> and <code>NOT_EQUALS</code>. Possible
  /// values are: <code>sql-server-enterprise</code> |
  /// <code>sql-server-standard</code> | <code>sql-server-web</code> |
  /// <code>windows-server-datacenter</code>.
  /// </li>
  /// </ul>
  /// The following filters and logical operators are supported when the resource
  /// type is <code>RDS</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>Engine Edition</code> - The edition of the database engine. Logical
  /// operator is <code>EQUALS</code>. Possible values are: <code>oracle-ee</code>
  /// | <code>oracle-se</code> | <code>oracle-se1</code> |
  /// <code>oracle-se2</code>.
  /// </li>
  /// <li>
  /// <code>License Pack</code> - The license pack. Logical operator is
  /// <code>EQUALS</code>. Possible values are: <code>data guard</code> |
  /// <code>diagnostic pack sqlt</code> | <code>tuning pack sqlt</code> |
  /// <code>ols</code> | <code>olap</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ProductInformationFilterList')
  final List<ProductInformationFilter> productInformationFilterList;

  /// Resource type. The possible values are <code>SSM_MANAGED</code> |
  /// <code>RDS</code>.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  ProductInformation({
    @_s.required this.productInformationFilterList,
    @_s.required this.resourceType,
  });
  factory ProductInformation.fromJson(Map<String, dynamic> json) =>
      _$ProductInformationFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInformationToJson(this);
}

/// Describes product information filters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProductInformationFilter {
  /// Logical operator.
  @_s.JsonKey(name: 'ProductInformationFilterComparator')
  final String productInformationFilterComparator;

  /// Filter name.
  @_s.JsonKey(name: 'ProductInformationFilterName')
  final String productInformationFilterName;

  /// Filter value.
  @_s.JsonKey(name: 'ProductInformationFilterValue')
  final List<String> productInformationFilterValue;

  ProductInformationFilter({
    @_s.required this.productInformationFilterComparator,
    @_s.required this.productInformationFilterName,
    @_s.required this.productInformationFilterValue,
  });
  factory ProductInformationFilter.fromJson(Map<String, dynamic> json) =>
      _$ProductInformationFilterFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInformationFilterToJson(this);
}

/// Details about a provisional configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProvisionalConfiguration {
  /// Maximum time for the provisional configuration, in minutes.
  @_s.JsonKey(name: 'MaxTimeToLiveInMinutes')
  final int maxTimeToLiveInMinutes;

  ProvisionalConfiguration({
    @_s.required this.maxTimeToLiveInMinutes,
  });
  factory ProvisionalConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ProvisionalConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisionalConfigurationToJson(this);
}

/// Metadata associated with received licenses and grants.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReceivedMetadata {
  /// Allowed operations.
  @_s.JsonKey(name: 'AllowedOperations')
  final List<AllowedOperation> allowedOperations;

  /// Received status.
  @_s.JsonKey(name: 'ReceivedStatus')
  final ReceivedStatus receivedStatus;

  ReceivedMetadata({
    this.allowedOperations,
    this.receivedStatus,
  });
  factory ReceivedMetadata.fromJson(Map<String, dynamic> json) =>
      _$ReceivedMetadataFromJson(json);
}

enum ReceivedStatus {
  @_s.JsonValue('PENDING_WORKFLOW')
  pendingWorkflow,
  @_s.JsonValue('PENDING_ACCEPT')
  pendingAccept,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('FAILED_WORKFLOW')
  failedWorkflow,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('DISABLED')
  disabled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RejectGrantResponse {
  /// Grant ARN.
  @_s.JsonKey(name: 'GrantArn')
  final String grantArn;

  /// Grant status.
  @_s.JsonKey(name: 'Status')
  final GrantStatus status;

  /// Grant version.
  @_s.JsonKey(name: 'Version')
  final String version;

  RejectGrantResponse({
    this.grantArn,
    this.status,
    this.version,
  });
  factory RejectGrantResponse.fromJson(Map<String, dynamic> json) =>
      _$RejectGrantResponseFromJson(json);
}

enum RenewType {
  @_s.JsonValue('None')
  none,
  @_s.JsonValue('Weekly')
  weekly,
  @_s.JsonValue('Monthly')
  monthly,
}

/// Details about a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceInventory {
  /// Platform of the resource.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// Platform version of the resource in the inventory.
  @_s.JsonKey(name: 'PlatformVersion')
  final String platformVersion;

  /// Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// ID of the resource.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// ID of the account that owns the resource.
  @_s.JsonKey(name: 'ResourceOwningAccountId')
  final String resourceOwningAccountId;

  /// Type of resource.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  ResourceInventory({
    this.platform,
    this.platformVersion,
    this.resourceArn,
    this.resourceId,
    this.resourceOwningAccountId,
    this.resourceType,
  });
  factory ResourceInventory.fromJson(Map<String, dynamic> json) =>
      _$ResourceInventoryFromJson(json);
}

enum ResourceType {
  @_s.JsonValue('EC2_INSTANCE')
  ec2Instance,
  @_s.JsonValue('EC2_HOST')
  ec2Host,
  @_s.JsonValue('EC2_AMI')
  ec2Ami,
  @_s.JsonValue('RDS')
  rds,
  @_s.JsonValue('SYSTEMS_MANAGER_MANAGED_INSTANCE')
  systemsManagerManagedInstance,
}

/// Details about a tag for a license configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// Tag key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Tag value.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
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

/// Describes a token.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TokenData {
  /// Token expiration time, in ISO8601-UTC format.
  @_s.JsonKey(name: 'ExpirationTime')
  final String expirationTime;

  /// Amazon Resource Name (ARN) of the license.
  @_s.JsonKey(name: 'LicenseArn')
  final String licenseArn;

  /// Amazon Resource Names (ARN) of the roles included in the token.
  @_s.JsonKey(name: 'RoleArns')
  final List<String> roleArns;

  /// Token status. The possible values are <code>AVAILABLE</code> and
  /// <code>DELETED</code>.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// Token ID.
  @_s.JsonKey(name: 'TokenId')
  final String tokenId;

  /// Data specified by the caller.
  @_s.JsonKey(name: 'TokenProperties')
  final List<String> tokenProperties;

  /// Type of token generated. The supported value is <code>REFRESH_TOKEN</code>.
  @_s.JsonKey(name: 'TokenType')
  final String tokenType;

  TokenData({
    this.expirationTime,
    this.licenseArn,
    this.roleArns,
    this.status,
    this.tokenId,
    this.tokenProperties,
    this.tokenType,
  });
  factory TokenData.fromJson(Map<String, dynamic> json) =>
      _$TokenDataFromJson(json);
}

enum TokenType {
  @_s.JsonValue('REFRESH_TOKEN')
  refreshToken,
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
class UpdateLicenseConfigurationResponse {
  UpdateLicenseConfigurationResponse();
  factory UpdateLicenseConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateLicenseConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLicenseSpecificationsForResourceResponse {
  UpdateLicenseSpecificationsForResourceResponse();
  factory UpdateLicenseSpecificationsForResourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateLicenseSpecificationsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateServiceSettingsResponse {
  UpdateServiceSettingsResponse();
  factory UpdateServiceSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateServiceSettingsResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AuthorizationException extends _s.GenericAwsException {
  AuthorizationException({String type, String message})
      : super(type: type, code: 'AuthorizationException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class EntitlementNotAllowedException extends _s.GenericAwsException {
  EntitlementNotAllowedException({String type, String message})
      : super(
            type: type,
            code: 'EntitlementNotAllowedException',
            message: message);
}

class FailedDependencyException extends _s.GenericAwsException {
  FailedDependencyException({String type, String message})
      : super(type: type, code: 'FailedDependencyException', message: message);
}

class FilterLimitExceededException extends _s.GenericAwsException {
  FilterLimitExceededException({String type, String message})
      : super(
            type: type, code: 'FilterLimitExceededException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidResourceStateException extends _s.GenericAwsException {
  InvalidResourceStateException({String type, String message})
      : super(
            type: type,
            code: 'InvalidResourceStateException',
            message: message);
}

class LicenseUsageException extends _s.GenericAwsException {
  LicenseUsageException({String type, String message})
      : super(type: type, code: 'LicenseUsageException', message: message);
}

class NoEntitlementsAllowedException extends _s.GenericAwsException {
  NoEntitlementsAllowedException({String type, String message})
      : super(
            type: type,
            code: 'NoEntitlementsAllowedException',
            message: message);
}

class RateLimitExceededException extends _s.GenericAwsException {
  RateLimitExceededException({String type, String message})
      : super(type: type, code: 'RateLimitExceededException', message: message);
}

class RedirectException extends _s.GenericAwsException {
  RedirectException({String type, String message})
      : super(type: type, code: 'RedirectException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServerInternalException extends _s.GenericAwsException {
  ServerInternalException({String type, String message})
      : super(type: type, code: 'ServerInternalException', message: message);
}

class UnsupportedDigitalSignatureMethodException
    extends _s.GenericAwsException {
  UnsupportedDigitalSignatureMethodException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedDigitalSignatureMethodException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AuthorizationException': (type, message) =>
      AuthorizationException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'EntitlementNotAllowedException': (type, message) =>
      EntitlementNotAllowedException(type: type, message: message),
  'FailedDependencyException': (type, message) =>
      FailedDependencyException(type: type, message: message),
  'FilterLimitExceededException': (type, message) =>
      FilterLimitExceededException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidResourceStateException': (type, message) =>
      InvalidResourceStateException(type: type, message: message),
  'LicenseUsageException': (type, message) =>
      LicenseUsageException(type: type, message: message),
  'NoEntitlementsAllowedException': (type, message) =>
      NoEntitlementsAllowedException(type: type, message: message),
  'RateLimitExceededException': (type, message) =>
      RateLimitExceededException(type: type, message: message),
  'RedirectException': (type, message) =>
      RedirectException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServerInternalException': (type, message) =>
      ServerInternalException(type: type, message: message),
  'UnsupportedDigitalSignatureMethodException': (type, message) =>
      UnsupportedDigitalSignatureMethodException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
