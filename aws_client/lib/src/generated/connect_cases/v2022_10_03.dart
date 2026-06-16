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

/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Operations_Amazon_Connect_Cases.html">Cases
/// actions</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Types_Amazon_Connect_Cases.html">Cases
/// data types</a>
/// </li>
/// </ul>
/// With Amazon Connect Cases, your agents can track and manage customer issues
/// that require multiple interactions, follow-up tasks, and teams in your
/// contact center. A case represents a customer issue. It records the issue,
/// the steps and interactions taken to resolve the issue, and the outcome. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/cases.html">Amazon
/// Connect Cases</a> in the <i>Amazon Connect Administrator Guide</i>.
class ConnectCases {
  final _s.RestJsonProtocol _protocol;
  ConnectCases({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cases',
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

  /// Lists tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN)
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Adds tags to a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN)
  ///
  /// Parameter [tags] :
  /// A map of of key-value pairs that represent tags on a resource. Tags are
  /// used to organize, track, or control access for this resource.
  Future<void> tagResource({
    required String arn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Untags a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN)
  ///
  /// Parameter [tagKeys] :
  /// List of tag keys.
  Future<void> untagResource({
    required String arn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// If you provide a value for <code>PerformedBy.UserArn</code> you must also
  /// have <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribeUser.html">connect:DescribeUser</a>
  /// permission on the User ARN resource that you provide
  /// </note>
  /// Creates a case in the specified Cases domain. Case system and custom
  /// fields are taken as an array id/value pairs with a declared data types.
  ///
  /// When creating a case from a template that has tag propagation
  /// configurations, the specified tags are automatically applied to the case.
  ///
  /// The following fields are required when creating a case:
  ///
  /// <ul>
  /// <li>
  /// <code>customer_id</code> - You must provide the full customer profile ARN
  /// in this format: <code>arn:aws:profile:your_AWS_Region:your_AWS_account
  /// ID:domains/your_profiles_domain_name/profiles/profile_ID</code>
  /// </li>
  /// <li>
  /// <code>title</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [fields] :
  /// An array of objects with field ID (matching ListFields/DescribeField) and
  /// value union data.
  ///
  /// Parameter [templateId] :
  /// A unique identifier of a template.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [tags] :
  /// A map of of key-value pairs that represent tags on a resource. Tags are
  /// used to organize, track, or control access for this resource.
  Future<CreateCaseResponse> createCase({
    required String domainId,
    required List<FieldValue> fields,
    required String templateId,
    String? clientToken,
    UserUnion? performedBy,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'fields': fields,
      'templateId': templateId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (performedBy != null) 'performedBy': performedBy,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/cases',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCaseResponse.fromJson(response);
  }

  /// Returns information about a specific case if it exists.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [caseId] :
  /// A unique identifier of the case.
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [fields] :
  /// A list of unique field identifiers.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<GetCaseResponse> getCase({
    required String caseId,
    required String domainId,
    required List<FieldIdentifier> fields,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'fields': fields,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/cases/${Uri.encodeComponent(caseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCaseResponse.fromJson(response);
  }

  /// <note>
  /// If you provide a value for <code>PerformedBy.UserArn</code> you must also
  /// have <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribeUser.html">connect:DescribeUser</a>
  /// permission on the User ARN resource that you provide
  /// </note>
  /// Updates the values of fields on a case. Fields to be updated are received
  /// as an array of id/value pairs identical to the <code>CreateCase</code>
  /// input .
  ///
  /// If the action is successful, the service sends back an HTTP 200 response
  /// with an empty HTTP body.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [caseId] :
  /// A unique identifier of the case.
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [fields] :
  /// An array of objects with <code>fieldId</code> (matching
  /// ListFields/DescribeField) and value union data, structured identical to
  /// <code>CreateCase</code>.
  Future<void> updateCase({
    required String caseId,
    required String domainId,
    required List<FieldValue> fields,
    UserUnion? performedBy,
  }) async {
    final $payload = <String, dynamic>{
      'fields': fields,
      if (performedBy != null) 'performedBy': performedBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/cases/${Uri.encodeComponent(caseId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The DeleteCase API permanently deletes a case and all its associated
  /// resources from the cases data store. After a successful deletion, you
  /// cannot:
  ///
  /// <ul>
  /// <li>
  /// Retrieve related items
  /// </li>
  /// <li>
  /// Access audit history
  /// </li>
  /// <li>
  /// Perform any operations that require the CaseID
  /// </li>
  /// </ul> <important>
  /// This action is irreversible. After you delete a case, you cannot recover
  /// its data.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [caseId] :
  /// A unique identifier of the case.
  ///
  /// Parameter [domainId] :
  /// A unique identifier of the Cases domain.
  Future<void> deleteCase({
    required String caseId,
    required String domainId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/cases/${Uri.encodeComponent(caseId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the audit history about a specific case if it exists.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [caseId] :
  /// A unique identifier of the case.
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of audit events to return. When no value is provided,
  /// 25 is the default.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<GetCaseAuditEventsResponse> getCaseAuditEvents({
    required String caseId,
    required String domainId,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/cases/${Uri.encodeComponent(caseId)}/audit-history',
      exceptionFnMap: _exceptionFns,
    );
    return GetCaseAuditEventsResponse.fromJson(response);
  }

  /// Lists cases for a given contact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactArn] :
  /// A unique identifier of a contact in Amazon Connect.
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListCasesForContactResponse> listCasesForContact({
    required String contactArn,
    required String domainId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'contactArn': contactArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/list-cases-for-contact',
      exceptionFnMap: _exceptionFns,
    );
    return ListCasesForContactResponse.fromJson(response);
  }

  /// Searches for cases within their associated Cases domain. Search results
  /// are returned as a paginated list of abridged case documents.
  /// <note>
  /// For <code>customer_id</code> you must provide the full customer profile
  /// ARN in this format: <code> arn:aws:profile:your AWS Region:your AWS
  /// account ID:domains/profiles domain name/profiles/profile ID</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [fields] :
  /// The list of field identifiers to be returned as part of the response.
  ///
  /// Parameter [filter] :
  /// A list of filter objects.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of cases to return. When no value is provided, 25 is
  /// the default.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [searchTerm] :
  /// A word or phrase used to perform a quick search.
  ///
  /// Parameter [sorts] :
  /// A list of sorts where each sort specifies a field and their sort order to
  /// be applied to the results.
  Future<SearchCasesResponse> searchCases({
    required String domainId,
    List<FieldIdentifier>? fields,
    CaseFilter? filter,
    int? maxResults,
    String? nextToken,
    String? searchTerm,
    List<Sort>? sorts,
  }) async {
    final $payload = <String, dynamic>{
      if (fields != null) 'fields': fields,
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (searchTerm != null) 'searchTerm': searchTerm,
      if (sorts != null) 'sorts': sorts,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/cases-search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchCasesResponse.fromJson(response);
  }

  /// Creates a related item (comments, tasks, and contacts) and associates it
  /// with a case.
  ///
  /// There's a quota for the number of fields allowed in a Custom type related
  /// item. See <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#cases-quotas">Amazon
  /// Connect Cases quotas</a>.
  ///
  /// <b>Use cases</b>
  ///
  /// Following are examples of related items that you may want to associate
  /// with a case:
  ///
  /// <ul>
  /// <li>
  /// Related contacts, such as calls, chats, emails tasks
  /// </li>
  /// <li>
  /// Comments, for agent notes
  /// </li>
  /// <li>
  /// SLAs, to capture target resolution goals
  /// </li>
  /// <li>
  /// Cases, to capture related Amazon Connect Cases
  /// </li>
  /// <li>
  /// Files, such as policy documentation or customer-provided attachments
  /// </li>
  /// <li>
  /// Custom related items, which provide flexibility for you to define related
  /// items that such as bookings, orders, products, notices, and more
  /// </li>
  /// </ul>
  /// <b>Important things to know</b>
  ///
  /// <ul>
  /// <li>
  /// If you are associating a contact to a case by passing in
  /// <code>Contact</code> for a <code>type</code>, you must have <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribeContact.html">DescribeContact</a>
  /// permission on the ARN of the contact that you provide in
  /// <code>content.contact.contactArn</code>.
  /// </li>
  /// <li>
  /// A Related Item is a resource that is associated with a case. It may or may
  /// not have an external identifier linking it to an external resource (for
  /// example, a <code>contactArn</code>). All Related Items have their own
  /// internal identifier, the <code>relatedItemArn</code>. Examples of related
  /// items include <code>comments</code> and <code>contacts</code>.
  /// </li>
  /// <li>
  /// If you provide a value for <code>performedBy.userArn</code> you must also
  /// have <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribeUser.html">DescribeUser</a>
  /// permission on the ARN of the user that you provide.
  /// </li>
  /// <li>
  /// The <code>type</code> field is reserved for internal use only.
  /// </li>
  /// </ul>
  /// <b>Endpoints</b>: See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/connect_region.html">Amazon
  /// Connect endpoints and quotas</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [caseId] :
  /// A unique identifier of the case.
  ///
  /// Parameter [content] :
  /// The content of a related item to be created.
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [type] :
  /// The type of a related item.
  ///
  /// Parameter [performedBy] :
  /// Represents the creator of the related item.
  Future<CreateRelatedItemResponse> createRelatedItem({
    required String caseId,
    required RelatedItemInputContent content,
    required String domainId,
    required RelatedItemType type,
    UserUnion? performedBy,
  }) async {
    final $payload = <String, dynamic>{
      'content': content,
      'type': type.value,
      if (performedBy != null) 'performedBy': performedBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/cases/${Uri.encodeComponent(caseId)}/related-items/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRelatedItemResponse.fromJson(response);
  }

  /// Updates the content of a related item associated with a case. The
  /// following related item types are supported:
  ///
  /// <ul>
  /// <li>
  /// <b>Comment</b> - Update the text content of an existing comment
  /// </li>
  /// <li>
  /// <b>Custom</b> - Update the fields of a custom related item. You can add,
  /// modify, and remove fields from a custom related item. There's a quota for
  /// the number of fields allowed in a Custom type related item. See <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#cases-quotas">Amazon
  /// Connect Cases quotas</a>.
  /// </li>
  /// </ul>
  /// <b>Important things to know</b>
  ///
  /// <ul>
  /// <li>
  /// When updating a Custom related item, all existing and new fields, and
  /// their associated values should be included in the request. Fields not
  /// included as part of this request will be removed.
  /// </li>
  /// <li>
  /// If you provide a value for <code>performedBy.userArn</code> you must also
  /// have <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribeUser.html">DescribeUser</a>
  /// permission on the ARN of the user that you provide.
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-fields.html#system-case-fields">System
  /// case fields</a> cannot be used in a custom related item.
  /// </li>
  /// </ul>
  /// <b>Endpoints</b>: See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/connect_region.html">Amazon
  /// Connect endpoints and quotas</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [caseId] :
  /// A unique identifier of the case.
  ///
  /// Parameter [content] :
  /// The content of a related item to be updated.
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [relatedItemId] :
  /// Unique identifier of a related item.
  ///
  /// Parameter [performedBy] :
  /// Represents the user who performed the update of the related item.
  Future<UpdateRelatedItemResponse> updateRelatedItem({
    required String caseId,
    required RelatedItemUpdateContent content,
    required String domainId,
    required String relatedItemId,
    UserUnion? performedBy,
  }) async {
    final $payload = <String, dynamic>{
      'content': content,
      if (performedBy != null) 'performedBy': performedBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/cases/${Uri.encodeComponent(caseId)}/related-items/${Uri.encodeComponent(relatedItemId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRelatedItemResponse.fromJson(response);
  }

  /// Deletes the related item resource under a case.
  /// <note>
  /// This API cannot be used on a FILE type related attachment. To delete this
  /// type of file, use the <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteAttachedFile.html">DeleteAttachedFile</a>
  /// API
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [caseId] :
  /// A unique identifier of the case.
  ///
  /// Parameter [domainId] :
  /// A unique identifier of the Cases domain.
  ///
  /// Parameter [relatedItemId] :
  /// A unique identifier of a related item.
  Future<void> deleteRelatedItem({
    required String caseId,
    required String domainId,
    required String relatedItemId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/cases/${Uri.encodeComponent(caseId)}/related-items/${Uri.encodeComponent(relatedItemId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Searches for related items that are associated with a case.
  /// <note>
  /// If no filters are provided, this returns all related items associated with
  /// a case.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [caseId] :
  /// A unique identifier of the case.
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [filters] :
  /// The list of types of related items and their parameters to use for
  /// filtering.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<SearchRelatedItemsResponse> searchRelatedItems({
    required String caseId,
    required String domainId,
    List<RelatedItemTypeFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/cases/${Uri.encodeComponent(caseId)}/related-items-search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchRelatedItemsResponse.fromJson(response);
  }

  /// Creates a new case rule. In the Amazon Connect admin website, case rules
  /// are known as <i>case field conditions</i>. For more information about case
  /// field conditions, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
  /// case field conditions to a case template</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// Unique identifier of a Cases domain.
  ///
  /// Parameter [name] :
  /// Name of the case rule.
  ///
  /// Parameter [rule] :
  /// Represents what rule type should take place, under what conditions.
  ///
  /// Parameter [description] :
  /// The description of a case rule.
  Future<CreateCaseRuleResponse> createCaseRule({
    required String domainId,
    required String name,
    required CaseRuleDetails rule,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'rule': rule,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/case-rules',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCaseRuleResponse.fromJson(response);
  }

  /// Updates a case rule. In the Amazon Connect admin website, case rules are
  /// known as <i>case field conditions</i>. For more information about case
  /// field conditions, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
  /// case field conditions to a case template</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [caseRuleId] :
  /// Unique identifier of a case rule.
  ///
  /// Parameter [domainId] :
  /// Unique identifier of a Cases domain.
  ///
  /// Parameter [description] :
  /// Description of a case rule.
  ///
  /// Parameter [name] :
  /// Name of the case rule.
  ///
  /// Parameter [rule] :
  /// Represents what rule type should take place, under what conditions.
  Future<void> updateCaseRule({
    required String caseRuleId,
    required String domainId,
    String? description,
    String? name,
    CaseRuleDetails? rule,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (rule != null) 'rule': rule,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/case-rules/${Uri.encodeComponent(caseRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a case rule. In the Amazon Connect admin website, case rules are
  /// known as <i>case field conditions</i>. For more information about case
  /// field conditions, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
  /// case field conditions to a case template</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [caseRuleId] :
  /// Unique identifier of a case rule.
  ///
  /// Parameter [domainId] :
  /// Unique identifier of a Cases domain.
  Future<void> deleteCaseRule({
    required String caseRuleId,
    required String domainId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/case-rules/${Uri.encodeComponent(caseRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all case rules in a Cases domain. In the Amazon Connect admin
  /// website, case rules are known as <i>case field conditions</i>. For more
  /// information about case field conditions, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
  /// case field conditions to a case template</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// Unique identifier of a Cases domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListCaseRulesResponse> listCaseRules({
    required String domainId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/rules-list/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCaseRulesResponse.fromJson(response);
  }

  /// Gets a batch of case rules. In the Amazon Connect admin website, case
  /// rules are known as <i>case field conditions</i>. For more information
  /// about case field conditions, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
  /// case field conditions to a case template</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [caseRules] :
  /// A list of case rule identifiers.
  ///
  /// Parameter [domainId] :
  /// Unique identifier of a Cases domain.
  Future<BatchGetCaseRuleResponse> batchGetCaseRule({
    required List<CaseRuleIdentifier> caseRules,
    required String domainId,
  }) async {
    final $payload = <String, dynamic>{
      'caseRules': caseRules,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/rules-batch',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetCaseRuleResponse.fromJson(response);
  }

  /// Creates a domain, which is a container for all case data, such as cases,
  /// fields, templates and layouts. Each Amazon Connect instance can be
  /// associated with only one Cases domain.
  /// <important>
  /// This will not associate your connect instance to Cases domain. Instead,
  /// use the Amazon Connect <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateIntegrationAssociation.html">CreateIntegrationAssociation</a>
  /// API. You need specific IAM permissions to successfully associate the Cases
  /// domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/required-permissions-iam-cases.html#onboard-cases-iam">Onboard
  /// to Cases</a>.
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
  /// The name for your Cases domain. It must be unique for your Amazon Web
  /// Services account.
  Future<CreateDomainResponse> createDomain({
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainResponse.fromJson(response);
  }

  /// Returns information about a specific domain if it exists.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  Future<GetDomainResponse> getDomain({
    required String domainId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainResponse.fromJson(response);
  }

  /// Deletes a Cases domain.
  /// <note>
  /// After deleting your domain you must disassociate the deleted domain from
  /// your Amazon Connect instance with another API call before being able to
  /// use Cases again with this Amazon Connect instance. See <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteIntegrationAssociation.html">DeleteIntegrationAssociation</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  Future<void> deleteDomain({
    required String domainId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all cases domains in the Amazon Web Services account. Each list item
  /// is a condensed summary object of the domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListDomainsResponse> listDomains({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/domains-list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsResponse.fromJson(response);
  }

  /// Returns the case event publishing configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  Future<GetCaseEventConfigurationResponse> getCaseEventConfiguration({
    required String domainId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/case-event-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetCaseEventConfigurationResponse.fromJson(response);
  }

  /// Adds case event publishing configuration. For a complete list of fields
  /// you can add to the event message, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-fields.html">Create
  /// case fields</a> in the <i>Amazon Connect Administrator Guide</i>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [eventBridge] :
  /// Configuration to enable EventBridge case event delivery and determine what
  /// data is delivered.
  Future<void> putCaseEventConfiguration({
    required String domainId,
    required EventBridgeConfiguration eventBridge,
  }) async {
    final $payload = <String, dynamic>{
      'eventBridge': eventBridge,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/case-event-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Searches for related items across all cases within a domain. This is a
  /// global search operation that returns related items from multiple cases,
  /// unlike the case-specific <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_SearchRelatedItems.html">SearchRelatedItems</a>
  /// API.
  ///
  /// <b>Use cases</b>
  ///
  /// Following are common uses cases for this API:
  ///
  /// <ul>
  /// <li>
  /// Find cases with similar issues across the domain. For example, search for
  /// all cases containing comments about "product defect" to identify patterns
  /// and existing solutions.
  /// </li>
  /// <li>
  /// Locate all cases associated with specific contacts or orders. For example,
  /// find all cases linked to a contactArn to understand the complete customer
  /// journey.
  /// </li>
  /// <li>
  /// Monitor SLA compliance across cases. For example, search for all cases
  /// with "Active" SLA status to prioritize remediation efforts.
  /// </li>
  /// </ul>
  /// <b>Important things to know</b>
  ///
  /// <ul>
  /// <li>
  /// This API returns case identifiers, not complete case objects. To retrieve
  /// full case details, you must make additional calls to the <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_GetCase.html">GetCase</a>
  /// API for each returned case ID.
  /// </li>
  /// <li>
  /// This API searches across related items content, not case fields. Use the
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_SearchCases.html">SearchCases</a>
  /// API to search within case field values.
  /// </li>
  /// </ul>
  /// <b>Endpoints</b>: See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/connect_region.html">Amazon
  /// Connect endpoints and quotas</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [filters] :
  /// The list of types of related items and their parameters to use for
  /// filtering. The filters work as an OR condition: caller gets back related
  /// items that match any of the specified filter types.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [sorts] :
  /// A structured set of sort terms to specify the order in which related items
  /// should be returned. Supports sorting by association time or case ID. The
  /// sorts work in the order specified: first sort term takes precedence over
  /// subsequent terms.
  Future<SearchAllRelatedItemsResponse> searchAllRelatedItems({
    required String domainId,
    List<RelatedItemTypeFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<SearchAllRelatedItemsSort>? sorts,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sorts != null) 'sorts': sorts,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/related-items-search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchAllRelatedItemsResponse.fromJson(response);
  }

  /// Creates a field in the Cases domain. This field is used to define the case
  /// object model (that is, defines what data can be captured on cases) in a
  /// Cases domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [name] :
  /// The name of the field.
  ///
  /// Parameter [type] :
  /// Defines the data type, some system constraints, and default display of the
  /// field.
  ///
  /// Parameter [attributes] :
  /// Union of field attributes.
  ///
  /// Parameter [description] :
  /// The description of the field.
  Future<CreateFieldResponse> createField({
    required String domainId,
    required String name,
    required FieldType type,
    FieldAttributes? attributes,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'type': type.value,
      if (attributes != null) 'attributes': attributes,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/fields',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFieldResponse.fromJson(response);
  }

  /// Updates the properties of an existing field.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [fieldId] :
  /// The unique identifier of a field.
  ///
  /// Parameter [attributes] :
  /// Union of field attributes.
  ///
  /// Parameter [description] :
  /// The description of a field.
  ///
  /// Parameter [name] :
  /// The name of the field.
  Future<void> updateField({
    required String domainId,
    required String fieldId,
    FieldAttributes? attributes,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (attributes != null) 'attributes': attributes,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/fields/${Uri.encodeComponent(fieldId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a field from a cases template.
  ///
  /// After a field is deleted:
  ///
  /// <ul>
  /// <li>
  /// You can still retrieve the field by calling <code>BatchGetField</code>.
  /// </li>
  /// <li>
  /// You cannot update a deleted field by calling <code>UpdateField</code>; it
  /// throws a <code>ValidationException</code>.
  /// </li>
  /// <li>
  /// Deleted fields are not included in the <code>ListFields</code> response.
  /// </li>
  /// <li>
  /// Calling <code>CreateCase</code> with a deleted field throws a
  /// <code>ValidationException</code> denoting which field identifiers in the
  /// request have been deleted.
  /// </li>
  /// <li>
  /// Calling <code>GetCase</code> with a deleted field identifier returns the
  /// deleted field's value if one exists.
  /// </li>
  /// <li>
  /// Calling <code>UpdateCase</code> with a deleted field ID throws a
  /// <code>ValidationException</code> if the case does not already contain a
  /// value for the deleted field. Otherwise it succeeds, allowing you to update
  /// or remove (using <code>emptyValue: {}</code>) the field's value from the
  /// case.
  /// </li>
  /// <li>
  /// <code>GetTemplate</code> does not return field IDs for deleted fields.
  /// </li>
  /// <li>
  /// <code>GetLayout</code> does not return field IDs for deleted fields.
  /// </li>
  /// <li>
  /// Calling <code>SearchCases</code> with the deleted field ID as a filter
  /// returns any cases that have a value for the deleted field that matches the
  /// filter criteria.
  /// </li>
  /// <li>
  /// Calling <code>SearchCases</code> with a <code>searchTerm</code> value that
  /// matches a deleted field's value on a case returns the case in the
  /// response.
  /// </li>
  /// <li>
  /// Calling <code>BatchPutFieldOptions</code> with a deleted field ID throw a
  /// <code>ValidationException</code>.
  /// </li>
  /// <li>
  /// Calling <code>GetCaseEventConfiguration</code> does not return field IDs
  /// for deleted fields.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [fieldId] :
  /// Unique identifier of the field.
  Future<void> deleteField({
    required String domainId,
    required String fieldId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/fields/${Uri.encodeComponent(fieldId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all fields in a Cases domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListFieldsResponse> listFields({
    required String domainId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/fields-list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFieldsResponse.fromJson(response);
  }

  /// Creates and updates a set of field options for a single select field in a
  /// Cases domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [fieldId] :
  /// The unique identifier of a field.
  ///
  /// Parameter [options] :
  /// A list of <code>FieldOption</code> objects.
  Future<BatchPutFieldOptionsResponse> batchPutFieldOptions({
    required String domainId,
    required String fieldId,
    required List<FieldOption> options,
  }) async {
    final $payload = <String, dynamic>{
      'options': options,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/fields/${Uri.encodeComponent(fieldId)}/options',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutFieldOptionsResponse.fromJson(response);
  }

  /// Lists all of the field options for a field identifier in the domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [fieldId] :
  /// The unique identifier of a field.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [values] :
  /// A list of <code>FieldOption</code> values to filter on for
  /// <code>ListFieldOptions</code>.
  Future<ListFieldOptionsResponse> listFieldOptions({
    required String domainId,
    required String fieldId,
    int? maxResults,
    String? nextToken,
    List<String>? values,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (values != null) 'values': values,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/fields/${Uri.encodeComponent(fieldId)}/options-list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFieldOptionsResponse.fromJson(response);
  }

  /// Returns the description for the list of fields in the request parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [fields] :
  /// A list of unique field identifiers.
  Future<BatchGetFieldResponse> batchGetField({
    required String domainId,
    required List<FieldIdentifier> fields,
  }) async {
    final $payload = <String, dynamic>{
      'fields': fields,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/fields-batch',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetFieldResponse.fromJson(response);
  }

  /// Creates a layout in the Cases domain. Layouts define the following
  /// configuration in the top section and More Info tab of the Cases user
  /// interface:
  ///
  /// <ul>
  /// <li>
  /// Fields to display to the users
  /// </li>
  /// <li>
  /// Field ordering
  /// </li>
  /// </ul> <note>
  /// Title and Status fields cannot be part of layouts since they are not
  /// configurable.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [content] :
  /// Information about which fields will be present in the layout, and
  /// information about the order of the fields.
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [name] :
  /// The name of the layout. It must be unique for the Cases domain.
  Future<CreateLayoutResponse> createLayout({
    required LayoutContent content,
    required String domainId,
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'content': content,
      'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/layouts',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLayoutResponse.fromJson(response);
  }

  /// Returns the details for the requested layout.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [layoutId] :
  /// The unique identifier of the layout.
  Future<GetLayoutResponse> getLayout({
    required String domainId,
    required String layoutId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/layouts/${Uri.encodeComponent(layoutId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLayoutResponse.fromJson(response);
  }

  /// Updates the attributes of an existing layout.
  ///
  /// If the action is successful, the service sends back an HTTP 200 response
  /// with an empty HTTP body.
  ///
  /// A <code>ValidationException</code> is returned when you add non-existent
  /// <code>fieldIds</code> to a layout.
  /// <note>
  /// Title and Status fields cannot be part of layouts because they are not
  /// configurable.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [layoutId] :
  /// The unique identifier of the layout.
  ///
  /// Parameter [content] :
  /// Information about which fields will be present in the layout, the order of
  /// the fields.
  ///
  /// Parameter [name] :
  /// The name of the layout. It must be unique per domain.
  Future<void> updateLayout({
    required String domainId,
    required String layoutId,
    LayoutContent? content,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (content != null) 'content': content,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/layouts/${Uri.encodeComponent(layoutId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a layout from a cases template. You can delete up to 100 layouts
  /// per domain.
  ///
  /// After a layout is deleted:
  ///
  /// <ul>
  /// <li>
  /// You can still retrieve the layout by calling <code>GetLayout</code>.
  /// </li>
  /// <li>
  /// You cannot update a deleted layout by calling <code>UpdateLayout</code>;
  /// it throws a <code>ValidationException</code>.
  /// </li>
  /// <li>
  /// Deleted layouts are not included in the <code>ListLayouts</code> response.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [layoutId] :
  /// The unique identifier of the layout.
  Future<void> deleteLayout({
    required String domainId,
    required String layoutId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/layouts/${Uri.encodeComponent(layoutId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all layouts in the given cases domain. Each list item is a condensed
  /// summary object of the layout.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListLayoutsResponse> listLayouts({
    required String domainId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/layouts-list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLayoutsResponse.fromJson(response);
  }

  /// Creates a template in the Cases domain. This template is used to define
  /// the case object model (that is, to define what data can be captured on
  /// cases) in a Cases domain. A template must have a unique name within a
  /// domain, and it must reference existing field IDs and layout IDs.
  /// Additionally, multiple fields with same IDs are not allowed within the
  /// same Template. A template can be either Active or Inactive, as indicated
  /// by its status. Inactive templates cannot be used to create cases.
  ///
  /// Other template APIs are:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_DeleteTemplate.html">DeleteTemplate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_GetTemplate.html">GetTemplate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_ListTemplates.html">ListTemplates</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_UpdateTemplate.html">UpdateTemplate</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [name] :
  /// A name for the template. It must be unique per domain.
  ///
  /// Parameter [description] :
  /// A brief description of the template.
  ///
  /// Parameter [layoutConfiguration] :
  /// Configuration of layouts associated to the template.
  ///
  /// Parameter [requiredFields] :
  /// A list of fields that must contain a value for a case to be successfully
  /// created with this template.
  ///
  /// Parameter [rules] :
  /// A list of case rules (also known as <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">case
  /// field conditions</a>) on a template.
  ///
  /// Parameter [status] :
  /// The status of the template.
  ///
  /// Parameter [tagPropagationConfigurations] :
  /// Defines tag propagation configuration for resources created within a
  /// domain. Tags specified here will be automatically applied to resources
  /// being created for the specified resource type.
  Future<CreateTemplateResponse> createTemplate({
    required String domainId,
    required String name,
    String? description,
    LayoutConfiguration? layoutConfiguration,
    List<RequiredField>? requiredFields,
    List<TemplateRule>? rules,
    TemplateStatus? status,
    List<TagPropagationConfiguration>? tagPropagationConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (description != null) 'description': description,
      if (layoutConfiguration != null)
        'layoutConfiguration': layoutConfiguration,
      if (requiredFields != null) 'requiredFields': requiredFields,
      if (rules != null) 'rules': rules,
      if (status != null) 'status': status.value,
      if (tagPropagationConfigurations != null)
        'tagPropagationConfigurations': tagPropagationConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/templates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTemplateResponse.fromJson(response);
  }

  /// Returns the details for the requested template. Other template APIs are:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_CreateTemplate.html">CreateTemplate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_DeleteTemplate.html">DeleteTemplate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_ListTemplates.html">ListTemplates</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_UpdateTemplate.html">UpdateTemplate</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [templateId] :
  /// A unique identifier of a template.
  Future<GetTemplateResponse> getTemplate({
    required String domainId,
    required String templateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/templates/${Uri.encodeComponent(templateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTemplateResponse.fromJson(response);
  }

  /// Updates the attributes of an existing template. The template attributes
  /// that can be modified include <code>name</code>, <code>description</code>,
  /// <code>layoutConfiguration</code>, <code>requiredFields</code>, and
  /// <code>status</code>. At least one of these attributes must not be null. If
  /// a null value is provided for a given attribute, that attribute is ignored
  /// and its current value is preserved.
  ///
  /// Other template APIs are:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_CreateTemplate.html">CreateTemplate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_DeleteTemplate.html">DeleteTemplate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_GetTemplate.html">GetTemplate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_ListTemplates.html">ListTemplates</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [templateId] :
  /// A unique identifier for the template.
  ///
  /// Parameter [description] :
  /// A brief description of the template.
  ///
  /// Parameter [layoutConfiguration] :
  /// Configuration of layouts associated to the template.
  ///
  /// Parameter [name] :
  /// The name of the template. It must be unique per domain.
  ///
  /// Parameter [requiredFields] :
  /// A list of fields that must contain a value for a case to be successfully
  /// created with this template.
  ///
  /// Parameter [rules] :
  /// A list of case rules (also known as <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">case
  /// field conditions</a>) on a template.
  ///
  /// Parameter [status] :
  /// The status of the template.
  ///
  /// Parameter [tagPropagationConfigurations] :
  /// Defines tag propagation configuration for resources created within a
  /// domain. Tags specified here will be automatically applied to resources
  /// being created for the specified resource type.
  Future<void> updateTemplate({
    required String domainId,
    required String templateId,
    String? description,
    LayoutConfiguration? layoutConfiguration,
    String? name,
    List<RequiredField>? requiredFields,
    List<TemplateRule>? rules,
    TemplateStatus? status,
    List<TagPropagationConfiguration>? tagPropagationConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (layoutConfiguration != null)
        'layoutConfiguration': layoutConfiguration,
      if (name != null) 'name': name,
      if (requiredFields != null) 'requiredFields': requiredFields,
      if (rules != null) 'rules': rules,
      if (status != null) 'status': status.value,
      if (tagPropagationConfigurations != null)
        'tagPropagationConfigurations': tagPropagationConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/templates/${Uri.encodeComponent(templateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a cases template. You can delete up to 100 templates per domain.
  ///
  /// After a cases template is deleted:
  ///
  /// <ul>
  /// <li>
  /// You can still retrieve the template by calling <code>GetTemplate</code>.
  /// </li>
  /// <li>
  /// You cannot update the template.
  /// </li>
  /// <li>
  /// You cannot create a case by using the deleted template.
  /// </li>
  /// <li>
  /// Deleted templates are not included in the <code>ListTemplates</code>
  /// response.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [templateId] :
  /// A unique identifier of a template.
  Future<void> deleteTemplate({
    required String domainId,
    required String templateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/templates/${Uri.encodeComponent(templateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all of the templates in a Cases domain. Each list item is a
  /// condensed summary object of the template.
  ///
  /// Other template APIs are:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_CreateTemplate.html">CreateTemplate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_DeleteTemplate.html">DeleteTemplate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_GetTemplate.html">GetTemplate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_UpdateTemplate.html">UpdateTemplate</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [status] :
  /// A list of status values to filter on.
  Future<ListTemplatesResponse> listTemplates({
    required String domainId,
    int? maxResults,
    String? nextToken,
    List<TemplateStatus>? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': status.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/templates-list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTemplatesResponse.fromJson(response);
  }
}

class ListTagsForResourceResponse {
  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
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

class CreateCaseResponse {
  /// The Amazon Resource Name (ARN) of the case.
  final String caseArn;

  /// A unique identifier of the case.
  final String caseId;

  CreateCaseResponse({
    required this.caseArn,
    required this.caseId,
  });

  factory CreateCaseResponse.fromJson(Map<String, dynamic> json) {
    return CreateCaseResponse(
      caseArn: (json['caseArn'] as String?) ?? '',
      caseId: (json['caseId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final caseArn = this.caseArn;
    final caseId = this.caseId;
    return {
      'caseArn': caseArn,
      'caseId': caseId,
    };
  }
}

class GetCaseResponse {
  /// A list of detailed field information.
  final List<FieldValue> fields;

  /// A unique identifier of a template.
  final String templateId;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetCaseResponse({
    required this.fields,
    required this.templateId,
    this.nextToken,
    this.tags,
  });

  factory GetCaseResponse.fromJson(Map<String, dynamic> json) {
    return GetCaseResponse(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => FieldValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      templateId: (json['templateId'] as String?) ?? '',
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final templateId = this.templateId;
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      'fields': fields,
      'templateId': templateId,
      if (nextToken != null) 'nextToken': nextToken,
      if (tags != null) 'tags': tags,
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

class DeleteCaseResponse {
  DeleteCaseResponse();

  factory DeleteCaseResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetCaseAuditEventsResponse {
  /// A list of case audits where each represents a particular edit of the case.
  final List<AuditEvent> auditEvents;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  GetCaseAuditEventsResponse({
    required this.auditEvents,
    this.nextToken,
  });

  factory GetCaseAuditEventsResponse.fromJson(Map<String, dynamic> json) {
    return GetCaseAuditEventsResponse(
      auditEvents: ((json['auditEvents'] as List?) ?? const [])
          .nonNulls
          .map((e) => AuditEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final auditEvents = this.auditEvents;
    final nextToken = this.nextToken;
    return {
      'auditEvents': auditEvents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListCasesForContactResponse {
  /// A list of Case summary information.
  final List<CaseSummary> cases;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  ListCasesForContactResponse({
    required this.cases,
    this.nextToken,
  });

  factory ListCasesForContactResponse.fromJson(Map<String, dynamic> json) {
    return ListCasesForContactResponse(
      cases: ((json['cases'] as List?) ?? const [])
          .nonNulls
          .map((e) => CaseSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cases = this.cases;
    final nextToken = this.nextToken;
    return {
      'cases': cases,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class SearchCasesResponse {
  /// A list of case documents where each case contains the properties
  /// <code>CaseId</code> and <code>Fields</code> where each field is a complex
  /// union structure.
  final List<SearchCasesResponseItem> cases;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  /// The total number of cases that matched the search criteria.
  final int? totalCount;

  SearchCasesResponse({
    required this.cases,
    this.nextToken,
    this.totalCount,
  });

  factory SearchCasesResponse.fromJson(Map<String, dynamic> json) {
    return SearchCasesResponse(
      cases: ((json['cases'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              SearchCasesResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      totalCount: json['totalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cases = this.cases;
    final nextToken = this.nextToken;
    final totalCount = this.totalCount;
    return {
      'cases': cases,
      if (nextToken != null) 'nextToken': nextToken,
      if (totalCount != null) 'totalCount': totalCount,
    };
  }
}

class CreateRelatedItemResponse {
  /// The Amazon Resource Name (ARN) of the related item.
  final String relatedItemArn;

  /// The unique identifier of the related item.
  final String relatedItemId;

  CreateRelatedItemResponse({
    required this.relatedItemArn,
    required this.relatedItemId,
  });

  factory CreateRelatedItemResponse.fromJson(Map<String, dynamic> json) {
    return CreateRelatedItemResponse(
      relatedItemArn: (json['relatedItemArn'] as String?) ?? '',
      relatedItemId: (json['relatedItemId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final relatedItemArn = this.relatedItemArn;
    final relatedItemId = this.relatedItemId;
    return {
      'relatedItemArn': relatedItemArn,
      'relatedItemId': relatedItemId,
    };
  }
}

class UpdateRelatedItemResponse {
  /// Time at which the related item was associated with the case.
  final DateTime associationTime;

  /// Represents the content of the updated related item.
  final RelatedItemContent content;

  /// The Amazon Resource Name (ARN) of the updated related item.
  final String relatedItemArn;

  /// The unique identifier of the updated related item.
  final String relatedItemId;

  /// Type of the updated related item.
  final RelatedItemType type;

  /// Represents the creator of the related item.
  final UserUnion? createdBy;

  /// Represents the last user that updated the related item.
  final UserUnion? lastUpdatedUser;

  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  UpdateRelatedItemResponse({
    required this.associationTime,
    required this.content,
    required this.relatedItemArn,
    required this.relatedItemId,
    required this.type,
    this.createdBy,
    this.lastUpdatedUser,
    this.tags,
  });

  factory UpdateRelatedItemResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRelatedItemResponse(
      associationTime:
          nonNullableTimeStampFromJson(json['associationTime'] ?? 0),
      content: RelatedItemContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      relatedItemArn: (json['relatedItemArn'] as String?) ?? '',
      relatedItemId: (json['relatedItemId'] as String?) ?? '',
      type: RelatedItemType.fromString((json['type'] as String?) ?? ''),
      createdBy: json['createdBy'] != null
          ? UserUnion.fromJson(json['createdBy'] as Map<String, dynamic>)
          : null,
      lastUpdatedUser: json['lastUpdatedUser'] != null
          ? UserUnion.fromJson(json['lastUpdatedUser'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final associationTime = this.associationTime;
    final content = this.content;
    final relatedItemArn = this.relatedItemArn;
    final relatedItemId = this.relatedItemId;
    final type = this.type;
    final createdBy = this.createdBy;
    final lastUpdatedUser = this.lastUpdatedUser;
    final tags = this.tags;
    return {
      'associationTime': iso8601ToJson(associationTime),
      'content': content,
      'relatedItemArn': relatedItemArn,
      'relatedItemId': relatedItemId,
      'type': type.value,
      if (createdBy != null) 'createdBy': createdBy,
      if (lastUpdatedUser != null) 'lastUpdatedUser': lastUpdatedUser,
      if (tags != null) 'tags': tags,
    };
  }
}

class DeleteRelatedItemResponse {
  DeleteRelatedItemResponse();

  factory DeleteRelatedItemResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRelatedItemResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class SearchRelatedItemsResponse {
  /// A list of items related to a case.
  final List<SearchRelatedItemsResponseItem> relatedItems;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  SearchRelatedItemsResponse({
    required this.relatedItems,
    this.nextToken,
  });

  factory SearchRelatedItemsResponse.fromJson(Map<String, dynamic> json) {
    return SearchRelatedItemsResponse(
      relatedItems: ((json['relatedItems'] as List?) ?? const [])
          .nonNulls
          .map((e) => SearchRelatedItemsResponseItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final relatedItems = this.relatedItems;
    final nextToken = this.nextToken;
    return {
      'relatedItems': relatedItems,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateCaseRuleResponse {
  /// The Amazon Resource Name (ARN) of a case rule.
  final String caseRuleArn;

  /// Unique identifier of a case rule.
  final String caseRuleId;

  CreateCaseRuleResponse({
    required this.caseRuleArn,
    required this.caseRuleId,
  });

  factory CreateCaseRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateCaseRuleResponse(
      caseRuleArn: (json['caseRuleArn'] as String?) ?? '',
      caseRuleId: (json['caseRuleId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final caseRuleArn = this.caseRuleArn;
    final caseRuleId = this.caseRuleId;
    return {
      'caseRuleArn': caseRuleArn,
      'caseRuleId': caseRuleId,
    };
  }
}

class UpdateCaseRuleResponse {
  UpdateCaseRuleResponse();

  factory UpdateCaseRuleResponse.fromJson(Map<String, dynamic> _) {
    return UpdateCaseRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteCaseRuleResponse {
  DeleteCaseRuleResponse();

  factory DeleteCaseRuleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCaseRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListCaseRulesResponse {
  /// A list of field summary objects.
  final List<CaseRuleSummary> caseRules;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  ListCaseRulesResponse({
    required this.caseRules,
    this.nextToken,
  });

  factory ListCaseRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListCaseRulesResponse(
      caseRules: ((json['caseRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => CaseRuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final caseRules = this.caseRules;
    final nextToken = this.nextToken;
    return {
      'caseRules': caseRules,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class BatchGetCaseRuleResponse {
  /// A list of detailed case rule information.
  final List<GetCaseRuleResponse> caseRules;

  /// A list of case rule errors.
  final List<CaseRuleError> errors;

  /// A list of unprocessed case rule identifiers.
  final List<String>? unprocessedCaseRules;

  BatchGetCaseRuleResponse({
    required this.caseRules,
    required this.errors,
    this.unprocessedCaseRules,
  });

  factory BatchGetCaseRuleResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetCaseRuleResponse(
      caseRules: ((json['caseRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => GetCaseRuleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => CaseRuleError.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedCaseRules: (json['unprocessedCaseRules'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final caseRules = this.caseRules;
    final errors = this.errors;
    final unprocessedCaseRules = this.unprocessedCaseRules;
    return {
      'caseRules': caseRules,
      'errors': errors,
      if (unprocessedCaseRules != null)
        'unprocessedCaseRules': unprocessedCaseRules,
    };
  }
}

class CreateDomainResponse {
  /// The Amazon Resource Name (ARN) for the Cases domain.
  final String domainArn;

  /// The unique identifier of the Cases domain.
  final String domainId;

  /// The status of the domain.
  final DomainStatus domainStatus;

  CreateDomainResponse({
    required this.domainArn,
    required this.domainId,
    required this.domainStatus,
  });

  factory CreateDomainResponse.fromJson(Map<String, dynamic> json) {
    return CreateDomainResponse(
      domainArn: (json['domainArn'] as String?) ?? '',
      domainId: (json['domainId'] as String?) ?? '',
      domainStatus:
          DomainStatus.fromString((json['domainStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final domainArn = this.domainArn;
    final domainId = this.domainId;
    final domainStatus = this.domainStatus;
    return {
      'domainArn': domainArn,
      'domainId': domainId,
      'domainStatus': domainStatus.value,
    };
  }
}

class GetDomainResponse {
  /// The timestamp when the Cases domain was created.
  final DateTime createdTime;

  /// The Amazon Resource Name (ARN) for the Cases domain.
  final String domainArn;

  /// The unique identifier of the Cases domain.
  final String domainId;

  /// The status of the Cases domain.
  final DomainStatus domainStatus;

  /// The name of the Cases domain.
  final String name;

  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetDomainResponse({
    required this.createdTime,
    required this.domainArn,
    required this.domainId,
    required this.domainStatus,
    required this.name,
    this.tags,
  });

  factory GetDomainResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainResponse(
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      domainArn: (json['domainArn'] as String?) ?? '',
      domainId: (json['domainId'] as String?) ?? '',
      domainStatus:
          DomainStatus.fromString((json['domainStatus'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final domainArn = this.domainArn;
    final domainId = this.domainId;
    final domainStatus = this.domainStatus;
    final name = this.name;
    final tags = this.tags;
    return {
      'createdTime': iso8601ToJson(createdTime),
      'domainArn': domainArn,
      'domainId': domainId,
      'domainStatus': domainStatus.value,
      'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class DeleteDomainResponse {
  DeleteDomainResponse();

  factory DeleteDomainResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDomainResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListDomainsResponse {
  /// The Cases domain.
  final List<DomainSummary> domains;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  ListDomainsResponse({
    required this.domains,
    this.nextToken,
  });

  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainsResponse(
      domains: ((json['domains'] as List?) ?? const [])
          .nonNulls
          .map((e) => DomainSummary.fromJson(e as Map<String, dynamic>))
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

class GetCaseEventConfigurationResponse {
  /// Configuration to enable EventBridge case event delivery and determine what
  /// data is delivered.
  final EventBridgeConfiguration eventBridge;

  GetCaseEventConfigurationResponse({
    required this.eventBridge,
  });

  factory GetCaseEventConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCaseEventConfigurationResponse(
      eventBridge: EventBridgeConfiguration.fromJson(
          (json['eventBridge'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final eventBridge = this.eventBridge;
    return {
      'eventBridge': eventBridge,
    };
  }
}

class PutCaseEventConfigurationResponse {
  PutCaseEventConfigurationResponse();

  factory PutCaseEventConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return PutCaseEventConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class SearchAllRelatedItemsResponse {
  /// A list of items related to a case.
  final List<SearchAllRelatedItemsResponseItem> relatedItems;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  SearchAllRelatedItemsResponse({
    required this.relatedItems,
    this.nextToken,
  });

  factory SearchAllRelatedItemsResponse.fromJson(Map<String, dynamic> json) {
    return SearchAllRelatedItemsResponse(
      relatedItems: ((json['relatedItems'] as List?) ?? const [])
          .nonNulls
          .map((e) => SearchAllRelatedItemsResponseItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final relatedItems = this.relatedItems;
    final nextToken = this.nextToken;
    return {
      'relatedItems': relatedItems,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateFieldResponse {
  /// The Amazon Resource Name (ARN) of the field.
  final String fieldArn;

  /// The unique identifier of a field.
  final String fieldId;

  CreateFieldResponse({
    required this.fieldArn,
    required this.fieldId,
  });

  factory CreateFieldResponse.fromJson(Map<String, dynamic> json) {
    return CreateFieldResponse(
      fieldArn: (json['fieldArn'] as String?) ?? '',
      fieldId: (json['fieldId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fieldArn = this.fieldArn;
    final fieldId = this.fieldId;
    return {
      'fieldArn': fieldArn,
      'fieldId': fieldId,
    };
  }
}

class UpdateFieldResponse {
  UpdateFieldResponse();

  factory UpdateFieldResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFieldResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFieldResponse {
  DeleteFieldResponse();

  factory DeleteFieldResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFieldResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListFieldsResponse {
  /// List of detailed field information.
  final List<FieldSummary> fields;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  ListFieldsResponse({
    required this.fields,
    this.nextToken,
  });

  factory ListFieldsResponse.fromJson(Map<String, dynamic> json) {
    return ListFieldsResponse(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => FieldSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final nextToken = this.nextToken;
    return {
      'fields': fields,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class BatchPutFieldOptionsResponse {
  /// A list of field errors.
  final List<FieldOptionError>? errors;

  BatchPutFieldOptionsResponse({
    this.errors,
  });

  factory BatchPutFieldOptionsResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutFieldOptionsResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => FieldOptionError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

class ListFieldOptionsResponse {
  /// A list of <code>FieldOption</code> objects.
  final List<FieldOption> options;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  ListFieldOptionsResponse({
    required this.options,
    this.nextToken,
  });

  factory ListFieldOptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListFieldOptionsResponse(
      options: ((json['options'] as List?) ?? const [])
          .nonNulls
          .map((e) => FieldOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final nextToken = this.nextToken;
    return {
      'options': options,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class BatchGetFieldResponse {
  /// A list of field errors.
  final List<FieldError> errors;

  /// A list of detailed field information.
  final List<GetFieldResponse> fields;

  BatchGetFieldResponse({
    required this.errors,
    required this.fields,
  });

  factory BatchGetFieldResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetFieldResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => FieldError.fromJson(e as Map<String, dynamic>))
          .toList(),
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => GetFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final fields = this.fields;
    return {
      'errors': errors,
      'fields': fields,
    };
  }
}

class CreateLayoutResponse {
  /// The Amazon Resource Name (ARN) of the newly created layout.
  final String layoutArn;

  /// The unique identifier of the layout.
  final String layoutId;

  CreateLayoutResponse({
    required this.layoutArn,
    required this.layoutId,
  });

  factory CreateLayoutResponse.fromJson(Map<String, dynamic> json) {
    return CreateLayoutResponse(
      layoutArn: (json['layoutArn'] as String?) ?? '',
      layoutId: (json['layoutId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final layoutArn = this.layoutArn;
    final layoutId = this.layoutId;
    return {
      'layoutArn': layoutArn,
      'layoutId': layoutId,
    };
  }
}

class GetLayoutResponse {
  /// Information about which fields will be present in the layout, the order of
  /// the fields, and read-only attribute of the field.
  final LayoutContent content;

  /// The Amazon Resource Name (ARN) of the newly created layout.
  final String layoutArn;

  /// The unique identifier of the layout.
  final String layoutId;

  /// The name of the layout. It must be unique.
  final String name;

  /// Timestamp at which the resource was created.
  final DateTime? createdTime;

  /// Denotes whether or not the resource has been deleted.
  final bool? deleted;

  /// Timestamp at which the resource was created or last modified.
  final DateTime? lastModifiedTime;

  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetLayoutResponse({
    required this.content,
    required this.layoutArn,
    required this.layoutId,
    required this.name,
    this.createdTime,
    this.deleted,
    this.lastModifiedTime,
    this.tags,
  });

  factory GetLayoutResponse.fromJson(Map<String, dynamic> json) {
    return GetLayoutResponse(
      content: LayoutContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      layoutArn: (json['layoutArn'] as String?) ?? '',
      layoutId: (json['layoutId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      createdTime: timeStampFromJson(json['createdTime']),
      deleted: json['deleted'] as bool?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final layoutArn = this.layoutArn;
    final layoutId = this.layoutId;
    final name = this.name;
    final createdTime = this.createdTime;
    final deleted = this.deleted;
    final lastModifiedTime = this.lastModifiedTime;
    final tags = this.tags;
    return {
      'content': content,
      'layoutArn': layoutArn,
      'layoutId': layoutId,
      'name': name,
      if (createdTime != null) 'createdTime': iso8601ToJson(createdTime),
      if (deleted != null) 'deleted': deleted,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateLayoutResponse {
  UpdateLayoutResponse();

  factory UpdateLayoutResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLayoutResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLayoutResponse {
  DeleteLayoutResponse();

  factory DeleteLayoutResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLayoutResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListLayoutsResponse {
  /// The layouts for the domain.
  final List<LayoutSummary> layouts;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  ListLayoutsResponse({
    required this.layouts,
    this.nextToken,
  });

  factory ListLayoutsResponse.fromJson(Map<String, dynamic> json) {
    return ListLayoutsResponse(
      layouts: ((json['layouts'] as List?) ?? const [])
          .nonNulls
          .map((e) => LayoutSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final layouts = this.layouts;
    final nextToken = this.nextToken;
    return {
      'layouts': layouts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateTemplateResponse {
  /// The Amazon Resource Name (ARN) of the newly created template.
  final String templateArn;

  /// A unique identifier of a template.
  final String templateId;

  CreateTemplateResponse({
    required this.templateArn,
    required this.templateId,
  });

  factory CreateTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateTemplateResponse(
      templateArn: (json['templateArn'] as String?) ?? '',
      templateId: (json['templateId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final templateArn = this.templateArn;
    final templateId = this.templateId;
    return {
      'templateArn': templateArn,
      'templateId': templateId,
    };
  }
}

class GetTemplateResponse {
  /// The name of the template.
  final String name;

  /// The status of the template.
  final TemplateStatus status;

  /// The Amazon Resource Name (ARN) of the template.
  final String templateArn;

  /// A unique identifier of a template.
  final String templateId;

  /// Timestamp at which the resource was created.
  final DateTime? createdTime;

  /// Denotes whether or not the resource has been deleted.
  final bool? deleted;

  /// A brief description of the template.
  final String? description;

  /// Timestamp at which the resource was created or last modified.
  final DateTime? lastModifiedTime;

  /// Configuration of layouts associated to the template.
  final LayoutConfiguration? layoutConfiguration;

  /// A list of fields that must contain a value for a case to be successfully
  /// created with this template.
  final List<RequiredField>? requiredFields;

  /// A list of case rules (also known as <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">case
  /// field conditions</a>) on a template.
  final List<TemplateRule>? rules;

  /// Defines tag propagation configuration for resources created within a domain.
  /// Tags specified here will be automatically applied to resources being created
  /// for the specified resource type.
  final List<TagPropagationConfiguration>? tagPropagationConfigurations;

  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetTemplateResponse({
    required this.name,
    required this.status,
    required this.templateArn,
    required this.templateId,
    this.createdTime,
    this.deleted,
    this.description,
    this.lastModifiedTime,
    this.layoutConfiguration,
    this.requiredFields,
    this.rules,
    this.tagPropagationConfigurations,
    this.tags,
  });

  factory GetTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetTemplateResponse(
      name: (json['name'] as String?) ?? '',
      status: TemplateStatus.fromString((json['status'] as String?) ?? ''),
      templateArn: (json['templateArn'] as String?) ?? '',
      templateId: (json['templateId'] as String?) ?? '',
      createdTime: timeStampFromJson(json['createdTime']),
      deleted: json['deleted'] as bool?,
      description: json['description'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      layoutConfiguration: json['layoutConfiguration'] != null
          ? LayoutConfiguration.fromJson(
              json['layoutConfiguration'] as Map<String, dynamic>)
          : null,
      requiredFields: (json['requiredFields'] as List?)
          ?.nonNulls
          .map((e) => RequiredField.fromJson(e as Map<String, dynamic>))
          .toList(),
      rules: (json['rules'] as List?)
          ?.nonNulls
          .map((e) => TemplateRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagPropagationConfigurations: (json['tagPropagationConfigurations']
              as List?)
          ?.nonNulls
          .map((e) =>
              TagPropagationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final templateArn = this.templateArn;
    final templateId = this.templateId;
    final createdTime = this.createdTime;
    final deleted = this.deleted;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final layoutConfiguration = this.layoutConfiguration;
    final requiredFields = this.requiredFields;
    final rules = this.rules;
    final tagPropagationConfigurations = this.tagPropagationConfigurations;
    final tags = this.tags;
    return {
      'name': name,
      'status': status.value,
      'templateArn': templateArn,
      'templateId': templateId,
      if (createdTime != null) 'createdTime': iso8601ToJson(createdTime),
      if (deleted != null) 'deleted': deleted,
      if (description != null) 'description': description,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (layoutConfiguration != null)
        'layoutConfiguration': layoutConfiguration,
      if (requiredFields != null) 'requiredFields': requiredFields,
      if (rules != null) 'rules': rules,
      if (tagPropagationConfigurations != null)
        'tagPropagationConfigurations': tagPropagationConfigurations,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateTemplateResponse {
  UpdateTemplateResponse();

  factory UpdateTemplateResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTemplateResponse {
  DeleteTemplateResponse();

  factory DeleteTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListTemplatesResponse {
  /// List of template summary objects.
  final List<TemplateSummary> templates;

  /// The token for the next set of results. This is null if there are no more
  /// results to return.
  final String? nextToken;

  ListTemplatesResponse({
    required this.templates,
    this.nextToken,
  });

  factory ListTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListTemplatesResponse(
      templates: ((json['templates'] as List?) ?? const [])
          .nonNulls
          .map((e) => TemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templates = this.templates;
    final nextToken = this.nextToken;
    return {
      'templates': templates,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Template summary information.
class TemplateSummary {
  /// The template name.
  final String name;

  /// The status of the template.
  final TemplateStatus status;

  /// The Amazon Resource Name (ARN) of the template.
  final String templateArn;

  /// The unique identifier for the template.
  final String templateId;

  /// Defines tag propagation configuration for resources created within a domain.
  /// Tags specified here will be automatically applied to resources being created
  /// for the specified resource type.
  final List<TagPropagationConfiguration>? tagPropagationConfigurations;

  TemplateSummary({
    required this.name,
    required this.status,
    required this.templateArn,
    required this.templateId,
    this.tagPropagationConfigurations,
  });

  factory TemplateSummary.fromJson(Map<String, dynamic> json) {
    return TemplateSummary(
      name: (json['name'] as String?) ?? '',
      status: TemplateStatus.fromString((json['status'] as String?) ?? ''),
      templateArn: (json['templateArn'] as String?) ?? '',
      templateId: (json['templateId'] as String?) ?? '',
      tagPropagationConfigurations: (json['tagPropagationConfigurations']
              as List?)
          ?.nonNulls
          .map((e) =>
              TagPropagationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final templateArn = this.templateArn;
    final templateId = this.templateId;
    final tagPropagationConfigurations = this.tagPropagationConfigurations;
    return {
      'name': name,
      'status': status.value,
      'templateArn': templateArn,
      'templateId': templateId,
      if (tagPropagationConfigurations != null)
        'tagPropagationConfigurations': tagPropagationConfigurations,
    };
  }
}

class TemplateStatus {
  static const active = TemplateStatus._('Active');
  static const inactive = TemplateStatus._('Inactive');

  final String value;

  const TemplateStatus._(this.value);

  static const values = [active, inactive];

  static TemplateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TemplateStatus._(value));

  @override
  bool operator ==(other) => other is TemplateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines tag propagation configuration for resources created within a domain.
/// Tags specified here will be automatically applied to resources being created
/// for the specified resource type.
class TagPropagationConfiguration {
  /// Supported resource types for tag propagation. Determines which resources
  /// will receive automatically propagated tags.
  final TagPropagationResourceType resourceType;

  /// The tags that will be applied to the created resource.
  final Map<String, String> tagMap;

  TagPropagationConfiguration({
    required this.resourceType,
    required this.tagMap,
  });

  factory TagPropagationConfiguration.fromJson(Map<String, dynamic> json) {
    return TagPropagationConfiguration(
      resourceType: TagPropagationResourceType.fromString(
          (json['resourceType'] as String?) ?? ''),
      tagMap: ((json['tagMap'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final tagMap = this.tagMap;
    return {
      'resourceType': resourceType.value,
      'tagMap': tagMap,
    };
  }
}

class TagPropagationResourceType {
  static const cases = TagPropagationResourceType._('Cases');

  final String value;

  const TagPropagationResourceType._(this.value);

  static const values = [cases];

  static TagPropagationResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TagPropagationResourceType._(value));

  @override
  bool operator ==(other) =>
      other is TagPropagationResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object to store configuration of layouts associated to the template.
class LayoutConfiguration {
  /// Unique identifier of a layout.
  final String? defaultLayout;

  LayoutConfiguration({
    this.defaultLayout,
  });

  factory LayoutConfiguration.fromJson(Map<String, dynamic> json) {
    return LayoutConfiguration(
      defaultLayout: json['defaultLayout'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultLayout = this.defaultLayout;
    return {
      if (defaultLayout != null) 'defaultLayout': defaultLayout,
    };
  }
}

/// An association representing a case rule acting upon a field. In the Amazon
/// Connect admin website, case rules are known as <i>case field conditions</i>.
/// For more information about case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class TemplateRule {
  /// Unique identifier of a case rule.
  final String caseRuleId;

  /// Unique identifier of a field.
  final String? fieldId;

  TemplateRule({
    required this.caseRuleId,
    this.fieldId,
  });

  factory TemplateRule.fromJson(Map<String, dynamic> json) {
    return TemplateRule(
      caseRuleId: (json['caseRuleId'] as String?) ?? '',
      fieldId: json['fieldId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final caseRuleId = this.caseRuleId;
    final fieldId = this.fieldId;
    return {
      'caseRuleId': caseRuleId,
      if (fieldId != null) 'fieldId': fieldId,
    };
  }
}

/// List of fields that must have a value provided to create a case.
class RequiredField {
  /// Unique identifier of a field.
  final String fieldId;

  RequiredField({
    required this.fieldId,
  });

  factory RequiredField.fromJson(Map<String, dynamic> json) {
    return RequiredField(
      fieldId: (json['fieldId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fieldId = this.fieldId;
    return {
      'fieldId': fieldId,
    };
  }
}

/// Object for the summarized details of the layout.
class LayoutSummary {
  /// The Amazon Resource Name (ARN) of the layout.
  final String layoutArn;

  /// The unique identifier for of the layout.
  final String layoutId;

  /// The name of the layout.
  final String name;

  LayoutSummary({
    required this.layoutArn,
    required this.layoutId,
    required this.name,
  });

  factory LayoutSummary.fromJson(Map<String, dynamic> json) {
    return LayoutSummary(
      layoutArn: (json['layoutArn'] as String?) ?? '',
      layoutId: (json['layoutId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final layoutArn = this.layoutArn;
    final layoutId = this.layoutId;
    final name = this.name;
    return {
      'layoutArn': layoutArn,
      'layoutId': layoutId,
      'name': name,
    };
  }
}

/// Object to store union of different versions of layout content.
class LayoutContent {
  /// Content specific to <code>BasicLayout</code> type. It configures fields in
  /// the top panel and More Info tab of Cases user interface.
  final BasicLayout? basic;

  LayoutContent({
    this.basic,
  });

  factory LayoutContent.fromJson(Map<String, dynamic> json) {
    return LayoutContent(
      basic: json['basic'] != null
          ? BasicLayout.fromJson(json['basic'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final basic = this.basic;
    return {
      if (basic != null) 'basic': basic,
    };
  }
}

/// Content specific to <code>BasicLayout</code> type. It configures fields in
/// the top panel and More Info tab of agent application.
class BasicLayout {
  /// This represents sections in a tab of the page layout.
  final LayoutSections? moreInfo;

  /// This represents sections in a panel of the page layout.
  final LayoutSections? topPanel;

  BasicLayout({
    this.moreInfo,
    this.topPanel,
  });

  factory BasicLayout.fromJson(Map<String, dynamic> json) {
    return BasicLayout(
      moreInfo: json['moreInfo'] != null
          ? LayoutSections.fromJson(json['moreInfo'] as Map<String, dynamic>)
          : null,
      topPanel: json['topPanel'] != null
          ? LayoutSections.fromJson(json['topPanel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final moreInfo = this.moreInfo;
    final topPanel = this.topPanel;
    return {
      if (moreInfo != null) 'moreInfo': moreInfo,
      if (topPanel != null) 'topPanel': topPanel,
    };
  }
}

/// Ordered list containing different kinds of sections that can be added. A
/// LayoutSections object can only contain one section.
class LayoutSections {
  final List<Section>? sections;

  LayoutSections({
    this.sections,
  });

  factory LayoutSections.fromJson(Map<String, dynamic> json) {
    return LayoutSections(
      sections: (json['sections'] as List?)
          ?.nonNulls
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sections = this.sections;
    return {
      if (sections != null) 'sections': sections,
    };
  }
}

/// This represents a sections within a panel or tab of the page layout.
class Section {
  /// Consists of a group of fields and associated properties.
  final FieldGroup? fieldGroup;

  Section({
    this.fieldGroup,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      fieldGroup: json['fieldGroup'] != null
          ? FieldGroup.fromJson(json['fieldGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldGroup = this.fieldGroup;
    return {
      if (fieldGroup != null) 'fieldGroup': fieldGroup,
    };
  }
}

/// Object for a group of fields and associated properties.
class FieldGroup {
  /// Represents an ordered list containing field related information.
  final List<FieldItem> fields;

  /// Name of the field group.
  final String? name;

  FieldGroup({
    required this.fields,
    this.name,
  });

  factory FieldGroup.fromJson(Map<String, dynamic> json) {
    return FieldGroup(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => FieldItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final name = this.name;
    return {
      'fields': fields,
      if (name != null) 'name': name,
    };
  }
}

/// Object for field related information.
class FieldItem {
  /// Unique identifier of a field.
  final String id;

  FieldItem({
    required this.id,
  });

  factory FieldItem.fromJson(Map<String, dynamic> json) {
    return FieldItem(
      id: (json['id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Object for errors on fields.
class FieldError {
  /// The error code from getting a field.
  final String errorCode;

  /// The field identifier that caused the error.
  final String id;

  /// The error message from getting a field.
  final String? message;

  FieldError({
    required this.errorCode,
    required this.id,
    this.message,
  });

  factory FieldError.fromJson(Map<String, dynamic> json) {
    return FieldError(
      errorCode: (json['errorCode'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final id = this.id;
    final message = this.message;
    return {
      'errorCode': errorCode,
      'id': id,
      if (message != null) 'message': message,
    };
  }
}

/// Object to store detailed field information.
class GetFieldResponse {
  /// The Amazon Resource Name (ARN) of the field.
  final String fieldArn;

  /// Unique identifier of the field.
  final String fieldId;

  /// Name of the field.
  final String name;

  /// Namespace of the field.
  final FieldNamespace namespace;

  /// Type of the field.
  final FieldType type;

  /// Union of field attributes.
  final FieldAttributes? attributes;

  /// Timestamp at which the resource was created.
  final DateTime? createdTime;

  /// Denotes whether or not the resource has been deleted.
  final bool? deleted;

  /// Description of the field.
  final String? description;

  /// Timestamp at which the resource was created or last modified.
  final DateTime? lastModifiedTime;

  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetFieldResponse({
    required this.fieldArn,
    required this.fieldId,
    required this.name,
    required this.namespace,
    required this.type,
    this.attributes,
    this.createdTime,
    this.deleted,
    this.description,
    this.lastModifiedTime,
    this.tags,
  });

  factory GetFieldResponse.fromJson(Map<String, dynamic> json) {
    return GetFieldResponse(
      fieldArn: (json['fieldArn'] as String?) ?? '',
      fieldId: (json['fieldId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      namespace:
          FieldNamespace.fromString((json['namespace'] as String?) ?? ''),
      type: FieldType.fromString((json['type'] as String?) ?? ''),
      attributes: json['attributes'] != null
          ? FieldAttributes.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
      createdTime: timeStampFromJson(json['createdTime']),
      deleted: json['deleted'] as bool?,
      description: json['description'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldArn = this.fieldArn;
    final fieldId = this.fieldId;
    final name = this.name;
    final namespace = this.namespace;
    final type = this.type;
    final attributes = this.attributes;
    final createdTime = this.createdTime;
    final deleted = this.deleted;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final tags = this.tags;
    return {
      'fieldArn': fieldArn,
      'fieldId': fieldId,
      'name': name,
      'namespace': namespace.value,
      'type': type.value,
      if (attributes != null) 'attributes': attributes,
      if (createdTime != null) 'createdTime': iso8601ToJson(createdTime),
      if (deleted != null) 'deleted': deleted,
      if (description != null) 'description': description,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (tags != null) 'tags': tags,
    };
  }
}

class FieldType {
  static const text = FieldType._('Text');
  static const number = FieldType._('Number');
  static const boolean = FieldType._('Boolean');
  static const dateTime = FieldType._('DateTime');
  static const singleSelect = FieldType._('SingleSelect');
  static const url = FieldType._('Url');
  static const user = FieldType._('User');

  final String value;

  const FieldType._(this.value);

  static const values = [
    text,
    number,
    boolean,
    dateTime,
    singleSelect,
    url,
    user
  ];

  static FieldType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FieldType._(value));

  @override
  bool operator ==(other) => other is FieldType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class FieldNamespace {
  static const system = FieldNamespace._('System');
  static const custom = FieldNamespace._('Custom');

  final String value;

  const FieldNamespace._(this.value);

  static const values = [system, custom];

  static FieldNamespace fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FieldNamespace._(value));

  @override
  bool operator ==(other) => other is FieldNamespace && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Union of field attributes.
class FieldAttributes {
  /// Field attributes for Text field type.
  final TextAttributes? text;

  FieldAttributes({
    this.text,
  });

  factory FieldAttributes.fromJson(Map<String, dynamic> json) {
    return FieldAttributes(
      text: json['text'] != null
          ? TextAttributes.fromJson(json['text'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// Field attributes for Text field type.
class TextAttributes {
  /// Attribute that defines rendering component and validation.
  final bool isMultiline;

  TextAttributes({
    required this.isMultiline,
  });

  factory TextAttributes.fromJson(Map<String, dynamic> json) {
    return TextAttributes(
      isMultiline: (json['isMultiline'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isMultiline = this.isMultiline;
    return {
      'isMultiline': isMultiline,
    };
  }
}

/// Object for unique identifier of a field.
class FieldIdentifier {
  /// Unique identifier of a field.
  final String id;

  FieldIdentifier({
    required this.id,
  });

  factory FieldIdentifier.fromJson(Map<String, dynamic> json) {
    return FieldIdentifier(
      id: (json['id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Object for field Options information.
class FieldOption {
  /// Describes whether the <code>FieldOption</code> is active (displayed) or
  /// inactive.
  final bool active;

  /// <code>FieldOptionName</code> has max length 100 and disallows trailing
  /// spaces.
  final String name;

  /// <code>FieldOptionValue</code> has max length 100 and must be alphanumeric
  /// with hyphens and underscores.
  final String value;

  FieldOption({
    required this.active,
    required this.name,
    required this.value,
  });

  factory FieldOption.fromJson(Map<String, dynamic> json) {
    return FieldOption(
      active: (json['active'] as bool?) ?? false,
      name: (json['name'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final name = this.name;
    final value = this.value;
    return {
      'active': active,
      'name': name,
      'value': value,
    };
  }
}

/// Object for field Options errors.
class FieldOptionError {
  /// Error code from creating or updating field option.
  final String errorCode;

  /// Error message from creating or updating field option.
  final String message;

  /// The field option value that caused the error.
  final String value;

  FieldOptionError({
    required this.errorCode,
    required this.message,
    required this.value,
  });

  factory FieldOptionError.fromJson(Map<String, dynamic> json) {
    return FieldOptionError(
      errorCode: (json['errorCode'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    final value = this.value;
    return {
      'errorCode': errorCode,
      'message': message,
      'value': value,
    };
  }
}

/// Object for the summarized details of the field.
class FieldSummary {
  /// The Amazon Resource Name (ARN) of the field.
  final String fieldArn;

  /// The unique identifier of a field.
  final String fieldId;

  /// Name of the field.
  final String name;

  /// The namespace of a field.
  final FieldNamespace namespace;

  /// The type of a field.
  final FieldType type;

  /// Union of field attributes.
  final FieldAttributes? attributes;

  FieldSummary({
    required this.fieldArn,
    required this.fieldId,
    required this.name,
    required this.namespace,
    required this.type,
    this.attributes,
  });

  factory FieldSummary.fromJson(Map<String, dynamic> json) {
    return FieldSummary(
      fieldArn: (json['fieldArn'] as String?) ?? '',
      fieldId: (json['fieldId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      namespace:
          FieldNamespace.fromString((json['namespace'] as String?) ?? ''),
      type: FieldType.fromString((json['type'] as String?) ?? ''),
      attributes: json['attributes'] != null
          ? FieldAttributes.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldArn = this.fieldArn;
    final fieldId = this.fieldId;
    final name = this.name;
    final namespace = this.namespace;
    final type = this.type;
    final attributes = this.attributes;
    return {
      'fieldArn': fieldArn,
      'fieldId': fieldId,
      'name': name,
      'namespace': namespace.value,
      'type': type.value,
      if (attributes != null) 'attributes': attributes,
    };
  }
}

/// A list of items that represent RelatedItems. This data type is similar to <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_connect-cases_SearchRelatedItemsResponseItem.html">SearchRelatedItemsResponseItem</a>
/// except Search<b>All</b>RelatedItemsResponseItem has a caseId field.
class SearchAllRelatedItemsResponseItem {
  /// Time at which a related item was associated with a case.
  final DateTime associationTime;

  /// A unique identifier of the case.
  final String caseId;
  final RelatedItemContent content;

  /// Unique identifier of a related item.
  final String relatedItemId;

  /// Type of a related item.
  final RelatedItemType type;
  final UserUnion? performedBy;

  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  SearchAllRelatedItemsResponseItem({
    required this.associationTime,
    required this.caseId,
    required this.content,
    required this.relatedItemId,
    required this.type,
    this.performedBy,
    this.tags,
  });

  factory SearchAllRelatedItemsResponseItem.fromJson(
      Map<String, dynamic> json) {
    return SearchAllRelatedItemsResponseItem(
      associationTime:
          nonNullableTimeStampFromJson(json['associationTime'] ?? 0),
      caseId: (json['caseId'] as String?) ?? '',
      content: RelatedItemContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      relatedItemId: (json['relatedItemId'] as String?) ?? '',
      type: RelatedItemType.fromString((json['type'] as String?) ?? ''),
      performedBy: json['performedBy'] != null
          ? UserUnion.fromJson(json['performedBy'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final associationTime = this.associationTime;
    final caseId = this.caseId;
    final content = this.content;
    final relatedItemId = this.relatedItemId;
    final type = this.type;
    final performedBy = this.performedBy;
    final tags = this.tags;
    return {
      'associationTime': iso8601ToJson(associationTime),
      'caseId': caseId,
      'content': content,
      'relatedItemId': relatedItemId,
      'type': type.value,
      if (performedBy != null) 'performedBy': performedBy,
      if (tags != null) 'tags': tags,
    };
  }
}

class RelatedItemType {
  static const contact = RelatedItemType._('Contact');
  static const comment = RelatedItemType._('Comment');
  static const file = RelatedItemType._('File');
  static const sla = RelatedItemType._('Sla');
  static const connectCase = RelatedItemType._('ConnectCase');
  static const custom = RelatedItemType._('Custom');

  final String value;

  const RelatedItemType._(this.value);

  static const values = [contact, comment, file, sla, connectCase, custom];

  static RelatedItemType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RelatedItemType._(value));

  @override
  bool operator ==(other) => other is RelatedItemType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the content of a particular type of related item.
class RelatedItemContent {
  /// Represents the content of a comment to be returned to agents.
  final CommentContent? comment;

  /// Represents the Amazon Connect case to be created as a related item.
  final ConnectCaseContent? connectCase;

  /// Represents the content of a contact to be returned to agents.
  final ContactContent? contact;

  /// Represents the content of a <code>Custom</code> type related item.
  final CustomContent? custom;

  /// Represents the content of a File to be returned to agents.
  final FileContent? file;

  /// Represents the content of an SLA to be returned to agents.
  final SlaContent? sla;

  RelatedItemContent({
    this.comment,
    this.connectCase,
    this.contact,
    this.custom,
    this.file,
    this.sla,
  });

  factory RelatedItemContent.fromJson(Map<String, dynamic> json) {
    return RelatedItemContent(
      comment: json['comment'] != null
          ? CommentContent.fromJson(json['comment'] as Map<String, dynamic>)
          : null,
      connectCase: json['connectCase'] != null
          ? ConnectCaseContent.fromJson(
              json['connectCase'] as Map<String, dynamic>)
          : null,
      contact: json['contact'] != null
          ? ContactContent.fromJson(json['contact'] as Map<String, dynamic>)
          : null,
      custom: json['custom'] != null
          ? CustomContent.fromJson(json['custom'] as Map<String, dynamic>)
          : null,
      file: json['file'] != null
          ? FileContent.fromJson(json['file'] as Map<String, dynamic>)
          : null,
      sla: json['sla'] != null
          ? SlaContent.fromJson(json['sla'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final connectCase = this.connectCase;
    final contact = this.contact;
    final custom = this.custom;
    final file = this.file;
    final sla = this.sla;
    return {
      if (comment != null) 'comment': comment,
      if (connectCase != null) 'connectCase': connectCase,
      if (contact != null) 'contact': contact,
      if (custom != null) 'custom': custom,
      if (file != null) 'file': file,
      if (sla != null) 'sla': sla,
    };
  }
}

/// Represents the entity that performed the action.
class UserUnion {
  /// Any provided entity.
  final String? customEntity;

  /// Represents the Amazon Connect ARN of the user.
  final String? userArn;

  UserUnion({
    this.customEntity,
    this.userArn,
  });

  factory UserUnion.fromJson(Map<String, dynamic> json) {
    return UserUnion(
      customEntity: json['customEntity'] as String?,
      userArn: json['userArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customEntity = this.customEntity;
    final userArn = this.userArn;
    return {
      if (customEntity != null) 'customEntity': customEntity,
      if (userArn != null) 'userArn': userArn,
    };
  }
}

/// An object that represents a content of an Amazon Connect contact object.
class ContactContent {
  /// A list of channels to filter on for related items of type
  /// <code>Contact</code>.
  final String channel;

  /// The difference between the <code>InitiationTimestamp</code> and the
  /// <code>DisconnectTimestamp</code> of the contact.
  final DateTime connectedToSystemTime;

  /// A unique identifier of a contact in Amazon Connect.
  final String contactArn;

  ContactContent({
    required this.channel,
    required this.connectedToSystemTime,
    required this.contactArn,
  });

  factory ContactContent.fromJson(Map<String, dynamic> json) {
    return ContactContent(
      channel: (json['channel'] as String?) ?? '',
      connectedToSystemTime:
          nonNullableTimeStampFromJson(json['connectedToSystemTime'] ?? 0),
      contactArn: (json['contactArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final connectedToSystemTime = this.connectedToSystemTime;
    final contactArn = this.contactArn;
    return {
      'channel': channel,
      'connectedToSystemTime': iso8601ToJson(connectedToSystemTime),
      'contactArn': contactArn,
    };
  }
}

/// Represents the content of a <code>Comment</code> to be returned to agents.
class CommentContent {
  /// Text in the body of a <code>Comment</code> on a case.
  final String body;

  /// Type of the text in the box of a <code>Comment</code> on a case.
  final CommentBodyTextType contentType;

  CommentContent({
    required this.body,
    required this.contentType,
  });

  factory CommentContent.fromJson(Map<String, dynamic> json) {
    return CommentContent(
      body: (json['body'] as String?) ?? '',
      contentType: CommentBodyTextType.fromString(
          (json['contentType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentType = this.contentType;
    return {
      'body': body,
      'contentType': contentType.value,
    };
  }
}

/// An object that represents a content of an Amazon Connect file object.
class FileContent {
  /// The Amazon Resource Name (ARN) of a File in Amazon Connect.
  final String fileArn;

  FileContent({
    required this.fileArn,
  });

  factory FileContent.fromJson(Map<String, dynamic> json) {
    return FileContent(
      fileArn: (json['fileArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fileArn = this.fileArn;
    return {
      'fileArn': fileArn,
    };
  }
}

/// Represents the content of an SLA to be returned to agents.
class SlaContent {
  /// Represents an SLA configuration.
  final SlaConfiguration slaConfiguration;

  SlaContent({
    required this.slaConfiguration,
  });

  factory SlaContent.fromJson(Map<String, dynamic> json) {
    return SlaContent(
      slaConfiguration: SlaConfiguration.fromJson(
          (json['slaConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final slaConfiguration = this.slaConfiguration;
    return {
      'slaConfiguration': slaConfiguration,
    };
  }
}

/// Represents the content of a <code>ConnectCase</code> type related item.
class ConnectCaseContent {
  /// A unique identifier of the case.
  final String caseId;

  ConnectCaseContent({
    required this.caseId,
  });

  factory ConnectCaseContent.fromJson(Map<String, dynamic> json) {
    return ConnectCaseContent(
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

/// Represents the content of a <code>Custom</code> type related item.
class CustomContent {
  /// List of field values for the <code>Custom</code> related item.
  final List<FieldValue> fields;

  CustomContent({
    required this.fields,
  });

  factory CustomContent.fromJson(Map<String, dynamic> json) {
    return CustomContent(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => FieldValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    return {
      'fields': fields,
    };
  }
}

/// Object for case field values.
class FieldValue {
  /// Unique identifier of a field.
  final String id;

  /// Union of potential field value types.
  final FieldValueUnion value;

  FieldValue({
    required this.id,
    required this.value,
  });

  factory FieldValue.fromJson(Map<String, dynamic> json) {
    return FieldValue(
      id: (json['id'] as String?) ?? '',
      value: FieldValueUnion.fromJson(
          (json['value'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final value = this.value;
    return {
      'id': id,
      'value': value,
    };
  }
}

/// Object to store union of Field values.
/// <note>
/// The <code>Summary</code> system field accepts up to 3000 characters, while
/// all other fields accept up to 4100 characters. If you use multi-byte
/// characters, the effective character limit may be lower.
/// </note>
class FieldValueUnion {
  /// Can be either null, or have a Boolean value type. Only one value can be
  /// provided.
  final bool? booleanValue;

  /// Can be either null, or have a Double number value type. Only one value can
  /// be provided.
  final double? doubleValue;

  /// An empty value.
  final EmptyFieldValue? emptyValue;

  /// String value type.
  final String? stringValue;

  /// Represents the user that performed the audit.
  final String? userArnValue;

  FieldValueUnion({
    this.booleanValue,
    this.doubleValue,
    this.emptyValue,
    this.stringValue,
    this.userArnValue,
  });

  factory FieldValueUnion.fromJson(Map<String, dynamic> json) {
    return FieldValueUnion(
      booleanValue: json['booleanValue'] as bool?,
      doubleValue: json['doubleValue'] as double?,
      emptyValue: json['emptyValue'] != null
          ? EmptyFieldValue.fromJson(json['emptyValue'] as Map<String, dynamic>)
          : null,
      stringValue: json['stringValue'] as String?,
      userArnValue: json['userArnValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final emptyValue = this.emptyValue;
    final stringValue = this.stringValue;
    final userArnValue = this.userArnValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (emptyValue != null) 'emptyValue': emptyValue,
      if (stringValue != null) 'stringValue': stringValue,
      if (userArnValue != null) 'userArnValue': userArnValue,
    };
  }
}

/// An empty value. You cannot set <code>EmptyFieldValue</code> on a field that
/// is required on a case template.
///
/// This structure will never have any data members. It signifies an empty value
/// on a case field.
class EmptyFieldValue {
  EmptyFieldValue();

  factory EmptyFieldValue.fromJson(Map<String, dynamic> _) {
    return EmptyFieldValue();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents an SLA configuration.
class SlaConfiguration {
  /// Name of an SLA.
  final String name;

  /// Status of an SLA.
  final SlaStatus status;

  /// Target time by which an SLA should be completed.
  final DateTime targetTime;

  /// Type of SLA.
  final SlaType type;

  /// Time at which an SLA was completed.
  final DateTime? completionTime;

  /// Unique identifier of a field.
  final String? fieldId;

  /// Represents a list of target field values for the fieldId specified in
  /// SlaConfiguration.
  final List<FieldValueUnion>? targetFieldValues;

  SlaConfiguration({
    required this.name,
    required this.status,
    required this.targetTime,
    required this.type,
    this.completionTime,
    this.fieldId,
    this.targetFieldValues,
  });

  factory SlaConfiguration.fromJson(Map<String, dynamic> json) {
    return SlaConfiguration(
      name: (json['name'] as String?) ?? '',
      status: SlaStatus.fromString((json['status'] as String?) ?? ''),
      targetTime: nonNullableTimeStampFromJson(json['targetTime'] ?? 0),
      type: SlaType.fromString((json['type'] as String?) ?? ''),
      completionTime: timeStampFromJson(json['completionTime']),
      fieldId: json['fieldId'] as String?,
      targetFieldValues: (json['targetFieldValues'] as List?)
          ?.nonNulls
          .map((e) => FieldValueUnion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final targetTime = this.targetTime;
    final type = this.type;
    final completionTime = this.completionTime;
    final fieldId = this.fieldId;
    final targetFieldValues = this.targetFieldValues;
    return {
      'name': name,
      'status': status.value,
      'targetTime': iso8601ToJson(targetTime),
      'type': type.value,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (fieldId != null) 'fieldId': fieldId,
      if (targetFieldValues != null) 'targetFieldValues': targetFieldValues,
    };
  }
}

class SlaType {
  static const caseField = SlaType._('CaseField');

  final String value;

  const SlaType._(this.value);

  static const values = [caseField];

  static SlaType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SlaType._(value));

  @override
  bool operator ==(other) => other is SlaType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SlaStatus {
  static const active = SlaStatus._('Active');
  static const overdue = SlaStatus._('Overdue');
  static const met = SlaStatus._('Met');
  static const notMet = SlaStatus._('NotMet');

  final String value;

  const SlaStatus._(this.value);

  static const values = [active, overdue, met, notMet];

  static SlaStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SlaStatus._(value));

  @override
  bool operator ==(other) => other is SlaStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class CommentBodyTextType {
  static const textPlain = CommentBodyTextType._('Text/Plain');

  final String value;

  const CommentBodyTextType._(this.value);

  static const values = [textPlain];

  static CommentBodyTextType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CommentBodyTextType._(value));

  @override
  bool operator ==(other) =>
      other is CommentBodyTextType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The order in which all returned related items should be sorted.
class SearchAllRelatedItemsSort {
  /// Whether related items should be sorted by association time or case ID.
  final Order sortOrder;

  /// Whether related items should be sorted in ascending or descending order.
  final SearchAllRelatedItemsSortProperty sortProperty;

  SearchAllRelatedItemsSort({
    required this.sortOrder,
    required this.sortProperty,
  });

  Map<String, dynamic> toJson() {
    final sortOrder = this.sortOrder;
    final sortProperty = this.sortProperty;
    return {
      'sortOrder': sortOrder.value,
      'sortProperty': sortProperty.value,
    };
  }
}

class SearchAllRelatedItemsSortProperty {
  static const associationTime =
      SearchAllRelatedItemsSortProperty._('AssociationTime');
  static const caseId = SearchAllRelatedItemsSortProperty._('CaseId');

  final String value;

  const SearchAllRelatedItemsSortProperty._(this.value);

  static const values = [associationTime, caseId];

  static SearchAllRelatedItemsSortProperty fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchAllRelatedItemsSortProperty._(value));

  @override
  bool operator ==(other) =>
      other is SearchAllRelatedItemsSortProperty && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Order {
  static const asc = Order._('Asc');
  static const desc = Order._('Desc');

  final String value;

  const Order._(this.value);

  static const values = [asc, desc];

  static Order fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Order._(value));

  @override
  bool operator ==(other) => other is Order && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The list of types of related items and their parameters to use for
/// filtering.
class RelatedItemTypeFilter {
  /// A filter for related items of type <code>Comment</code>.
  final CommentFilter? comment;

  /// Represents the Amazon Connect case to be created as a related item.
  final ConnectCaseFilter? connectCase;

  /// A filter for related items of type <code>Contact</code>.
  final ContactFilter? contact;

  /// Represents the content of a <code>Custom</code> type related item.
  final CustomFilter? custom;

  /// A filter for related items of this type of <code>File</code>.
  final FileFilter? file;

  /// Filter for related items of type <code>SLA</code>.
  final SlaFilter? sla;

  RelatedItemTypeFilter({
    this.comment,
    this.connectCase,
    this.contact,
    this.custom,
    this.file,
    this.sla,
  });

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final connectCase = this.connectCase;
    final contact = this.contact;
    final custom = this.custom;
    final file = this.file;
    final sla = this.sla;
    return {
      if (comment != null) 'comment': comment,
      if (connectCase != null) 'connectCase': connectCase,
      if (contact != null) 'contact': contact,
      if (custom != null) 'custom': custom,
      if (file != null) 'file': file,
      if (sla != null) 'sla': sla,
    };
  }
}

/// A filter for related items of type <code>Contact</code>.
class ContactFilter {
  /// A list of channels to filter on for related items of type
  /// <code>Contact</code>.
  final List<String>? channel;

  /// A unique identifier of a contact in Amazon Connect.
  final String? contactArn;

  ContactFilter({
    this.channel,
    this.contactArn,
  });

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final contactArn = this.contactArn;
    return {
      if (channel != null) 'channel': channel,
      if (contactArn != null) 'contactArn': contactArn,
    };
  }
}

/// A filter for related items of type <code>Comment</code>.
class CommentFilter {
  CommentFilter();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A filter for related items of type <code>File</code>.
class FileFilter {
  /// The Amazon Resource Name (ARN) of the file.
  final String? fileArn;

  FileFilter({
    this.fileArn,
  });

  Map<String, dynamic> toJson() {
    final fileArn = this.fileArn;
    return {
      if (fileArn != null) 'fileArn': fileArn,
    };
  }
}

/// A filter for related items of type <code>SLA</code>.
class SlaFilter {
  /// Name of an SLA.
  final String? name;

  /// Status of an SLA.
  final SlaStatus? status;

  SlaFilter({
    this.name,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    return {
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// A filter for related items of type <code>ConnectCase</code>.
class ConnectCaseFilter {
  /// A unique identifier of the case.
  final String? caseId;

  ConnectCaseFilter({
    this.caseId,
  });

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    return {
      if (caseId != null) 'caseId': caseId,
    };
  }
}

/// A filter for related items of type <code>Custom</code>.
class CustomFilter {
  /// Filter conditions for custom fields.
  final CustomFieldsFilter? fields;

  CustomFilter({
    this.fields,
  });

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    return {
      if (fields != null) 'fields': fields,
    };
  }
}

/// A filter for fields in <code>Custom</code> type related items. Only one
/// value can be provided.
class CustomFieldsFilter {
  /// Provides "and all" filtering.
  final List<CustomFieldsFilter>? andAll;
  final FieldFilter? field;

  /// Excludes items matching the filter.
  final CustomFieldsFilter? not;

  /// Provides "or all" filtering.
  final List<CustomFieldsFilter>? orAll;

  CustomFieldsFilter({
    this.andAll,
    this.field,
    this.not,
    this.orAll,
  });

  Map<String, dynamic> toJson() {
    final andAll = this.andAll;
    final field = this.field;
    final not = this.not;
    final orAll = this.orAll;
    return {
      if (andAll != null) 'andAll': andAll,
      if (field != null) 'field': field,
      if (not != null) 'not': not,
      if (orAll != null) 'orAll': orAll,
    };
  }
}

/// A filter for fields. Only one value can be provided.
class FieldFilter {
  /// Object containing field identifier and value information.
  final FieldValue? contains;

  /// Object containing field identifier and value information.
  final FieldValue? equalTo;

  /// Object containing field identifier and value information.
  final FieldValue? greaterThan;

  /// Object containing field identifier and value information.
  final FieldValue? greaterThanOrEqualTo;

  /// Object containing field identifier and value information.
  final FieldValue? lessThan;

  /// Object containing field identifier and value information.
  final FieldValue? lessThanOrEqualTo;

  FieldFilter({
    this.contains,
    this.equalTo,
    this.greaterThan,
    this.greaterThanOrEqualTo,
    this.lessThan,
    this.lessThanOrEqualTo,
  });

  Map<String, dynamic> toJson() {
    final contains = this.contains;
    final equalTo = this.equalTo;
    final greaterThan = this.greaterThan;
    final greaterThanOrEqualTo = this.greaterThanOrEqualTo;
    final lessThan = this.lessThan;
    final lessThanOrEqualTo = this.lessThanOrEqualTo;
    return {
      if (contains != null) 'contains': contains,
      if (equalTo != null) 'equalTo': equalTo,
      if (greaterThan != null) 'greaterThan': greaterThan,
      if (greaterThanOrEqualTo != null)
        'greaterThanOrEqualTo': greaterThanOrEqualTo,
      if (lessThan != null) 'lessThan': lessThan,
      if (lessThanOrEqualTo != null) 'lessThanOrEqualTo': lessThanOrEqualTo,
    };
  }
}

/// Configuration to enable EventBridge case event delivery and determine what
/// data is delivered.
class EventBridgeConfiguration {
  /// Indicates whether the to broadcast case event data to the customer.
  final bool enabled;

  /// Details of what case and related item data is published through the case
  /// event stream.
  final EventIncludedData? includedData;

  EventBridgeConfiguration({
    required this.enabled,
    this.includedData,
  });

  factory EventBridgeConfiguration.fromJson(Map<String, dynamic> json) {
    return EventBridgeConfiguration(
      enabled: (json['enabled'] as bool?) ?? false,
      includedData: json['includedData'] != null
          ? EventIncludedData.fromJson(
              json['includedData'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final includedData = this.includedData;
    return {
      'enabled': enabled,
      if (includedData != null) 'includedData': includedData,
    };
  }
}

/// Details of what case and related item data is published through the case
/// event stream.
class EventIncludedData {
  /// Details of what case data is published through the case event stream.
  final CaseEventIncludedData? caseData;

  /// Details of what related item data is published through the case event
  /// stream.
  final RelatedItemEventIncludedData? relatedItemData;

  EventIncludedData({
    this.caseData,
    this.relatedItemData,
  });

  factory EventIncludedData.fromJson(Map<String, dynamic> json) {
    return EventIncludedData(
      caseData: json['caseData'] != null
          ? CaseEventIncludedData.fromJson(
              json['caseData'] as Map<String, dynamic>)
          : null,
      relatedItemData: json['relatedItemData'] != null
          ? RelatedItemEventIncludedData.fromJson(
              json['relatedItemData'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final caseData = this.caseData;
    final relatedItemData = this.relatedItemData;
    return {
      if (caseData != null) 'caseData': caseData,
      if (relatedItemData != null) 'relatedItemData': relatedItemData,
    };
  }
}

/// Details of what case data is published through the case event stream.
class CaseEventIncludedData {
  /// List of field identifiers.
  final List<FieldIdentifier> fields;

  CaseEventIncludedData({
    required this.fields,
  });

  factory CaseEventIncludedData.fromJson(Map<String, dynamic> json) {
    return CaseEventIncludedData(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => FieldIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    return {
      'fields': fields,
    };
  }
}

/// Details of what related item data is published through the case event
/// stream.
class RelatedItemEventIncludedData {
  /// Details of what related item data is published through the case event
  /// stream.
  final bool includeContent;

  RelatedItemEventIncludedData({
    required this.includeContent,
  });

  factory RelatedItemEventIncludedData.fromJson(Map<String, dynamic> json) {
    return RelatedItemEventIncludedData(
      includeContent: (json['includeContent'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final includeContent = this.includeContent;
    return {
      'includeContent': includeContent,
    };
  }
}

/// Object for the summarized details of the domain.
class DomainSummary {
  /// The Amazon Resource Name (ARN) of the domain.
  final String domainArn;

  /// The unique identifier of the domain.
  final String domainId;

  /// The name of the domain.
  final String name;

  DomainSummary({
    required this.domainArn,
    required this.domainId,
    required this.name,
  });

  factory DomainSummary.fromJson(Map<String, dynamic> json) {
    return DomainSummary(
      domainArn: (json['domainArn'] as String?) ?? '',
      domainId: (json['domainId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final domainArn = this.domainArn;
    final domainId = this.domainId;
    final name = this.name;
    return {
      'domainArn': domainArn,
      'domainId': domainId,
      'name': name,
    };
  }
}

class DomainStatus {
  static const active = DomainStatus._('Active');
  static const creationInProgress = DomainStatus._('CreationInProgress');
  static const creationFailed = DomainStatus._('CreationFailed');

  final String value;

  const DomainStatus._(this.value);

  static const values = [active, creationInProgress, creationFailed];

  static DomainStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DomainStatus._(value));

  @override
  bool operator ==(other) => other is DomainStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Error for batch describe case rules API failure. In the Amazon Connect admin
/// website, case rules are known as <i>case field conditions</i>. For more
/// information about case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class CaseRuleError {
  /// Error code from getting a case rule.
  final String errorCode;

  /// The case rule identifier that caused the error.
  final String id;

  /// Error message from getting a case rule.
  final String? message;

  CaseRuleError({
    required this.errorCode,
    required this.id,
    this.message,
  });

  factory CaseRuleError.fromJson(Map<String, dynamic> json) {
    return CaseRuleError(
      errorCode: (json['errorCode'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final id = this.id;
    final message = this.message;
    return {
      'errorCode': errorCode,
      'id': id,
      if (message != null) 'message': message,
    };
  }
}

/// Detailed case rule information. In the Amazon Connect admin website, case
/// rules are known as <i>case field conditions</i>. For more information about
/// case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class GetCaseRuleResponse {
  /// The Amazon Resource Name (ARN) of the case rule.
  final String caseRuleArn;

  /// Unique identifier of a case rule.
  final String caseRuleId;

  /// Name of the case rule.
  final String name;

  /// Represents what rule type should take place, under what conditions.
  final CaseRuleDetails rule;

  /// Timestamp when the resource was created.
  final DateTime? createdTime;

  /// Indicates whether the resource has been deleted.
  final bool? deleted;

  /// Description of a case rule.
  final String? description;

  /// Timestamp when the resource was created or last modified.
  final DateTime? lastModifiedTime;

  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetCaseRuleResponse({
    required this.caseRuleArn,
    required this.caseRuleId,
    required this.name,
    required this.rule,
    this.createdTime,
    this.deleted,
    this.description,
    this.lastModifiedTime,
    this.tags,
  });

  factory GetCaseRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetCaseRuleResponse(
      caseRuleArn: (json['caseRuleArn'] as String?) ?? '',
      caseRuleId: (json['caseRuleId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      rule: CaseRuleDetails.fromJson(
          (json['rule'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
      createdTime: timeStampFromJson(json['createdTime']),
      deleted: json['deleted'] as bool?,
      description: json['description'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final caseRuleArn = this.caseRuleArn;
    final caseRuleId = this.caseRuleId;
    final name = this.name;
    final rule = this.rule;
    final createdTime = this.createdTime;
    final deleted = this.deleted;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final tags = this.tags;
    return {
      'caseRuleArn': caseRuleArn,
      'caseRuleId': caseRuleId,
      'name': name,
      'rule': rule,
      if (createdTime != null) 'createdTime': iso8601ToJson(createdTime),
      if (deleted != null) 'deleted': deleted,
      if (description != null) 'description': description,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents what rule type should take place, under what conditions. In the
/// Amazon Connect admin website, case rules are known as <i>case field
/// conditions</i>. For more information about case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class CaseRuleDetails {
  /// Which options are available in a child field based on the selected value in
  /// a parent field.
  final FieldOptionsCaseRule? fieldOptions;

  /// Whether a field is visible, based on values in other fields.
  final HiddenCaseRule? hidden;

  /// Required rule type, used to indicate whether a field is required.
  final RequiredCaseRule? required;

  CaseRuleDetails({
    this.fieldOptions,
    this.hidden,
    this.required,
  });

  factory CaseRuleDetails.fromJson(Map<String, dynamic> json) {
    return CaseRuleDetails(
      fieldOptions: json['fieldOptions'] != null
          ? FieldOptionsCaseRule.fromJson(
              json['fieldOptions'] as Map<String, dynamic>)
          : null,
      hidden: json['hidden'] != null
          ? HiddenCaseRule.fromJson(json['hidden'] as Map<String, dynamic>)
          : null,
      required: json['required'] != null
          ? RequiredCaseRule.fromJson(json['required'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldOptions = this.fieldOptions;
    final hidden = this.hidden;
    final required = this.required;
    return {
      if (fieldOptions != null) 'fieldOptions': fieldOptions,
      if (hidden != null) 'hidden': hidden,
      if (required != null) 'required': required,
    };
  }
}

/// Required rule type, used to indicate whether a field is required. In the
/// Amazon Connect admin website, case rules are known as <i>case field
/// conditions</i>. For more information about case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class RequiredCaseRule {
  /// List of conditions for the required rule; the first condition to evaluate to
  /// true dictates the value of the rule.
  final List<BooleanCondition> conditions;

  /// The value of the rule (that is, whether the field is required) should none
  /// of the conditions evaluate to true.
  final bool defaultValue;

  RequiredCaseRule({
    required this.conditions,
    required this.defaultValue,
  });

  factory RequiredCaseRule.fromJson(Map<String, dynamic> json) {
    return RequiredCaseRule(
      conditions: ((json['conditions'] as List?) ?? const [])
          .nonNulls
          .map((e) => BooleanCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultValue: (json['defaultValue'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final conditions = this.conditions;
    final defaultValue = this.defaultValue;
    return {
      'conditions': conditions,
      'defaultValue': defaultValue,
    };
  }
}

/// Rules that control which options are available in a child field based on the
/// selected value in a parent field.
class FieldOptionsCaseRule {
  /// A mapping between a parent field option value and child field option values.
  final List<ParentChildFieldOptionsMapping> parentChildFieldOptionsMappings;

  /// The identifier of the child field whose options are controlled.
  final String? childFieldId;

  /// The identifier of the parent field that controls options.
  final String? parentFieldId;

  FieldOptionsCaseRule({
    required this.parentChildFieldOptionsMappings,
    this.childFieldId,
    this.parentFieldId,
  });

  factory FieldOptionsCaseRule.fromJson(Map<String, dynamic> json) {
    return FieldOptionsCaseRule(
      parentChildFieldOptionsMappings:
          ((json['parentChildFieldOptionsMappings'] as List?) ?? const [])
              .nonNulls
              .map((e) => ParentChildFieldOptionsMapping.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      childFieldId: json['childFieldId'] as String?,
      parentFieldId: json['parentFieldId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parentChildFieldOptionsMappings =
        this.parentChildFieldOptionsMappings;
    final childFieldId = this.childFieldId;
    final parentFieldId = this.parentFieldId;
    return {
      'parentChildFieldOptionsMappings': parentChildFieldOptionsMappings,
      if (childFieldId != null) 'childFieldId': childFieldId,
      if (parentFieldId != null) 'parentFieldId': parentFieldId,
    };
  }
}

/// A rule that controls field visibility based on conditions. Fields can be
/// shown or hidden dynamically based on values in other fields.
class HiddenCaseRule {
  /// A list of conditions that determine field visibility.
  final List<BooleanCondition> conditions;

  /// Whether the field is hidden when no conditions match.
  final bool defaultValue;

  HiddenCaseRule({
    required this.conditions,
    required this.defaultValue,
  });

  factory HiddenCaseRule.fromJson(Map<String, dynamic> json) {
    return HiddenCaseRule(
      conditions: ((json['conditions'] as List?) ?? const [])
          .nonNulls
          .map((e) => BooleanCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultValue: (json['defaultValue'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final conditions = this.conditions;
    final defaultValue = this.defaultValue;
    return {
      'conditions': conditions,
      'defaultValue': defaultValue,
    };
  }
}

/// Boolean condition for a rule. In the Amazon Connect admin website, case
/// rules are known as <i>case field conditions</i>. For more information about
/// case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class BooleanCondition {
  /// Combines multiple conditions with AND operator. All conditions must be true
  /// for the compound condition to be true.
  final CompoundCondition? andAll;

  /// Tests that operandOne is equal to operandTwo.
  final BooleanOperands? equalTo;

  /// Tests that operandOne is not equal to operandTwo.
  final BooleanOperands? notEqualTo;

  /// Combines multiple conditions with OR operator. At least one condition must
  /// be true for the compound condition to be true.
  final CompoundCondition? orAll;

  BooleanCondition({
    this.andAll,
    this.equalTo,
    this.notEqualTo,
    this.orAll,
  });

  factory BooleanCondition.fromJson(Map<String, dynamic> json) {
    return BooleanCondition(
      andAll: json['andAll'] != null
          ? CompoundCondition.fromJson(json['andAll'] as Map<String, dynamic>)
          : null,
      equalTo: json['equalTo'] != null
          ? BooleanOperands.fromJson(json['equalTo'] as Map<String, dynamic>)
          : null,
      notEqualTo: json['notEqualTo'] != null
          ? BooleanOperands.fromJson(json['notEqualTo'] as Map<String, dynamic>)
          : null,
      orAll: json['orAll'] != null
          ? CompoundCondition.fromJson(json['orAll'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final andAll = this.andAll;
    final equalTo = this.equalTo;
    final notEqualTo = this.notEqualTo;
    final orAll = this.orAll;
    return {
      if (andAll != null) 'andAll': andAll,
      if (equalTo != null) 'equalTo': equalTo,
      if (notEqualTo != null) 'notEqualTo': notEqualTo,
      if (orAll != null) 'orAll': orAll,
    };
  }
}

/// Boolean operands for a condition. In the Amazon Connect admin website, case
/// rules are known as <i>case field conditions</i>. For more information about
/// case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class BooleanOperands {
  /// Represents the left hand operand in the condition.
  final OperandOne operandOne;

  /// Represents the right hand operand in the condition.
  final OperandTwo operandTwo;

  /// The value of the outer rule if the condition evaluates to true.
  final bool result;

  BooleanOperands({
    required this.operandOne,
    required this.operandTwo,
    required this.result,
  });

  factory BooleanOperands.fromJson(Map<String, dynamic> json) {
    return BooleanOperands(
      operandOne: OperandOne.fromJson(
          (json['operandOne'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operandTwo: OperandTwo.fromJson(
          (json['operandTwo'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      result: (json['result'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final operandOne = this.operandOne;
    final operandTwo = this.operandTwo;
    final result = this.result;
    return {
      'operandOne': operandOne,
      'operandTwo': operandTwo,
      'result': result,
    };
  }
}

/// A compound condition that combines multiple boolean conditions using logical
/// operators. In the Amazon Connect admin website, case rules are known as
/// <i>case field conditions</i>. For more information about case field
/// conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class CompoundCondition {
  /// The list of conditions to combine using the logical operator.
  /// <note>
  /// For API users: A case rule can have a maximum of 5 conditions, spread across
  /// a maximum of 2 levels of nesting.
  /// </note>
  final List<BooleanCondition> conditions;

  CompoundCondition({
    required this.conditions,
  });

  factory CompoundCondition.fromJson(Map<String, dynamic> json) {
    return CompoundCondition(
      conditions: ((json['conditions'] as List?) ?? const [])
          .nonNulls
          .map((e) => BooleanCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final conditions = this.conditions;
    return {
      'conditions': conditions,
    };
  }
}

/// Represents the left hand operand in the condition. In the Amazon Connect
/// admin website, case rules are known as <i>case field conditions</i>. For
/// more information about case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class OperandOne {
  /// The field ID that this operand should take the value of.
  final String? fieldId;

  OperandOne({
    this.fieldId,
  });

  factory OperandOne.fromJson(Map<String, dynamic> json) {
    return OperandOne(
      fieldId: json['fieldId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldId = this.fieldId;
    return {
      if (fieldId != null) 'fieldId': fieldId,
    };
  }
}

/// Represents the right hand operand in the condition. In the Amazon Connect
/// admin website, case rules are known as <i>case field conditions</i>. For
/// more information about case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class OperandTwo {
  /// Boolean value type.
  final bool? booleanValue;

  /// Double value type.
  final double? doubleValue;

  /// Empty value type.
  final EmptyOperandValue? emptyValue;

  /// String value type.
  final String? stringValue;

  OperandTwo({
    this.booleanValue,
    this.doubleValue,
    this.emptyValue,
    this.stringValue,
  });

  factory OperandTwo.fromJson(Map<String, dynamic> json) {
    return OperandTwo(
      booleanValue: json['booleanValue'] as bool?,
      doubleValue: json['doubleValue'] as double?,
      emptyValue: json['emptyValue'] != null
          ? EmptyOperandValue.fromJson(
              json['emptyValue'] as Map<String, dynamic>)
          : null,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final emptyValue = this.emptyValue;
    final stringValue = this.stringValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (emptyValue != null) 'emptyValue': emptyValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// Represents an empty operand value. In the Amazon Connect admin website, case
/// rules are known as <i>case field conditions</i>. For more information about
/// case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class EmptyOperandValue {
  EmptyOperandValue();

  factory EmptyOperandValue.fromJson(Map<String, dynamic> _) {
    return EmptyOperandValue();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A mapping between a parent field option value and child field option values.
class ParentChildFieldOptionsMapping {
  /// A list of allowed values in the child field.
  final List<String> childFieldOptionValues;

  /// The value in the parent field.
  final String parentFieldOptionValue;

  ParentChildFieldOptionsMapping({
    required this.childFieldOptionValues,
    required this.parentFieldOptionValue,
  });

  factory ParentChildFieldOptionsMapping.fromJson(Map<String, dynamic> json) {
    return ParentChildFieldOptionsMapping(
      childFieldOptionValues:
          ((json['childFieldOptionValues'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      parentFieldOptionValue: (json['parentFieldOptionValue'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final childFieldOptionValues = this.childFieldOptionValues;
    final parentFieldOptionValue = this.parentFieldOptionValue;
    return {
      'childFieldOptionValues': childFieldOptionValues,
      'parentFieldOptionValue': parentFieldOptionValue,
    };
  }
}

/// Object containing case rule identifier information.
class CaseRuleIdentifier {
  /// Unique identifier of a case rule.
  final String id;

  CaseRuleIdentifier({
    required this.id,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Summary information of this case rule. In the Amazon Connect admin website,
/// case rules are known as <i>case field conditions</i>. For more information
/// about case field conditions, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-field-conditions.html">Add
/// case field conditions to a case template</a>.
class CaseRuleSummary {
  /// The Amazon Resource Name (ARN) of the case rule.
  final String caseRuleArn;

  /// Unique identifier of a case rule.
  final String caseRuleId;

  /// Name of the case rule.
  final String name;

  /// Possible types for a rule.
  final RuleType ruleType;

  /// Description of a case rule.
  final String? description;

  CaseRuleSummary({
    required this.caseRuleArn,
    required this.caseRuleId,
    required this.name,
    required this.ruleType,
    this.description,
  });

  factory CaseRuleSummary.fromJson(Map<String, dynamic> json) {
    return CaseRuleSummary(
      caseRuleArn: (json['caseRuleArn'] as String?) ?? '',
      caseRuleId: (json['caseRuleId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      ruleType: RuleType.fromString((json['ruleType'] as String?) ?? ''),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final caseRuleArn = this.caseRuleArn;
    final caseRuleId = this.caseRuleId;
    final name = this.name;
    final ruleType = this.ruleType;
    final description = this.description;
    return {
      'caseRuleArn': caseRuleArn,
      'caseRuleId': caseRuleId,
      'name': name,
      'ruleType': ruleType.value,
      if (description != null) 'description': description,
    };
  }
}

class RuleType {
  static const required = RuleType._('Required');
  static const hidden = RuleType._('Hidden');
  static const fieldOptions = RuleType._('FieldOptions');

  final String value;

  const RuleType._(this.value);

  static const values = [required, hidden, fieldOptions];

  static RuleType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RuleType._(value));

  @override
  bool operator ==(other) => other is RuleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A list of items that represent RelatedItems.
class SearchRelatedItemsResponseItem {
  /// Time at which a related item was associated with a case.
  final DateTime associationTime;

  /// Represents the content of a particular type of related item.
  final RelatedItemContent content;

  /// Unique identifier of a related item.
  final String relatedItemId;

  /// Type of a related item.
  final RelatedItemType type;

  /// Represents the creator of the related item.
  final UserUnion? performedBy;

  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  SearchRelatedItemsResponseItem({
    required this.associationTime,
    required this.content,
    required this.relatedItemId,
    required this.type,
    this.performedBy,
    this.tags,
  });

  factory SearchRelatedItemsResponseItem.fromJson(Map<String, dynamic> json) {
    return SearchRelatedItemsResponseItem(
      associationTime:
          nonNullableTimeStampFromJson(json['associationTime'] ?? 0),
      content: RelatedItemContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      relatedItemId: (json['relatedItemId'] as String?) ?? '',
      type: RelatedItemType.fromString((json['type'] as String?) ?? ''),
      performedBy: json['performedBy'] != null
          ? UserUnion.fromJson(json['performedBy'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final associationTime = this.associationTime;
    final content = this.content;
    final relatedItemId = this.relatedItemId;
    final type = this.type;
    final performedBy = this.performedBy;
    final tags = this.tags;
    return {
      'associationTime': iso8601ToJson(associationTime),
      'content': content,
      'relatedItemId': relatedItemId,
      'type': type.value,
      if (performedBy != null) 'performedBy': performedBy,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents the content of a related item to be updated. This is a union type
/// that can contain either comment content or custom content.
class RelatedItemUpdateContent {
  final CommentUpdateContent? comment;
  final CustomUpdateContent? custom;

  RelatedItemUpdateContent({
    this.comment,
    this.custom,
  });

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final custom = this.custom;
    return {
      if (comment != null) 'comment': comment,
      if (custom != null) 'custom': custom,
    };
  }
}

/// Represents the updated content of a <code>Comment</code> related item.
class CommentUpdateContent {
  /// Updated text in the body of a <code>Comment</code> on a case.
  final String body;

  /// Type of the text in the box of a <code>Comment</code> on a case.
  final CommentBodyTextType contentType;

  CommentUpdateContent({
    required this.body,
    required this.contentType,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentType = this.contentType;
    return {
      'body': body,
      'contentType': contentType.value,
    };
  }
}

/// Represents the updated content of a <code>Custom</code> related item.
class CustomUpdateContent {
  /// List of updated field values for the <code>Custom</code> related item. All
  /// existing and new fields, and their associated values should be included.
  /// Fields not included as part of this request will be removed.
  final List<FieldValue> fields;

  CustomUpdateContent({
    required this.fields,
  });

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    return {
      'fields': fields,
    };
  }
}

/// Represents the content of a related item to be created.
class RelatedItemInputContent {
  /// Represents the content of a comment to be returned to agents.
  final CommentContent? comment;

  /// Represents the Amazon Connect case to be created as a related item.
  final ConnectCaseInputContent? connectCase;

  /// Object representing a contact in Amazon Connect as an API request field.
  final Contact? contact;

  /// Represents the content of a <code>Custom</code> type related item.
  final CustomInputContent? custom;

  /// A file of related items.
  final FileContent? file;

  /// Represents the content of an SLA to be created.
  final SlaInputContent? sla;

  RelatedItemInputContent({
    this.comment,
    this.connectCase,
    this.contact,
    this.custom,
    this.file,
    this.sla,
  });

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final connectCase = this.connectCase;
    final contact = this.contact;
    final custom = this.custom;
    final file = this.file;
    final sla = this.sla;
    return {
      if (comment != null) 'comment': comment,
      if (connectCase != null) 'connectCase': connectCase,
      if (contact != null) 'contact': contact,
      if (custom != null) 'custom': custom,
      if (file != null) 'file': file,
      if (sla != null) 'sla': sla,
    };
  }
}

/// An object that represents an Amazon Connect contact object.
class Contact {
  /// A unique identifier of a contact in Amazon Connect.
  final String contactArn;

  Contact({
    required this.contactArn,
  });

  Map<String, dynamic> toJson() {
    final contactArn = this.contactArn;
    return {
      'contactArn': contactArn,
    };
  }
}

/// Represents the content of an SLA.
class SlaInputContent {
  /// Represents an input SLA configuration.
  final SlaInputConfiguration? slaInputConfiguration;

  SlaInputContent({
    this.slaInputConfiguration,
  });

  Map<String, dynamic> toJson() {
    final slaInputConfiguration = this.slaInputConfiguration;
    return {
      if (slaInputConfiguration != null)
        'slaInputConfiguration': slaInputConfiguration,
    };
  }
}

/// Represents the content of a <code>ConnectCase</code> related item.
class ConnectCaseInputContent {
  /// A unique identifier of the case.
  final String caseId;

  ConnectCaseInputContent({
    required this.caseId,
  });

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    return {
      'caseId': caseId,
    };
  }
}

/// Represents the content of a <code>Custom</code> related item.
class CustomInputContent {
  /// List of field values for the <code>Custom</code> related item.
  final List<FieldValue> fields;

  CustomInputContent({
    required this.fields,
  });

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    return {
      'fields': fields,
    };
  }
}

/// Represents the input configuration of an SLA being created.
class SlaInputConfiguration {
  /// Name of an SLA.
  final String name;

  /// Target duration in minutes within which an SLA should be completed.
  final int targetSlaMinutes;

  /// Type of SLA.
  final SlaType type;

  /// Unique identifier of a field.
  final String? fieldId;

  /// Represents a list of target field values for the fieldId specified in
  /// SlaInputConfiguration. The SLA is considered met if any one of these target
  /// field values matches the actual field value.
  final List<FieldValueUnion>? targetFieldValues;

  SlaInputConfiguration({
    required this.name,
    required this.targetSlaMinutes,
    required this.type,
    this.fieldId,
    this.targetFieldValues,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final targetSlaMinutes = this.targetSlaMinutes;
    final type = this.type;
    final fieldId = this.fieldId;
    final targetFieldValues = this.targetFieldValues;
    return {
      'name': name,
      'targetSlaMinutes': targetSlaMinutes,
      'type': type.value,
      if (fieldId != null) 'fieldId': fieldId,
      if (targetFieldValues != null) 'targetFieldValues': targetFieldValues,
    };
  }
}

/// A list of items that represent cases.
class SearchCasesResponseItem {
  /// A unique identifier of the case.
  final String caseId;

  /// List of case field values.
  final List<FieldValue> fields;

  /// A unique identifier of a template.
  final String templateId;

  /// A map of of key-value pairs that represent tags on a resource. Tags are used
  /// to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  SearchCasesResponseItem({
    required this.caseId,
    required this.fields,
    required this.templateId,
    this.tags,
  });

  factory SearchCasesResponseItem.fromJson(Map<String, dynamic> json) {
    return SearchCasesResponseItem(
      caseId: (json['caseId'] as String?) ?? '',
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => FieldValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      templateId: (json['templateId'] as String?) ?? '',
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    final fields = this.fields;
    final templateId = this.templateId;
    final tags = this.tags;
    return {
      'caseId': caseId,
      'fields': fields,
      'templateId': templateId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A filter for cases. Only one value can be provided.
class CaseFilter {
  /// Provides "and all" filtering.
  final List<CaseFilter>? andAll;

  /// A list of fields to filter on.
  final FieldFilter? field;
  final CaseFilter? not;

  /// Provides "or all" filtering.
  final List<CaseFilter>? orAll;

  /// A list of tags to filter on.
  final TagFilter? tag;

  CaseFilter({
    this.andAll,
    this.field,
    this.not,
    this.orAll,
    this.tag,
  });

  Map<String, dynamic> toJson() {
    final andAll = this.andAll;
    final field = this.field;
    final not = this.not;
    final orAll = this.orAll;
    final tag = this.tag;
    return {
      if (andAll != null) 'andAll': andAll,
      if (field != null) 'field': field,
      if (not != null) 'not': not,
      if (orAll != null) 'orAll': orAll,
      if (tag != null) 'tag': tag,
    };
  }
}

/// A structured set of sort terms.
class Sort {
  /// Unique identifier of a field.
  final String fieldId;

  /// A structured set of sort terms
  final Order sortOrder;

  Sort({
    required this.fieldId,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final fieldId = this.fieldId;
    final sortOrder = this.sortOrder;
    return {
      'fieldId': fieldId,
      'sortOrder': sortOrder.value,
    };
  }
}

/// A filter for tags. Only one value can be provided.
class TagFilter {
  /// Object containing tag key and value information.
  final TagValue? equalTo;

  TagFilter({
    this.equalTo,
  });

  Map<String, dynamic> toJson() {
    final equalTo = this.equalTo;
    return {
      if (equalTo != null) 'equalTo': equalTo,
    };
  }
}

/// Object for case tag filter values.
class TagValue {
  /// The tag key in the tag filter value.
  final String? key;

  /// The tag value in the tag filter value.
  final String? value;

  TagValue({
    this.key,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// Case summary information.
class CaseSummary {
  /// A unique identifier of the case.
  final String caseId;

  /// A unique identifier of a template.
  final String templateId;

  CaseSummary({
    required this.caseId,
    required this.templateId,
  });

  factory CaseSummary.fromJson(Map<String, dynamic> json) {
    return CaseSummary(
      caseId: (json['caseId'] as String?) ?? '',
      templateId: (json['templateId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    final templateId = this.templateId;
    return {
      'caseId': caseId,
      'templateId': templateId,
    };
  }
}

/// Represents the content of a particular audit event.
class AuditEvent {
  /// Unique identifier of a case audit history event.
  final String eventId;

  /// A list of Case Audit History event fields.
  final List<AuditEventField> fields;

  /// Time at which an Audit History event took place.
  final DateTime performedTime;

  /// The type of audit history event.
  ///
  /// Valid Values: <code>Case.Created</code> | <code>Case.Updated</code> |
  /// <code>RelatedItem.Created</code> | <code>RelatedItem.Updated</code> |
  /// <code>RelatedItem.Deleted</code>
  final AuditEventType type;

  /// Information of the user which performed the audit.
  final AuditEventPerformedBy? performedBy;

  /// The Type of the related item.
  final RelatedItemType? relatedItemType;

  AuditEvent({
    required this.eventId,
    required this.fields,
    required this.performedTime,
    required this.type,
    this.performedBy,
    this.relatedItemType,
  });

  factory AuditEvent.fromJson(Map<String, dynamic> json) {
    return AuditEvent(
      eventId: (json['eventId'] as String?) ?? '',
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => AuditEventField.fromJson(e as Map<String, dynamic>))
          .toList(),
      performedTime: nonNullableTimeStampFromJson(json['performedTime'] ?? 0),
      type: AuditEventType.fromString((json['type'] as String?) ?? ''),
      performedBy: json['performedBy'] != null
          ? AuditEventPerformedBy.fromJson(
              json['performedBy'] as Map<String, dynamic>)
          : null,
      relatedItemType:
          (json['relatedItemType'] as String?)?.let(RelatedItemType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final fields = this.fields;
    final performedTime = this.performedTime;
    final type = this.type;
    final performedBy = this.performedBy;
    final relatedItemType = this.relatedItemType;
    return {
      'eventId': eventId,
      'fields': fields,
      'performedTime': iso8601ToJson(performedTime),
      'type': type.value,
      if (performedBy != null) 'performedBy': performedBy,
      if (relatedItemType != null) 'relatedItemType': relatedItemType.value,
    };
  }
}

class AuditEventType {
  static const caseCreated = AuditEventType._('Case.Created');
  static const caseUpdated = AuditEventType._('Case.Updated');
  static const relatedItemCreated = AuditEventType._('RelatedItem.Created');
  static const relatedItemDeleted = AuditEventType._('RelatedItem.Deleted');
  static const relatedItemUpdated = AuditEventType._('RelatedItem.Updated');

  final String value;

  const AuditEventType._(this.value);

  static const values = [
    caseCreated,
    caseUpdated,
    relatedItemCreated,
    relatedItemDeleted,
    relatedItemUpdated
  ];

  static AuditEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AuditEventType._(value));

  @override
  bool operator ==(other) => other is AuditEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information of the user which performed the audit.
class AuditEventPerformedBy {
  /// Unique identifier of an IAM role.
  final String iamPrincipalArn;
  final UserUnion? user;

  AuditEventPerformedBy({
    required this.iamPrincipalArn,
    this.user,
  });

  factory AuditEventPerformedBy.fromJson(Map<String, dynamic> json) {
    return AuditEventPerformedBy(
      iamPrincipalArn: (json['iamPrincipalArn'] as String?) ?? '',
      user: json['user'] != null
          ? UserUnion.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iamPrincipalArn = this.iamPrincipalArn;
    final user = this.user;
    return {
      'iamPrincipalArn': iamPrincipalArn,
      if (user != null) 'user': user,
    };
  }
}

/// Fields for audit event.
class AuditEventField {
  /// Unique identifier of field in an Audit History entry.
  final String eventFieldId;

  /// Union of potential field value types.
  final AuditEventFieldValueUnion newValue;

  /// Union of potential field value types.
  final AuditEventFieldValueUnion? oldValue;

  AuditEventField({
    required this.eventFieldId,
    required this.newValue,
    this.oldValue,
  });

  factory AuditEventField.fromJson(Map<String, dynamic> json) {
    return AuditEventField(
      eventFieldId: (json['eventFieldId'] as String?) ?? '',
      newValue: AuditEventFieldValueUnion.fromJson(
          (json['newValue'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      oldValue: json['oldValue'] != null
          ? AuditEventFieldValueUnion.fromJson(
              json['oldValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventFieldId = this.eventFieldId;
    final newValue = this.newValue;
    final oldValue = this.oldValue;
    return {
      'eventFieldId': eventFieldId,
      'newValue': newValue,
      if (oldValue != null) 'oldValue': oldValue,
    };
  }
}

/// Object to store union of Field values.
class AuditEventFieldValueUnion {
  /// Can be either null, or have a Boolean value type. Only one value can be
  /// provided.
  final bool? booleanValue;

  /// Can be either null, or have a Double value type. Only one value can be
  /// provided.
  final double? doubleValue;
  final EmptyFieldValue? emptyValue;

  /// Can be either null, or have a String value type. Only one value can be
  /// provided.
  final String? stringValue;

  /// Can be either null, or have a String value type formatted as an ARN. Only
  /// one value can be provided.
  final String? userArnValue;

  AuditEventFieldValueUnion({
    this.booleanValue,
    this.doubleValue,
    this.emptyValue,
    this.stringValue,
    this.userArnValue,
  });

  factory AuditEventFieldValueUnion.fromJson(Map<String, dynamic> json) {
    return AuditEventFieldValueUnion(
      booleanValue: json['booleanValue'] as bool?,
      doubleValue: json['doubleValue'] as double?,
      emptyValue: json['emptyValue'] != null
          ? EmptyFieldValue.fromJson(json['emptyValue'] as Map<String, dynamic>)
          : null,
      stringValue: json['stringValue'] as String?,
      userArnValue: json['userArnValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final emptyValue = this.emptyValue;
    final stringValue = this.stringValue;
    final userArnValue = this.userArnValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (emptyValue != null) 'emptyValue': emptyValue,
      if (stringValue != null) 'stringValue': stringValue,
      if (userArnValue != null) 'userArnValue': userArnValue,
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
