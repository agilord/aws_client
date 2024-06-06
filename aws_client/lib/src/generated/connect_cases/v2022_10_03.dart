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
            signingName: 'cases',
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

  /// Returns the description for the list of fields in the request parameters.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Creates and updates a set of field options for a single select field in a
  /// Cases domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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

  /// <note>
  /// If you provide a value for <code>PerformedBy.UserArn</code> you must also
  /// have <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribeUser.html">connect:DescribeUser</a>
  /// permission on the User ARN resource that you provide
  /// </note> <pre><code> &lt;p&gt;Creates a case in the specified Cases domain.
  /// Case system and custom fields are taken as an array id/value pairs with a
  /// declared data types.&lt;/p&gt; &lt;p&gt;The following fields are required
  /// when creating a case:&lt;/p&gt; &lt;ul&gt; &lt;li&gt; &lt;p&gt;
  /// &lt;code&gt;customer_id&lt;/code&gt; - You must provide the full customer
  /// profile ARN in this format:
  /// &lt;code&gt;arn:aws:profile:your_AWS_Region:your_AWS_account
  /// ID:domains/your_profiles_domain_name/profiles/profile_ID&lt;/code&gt;
  /// &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; &lt;code&gt;title&lt;/code&gt;
  /// &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  Future<CreateCaseResponse> createCase({
    required String domainId,
    required List<FieldValue> fields,
    required String templateId,
    String? clientToken,
    UserUnion? performedBy,
  }) async {
    final $payload = <String, dynamic>{
      'fields': fields,
      'templateId': templateId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (performedBy != null) 'performedBy': performedBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/cases',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCaseResponse.fromJson(response);
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
  /// <pre><code> &lt;/important&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Creates a field in the Cases domain. This field is used to define the case
  /// object model (that is, defines what data can be captured on cases) in a
  /// Cases domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
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
  /// Parameter [description] :
  /// The description of the field.
  Future<CreateFieldResponse> createField({
    required String domainId,
    required String name,
    required FieldType type,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'type': type.toValue(),
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Creates a related item (comments, tasks, and contacts) and associates it
  /// with a case.
  /// <note>
  /// <ul>
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
  /// </ul> <pre><code> &lt;/note&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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
      'type': type.toValue(),
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

  /// Creates a template in the Cases domain. This template is used to define
  /// the case object model (that is, to define what data can be captured on
  /// cases) in a Cases domain. A template must have a unique name within a
  /// domain, and it must reference existing field IDs and layout IDs.
  /// Additionally, multiple fields with same IDs are not allowed within the
  /// same Template. A template can be either Active or Inactive, as indicated
  /// by its status. Inactive templates cannot be used to create cases.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
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
  /// Parameter [status] :
  /// The status of the template.
  Future<CreateTemplateResponse> createTemplate({
    required String domainId,
    required String name,
    String? description,
    LayoutConfiguration? layoutConfiguration,
    List<RequiredField>? requiredFields,
    TemplateStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (description != null) 'description': description,
      if (layoutConfiguration != null)
        'layoutConfiguration': layoutConfiguration,
      if (requiredFields != null) 'requiredFields': requiredFields,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/templates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTemplateResponse.fromJson(response);
  }

  /// Deletes a Cases domain.
  /// <pre><code> &lt;note&gt; &lt;p&gt;After deleting your domain you must
  /// disassociate the deleted domain from your Amazon Connect instance with
  /// another API call before being able to use Cases again with this Amazon
  /// Connect instance. See &lt;a
  /// href=&quot;https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteIntegrationAssociation.html&quot;&gt;DeleteIntegrationAssociation&lt;/a&gt;.&lt;/p&gt;
  /// &lt;/note&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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

  /// Deletes a field from a cases template. You can delete up to 100 fields per
  /// domain.
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
  /// <code>ValidationException</code> denoting which field IDs in the request
  /// have been deleted.
  /// </li>
  /// <li>
  /// Calling <code>GetCase</code> with a deleted field ID returns the deleted
  /// field's value if one exists.
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Deletes a layout from a cases template. You can delete up to 100 layouts
  /// per domain.
  /// <pre><code> &lt;p&gt;After a layout is deleted:&lt;/p&gt; &lt;ul&gt;
  /// &lt;li&gt; &lt;p&gt;You can still retrieve the layout by calling
  /// &lt;code&gt;GetLayout&lt;/code&gt;.&lt;/p&gt; &lt;/li&gt; &lt;li&gt;
  /// &lt;p&gt;You cannot update a deleted layout by calling
  /// &lt;code&gt;UpdateLayout&lt;/code&gt;; it throws a
  /// &lt;code&gt;ValidationException&lt;/code&gt;.&lt;/p&gt; &lt;/li&gt;
  /// &lt;li&gt; &lt;p&gt;Deleted layouts are not included in the
  /// &lt;code&gt;ListLayouts&lt;/code&gt; response.&lt;/p&gt; &lt;/li&gt;
  /// &lt;/ul&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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

  /// Deletes a cases template. You can delete up to 100 templates per domain.
  /// <pre><code> &lt;p&gt;After a cases template is deleted:&lt;/p&gt;
  /// &lt;ul&gt; &lt;li&gt; &lt;p&gt;You can still retrieve the template by
  /// calling &lt;code&gt;GetTemplate&lt;/code&gt;.&lt;/p&gt; &lt;/li&gt;
  /// &lt;li&gt; &lt;p&gt;You cannot update the template. &lt;/p&gt; &lt;/li&gt;
  /// &lt;li&gt; &lt;p&gt;You cannot create a case by using the deleted
  /// template.&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;Deleted templates are
  /// not included in the &lt;code&gt;ListTemplates&lt;/code&gt;
  /// response.&lt;/p&gt; &lt;/li&gt; &lt;/ul&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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

  /// Returns information about a specific case if it exists.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Returns the audit history about a specific case if it exists.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [caseId] :
  /// A unique identifier of the case.
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of audit events to return. The current maximum
  /// supported value is 25. This is also the default when no other value is
  /// provided.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
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

  /// Returns the case event publishing configuration.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Returns information about a specific domain if it exists.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Returns the details for the requested layout.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Returns the details for the requested template.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Lists cases for a given contact.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
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

  /// Lists all cases domains in the Amazon Web Services account. Each list item
  /// is a condensed summary object of the domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
      10,
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

  /// Lists all of the field options for a field identifier in the domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Lists all fields in a Cases domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Lists all layouts in the given cases domain. Each list item is a condensed
  /// summary object of the layout.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Lists tags for a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Lists all of the templates in a Cases domain. Each list item is a
  /// condensed summary object of the template.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
      if (status != null) 'status': status.map((e) => e.toValue()).toList(),
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

  /// Adds case event publishing configuration. For a complete list of fields
  /// you can add to the event message, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/case-fields.html">Create
  /// case fields</a> in the <i>Amazon Connect Administrator Guide</i>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Searches for cases within their associated Cases domain. Search results
  /// are returned as a paginated list of abridged case documents.
  /// <note>
  /// For <code>customer_id</code> you must provide the full customer profile
  /// ARN in this format: <code> arn:aws:profile:your AWS Region:your AWS
  /// account ID:domains/profiles domain name/profiles/profile ID</code>.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
  /// The maximum number of cases to return. The current maximum supported value
  /// is 25. This is also the default value when no other value is provided.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
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

  /// Searches for related items that are associated with a case.
  /// <note>
  /// If no filters are provided, this returns all related items associated with
  /// a case.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
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

  /// Adds tags to a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
  /// </note> <pre><code> &lt;p&gt;Updates the values of fields on a case.
  /// Fields to be updated are received as an array of id/value pairs identical
  /// to the &lt;code&gt;CreateCase&lt;/code&gt; input .&lt;/p&gt; &lt;p&gt;If
  /// the action is successful, the service sends back an HTTP 200 response with
  /// an empty HTTP body.&lt;/p&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Updates the properties of an existing field.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the Cases domain.
  ///
  /// Parameter [fieldId] :
  /// The unique identifier of a field.
  ///
  /// Parameter [description] :
  /// The description of a field.
  ///
  /// Parameter [name] :
  /// The name of the field.
  Future<void> updateField({
    required String domainId,
    required String fieldId,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Updates the attributes of an existing template. The template attributes
  /// that can be modified include <code>name</code>, <code>description</code>,
  /// <code>layoutConfiguration</code>, <code>requiredFields</code>, and
  /// <code>status</code>. At least one of these attributes must not be null. If
  /// a null value is provided for a given attribute, that attribute is ignored
  /// and its current value is preserved.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// Parameter [status] :
  /// The status of the template.
  Future<void> updateTemplate({
    required String domainId,
    required String templateId,
    String? description,
    LayoutConfiguration? layoutConfiguration,
    String? name,
    List<RequiredField>? requiredFields,
    TemplateStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (layoutConfiguration != null)
        'layoutConfiguration': layoutConfiguration,
      if (name != null) 'name': name,
      if (requiredFields != null) 'requiredFields': requiredFields,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/templates/${Uri.encodeComponent(templateId)}',
      exceptionFnMap: _exceptionFns,
    );
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

  /// The Type of an audit history event.
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
      eventId: json['eventId'] as String,
      fields: (json['fields'] as List)
          .whereNotNull()
          .map((e) => AuditEventField.fromJson(e as Map<String, dynamic>))
          .toList(),
      performedTime:
          nonNullableTimeStampFromJson(json['performedTime'] as Object),
      type: (json['type'] as String).toAuditEventType(),
      performedBy: json['performedBy'] != null
          ? AuditEventPerformedBy.fromJson(
              json['performedBy'] as Map<String, dynamic>)
          : null,
      relatedItemType:
          (json['relatedItemType'] as String?)?.toRelatedItemType(),
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
      'type': type.toValue(),
      if (performedBy != null) 'performedBy': performedBy,
      if (relatedItemType != null) 'relatedItemType': relatedItemType.toValue(),
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
      eventFieldId: json['eventFieldId'] as String,
      newValue: AuditEventFieldValueUnion.fromJson(
          json['newValue'] as Map<String, dynamic>),
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
      iamPrincipalArn: json['iamPrincipalArn'] as String,
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

enum AuditEventType {
  caseCreated,
  caseUpdated,
  relatedItemCreated,
}

extension AuditEventTypeValueExtension on AuditEventType {
  String toValue() {
    switch (this) {
      case AuditEventType.caseCreated:
        return 'Case.Created';
      case AuditEventType.caseUpdated:
        return 'Case.Updated';
      case AuditEventType.relatedItemCreated:
        return 'RelatedItem.Created';
    }
  }
}

extension AuditEventTypeFromString on String {
  AuditEventType toAuditEventType() {
    switch (this) {
      case 'Case.Created':
        return AuditEventType.caseCreated;
      case 'Case.Updated':
        return AuditEventType.caseUpdated;
      case 'RelatedItem.Created':
        return AuditEventType.relatedItemCreated;
    }
    throw Exception('$this is not known in enum AuditEventType');
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
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => FieldError.fromJson(e as Map<String, dynamic>))
          .toList(),
      fields: (json['fields'] as List)
          .whereNotNull()
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

class BatchPutFieldOptionsResponse {
  /// A list of field errors.
  final List<FieldOptionError>? errors;

  BatchPutFieldOptionsResponse({
    this.errors,
  });

  factory BatchPutFieldOptionsResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutFieldOptionsResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
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

/// Details of what case data is published through the case event stream.
class CaseEventIncludedData {
  /// List of field identifiers.
  final List<FieldIdentifier> fields;

  CaseEventIncludedData({
    required this.fields,
  });

  factory CaseEventIncludedData.fromJson(Map<String, dynamic> json) {
    return CaseEventIncludedData(
      fields: (json['fields'] as List)
          .whereNotNull()
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

/// A filter for cases. Only one value can be provided.
class CaseFilter {
  /// Provides "and all" filtering.
  final List<CaseFilter>? andAll;

  /// A list of fields to filter on.
  final FieldFilter? field;
  final CaseFilter? not;

  /// Provides "or all" filtering.
  final List<CaseFilter>? orAll;

  CaseFilter({
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
      caseId: json['caseId'] as String,
      templateId: json['templateId'] as String,
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

enum CommentBodyTextType {
  textPlain,
}

extension CommentBodyTextTypeValueExtension on CommentBodyTextType {
  String toValue() {
    switch (this) {
      case CommentBodyTextType.textPlain:
        return 'Text/Plain';
    }
  }
}

extension CommentBodyTextTypeFromString on String {
  CommentBodyTextType toCommentBodyTextType() {
    switch (this) {
      case 'Text/Plain':
        return CommentBodyTextType.textPlain;
    }
    throw Exception('$this is not known in enum CommentBodyTextType');
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
      body: json['body'] as String,
      contentType: (json['contentType'] as String).toCommentBodyTextType(),
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentType = this.contentType;
    return {
      'body': body,
      'contentType': contentType.toValue(),
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
      channel: json['channel'] as String,
      connectedToSystemTime:
          nonNullableTimeStampFromJson(json['connectedToSystemTime'] as Object),
      contactArn: json['contactArn'] as String,
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
      caseArn: json['caseArn'] as String,
      caseId: json['caseId'] as String,
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
      domainArn: json['domainArn'] as String,
      domainId: json['domainId'] as String,
      domainStatus: (json['domainStatus'] as String).toDomainStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainArn = this.domainArn;
    final domainId = this.domainId;
    final domainStatus = this.domainStatus;
    return {
      'domainArn': domainArn,
      'domainId': domainId,
      'domainStatus': domainStatus.toValue(),
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
      fieldArn: json['fieldArn'] as String,
      fieldId: json['fieldId'] as String,
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
      layoutArn: json['layoutArn'] as String,
      layoutId: json['layoutId'] as String,
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
      relatedItemArn: json['relatedItemArn'] as String,
      relatedItemId: json['relatedItemId'] as String,
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
      templateArn: json['templateArn'] as String,
      templateId: json['templateId'] as String,
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

class DeleteDomainResponse {
  DeleteDomainResponse();

  factory DeleteDomainResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDomainResponse();
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

class DeleteLayoutResponse {
  DeleteLayoutResponse();

  factory DeleteLayoutResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLayoutResponse();
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

enum DomainStatus {
  active,
  creationInProgress,
  creationFailed,
}

extension DomainStatusValueExtension on DomainStatus {
  String toValue() {
    switch (this) {
      case DomainStatus.active:
        return 'Active';
      case DomainStatus.creationInProgress:
        return 'CreationInProgress';
      case DomainStatus.creationFailed:
        return 'CreationFailed';
    }
  }
}

extension DomainStatusFromString on String {
  DomainStatus toDomainStatus() {
    switch (this) {
      case 'Active':
        return DomainStatus.active;
      case 'CreationInProgress':
        return DomainStatus.creationInProgress;
      case 'CreationFailed':
        return DomainStatus.creationFailed;
    }
    throw Exception('$this is not known in enum DomainStatus');
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
      domainArn: json['domainArn'] as String,
      domainId: json['domainId'] as String,
      name: json['name'] as String,
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
      enabled: json['enabled'] as bool,
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
      errorCode: json['errorCode'] as String,
      id: json['id'] as String,
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
      fields: (json['fields'] as List)
          .whereNotNull()
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

/// Object for unique identifier of a field.
class FieldIdentifier {
  /// Unique identifier of a field.
  final String id;

  FieldIdentifier({
    required this.id,
  });

  factory FieldIdentifier.fromJson(Map<String, dynamic> json) {
    return FieldIdentifier(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
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
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

enum FieldNamespace {
  system,
  custom,
}

extension FieldNamespaceValueExtension on FieldNamespace {
  String toValue() {
    switch (this) {
      case FieldNamespace.system:
        return 'System';
      case FieldNamespace.custom:
        return 'Custom';
    }
  }
}

extension FieldNamespaceFromString on String {
  FieldNamespace toFieldNamespace() {
    switch (this) {
      case 'System':
        return FieldNamespace.system;
      case 'Custom':
        return FieldNamespace.custom;
    }
    throw Exception('$this is not known in enum FieldNamespace');
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
      active: json['active'] as bool,
      name: json['name'] as String,
      value: json['value'] as String,
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
      errorCode: json['errorCode'] as String,
      message: json['message'] as String,
      value: json['value'] as String,
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

  FieldSummary({
    required this.fieldArn,
    required this.fieldId,
    required this.name,
    required this.namespace,
    required this.type,
  });

  factory FieldSummary.fromJson(Map<String, dynamic> json) {
    return FieldSummary(
      fieldArn: json['fieldArn'] as String,
      fieldId: json['fieldId'] as String,
      name: json['name'] as String,
      namespace: (json['namespace'] as String).toFieldNamespace(),
      type: (json['type'] as String).toFieldType(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldArn = this.fieldArn;
    final fieldId = this.fieldId;
    final name = this.name;
    final namespace = this.namespace;
    final type = this.type;
    return {
      'fieldArn': fieldArn,
      'fieldId': fieldId,
      'name': name,
      'namespace': namespace.toValue(),
      'type': type.toValue(),
    };
  }
}

enum FieldType {
  text,
  number,
  boolean,
  dateTime,
  singleSelect,
  url,
  user,
}

extension FieldTypeValueExtension on FieldType {
  String toValue() {
    switch (this) {
      case FieldType.text:
        return 'Text';
      case FieldType.number:
        return 'Number';
      case FieldType.boolean:
        return 'Boolean';
      case FieldType.dateTime:
        return 'DateTime';
      case FieldType.singleSelect:
        return 'SingleSelect';
      case FieldType.url:
        return 'Url';
      case FieldType.user:
        return 'User';
    }
  }
}

extension FieldTypeFromString on String {
  FieldType toFieldType() {
    switch (this) {
      case 'Text':
        return FieldType.text;
      case 'Number':
        return FieldType.number;
      case 'Boolean':
        return FieldType.boolean;
      case 'DateTime':
        return FieldType.dateTime;
      case 'SingleSelect':
        return FieldType.singleSelect;
      case 'Url':
        return FieldType.url;
      case 'User':
        return FieldType.user;
    }
    throw Exception('$this is not known in enum FieldType');
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
      id: json['id'] as String,
      value: FieldValueUnion.fromJson(json['value'] as Map<String, dynamic>),
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
/// The <code>Summary</code> system field accepts 1500 characters while all
/// other fields accept 500 characters.
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

/// An object that represents a content of an Amazon Connect file object.
class FileContent {
  /// The Amazon Resource Name (ARN) of a File in Amazon Connect.
  final String fileArn;

  FileContent({
    required this.fileArn,
  });

  factory FileContent.fromJson(Map<String, dynamic> json) {
    return FileContent(
      fileArn: json['fileArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fileArn = this.fileArn;
    return {
      'fileArn': fileArn,
    };
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
      auditEvents: (json['auditEvents'] as List)
          .whereNotNull()
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
          json['eventBridge'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final eventBridge = this.eventBridge;
    return {
      'eventBridge': eventBridge,
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
      fields: (json['fields'] as List)
          .whereNotNull()
          .map((e) => FieldValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      templateId: json['templateId'] as String,
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
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      domainArn: json['domainArn'] as String,
      domainId: json['domainId'] as String,
      domainStatus: (json['domainStatus'] as String).toDomainStatus(),
      name: json['name'] as String,
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
      'domainStatus': domainStatus.toValue(),
      'name': name,
      if (tags != null) 'tags': tags,
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
    this.createdTime,
    this.deleted,
    this.description,
    this.lastModifiedTime,
    this.tags,
  });

  factory GetFieldResponse.fromJson(Map<String, dynamic> json) {
    return GetFieldResponse(
      fieldArn: json['fieldArn'] as String,
      fieldId: json['fieldId'] as String,
      name: json['name'] as String,
      namespace: (json['namespace'] as String).toFieldNamespace(),
      type: (json['type'] as String).toFieldType(),
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
    final createdTime = this.createdTime;
    final deleted = this.deleted;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final tags = this.tags;
    return {
      'fieldArn': fieldArn,
      'fieldId': fieldId,
      'name': name,
      'namespace': namespace.toValue(),
      'type': type.toValue(),
      if (createdTime != null) 'createdTime': iso8601ToJson(createdTime),
      if (deleted != null) 'deleted': deleted,
      if (description != null) 'description': description,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (tags != null) 'tags': tags,
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
      content: LayoutContent.fromJson(json['content'] as Map<String, dynamic>),
      layoutArn: json['layoutArn'] as String,
      layoutId: json['layoutId'] as String,
      name: json['name'] as String,
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
    this.tags,
  });

  factory GetTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetTemplateResponse(
      name: json['name'] as String,
      status: (json['status'] as String).toTemplateStatus(),
      templateArn: json['templateArn'] as String,
      templateId: json['templateId'] as String,
      createdTime: timeStampFromJson(json['createdTime']),
      deleted: json['deleted'] as bool?,
      description: json['description'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      layoutConfiguration: json['layoutConfiguration'] != null
          ? LayoutConfiguration.fromJson(
              json['layoutConfiguration'] as Map<String, dynamic>)
          : null,
      requiredFields: (json['requiredFields'] as List?)
          ?.whereNotNull()
          .map((e) => RequiredField.fromJson(e as Map<String, dynamic>))
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
    final tags = this.tags;
    return {
      'name': name,
      'status': status.toValue(),
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
      if (tags != null) 'tags': tags,
    };
  }
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
          ?.whereNotNull()
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
      layoutArn: json['layoutArn'] as String,
      layoutId: json['layoutId'] as String,
      name: json['name'] as String,
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
      cases: (json['cases'] as List)
          .whereNotNull()
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
      domains: (json['domains'] as List)
          .whereNotNull()
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
      options: (json['options'] as List)
          .whereNotNull()
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
      fields: (json['fields'] as List)
          .whereNotNull()
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
      layouts: (json['layouts'] as List)
          .whereNotNull()
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
      templates: (json['templates'] as List)
          .whereNotNull()
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

enum Order {
  asc,
  desc,
}

extension OrderValueExtension on Order {
  String toValue() {
    switch (this) {
      case Order.asc:
        return 'Asc';
      case Order.desc:
        return 'Desc';
    }
  }
}

extension OrderFromString on String {
  Order toOrder() {
    switch (this) {
      case 'Asc':
        return Order.asc;
      case 'Desc':
        return Order.desc;
    }
    throw Exception('$this is not known in enum Order');
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

/// Represents the content of a particular type of related item.
class RelatedItemContent {
  /// Represents the content of a comment to be returned to agents.
  final CommentContent? comment;

  /// Represents the content of a contact to be returned to agents.
  final ContactContent? contact;

  /// Represents the content of a File to be returned to agents.
  final FileContent? file;

  RelatedItemContent({
    this.comment,
    this.contact,
    this.file,
  });

  factory RelatedItemContent.fromJson(Map<String, dynamic> json) {
    return RelatedItemContent(
      comment: json['comment'] != null
          ? CommentContent.fromJson(json['comment'] as Map<String, dynamic>)
          : null,
      contact: json['contact'] != null
          ? ContactContent.fromJson(json['contact'] as Map<String, dynamic>)
          : null,
      file: json['file'] != null
          ? FileContent.fromJson(json['file'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final contact = this.contact;
    final file = this.file;
    return {
      if (comment != null) 'comment': comment,
      if (contact != null) 'contact': contact,
      if (file != null) 'file': file,
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
      includeContent: json['includeContent'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final includeContent = this.includeContent;
    return {
      'includeContent': includeContent,
    };
  }
}

/// Represents the content of a related item to be created.
class RelatedItemInputContent {
  /// Represents the content of a comment to be returned to agents.
  final CommentContent? comment;

  /// Object representing a contact in Amazon Connect as an API request field.
  final Contact? contact;

  /// A file of related items.
  final FileContent? file;

  RelatedItemInputContent({
    this.comment,
    this.contact,
    this.file,
  });

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final contact = this.contact;
    final file = this.file;
    return {
      if (comment != null) 'comment': comment,
      if (contact != null) 'contact': contact,
      if (file != null) 'file': file,
    };
  }
}

enum RelatedItemType {
  contact,
  comment,
  file,
}

extension RelatedItemTypeValueExtension on RelatedItemType {
  String toValue() {
    switch (this) {
      case RelatedItemType.contact:
        return 'Contact';
      case RelatedItemType.comment:
        return 'Comment';
      case RelatedItemType.file:
        return 'File';
    }
  }
}

extension RelatedItemTypeFromString on String {
  RelatedItemType toRelatedItemType() {
    switch (this) {
      case 'Contact':
        return RelatedItemType.contact;
      case 'Comment':
        return RelatedItemType.comment;
      case 'File':
        return RelatedItemType.file;
    }
    throw Exception('$this is not known in enum RelatedItemType');
  }
}

/// The list of types of related items and their parameters to use for
/// filtering.
class RelatedItemTypeFilter {
  /// A filter for related items of type <code>Comment</code>.
  final CommentFilter? comment;

  /// A filter for related items of type <code>Contact</code>.
  final ContactFilter? contact;

  /// A filter for related items of this type of <code>File</code>.
  final FileFilter? file;

  RelatedItemTypeFilter({
    this.comment,
    this.contact,
    this.file,
  });

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final contact = this.contact;
    final file = this.file;
    return {
      if (comment != null) 'comment': comment,
      if (contact != null) 'contact': contact,
      if (file != null) 'file': file,
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
      fieldId: json['fieldId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldId = this.fieldId;
    return {
      'fieldId': fieldId,
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

  SearchCasesResponse({
    required this.cases,
    this.nextToken,
  });

  factory SearchCasesResponse.fromJson(Map<String, dynamic> json) {
    return SearchCasesResponse(
      cases: (json['cases'] as List)
          .whereNotNull()
          .map((e) =>
              SearchCasesResponseItem.fromJson(e as Map<String, dynamic>))
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
      caseId: json['caseId'] as String,
      fields: (json['fields'] as List)
          .whereNotNull()
          .map((e) => FieldValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      templateId: json['templateId'] as String,
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
      relatedItems: (json['relatedItems'] as List)
          .whereNotNull()
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
          nonNullableTimeStampFromJson(json['associationTime'] as Object),
      content:
          RelatedItemContent.fromJson(json['content'] as Map<String, dynamic>),
      relatedItemId: json['relatedItemId'] as String,
      type: (json['type'] as String).toRelatedItemType(),
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
      'type': type.toValue(),
      if (performedBy != null) 'performedBy': performedBy,
      if (tags != null) 'tags': tags,
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
      'sortOrder': sortOrder.toValue(),
    };
  }
}

enum TemplateStatus {
  active,
  inactive,
}

extension TemplateStatusValueExtension on TemplateStatus {
  String toValue() {
    switch (this) {
      case TemplateStatus.active:
        return 'Active';
      case TemplateStatus.inactive:
        return 'Inactive';
    }
  }
}

extension TemplateStatusFromString on String {
  TemplateStatus toTemplateStatus() {
    switch (this) {
      case 'Active':
        return TemplateStatus.active;
      case 'Inactive':
        return TemplateStatus.inactive;
    }
    throw Exception('$this is not known in enum TemplateStatus');
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

  TemplateSummary({
    required this.name,
    required this.status,
    required this.templateArn,
    required this.templateId,
  });

  factory TemplateSummary.fromJson(Map<String, dynamic> json) {
    return TemplateSummary(
      name: json['name'] as String,
      status: (json['status'] as String).toTemplateStatus(),
      templateArn: json['templateArn'] as String,
      templateId: json['templateId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final templateArn = this.templateArn;
    final templateId = this.templateId;
    return {
      'name': name,
      'status': status.toValue(),
      'templateArn': templateArn,
      'templateId': templateId,
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

class UpdateFieldResponse {
  UpdateFieldResponse();

  factory UpdateFieldResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFieldResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UpdateTemplateResponse {
  UpdateTemplateResponse();

  factory UpdateTemplateResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the identity of the person who performed the action.
class UserUnion {
  /// Represents the Amazon Connect ARN of the user.
  final String? userArn;

  UserUnion({
    this.userArn,
  });

  factory UserUnion.fromJson(Map<String, dynamic> json) {
    return UserUnion(
      userArn: json['userArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userArn = this.userArn;
    return {
      if (userArn != null) 'userArn': userArn,
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
