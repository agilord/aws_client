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

/// This guide documents the action and response elements for use of the
/// service.
class SecurityIR {
  final _s.RestJsonProtocol _protocol;
  SecurityIR({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'security-ir',
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

  /// Returns currently configured tags on a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Required element for ListTagsForResource to provide the ARN to identify a
  /// specific resource.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Adds a tag(s) to a designated resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Required element for TagResource to identify the ARN for the resource to
  /// add a tag to.
  ///
  /// Parameter [tags] :
  /// Required element for ListTagsForResource to provide the content for a tag.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag(s) from a designate resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Required element for UnTagResource to identify the ARN for the resource to
  /// remove a tag from.
  ///
  /// Parameter [tagKeys] :
  /// Required element for UnTagResource to identify tag to remove.
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
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new case.
  ///
  /// Parameter [description] :
  /// Required element used in combination with CreateCase
  ///
  /// to provide a description for the new case.
  ///
  /// Parameter [engagementType] :
  /// Required element used in combination with CreateCase to provide an
  /// engagement type for the new cases. Available engagement types include
  /// Security Incident | Investigation
  ///
  /// Parameter [impactedAccounts] :
  /// Required element used in combination with CreateCase to provide a list of
  /// impacted accounts.
  /// <note>
  /// AWS account ID's may appear less than 12 characters and need to be
  /// zero-prepended. An example would be <code>123123123</code> which is nine
  /// digits, and with zero-prepend would be <code>000123123123</code>. Not
  /// zero-prepending to 12 digits could result in errors.
  /// </note>
  ///
  /// Parameter [reportedIncidentStartDate] :
  /// Required element used in combination with CreateCase to provide an initial
  /// start date for the unauthorized activity.
  ///
  /// Parameter [resolverType] :
  /// Required element used in combination with CreateCase to identify the
  /// resolver type.
  ///
  /// Parameter [title] :
  /// Required element used in combination with CreateCase to provide a title
  /// for the new case.
  ///
  /// Parameter [watchers] :
  /// Required element used in combination with CreateCase to provide a list of
  /// entities to receive notifications for case updates.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// The <code>clientToken</code> field is an idempotency key used to ensure
  /// that repeated attempts for a single action will be ignored by the server
  /// during retries. A caller supplied unique ID (typically a UUID) should be
  /// provided.
  /// </note>
  ///
  /// Parameter [impactedAwsRegions] :
  /// An optional element used in combination with CreateCase to provide a list
  /// of impacted regions.
  ///
  /// Parameter [impactedServices] :
  /// An optional element used in combination with CreateCase to provide a list
  /// of services impacted.
  ///
  /// Parameter [tags] :
  /// An optional element used in combination with CreateCase to add customer
  /// specified tags to a case.
  ///
  /// Parameter [threatActorIpAddresses] :
  /// An optional element used in combination with CreateCase to provide a list
  /// of suspicious internet protocol addresses associated with unauthorized
  /// activity.
  Future<CreateCaseResponse> createCase({
    required String description,
    required EngagementType engagementType,
    required List<String> impactedAccounts,
    required DateTime reportedIncidentStartDate,
    required ResolverType resolverType,
    required String title,
    required List<Watcher> watchers,
    String? clientToken,
    List<ImpactedAwsRegion>? impactedAwsRegions,
    List<String>? impactedServices,
    Map<String, String>? tags,
    List<ThreatActorIp>? threatActorIpAddresses,
  }) async {
    final $payload = <String, dynamic>{
      'description': description,
      'engagementType': engagementType.value,
      'impactedAccounts': impactedAccounts,
      'reportedIncidentStartDate':
          unixTimestampToJson(reportedIncidentStartDate),
      'resolverType': resolverType.value,
      'title': title,
      'watchers': watchers,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (impactedAwsRegions != null) 'impactedAwsRegions': impactedAwsRegions,
      if (impactedServices != null) 'impactedServices': impactedServices,
      if (tags != null) 'tags': tags,
      if (threatActorIpAddresses != null)
        'threatActorIpAddresses': threatActorIpAddresses,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/create-case',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCaseResponse.fromJson(response);
  }

  /// Returns the attributes of a case.
  ///
  /// Parameter [caseId] :
  /// Required element for GetCase to identify the requested case ID.
  Future<GetCaseResponse> getCase({
    required String caseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/cases/${Uri.encodeComponent(caseId)}/get-case',
      exceptionFnMap: _exceptionFns,
    );
    return GetCaseResponse.fromJson(response);
  }

  /// Updates an existing case.
  ///
  /// Parameter [caseId] :
  /// Required element for UpdateCase to identify the case ID for updates.
  ///
  /// Parameter [actualIncidentStartDate] :
  /// Optional element for UpdateCase to provide content for the incident start
  /// date field.
  ///
  /// Parameter [caseMetadata] :
  /// Update the case request with case metadata
  ///
  /// Parameter [description] :
  /// Optional element for UpdateCase to provide content for the description
  /// field.
  ///
  /// Parameter [engagementType] :
  /// Optional element for UpdateCase to provide content for the engagement type
  /// field. <code>Available engagement types include Security Incident |
  /// Investigation</code>.
  ///
  /// Parameter [impactedAccountsToAdd] :
  /// Optional element for UpdateCase to provide content to add accounts
  /// impacted.
  /// <note>
  /// AWS account ID's may appear less than 12 characters and need to be
  /// zero-prepended. An example would be <code>123123123</code> which is nine
  /// digits, and with zero-prepend would be <code>000123123123</code>. Not
  /// zero-prepending to 12 digits could result in errors.
  /// </note>
  ///
  /// Parameter [impactedAccountsToDelete] :
  /// Optional element for UpdateCase to provide content to add accounts
  /// impacted.
  /// <note>
  /// AWS account ID's may appear less than 12 characters and need to be
  /// zero-prepended. An example would be <code>123123123</code> which is nine
  /// digits, and with zero-prepend would be <code>000123123123</code>. Not
  /// zero-prepending to 12 digits could result in errors.
  /// </note>
  ///
  /// Parameter [impactedAwsRegionsToAdd] :
  /// Optional element for UpdateCase to provide content to add regions
  /// impacted.
  ///
  /// Parameter [impactedAwsRegionsToDelete] :
  /// Optional element for UpdateCase to provide content to remove regions
  /// impacted.
  ///
  /// Parameter [impactedServicesToAdd] :
  /// Optional element for UpdateCase to provide content to add services
  /// impacted.
  ///
  /// Parameter [impactedServicesToDelete] :
  /// Optional element for UpdateCase to provide content to remove services
  /// impacted.
  ///
  /// Parameter [reportedIncidentStartDate] :
  /// Optional element for UpdateCase to provide content for the customer
  /// reported incident start date field.
  ///
  /// Parameter [threatActorIpAddressesToAdd] :
  /// Optional element for UpdateCase to provide content to add additional
  /// suspicious IP addresses related to a case.
  ///
  /// Parameter [threatActorIpAddressesToDelete] :
  /// Optional element for UpdateCase to provide content to remove suspicious IP
  /// addresses from a case.
  ///
  /// Parameter [title] :
  /// Optional element for UpdateCase to provide content for the title field.
  ///
  /// Parameter [watchersToAdd] :
  /// Optional element for UpdateCase to provide content to add additional
  /// watchers to a case.
  ///
  /// Parameter [watchersToDelete] :
  /// Optional element for UpdateCase to provide content to remove existing
  /// watchers from a case.
  Future<void> updateCase({
    required String caseId,
    DateTime? actualIncidentStartDate,
    List<CaseMetadataEntry>? caseMetadata,
    String? description,
    EngagementType? engagementType,
    List<String>? impactedAccountsToAdd,
    List<String>? impactedAccountsToDelete,
    List<ImpactedAwsRegion>? impactedAwsRegionsToAdd,
    List<ImpactedAwsRegion>? impactedAwsRegionsToDelete,
    List<String>? impactedServicesToAdd,
    List<String>? impactedServicesToDelete,
    DateTime? reportedIncidentStartDate,
    List<ThreatActorIp>? threatActorIpAddressesToAdd,
    List<ThreatActorIp>? threatActorIpAddressesToDelete,
    String? title,
    List<Watcher>? watchersToAdd,
    List<Watcher>? watchersToDelete,
  }) async {
    final $payload = <String, dynamic>{
      if (actualIncidentStartDate != null)
        'actualIncidentStartDate': unixTimestampToJson(actualIncidentStartDate),
      if (caseMetadata != null) 'caseMetadata': caseMetadata,
      if (description != null) 'description': description,
      if (engagementType != null) 'engagementType': engagementType.value,
      if (impactedAccountsToAdd != null)
        'impactedAccountsToAdd': impactedAccountsToAdd,
      if (impactedAccountsToDelete != null)
        'impactedAccountsToDelete': impactedAccountsToDelete,
      if (impactedAwsRegionsToAdd != null)
        'impactedAwsRegionsToAdd': impactedAwsRegionsToAdd,
      if (impactedAwsRegionsToDelete != null)
        'impactedAwsRegionsToDelete': impactedAwsRegionsToDelete,
      if (impactedServicesToAdd != null)
        'impactedServicesToAdd': impactedServicesToAdd,
      if (impactedServicesToDelete != null)
        'impactedServicesToDelete': impactedServicesToDelete,
      if (reportedIncidentStartDate != null)
        'reportedIncidentStartDate':
            unixTimestampToJson(reportedIncidentStartDate),
      if (threatActorIpAddressesToAdd != null)
        'threatActorIpAddressesToAdd': threatActorIpAddressesToAdd,
      if (threatActorIpAddressesToDelete != null)
        'threatActorIpAddressesToDelete': threatActorIpAddressesToDelete,
      if (title != null) 'title': title,
      if (watchersToAdd != null) 'watchersToAdd': watchersToAdd,
      if (watchersToDelete != null) 'watchersToDelete': watchersToDelete,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/cases/${Uri.encodeComponent(caseId)}/update-case',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all cases the requester has access to.
  ///
  /// Parameter [maxResults] :
  /// Optional element for ListCases to limit the number of responses.
  ///
  /// Parameter [nextToken] :
  /// An optional string that, if supplied, must be copied from the output of a
  /// previous call to ListCases. When provided in this manner, the API fetches
  /// the next page of results.
  Future<ListCasesResponse> listCases({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/list-cases',
      exceptionFnMap: _exceptionFns,
    );
    return ListCasesResponse.fromJson(response);
  }

  /// Closes an existing case.
  ///
  /// Parameter [caseId] :
  /// Required element used in combination with CloseCase to identify the case
  /// ID to close.
  Future<CloseCaseResponse> closeCase({
    required String caseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/cases/${Uri.encodeComponent(caseId)}/close-case',
      exceptionFnMap: _exceptionFns,
    );
    return CloseCaseResponse.fromJson(response);
  }

  /// Adds a comment to an existing case.
  ///
  /// Parameter [body] :
  /// Required element used in combination with CreateCaseComment to add content
  /// for the new comment.
  ///
  /// Parameter [caseId] :
  /// Required element used in combination with CreateCaseComment to specify a
  /// case ID.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// The <code>clientToken</code> field is an idempotency key used to ensure
  /// that repeated attempts for a single action will be ignored by the server
  /// during retries. A caller supplied unique ID (typically a UUID) should be
  /// provided.
  /// </note>
  Future<CreateCaseCommentResponse> createCaseComment({
    required String body,
    required String caseId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'body': body,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/cases/${Uri.encodeComponent(caseId)}/create-comment',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCaseCommentResponse.fromJson(response);
  }

  /// Returns a Pre-Signed URL for uploading attachments into a case.
  ///
  /// Parameter [attachmentId] :
  /// Required element for GetCaseAttachmentDownloadUrl to identify the
  /// attachment ID for downloading an attachment.
  ///
  /// Parameter [caseId] :
  /// Required element for GetCaseAttachmentDownloadUrl to identify the case ID
  /// for downloading an attachment from.
  Future<GetCaseAttachmentDownloadUrlResponse> getCaseAttachmentDownloadUrl({
    required String attachmentId,
    required String caseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/cases/${Uri.encodeComponent(caseId)}/get-presigned-url/${Uri.encodeComponent(attachmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCaseAttachmentDownloadUrlResponse.fromJson(response);
  }

  /// Uploads an attachment to a case.
  ///
  /// Parameter [caseId] :
  /// Required element for GetCaseAttachmentUploadUrl to identify the case ID
  /// for uploading an attachment.
  ///
  /// Parameter [contentLength] :
  /// Required element for GetCaseAttachmentUploadUrl to identify the size of
  /// the file attachment.
  ///
  /// Parameter [fileName] :
  /// Required element for GetCaseAttachmentUploadUrl to identify the file name
  /// of the attachment to upload.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// The <code>clientToken</code> field is an idempotency key used to ensure
  /// that repeated attempts for a single action will be ignored by the server
  /// during retries. A caller supplied unique ID (typically a UUID) should be
  /// provided.
  /// </note>
  Future<GetCaseAttachmentUploadUrlResponse> getCaseAttachmentUploadUrl({
    required String caseId,
    required int contentLength,
    required String fileName,
    String? clientToken,
  }) async {
    _s.validateNumRange(
      'contentLength',
      contentLength,
      1,
      104857600,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'contentLength': contentLength,
      'fileName': fileName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/cases/${Uri.encodeComponent(caseId)}/get-presigned-url',
      exceptionFnMap: _exceptionFns,
    );
    return GetCaseAttachmentUploadUrlResponse.fromJson(response);
  }

  /// Views the case history for edits made to a designated case.
  ///
  /// Parameter [caseId] :
  /// Required element used with ListCaseEdits to identify the case to query.
  ///
  /// Parameter [maxResults] :
  /// Optional element to identify how many results to obtain. There is a
  /// maximum value of 25.
  ///
  /// Parameter [nextToken] :
  /// An optional string that, if supplied, must be copied from the output of a
  /// previous call to ListCaseEdits. When provided in this manner, the API
  /// fetches the next page of results.
  Future<ListCaseEditsResponse> listCaseEdits({
    required String caseId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/cases/${Uri.encodeComponent(caseId)}/list-case-edits',
      exceptionFnMap: _exceptionFns,
    );
    return ListCaseEditsResponse.fromJson(response);
  }

  /// Returns comments for a designated case.
  ///
  /// Parameter [caseId] :
  /// Required element for ListComments to designate the case to query.
  ///
  /// Parameter [maxResults] :
  /// Optional element for ListComments to limit the number of responses.
  ///
  /// Parameter [nextToken] :
  /// An optional string that, if supplied, must be copied from the output of a
  /// previous call to ListComments. When provided in this manner, the API
  /// fetches the next page of results.
  Future<ListCommentsResponse> listComments({
    required String caseId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/cases/${Uri.encodeComponent(caseId)}/list-comments',
      exceptionFnMap: _exceptionFns,
    );
    return ListCommentsResponse.fromJson(response);
  }

  /// Investigation performed by an agent for a security incident...
  ///
  /// Parameter [caseId] :
  /// Investigation performed by an agent for a security incident per caseID
  ///
  /// Parameter [maxResults] :
  /// Investigation performed by an agent for a security incident request,
  /// returning max results
  ///
  /// Parameter [nextToken] :
  /// Investigation performed by an agent for a security incident request
  Future<ListInvestigationsResponse> listInvestigations({
    required String caseId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/cases/${Uri.encodeComponent(caseId)}/list-investigations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInvestigationsResponse.fromJson(response);
  }

  /// Send feedback based on response investigation action
  ///
  /// Parameter [caseId] :
  /// Send feedback based on request caseID
  ///
  /// Parameter [resultId] :
  /// Send feedback based on request result ID
  ///
  /// Parameter [usefulness] :
  /// Required enum value indicating user assessment of result q.....
  ///
  /// Parameter [comment] :
  /// Send feedback based on request comments
  Future<void> sendFeedback({
    required String caseId,
    required String resultId,
    required UsefulnessRating usefulness,
    String? comment,
  }) async {
    final $payload = <String, dynamic>{
      'usefulness': usefulness.value,
      if (comment != null) 'comment': comment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/cases/${Uri.encodeComponent(caseId)}/feedback/${Uri.encodeComponent(resultId)}/send-feedback',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing case comment.
  ///
  /// Parameter [body] :
  /// Required element for UpdateCaseComment to identify the content for the
  /// comment to be updated.
  ///
  /// Parameter [caseId] :
  /// Required element for UpdateCaseComment to identify the case ID containing
  /// the comment to be updated.
  ///
  /// Parameter [commentId] :
  /// Required element for UpdateCaseComment to identify the case ID to be
  /// updated.
  Future<UpdateCaseCommentResponse> updateCaseComment({
    required String body,
    required String caseId,
    required String commentId,
  }) async {
    final $payload = <String, dynamic>{
      'body': body,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/cases/${Uri.encodeComponent(caseId)}/update-case-comment/${Uri.encodeComponent(commentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCaseCommentResponse.fromJson(response);
  }

  /// Updates the state transitions for a designated cases.
  ///
  /// <b>Self-managed</b>: the following states are available for self-managed
  /// cases.
  ///
  /// <ul>
  /// <li>
  /// Submitted → Detection and Analysis
  /// </li>
  /// <li>
  /// Detection and Analysis → Containment, Eradication, and Recovery
  /// </li>
  /// <li>
  /// Detection and Analysis → Post-incident Activities
  /// </li>
  /// <li>
  /// Containment, Eradication, and Recovery → Detection and Analysis
  /// </li>
  /// <li>
  /// Containment, Eradication, and Recovery → Post-incident Activities
  /// </li>
  /// <li>
  /// Post-incident Activities → Containment, Eradication, and Recovery
  /// </li>
  /// <li>
  /// Post-incident Activities → Detection and Analysis
  /// </li>
  /// <li>
  /// Any → Closed
  /// </li>
  /// </ul>
  /// <b>AWS supported</b>: You must use the <code>CloseCase</code> API to
  /// close.
  ///
  /// Parameter [caseId] :
  /// Required element for UpdateCaseStatus to identify the case to update.
  ///
  /// Parameter [caseStatus] :
  /// Required element for UpdateCaseStatus to identify the status for a case.
  /// Options include <code>Submitted | Detection and Analysis | Containment,
  /// Eradication and Recovery | Post-incident Activities</code>.
  Future<UpdateCaseStatusResponse> updateCaseStatus({
    required String caseId,
    required SelfManagedCaseStatus caseStatus,
  }) async {
    final $payload = <String, dynamic>{
      'caseStatus': caseStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/cases/${Uri.encodeComponent(caseId)}/update-case-status',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCaseStatusResponse.fromJson(response);
  }

  /// Updates the resolver type for a case.
  /// <important>
  /// This is a one-way action and cannot be reversed.
  /// </important>
  ///
  /// Parameter [caseId] :
  /// Required element for UpdateResolverType to identify the case to update.
  ///
  /// Parameter [resolverType] :
  /// Required element for UpdateResolverType to identify the new resolver.
  Future<UpdateResolverTypeResponse> updateResolverType({
    required String caseId,
    required ResolverType resolverType,
  }) async {
    final $payload = <String, dynamic>{
      'resolverType': resolverType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/cases/${Uri.encodeComponent(caseId)}/update-resolver-type',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResolverTypeResponse.fromJson(response);
  }

  /// Creates a new membership.
  ///
  /// Parameter [incidentResponseTeam] :
  /// Required element used in combination with CreateMembership to add customer
  /// incident response team members and trusted partners to the membership.
  ///
  /// Parameter [membershipName] :
  /// Required element used in combination with CreateMembership to create a
  /// name for the membership.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// The <code>clientToken</code> field is an idempotency key used to ensure
  /// that repeated attempts for a single action will be ignored by the server
  /// during retries. A caller supplied unique ID (typically a UUID) should be
  /// provided.
  /// </note>
  ///
  /// Parameter [coverEntireOrganization] :
  /// The <code>coverEntireOrganization</code> parameter is a boolean flag that
  /// determines whether the membership should be applied to the entire Amazon
  /// Web Services Organization. When set to true, the membership will be
  /// created for all accounts within the organization. When set to false, the
  /// membership will only be created for specified accounts.
  ///
  /// This parameter is optional. If not specified, the default value is false.
  ///
  /// <ul>
  /// <li>
  /// If set to <i>true</i>: The membership will automatically include all
  /// existing and future accounts in the Amazon Web Services Organization.
  /// </li>
  /// <li>
  /// If set to <i>false</i>: The membership will only apply to explicitly
  /// specified accounts.
  /// </li>
  /// </ul>
  ///
  /// Parameter [optInFeatures] :
  /// Optional element to enable the monitoring and investigation opt-in
  /// features for the service.
  ///
  /// Parameter [tags] :
  /// Optional element for customer configured tags.
  Future<CreateMembershipResponse> createMembership({
    required List<IncidentResponder> incidentResponseTeam,
    required String membershipName,
    String? clientToken,
    bool? coverEntireOrganization,
    List<OptInFeature>? optInFeatures,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'incidentResponseTeam': incidentResponseTeam,
      'membershipName': membershipName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (coverEntireOrganization != null)
        'coverEntireOrganization': coverEntireOrganization,
      if (optInFeatures != null) 'optInFeatures': optInFeatures,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/membership',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMembershipResponse.fromJson(response);
  }

  /// Returns the attributes of a membership.
  ///
  /// Parameter [membershipId] :
  /// Required element for GetMembership to identify the membership ID to query.
  Future<GetMembershipResponse> getMembership({
    required String membershipId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/membership/${Uri.encodeComponent(membershipId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMembershipResponse.fromJson(response);
  }

  /// Updates membership configuration.
  ///
  /// Parameter [membershipId] :
  /// Required element for UpdateMembership to identify the membership to
  /// update.
  ///
  /// Parameter [incidentResponseTeam] :
  /// Optional element for UpdateMembership to update the membership name.
  ///
  /// Parameter [membershipAccountsConfigurationsUpdate] :
  /// The <code>membershipAccountsConfigurationsUpdate</code> field in the
  /// <code>UpdateMembershipRequest</code> structure allows you to update the
  /// configuration settings for accounts within a membership.
  ///
  /// This field is optional and contains a structure of type
  /// <code>MembershipAccountsConfigurationsUpdate </code> that specifies the
  /// updated account configurations for the membership.
  ///
  /// Parameter [membershipName] :
  /// Optional element for UpdateMembership to update the membership name.
  ///
  /// Parameter [optInFeatures] :
  /// Optional element for UpdateMembership to enable or disable opt-in features
  /// for the service.
  ///
  /// Parameter [undoMembershipCancellation] :
  /// The <code>undoMembershipCancellation</code> parameter is a boolean flag
  /// that indicates whether to reverse a previously requested membership
  /// cancellation. When set to true, this will revoke the cancellation request
  /// and maintain the membership status.
  ///
  /// This parameter is optional and can be used in scenarios where you need to
  /// restore a membership that was marked for cancellation but hasn't been
  /// fully terminated yet.
  ///
  /// <ul>
  /// <li>
  /// If set to <code>true</code>, the cancellation request will be revoked
  /// </li>
  /// <li>
  /// If set to <code>false</code> the service will throw a ValidationException.
  /// </li>
  /// </ul>
  Future<void> updateMembership({
    required String membershipId,
    List<IncidentResponder>? incidentResponseTeam,
    MembershipAccountsConfigurationsUpdate?
        membershipAccountsConfigurationsUpdate,
    String? membershipName,
    List<OptInFeature>? optInFeatures,
    bool? undoMembershipCancellation,
  }) async {
    final $payload = <String, dynamic>{
      if (incidentResponseTeam != null)
        'incidentResponseTeam': incidentResponseTeam,
      if (membershipAccountsConfigurationsUpdate != null)
        'membershipAccountsConfigurationsUpdate':
            membershipAccountsConfigurationsUpdate,
      if (membershipName != null) 'membershipName': membershipName,
      if (optInFeatures != null) 'optInFeatures': optInFeatures,
      if (undoMembershipCancellation != null)
        'undoMembershipCancellation': undoMembershipCancellation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/membership/${Uri.encodeComponent(membershipId)}/update-membership',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the memberships that the calling principal can access.
  ///
  /// Parameter [maxResults] :
  /// Request element for ListMemberships to limit the number of responses.
  ///
  /// Parameter [nextToken] :
  /// An optional string that, if supplied, must be copied from the output of a
  /// previous call to ListMemberships. When provided in this manner, the API
  /// fetches the next page of results.
  Future<ListMembershipsResponse> listMemberships({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/memberships',
      exceptionFnMap: _exceptionFns,
    );
    return ListMembershipsResponse.fromJson(response);
  }

  /// Provides information on whether the supplied account IDs are associated
  /// with a membership.
  /// <note>
  /// AWS account ID's may appear less than 12 characters and need to be
  /// zero-prepended. An example would be <code>123123123</code> which is nine
  /// digits, and with zero-prepend would be <code>000123123123</code>. Not
  /// zero-prepending to 12 digits could result in errors.
  /// </note>
  ///
  /// Parameter [accountIds] :
  /// Optional element to query the membership relationship status to a provided
  /// list of account IDs.
  /// <note>
  /// AWS account ID's may appear less than 12 characters and need to be
  /// zero-prepended. An example would be <code>123123123</code> which is nine
  /// digits, and with zero-prepend would be <code>000123123123</code>. Not
  /// zero-prepending to 12 digits could result in errors.
  /// </note>
  ///
  /// Parameter [membershipId] :
  /// Required element used in combination with BatchGetMemberAccountDetails to
  /// identify the membership ID to query.
  Future<BatchGetMemberAccountDetailsResponse> batchGetMemberAccountDetails({
    required List<String> accountIds,
    required String membershipId,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/membership/${Uri.encodeComponent(membershipId)}/batch-member-details',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetMemberAccountDetailsResponse.fromJson(response);
  }

  /// Cancels an existing membership.
  ///
  /// Parameter [membershipId] :
  /// Required element used in combination with CancelMembershipRequest to
  /// identify the membership ID to cancel.
  Future<CancelMembershipResponse> cancelMembership({
    required String membershipId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/v1/membership/${Uri.encodeComponent(membershipId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelMembershipResponse.fromJson(response);
  }
}

class ListTagsForResourceOutput {
  /// Response element for ListTagsForResource providing content for each
  /// configured tag.
  final Map<String, String> tags;

  ListTagsForResourceOutput({
    required this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateCaseResponse {
  /// A response element providing responses for requests to CreateCase. This
  /// element responds with the case ID.
  final String caseId;

  CreateCaseResponse({
    required this.caseId,
  });

  factory CreateCaseResponse.fromJson(Map<String, dynamic> json) {
    return CreateCaseResponse(
      caseId: (json['caseId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    return {
      'caseId': caseId,
    };
  }
}

class GetCaseResponse {
  /// Response element for GetCase that provides the actual incident start date as
  /// identified by data analysis during the investigation.
  final DateTime? actualIncidentStartDate;

  /// Response element for GetCase that provides the case ARN
  final String? caseArn;

  /// Response element for GetCase that provides a list of current case
  /// attachments.
  final List<CaseAttachmentAttributes>? caseAttachments;

  /// Case response metadata
  final List<CaseMetadataEntry>? caseMetadata;

  /// Response element for GetCase that provides the case status. Options for
  /// statuses include <code>Submitted | Detection and Analysis | Eradication,
  /// Containment and Recovery | Post-Incident Activities | Closed </code>
  final CaseStatus? caseStatus;

  /// Response element for GetCase that provides the date a specified case was
  /// closed.
  final DateTime? closedDate;

  /// Response element for GetCase that provides the summary code for why a case
  /// was closed.
  final ClosureCode? closureCode;

  /// Response element for GetCase that provides the date the case was created.
  final DateTime? createdDate;

  /// Response element for GetCase that provides contents of the case description.
  final String? description;

  /// Response element for GetCase that provides the engagement type. Options for
  /// engagement type include <code>Active Security Event | Investigations</code>
  final EngagementType? engagementType;

  /// Response element for GetCase that provides a list of impacted accounts.
  final List<String>? impactedAccounts;

  /// Response element for GetCase that provides the impacted regions.
  final List<ImpactedAwsRegion>? impactedAwsRegions;

  /// Response element for GetCase that provides a list of impacted services.
  final List<String>? impactedServices;

  /// Response element for GetCase that provides the date a case was last
  /// modified.
  final DateTime? lastUpdatedDate;

  /// Response element for GetCase that identifies the case is waiting on customer
  /// input.
  final PendingAction? pendingAction;

  /// Response element for GetCase that provides the customer provided incident
  /// start date.
  final DateTime? reportedIncidentStartDate;

  /// Response element for GetCase that provides the current resolver types.
  final ResolverType? resolverType;

  /// Response element for GetCase that provides a list of suspicious IP addresses
  /// associated with unauthorized activity.
  final List<ThreatActorIp>? threatActorIpAddresses;

  /// Response element for GetCase that provides the case title.
  final String? title;

  /// Response element for GetCase that provides a list of Watchers added to the
  /// case.
  final List<Watcher>? watchers;

  GetCaseResponse({
    this.actualIncidentStartDate,
    this.caseArn,
    this.caseAttachments,
    this.caseMetadata,
    this.caseStatus,
    this.closedDate,
    this.closureCode,
    this.createdDate,
    this.description,
    this.engagementType,
    this.impactedAccounts,
    this.impactedAwsRegions,
    this.impactedServices,
    this.lastUpdatedDate,
    this.pendingAction,
    this.reportedIncidentStartDate,
    this.resolverType,
    this.threatActorIpAddresses,
    this.title,
    this.watchers,
  });

  factory GetCaseResponse.fromJson(Map<String, dynamic> json) {
    return GetCaseResponse(
      actualIncidentStartDate:
          timeStampFromJson(json['actualIncidentStartDate']),
      caseArn: json['caseArn'] as String?,
      caseAttachments: (json['caseAttachments'] as List?)
          ?.nonNulls
          .map((e) =>
              CaseAttachmentAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      caseMetadata: (json['caseMetadata'] as List?)
          ?.nonNulls
          .map((e) => CaseMetadataEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      caseStatus: (json['caseStatus'] as String?)?.let(CaseStatus.fromString),
      closedDate: timeStampFromJson(json['closedDate']),
      closureCode:
          (json['closureCode'] as String?)?.let(ClosureCode.fromString),
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      engagementType:
          (json['engagementType'] as String?)?.let(EngagementType.fromString),
      impactedAccounts: (json['impactedAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      impactedAwsRegions: (json['impactedAwsRegions'] as List?)
          ?.nonNulls
          .map((e) => ImpactedAwsRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
      impactedServices: (json['impactedServices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      pendingAction:
          (json['pendingAction'] as String?)?.let(PendingAction.fromString),
      reportedIncidentStartDate:
          timeStampFromJson(json['reportedIncidentStartDate']),
      resolverType:
          (json['resolverType'] as String?)?.let(ResolverType.fromString),
      threatActorIpAddresses: (json['threatActorIpAddresses'] as List?)
          ?.nonNulls
          .map((e) => ThreatActorIp.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      watchers: (json['watchers'] as List?)
          ?.nonNulls
          .map((e) => Watcher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actualIncidentStartDate = this.actualIncidentStartDate;
    final caseArn = this.caseArn;
    final caseAttachments = this.caseAttachments;
    final caseMetadata = this.caseMetadata;
    final caseStatus = this.caseStatus;
    final closedDate = this.closedDate;
    final closureCode = this.closureCode;
    final createdDate = this.createdDate;
    final description = this.description;
    final engagementType = this.engagementType;
    final impactedAccounts = this.impactedAccounts;
    final impactedAwsRegions = this.impactedAwsRegions;
    final impactedServices = this.impactedServices;
    final lastUpdatedDate = this.lastUpdatedDate;
    final pendingAction = this.pendingAction;
    final reportedIncidentStartDate = this.reportedIncidentStartDate;
    final resolverType = this.resolverType;
    final threatActorIpAddresses = this.threatActorIpAddresses;
    final title = this.title;
    final watchers = this.watchers;
    return {
      if (actualIncidentStartDate != null)
        'actualIncidentStartDate': unixTimestampToJson(actualIncidentStartDate),
      if (caseArn != null) 'caseArn': caseArn,
      if (caseAttachments != null) 'caseAttachments': caseAttachments,
      if (caseMetadata != null) 'caseMetadata': caseMetadata,
      if (caseStatus != null) 'caseStatus': caseStatus.value,
      if (closedDate != null) 'closedDate': unixTimestampToJson(closedDate),
      if (closureCode != null) 'closureCode': closureCode.value,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (engagementType != null) 'engagementType': engagementType.value,
      if (impactedAccounts != null) 'impactedAccounts': impactedAccounts,
      if (impactedAwsRegions != null) 'impactedAwsRegions': impactedAwsRegions,
      if (impactedServices != null) 'impactedServices': impactedServices,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (pendingAction != null) 'pendingAction': pendingAction.value,
      if (reportedIncidentStartDate != null)
        'reportedIncidentStartDate':
            unixTimestampToJson(reportedIncidentStartDate),
      if (resolverType != null) 'resolverType': resolverType.value,
      if (threatActorIpAddresses != null)
        'threatActorIpAddresses': threatActorIpAddresses,
      if (title != null) 'title': title,
      if (watchers != null) 'watchers': watchers,
    };
  }
}

class UpdateCaseResponse {
  UpdateCaseResponse();

  factory UpdateCaseResponse.fromJson(Map<String, dynamic> _) {
    return UpdateCaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListCasesResponse {
  /// Response element for ListCases that includes caseARN, caseID, caseStatus,
  /// closedDate, createdDate, engagementType, lastUpdatedDate, pendingAction,
  /// resolverType, and title for each response.
  final List<ListCasesItem>? items;

  /// An optional string that, if supplied on subsequent calls to ListCases,
  /// allows the API to fetch the next page of results.
  final String? nextToken;

  /// Response element for ListCases providing the total number of responses.
  final int? total;

  ListCasesResponse({
    this.items,
    this.nextToken,
    this.total,
  });

  factory ListCasesResponse.fromJson(Map<String, dynamic> json) {
    return ListCasesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ListCasesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    final total = this.total;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
      if (total != null) 'total': total,
    };
  }
}

class CloseCaseResponse {
  /// A response element providing responses for requests to CloseCase. This
  /// element responds <code>Closed </code> if successful.
  final CaseStatus? caseStatus;

  /// A response element providing responses for requests to CloseCase. This
  /// element responds with the ISO-8601 formatted timestamp of the moment when
  /// the case was closed.
  final DateTime? closedDate;

  CloseCaseResponse({
    this.caseStatus,
    this.closedDate,
  });

  factory CloseCaseResponse.fromJson(Map<String, dynamic> json) {
    return CloseCaseResponse(
      caseStatus: (json['caseStatus'] as String?)?.let(CaseStatus.fromString),
      closedDate: timeStampFromJson(json['closedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final caseStatus = this.caseStatus;
    final closedDate = this.closedDate;
    return {
      if (caseStatus != null) 'caseStatus': caseStatus.value,
      if (closedDate != null) 'closedDate': unixTimestampToJson(closedDate),
    };
  }
}

class CreateCaseCommentResponse {
  /// Response element indicating the new comment ID.
  final String commentId;

  CreateCaseCommentResponse({
    required this.commentId,
  });

  factory CreateCaseCommentResponse.fromJson(Map<String, dynamic> json) {
    return CreateCaseCommentResponse(
      commentId: (json['commentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final commentId = this.commentId;
    return {
      'commentId': commentId,
    };
  }
}

class GetCaseAttachmentDownloadUrlResponse {
  /// Response element providing the Amazon S3 presigned URL to download an
  /// attachment.
  final String attachmentPresignedUrl;

  GetCaseAttachmentDownloadUrlResponse({
    required this.attachmentPresignedUrl,
  });

  factory GetCaseAttachmentDownloadUrlResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCaseAttachmentDownloadUrlResponse(
      attachmentPresignedUrl: (json['attachmentPresignedUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentPresignedUrl = this.attachmentPresignedUrl;
    return {
      'attachmentPresignedUrl': attachmentPresignedUrl,
    };
  }
}

class GetCaseAttachmentUploadUrlResponse {
  /// Response element providing the Amazon S3 presigned URL to upload the
  /// attachment.
  final String attachmentPresignedUrl;

  GetCaseAttachmentUploadUrlResponse({
    required this.attachmentPresignedUrl,
  });

  factory GetCaseAttachmentUploadUrlResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCaseAttachmentUploadUrlResponse(
      attachmentPresignedUrl: (json['attachmentPresignedUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentPresignedUrl = this.attachmentPresignedUrl;
    return {
      'attachmentPresignedUrl': attachmentPresignedUrl,
    };
  }
}

class ListCaseEditsResponse {
  /// Response element for ListCaseEdits that includes the action, event
  /// timestamp, message, and principal for the response.
  final List<CaseEditItem>? items;

  /// An optional string that, if supplied on subsequent calls to ListCaseEdits,
  /// allows the API to fetch the next page of results.
  final String? nextToken;

  /// Response element for ListCaseEdits that identifies the total number of
  /// edits.
  final int? total;

  ListCaseEditsResponse({
    this.items,
    this.nextToken,
    this.total,
  });

  factory ListCaseEditsResponse.fromJson(Map<String, dynamic> json) {
    return ListCaseEditsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => CaseEditItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    final total = this.total;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
      if (total != null) 'total': total,
    };
  }
}

class ListCommentsResponse {
  /// Response element for ListComments providing the body, commentID, createDate,
  /// creator, lastUpdatedBy and lastUpdatedDate for each response.
  final List<ListCommentsItem>? items;

  /// An optional string that, if supplied on subsequent calls to ListComments,
  /// allows the API to fetch the next page of results.
  final String? nextToken;

  /// Response element for ListComments identifying the number of responses.
  final int? total;

  ListCommentsResponse({
    this.items,
    this.nextToken,
    this.total,
  });

  factory ListCommentsResponse.fromJson(Map<String, dynamic> json) {
    return ListCommentsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ListCommentsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    final total = this.total;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
      if (total != null) 'total': total,
    };
  }
}

class ListInvestigationsResponse {
  /// Investigation performed by an agent for a security incid…Unique identifier
  /// for the specific investigation&gt;
  final List<InvestigationAction> investigationActions;

  /// Investigation performed by an agent for a security incident for next Token
  final String? nextToken;

  ListInvestigationsResponse({
    required this.investigationActions,
    this.nextToken,
  });

  factory ListInvestigationsResponse.fromJson(Map<String, dynamic> json) {
    return ListInvestigationsResponse(
      investigationActions: ((json['investigationActions'] as List?) ??
              const [])
          .nonNulls
          .map((e) => InvestigationAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final investigationActions = this.investigationActions;
    final nextToken = this.nextToken;
    return {
      'investigationActions': investigationActions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class SendFeedbackResponse {
  SendFeedbackResponse();

  factory SendFeedbackResponse.fromJson(Map<String, dynamic> _) {
    return SendFeedbackResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateCaseCommentResponse {
  /// Response element for UpdateCaseComment providing the updated comment ID.
  final String commentId;

  /// Response element for UpdateCaseComment providing the updated comment
  /// content.
  final String? body;

  UpdateCaseCommentResponse({
    required this.commentId,
    this.body,
  });

  factory UpdateCaseCommentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCaseCommentResponse(
      commentId: (json['commentId'] as String?) ?? '',
      body: json['body'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commentId = this.commentId;
    final body = this.body;
    return {
      'commentId': commentId,
      if (body != null) 'body': body,
    };
  }
}

class UpdateCaseStatusResponse {
  /// Response element for UpdateCaseStatus showing the newly configured status.
  final SelfManagedCaseStatus? caseStatus;

  UpdateCaseStatusResponse({
    this.caseStatus,
  });

  factory UpdateCaseStatusResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCaseStatusResponse(
      caseStatus: (json['caseStatus'] as String?)
          ?.let(SelfManagedCaseStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final caseStatus = this.caseStatus;
    return {
      if (caseStatus != null) 'caseStatus': caseStatus.value,
    };
  }
}

class UpdateResolverTypeResponse {
  /// Response element for UpdateResolver identifying the case ID being updated.
  final String caseId;

  /// Response element for UpdateResolver identifying the current status of the
  /// case.
  final CaseStatus? caseStatus;

  /// Response element for UpdateResolver identifying the current resolver of the
  /// case.
  final ResolverType? resolverType;

  UpdateResolverTypeResponse({
    required this.caseId,
    this.caseStatus,
    this.resolverType,
  });

  factory UpdateResolverTypeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResolverTypeResponse(
      caseId: (json['caseId'] as String?) ?? '',
      caseStatus: (json['caseStatus'] as String?)?.let(CaseStatus.fromString),
      resolverType:
          (json['resolverType'] as String?)?.let(ResolverType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    final caseStatus = this.caseStatus;
    final resolverType = this.resolverType;
    return {
      'caseId': caseId,
      if (caseStatus != null) 'caseStatus': caseStatus.value,
      if (resolverType != null) 'resolverType': resolverType.value,
    };
  }
}

class CreateMembershipResponse {
  /// Response element for CreateMembership providing the newly created membership
  /// ID.
  final String membershipId;

  CreateMembershipResponse({
    required this.membershipId,
  });

  factory CreateMembershipResponse.fromJson(Map<String, dynamic> json) {
    return CreateMembershipResponse(
      membershipId: (json['membershipId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final membershipId = this.membershipId;
    return {
      'membershipId': membershipId,
    };
  }
}

class GetMembershipResponse {
  /// Response element for GetMembership that provides the queried membership ID.
  final String membershipId;

  /// Response element for GetMembership that provides the account configured to
  /// manage the membership.
  final String? accountId;

  /// Response element for GetMembership that provides the configured membership
  /// type. Options include <code> Standalone | Organizations</code>.
  final CustomerType? customerType;

  /// Response element for GetMembership that provides the configured membership
  /// incident response team members.
  final List<IncidentResponder>? incidentResponseTeam;

  /// The <code>membershipAccountsConfigurations</code> field contains the
  /// configuration details for member accounts within the Amazon Web Services
  /// Organizations membership structure.
  ///
  /// This field returns a structure containing information about:
  ///
  /// <ul>
  /// <li>
  /// Account configurations for member accounts
  /// </li>
  /// <li>
  /// Membership settings and preferences
  /// </li>
  /// <li>
  /// Account-level permissions and roles
  /// </li>
  /// </ul>
  final MembershipAccountsConfigurations? membershipAccountsConfigurations;

  /// Response element for GetMembership that provides the configured membership
  /// activation timestamp.
  final DateTime? membershipActivationTimestamp;

  /// Response element for GetMembership that provides the membership ARN.
  final String? membershipArn;

  /// Response element for GetMembership that provides the configured membership
  /// name deactivation timestamp.
  final DateTime? membershipDeactivationTimestamp;

  /// Response element for GetMembership that provides the configured membership
  /// name.
  final String? membershipName;

  /// Response element for GetMembership that provides the current membership
  /// status.
  final MembershipStatus? membershipStatus;

  /// Response element for GetMembership that provides the number of accounts in
  /// the membership.
  final int? numberOfAccountsCovered;

  /// Response element for GetMembership that provides the if opt-in features have
  /// been enabled.
  final List<OptInFeature>? optInFeatures;

  /// Response element for GetMembership that provides the region configured to
  /// manage the membership.
  final AwsRegion? region;

  GetMembershipResponse({
    required this.membershipId,
    this.accountId,
    this.customerType,
    this.incidentResponseTeam,
    this.membershipAccountsConfigurations,
    this.membershipActivationTimestamp,
    this.membershipArn,
    this.membershipDeactivationTimestamp,
    this.membershipName,
    this.membershipStatus,
    this.numberOfAccountsCovered,
    this.optInFeatures,
    this.region,
  });

  factory GetMembershipResponse.fromJson(Map<String, dynamic> json) {
    return GetMembershipResponse(
      membershipId: (json['membershipId'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      customerType:
          (json['customerType'] as String?)?.let(CustomerType.fromString),
      incidentResponseTeam: (json['incidentResponseTeam'] as List?)
          ?.nonNulls
          .map((e) => IncidentResponder.fromJson(e as Map<String, dynamic>))
          .toList(),
      membershipAccountsConfigurations:
          json['membershipAccountsConfigurations'] != null
              ? MembershipAccountsConfigurations.fromJson(
                  json['membershipAccountsConfigurations']
                      as Map<String, dynamic>)
              : null,
      membershipActivationTimestamp:
          timeStampFromJson(json['membershipActivationTimestamp']),
      membershipArn: json['membershipArn'] as String?,
      membershipDeactivationTimestamp:
          timeStampFromJson(json['membershipDeactivationTimestamp']),
      membershipName: json['membershipName'] as String?,
      membershipStatus: (json['membershipStatus'] as String?)
          ?.let(MembershipStatus.fromString),
      numberOfAccountsCovered: json['numberOfAccountsCovered'] as int?,
      optInFeatures: (json['optInFeatures'] as List?)
          ?.nonNulls
          .map((e) => OptInFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: (json['region'] as String?)?.let(AwsRegion.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final membershipId = this.membershipId;
    final accountId = this.accountId;
    final customerType = this.customerType;
    final incidentResponseTeam = this.incidentResponseTeam;
    final membershipAccountsConfigurations =
        this.membershipAccountsConfigurations;
    final membershipActivationTimestamp = this.membershipActivationTimestamp;
    final membershipArn = this.membershipArn;
    final membershipDeactivationTimestamp =
        this.membershipDeactivationTimestamp;
    final membershipName = this.membershipName;
    final membershipStatus = this.membershipStatus;
    final numberOfAccountsCovered = this.numberOfAccountsCovered;
    final optInFeatures = this.optInFeatures;
    final region = this.region;
    return {
      'membershipId': membershipId,
      if (accountId != null) 'accountId': accountId,
      if (customerType != null) 'customerType': customerType.value,
      if (incidentResponseTeam != null)
        'incidentResponseTeam': incidentResponseTeam,
      if (membershipAccountsConfigurations != null)
        'membershipAccountsConfigurations': membershipAccountsConfigurations,
      if (membershipActivationTimestamp != null)
        'membershipActivationTimestamp':
            unixTimestampToJson(membershipActivationTimestamp),
      if (membershipArn != null) 'membershipArn': membershipArn,
      if (membershipDeactivationTimestamp != null)
        'membershipDeactivationTimestamp':
            unixTimestampToJson(membershipDeactivationTimestamp),
      if (membershipName != null) 'membershipName': membershipName,
      if (membershipStatus != null) 'membershipStatus': membershipStatus.value,
      if (numberOfAccountsCovered != null)
        'numberOfAccountsCovered': numberOfAccountsCovered,
      if (optInFeatures != null) 'optInFeatures': optInFeatures,
      if (region != null) 'region': region.value,
    };
  }
}

class UpdateMembershipResponse {
  UpdateMembershipResponse();

  factory UpdateMembershipResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMembershipResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListMembershipsResponse {
  /// Request element for ListMemberships including the accountID, membershipARN,
  /// membershipID, membershipStatus, and region for each response.
  final List<ListMembershipItem>? items;

  /// An optional string that, if supplied on subsequent calls to ListMemberships,
  /// allows the API to fetch the next page of results.
  final String? nextToken;

  ListMembershipsResponse({
    this.items,
    this.nextToken,
  });

  factory ListMembershipsResponse.fromJson(Map<String, dynamic> json) {
    return ListMembershipsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ListMembershipItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class BatchGetMemberAccountDetailsResponse {
  /// The response element providing error messages for requests to
  /// GetMembershipAccountDetails.
  final List<GetMembershipAccountDetailError>? errors;

  /// The response element providing responses for requests to
  /// GetMembershipAccountDetails.
  final List<GetMembershipAccountDetailItem>? items;

  BatchGetMemberAccountDetailsResponse({
    this.errors,
    this.items,
  });

  factory BatchGetMemberAccountDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetMemberAccountDetailsResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => GetMembershipAccountDetailError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => GetMembershipAccountDetailItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final items = this.items;
    return {
      if (errors != null) 'errors': errors,
      if (items != null) 'items': items,
    };
  }
}

class CancelMembershipResponse {
  /// The response element providing responses for requests to
  /// CancelMembershipRequest.
  final String membershipId;

  CancelMembershipResponse({
    required this.membershipId,
  });

  factory CancelMembershipResponse.fromJson(Map<String, dynamic> json) {
    return CancelMembershipResponse(
      membershipId: (json['membershipId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final membershipId = this.membershipId;
    return {
      'membershipId': membershipId,
    };
  }
}

/// <p/>
class GetMembershipAccountDetailError {
  /// <p/>
  final String accountId;

  /// <p/>
  final String error;

  /// <p/>
  final String message;

  GetMembershipAccountDetailError({
    required this.accountId,
    required this.error,
    required this.message,
  });

  factory GetMembershipAccountDetailError.fromJson(Map<String, dynamic> json) {
    return GetMembershipAccountDetailError(
      accountId: (json['accountId'] as String?) ?? '',
      error: (json['error'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final error = this.error;
    final message = this.message;
    return {
      'accountId': accountId,
      'error': error,
      'message': message,
    };
  }
}

/// <p/>
class GetMembershipAccountDetailItem {
  /// <p/>
  final String? accountId;

  /// <p/>
  final MembershipAccountRelationshipStatus? relationshipStatus;

  /// <p/>
  final MembershipAccountRelationshipType? relationshipType;

  GetMembershipAccountDetailItem({
    this.accountId,
    this.relationshipStatus,
    this.relationshipType,
  });

  factory GetMembershipAccountDetailItem.fromJson(Map<String, dynamic> json) {
    return GetMembershipAccountDetailItem(
      accountId: json['accountId'] as String?,
      relationshipStatus: (json['relationshipStatus'] as String?)
          ?.let(MembershipAccountRelationshipStatus.fromString),
      relationshipType: (json['relationshipType'] as String?)
          ?.let(MembershipAccountRelationshipType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final relationshipStatus = this.relationshipStatus;
    final relationshipType = this.relationshipType;
    return {
      if (accountId != null) 'accountId': accountId,
      if (relationshipStatus != null)
        'relationshipStatus': relationshipStatus.value,
      if (relationshipType != null) 'relationshipType': relationshipType.value,
    };
  }
}

class MembershipAccountRelationshipStatus {
  static const associated = MembershipAccountRelationshipStatus._('Associated');
  static const disassociated =
      MembershipAccountRelationshipStatus._('Disassociated');
  static const unassociated =
      MembershipAccountRelationshipStatus._('Unassociated');

  final String value;

  const MembershipAccountRelationshipStatus._(this.value);

  static const values = [associated, disassociated, unassociated];

  static MembershipAccountRelationshipStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipAccountRelationshipStatus._(value));

  @override
  bool operator ==(other) =>
      other is MembershipAccountRelationshipStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class MembershipAccountRelationshipType {
  static const organization =
      MembershipAccountRelationshipType._('Organization');
  static const unrelated = MembershipAccountRelationshipType._('Unrelated');

  final String value;

  const MembershipAccountRelationshipType._(this.value);

  static const values = [organization, unrelated];

  static MembershipAccountRelationshipType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipAccountRelationshipType._(value));

  @override
  bool operator ==(other) =>
      other is MembershipAccountRelationshipType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// <p/>
class ListMembershipItem {
  /// <p/>
  final String membershipId;

  /// <p/>
  final String? accountId;

  /// <p/>
  final String? membershipArn;

  /// <p/>
  final MembershipStatus? membershipStatus;

  /// <p/>
  final AwsRegion? region;

  ListMembershipItem({
    required this.membershipId,
    this.accountId,
    this.membershipArn,
    this.membershipStatus,
    this.region,
  });

  factory ListMembershipItem.fromJson(Map<String, dynamic> json) {
    return ListMembershipItem(
      membershipId: (json['membershipId'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      membershipArn: json['membershipArn'] as String?,
      membershipStatus: (json['membershipStatus'] as String?)
          ?.let(MembershipStatus.fromString),
      region: (json['region'] as String?)?.let(AwsRegion.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final membershipId = this.membershipId;
    final accountId = this.accountId;
    final membershipArn = this.membershipArn;
    final membershipStatus = this.membershipStatus;
    final region = this.region;
    return {
      'membershipId': membershipId,
      if (accountId != null) 'accountId': accountId,
      if (membershipArn != null) 'membershipArn': membershipArn,
      if (membershipStatus != null) 'membershipStatus': membershipStatus.value,
      if (region != null) 'region': region.value,
    };
  }
}

class AwsRegion {
  static const afSouth_1 = AwsRegion._('af-south-1');
  static const apEast_1 = AwsRegion._('ap-east-1');
  static const apEast_2 = AwsRegion._('ap-east-2');
  static const apNortheast_1 = AwsRegion._('ap-northeast-1');
  static const apNortheast_2 = AwsRegion._('ap-northeast-2');
  static const apNortheast_3 = AwsRegion._('ap-northeast-3');
  static const apSouth_1 = AwsRegion._('ap-south-1');
  static const apSouth_2 = AwsRegion._('ap-south-2');
  static const apSoutheast_1 = AwsRegion._('ap-southeast-1');
  static const apSoutheast_2 = AwsRegion._('ap-southeast-2');
  static const apSoutheast_3 = AwsRegion._('ap-southeast-3');
  static const apSoutheast_4 = AwsRegion._('ap-southeast-4');
  static const apSoutheast_5 = AwsRegion._('ap-southeast-5');
  static const apSoutheast_6 = AwsRegion._('ap-southeast-6');
  static const apSoutheast_7 = AwsRegion._('ap-southeast-7');
  static const caCentral_1 = AwsRegion._('ca-central-1');
  static const caWest_1 = AwsRegion._('ca-west-1');
  static const cnNorth_1 = AwsRegion._('cn-north-1');
  static const cnNorthwest_1 = AwsRegion._('cn-northwest-1');
  static const euCentral_1 = AwsRegion._('eu-central-1');
  static const euCentral_2 = AwsRegion._('eu-central-2');
  static const euNorth_1 = AwsRegion._('eu-north-1');
  static const euSouth_1 = AwsRegion._('eu-south-1');
  static const euSouth_2 = AwsRegion._('eu-south-2');
  static const euWest_1 = AwsRegion._('eu-west-1');
  static const euWest_2 = AwsRegion._('eu-west-2');
  static const euWest_3 = AwsRegion._('eu-west-3');
  static const ilCentral_1 = AwsRegion._('il-central-1');
  static const meCentral_1 = AwsRegion._('me-central-1');
  static const meSouth_1 = AwsRegion._('me-south-1');
  static const mxCentral_1 = AwsRegion._('mx-central-1');
  static const saEast_1 = AwsRegion._('sa-east-1');
  static const usEast_1 = AwsRegion._('us-east-1');
  static const usEast_2 = AwsRegion._('us-east-2');
  static const usWest_1 = AwsRegion._('us-west-1');
  static const usWest_2 = AwsRegion._('us-west-2');

  final String value;

  const AwsRegion._(this.value);

  static const values = [
    afSouth_1,
    apEast_1,
    apEast_2,
    apNortheast_1,
    apNortheast_2,
    apNortheast_3,
    apSouth_1,
    apSouth_2,
    apSoutheast_1,
    apSoutheast_2,
    apSoutheast_3,
    apSoutheast_4,
    apSoutheast_5,
    apSoutheast_6,
    apSoutheast_7,
    caCentral_1,
    caWest_1,
    cnNorth_1,
    cnNorthwest_1,
    euCentral_1,
    euCentral_2,
    euNorth_1,
    euSouth_1,
    euSouth_2,
    euWest_1,
    euWest_2,
    euWest_3,
    ilCentral_1,
    meCentral_1,
    meSouth_1,
    mxCentral_1,
    saEast_1,
    usEast_1,
    usEast_2,
    usWest_1,
    usWest_2
  ];

  static AwsRegion fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AwsRegion._(value));

  @override
  bool operator ==(other) => other is AwsRegion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class MembershipStatus {
  static const active = MembershipStatus._('Active');
  static const cancelled = MembershipStatus._('Cancelled');
  static const terminated = MembershipStatus._('Terminated');

  final String value;

  const MembershipStatus._(this.value);

  static const values = [active, cancelled, terminated];

  static MembershipStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipStatus._(value));

  @override
  bool operator ==(other) => other is MembershipStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The <code>MembershipAccountsConfigurationsUpdate</code>structure represents
/// the configuration updates for member accounts within an Amazon Web Services
/// organization.
///
/// This structure is used to modify existing account configurations and
/// settings for members in the organization. When applying updates, ensure all
/// required fields are properly specified to maintain account consistency.
///
/// Key considerations when using this structure:
///
/// <ul>
/// <li>
/// All configuration changes are validated before being applied
/// </li>
/// <li>
/// Updates are processed asynchronously in the background
/// </li>
/// <li>
/// Configuration changes may take several minutes to propagate across all
/// affected accounts
/// </li>
/// </ul>
class MembershipAccountsConfigurationsUpdate {
  /// The <code>coverEntireOrganization</code> field is a boolean value that
  /// determines whether the membership configuration should be applied across the
  /// entire Amazon Web Services Organization.
  ///
  /// When set to <code>true</code>, the configuration will be applied to all
  /// accounts within the organization. When set to <code>false</code>, the
  /// configuration will only apply to specifically designated accounts.
  final bool? coverEntireOrganization;

  /// A list of organizational unit IDs to add to the membership configuration.
  /// Each organizational unit ID must match the pattern
  /// <code>ou-[0-9a-z]{4,32}-[a-z0-9]{8,32}</code>.
  ///
  /// The list must contain between 1 and 5 organizational unit IDs.
  final List<String>? organizationalUnitsToAdd;

  /// A list of organizational unit IDs to remove from the membership
  /// configuration. Each organizational unit ID must match the pattern
  /// <code>ou-[0-9a-z]{4,32}-[a-z0-9]{8,32}</code>.
  ///
  /// The list must contain between 1 and 5 organizational unit IDs per invocation
  /// of the API request.
  final List<String>? organizationalUnitsToRemove;

  MembershipAccountsConfigurationsUpdate({
    this.coverEntireOrganization,
    this.organizationalUnitsToAdd,
    this.organizationalUnitsToRemove,
  });

  Map<String, dynamic> toJson() {
    final coverEntireOrganization = this.coverEntireOrganization;
    final organizationalUnitsToAdd = this.organizationalUnitsToAdd;
    final organizationalUnitsToRemove = this.organizationalUnitsToRemove;
    return {
      if (coverEntireOrganization != null)
        'coverEntireOrganization': coverEntireOrganization,
      if (organizationalUnitsToAdd != null)
        'organizationalUnitsToAdd': organizationalUnitsToAdd,
      if (organizationalUnitsToRemove != null)
        'organizationalUnitsToRemove': organizationalUnitsToRemove,
    };
  }
}

/// <p/>
class OptInFeature {
  /// <p/>
  final OptInFeatureName featureName;

  /// <p/>
  final bool isEnabled;

  OptInFeature({
    required this.featureName,
    required this.isEnabled,
  });

  factory OptInFeature.fromJson(Map<String, dynamic> json) {
    return OptInFeature(
      featureName:
          OptInFeatureName.fromString((json['featureName'] as String?) ?? ''),
      isEnabled: (json['isEnabled'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final featureName = this.featureName;
    final isEnabled = this.isEnabled;
    return {
      'featureName': featureName.value,
      'isEnabled': isEnabled,
    };
  }
}

class OptInFeatureName {
  static const triage = OptInFeatureName._('Triage');

  final String value;

  const OptInFeatureName._(this.value);

  static const values = [triage];

  static OptInFeatureName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OptInFeatureName._(value));

  @override
  bool operator ==(other) => other is OptInFeatureName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// <p/>
class IncidentResponder {
  /// <p/>
  final String email;

  /// <p/>
  final String jobTitle;

  /// <p/>
  final String name;

  /// <p/>
  final List<CommunicationType>? communicationPreferences;

  IncidentResponder({
    required this.email,
    required this.jobTitle,
    required this.name,
    this.communicationPreferences,
  });

  factory IncidentResponder.fromJson(Map<String, dynamic> json) {
    return IncidentResponder(
      email: (json['email'] as String?) ?? '',
      jobTitle: (json['jobTitle'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      communicationPreferences: (json['communicationPreferences'] as List?)
          ?.nonNulls
          .map((e) => CommunicationType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final jobTitle = this.jobTitle;
    final name = this.name;
    final communicationPreferences = this.communicationPreferences;
    return {
      'email': email,
      'jobTitle': jobTitle,
      'name': name,
      if (communicationPreferences != null)
        'communicationPreferences':
            communicationPreferences.map((e) => e.value).toList(),
    };
  }
}

class CommunicationType {
  static const caseCreated = CommunicationType._('Case Created');
  static const caseUpdated = CommunicationType._('Case Updated');
  static const caseAcknowledged = CommunicationType._('Case Acknowledged');
  static const caseClosed = CommunicationType._('Case Closed');
  static const caseUpdatedToServiceManaged =
      CommunicationType._('Case Updated To Service Managed');
  static const caseStatusUpdated = CommunicationType._('Case Status Updated');
  static const casePendingCustomerActionReminder =
      CommunicationType._('Case Pending Customer Action Reminder');
  static const caseAttachmentUrlUploaded =
      CommunicationType._('Case Attachment Url Uploaded');
  static const caseCommentAdded = CommunicationType._('Case Comment Added');
  static const caseCommentUpdated = CommunicationType._('Case Comment Updated');
  static const membershipCreated = CommunicationType._('Membership Created');
  static const membershipUpdated = CommunicationType._('Membership Updated');
  static const membershipCancelled =
      CommunicationType._('Membership Cancelled');
  static const registerDelegatedAdministrator =
      CommunicationType._('Register Delegated Administrator');
  static const deregisterDelegatedAdministrator =
      CommunicationType._('Deregister Delegated Administrator');
  static const disableAwsServiceAccess =
      CommunicationType._('Disable AWS Service Access');

  final String value;

  const CommunicationType._(this.value);

  static const values = [
    caseCreated,
    caseUpdated,
    caseAcknowledged,
    caseClosed,
    caseUpdatedToServiceManaged,
    caseStatusUpdated,
    casePendingCustomerActionReminder,
    caseAttachmentUrlUploaded,
    caseCommentAdded,
    caseCommentUpdated,
    membershipCreated,
    membershipUpdated,
    membershipCancelled,
    registerDelegatedAdministrator,
    deregisterDelegatedAdministrator,
    disableAwsServiceAccess
  ];

  static CommunicationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CommunicationType._(value));

  @override
  bool operator ==(other) => other is CommunicationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class CustomerType {
  static const standalone = CustomerType._('Standalone');
  static const organization = CustomerType._('Organization');

  final String value;

  const CustomerType._(this.value);

  static const values = [standalone, organization];

  static CustomerType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CustomerType._(value));

  @override
  bool operator ==(other) => other is CustomerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The <code>MembershipAccountsConfigurations</code> structure defines the
/// configuration settings for managing membership accounts withinAmazon Web
/// Services.
///
/// This structure contains settings that determine how member accounts are
/// configured and managed within your organization, including:
///
/// <ul>
/// <li>
/// Account configuration preferences
/// </li>
/// <li>
/// Membership validation rules
/// </li>
/// <li>
/// Account access settings
/// </li>
/// </ul>
/// You can use this structure to define and maintain standardized
/// configurations across multiple member accounts in your organization.
class MembershipAccountsConfigurations {
  /// The <code>coverEntireOrganization</code> field is a boolean value that
  /// determines whether the membership configuration applies to all accounts
  /// within an Amazon Web Services Organization.
  ///
  /// When set to <code>true</code>, the configuration will be applied across all
  /// accounts in the organization. When set to <code>false</code>, the
  /// configuration will only apply to specifically designated accounts under the
  /// AWS Organizational Units specificied.
  final bool? coverEntireOrganization;

  /// A list of organizational unit IDs that follow the pattern
  /// <code>ou-[0-9a-z]{4,32}-[a-z0-9]{8,32}</code>. These IDs represent the
  /// organizational units within an Amazon Web Services Organizations structure
  /// that are covered by the membership.
  ///
  /// Each organizational unit ID in the list must:
  ///
  /// <ul>
  /// <li>
  /// Begin with the prefix 'ou-'
  /// </li>
  /// <li>
  /// Contain between 4 and 32 alphanumeric characters in the first segment
  /// </li>
  /// <li>
  /// Contain between 8 and 32 alphanumeric characters in the second segment
  /// </li>
  /// </ul>
  final List<String>? organizationalUnits;

  MembershipAccountsConfigurations({
    this.coverEntireOrganization,
    this.organizationalUnits,
  });

  factory MembershipAccountsConfigurations.fromJson(Map<String, dynamic> json) {
    return MembershipAccountsConfigurations(
      coverEntireOrganization: json['coverEntireOrganization'] as bool?,
      organizationalUnits: (json['organizationalUnits'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final coverEntireOrganization = this.coverEntireOrganization;
    final organizationalUnits = this.organizationalUnits;
    return {
      if (coverEntireOrganization != null)
        'coverEntireOrganization': coverEntireOrganization,
      if (organizationalUnits != null)
        'organizationalUnits': organizationalUnits,
    };
  }
}

class CaseStatus {
  static const submitted = CaseStatus._('Submitted');
  static const acknowledged = CaseStatus._('Acknowledged');
  static const detectionAndAnalysis = CaseStatus._('Detection and Analysis');
  static const containmentEradicationAndRecovery =
      CaseStatus._('Containment, Eradication and Recovery');
  static const postIncidentActivities =
      CaseStatus._('Post-incident Activities');
  static const readyToClose = CaseStatus._('Ready to Close');
  static const closed = CaseStatus._('Closed');

  final String value;

  const CaseStatus._(this.value);

  static const values = [
    submitted,
    acknowledged,
    detectionAndAnalysis,
    containmentEradicationAndRecovery,
    postIncidentActivities,
    readyToClose,
    closed
  ];

  static CaseStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CaseStatus._(value));

  @override
  bool operator ==(other) => other is CaseStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ResolverType {
  static const aws = ResolverType._('AWS');
  static const self = ResolverType._('Self');

  final String value;

  const ResolverType._(this.value);

  static const values = [aws, self];

  static ResolverType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResolverType._(value));

  @override
  bool operator ==(other) => other is ResolverType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SelfManagedCaseStatus {
  static const submitted = SelfManagedCaseStatus._('Submitted');
  static const detectionAndAnalysis =
      SelfManagedCaseStatus._('Detection and Analysis');
  static const containmentEradicationAndRecovery =
      SelfManagedCaseStatus._('Containment, Eradication and Recovery');
  static const postIncidentActivities =
      SelfManagedCaseStatus._('Post-incident Activities');

  final String value;

  const SelfManagedCaseStatus._(this.value);

  static const values = [
    submitted,
    detectionAndAnalysis,
    containmentEradicationAndRecovery,
    postIncidentActivities
  ];

  static SelfManagedCaseStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SelfManagedCaseStatus._(value));

  @override
  bool operator ==(other) =>
      other is SelfManagedCaseStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class UsefulnessRating {
  static const useful = UsefulnessRating._('USEFUL');
  static const notUseful = UsefulnessRating._('NOT_USEFUL');

  final String value;

  const UsefulnessRating._(this.value);

  static const values = [useful, notUseful];

  static UsefulnessRating fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UsefulnessRating._(value));

  @override
  bool operator ==(other) => other is UsefulnessRating && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an investigation action performed within a case. This structure
/// captures the details of an automated or manual investigation, including its
/// status, results, and user feedback.
class InvestigationAction {
  /// The type of investigation action being performed. This categorizes the
  /// investigation method or approach used in the case.
  final ActionType actionType;

  /// Detailed investigation results in rich markdown format. This field contains
  /// the comprehensive findings, analysis, and conclusions from the
  /// investigation.
  final String content;

  /// The unique identifier for this investigation action. This ID is used to
  /// track and reference the specific investigation throughout its lifecycle.
  final String investigationId;

  /// ISO 8601 timestamp of the most recent status update. This indicates when the
  /// investigation was last modified or when its status last changed.
  final DateTime lastUpdated;

  /// The current execution status of the investigation. This indicates whether
  /// the investigation is pending, in progress, completed, or failed.
  final ExecutionStatus status;

  /// Human-readable summary of the investigation focus. This provides a brief
  /// description of what the investigation is examining or analyzing.
  final String title;

  /// User feedback for this investigation result. This contains the user's
  /// assessment and comments about the quality and usefulness of the
  /// investigation findings.
  final InvestigationFeedback? feedback;

  InvestigationAction({
    required this.actionType,
    required this.content,
    required this.investigationId,
    required this.lastUpdated,
    required this.status,
    required this.title,
    this.feedback,
  });

  factory InvestigationAction.fromJson(Map<String, dynamic> json) {
    return InvestigationAction(
      actionType: ActionType.fromString((json['actionType'] as String?) ?? ''),
      content: (json['content'] as String?) ?? '',
      investigationId: (json['investigationId'] as String?) ?? '',
      lastUpdated: nonNullableTimeStampFromJson(json['lastUpdated'] ?? 0),
      status: ExecutionStatus.fromString((json['status'] as String?) ?? ''),
      title: (json['title'] as String?) ?? '',
      feedback: json['feedback'] != null
          ? InvestigationFeedback.fromJson(
              json['feedback'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final content = this.content;
    final investigationId = this.investigationId;
    final lastUpdated = this.lastUpdated;
    final status = this.status;
    final title = this.title;
    final feedback = this.feedback;
    return {
      'actionType': actionType.value,
      'content': content,
      'investigationId': investigationId,
      'lastUpdated': unixTimestampToJson(lastUpdated),
      'status': status.value,
      'title': title,
      if (feedback != null) 'feedback': feedback,
    };
  }
}

class ActionType {
  static const evidence = ActionType._('Evidence');
  static const investigation = ActionType._('Investigation');
  static const summarization = ActionType._('Summarization');

  final String value;

  const ActionType._(this.value);

  static const values = [evidence, investigation, summarization];

  static ActionType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ActionType._(value));

  @override
  bool operator ==(other) => other is ActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ExecutionStatus {
  static const pending = ExecutionStatus._('Pending');
  static const inProgress = ExecutionStatus._('InProgress');
  static const waiting = ExecutionStatus._('Waiting');
  static const completed = ExecutionStatus._('Completed');
  static const failed = ExecutionStatus._('Failed');
  static const cancelled = ExecutionStatus._('Cancelled');

  final String value;

  const ExecutionStatus._(this.value);

  static const values = [
    pending,
    inProgress,
    waiting,
    completed,
    failed,
    cancelled
  ];

  static ExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionStatus._(value));

  @override
  bool operator ==(other) => other is ExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents user feedback for an investigation result. This structure
/// captures the user's evaluation of the investigation's quality, usefulness,
/// and any additional comments.
class InvestigationFeedback {
  /// Optional user comments providing additional context about the investigation
  /// feedback. This allows users to explain their rating or provide suggestions
  /// for improvement.
  final String? comment;

  /// ISO 8601 timestamp when the feedback was submitted. This records when the
  /// user provided their assessment of the investigation results.
  final DateTime? submittedAt;

  /// User assessment of the investigation result's quality and helpfulness. This
  /// rating indicates how valuable the investigation findings were in addressing
  /// the case.
  final UsefulnessRating? usefulness;

  InvestigationFeedback({
    this.comment,
    this.submittedAt,
    this.usefulness,
  });

  factory InvestigationFeedback.fromJson(Map<String, dynamic> json) {
    return InvestigationFeedback(
      comment: json['comment'] as String?,
      submittedAt: timeStampFromJson(json['submittedAt']),
      usefulness:
          (json['usefulness'] as String?)?.let(UsefulnessRating.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final submittedAt = this.submittedAt;
    final usefulness = this.usefulness;
    return {
      if (comment != null) 'comment': comment,
      if (submittedAt != null) 'submittedAt': unixTimestampToJson(submittedAt),
      if (usefulness != null) 'usefulness': usefulness.value,
    };
  }
}

/// <p/>
class ListCommentsItem {
  /// <p/>
  final String commentId;

  /// <p/>
  final String? body;

  /// <p/>
  final DateTime? createdDate;

  /// <p/>
  final String? creator;

  /// <p/>
  final String? lastUpdatedBy;

  /// <p/>
  final DateTime? lastUpdatedDate;

  ListCommentsItem({
    required this.commentId,
    this.body,
    this.createdDate,
    this.creator,
    this.lastUpdatedBy,
    this.lastUpdatedDate,
  });

  factory ListCommentsItem.fromJson(Map<String, dynamic> json) {
    return ListCommentsItem(
      commentId: (json['commentId'] as String?) ?? '',
      body: json['body'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      creator: json['creator'] as String?,
      lastUpdatedBy: json['lastUpdatedBy'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final commentId = this.commentId;
    final body = this.body;
    final createdDate = this.createdDate;
    final creator = this.creator;
    final lastUpdatedBy = this.lastUpdatedBy;
    final lastUpdatedDate = this.lastUpdatedDate;
    return {
      'commentId': commentId,
      if (body != null) 'body': body,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (creator != null) 'creator': creator,
      if (lastUpdatedBy != null) 'lastUpdatedBy': lastUpdatedBy,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
    };
  }
}

/// <p/>
class CaseEditItem {
  /// <p/>
  final String? action;

  /// <p/>
  final DateTime? eventTimestamp;

  /// <p/>
  final String? message;

  /// <p/>
  final String? principal;

  CaseEditItem({
    this.action,
    this.eventTimestamp,
    this.message,
    this.principal,
  });

  factory CaseEditItem.fromJson(Map<String, dynamic> json) {
    return CaseEditItem(
      action: json['action'] as String?,
      eventTimestamp: timeStampFromJson(json['eventTimestamp']),
      message: json['message'] as String?,
      principal: json['principal'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final eventTimestamp = this.eventTimestamp;
    final message = this.message;
    final principal = this.principal;
    return {
      if (action != null) 'action': action,
      if (eventTimestamp != null)
        'eventTimestamp': unixTimestampToJson(eventTimestamp),
      if (message != null) 'message': message,
      if (principal != null) 'principal': principal,
    };
  }
}

/// <p/>
class ListCasesItem {
  /// <p/>
  final String caseId;

  /// <p/>
  final String? caseArn;

  /// <p/>
  final CaseStatus? caseStatus;

  /// <p/>
  final DateTime? closedDate;

  /// <p/>
  final DateTime? createdDate;

  /// <p/>
  final EngagementType? engagementType;

  /// <p/>
  final DateTime? lastUpdatedDate;

  /// <p/>
  final PendingAction? pendingAction;

  /// <p/>
  final ResolverType? resolverType;

  /// <p/>
  final String? title;

  ListCasesItem({
    required this.caseId,
    this.caseArn,
    this.caseStatus,
    this.closedDate,
    this.createdDate,
    this.engagementType,
    this.lastUpdatedDate,
    this.pendingAction,
    this.resolverType,
    this.title,
  });

  factory ListCasesItem.fromJson(Map<String, dynamic> json) {
    return ListCasesItem(
      caseId: (json['caseId'] as String?) ?? '',
      caseArn: json['caseArn'] as String?,
      caseStatus: (json['caseStatus'] as String?)?.let(CaseStatus.fromString),
      closedDate: timeStampFromJson(json['closedDate']),
      createdDate: timeStampFromJson(json['createdDate']),
      engagementType:
          (json['engagementType'] as String?)?.let(EngagementType.fromString),
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      pendingAction:
          (json['pendingAction'] as String?)?.let(PendingAction.fromString),
      resolverType:
          (json['resolverType'] as String?)?.let(ResolverType.fromString),
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    final caseArn = this.caseArn;
    final caseStatus = this.caseStatus;
    final closedDate = this.closedDate;
    final createdDate = this.createdDate;
    final engagementType = this.engagementType;
    final lastUpdatedDate = this.lastUpdatedDate;
    final pendingAction = this.pendingAction;
    final resolverType = this.resolverType;
    final title = this.title;
    return {
      'caseId': caseId,
      if (caseArn != null) 'caseArn': caseArn,
      if (caseStatus != null) 'caseStatus': caseStatus.value,
      if (closedDate != null) 'closedDate': unixTimestampToJson(closedDate),
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (engagementType != null) 'engagementType': engagementType.value,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (pendingAction != null) 'pendingAction': pendingAction.value,
      if (resolverType != null) 'resolverType': resolverType.value,
      if (title != null) 'title': title,
    };
  }
}

class EngagementType {
  static const securityIncident = EngagementType._('Security Incident');
  static const investigation = EngagementType._('Investigation');

  final String value;

  const EngagementType._(this.value);

  static const values = [securityIncident, investigation];

  static EngagementType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EngagementType._(value));

  @override
  bool operator ==(other) => other is EngagementType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PendingAction {
  static const customer = PendingAction._('Customer');
  static const none = PendingAction._('None');

  final String value;

  const PendingAction._(this.value);

  static const values = [customer, none];

  static PendingAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PendingAction._(value));

  @override
  bool operator ==(other) => other is PendingAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a single metadata entry associated with a case. Each entry
/// consists of a key-value pair that provides additional contextual information
/// about the case, such as classification tags, custom attributes, or
/// system-generated properties.
class CaseMetadataEntry {
  /// The identifier for the metadata field. This key uniquely identifies the type
  /// of metadata being stored, such as "severity", "category", or "assignee".
  final String key;

  /// The value associated with the metadata key. This contains the actual data
  /// for the metadata field identified by the key.
  final String value;

  CaseMetadataEntry({
    required this.key,
    required this.value,
  });

  factory CaseMetadataEntry.fromJson(Map<String, dynamic> json) {
    return CaseMetadataEntry(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
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

/// <p/>
class ImpactedAwsRegion {
  /// <p/>
  final AwsRegion region;

  ImpactedAwsRegion({
    required this.region,
  });

  factory ImpactedAwsRegion.fromJson(Map<String, dynamic> json) {
    return ImpactedAwsRegion(
      region: AwsRegion.fromString((json['region'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    return {
      'region': region.value,
    };
  }
}

/// <p/>
class ThreatActorIp {
  /// <p/>
  final String ipAddress;

  /// <p/>
  final String? userAgent;

  ThreatActorIp({
    required this.ipAddress,
    this.userAgent,
  });

  factory ThreatActorIp.fromJson(Map<String, dynamic> json) {
    return ThreatActorIp(
      ipAddress: (json['ipAddress'] as String?) ?? '',
      userAgent: json['userAgent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddress = this.ipAddress;
    final userAgent = this.userAgent;
    return {
      'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
    };
  }
}

/// <p/>
class Watcher {
  /// <p/>
  final String email;

  /// <p/>
  final String? jobTitle;

  /// <p/>
  final String? name;

  Watcher({
    required this.email,
    this.jobTitle,
    this.name,
  });

  factory Watcher.fromJson(Map<String, dynamic> json) {
    return Watcher(
      email: (json['email'] as String?) ?? '',
      jobTitle: json['jobTitle'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final jobTitle = this.jobTitle;
    final name = this.name;
    return {
      'email': email,
      if (jobTitle != null) 'jobTitle': jobTitle,
      if (name != null) 'name': name,
    };
  }
}

class ClosureCode {
  static const investigationCompleted =
      ClosureCode._('Investigation Completed');
  static const notResolved = ClosureCode._('Not Resolved');
  static const falsePositive = ClosureCode._('False Positive');
  static const duplicate = ClosureCode._('Duplicate');

  final String value;

  const ClosureCode._(this.value);

  static const values = [
    investigationCompleted,
    notResolved,
    falsePositive,
    duplicate
  ];

  static ClosureCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ClosureCode._(value));

  @override
  bool operator ==(other) => other is ClosureCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// <p/>
class CaseAttachmentAttributes {
  /// <p/>
  final String attachmentId;

  /// <p/>
  final CaseAttachmentStatus attachmentStatus;

  /// <p/>
  final DateTime createdDate;

  /// <p/>
  final String creator;

  /// <p/>
  final String fileName;

  CaseAttachmentAttributes({
    required this.attachmentId,
    required this.attachmentStatus,
    required this.createdDate,
    required this.creator,
    required this.fileName,
  });

  factory CaseAttachmentAttributes.fromJson(Map<String, dynamic> json) {
    return CaseAttachmentAttributes(
      attachmentId: (json['attachmentId'] as String?) ?? '',
      attachmentStatus: CaseAttachmentStatus.fromString(
          (json['attachmentStatus'] as String?) ?? ''),
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] ?? 0),
      creator: (json['creator'] as String?) ?? '',
      fileName: (json['fileName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final attachmentStatus = this.attachmentStatus;
    final createdDate = this.createdDate;
    final creator = this.creator;
    final fileName = this.fileName;
    return {
      'attachmentId': attachmentId,
      'attachmentStatus': attachmentStatus.value,
      'createdDate': unixTimestampToJson(createdDate),
      'creator': creator,
      'fileName': fileName,
    };
  }
}

class CaseAttachmentStatus {
  static const verified = CaseAttachmentStatus._('Verified');
  static const failed = CaseAttachmentStatus._('Failed');
  static const pending = CaseAttachmentStatus._('Pending');

  final String value;

  const CaseAttachmentStatus._(this.value);

  static const values = [verified, failed, pending];

  static CaseAttachmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CaseAttachmentStatus._(value));

  @override
  bool operator ==(other) =>
      other is CaseAttachmentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
