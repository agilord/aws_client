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

/// License Manager makes it easier to manage licenses from software vendors
/// across multiple Amazon Web Services accounts and on-premises servers.
class LicenseManager {
  final _s.JsonProtocol _protocol;
  LicenseManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'license-manager',
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
    required String grantArn,
  }) async {
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
  /// May throw [InvalidParameterValueException].
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
    required String licenseConsumptionToken,
    String? beneficiary,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CheckInLicense'
    };
    await _protocol.send(
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
  }

  /// Checks out the specified license for offline use.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
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
    required String clientToken,
    required DigitalSignatureMethod digitalSignatureMethod,
    required List<EntitlementData> entitlements,
    required String licenseArn,
    List<Metadata>? checkoutMetadata,
    String? nodeId,
  }) async {
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
        'DigitalSignatureMethod': digitalSignatureMethod.toValue(),
        'Entitlements': entitlements,
        'LicenseArn': licenseArn,
        if (checkoutMetadata != null) 'CheckoutMetadata': checkoutMetadata,
        if (nodeId != null) 'NodeId': nodeId,
      },
    );

    return CheckoutBorrowLicenseResponse.fromJson(jsonResponse.body);
  }

  /// Checks out the specified license.
  /// <note>
  /// If the account that created the license is the same that is performing the
  /// check out, you must specify the account as the beneficiary.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
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
    required CheckoutType checkoutType,
    required String clientToken,
    required List<EntitlementData> entitlements,
    required String keyFingerprint,
    required String productSKU,
    String? beneficiary,
    String? nodeId,
  }) async {
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
        'CheckoutType': checkoutType.toValue(),
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
  /// license entitlements with a specific Amazon Web Services account, an
  /// organization, or an organizational unit (OU). For more information, see <a
  /// href="https://docs.aws.amazon.com/license-manager/latest/userguide/granted-licenses.html">Granted
  /// licenses in License Manager</a> in the <i>License Manager User Guide</i>.
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
  /// The grant principals. You can specify one of the following as an Amazon
  /// Resource Name (ARN):
  ///
  /// <ul>
  /// <li>
  /// An Amazon Web Services account, which includes only the account specified.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// An organizational unit (OU), which includes all accounts in the OU.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// An organization, which will include all accounts across your organization.
  /// </li>
  /// </ul>
  Future<CreateGrantResponse> createGrant({
    required List<AllowedOperation> allowedOperations,
    required String clientToken,
    required String grantName,
    required String homeRegion,
    required String licenseArn,
    required List<String> principals,
  }) async {
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
        'AllowedOperations': allowedOperations.map((e) => e.toValue()).toList(),
        'ClientToken': clientToken,
        'GrantName': grantName,
        'HomeRegion': homeRegion,
        'LicenseArn': licenseArn,
        'Principals': principals,
      },
    );

    return CreateGrantResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new version of the specified grant. For more information, see <a
  /// href="https://docs.aws.amazon.com/license-manager/latest/userguide/granted-licenses.html">Granted
  /// licenses in License Manager</a> in the <i>License Manager User Guide</i>.
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
  /// Parameter [options] :
  /// The options specified for the grant.
  ///
  /// Parameter [sourceVersion] :
  /// Current version of the grant.
  ///
  /// Parameter [status] :
  /// Grant status.
  ///
  /// Parameter [statusReason] :
  /// Grant status reason.
  Future<CreateGrantVersionResponse> createGrantVersion({
    required String clientToken,
    required String grantArn,
    List<AllowedOperation>? allowedOperations,
    String? grantName,
    Options? options,
    String? sourceVersion,
    GrantStatus? status,
    String? statusReason,
  }) async {
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
              allowedOperations.map((e) => e.toValue()).toList(),
        if (grantName != null) 'GrantName': grantName,
        if (options != null) 'Options': options,
        if (sourceVersion != null) 'SourceVersion': sourceVersion,
        if (status != null) 'Status': status.toValue(),
        if (statusReason != null) 'StatusReason': statusReason,
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
    required String beneficiary,
    required String clientToken,
    required ConsumptionConfiguration consumptionConfiguration,
    required List<Entitlement> entitlements,
    required String homeRegion,
    required Issuer issuer,
    required String licenseName,
    required String productName,
    required String productSKU,
    required DatetimeRange validity,
    List<Metadata>? licenseMetadata,
  }) async {
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
    required LicenseCountingType licenseCountingType,
    required String name,
    String? description,
    bool? disassociateWhenNotFound,
    int? licenseCount,
    bool? licenseCountHardLimit,
    List<String>? licenseRules,
    List<ProductInformation>? productInformationList,
    List<Tag>? tags,
  }) async {
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
        'LicenseCountingType': licenseCountingType.toValue(),
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

  /// Creates a new license conversion task.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ValidationException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [destinationLicenseContext] :
  /// Information that identifies the license type you are converting to. For
  /// the structure of the destination license, see <a
  /// href="https://docs.aws.amazon.com/license-manager/latest/userguide/conversion-procedures.html#conversion-cli">Convert
  /// a license type using the CLI </a> in the <i>License Manager User
  /// Guide</i>.
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the resource you are converting the license
  /// type for.
  ///
  /// Parameter [sourceLicenseContext] :
  /// Information that identifies the license type you are converting from. For
  /// the structure of the source license, see <a
  /// href="https://docs.aws.amazon.com/license-manager/latest/userguide/conversion-procedures.html#conversion-cli">Convert
  /// a license type using the CLI </a> in the <i>License Manager User
  /// Guide</i>.
  Future<CreateLicenseConversionTaskForResourceResponse>
      createLicenseConversionTaskForResource({
    required LicenseConversionContext destinationLicenseContext,
    required String resourceArn,
    required LicenseConversionContext sourceLicenseContext,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CreateLicenseConversionTaskForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationLicenseContext': destinationLicenseContext,
        'ResourceArn': resourceArn,
        'SourceLicenseContext': sourceLicenseContext,
      },
    );

    return CreateLicenseConversionTaskForResourceResponse.fromJson(
        jsonResponse.body);
  }

  /// Creates a report generator.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [RateLimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [reportContext] :
  /// Defines the type of license configuration the report generator tracks.
  ///
  /// Parameter [reportFrequency] :
  /// Frequency by which reports are generated. Reports can be generated daily,
  /// monthly, or weekly.
  ///
  /// Parameter [reportGeneratorName] :
  /// Name of the report generator.
  ///
  /// Parameter [type] :
  /// Type of reports to generate. The following report types an be generated:
  ///
  /// <ul>
  /// <li>
  /// License configuration report - Reports the number and details of consumed
  /// licenses for a license configuration.
  /// </li>
  /// <li>
  /// Resource report - Reports the tracked licenses and resource consumption
  /// for a license configuration.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// Description of the report generator.
  ///
  /// Parameter [tags] :
  /// Tags to add to the report generator.
  Future<CreateLicenseManagerReportGeneratorResponse>
      createLicenseManagerReportGenerator({
    required String clientToken,
    required ReportContext reportContext,
    required ReportFrequency reportFrequency,
    required String reportGeneratorName,
    required List<ReportType> type,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.CreateLicenseManagerReportGenerator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'ReportContext': reportContext,
        'ReportFrequency': reportFrequency,
        'ReportGeneratorName': reportGeneratorName,
        'Type': type.map((e) => e.toValue()).toList(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLicenseManagerReportGeneratorResponse.fromJson(
        jsonResponse.body);
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
    required String clientToken,
    required ConsumptionConfiguration consumptionConfiguration,
    required List<Entitlement> entitlements,
    required String homeRegion,
    required Issuer issuer,
    required String licenseArn,
    required String licenseName,
    required String productName,
    required LicenseStatus status,
    required DatetimeRange validity,
    List<Metadata>? licenseMetadata,
    String? sourceVersion,
  }) async {
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
        'Status': status.toValue(),
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
    required String clientToken,
    required String licenseArn,
    int? expirationInDays,
    List<String>? roleArns,
    List<String>? tokenProperties,
  }) async {
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
  ///
  /// Parameter [statusReason] :
  /// The Status reason for the delete request.
  Future<DeleteGrantResponse> deleteGrant({
    required String grantArn,
    required String version,
    String? statusReason,
  }) async {
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
        if (statusReason != null) 'StatusReason': statusReason,
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
    required String licenseArn,
    required String sourceVersion,
  }) async {
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
    required String licenseConfigurationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.DeleteLicenseConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConfigurationArn': licenseConfigurationArn,
      },
    );
  }

  /// Deletes the specified report generator.
  ///
  /// This action deletes the report generator, which stops it from generating
  /// future reports. The action cannot be reversed. It has no effect on the
  /// previous reports from this generator.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [RateLimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [licenseManagerReportGeneratorArn] :
  /// Amazon Resource Name (ARN) of the report generator to be deleted.
  Future<void> deleteLicenseManagerReportGenerator({
    required String licenseManagerReportGeneratorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.DeleteLicenseManagerReportGenerator'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseManagerReportGeneratorArn': licenseManagerReportGeneratorArn,
      },
    );
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
    required String tokenId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.DeleteToken'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TokenId': tokenId,
      },
    );
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
    required String licenseConsumptionToken,
    bool? dryRun,
  }) async {
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
    required String token,
    List<String>? tokenProperties,
  }) async {
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
    required String grantArn,
    String? version,
  }) async {
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
    required String licenseArn,
    String? version,
  }) async {
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
    required String licenseConfigurationArn,
  }) async {
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

  /// Gets information about the specified license type conversion task.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseConversionTaskId] :
  /// ID of the license type conversion task to retrieve information on.
  Future<GetLicenseConversionTaskResponse> getLicenseConversionTask({
    required String licenseConversionTaskId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.GetLicenseConversionTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseConversionTaskId': licenseConversionTaskId,
      },
    );

    return GetLicenseConversionTaskResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about the specified report generator.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [RateLimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [licenseManagerReportGeneratorArn] :
  /// Amazon Resource Name (ARN) of the report generator.
  Future<GetLicenseManagerReportGeneratorResponse>
      getLicenseManagerReportGenerator({
    required String licenseManagerReportGeneratorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.GetLicenseManagerReportGenerator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseManagerReportGeneratorArn': licenseManagerReportGeneratorArn,
      },
    );

    return GetLicenseManagerReportGeneratorResponse.fromJson(jsonResponse.body);
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
    required String licenseArn,
  }) async {
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
    required String licenseConfigurationArn,
    int? maxResults,
    String? nextToken,
  }) async {
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
  /// <code>LicenseArn</code>
  /// </li>
  /// <li>
  /// <code>GrantStatus</code>
  /// </li>
  /// <li>
  /// <code>GranteePrincipalARN</code>
  /// </li>
  /// <li>
  /// <code>ProductSKU</code>
  /// </li>
  /// <li>
  /// <code>LicenseIssuerName</code>
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
    List<Filter>? filters,
    List<String>? grantArns,
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
    required String licenseConfigurationArn,
    int? maxResults,
    String? nextToken,
  }) async {
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
  /// <code>licenseCountingType</code> - The dimension for which licenses are
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
    List<Filter>? filters,
    List<String>? licenseConfigurationArns,
    int? maxResults,
    String? nextToken,
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

  /// Lists the license type conversion tasks for your account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. Valid filters are <code>ResourceArns</code>
  /// and <code>Status</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListLicenseConversionTasksResponse> listLicenseConversionTasks({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.ListLicenseConversionTasks'
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

    return ListLicenseConversionTasksResponse.fromJson(jsonResponse.body);
  }

  /// Lists the report generators for your account.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [RateLimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>LicenseConfigurationArn</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListLicenseManagerReportGeneratorsResponse>
      listLicenseManagerReportGenerators({
    List<Filter>? filters,
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
      'X-Amz-Target': 'AWSLicenseManager.ListLicenseManagerReportGenerators'
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

    return ListLicenseManagerReportGeneratorsResponse.fromJson(
        jsonResponse.body);
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
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
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
    required String licenseArn,
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
  /// <code>Fingerprint</code>
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
    List<Filter>? filters,
    List<String>? licenseArns,
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

  /// Lists grants that are received. Received grants are grants created while
  /// specifying the recipient as this Amazon Web Services account, your
  /// organization, or an organizational unit (OU) to which this member account
  /// belongs.
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
  /// <code>LicenseIssuerName</code>
  /// </li>
  /// <li>
  /// <code>LicenseArn</code>
  /// </li>
  /// <li>
  /// <code>GrantStatus</code>
  /// </li>
  /// <li>
  /// <code>GranterAccountId</code>
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
    List<Filter>? filters,
    List<String>? grantArns,
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

  /// Lists the grants received for all accounts in the organization.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [RateLimitExceededException].
  ///
  /// Parameter [licenseArn] :
  /// The Amazon Resource Name (ARN) of the received license.
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>ParentArn</code>
  /// </li>
  /// <li>
  /// <code>GranteePrincipalArn</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListReceivedGrantsForOrganizationResponse>
      listReceivedGrantsForOrganization({
    required String licenseArn,
    List<Filter>? filters,
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
      'X-Amz-Target': 'AWSLicenseManager.ListReceivedGrantsForOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LicenseArn': licenseArn,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListReceivedGrantsForOrganizationResponse.fromJson(
        jsonResponse.body);
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
  /// <code>Fingerprint</code>
  /// </li>
  /// <li>
  /// <code>IssuerName</code>
  /// </li>
  /// <li>
  /// <code>Beneficiary</code>
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
    List<Filter>? filters,
    List<String>? licenseArns,
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

  /// Lists the licenses received for all accounts in the organization.
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
  /// <code>Beneficiary</code>
  /// </li>
  /// <li>
  /// <code>ProductSKU</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListReceivedLicensesForOrganizationResponse>
      listReceivedLicensesForOrganization({
    List<Filter>? filters,
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
      'X-Amz-Target': 'AWSLicenseManager.ListReceivedLicensesForOrganization'
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

    return ListReceivedLicensesForOrganizationResponse.fromJson(
        jsonResponse.body);
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
  /// <code>account_id</code> - The ID of the Amazon Web Services account that
  /// owns the resource. Logical operators are <code>EQUALS</code> |
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
    List<InventoryFilter>? filters,
    int? maxResults,
    String? nextToken,
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
    required String resourceArn,
  }) async {
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
  /// <code>LicenseArns</code>
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
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? tokenIds,
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
    required String licenseConfigurationArn,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
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
    required String grantArn,
  }) async {
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
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.TagResource'
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UntagResource'
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
    required String licenseConfigurationArn,
    String? description,
    bool? disassociateWhenNotFound,
    LicenseConfigurationStatus? licenseConfigurationStatus,
    int? licenseCount,
    bool? licenseCountHardLimit,
    List<String>? licenseRules,
    String? name,
    List<ProductInformation>? productInformationList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UpdateLicenseConfiguration'
    };
    await _protocol.send(
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
  }

  /// Updates a report generator.
  ///
  /// After you make changes to a report generator, it starts generating new
  /// reports within 60 minutes of being updated.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [RateLimitExceededException].
  /// May throw [ServerInternalException].
  /// May throw [AuthorizationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceLimitExceededException].
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [licenseManagerReportGeneratorArn] :
  /// Amazon Resource Name (ARN) of the report generator to update.
  ///
  /// Parameter [reportContext] :
  /// The report context.
  ///
  /// Parameter [reportFrequency] :
  /// Frequency by which reports are generated.
  ///
  /// Parameter [reportGeneratorName] :
  /// Name of the report generator.
  ///
  /// Parameter [type] :
  /// Type of reports to generate. The following report types are supported:
  ///
  /// <ul>
  /// <li>
  /// License configuration report - Reports the number and details of consumed
  /// licenses for a license configuration.
  /// </li>
  /// <li>
  /// Resource report - Reports the tracked licenses and resource consumption
  /// for a license configuration.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// Description of the report generator.
  Future<void> updateLicenseManagerReportGenerator({
    required String clientToken,
    required String licenseManagerReportGeneratorArn,
    required ReportContext reportContext,
    required ReportFrequency reportFrequency,
    required String reportGeneratorName,
    required List<ReportType> type,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UpdateLicenseManagerReportGenerator'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'LicenseManagerReportGeneratorArn': licenseManagerReportGeneratorArn,
        'ReportContext': reportContext,
        'ReportFrequency': reportFrequency,
        'ReportGeneratorName': reportGeneratorName,
        'Type': type.map((e) => e.toValue()).toList(),
        if (description != null) 'Description': description,
      },
    );
  }

  /// Adds or removes the specified license configurations for the specified
  /// Amazon Web Services resource.
  ///
  /// You can update the license specifications of AMIs, instances, and hosts.
  /// You cannot update the license specifications for launch templates and
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
  /// Amazon Resource Name (ARN) of the Amazon Web Services resource.
  ///
  /// Parameter [addLicenseSpecifications] :
  /// ARNs of the license configurations to add.
  ///
  /// Parameter [removeLicenseSpecifications] :
  /// ARNs of the license configurations to remove.
  Future<void> updateLicenseSpecificationsForResource({
    required String resourceArn,
    List<LicenseSpecification>? addLicenseSpecifications,
    List<LicenseSpecification>? removeLicenseSpecifications,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UpdateLicenseSpecificationsForResource'
    };
    await _protocol.send(
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
  /// Enables integration with Organizations for cross-account discovery.
  ///
  /// Parameter [s3BucketArn] :
  /// Amazon Resource Name (ARN) of the Amazon S3 bucket where the License
  /// Manager information is stored.
  ///
  /// Parameter [snsTopicArn] :
  /// Amazon Resource Name (ARN) of the Amazon SNS topic used for License
  /// Manager alerts.
  Future<void> updateServiceSettings({
    bool? enableCrossAccountsDiscovery,
    OrganizationConfiguration? organizationConfiguration,
    String? s3BucketArn,
    String? snsTopicArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLicenseManager.UpdateServiceSettings'
    };
    await _protocol.send(
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
  }
}

class AcceptGrantResponse {
  /// Grant ARN.
  final String? grantArn;

  /// Grant status.
  final GrantStatus? status;

  /// Grant version.
  final String? version;

  AcceptGrantResponse({
    this.grantArn,
    this.status,
    this.version,
  });

  factory AcceptGrantResponse.fromJson(Map<String, dynamic> json) {
    return AcceptGrantResponse(
      grantArn: json['GrantArn'] as String?,
      status: (json['Status'] as String?)?.toGrantStatus(),
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grantArn = this.grantArn;
    final status = this.status;
    final version = this.version;
    return {
      if (grantArn != null) 'GrantArn': grantArn,
      if (status != null) 'Status': status.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

enum ActivationOverrideBehavior {
  distributedGrantsOnly,
  allGrantsPermittedByIssuer,
}

extension ActivationOverrideBehaviorValueExtension
    on ActivationOverrideBehavior {
  String toValue() {
    switch (this) {
      case ActivationOverrideBehavior.distributedGrantsOnly:
        return 'DISTRIBUTED_GRANTS_ONLY';
      case ActivationOverrideBehavior.allGrantsPermittedByIssuer:
        return 'ALL_GRANTS_PERMITTED_BY_ISSUER';
    }
  }
}

extension ActivationOverrideBehaviorFromString on String {
  ActivationOverrideBehavior toActivationOverrideBehavior() {
    switch (this) {
      case 'DISTRIBUTED_GRANTS_ONLY':
        return ActivationOverrideBehavior.distributedGrantsOnly;
      case 'ALL_GRANTS_PERMITTED_BY_ISSUER':
        return ActivationOverrideBehavior.allGrantsPermittedByIssuer;
    }
    throw Exception('$this is not known in enum ActivationOverrideBehavior');
  }
}

enum AllowedOperation {
  createGrant,
  checkoutLicense,
  checkoutBorrowLicense,
  checkInLicense,
  extendConsumptionLicense,
  listPurchasedLicenses,
  createToken,
}

extension AllowedOperationValueExtension on AllowedOperation {
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
  }
}

extension AllowedOperationFromString on String {
  AllowedOperation toAllowedOperation() {
    switch (this) {
      case 'CreateGrant':
        return AllowedOperation.createGrant;
      case 'CheckoutLicense':
        return AllowedOperation.checkoutLicense;
      case 'CheckoutBorrowLicense':
        return AllowedOperation.checkoutBorrowLicense;
      case 'CheckInLicense':
        return AllowedOperation.checkInLicense;
      case 'ExtendConsumptionLicense':
        return AllowedOperation.extendConsumptionLicense;
      case 'ListPurchasedLicenses':
        return AllowedOperation.listPurchasedLicenses;
      case 'CreateToken':
        return AllowedOperation.createToken;
    }
    throw Exception('$this is not known in enum AllowedOperation');
  }
}

/// Describes automated discovery.
class AutomatedDiscoveryInformation {
  /// Time that automated discovery last ran.
  final DateTime? lastRunTime;

  AutomatedDiscoveryInformation({
    this.lastRunTime,
  });

  factory AutomatedDiscoveryInformation.fromJson(Map<String, dynamic> json) {
    return AutomatedDiscoveryInformation(
      lastRunTime: timeStampFromJson(json['LastRunTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final lastRunTime = this.lastRunTime;
    return {
      if (lastRunTime != null) 'LastRunTime': unixTimestampToJson(lastRunTime),
    };
  }
}

/// Details about a borrow configuration.
class BorrowConfiguration {
  /// Indicates whether early check-ins are allowed.
  final bool allowEarlyCheckIn;

  /// Maximum time for the borrow configuration, in minutes.
  final int maxTimeToLiveInMinutes;

  BorrowConfiguration({
    required this.allowEarlyCheckIn,
    required this.maxTimeToLiveInMinutes,
  });

  factory BorrowConfiguration.fromJson(Map<String, dynamic> json) {
    return BorrowConfiguration(
      allowEarlyCheckIn: json['AllowEarlyCheckIn'] as bool,
      maxTimeToLiveInMinutes: json['MaxTimeToLiveInMinutes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final allowEarlyCheckIn = this.allowEarlyCheckIn;
    final maxTimeToLiveInMinutes = this.maxTimeToLiveInMinutes;
    return {
      'AllowEarlyCheckIn': allowEarlyCheckIn,
      'MaxTimeToLiveInMinutes': maxTimeToLiveInMinutes,
    };
  }
}

class CheckInLicenseResponse {
  CheckInLicenseResponse();

  factory CheckInLicenseResponse.fromJson(Map<String, dynamic> _) {
    return CheckInLicenseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CheckoutBorrowLicenseResponse {
  /// Information about constraints.
  final List<Metadata>? checkoutMetadata;

  /// Allowed license entitlements.
  final List<EntitlementData>? entitlementsAllowed;

  /// Date and time at which the license checkout expires.
  final String? expiration;

  /// Date and time at which the license checkout is issued.
  final String? issuedAt;

  /// Amazon Resource Name (ARN) of the license.
  final String? licenseArn;

  /// License consumption token.
  final String? licenseConsumptionToken;

  /// Node ID.
  final String? nodeId;

  /// Signed token.
  final String? signedToken;

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

  factory CheckoutBorrowLicenseResponse.fromJson(Map<String, dynamic> json) {
    return CheckoutBorrowLicenseResponse(
      checkoutMetadata: (json['CheckoutMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => Metadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      entitlementsAllowed: (json['EntitlementsAllowed'] as List?)
          ?.whereNotNull()
          .map((e) => EntitlementData.fromJson(e as Map<String, dynamic>))
          .toList(),
      expiration: json['Expiration'] as String?,
      issuedAt: json['IssuedAt'] as String?,
      licenseArn: json['LicenseArn'] as String?,
      licenseConsumptionToken: json['LicenseConsumptionToken'] as String?,
      nodeId: json['NodeId'] as String?,
      signedToken: json['SignedToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checkoutMetadata = this.checkoutMetadata;
    final entitlementsAllowed = this.entitlementsAllowed;
    final expiration = this.expiration;
    final issuedAt = this.issuedAt;
    final licenseArn = this.licenseArn;
    final licenseConsumptionToken = this.licenseConsumptionToken;
    final nodeId = this.nodeId;
    final signedToken = this.signedToken;
    return {
      if (checkoutMetadata != null) 'CheckoutMetadata': checkoutMetadata,
      if (entitlementsAllowed != null)
        'EntitlementsAllowed': entitlementsAllowed,
      if (expiration != null) 'Expiration': expiration,
      if (issuedAt != null) 'IssuedAt': issuedAt,
      if (licenseArn != null) 'LicenseArn': licenseArn,
      if (licenseConsumptionToken != null)
        'LicenseConsumptionToken': licenseConsumptionToken,
      if (nodeId != null) 'NodeId': nodeId,
      if (signedToken != null) 'SignedToken': signedToken,
    };
  }
}

class CheckoutLicenseResponse {
  /// Checkout type.
  final CheckoutType? checkoutType;

  /// Allowed license entitlements.
  final List<EntitlementData>? entitlementsAllowed;

  /// Date and time at which the license checkout expires.
  final String? expiration;

  /// Date and time at which the license checkout is issued.
  final String? issuedAt;

  /// Amazon Resource Name (ARN) of the checkout license.
  final String? licenseArn;

  /// License consumption token.
  final String? licenseConsumptionToken;

  /// Node ID.
  final String? nodeId;

  /// Signed token.
  final String? signedToken;

  CheckoutLicenseResponse({
    this.checkoutType,
    this.entitlementsAllowed,
    this.expiration,
    this.issuedAt,
    this.licenseArn,
    this.licenseConsumptionToken,
    this.nodeId,
    this.signedToken,
  });

  factory CheckoutLicenseResponse.fromJson(Map<String, dynamic> json) {
    return CheckoutLicenseResponse(
      checkoutType: (json['CheckoutType'] as String?)?.toCheckoutType(),
      entitlementsAllowed: (json['EntitlementsAllowed'] as List?)
          ?.whereNotNull()
          .map((e) => EntitlementData.fromJson(e as Map<String, dynamic>))
          .toList(),
      expiration: json['Expiration'] as String?,
      issuedAt: json['IssuedAt'] as String?,
      licenseArn: json['LicenseArn'] as String?,
      licenseConsumptionToken: json['LicenseConsumptionToken'] as String?,
      nodeId: json['NodeId'] as String?,
      signedToken: json['SignedToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checkoutType = this.checkoutType;
    final entitlementsAllowed = this.entitlementsAllowed;
    final expiration = this.expiration;
    final issuedAt = this.issuedAt;
    final licenseArn = this.licenseArn;
    final licenseConsumptionToken = this.licenseConsumptionToken;
    final nodeId = this.nodeId;
    final signedToken = this.signedToken;
    return {
      if (checkoutType != null) 'CheckoutType': checkoutType.toValue(),
      if (entitlementsAllowed != null)
        'EntitlementsAllowed': entitlementsAllowed,
      if (expiration != null) 'Expiration': expiration,
      if (issuedAt != null) 'IssuedAt': issuedAt,
      if (licenseArn != null) 'LicenseArn': licenseArn,
      if (licenseConsumptionToken != null)
        'LicenseConsumptionToken': licenseConsumptionToken,
      if (nodeId != null) 'NodeId': nodeId,
      if (signedToken != null) 'SignedToken': signedToken,
    };
  }
}

enum CheckoutType {
  provisional,
  perpetual,
}

extension CheckoutTypeValueExtension on CheckoutType {
  String toValue() {
    switch (this) {
      case CheckoutType.provisional:
        return 'PROVISIONAL';
      case CheckoutType.perpetual:
        return 'PERPETUAL';
    }
  }
}

extension CheckoutTypeFromString on String {
  CheckoutType toCheckoutType() {
    switch (this) {
      case 'PROVISIONAL':
        return CheckoutType.provisional;
      case 'PERPETUAL':
        return CheckoutType.perpetual;
    }
    throw Exception('$this is not known in enum CheckoutType');
  }
}

/// Details about license consumption.
class ConsumedLicenseSummary {
  /// Number of licenses consumed by the resource.
  final int? consumedLicenses;

  /// Resource type of the resource consuming a license.
  final ResourceType? resourceType;

  ConsumedLicenseSummary({
    this.consumedLicenses,
    this.resourceType,
  });

  factory ConsumedLicenseSummary.fromJson(Map<String, dynamic> json) {
    return ConsumedLicenseSummary(
      consumedLicenses: json['ConsumedLicenses'] as int?,
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final consumedLicenses = this.consumedLicenses;
    final resourceType = this.resourceType;
    return {
      if (consumedLicenses != null) 'ConsumedLicenses': consumedLicenses,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
  }
}

/// Details about a consumption configuration.
class ConsumptionConfiguration {
  /// Details about a borrow configuration.
  final BorrowConfiguration? borrowConfiguration;

  /// Details about a provisional configuration.
  final ProvisionalConfiguration? provisionalConfiguration;

  /// Renewal frequency.
  final RenewType? renewType;

  ConsumptionConfiguration({
    this.borrowConfiguration,
    this.provisionalConfiguration,
    this.renewType,
  });

  factory ConsumptionConfiguration.fromJson(Map<String, dynamic> json) {
    return ConsumptionConfiguration(
      borrowConfiguration: json['BorrowConfiguration'] != null
          ? BorrowConfiguration.fromJson(
              json['BorrowConfiguration'] as Map<String, dynamic>)
          : null,
      provisionalConfiguration: json['ProvisionalConfiguration'] != null
          ? ProvisionalConfiguration.fromJson(
              json['ProvisionalConfiguration'] as Map<String, dynamic>)
          : null,
      renewType: (json['RenewType'] as String?)?.toRenewType(),
    );
  }

  Map<String, dynamic> toJson() {
    final borrowConfiguration = this.borrowConfiguration;
    final provisionalConfiguration = this.provisionalConfiguration;
    final renewType = this.renewType;
    return {
      if (borrowConfiguration != null)
        'BorrowConfiguration': borrowConfiguration,
      if (provisionalConfiguration != null)
        'ProvisionalConfiguration': provisionalConfiguration,
      if (renewType != null) 'RenewType': renewType.toValue(),
    };
  }
}

class CreateGrantResponse {
  /// Grant ARN.
  final String? grantArn;

  /// Grant status.
  final GrantStatus? status;

  /// Grant version.
  final String? version;

  CreateGrantResponse({
    this.grantArn,
    this.status,
    this.version,
  });

  factory CreateGrantResponse.fromJson(Map<String, dynamic> json) {
    return CreateGrantResponse(
      grantArn: json['GrantArn'] as String?,
      status: (json['Status'] as String?)?.toGrantStatus(),
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grantArn = this.grantArn;
    final status = this.status;
    final version = this.version;
    return {
      if (grantArn != null) 'GrantArn': grantArn,
      if (status != null) 'Status': status.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

class CreateGrantVersionResponse {
  /// Grant ARN.
  final String? grantArn;

  /// Grant status.
  final GrantStatus? status;

  /// New version of the grant.
  final String? version;

  CreateGrantVersionResponse({
    this.grantArn,
    this.status,
    this.version,
  });

  factory CreateGrantVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateGrantVersionResponse(
      grantArn: json['GrantArn'] as String?,
      status: (json['Status'] as String?)?.toGrantStatus(),
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grantArn = this.grantArn;
    final status = this.status;
    final version = this.version;
    return {
      if (grantArn != null) 'GrantArn': grantArn,
      if (status != null) 'Status': status.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

class CreateLicenseConfigurationResponse {
  /// Amazon Resource Name (ARN) of the license configuration.
  final String? licenseConfigurationArn;

  CreateLicenseConfigurationResponse({
    this.licenseConfigurationArn,
  });

  factory CreateLicenseConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLicenseConfigurationResponse(
      licenseConfigurationArn: json['LicenseConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseConfigurationArn = this.licenseConfigurationArn;
    return {
      if (licenseConfigurationArn != null)
        'LicenseConfigurationArn': licenseConfigurationArn,
    };
  }
}

class CreateLicenseConversionTaskForResourceResponse {
  /// The ID of the created license type conversion task.
  final String? licenseConversionTaskId;

  CreateLicenseConversionTaskForResourceResponse({
    this.licenseConversionTaskId,
  });

  factory CreateLicenseConversionTaskForResourceResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLicenseConversionTaskForResourceResponse(
      licenseConversionTaskId: json['LicenseConversionTaskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseConversionTaskId = this.licenseConversionTaskId;
    return {
      if (licenseConversionTaskId != null)
        'LicenseConversionTaskId': licenseConversionTaskId,
    };
  }
}

class CreateLicenseManagerReportGeneratorResponse {
  /// The Amazon Resource Name (ARN) of the new report generator.
  final String? licenseManagerReportGeneratorArn;

  CreateLicenseManagerReportGeneratorResponse({
    this.licenseManagerReportGeneratorArn,
  });

  factory CreateLicenseManagerReportGeneratorResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLicenseManagerReportGeneratorResponse(
      licenseManagerReportGeneratorArn:
          json['LicenseManagerReportGeneratorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseManagerReportGeneratorArn =
        this.licenseManagerReportGeneratorArn;
    return {
      if (licenseManagerReportGeneratorArn != null)
        'LicenseManagerReportGeneratorArn': licenseManagerReportGeneratorArn,
    };
  }
}

class CreateLicenseResponse {
  /// Amazon Resource Name (ARN) of the license.
  final String? licenseArn;

  /// License status.
  final LicenseStatus? status;

  /// License version.
  final String? version;

  CreateLicenseResponse({
    this.licenseArn,
    this.status,
    this.version,
  });

  factory CreateLicenseResponse.fromJson(Map<String, dynamic> json) {
    return CreateLicenseResponse(
      licenseArn: json['LicenseArn'] as String?,
      status: (json['Status'] as String?)?.toLicenseStatus(),
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseArn = this.licenseArn;
    final status = this.status;
    final version = this.version;
    return {
      if (licenseArn != null) 'LicenseArn': licenseArn,
      if (status != null) 'Status': status.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

class CreateLicenseVersionResponse {
  /// License ARN.
  final String? licenseArn;

  /// License status.
  final LicenseStatus? status;

  /// New version of the license.
  final String? version;

  CreateLicenseVersionResponse({
    this.licenseArn,
    this.status,
    this.version,
  });

  factory CreateLicenseVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateLicenseVersionResponse(
      licenseArn: json['LicenseArn'] as String?,
      status: (json['Status'] as String?)?.toLicenseStatus(),
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseArn = this.licenseArn;
    final status = this.status;
    final version = this.version;
    return {
      if (licenseArn != null) 'LicenseArn': licenseArn,
      if (status != null) 'Status': status.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

class CreateTokenResponse {
  /// Refresh token, encoded as a JWT token.
  final String? token;

  /// Token ID.
  final String? tokenId;

  /// Token type.
  final TokenType? tokenType;

  CreateTokenResponse({
    this.token,
    this.tokenId,
    this.tokenType,
  });

  factory CreateTokenResponse.fromJson(Map<String, dynamic> json) {
    return CreateTokenResponse(
      token: json['Token'] as String?,
      tokenId: json['TokenId'] as String?,
      tokenType: (json['TokenType'] as String?)?.toTokenType(),
    );
  }

  Map<String, dynamic> toJson() {
    final token = this.token;
    final tokenId = this.tokenId;
    final tokenType = this.tokenType;
    return {
      if (token != null) 'Token': token,
      if (tokenId != null) 'TokenId': tokenId,
      if (tokenType != null) 'TokenType': tokenType.toValue(),
    };
  }
}

/// Describes a time range, in ISO8601-UTC format.
class DatetimeRange {
  /// Start of the time range.
  final String begin;

  /// End of the time range.
  final String? end;

  DatetimeRange({
    required this.begin,
    this.end,
  });

  factory DatetimeRange.fromJson(Map<String, dynamic> json) {
    return DatetimeRange(
      begin: json['Begin'] as String,
      end: json['End'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final begin = this.begin;
    final end = this.end;
    return {
      'Begin': begin,
      if (end != null) 'End': end,
    };
  }
}

class DeleteGrantResponse {
  /// Grant ARN.
  final String? grantArn;

  /// Grant status.
  final GrantStatus? status;

  /// Grant version.
  final String? version;

  DeleteGrantResponse({
    this.grantArn,
    this.status,
    this.version,
  });

  factory DeleteGrantResponse.fromJson(Map<String, dynamic> json) {
    return DeleteGrantResponse(
      grantArn: json['GrantArn'] as String?,
      status: (json['Status'] as String?)?.toGrantStatus(),
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grantArn = this.grantArn;
    final status = this.status;
    final version = this.version;
    return {
      if (grantArn != null) 'GrantArn': grantArn,
      if (status != null) 'Status': status.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

class DeleteLicenseConfigurationResponse {
  DeleteLicenseConfigurationResponse();

  factory DeleteLicenseConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLicenseConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLicenseManagerReportGeneratorResponse {
  DeleteLicenseManagerReportGeneratorResponse();

  factory DeleteLicenseManagerReportGeneratorResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteLicenseManagerReportGeneratorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLicenseResponse {
  /// Date when the license is deleted.
  final String? deletionDate;

  /// License status.
  final LicenseDeletionStatus? status;

  DeleteLicenseResponse({
    this.deletionDate,
    this.status,
  });

  factory DeleteLicenseResponse.fromJson(Map<String, dynamic> json) {
    return DeleteLicenseResponse(
      deletionDate: json['DeletionDate'] as String?,
      status: (json['Status'] as String?)?.toLicenseDeletionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final deletionDate = this.deletionDate;
    final status = this.status;
    return {
      if (deletionDate != null) 'DeletionDate': deletionDate,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DeleteTokenResponse {
  DeleteTokenResponse();

  factory DeleteTokenResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTokenResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DigitalSignatureMethod {
  jwtPs384,
}

extension DigitalSignatureMethodValueExtension on DigitalSignatureMethod {
  String toValue() {
    switch (this) {
      case DigitalSignatureMethod.jwtPs384:
        return 'JWT_PS384';
    }
  }
}

extension DigitalSignatureMethodFromString on String {
  DigitalSignatureMethod toDigitalSignatureMethod() {
    switch (this) {
      case 'JWT_PS384':
        return DigitalSignatureMethod.jwtPs384;
    }
    throw Exception('$this is not known in enum DigitalSignatureMethod');
  }
}

/// Describes a resource entitled for use with a license.
class Entitlement {
  /// Entitlement name.
  final String name;

  /// Entitlement unit.
  final EntitlementUnit unit;

  /// Indicates whether check-ins are allowed.
  final bool? allowCheckIn;

  /// Maximum entitlement count. Use if the unit is not None.
  final int? maxCount;

  /// Indicates whether overages are allowed.
  final bool? overage;

  /// Entitlement resource. Use only if the unit is None.
  final String? value;

  Entitlement({
    required this.name,
    required this.unit,
    this.allowCheckIn,
    this.maxCount,
    this.overage,
    this.value,
  });

  factory Entitlement.fromJson(Map<String, dynamic> json) {
    return Entitlement(
      name: json['Name'] as String,
      unit: (json['Unit'] as String).toEntitlementUnit(),
      allowCheckIn: json['AllowCheckIn'] as bool?,
      maxCount: json['MaxCount'] as int?,
      overage: json['Overage'] as bool?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final unit = this.unit;
    final allowCheckIn = this.allowCheckIn;
    final maxCount = this.maxCount;
    final overage = this.overage;
    final value = this.value;
    return {
      'Name': name,
      'Unit': unit.toValue(),
      if (allowCheckIn != null) 'AllowCheckIn': allowCheckIn,
      if (maxCount != null) 'MaxCount': maxCount,
      if (overage != null) 'Overage': overage,
      if (value != null) 'Value': value,
    };
  }
}

/// Data associated with an entitlement resource.
class EntitlementData {
  /// Entitlement data name.
  final String name;

  /// Entitlement data unit.
  final EntitlementDataUnit unit;

  /// Entitlement data value.
  final String? value;

  EntitlementData({
    required this.name,
    required this.unit,
    this.value,
  });

  factory EntitlementData.fromJson(Map<String, dynamic> json) {
    return EntitlementData(
      name: json['Name'] as String,
      unit: (json['Unit'] as String).toEntitlementDataUnit(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final unit = this.unit;
    final value = this.value;
    return {
      'Name': name,
      'Unit': unit.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum EntitlementDataUnit {
  count,
  none,
  seconds,
  microseconds,
  milliseconds,
  bytes,
  kilobytes,
  megabytes,
  gigabytes,
  terabytes,
  bits,
  kilobits,
  megabits,
  gigabits,
  terabits,
  percent,
  bytesSecond,
  kilobytesSecond,
  megabytesSecond,
  gigabytesSecond,
  terabytesSecond,
  bitsSecond,
  kilobitsSecond,
  megabitsSecond,
  gigabitsSecond,
  terabitsSecond,
  countSecond,
}

extension EntitlementDataUnitValueExtension on EntitlementDataUnit {
  String toValue() {
    switch (this) {
      case EntitlementDataUnit.count:
        return 'Count';
      case EntitlementDataUnit.none:
        return 'None';
      case EntitlementDataUnit.seconds:
        return 'Seconds';
      case EntitlementDataUnit.microseconds:
        return 'Microseconds';
      case EntitlementDataUnit.milliseconds:
        return 'Milliseconds';
      case EntitlementDataUnit.bytes:
        return 'Bytes';
      case EntitlementDataUnit.kilobytes:
        return 'Kilobytes';
      case EntitlementDataUnit.megabytes:
        return 'Megabytes';
      case EntitlementDataUnit.gigabytes:
        return 'Gigabytes';
      case EntitlementDataUnit.terabytes:
        return 'Terabytes';
      case EntitlementDataUnit.bits:
        return 'Bits';
      case EntitlementDataUnit.kilobits:
        return 'Kilobits';
      case EntitlementDataUnit.megabits:
        return 'Megabits';
      case EntitlementDataUnit.gigabits:
        return 'Gigabits';
      case EntitlementDataUnit.terabits:
        return 'Terabits';
      case EntitlementDataUnit.percent:
        return 'Percent';
      case EntitlementDataUnit.bytesSecond:
        return 'Bytes/Second';
      case EntitlementDataUnit.kilobytesSecond:
        return 'Kilobytes/Second';
      case EntitlementDataUnit.megabytesSecond:
        return 'Megabytes/Second';
      case EntitlementDataUnit.gigabytesSecond:
        return 'Gigabytes/Second';
      case EntitlementDataUnit.terabytesSecond:
        return 'Terabytes/Second';
      case EntitlementDataUnit.bitsSecond:
        return 'Bits/Second';
      case EntitlementDataUnit.kilobitsSecond:
        return 'Kilobits/Second';
      case EntitlementDataUnit.megabitsSecond:
        return 'Megabits/Second';
      case EntitlementDataUnit.gigabitsSecond:
        return 'Gigabits/Second';
      case EntitlementDataUnit.terabitsSecond:
        return 'Terabits/Second';
      case EntitlementDataUnit.countSecond:
        return 'Count/Second';
    }
  }
}

extension EntitlementDataUnitFromString on String {
  EntitlementDataUnit toEntitlementDataUnit() {
    switch (this) {
      case 'Count':
        return EntitlementDataUnit.count;
      case 'None':
        return EntitlementDataUnit.none;
      case 'Seconds':
        return EntitlementDataUnit.seconds;
      case 'Microseconds':
        return EntitlementDataUnit.microseconds;
      case 'Milliseconds':
        return EntitlementDataUnit.milliseconds;
      case 'Bytes':
        return EntitlementDataUnit.bytes;
      case 'Kilobytes':
        return EntitlementDataUnit.kilobytes;
      case 'Megabytes':
        return EntitlementDataUnit.megabytes;
      case 'Gigabytes':
        return EntitlementDataUnit.gigabytes;
      case 'Terabytes':
        return EntitlementDataUnit.terabytes;
      case 'Bits':
        return EntitlementDataUnit.bits;
      case 'Kilobits':
        return EntitlementDataUnit.kilobits;
      case 'Megabits':
        return EntitlementDataUnit.megabits;
      case 'Gigabits':
        return EntitlementDataUnit.gigabits;
      case 'Terabits':
        return EntitlementDataUnit.terabits;
      case 'Percent':
        return EntitlementDataUnit.percent;
      case 'Bytes/Second':
        return EntitlementDataUnit.bytesSecond;
      case 'Kilobytes/Second':
        return EntitlementDataUnit.kilobytesSecond;
      case 'Megabytes/Second':
        return EntitlementDataUnit.megabytesSecond;
      case 'Gigabytes/Second':
        return EntitlementDataUnit.gigabytesSecond;
      case 'Terabytes/Second':
        return EntitlementDataUnit.terabytesSecond;
      case 'Bits/Second':
        return EntitlementDataUnit.bitsSecond;
      case 'Kilobits/Second':
        return EntitlementDataUnit.kilobitsSecond;
      case 'Megabits/Second':
        return EntitlementDataUnit.megabitsSecond;
      case 'Gigabits/Second':
        return EntitlementDataUnit.gigabitsSecond;
      case 'Terabits/Second':
        return EntitlementDataUnit.terabitsSecond;
      case 'Count/Second':
        return EntitlementDataUnit.countSecond;
    }
    throw Exception('$this is not known in enum EntitlementDataUnit');
  }
}

enum EntitlementUnit {
  count,
  none,
  seconds,
  microseconds,
  milliseconds,
  bytes,
  kilobytes,
  megabytes,
  gigabytes,
  terabytes,
  bits,
  kilobits,
  megabits,
  gigabits,
  terabits,
  percent,
  bytesSecond,
  kilobytesSecond,
  megabytesSecond,
  gigabytesSecond,
  terabytesSecond,
  bitsSecond,
  kilobitsSecond,
  megabitsSecond,
  gigabitsSecond,
  terabitsSecond,
  countSecond,
}

extension EntitlementUnitValueExtension on EntitlementUnit {
  String toValue() {
    switch (this) {
      case EntitlementUnit.count:
        return 'Count';
      case EntitlementUnit.none:
        return 'None';
      case EntitlementUnit.seconds:
        return 'Seconds';
      case EntitlementUnit.microseconds:
        return 'Microseconds';
      case EntitlementUnit.milliseconds:
        return 'Milliseconds';
      case EntitlementUnit.bytes:
        return 'Bytes';
      case EntitlementUnit.kilobytes:
        return 'Kilobytes';
      case EntitlementUnit.megabytes:
        return 'Megabytes';
      case EntitlementUnit.gigabytes:
        return 'Gigabytes';
      case EntitlementUnit.terabytes:
        return 'Terabytes';
      case EntitlementUnit.bits:
        return 'Bits';
      case EntitlementUnit.kilobits:
        return 'Kilobits';
      case EntitlementUnit.megabits:
        return 'Megabits';
      case EntitlementUnit.gigabits:
        return 'Gigabits';
      case EntitlementUnit.terabits:
        return 'Terabits';
      case EntitlementUnit.percent:
        return 'Percent';
      case EntitlementUnit.bytesSecond:
        return 'Bytes/Second';
      case EntitlementUnit.kilobytesSecond:
        return 'Kilobytes/Second';
      case EntitlementUnit.megabytesSecond:
        return 'Megabytes/Second';
      case EntitlementUnit.gigabytesSecond:
        return 'Gigabytes/Second';
      case EntitlementUnit.terabytesSecond:
        return 'Terabytes/Second';
      case EntitlementUnit.bitsSecond:
        return 'Bits/Second';
      case EntitlementUnit.kilobitsSecond:
        return 'Kilobits/Second';
      case EntitlementUnit.megabitsSecond:
        return 'Megabits/Second';
      case EntitlementUnit.gigabitsSecond:
        return 'Gigabits/Second';
      case EntitlementUnit.terabitsSecond:
        return 'Terabits/Second';
      case EntitlementUnit.countSecond:
        return 'Count/Second';
    }
  }
}

extension EntitlementUnitFromString on String {
  EntitlementUnit toEntitlementUnit() {
    switch (this) {
      case 'Count':
        return EntitlementUnit.count;
      case 'None':
        return EntitlementUnit.none;
      case 'Seconds':
        return EntitlementUnit.seconds;
      case 'Microseconds':
        return EntitlementUnit.microseconds;
      case 'Milliseconds':
        return EntitlementUnit.milliseconds;
      case 'Bytes':
        return EntitlementUnit.bytes;
      case 'Kilobytes':
        return EntitlementUnit.kilobytes;
      case 'Megabytes':
        return EntitlementUnit.megabytes;
      case 'Gigabytes':
        return EntitlementUnit.gigabytes;
      case 'Terabytes':
        return EntitlementUnit.terabytes;
      case 'Bits':
        return EntitlementUnit.bits;
      case 'Kilobits':
        return EntitlementUnit.kilobits;
      case 'Megabits':
        return EntitlementUnit.megabits;
      case 'Gigabits':
        return EntitlementUnit.gigabits;
      case 'Terabits':
        return EntitlementUnit.terabits;
      case 'Percent':
        return EntitlementUnit.percent;
      case 'Bytes/Second':
        return EntitlementUnit.bytesSecond;
      case 'Kilobytes/Second':
        return EntitlementUnit.kilobytesSecond;
      case 'Megabytes/Second':
        return EntitlementUnit.megabytesSecond;
      case 'Gigabytes/Second':
        return EntitlementUnit.gigabytesSecond;
      case 'Terabytes/Second':
        return EntitlementUnit.terabytesSecond;
      case 'Bits/Second':
        return EntitlementUnit.bitsSecond;
      case 'Kilobits/Second':
        return EntitlementUnit.kilobitsSecond;
      case 'Megabits/Second':
        return EntitlementUnit.megabitsSecond;
      case 'Gigabits/Second':
        return EntitlementUnit.gigabitsSecond;
      case 'Terabits/Second':
        return EntitlementUnit.terabitsSecond;
      case 'Count/Second':
        return EntitlementUnit.countSecond;
    }
    throw Exception('$this is not known in enum EntitlementUnit');
  }
}

/// Usage associated with an entitlement resource.
class EntitlementUsage {
  /// Resource usage consumed.
  final String consumedValue;

  /// Entitlement usage name.
  final String name;

  /// Entitlement usage unit.
  final EntitlementDataUnit unit;

  /// Maximum entitlement usage count.
  final String? maxCount;

  EntitlementUsage({
    required this.consumedValue,
    required this.name,
    required this.unit,
    this.maxCount,
  });

  factory EntitlementUsage.fromJson(Map<String, dynamic> json) {
    return EntitlementUsage(
      consumedValue: json['ConsumedValue'] as String,
      name: json['Name'] as String,
      unit: (json['Unit'] as String).toEntitlementDataUnit(),
      maxCount: json['MaxCount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumedValue = this.consumedValue;
    final name = this.name;
    final unit = this.unit;
    final maxCount = this.maxCount;
    return {
      'ConsumedValue': consumedValue,
      'Name': name,
      'Unit': unit.toValue(),
      if (maxCount != null) 'MaxCount': maxCount,
    };
  }
}

class ExtendLicenseConsumptionResponse {
  /// Date and time at which the license consumption expires.
  final String? expiration;

  /// License consumption token.
  final String? licenseConsumptionToken;

  ExtendLicenseConsumptionResponse({
    this.expiration,
    this.licenseConsumptionToken,
  });

  factory ExtendLicenseConsumptionResponse.fromJson(Map<String, dynamic> json) {
    return ExtendLicenseConsumptionResponse(
      expiration: json['Expiration'] as String?,
      licenseConsumptionToken: json['LicenseConsumptionToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expiration = this.expiration;
    final licenseConsumptionToken = this.licenseConsumptionToken;
    return {
      if (expiration != null) 'Expiration': expiration,
      if (licenseConsumptionToken != null)
        'LicenseConsumptionToken': licenseConsumptionToken,
    };
  }
}

/// A filter name and value pair that is used to return more specific results
/// from a describe operation. Filters can be used to match a set of resources
/// by specific criteria, such as tags, attributes, or IDs.
class Filter {
  /// Name of the filter. Filter names are case-sensitive.
  final String? name;

  /// The value of the filter, which is case-sensitive. You can only specify one
  /// value for the filter.
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

class GetAccessTokenResponse {
  /// Temporary access token.
  final String? accessToken;

  GetAccessTokenResponse({
    this.accessToken,
  });

  factory GetAccessTokenResponse.fromJson(Map<String, dynamic> json) {
    return GetAccessTokenResponse(
      accessToken: json['AccessToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    return {
      if (accessToken != null) 'AccessToken': accessToken,
    };
  }
}

class GetGrantResponse {
  /// Grant details.
  final Grant? grant;

  GetGrantResponse({
    this.grant,
  });

  factory GetGrantResponse.fromJson(Map<String, dynamic> json) {
    return GetGrantResponse(
      grant: json['Grant'] != null
          ? Grant.fromJson(json['Grant'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final grant = this.grant;
    return {
      if (grant != null) 'Grant': grant,
    };
  }
}

class GetLicenseConfigurationResponse {
  /// Automated discovery information.
  final AutomatedDiscoveryInformation? automatedDiscoveryInformation;

  /// Summaries of the licenses consumed by resources.
  final List<ConsumedLicenseSummary>? consumedLicenseSummaryList;

  /// Number of licenses assigned to resources.
  final int? consumedLicenses;

  /// Description of the license configuration.
  final String? description;

  /// When true, disassociates a resource when software is uninstalled.
  final bool? disassociateWhenNotFound;

  /// Amazon Resource Name (ARN) of the license configuration.
  final String? licenseConfigurationArn;

  /// Unique ID for the license configuration.
  final String? licenseConfigurationId;

  /// Number of available licenses.
  final int? licenseCount;

  /// Sets the number of available licenses as a hard limit.
  final bool? licenseCountHardLimit;

  /// Dimension for which the licenses are counted.
  final LicenseCountingType? licenseCountingType;

  /// License rules.
  final List<String>? licenseRules;

  /// Summaries of the managed resources.
  final List<ManagedResourceSummary>? managedResourceSummaryList;

  /// Name of the license configuration.
  final String? name;

  /// Account ID of the owner of the license configuration.
  final String? ownerAccountId;

  /// Product information.
  final List<ProductInformation>? productInformationList;

  /// License configuration status.
  final String? status;

  /// Tags for the license configuration.
  final List<Tag>? tags;

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

  factory GetLicenseConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetLicenseConfigurationResponse(
      automatedDiscoveryInformation:
          json['AutomatedDiscoveryInformation'] != null
              ? AutomatedDiscoveryInformation.fromJson(
                  json['AutomatedDiscoveryInformation'] as Map<String, dynamic>)
              : null,
      consumedLicenseSummaryList: (json['ConsumedLicenseSummaryList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ConsumedLicenseSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      consumedLicenses: json['ConsumedLicenses'] as int?,
      description: json['Description'] as String?,
      disassociateWhenNotFound: json['DisassociateWhenNotFound'] as bool?,
      licenseConfigurationArn: json['LicenseConfigurationArn'] as String?,
      licenseConfigurationId: json['LicenseConfigurationId'] as String?,
      licenseCount: json['LicenseCount'] as int?,
      licenseCountHardLimit: json['LicenseCountHardLimit'] as bool?,
      licenseCountingType:
          (json['LicenseCountingType'] as String?)?.toLicenseCountingType(),
      licenseRules: (json['LicenseRules'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      managedResourceSummaryList: (json['ManagedResourceSummaryList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ManagedResourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      productInformationList: (json['ProductInformationList'] as List?)
          ?.whereNotNull()
          .map((e) => ProductInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['Status'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final automatedDiscoveryInformation = this.automatedDiscoveryInformation;
    final consumedLicenseSummaryList = this.consumedLicenseSummaryList;
    final consumedLicenses = this.consumedLicenses;
    final description = this.description;
    final disassociateWhenNotFound = this.disassociateWhenNotFound;
    final licenseConfigurationArn = this.licenseConfigurationArn;
    final licenseConfigurationId = this.licenseConfigurationId;
    final licenseCount = this.licenseCount;
    final licenseCountHardLimit = this.licenseCountHardLimit;
    final licenseCountingType = this.licenseCountingType;
    final licenseRules = this.licenseRules;
    final managedResourceSummaryList = this.managedResourceSummaryList;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final productInformationList = this.productInformationList;
    final status = this.status;
    final tags = this.tags;
    return {
      if (automatedDiscoveryInformation != null)
        'AutomatedDiscoveryInformation': automatedDiscoveryInformation,
      if (consumedLicenseSummaryList != null)
        'ConsumedLicenseSummaryList': consumedLicenseSummaryList,
      if (consumedLicenses != null) 'ConsumedLicenses': consumedLicenses,
      if (description != null) 'Description': description,
      if (disassociateWhenNotFound != null)
        'DisassociateWhenNotFound': disassociateWhenNotFound,
      if (licenseConfigurationArn != null)
        'LicenseConfigurationArn': licenseConfigurationArn,
      if (licenseConfigurationId != null)
        'LicenseConfigurationId': licenseConfigurationId,
      if (licenseCount != null) 'LicenseCount': licenseCount,
      if (licenseCountHardLimit != null)
        'LicenseCountHardLimit': licenseCountHardLimit,
      if (licenseCountingType != null)
        'LicenseCountingType': licenseCountingType.toValue(),
      if (licenseRules != null) 'LicenseRules': licenseRules,
      if (managedResourceSummaryList != null)
        'ManagedResourceSummaryList': managedResourceSummaryList,
      if (name != null) 'Name': name,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (productInformationList != null)
        'ProductInformationList': productInformationList,
      if (status != null) 'Status': status,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetLicenseConversionTaskResponse {
  /// Information about the license type converted to.
  final LicenseConversionContext? destinationLicenseContext;

  /// Time at which the license type conversion task was completed.
  final DateTime? endTime;

  /// ID of the license type conversion task.
  final String? licenseConversionTaskId;

  /// Amount of time to complete the license type conversion.
  final DateTime? licenseConversionTime;

  /// Amazon Resource Names (ARN) of the resources the license conversion task is
  /// associated with.
  final String? resourceArn;

  /// Information about the license type converted from.
  final LicenseConversionContext? sourceLicenseContext;

  /// Time at which the license type conversion task was started .
  final DateTime? startTime;

  /// Status of the license type conversion task.
  final LicenseConversionTaskStatus? status;

  /// The status message for the conversion task.
  final String? statusMessage;

  GetLicenseConversionTaskResponse({
    this.destinationLicenseContext,
    this.endTime,
    this.licenseConversionTaskId,
    this.licenseConversionTime,
    this.resourceArn,
    this.sourceLicenseContext,
    this.startTime,
    this.status,
    this.statusMessage,
  });

  factory GetLicenseConversionTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetLicenseConversionTaskResponse(
      destinationLicenseContext: json['DestinationLicenseContext'] != null
          ? LicenseConversionContext.fromJson(
              json['DestinationLicenseContext'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['EndTime']),
      licenseConversionTaskId: json['LicenseConversionTaskId'] as String?,
      licenseConversionTime: timeStampFromJson(json['LicenseConversionTime']),
      resourceArn: json['ResourceArn'] as String?,
      sourceLicenseContext: json['SourceLicenseContext'] != null
          ? LicenseConversionContext.fromJson(
              json['SourceLicenseContext'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toLicenseConversionTaskStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationLicenseContext = this.destinationLicenseContext;
    final endTime = this.endTime;
    final licenseConversionTaskId = this.licenseConversionTaskId;
    final licenseConversionTime = this.licenseConversionTime;
    final resourceArn = this.resourceArn;
    final sourceLicenseContext = this.sourceLicenseContext;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (destinationLicenseContext != null)
        'DestinationLicenseContext': destinationLicenseContext,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (licenseConversionTaskId != null)
        'LicenseConversionTaskId': licenseConversionTaskId,
      if (licenseConversionTime != null)
        'LicenseConversionTime': unixTimestampToJson(licenseConversionTime),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (sourceLicenseContext != null)
        'SourceLicenseContext': sourceLicenseContext,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class GetLicenseManagerReportGeneratorResponse {
  /// A report generator that creates periodic reports about your license
  /// configurations.
  final ReportGenerator? reportGenerator;

  GetLicenseManagerReportGeneratorResponse({
    this.reportGenerator,
  });

  factory GetLicenseManagerReportGeneratorResponse.fromJson(
      Map<String, dynamic> json) {
    return GetLicenseManagerReportGeneratorResponse(
      reportGenerator: json['ReportGenerator'] != null
          ? ReportGenerator.fromJson(
              json['ReportGenerator'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reportGenerator = this.reportGenerator;
    return {
      if (reportGenerator != null) 'ReportGenerator': reportGenerator,
    };
  }
}

class GetLicenseResponse {
  /// License details.
  final License? license;

  GetLicenseResponse({
    this.license,
  });

  factory GetLicenseResponse.fromJson(Map<String, dynamic> json) {
    return GetLicenseResponse(
      license: json['License'] != null
          ? License.fromJson(json['License'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final license = this.license;
    return {
      if (license != null) 'License': license,
    };
  }
}

class GetLicenseUsageResponse {
  /// License usage details.
  final LicenseUsage? licenseUsage;

  GetLicenseUsageResponse({
    this.licenseUsage,
  });

  factory GetLicenseUsageResponse.fromJson(Map<String, dynamic> json) {
    return GetLicenseUsageResponse(
      licenseUsage: json['LicenseUsage'] != null
          ? LicenseUsage.fromJson(json['LicenseUsage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseUsage = this.licenseUsage;
    return {
      if (licenseUsage != null) 'LicenseUsage': licenseUsage,
    };
  }
}

class GetServiceSettingsResponse {
  /// Indicates whether cross-account discovery is enabled.
  final bool? enableCrossAccountsDiscovery;

  /// Amazon Resource Name (ARN) of the resource share. The License Manager
  /// management account provides member accounts with access to this share.
  final String? licenseManagerResourceShareArn;

  /// Indicates whether Organizations is integrated with License Manager for
  /// cross-account discovery.
  final OrganizationConfiguration? organizationConfiguration;

  /// Regional S3 bucket path for storing reports, license trail event data,
  /// discovery data, and so on.
  final String? s3BucketArn;

  /// SNS topic configured to receive notifications from License Manager.
  final String? snsTopicArn;

  GetServiceSettingsResponse({
    this.enableCrossAccountsDiscovery,
    this.licenseManagerResourceShareArn,
    this.organizationConfiguration,
    this.s3BucketArn,
    this.snsTopicArn,
  });

  factory GetServiceSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceSettingsResponse(
      enableCrossAccountsDiscovery:
          json['EnableCrossAccountsDiscovery'] as bool?,
      licenseManagerResourceShareArn:
          json['LicenseManagerResourceShareArn'] as String?,
      organizationConfiguration: json['OrganizationConfiguration'] != null
          ? OrganizationConfiguration.fromJson(
              json['OrganizationConfiguration'] as Map<String, dynamic>)
          : null,
      s3BucketArn: json['S3BucketArn'] as String?,
      snsTopicArn: json['SnsTopicArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableCrossAccountsDiscovery = this.enableCrossAccountsDiscovery;
    final licenseManagerResourceShareArn = this.licenseManagerResourceShareArn;
    final organizationConfiguration = this.organizationConfiguration;
    final s3BucketArn = this.s3BucketArn;
    final snsTopicArn = this.snsTopicArn;
    return {
      if (enableCrossAccountsDiscovery != null)
        'EnableCrossAccountsDiscovery': enableCrossAccountsDiscovery,
      if (licenseManagerResourceShareArn != null)
        'LicenseManagerResourceShareArn': licenseManagerResourceShareArn,
      if (organizationConfiguration != null)
        'OrganizationConfiguration': organizationConfiguration,
      if (s3BucketArn != null) 'S3BucketArn': s3BucketArn,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
    };
  }
}

/// Describes a grant.
class Grant {
  /// Amazon Resource Name (ARN) of the grant.
  final String grantArn;

  /// Grant name.
  final String grantName;

  /// Grant status.
  final GrantStatus grantStatus;

  /// Granted operations.
  final List<AllowedOperation> grantedOperations;

  /// The grantee principal ARN.
  final String granteePrincipalArn;

  /// Home Region of the grant.
  final String homeRegion;

  /// License ARN.
  final String licenseArn;

  /// Parent ARN.
  final String parentArn;

  /// Grant version.
  final String version;

  /// The options specified for the grant.
  final Options? options;

  /// Grant status reason.
  final String? statusReason;

  Grant({
    required this.grantArn,
    required this.grantName,
    required this.grantStatus,
    required this.grantedOperations,
    required this.granteePrincipalArn,
    required this.homeRegion,
    required this.licenseArn,
    required this.parentArn,
    required this.version,
    this.options,
    this.statusReason,
  });

  factory Grant.fromJson(Map<String, dynamic> json) {
    return Grant(
      grantArn: json['GrantArn'] as String,
      grantName: json['GrantName'] as String,
      grantStatus: (json['GrantStatus'] as String).toGrantStatus(),
      grantedOperations: (json['GrantedOperations'] as List)
          .whereNotNull()
          .map((e) => (e as String).toAllowedOperation())
          .toList(),
      granteePrincipalArn: json['GranteePrincipalArn'] as String,
      homeRegion: json['HomeRegion'] as String,
      licenseArn: json['LicenseArn'] as String,
      parentArn: json['ParentArn'] as String,
      version: json['Version'] as String,
      options: json['Options'] != null
          ? Options.fromJson(json['Options'] as Map<String, dynamic>)
          : null,
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grantArn = this.grantArn;
    final grantName = this.grantName;
    final grantStatus = this.grantStatus;
    final grantedOperations = this.grantedOperations;
    final granteePrincipalArn = this.granteePrincipalArn;
    final homeRegion = this.homeRegion;
    final licenseArn = this.licenseArn;
    final parentArn = this.parentArn;
    final version = this.version;
    final options = this.options;
    final statusReason = this.statusReason;
    return {
      'GrantArn': grantArn,
      'GrantName': grantName,
      'GrantStatus': grantStatus.toValue(),
      'GrantedOperations': grantedOperations.map((e) => e.toValue()).toList(),
      'GranteePrincipalArn': granteePrincipalArn,
      'HomeRegion': homeRegion,
      'LicenseArn': licenseArn,
      'ParentArn': parentArn,
      'Version': version,
      if (options != null) 'Options': options,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum GrantStatus {
  pendingWorkflow,
  pendingAccept,
  rejected,
  active,
  failedWorkflow,
  deleted,
  pendingDelete,
  disabled,
  workflowCompleted,
}

extension GrantStatusValueExtension on GrantStatus {
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
      case GrantStatus.workflowCompleted:
        return 'WORKFLOW_COMPLETED';
    }
  }
}

extension GrantStatusFromString on String {
  GrantStatus toGrantStatus() {
    switch (this) {
      case 'PENDING_WORKFLOW':
        return GrantStatus.pendingWorkflow;
      case 'PENDING_ACCEPT':
        return GrantStatus.pendingAccept;
      case 'REJECTED':
        return GrantStatus.rejected;
      case 'ACTIVE':
        return GrantStatus.active;
      case 'FAILED_WORKFLOW':
        return GrantStatus.failedWorkflow;
      case 'DELETED':
        return GrantStatus.deleted;
      case 'PENDING_DELETE':
        return GrantStatus.pendingDelete;
      case 'DISABLED':
        return GrantStatus.disabled;
      case 'WORKFLOW_COMPLETED':
        return GrantStatus.workflowCompleted;
    }
    throw Exception('$this is not known in enum GrantStatus');
  }
}

/// Describes a license that is granted to a grantee.
class GrantedLicense {
  /// Granted license beneficiary.
  final String? beneficiary;

  /// Configuration for consumption of the license.
  final ConsumptionConfiguration? consumptionConfiguration;

  /// Creation time of the granted license.
  final String? createTime;

  /// License entitlements.
  final List<Entitlement>? entitlements;

  /// Home Region of the granted license.
  final String? homeRegion;

  /// Granted license issuer.
  final IssuerDetails? issuer;

  /// Amazon Resource Name (ARN) of the license.
  final String? licenseArn;

  /// Granted license metadata.
  final List<Metadata>? licenseMetadata;

  /// License name.
  final String? licenseName;

  /// Product name.
  final String? productName;

  /// Product SKU.
  final String? productSKU;

  /// Granted license received metadata.
  final ReceivedMetadata? receivedMetadata;

  /// Granted license status.
  final LicenseStatus? status;

  /// Date and time range during which the granted license is valid, in
  /// ISO8601-UTC format.
  final DatetimeRange? validity;

  /// Version of the granted license.
  final String? version;

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

  factory GrantedLicense.fromJson(Map<String, dynamic> json) {
    return GrantedLicense(
      beneficiary: json['Beneficiary'] as String?,
      consumptionConfiguration: json['ConsumptionConfiguration'] != null
          ? ConsumptionConfiguration.fromJson(
              json['ConsumptionConfiguration'] as Map<String, dynamic>)
          : null,
      createTime: json['CreateTime'] as String?,
      entitlements: (json['Entitlements'] as List?)
          ?.whereNotNull()
          .map((e) => Entitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeRegion: json['HomeRegion'] as String?,
      issuer: json['Issuer'] != null
          ? IssuerDetails.fromJson(json['Issuer'] as Map<String, dynamic>)
          : null,
      licenseArn: json['LicenseArn'] as String?,
      licenseMetadata: (json['LicenseMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => Metadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      licenseName: json['LicenseName'] as String?,
      productName: json['ProductName'] as String?,
      productSKU: json['ProductSKU'] as String?,
      receivedMetadata: json['ReceivedMetadata'] != null
          ? ReceivedMetadata.fromJson(
              json['ReceivedMetadata'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toLicenseStatus(),
      validity: json['Validity'] != null
          ? DatetimeRange.fromJson(json['Validity'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final beneficiary = this.beneficiary;
    final consumptionConfiguration = this.consumptionConfiguration;
    final createTime = this.createTime;
    final entitlements = this.entitlements;
    final homeRegion = this.homeRegion;
    final issuer = this.issuer;
    final licenseArn = this.licenseArn;
    final licenseMetadata = this.licenseMetadata;
    final licenseName = this.licenseName;
    final productName = this.productName;
    final productSKU = this.productSKU;
    final receivedMetadata = this.receivedMetadata;
    final status = this.status;
    final validity = this.validity;
    final version = this.version;
    return {
      if (beneficiary != null) 'Beneficiary': beneficiary,
      if (consumptionConfiguration != null)
        'ConsumptionConfiguration': consumptionConfiguration,
      if (createTime != null) 'CreateTime': createTime,
      if (entitlements != null) 'Entitlements': entitlements,
      if (homeRegion != null) 'HomeRegion': homeRegion,
      if (issuer != null) 'Issuer': issuer,
      if (licenseArn != null) 'LicenseArn': licenseArn,
      if (licenseMetadata != null) 'LicenseMetadata': licenseMetadata,
      if (licenseName != null) 'LicenseName': licenseName,
      if (productName != null) 'ProductName': productName,
      if (productSKU != null) 'ProductSKU': productSKU,
      if (receivedMetadata != null) 'ReceivedMetadata': receivedMetadata,
      if (status != null) 'Status': status.toValue(),
      if (validity != null) 'Validity': validity,
      if (version != null) 'Version': version,
    };
  }
}

/// An inventory filter.
class InventoryFilter {
  /// Condition of the filter.
  final InventoryFilterCondition condition;

  /// Name of the filter.
  final String name;

  /// Value of the filter.
  final String? value;

  InventoryFilter({
    required this.condition,
    required this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final name = this.name;
    final value = this.value;
    return {
      'Condition': condition.toValue(),
      'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

enum InventoryFilterCondition {
  equals,
  notEquals,
  beginsWith,
  contains,
}

extension InventoryFilterConditionValueExtension on InventoryFilterCondition {
  String toValue() {
    switch (this) {
      case InventoryFilterCondition.equals:
        return 'EQUALS';
      case InventoryFilterCondition.notEquals:
        return 'NOT_EQUALS';
      case InventoryFilterCondition.beginsWith:
        return 'BEGINS_WITH';
      case InventoryFilterCondition.contains:
        return 'CONTAINS';
    }
  }
}

extension InventoryFilterConditionFromString on String {
  InventoryFilterCondition toInventoryFilterCondition() {
    switch (this) {
      case 'EQUALS':
        return InventoryFilterCondition.equals;
      case 'NOT_EQUALS':
        return InventoryFilterCondition.notEquals;
      case 'BEGINS_WITH':
        return InventoryFilterCondition.beginsWith;
      case 'CONTAINS':
        return InventoryFilterCondition.contains;
    }
    throw Exception('$this is not known in enum InventoryFilterCondition');
  }
}

/// Details about the issuer of a license.
class Issuer {
  /// Issuer name.
  final String name;

  /// Asymmetric KMS key from Key Management Service. The KMS key must have a key
  /// usage of sign and verify, and support the RSASSA-PSS SHA-256 signing
  /// algorithm.
  final String? signKey;

  Issuer({
    required this.name,
    this.signKey,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final signKey = this.signKey;
    return {
      'Name': name,
      if (signKey != null) 'SignKey': signKey,
    };
  }
}

/// Details associated with the issuer of a license.
class IssuerDetails {
  /// Issuer key fingerprint.
  final String? keyFingerprint;

  /// Issuer name.
  final String? name;

  /// Asymmetric KMS key from Key Management Service. The KMS key must have a key
  /// usage of sign and verify, and support the RSASSA-PSS SHA-256 signing
  /// algorithm.
  final String? signKey;

  IssuerDetails({
    this.keyFingerprint,
    this.name,
    this.signKey,
  });

  factory IssuerDetails.fromJson(Map<String, dynamic> json) {
    return IssuerDetails(
      keyFingerprint: json['KeyFingerprint'] as String?,
      name: json['Name'] as String?,
      signKey: json['SignKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyFingerprint = this.keyFingerprint;
    final name = this.name;
    final signKey = this.signKey;
    return {
      if (keyFingerprint != null) 'KeyFingerprint': keyFingerprint,
      if (name != null) 'Name': name,
      if (signKey != null) 'SignKey': signKey,
    };
  }
}

/// Software license that is managed in License Manager.
class License {
  /// License beneficiary.
  final String? beneficiary;

  /// Configuration for consumption of the license.
  final ConsumptionConfiguration? consumptionConfiguration;

  /// License creation time.
  final String? createTime;

  /// License entitlements.
  final List<Entitlement>? entitlements;

  /// Home Region of the license.
  final String? homeRegion;

  /// License issuer.
  final IssuerDetails? issuer;

  /// Amazon Resource Name (ARN) of the license.
  final String? licenseArn;

  /// License metadata.
  final List<Metadata>? licenseMetadata;

  /// License name.
  final String? licenseName;

  /// Product name.
  final String? productName;

  /// Product SKU.
  final String? productSKU;

  /// License status.
  final LicenseStatus? status;

  /// Date and time range during which the license is valid, in ISO8601-UTC
  /// format.
  final DatetimeRange? validity;

  /// License version.
  final String? version;

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

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      beneficiary: json['Beneficiary'] as String?,
      consumptionConfiguration: json['ConsumptionConfiguration'] != null
          ? ConsumptionConfiguration.fromJson(
              json['ConsumptionConfiguration'] as Map<String, dynamic>)
          : null,
      createTime: json['CreateTime'] as String?,
      entitlements: (json['Entitlements'] as List?)
          ?.whereNotNull()
          .map((e) => Entitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeRegion: json['HomeRegion'] as String?,
      issuer: json['Issuer'] != null
          ? IssuerDetails.fromJson(json['Issuer'] as Map<String, dynamic>)
          : null,
      licenseArn: json['LicenseArn'] as String?,
      licenseMetadata: (json['LicenseMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => Metadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      licenseName: json['LicenseName'] as String?,
      productName: json['ProductName'] as String?,
      productSKU: json['ProductSKU'] as String?,
      status: (json['Status'] as String?)?.toLicenseStatus(),
      validity: json['Validity'] != null
          ? DatetimeRange.fromJson(json['Validity'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final beneficiary = this.beneficiary;
    final consumptionConfiguration = this.consumptionConfiguration;
    final createTime = this.createTime;
    final entitlements = this.entitlements;
    final homeRegion = this.homeRegion;
    final issuer = this.issuer;
    final licenseArn = this.licenseArn;
    final licenseMetadata = this.licenseMetadata;
    final licenseName = this.licenseName;
    final productName = this.productName;
    final productSKU = this.productSKU;
    final status = this.status;
    final validity = this.validity;
    final version = this.version;
    return {
      if (beneficiary != null) 'Beneficiary': beneficiary,
      if (consumptionConfiguration != null)
        'ConsumptionConfiguration': consumptionConfiguration,
      if (createTime != null) 'CreateTime': createTime,
      if (entitlements != null) 'Entitlements': entitlements,
      if (homeRegion != null) 'HomeRegion': homeRegion,
      if (issuer != null) 'Issuer': issuer,
      if (licenseArn != null) 'LicenseArn': licenseArn,
      if (licenseMetadata != null) 'LicenseMetadata': licenseMetadata,
      if (licenseName != null) 'LicenseName': licenseName,
      if (productName != null) 'ProductName': productName,
      if (productSKU != null) 'ProductSKU': productSKU,
      if (status != null) 'Status': status.toValue(),
      if (validity != null) 'Validity': validity,
      if (version != null) 'Version': version,
    };
  }
}

/// A license configuration is an abstraction of a customer license agreement
/// that can be consumed and enforced by License Manager. Components include
/// specifications for the license type (licensing by instance, socket, CPU, or
/// vCPU), allowed tenancy (shared tenancy, Dedicated Instance, Dedicated Host,
/// or all of these), host affinity (how long a VM must be associated with a
/// host), and the number of licenses purchased and used.
class LicenseConfiguration {
  /// Automated discovery information.
  final AutomatedDiscoveryInformation? automatedDiscoveryInformation;

  /// Summaries for licenses consumed by various resources.
  final List<ConsumedLicenseSummary>? consumedLicenseSummaryList;

  /// Number of licenses consumed.
  final int? consumedLicenses;

  /// Description of the license configuration.
  final String? description;

  /// When true, disassociates a resource when software is uninstalled.
  final bool? disassociateWhenNotFound;

  /// Amazon Resource Name (ARN) of the license configuration.
  final String? licenseConfigurationArn;

  /// Unique ID of the license configuration.
  final String? licenseConfigurationId;

  /// Number of licenses managed by the license configuration.
  final int? licenseCount;

  /// Number of available licenses as a hard limit.
  final bool? licenseCountHardLimit;

  /// Dimension to use to track the license inventory.
  final LicenseCountingType? licenseCountingType;

  /// License rules.
  final List<String>? licenseRules;

  /// Summaries for managed resources.
  final List<ManagedResourceSummary>? managedResourceSummaryList;

  /// Name of the license configuration.
  final String? name;

  /// Account ID of the license configuration's owner.
  final String? ownerAccountId;

  /// Product information.
  final List<ProductInformation>? productInformationList;

  /// Status of the license configuration.
  final String? status;

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

  factory LicenseConfiguration.fromJson(Map<String, dynamic> json) {
    return LicenseConfiguration(
      automatedDiscoveryInformation:
          json['AutomatedDiscoveryInformation'] != null
              ? AutomatedDiscoveryInformation.fromJson(
                  json['AutomatedDiscoveryInformation'] as Map<String, dynamic>)
              : null,
      consumedLicenseSummaryList: (json['ConsumedLicenseSummaryList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ConsumedLicenseSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      consumedLicenses: json['ConsumedLicenses'] as int?,
      description: json['Description'] as String?,
      disassociateWhenNotFound: json['DisassociateWhenNotFound'] as bool?,
      licenseConfigurationArn: json['LicenseConfigurationArn'] as String?,
      licenseConfigurationId: json['LicenseConfigurationId'] as String?,
      licenseCount: json['LicenseCount'] as int?,
      licenseCountHardLimit: json['LicenseCountHardLimit'] as bool?,
      licenseCountingType:
          (json['LicenseCountingType'] as String?)?.toLicenseCountingType(),
      licenseRules: (json['LicenseRules'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      managedResourceSummaryList: (json['ManagedResourceSummaryList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ManagedResourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      productInformationList: (json['ProductInformationList'] as List?)
          ?.whereNotNull()
          .map((e) => ProductInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automatedDiscoveryInformation = this.automatedDiscoveryInformation;
    final consumedLicenseSummaryList = this.consumedLicenseSummaryList;
    final consumedLicenses = this.consumedLicenses;
    final description = this.description;
    final disassociateWhenNotFound = this.disassociateWhenNotFound;
    final licenseConfigurationArn = this.licenseConfigurationArn;
    final licenseConfigurationId = this.licenseConfigurationId;
    final licenseCount = this.licenseCount;
    final licenseCountHardLimit = this.licenseCountHardLimit;
    final licenseCountingType = this.licenseCountingType;
    final licenseRules = this.licenseRules;
    final managedResourceSummaryList = this.managedResourceSummaryList;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final productInformationList = this.productInformationList;
    final status = this.status;
    return {
      if (automatedDiscoveryInformation != null)
        'AutomatedDiscoveryInformation': automatedDiscoveryInformation,
      if (consumedLicenseSummaryList != null)
        'ConsumedLicenseSummaryList': consumedLicenseSummaryList,
      if (consumedLicenses != null) 'ConsumedLicenses': consumedLicenses,
      if (description != null) 'Description': description,
      if (disassociateWhenNotFound != null)
        'DisassociateWhenNotFound': disassociateWhenNotFound,
      if (licenseConfigurationArn != null)
        'LicenseConfigurationArn': licenseConfigurationArn,
      if (licenseConfigurationId != null)
        'LicenseConfigurationId': licenseConfigurationId,
      if (licenseCount != null) 'LicenseCount': licenseCount,
      if (licenseCountHardLimit != null)
        'LicenseCountHardLimit': licenseCountHardLimit,
      if (licenseCountingType != null)
        'LicenseCountingType': licenseCountingType.toValue(),
      if (licenseRules != null) 'LicenseRules': licenseRules,
      if (managedResourceSummaryList != null)
        'ManagedResourceSummaryList': managedResourceSummaryList,
      if (name != null) 'Name': name,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (productInformationList != null)
        'ProductInformationList': productInformationList,
      if (status != null) 'Status': status,
    };
  }
}

/// Describes an association with a license configuration.
class LicenseConfigurationAssociation {
  /// Scope of AMI associations. The possible value is <code>cross-account</code>.
  final String? amiAssociationScope;

  /// Time when the license configuration was associated with the resource.
  final DateTime? associationTime;

  /// Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// ID of the Amazon Web Services account that owns the resource consuming
  /// licenses.
  final String? resourceOwnerId;

  /// Type of server resource.
  final ResourceType? resourceType;

  LicenseConfigurationAssociation({
    this.amiAssociationScope,
    this.associationTime,
    this.resourceArn,
    this.resourceOwnerId,
    this.resourceType,
  });

  factory LicenseConfigurationAssociation.fromJson(Map<String, dynamic> json) {
    return LicenseConfigurationAssociation(
      amiAssociationScope: json['AmiAssociationScope'] as String?,
      associationTime: timeStampFromJson(json['AssociationTime']),
      resourceArn: json['ResourceArn'] as String?,
      resourceOwnerId: json['ResourceOwnerId'] as String?,
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final amiAssociationScope = this.amiAssociationScope;
    final associationTime = this.associationTime;
    final resourceArn = this.resourceArn;
    final resourceOwnerId = this.resourceOwnerId;
    final resourceType = this.resourceType;
    return {
      if (amiAssociationScope != null)
        'AmiAssociationScope': amiAssociationScope,
      if (associationTime != null)
        'AssociationTime': unixTimestampToJson(associationTime),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceOwnerId != null) 'ResourceOwnerId': resourceOwnerId,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
  }
}

enum LicenseConfigurationStatus {
  available,
  disabled,
}

extension LicenseConfigurationStatusValueExtension
    on LicenseConfigurationStatus {
  String toValue() {
    switch (this) {
      case LicenseConfigurationStatus.available:
        return 'AVAILABLE';
      case LicenseConfigurationStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension LicenseConfigurationStatusFromString on String {
  LicenseConfigurationStatus toLicenseConfigurationStatus() {
    switch (this) {
      case 'AVAILABLE':
        return LicenseConfigurationStatus.available;
      case 'DISABLED':
        return LicenseConfigurationStatus.disabled;
    }
    throw Exception('$this is not known in enum LicenseConfigurationStatus');
  }
}

/// Details about the usage of a resource associated with a license
/// configuration.
class LicenseConfigurationUsage {
  /// Time when the license configuration was initially associated with the
  /// resource.
  final DateTime? associationTime;

  /// Number of licenses consumed by the resource.
  final int? consumedLicenses;

  /// Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// ID of the account that owns the resource.
  final String? resourceOwnerId;

  /// Status of the resource.
  final String? resourceStatus;

  /// Type of resource.
  final ResourceType? resourceType;

  LicenseConfigurationUsage({
    this.associationTime,
    this.consumedLicenses,
    this.resourceArn,
    this.resourceOwnerId,
    this.resourceStatus,
    this.resourceType,
  });

  factory LicenseConfigurationUsage.fromJson(Map<String, dynamic> json) {
    return LicenseConfigurationUsage(
      associationTime: timeStampFromJson(json['AssociationTime']),
      consumedLicenses: json['ConsumedLicenses'] as int?,
      resourceArn: json['ResourceArn'] as String?,
      resourceOwnerId: json['ResourceOwnerId'] as String?,
      resourceStatus: json['ResourceStatus'] as String?,
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final associationTime = this.associationTime;
    final consumedLicenses = this.consumedLicenses;
    final resourceArn = this.resourceArn;
    final resourceOwnerId = this.resourceOwnerId;
    final resourceStatus = this.resourceStatus;
    final resourceType = this.resourceType;
    return {
      if (associationTime != null)
        'AssociationTime': unixTimestampToJson(associationTime),
      if (consumedLicenses != null) 'ConsumedLicenses': consumedLicenses,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceOwnerId != null) 'ResourceOwnerId': resourceOwnerId,
      if (resourceStatus != null) 'ResourceStatus': resourceStatus,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
  }
}

/// Information about a license type conversion task.
class LicenseConversionContext {
  /// The Usage operation value that corresponds to the license type you are
  /// converting your resource from. For more information about which platforms
  /// correspond to which usage operation values see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/billing-info-fields.html#billing-info">Sample
  /// data: usage operation by platform </a>
  final String? usageOperation;

  LicenseConversionContext({
    this.usageOperation,
  });

  factory LicenseConversionContext.fromJson(Map<String, dynamic> json) {
    return LicenseConversionContext(
      usageOperation: json['UsageOperation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final usageOperation = this.usageOperation;
    return {
      if (usageOperation != null) 'UsageOperation': usageOperation,
    };
  }
}

/// Information about a license type conversion task.
class LicenseConversionTask {
  /// Information about the license type this conversion task converted to.
  final LicenseConversionContext? destinationLicenseContext;

  /// The time the conversion task was completed.
  final DateTime? endTime;

  /// The ID of the license type conversion task.
  final String? licenseConversionTaskId;

  /// The time the usage operation value of the resource was changed.
  final DateTime? licenseConversionTime;

  /// The Amazon Resource Name (ARN) of the resource associated with the license
  /// type conversion task.
  final String? resourceArn;

  /// Information about the license type this conversion task converted from.
  final LicenseConversionContext? sourceLicenseContext;

  /// The time the conversion task was started at.
  final DateTime? startTime;

  /// The status of the conversion task.
  final LicenseConversionTaskStatus? status;

  /// The status message for the conversion task.
  final String? statusMessage;

  LicenseConversionTask({
    this.destinationLicenseContext,
    this.endTime,
    this.licenseConversionTaskId,
    this.licenseConversionTime,
    this.resourceArn,
    this.sourceLicenseContext,
    this.startTime,
    this.status,
    this.statusMessage,
  });

  factory LicenseConversionTask.fromJson(Map<String, dynamic> json) {
    return LicenseConversionTask(
      destinationLicenseContext: json['DestinationLicenseContext'] != null
          ? LicenseConversionContext.fromJson(
              json['DestinationLicenseContext'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['EndTime']),
      licenseConversionTaskId: json['LicenseConversionTaskId'] as String?,
      licenseConversionTime: timeStampFromJson(json['LicenseConversionTime']),
      resourceArn: json['ResourceArn'] as String?,
      sourceLicenseContext: json['SourceLicenseContext'] != null
          ? LicenseConversionContext.fromJson(
              json['SourceLicenseContext'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toLicenseConversionTaskStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationLicenseContext = this.destinationLicenseContext;
    final endTime = this.endTime;
    final licenseConversionTaskId = this.licenseConversionTaskId;
    final licenseConversionTime = this.licenseConversionTime;
    final resourceArn = this.resourceArn;
    final sourceLicenseContext = this.sourceLicenseContext;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (destinationLicenseContext != null)
        'DestinationLicenseContext': destinationLicenseContext,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (licenseConversionTaskId != null)
        'LicenseConversionTaskId': licenseConversionTaskId,
      if (licenseConversionTime != null)
        'LicenseConversionTime': unixTimestampToJson(licenseConversionTime),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (sourceLicenseContext != null)
        'SourceLicenseContext': sourceLicenseContext,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum LicenseConversionTaskStatus {
  inProgress,
  succeeded,
  failed,
}

extension LicenseConversionTaskStatusValueExtension
    on LicenseConversionTaskStatus {
  String toValue() {
    switch (this) {
      case LicenseConversionTaskStatus.inProgress:
        return 'IN_PROGRESS';
      case LicenseConversionTaskStatus.succeeded:
        return 'SUCCEEDED';
      case LicenseConversionTaskStatus.failed:
        return 'FAILED';
    }
  }
}

extension LicenseConversionTaskStatusFromString on String {
  LicenseConversionTaskStatus toLicenseConversionTaskStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return LicenseConversionTaskStatus.inProgress;
      case 'SUCCEEDED':
        return LicenseConversionTaskStatus.succeeded;
      case 'FAILED':
        return LicenseConversionTaskStatus.failed;
    }
    throw Exception('$this is not known in enum LicenseConversionTaskStatus');
  }
}

enum LicenseCountingType {
  vcpu,
  instance,
  core,
  socket,
}

extension LicenseCountingTypeValueExtension on LicenseCountingType {
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
  }
}

extension LicenseCountingTypeFromString on String {
  LicenseCountingType toLicenseCountingType() {
    switch (this) {
      case 'vCPU':
        return LicenseCountingType.vcpu;
      case 'Instance':
        return LicenseCountingType.instance;
      case 'Core':
        return LicenseCountingType.core;
      case 'Socket':
        return LicenseCountingType.socket;
    }
    throw Exception('$this is not known in enum LicenseCountingType');
  }
}

enum LicenseDeletionStatus {
  pendingDelete,
  deleted,
}

extension LicenseDeletionStatusValueExtension on LicenseDeletionStatus {
  String toValue() {
    switch (this) {
      case LicenseDeletionStatus.pendingDelete:
        return 'PENDING_DELETE';
      case LicenseDeletionStatus.deleted:
        return 'DELETED';
    }
  }
}

extension LicenseDeletionStatusFromString on String {
  LicenseDeletionStatus toLicenseDeletionStatus() {
    switch (this) {
      case 'PENDING_DELETE':
        return LicenseDeletionStatus.pendingDelete;
      case 'DELETED':
        return LicenseDeletionStatus.deleted;
    }
    throw Exception('$this is not known in enum LicenseDeletionStatus');
  }
}

/// Describes the failure of a license operation.
class LicenseOperationFailure {
  /// Error message.
  final String? errorMessage;

  /// Failure time.
  final DateTime? failureTime;

  /// Reserved.
  final List<Metadata>? metadataList;

  /// Name of the operation.
  final String? operationName;

  /// The requester is "License Manager Automated Discovery".
  final String? operationRequestedBy;

  /// Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// ID of the Amazon Web Services account that owns the resource.
  final String? resourceOwnerId;

  /// Resource type.
  final ResourceType? resourceType;

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

  factory LicenseOperationFailure.fromJson(Map<String, dynamic> json) {
    return LicenseOperationFailure(
      errorMessage: json['ErrorMessage'] as String?,
      failureTime: timeStampFromJson(json['FailureTime']),
      metadataList: (json['MetadataList'] as List?)
          ?.whereNotNull()
          .map((e) => Metadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      operationName: json['OperationName'] as String?,
      operationRequestedBy: json['OperationRequestedBy'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceOwnerId: json['ResourceOwnerId'] as String?,
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final failureTime = this.failureTime;
    final metadataList = this.metadataList;
    final operationName = this.operationName;
    final operationRequestedBy = this.operationRequestedBy;
    final resourceArn = this.resourceArn;
    final resourceOwnerId = this.resourceOwnerId;
    final resourceType = this.resourceType;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (failureTime != null) 'FailureTime': unixTimestampToJson(failureTime),
      if (metadataList != null) 'MetadataList': metadataList,
      if (operationName != null) 'OperationName': operationName,
      if (operationRequestedBy != null)
        'OperationRequestedBy': operationRequestedBy,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceOwnerId != null) 'ResourceOwnerId': resourceOwnerId,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
  }
}

/// Details for associating a license configuration with a resource.
class LicenseSpecification {
  /// Amazon Resource Name (ARN) of the license configuration.
  final String licenseConfigurationArn;

  /// Scope of AMI associations. The possible value is <code>cross-account</code>.
  final String? amiAssociationScope;

  LicenseSpecification({
    required this.licenseConfigurationArn,
    this.amiAssociationScope,
  });

  factory LicenseSpecification.fromJson(Map<String, dynamic> json) {
    return LicenseSpecification(
      licenseConfigurationArn: json['LicenseConfigurationArn'] as String,
      amiAssociationScope: json['AmiAssociationScope'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseConfigurationArn = this.licenseConfigurationArn;
    final amiAssociationScope = this.amiAssociationScope;
    return {
      'LicenseConfigurationArn': licenseConfigurationArn,
      if (amiAssociationScope != null)
        'AmiAssociationScope': amiAssociationScope,
    };
  }
}

enum LicenseStatus {
  available,
  pendingAvailable,
  deactivated,
  suspended,
  expired,
  pendingDelete,
  deleted,
}

extension LicenseStatusValueExtension on LicenseStatus {
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
  }
}

extension LicenseStatusFromString on String {
  LicenseStatus toLicenseStatus() {
    switch (this) {
      case 'AVAILABLE':
        return LicenseStatus.available;
      case 'PENDING_AVAILABLE':
        return LicenseStatus.pendingAvailable;
      case 'DEACTIVATED':
        return LicenseStatus.deactivated;
      case 'SUSPENDED':
        return LicenseStatus.suspended;
      case 'EXPIRED':
        return LicenseStatus.expired;
      case 'PENDING_DELETE':
        return LicenseStatus.pendingDelete;
      case 'DELETED':
        return LicenseStatus.deleted;
    }
    throw Exception('$this is not known in enum LicenseStatus');
  }
}

/// Describes the entitlement usage associated with a license.
class LicenseUsage {
  /// License entitlement usages.
  final List<EntitlementUsage>? entitlementUsages;

  LicenseUsage({
    this.entitlementUsages,
  });

  factory LicenseUsage.fromJson(Map<String, dynamic> json) {
    return LicenseUsage(
      entitlementUsages: (json['EntitlementUsages'] as List?)
          ?.whereNotNull()
          .map((e) => EntitlementUsage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entitlementUsages = this.entitlementUsages;
    return {
      if (entitlementUsages != null) 'EntitlementUsages': entitlementUsages,
    };
  }
}

class ListAssociationsForLicenseConfigurationResponse {
  /// Information about the associations for the license configuration.
  final List<LicenseConfigurationAssociation>? licenseConfigurationAssociations;

  /// Token for the next set of results.
  final String? nextToken;

  ListAssociationsForLicenseConfigurationResponse({
    this.licenseConfigurationAssociations,
    this.nextToken,
  });

  factory ListAssociationsForLicenseConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAssociationsForLicenseConfigurationResponse(
      licenseConfigurationAssociations:
          (json['LicenseConfigurationAssociations'] as List?)
              ?.whereNotNull()
              .map((e) => LicenseConfigurationAssociation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseConfigurationAssociations =
        this.licenseConfigurationAssociations;
    final nextToken = this.nextToken;
    return {
      if (licenseConfigurationAssociations != null)
        'LicenseConfigurationAssociations': licenseConfigurationAssociations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDistributedGrantsResponse {
  /// Distributed grant details.
  final List<Grant>? grants;

  /// Token for the next set of results.
  final String? nextToken;

  ListDistributedGrantsResponse({
    this.grants,
    this.nextToken,
  });

  factory ListDistributedGrantsResponse.fromJson(Map<String, dynamic> json) {
    return ListDistributedGrantsResponse(
      grants: (json['Grants'] as List?)
          ?.whereNotNull()
          .map((e) => Grant.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grants = this.grants;
    final nextToken = this.nextToken;
    return {
      if (grants != null) 'Grants': grants,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFailuresForLicenseConfigurationOperationsResponse {
  /// License configuration operations that failed.
  final List<LicenseOperationFailure>? licenseOperationFailureList;

  /// Token for the next set of results.
  final String? nextToken;

  ListFailuresForLicenseConfigurationOperationsResponse({
    this.licenseOperationFailureList,
    this.nextToken,
  });

  factory ListFailuresForLicenseConfigurationOperationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFailuresForLicenseConfigurationOperationsResponse(
      licenseOperationFailureList:
          (json['LicenseOperationFailureList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  LicenseOperationFailure.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseOperationFailureList = this.licenseOperationFailureList;
    final nextToken = this.nextToken;
    return {
      if (licenseOperationFailureList != null)
        'LicenseOperationFailureList': licenseOperationFailureList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLicenseConfigurationsResponse {
  /// Information about the license configurations.
  final List<LicenseConfiguration>? licenseConfigurations;

  /// Token for the next set of results.
  final String? nextToken;

  ListLicenseConfigurationsResponse({
    this.licenseConfigurations,
    this.nextToken,
  });

  factory ListLicenseConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLicenseConfigurationsResponse(
      licenseConfigurations: (json['LicenseConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => LicenseConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseConfigurations = this.licenseConfigurations;
    final nextToken = this.nextToken;
    return {
      if (licenseConfigurations != null)
        'LicenseConfigurations': licenseConfigurations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLicenseConversionTasksResponse {
  /// Information about the license configuration tasks for your account.
  final List<LicenseConversionTask>? licenseConversionTasks;

  /// Token for the next set of results.
  final String? nextToken;

  ListLicenseConversionTasksResponse({
    this.licenseConversionTasks,
    this.nextToken,
  });

  factory ListLicenseConversionTasksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLicenseConversionTasksResponse(
      licenseConversionTasks: (json['LicenseConversionTasks'] as List?)
          ?.whereNotNull()
          .map((e) => LicenseConversionTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseConversionTasks = this.licenseConversionTasks;
    final nextToken = this.nextToken;
    return {
      if (licenseConversionTasks != null)
        'LicenseConversionTasks': licenseConversionTasks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLicenseManagerReportGeneratorsResponse {
  /// Token for the next set of results.
  final String? nextToken;

  /// A report generator that creates periodic reports about your license
  /// configurations.
  final List<ReportGenerator>? reportGenerators;

  ListLicenseManagerReportGeneratorsResponse({
    this.nextToken,
    this.reportGenerators,
  });

  factory ListLicenseManagerReportGeneratorsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLicenseManagerReportGeneratorsResponse(
      nextToken: json['NextToken'] as String?,
      reportGenerators: (json['ReportGenerators'] as List?)
          ?.whereNotNull()
          .map((e) => ReportGenerator.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reportGenerators = this.reportGenerators;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (reportGenerators != null) 'ReportGenerators': reportGenerators,
    };
  }
}

class ListLicenseSpecificationsForResourceResponse {
  /// License configurations associated with a resource.
  final List<LicenseSpecification>? licenseSpecifications;

  /// Token for the next set of results.
  final String? nextToken;

  ListLicenseSpecificationsForResourceResponse({
    this.licenseSpecifications,
    this.nextToken,
  });

  factory ListLicenseSpecificationsForResourceResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLicenseSpecificationsForResourceResponse(
      licenseSpecifications: (json['LicenseSpecifications'] as List?)
          ?.whereNotNull()
          .map((e) => LicenseSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseSpecifications = this.licenseSpecifications;
    final nextToken = this.nextToken;
    return {
      if (licenseSpecifications != null)
        'LicenseSpecifications': licenseSpecifications,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLicenseVersionsResponse {
  /// License details.
  final List<License>? licenses;

  /// Token for the next set of results.
  final String? nextToken;

  ListLicenseVersionsResponse({
    this.licenses,
    this.nextToken,
  });

  factory ListLicenseVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListLicenseVersionsResponse(
      licenses: (json['Licenses'] as List?)
          ?.whereNotNull()
          .map((e) => License.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenses = this.licenses;
    final nextToken = this.nextToken;
    return {
      if (licenses != null) 'Licenses': licenses,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLicensesResponse {
  /// License details.
  final List<License>? licenses;

  /// Token for the next set of results.
  final String? nextToken;

  ListLicensesResponse({
    this.licenses,
    this.nextToken,
  });

  factory ListLicensesResponse.fromJson(Map<String, dynamic> json) {
    return ListLicensesResponse(
      licenses: (json['Licenses'] as List?)
          ?.whereNotNull()
          .map((e) => License.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenses = this.licenses;
    final nextToken = this.nextToken;
    return {
      if (licenses != null) 'Licenses': licenses,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListReceivedGrantsForOrganizationResponse {
  /// Lists the grants the organization has received.
  final List<Grant>? grants;

  /// Token for the next set of results.
  final String? nextToken;

  ListReceivedGrantsForOrganizationResponse({
    this.grants,
    this.nextToken,
  });

  factory ListReceivedGrantsForOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListReceivedGrantsForOrganizationResponse(
      grants: (json['Grants'] as List?)
          ?.whereNotNull()
          .map((e) => Grant.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grants = this.grants;
    final nextToken = this.nextToken;
    return {
      if (grants != null) 'Grants': grants,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListReceivedGrantsResponse {
  /// Received grant details.
  final List<Grant>? grants;

  /// Token for the next set of results.
  final String? nextToken;

  ListReceivedGrantsResponse({
    this.grants,
    this.nextToken,
  });

  factory ListReceivedGrantsResponse.fromJson(Map<String, dynamic> json) {
    return ListReceivedGrantsResponse(
      grants: (json['Grants'] as List?)
          ?.whereNotNull()
          .map((e) => Grant.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grants = this.grants;
    final nextToken = this.nextToken;
    return {
      if (grants != null) 'Grants': grants,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListReceivedLicensesForOrganizationResponse {
  /// Lists the licenses the organization has received.
  final List<GrantedLicense>? licenses;

  /// Token for the next set of results.
  final String? nextToken;

  ListReceivedLicensesForOrganizationResponse({
    this.licenses,
    this.nextToken,
  });

  factory ListReceivedLicensesForOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListReceivedLicensesForOrganizationResponse(
      licenses: (json['Licenses'] as List?)
          ?.whereNotNull()
          .map((e) => GrantedLicense.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenses = this.licenses;
    final nextToken = this.nextToken;
    return {
      if (licenses != null) 'Licenses': licenses,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListReceivedLicensesResponse {
  /// Received license details.
  final List<GrantedLicense>? licenses;

  /// Token for the next set of results.
  final String? nextToken;

  ListReceivedLicensesResponse({
    this.licenses,
    this.nextToken,
  });

  factory ListReceivedLicensesResponse.fromJson(Map<String, dynamic> json) {
    return ListReceivedLicensesResponse(
      licenses: (json['Licenses'] as List?)
          ?.whereNotNull()
          .map((e) => GrantedLicense.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenses = this.licenses;
    final nextToken = this.nextToken;
    return {
      if (licenses != null) 'Licenses': licenses,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListResourceInventoryResponse {
  /// Token for the next set of results.
  final String? nextToken;

  /// Information about the resources.
  final List<ResourceInventory>? resourceInventoryList;

  ListResourceInventoryResponse({
    this.nextToken,
    this.resourceInventoryList,
  });

  factory ListResourceInventoryResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceInventoryResponse(
      nextToken: json['NextToken'] as String?,
      resourceInventoryList: (json['ResourceInventoryList'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceInventory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceInventoryList = this.resourceInventoryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceInventoryList != null)
        'ResourceInventoryList': resourceInventoryList,
    };
  }
}

class ListTagsForResourceResponse {
  /// Information about the tags.
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

class ListTokensResponse {
  /// Token for the next set of results.
  final String? nextToken;

  /// Received token details.
  final List<TokenData>? tokens;

  ListTokensResponse({
    this.nextToken,
    this.tokens,
  });

  factory ListTokensResponse.fromJson(Map<String, dynamic> json) {
    return ListTokensResponse(
      nextToken: json['NextToken'] as String?,
      tokens: (json['Tokens'] as List?)
          ?.whereNotNull()
          .map((e) => TokenData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tokens = this.tokens;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tokens != null) 'Tokens': tokens,
    };
  }
}

class ListUsageForLicenseConfigurationResponse {
  /// Information about the license configurations.
  final List<LicenseConfigurationUsage>? licenseConfigurationUsageList;

  /// Token for the next set of results.
  final String? nextToken;

  ListUsageForLicenseConfigurationResponse({
    this.licenseConfigurationUsageList,
    this.nextToken,
  });

  factory ListUsageForLicenseConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListUsageForLicenseConfigurationResponse(
      licenseConfigurationUsageList:
          (json['LicenseConfigurationUsageList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  LicenseConfigurationUsage.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseConfigurationUsageList = this.licenseConfigurationUsageList;
    final nextToken = this.nextToken;
    return {
      if (licenseConfigurationUsageList != null)
        'LicenseConfigurationUsageList': licenseConfigurationUsageList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Summary information about a managed resource.
class ManagedResourceSummary {
  /// Number of resources associated with licenses.
  final int? associationCount;

  /// Type of resource associated with a license.
  final ResourceType? resourceType;

  ManagedResourceSummary({
    this.associationCount,
    this.resourceType,
  });

  factory ManagedResourceSummary.fromJson(Map<String, dynamic> json) {
    return ManagedResourceSummary(
      associationCount: json['AssociationCount'] as int?,
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final associationCount = this.associationCount;
    final resourceType = this.resourceType;
    return {
      if (associationCount != null) 'AssociationCount': associationCount,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
  }
}

/// Describes key/value pairs.
class Metadata {
  /// The key name.
  final String? name;

  /// The value.
  final String? value;

  Metadata({
    this.name,
    this.value,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// The options you can specify when you create a new version of a grant, such
/// as activation override behavior. For more information, see <a
/// href="https://docs.aws.amazon.com/license-manager/latest/userguide/granted-licenses.html">Granted
/// licenses in License Manager</a> in the <i>License Manager User Guide</i>.
class Options {
  /// An activation option for your grant that determines the behavior of
  /// activating a grant. Activation options can only be used with granted
  /// licenses sourced from the Amazon Web Services Marketplace. Additionally, the
  /// operation must specify the value of <code>ACTIVE</code> for the
  /// <code>Status</code> parameter.
  ///
  /// <ul>
  /// <li>
  /// As a license administrator, you can optionally specify an
  /// <code>ActivationOverrideBehavior</code> when activating a grant.
  /// </li>
  /// <li>
  /// As a grantor, you can optionally specify an
  /// <code>ActivationOverrideBehavior</code> when you activate a grant for a
  /// grantee account in your organization.
  /// </li>
  /// <li>
  /// As a grantee, if the grantor creating the distributed grant doesn’t specify
  /// an <code>ActivationOverrideBehavior</code>, you can optionally specify one
  /// when you are activating the grant.
  /// </li>
  /// </ul> <dl> <dt>DISTRIBUTED_GRANTS_ONLY</dt> <dd>
  /// Use this value to activate a grant without replacing any member account’s
  /// active grants for the same product.
  /// </dd> <dt>ALL_GRANTS_PERMITTED_BY_ISSUER</dt> <dd>
  /// Use this value to activate a grant and disable other active grants in any
  /// member accounts for the same product. This action will also replace their
  /// previously activated grants with this activated grant.
  /// </dd> </dl>
  final ActivationOverrideBehavior? activationOverrideBehavior;

  Options({
    this.activationOverrideBehavior,
  });

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      activationOverrideBehavior:
          (json['ActivationOverrideBehavior'] as String?)
              ?.toActivationOverrideBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final activationOverrideBehavior = this.activationOverrideBehavior;
    return {
      if (activationOverrideBehavior != null)
        'ActivationOverrideBehavior': activationOverrideBehavior.toValue(),
    };
  }
}

/// Configuration information for Organizations.
class OrganizationConfiguration {
  /// Enables Organizations integration.
  final bool enableIntegration;

  OrganizationConfiguration({
    required this.enableIntegration,
  });

  factory OrganizationConfiguration.fromJson(Map<String, dynamic> json) {
    return OrganizationConfiguration(
      enableIntegration: json['EnableIntegration'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enableIntegration = this.enableIntegration;
    return {
      'EnableIntegration': enableIntegration,
    };
  }
}

/// Describes product information for a license configuration.
class ProductInformation {
  /// A Product information filter consists of a
  /// <code>ProductInformationFilterComparator</code> which is a logical operator,
  /// a <code>ProductInformationFilterName</code> which specifies the type of
  /// filter being declared, and a <code>ProductInformationFilterValue</code> that
  /// specifies the value to filter on.
  ///
  /// Accepted values for <code>ProductInformationFilterName</code> are listed
  /// here along with descriptions and valid options for
  /// <code>ProductInformationFilterComparator</code>.
  ///
  /// The following filters and are supported when the resource type is
  /// <code>SSM_MANAGED</code>:
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
  /// <code>Tag:key</code> - The key of a tag attached to an Amazon Web Services
  /// resource you wish to exclude from automated discovery. Logical operator is
  /// <code>NOT_EQUALS</code>. The key for your tag must be appended to
  /// <code>Tag:</code> following the example: <code>Tag:name-of-your-key</code>.
  /// <code>ProductInformationFilterValue</code> is optional if you are not using
  /// values for the key.
  /// </li>
  /// <li>
  /// <code>AccountId</code> - The 12-digit ID of an Amazon Web Services account
  /// you wish to exclude from automated discovery. Logical operator is
  /// <code>NOT_EQUALS</code>.
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
  final List<ProductInformationFilter> productInformationFilterList;

  /// Resource type. The possible values are <code>SSM_MANAGED</code> |
  /// <code>RDS</code>.
  final String resourceType;

  ProductInformation({
    required this.productInformationFilterList,
    required this.resourceType,
  });

  factory ProductInformation.fromJson(Map<String, dynamic> json) {
    return ProductInformation(
      productInformationFilterList:
          (json['ProductInformationFilterList'] as List)
              .whereNotNull()
              .map((e) =>
                  ProductInformationFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceType: json['ResourceType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final productInformationFilterList = this.productInformationFilterList;
    final resourceType = this.resourceType;
    return {
      'ProductInformationFilterList': productInformationFilterList,
      'ResourceType': resourceType,
    };
  }
}

/// Describes product information filters.
class ProductInformationFilter {
  /// Logical operator.
  final String productInformationFilterComparator;

  /// Filter name.
  final String productInformationFilterName;

  /// Filter value.
  final List<String>? productInformationFilterValue;

  ProductInformationFilter({
    required this.productInformationFilterComparator,
    required this.productInformationFilterName,
    this.productInformationFilterValue,
  });

  factory ProductInformationFilter.fromJson(Map<String, dynamic> json) {
    return ProductInformationFilter(
      productInformationFilterComparator:
          json['ProductInformationFilterComparator'] as String,
      productInformationFilterName:
          json['ProductInformationFilterName'] as String,
      productInformationFilterValue:
          (json['ProductInformationFilterValue'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final productInformationFilterComparator =
        this.productInformationFilterComparator;
    final productInformationFilterName = this.productInformationFilterName;
    final productInformationFilterValue = this.productInformationFilterValue;
    return {
      'ProductInformationFilterComparator': productInformationFilterComparator,
      'ProductInformationFilterName': productInformationFilterName,
      if (productInformationFilterValue != null)
        'ProductInformationFilterValue': productInformationFilterValue,
    };
  }
}

/// Details about a provisional configuration.
class ProvisionalConfiguration {
  /// Maximum time for the provisional configuration, in minutes.
  final int maxTimeToLiveInMinutes;

  ProvisionalConfiguration({
    required this.maxTimeToLiveInMinutes,
  });

  factory ProvisionalConfiguration.fromJson(Map<String, dynamic> json) {
    return ProvisionalConfiguration(
      maxTimeToLiveInMinutes: json['MaxTimeToLiveInMinutes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxTimeToLiveInMinutes = this.maxTimeToLiveInMinutes;
    return {
      'MaxTimeToLiveInMinutes': maxTimeToLiveInMinutes,
    };
  }
}

/// Metadata associated with received licenses and grants.
class ReceivedMetadata {
  /// Allowed operations.
  final List<AllowedOperation>? allowedOperations;

  /// Received status.
  final ReceivedStatus? receivedStatus;

  /// Received status reason.
  final String? receivedStatusReason;

  ReceivedMetadata({
    this.allowedOperations,
    this.receivedStatus,
    this.receivedStatusReason,
  });

  factory ReceivedMetadata.fromJson(Map<String, dynamic> json) {
    return ReceivedMetadata(
      allowedOperations: (json['AllowedOperations'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAllowedOperation())
          .toList(),
      receivedStatus: (json['ReceivedStatus'] as String?)?.toReceivedStatus(),
      receivedStatusReason: json['ReceivedStatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedOperations = this.allowedOperations;
    final receivedStatus = this.receivedStatus;
    final receivedStatusReason = this.receivedStatusReason;
    return {
      if (allowedOperations != null)
        'AllowedOperations': allowedOperations.map((e) => e.toValue()).toList(),
      if (receivedStatus != null) 'ReceivedStatus': receivedStatus.toValue(),
      if (receivedStatusReason != null)
        'ReceivedStatusReason': receivedStatusReason,
    };
  }
}

enum ReceivedStatus {
  pendingWorkflow,
  pendingAccept,
  rejected,
  active,
  failedWorkflow,
  deleted,
  disabled,
  workflowCompleted,
}

extension ReceivedStatusValueExtension on ReceivedStatus {
  String toValue() {
    switch (this) {
      case ReceivedStatus.pendingWorkflow:
        return 'PENDING_WORKFLOW';
      case ReceivedStatus.pendingAccept:
        return 'PENDING_ACCEPT';
      case ReceivedStatus.rejected:
        return 'REJECTED';
      case ReceivedStatus.active:
        return 'ACTIVE';
      case ReceivedStatus.failedWorkflow:
        return 'FAILED_WORKFLOW';
      case ReceivedStatus.deleted:
        return 'DELETED';
      case ReceivedStatus.disabled:
        return 'DISABLED';
      case ReceivedStatus.workflowCompleted:
        return 'WORKFLOW_COMPLETED';
    }
  }
}

extension ReceivedStatusFromString on String {
  ReceivedStatus toReceivedStatus() {
    switch (this) {
      case 'PENDING_WORKFLOW':
        return ReceivedStatus.pendingWorkflow;
      case 'PENDING_ACCEPT':
        return ReceivedStatus.pendingAccept;
      case 'REJECTED':
        return ReceivedStatus.rejected;
      case 'ACTIVE':
        return ReceivedStatus.active;
      case 'FAILED_WORKFLOW':
        return ReceivedStatus.failedWorkflow;
      case 'DELETED':
        return ReceivedStatus.deleted;
      case 'DISABLED':
        return ReceivedStatus.disabled;
      case 'WORKFLOW_COMPLETED':
        return ReceivedStatus.workflowCompleted;
    }
    throw Exception('$this is not known in enum ReceivedStatus');
  }
}

class RejectGrantResponse {
  /// Grant ARN.
  final String? grantArn;

  /// Grant status.
  final GrantStatus? status;

  /// Grant version.
  final String? version;

  RejectGrantResponse({
    this.grantArn,
    this.status,
    this.version,
  });

  factory RejectGrantResponse.fromJson(Map<String, dynamic> json) {
    return RejectGrantResponse(
      grantArn: json['GrantArn'] as String?,
      status: (json['Status'] as String?)?.toGrantStatus(),
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grantArn = this.grantArn;
    final status = this.status;
    final version = this.version;
    return {
      if (grantArn != null) 'GrantArn': grantArn,
      if (status != null) 'Status': status.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

enum RenewType {
  none,
  weekly,
  monthly,
}

extension RenewTypeValueExtension on RenewType {
  String toValue() {
    switch (this) {
      case RenewType.none:
        return 'None';
      case RenewType.weekly:
        return 'Weekly';
      case RenewType.monthly:
        return 'Monthly';
    }
  }
}

extension RenewTypeFromString on String {
  RenewType toRenewType() {
    switch (this) {
      case 'None':
        return RenewType.none;
      case 'Weekly':
        return RenewType.weekly;
      case 'Monthly':
        return RenewType.monthly;
    }
    throw Exception('$this is not known in enum RenewType');
  }
}

/// Details of the license configuration that this generator reports on.
class ReportContext {
  /// Amazon Resource Name (ARN) of the license configuration that this generator
  /// reports on.
  final List<String> licenseConfigurationArns;

  ReportContext({
    required this.licenseConfigurationArns,
  });

  factory ReportContext.fromJson(Map<String, dynamic> json) {
    return ReportContext(
      licenseConfigurationArns: (json['licenseConfigurationArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final licenseConfigurationArns = this.licenseConfigurationArns;
    return {
      'licenseConfigurationArns': licenseConfigurationArns,
    };
  }
}

/// Details about how frequently reports are generated.
class ReportFrequency {
  /// Time period between each report. The period can be daily, weekly, or
  /// monthly.
  final ReportFrequencyType? period;

  /// Number of times within the frequency period that a report is generated. The
  /// only supported value is <code>1</code>.
  final int? value;

  ReportFrequency({
    this.period,
    this.value,
  });

  factory ReportFrequency.fromJson(Map<String, dynamic> json) {
    return ReportFrequency(
      period: (json['period'] as String?)?.toReportFrequencyType(),
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final period = this.period;
    final value = this.value;
    return {
      if (period != null) 'period': period.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum ReportFrequencyType {
  day,
  week,
  month,
}

extension ReportFrequencyTypeValueExtension on ReportFrequencyType {
  String toValue() {
    switch (this) {
      case ReportFrequencyType.day:
        return 'DAY';
      case ReportFrequencyType.week:
        return 'WEEK';
      case ReportFrequencyType.month:
        return 'MONTH';
    }
  }
}

extension ReportFrequencyTypeFromString on String {
  ReportFrequencyType toReportFrequencyType() {
    switch (this) {
      case 'DAY':
        return ReportFrequencyType.day;
      case 'WEEK':
        return ReportFrequencyType.week;
      case 'MONTH':
        return ReportFrequencyType.month;
    }
    throw Exception('$this is not known in enum ReportFrequencyType');
  }
}

/// Describe the details of a report generator.
class ReportGenerator {
  /// Time the report was created.
  final String? createTime;

  /// Description of the report generator.
  final String? description;

  /// Time the last report was generated at.
  final String? lastReportGenerationTime;

  /// Failure message for the last report generation attempt.
  final String? lastRunFailureReason;

  /// Status of the last report generation attempt.
  final String? lastRunStatus;

  /// Amazon Resource Name (ARN) of the report generator.
  final String? licenseManagerReportGeneratorArn;

  /// License configuration type for this generator.
  final ReportContext? reportContext;

  /// The Amazon Web Services account ID used to create the report generator.
  final String? reportCreatorAccount;

  /// Details about how frequently reports are generated.
  final ReportFrequency? reportFrequency;

  /// Name of the report generator.
  final String? reportGeneratorName;

  /// Type of reports that are generated.
  final List<ReportType>? reportType;

  /// Details of the S3 bucket that report generator reports are published to.
  final S3Location? s3Location;

  /// Tags associated with the report generator.
  final List<Tag>? tags;

  ReportGenerator({
    this.createTime,
    this.description,
    this.lastReportGenerationTime,
    this.lastRunFailureReason,
    this.lastRunStatus,
    this.licenseManagerReportGeneratorArn,
    this.reportContext,
    this.reportCreatorAccount,
    this.reportFrequency,
    this.reportGeneratorName,
    this.reportType,
    this.s3Location,
    this.tags,
  });

  factory ReportGenerator.fromJson(Map<String, dynamic> json) {
    return ReportGenerator(
      createTime: json['CreateTime'] as String?,
      description: json['Description'] as String?,
      lastReportGenerationTime: json['LastReportGenerationTime'] as String?,
      lastRunFailureReason: json['LastRunFailureReason'] as String?,
      lastRunStatus: json['LastRunStatus'] as String?,
      licenseManagerReportGeneratorArn:
          json['LicenseManagerReportGeneratorArn'] as String?,
      reportContext: json['ReportContext'] != null
          ? ReportContext.fromJson(
              json['ReportContext'] as Map<String, dynamic>)
          : null,
      reportCreatorAccount: json['ReportCreatorAccount'] as String?,
      reportFrequency: json['ReportFrequency'] != null
          ? ReportFrequency.fromJson(
              json['ReportFrequency'] as Map<String, dynamic>)
          : null,
      reportGeneratorName: json['ReportGeneratorName'] as String?,
      reportType: (json['ReportType'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toReportType())
          .toList(),
      s3Location: json['S3Location'] != null
          ? S3Location.fromJson(json['S3Location'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final description = this.description;
    final lastReportGenerationTime = this.lastReportGenerationTime;
    final lastRunFailureReason = this.lastRunFailureReason;
    final lastRunStatus = this.lastRunStatus;
    final licenseManagerReportGeneratorArn =
        this.licenseManagerReportGeneratorArn;
    final reportContext = this.reportContext;
    final reportCreatorAccount = this.reportCreatorAccount;
    final reportFrequency = this.reportFrequency;
    final reportGeneratorName = this.reportGeneratorName;
    final reportType = this.reportType;
    final s3Location = this.s3Location;
    final tags = this.tags;
    return {
      if (createTime != null) 'CreateTime': createTime,
      if (description != null) 'Description': description,
      if (lastReportGenerationTime != null)
        'LastReportGenerationTime': lastReportGenerationTime,
      if (lastRunFailureReason != null)
        'LastRunFailureReason': lastRunFailureReason,
      if (lastRunStatus != null) 'LastRunStatus': lastRunStatus,
      if (licenseManagerReportGeneratorArn != null)
        'LicenseManagerReportGeneratorArn': licenseManagerReportGeneratorArn,
      if (reportContext != null) 'ReportContext': reportContext,
      if (reportCreatorAccount != null)
        'ReportCreatorAccount': reportCreatorAccount,
      if (reportFrequency != null) 'ReportFrequency': reportFrequency,
      if (reportGeneratorName != null)
        'ReportGeneratorName': reportGeneratorName,
      if (reportType != null)
        'ReportType': reportType.map((e) => e.toValue()).toList(),
      if (s3Location != null) 'S3Location': s3Location,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum ReportType {
  licenseConfigurationSummaryReport,
  licenseConfigurationUsageReport,
}

extension ReportTypeValueExtension on ReportType {
  String toValue() {
    switch (this) {
      case ReportType.licenseConfigurationSummaryReport:
        return 'LicenseConfigurationSummaryReport';
      case ReportType.licenseConfigurationUsageReport:
        return 'LicenseConfigurationUsageReport';
    }
  }
}

extension ReportTypeFromString on String {
  ReportType toReportType() {
    switch (this) {
      case 'LicenseConfigurationSummaryReport':
        return ReportType.licenseConfigurationSummaryReport;
      case 'LicenseConfigurationUsageReport':
        return ReportType.licenseConfigurationUsageReport;
    }
    throw Exception('$this is not known in enum ReportType');
  }
}

/// Details about a resource.
class ResourceInventory {
  /// Platform of the resource.
  final String? platform;

  /// Platform version of the resource in the inventory.
  final String? platformVersion;

  /// Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// ID of the resource.
  final String? resourceId;

  /// ID of the account that owns the resource.
  final String? resourceOwningAccountId;

  /// Type of resource.
  final ResourceType? resourceType;

  ResourceInventory({
    this.platform,
    this.platformVersion,
    this.resourceArn,
    this.resourceId,
    this.resourceOwningAccountId,
    this.resourceType,
  });

  factory ResourceInventory.fromJson(Map<String, dynamic> json) {
    return ResourceInventory(
      platform: json['Platform'] as String?,
      platformVersion: json['PlatformVersion'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceOwningAccountId: json['ResourceOwningAccountId'] as String?,
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final platformVersion = this.platformVersion;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceOwningAccountId = this.resourceOwningAccountId;
    final resourceType = this.resourceType;
    return {
      if (platform != null) 'Platform': platform,
      if (platformVersion != null) 'PlatformVersion': platformVersion,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceOwningAccountId != null)
        'ResourceOwningAccountId': resourceOwningAccountId,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
  }
}

enum ResourceType {
  ec2Instance,
  ec2Host,
  ec2Ami,
  rds,
  systemsManagerManagedInstance,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.ec2Instance:
        return 'EC2_INSTANCE';
      case ResourceType.ec2Host:
        return 'EC2_HOST';
      case ResourceType.ec2Ami:
        return 'EC2_AMI';
      case ResourceType.rds:
        return 'RDS';
      case ResourceType.systemsManagerManagedInstance:
        return 'SYSTEMS_MANAGER_MANAGED_INSTANCE';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'EC2_INSTANCE':
        return ResourceType.ec2Instance;
      case 'EC2_HOST':
        return ResourceType.ec2Host;
      case 'EC2_AMI':
        return ResourceType.ec2Ami;
      case 'RDS':
        return ResourceType.rds;
      case 'SYSTEMS_MANAGER_MANAGED_INSTANCE':
        return ResourceType.systemsManagerManagedInstance;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// Details of the S3 bucket that report generator reports are published to.
class S3Location {
  /// Name of the S3 bucket reports are published to.
  final String? bucket;

  /// Prefix of the S3 bucket reports are published to.
  final String? keyPrefix;

  S3Location({
    this.bucket,
    this.keyPrefix,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: json['bucket'] as String?,
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefix = this.keyPrefix;
    return {
      if (bucket != null) 'bucket': bucket,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// Details about a tag for a license configuration.
class Tag {
  /// Tag key.
  final String? key;

  /// Tag value.
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

/// Describes a token.
class TokenData {
  /// Token expiration time, in ISO8601-UTC format.
  final String? expirationTime;

  /// Amazon Resource Name (ARN) of the license.
  final String? licenseArn;

  /// Amazon Resource Names (ARN) of the roles included in the token.
  final List<String>? roleArns;

  /// Token status. The possible values are <code>AVAILABLE</code> and
  /// <code>DELETED</code>.
  final String? status;

  /// Token ID.
  final String? tokenId;

  /// Data specified by the caller.
  final List<String>? tokenProperties;

  /// Type of token generated. The supported value is <code>REFRESH_TOKEN</code>.
  final String? tokenType;

  TokenData({
    this.expirationTime,
    this.licenseArn,
    this.roleArns,
    this.status,
    this.tokenId,
    this.tokenProperties,
    this.tokenType,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) {
    return TokenData(
      expirationTime: json['ExpirationTime'] as String?,
      licenseArn: json['LicenseArn'] as String?,
      roleArns: (json['RoleArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: json['Status'] as String?,
      tokenId: json['TokenId'] as String?,
      tokenProperties: (json['TokenProperties'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tokenType: json['TokenType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expirationTime = this.expirationTime;
    final licenseArn = this.licenseArn;
    final roleArns = this.roleArns;
    final status = this.status;
    final tokenId = this.tokenId;
    final tokenProperties = this.tokenProperties;
    final tokenType = this.tokenType;
    return {
      if (expirationTime != null) 'ExpirationTime': expirationTime,
      if (licenseArn != null) 'LicenseArn': licenseArn,
      if (roleArns != null) 'RoleArns': roleArns,
      if (status != null) 'Status': status,
      if (tokenId != null) 'TokenId': tokenId,
      if (tokenProperties != null) 'TokenProperties': tokenProperties,
      if (tokenType != null) 'TokenType': tokenType,
    };
  }
}

enum TokenType {
  refreshToken,
}

extension TokenTypeValueExtension on TokenType {
  String toValue() {
    switch (this) {
      case TokenType.refreshToken:
        return 'REFRESH_TOKEN';
    }
  }
}

extension TokenTypeFromString on String {
  TokenType toTokenType() {
    switch (this) {
      case 'REFRESH_TOKEN':
        return TokenType.refreshToken;
    }
    throw Exception('$this is not known in enum TokenType');
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

class UpdateLicenseConfigurationResponse {
  UpdateLicenseConfigurationResponse();

  factory UpdateLicenseConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLicenseConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLicenseManagerReportGeneratorResponse {
  UpdateLicenseManagerReportGeneratorResponse();

  factory UpdateLicenseManagerReportGeneratorResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateLicenseManagerReportGeneratorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLicenseSpecificationsForResourceResponse {
  UpdateLicenseSpecificationsForResourceResponse();

  factory UpdateLicenseSpecificationsForResourceResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateLicenseSpecificationsForResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateServiceSettingsResponse {
  UpdateServiceSettingsResponse();

  factory UpdateServiceSettingsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateServiceSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AuthorizationException extends _s.GenericAwsException {
  AuthorizationException({String? type, String? message})
      : super(type: type, code: 'AuthorizationException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class EntitlementNotAllowedException extends _s.GenericAwsException {
  EntitlementNotAllowedException({String? type, String? message})
      : super(
            type: type,
            code: 'EntitlementNotAllowedException',
            message: message);
}

class FailedDependencyException extends _s.GenericAwsException {
  FailedDependencyException({String? type, String? message})
      : super(type: type, code: 'FailedDependencyException', message: message);
}

class FilterLimitExceededException extends _s.GenericAwsException {
  FilterLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'FilterLimitExceededException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidResourceStateException extends _s.GenericAwsException {
  InvalidResourceStateException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidResourceStateException',
            message: message);
}

class LicenseUsageException extends _s.GenericAwsException {
  LicenseUsageException({String? type, String? message})
      : super(type: type, code: 'LicenseUsageException', message: message);
}

class NoEntitlementsAllowedException extends _s.GenericAwsException {
  NoEntitlementsAllowedException({String? type, String? message})
      : super(
            type: type,
            code: 'NoEntitlementsAllowedException',
            message: message);
}

class RateLimitExceededException extends _s.GenericAwsException {
  RateLimitExceededException({String? type, String? message})
      : super(type: type, code: 'RateLimitExceededException', message: message);
}

class RedirectException extends _s.GenericAwsException {
  RedirectException({String? type, String? message})
      : super(type: type, code: 'RedirectException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServerInternalException extends _s.GenericAwsException {
  ServerInternalException({String? type, String? message})
      : super(type: type, code: 'ServerInternalException', message: message);
}

class UnsupportedDigitalSignatureMethodException
    extends _s.GenericAwsException {
  UnsupportedDigitalSignatureMethodException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedDigitalSignatureMethodException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
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
