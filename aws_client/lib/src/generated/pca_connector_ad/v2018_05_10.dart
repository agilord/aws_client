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

/// Amazon Web Services Private CA Connector for Active Directory creates a
/// connector between Amazon Web Services Private CA and Active Directory (AD)
/// that enables you to provision security certificates for AD signed by a
/// private CA that you own. For more information, see <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/ad-connector.html">Amazon
/// Web Services Private CA Connector for Active Directory</a>.
class PcaConnectorAd {
  final _s.RestJsonProtocol _protocol;
  PcaConnectorAd({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'pca-connector-ad',
            signingName: 'pca-connector-ad',
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

  /// Creates a connector between Amazon Web Services Private CA and an Active
  /// Directory. You must specify the private CA, directory ID, and security
  /// groups.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) of the certificate authority being used.
  ///
  /// Parameter [directoryId] :
  /// The identifier of the Active Directory.
  ///
  /// Parameter [vpcInformation] :
  /// Security group IDs that describe the inbound and outbound rules.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token.
  ///
  /// Parameter [tags] :
  /// Metadata assigned to a connector consisting of a key-value pair.
  Future<CreateConnectorResponse> createConnector({
    required String certificateAuthorityArn,
    required String directoryId,
    required VpcInformation vpcInformation,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CertificateAuthorityArn': certificateAuthorityArn,
      'DirectoryId': directoryId,
      'VpcInformation': vpcInformation,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
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

  /// Creates a directory registration that authorizes communication between
  /// Amazon Web Services Private CA and an Active Directory
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the Active Directory.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token.
  ///
  /// Parameter [tags] :
  /// Metadata assigned to a directory registration consisting of a key-value
  /// pair.
  Future<CreateDirectoryRegistrationResponse> createDirectoryRegistration({
    required String directoryId,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DirectoryId': directoryId,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/directoryRegistrations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDirectoryRegistrationResponse.fromJson(response);
  }

  /// Creates a service principal name (SPN) for the service account in Active
  /// Directory. Kerberos authentication uses SPNs to associate a service
  /// instance with a service sign-in account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
  ///
  /// Parameter [directoryRegistrationArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration.html">CreateDirectoryRegistration</a>.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token.
  Future<void> createServicePrincipalName({
    required String connectorArn,
    required String directoryRegistrationArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/directoryRegistrations/${Uri.encodeComponent(directoryRegistrationArn)}/servicePrincipalNames/${Uri.encodeComponent(connectorArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an Active Directory compatible certificate template. The
  /// connectors issues certificates using these templates based on the
  /// requester’s Active Directory group membership.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
  ///
  /// Parameter [definition] :
  /// Template configuration to define the information included in certificates.
  /// Define certificate validity and renewal periods, certificate request
  /// handling and enrollment options, key usage extensions, application
  /// policies, and cryptography settings.
  ///
  /// Parameter [name] :
  /// Name of the template. The template name must be unique.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token.
  ///
  /// Parameter [tags] :
  /// Metadata assigned to a template consisting of a key-value pair.
  Future<CreateTemplateResponse> createTemplate({
    required String connectorArn,
    required TemplateDefinition definition,
    required String name,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ConnectorArn': connectorArn,
      'Definition': definition,
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/templates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTemplateResponse.fromJson(response);
  }

  /// Create a group access control entry. Allow or deny Active Directory groups
  /// from enrolling and/or autoenrolling with the template based on the group
  /// security identifiers (SIDs).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [accessRights] :
  /// Allow or deny permissions for an Active Directory group to enroll or
  /// autoenroll certificates for a template.
  ///
  /// Parameter [groupDisplayName] :
  /// Name of the Active Directory group. This name does not need to match the
  /// group name in Active Directory.
  ///
  /// Parameter [groupSecurityIdentifier] :
  /// Security identifier (SID) of the group object from Active Directory. The
  /// SID starts with "S-".
  ///
  /// Parameter [templateArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token.
  Future<void> createTemplateGroupAccessControlEntry({
    required AccessRights accessRights,
    required String groupDisplayName,
    required String groupSecurityIdentifier,
    required String templateArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'AccessRights': accessRights,
      'GroupDisplayName': groupDisplayName,
      'GroupSecurityIdentifier': groupSecurityIdentifier,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/templates/${Uri.encodeComponent(templateArn)}/accessControlEntries',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a connector for Active Directory. You must provide the Amazon
  /// Resource Name (ARN) of the connector that you want to delete. You can find
  /// the ARN by calling the <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_ListConnectors">https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_ListConnectors</a>
  /// action. Deleting a connector does not deregister your directory with
  /// Amazon Web Services Private CA. You can deregister your directory by
  /// calling the <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_DeleteDirectoryRegistration">https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_DeleteDirectoryRegistration</a>
  /// action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
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

  /// Deletes a directory registration. Deleting a directory registration
  /// deauthorizes Amazon Web Services Private CA with the directory.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [directoryRegistrationArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration.html">CreateDirectoryRegistration</a>.
  Future<void> deleteDirectoryRegistration({
    required String directoryRegistrationArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/directoryRegistrations/${Uri.encodeComponent(directoryRegistrationArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the service principal name (SPN) used by a connector to
  /// authenticate with your Active Directory.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
  ///
  /// Parameter [directoryRegistrationArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration.html">CreateDirectoryRegistration</a>.
  Future<void> deleteServicePrincipalName({
    required String connectorArn,
    required String directoryRegistrationArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/directoryRegistrations/${Uri.encodeComponent(directoryRegistrationArn)}/servicePrincipalNames/${Uri.encodeComponent(connectorArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a template. Certificates issued using the template are still valid
  /// until they are revoked or expired.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [templateArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  Future<void> deleteTemplate({
    required String templateArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/templates/${Uri.encodeComponent(templateArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a group access control entry.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [groupSecurityIdentifier] :
  /// Security identifier (SID) of the group object from Active Directory. The
  /// SID starts with "S-".
  ///
  /// Parameter [templateArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  Future<void> deleteTemplateGroupAccessControlEntry({
    required String groupSecurityIdentifier,
    required String templateArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/templates/${Uri.encodeComponent(templateArn)}/accessControlEntries/${Uri.encodeComponent(groupSecurityIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists information about your connector. You specify the connector on input
  /// by its ARN (Amazon Resource Name).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
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

  /// A structure that contains information about your directory registration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [directoryRegistrationArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration.html">CreateDirectoryRegistration</a>.
  Future<GetDirectoryRegistrationResponse> getDirectoryRegistration({
    required String directoryRegistrationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/directoryRegistrations/${Uri.encodeComponent(directoryRegistrationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDirectoryRegistrationResponse.fromJson(response);
  }

  /// Lists the service principal name that the connector uses to authenticate
  /// with Active Directory.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
  ///
  /// Parameter [directoryRegistrationArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration.html">CreateDirectoryRegistration</a>.
  Future<GetServicePrincipalNameResponse> getServicePrincipalName({
    required String connectorArn,
    required String directoryRegistrationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/directoryRegistrations/${Uri.encodeComponent(directoryRegistrationArn)}/servicePrincipalNames/${Uri.encodeComponent(connectorArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetServicePrincipalNameResponse.fromJson(response);
  }

  /// Retrieves a certificate template that the connector uses to issue
  /// certificates from a private CA.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [templateArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  Future<GetTemplateResponse> getTemplate({
    required String templateArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/templates/${Uri.encodeComponent(templateArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTemplateResponse.fromJson(response);
  }

  /// Retrieves the group access control entries for a template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [groupSecurityIdentifier] :
  /// Security identifier (SID) of the group object from Active Directory. The
  /// SID starts with "S-".
  ///
  /// Parameter [templateArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  Future<GetTemplateGroupAccessControlEntryResponse>
      getTemplateGroupAccessControlEntry({
    required String groupSecurityIdentifier,
    required String templateArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/templates/${Uri.encodeComponent(templateArn)}/accessControlEntries/${Uri.encodeComponent(groupSecurityIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTemplateGroupAccessControlEntryResponse.fromJson(response);
  }

  /// Lists the connectors that you created by using the <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector">https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector</a>
  /// action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Use this parameter when paginating results to specify the maximum number
  /// of items to return in the response on each page. If additional items exist
  /// beyond the number you specify, the <code>NextToken</code> element is sent
  /// in the response. Use this <code>NextToken</code> value in a subsequent
  /// request to retrieve additional items.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results in a subsequent request after
  /// you receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
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

  /// Lists the directory registrations that you created by using the <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration">https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration</a>
  /// action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Use this parameter when paginating results to specify the maximum number
  /// of items to return in the response on each page. If additional items exist
  /// beyond the number you specify, the <code>NextToken</code> element is sent
  /// in the response. Use this <code>NextToken</code> value in a subsequent
  /// request to retrieve additional items.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results in a subsequent request after
  /// you receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
  Future<ListDirectoryRegistrationsResponse> listDirectoryRegistrations({
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
      requestUri: '/directoryRegistrations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDirectoryRegistrationsResponse.fromJson(response);
  }

  /// Lists the service principal names that the connector uses to authenticate
  /// with Active Directory.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [directoryRegistrationArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration.html">CreateDirectoryRegistration</a>.
  ///
  /// Parameter [maxResults] :
  /// Use this parameter when paginating results to specify the maximum number
  /// of items to return in the response on each page. If additional items exist
  /// beyond the number you specify, the <code>NextToken</code> element is sent
  /// in the response. Use this <code>NextToken</code> value in a subsequent
  /// request to retrieve additional items.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results in a subsequent request after
  /// you receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
  Future<ListServicePrincipalNamesResponse> listServicePrincipalNames({
    required String directoryRegistrationArn,
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
      requestUri:
          '/directoryRegistrations/${Uri.encodeComponent(directoryRegistrationArn)}/servicePrincipalNames',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServicePrincipalNamesResponse.fromJson(response);
  }

  /// Lists the tags, if any, that are associated with your resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that was returned when you created the
  /// resource.
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

  /// Lists group access control entries you created.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [templateArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  ///
  /// Parameter [maxResults] :
  /// Use this parameter when paginating results to specify the maximum number
  /// of items to return in the response on each page. If additional items exist
  /// beyond the number you specify, the <code>NextToken</code> element is sent
  /// in the response. Use this <code>NextToken</code> value in a subsequent
  /// request to retrieve additional items.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results in a subsequent request after
  /// you receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
  Future<ListTemplateGroupAccessControlEntriesResponse>
      listTemplateGroupAccessControlEntries({
    required String templateArn,
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
      requestUri:
          '/templates/${Uri.encodeComponent(templateArn)}/accessControlEntries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTemplateGroupAccessControlEntriesResponse.fromJson(response);
  }

  /// Lists the templates, if any, that are associated with a connector.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
  ///
  /// Parameter [maxResults] :
  /// Use this parameter when paginating results to specify the maximum number
  /// of items to return in the response on each page. If additional items exist
  /// beyond the number you specify, the <code>NextToken</code> element is sent
  /// in the response. Use this <code>NextToken</code> value in a subsequent
  /// request to retrieve additional items.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results in a subsequent request after
  /// you receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
  Future<ListTemplatesResponse> listTemplates({
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
      requestUri: '/templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTemplatesResponse.fromJson(response);
  }

  /// Adds one or more tags to your resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that was returned when you created the
  /// resource.
  ///
  /// Parameter [tags] :
  /// Metadata assigned to a directory registration consisting of a key-value
  /// pair.
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
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that was returned when you created the
  /// resource.
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

  /// Update template configuration to define the information included in
  /// certificates.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [templateArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  ///
  /// Parameter [definition] :
  /// Template configuration to define the information included in certificates.
  /// Define certificate validity and renewal periods, certificate request
  /// handling and enrollment options, key usage extensions, application
  /// policies, and cryptography settings.
  ///
  /// Parameter [reenrollAllCertificateHolders] :
  /// This setting allows the major version of a template to be increased
  /// automatically. All members of Active Directory groups that are allowed to
  /// enroll with a template will receive a new certificate issued using that
  /// template.
  Future<void> updateTemplate({
    required String templateArn,
    TemplateDefinition? definition,
    bool? reenrollAllCertificateHolders,
  }) async {
    final $payload = <String, dynamic>{
      if (definition != null) 'Definition': definition,
      if (reenrollAllCertificateHolders != null)
        'ReenrollAllCertificateHolders': reenrollAllCertificateHolders,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/templates/${Uri.encodeComponent(templateArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update a group access control entry you created using <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplateGroupAccessControlEntry.html">CreateTemplateGroupAccessControlEntry</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [groupSecurityIdentifier] :
  /// Security identifier (SID) of the group object from Active Directory. The
  /// SID starts with "S-".
  ///
  /// Parameter [templateArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  ///
  /// Parameter [accessRights] :
  /// Allow or deny permissions for an Active Directory group to enroll or
  /// autoenroll certificates for a template.
  ///
  /// Parameter [groupDisplayName] :
  /// Name of the Active Directory group. This name does not need to match the
  /// group name in Active Directory.
  Future<void> updateTemplateGroupAccessControlEntry({
    required String groupSecurityIdentifier,
    required String templateArn,
    AccessRights? accessRights,
    String? groupDisplayName,
  }) async {
    final $payload = <String, dynamic>{
      if (accessRights != null) 'AccessRights': accessRights,
      if (groupDisplayName != null) 'GroupDisplayName': groupDisplayName,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/templates/${Uri.encodeComponent(templateArn)}/accessControlEntries/${Uri.encodeComponent(groupSecurityIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// An access control entry allows or denies Active Directory groups based on
/// their security identifiers (SIDs) from enrolling and/or autoenrolling with
/// the template.
class AccessControlEntry {
  /// Permissions to allow or deny an Active Directory group to enroll or
  /// autoenroll certificates issued against a template.
  final AccessRights? accessRights;

  /// The date and time that the Access Control Entry was created.
  final DateTime? createdAt;

  /// Name of the Active Directory group. This name does not need to match the
  /// group name in Active Directory.
  final String? groupDisplayName;

  /// Security identifier (SID) of the group object from Active Directory. The SID
  /// starts with "S-".
  final String? groupSecurityIdentifier;

  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  final String? templateArn;

  /// The date and time that the Access Control Entry was updated.
  final DateTime? updatedAt;

  AccessControlEntry({
    this.accessRights,
    this.createdAt,
    this.groupDisplayName,
    this.groupSecurityIdentifier,
    this.templateArn,
    this.updatedAt,
  });

  factory AccessControlEntry.fromJson(Map<String, dynamic> json) {
    return AccessControlEntry(
      accessRights: json['AccessRights'] != null
          ? AccessRights.fromJson(json['AccessRights'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      groupDisplayName: json['GroupDisplayName'] as String?,
      groupSecurityIdentifier: json['GroupSecurityIdentifier'] as String?,
      templateArn: json['TemplateArn'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accessRights = this.accessRights;
    final createdAt = this.createdAt;
    final groupDisplayName = this.groupDisplayName;
    final groupSecurityIdentifier = this.groupSecurityIdentifier;
    final templateArn = this.templateArn;
    final updatedAt = this.updatedAt;
    return {
      if (accessRights != null) 'AccessRights': accessRights,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (groupDisplayName != null) 'GroupDisplayName': groupDisplayName,
      if (groupSecurityIdentifier != null)
        'GroupSecurityIdentifier': groupSecurityIdentifier,
      if (templateArn != null) 'TemplateArn': templateArn,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Summary of group access control entries that allow or deny Active Directory
/// groups based on their security identifiers (SIDs) from enrolling and/or
/// autofenrolling with the template.
class AccessControlEntrySummary {
  /// Allow or deny an Active Directory group from enrolling and autoenrolling
  /// certificates issued against a template.
  final AccessRights? accessRights;

  /// The date and time that the Access Control Entry was created.
  final DateTime? createdAt;

  /// Name of the Active Directory group. This name does not need to match the
  /// group name in Active Directory.
  final String? groupDisplayName;

  /// Security identifier (SID) of the group object from Active Directory. The SID
  /// starts with "S-".
  final String? groupSecurityIdentifier;

  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  final String? templateArn;

  /// The date and time that the Access Control Entry was updated.
  final DateTime? updatedAt;

  AccessControlEntrySummary({
    this.accessRights,
    this.createdAt,
    this.groupDisplayName,
    this.groupSecurityIdentifier,
    this.templateArn,
    this.updatedAt,
  });

  factory AccessControlEntrySummary.fromJson(Map<String, dynamic> json) {
    return AccessControlEntrySummary(
      accessRights: json['AccessRights'] != null
          ? AccessRights.fromJson(json['AccessRights'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      groupDisplayName: json['GroupDisplayName'] as String?,
      groupSecurityIdentifier: json['GroupSecurityIdentifier'] as String?,
      templateArn: json['TemplateArn'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accessRights = this.accessRights;
    final createdAt = this.createdAt;
    final groupDisplayName = this.groupDisplayName;
    final groupSecurityIdentifier = this.groupSecurityIdentifier;
    final templateArn = this.templateArn;
    final updatedAt = this.updatedAt;
    return {
      if (accessRights != null) 'AccessRights': accessRights,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (groupDisplayName != null) 'GroupDisplayName': groupDisplayName,
      if (groupSecurityIdentifier != null)
        'GroupSecurityIdentifier': groupSecurityIdentifier,
      if (templateArn != null) 'TemplateArn': templateArn,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum AccessRight {
  allow,
  deny,
}

extension AccessRightValueExtension on AccessRight {
  String toValue() {
    switch (this) {
      case AccessRight.allow:
        return 'ALLOW';
      case AccessRight.deny:
        return 'DENY';
    }
  }
}

extension AccessRightFromString on String {
  AccessRight toAccessRight() {
    switch (this) {
      case 'ALLOW':
        return AccessRight.allow;
      case 'DENY':
        return AccessRight.deny;
    }
    throw Exception('$this is not known in enum AccessRight');
  }
}

/// Allow or deny permissions for an Active Directory group to enroll or
/// autoenroll certificates for a template.
class AccessRights {
  /// Allow or deny an Active Directory group from autoenrolling certificates
  /// issued against a template. The Active Directory group must be allowed to
  /// enroll to allow autoenrollment
  final AccessRight? autoEnroll;

  /// Allow or deny an Active Directory group from enrolling certificates issued
  /// against a template.
  final AccessRight? enroll;

  AccessRights({
    this.autoEnroll,
    this.enroll,
  });

  factory AccessRights.fromJson(Map<String, dynamic> json) {
    return AccessRights(
      autoEnroll: (json['AutoEnroll'] as String?)?.toAccessRight(),
      enroll: (json['Enroll'] as String?)?.toAccessRight(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnroll = this.autoEnroll;
    final enroll = this.enroll;
    return {
      if (autoEnroll != null) 'AutoEnroll': autoEnroll.toValue(),
      if (enroll != null) 'Enroll': enroll.toValue(),
    };
  }
}

/// Application policies describe what the certificate can be used for.
class ApplicationPolicies {
  /// Application policies describe what the certificate can be used for.
  final List<ApplicationPolicy> policies;

  /// Marks the application policy extension as critical.
  final bool? critical;

  ApplicationPolicies({
    required this.policies,
    this.critical,
  });

  factory ApplicationPolicies.fromJson(Map<String, dynamic> json) {
    return ApplicationPolicies(
      policies: (json['Policies'] as List)
          .whereNotNull()
          .map((e) => ApplicationPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      critical: json['Critical'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final policies = this.policies;
    final critical = this.critical;
    return {
      'Policies': policies,
      if (critical != null) 'Critical': critical,
    };
  }
}

/// Application policies describe what the certificate can be used for.
class ApplicationPolicy {
  /// The object identifier (OID) of an application policy.
  final String? policyObjectIdentifier;

  /// The type of application policy
  final ApplicationPolicyType? policyType;

  ApplicationPolicy({
    this.policyObjectIdentifier,
    this.policyType,
  });

  factory ApplicationPolicy.fromJson(Map<String, dynamic> json) {
    return ApplicationPolicy(
      policyObjectIdentifier: json['PolicyObjectIdentifier'] as String?,
      policyType: (json['PolicyType'] as String?)?.toApplicationPolicyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final policyObjectIdentifier = this.policyObjectIdentifier;
    final policyType = this.policyType;
    return {
      if (policyObjectIdentifier != null)
        'PolicyObjectIdentifier': policyObjectIdentifier,
      if (policyType != null) 'PolicyType': policyType.toValue(),
    };
  }
}

enum ApplicationPolicyType {
  allApplicationPolicies,
  anyPurpose,
  attestationIdentityKeyCertificate,
  certificateRequestAgent,
  clientAuthentication,
  codeSigning,
  ctlUsage,
  digitalRights,
  directoryServiceEmailReplication,
  disallowedList,
  dnsServerTrust,
  documentEncryption,
  documentSigning,
  dynamicCodeGenerator,
  earlyLaunchAntimalwareDriver,
  embeddedWindowsSystemComponentVerification,
  enclave,
  encryptingFileSystem,
  endorsementKeyCertificate,
  fileRecovery,
  halExtension,
  ipSecurityEndSystem,
  ipSecurityIkeIntermediate,
  ipSecurityTunnelTermination,
  ipSecurityUser,
  isolatedUserMode,
  kdcAuthentication,
  kernelModeCodeSigning,
  keyPackLicenses,
  keyRecovery,
  keyRecoveryAgent,
  licenseServerVerification,
  lifetimeSigning,
  microsoftPublisher,
  microsoftTimeStamping,
  microsoftTrustListSigning,
  ocspSigning,
  oemWindowsSystemComponentVerification,
  platformCertificate,
  previewBuildSigning,
  privateKeyArchival,
  protectedProcessLightVerification,
  protectedProcessVerification,
  qualifiedSubordination,
  revokedListSigner,
  rootProgramAutoUpdateCaRevocation,
  rootProgramAutoUpdateEndRevocation,
  rootProgramNoOscpFailoverToCrl,
  rootListSigner,
  secureEmail,
  serverAuthentication,
  smartCardLogin,
  spcEncryptedDigestRetryCount,
  spcRelaxedPeMarkerCheck,
  timeStamping,
  windowsHardwareDriverAttestedVerification,
  windowsHardwareDriverExtendedVerification,
  windowsHardwareDriverVerification,
  windowsHelloRecoveryKeyEncryption,
  windowsKitsComponent,
  windowsRtVerification,
  windowsSoftwareExtensionVerification,
  windowsStore,
  windowsSystemComponentVerification,
  windowsTcbComponent,
  windowsThirdPartyApplicationComponent,
  windowsUpdate,
}

extension ApplicationPolicyTypeValueExtension on ApplicationPolicyType {
  String toValue() {
    switch (this) {
      case ApplicationPolicyType.allApplicationPolicies:
        return 'ALL_APPLICATION_POLICIES';
      case ApplicationPolicyType.anyPurpose:
        return 'ANY_PURPOSE';
      case ApplicationPolicyType.attestationIdentityKeyCertificate:
        return 'ATTESTATION_IDENTITY_KEY_CERTIFICATE';
      case ApplicationPolicyType.certificateRequestAgent:
        return 'CERTIFICATE_REQUEST_AGENT';
      case ApplicationPolicyType.clientAuthentication:
        return 'CLIENT_AUTHENTICATION';
      case ApplicationPolicyType.codeSigning:
        return 'CODE_SIGNING';
      case ApplicationPolicyType.ctlUsage:
        return 'CTL_USAGE';
      case ApplicationPolicyType.digitalRights:
        return 'DIGITAL_RIGHTS';
      case ApplicationPolicyType.directoryServiceEmailReplication:
        return 'DIRECTORY_SERVICE_EMAIL_REPLICATION';
      case ApplicationPolicyType.disallowedList:
        return 'DISALLOWED_LIST';
      case ApplicationPolicyType.dnsServerTrust:
        return 'DNS_SERVER_TRUST';
      case ApplicationPolicyType.documentEncryption:
        return 'DOCUMENT_ENCRYPTION';
      case ApplicationPolicyType.documentSigning:
        return 'DOCUMENT_SIGNING';
      case ApplicationPolicyType.dynamicCodeGenerator:
        return 'DYNAMIC_CODE_GENERATOR';
      case ApplicationPolicyType.earlyLaunchAntimalwareDriver:
        return 'EARLY_LAUNCH_ANTIMALWARE_DRIVER';
      case ApplicationPolicyType.embeddedWindowsSystemComponentVerification:
        return 'EMBEDDED_WINDOWS_SYSTEM_COMPONENT_VERIFICATION';
      case ApplicationPolicyType.enclave:
        return 'ENCLAVE';
      case ApplicationPolicyType.encryptingFileSystem:
        return 'ENCRYPTING_FILE_SYSTEM';
      case ApplicationPolicyType.endorsementKeyCertificate:
        return 'ENDORSEMENT_KEY_CERTIFICATE';
      case ApplicationPolicyType.fileRecovery:
        return 'FILE_RECOVERY';
      case ApplicationPolicyType.halExtension:
        return 'HAL_EXTENSION';
      case ApplicationPolicyType.ipSecurityEndSystem:
        return 'IP_SECURITY_END_SYSTEM';
      case ApplicationPolicyType.ipSecurityIkeIntermediate:
        return 'IP_SECURITY_IKE_INTERMEDIATE';
      case ApplicationPolicyType.ipSecurityTunnelTermination:
        return 'IP_SECURITY_TUNNEL_TERMINATION';
      case ApplicationPolicyType.ipSecurityUser:
        return 'IP_SECURITY_USER';
      case ApplicationPolicyType.isolatedUserMode:
        return 'ISOLATED_USER_MODE';
      case ApplicationPolicyType.kdcAuthentication:
        return 'KDC_AUTHENTICATION';
      case ApplicationPolicyType.kernelModeCodeSigning:
        return 'KERNEL_MODE_CODE_SIGNING';
      case ApplicationPolicyType.keyPackLicenses:
        return 'KEY_PACK_LICENSES';
      case ApplicationPolicyType.keyRecovery:
        return 'KEY_RECOVERY';
      case ApplicationPolicyType.keyRecoveryAgent:
        return 'KEY_RECOVERY_AGENT';
      case ApplicationPolicyType.licenseServerVerification:
        return 'LICENSE_SERVER_VERIFICATION';
      case ApplicationPolicyType.lifetimeSigning:
        return 'LIFETIME_SIGNING';
      case ApplicationPolicyType.microsoftPublisher:
        return 'MICROSOFT_PUBLISHER';
      case ApplicationPolicyType.microsoftTimeStamping:
        return 'MICROSOFT_TIME_STAMPING';
      case ApplicationPolicyType.microsoftTrustListSigning:
        return 'MICROSOFT_TRUST_LIST_SIGNING';
      case ApplicationPolicyType.ocspSigning:
        return 'OCSP_SIGNING';
      case ApplicationPolicyType.oemWindowsSystemComponentVerification:
        return 'OEM_WINDOWS_SYSTEM_COMPONENT_VERIFICATION';
      case ApplicationPolicyType.platformCertificate:
        return 'PLATFORM_CERTIFICATE';
      case ApplicationPolicyType.previewBuildSigning:
        return 'PREVIEW_BUILD_SIGNING';
      case ApplicationPolicyType.privateKeyArchival:
        return 'PRIVATE_KEY_ARCHIVAL';
      case ApplicationPolicyType.protectedProcessLightVerification:
        return 'PROTECTED_PROCESS_LIGHT_VERIFICATION';
      case ApplicationPolicyType.protectedProcessVerification:
        return 'PROTECTED_PROCESS_VERIFICATION';
      case ApplicationPolicyType.qualifiedSubordination:
        return 'QUALIFIED_SUBORDINATION';
      case ApplicationPolicyType.revokedListSigner:
        return 'REVOKED_LIST_SIGNER';
      case ApplicationPolicyType.rootProgramAutoUpdateCaRevocation:
        return 'ROOT_PROGRAM_AUTO_UPDATE_CA_REVOCATION';
      case ApplicationPolicyType.rootProgramAutoUpdateEndRevocation:
        return 'ROOT_PROGRAM_AUTO_UPDATE_END_REVOCATION';
      case ApplicationPolicyType.rootProgramNoOscpFailoverToCrl:
        return 'ROOT_PROGRAM_NO_OSCP_FAILOVER_TO_CRL';
      case ApplicationPolicyType.rootListSigner:
        return 'ROOT_LIST_SIGNER';
      case ApplicationPolicyType.secureEmail:
        return 'SECURE_EMAIL';
      case ApplicationPolicyType.serverAuthentication:
        return 'SERVER_AUTHENTICATION';
      case ApplicationPolicyType.smartCardLogin:
        return 'SMART_CARD_LOGIN';
      case ApplicationPolicyType.spcEncryptedDigestRetryCount:
        return 'SPC_ENCRYPTED_DIGEST_RETRY_COUNT';
      case ApplicationPolicyType.spcRelaxedPeMarkerCheck:
        return 'SPC_RELAXED_PE_MARKER_CHECK';
      case ApplicationPolicyType.timeStamping:
        return 'TIME_STAMPING';
      case ApplicationPolicyType.windowsHardwareDriverAttestedVerification:
        return 'WINDOWS_HARDWARE_DRIVER_ATTESTED_VERIFICATION';
      case ApplicationPolicyType.windowsHardwareDriverExtendedVerification:
        return 'WINDOWS_HARDWARE_DRIVER_EXTENDED_VERIFICATION';
      case ApplicationPolicyType.windowsHardwareDriverVerification:
        return 'WINDOWS_HARDWARE_DRIVER_VERIFICATION';
      case ApplicationPolicyType.windowsHelloRecoveryKeyEncryption:
        return 'WINDOWS_HELLO_RECOVERY_KEY_ENCRYPTION';
      case ApplicationPolicyType.windowsKitsComponent:
        return 'WINDOWS_KITS_COMPONENT';
      case ApplicationPolicyType.windowsRtVerification:
        return 'WINDOWS_RT_VERIFICATION';
      case ApplicationPolicyType.windowsSoftwareExtensionVerification:
        return 'WINDOWS_SOFTWARE_EXTENSION_VERIFICATION';
      case ApplicationPolicyType.windowsStore:
        return 'WINDOWS_STORE';
      case ApplicationPolicyType.windowsSystemComponentVerification:
        return 'WINDOWS_SYSTEM_COMPONENT_VERIFICATION';
      case ApplicationPolicyType.windowsTcbComponent:
        return 'WINDOWS_TCB_COMPONENT';
      case ApplicationPolicyType.windowsThirdPartyApplicationComponent:
        return 'WINDOWS_THIRD_PARTY_APPLICATION_COMPONENT';
      case ApplicationPolicyType.windowsUpdate:
        return 'WINDOWS_UPDATE';
    }
  }
}

extension ApplicationPolicyTypeFromString on String {
  ApplicationPolicyType toApplicationPolicyType() {
    switch (this) {
      case 'ALL_APPLICATION_POLICIES':
        return ApplicationPolicyType.allApplicationPolicies;
      case 'ANY_PURPOSE':
        return ApplicationPolicyType.anyPurpose;
      case 'ATTESTATION_IDENTITY_KEY_CERTIFICATE':
        return ApplicationPolicyType.attestationIdentityKeyCertificate;
      case 'CERTIFICATE_REQUEST_AGENT':
        return ApplicationPolicyType.certificateRequestAgent;
      case 'CLIENT_AUTHENTICATION':
        return ApplicationPolicyType.clientAuthentication;
      case 'CODE_SIGNING':
        return ApplicationPolicyType.codeSigning;
      case 'CTL_USAGE':
        return ApplicationPolicyType.ctlUsage;
      case 'DIGITAL_RIGHTS':
        return ApplicationPolicyType.digitalRights;
      case 'DIRECTORY_SERVICE_EMAIL_REPLICATION':
        return ApplicationPolicyType.directoryServiceEmailReplication;
      case 'DISALLOWED_LIST':
        return ApplicationPolicyType.disallowedList;
      case 'DNS_SERVER_TRUST':
        return ApplicationPolicyType.dnsServerTrust;
      case 'DOCUMENT_ENCRYPTION':
        return ApplicationPolicyType.documentEncryption;
      case 'DOCUMENT_SIGNING':
        return ApplicationPolicyType.documentSigning;
      case 'DYNAMIC_CODE_GENERATOR':
        return ApplicationPolicyType.dynamicCodeGenerator;
      case 'EARLY_LAUNCH_ANTIMALWARE_DRIVER':
        return ApplicationPolicyType.earlyLaunchAntimalwareDriver;
      case 'EMBEDDED_WINDOWS_SYSTEM_COMPONENT_VERIFICATION':
        return ApplicationPolicyType.embeddedWindowsSystemComponentVerification;
      case 'ENCLAVE':
        return ApplicationPolicyType.enclave;
      case 'ENCRYPTING_FILE_SYSTEM':
        return ApplicationPolicyType.encryptingFileSystem;
      case 'ENDORSEMENT_KEY_CERTIFICATE':
        return ApplicationPolicyType.endorsementKeyCertificate;
      case 'FILE_RECOVERY':
        return ApplicationPolicyType.fileRecovery;
      case 'HAL_EXTENSION':
        return ApplicationPolicyType.halExtension;
      case 'IP_SECURITY_END_SYSTEM':
        return ApplicationPolicyType.ipSecurityEndSystem;
      case 'IP_SECURITY_IKE_INTERMEDIATE':
        return ApplicationPolicyType.ipSecurityIkeIntermediate;
      case 'IP_SECURITY_TUNNEL_TERMINATION':
        return ApplicationPolicyType.ipSecurityTunnelTermination;
      case 'IP_SECURITY_USER':
        return ApplicationPolicyType.ipSecurityUser;
      case 'ISOLATED_USER_MODE':
        return ApplicationPolicyType.isolatedUserMode;
      case 'KDC_AUTHENTICATION':
        return ApplicationPolicyType.kdcAuthentication;
      case 'KERNEL_MODE_CODE_SIGNING':
        return ApplicationPolicyType.kernelModeCodeSigning;
      case 'KEY_PACK_LICENSES':
        return ApplicationPolicyType.keyPackLicenses;
      case 'KEY_RECOVERY':
        return ApplicationPolicyType.keyRecovery;
      case 'KEY_RECOVERY_AGENT':
        return ApplicationPolicyType.keyRecoveryAgent;
      case 'LICENSE_SERVER_VERIFICATION':
        return ApplicationPolicyType.licenseServerVerification;
      case 'LIFETIME_SIGNING':
        return ApplicationPolicyType.lifetimeSigning;
      case 'MICROSOFT_PUBLISHER':
        return ApplicationPolicyType.microsoftPublisher;
      case 'MICROSOFT_TIME_STAMPING':
        return ApplicationPolicyType.microsoftTimeStamping;
      case 'MICROSOFT_TRUST_LIST_SIGNING':
        return ApplicationPolicyType.microsoftTrustListSigning;
      case 'OCSP_SIGNING':
        return ApplicationPolicyType.ocspSigning;
      case 'OEM_WINDOWS_SYSTEM_COMPONENT_VERIFICATION':
        return ApplicationPolicyType.oemWindowsSystemComponentVerification;
      case 'PLATFORM_CERTIFICATE':
        return ApplicationPolicyType.platformCertificate;
      case 'PREVIEW_BUILD_SIGNING':
        return ApplicationPolicyType.previewBuildSigning;
      case 'PRIVATE_KEY_ARCHIVAL':
        return ApplicationPolicyType.privateKeyArchival;
      case 'PROTECTED_PROCESS_LIGHT_VERIFICATION':
        return ApplicationPolicyType.protectedProcessLightVerification;
      case 'PROTECTED_PROCESS_VERIFICATION':
        return ApplicationPolicyType.protectedProcessVerification;
      case 'QUALIFIED_SUBORDINATION':
        return ApplicationPolicyType.qualifiedSubordination;
      case 'REVOKED_LIST_SIGNER':
        return ApplicationPolicyType.revokedListSigner;
      case 'ROOT_PROGRAM_AUTO_UPDATE_CA_REVOCATION':
        return ApplicationPolicyType.rootProgramAutoUpdateCaRevocation;
      case 'ROOT_PROGRAM_AUTO_UPDATE_END_REVOCATION':
        return ApplicationPolicyType.rootProgramAutoUpdateEndRevocation;
      case 'ROOT_PROGRAM_NO_OSCP_FAILOVER_TO_CRL':
        return ApplicationPolicyType.rootProgramNoOscpFailoverToCrl;
      case 'ROOT_LIST_SIGNER':
        return ApplicationPolicyType.rootListSigner;
      case 'SECURE_EMAIL':
        return ApplicationPolicyType.secureEmail;
      case 'SERVER_AUTHENTICATION':
        return ApplicationPolicyType.serverAuthentication;
      case 'SMART_CARD_LOGIN':
        return ApplicationPolicyType.smartCardLogin;
      case 'SPC_ENCRYPTED_DIGEST_RETRY_COUNT':
        return ApplicationPolicyType.spcEncryptedDigestRetryCount;
      case 'SPC_RELAXED_PE_MARKER_CHECK':
        return ApplicationPolicyType.spcRelaxedPeMarkerCheck;
      case 'TIME_STAMPING':
        return ApplicationPolicyType.timeStamping;
      case 'WINDOWS_HARDWARE_DRIVER_ATTESTED_VERIFICATION':
        return ApplicationPolicyType.windowsHardwareDriverAttestedVerification;
      case 'WINDOWS_HARDWARE_DRIVER_EXTENDED_VERIFICATION':
        return ApplicationPolicyType.windowsHardwareDriverExtendedVerification;
      case 'WINDOWS_HARDWARE_DRIVER_VERIFICATION':
        return ApplicationPolicyType.windowsHardwareDriverVerification;
      case 'WINDOWS_HELLO_RECOVERY_KEY_ENCRYPTION':
        return ApplicationPolicyType.windowsHelloRecoveryKeyEncryption;
      case 'WINDOWS_KITS_COMPONENT':
        return ApplicationPolicyType.windowsKitsComponent;
      case 'WINDOWS_RT_VERIFICATION':
        return ApplicationPolicyType.windowsRtVerification;
      case 'WINDOWS_SOFTWARE_EXTENSION_VERIFICATION':
        return ApplicationPolicyType.windowsSoftwareExtensionVerification;
      case 'WINDOWS_STORE':
        return ApplicationPolicyType.windowsStore;
      case 'WINDOWS_SYSTEM_COMPONENT_VERIFICATION':
        return ApplicationPolicyType.windowsSystemComponentVerification;
      case 'WINDOWS_TCB_COMPONENT':
        return ApplicationPolicyType.windowsTcbComponent;
      case 'WINDOWS_THIRD_PARTY_APPLICATION_COMPONENT':
        return ApplicationPolicyType.windowsThirdPartyApplicationComponent;
      case 'WINDOWS_UPDATE':
        return ApplicationPolicyType.windowsUpdate;
    }
    throw Exception('$this is not known in enum ApplicationPolicyType');
  }
}

/// Information describing the end of the validity period of the certificate.
/// This parameter sets the “Not After” date for the certificate. Certificate
/// validity is the period of time during which a certificate is valid. Validity
/// can be expressed as an explicit date and time when the certificate expires,
/// or as a span of time after issuance, stated in days, months, or years. For
/// more information, see Validity in RFC 5280. This value is unaffected when
/// ValidityNotBefore is also specified. For example, if Validity is set to 20
/// days in the future, the certificate will expire 20 days from issuance time
/// regardless of the ValidityNotBefore value.
class CertificateValidity {
  /// Renewal period is the period of time before certificate expiration when a
  /// new certificate will be requested.
  final ValidityPeriod renewalPeriod;

  /// Information describing the end of the validity period of the certificate.
  /// This parameter sets the “Not After” date for the certificate. Certificate
  /// validity is the period of time during which a certificate is valid. Validity
  /// can be expressed as an explicit date and time when the certificate expires,
  /// or as a span of time after issuance, stated in days, months, or years. For
  /// more information, see Validity in RFC 5280. This value is unaffected when
  /// ValidityNotBefore is also specified. For example, if Validity is set to 20
  /// days in the future, the certificate will expire 20 days from issuance time
  /// regardless of the ValidityNotBefore value.
  final ValidityPeriod validityPeriod;

  CertificateValidity({
    required this.renewalPeriod,
    required this.validityPeriod,
  });

  factory CertificateValidity.fromJson(Map<String, dynamic> json) {
    return CertificateValidity(
      renewalPeriod: ValidityPeriod.fromJson(
          json['RenewalPeriod'] as Map<String, dynamic>),
      validityPeriod: ValidityPeriod.fromJson(
          json['ValidityPeriod'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final renewalPeriod = this.renewalPeriod;
    final validityPeriod = this.validityPeriod;
    return {
      'RenewalPeriod': renewalPeriod,
      'ValidityPeriod': validityPeriod,
    };
  }
}

enum ClientCompatibilityV2 {
  windowsServer_2003,
  windowsServer_2008,
  windowsServer_2008R2,
  windowsServer_2012,
  windowsServer_2012R2,
  windowsServer_2016,
}

extension ClientCompatibilityV2ValueExtension on ClientCompatibilityV2 {
  String toValue() {
    switch (this) {
      case ClientCompatibilityV2.windowsServer_2003:
        return 'WINDOWS_SERVER_2003';
      case ClientCompatibilityV2.windowsServer_2008:
        return 'WINDOWS_SERVER_2008';
      case ClientCompatibilityV2.windowsServer_2008R2:
        return 'WINDOWS_SERVER_2008_R2';
      case ClientCompatibilityV2.windowsServer_2012:
        return 'WINDOWS_SERVER_2012';
      case ClientCompatibilityV2.windowsServer_2012R2:
        return 'WINDOWS_SERVER_2012_R2';
      case ClientCompatibilityV2.windowsServer_2016:
        return 'WINDOWS_SERVER_2016';
    }
  }
}

extension ClientCompatibilityV2FromString on String {
  ClientCompatibilityV2 toClientCompatibilityV2() {
    switch (this) {
      case 'WINDOWS_SERVER_2003':
        return ClientCompatibilityV2.windowsServer_2003;
      case 'WINDOWS_SERVER_2008':
        return ClientCompatibilityV2.windowsServer_2008;
      case 'WINDOWS_SERVER_2008_R2':
        return ClientCompatibilityV2.windowsServer_2008R2;
      case 'WINDOWS_SERVER_2012':
        return ClientCompatibilityV2.windowsServer_2012;
      case 'WINDOWS_SERVER_2012_R2':
        return ClientCompatibilityV2.windowsServer_2012R2;
      case 'WINDOWS_SERVER_2016':
        return ClientCompatibilityV2.windowsServer_2016;
    }
    throw Exception('$this is not known in enum ClientCompatibilityV2');
  }
}

enum ClientCompatibilityV3 {
  windowsServer_2008,
  windowsServer_2008R2,
  windowsServer_2012,
  windowsServer_2012R2,
  windowsServer_2016,
}

extension ClientCompatibilityV3ValueExtension on ClientCompatibilityV3 {
  String toValue() {
    switch (this) {
      case ClientCompatibilityV3.windowsServer_2008:
        return 'WINDOWS_SERVER_2008';
      case ClientCompatibilityV3.windowsServer_2008R2:
        return 'WINDOWS_SERVER_2008_R2';
      case ClientCompatibilityV3.windowsServer_2012:
        return 'WINDOWS_SERVER_2012';
      case ClientCompatibilityV3.windowsServer_2012R2:
        return 'WINDOWS_SERVER_2012_R2';
      case ClientCompatibilityV3.windowsServer_2016:
        return 'WINDOWS_SERVER_2016';
    }
  }
}

extension ClientCompatibilityV3FromString on String {
  ClientCompatibilityV3 toClientCompatibilityV3() {
    switch (this) {
      case 'WINDOWS_SERVER_2008':
        return ClientCompatibilityV3.windowsServer_2008;
      case 'WINDOWS_SERVER_2008_R2':
        return ClientCompatibilityV3.windowsServer_2008R2;
      case 'WINDOWS_SERVER_2012':
        return ClientCompatibilityV3.windowsServer_2012;
      case 'WINDOWS_SERVER_2012_R2':
        return ClientCompatibilityV3.windowsServer_2012R2;
      case 'WINDOWS_SERVER_2016':
        return ClientCompatibilityV3.windowsServer_2016;
    }
    throw Exception('$this is not known in enum ClientCompatibilityV3');
  }
}

enum ClientCompatibilityV4 {
  windowsServer_2012,
  windowsServer_2012R2,
  windowsServer_2016,
}

extension ClientCompatibilityV4ValueExtension on ClientCompatibilityV4 {
  String toValue() {
    switch (this) {
      case ClientCompatibilityV4.windowsServer_2012:
        return 'WINDOWS_SERVER_2012';
      case ClientCompatibilityV4.windowsServer_2012R2:
        return 'WINDOWS_SERVER_2012_R2';
      case ClientCompatibilityV4.windowsServer_2016:
        return 'WINDOWS_SERVER_2016';
    }
  }
}

extension ClientCompatibilityV4FromString on String {
  ClientCompatibilityV4 toClientCompatibilityV4() {
    switch (this) {
      case 'WINDOWS_SERVER_2012':
        return ClientCompatibilityV4.windowsServer_2012;
      case 'WINDOWS_SERVER_2012_R2':
        return ClientCompatibilityV4.windowsServer_2012R2;
      case 'WINDOWS_SERVER_2016':
        return ClientCompatibilityV4.windowsServer_2016;
    }
    throw Exception('$this is not known in enum ClientCompatibilityV4');
  }
}

/// Amazon Web Services Private CA Connector for Active Directory is a service
/// that links your Active Directory with Amazon Web Services Private CA. The
/// connector brokers the exchange of certificates from Amazon Web Services
/// Private CA to domain-joined users and machines managed with Active
/// Directory.
class Connector {
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
  final String? arn;

  /// The Amazon Resource Name (ARN) of the certificate authority being used.
  final String? certificateAuthorityArn;

  /// Certificate enrollment endpoint for Active Directory domain-joined objects
  /// reach out to when requesting certificates.
  final String? certificateEnrollmentPolicyServerEndpoint;

  /// The date and time that the connector was created.
  final DateTime? createdAt;

  /// The identifier of the Active Directory.
  final String? directoryId;

  /// Status of the connector. Status can be creating, active, deleting, or
  /// failed.
  final ConnectorStatus? status;

  /// Additional information about the connector status if the status is failed.
  final ConnectorStatusReason? statusReason;

  /// The date and time that the connector was updated.
  final DateTime? updatedAt;

  /// Information of the VPC and security group(s) used with the connector.
  final VpcInformation? vpcInformation;

  Connector({
    this.arn,
    this.certificateAuthorityArn,
    this.certificateEnrollmentPolicyServerEndpoint,
    this.createdAt,
    this.directoryId,
    this.status,
    this.statusReason,
    this.updatedAt,
    this.vpcInformation,
  });

  factory Connector.fromJson(Map<String, dynamic> json) {
    return Connector(
      arn: json['Arn'] as String?,
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      certificateEnrollmentPolicyServerEndpoint:
          json['CertificateEnrollmentPolicyServerEndpoint'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      directoryId: json['DirectoryId'] as String?,
      status: (json['Status'] as String?)?.toConnectorStatus(),
      statusReason:
          (json['StatusReason'] as String?)?.toConnectorStatusReason(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      vpcInformation: json['VpcInformation'] != null
          ? VpcInformation.fromJson(
              json['VpcInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final certificateEnrollmentPolicyServerEndpoint =
        this.certificateEnrollmentPolicyServerEndpoint;
    final createdAt = this.createdAt;
    final directoryId = this.directoryId;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    final vpcInformation = this.vpcInformation;
    return {
      if (arn != null) 'Arn': arn,
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (certificateEnrollmentPolicyServerEndpoint != null)
        'CertificateEnrollmentPolicyServerEndpoint':
            certificateEnrollmentPolicyServerEndpoint,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (directoryId != null) 'DirectoryId': directoryId,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (vpcInformation != null) 'VpcInformation': vpcInformation,
    };
  }
}

enum ConnectorStatus {
  creating,
  active,
  deleting,
  failed,
}

extension ConnectorStatusValueExtension on ConnectorStatus {
  String toValue() {
    switch (this) {
      case ConnectorStatus.creating:
        return 'CREATING';
      case ConnectorStatus.active:
        return 'ACTIVE';
      case ConnectorStatus.deleting:
        return 'DELETING';
      case ConnectorStatus.failed:
        return 'FAILED';
    }
  }
}

extension ConnectorStatusFromString on String {
  ConnectorStatus toConnectorStatus() {
    switch (this) {
      case 'CREATING':
        return ConnectorStatus.creating;
      case 'ACTIVE':
        return ConnectorStatus.active;
      case 'DELETING':
        return ConnectorStatus.deleting;
      case 'FAILED':
        return ConnectorStatus.failed;
    }
    throw Exception('$this is not known in enum ConnectorStatus');
  }
}

enum ConnectorStatusReason {
  directoryAccessDenied,
  internalFailure,
  privatecaAccessDenied,
  privatecaResourceNotFound,
  securityGroupNotInVpc,
  vpcAccessDenied,
  vpcEndpointLimitExceeded,
  vpcResourceNotFound,
}

extension ConnectorStatusReasonValueExtension on ConnectorStatusReason {
  String toValue() {
    switch (this) {
      case ConnectorStatusReason.directoryAccessDenied:
        return 'DIRECTORY_ACCESS_DENIED';
      case ConnectorStatusReason.internalFailure:
        return 'INTERNAL_FAILURE';
      case ConnectorStatusReason.privatecaAccessDenied:
        return 'PRIVATECA_ACCESS_DENIED';
      case ConnectorStatusReason.privatecaResourceNotFound:
        return 'PRIVATECA_RESOURCE_NOT_FOUND';
      case ConnectorStatusReason.securityGroupNotInVpc:
        return 'SECURITY_GROUP_NOT_IN_VPC';
      case ConnectorStatusReason.vpcAccessDenied:
        return 'VPC_ACCESS_DENIED';
      case ConnectorStatusReason.vpcEndpointLimitExceeded:
        return 'VPC_ENDPOINT_LIMIT_EXCEEDED';
      case ConnectorStatusReason.vpcResourceNotFound:
        return 'VPC_RESOURCE_NOT_FOUND';
    }
  }
}

extension ConnectorStatusReasonFromString on String {
  ConnectorStatusReason toConnectorStatusReason() {
    switch (this) {
      case 'DIRECTORY_ACCESS_DENIED':
        return ConnectorStatusReason.directoryAccessDenied;
      case 'INTERNAL_FAILURE':
        return ConnectorStatusReason.internalFailure;
      case 'PRIVATECA_ACCESS_DENIED':
        return ConnectorStatusReason.privatecaAccessDenied;
      case 'PRIVATECA_RESOURCE_NOT_FOUND':
        return ConnectorStatusReason.privatecaResourceNotFound;
      case 'SECURITY_GROUP_NOT_IN_VPC':
        return ConnectorStatusReason.securityGroupNotInVpc;
      case 'VPC_ACCESS_DENIED':
        return ConnectorStatusReason.vpcAccessDenied;
      case 'VPC_ENDPOINT_LIMIT_EXCEEDED':
        return ConnectorStatusReason.vpcEndpointLimitExceeded;
      case 'VPC_RESOURCE_NOT_FOUND':
        return ConnectorStatusReason.vpcResourceNotFound;
    }
    throw Exception('$this is not known in enum ConnectorStatusReason');
  }
}

/// Summary description of the Amazon Web Services Private CA AD connectors
/// belonging to an Amazon Web Services account.
class ConnectorSummary {
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
  final String? arn;

  /// The Amazon Resource Name (ARN) of the certificate authority being used.
  final String? certificateAuthorityArn;

  /// Certificate enrollment endpoint for Active Directory domain-joined objects
  /// to request certificates.
  final String? certificateEnrollmentPolicyServerEndpoint;

  /// The date and time that the connector was created.
  final DateTime? createdAt;

  /// The identifier of the Active Directory.
  final String? directoryId;

  /// Status of the connector. Status can be creating, active, deleting, or
  /// failed.
  final ConnectorStatus? status;

  /// Additional information about the connector status if the status is failed.
  final ConnectorStatusReason? statusReason;

  /// The date and time that the connector was updated.
  final DateTime? updatedAt;

  /// Information of the VPC and security group(s) used with the connector.
  final VpcInformation? vpcInformation;

  ConnectorSummary({
    this.arn,
    this.certificateAuthorityArn,
    this.certificateEnrollmentPolicyServerEndpoint,
    this.createdAt,
    this.directoryId,
    this.status,
    this.statusReason,
    this.updatedAt,
    this.vpcInformation,
  });

  factory ConnectorSummary.fromJson(Map<String, dynamic> json) {
    return ConnectorSummary(
      arn: json['Arn'] as String?,
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      certificateEnrollmentPolicyServerEndpoint:
          json['CertificateEnrollmentPolicyServerEndpoint'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      directoryId: json['DirectoryId'] as String?,
      status: (json['Status'] as String?)?.toConnectorStatus(),
      statusReason:
          (json['StatusReason'] as String?)?.toConnectorStatusReason(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      vpcInformation: json['VpcInformation'] != null
          ? VpcInformation.fromJson(
              json['VpcInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final certificateEnrollmentPolicyServerEndpoint =
        this.certificateEnrollmentPolicyServerEndpoint;
    final createdAt = this.createdAt;
    final directoryId = this.directoryId;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    final vpcInformation = this.vpcInformation;
    return {
      if (arn != null) 'Arn': arn,
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (certificateEnrollmentPolicyServerEndpoint != null)
        'CertificateEnrollmentPolicyServerEndpoint':
            certificateEnrollmentPolicyServerEndpoint,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (directoryId != null) 'DirectoryId': directoryId,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (vpcInformation != null) 'VpcInformation': vpcInformation,
    };
  }
}

class CreateConnectorResponse {
  /// If successful, the Amazon Resource Name (ARN) of the connector for Active
  /// Directory.
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

class CreateDirectoryRegistrationResponse {
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration.html">CreateDirectoryRegistration</a>.
  final String? directoryRegistrationArn;

  CreateDirectoryRegistrationResponse({
    this.directoryRegistrationArn,
  });

  factory CreateDirectoryRegistrationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDirectoryRegistrationResponse(
      directoryRegistrationArn: json['DirectoryRegistrationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryRegistrationArn = this.directoryRegistrationArn;
    return {
      if (directoryRegistrationArn != null)
        'DirectoryRegistrationArn': directoryRegistrationArn,
    };
  }
}

class CreateTemplateResponse {
  /// If successful, the Amazon Resource Name (ARN) of the template.
  final String? templateArn;

  CreateTemplateResponse({
    this.templateArn,
  });

  factory CreateTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateTemplateResponse(
      templateArn: json['TemplateArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateArn = this.templateArn;
    return {
      if (templateArn != null) 'TemplateArn': templateArn,
    };
  }
}

/// The directory registration represents the authorization of the connector
/// service with a directory.
class DirectoryRegistration {
  /// The Amazon Resource Name (ARN) that was returned when you called
  /// CreateDirectoryRegistration.
  final String? arn;

  /// The date and time that the directory registration was created.
  final DateTime? createdAt;

  /// The identifier of the Active Directory.
  final String? directoryId;

  /// Status of the directory registration.
  final DirectoryRegistrationStatus? status;

  /// Additional information about the directory registration status if the status
  /// is failed.
  final DirectoryRegistrationStatusReason? statusReason;

  /// The date and time that the directory registration was updated.
  final DateTime? updatedAt;

  DirectoryRegistration({
    this.arn,
    this.createdAt,
    this.directoryId,
    this.status,
    this.statusReason,
    this.updatedAt,
  });

  factory DirectoryRegistration.fromJson(Map<String, dynamic> json) {
    return DirectoryRegistration(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      directoryId: json['DirectoryId'] as String?,
      status: (json['Status'] as String?)?.toDirectoryRegistrationStatus(),
      statusReason: (json['StatusReason'] as String?)
          ?.toDirectoryRegistrationStatusReason(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final directoryId = this.directoryId;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (directoryId != null) 'DirectoryId': directoryId,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum DirectoryRegistrationStatus {
  creating,
  active,
  deleting,
  failed,
}

extension DirectoryRegistrationStatusValueExtension
    on DirectoryRegistrationStatus {
  String toValue() {
    switch (this) {
      case DirectoryRegistrationStatus.creating:
        return 'CREATING';
      case DirectoryRegistrationStatus.active:
        return 'ACTIVE';
      case DirectoryRegistrationStatus.deleting:
        return 'DELETING';
      case DirectoryRegistrationStatus.failed:
        return 'FAILED';
    }
  }
}

extension DirectoryRegistrationStatusFromString on String {
  DirectoryRegistrationStatus toDirectoryRegistrationStatus() {
    switch (this) {
      case 'CREATING':
        return DirectoryRegistrationStatus.creating;
      case 'ACTIVE':
        return DirectoryRegistrationStatus.active;
      case 'DELETING':
        return DirectoryRegistrationStatus.deleting;
      case 'FAILED':
        return DirectoryRegistrationStatus.failed;
    }
    throw Exception('$this is not known in enum DirectoryRegistrationStatus');
  }
}

enum DirectoryRegistrationStatusReason {
  directoryAccessDenied,
  directoryResourceNotFound,
  directoryNotActive,
  directoryNotReachable,
  directoryTypeNotSupported,
  internalFailure,
}

extension DirectoryRegistrationStatusReasonValueExtension
    on DirectoryRegistrationStatusReason {
  String toValue() {
    switch (this) {
      case DirectoryRegistrationStatusReason.directoryAccessDenied:
        return 'DIRECTORY_ACCESS_DENIED';
      case DirectoryRegistrationStatusReason.directoryResourceNotFound:
        return 'DIRECTORY_RESOURCE_NOT_FOUND';
      case DirectoryRegistrationStatusReason.directoryNotActive:
        return 'DIRECTORY_NOT_ACTIVE';
      case DirectoryRegistrationStatusReason.directoryNotReachable:
        return 'DIRECTORY_NOT_REACHABLE';
      case DirectoryRegistrationStatusReason.directoryTypeNotSupported:
        return 'DIRECTORY_TYPE_NOT_SUPPORTED';
      case DirectoryRegistrationStatusReason.internalFailure:
        return 'INTERNAL_FAILURE';
    }
  }
}

extension DirectoryRegistrationStatusReasonFromString on String {
  DirectoryRegistrationStatusReason toDirectoryRegistrationStatusReason() {
    switch (this) {
      case 'DIRECTORY_ACCESS_DENIED':
        return DirectoryRegistrationStatusReason.directoryAccessDenied;
      case 'DIRECTORY_RESOURCE_NOT_FOUND':
        return DirectoryRegistrationStatusReason.directoryResourceNotFound;
      case 'DIRECTORY_NOT_ACTIVE':
        return DirectoryRegistrationStatusReason.directoryNotActive;
      case 'DIRECTORY_NOT_REACHABLE':
        return DirectoryRegistrationStatusReason.directoryNotReachable;
      case 'DIRECTORY_TYPE_NOT_SUPPORTED':
        return DirectoryRegistrationStatusReason.directoryTypeNotSupported;
      case 'INTERNAL_FAILURE':
        return DirectoryRegistrationStatusReason.internalFailure;
    }
    throw Exception(
        '$this is not known in enum DirectoryRegistrationStatusReason');
  }
}

/// The directory registration represents the authorization of the connector
/// service with the Active Directory.
class DirectoryRegistrationSummary {
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration.html">CreateDirectoryRegistration</a>.
  final String? arn;

  /// The date and time that the directory registration was created.
  final DateTime? createdAt;

  /// The identifier of the Active Directory.
  final String? directoryId;

  /// Status of the directory registration.
  final DirectoryRegistrationStatus? status;

  /// Additional information about the directory registration status if the status
  /// is failed.
  final DirectoryRegistrationStatusReason? statusReason;

  /// The date and time that the directory registration was updated.
  final DateTime? updatedAt;

  DirectoryRegistrationSummary({
    this.arn,
    this.createdAt,
    this.directoryId,
    this.status,
    this.statusReason,
    this.updatedAt,
  });

  factory DirectoryRegistrationSummary.fromJson(Map<String, dynamic> json) {
    return DirectoryRegistrationSummary(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      directoryId: json['DirectoryId'] as String?,
      status: (json['Status'] as String?)?.toDirectoryRegistrationStatus(),
      statusReason: (json['StatusReason'] as String?)
          ?.toDirectoryRegistrationStatusReason(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final directoryId = this.directoryId;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (directoryId != null) 'DirectoryId': directoryId,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Template configurations for v2 template schema.
class EnrollmentFlagsV2 {
  /// Allow renewal using the same key.
  final bool? enableKeyReuseOnNtTokenKeysetStorageFull;

  /// Include symmetric algorithms allowed by the subject.
  final bool? includeSymmetricAlgorithms;

  /// This flag instructs the CA to not include the security extension
  /// szOID_NTDS_CA_SECURITY_EXT (OID:1.3.6.1.4.1.311.25.2), as specified in
  /// [MS-WCCE] sections 2.2.2.7.7.4 and 3.2.2.6.2.1.4.5.9, in the issued
  /// certificate. This addresses a Windows Kerberos elevation-of-privilege
  /// vulnerability.
  final bool? noSecurityExtension;

  /// Delete expired or revoked certificates instead of archiving them.
  final bool? removeInvalidCertificateFromPersonalStore;

  /// Require user interaction when the subject is enrolled and the private key
  /// associated with the certificate is used.
  final bool? userInteractionRequired;

  EnrollmentFlagsV2({
    this.enableKeyReuseOnNtTokenKeysetStorageFull,
    this.includeSymmetricAlgorithms,
    this.noSecurityExtension,
    this.removeInvalidCertificateFromPersonalStore,
    this.userInteractionRequired,
  });

  factory EnrollmentFlagsV2.fromJson(Map<String, dynamic> json) {
    return EnrollmentFlagsV2(
      enableKeyReuseOnNtTokenKeysetStorageFull:
          json['EnableKeyReuseOnNtTokenKeysetStorageFull'] as bool?,
      includeSymmetricAlgorithms: json['IncludeSymmetricAlgorithms'] as bool?,
      noSecurityExtension: json['NoSecurityExtension'] as bool?,
      removeInvalidCertificateFromPersonalStore:
          json['RemoveInvalidCertificateFromPersonalStore'] as bool?,
      userInteractionRequired: json['UserInteractionRequired'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableKeyReuseOnNtTokenKeysetStorageFull =
        this.enableKeyReuseOnNtTokenKeysetStorageFull;
    final includeSymmetricAlgorithms = this.includeSymmetricAlgorithms;
    final noSecurityExtension = this.noSecurityExtension;
    final removeInvalidCertificateFromPersonalStore =
        this.removeInvalidCertificateFromPersonalStore;
    final userInteractionRequired = this.userInteractionRequired;
    return {
      if (enableKeyReuseOnNtTokenKeysetStorageFull != null)
        'EnableKeyReuseOnNtTokenKeysetStorageFull':
            enableKeyReuseOnNtTokenKeysetStorageFull,
      if (includeSymmetricAlgorithms != null)
        'IncludeSymmetricAlgorithms': includeSymmetricAlgorithms,
      if (noSecurityExtension != null)
        'NoSecurityExtension': noSecurityExtension,
      if (removeInvalidCertificateFromPersonalStore != null)
        'RemoveInvalidCertificateFromPersonalStore':
            removeInvalidCertificateFromPersonalStore,
      if (userInteractionRequired != null)
        'UserInteractionRequired': userInteractionRequired,
    };
  }
}

/// Template configurations for v3 template schema.
class EnrollmentFlagsV3 {
  /// Allow renewal using the same key.
  final bool? enableKeyReuseOnNtTokenKeysetStorageFull;

  /// Include symmetric algorithms allowed by the subject.
  final bool? includeSymmetricAlgorithms;

  /// This flag instructs the CA to not include the security extension
  /// szOID_NTDS_CA_SECURITY_EXT (OID:1.3.6.1.4.1.311.25.2), as specified in
  /// [MS-WCCE] sections 2.2.2.7.7.4 and 3.2.2.6.2.1.4.5.9, in the issued
  /// certificate. This addresses a Windows Kerberos elevation-of-privilege
  /// vulnerability.
  final bool? noSecurityExtension;

  /// Delete expired or revoked certificates instead of archiving them.
  final bool? removeInvalidCertificateFromPersonalStore;

  /// Require user interaction when the subject is enrolled and the private key
  /// associated with the certificate is used.
  final bool? userInteractionRequired;

  EnrollmentFlagsV3({
    this.enableKeyReuseOnNtTokenKeysetStorageFull,
    this.includeSymmetricAlgorithms,
    this.noSecurityExtension,
    this.removeInvalidCertificateFromPersonalStore,
    this.userInteractionRequired,
  });

  factory EnrollmentFlagsV3.fromJson(Map<String, dynamic> json) {
    return EnrollmentFlagsV3(
      enableKeyReuseOnNtTokenKeysetStorageFull:
          json['EnableKeyReuseOnNtTokenKeysetStorageFull'] as bool?,
      includeSymmetricAlgorithms: json['IncludeSymmetricAlgorithms'] as bool?,
      noSecurityExtension: json['NoSecurityExtension'] as bool?,
      removeInvalidCertificateFromPersonalStore:
          json['RemoveInvalidCertificateFromPersonalStore'] as bool?,
      userInteractionRequired: json['UserInteractionRequired'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableKeyReuseOnNtTokenKeysetStorageFull =
        this.enableKeyReuseOnNtTokenKeysetStorageFull;
    final includeSymmetricAlgorithms = this.includeSymmetricAlgorithms;
    final noSecurityExtension = this.noSecurityExtension;
    final removeInvalidCertificateFromPersonalStore =
        this.removeInvalidCertificateFromPersonalStore;
    final userInteractionRequired = this.userInteractionRequired;
    return {
      if (enableKeyReuseOnNtTokenKeysetStorageFull != null)
        'EnableKeyReuseOnNtTokenKeysetStorageFull':
            enableKeyReuseOnNtTokenKeysetStorageFull,
      if (includeSymmetricAlgorithms != null)
        'IncludeSymmetricAlgorithms': includeSymmetricAlgorithms,
      if (noSecurityExtension != null)
        'NoSecurityExtension': noSecurityExtension,
      if (removeInvalidCertificateFromPersonalStore != null)
        'RemoveInvalidCertificateFromPersonalStore':
            removeInvalidCertificateFromPersonalStore,
      if (userInteractionRequired != null)
        'UserInteractionRequired': userInteractionRequired,
    };
  }
}

/// Template configurations for v4 template schema.
class EnrollmentFlagsV4 {
  /// Allow renewal using the same key.
  final bool? enableKeyReuseOnNtTokenKeysetStorageFull;

  /// Include symmetric algorithms allowed by the subject.
  final bool? includeSymmetricAlgorithms;

  /// This flag instructs the CA to not include the security extension
  /// szOID_NTDS_CA_SECURITY_EXT (OID:1.3.6.1.4.1.311.25.2), as specified in
  /// [MS-WCCE] sections 2.2.2.7.7.4 and 3.2.2.6.2.1.4.5.9, in the issued
  /// certificate. This addresses a Windows Kerberos elevation-of-privilege
  /// vulnerability.
  final bool? noSecurityExtension;

  /// Delete expired or revoked certificates instead of archiving them.
  final bool? removeInvalidCertificateFromPersonalStore;

  /// Require user interaction when the subject is enrolled and the private key
  /// associated with the certificate is used.
  final bool? userInteractionRequired;

  EnrollmentFlagsV4({
    this.enableKeyReuseOnNtTokenKeysetStorageFull,
    this.includeSymmetricAlgorithms,
    this.noSecurityExtension,
    this.removeInvalidCertificateFromPersonalStore,
    this.userInteractionRequired,
  });

  factory EnrollmentFlagsV4.fromJson(Map<String, dynamic> json) {
    return EnrollmentFlagsV4(
      enableKeyReuseOnNtTokenKeysetStorageFull:
          json['EnableKeyReuseOnNtTokenKeysetStorageFull'] as bool?,
      includeSymmetricAlgorithms: json['IncludeSymmetricAlgorithms'] as bool?,
      noSecurityExtension: json['NoSecurityExtension'] as bool?,
      removeInvalidCertificateFromPersonalStore:
          json['RemoveInvalidCertificateFromPersonalStore'] as bool?,
      userInteractionRequired: json['UserInteractionRequired'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableKeyReuseOnNtTokenKeysetStorageFull =
        this.enableKeyReuseOnNtTokenKeysetStorageFull;
    final includeSymmetricAlgorithms = this.includeSymmetricAlgorithms;
    final noSecurityExtension = this.noSecurityExtension;
    final removeInvalidCertificateFromPersonalStore =
        this.removeInvalidCertificateFromPersonalStore;
    final userInteractionRequired = this.userInteractionRequired;
    return {
      if (enableKeyReuseOnNtTokenKeysetStorageFull != null)
        'EnableKeyReuseOnNtTokenKeysetStorageFull':
            enableKeyReuseOnNtTokenKeysetStorageFull,
      if (includeSymmetricAlgorithms != null)
        'IncludeSymmetricAlgorithms': includeSymmetricAlgorithms,
      if (noSecurityExtension != null)
        'NoSecurityExtension': noSecurityExtension,
      if (removeInvalidCertificateFromPersonalStore != null)
        'RemoveInvalidCertificateFromPersonalStore':
            removeInvalidCertificateFromPersonalStore,
      if (userInteractionRequired != null)
        'UserInteractionRequired': userInteractionRequired,
    };
  }
}

/// Certificate extensions for v2 template schema
class ExtensionsV2 {
  /// The key usage extension defines the purpose (e.g., encipherment, signature,
  /// certificate signing) of the key contained in the certificate.
  final KeyUsage keyUsage;

  /// Application policies specify what the certificate is used for and its
  /// purpose.
  final ApplicationPolicies? applicationPolicies;

  ExtensionsV2({
    required this.keyUsage,
    this.applicationPolicies,
  });

  factory ExtensionsV2.fromJson(Map<String, dynamic> json) {
    return ExtensionsV2(
      keyUsage: KeyUsage.fromJson(json['KeyUsage'] as Map<String, dynamic>),
      applicationPolicies: json['ApplicationPolicies'] != null
          ? ApplicationPolicies.fromJson(
              json['ApplicationPolicies'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyUsage = this.keyUsage;
    final applicationPolicies = this.applicationPolicies;
    return {
      'KeyUsage': keyUsage,
      if (applicationPolicies != null)
        'ApplicationPolicies': applicationPolicies,
    };
  }
}

/// Certificate extensions for v3 template schema
class ExtensionsV3 {
  /// The key usage extension defines the purpose (e.g., encipherment, signature,
  /// certificate signing) of the key contained in the certificate.
  final KeyUsage keyUsage;

  /// Application policies specify what the certificate is used for and its
  /// purpose.
  final ApplicationPolicies? applicationPolicies;

  ExtensionsV3({
    required this.keyUsage,
    this.applicationPolicies,
  });

  factory ExtensionsV3.fromJson(Map<String, dynamic> json) {
    return ExtensionsV3(
      keyUsage: KeyUsage.fromJson(json['KeyUsage'] as Map<String, dynamic>),
      applicationPolicies: json['ApplicationPolicies'] != null
          ? ApplicationPolicies.fromJson(
              json['ApplicationPolicies'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyUsage = this.keyUsage;
    final applicationPolicies = this.applicationPolicies;
    return {
      'KeyUsage': keyUsage,
      if (applicationPolicies != null)
        'ApplicationPolicies': applicationPolicies,
    };
  }
}

/// Certificate extensions for v4 template schema
class ExtensionsV4 {
  /// The key usage extension defines the purpose (e.g., encipherment, signature)
  /// of the key contained in the certificate.
  final KeyUsage keyUsage;

  /// Application policies specify what the certificate is used for and its
  /// purpose.
  final ApplicationPolicies? applicationPolicies;

  ExtensionsV4({
    required this.keyUsage,
    this.applicationPolicies,
  });

  factory ExtensionsV4.fromJson(Map<String, dynamic> json) {
    return ExtensionsV4(
      keyUsage: KeyUsage.fromJson(json['KeyUsage'] as Map<String, dynamic>),
      applicationPolicies: json['ApplicationPolicies'] != null
          ? ApplicationPolicies.fromJson(
              json['ApplicationPolicies'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyUsage = this.keyUsage;
    final applicationPolicies = this.applicationPolicies;
    return {
      'KeyUsage': keyUsage,
      if (applicationPolicies != null)
        'ApplicationPolicies': applicationPolicies,
    };
  }
}

/// General flags for v2 template schema that defines if the template is for a
/// machine or a user and if the template can be issued using autoenrollment.
class GeneralFlagsV2 {
  /// Allows certificate issuance using autoenrollment. Set to TRUE to allow
  /// autoenrollment.
  final bool? autoEnrollment;

  /// Defines if the template is for machines or users. Set to TRUE if the
  /// template is for machines. Set to FALSE if the template is for users.
  final bool? machineType;

  GeneralFlagsV2({
    this.autoEnrollment,
    this.machineType,
  });

  factory GeneralFlagsV2.fromJson(Map<String, dynamic> json) {
    return GeneralFlagsV2(
      autoEnrollment: json['AutoEnrollment'] as bool?,
      machineType: json['MachineType'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnrollment = this.autoEnrollment;
    final machineType = this.machineType;
    return {
      if (autoEnrollment != null) 'AutoEnrollment': autoEnrollment,
      if (machineType != null) 'MachineType': machineType,
    };
  }
}

/// General flags for v3 template schema that defines if the template is for a
/// machine or a user and if the template can be issued using autoenrollment.
class GeneralFlagsV3 {
  /// Allows certificate issuance using autoenrollment. Set to TRUE to allow
  /// autoenrollment.
  final bool? autoEnrollment;

  /// Defines if the template is for machines or users. Set to TRUE if the
  /// template is for machines. Set to FALSE if the template is for users
  final bool? machineType;

  GeneralFlagsV3({
    this.autoEnrollment,
    this.machineType,
  });

  factory GeneralFlagsV3.fromJson(Map<String, dynamic> json) {
    return GeneralFlagsV3(
      autoEnrollment: json['AutoEnrollment'] as bool?,
      machineType: json['MachineType'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnrollment = this.autoEnrollment;
    final machineType = this.machineType;
    return {
      if (autoEnrollment != null) 'AutoEnrollment': autoEnrollment,
      if (machineType != null) 'MachineType': machineType,
    };
  }
}

/// General flags for v4 template schema that defines if the template is for a
/// machine or a user and if the template can be issued using autoenrollment.
class GeneralFlagsV4 {
  /// Allows certificate issuance using autoenrollment. Set to TRUE to allow
  /// autoenrollment.
  final bool? autoEnrollment;

  /// Defines if the template is for machines or users. Set to TRUE if the
  /// template is for machines. Set to FALSE if the template is for users
  final bool? machineType;

  GeneralFlagsV4({
    this.autoEnrollment,
    this.machineType,
  });

  factory GeneralFlagsV4.fromJson(Map<String, dynamic> json) {
    return GeneralFlagsV4(
      autoEnrollment: json['AutoEnrollment'] as bool?,
      machineType: json['MachineType'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnrollment = this.autoEnrollment;
    final machineType = this.machineType;
    return {
      if (autoEnrollment != null) 'AutoEnrollment': autoEnrollment,
      if (machineType != null) 'MachineType': machineType,
    };
  }
}

class GetConnectorResponse {
  /// A structure that contains information about your connector.
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

class GetDirectoryRegistrationResponse {
  /// The directory registration represents the authorization of the connector
  /// service with a directory.
  final DirectoryRegistration? directoryRegistration;

  GetDirectoryRegistrationResponse({
    this.directoryRegistration,
  });

  factory GetDirectoryRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return GetDirectoryRegistrationResponse(
      directoryRegistration: json['DirectoryRegistration'] != null
          ? DirectoryRegistration.fromJson(
              json['DirectoryRegistration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryRegistration = this.directoryRegistration;
    return {
      if (directoryRegistration != null)
        'DirectoryRegistration': directoryRegistration,
    };
  }
}

class GetServicePrincipalNameResponse {
  /// The service principal name that the connector uses to authenticate with
  /// Active Directory.
  final ServicePrincipalName? servicePrincipalName;

  GetServicePrincipalNameResponse({
    this.servicePrincipalName,
  });

  factory GetServicePrincipalNameResponse.fromJson(Map<String, dynamic> json) {
    return GetServicePrincipalNameResponse(
      servicePrincipalName: json['ServicePrincipalName'] != null
          ? ServicePrincipalName.fromJson(
              json['ServicePrincipalName'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final servicePrincipalName = this.servicePrincipalName;
    return {
      if (servicePrincipalName != null)
        'ServicePrincipalName': servicePrincipalName,
    };
  }
}

class GetTemplateGroupAccessControlEntryResponse {
  /// An access control entry allows or denies an Active Directory group from
  /// enrolling and/or autoenrolling with a template.
  final AccessControlEntry? accessControlEntry;

  GetTemplateGroupAccessControlEntryResponse({
    this.accessControlEntry,
  });

  factory GetTemplateGroupAccessControlEntryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTemplateGroupAccessControlEntryResponse(
      accessControlEntry: json['AccessControlEntry'] != null
          ? AccessControlEntry.fromJson(
              json['AccessControlEntry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessControlEntry = this.accessControlEntry;
    return {
      if (accessControlEntry != null) 'AccessControlEntry': accessControlEntry,
    };
  }
}

class GetTemplateResponse {
  /// A certificate template that the connector uses to issue certificates from a
  /// private CA.
  final Template? template;

  GetTemplateResponse({
    this.template,
  });

  factory GetTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetTemplateResponse(
      template: json['Template'] != null
          ? Template.fromJson(json['Template'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final template = this.template;
    return {
      if (template != null) 'Template': template,
    };
  }
}

enum HashAlgorithm {
  sha256,
  sha384,
  sha512,
}

extension HashAlgorithmValueExtension on HashAlgorithm {
  String toValue() {
    switch (this) {
      case HashAlgorithm.sha256:
        return 'SHA256';
      case HashAlgorithm.sha384:
        return 'SHA384';
      case HashAlgorithm.sha512:
        return 'SHA512';
    }
  }
}

extension HashAlgorithmFromString on String {
  HashAlgorithm toHashAlgorithm() {
    switch (this) {
      case 'SHA256':
        return HashAlgorithm.sha256;
      case 'SHA384':
        return HashAlgorithm.sha384;
      case 'SHA512':
        return HashAlgorithm.sha512;
    }
    throw Exception('$this is not known in enum HashAlgorithm');
  }
}

enum KeySpec {
  keyExchange,
  signature,
}

extension KeySpecValueExtension on KeySpec {
  String toValue() {
    switch (this) {
      case KeySpec.keyExchange:
        return 'KEY_EXCHANGE';
      case KeySpec.signature:
        return 'SIGNATURE';
    }
  }
}

extension KeySpecFromString on String {
  KeySpec toKeySpec() {
    switch (this) {
      case 'KEY_EXCHANGE':
        return KeySpec.keyExchange;
      case 'SIGNATURE':
        return KeySpec.signature;
    }
    throw Exception('$this is not known in enum KeySpec');
  }
}

/// The key usage extension defines the purpose (e.g., encipherment, signature)
/// of the key contained in the certificate.
class KeyUsage {
  /// The key usage flags represent the purpose (e.g., encipherment, signature) of
  /// the key contained in the certificate.
  final KeyUsageFlags usageFlags;

  /// Sets the key usage extension to critical.
  final bool? critical;

  KeyUsage({
    required this.usageFlags,
    this.critical,
  });

  factory KeyUsage.fromJson(Map<String, dynamic> json) {
    return KeyUsage(
      usageFlags:
          KeyUsageFlags.fromJson(json['UsageFlags'] as Map<String, dynamic>),
      critical: json['Critical'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final usageFlags = this.usageFlags;
    final critical = this.critical;
    return {
      'UsageFlags': usageFlags,
      if (critical != null) 'Critical': critical,
    };
  }
}

/// The key usage flags represent the purpose (e.g., encipherment, signature) of
/// the key contained in the certificate.
class KeyUsageFlags {
  /// DataEncipherment is asserted when the subject public key is used for
  /// directly enciphering raw user data without the use of an intermediate
  /// symmetric cipher.
  final bool? dataEncipherment;

  /// The digitalSignature is asserted when the subject public key is used for
  /// verifying digital signatures.
  final bool? digitalSignature;

  /// KeyAgreement is asserted when the subject public key is used for key
  /// agreement.
  final bool? keyAgreement;

  /// KeyEncipherment is asserted when the subject public key is used for
  /// enciphering private or secret keys, i.e., for key transport.
  final bool? keyEncipherment;

  /// NonRepudiation is asserted when the subject public key is used to verify
  /// digital signatures.
  final bool? nonRepudiation;

  KeyUsageFlags({
    this.dataEncipherment,
    this.digitalSignature,
    this.keyAgreement,
    this.keyEncipherment,
    this.nonRepudiation,
  });

  factory KeyUsageFlags.fromJson(Map<String, dynamic> json) {
    return KeyUsageFlags(
      dataEncipherment: json['DataEncipherment'] as bool?,
      digitalSignature: json['DigitalSignature'] as bool?,
      keyAgreement: json['KeyAgreement'] as bool?,
      keyEncipherment: json['KeyEncipherment'] as bool?,
      nonRepudiation: json['NonRepudiation'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataEncipherment = this.dataEncipherment;
    final digitalSignature = this.digitalSignature;
    final keyAgreement = this.keyAgreement;
    final keyEncipherment = this.keyEncipherment;
    final nonRepudiation = this.nonRepudiation;
    return {
      if (dataEncipherment != null) 'DataEncipherment': dataEncipherment,
      if (digitalSignature != null) 'DigitalSignature': digitalSignature,
      if (keyAgreement != null) 'KeyAgreement': keyAgreement,
      if (keyEncipherment != null) 'KeyEncipherment': keyEncipherment,
      if (nonRepudiation != null) 'NonRepudiation': nonRepudiation,
    };
  }
}

/// The key usage property defines the purpose of the private key contained in
/// the certificate. You can specify specific purposes using property flags or
/// all by using property type ALL.
class KeyUsageProperty {
  /// You can specify key usage for encryption, key agreement, and signature. You
  /// can use property flags or property type but not both.
  final KeyUsagePropertyFlags? propertyFlags;

  /// You can specify all key usages using property type ALL. You can use property
  /// type or property flags but not both.
  final KeyUsagePropertyType? propertyType;

  KeyUsageProperty({
    this.propertyFlags,
    this.propertyType,
  });

  factory KeyUsageProperty.fromJson(Map<String, dynamic> json) {
    return KeyUsageProperty(
      propertyFlags: json['PropertyFlags'] != null
          ? KeyUsagePropertyFlags.fromJson(
              json['PropertyFlags'] as Map<String, dynamic>)
          : null,
      propertyType: (json['PropertyType'] as String?)?.toKeyUsagePropertyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final propertyFlags = this.propertyFlags;
    final propertyType = this.propertyType;
    return {
      if (propertyFlags != null) 'PropertyFlags': propertyFlags,
      if (propertyType != null) 'PropertyType': propertyType.toValue(),
    };
  }
}

/// Specifies key usage.
class KeyUsagePropertyFlags {
  /// Allows key for encryption and decryption.
  final bool? decrypt;

  /// Allows key exchange without encryption.
  final bool? keyAgreement;

  /// Allow key use for digital signature.
  final bool? sign;

  KeyUsagePropertyFlags({
    this.decrypt,
    this.keyAgreement,
    this.sign,
  });

  factory KeyUsagePropertyFlags.fromJson(Map<String, dynamic> json) {
    return KeyUsagePropertyFlags(
      decrypt: json['Decrypt'] as bool?,
      keyAgreement: json['KeyAgreement'] as bool?,
      sign: json['Sign'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final decrypt = this.decrypt;
    final keyAgreement = this.keyAgreement;
    final sign = this.sign;
    return {
      if (decrypt != null) 'Decrypt': decrypt,
      if (keyAgreement != null) 'KeyAgreement': keyAgreement,
      if (sign != null) 'Sign': sign,
    };
  }
}

enum KeyUsagePropertyType {
  all,
}

extension KeyUsagePropertyTypeValueExtension on KeyUsagePropertyType {
  String toValue() {
    switch (this) {
      case KeyUsagePropertyType.all:
        return 'ALL';
    }
  }
}

extension KeyUsagePropertyTypeFromString on String {
  KeyUsagePropertyType toKeyUsagePropertyType() {
    switch (this) {
      case 'ALL':
        return KeyUsagePropertyType.all;
    }
    throw Exception('$this is not known in enum KeyUsagePropertyType');
  }
}

class ListConnectorsResponse {
  /// Summary information about each connector you have created.
  final List<ConnectorSummary>? connectors;

  /// Use this parameter when paginating results in a subsequent request after you
  /// receive a response with truncated results. Set it to the value of the
  /// NextToken parameter from the response you just received.
  final String? nextToken;

  ListConnectorsResponse({
    this.connectors,
    this.nextToken,
  });

  factory ListConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectorsResponse(
      connectors: (json['Connectors'] as List?)
          ?.whereNotNull()
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

class ListDirectoryRegistrationsResponse {
  /// Summary information about each directory registration you have created.
  final List<DirectoryRegistrationSummary>? directoryRegistrations;

  /// Use this parameter when paginating results in a subsequent request after you
  /// receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
  final String? nextToken;

  ListDirectoryRegistrationsResponse({
    this.directoryRegistrations,
    this.nextToken,
  });

  factory ListDirectoryRegistrationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDirectoryRegistrationsResponse(
      directoryRegistrations: (json['DirectoryRegistrations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DirectoryRegistrationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryRegistrations = this.directoryRegistrations;
    final nextToken = this.nextToken;
    return {
      if (directoryRegistrations != null)
        'DirectoryRegistrations': directoryRegistrations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListServicePrincipalNamesResponse {
  /// Use this parameter when paginating results in a subsequent request after you
  /// receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
  final String? nextToken;

  /// The service principal name, if any, that the connector uses to authenticate
  /// with Active Directory.
  final List<ServicePrincipalNameSummary>? servicePrincipalNames;

  ListServicePrincipalNamesResponse({
    this.nextToken,
    this.servicePrincipalNames,
  });

  factory ListServicePrincipalNamesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListServicePrincipalNamesResponse(
      nextToken: json['NextToken'] as String?,
      servicePrincipalNames: (json['ServicePrincipalNames'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ServicePrincipalNameSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final servicePrincipalNames = this.servicePrincipalNames;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (servicePrincipalNames != null)
        'ServicePrincipalNames': servicePrincipalNames,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags, if any, that are associated with your resource.
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

class ListTemplateGroupAccessControlEntriesResponse {
  /// An access control entry grants or denies permission to an Active Directory
  /// group to enroll certificates for a template.
  final List<AccessControlEntrySummary>? accessControlEntries;

  /// Use this parameter when paginating results in a subsequent request after you
  /// receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
  final String? nextToken;

  ListTemplateGroupAccessControlEntriesResponse({
    this.accessControlEntries,
    this.nextToken,
  });

  factory ListTemplateGroupAccessControlEntriesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTemplateGroupAccessControlEntriesResponse(
      accessControlEntries: (json['AccessControlEntries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AccessControlEntrySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessControlEntries = this.accessControlEntries;
    final nextToken = this.nextToken;
    return {
      if (accessControlEntries != null)
        'AccessControlEntries': accessControlEntries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTemplatesResponse {
  /// Use this parameter when paginating results in a subsequent request after you
  /// receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
  final String? nextToken;

  /// Custom configuration templates used when issuing a certificate.
  final List<TemplateSummary>? templates;

  ListTemplatesResponse({
    this.nextToken,
    this.templates,
  });

  factory ListTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListTemplatesResponse(
      nextToken: json['NextToken'] as String?,
      templates: (json['Templates'] as List?)
          ?.whereNotNull()
          .map((e) => TemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final templates = this.templates;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (templates != null) 'Templates': templates,
    };
  }
}

enum PrivateKeyAlgorithm {
  rsa,
  ecdhP256,
  ecdhP384,
  ecdhP521,
}

extension PrivateKeyAlgorithmValueExtension on PrivateKeyAlgorithm {
  String toValue() {
    switch (this) {
      case PrivateKeyAlgorithm.rsa:
        return 'RSA';
      case PrivateKeyAlgorithm.ecdhP256:
        return 'ECDH_P256';
      case PrivateKeyAlgorithm.ecdhP384:
        return 'ECDH_P384';
      case PrivateKeyAlgorithm.ecdhP521:
        return 'ECDH_P521';
    }
  }
}

extension PrivateKeyAlgorithmFromString on String {
  PrivateKeyAlgorithm toPrivateKeyAlgorithm() {
    switch (this) {
      case 'RSA':
        return PrivateKeyAlgorithm.rsa;
      case 'ECDH_P256':
        return PrivateKeyAlgorithm.ecdhP256;
      case 'ECDH_P384':
        return PrivateKeyAlgorithm.ecdhP384;
      case 'ECDH_P521':
        return PrivateKeyAlgorithm.ecdhP521;
    }
    throw Exception('$this is not known in enum PrivateKeyAlgorithm');
  }
}

/// Defines the attributes of the private key.
class PrivateKeyAttributesV2 {
  /// Defines the purpose of the private key. Set it to "KEY_EXCHANGE" or
  /// "SIGNATURE" value.
  final KeySpec keySpec;

  /// Set the minimum key length of the private key.
  final int minimalKeyLength;

  /// Defines the cryptographic providers used to generate the private key.
  final List<String>? cryptoProviders;

  PrivateKeyAttributesV2({
    required this.keySpec,
    required this.minimalKeyLength,
    this.cryptoProviders,
  });

  factory PrivateKeyAttributesV2.fromJson(Map<String, dynamic> json) {
    return PrivateKeyAttributesV2(
      keySpec: (json['KeySpec'] as String).toKeySpec(),
      minimalKeyLength: json['MinimalKeyLength'] as int,
      cryptoProviders: (json['CryptoProviders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keySpec = this.keySpec;
    final minimalKeyLength = this.minimalKeyLength;
    final cryptoProviders = this.cryptoProviders;
    return {
      'KeySpec': keySpec.toValue(),
      'MinimalKeyLength': minimalKeyLength,
      if (cryptoProviders != null) 'CryptoProviders': cryptoProviders,
    };
  }
}

/// Defines the attributes of the private key.
class PrivateKeyAttributesV3 {
  /// Defines the algorithm used to generate the private key.
  final PrivateKeyAlgorithm algorithm;

  /// Defines the purpose of the private key. Set it to "KEY_EXCHANGE" or
  /// "SIGNATURE" value.
  final KeySpec keySpec;

  /// The key usage property defines the purpose of the private key contained in
  /// the certificate. You can specify specific purposes using property flags or
  /// all by using property type ALL.
  final KeyUsageProperty keyUsageProperty;

  /// Set the minimum key length of the private key.
  final int minimalKeyLength;

  /// Defines the cryptographic providers used to generate the private key.
  final List<String>? cryptoProviders;

  PrivateKeyAttributesV3({
    required this.algorithm,
    required this.keySpec,
    required this.keyUsageProperty,
    required this.minimalKeyLength,
    this.cryptoProviders,
  });

  factory PrivateKeyAttributesV3.fromJson(Map<String, dynamic> json) {
    return PrivateKeyAttributesV3(
      algorithm: (json['Algorithm'] as String).toPrivateKeyAlgorithm(),
      keySpec: (json['KeySpec'] as String).toKeySpec(),
      keyUsageProperty: KeyUsageProperty.fromJson(
          json['KeyUsageProperty'] as Map<String, dynamic>),
      minimalKeyLength: json['MinimalKeyLength'] as int,
      cryptoProviders: (json['CryptoProviders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final keySpec = this.keySpec;
    final keyUsageProperty = this.keyUsageProperty;
    final minimalKeyLength = this.minimalKeyLength;
    final cryptoProviders = this.cryptoProviders;
    return {
      'Algorithm': algorithm.toValue(),
      'KeySpec': keySpec.toValue(),
      'KeyUsageProperty': keyUsageProperty,
      'MinimalKeyLength': minimalKeyLength,
      if (cryptoProviders != null) 'CryptoProviders': cryptoProviders,
    };
  }
}

/// Defines the attributes of the private key.
class PrivateKeyAttributesV4 {
  /// Defines the purpose of the private key. Set it to "KEY_EXCHANGE" or
  /// "SIGNATURE" value.
  final KeySpec keySpec;

  /// Set the minimum key length of the private key.
  final int minimalKeyLength;

  /// Defines the algorithm used to generate the private key.
  final PrivateKeyAlgorithm? algorithm;

  /// Defines the cryptographic providers used to generate the private key.
  final List<String>? cryptoProviders;

  /// The key usage property defines the purpose of the private key contained in
  /// the certificate. You can specify specific purposes using property flags or
  /// all by using property type ALL.
  final KeyUsageProperty? keyUsageProperty;

  PrivateKeyAttributesV4({
    required this.keySpec,
    required this.minimalKeyLength,
    this.algorithm,
    this.cryptoProviders,
    this.keyUsageProperty,
  });

  factory PrivateKeyAttributesV4.fromJson(Map<String, dynamic> json) {
    return PrivateKeyAttributesV4(
      keySpec: (json['KeySpec'] as String).toKeySpec(),
      minimalKeyLength: json['MinimalKeyLength'] as int,
      algorithm: (json['Algorithm'] as String?)?.toPrivateKeyAlgorithm(),
      cryptoProviders: (json['CryptoProviders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      keyUsageProperty: json['KeyUsageProperty'] != null
          ? KeyUsageProperty.fromJson(
              json['KeyUsageProperty'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keySpec = this.keySpec;
    final minimalKeyLength = this.minimalKeyLength;
    final algorithm = this.algorithm;
    final cryptoProviders = this.cryptoProviders;
    final keyUsageProperty = this.keyUsageProperty;
    return {
      'KeySpec': keySpec.toValue(),
      'MinimalKeyLength': minimalKeyLength,
      if (algorithm != null) 'Algorithm': algorithm.toValue(),
      if (cryptoProviders != null) 'CryptoProviders': cryptoProviders,
      if (keyUsageProperty != null) 'KeyUsageProperty': keyUsageProperty,
    };
  }
}

/// Private key flags for v2 templates specify the client compatibility, if the
/// private key can be exported, and if user input is required when using a
/// private key.
class PrivateKeyFlagsV2 {
  /// Defines the minimum client compatibility.
  final ClientCompatibilityV2 clientVersion;

  /// Allows the private key to be exported.
  final bool? exportableKey;

  /// Require user input when using the private key for enrollment.
  final bool? strongKeyProtectionRequired;

  PrivateKeyFlagsV2({
    required this.clientVersion,
    this.exportableKey,
    this.strongKeyProtectionRequired,
  });

  factory PrivateKeyFlagsV2.fromJson(Map<String, dynamic> json) {
    return PrivateKeyFlagsV2(
      clientVersion:
          (json['ClientVersion'] as String).toClientCompatibilityV2(),
      exportableKey: json['ExportableKey'] as bool?,
      strongKeyProtectionRequired: json['StrongKeyProtectionRequired'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientVersion = this.clientVersion;
    final exportableKey = this.exportableKey;
    final strongKeyProtectionRequired = this.strongKeyProtectionRequired;
    return {
      'ClientVersion': clientVersion.toValue(),
      if (exportableKey != null) 'ExportableKey': exportableKey,
      if (strongKeyProtectionRequired != null)
        'StrongKeyProtectionRequired': strongKeyProtectionRequired,
    };
  }
}

/// Private key flags for v3 templates specify the client compatibility, if the
/// private key can be exported, if user input is required when using a private
/// key, and if an alternate signature algorithm should be used.
class PrivateKeyFlagsV3 {
  /// Defines the minimum client compatibility.
  final ClientCompatibilityV3 clientVersion;

  /// Allows the private key to be exported.
  final bool? exportableKey;

  /// Reguires the PKCS #1 v2.1 signature format for certificates. You should
  /// verify that your CA, objects, and applications can accept this signature
  /// format.
  final bool? requireAlternateSignatureAlgorithm;

  /// Requirer user input when using the private key for enrollment.
  final bool? strongKeyProtectionRequired;

  PrivateKeyFlagsV3({
    required this.clientVersion,
    this.exportableKey,
    this.requireAlternateSignatureAlgorithm,
    this.strongKeyProtectionRequired,
  });

  factory PrivateKeyFlagsV3.fromJson(Map<String, dynamic> json) {
    return PrivateKeyFlagsV3(
      clientVersion:
          (json['ClientVersion'] as String).toClientCompatibilityV3(),
      exportableKey: json['ExportableKey'] as bool?,
      requireAlternateSignatureAlgorithm:
          json['RequireAlternateSignatureAlgorithm'] as bool?,
      strongKeyProtectionRequired: json['StrongKeyProtectionRequired'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientVersion = this.clientVersion;
    final exportableKey = this.exportableKey;
    final requireAlternateSignatureAlgorithm =
        this.requireAlternateSignatureAlgorithm;
    final strongKeyProtectionRequired = this.strongKeyProtectionRequired;
    return {
      'ClientVersion': clientVersion.toValue(),
      if (exportableKey != null) 'ExportableKey': exportableKey,
      if (requireAlternateSignatureAlgorithm != null)
        'RequireAlternateSignatureAlgorithm':
            requireAlternateSignatureAlgorithm,
      if (strongKeyProtectionRequired != null)
        'StrongKeyProtectionRequired': strongKeyProtectionRequired,
    };
  }
}

/// Private key flags for v4 templates specify the client compatibility, if the
/// private key can be exported, if user input is required when using a private
/// key, if an alternate signature algorithm should be used, and if certificates
/// are renewed using the same private key.
class PrivateKeyFlagsV4 {
  /// Defines the minimum client compatibility.
  final ClientCompatibilityV4 clientVersion;

  /// Allows the private key to be exported.
  final bool? exportableKey;

  /// Requires the PKCS #1 v2.1 signature format for certificates. You should
  /// verify that your CA, objects, and applications can accept this signature
  /// format.
  final bool? requireAlternateSignatureAlgorithm;

  /// Renew certificate using the same private key.
  final bool? requireSameKeyRenewal;

  /// Require user input when using the private key for enrollment.
  final bool? strongKeyProtectionRequired;

  /// Specifies the cryptographic service provider category used to generate
  /// private keys. Set to TRUE to use Legacy Cryptographic Service Providers and
  /// FALSE to use Key Storage Providers.
  final bool? useLegacyProvider;

  PrivateKeyFlagsV4({
    required this.clientVersion,
    this.exportableKey,
    this.requireAlternateSignatureAlgorithm,
    this.requireSameKeyRenewal,
    this.strongKeyProtectionRequired,
    this.useLegacyProvider,
  });

  factory PrivateKeyFlagsV4.fromJson(Map<String, dynamic> json) {
    return PrivateKeyFlagsV4(
      clientVersion:
          (json['ClientVersion'] as String).toClientCompatibilityV4(),
      exportableKey: json['ExportableKey'] as bool?,
      requireAlternateSignatureAlgorithm:
          json['RequireAlternateSignatureAlgorithm'] as bool?,
      requireSameKeyRenewal: json['RequireSameKeyRenewal'] as bool?,
      strongKeyProtectionRequired: json['StrongKeyProtectionRequired'] as bool?,
      useLegacyProvider: json['UseLegacyProvider'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientVersion = this.clientVersion;
    final exportableKey = this.exportableKey;
    final requireAlternateSignatureAlgorithm =
        this.requireAlternateSignatureAlgorithm;
    final requireSameKeyRenewal = this.requireSameKeyRenewal;
    final strongKeyProtectionRequired = this.strongKeyProtectionRequired;
    final useLegacyProvider = this.useLegacyProvider;
    return {
      'ClientVersion': clientVersion.toValue(),
      if (exportableKey != null) 'ExportableKey': exportableKey,
      if (requireAlternateSignatureAlgorithm != null)
        'RequireAlternateSignatureAlgorithm':
            requireAlternateSignatureAlgorithm,
      if (requireSameKeyRenewal != null)
        'RequireSameKeyRenewal': requireSameKeyRenewal,
      if (strongKeyProtectionRequired != null)
        'StrongKeyProtectionRequired': strongKeyProtectionRequired,
      if (useLegacyProvider != null) 'UseLegacyProvider': useLegacyProvider,
    };
  }
}

/// The service principal name that the connector uses to authenticate with
/// Active Directory.
class ServicePrincipalName {
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector.html</a>.
  final String? connectorArn;

  /// The date and time that the service principal name was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration.html">CreateDirectoryRegistration</a>.
  final String? directoryRegistrationArn;

  /// The status of a service principal name.
  final ServicePrincipalNameStatus? status;

  /// Additional information for the status of a service principal name if the
  /// status is failed.
  final ServicePrincipalNameStatusReason? statusReason;

  /// The date and time that the service principal name was updated.
  final DateTime? updatedAt;

  ServicePrincipalName({
    this.connectorArn,
    this.createdAt,
    this.directoryRegistrationArn,
    this.status,
    this.statusReason,
    this.updatedAt,
  });

  factory ServicePrincipalName.fromJson(Map<String, dynamic> json) {
    return ServicePrincipalName(
      connectorArn: json['ConnectorArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      directoryRegistrationArn: json['DirectoryRegistrationArn'] as String?,
      status: (json['Status'] as String?)?.toServicePrincipalNameStatus(),
      statusReason: (json['StatusReason'] as String?)
          ?.toServicePrincipalNameStatusReason(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    final createdAt = this.createdAt;
    final directoryRegistrationArn = this.directoryRegistrationArn;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    return {
      if (connectorArn != null) 'ConnectorArn': connectorArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (directoryRegistrationArn != null)
        'DirectoryRegistrationArn': directoryRegistrationArn,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum ServicePrincipalNameStatus {
  creating,
  active,
  deleting,
  failed,
}

extension ServicePrincipalNameStatusValueExtension
    on ServicePrincipalNameStatus {
  String toValue() {
    switch (this) {
      case ServicePrincipalNameStatus.creating:
        return 'CREATING';
      case ServicePrincipalNameStatus.active:
        return 'ACTIVE';
      case ServicePrincipalNameStatus.deleting:
        return 'DELETING';
      case ServicePrincipalNameStatus.failed:
        return 'FAILED';
    }
  }
}

extension ServicePrincipalNameStatusFromString on String {
  ServicePrincipalNameStatus toServicePrincipalNameStatus() {
    switch (this) {
      case 'CREATING':
        return ServicePrincipalNameStatus.creating;
      case 'ACTIVE':
        return ServicePrincipalNameStatus.active;
      case 'DELETING':
        return ServicePrincipalNameStatus.deleting;
      case 'FAILED':
        return ServicePrincipalNameStatus.failed;
    }
    throw Exception('$this is not known in enum ServicePrincipalNameStatus');
  }
}

enum ServicePrincipalNameStatusReason {
  directoryAccessDenied,
  directoryNotReachable,
  directoryResourceNotFound,
  spnExistsOnDifferentAdObject,
  internalFailure,
}

extension ServicePrincipalNameStatusReasonValueExtension
    on ServicePrincipalNameStatusReason {
  String toValue() {
    switch (this) {
      case ServicePrincipalNameStatusReason.directoryAccessDenied:
        return 'DIRECTORY_ACCESS_DENIED';
      case ServicePrincipalNameStatusReason.directoryNotReachable:
        return 'DIRECTORY_NOT_REACHABLE';
      case ServicePrincipalNameStatusReason.directoryResourceNotFound:
        return 'DIRECTORY_RESOURCE_NOT_FOUND';
      case ServicePrincipalNameStatusReason.spnExistsOnDifferentAdObject:
        return 'SPN_EXISTS_ON_DIFFERENT_AD_OBJECT';
      case ServicePrincipalNameStatusReason.internalFailure:
        return 'INTERNAL_FAILURE';
    }
  }
}

extension ServicePrincipalNameStatusReasonFromString on String {
  ServicePrincipalNameStatusReason toServicePrincipalNameStatusReason() {
    switch (this) {
      case 'DIRECTORY_ACCESS_DENIED':
        return ServicePrincipalNameStatusReason.directoryAccessDenied;
      case 'DIRECTORY_NOT_REACHABLE':
        return ServicePrincipalNameStatusReason.directoryNotReachable;
      case 'DIRECTORY_RESOURCE_NOT_FOUND':
        return ServicePrincipalNameStatusReason.directoryResourceNotFound;
      case 'SPN_EXISTS_ON_DIFFERENT_AD_OBJECT':
        return ServicePrincipalNameStatusReason.spnExistsOnDifferentAdObject;
      case 'INTERNAL_FAILURE':
        return ServicePrincipalNameStatusReason.internalFailure;
    }
    throw Exception(
        '$this is not known in enum ServicePrincipalNameStatusReason');
  }
}

/// The service principal name that the connector uses to authenticate with
/// Active Directory.
class ServicePrincipalNameSummary {
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
  final String? connectorArn;

  /// The date and time that the service principal name was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration.html">CreateDirectoryRegistration</a>.
  final String? directoryRegistrationArn;

  /// The status of a service principal name.
  final ServicePrincipalNameStatus? status;

  /// Additional information for the status of a service principal name if the
  /// status is failed.
  final ServicePrincipalNameStatusReason? statusReason;

  /// Time when the service principal name was updated.
  final DateTime? updatedAt;

  ServicePrincipalNameSummary({
    this.connectorArn,
    this.createdAt,
    this.directoryRegistrationArn,
    this.status,
    this.statusReason,
    this.updatedAt,
  });

  factory ServicePrincipalNameSummary.fromJson(Map<String, dynamic> json) {
    return ServicePrincipalNameSummary(
      connectorArn: json['ConnectorArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      directoryRegistrationArn: json['DirectoryRegistrationArn'] as String?,
      status: (json['Status'] as String?)?.toServicePrincipalNameStatus(),
      statusReason: (json['StatusReason'] as String?)
          ?.toServicePrincipalNameStatusReason(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    final createdAt = this.createdAt;
    final directoryRegistrationArn = this.directoryRegistrationArn;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    return {
      if (connectorArn != null) 'ConnectorArn': connectorArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (directoryRegistrationArn != null)
        'DirectoryRegistrationArn': directoryRegistrationArn,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Information to include in the subject name and alternate subject name of the
/// certificate. The subject name can be common name, directory path, DNS as
/// common name, or left blank. You can optionally include email to the subject
/// name for user templates. If you leave the subject name blank then you must
/// set a subject alternate name. The subject alternate name (SAN) can include
/// globally unique identifier (GUID), DNS, domain DNS, email, service principal
/// name (SPN), and user principal name (UPN). You can leave the SAN blank. If
/// you leave the SAN blank, then you must set a subject name.
class SubjectNameFlagsV2 {
  /// Include the common name in the subject name.
  final bool? requireCommonName;

  /// Include the directory path in the subject name.
  final bool? requireDirectoryPath;

  /// Include the DNS as common name in the subject name.
  final bool? requireDnsAsCn;

  /// Include the subject's email in the subject name.
  final bool? requireEmail;

  /// Include the globally unique identifier (GUID) in the subject alternate name.
  final bool? sanRequireDirectoryGuid;

  /// Include the DNS in the subject alternate name.
  final bool? sanRequireDns;

  /// Include the domain DNS in the subject alternate name.
  final bool? sanRequireDomainDns;

  /// Include the subject's email in the subject alternate name.
  final bool? sanRequireEmail;

  /// Include the service principal name (SPN) in the subject alternate name.
  final bool? sanRequireSpn;

  /// Include the user principal name (UPN) in the subject alternate name.
  final bool? sanRequireUpn;

  SubjectNameFlagsV2({
    this.requireCommonName,
    this.requireDirectoryPath,
    this.requireDnsAsCn,
    this.requireEmail,
    this.sanRequireDirectoryGuid,
    this.sanRequireDns,
    this.sanRequireDomainDns,
    this.sanRequireEmail,
    this.sanRequireSpn,
    this.sanRequireUpn,
  });

  factory SubjectNameFlagsV2.fromJson(Map<String, dynamic> json) {
    return SubjectNameFlagsV2(
      requireCommonName: json['RequireCommonName'] as bool?,
      requireDirectoryPath: json['RequireDirectoryPath'] as bool?,
      requireDnsAsCn: json['RequireDnsAsCn'] as bool?,
      requireEmail: json['RequireEmail'] as bool?,
      sanRequireDirectoryGuid: json['SanRequireDirectoryGuid'] as bool?,
      sanRequireDns: json['SanRequireDns'] as bool?,
      sanRequireDomainDns: json['SanRequireDomainDns'] as bool?,
      sanRequireEmail: json['SanRequireEmail'] as bool?,
      sanRequireSpn: json['SanRequireSpn'] as bool?,
      sanRequireUpn: json['SanRequireUpn'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final requireCommonName = this.requireCommonName;
    final requireDirectoryPath = this.requireDirectoryPath;
    final requireDnsAsCn = this.requireDnsAsCn;
    final requireEmail = this.requireEmail;
    final sanRequireDirectoryGuid = this.sanRequireDirectoryGuid;
    final sanRequireDns = this.sanRequireDns;
    final sanRequireDomainDns = this.sanRequireDomainDns;
    final sanRequireEmail = this.sanRequireEmail;
    final sanRequireSpn = this.sanRequireSpn;
    final sanRequireUpn = this.sanRequireUpn;
    return {
      if (requireCommonName != null) 'RequireCommonName': requireCommonName,
      if (requireDirectoryPath != null)
        'RequireDirectoryPath': requireDirectoryPath,
      if (requireDnsAsCn != null) 'RequireDnsAsCn': requireDnsAsCn,
      if (requireEmail != null) 'RequireEmail': requireEmail,
      if (sanRequireDirectoryGuid != null)
        'SanRequireDirectoryGuid': sanRequireDirectoryGuid,
      if (sanRequireDns != null) 'SanRequireDns': sanRequireDns,
      if (sanRequireDomainDns != null)
        'SanRequireDomainDns': sanRequireDomainDns,
      if (sanRequireEmail != null) 'SanRequireEmail': sanRequireEmail,
      if (sanRequireSpn != null) 'SanRequireSpn': sanRequireSpn,
      if (sanRequireUpn != null) 'SanRequireUpn': sanRequireUpn,
    };
  }
}

/// Information to include in the subject name and alternate subject name of the
/// certificate. The subject name can be common name, directory path, DNS as
/// common name, or left blank. You can optionally include email to the subject
/// name for user templates. If you leave the subject name blank then you must
/// set a subject alternate name. The subject alternate name (SAN) can include
/// globally unique identifier (GUID), DNS, domain DNS, email, service principal
/// name (SPN), and user principal name (UPN). You can leave the SAN blank. If
/// you leave the SAN blank, then you must set a subject name.
class SubjectNameFlagsV3 {
  /// Include the common name in the subject name.
  final bool? requireCommonName;

  /// Include the directory path in the subject name.
  final bool? requireDirectoryPath;

  /// Include the DNS as common name in the subject name.
  final bool? requireDnsAsCn;

  /// Include the subject's email in the subject name.
  final bool? requireEmail;

  /// Include the globally unique identifier (GUID) in the subject alternate name.
  final bool? sanRequireDirectoryGuid;

  /// Include the DNS in the subject alternate name.
  final bool? sanRequireDns;

  /// Include the domain DNS in the subject alternate name.
  final bool? sanRequireDomainDns;

  /// Include the subject's email in the subject alternate name.
  final bool? sanRequireEmail;

  /// Include the service principal name (SPN) in the subject alternate name.
  final bool? sanRequireSpn;

  /// Include the user principal name (UPN) in the subject alternate name.
  final bool? sanRequireUpn;

  SubjectNameFlagsV3({
    this.requireCommonName,
    this.requireDirectoryPath,
    this.requireDnsAsCn,
    this.requireEmail,
    this.sanRequireDirectoryGuid,
    this.sanRequireDns,
    this.sanRequireDomainDns,
    this.sanRequireEmail,
    this.sanRequireSpn,
    this.sanRequireUpn,
  });

  factory SubjectNameFlagsV3.fromJson(Map<String, dynamic> json) {
    return SubjectNameFlagsV3(
      requireCommonName: json['RequireCommonName'] as bool?,
      requireDirectoryPath: json['RequireDirectoryPath'] as bool?,
      requireDnsAsCn: json['RequireDnsAsCn'] as bool?,
      requireEmail: json['RequireEmail'] as bool?,
      sanRequireDirectoryGuid: json['SanRequireDirectoryGuid'] as bool?,
      sanRequireDns: json['SanRequireDns'] as bool?,
      sanRequireDomainDns: json['SanRequireDomainDns'] as bool?,
      sanRequireEmail: json['SanRequireEmail'] as bool?,
      sanRequireSpn: json['SanRequireSpn'] as bool?,
      sanRequireUpn: json['SanRequireUpn'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final requireCommonName = this.requireCommonName;
    final requireDirectoryPath = this.requireDirectoryPath;
    final requireDnsAsCn = this.requireDnsAsCn;
    final requireEmail = this.requireEmail;
    final sanRequireDirectoryGuid = this.sanRequireDirectoryGuid;
    final sanRequireDns = this.sanRequireDns;
    final sanRequireDomainDns = this.sanRequireDomainDns;
    final sanRequireEmail = this.sanRequireEmail;
    final sanRequireSpn = this.sanRequireSpn;
    final sanRequireUpn = this.sanRequireUpn;
    return {
      if (requireCommonName != null) 'RequireCommonName': requireCommonName,
      if (requireDirectoryPath != null)
        'RequireDirectoryPath': requireDirectoryPath,
      if (requireDnsAsCn != null) 'RequireDnsAsCn': requireDnsAsCn,
      if (requireEmail != null) 'RequireEmail': requireEmail,
      if (sanRequireDirectoryGuid != null)
        'SanRequireDirectoryGuid': sanRequireDirectoryGuid,
      if (sanRequireDns != null) 'SanRequireDns': sanRequireDns,
      if (sanRequireDomainDns != null)
        'SanRequireDomainDns': sanRequireDomainDns,
      if (sanRequireEmail != null) 'SanRequireEmail': sanRequireEmail,
      if (sanRequireSpn != null) 'SanRequireSpn': sanRequireSpn,
      if (sanRequireUpn != null) 'SanRequireUpn': sanRequireUpn,
    };
  }
}

/// Information to include in the subject name and alternate subject name of the
/// certificate. The subject name can be common name, directory path, DNS as
/// common name, or left blank. You can optionally include email to the subject
/// name for user templates. If you leave the subject name blank then you must
/// set a subject alternate name. The subject alternate name (SAN) can include
/// globally unique identifier (GUID), DNS, domain DNS, email, service principal
/// name (SPN), and user principal name (UPN). You can leave the SAN blank. If
/// you leave the SAN blank, then you must set a subject name.
class SubjectNameFlagsV4 {
  /// Include the common name in the subject name.
  final bool? requireCommonName;

  /// Include the directory path in the subject name.
  final bool? requireDirectoryPath;

  /// Include the DNS as common name in the subject name.
  final bool? requireDnsAsCn;

  /// Include the subject's email in the subject name.
  final bool? requireEmail;

  /// Include the globally unique identifier (GUID) in the subject alternate name.
  final bool? sanRequireDirectoryGuid;

  /// Include the DNS in the subject alternate name.
  final bool? sanRequireDns;

  /// Include the domain DNS in the subject alternate name.
  final bool? sanRequireDomainDns;

  /// Include the subject's email in the subject alternate name.
  final bool? sanRequireEmail;

  /// Include the service principal name (SPN) in the subject alternate name.
  final bool? sanRequireSpn;

  /// Include the user principal name (UPN) in the subject alternate name.
  final bool? sanRequireUpn;

  SubjectNameFlagsV4({
    this.requireCommonName,
    this.requireDirectoryPath,
    this.requireDnsAsCn,
    this.requireEmail,
    this.sanRequireDirectoryGuid,
    this.sanRequireDns,
    this.sanRequireDomainDns,
    this.sanRequireEmail,
    this.sanRequireSpn,
    this.sanRequireUpn,
  });

  factory SubjectNameFlagsV4.fromJson(Map<String, dynamic> json) {
    return SubjectNameFlagsV4(
      requireCommonName: json['RequireCommonName'] as bool?,
      requireDirectoryPath: json['RequireDirectoryPath'] as bool?,
      requireDnsAsCn: json['RequireDnsAsCn'] as bool?,
      requireEmail: json['RequireEmail'] as bool?,
      sanRequireDirectoryGuid: json['SanRequireDirectoryGuid'] as bool?,
      sanRequireDns: json['SanRequireDns'] as bool?,
      sanRequireDomainDns: json['SanRequireDomainDns'] as bool?,
      sanRequireEmail: json['SanRequireEmail'] as bool?,
      sanRequireSpn: json['SanRequireSpn'] as bool?,
      sanRequireUpn: json['SanRequireUpn'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final requireCommonName = this.requireCommonName;
    final requireDirectoryPath = this.requireDirectoryPath;
    final requireDnsAsCn = this.requireDnsAsCn;
    final requireEmail = this.requireEmail;
    final sanRequireDirectoryGuid = this.sanRequireDirectoryGuid;
    final sanRequireDns = this.sanRequireDns;
    final sanRequireDomainDns = this.sanRequireDomainDns;
    final sanRequireEmail = this.sanRequireEmail;
    final sanRequireSpn = this.sanRequireSpn;
    final sanRequireUpn = this.sanRequireUpn;
    return {
      if (requireCommonName != null) 'RequireCommonName': requireCommonName,
      if (requireDirectoryPath != null)
        'RequireDirectoryPath': requireDirectoryPath,
      if (requireDnsAsCn != null) 'RequireDnsAsCn': requireDnsAsCn,
      if (requireEmail != null) 'RequireEmail': requireEmail,
      if (sanRequireDirectoryGuid != null)
        'SanRequireDirectoryGuid': sanRequireDirectoryGuid,
      if (sanRequireDns != null) 'SanRequireDns': sanRequireDns,
      if (sanRequireDomainDns != null)
        'SanRequireDomainDns': sanRequireDomainDns,
      if (sanRequireEmail != null) 'SanRequireEmail': sanRequireEmail,
      if (sanRequireSpn != null) 'SanRequireSpn': sanRequireSpn,
      if (sanRequireUpn != null) 'SanRequireUpn': sanRequireUpn,
    };
  }
}

/// An Active Directory compatible certificate template. Connectors issue
/// certificates against these templates based on the requestor's Active
/// Directory group membership.
class Template {
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  final String? arn;

  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
  final String? connectorArn;

  /// The date and time that the template was created.
  final DateTime? createdAt;

  /// Template configuration to define the information included in certificates.
  /// Define certificate validity and renewal periods, certificate request
  /// handling and enrollment options, key usage extensions, application policies,
  /// and cryptography settings.
  final TemplateDefinition? definition;

  /// Name of the templates. Template names must be unique.
  final String? name;

  /// Object identifier of a template.
  final String? objectIdentifier;

  /// The template schema version. Template schema versions can be v2, v3, or v4.
  /// The template configuration options change based on the template schema
  /// version.
  final int? policySchema;

  /// The version of the template. Template updates will increment the minor
  /// revision. Re-enrolling all certificate holders will increment the major
  /// revision.
  final TemplateRevision? revision;

  /// Status of the template. Status can be creating, active, deleting, or failed.
  final TemplateStatus? status;

  /// The date and time that the template was updated.
  final DateTime? updatedAt;

  Template({
    this.arn,
    this.connectorArn,
    this.createdAt,
    this.definition,
    this.name,
    this.objectIdentifier,
    this.policySchema,
    this.revision,
    this.status,
    this.updatedAt,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      arn: json['Arn'] as String?,
      connectorArn: json['ConnectorArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      definition: json['Definition'] != null
          ? TemplateDefinition.fromJson(
              json['Definition'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      objectIdentifier: json['ObjectIdentifier'] as String?,
      policySchema: json['PolicySchema'] as int?,
      revision: json['Revision'] != null
          ? TemplateRevision.fromJson(json['Revision'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toTemplateStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectorArn = this.connectorArn;
    final createdAt = this.createdAt;
    final definition = this.definition;
    final name = this.name;
    final objectIdentifier = this.objectIdentifier;
    final policySchema = this.policySchema;
    final revision = this.revision;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (connectorArn != null) 'ConnectorArn': connectorArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (definition != null) 'Definition': definition,
      if (name != null) 'Name': name,
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
      if (policySchema != null) 'PolicySchema': policySchema,
      if (revision != null) 'Revision': revision,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Template configuration to define the information included in certificates.
/// Define certificate validity and renewal periods, certificate request
/// handling and enrollment options, key usage extensions, application policies,
/// and cryptography settings.
class TemplateDefinition {
  /// Template configuration to define the information included in certificates.
  /// Define certificate validity and renewal periods, certificate request
  /// handling and enrollment options, key usage extensions, application policies,
  /// and cryptography settings.
  final TemplateV2? templateV2;

  /// Template configuration to define the information included in certificates.
  /// Define certificate validity and renewal periods, certificate request
  /// handling and enrollment options, key usage extensions, application policies,
  /// and cryptography settings.
  final TemplateV3? templateV3;

  /// Template configuration to define the information included in certificates.
  /// Define certificate validity and renewal periods, certificate request
  /// handling and enrollment options, key usage extensions, application policies,
  /// and cryptography settings.
  final TemplateV4? templateV4;

  TemplateDefinition({
    this.templateV2,
    this.templateV3,
    this.templateV4,
  });

  factory TemplateDefinition.fromJson(Map<String, dynamic> json) {
    return TemplateDefinition(
      templateV2: json['TemplateV2'] != null
          ? TemplateV2.fromJson(json['TemplateV2'] as Map<String, dynamic>)
          : null,
      templateV3: json['TemplateV3'] != null
          ? TemplateV3.fromJson(json['TemplateV3'] as Map<String, dynamic>)
          : null,
      templateV4: json['TemplateV4'] != null
          ? TemplateV4.fromJson(json['TemplateV4'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final templateV2 = this.templateV2;
    final templateV3 = this.templateV3;
    final templateV4 = this.templateV4;
    return {
      if (templateV2 != null) 'TemplateV2': templateV2,
      if (templateV3 != null) 'TemplateV3': templateV3,
      if (templateV4 != null) 'TemplateV4': templateV4,
    };
  }
}

/// The revision version of the template. Template updates will increment the
/// minor revision. Re-enrolling all certificate holders will increment the
/// major revision.
class TemplateRevision {
  /// The revision version of the template. Re-enrolling all certificate holders
  /// will increment the major revision.
  final int majorRevision;

  /// The revision version of the template. Re-enrolling all certificate holders
  /// will increment the major revision.
  final int minorRevision;

  TemplateRevision({
    required this.majorRevision,
    required this.minorRevision,
  });

  factory TemplateRevision.fromJson(Map<String, dynamic> json) {
    return TemplateRevision(
      majorRevision: json['MajorRevision'] as int,
      minorRevision: json['MinorRevision'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final majorRevision = this.majorRevision;
    final minorRevision = this.minorRevision;
    return {
      'MajorRevision': majorRevision,
      'MinorRevision': minorRevision,
    };
  }
}

enum TemplateStatus {
  active,
  deleting,
}

extension TemplateStatusValueExtension on TemplateStatus {
  String toValue() {
    switch (this) {
      case TemplateStatus.active:
        return 'ACTIVE';
      case TemplateStatus.deleting:
        return 'DELETING';
    }
  }
}

extension TemplateStatusFromString on String {
  TemplateStatus toTemplateStatus() {
    switch (this) {
      case 'ACTIVE':
        return TemplateStatus.active;
      case 'DELETING':
        return TemplateStatus.deleting;
    }
    throw Exception('$this is not known in enum TemplateStatus');
  }
}

/// An Active Directory compatible certificate template. Connectors issue
/// certificates against these templates based on the requestor's Active
/// Directory group membership.
class TemplateSummary {
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateTemplate.html">CreateTemplate</a>.
  final String? arn;

  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector.html">CreateConnector</a>.
  final String? connectorArn;

  /// The date and time that the template was created.
  final DateTime? createdAt;

  /// Template configuration to define the information included in certificates.
  /// Define certificate validity and renewal periods, certificate request
  /// handling and enrollment options, key usage extensions, application policies,
  /// and cryptography settings.
  final TemplateDefinition? definition;

  /// Name of the template. The template name must be unique.
  final String? name;

  /// Object identifier of a template.
  final String? objectIdentifier;

  /// The template schema version. Template schema versions can be v2, v3, or v4.
  /// The template configuration options change based on the template schema
  /// version.
  final int? policySchema;

  /// The revision version of the template. Template updates will increment the
  /// minor revision. Re-enrolling all certificate holders will increment the
  /// major revision.
  final TemplateRevision? revision;

  /// Status of the template. Status can be creating, active, deleting, or failed.
  final TemplateStatus? status;

  /// The date and time that the template was updated.
  final DateTime? updatedAt;

  TemplateSummary({
    this.arn,
    this.connectorArn,
    this.createdAt,
    this.definition,
    this.name,
    this.objectIdentifier,
    this.policySchema,
    this.revision,
    this.status,
    this.updatedAt,
  });

  factory TemplateSummary.fromJson(Map<String, dynamic> json) {
    return TemplateSummary(
      arn: json['Arn'] as String?,
      connectorArn: json['ConnectorArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      definition: json['Definition'] != null
          ? TemplateDefinition.fromJson(
              json['Definition'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      objectIdentifier: json['ObjectIdentifier'] as String?,
      policySchema: json['PolicySchema'] as int?,
      revision: json['Revision'] != null
          ? TemplateRevision.fromJson(json['Revision'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toTemplateStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectorArn = this.connectorArn;
    final createdAt = this.createdAt;
    final definition = this.definition;
    final name = this.name;
    final objectIdentifier = this.objectIdentifier;
    final policySchema = this.policySchema;
    final revision = this.revision;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (connectorArn != null) 'ConnectorArn': connectorArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (definition != null) 'Definition': definition,
      if (name != null) 'Name': name,
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
      if (policySchema != null) 'PolicySchema': policySchema,
      if (revision != null) 'Revision': revision,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// v2 template schema that uses Legacy Cryptographic Providers.
class TemplateV2 {
  /// Certificate validity describes the validity and renewal periods of a
  /// certificate.
  final CertificateValidity certificateValidity;

  /// Enrollment flags describe the enrollment settings for certificates such as
  /// using the existing private key and deleting expired or revoked certificates.
  final EnrollmentFlagsV2 enrollmentFlags;

  /// Extensions describe the key usage extensions and application policies for a
  /// template.
  final ExtensionsV2 extensions;

  /// General flags describe whether the template is used for computers or users
  /// and if the template can be used with autoenrollment.
  final GeneralFlagsV2 generalFlags;

  /// Private key attributes allow you to specify the minimal key length, key
  /// spec, and cryptographic providers for the private key of a certificate for
  /// v2 templates. V2 templates allow you to use Legacy Cryptographic Service
  /// Providers.
  final PrivateKeyAttributesV2 privateKeyAttributes;

  /// Private key flags for v2 templates specify the client compatibility, if the
  /// private key can be exported, and if user input is required when using a
  /// private key.
  final PrivateKeyFlagsV2 privateKeyFlags;

  /// Subject name flags describe the subject name and subject alternate name that
  /// is included in a certificate.
  final SubjectNameFlagsV2 subjectNameFlags;

  /// List of templates in Active Directory that are superseded by this template.
  final List<String>? supersededTemplates;

  TemplateV2({
    required this.certificateValidity,
    required this.enrollmentFlags,
    required this.extensions,
    required this.generalFlags,
    required this.privateKeyAttributes,
    required this.privateKeyFlags,
    required this.subjectNameFlags,
    this.supersededTemplates,
  });

  factory TemplateV2.fromJson(Map<String, dynamic> json) {
    return TemplateV2(
      certificateValidity: CertificateValidity.fromJson(
          json['CertificateValidity'] as Map<String, dynamic>),
      enrollmentFlags: EnrollmentFlagsV2.fromJson(
          json['EnrollmentFlags'] as Map<String, dynamic>),
      extensions:
          ExtensionsV2.fromJson(json['Extensions'] as Map<String, dynamic>),
      generalFlags:
          GeneralFlagsV2.fromJson(json['GeneralFlags'] as Map<String, dynamic>),
      privateKeyAttributes: PrivateKeyAttributesV2.fromJson(
          json['PrivateKeyAttributes'] as Map<String, dynamic>),
      privateKeyFlags: PrivateKeyFlagsV2.fromJson(
          json['PrivateKeyFlags'] as Map<String, dynamic>),
      subjectNameFlags: SubjectNameFlagsV2.fromJson(
          json['SubjectNameFlags'] as Map<String, dynamic>),
      supersededTemplates: (json['SupersededTemplates'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateValidity = this.certificateValidity;
    final enrollmentFlags = this.enrollmentFlags;
    final extensions = this.extensions;
    final generalFlags = this.generalFlags;
    final privateKeyAttributes = this.privateKeyAttributes;
    final privateKeyFlags = this.privateKeyFlags;
    final subjectNameFlags = this.subjectNameFlags;
    final supersededTemplates = this.supersededTemplates;
    return {
      'CertificateValidity': certificateValidity,
      'EnrollmentFlags': enrollmentFlags,
      'Extensions': extensions,
      'GeneralFlags': generalFlags,
      'PrivateKeyAttributes': privateKeyAttributes,
      'PrivateKeyFlags': privateKeyFlags,
      'SubjectNameFlags': subjectNameFlags,
      if (supersededTemplates != null)
        'SupersededTemplates': supersededTemplates,
    };
  }
}

/// v3 template schema that uses Key Storage Providers.
class TemplateV3 {
  /// Certificate validity describes the validity and renewal periods of a
  /// certificate.
  final CertificateValidity certificateValidity;

  /// Enrollment flags describe the enrollment settings for certificates such as
  /// using the existing private key and deleting expired or revoked certificates.
  final EnrollmentFlagsV3 enrollmentFlags;

  /// Extensions describe the key usage extensions and application policies for a
  /// template.
  final ExtensionsV3 extensions;

  /// General flags describe whether the template is used for computers or users
  /// and if the template can be used with autoenrollment.
  final GeneralFlagsV3 generalFlags;

  /// Specifies the hash algorithm used to hash the private key.
  final HashAlgorithm hashAlgorithm;

  /// Private key attributes allow you to specify the algorithm, minimal key
  /// length, key spec, key usage, and cryptographic providers for the private key
  /// of a certificate for v3 templates. V3 templates allow you to use Key Storage
  /// Providers.
  final PrivateKeyAttributesV3 privateKeyAttributes;

  /// Private key flags for v3 templates specify the client compatibility, if the
  /// private key can be exported, if user input is required when using a private
  /// key, and if an alternate signature algorithm should be used.
  final PrivateKeyFlagsV3 privateKeyFlags;

  /// Subject name flags describe the subject name and subject alternate name that
  /// is included in a certificate.
  final SubjectNameFlagsV3 subjectNameFlags;

  /// List of templates in Active Directory that are superseded by this template.
  final List<String>? supersededTemplates;

  TemplateV3({
    required this.certificateValidity,
    required this.enrollmentFlags,
    required this.extensions,
    required this.generalFlags,
    required this.hashAlgorithm,
    required this.privateKeyAttributes,
    required this.privateKeyFlags,
    required this.subjectNameFlags,
    this.supersededTemplates,
  });

  factory TemplateV3.fromJson(Map<String, dynamic> json) {
    return TemplateV3(
      certificateValidity: CertificateValidity.fromJson(
          json['CertificateValidity'] as Map<String, dynamic>),
      enrollmentFlags: EnrollmentFlagsV3.fromJson(
          json['EnrollmentFlags'] as Map<String, dynamic>),
      extensions:
          ExtensionsV3.fromJson(json['Extensions'] as Map<String, dynamic>),
      generalFlags:
          GeneralFlagsV3.fromJson(json['GeneralFlags'] as Map<String, dynamic>),
      hashAlgorithm: (json['HashAlgorithm'] as String).toHashAlgorithm(),
      privateKeyAttributes: PrivateKeyAttributesV3.fromJson(
          json['PrivateKeyAttributes'] as Map<String, dynamic>),
      privateKeyFlags: PrivateKeyFlagsV3.fromJson(
          json['PrivateKeyFlags'] as Map<String, dynamic>),
      subjectNameFlags: SubjectNameFlagsV3.fromJson(
          json['SubjectNameFlags'] as Map<String, dynamic>),
      supersededTemplates: (json['SupersededTemplates'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateValidity = this.certificateValidity;
    final enrollmentFlags = this.enrollmentFlags;
    final extensions = this.extensions;
    final generalFlags = this.generalFlags;
    final hashAlgorithm = this.hashAlgorithm;
    final privateKeyAttributes = this.privateKeyAttributes;
    final privateKeyFlags = this.privateKeyFlags;
    final subjectNameFlags = this.subjectNameFlags;
    final supersededTemplates = this.supersededTemplates;
    return {
      'CertificateValidity': certificateValidity,
      'EnrollmentFlags': enrollmentFlags,
      'Extensions': extensions,
      'GeneralFlags': generalFlags,
      'HashAlgorithm': hashAlgorithm.toValue(),
      'PrivateKeyAttributes': privateKeyAttributes,
      'PrivateKeyFlags': privateKeyFlags,
      'SubjectNameFlags': subjectNameFlags,
      if (supersededTemplates != null)
        'SupersededTemplates': supersededTemplates,
    };
  }
}

/// v4 template schema that can use either Legacy Cryptographic Providers or Key
/// Storage Providers.
class TemplateV4 {
  /// Certificate validity describes the validity and renewal periods of a
  /// certificate.
  final CertificateValidity certificateValidity;

  /// Enrollment flags describe the enrollment settings for certificates using the
  /// existing private key and deleting expired or revoked certificates.
  final EnrollmentFlagsV4 enrollmentFlags;

  /// Extensions describe the key usage extensions and application policies for a
  /// template.
  final ExtensionsV4 extensions;

  /// General flags describe whether the template is used for computers or users
  /// and if the template can be used with autoenrollment.
  final GeneralFlagsV4 generalFlags;

  /// Private key attributes allow you to specify the minimal key length, key
  /// spec, key usage, and cryptographic providers for the private key of a
  /// certificate for v4 templates. V4 templates allow you to use either Key
  /// Storage Providers or Legacy Cryptographic Service Providers. You specify the
  /// cryptography provider category in private key flags.
  final PrivateKeyAttributesV4 privateKeyAttributes;

  /// Private key flags for v4 templates specify the client compatibility, if the
  /// private key can be exported, if user input is required when using a private
  /// key, if an alternate signature algorithm should be used, and if certificates
  /// are renewed using the same private key.
  final PrivateKeyFlagsV4 privateKeyFlags;

  /// Subject name flags describe the subject name and subject alternate name that
  /// is included in a certificate.
  final SubjectNameFlagsV4 subjectNameFlags;

  /// Specifies the hash algorithm used to hash the private key. Hash algorithm
  /// can only be specified when using Key Storage Providers.
  final HashAlgorithm? hashAlgorithm;

  /// List of templates in Active Directory that are superseded by this template.
  final List<String>? supersededTemplates;

  TemplateV4({
    required this.certificateValidity,
    required this.enrollmentFlags,
    required this.extensions,
    required this.generalFlags,
    required this.privateKeyAttributes,
    required this.privateKeyFlags,
    required this.subjectNameFlags,
    this.hashAlgorithm,
    this.supersededTemplates,
  });

  factory TemplateV4.fromJson(Map<String, dynamic> json) {
    return TemplateV4(
      certificateValidity: CertificateValidity.fromJson(
          json['CertificateValidity'] as Map<String, dynamic>),
      enrollmentFlags: EnrollmentFlagsV4.fromJson(
          json['EnrollmentFlags'] as Map<String, dynamic>),
      extensions:
          ExtensionsV4.fromJson(json['Extensions'] as Map<String, dynamic>),
      generalFlags:
          GeneralFlagsV4.fromJson(json['GeneralFlags'] as Map<String, dynamic>),
      privateKeyAttributes: PrivateKeyAttributesV4.fromJson(
          json['PrivateKeyAttributes'] as Map<String, dynamic>),
      privateKeyFlags: PrivateKeyFlagsV4.fromJson(
          json['PrivateKeyFlags'] as Map<String, dynamic>),
      subjectNameFlags: SubjectNameFlagsV4.fromJson(
          json['SubjectNameFlags'] as Map<String, dynamic>),
      hashAlgorithm: (json['HashAlgorithm'] as String?)?.toHashAlgorithm(),
      supersededTemplates: (json['SupersededTemplates'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateValidity = this.certificateValidity;
    final enrollmentFlags = this.enrollmentFlags;
    final extensions = this.extensions;
    final generalFlags = this.generalFlags;
    final privateKeyAttributes = this.privateKeyAttributes;
    final privateKeyFlags = this.privateKeyFlags;
    final subjectNameFlags = this.subjectNameFlags;
    final hashAlgorithm = this.hashAlgorithm;
    final supersededTemplates = this.supersededTemplates;
    return {
      'CertificateValidity': certificateValidity,
      'EnrollmentFlags': enrollmentFlags,
      'Extensions': extensions,
      'GeneralFlags': generalFlags,
      'PrivateKeyAttributes': privateKeyAttributes,
      'PrivateKeyFlags': privateKeyFlags,
      'SubjectNameFlags': subjectNameFlags,
      if (hashAlgorithm != null) 'HashAlgorithm': hashAlgorithm.toValue(),
      if (supersededTemplates != null)
        'SupersededTemplates': supersededTemplates,
    };
  }
}

/// Information describing the end of the validity period of the certificate.
/// This parameter sets the “Not After” date for the certificate. Certificate
/// validity is the period of time during which a certificate is valid. Validity
/// can be expressed as an explicit date and time when the certificate expires,
/// or as a span of time after issuance, stated in hours, days, months, or
/// years. For more information, see Validity in RFC 5280. This value is
/// unaffected when ValidityNotBefore is also specified. For example, if
/// Validity is set to 20 days in the future, the certificate will expire 20
/// days from issuance time regardless of the ValidityNotBefore value.
class ValidityPeriod {
  /// The numeric value for the validity period.
  final int period;

  /// The unit of time. You can select hours, days, weeks, months, and years.
  final ValidityPeriodType periodType;

  ValidityPeriod({
    required this.period,
    required this.periodType,
  });

  factory ValidityPeriod.fromJson(Map<String, dynamic> json) {
    return ValidityPeriod(
      period: json['Period'] as int,
      periodType: (json['PeriodType'] as String).toValidityPeriodType(),
    );
  }

  Map<String, dynamic> toJson() {
    final period = this.period;
    final periodType = this.periodType;
    return {
      'Period': period,
      'PeriodType': periodType.toValue(),
    };
  }
}

enum ValidityPeriodType {
  hours,
  days,
  weeks,
  months,
  years,
}

extension ValidityPeriodTypeValueExtension on ValidityPeriodType {
  String toValue() {
    switch (this) {
      case ValidityPeriodType.hours:
        return 'HOURS';
      case ValidityPeriodType.days:
        return 'DAYS';
      case ValidityPeriodType.weeks:
        return 'WEEKS';
      case ValidityPeriodType.months:
        return 'MONTHS';
      case ValidityPeriodType.years:
        return 'YEARS';
    }
  }
}

extension ValidityPeriodTypeFromString on String {
  ValidityPeriodType toValidityPeriodType() {
    switch (this) {
      case 'HOURS':
        return ValidityPeriodType.hours;
      case 'DAYS':
        return ValidityPeriodType.days;
      case 'WEEKS':
        return ValidityPeriodType.weeks;
      case 'MONTHS':
        return ValidityPeriodType.months;
      case 'YEARS':
        return ValidityPeriodType.years;
    }
    throw Exception('$this is not known in enum ValidityPeriodType');
  }
}

/// Information about your VPC and security groups used with the connector.
class VpcInformation {
  /// The security groups used with the connector. You can use a maximum of 4
  /// security groups with a connector.
  final List<String> securityGroupIds;

  VpcInformation({
    required this.securityGroupIds,
  });

  factory VpcInformation.fromJson(Map<String, dynamic> json) {
    return VpcInformation(
      securityGroupIds: (json['SecurityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    return {
      'SecurityGroupIds': securityGroupIds,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
