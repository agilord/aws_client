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

/// <note>
/// Connector for SCEP (Preview) is in preview release for Amazon Web Services
/// Private Certificate Authority and is subject to change.
/// </note>
/// Connector for SCEP (Preview) creates a connector between Amazon Web Services
/// Private CA and your SCEP-enabled clients and devices. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/scep-connector.html">Connector
/// for SCEP</a> in the <i>Amazon Web Services Private CA User Guide</i>.
class PrivateCAConnectorForScep {
  final _s.RestJsonProtocol _protocol;
  PrivateCAConnectorForScep({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'pca-connector-scep',
            signingName: 'pca-connector-scep',
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

  /// For general-purpose connectors. Creates a <i>challenge password</i> for
  /// the specified connector. The SCEP protocol uses a challenge password to
  /// authenticate a request before issuing a certificate from a certificate
  /// authority (CA). Your SCEP clients include the challenge password as part
  /// of their certificate request to Connector for SCEP. To retrieve the
  /// connector Amazon Resource Names (ARNs) for the connectors in your account,
  /// call <a
  /// href="https://docs.aws.amazon.com/C4SCEP_API/pca-connector-scep/latest/APIReference/API_ListConnectors.html">ListConnectors</a>.
  ///
  /// To create additional challenge passwords for the connector, call
  /// <code>CreateChallenge</code> again. We recommend frequently rotating your
  /// challenge passwords.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) of the connector that you want to create a
  /// challenge for.
  ///
  /// Parameter [clientToken] :
  /// Custom string that can be used to distinguish between calls to the <a
  /// href="https://docs.aws.amazon.com/C4SCEP_API/pca-connector-scep/latest/APIReference/API_CreateChallenge.html">CreateChallenge</a>
  /// action. Client tokens for <code>CreateChallenge</code> time out after five
  /// minutes. Therefore, if you call <code>CreateChallenge</code> multiple
  /// times with the same client token within five minutes, Connector for SCEP
  /// recognizes that you are requesting only one challenge and will only
  /// respond with one. If you change the client token for each call, Connector
  /// for SCEP recognizes that you are requesting multiple challenge passwords.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with the resource.
  Future<CreateChallengeResponse> createChallenge({
    required String connectorArn,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ConnectorArn': connectorArn,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/challenges',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChallengeResponse.fromJson(response);
  }

  /// Creates a SCEP connector. A SCEP connector links Amazon Web Services
  /// Private Certificate Authority to your SCEP-compatible devices and mobile
  /// device management (MDM) systems. Before you create a connector, you must
  /// complete a set of prerequisites, including creation of a private
  /// certificate authority (CA) to use with this connector. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/scep-connector.htmlconnector-for-scep-prerequisites.html">Connector
  /// for SCEP prerequisites</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Private
  /// Certificate Authority certificate authority to use with this connector.
  /// Due to security vulnerabilities present in the SCEP protocol, we recommend
  /// using a private CA that's dedicated for use with the connector.
  ///
  /// To retrieve the private CAs associated with your account, you can call <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// using the Amazon Web Services Private CA API.
  ///
  /// Parameter [clientToken] :
  /// Custom string that can be used to distinguish between calls to the <a
  /// href="https://docs.aws.amazon.com/C4SCEP_API/pca-connector-scep/latest/APIReference/API_CreateChallenge.html">CreateChallenge</a>
  /// action. Client tokens for <code>CreateChallenge</code> time out after five
  /// minutes. Therefore, if you call <code>CreateChallenge</code> multiple
  /// times with the same client token within five minutes, Connector for SCEP
  /// recognizes that you are requesting only one challenge and will only
  /// respond with one. If you change the client token for each call, Connector
  /// for SCEP recognizes that you are requesting multiple challenge passwords.
  ///
  /// Parameter [mobileDeviceManagement] :
  /// If you don't supply a value, by default Connector for SCEP creates a
  /// connector for general-purpose use. A general-purpose connector is designed
  /// to work with clients or endpoints that support the SCEP protocol, except
  /// Connector for SCEP for Microsoft Intune. With connectors for
  /// general-purpose use, you manage SCEP challenge passwords using Connector
  /// for SCEP. For information about considerations and limitations with using
  /// Connector for SCEP, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/scep-connector.htmlc4scep-considerations-limitations.html">Considerations
  /// and Limitations</a>.
  ///
  /// If you provide an <code>IntuneConfiguration</code>, Connector for SCEP
  /// creates a connector for use with Microsoft Intune, and you manage the
  /// challenge passwords using Microsoft Intune. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/scep-connector.htmlconnector-for-scep-intune.html">Using
  /// Connector for SCEP for Microsoft Intune</a>.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with the resource.
  Future<CreateConnectorResponse> createConnector({
    required String certificateAuthorityArn,
    String? clientToken,
    MobileDeviceManagement? mobileDeviceManagement,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CertificateAuthorityArn': certificateAuthorityArn,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (mobileDeviceManagement != null)
        'MobileDeviceManagement': mobileDeviceManagement,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/connectors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConnectorResponse.fromJson(response);
  }

  /// Deletes the specified <a
  /// href="https://docs.aws.amazon.com/C4SCEP_API/pca-connector-scep/latest/APIReference/API_Challenge.html">Challenge</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [challengeArn] :
  /// The Amazon Resource Name (ARN) of the challenge password to delete.
  Future<void> deleteChallenge({
    required String challengeArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/challenges/${Uri.encodeComponent(challengeArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified <a
  /// href="https://docs.aws.amazon.com/C4SCEP_API/pca-connector-scep/latest/APIReference/API_Connector.html">Connector</a>.
  /// This operation also deletes any challenges associated with the connector.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) of the connector to delete.
  Future<void> deleteConnector({
    required String connectorArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/connectors/${Uri.encodeComponent(connectorArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the metadata for the specified <a
  /// href="https://docs.aws.amazon.com/C4SCEP_API/pca-connector-scep/latest/APIReference/API_Challenge.html">Challenge</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [challengeArn] :
  /// The Amazon Resource Name (ARN) of the challenge.
  Future<GetChallengeMetadataResponse> getChallengeMetadata({
    required String challengeArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/challengeMetadata/${Uri.encodeComponent(challengeArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetChallengeMetadataResponse.fromJson(response);
  }

  /// Retrieves the challenge password for the specified <a
  /// href="https://docs.aws.amazon.com/C4SCEP_API/pca-connector-scep/latest/APIReference/API_Challenge.html">Challenge</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [challengeArn] :
  /// The Amazon Resource Name (ARN) of the challenge.
  Future<GetChallengePasswordResponse> getChallengePassword({
    required String challengeArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/challengePasswords/${Uri.encodeComponent(challengeArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetChallengePasswordResponse.fromJson(response);
  }

  /// Retrieves details about the specified <a
  /// href="https://docs.aws.amazon.com/C4SCEP_API/pca-connector-scep/latest/APIReference/API_Connector.html">Connector</a>.
  /// Calling this action returns important details about the connector, such as
  /// the public SCEP URL where your clients can request certificates.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) of the connector.
  Future<GetConnectorResponse> getConnector({
    required String connectorArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/connectors/${Uri.encodeComponent(connectorArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectorResponse.fromJson(response);
  }

  /// Retrieves the challenge metadata for the specified ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) of the connector.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Connector for SCEP to return
  /// for this request. If more objects are available, in the response,
  /// Connector for SCEP provides a <code>NextToken</code> value that you can
  /// use in a subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Connector for SCEP returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
  Future<ListChallengeMetadataResponse> listChallengeMetadata({
    required String connectorArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'ConnectorArn': [connectorArn],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/challengeMetadata',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChallengeMetadataResponse.fromJson(response);
  }

  /// Lists the connectors belonging to your Amazon Web Services account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Connector for SCEP to return
  /// for this request. If more objects are available, in the response,
  /// Connector for SCEP provides a <code>NextToken</code> value that you can
  /// use in a subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Connector for SCEP returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
  Future<ListConnectorsResponse> listConnectors({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/connectors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectorsResponse.fromJson(response);
  }

  /// Retrieves the tags associated with the specified resource. Tags are
  /// key-value pairs that you can use to categorize and manage your resources,
  /// for purposes like billing. For example, you might set the tag key to
  /// "customer" and the value to the customer name or ID. You can specify one
  /// or more tags to add to each Amazon Web Services resource, up to 50 tags
  /// for a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Adds one or more tags to your resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to associate with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from your resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// Specifies a list of tag keys that you want to remove from the specified
  /// resources.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// For Connector for SCEP for general-purpose. An object containing information
/// about the specified connector's SCEP challenge passwords.
class Challenge {
  /// The Amazon Resource Name (ARN) of the challenge.
  final String? arn;

  /// The Amazon Resource Name (ARN) of the connector.
  final String? connectorArn;

  /// The date and time that the challenge was created.
  final DateTime? createdAt;

  /// The SCEP challenge password, in UUID format.
  final String? password;

  /// The date and time that the challenge was updated.
  final DateTime? updatedAt;

  Challenge({
    this.arn,
    this.connectorArn,
    this.createdAt,
    this.password,
    this.updatedAt,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      arn: json['Arn'] as String?,
      connectorArn: json['ConnectorArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      password: json['Password'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectorArn = this.connectorArn;
    final createdAt = this.createdAt;
    final password = this.password;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (connectorArn != null) 'ConnectorArn': connectorArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (password != null) 'Password': password,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Contains details about the connector's challenge.
class ChallengeMetadata {
  /// The Amazon Resource Name (ARN) of the challenge.
  final String? arn;

  /// The Amazon Resource Name (ARN) of the connector.
  final String? connectorArn;

  /// The date and time that the connector was created.
  final DateTime? createdAt;

  /// The date and time that the connector was updated.
  final DateTime? updatedAt;

  ChallengeMetadata({
    this.arn,
    this.connectorArn,
    this.createdAt,
    this.updatedAt,
  });

  factory ChallengeMetadata.fromJson(Map<String, dynamic> json) {
    return ChallengeMetadata(
      arn: json['Arn'] as String?,
      connectorArn: json['ConnectorArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectorArn = this.connectorArn;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (connectorArn != null) 'ConnectorArn': connectorArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Details about the specified challenge, returned by the <a
/// href="https://docs.aws.amazon.com/C4SCEP_API/pca-connector-scep/latest/APIReference/API_GetChallengeMetadata.html">GetChallengeMetadata</a>
/// action.
class ChallengeMetadataSummary {
  /// The Amazon Resource Name (ARN) of the challenge.
  final String? arn;

  /// The Amazon Resource Name (ARN) of the connector.
  final String? connectorArn;

  /// The date and time that the challenge was created.
  final DateTime? createdAt;

  /// The date and time that the challenge was updated.
  final DateTime? updatedAt;

  ChallengeMetadataSummary({
    this.arn,
    this.connectorArn,
    this.createdAt,
    this.updatedAt,
  });

  factory ChallengeMetadataSummary.fromJson(Map<String, dynamic> json) {
    return ChallengeMetadataSummary(
      arn: json['Arn'] as String?,
      connectorArn: json['ConnectorArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectorArn = this.connectorArn;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (connectorArn != null) 'ConnectorArn': connectorArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Connector for SCEP is a service that links Amazon Web Services Private
/// Certificate Authority to your SCEP-enabled devices. The connector brokers
/// the exchange of certificates from Amazon Web Services Private CA to your
/// SCEP-enabled devices and mobile device management systems. The connector is
/// a complex type that contains the connector's configuration settings.
class Connector {
  /// The Amazon Resource Name (ARN) of the connector.
  final String? arn;

  /// The Amazon Resource Name (ARN) of the certificate authority associated with
  /// the connector.
  final String? certificateAuthorityArn;

  /// The date and time that the connector was created.
  final DateTime? createdAt;

  /// The connector's HTTPS public SCEP URL.
  final String? endpoint;

  /// Contains settings relevant to the mobile device management system that you
  /// chose for the connector. If you didn't configure
  /// <code>MobileDeviceManagement</code>, then the connector is for
  /// general-purpose use and this object is empty.
  final MobileDeviceManagement? mobileDeviceManagement;

  /// Contains OpenID Connect (OIDC) parameters for use with Connector for SCEP
  /// for Microsoft Intune. For more information about using Connector for SCEP
  /// for Microsoft Intune, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/scep-connector.htmlconnector-for-scep-intune.html">Using
  /// Connector for SCEP for Microsoft Intune</a>.
  final OpenIdConfiguration? openIdConfiguration;

  /// The connector's status.
  final ConnectorStatus? status;

  /// Information about why connector creation failed, if status is
  /// <code>FAILED</code>.
  final ConnectorStatusReason? statusReason;

  /// The connector type.
  final ConnectorType? type;

  /// The date and time that the connector was updated.
  final DateTime? updatedAt;

  Connector({
    this.arn,
    this.certificateAuthorityArn,
    this.createdAt,
    this.endpoint,
    this.mobileDeviceManagement,
    this.openIdConfiguration,
    this.status,
    this.statusReason,
    this.type,
    this.updatedAt,
  });

  factory Connector.fromJson(Map<String, dynamic> json) {
    return Connector(
      arn: json['Arn'] as String?,
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      endpoint: json['Endpoint'] as String?,
      mobileDeviceManagement: json['MobileDeviceManagement'] != null
          ? MobileDeviceManagement.fromJson(
              json['MobileDeviceManagement'] as Map<String, dynamic>)
          : null,
      openIdConfiguration: json['OpenIdConfiguration'] != null
          ? OpenIdConfiguration.fromJson(
              json['OpenIdConfiguration'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(ConnectorStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(ConnectorStatusReason.fromString),
      type: (json['Type'] as String?)?.let(ConnectorType.fromString),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final createdAt = this.createdAt;
    final endpoint = this.endpoint;
    final mobileDeviceManagement = this.mobileDeviceManagement;
    final openIdConfiguration = this.openIdConfiguration;
    final status = this.status;
    final statusReason = this.statusReason;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (endpoint != null) 'Endpoint': endpoint,
      if (mobileDeviceManagement != null)
        'MobileDeviceManagement': mobileDeviceManagement,
      if (openIdConfiguration != null)
        'OpenIdConfiguration': openIdConfiguration,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
      if (type != null) 'Type': type.value,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum ConnectorStatus {
  creating('CREATING'),
  active('ACTIVE'),
  deleting('DELETING'),
  failed('FAILED'),
  ;

  final String value;

  const ConnectorStatus(this.value);

  static ConnectorStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConnectorStatus'));
}

enum ConnectorStatusReason {
  internalFailure('INTERNAL_FAILURE'),
  privatecaAccessDenied('PRIVATECA_ACCESS_DENIED'),
  privatecaInvalidState('PRIVATECA_INVALID_STATE'),
  privatecaResourceNotFound('PRIVATECA_RESOURCE_NOT_FOUND'),
  ;

  final String value;

  const ConnectorStatusReason(this.value);

  static ConnectorStatusReason fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ConnectorStatusReason'));
}

/// Lists the Amazon Web Services Private CA SCEP connectors belonging to your
/// Amazon Web Services account.
class ConnectorSummary {
  /// The Amazon Resource Name (ARN) of the connector.
  final String? arn;

  /// The Amazon Resource Name (ARN) of the connector's associated certificate
  /// authority.
  final String? certificateAuthorityArn;

  /// The date and time that the challenge was created.
  final DateTime? createdAt;

  /// The connector's HTTPS public SCEP URL.
  final String? endpoint;

  /// Contains settings relevant to the mobile device management system that you
  /// chose for the connector. If you didn't configure
  /// <code>MobileDeviceManagement</code>, then the connector is for
  /// general-purpose use and this object is empty.
  final MobileDeviceManagement? mobileDeviceManagement;

  /// Contains OpenID Connect (OIDC) parameters for use with Microsoft Intune.
  final OpenIdConfiguration? openIdConfiguration;

  /// The connector's status. Status can be creating, active, deleting, or failed.
  final ConnectorStatus? status;

  /// Information about why connector creation failed, if status is
  /// <code>FAILED</code>.
  final ConnectorStatusReason? statusReason;

  /// The connector type.
  final ConnectorType? type;

  /// The date and time that the challenge was updated.
  final DateTime? updatedAt;

  ConnectorSummary({
    this.arn,
    this.certificateAuthorityArn,
    this.createdAt,
    this.endpoint,
    this.mobileDeviceManagement,
    this.openIdConfiguration,
    this.status,
    this.statusReason,
    this.type,
    this.updatedAt,
  });

  factory ConnectorSummary.fromJson(Map<String, dynamic> json) {
    return ConnectorSummary(
      arn: json['Arn'] as String?,
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      endpoint: json['Endpoint'] as String?,
      mobileDeviceManagement: json['MobileDeviceManagement'] != null
          ? MobileDeviceManagement.fromJson(
              json['MobileDeviceManagement'] as Map<String, dynamic>)
          : null,
      openIdConfiguration: json['OpenIdConfiguration'] != null
          ? OpenIdConfiguration.fromJson(
              json['OpenIdConfiguration'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(ConnectorStatus.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(ConnectorStatusReason.fromString),
      type: (json['Type'] as String?)?.let(ConnectorType.fromString),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final createdAt = this.createdAt;
    final endpoint = this.endpoint;
    final mobileDeviceManagement = this.mobileDeviceManagement;
    final openIdConfiguration = this.openIdConfiguration;
    final status = this.status;
    final statusReason = this.statusReason;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (endpoint != null) 'Endpoint': endpoint,
      if (mobileDeviceManagement != null)
        'MobileDeviceManagement': mobileDeviceManagement,
      if (openIdConfiguration != null)
        'OpenIdConfiguration': openIdConfiguration,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
      if (type != null) 'Type': type.value,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum ConnectorType {
  generalPurpose('GENERAL_PURPOSE'),
  intune('INTUNE'),
  ;

  final String value;

  const ConnectorType(this.value);

  static ConnectorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConnectorType'));
}

class CreateChallengeResponse {
  /// Returns the challenge details for the specified connector.
  final Challenge? challenge;

  CreateChallengeResponse({
    this.challenge,
  });

  factory CreateChallengeResponse.fromJson(Map<String, dynamic> json) {
    return CreateChallengeResponse(
      challenge: json['Challenge'] != null
          ? Challenge.fromJson(json['Challenge'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final challenge = this.challenge;
    return {
      if (challenge != null) 'Challenge': challenge,
    };
  }
}

class CreateConnectorResponse {
  /// Returns the Amazon Resource Name (ARN) of the connector.
  final String? connectorArn;

  CreateConnectorResponse({
    this.connectorArn,
  });

  factory CreateConnectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateConnectorResponse(
      connectorArn: json['ConnectorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    return {
      if (connectorArn != null) 'ConnectorArn': connectorArn,
    };
  }
}

class GetChallengeMetadataResponse {
  /// The metadata for the challenge.
  final ChallengeMetadata? challengeMetadata;

  GetChallengeMetadataResponse({
    this.challengeMetadata,
  });

  factory GetChallengeMetadataResponse.fromJson(Map<String, dynamic> json) {
    return GetChallengeMetadataResponse(
      challengeMetadata: json['ChallengeMetadata'] != null
          ? ChallengeMetadata.fromJson(
              json['ChallengeMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final challengeMetadata = this.challengeMetadata;
    return {
      if (challengeMetadata != null) 'ChallengeMetadata': challengeMetadata,
    };
  }
}

class GetChallengePasswordResponse {
  /// The SCEP challenge password.
  final String? password;

  GetChallengePasswordResponse({
    this.password,
  });

  factory GetChallengePasswordResponse.fromJson(Map<String, dynamic> json) {
    return GetChallengePasswordResponse(
      password: json['Password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final password = this.password;
    return {
      if (password != null) 'Password': password,
    };
  }
}

class GetConnectorResponse {
  /// The properties of the connector.
  final Connector? connector;

  GetConnectorResponse({
    this.connector,
  });

  factory GetConnectorResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectorResponse(
      connector: json['Connector'] != null
          ? Connector.fromJson(json['Connector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connector = this.connector;
    return {
      if (connector != null) 'Connector': connector,
    };
  }
}

/// Contains configuration details for use with Microsoft Intune. For
/// information about using Connector for SCEP for Microsoft Intune, see <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/scep-connector.htmlconnector-for-scep-intune.html">Using
/// Connector for SCEP for Microsoft Intune</a>.
///
/// When you use Connector for SCEP for Microsoft Intune, certain
/// functionalities are enabled by accessing Microsoft Intune through the
/// Microsoft API. Your use of the Connector for SCEP and accompanying Amazon
/// Web Services services doesn't remove your need to have a valid license for
/// your use of the Microsoft Intune service. You should also review the <a
/// href="https://learn.microsoft.com/en-us/mem/intune/apps/app-protection-policy">Microsoft
/// Intune® App Protection Policies</a>.
class IntuneConfiguration {
  /// The directory (tenant) ID from your Microsoft Entra ID app registration.
  final String azureApplicationId;

  /// The primary domain from your Microsoft Entra ID app registration.
  final String domain;

  IntuneConfiguration({
    required this.azureApplicationId,
    required this.domain,
  });

  factory IntuneConfiguration.fromJson(Map<String, dynamic> json) {
    return IntuneConfiguration(
      azureApplicationId: json['AzureApplicationId'] as String,
      domain: json['Domain'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final azureApplicationId = this.azureApplicationId;
    final domain = this.domain;
    return {
      'AzureApplicationId': azureApplicationId,
      'Domain': domain,
    };
  }
}

class ListChallengeMetadataResponse {
  /// The challenge metadata for the challenges belonging to your Amazon Web
  /// Services account.
  final List<ChallengeMetadataSummary>? challenges;

  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Connector for SCEP returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  ListChallengeMetadataResponse({
    this.challenges,
    this.nextToken,
  });

  factory ListChallengeMetadataResponse.fromJson(Map<String, dynamic> json) {
    return ListChallengeMetadataResponse(
      challenges: (json['Challenges'] as List?)
          ?.nonNulls
          .map((e) =>
              ChallengeMetadataSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final challenges = this.challenges;
    final nextToken = this.nextToken;
    return {
      if (challenges != null) 'Challenges': challenges,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListConnectorsResponse {
  /// The connectors belonging to your Amazon Web Services account.
  final List<ConnectorSummary>? connectors;

  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Connector for SCEP returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  ListConnectorsResponse({
    this.connectors,
    this.nextToken,
  });

  factory ListConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectorsResponse(
      connectors: (json['Connectors'] as List?)
          ?.nonNulls
          .map((e) => ConnectorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectors = this.connectors;
    final nextToken = this.nextToken;
    return {
      if (connectors != null) 'Connectors': connectors,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The key-value pairs to associate with the resource.
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

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// If you don't supply a value, by default Connector for SCEP creates a
/// connector for general-purpose use. A general-purpose connector is designed
/// to work with clients or endpoints that support the SCEP protocol, except
/// Connector for SCEP for Microsoft Intune. For information about
/// considerations and limitations with using Connector for SCEP, see <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/scep-connector.htmlc4scep-considerations-limitations.html">Considerations
/// and Limitations</a>.
///
/// If you provide an <code>IntuneConfiguration</code>, Connector for SCEP
/// creates a connector for use with Microsoft Intune, and you manage the
/// challenge passwords using Microsoft Intune. For more information, see <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/scep-connector.htmlconnector-for-scep-intune.html">Using
/// Connector for SCEP for Microsoft Intune</a>.
class MobileDeviceManagement {
  /// Configuration settings for use with Microsoft Intune. For information about
  /// using Connector for SCEP for Microsoft Intune, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/scep-connector.htmlconnector-for-scep-intune.html">Using
  /// Connector for SCEP for Microsoft Intune</a>.
  final IntuneConfiguration? intune;

  MobileDeviceManagement({
    this.intune,
  });

  factory MobileDeviceManagement.fromJson(Map<String, dynamic> json) {
    return MobileDeviceManagement(
      intune: json['Intune'] != null
          ? IntuneConfiguration.fromJson(json['Intune'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final intune = this.intune;
    return {
      if (intune != null) 'Intune': intune,
    };
  }
}

/// Contains OpenID Connect (OIDC) parameters for use with Microsoft Intune. For
/// more information about using Connector for SCEP for Microsoft Intune, see <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/scep-connector.htmlconnector-for-scep-intune.html">Using
/// Connector for SCEP for Microsoft Intune</a>.
class OpenIdConfiguration {
  /// The audience value to copy into your Microsoft Entra app registration's
  /// OIDC.
  final String? audience;

  /// The issuer value to copy into your Microsoft Entra app registration's OIDC.
  final String? issuer;

  /// The subject value to copy into your Microsoft Entra app registration's OIDC.
  final String? subject;

  OpenIdConfiguration({
    this.audience,
    this.issuer,
    this.subject,
  });

  factory OpenIdConfiguration.fromJson(Map<String, dynamic> json) {
    return OpenIdConfiguration(
      audience: json['Audience'] as String?,
      issuer: json['Issuer'] as String?,
      subject: json['Subject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audience = this.audience;
    final issuer = this.issuer;
    final subject = this.subject;
    return {
      if (audience != null) 'Audience': audience,
      if (issuer != null) 'Issuer': issuer,
      if (subject != null) 'Subject': subject,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
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
