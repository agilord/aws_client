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

/// <i>Amazon Web Services End User Messaging Social</i>, also referred to as
/// Social messaging, is a messaging service that enables application developers
/// to incorporate WhatsApp into their existing workflows. The <i>Amazon Web
/// Services End User Messaging Social API</i> provides information about the
/// <i>Amazon Web Services End User Messaging Social API</i> resources,
/// including supported HTTP methods, parameters, and schemas.
///
/// The <i>Amazon Web Services End User Messaging Social API</i> provides
/// programmatic access to options that are unique to the WhatsApp Business
/// Platform.
///
/// If you're new to the <i>Amazon Web Services End User Messaging Social
/// API</i>, it's also helpful to review <a
/// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/what-is-service.html">What
/// is Amazon Web Services End User Messaging Social</a> in the <i>Amazon Web
/// Services End User Messaging Social User Guide</i>. The <i>Amazon Web
/// Services End User Messaging Social User Guide</i> provides tutorials, code
/// samples, and procedures that demonstrate how to use <i>Amazon Web Services
/// End User Messaging Social API</i> features programmatically and how to
/// integrate functionality into applications. The guide also provides key
/// information, such as integration with other Amazon Web Services services,
/// and the quotas that apply to use of the service.
///
/// <b>Regional availability</b>
///
/// The <i>Amazon Web Services End User Messaging Social API</i> is available
/// across several Amazon Web Services Regions and it provides a dedicated
/// endpoint for each of these Regions. For a list of all the Regions and
/// endpoints where the API is currently available, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#pinpoint_region">Amazon
/// Web Services Service Endpoints</a> and <a
/// href="https://docs.aws.amazon.com/general/latest/gr/end-user-messaging.html">Amazon
/// Web Services End User Messaging endpoints and quotas</a> in the Amazon Web
/// Services General Reference. To learn more about Amazon Web Services Regions,
/// see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html">Managing
/// Amazon Web Services Regions</a> in the Amazon Web Services General
/// Reference.
///
/// In each Region, Amazon Web Services maintains multiple Availability Zones.
/// These Availability Zones are physically isolated from each other, but are
/// united by private, low-latency, high-throughput, and highly redundant
/// network connections. These Availability Zones enable us to provide very high
/// levels of availability and redundancy, while also minimizing latency. To
/// learn more about the number of Availability Zones that are available in each
/// Region, see <a
/// href="https://aws.amazon.com/about-aws/global-infrastructure/">Amazon Web
/// Services Global Infrastructure.</a>
class SocialMessaging {
  final _s.RestJsonProtocol _protocol;
  SocialMessaging({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'social-messaging',
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

  /// List all tags associated with a resource, such as a phone number or WABA.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to retrieve the tags from.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Adds or overwrites only the specified tags for the specified resource.
  /// When you specify an existing tag key, the value is overwritten with the
  /// new value.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to tag.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource.
  Future<TagResourceOutput> tagResource({
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
      requestUri: '/v1/tags/tag-resource',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceOutput.fromJson(response);
  }

  /// Removes the specified tags from a resource.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the resource.
  Future<UntagResourceOutput> untagResource({
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
      requestUri: '/v1/tags/untag-resource',
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceOutput.fromJson(response);
  }

  /// This is only used through the Amazon Web Services console during sign-up
  /// to associate your WhatsApp Business Account to your Amazon Web Services
  /// account.
  ///
  /// May throw [DependencyException].
  /// May throw [InvalidParametersException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [setupFinalization] :
  /// A JSON object that contains the phone numbers and WhatsApp Business
  /// Account to link to your account.
  ///
  /// Parameter [signupCallback] :
  /// Contains the callback access token.
  Future<AssociateWhatsAppBusinessAccountOutput>
      associateWhatsAppBusinessAccount({
    WhatsAppSetupFinalization? setupFinalization,
    WhatsAppSignupCallback? signupCallback,
  }) async {
    final $payload = <String, dynamic>{
      if (setupFinalization != null) 'setupFinalization': setupFinalization,
      if (signupCallback != null) 'signupCallback': signupCallback,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/signup',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateWhatsAppBusinessAccountOutput.fromJson(response);
  }

  /// Get the details of your linked WhatsApp Business Account.
  ///
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The unique identifier, from Amazon Web Services, of the linked WhatsApp
  /// Business Account. WABA identifiers are formatted as
  /// <code>waba-01234567890123456789012345678901</code>. Use <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_ListLinkedWhatsAppBusinessAccounts.html">ListLinkedWhatsAppBusinessAccounts</a>
  /// to list all WABAs and their details.
  Future<GetLinkedWhatsAppBusinessAccountOutput>
      getLinkedWhatsAppBusinessAccount({
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'id': [id],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/whatsapp/waba/details',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLinkedWhatsAppBusinessAccountOutput.fromJson(response);
  }

  /// Disassociate a WhatsApp Business Account (WABA) from your Amazon Web
  /// Services account.
  ///
  /// May throw [DependencyException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The unique identifier of your WhatsApp Business Account. WABA identifiers
  /// are formatted as <code>waba-01234567890123456789012345678901</code>. Use
  /// <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_ListLinkedWhatsAppBusinessAccounts.html">ListLinkedWhatsAppBusinessAccounts</a>
  /// to list all WABAs and their details.
  Future<void> disassociateWhatsAppBusinessAccount({
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'id': [id],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/whatsapp/waba/disassociate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List all WhatsApp Business Accounts linked to your Amazon Web Services
  /// account.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The next token for pagination.
  Future<ListLinkedWhatsAppBusinessAccountsOutput>
      listLinkedWhatsAppBusinessAccounts({
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
      method: 'GET',
      requestUri: '/v1/whatsapp/waba/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLinkedWhatsAppBusinessAccountsOutput.fromJson(response);
  }

  /// Creates a new WhatsApp Flow. Flows enable businesses to create rich,
  /// interactive forms and experiences that users can complete without leaving
  /// WhatsApp. The Flow is created in DRAFT status. If <code>publish</code> is
  /// set to <code>true</code> and a valid <code>flowJson</code> is provided,
  /// the Flow is published immediately.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [categories] :
  /// The categories that classify the business purpose of the Flow. At least
  /// one category is required.
  ///
  /// Parameter [flowName] :
  /// The name of the Flow. Must be unique within the WhatsApp Business Account.
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account to associate with this Flow.
  ///
  /// Parameter [cloneFlowId] :
  /// The ID of an existing Flow within the same WhatsApp Business Account to
  /// clone.
  ///
  /// Parameter [flowJson] :
  /// The Flow JSON definition that describes the screens, components, and logic
  /// of the Flow. Maximum size is 10 MB.
  ///
  /// Parameter [publish] :
  /// Set to <code>true</code> to publish the Flow immediately after creation.
  /// Requires a valid <code>flowJson</code> that passes Meta's validation.
  Future<CreateWhatsAppFlowOutput> createWhatsAppFlow({
    required List<MetaFlowCategory> categories,
    required String flowName,
    required String id,
    String? cloneFlowId,
    Uint8List? flowJson,
    bool? publish,
  }) async {
    final $payload = <String, dynamic>{
      'categories': categories.map((e) => e.value).toList(),
      'flowName': flowName,
      'id': id,
      if (cloneFlowId != null) 'cloneFlowId': cloneFlowId,
      if (flowJson != null) 'flowJson': base64Encode(flowJson),
      if (publish != null) 'publish': publish,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/flow/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWhatsAppFlowOutput.fromJson(response);
  }

  /// Creates a new WhatsApp message template from a custom definition.
  /// <note>
  /// Amazon Web Services End User Messaging Social does not store any WhatsApp
  /// message template content.
  /// </note>
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account to associate with this template.
  ///
  /// Parameter [templateDefinition] :
  /// The complete template definition as a JSON blob.
  Future<CreateWhatsAppMessageTemplateOutput> createWhatsAppMessageTemplate({
    required String id,
    required Uint8List templateDefinition,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
      'templateDefinition': base64Encode(templateDefinition),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/template/put',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWhatsAppMessageTemplateOutput.fromJson(response);
  }

  /// Creates a new WhatsApp message template using a template from Meta's
  /// template library.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account to associate with this template.
  ///
  /// Parameter [metaLibraryTemplate] :
  /// The template configuration from Meta's library, including customizations
  /// for buttons and body text.
  Future<CreateWhatsAppMessageTemplateFromLibraryOutput>
      createWhatsAppMessageTemplateFromLibrary({
    required String id,
    required MetaLibraryTemplate metaLibraryTemplate,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
      'metaLibraryTemplate': metaLibraryTemplate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/template/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWhatsAppMessageTemplateFromLibraryOutput.fromJson(response);
  }

  /// Uploads media for use in a WhatsApp message template.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this media upload.
  Future<CreateWhatsAppMessageTemplateMediaOutput>
      createWhatsAppMessageTemplateMedia({
    required String id,
    S3File? sourceS3File,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
      if (sourceS3File != null) 'sourceS3File': sourceS3File,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/template/media',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWhatsAppMessageTemplateMediaOutput.fromJson(response);
  }

  /// Deletes a WhatsApp Flow permanently. Only Flows in DRAFT status can be
  /// deleted. Published or deprecated Flows cannot be deleted.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [flowId] :
  /// The unique identifier of the Flow to delete.
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this Flow.
  Future<void> deleteWhatsAppFlow({
    required String flowId,
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'flowId': [flowId],
      'id': [id],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/whatsapp/flow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a WhatsApp message template.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this template.
  ///
  /// Parameter [templateName] :
  /// The name of the template to delete.
  ///
  /// Parameter [deleteAllLanguages] :
  /// If true, deletes all language versions of the template.
  ///
  /// Parameter [metaTemplateId] :
  /// The numeric ID of the template assigned by Meta.
  Future<void> deleteWhatsAppMessageTemplate({
    required String id,
    required String templateName,
    bool? deleteAllLanguages,
    String? metaTemplateId,
  }) async {
    final $query = <String, List<String>>{
      'id': [id],
      'templateName': [templateName],
      if (deleteAllLanguages != null)
        'deleteAllTemplates': [deleteAllLanguages.toString()],
      if (metaTemplateId != null) 'metaTemplateId': [metaTemplateId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/whatsapp/template',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deprecates a published WhatsApp Flow, marking it as no longer recommended
  /// for use. The Flow must be in PUBLISHED status. This is an irreversible
  /// operation.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [flowId] :
  /// The unique identifier of the Flow to deprecate.
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this Flow.
  Future<void> deprecateWhatsAppFlow({
    required String flowId,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'flowId': flowId,
      'id': id,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/flow/deprecate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the metadata and status of a WhatsApp Flow, including validation
  /// errors, preview information, and health status.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [flowId] :
  /// The unique identifier of the Flow to retrieve.
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this Flow.
  Future<GetWhatsAppFlowOutput> getWhatsAppFlow({
    required String flowId,
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'flowId': [flowId],
      'id': [id],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/whatsapp/flow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWhatsAppFlowOutput.fromJson(response);
  }

  /// Generates a web preview URL for testing a WhatsApp Flow before publishing.
  /// Preview URLs expire in 30 days and can be shared with stakeholders for
  /// review.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [flowId] :
  /// The unique identifier of the Flow to preview.
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this Flow.
  ///
  /// Parameter [invalidate] :
  /// Set to <code>true</code> to force generation of a new preview URL. Use
  /// this if the previous URL has been compromised or you want a fresh
  /// expiration period.
  Future<GetWhatsAppFlowPreviewOutput> getWhatsAppFlowPreview({
    required String flowId,
    required String id,
    bool? invalidate,
  }) async {
    final $query = <String, List<String>>{
      'flowId': [flowId],
      'id': [id],
      if (invalidate != null) 'invalidate': [invalidate.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/whatsapp/flow/preview',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWhatsAppFlowPreviewOutput.fromJson(response);
  }

  /// Retrieves a specific WhatsApp message template.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this template.
  ///
  /// Parameter [metaTemplateId] :
  /// The numeric ID of the template assigned by Meta.
  ///
  /// Parameter [templateLanguageCode] :
  /// The language code of the message template (for example, <code>en</code> or
  /// <code>en_US</code>). Use together with <code>templateName</code> as an
  /// alternative to <code>metaTemplateId</code> to identify a template.
  ///
  /// Parameter [templateName] :
  /// The name of the message template. Use together with
  /// <code>templateLanguageCode</code> as an alternative to
  /// <code>metaTemplateId</code> to identify a template.
  Future<GetWhatsAppMessageTemplateOutput> getWhatsAppMessageTemplate({
    required String id,
    String? metaTemplateId,
    String? templateLanguageCode,
    String? templateName,
  }) async {
    final $query = <String, List<String>>{
      'id': [id],
      if (metaTemplateId != null) 'metaTemplateId': [metaTemplateId],
      if (templateLanguageCode != null)
        'templateLanguageCode': [templateLanguageCode],
      if (templateName != null) 'templateName': [templateName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/whatsapp/template',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWhatsAppMessageTemplateOutput.fromJson(response);
  }

  /// Lists the assets (Flow JSON definition) of a WhatsApp Flow with presigned
  /// download URLs. Download URLs are generated by Meta and expire after a
  /// short period.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [flowId] :
  /// The unique identifier of the Flow whose assets to list.
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this Flow.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListWhatsAppFlowAssetsOutput> listWhatsAppFlowAssets({
    required String flowId,
    required String id,
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
      'flowId': [flowId],
      'id': [id],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/whatsapp/flow/assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWhatsAppFlowAssetsOutput.fromJson(response);
  }

  /// Lists all WhatsApp Flows for a WhatsApp Business Account. Returns summary
  /// information including Flow ID, name, status, and categories.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account to list Flows for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListWhatsAppFlowsOutput> listWhatsAppFlows({
    required String id,
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
      'id': [id],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/whatsapp/flow/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWhatsAppFlowsOutput.fromJson(response);
  }

  /// Lists WhatsApp message templates for a specific WhatsApp Business Account.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account to list templates for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page (1-100).
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListWhatsAppMessageTemplatesOutput> listWhatsAppMessageTemplates({
    required String id,
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
      'id': [id],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/whatsapp/template/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWhatsAppMessageTemplatesOutput.fromJson(response);
  }

  /// Lists templates available in Meta's template library for WhatsApp
  /// messaging.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account to list library templates for.
  ///
  /// Parameter [filters] :
  /// Map of filters to apply (searchKey, topic, usecase, industry, language).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page (1-100).
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListWhatsAppTemplateLibraryOutput> listWhatsAppTemplateLibrary({
    required String id,
    Map<String, String>? filters,
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
      'id': [id],
    };
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/template/library',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWhatsAppTemplateLibraryOutput.fromJson(response);
  }

  /// Publishes a WhatsApp Flow, making it available for use in template
  /// messages. The Flow must be in DRAFT status with valid Flow JSON that
  /// passes Meta's validation. This is an irreversible operation.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [flowId] :
  /// The unique identifier of the Flow to publish.
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this Flow.
  Future<void> publishWhatsAppFlow({
    required String flowId,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'flowId': flowId,
      'id': id,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/flow/publish',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Add an event destination to log event data from WhatsApp for a WhatsApp
  /// Business Account (WABA). A WABA can only have one event destination at a
  /// time. All resources associated with the WABA use the same event
  /// destination.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [eventDestinations] :
  /// An array of <code>WhatsAppBusinessAccountEventDestination</code> event
  /// destinations.
  ///
  /// Parameter [id] :
  /// The unique identifier of your WhatsApp Business Account. WABA identifiers
  /// are formatted as <code>waba-01234567890123456789012345678901</code>. Use
  /// <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_ListLinkedWhatsAppBusinessAccounts.html">ListLinkedWhatsAppBusinessAccounts</a>
  /// to list all WABAs and their details.
  Future<void> putWhatsAppBusinessAccountEventDestinations({
    required List<WhatsAppBusinessAccountEventDestination> eventDestinations,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'eventDestinations': eventDestinations,
      'id': id,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/whatsapp/waba/eventdestinations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the metadata of a WhatsApp Flow, such as its name or categories.
  /// This does not update the Flow JSON definition. Use <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_UpdateWhatsAppFlowAssets.html">UpdateWhatsAppFlowAssets</a>
  /// to update the Flow JSON.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [flowId] :
  /// The unique identifier of the Flow to update.
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this Flow.
  ///
  /// Parameter [categories] :
  /// The updated categories for the Flow.
  ///
  /// Parameter [flowName] :
  /// The updated name for the Flow.
  Future<void> updateWhatsAppFlow({
    required String flowId,
    required String id,
    List<MetaFlowCategory>? categories,
    String? flowName,
  }) async {
    final $payload = <String, dynamic>{
      'flowId': flowId,
      'id': id,
      if (categories != null)
        'categories': categories.map((e) => e.value).toList(),
      if (flowName != null) 'flowName': flowName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/flow/update',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the Flow JSON definition (assets) of a WhatsApp Flow. Updating a
  /// published Flow's assets reverts it to DRAFT status, requiring
  /// re-publishing.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [flowId] :
  /// The unique identifier of the Flow whose assets to update.
  ///
  /// Parameter [flowJson] :
  /// The updated Flow JSON definition. Maximum size is 10 MB.
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this Flow.
  Future<UpdateWhatsAppFlowAssetsOutput> updateWhatsAppFlowAssets({
    required String flowId,
    required Uint8List flowJson,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'flowId': flowId,
      'flowJson': base64Encode(flowJson),
      'id': id,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/flow/assets/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWhatsAppFlowAssetsOutput.fromJson(response);
  }

  /// Updates an existing WhatsApp message template.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The ID of the WhatsApp Business Account associated with this template.
  ///
  /// Parameter [ctaUrlLinkTrackingOptedOut] :
  /// When true, disables click tracking for call-to-action URL buttons in the
  /// template.
  ///
  /// Parameter [metaTemplateId] :
  /// The numeric ID of the template assigned by Meta.
  ///
  /// Parameter [parameterFormat] :
  /// The format specification for parameters in the template, this can be
  /// either 'named' or 'positional'.
  ///
  /// Parameter [templateCategory] :
  /// The new category for the template (for example, UTILITY or MARKETING).
  ///
  /// Parameter [templateComponents] :
  /// The updated components of the template as a JSON blob (maximum 3000
  /// characters).
  ///
  /// Parameter [templateLanguageCode] :
  /// The language code of the message template (for example, <code>en</code> or
  /// <code>en_US</code>). Use together with <code>templateName</code> as an
  /// alternative to <code>metaTemplateId</code> to identify a template.
  ///
  /// Parameter [templateName] :
  /// The name of the message template. Use together with
  /// <code>templateLanguageCode</code> as an alternative to
  /// <code>metaTemplateId</code> to identify a template.
  Future<void> updateWhatsAppMessageTemplate({
    required String id,
    bool? ctaUrlLinkTrackingOptedOut,
    String? metaTemplateId,
    String? parameterFormat,
    String? templateCategory,
    Uint8List? templateComponents,
    String? templateLanguageCode,
    String? templateName,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
      if (ctaUrlLinkTrackingOptedOut != null)
        'ctaUrlLinkTrackingOptedOut': ctaUrlLinkTrackingOptedOut,
      if (metaTemplateId != null) 'metaTemplateId': metaTemplateId,
      if (parameterFormat != null) 'parameterFormat': parameterFormat,
      if (templateCategory != null) 'templateCategory': templateCategory,
      if (templateComponents != null)
        'templateComponents': base64Encode(templateComponents),
      if (templateLanguageCode != null)
        'templateLanguageCode': templateLanguageCode,
      if (templateName != null) 'templateName': templateName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/template',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieve the WABA account id and phone number details of a WhatsApp
  /// business account phone number.
  ///
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the phone number. Phone number identifiers are
  /// formatted as
  /// <code>phone-number-id-01234567890123456789012345678901</code>. Use <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_GetLinkedWhatsAppBusinessAccount.html">GetLinkedWhatsAppBusinessAccount</a>
  /// to find a phone number's id.
  Future<GetLinkedWhatsAppBusinessAccountPhoneNumberOutput>
      getLinkedWhatsAppBusinessAccountPhoneNumber({
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'id': [id],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/whatsapp/waba/phone/details',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLinkedWhatsAppBusinessAccountPhoneNumberOutput.fromJson(response);
  }

  /// Delete a media object from the WhatsApp service. If the object is still in
  /// an Amazon S3 bucket you should delete it from there too.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [mediaId] :
  /// The unique identifier of the media file to delete. Use the
  /// <code>mediaId</code> returned from <a
  /// href="https://console.aws.amazon.com/social-messaging/latest/APIReference/API_PostWhatsAppMessageMedia.html">PostWhatsAppMessageMedia</a>.
  ///
  /// Parameter [originationPhoneNumberId] :
  /// The unique identifier of the originating phone number associated with the
  /// media. Phone number identifiers are formatted as
  /// <code>phone-number-id-01234567890123456789012345678901</code>. Use <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_GetLinkedWhatsAppBusinessAccount.html">GetLinkedWhatsAppBusinessAccount</a>
  /// to find a phone number's id.
  Future<DeleteWhatsAppMessageMediaOutput> deleteWhatsAppMessageMedia({
    required String mediaId,
    required String originationPhoneNumberId,
  }) async {
    final $query = <String, List<String>>{
      'mediaId': [mediaId],
      'originationPhoneNumberId': [originationPhoneNumberId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/whatsapp/media',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWhatsAppMessageMediaOutput.fromJson(response);
  }

  /// Get a media file from the WhatsApp service. On successful completion the
  /// media file is retrieved from Meta and stored in the specified Amazon S3
  /// bucket. Use either <code>destinationS3File</code> or
  /// <code>destinationS3PresignedUrl</code> for the destination. If both are
  /// used then an <code>InvalidParameterException</code> is returned.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [mediaId] :
  /// The unique identifier for the media file.
  ///
  /// Parameter [originationPhoneNumberId] :
  /// The unique identifier of the originating phone number for the WhatsApp
  /// message media. The phone number identifiers are formatted as
  /// <code>phone-number-id-01234567890123456789012345678901</code>. Use <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_GetLinkedWhatsAppBusinessAccount.html">GetLinkedWhatsAppBusinessAccount</a>
  /// to find a phone number's id.
  ///
  /// Parameter [destinationS3File] :
  /// The <code>bucketName</code> and <code>key</code> of the S3 media file.
  ///
  /// Parameter [destinationS3PresignedUrl] :
  /// The presign url of the media file.
  ///
  /// Parameter [metadataOnly] :
  /// Set to <code>True</code> to get only the metadata for the file.
  Future<GetWhatsAppMessageMediaOutput> getWhatsAppMessageMedia({
    required String mediaId,
    required String originationPhoneNumberId,
    S3File? destinationS3File,
    S3PresignedUrl? destinationS3PresignedUrl,
    bool? metadataOnly,
  }) async {
    final $payload = <String, dynamic>{
      'mediaId': mediaId,
      'originationPhoneNumberId': originationPhoneNumberId,
      if (destinationS3File != null) 'destinationS3File': destinationS3File,
      if (destinationS3PresignedUrl != null)
        'destinationS3PresignedUrl': destinationS3PresignedUrl,
      if (metadataOnly != null) 'metadataOnly': metadataOnly,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/media/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetWhatsAppMessageMediaOutput.fromJson(response);
  }

  /// Upload a media file to the WhatsApp service. Only the specified
  /// <code>originationPhoneNumberId</code> has the permissions to send the
  /// media file when using <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_SendWhatsAppMessage.html">SendWhatsAppMessage</a>.
  /// You must use either <code>sourceS3File</code> or
  /// <code>sourceS3PresignedUrl</code> for the source. If both or neither are
  /// specified then an <code>InvalidParameterException</code> is returned.
  ///
  /// May throw [AccessDeniedByMetaException].
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [originationPhoneNumberId] :
  /// The ID of the phone number to associate with the WhatsApp media file. The
  /// phone number identifiers are formatted as
  /// <code>phone-number-id-01234567890123456789012345678901</code>. Use <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_GetLinkedWhatsAppBusinessAccount.html">GetLinkedWhatsAppBusinessAccount</a>
  /// to find a phone number's id.
  ///
  /// Parameter [sourceS3File] :
  /// The source S3 url for the media file.
  ///
  /// Parameter [sourceS3PresignedUrl] :
  /// The source presign url of the media file.
  Future<PostWhatsAppMessageMediaOutput> postWhatsAppMessageMedia({
    required String originationPhoneNumberId,
    S3File? sourceS3File,
    S3PresignedUrl? sourceS3PresignedUrl,
  }) async {
    final $payload = <String, dynamic>{
      'originationPhoneNumberId': originationPhoneNumberId,
      if (sourceS3File != null) 'sourceS3File': sourceS3File,
      if (sourceS3PresignedUrl != null)
        'sourceS3PresignedUrl': sourceS3PresignedUrl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/media',
      exceptionFnMap: _exceptionFns,
    );
    return PostWhatsAppMessageMediaOutput.fromJson(response);
  }

  /// Send a WhatsApp message. For examples of sending a message using the
  /// Amazon Web Services CLI, see <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/userguide/send-message.html">Sending
  /// messages</a> in the <i> <i>Amazon Web Services End User Messaging Social
  /// User Guide</i> </i>.
  ///
  /// May throw [DependencyException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidParametersException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledRequestException].
  ///
  /// Parameter [message] :
  /// The message to send through WhatsApp. The length is in KB. The message
  /// field passes through a WhatsApp Message object, see <a
  /// href="https://developers.facebook.com/docs/whatsapp/cloud-api/reference/messages">Messages</a>
  /// in the <i>WhatsApp Business Platform Cloud API Reference</i>.
  ///
  /// Parameter [metaApiVersion] :
  /// The API version for the request formatted as
  /// <code>v{VersionNumber}</code>. For a list of supported API versions and
  /// Amazon Web Services Regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/end-user-messaging.html">
  /// <i>Amazon Web Services End User Messaging Social API</i> Service
  /// Endpoints</a> in the <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [originationPhoneNumberId] :
  /// The ID of the phone number used to send the WhatsApp message. If you are
  /// sending a media file only the <code>originationPhoneNumberId</code> used
  /// to upload the file can be used. Phone number identifiers are formatted as
  /// <code>phone-number-id-01234567890123456789012345678901</code>. Use <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_GetLinkedWhatsAppBusinessAccount.html">GetLinkedWhatsAppBusinessAccount</a>
  /// to find a phone number's id.
  Future<SendWhatsAppMessageOutput> sendWhatsAppMessage({
    required Uint8List message,
    required String metaApiVersion,
    required String originationPhoneNumberId,
  }) async {
    final $payload = <String, dynamic>{
      'message': base64Encode(message),
      'metaApiVersion': metaApiVersion,
      'originationPhoneNumberId': originationPhoneNumberId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/whatsapp/send',
      exceptionFnMap: _exceptionFns,
    );
    return SendWhatsAppMessageOutput.fromJson(response);
  }
}

class ListTagsForResourceOutput {
  /// The status code of the response.
  final int? statusCode;

  /// The tags for the resource.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.statusCode,
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      statusCode: json['statusCode'] as int?,
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final tags = this.tags;
    return {
      if (statusCode != null) 'statusCode': statusCode,
      if (tags != null) 'tags': tags,
    };
  }
}

class TagResourceOutput {
  /// The status code of the tag resource operation.
  final int? statusCode;

  TagResourceOutput({
    this.statusCode,
  });

  factory TagResourceOutput.fromJson(Map<String, dynamic> json) {
    return TagResourceOutput(
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {
      if (statusCode != null) 'statusCode': statusCode,
    };
  }
}

class UntagResourceOutput {
  /// The status code of the untag resource operation.
  final int? statusCode;

  UntagResourceOutput({
    this.statusCode,
  });

  factory UntagResourceOutput.fromJson(Map<String, dynamic> json) {
    return UntagResourceOutput(
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {
      if (statusCode != null) 'statusCode': statusCode,
    };
  }
}

class AssociateWhatsAppBusinessAccountOutput {
  /// The ID of the WhatsApp Business Account that was linked to your Amazon Web
  /// Services account.
  final String? linkedWhatsAppBusinessAccountId;

  /// Contains your WhatsApp registration status.
  final WhatsAppSignupCallbackResult? signupCallbackResult;

  /// The status code for the response.
  final int? statusCode;

  AssociateWhatsAppBusinessAccountOutput({
    this.linkedWhatsAppBusinessAccountId,
    this.signupCallbackResult,
    this.statusCode,
  });

  factory AssociateWhatsAppBusinessAccountOutput.fromJson(
      Map<String, dynamic> json) {
    return AssociateWhatsAppBusinessAccountOutput(
      linkedWhatsAppBusinessAccountId:
          json['linkedWhatsAppBusinessAccountId'] as String?,
      signupCallbackResult: json['signupCallbackResult'] != null
          ? WhatsAppSignupCallbackResult.fromJson(
              json['signupCallbackResult'] as Map<String, dynamic>)
          : null,
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final linkedWhatsAppBusinessAccountId =
        this.linkedWhatsAppBusinessAccountId;
    final signupCallbackResult = this.signupCallbackResult;
    final statusCode = this.statusCode;
    return {
      if (linkedWhatsAppBusinessAccountId != null)
        'linkedWhatsAppBusinessAccountId': linkedWhatsAppBusinessAccountId,
      if (signupCallbackResult != null)
        'signupCallbackResult': signupCallbackResult,
      if (statusCode != null) 'statusCode': statusCode,
    };
  }
}

class GetLinkedWhatsAppBusinessAccountOutput {
  /// The details of the linked WhatsApp Business Account.
  final LinkedWhatsAppBusinessAccount? account;

  GetLinkedWhatsAppBusinessAccountOutput({
    this.account,
  });

  factory GetLinkedWhatsAppBusinessAccountOutput.fromJson(
      Map<String, dynamic> json) {
    return GetLinkedWhatsAppBusinessAccountOutput(
      account: json['account'] != null
          ? LinkedWhatsAppBusinessAccount.fromJson(
              json['account'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    return {
      if (account != null) 'account': account,
    };
  }
}

class DisassociateWhatsAppBusinessAccountOutput {
  DisassociateWhatsAppBusinessAccountOutput();

  factory DisassociateWhatsAppBusinessAccountOutput.fromJson(
      Map<String, dynamic> _) {
    return DisassociateWhatsAppBusinessAccountOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListLinkedWhatsAppBusinessAccountsOutput {
  /// A list of WhatsApp Business Accounts linked to your Amazon Web Services
  /// account.
  final List<LinkedWhatsAppBusinessAccountSummary>? linkedAccounts;

  /// The next token for pagination.
  final String? nextToken;

  ListLinkedWhatsAppBusinessAccountsOutput({
    this.linkedAccounts,
    this.nextToken,
  });

  factory ListLinkedWhatsAppBusinessAccountsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListLinkedWhatsAppBusinessAccountsOutput(
      linkedAccounts: (json['linkedAccounts'] as List?)
          ?.nonNulls
          .map((e) => LinkedWhatsAppBusinessAccountSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linkedAccounts = this.linkedAccounts;
    final nextToken = this.nextToken;
    return {
      if (linkedAccounts != null) 'linkedAccounts': linkedAccounts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateWhatsAppFlowOutput {
  /// The unique identifier assigned to the Flow by Meta.
  final String? flowId;

  /// A list of validation errors returned by Meta, if any. Validation errors must
  /// be resolved before the Flow can be published.
  final List<String>? validationErrors;

  CreateWhatsAppFlowOutput({
    this.flowId,
    this.validationErrors,
  });

  factory CreateWhatsAppFlowOutput.fromJson(Map<String, dynamic> json) {
    return CreateWhatsAppFlowOutput(
      flowId: json['flowId'] as String?,
      validationErrors: (json['validationErrors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowId = this.flowId;
    final validationErrors = this.validationErrors;
    return {
      if (flowId != null) 'flowId': flowId,
      if (validationErrors != null) 'validationErrors': validationErrors,
    };
  }
}

class CreateWhatsAppMessageTemplateOutput {
  /// The category of the template, such as UTILITY or MARKETING.
  final String? category;

  /// The numeric ID assigned to the template by Meta.
  final String? metaTemplateId;

  /// The status of the created template, such as PENDING or APPROVED..
  final String? templateStatus;

  CreateWhatsAppMessageTemplateOutput({
    this.category,
    this.metaTemplateId,
    this.templateStatus,
  });

  factory CreateWhatsAppMessageTemplateOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateWhatsAppMessageTemplateOutput(
      category: json['category'] as String?,
      metaTemplateId: json['metaTemplateId'] as String?,
      templateStatus: json['templateStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final metaTemplateId = this.metaTemplateId;
    final templateStatus = this.templateStatus;
    return {
      if (category != null) 'category': category,
      if (metaTemplateId != null) 'metaTemplateId': metaTemplateId,
      if (templateStatus != null) 'templateStatus': templateStatus,
    };
  }
}

class CreateWhatsAppMessageTemplateFromLibraryOutput {
  /// The category of the template (for example, UTILITY or MARKETING).
  final String? category;

  /// The numeric ID assigned to the template by Meta.
  final String? metaTemplateId;

  /// The status of the created template (for example, PENDING or APPROVED).
  final String? templateStatus;

  CreateWhatsAppMessageTemplateFromLibraryOutput({
    this.category,
    this.metaTemplateId,
    this.templateStatus,
  });

  factory CreateWhatsAppMessageTemplateFromLibraryOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateWhatsAppMessageTemplateFromLibraryOutput(
      category: json['category'] as String?,
      metaTemplateId: json['metaTemplateId'] as String?,
      templateStatus: json['templateStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final metaTemplateId = this.metaTemplateId;
    final templateStatus = this.templateStatus;
    return {
      if (category != null) 'category': category,
      if (metaTemplateId != null) 'metaTemplateId': metaTemplateId,
      if (templateStatus != null) 'templateStatus': templateStatus,
    };
  }
}

class CreateWhatsAppMessageTemplateMediaOutput {
  /// The handle assigned to the uploaded media by Meta, used to reference the
  /// media in templates.
  final String? metaHeaderHandle;

  CreateWhatsAppMessageTemplateMediaOutput({
    this.metaHeaderHandle,
  });

  factory CreateWhatsAppMessageTemplateMediaOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateWhatsAppMessageTemplateMediaOutput(
      metaHeaderHandle: json['metaHeaderHandle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metaHeaderHandle = this.metaHeaderHandle;
    return {
      if (metaHeaderHandle != null) 'metaHeaderHandle': metaHeaderHandle,
    };
  }
}

class DeleteWhatsAppFlowOutput {
  DeleteWhatsAppFlowOutput();

  factory DeleteWhatsAppFlowOutput.fromJson(Map<String, dynamic> _) {
    return DeleteWhatsAppFlowOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWhatsAppMessageTemplateOutput {
  DeleteWhatsAppMessageTemplateOutput();

  factory DeleteWhatsAppMessageTemplateOutput.fromJson(Map<String, dynamic> _) {
    return DeleteWhatsAppMessageTemplateOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeprecateWhatsAppFlowOutput {
  DeprecateWhatsAppFlowOutput();

  factory DeprecateWhatsAppFlowOutput.fromJson(Map<String, dynamic> _) {
    return DeprecateWhatsAppFlowOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetWhatsAppFlowOutput {
  /// The unique identifier of the Flow.
  final String flowId;

  /// The name of the Flow.
  final String flowName;

  /// The lifecycle status of the Flow. Valid values are DRAFT, PUBLISHED,
  /// DEPRECATED, BLOCKED, and THROTTLED.
  final String flowStatus;

  /// The Meta application information associated with this Flow.
  final MetaFlowApplicationInfo? application;

  /// The categories that classify the business purpose of the Flow.
  final List<MetaFlowCategory>? categories;

  /// The data API version for data exchange endpoint Flows.
  final String? dataApiVersion;

  /// The endpoint URI for data exchange Flows, if configured.
  final String? endpointUri;

  /// The health status information for this Flow from Meta.
  final MetaFlowHealthStatus? healthStatus;

  /// The version of the Flow JSON schema used by this Flow (for example, 7.3).
  final String? jsonVersion;

  /// The preview URL and its expiration timestamp for testing the Flow.
  final MetaFlowPreviewInfo? preview;

  /// A list of validation errors from Meta, if any.
  final List<String>? validationErrors;

  /// The WhatsApp Business Account information from Meta associated with this
  /// Flow.
  final MetaFlowWhatsAppBusinessAccountInfo? whatsAppBusinessAccount;

  GetWhatsAppFlowOutput({
    required this.flowId,
    required this.flowName,
    required this.flowStatus,
    this.application,
    this.categories,
    this.dataApiVersion,
    this.endpointUri,
    this.healthStatus,
    this.jsonVersion,
    this.preview,
    this.validationErrors,
    this.whatsAppBusinessAccount,
  });

  factory GetWhatsAppFlowOutput.fromJson(Map<String, dynamic> json) {
    return GetWhatsAppFlowOutput(
      flowId: (json['flowId'] as String?) ?? '',
      flowName: (json['flowName'] as String?) ?? '',
      flowStatus: (json['flowStatus'] as String?) ?? '',
      application: json['application'] != null
          ? MetaFlowApplicationInfo.fromJson(
              json['application'] as Map<String, dynamic>)
          : null,
      categories: (json['categories'] as List?)
          ?.nonNulls
          .map((e) => MetaFlowCategory.fromString((e as String)))
          .toList(),
      dataApiVersion: json['dataApiVersion'] as String?,
      endpointUri: json['endpointUri'] as String?,
      healthStatus: json['healthStatus'] != null
          ? MetaFlowHealthStatus.fromJson(
              json['healthStatus'] as Map<String, dynamic>)
          : null,
      jsonVersion: json['jsonVersion'] as String?,
      preview: json['preview'] != null
          ? MetaFlowPreviewInfo.fromJson(
              json['preview'] as Map<String, dynamic>)
          : null,
      validationErrors: (json['validationErrors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      whatsAppBusinessAccount: json['whatsAppBusinessAccount'] != null
          ? MetaFlowWhatsAppBusinessAccountInfo.fromJson(
              json['whatsAppBusinessAccount'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flowId = this.flowId;
    final flowName = this.flowName;
    final flowStatus = this.flowStatus;
    final application = this.application;
    final categories = this.categories;
    final dataApiVersion = this.dataApiVersion;
    final endpointUri = this.endpointUri;
    final healthStatus = this.healthStatus;
    final jsonVersion = this.jsonVersion;
    final preview = this.preview;
    final validationErrors = this.validationErrors;
    final whatsAppBusinessAccount = this.whatsAppBusinessAccount;
    return {
      'flowId': flowId,
      'flowName': flowName,
      'flowStatus': flowStatus,
      if (application != null) 'application': application,
      if (categories != null)
        'categories': categories.map((e) => e.value).toList(),
      if (dataApiVersion != null) 'dataApiVersion': dataApiVersion,
      if (endpointUri != null) 'endpointUri': endpointUri,
      if (healthStatus != null) 'healthStatus': healthStatus,
      if (jsonVersion != null) 'jsonVersion': jsonVersion,
      if (preview != null) 'preview': preview,
      if (validationErrors != null) 'validationErrors': validationErrors,
      if (whatsAppBusinessAccount != null)
        'whatsAppBusinessAccount': whatsAppBusinessAccount,
    };
  }
}

class GetWhatsAppFlowPreviewOutput {
  /// The unique identifier of the Flow.
  final String flowId;

  /// The preview URL and its expiration timestamp.
  final MetaFlowPreviewInfo preview;

  GetWhatsAppFlowPreviewOutput({
    required this.flowId,
    required this.preview,
  });

  factory GetWhatsAppFlowPreviewOutput.fromJson(Map<String, dynamic> json) {
    return GetWhatsAppFlowPreviewOutput(
      flowId: (json['flowId'] as String?) ?? '',
      preview: MetaFlowPreviewInfo.fromJson(
          (json['preview'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final flowId = this.flowId;
    final preview = this.preview;
    return {
      'flowId': flowId,
      'preview': preview,
    };
  }
}

class GetWhatsAppMessageTemplateOutput {
  /// The complete template definition as a JSON string (maximum 6000 characters).
  final String? template;

  GetWhatsAppMessageTemplateOutput({
    this.template,
  });

  factory GetWhatsAppMessageTemplateOutput.fromJson(Map<String, dynamic> json) {
    return GetWhatsAppMessageTemplateOutput(
      template: json['template'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final template = this.template;
    return {
      if (template != null) 'template': template,
    };
  }
}

class ListWhatsAppFlowAssetsOutput {
  /// A list of Flow assets with download URLs.
  final List<MetaFlowAsset> flowAssets;

  /// The token to retrieve the next page of results, if any.
  final String? nextToken;

  ListWhatsAppFlowAssetsOutput({
    required this.flowAssets,
    this.nextToken,
  });

  factory ListWhatsAppFlowAssetsOutput.fromJson(Map<String, dynamic> json) {
    return ListWhatsAppFlowAssetsOutput(
      flowAssets: ((json['flowAssets'] as List?) ?? const [])
          .nonNulls
          .map((e) => MetaFlowAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowAssets = this.flowAssets;
    final nextToken = this.nextToken;
    return {
      'flowAssets': flowAssets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListWhatsAppFlowsOutput {
  /// A list of Flow summaries.
  final List<MetaFlowSummary> flows;

  /// The token to retrieve the next page of results, if any.
  final String? nextToken;

  ListWhatsAppFlowsOutput({
    required this.flows,
    this.nextToken,
  });

  factory ListWhatsAppFlowsOutput.fromJson(Map<String, dynamic> json) {
    return ListWhatsAppFlowsOutput(
      flows: ((json['flows'] as List?) ?? const [])
          .nonNulls
          .map((e) => MetaFlowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flows = this.flows;
    final nextToken = this.nextToken;
    return {
      'flows': flows,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListWhatsAppMessageTemplatesOutput {
  /// The token to retrieve the next page of results, if any.
  final String? nextToken;

  /// A list of template summaries.
  final List<TemplateSummary>? templates;

  ListWhatsAppMessageTemplatesOutput({
    this.nextToken,
    this.templates,
  });

  factory ListWhatsAppMessageTemplatesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListWhatsAppMessageTemplatesOutput(
      nextToken: json['nextToken'] as String?,
      templates: (json['templates'] as List?)
          ?.nonNulls
          .map((e) => TemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final templates = this.templates;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (templates != null) 'templates': templates,
    };
  }
}

class ListWhatsAppTemplateLibraryOutput {
  /// A list of templates from Meta's library.
  final List<MetaLibraryTemplateDefinition>? metaLibraryTemplates;

  /// The token to retrieve the next page of results, if any.
  final String? nextToken;

  ListWhatsAppTemplateLibraryOutput({
    this.metaLibraryTemplates,
    this.nextToken,
  });

  factory ListWhatsAppTemplateLibraryOutput.fromJson(
      Map<String, dynamic> json) {
    return ListWhatsAppTemplateLibraryOutput(
      metaLibraryTemplates: (json['metaLibraryTemplates'] as List?)
          ?.nonNulls
          .map((e) =>
              MetaLibraryTemplateDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metaLibraryTemplates = this.metaLibraryTemplates;
    final nextToken = this.nextToken;
    return {
      if (metaLibraryTemplates != null)
        'metaLibraryTemplates': metaLibraryTemplates,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class PublishWhatsAppFlowOutput {
  PublishWhatsAppFlowOutput();

  factory PublishWhatsAppFlowOutput.fromJson(Map<String, dynamic> _) {
    return PublishWhatsAppFlowOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutWhatsAppBusinessAccountEventDestinationsOutput {
  PutWhatsAppBusinessAccountEventDestinationsOutput();

  factory PutWhatsAppBusinessAccountEventDestinationsOutput.fromJson(
      Map<String, dynamic> _) {
    return PutWhatsAppBusinessAccountEventDestinationsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWhatsAppFlowOutput {
  UpdateWhatsAppFlowOutput();

  factory UpdateWhatsAppFlowOutput.fromJson(Map<String, dynamic> _) {
    return UpdateWhatsAppFlowOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWhatsAppFlowAssetsOutput {
  /// A list of validation errors returned by Meta, if any. Validation errors must
  /// be resolved before the Flow can be published.
  final List<String>? validationErrors;

  UpdateWhatsAppFlowAssetsOutput({
    this.validationErrors,
  });

  factory UpdateWhatsAppFlowAssetsOutput.fromJson(Map<String, dynamic> json) {
    return UpdateWhatsAppFlowAssetsOutput(
      validationErrors: (json['validationErrors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final validationErrors = this.validationErrors;
    return {
      if (validationErrors != null) 'validationErrors': validationErrors,
    };
  }
}

class UpdateWhatsAppMessageTemplateOutput {
  UpdateWhatsAppMessageTemplateOutput();

  factory UpdateWhatsAppMessageTemplateOutput.fromJson(Map<String, dynamic> _) {
    return UpdateWhatsAppMessageTemplateOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetLinkedWhatsAppBusinessAccountPhoneNumberOutput {
  /// The WABA identifier linked to the phone number, formatted as
  /// <code>waba-01234567890123456789012345678901</code>.
  final String? linkedWhatsAppBusinessAccountId;
  final WhatsAppPhoneNumberDetail? phoneNumber;

  GetLinkedWhatsAppBusinessAccountPhoneNumberOutput({
    this.linkedWhatsAppBusinessAccountId,
    this.phoneNumber,
  });

  factory GetLinkedWhatsAppBusinessAccountPhoneNumberOutput.fromJson(
      Map<String, dynamic> json) {
    return GetLinkedWhatsAppBusinessAccountPhoneNumberOutput(
      linkedWhatsAppBusinessAccountId:
          json['linkedWhatsAppBusinessAccountId'] as String?,
      phoneNumber: json['phoneNumber'] != null
          ? WhatsAppPhoneNumberDetail.fromJson(
              json['phoneNumber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final linkedWhatsAppBusinessAccountId =
        this.linkedWhatsAppBusinessAccountId;
    final phoneNumber = this.phoneNumber;
    return {
      if (linkedWhatsAppBusinessAccountId != null)
        'linkedWhatsAppBusinessAccountId': linkedWhatsAppBusinessAccountId,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
    };
  }
}

class DeleteWhatsAppMessageMediaOutput {
  /// Success indicator for deleting the media file.
  final bool? success;

  DeleteWhatsAppMessageMediaOutput({
    this.success,
  });

  factory DeleteWhatsAppMessageMediaOutput.fromJson(Map<String, dynamic> json) {
    return DeleteWhatsAppMessageMediaOutput(
      success: json['success'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final success = this.success;
    return {
      if (success != null) 'success': success,
    };
  }
}

class GetWhatsAppMessageMediaOutput {
  /// The size of the media file, in KB.
  final int? fileSize;

  /// The MIME type of the media.
  final String? mimeType;

  GetWhatsAppMessageMediaOutput({
    this.fileSize,
    this.mimeType,
  });

  factory GetWhatsAppMessageMediaOutput.fromJson(Map<String, dynamic> json) {
    return GetWhatsAppMessageMediaOutput(
      fileSize: json['fileSize'] as int?,
      mimeType: json['mimeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSize = this.fileSize;
    final mimeType = this.mimeType;
    return {
      if (fileSize != null) 'fileSize': fileSize,
      if (mimeType != null) 'mimeType': mimeType,
    };
  }
}

class PostWhatsAppMessageMediaOutput {
  /// The unique identifier of the posted WhatsApp message.
  final String? mediaId;

  PostWhatsAppMessageMediaOutput({
    this.mediaId,
  });

  factory PostWhatsAppMessageMediaOutput.fromJson(Map<String, dynamic> json) {
    return PostWhatsAppMessageMediaOutput(
      mediaId: json['mediaId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaId = this.mediaId;
    return {
      if (mediaId != null) 'mediaId': mediaId,
    };
  }
}

class SendWhatsAppMessageOutput {
  /// The unique identifier of the message.
  final String? messageId;

  SendWhatsAppMessageOutput({
    this.messageId,
  });

  factory SendWhatsAppMessageOutput.fromJson(Map<String, dynamic> json) {
    return SendWhatsAppMessageOutput(
      messageId: json['messageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      if (messageId != null) 'messageId': messageId,
    };
  }
}

/// You can use presigned URLs to grant time-limited access to objects in Amazon
/// S3 without updating your bucket policy. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-presigned-url.html">Working
/// with presigned URLs</a> in the <i>Amazon S3 User Guide</i>.
class S3PresignedUrl {
  /// A map of headers and their values. You must specify the
  /// <code>Content-Type</code> header when using
  /// <code>PostWhatsAppMessageMedia</code>. For a list of common headers, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTCommonRequestHeaders.html">Common
  /// Request Headers</a> in the <i>Amazon S3 API Reference</i>
  final Map<String, String> headers;

  /// The presign url to the object.
  final String url;

  S3PresignedUrl({
    required this.headers,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    final headers = this.headers;
    final url = this.url;
    return {
      'headers': headers,
      'url': url,
    };
  }
}

/// Contains information for the S3 bucket that contains media files.
class S3File {
  /// The bucket name.
  final String bucketName;

  /// The S3 key prefix that defines the storage location of your media files. The
  /// prefix works like a folder path in S3, and is combined with the WhatsApp
  /// mediaId to create the final file path.
  ///
  /// For example, if a media file's WhatsApp mediaId is <code>123.ogg</code>, and
  /// the key is <code>audio/example.ogg</code>, the final file path is
  /// <code>audio/example.ogg123.ogg</code>.
  ///
  /// For the same mediaId, a key of <code>audio/</code> results in the file path
  /// <code>audio/123.ogg</code>.
  final String key;

  S3File({
    required this.bucketName,
    required this.key,
  });

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final key = this.key;
    return {
      'bucketName': bucketName,
      'key': key,
    };
  }
}

/// The details of your WhatsApp phone number.
class WhatsAppPhoneNumberDetail {
  /// The ARN of the WhatsApp phone number.
  final String arn;

  /// The phone number that appears in the recipients display.
  final String displayPhoneNumber;

  /// The display name for this phone number.
  final String displayPhoneNumberName;

  /// The phone number ID from Meta.
  final String metaPhoneNumberId;

  /// The phone number for sending WhatsApp.
  final String phoneNumber;

  /// The phone number ID. Phone number identifiers are formatted as
  /// <code>phone-number-id-01234567890123456789012345678901</code>.
  final String phoneNumberId;

  /// The quality rating of the phone number.
  final String qualityRating;

  /// The geographic region where the WhatsApp phone number's data is stored and
  /// processed.
  final String? dataLocalizationRegion;

  WhatsAppPhoneNumberDetail({
    required this.arn,
    required this.displayPhoneNumber,
    required this.displayPhoneNumberName,
    required this.metaPhoneNumberId,
    required this.phoneNumber,
    required this.phoneNumberId,
    required this.qualityRating,
    this.dataLocalizationRegion,
  });

  factory WhatsAppPhoneNumberDetail.fromJson(Map<String, dynamic> json) {
    return WhatsAppPhoneNumberDetail(
      arn: (json['arn'] as String?) ?? '',
      displayPhoneNumber: (json['displayPhoneNumber'] as String?) ?? '',
      displayPhoneNumberName: (json['displayPhoneNumberName'] as String?) ?? '',
      metaPhoneNumberId: (json['metaPhoneNumberId'] as String?) ?? '',
      phoneNumber: (json['phoneNumber'] as String?) ?? '',
      phoneNumberId: (json['phoneNumberId'] as String?) ?? '',
      qualityRating: (json['qualityRating'] as String?) ?? '',
      dataLocalizationRegion: json['dataLocalizationRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final displayPhoneNumber = this.displayPhoneNumber;
    final displayPhoneNumberName = this.displayPhoneNumberName;
    final metaPhoneNumberId = this.metaPhoneNumberId;
    final phoneNumber = this.phoneNumber;
    final phoneNumberId = this.phoneNumberId;
    final qualityRating = this.qualityRating;
    final dataLocalizationRegion = this.dataLocalizationRegion;
    return {
      'arn': arn,
      'displayPhoneNumber': displayPhoneNumber,
      'displayPhoneNumberName': displayPhoneNumberName,
      'metaPhoneNumberId': metaPhoneNumberId,
      'phoneNumber': phoneNumber,
      'phoneNumberId': phoneNumberId,
      'qualityRating': qualityRating,
      if (dataLocalizationRegion != null)
        'dataLocalizationRegion': dataLocalizationRegion,
    };
  }
}

/// The category that classifies the business purpose of a WhatsApp Flow.
class MetaFlowCategory {
  static const signUp = MetaFlowCategory._('SIGN_UP');
  static const signIn = MetaFlowCategory._('SIGN_IN');
  static const appointmentBooking = MetaFlowCategory._('APPOINTMENT_BOOKING');
  static const leadGeneration = MetaFlowCategory._('LEAD_GENERATION');
  static const shopping = MetaFlowCategory._('SHOPPING');
  static const contactUs = MetaFlowCategory._('CONTACT_US');
  static const customerSupport = MetaFlowCategory._('CUSTOMER_SUPPORT');
  static const survey = MetaFlowCategory._('SURVEY');
  static const other = MetaFlowCategory._('OTHER');

  final String value;

  const MetaFlowCategory._(this.value);

  static const values = [
    signUp,
    signIn,
    appointmentBooking,
    leadGeneration,
    shopping,
    contactUs,
    customerSupport,
    survey,
    other
  ];

  static MetaFlowCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MetaFlowCategory._(value));

  @override
  bool operator ==(other) => other is MetaFlowCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information on the event destination.
class WhatsAppBusinessAccountEventDestination {
  /// The ARN of the event destination.
  final String eventDestinationArn;

  /// The Amazon Resource Name (ARN) of an Identity and Access Management role
  /// that is able to import phone numbers and write events.
  final String? roleArn;

  WhatsAppBusinessAccountEventDestination({
    required this.eventDestinationArn,
    this.roleArn,
  });

  factory WhatsAppBusinessAccountEventDestination.fromJson(
      Map<String, dynamic> json) {
    return WhatsAppBusinessAccountEventDestination(
      eventDestinationArn: (json['eventDestinationArn'] as String?) ?? '',
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventDestinationArn = this.eventDestinationArn;
    final roleArn = this.roleArn;
    return {
      'eventDestinationArn': eventDestinationArn,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Defines the complete structure and content of a template in Meta's library.
class MetaLibraryTemplateDefinition {
  /// The body text of the template.
  final String? templateBody;

  /// Example parameter values for the template body, used to demonstrate how
  /// dynamic content appears in the template.
  final List<String>? templateBodyExampleParams;

  /// The buttons included in the template.
  final List<LibraryTemplateButtonList>? templateButtons;

  /// The category of the template (for example, UTILITY or MARKETING).
  final String? templateCategory;

  /// The header text of the template.
  final String? templateHeader;

  /// The ID of the template in Meta's library.
  final String? templateId;

  /// The industries the template is designed for.
  final List<String>? templateIndustry;

  /// The language code for the template (for example, en_US).
  final String? templateLanguage;

  /// The name of the template.
  final String? templateName;

  /// The topic or subject matter of the template.
  final String? templateTopic;

  /// The intended use case for the template.
  final String? templateUseCase;

  MetaLibraryTemplateDefinition({
    this.templateBody,
    this.templateBodyExampleParams,
    this.templateButtons,
    this.templateCategory,
    this.templateHeader,
    this.templateId,
    this.templateIndustry,
    this.templateLanguage,
    this.templateName,
    this.templateTopic,
    this.templateUseCase,
  });

  factory MetaLibraryTemplateDefinition.fromJson(Map<String, dynamic> json) {
    return MetaLibraryTemplateDefinition(
      templateBody: json['templateBody'] as String?,
      templateBodyExampleParams: (json['templateBodyExampleParams'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      templateButtons: (json['templateButtons'] as List?)
          ?.nonNulls
          .map((e) =>
              LibraryTemplateButtonList.fromJson(e as Map<String, dynamic>))
          .toList(),
      templateCategory: json['templateCategory'] as String?,
      templateHeader: json['templateHeader'] as String?,
      templateId: json['templateId'] as String?,
      templateIndustry: (json['templateIndustry'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      templateLanguage: json['templateLanguage'] as String?,
      templateName: json['templateName'] as String?,
      templateTopic: json['templateTopic'] as String?,
      templateUseCase: json['templateUseCase'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateBody = this.templateBody;
    final templateBodyExampleParams = this.templateBodyExampleParams;
    final templateButtons = this.templateButtons;
    final templateCategory = this.templateCategory;
    final templateHeader = this.templateHeader;
    final templateId = this.templateId;
    final templateIndustry = this.templateIndustry;
    final templateLanguage = this.templateLanguage;
    final templateName = this.templateName;
    final templateTopic = this.templateTopic;
    final templateUseCase = this.templateUseCase;
    return {
      if (templateBody != null) 'templateBody': templateBody,
      if (templateBodyExampleParams != null)
        'templateBodyExampleParams': templateBodyExampleParams,
      if (templateButtons != null) 'templateButtons': templateButtons,
      if (templateCategory != null) 'templateCategory': templateCategory,
      if (templateHeader != null) 'templateHeader': templateHeader,
      if (templateId != null) 'templateId': templateId,
      if (templateIndustry != null) 'templateIndustry': templateIndustry,
      if (templateLanguage != null) 'templateLanguage': templateLanguage,
      if (templateName != null) 'templateName': templateName,
      if (templateTopic != null) 'templateTopic': templateTopic,
      if (templateUseCase != null) 'templateUseCase': templateUseCase,
    };
  }
}

/// Defines a button in a template from Meta's library.
class LibraryTemplateButtonList {
  /// The type of one-time password for OTP buttons.
  final String? otpType;

  /// The phone number in E.164 format for CALL-type buttons.
  final String? phoneNumber;

  /// List of supported applications for this button type.
  final List<Map<String, String>>? supportedApps;

  /// The text displayed on the button (maximum 40 characters).
  final String? text;

  /// The type of button (for example, QUICK_REPLY, CALL, or URL).
  final String? type;

  /// The URL for URL-type buttons.
  final String? url;

  /// When true, indicates acceptance of zero-tap terms for the button.
  final bool? zeroTapTermsAccepted;

  LibraryTemplateButtonList({
    this.otpType,
    this.phoneNumber,
    this.supportedApps,
    this.text,
    this.type,
    this.url,
    this.zeroTapTermsAccepted,
  });

  factory LibraryTemplateButtonList.fromJson(Map<String, dynamic> json) {
    return LibraryTemplateButtonList(
      otpType: json['otpType'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      supportedApps: (json['supportedApps'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
      text: json['text'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
      zeroTapTermsAccepted: json['zeroTapTermsAccepted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final otpType = this.otpType;
    final phoneNumber = this.phoneNumber;
    final supportedApps = this.supportedApps;
    final text = this.text;
    final type = this.type;
    final url = this.url;
    final zeroTapTermsAccepted = this.zeroTapTermsAccepted;
    return {
      if (otpType != null) 'otpType': otpType,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (supportedApps != null) 'supportedApps': supportedApps,
      if (text != null) 'text': text,
      if (type != null) 'type': type,
      if (url != null) 'url': url,
      if (zeroTapTermsAccepted != null)
        'zeroTapTermsAccepted': zeroTapTermsAccepted,
    };
  }
}

/// Provides a summary of a WhatsApp message template's key attributes.
class TemplateSummary {
  /// The numeric ID assigned to the template by Meta.
  final String? metaTemplateId;

  /// The category of the template (for example, UTILITY or MARKETING).
  final String? templateCategory;

  /// The language code of the template (for example, en_US).
  final String? templateLanguage;

  /// The name of the template.
  final String? templateName;

  /// The quality score assigned to the template by Meta.
  final String? templateQualityScore;

  /// The current status of the template (for example, APPROVED, PENDING, or
  /// REJECTED).
  final String? templateStatus;

  TemplateSummary({
    this.metaTemplateId,
    this.templateCategory,
    this.templateLanguage,
    this.templateName,
    this.templateQualityScore,
    this.templateStatus,
  });

  factory TemplateSummary.fromJson(Map<String, dynamic> json) {
    return TemplateSummary(
      metaTemplateId: json['metaTemplateId'] as String?,
      templateCategory: json['templateCategory'] as String?,
      templateLanguage: json['templateLanguage'] as String?,
      templateName: json['templateName'] as String?,
      templateQualityScore: json['templateQualityScore'] as String?,
      templateStatus: json['templateStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metaTemplateId = this.metaTemplateId;
    final templateCategory = this.templateCategory;
    final templateLanguage = this.templateLanguage;
    final templateName = this.templateName;
    final templateQualityScore = this.templateQualityScore;
    final templateStatus = this.templateStatus;
    return {
      if (metaTemplateId != null) 'metaTemplateId': metaTemplateId,
      if (templateCategory != null) 'templateCategory': templateCategory,
      if (templateLanguage != null) 'templateLanguage': templateLanguage,
      if (templateName != null) 'templateName': templateName,
      if (templateQualityScore != null)
        'templateQualityScore': templateQualityScore,
      if (templateStatus != null) 'templateStatus': templateStatus,
    };
  }
}

/// Contains summary information about a WhatsApp Flow, including its ID, name,
/// status, and categories.
class MetaFlowSummary {
  /// The categories that classify the business purpose of the Flow.
  final List<MetaFlowCategory> flowCategories;

  /// The unique identifier of the Flow assigned by Meta.
  final String flowId;

  /// The name of the Flow.
  final String flowName;

  /// The lifecycle status of the Flow (DRAFT, PUBLISHED, DEPRECATED, BLOCKED, or
  /// THROTTLED).
  final String flowStatus;

  /// A list of validation errors from Meta, if any.
  final List<String> validationErrors;

  MetaFlowSummary({
    required this.flowCategories,
    required this.flowId,
    required this.flowName,
    required this.flowStatus,
    required this.validationErrors,
  });

  factory MetaFlowSummary.fromJson(Map<String, dynamic> json) {
    return MetaFlowSummary(
      flowCategories: ((json['flowCategories'] as List?) ?? const [])
          .nonNulls
          .map((e) => MetaFlowCategory.fromString((e as String)))
          .toList(),
      flowId: (json['flowId'] as String?) ?? '',
      flowName: (json['flowName'] as String?) ?? '',
      flowStatus: (json['flowStatus'] as String?) ?? '',
      validationErrors: ((json['validationErrors'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowCategories = this.flowCategories;
    final flowId = this.flowId;
    final flowName = this.flowName;
    final flowStatus = this.flowStatus;
    final validationErrors = this.validationErrors;
    return {
      'flowCategories': flowCategories.map((e) => e.value).toList(),
      'flowId': flowId,
      'flowName': flowName,
      'flowStatus': flowStatus,
      'validationErrors': validationErrors,
    };
  }
}

/// Represents a single asset file associated with a WhatsApp Flow, including a
/// presigned download URL.
class MetaFlowAsset {
  /// The type of asset. Currently the only supported value is FLOW_JSON.
  final String assetType;

  /// A presigned URL from Meta for downloading the asset. The URL expires after a
  /// short period.
  final String downloadUrl;

  /// The filename of the asset (for example, flow.json).
  final String name;

  MetaFlowAsset({
    required this.assetType,
    required this.downloadUrl,
    required this.name,
  });

  factory MetaFlowAsset.fromJson(Map<String, dynamic> json) {
    return MetaFlowAsset(
      assetType: (json['assetType'] as String?) ?? '',
      downloadUrl: (json['downloadUrl'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final assetType = this.assetType;
    final downloadUrl = this.downloadUrl;
    final name = this.name;
    return {
      'assetType': assetType,
      'downloadUrl': downloadUrl,
      'name': name,
    };
  }
}

/// Contains the preview URL for testing a WhatsApp Flow and its expiration
/// timestamp.
class MetaFlowPreviewInfo {
  /// The timestamp when the preview URL expires.
  final String expiresAt;

  /// The web URL for previewing the Flow. Can be shared with stakeholders for
  /// review.
  final String previewUrl;

  MetaFlowPreviewInfo({
    required this.expiresAt,
    required this.previewUrl,
  });

  factory MetaFlowPreviewInfo.fromJson(Map<String, dynamic> json) {
    return MetaFlowPreviewInfo(
      expiresAt: (json['expiresAt'] as String?) ?? '',
      previewUrl: (json['previewUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final expiresAt = this.expiresAt;
    final previewUrl = this.previewUrl;
    return {
      'expiresAt': expiresAt,
      'previewUrl': previewUrl,
    };
  }
}

/// Contains WhatsApp Business Account metadata associated with a Flow, as
/// returned by Meta.
class MetaFlowWhatsAppBusinessAccountInfo {
  /// The WhatsApp Business Account ID from Meta.
  final String id;

  /// The name of the WhatsApp Business Account.
  final String name;

  /// The currency code for the WhatsApp Business Account (for example, USD).
  final String? currency;

  /// The message template namespace for the WhatsApp Business Account.
  final String? messageTemplateNamespace;

  /// The timezone ID for the WhatsApp Business Account.
  final String? timezoneId;

  MetaFlowWhatsAppBusinessAccountInfo({
    required this.id,
    required this.name,
    this.currency,
    this.messageTemplateNamespace,
    this.timezoneId,
  });

  factory MetaFlowWhatsAppBusinessAccountInfo.fromJson(
      Map<String, dynamic> json) {
    return MetaFlowWhatsAppBusinessAccountInfo(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      currency: json['currency'] as String?,
      messageTemplateNamespace: json['messageTemplateNamespace'] as String?,
      timezoneId: json['timezoneId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final currency = this.currency;
    final messageTemplateNamespace = this.messageTemplateNamespace;
    final timezoneId = this.timezoneId;
    return {
      'id': id,
      'name': name,
      if (currency != null) 'currency': currency,
      if (messageTemplateNamespace != null)
        'messageTemplateNamespace': messageTemplateNamespace,
      if (timezoneId != null) 'timezoneId': timezoneId,
    };
  }
}

/// Contains the Meta application metadata associated with a WhatsApp Flow.
class MetaFlowApplicationInfo {
  /// The unique identifier of the Meta application.
  final String id;

  /// The name of the Meta application.
  final String name;

  /// The URL link for the Meta application.
  final String? link;

  MetaFlowApplicationInfo({
    required this.id,
    required this.name,
    this.link,
  });

  factory MetaFlowApplicationInfo.fromJson(Map<String, dynamic> json) {
    return MetaFlowApplicationInfo(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      link: json['link'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final link = this.link;
    return {
      'id': id,
      'name': name,
      if (link != null) 'link': link,
    };
  }
}

/// Contains the overall health status and per-entity breakdown for a WhatsApp
/// Flow.
class MetaFlowHealthStatus {
  /// The overall messaging availability status (for example, AVAILABLE, LIMITED,
  /// or BLOCKED).
  final String canSendMessage;

  /// A list of health status entities with per-entity availability information.
  final List<MetaFlowHealthEntity>? entities;

  MetaFlowHealthStatus({
    required this.canSendMessage,
    this.entities,
  });

  factory MetaFlowHealthStatus.fromJson(Map<String, dynamic> json) {
    return MetaFlowHealthStatus(
      canSendMessage: (json['canSendMessage'] as String?) ?? '',
      entities: (json['entities'] as List?)
          ?.nonNulls
          .map((e) => MetaFlowHealthEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final canSendMessage = this.canSendMessage;
    final entities = this.entities;
    return {
      'canSendMessage': canSendMessage,
      if (entities != null) 'entities': entities,
    };
  }
}

/// Represents a single entity in the health status check for a WhatsApp Flow.
class MetaFlowHealthEntity {
  /// The messaging availability status for this entity (for example, AVAILABLE,
  /// LIMITED, or BLOCKED).
  final String canSendMessage;

  /// The type of entity (for example, FLOW, WABA, BUSINESS, or APP).
  final String entityType;

  /// The unique identifier of the entity.
  final String id;

  MetaFlowHealthEntity({
    required this.canSendMessage,
    required this.entityType,
    required this.id,
  });

  factory MetaFlowHealthEntity.fromJson(Map<String, dynamic> json) {
    return MetaFlowHealthEntity(
      canSendMessage: (json['canSendMessage'] as String?) ?? '',
      entityType: (json['entityType'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final canSendMessage = this.canSendMessage;
    final entityType = this.entityType;
    final id = this.id;
    return {
      'canSendMessage': canSendMessage,
      'entityType': entityType,
      'id': id,
    };
  }
}

/// Represents a template from Meta's library with customization options.
class MetaLibraryTemplate {
  /// The name of the template in Meta's library.
  final String libraryTemplateName;

  /// The category of the template (for example, UTILITY or MARKETING).
  final String templateCategory;

  /// The language code for the template (for example, en_US).
  final String templateLanguage;

  /// The name to assign to the template.
  final String templateName;

  /// Body text customizations for the template.
  final LibraryTemplateBodyInputs? libraryTemplateBodyInputs;

  /// Button customizations for the template.
  final List<LibraryTemplateButtonInput>? libraryTemplateButtonInputs;

  MetaLibraryTemplate({
    required this.libraryTemplateName,
    required this.templateCategory,
    required this.templateLanguage,
    required this.templateName,
    this.libraryTemplateBodyInputs,
    this.libraryTemplateButtonInputs,
  });

  Map<String, dynamic> toJson() {
    final libraryTemplateName = this.libraryTemplateName;
    final templateCategory = this.templateCategory;
    final templateLanguage = this.templateLanguage;
    final templateName = this.templateName;
    final libraryTemplateBodyInputs = this.libraryTemplateBodyInputs;
    final libraryTemplateButtonInputs = this.libraryTemplateButtonInputs;
    return {
      'libraryTemplateName': libraryTemplateName,
      'templateCategory': templateCategory,
      'templateLanguage': templateLanguage,
      'templateName': templateName,
      if (libraryTemplateBodyInputs != null)
        'libraryTemplateBodyInputs': libraryTemplateBodyInputs,
      if (libraryTemplateButtonInputs != null)
        'libraryTemplateButtonInputs': libraryTemplateButtonInputs,
    };
  }
}

/// Configuration options for customizing the body content of a template from
/// Meta's library.
class LibraryTemplateBodyInputs {
  /// When true, includes a contact number in the template body.
  final bool? addContactNumber;

  /// When true, includes a "learn more" link in the template body.
  final bool? addLearnMoreLink;

  /// When true, includes security recommendations in the template body.
  final bool? addSecurityRecommendation;

  /// When true, includes a package tracking link in the template body.
  final bool? addTrackPackageLink;

  /// The number of minutes until a verification code or OTP expires.
  final int? codeExpirationMinutes;

  LibraryTemplateBodyInputs({
    this.addContactNumber,
    this.addLearnMoreLink,
    this.addSecurityRecommendation,
    this.addTrackPackageLink,
    this.codeExpirationMinutes,
  });

  Map<String, dynamic> toJson() {
    final addContactNumber = this.addContactNumber;
    final addLearnMoreLink = this.addLearnMoreLink;
    final addSecurityRecommendation = this.addSecurityRecommendation;
    final addTrackPackageLink = this.addTrackPackageLink;
    final codeExpirationMinutes = this.codeExpirationMinutes;
    return {
      if (addContactNumber != null) 'addContactNumber': addContactNumber,
      if (addLearnMoreLink != null) 'addLearnMoreLink': addLearnMoreLink,
      if (addSecurityRecommendation != null)
        'addSecurityRecommendation': addSecurityRecommendation,
      if (addTrackPackageLink != null)
        'addTrackPackageLink': addTrackPackageLink,
      if (codeExpirationMinutes != null)
        'codeExpirationMinutes': codeExpirationMinutes,
    };
  }
}

/// Configuration options for customizing buttons in a template from Meta's
/// library.
class LibraryTemplateButtonInput {
  /// The type of one-time password for OTP buttons.
  final String? otpType;

  /// The phone number in E.164 format for CALL-type buttons.
  final String? phoneNumber;

  /// List of supported applications for this button type.
  final List<Map<String, String>>? supportedApps;

  /// The type of button (for example, QUICK_REPLY, CALL, or URL).
  final String? type;

  /// The URL with dynamic parameters for URL-type buttons.
  final Map<String, String>? url;

  /// When true, indicates acceptance of zero-tap terms for the button.
  final bool? zeroTapTermsAccepted;

  LibraryTemplateButtonInput({
    this.otpType,
    this.phoneNumber,
    this.supportedApps,
    this.type,
    this.url,
    this.zeroTapTermsAccepted,
  });

  Map<String, dynamic> toJson() {
    final otpType = this.otpType;
    final phoneNumber = this.phoneNumber;
    final supportedApps = this.supportedApps;
    final type = this.type;
    final url = this.url;
    final zeroTapTermsAccepted = this.zeroTapTermsAccepted;
    return {
      if (otpType != null) 'otpType': otpType,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (supportedApps != null) 'supportedApps': supportedApps,
      if (type != null) 'type': type,
      if (url != null) 'url': url,
      if (zeroTapTermsAccepted != null)
        'zeroTapTermsAccepted': zeroTapTermsAccepted,
    };
  }
}

/// The details of a linked WhatsApp Business Account.
class LinkedWhatsAppBusinessAccountSummary {
  /// The ARN of the linked WhatsApp Business Account.
  final String arn;

  /// The event destinations for the linked WhatsApp Business Account.
  final List<WhatsAppBusinessAccountEventDestination> eventDestinations;

  /// The ID of the linked WhatsApp Business Account, formatted as
  /// <code>waba-01234567890123456789012345678901</code>.
  final String id;

  /// The date the WhatsApp Business Account was linked.
  final DateTime linkDate;

  /// The registration status of the linked WhatsApp Business Account.
  final RegistrationStatus registrationStatus;

  /// The WhatsApp Business Account ID provided by Meta.
  final String wabaId;

  /// The name of the linked WhatsApp Business Account.
  final String wabaName;

  /// The onboarding status for the Marketing Messages API. This value is fetched
  /// from Meta and indicates whether the WhatsApp Business Account is onboarded
  /// for Meta's Marketing Messages API.
  final String? marketingMessagesOnboardingStatus;

  LinkedWhatsAppBusinessAccountSummary({
    required this.arn,
    required this.eventDestinations,
    required this.id,
    required this.linkDate,
    required this.registrationStatus,
    required this.wabaId,
    required this.wabaName,
    this.marketingMessagesOnboardingStatus,
  });

  factory LinkedWhatsAppBusinessAccountSummary.fromJson(
      Map<String, dynamic> json) {
    return LinkedWhatsAppBusinessAccountSummary(
      arn: (json['arn'] as String?) ?? '',
      eventDestinations: ((json['eventDestinations'] as List?) ?? const [])
          .nonNulls
          .map((e) => WhatsAppBusinessAccountEventDestination.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as String?) ?? '',
      linkDate: nonNullableTimeStampFromJson(json['linkDate'] ?? 0),
      registrationStatus: RegistrationStatus.fromString(
          (json['registrationStatus'] as String?) ?? ''),
      wabaId: (json['wabaId'] as String?) ?? '',
      wabaName: (json['wabaName'] as String?) ?? '',
      marketingMessagesOnboardingStatus:
          json['marketingMessagesOnboardingStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final eventDestinations = this.eventDestinations;
    final id = this.id;
    final linkDate = this.linkDate;
    final registrationStatus = this.registrationStatus;
    final wabaId = this.wabaId;
    final wabaName = this.wabaName;
    final marketingMessagesOnboardingStatus =
        this.marketingMessagesOnboardingStatus;
    return {
      'arn': arn,
      'eventDestinations': eventDestinations,
      'id': id,
      'linkDate': unixTimestampToJson(linkDate),
      'registrationStatus': registrationStatus.value,
      'wabaId': wabaId,
      'wabaName': wabaName,
      if (marketingMessagesOnboardingStatus != null)
        'marketingMessagesOnboardingStatus': marketingMessagesOnboardingStatus,
    };
  }
}

class RegistrationStatus {
  static const complete = RegistrationStatus._('COMPLETE');
  static const incomplete = RegistrationStatus._('INCOMPLETE');

  final String value;

  const RegistrationStatus._(this.value);

  static const values = [complete, incomplete];

  static RegistrationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationStatus._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of your linked WhatsApp Business Account.
class LinkedWhatsAppBusinessAccount {
  /// The ARN of the linked WhatsApp Business Account.
  final String arn;

  /// The event destinations for the linked WhatsApp Business Account.
  final List<WhatsAppBusinessAccountEventDestination> eventDestinations;

  /// The ID of the linked WhatsApp Business Account, formatted as
  /// <code>waba-01234567890123456789012345678901</code>.
  final String id;

  /// The date the WhatsApp Business Account was linked.
  final DateTime linkDate;

  /// The phone numbers associated with the Linked WhatsApp Business Account.
  final List<WhatsAppPhoneNumberSummary> phoneNumbers;

  /// The registration status of the linked WhatsApp Business Account.
  final RegistrationStatus registrationStatus;

  /// The WhatsApp Business Account ID from meta.
  final String wabaId;

  /// The name of the linked WhatsApp Business Account.
  final String wabaName;

  /// The onboarding status for the Marketing Messages API. This value is fetched
  /// from Meta and indicates whether the WhatsApp Business Account is onboarded
  /// for Meta's Marketing Messages API.
  final String? marketingMessagesOnboardingStatus;

  LinkedWhatsAppBusinessAccount({
    required this.arn,
    required this.eventDestinations,
    required this.id,
    required this.linkDate,
    required this.phoneNumbers,
    required this.registrationStatus,
    required this.wabaId,
    required this.wabaName,
    this.marketingMessagesOnboardingStatus,
  });

  factory LinkedWhatsAppBusinessAccount.fromJson(Map<String, dynamic> json) {
    return LinkedWhatsAppBusinessAccount(
      arn: (json['arn'] as String?) ?? '',
      eventDestinations: ((json['eventDestinations'] as List?) ?? const [])
          .nonNulls
          .map((e) => WhatsAppBusinessAccountEventDestination.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as String?) ?? '',
      linkDate: nonNullableTimeStampFromJson(json['linkDate'] ?? 0),
      phoneNumbers: ((json['phoneNumbers'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              WhatsAppPhoneNumberSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      registrationStatus: RegistrationStatus.fromString(
          (json['registrationStatus'] as String?) ?? ''),
      wabaId: (json['wabaId'] as String?) ?? '',
      wabaName: (json['wabaName'] as String?) ?? '',
      marketingMessagesOnboardingStatus:
          json['marketingMessagesOnboardingStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final eventDestinations = this.eventDestinations;
    final id = this.id;
    final linkDate = this.linkDate;
    final phoneNumbers = this.phoneNumbers;
    final registrationStatus = this.registrationStatus;
    final wabaId = this.wabaId;
    final wabaName = this.wabaName;
    final marketingMessagesOnboardingStatus =
        this.marketingMessagesOnboardingStatus;
    return {
      'arn': arn,
      'eventDestinations': eventDestinations,
      'id': id,
      'linkDate': unixTimestampToJson(linkDate),
      'phoneNumbers': phoneNumbers,
      'registrationStatus': registrationStatus.value,
      'wabaId': wabaId,
      'wabaName': wabaName,
      if (marketingMessagesOnboardingStatus != null)
        'marketingMessagesOnboardingStatus': marketingMessagesOnboardingStatus,
    };
  }
}

/// The details of a linked phone number.
class WhatsAppPhoneNumberSummary {
  /// The full Amazon Resource Name (ARN) for the phone number.
  final String arn;

  /// The phone number that appears in the recipients display.
  final String displayPhoneNumber;

  /// The display name for this phone number.
  final String displayPhoneNumberName;

  /// The phone number ID from Meta.
  final String metaPhoneNumberId;

  /// The phone number associated with the Linked WhatsApp Business Account.
  final String phoneNumber;

  /// The phone number ID. Phone number identifiers are formatted as
  /// <code>phone-number-id-01234567890123456789012345678901</code>.
  final String phoneNumberId;

  /// The quality rating of the phone number. This is from Meta.
  final String qualityRating;

  /// The geographic region where the WhatsApp phone number's data is stored and
  /// processed.
  final String? dataLocalizationRegion;

  WhatsAppPhoneNumberSummary({
    required this.arn,
    required this.displayPhoneNumber,
    required this.displayPhoneNumberName,
    required this.metaPhoneNumberId,
    required this.phoneNumber,
    required this.phoneNumberId,
    required this.qualityRating,
    this.dataLocalizationRegion,
  });

  factory WhatsAppPhoneNumberSummary.fromJson(Map<String, dynamic> json) {
    return WhatsAppPhoneNumberSummary(
      arn: (json['arn'] as String?) ?? '',
      displayPhoneNumber: (json['displayPhoneNumber'] as String?) ?? '',
      displayPhoneNumberName: (json['displayPhoneNumberName'] as String?) ?? '',
      metaPhoneNumberId: (json['metaPhoneNumberId'] as String?) ?? '',
      phoneNumber: (json['phoneNumber'] as String?) ?? '',
      phoneNumberId: (json['phoneNumberId'] as String?) ?? '',
      qualityRating: (json['qualityRating'] as String?) ?? '',
      dataLocalizationRegion: json['dataLocalizationRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final displayPhoneNumber = this.displayPhoneNumber;
    final displayPhoneNumberName = this.displayPhoneNumberName;
    final metaPhoneNumberId = this.metaPhoneNumberId;
    final phoneNumber = this.phoneNumber;
    final phoneNumberId = this.phoneNumberId;
    final qualityRating = this.qualityRating;
    final dataLocalizationRegion = this.dataLocalizationRegion;
    return {
      'arn': arn,
      'displayPhoneNumber': displayPhoneNumber,
      'displayPhoneNumberName': displayPhoneNumberName,
      'metaPhoneNumberId': metaPhoneNumberId,
      'phoneNumber': phoneNumber,
      'phoneNumberId': phoneNumberId,
      'qualityRating': qualityRating,
      if (dataLocalizationRegion != null)
        'dataLocalizationRegion': dataLocalizationRegion,
    };
  }
}

/// Contains the results of WhatsAppSignupCallback.
class WhatsAppSignupCallbackResult {
  /// An Amazon Web Services access token generated by
  /// <code>WhatsAppSignupCallback</code> and used by
  /// <code>WhatsAppSetupFinalization</code>.
  final String? associateInProgressToken;

  /// A LinkedWhatsAppBusinessAccountIdMetaData object map containing the details
  /// of any WhatsAppBusiness accounts that have incomplete setup.
  final Map<String, LinkedWhatsAppBusinessAccountIdMetaData>?
      linkedAccountsWithIncompleteSetup;

  WhatsAppSignupCallbackResult({
    this.associateInProgressToken,
    this.linkedAccountsWithIncompleteSetup,
  });

  factory WhatsAppSignupCallbackResult.fromJson(Map<String, dynamic> json) {
    return WhatsAppSignupCallbackResult(
      associateInProgressToken: json['associateInProgressToken'] as String?,
      linkedAccountsWithIncompleteSetup:
          (json['linkedAccountsWithIncompleteSetup'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(
                  k,
                  LinkedWhatsAppBusinessAccountIdMetaData.fromJson(
                      e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final associateInProgressToken = this.associateInProgressToken;
    final linkedAccountsWithIncompleteSetup =
        this.linkedAccountsWithIncompleteSetup;
    return {
      if (associateInProgressToken != null)
        'associateInProgressToken': associateInProgressToken,
      if (linkedAccountsWithIncompleteSetup != null)
        'linkedAccountsWithIncompleteSetup': linkedAccountsWithIncompleteSetup,
    };
  }
}

/// Contains your WhatsApp registration status and details of any unregistered
/// WhatsApp phone number.
class LinkedWhatsAppBusinessAccountIdMetaData {
  /// The name of your account.
  final String? accountName;

  /// The registration status of the linked WhatsApp Business Account.
  final RegistrationStatus? registrationStatus;

  /// The details for unregistered WhatsApp phone numbers.
  final List<WhatsAppPhoneNumberDetail>? unregisteredWhatsAppPhoneNumbers;

  /// The Amazon Resource Name (ARN) of the WhatsApp Business Account ID.
  final String? wabaId;

  LinkedWhatsAppBusinessAccountIdMetaData({
    this.accountName,
    this.registrationStatus,
    this.unregisteredWhatsAppPhoneNumbers,
    this.wabaId,
  });

  factory LinkedWhatsAppBusinessAccountIdMetaData.fromJson(
      Map<String, dynamic> json) {
    return LinkedWhatsAppBusinessAccountIdMetaData(
      accountName: json['accountName'] as String?,
      registrationStatus: (json['registrationStatus'] as String?)
          ?.let(RegistrationStatus.fromString),
      unregisteredWhatsAppPhoneNumbers:
          (json['unregisteredWhatsAppPhoneNumbers'] as List?)
              ?.nonNulls
              .map((e) =>
                  WhatsAppPhoneNumberDetail.fromJson(e as Map<String, dynamic>))
              .toList(),
      wabaId: json['wabaId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountName = this.accountName;
    final registrationStatus = this.registrationStatus;
    final unregisteredWhatsAppPhoneNumbers =
        this.unregisteredWhatsAppPhoneNumbers;
    final wabaId = this.wabaId;
    return {
      if (accountName != null) 'accountName': accountName,
      if (registrationStatus != null)
        'registrationStatus': registrationStatus.value,
      if (unregisteredWhatsAppPhoneNumbers != null)
        'unregisteredWhatsAppPhoneNumbers': unregisteredWhatsAppPhoneNumbers,
      if (wabaId != null) 'wabaId': wabaId,
    };
  }
}

/// Contains the <code>accessToken</code> provided by Meta during signup.
class WhatsAppSignupCallback {
  /// The access token for your WhatsApp Business Account. The
  /// <code>accessToken</code> value is provided by Meta.
  final String accessToken;

  /// The URL where WhatsApp will send callback notifications for this account.
  final String? callbackUrl;

  WhatsAppSignupCallback({
    required this.accessToken,
    this.callbackUrl,
  });

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final callbackUrl = this.callbackUrl;
    return {
      'accessToken': accessToken,
      if (callbackUrl != null) 'callbackUrl': callbackUrl,
    };
  }
}

/// The details of linking a WhatsApp Business Account to your Amazon Web
/// Services account.
class WhatsAppSetupFinalization {
  /// An Amazon Web Services access token generated by
  /// <code>WhatsAppSignupCallback</code> and used by
  /// <code>WhatsAppSetupFinalization</code>.
  final String associateInProgressToken;

  /// An array of WabaPhoneNumberSetupFinalization objects containing the details
  /// of each phone number associated with the WhatsApp Business Account.
  final List<WabaPhoneNumberSetupFinalization> phoneNumbers;

  /// Used to add a new phone number to an existing WhatsApp Business Account.
  /// This field can't be used when the <code>waba</code> field is present.
  final String? phoneNumberParent;

  /// Used to create a new WhatsApp Business Account and add a phone number. This
  /// field can't be used when the <code>phoneNumberParent</code> field is
  /// present.
  final WabaSetupFinalization? waba;

  WhatsAppSetupFinalization({
    required this.associateInProgressToken,
    required this.phoneNumbers,
    this.phoneNumberParent,
    this.waba,
  });

  Map<String, dynamic> toJson() {
    final associateInProgressToken = this.associateInProgressToken;
    final phoneNumbers = this.phoneNumbers;
    final phoneNumberParent = this.phoneNumberParent;
    final waba = this.waba;
    return {
      'associateInProgressToken': associateInProgressToken,
      'phoneNumbers': phoneNumbers,
      if (phoneNumberParent != null) 'phoneNumberParent': phoneNumberParent,
      if (waba != null) 'waba': waba,
    };
  }
}

/// The registration details for a linked WhatsApp Business Account.
class WabaSetupFinalization {
  /// The event destinations for the linked WhatsApp Business Account.
  final List<WhatsAppBusinessAccountEventDestination>? eventDestinations;

  /// The ID of the linked WhatsApp Business Account, formatted as
  /// <code>waba-01234567890123456789012345678901</code>.
  final String? id;

  /// An array of key and value pair tags.
  final List<Tag>? tags;

  WabaSetupFinalization({
    this.eventDestinations,
    this.id,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final eventDestinations = this.eventDestinations;
    final id = this.id;
    final tags = this.tags;
    return {
      if (eventDestinations != null) 'eventDestinations': eventDestinations,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The tag for a resource.
class Tag {
  /// The tag key.
  final String key;

  /// The tag value.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['key'] as String?) ?? '',
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// The registration details for a linked phone number.
class WabaPhoneNumberSetupFinalization {
  /// The unique identifier of the originating phone number associated with the
  /// media. Phone number identifiers are formatted as
  /// <code>phone-number-id-01234567890123456789012345678901</code>. Use the <a
  /// href="https://docs.aws.amazon.com/social-messaging/latest/APIReference/API_GetLinkedWhatsAppBusinessAccount.html">GetLinkedWhatsAppBusinessAccount</a>
  /// API action to find a phone number's id.
  final String id;

  /// The PIN to use for two-step verification. To reset your PIN follow the
  /// directions in <a
  /// href="https://developers.facebook.com/docs/whatsapp/cloud-api/reference/two-step-verification/#updating-pin">Updating
  /// PIN</a> in the <i>WhatsApp Business Platform Cloud API Reference</i>.
  final String twoFactorPin;

  /// The two letter ISO region for the location of where Meta will store data.
  /// <p class="title"> <b>Asia–Pacific (APAC)</b>
  ///
  /// <ul>
  /// <li>
  /// Australia <b>AU</b>
  /// </li>
  /// <li>
  /// Indonesia <b>ID</b>
  /// </li>
  /// <li>
  /// India <b>IN</b>
  /// </li>
  /// <li>
  /// Japan <b>JP</b>
  /// </li>
  /// <li>
  /// Singapore <b>SG</b>
  /// </li>
  /// <li>
  /// South Korea <b>KR</b>
  /// </li>
  /// </ul> <p class="title"> <b>Europe</b>
  ///
  /// <ul>
  /// <li>
  /// Germany <b>DE</b>
  /// </li>
  /// <li>
  /// Switzerland <b>CH</b>
  /// </li>
  /// <li>
  /// United Kingdom <b>GB</b>
  /// </li>
  /// </ul> <p class="title"> <b>Latin America (LATAM)</b>
  ///
  /// <ul>
  /// <li>
  /// Brazil <b>BR</b>
  /// </li>
  /// </ul> <p class="title"> <b>Middle East and Africa (MEA)</b>
  ///
  /// <ul>
  /// <li>
  /// Bahrain <b>BH</b>
  /// </li>
  /// <li>
  /// South Africa <b>ZA</b>
  /// </li>
  /// <li>
  /// United Arab Emirates <b>AE</b>
  /// </li>
  /// </ul> <p class="title"> <b>North America (NORAM)</b>
  ///
  /// <ul>
  /// <li>
  /// Canada <b>CA</b>
  /// </li>
  /// </ul>
  final String? dataLocalizationRegion;

  /// An array of key and value pair tags.
  final List<Tag>? tags;

  WabaPhoneNumberSetupFinalization({
    required this.id,
    required this.twoFactorPin,
    this.dataLocalizationRegion,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final twoFactorPin = this.twoFactorPin;
    final dataLocalizationRegion = this.dataLocalizationRegion;
    final tags = this.tags;
    return {
      'id': id,
      'twoFactorPin': twoFactorPin,
      if (dataLocalizationRegion != null)
        'dataLocalizationRegion': dataLocalizationRegion,
      if (tags != null) 'tags': tags,
    };
  }
}

class AccessDeniedByMetaException extends _s.GenericAwsException {
  AccessDeniedByMetaException({String? type, String? message})
      : super(
            type: type, code: 'AccessDeniedByMetaException', message: message);
}

class DependencyException extends _s.GenericAwsException {
  DependencyException({String? type, String? message})
      : super(type: type, code: 'DependencyException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidParametersException extends _s.GenericAwsException {
  InvalidParametersException({String? type, String? message})
      : super(type: type, code: 'InvalidParametersException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottledRequestException extends _s.GenericAwsException {
  ThrottledRequestException({String? type, String? message})
      : super(type: type, code: 'ThrottledRequestException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedByMetaException': (type, message) =>
      AccessDeniedByMetaException(type: type, message: message),
  'DependencyException': (type, message) =>
      DependencyException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidParametersException': (type, message) =>
      InvalidParametersException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottledRequestException': (type, message) =>
      ThrottledRequestException(type: type, message: message),
};
