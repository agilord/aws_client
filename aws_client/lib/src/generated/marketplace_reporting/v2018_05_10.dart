// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2018_05_10.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// The Amazon Web Services Marketplace <code>GetBuyerDashboard</code> API
/// enables you to get a procurement insights dashboard programmatically. The
/// API gets the agreement and cost analysis dashboards with data for all of the
/// Amazon Web Services accounts in your Amazon Web Services Organization.
///
/// To use the Amazon Web Services Marketplace Reporting API, you must complete
/// the following prerequisites:
///
/// <ul>
/// <li>
/// Enable all features for your organization. For more information, see <a
/// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">Enabling
/// all features for an organization with Organizations</a>, in the
/// <i>Organizations User Guide</i>.
/// </li>
/// <li>
/// Call the service as the Organizations management account or an account
/// registered as a delegated administrator for the procurement insights
/// service.
///
/// For more information about management accounts, see <a
/// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tutorials_basic.html">Tutorial:
/// Creating and configuring an organization</a> and <a
/// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs-manage_accounts_management.html">Managing
/// the management account with Organizations</a>, both in the <i>Organizations
/// User Guide</i>.
///
/// For more information about delegated administrators, see <a
/// href="https://docs.aws.amazon.com/marketplace/latest/buyerguide/management-delegates.html">Using
/// delegated administrators</a>, in the <i>Amazon Web Services Marketplace
/// Buyer Guide</i>.
/// </li>
/// <li>
/// Create an IAM policy that enables the
/// <code>aws-marketplace:GetBuyerDashboard</code> and
/// <code>organizations:DescribeOrganization</code> permissions. In addition,
/// the management account requires the
/// <code>organizations:EnableAWSServiceAccess</code> and
/// <code>iam:CreateServiceLinkedRole</code> permissions to create. For more
/// information about creating the policy, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html">Policies
/// and permissions in Identity and Access Management</a>, in the <i>IAM User
/// Guide</i>.
/// <note>
/// Access can be shared only by registering the desired linked account as a
/// delegated administrator. That requires
/// <code>organizations:RegisterDelegatedAdministrator</code>
/// <code>organizations:ListDelegatedAdministrators</code> and
/// <code>organizations:DeregisterDelegatedAdministrator</code> permissions.
/// </note> </li>
/// <li>
/// Use the Amazon Web Services Marketplace console to create the
/// <code>AWSServiceRoleForProcurementInsightsPolicy</code> service-linked role.
/// The role enables Amazon Web Services Marketplace procurement visibility
/// integration. The management account requires an IAM policy with the
/// <code>organizations:EnableAWSServiceAccess</code> and
/// <code>iam:CreateServiceLinkedRole</code> permissions to create the
/// service-linked role and enable the service access. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/marketplace/latest/buyerguide/orgs-access-slr.html">Granting
/// access to Organizations</a> and <a
/// href="https://docs.aws.amazon.com/marketplace/latest/buyerguide/buyer-service-linked-role-procurement.html">Service-linked
/// role to share procurement data</a> in the <i>Amazon Web Services Marketplace
/// Buyer Guide</i>.
/// </li>
/// <li>
/// After creating the service-linked role, you must enable trusted access that
/// grants Amazon Web Services Marketplace permission to access data from your
/// Organizations. For more information, see <a
/// href="https://docs.aws.amazon.com/marketplace/latest/buyerguide/orgs-access-slr.html">Granting
/// access to Organizations</a> in the <i>Amazon Web Services Marketplace Buyer
/// Guide</i>.
/// </li>
/// </ul>
class MarketplaceReporting {
  final _s.RestJsonProtocol _protocol;
  factory MarketplaceReporting({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'reporting-marketplace',
      signingName: 'aws-marketplace',
    );
    return MarketplaceReporting._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  MarketplaceReporting._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Generates an embedding URL for an Amazon QuickSight dashboard for an
  /// anonymous user.
  /// <note>
  /// This API is available only to Amazon Web Services Organization management
  /// accounts or delegated administrators registered for the procurement
  /// insights (<code>procurement-insights.marketplace.amazonaws.com</code>)
  /// feature.
  /// </note>
  /// The following rules apply to a generated URL:
  ///
  /// <ul>
  /// <li>
  /// It contains a temporary bearer token, valid for 5 minutes after it is
  /// generated. Once redeemed within that period, it cannot be re-used again.
  /// </li>
  /// <li>
  /// It has a session lifetime of one hour. The 5-minute validity period runs
  /// separately from the session lifetime.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [dashboardIdentifier] :
  /// The ARN of the requested dashboard.
  ///
  /// Parameter [embeddingDomains] :
  /// Fully qualified domains that you add to the allow list for access to the
  /// generated URL that is then embedded. You can list up to two domains or
  /// subdomains in each API call. To include all subdomains under a specific
  /// domain, use <code>*</code>. For example, <code>https://*.amazon.com</code>
  /// includes all subdomains under <code>https://aws.amazon.com</code>.
  Future<GetBuyerDashboardOutput> getBuyerDashboard({
    required String dashboardIdentifier,
    required List<String> embeddingDomains,
  }) async {
    final $payload = <String, dynamic>{
      'dashboardIdentifier': dashboardIdentifier,
      'embeddingDomains': embeddingDomains,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getBuyerDashboard',
      exceptionFnMap: _exceptionFns,
    );
    return GetBuyerDashboardOutput.fromJson(response);
  }
}

/// @nodoc
class GetBuyerDashboardOutput {
  /// The ARN of the returned dashboard.
  final String dashboardIdentifier;

  /// The dashboard's embedding URL.
  final String embedUrl;

  /// The fully qualified domains specified in the request. The domains enable
  /// access to the generated URL that is then embedded. You can list up to two
  /// domains or subdomains in each API call. To include all subdomains under a
  /// specific domain, use <code>*</code>. For example,
  /// <code>https://*.amazon.com</code> includes all subdomains under
  /// <code>https://aws.amazon.com</code>.
  final List<String> embeddingDomains;

  GetBuyerDashboardOutput({
    required this.dashboardIdentifier,
    required this.embedUrl,
    required this.embeddingDomains,
  });

  factory GetBuyerDashboardOutput.fromJson(Map<String, dynamic> json) {
    return GetBuyerDashboardOutput(
      dashboardIdentifier: (json['dashboardIdentifier'] as String?) ?? '',
      embedUrl: (json['embedUrl'] as String?) ?? '',
      embeddingDomains: ((json['embeddingDomains'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardIdentifier = this.dashboardIdentifier;
    final embedUrl = this.embedUrl;
    final embeddingDomains = this.embeddingDomains;
    return {
      'dashboardIdentifier': dashboardIdentifier,
      'embedUrl': embedUrl,
      'embeddingDomains': embeddingDomains,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
