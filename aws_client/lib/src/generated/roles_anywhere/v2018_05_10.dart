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

/// Identity and Access Management Roles Anywhere provides a secure way for your
/// workloads such as servers, containers, and applications that run outside of
/// Amazon Web Services to obtain temporary Amazon Web Services credentials.
/// Your workloads can use the same IAM policies and roles you have for native
/// Amazon Web Services applications to access Amazon Web Services resources.
/// Using IAM Roles Anywhere eliminates the need to manage long-term credentials
/// for workloads running outside of Amazon Web Services.
///
/// To use IAM Roles Anywhere, your workloads must use X.509 certificates issued
/// by their certificate authority (CA). You register the CA with IAM Roles
/// Anywhere as a trust anchor to establish trust between your public key
/// infrastructure (PKI) and IAM Roles Anywhere. If you don't manage your own
/// PKI system, you can use Private Certificate Authority to create a CA and
/// then use that to establish trust with IAM Roles Anywhere.
///
/// This guide describes the IAM Roles Anywhere operations that you can call
/// programmatically. For more information about IAM Roles Anywhere, see the <a
/// href="https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html">IAM
/// Roles Anywhere User Guide</a>.
class IamRolesAnywhere {
  final _s.RestJsonProtocol _protocol;
  IamRolesAnywhere({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rolesanywhere',
            signingName: 'rolesanywhere',
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

  /// Creates a <i>profile</i>, a list of the roles that Roles Anywhere service
  /// is trusted to assume. You use profiles to intersect permissions with IAM
  /// managed policies.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:CreateProfile</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the profile.
  ///
  /// Parameter [roleArns] :
  /// A list of IAM roles that this profile can assume in a temporary credential
  /// request.
  ///
  /// Parameter [durationSeconds] :
  /// Used to determine how long sessions vended using this profile are valid
  /// for. See the <code>Expiration</code> section of the <a
  /// href="https://docs.aws.amazon.com/rolesanywhere/latest/userguide/authentication-create-session.html#credentials-object">CreateSession
  /// API documentation</a> page for more details. In requests, if this value is
  /// not provided, the default value will be 3600.
  ///
  /// Parameter [enabled] :
  /// Specifies whether the profile is enabled.
  ///
  /// Parameter [managedPolicyArns] :
  /// A list of managed policy ARNs that apply to the vended session
  /// credentials.
  ///
  /// Parameter [requireInstanceProperties] :
  /// Specifies whether instance properties are required in temporary credential
  /// requests with this profile.
  ///
  /// Parameter [sessionPolicy] :
  /// A session policy that applies to the trust boundary of the vended session
  /// credentials.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the profile.
  Future<ProfileDetailResponse> createProfile({
    required String name,
    required List<String> roleArns,
    int? durationSeconds,
    bool? enabled,
    List<String>? managedPolicyArns,
    bool? requireInstanceProperties,
    String? sessionPolicy,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      43200,
    );
    final $payload = <String, dynamic>{
      'name': name,
      'roleArns': roleArns,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      if (enabled != null) 'enabled': enabled,
      if (managedPolicyArns != null) 'managedPolicyArns': managedPolicyArns,
      if (requireInstanceProperties != null)
        'requireInstanceProperties': requireInstanceProperties,
      if (sessionPolicy != null) 'sessionPolicy': sessionPolicy,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/profiles',
      exceptionFnMap: _exceptionFns,
    );
    return ProfileDetailResponse.fromJson(response);
  }

  /// Creates a trust anchor to establish trust between IAM Roles Anywhere and
  /// your certificate authority (CA). You can define a trust anchor as a
  /// reference to an Private Certificate Authority (Private CA) or by uploading
  /// a CA certificate. Your Amazon Web Services workloads can authenticate with
  /// the trust anchor using certificates issued by the CA in exchange for
  /// temporary Amazon Web Services credentials.
  ///
  /// <b>Required permissions: </b>
  /// <code>rolesanywhere:CreateTrustAnchor</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the trust anchor.
  ///
  /// Parameter [source] :
  /// The trust anchor type and its related certificate data.
  ///
  /// Parameter [enabled] :
  /// Specifies whether the trust anchor is enabled.
  ///
  /// Parameter [notificationSettings] :
  /// A list of notification settings to be associated to the trust anchor.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the trust anchor.
  Future<TrustAnchorDetailResponse> createTrustAnchor({
    required String name,
    required Source source,
    bool? enabled,
    List<NotificationSetting>? notificationSettings,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'source': source,
      if (enabled != null) 'enabled': enabled,
      if (notificationSettings != null)
        'notificationSettings': notificationSettings,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/trustanchors',
      exceptionFnMap: _exceptionFns,
    );
    return TrustAnchorDetailResponse.fromJson(response);
  }

  /// Delete an entry from the attribute mapping rules enforced by a given
  /// profile.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [certificateField] :
  /// Fields (x509Subject, x509Issuer and x509SAN) within X.509 certificates.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile.
  ///
  /// Parameter [specifiers] :
  /// A list of specifiers of a certificate field; for example, CN, OU, UID from
  /// a Subject.
  Future<DeleteAttributeMappingResponse> deleteAttributeMapping({
    required CertificateField certificateField,
    required String profileId,
    List<String>? specifiers,
  }) async {
    final $query = <String, List<String>>{
      'certificateField': [certificateField.toValue()],
      if (specifiers != null) 'specifiers': specifiers,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/profiles/${Uri.encodeComponent(profileId)}/mappings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAttributeMappingResponse.fromJson(response);
  }

  /// Deletes a certificate revocation list (CRL).
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:DeleteCrl</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [crlId] :
  /// The unique identifier of the certificate revocation list (CRL).
  Future<CrlDetailResponse> deleteCrl({
    required String crlId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/crl/${Uri.encodeComponent(crlId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CrlDetailResponse.fromJson(response);
  }

  /// Deletes a profile.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:DeleteProfile</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile.
  Future<ProfileDetailResponse> deleteProfile({
    required String profileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/profile/${Uri.encodeComponent(profileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ProfileDetailResponse.fromJson(response);
  }

  /// Deletes a trust anchor.
  ///
  /// <b>Required permissions: </b>
  /// <code>rolesanywhere:DeleteTrustAnchor</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [trustAnchorId] :
  /// The unique identifier of the trust anchor.
  Future<TrustAnchorDetailResponse> deleteTrustAnchor({
    required String trustAnchorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/trustanchor/${Uri.encodeComponent(trustAnchorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return TrustAnchorDetailResponse.fromJson(response);
  }

  /// Disables a certificate revocation list (CRL).
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:DisableCrl</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [crlId] :
  /// The unique identifier of the certificate revocation list (CRL).
  Future<CrlDetailResponse> disableCrl({
    required String crlId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/crl/${Uri.encodeComponent(crlId)}/disable',
      exceptionFnMap: _exceptionFns,
    );
    return CrlDetailResponse.fromJson(response);
  }

  /// Disables a profile. When disabled, temporary credential requests with this
  /// profile fail.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:DisableProfile</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile.
  Future<ProfileDetailResponse> disableProfile({
    required String profileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/profile/${Uri.encodeComponent(profileId)}/disable',
      exceptionFnMap: _exceptionFns,
    );
    return ProfileDetailResponse.fromJson(response);
  }

  /// Disables a trust anchor. When disabled, temporary credential requests
  /// specifying this trust anchor are unauthorized.
  ///
  /// <b>Required permissions: </b>
  /// <code>rolesanywhere:DisableTrustAnchor</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [trustAnchorId] :
  /// The unique identifier of the trust anchor.
  Future<TrustAnchorDetailResponse> disableTrustAnchor({
    required String trustAnchorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/trustanchor/${Uri.encodeComponent(trustAnchorId)}/disable',
      exceptionFnMap: _exceptionFns,
    );
    return TrustAnchorDetailResponse.fromJson(response);
  }

  /// Enables a certificate revocation list (CRL). When enabled, certificates
  /// stored in the CRL are unauthorized to receive session credentials.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:EnableCrl</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [crlId] :
  /// The unique identifier of the certificate revocation list (CRL).
  Future<CrlDetailResponse> enableCrl({
    required String crlId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/crl/${Uri.encodeComponent(crlId)}/enable',
      exceptionFnMap: _exceptionFns,
    );
    return CrlDetailResponse.fromJson(response);
  }

  /// Enables temporary credential requests for a profile.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:EnableProfile</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile.
  Future<ProfileDetailResponse> enableProfile({
    required String profileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/profile/${Uri.encodeComponent(profileId)}/enable',
      exceptionFnMap: _exceptionFns,
    );
    return ProfileDetailResponse.fromJson(response);
  }

  /// Enables a trust anchor. When enabled, certificates in the trust anchor
  /// chain are authorized for trust validation.
  ///
  /// <b>Required permissions: </b>
  /// <code>rolesanywhere:EnableTrustAnchor</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [trustAnchorId] :
  /// The unique identifier of the trust anchor.
  Future<TrustAnchorDetailResponse> enableTrustAnchor({
    required String trustAnchorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/trustanchor/${Uri.encodeComponent(trustAnchorId)}/enable',
      exceptionFnMap: _exceptionFns,
    );
    return TrustAnchorDetailResponse.fromJson(response);
  }

  /// Gets a certificate revocation list (CRL).
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:GetCrl</code>.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [crlId] :
  /// The unique identifier of the certificate revocation list (CRL).
  Future<CrlDetailResponse> getCrl({
    required String crlId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/crl/${Uri.encodeComponent(crlId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CrlDetailResponse.fromJson(response);
  }

  /// Gets a profile.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:GetProfile</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile.
  Future<ProfileDetailResponse> getProfile({
    required String profileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/profile/${Uri.encodeComponent(profileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ProfileDetailResponse.fromJson(response);
  }

  /// Gets a <i>subject</i>, which associates a certificate identity with
  /// authentication attempts. The subject stores auditing information such as
  /// the status of the last authentication attempt, the certificate data used
  /// in the attempt, and the last time the associated identity attempted
  /// authentication.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:GetSubject</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [subjectId] :
  /// The unique identifier of the subject.
  Future<SubjectDetailResponse> getSubject({
    required String subjectId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/subject/${Uri.encodeComponent(subjectId)}',
      exceptionFnMap: _exceptionFns,
    );
    return SubjectDetailResponse.fromJson(response);
  }

  /// Gets a trust anchor.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:GetTrustAnchor</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [trustAnchorId] :
  /// The unique identifier of the trust anchor.
  Future<TrustAnchorDetailResponse> getTrustAnchor({
    required String trustAnchorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/trustanchor/${Uri.encodeComponent(trustAnchorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return TrustAnchorDetailResponse.fromJson(response);
  }

  /// Imports the certificate revocation list (CRL). A CRL is a list of
  /// certificates that have been revoked by the issuing certificate Authority
  /// (CA).In order to be properly imported, a CRL must be in PEM format. IAM
  /// Roles Anywhere validates against the CRL before issuing credentials.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:ImportCrl</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [crlData] :
  /// The x509 v3 specified certificate revocation list (CRL).
  ///
  /// Parameter [name] :
  /// The name of the certificate revocation list (CRL).
  ///
  /// Parameter [trustAnchorArn] :
  /// The ARN of the TrustAnchor the certificate revocation list (CRL) will
  /// provide revocation for.
  ///
  /// Parameter [enabled] :
  /// Specifies whether the certificate revocation list (CRL) is enabled.
  ///
  /// Parameter [tags] :
  /// A list of tags to attach to the certificate revocation list (CRL).
  Future<CrlDetailResponse> importCrl({
    required Uint8List crlData,
    required String name,
    required String trustAnchorArn,
    bool? enabled,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'crlData': base64Encode(crlData),
      'name': name,
      'trustAnchorArn': trustAnchorArn,
      if (enabled != null) 'enabled': enabled,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/crls',
      exceptionFnMap: _exceptionFns,
    );
    return CrlDetailResponse.fromJson(response);
  }

  /// Lists all certificate revocation lists (CRL) in the authenticated account
  /// and Amazon Web Services Region.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:ListCrls</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where the output should continue from, if a
  /// previous request did not show all results. To get the next results, make
  /// the request again with this value.
  ///
  /// Parameter [pageSize] :
  /// The number of resources in the paginated list.
  Future<ListCrlsResponse> listCrls({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/crls',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCrlsResponse.fromJson(response);
  }

  /// Lists all profiles in the authenticated account and Amazon Web Services
  /// Region.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:ListProfiles</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where the output should continue from, if a
  /// previous request did not show all results. To get the next results, make
  /// the request again with this value.
  ///
  /// Parameter [pageSize] :
  /// The number of resources in the paginated list.
  Future<ListProfilesResponse> listProfiles({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfilesResponse.fromJson(response);
  }

  /// Lists the subjects in the authenticated account and Amazon Web Services
  /// Region.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:ListSubjects</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where the output should continue from, if a
  /// previous request did not show all results. To get the next results, make
  /// the request again with this value.
  ///
  /// Parameter [pageSize] :
  /// The number of resources in the paginated list.
  Future<ListSubjectsResponse> listSubjects({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/subjects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubjectsResponse.fromJson(response);
  }

  /// Lists the tags attached to the resource.
  ///
  /// <b>Required permissions: </b>
  /// <code>rolesanywhere:ListTagsForResource</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ListTagsForResource',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists the trust anchors in the authenticated account and Amazon Web
  /// Services Region.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:ListTrustAnchors</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where the output should continue from, if a
  /// previous request did not show all results. To get the next results, make
  /// the request again with this value.
  ///
  /// Parameter [pageSize] :
  /// The number of resources in the paginated list.
  Future<ListTrustAnchorsResponse> listTrustAnchors({
    String? nextToken,
    int? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/trustanchors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrustAnchorsResponse.fromJson(response);
  }

  /// Put an entry in the attribute mapping rules that will be enforced by a
  /// given profile. A mapping specifies a certificate field and one or more
  /// specifiers that have contextual meanings.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [certificateField] :
  /// Fields (x509Subject, x509Issuer and x509SAN) within X.509 certificates.
  ///
  /// Parameter [mappingRules] :
  /// A list of mapping entries for every supported specifier or sub-field.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile.
  Future<PutAttributeMappingResponse> putAttributeMapping({
    required CertificateField certificateField,
    required List<MappingRule> mappingRules,
    required String profileId,
  }) async {
    final $payload = <String, dynamic>{
      'certificateField': certificateField.toValue(),
      'mappingRules': mappingRules,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/profiles/${Uri.encodeComponent(profileId)}/mappings',
      exceptionFnMap: _exceptionFns,
    );
    return PutAttributeMappingResponse.fromJson(response);
  }

  /// Attaches a list of <i>notification settings</i> to a trust anchor.
  ///
  /// A notification setting includes information such as event name, threshold,
  /// status of the notification setting, and the channel to notify.
  ///
  /// <b>Required permissions: </b>
  /// <code>rolesanywhere:PutNotificationSettings</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [notificationSettings] :
  /// A list of notification settings to be associated to the trust anchor.
  ///
  /// Parameter [trustAnchorId] :
  /// The unique identifier of the trust anchor.
  Future<PutNotificationSettingsResponse> putNotificationSettings({
    required List<NotificationSetting> notificationSettings,
    required String trustAnchorId,
  }) async {
    final $payload = <String, dynamic>{
      'notificationSettings': notificationSettings,
      'trustAnchorId': trustAnchorId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/put-notifications-settings',
      exceptionFnMap: _exceptionFns,
    );
    return PutNotificationSettingsResponse.fromJson(response);
  }

  /// Resets the <i>custom notification setting</i> to IAM Roles Anywhere
  /// default setting.
  ///
  /// <b>Required permissions: </b>
  /// <code>rolesanywhere:ResetNotificationSettings</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [notificationSettingKeys] :
  /// A list of notification setting keys to reset. A notification setting key
  /// includes the event and the channel.
  ///
  /// Parameter [trustAnchorId] :
  /// The unique identifier of the trust anchor.
  Future<ResetNotificationSettingsResponse> resetNotificationSettings({
    required List<NotificationSettingKey> notificationSettingKeys,
    required String trustAnchorId,
  }) async {
    final $payload = <String, dynamic>{
      'notificationSettingKeys': notificationSettingKeys,
      'trustAnchorId': trustAnchorId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/reset-notifications-settings',
      exceptionFnMap: _exceptionFns,
    );
    return ResetNotificationSettingsResponse.fromJson(response);
  }

  /// Attaches tags to a resource.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:TagResource</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from the resource.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:UntagResource</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys. Tag keys are the unique identifiers of tags.
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
      requestUri: '/UntagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the certificate revocation list (CRL). A CRL is a list of
  /// certificates that have been revoked by the issuing certificate authority
  /// (CA). IAM Roles Anywhere validates against the CRL before issuing
  /// credentials.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:UpdateCrl</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [crlId] :
  /// The unique identifier of the certificate revocation list (CRL).
  ///
  /// Parameter [crlData] :
  /// The x509 v3 specified certificate revocation list (CRL).
  ///
  /// Parameter [name] :
  /// The name of the Crl.
  Future<CrlDetailResponse> updateCrl({
    required String crlId,
    Uint8List? crlData,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (crlData != null) 'crlData': base64Encode(crlData),
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/crl/${Uri.encodeComponent(crlId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CrlDetailResponse.fromJson(response);
  }

  /// Updates a <i>profile</i>, a list of the roles that IAM Roles Anywhere
  /// service is trusted to assume. You use profiles to intersect permissions
  /// with IAM managed policies.
  ///
  /// <b>Required permissions: </b> <code>rolesanywhere:UpdateProfile</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile.
  ///
  /// Parameter [durationSeconds] :
  /// Used to determine how long sessions vended using this profile are valid
  /// for. See the <code>Expiration</code> section of the <a
  /// href="https://docs.aws.amazon.com/rolesanywhere/latest/userguide/authentication-create-session.html#credentials-object">CreateSession
  /// API documentation</a> page for more details. In requests, if this value is
  /// not provided, the default value will be 3600.
  ///
  /// Parameter [managedPolicyArns] :
  /// A list of managed policy ARNs that apply to the vended session
  /// credentials.
  ///
  /// Parameter [name] :
  /// The name of the profile.
  ///
  /// Parameter [roleArns] :
  /// A list of IAM roles that this profile can assume in a temporary credential
  /// request.
  ///
  /// Parameter [sessionPolicy] :
  /// A session policy that applies to the trust boundary of the vended session
  /// credentials.
  Future<ProfileDetailResponse> updateProfile({
    required String profileId,
    int? durationSeconds,
    List<String>? managedPolicyArns,
    String? name,
    List<String>? roleArns,
    String? sessionPolicy,
  }) async {
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      43200,
    );
    final $payload = <String, dynamic>{
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      if (managedPolicyArns != null) 'managedPolicyArns': managedPolicyArns,
      if (name != null) 'name': name,
      if (roleArns != null) 'roleArns': roleArns,
      if (sessionPolicy != null) 'sessionPolicy': sessionPolicy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/profile/${Uri.encodeComponent(profileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ProfileDetailResponse.fromJson(response);
  }

  /// Updates a trust anchor. You establish trust between IAM Roles Anywhere and
  /// your certificate authority (CA) by configuring a trust anchor. You can
  /// define a trust anchor as a reference to an Private Certificate Authority
  /// (Private CA) or by uploading a CA certificate. Your Amazon Web Services
  /// workloads can authenticate with the trust anchor using certificates issued
  /// by the CA in exchange for temporary Amazon Web Services credentials.
  ///
  /// <b>Required permissions: </b>
  /// <code>rolesanywhere:UpdateTrustAnchor</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [trustAnchorId] :
  /// The unique identifier of the trust anchor.
  ///
  /// Parameter [name] :
  /// The name of the trust anchor.
  ///
  /// Parameter [source] :
  /// The trust anchor type and its related certificate data.
  Future<TrustAnchorDetailResponse> updateTrustAnchor({
    required String trustAnchorId,
    String? name,
    Source? source,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'name': name,
      if (source != null) 'source': source,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/trustanchor/${Uri.encodeComponent(trustAnchorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return TrustAnchorDetailResponse.fromJson(response);
  }
}

/// A mapping applied to the authenticating end-entity certificate.
class AttributeMapping {
  /// Fields (x509Subject, x509Issuer and x509SAN) within X.509 certificates.
  final CertificateField? certificateField;

  /// A list of mapping entries for every supported specifier or sub-field.
  final List<MappingRule>? mappingRules;

  AttributeMapping({
    this.certificateField,
    this.mappingRules,
  });

  factory AttributeMapping.fromJson(Map<String, dynamic> json) {
    return AttributeMapping(
      certificateField:
          (json['certificateField'] as String?)?.toCertificateField(),
      mappingRules: (json['mappingRules'] as List?)
          ?.whereNotNull()
          .map((e) => MappingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateField = this.certificateField;
    final mappingRules = this.mappingRules;
    return {
      if (certificateField != null)
        'certificateField': certificateField.toValue(),
      if (mappingRules != null) 'mappingRules': mappingRules,
    };
  }
}

enum CertificateField {
  x509Subject,
  x509Issuer,
  x509san,
}

extension CertificateFieldValueExtension on CertificateField {
  String toValue() {
    switch (this) {
      case CertificateField.x509Subject:
        return 'x509Subject';
      case CertificateField.x509Issuer:
        return 'x509Issuer';
      case CertificateField.x509san:
        return 'x509SAN';
    }
  }
}

extension CertificateFieldFromString on String {
  CertificateField toCertificateField() {
    switch (this) {
      case 'x509Subject':
        return CertificateField.x509Subject;
      case 'x509Issuer':
        return CertificateField.x509Issuer;
      case 'x509SAN':
        return CertificateField.x509san;
    }
    throw Exception('$this is not known in enum CertificateField');
  }
}

/// A record of a presented X509 credential from a temporary credential request.
class CredentialSummary {
  /// Indicates whether the credential is enabled.
  final bool? enabled;

  /// Indicates whether the temporary credential request was successful.
  final bool? failed;

  /// The fully qualified domain name of the issuing certificate for the presented
  /// end-entity certificate.
  final String? issuer;

  /// The ISO-8601 time stamp of when the certificate was last used in a temporary
  /// credential request.
  final DateTime? seenAt;

  /// The serial number of the certificate.
  final String? serialNumber;

  /// The PEM-encoded data of the certificate.
  final String? x509CertificateData;

  CredentialSummary({
    this.enabled,
    this.failed,
    this.issuer,
    this.seenAt,
    this.serialNumber,
    this.x509CertificateData,
  });

  factory CredentialSummary.fromJson(Map<String, dynamic> json) {
    return CredentialSummary(
      enabled: json['enabled'] as bool?,
      failed: json['failed'] as bool?,
      issuer: json['issuer'] as String?,
      seenAt: timeStampFromJson(json['seenAt']),
      serialNumber: json['serialNumber'] as String?,
      x509CertificateData: json['x509CertificateData'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final failed = this.failed;
    final issuer = this.issuer;
    final seenAt = this.seenAt;
    final serialNumber = this.serialNumber;
    final x509CertificateData = this.x509CertificateData;
    return {
      if (enabled != null) 'enabled': enabled,
      if (failed != null) 'failed': failed,
      if (issuer != null) 'issuer': issuer,
      if (seenAt != null) 'seenAt': iso8601ToJson(seenAt),
      if (serialNumber != null) 'serialNumber': serialNumber,
      if (x509CertificateData != null)
        'x509CertificateData': x509CertificateData,
    };
  }
}

/// The state of the certificate revocation list (CRL) after a read or write
/// operation.
class CrlDetail {
  /// The ISO-8601 timestamp when the certificate revocation list (CRL) was
  /// created.
  final DateTime? createdAt;

  /// The ARN of the certificate revocation list (CRL).
  final String? crlArn;

  /// The state of the certificate revocation list (CRL) after a read or write
  /// operation.
  final Uint8List? crlData;

  /// The unique identifier of the certificate revocation list (CRL).
  final String? crlId;

  /// Indicates whether the certificate revocation list (CRL) is enabled.
  final bool? enabled;

  /// The name of the certificate revocation list (CRL).
  final String? name;

  /// The ARN of the TrustAnchor the certificate revocation list (CRL) will
  /// provide revocation for.
  final String? trustAnchorArn;

  /// The ISO-8601 timestamp when the certificate revocation list (CRL) was last
  /// updated.
  final DateTime? updatedAt;

  CrlDetail({
    this.createdAt,
    this.crlArn,
    this.crlData,
    this.crlId,
    this.enabled,
    this.name,
    this.trustAnchorArn,
    this.updatedAt,
  });

  factory CrlDetail.fromJson(Map<String, dynamic> json) {
    return CrlDetail(
      createdAt: timeStampFromJson(json['createdAt']),
      crlArn: json['crlArn'] as String?,
      crlData: _s.decodeNullableUint8List(json['crlData'] as String?),
      crlId: json['crlId'] as String?,
      enabled: json['enabled'] as bool?,
      name: json['name'] as String?,
      trustAnchorArn: json['trustAnchorArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final crlArn = this.crlArn;
    final crlData = this.crlData;
    final crlId = this.crlId;
    final enabled = this.enabled;
    final name = this.name;
    final trustAnchorArn = this.trustAnchorArn;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (crlArn != null) 'crlArn': crlArn,
      if (crlData != null) 'crlData': base64Encode(crlData),
      if (crlId != null) 'crlId': crlId,
      if (enabled != null) 'enabled': enabled,
      if (name != null) 'name': name,
      if (trustAnchorArn != null) 'trustAnchorArn': trustAnchorArn,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class CrlDetailResponse {
  /// The state of the certificate revocation list (CRL) after a read or write
  /// operation.
  final CrlDetail crl;

  CrlDetailResponse({
    required this.crl,
  });

  factory CrlDetailResponse.fromJson(Map<String, dynamic> json) {
    return CrlDetailResponse(
      crl: CrlDetail.fromJson(json['crl'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final crl = this.crl;
    return {
      'crl': crl,
    };
  }
}

class DeleteAttributeMappingResponse {
  /// The state of the profile after a read or write operation.
  final ProfileDetail profile;

  DeleteAttributeMappingResponse({
    required this.profile,
  });

  factory DeleteAttributeMappingResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAttributeMappingResponse(
      profile: ProfileDetail.fromJson(json['profile'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final profile = this.profile;
    return {
      'profile': profile,
    };
  }
}

/// A key-value pair you set that identifies a property of the authenticating
/// instance.
class InstanceProperty {
  /// Indicates whether the temporary credential request was successful.
  final bool? failed;

  /// A list of instanceProperty objects.
  final Map<String, String>? properties;

  /// The ISO-8601 time stamp of when the certificate was last used in a temporary
  /// credential request.
  final DateTime? seenAt;

  InstanceProperty({
    this.failed,
    this.properties,
    this.seenAt,
  });

  factory InstanceProperty.fromJson(Map<String, dynamic> json) {
    return InstanceProperty(
      failed: json['failed'] as bool?,
      properties: (json['properties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      seenAt: timeStampFromJson(json['seenAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final properties = this.properties;
    final seenAt = this.seenAt;
    return {
      if (failed != null) 'failed': failed,
      if (properties != null) 'properties': properties,
      if (seenAt != null) 'seenAt': iso8601ToJson(seenAt),
    };
  }
}

class ListCrlsResponse {
  /// A list of certificate revocation lists (CRL).
  final List<CrlDetail>? crls;

  /// A token that indicates where the output should continue from, if a previous
  /// request did not show all results. To get the next results, make the request
  /// again with this value.
  final String? nextToken;

  ListCrlsResponse({
    this.crls,
    this.nextToken,
  });

  factory ListCrlsResponse.fromJson(Map<String, dynamic> json) {
    return ListCrlsResponse(
      crls: (json['crls'] as List?)
          ?.whereNotNull()
          .map((e) => CrlDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crls = this.crls;
    final nextToken = this.nextToken;
    return {
      if (crls != null) 'crls': crls,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListProfilesResponse {
  /// A token that indicates where the output should continue from, if a previous
  /// request did not show all results. To get the next results, make the request
  /// again with this value.
  final String? nextToken;

  /// A list of profiles.
  final List<ProfileDetail>? profiles;

  ListProfilesResponse({
    this.nextToken,
    this.profiles,
  });

  factory ListProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListProfilesResponse(
      nextToken: json['nextToken'] as String?,
      profiles: (json['profiles'] as List?)
          ?.whereNotNull()
          .map((e) => ProfileDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final profiles = this.profiles;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (profiles != null) 'profiles': profiles,
    };
  }
}

class ListSubjectsResponse {
  /// A token that indicates where the output should continue from, if a previous
  /// request did not show all results. To get the next results, make the request
  /// again with this value.
  final String? nextToken;

  /// A list of subjects.
  final List<SubjectSummary>? subjects;

  ListSubjectsResponse({
    this.nextToken,
    this.subjects,
  });

  factory ListSubjectsResponse.fromJson(Map<String, dynamic> json) {
    return ListSubjectsResponse(
      nextToken: json['nextToken'] as String?,
      subjects: (json['subjects'] as List?)
          ?.whereNotNull()
          .map((e) => SubjectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subjects = this.subjects;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (subjects != null) 'subjects': subjects,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags attached to the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class ListTrustAnchorsResponse {
  /// A token that indicates where the output should continue from, if a previous
  /// request did not show all results. To get the next results, make the request
  /// again with this value.
  final String? nextToken;

  /// A list of trust anchors.
  final List<TrustAnchorDetail>? trustAnchors;

  ListTrustAnchorsResponse({
    this.nextToken,
    this.trustAnchors,
  });

  factory ListTrustAnchorsResponse.fromJson(Map<String, dynamic> json) {
    return ListTrustAnchorsResponse(
      nextToken: json['nextToken'] as String?,
      trustAnchors: (json['trustAnchors'] as List?)
          ?.whereNotNull()
          .map((e) => TrustAnchorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final trustAnchors = this.trustAnchors;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (trustAnchors != null) 'trustAnchors': trustAnchors,
    };
  }
}

/// A single mapping entry for each supported specifier or sub-field.
class MappingRule {
  /// Specifier within a certificate field, such as CN, OU, or UID from the
  /// Subject field.
  final String specifier;

  MappingRule({
    required this.specifier,
  });

  factory MappingRule.fromJson(Map<String, dynamic> json) {
    return MappingRule(
      specifier: json['specifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final specifier = this.specifier;
    return {
      'specifier': specifier,
    };
  }
}

enum NotificationChannel {
  all,
}

extension NotificationChannelValueExtension on NotificationChannel {
  String toValue() {
    switch (this) {
      case NotificationChannel.all:
        return 'ALL';
    }
  }
}

extension NotificationChannelFromString on String {
  NotificationChannel toNotificationChannel() {
    switch (this) {
      case 'ALL':
        return NotificationChannel.all;
    }
    throw Exception('$this is not known in enum NotificationChannel');
  }
}

enum NotificationEvent {
  caCertificateExpiry,
  endEntityCertificateExpiry,
}

extension NotificationEventValueExtension on NotificationEvent {
  String toValue() {
    switch (this) {
      case NotificationEvent.caCertificateExpiry:
        return 'CA_CERTIFICATE_EXPIRY';
      case NotificationEvent.endEntityCertificateExpiry:
        return 'END_ENTITY_CERTIFICATE_EXPIRY';
    }
  }
}

extension NotificationEventFromString on String {
  NotificationEvent toNotificationEvent() {
    switch (this) {
      case 'CA_CERTIFICATE_EXPIRY':
        return NotificationEvent.caCertificateExpiry;
      case 'END_ENTITY_CERTIFICATE_EXPIRY':
        return NotificationEvent.endEntityCertificateExpiry;
    }
    throw Exception('$this is not known in enum NotificationEvent');
  }
}

/// Customizable notification settings that will be applied to notification
/// events. IAM Roles Anywhere consumes these settings while notifying across
/// multiple channels - CloudWatch metrics, EventBridge, and Health Dashboard.
class NotificationSetting {
  /// Indicates whether the notification setting is enabled.
  final bool enabled;

  /// The event to which this notification setting is applied.
  final NotificationEvent event;

  /// The specified channel of notification. IAM Roles Anywhere uses CloudWatch
  /// metrics, EventBridge, and Health Dashboard to notify for an event.
  /// <note>
  /// In the absence of a specific channel, IAM Roles Anywhere applies this
  /// setting to 'ALL' channels.
  /// </note>
  final NotificationChannel? channel;

  /// The number of days before a notification event. This value is required for a
  /// notification setting that is enabled.
  final int? threshold;

  NotificationSetting({
    required this.enabled,
    required this.event,
    this.channel,
    this.threshold,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final event = this.event;
    final channel = this.channel;
    final threshold = this.threshold;
    return {
      'enabled': enabled,
      'event': event.toValue(),
      if (channel != null) 'channel': channel.toValue(),
      if (threshold != null) 'threshold': threshold,
    };
  }
}

/// The state of a notification setting.
///
/// A notification setting includes information such as event name, threshold,
/// status of the notification setting, and the channel to notify.
class NotificationSettingDetail {
  /// Indicates whether the notification setting is enabled.
  final bool enabled;

  /// The event to which this notification setting is applied.
  final NotificationEvent event;

  /// The specified channel of notification. IAM Roles Anywhere uses CloudWatch
  /// metrics, EventBridge, and Health Dashboard to notify for an event.
  /// <note>
  /// In the absence of a specific channel, IAM Roles Anywhere applies this
  /// setting to 'ALL' channels.
  /// </note>
  final NotificationChannel? channel;

  /// The principal that configured the notification setting. For default settings
  /// configured by IAM Roles Anywhere, the value is
  /// <code>rolesanywhere.amazonaws.com</code>, and for customized notifications
  /// settings, it is the respective account ID.
  final String? configuredBy;

  /// The number of days before a notification event.
  final int? threshold;

  NotificationSettingDetail({
    required this.enabled,
    required this.event,
    this.channel,
    this.configuredBy,
    this.threshold,
  });

  factory NotificationSettingDetail.fromJson(Map<String, dynamic> json) {
    return NotificationSettingDetail(
      enabled: json['enabled'] as bool,
      event: (json['event'] as String).toNotificationEvent(),
      channel: (json['channel'] as String?)?.toNotificationChannel(),
      configuredBy: json['configuredBy'] as String?,
      threshold: json['threshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final event = this.event;
    final channel = this.channel;
    final configuredBy = this.configuredBy;
    final threshold = this.threshold;
    return {
      'enabled': enabled,
      'event': event.toValue(),
      if (channel != null) 'channel': channel.toValue(),
      if (configuredBy != null) 'configuredBy': configuredBy,
      if (threshold != null) 'threshold': threshold,
    };
  }
}

/// A notification setting key to reset. A notification setting key includes the
/// event and the channel.
class NotificationSettingKey {
  /// The notification setting event to reset.
  final NotificationEvent event;

  /// The specified channel of notification.
  final NotificationChannel? channel;

  NotificationSettingKey({
    required this.event,
    this.channel,
  });

  Map<String, dynamic> toJson() {
    final event = this.event;
    final channel = this.channel;
    return {
      'event': event.toValue(),
      if (channel != null) 'channel': channel.toValue(),
    };
  }
}

/// The state of the profile after a read or write operation.
class ProfileDetail {
  /// A mapping applied to the authenticating end-entity certificate.
  final List<AttributeMapping>? attributeMappings;

  /// The ISO-8601 timestamp when the profile was created.
  final DateTime? createdAt;

  /// The Amazon Web Services account that created the profile.
  final String? createdBy;

  /// Used to determine how long sessions vended using this profile are valid for.
  /// See the <code>Expiration</code> section of the <a
  /// href="https://docs.aws.amazon.com/rolesanywhere/latest/userguide/authentication-create-session.html#credentials-object">CreateSession
  /// API documentation</a> page for more details. In requests, if this value is
  /// not provided, the default value will be 3600.
  final int? durationSeconds;

  /// Indicates whether the profile is enabled.
  final bool? enabled;

  /// A list of managed policy ARNs that apply to the vended session credentials.
  final List<String>? managedPolicyArns;

  /// The name of the profile.
  final String? name;

  /// The ARN of the profile.
  final String? profileArn;

  /// The unique identifier of the profile.
  final String? profileId;

  /// Specifies whether instance properties are required in temporary credential
  /// requests with this profile.
  final bool? requireInstanceProperties;

  /// A list of IAM roles that this profile can assume in a temporary credential
  /// request.
  final List<String>? roleArns;

  /// A session policy that applies to the trust boundary of the vended session
  /// credentials.
  final String? sessionPolicy;

  /// The ISO-8601 timestamp when the profile was last updated.
  final DateTime? updatedAt;

  ProfileDetail({
    this.attributeMappings,
    this.createdAt,
    this.createdBy,
    this.durationSeconds,
    this.enabled,
    this.managedPolicyArns,
    this.name,
    this.profileArn,
    this.profileId,
    this.requireInstanceProperties,
    this.roleArns,
    this.sessionPolicy,
    this.updatedAt,
  });

  factory ProfileDetail.fromJson(Map<String, dynamic> json) {
    return ProfileDetail(
      attributeMappings: (json['attributeMappings'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      durationSeconds: json['durationSeconds'] as int?,
      enabled: json['enabled'] as bool?,
      managedPolicyArns: (json['managedPolicyArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      profileArn: json['profileArn'] as String?,
      profileId: json['profileId'] as String?,
      requireInstanceProperties: json['requireInstanceProperties'] as bool?,
      roleArns: (json['roleArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sessionPolicy: json['sessionPolicy'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeMappings = this.attributeMappings;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final durationSeconds = this.durationSeconds;
    final enabled = this.enabled;
    final managedPolicyArns = this.managedPolicyArns;
    final name = this.name;
    final profileArn = this.profileArn;
    final profileId = this.profileId;
    final requireInstanceProperties = this.requireInstanceProperties;
    final roleArns = this.roleArns;
    final sessionPolicy = this.sessionPolicy;
    final updatedAt = this.updatedAt;
    return {
      if (attributeMappings != null) 'attributeMappings': attributeMappings,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      if (enabled != null) 'enabled': enabled,
      if (managedPolicyArns != null) 'managedPolicyArns': managedPolicyArns,
      if (name != null) 'name': name,
      if (profileArn != null) 'profileArn': profileArn,
      if (profileId != null) 'profileId': profileId,
      if (requireInstanceProperties != null)
        'requireInstanceProperties': requireInstanceProperties,
      if (roleArns != null) 'roleArns': roleArns,
      if (sessionPolicy != null) 'sessionPolicy': sessionPolicy,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class ProfileDetailResponse {
  /// The state of the profile after a read or write operation.
  final ProfileDetail? profile;

  ProfileDetailResponse({
    this.profile,
  });

  factory ProfileDetailResponse.fromJson(Map<String, dynamic> json) {
    return ProfileDetailResponse(
      profile: json['profile'] != null
          ? ProfileDetail.fromJson(json['profile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profile = this.profile;
    return {
      if (profile != null) 'profile': profile,
    };
  }
}

class PutAttributeMappingResponse {
  /// The state of the profile after a read or write operation.
  final ProfileDetail profile;

  PutAttributeMappingResponse({
    required this.profile,
  });

  factory PutAttributeMappingResponse.fromJson(Map<String, dynamic> json) {
    return PutAttributeMappingResponse(
      profile: ProfileDetail.fromJson(json['profile'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final profile = this.profile;
    return {
      'profile': profile,
    };
  }
}

class PutNotificationSettingsResponse {
  final TrustAnchorDetail trustAnchor;

  PutNotificationSettingsResponse({
    required this.trustAnchor,
  });

  factory PutNotificationSettingsResponse.fromJson(Map<String, dynamic> json) {
    return PutNotificationSettingsResponse(
      trustAnchor: TrustAnchorDetail.fromJson(
          json['trustAnchor'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final trustAnchor = this.trustAnchor;
    return {
      'trustAnchor': trustAnchor,
    };
  }
}

class ResetNotificationSettingsResponse {
  final TrustAnchorDetail trustAnchor;

  ResetNotificationSettingsResponse({
    required this.trustAnchor,
  });

  factory ResetNotificationSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return ResetNotificationSettingsResponse(
      trustAnchor: TrustAnchorDetail.fromJson(
          json['trustAnchor'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final trustAnchor = this.trustAnchor;
    return {
      'trustAnchor': trustAnchor,
    };
  }
}

/// The trust anchor type and its related certificate data.
class Source {
  /// The data field of the trust anchor depending on its type.
  final SourceData? sourceData;

  /// The type of the trust anchor.
  final TrustAnchorType? sourceType;

  Source({
    this.sourceData,
    this.sourceType,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      sourceData: json['sourceData'] != null
          ? SourceData.fromJson(json['sourceData'] as Map<String, dynamic>)
          : null,
      sourceType: (json['sourceType'] as String?)?.toTrustAnchorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceData = this.sourceData;
    final sourceType = this.sourceType;
    return {
      if (sourceData != null) 'sourceData': sourceData,
      if (sourceType != null) 'sourceType': sourceType.toValue(),
    };
  }
}

/// The data field of the trust anchor depending on its type.
class SourceData {
  /// The root certificate of the Private Certificate Authority specified by this
  /// ARN is used in trust validation for temporary credential requests. Included
  /// for trust anchors of type <code>AWS_ACM_PCA</code>.
  final String? acmPcaArn;

  /// The PEM-encoded data for the certificate anchor. Included for trust anchors
  /// of type <code>CERTIFICATE_BUNDLE</code>.
  final String? x509CertificateData;

  SourceData({
    this.acmPcaArn,
    this.x509CertificateData,
  });

  factory SourceData.fromJson(Map<String, dynamic> json) {
    return SourceData(
      acmPcaArn: json['acmPcaArn'] as String?,
      x509CertificateData: json['x509CertificateData'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acmPcaArn = this.acmPcaArn;
    final x509CertificateData = this.x509CertificateData;
    return {
      if (acmPcaArn != null) 'acmPcaArn': acmPcaArn,
      if (x509CertificateData != null)
        'x509CertificateData': x509CertificateData,
    };
  }
}

/// The state of the subject after a read or write operation.
class SubjectDetail {
  /// The ISO-8601 timestamp when the subject was created.
  final DateTime? createdAt;

  /// The temporary session credentials vended at the last authenticating call
  /// with this subject.
  final List<CredentialSummary>? credentials;

  /// The enabled status of the subject.
  final bool? enabled;

  /// The specified instance properties associated with the request.
  final List<InstanceProperty>? instanceProperties;

  /// The ISO-8601 timestamp of the last time this subject requested temporary
  /// session credentials.
  final DateTime? lastSeenAt;

  /// The ARN of the resource.
  final String? subjectArn;

  /// The id of the resource
  final String? subjectId;

  /// The ISO-8601 timestamp when the subject was last updated.
  final DateTime? updatedAt;

  /// The x509 principal identifier of the authenticating certificate.
  final String? x509Subject;

  SubjectDetail({
    this.createdAt,
    this.credentials,
    this.enabled,
    this.instanceProperties,
    this.lastSeenAt,
    this.subjectArn,
    this.subjectId,
    this.updatedAt,
    this.x509Subject,
  });

  factory SubjectDetail.fromJson(Map<String, dynamic> json) {
    return SubjectDetail(
      createdAt: timeStampFromJson(json['createdAt']),
      credentials: (json['credentials'] as List?)
          ?.whereNotNull()
          .map((e) => CredentialSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      enabled: json['enabled'] as bool?,
      instanceProperties: (json['instanceProperties'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastSeenAt: timeStampFromJson(json['lastSeenAt']),
      subjectArn: json['subjectArn'] as String?,
      subjectId: json['subjectId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      x509Subject: json['x509Subject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final credentials = this.credentials;
    final enabled = this.enabled;
    final instanceProperties = this.instanceProperties;
    final lastSeenAt = this.lastSeenAt;
    final subjectArn = this.subjectArn;
    final subjectId = this.subjectId;
    final updatedAt = this.updatedAt;
    final x509Subject = this.x509Subject;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (credentials != null) 'credentials': credentials,
      if (enabled != null) 'enabled': enabled,
      if (instanceProperties != null) 'instanceProperties': instanceProperties,
      if (lastSeenAt != null) 'lastSeenAt': iso8601ToJson(lastSeenAt),
      if (subjectArn != null) 'subjectArn': subjectArn,
      if (subjectId != null) 'subjectId': subjectId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (x509Subject != null) 'x509Subject': x509Subject,
    };
  }
}

class SubjectDetailResponse {
  /// The state of the subject after a read or write operation.
  final SubjectDetail? subject;

  SubjectDetailResponse({
    this.subject,
  });

  factory SubjectDetailResponse.fromJson(Map<String, dynamic> json) {
    return SubjectDetailResponse(
      subject: json['subject'] != null
          ? SubjectDetail.fromJson(json['subject'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subject = this.subject;
    return {
      if (subject != null) 'subject': subject,
    };
  }
}

/// A summary representation of subjects.
class SubjectSummary {
  /// The ISO-8601 time stamp of when the certificate was first used in a
  /// temporary credential request.
  final DateTime? createdAt;

  /// The enabled status of the subject.
  final bool? enabled;

  /// The ISO-8601 time stamp of when the certificate was last used in a temporary
  /// credential request.
  final DateTime? lastSeenAt;

  /// The ARN of the resource.
  final String? subjectArn;

  /// The id of the resource.
  final String? subjectId;

  /// The ISO-8601 timestamp when the subject was last updated.
  final DateTime? updatedAt;

  /// The x509 principal identifier of the authenticating certificate.
  final String? x509Subject;

  SubjectSummary({
    this.createdAt,
    this.enabled,
    this.lastSeenAt,
    this.subjectArn,
    this.subjectId,
    this.updatedAt,
    this.x509Subject,
  });

  factory SubjectSummary.fromJson(Map<String, dynamic> json) {
    return SubjectSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      enabled: json['enabled'] as bool?,
      lastSeenAt: timeStampFromJson(json['lastSeenAt']),
      subjectArn: json['subjectArn'] as String?,
      subjectId: json['subjectId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      x509Subject: json['x509Subject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final enabled = this.enabled;
    final lastSeenAt = this.lastSeenAt;
    final subjectArn = this.subjectArn;
    final subjectId = this.subjectId;
    final updatedAt = this.updatedAt;
    final x509Subject = this.x509Subject;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (enabled != null) 'enabled': enabled,
      if (lastSeenAt != null) 'lastSeenAt': iso8601ToJson(lastSeenAt),
      if (subjectArn != null) 'subjectArn': subjectArn,
      if (subjectId != null) 'subjectId': subjectId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (x509Subject != null) 'x509Subject': x509Subject,
    };
  }
}

/// A label that consists of a key and value you define.
class Tag {
  /// The tag key.
  final String key;

  /// The tag value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
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

/// The state of the trust anchor after a read or write operation.
class TrustAnchorDetail {
  /// The ISO-8601 timestamp when the trust anchor was created.
  final DateTime? createdAt;

  /// Indicates whether the trust anchor is enabled.
  final bool? enabled;

  /// The name of the trust anchor.
  final String? name;

  /// A list of notification settings to be associated to the trust anchor.
  final List<NotificationSettingDetail>? notificationSettings;

  /// The trust anchor type and its related certificate data.
  final Source? source;

  /// The ARN of the trust anchor.
  final String? trustAnchorArn;

  /// The unique identifier of the trust anchor.
  final String? trustAnchorId;

  /// The ISO-8601 timestamp when the trust anchor was last updated.
  final DateTime? updatedAt;

  TrustAnchorDetail({
    this.createdAt,
    this.enabled,
    this.name,
    this.notificationSettings,
    this.source,
    this.trustAnchorArn,
    this.trustAnchorId,
    this.updatedAt,
  });

  factory TrustAnchorDetail.fromJson(Map<String, dynamic> json) {
    return TrustAnchorDetail(
      createdAt: timeStampFromJson(json['createdAt']),
      enabled: json['enabled'] as bool?,
      name: json['name'] as String?,
      notificationSettings: (json['notificationSettings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              NotificationSettingDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: json['source'] != null
          ? Source.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      trustAnchorArn: json['trustAnchorArn'] as String?,
      trustAnchorId: json['trustAnchorId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final enabled = this.enabled;
    final name = this.name;
    final notificationSettings = this.notificationSettings;
    final source = this.source;
    final trustAnchorArn = this.trustAnchorArn;
    final trustAnchorId = this.trustAnchorId;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (enabled != null) 'enabled': enabled,
      if (name != null) 'name': name,
      if (notificationSettings != null)
        'notificationSettings': notificationSettings,
      if (source != null) 'source': source,
      if (trustAnchorArn != null) 'trustAnchorArn': trustAnchorArn,
      if (trustAnchorId != null) 'trustAnchorId': trustAnchorId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class TrustAnchorDetailResponse {
  /// The state of the trust anchor after a read or write operation.
  final TrustAnchorDetail trustAnchor;

  TrustAnchorDetailResponse({
    required this.trustAnchor,
  });

  factory TrustAnchorDetailResponse.fromJson(Map<String, dynamic> json) {
    return TrustAnchorDetailResponse(
      trustAnchor: TrustAnchorDetail.fromJson(
          json['trustAnchor'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final trustAnchor = this.trustAnchor;
    return {
      'trustAnchor': trustAnchor,
    };
  }
}

enum TrustAnchorType {
  awsAcmPca,
  certificateBundle,
  selfSignedRepository,
}

extension TrustAnchorTypeValueExtension on TrustAnchorType {
  String toValue() {
    switch (this) {
      case TrustAnchorType.awsAcmPca:
        return 'AWS_ACM_PCA';
      case TrustAnchorType.certificateBundle:
        return 'CERTIFICATE_BUNDLE';
      case TrustAnchorType.selfSignedRepository:
        return 'SELF_SIGNED_REPOSITORY';
    }
  }
}

extension TrustAnchorTypeFromString on String {
  TrustAnchorType toTrustAnchorType() {
    switch (this) {
      case 'AWS_ACM_PCA':
        return TrustAnchorType.awsAcmPca;
      case 'CERTIFICATE_BUNDLE':
        return TrustAnchorType.certificateBundle;
      case 'SELF_SIGNED_REPOSITORY':
        return TrustAnchorType.selfSignedRepository;
    }
    throw Exception('$this is not known in enum TrustAnchorType');
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
