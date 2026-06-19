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

/// <b>AWS Partner Central API for Selling Reference Guide</b>
class PartnerCentralSelling {
  final _s.JsonProtocol _protocol;
  PartnerCentralSelling({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'partnercentral-selling',
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

  /// Creates a new context within an existing engagement. This action allows
  /// you to add contextual information such as customer projects or documents
  /// to an engagement, providing additional details that help facilitate
  /// collaboration between engagement members.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the engagement context request. This
  /// field takes a string value from a predefined list: <code>AWS</code> or
  /// <code>Sandbox</code>. The catalog determines which environment the
  /// engagement context is created in. Use <code>AWS</code> to create contexts
  /// in the production environment, and <code>Sandbox</code> for testing in
  /// secure, isolated environments.
  ///
  /// Parameter [engagementIdentifier] :
  /// The unique identifier of the <code>Engagement</code> for which the context
  /// is being created. This parameter ensures the context is associated with
  /// the correct engagement and provides the necessary linkage between the
  /// engagement and its contextual information.
  ///
  /// Parameter [type] :
  /// Specifies the type of context being created for the engagement. This field
  /// determines the structure and content of the context payload. Valid values
  /// include <code>CustomerProject</code> for customer project-related
  /// contexts. The type field ensures that the context is properly categorized
  /// and processed according to its intended purpose.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier provided by the client to ensure that
  /// the request is handled exactly once. This token helps prevent duplicate
  /// context creations and must not exceed sixty-four alphanumeric characters.
  /// Use a UUID or other unique string to ensure idempotency.
  Future<CreateEngagementContextResponse> createEngagementContext({
    required String catalog,
    required String engagementIdentifier,
    required EngagementContextPayload payload,
    required EngagementContextType type,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.CreateEngagementContext'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'EngagementIdentifier': engagementIdentifier,
        'Payload': payload,
        'Type': type.value,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateEngagementContextResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the currently set system settings, which include the IAM Role
  /// used for resource snapshot jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog in which the settings are defined. Acceptable values
  /// include <code>AWS</code> for production and <code>Sandbox</code> for
  /// testing environments.
  Future<GetSellingSystemSettingsResponse> getSellingSystemSettings({
    required String catalog,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.GetSellingSystemSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
      },
    );

    return GetSellingSystemSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which you want to
  /// retrieve tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.ListTagsForResource'
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

  /// Updates the currently set system settings, which include the IAM Role used
  /// for resource snapshot jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog in which the settings will be updated. Acceptable
  /// values include <code>AWS</code> for production and <code>Sandbox</code>
  /// for testing environments.
  ///
  /// Parameter [resourceSnapshotJobRoleIdentifier] :
  /// Specifies the ARN of the IAM Role used for resource snapshot job
  /// executions.
  Future<PutSellingSystemSettingsResponse> putSellingSystemSettings({
    required String catalog,
    String? resourceSnapshotJobRoleIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.PutSellingSystemSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (resourceSnapshotJobRoleIdentifier != null)
          'ResourceSnapshotJobRoleIdentifier':
              resourceSnapshotJobRoleIdentifier,
      },
    );

    return PutSellingSystemSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Assigns one or more tags (key-value pairs) to the specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.TagResource'
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

  /// Removes a tag or tags from a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the key-value pairs for the tag or tags you want to remove
  /// from the specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.UntagResource'
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

  /// Updates the context information for an existing engagement with new or
  /// modified data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the engagement context update
  /// request. This field takes a string value from a predefined list:
  /// <code>AWS</code> or <code>Sandbox</code>. The catalog determines which
  /// environment the engagement context is updated in.
  ///
  /// Parameter [contextIdentifier] :
  /// The unique identifier of the specific engagement context to be updated.
  /// This ensures that the correct context within the engagement is modified.
  ///
  /// Parameter [engagementIdentifier] :
  /// The unique identifier of the <code>Engagement</code> containing the
  /// context to be updated. This parameter ensures the context update is
  /// applied to the correct engagement.
  ///
  /// Parameter [engagementLastModifiedAt] :
  /// The timestamp when the engagement was last modified, used for optimistic
  /// concurrency control. This helps prevent conflicts when multiple users
  /// attempt to update the same engagement simultaneously.
  ///
  /// Parameter [payload] :
  /// Contains the updated contextual information for the engagement. The
  /// structure of this payload varies based on the context type specified in
  /// the Type field.
  ///
  /// Parameter [type] :
  /// Specifies the type of context being updated within the engagement. This
  /// field determines the structure and content of the context payload being
  /// modified.
  Future<UpdateEngagementContextResponse> updateEngagementContext({
    required String catalog,
    required String contextIdentifier,
    required String engagementIdentifier,
    required DateTime engagementLastModifiedAt,
    required UpdateEngagementContextPayload payload,
    required EngagementContextType type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.UpdateEngagementContext'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ContextIdentifier': contextIdentifier,
        'EngagementIdentifier': engagementIdentifier,
        'EngagementLastModifiedAt': iso8601ToJson(engagementLastModifiedAt),
        'Payload': payload,
        'Type': type.value,
      },
    );

    return UpdateEngagementContextResponse.fromJson(jsonResponse.body);
  }

  /// The <code>CreateEngagement</code> action allows you to create an
  /// <code>Engagement</code>, which serves as a collaborative space between
  /// different parties such as AWS Partners and AWS Sellers. This action
  /// automatically adds the caller's AWS account as an active member of the
  /// newly created <code>Engagement</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The <code>CreateEngagementRequest$Catalog</code> parameter specifies the
  /// catalog related to the engagement. Accepted values are <code>AWS</code>
  /// and <code>Sandbox</code>, which determine the environment in which the
  /// engagement is managed.
  ///
  /// Parameter [description] :
  /// Provides a description of the <code>Engagement</code>.
  ///
  /// Parameter [title] :
  /// Specifies the title of the <code>Engagement</code>.
  ///
  /// Parameter [clientToken] :
  /// The <code>CreateEngagementRequest$ClientToken</code> parameter specifies a
  /// unique, case-sensitive identifier to ensure that the request is handled
  /// exactly once. The value must not exceed sixty-four alphanumeric
  /// characters.
  ///
  /// Parameter [contexts] :
  /// The <code>Contexts</code> field is a required array of objects, with a
  /// maximum of 5 contexts allowed, specifying detailed information about
  /// customer projects associated with the Engagement. Each context object
  /// contains a <code>Type</code> field indicating the context type, which must
  /// be <code>CustomerProject</code> in this version, and a
  /// <code>Payload</code> field containing the <code>CustomerProject</code>
  /// details. The <code>CustomerProject</code> object is composed of two main
  /// components: <code>Customer</code> and <code>Project</code>. The
  /// <code>Customer</code> object includes information such as
  /// <code>CompanyName</code>, <code>WebsiteUrl</code>, <code>Industry</code>,
  /// and <code>CountryCode</code>, providing essential details about the
  /// customer. The <code>Project</code> object contains <code>Title</code>,
  /// <code>BusinessProblem</code>, and <code>TargetCompletionDate</code>,
  /// offering insights into the specific project associated with the customer.
  /// This structure allows comprehensive context to be included within the
  /// Engagement, facilitating effective collaboration between parties by
  /// providing relevant customer and project information.
  Future<CreateEngagementResponse> createEngagement({
    required String catalog,
    required String description,
    required String title,
    String? clientToken,
    List<EngagementContextDetails>? contexts,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.CreateEngagement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Description': description,
        'Title': title,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (contexts != null) 'Contexts': contexts,
      },
    );

    return CreateEngagementResponse.fromJson(jsonResponse.body);
  }

  /// Use this action to retrieve the engagement record for a given
  /// <code>EngagementIdentifier</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the engagement request. Valid values are
  /// <code>AWS</code> and <code>Sandbox</code>.
  ///
  /// Parameter [identifier] :
  /// Specifies the identifier of the Engagement record to retrieve.
  Future<GetEngagementResponse> getEngagement({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.GetEngagement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
      },
    );

    return GetEngagementResponse.fromJson(jsonResponse.body);
  }

  /// This action allows users to retrieve a list of Engagement records from
  /// Partner Central. This action can be used to manage and track various
  /// engagements across different stages of the partner selling process.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request.
  ///
  /// Parameter [contextTypes] :
  /// Filters engagements to include only those containing the specified context
  /// types, such as "CustomerProject" or "Lead". Use this to find engagements
  /// that have specific types of contextual information associated with them.
  ///
  /// Parameter [createdBy] :
  /// A list of AWS account IDs. When specified, the response includes
  /// engagements created by these accounts. This filter is useful for finding
  /// engagements created by specific team members.
  ///
  /// Parameter [engagementIdentifier] :
  /// An array of strings representing engagement identifiers to retrieve.
  ///
  /// Parameter [excludeContextTypes] :
  /// Filters engagements to exclude those containing the specified context
  /// types. Use this to find engagements that do not have certain types of
  /// contextual information, helping to narrow results based on context
  /// exclusion criteria.
  ///
  /// Parameter [excludeCreatedBy] :
  /// An array of strings representing AWS Account IDs. Use this to exclude
  /// engagements created by specific users.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. This value is returned from a
  /// previous call.
  Future<ListEngagementsResponse> listEngagements({
    required String catalog,
    List<EngagementContextType>? contextTypes,
    List<String>? createdBy,
    List<String>? engagementIdentifier,
    List<EngagementContextType>? excludeContextTypes,
    List<String>? excludeCreatedBy,
    int? maxResults,
    String? nextToken,
    EngagementSort? sort,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.ListEngagements'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (contextTypes != null)
          'ContextTypes': contextTypes.map((e) => e.value).toList(),
        if (createdBy != null) 'CreatedBy': createdBy,
        if (engagementIdentifier != null)
          'EngagementIdentifier': engagementIdentifier,
        if (excludeContextTypes != null)
          'ExcludeContextTypes':
              excludeContextTypes.map((e) => e.value).toList(),
        if (excludeCreatedBy != null) 'ExcludeCreatedBy': excludeCreatedBy,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sort != null) 'Sort': sort,
      },
    );

    return ListEngagementsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details of member partners in an Engagement. This operation
  /// can only be invoked by members of the Engagement. The
  /// <code>ListEngagementMembers</code> operation allows you to fetch
  /// information about the members of a specific Engagement. This action is
  /// restricted to members of the Engagement being queried.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog related to the request.
  ///
  /// Parameter [identifier] :
  /// Identifier of the Engagement record to retrieve members from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListEngagementMembersResponse> listEngagementMembers({
    required String catalog,
    required String identifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.ListEngagementMembers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEngagementMembersResponse.fromJson(jsonResponse.body);
  }

  /// This action starts the engagement by accepting an
  /// <code>EngagementInvitation</code>. The task is asynchronous and involves
  /// the following steps: accepting the invitation, creating an opportunity in
  /// the partner’s account from the AWS opportunity, and copying details for
  /// tracking. When completed, an <code>Opportunity Created</code> event is
  /// generated, indicating that the opportunity has been successfully created
  /// in the partner's account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the task. Use <code>AWS</code> for
  /// production engagements and <code>Sandbox</code> for testing scenarios.
  ///
  /// Parameter [identifier] :
  /// Specifies the unique identifier of the <code>EngagementInvitation</code>
  /// to be accepted. Providing the correct identifier helps ensure that the
  /// correct engagement is processed.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier provided by the client that helps to
  /// ensure the idempotency of the request. This can be a random or meaningful
  /// string but must be unique for each request.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign.
  Future<StartEngagementByAcceptingInvitationTaskResponse>
      startEngagementByAcceptingInvitationTask({
    required String catalog,
    required String identifier,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSPartnerCentralSelling.StartEngagementByAcceptingInvitationTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return StartEngagementByAcceptingInvitationTaskResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists all in-progress, completed, or failed
  /// StartEngagementByAcceptingInvitationTask tasks that were initiated by the
  /// caller's account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// AWS: Retrieves the request from the production AWS environment.
  /// </li>
  /// <li>
  /// Sandbox: Retrieves the request from a sandbox environment used for testing
  /// or development purposes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [engagementInvitationIdentifier] :
  /// Filters tasks by the identifiers of the engagement invitations they are
  /// processing.
  ///
  /// Parameter [maxResults] :
  /// Use this parameter to control the number of items returned in each
  /// request, which can be useful for performance tuning and managing large
  /// result sets.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter for pagination when the result set spans multiple
  /// pages. This value is obtained from the NextToken field in the response of
  /// a previous call to this API.
  ///
  /// Parameter [opportunityIdentifier] :
  /// Filters tasks by the identifiers of the opportunities they created or are
  /// associated with.
  ///
  /// Parameter [sort] :
  /// Specifies the sorting criteria for the returned results. This allows you
  /// to order the tasks based on specific attributes.
  ///
  /// Parameter [taskIdentifier] :
  /// Filters tasks by their unique identifiers. Use this when you want to
  /// retrieve information about specific tasks.
  ///
  /// Parameter [taskStatus] :
  /// Filters the tasks based on their current status. This allows you to focus
  /// on tasks in specific states.
  Future<ListEngagementByAcceptingInvitationTasksResponse>
      listEngagementByAcceptingInvitationTasks({
    required String catalog,
    List<String>? engagementInvitationIdentifier,
    int? maxResults,
    String? nextToken,
    List<String>? opportunityIdentifier,
    ListTasksSortBase? sort,
    List<String>? taskIdentifier,
    List<TaskStatus>? taskStatus,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSPartnerCentralSelling.ListEngagementByAcceptingInvitationTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (engagementInvitationIdentifier != null)
          'EngagementInvitationIdentifier': engagementInvitationIdentifier,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (opportunityIdentifier != null)
          'OpportunityIdentifier': opportunityIdentifier,
        if (sort != null) 'Sort': sort,
        if (taskIdentifier != null) 'TaskIdentifier': taskIdentifier,
        if (taskStatus != null)
          'TaskStatus': taskStatus.map((e) => e.value).toList(),
      },
    );

    return ListEngagementByAcceptingInvitationTasksResponse.fromJson(
        jsonResponse.body);
  }

  /// Similar to <code>StartEngagementByAcceptingInvitationTask</code>, this
  /// action is asynchronous and performs multiple steps before completion. This
  /// action orchestrates a comprehensive workflow that combines multiple API
  /// operations into a single task to create and initiate an engagement from an
  /// existing opportunity. It automatically executes a sequence of operations
  /// including <code>GetOpportunity</code>, <code>CreateEngagement</code> (if
  /// it doesn't exist), <code>CreateResourceSnapshot</code>,
  /// <code>CreateResourceSnapshotJob</code>,
  /// <code>CreateEngagementInvitation</code> (if not already invited/accepted),
  /// and <code>SubmitOpportunity</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog in which the engagement is tracked. Acceptable
  /// values include <code>AWS</code> for production and <code>Sandbox</code>
  /// for testing environments.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the opportunity from which the engagement task is
  /// to be initiated. This helps ensure that the task is applied to the correct
  /// opportunity.
  ///
  /// Parameter [clientToken] :
  /// A unique token provided by the client to help ensure the idempotency of
  /// the request. It helps prevent the same task from being performed multiple
  /// times.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign.
  Future<StartEngagementFromOpportunityTaskResponse>
      startEngagementFromOpportunityTask({
    required AwsSubmission awsSubmission,
    required String catalog,
    required String identifier,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSPartnerCentralSelling.StartEngagementFromOpportunityTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AwsSubmission': awsSubmission,
        'Catalog': catalog,
        'Identifier': identifier,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return StartEngagementFromOpportunityTaskResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists all in-progress, completed, or failed
  /// <code>EngagementFromOpportunity</code> tasks that were initiated by the
  /// caller's account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// AWS: Retrieves the request from the production AWS environment.
  /// </li>
  /// <li>
  /// Sandbox: Retrieves the request from a sandbox environment used for testing
  /// or development purposes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [engagementIdentifier] :
  /// Filters tasks by the identifiers of the engagements they created or are
  /// associated with.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results to return in a single page of the
  /// response.Use this parameter to control the number of items returned in
  /// each request, which can be useful for performance tuning and managing
  /// large result sets.
  ///
  /// Parameter [nextToken] :
  /// The token for requesting the next page of results. This value is obtained
  /// from the NextToken field in the response of a previous call to this API.
  /// Use this parameter for pagination when the result set spans multiple
  /// pages.
  ///
  /// Parameter [opportunityIdentifier] :
  /// The identifier of the original opportunity associated with this task.
  ///
  /// Parameter [sort] :
  /// Specifies the sorting criteria for the returned results. This allows you
  /// to order the tasks based on specific attributes.
  ///
  /// Parameter [taskIdentifier] :
  /// Filters tasks by their unique identifiers. Use this when you want to
  /// retrieve information about specific tasks.
  ///
  /// Parameter [taskStatus] :
  /// Filters the tasks based on their current status. This allows you to focus
  /// on tasks in specific states.
  Future<ListEngagementFromOpportunityTasksResponse>
      listEngagementFromOpportunityTasks({
    required String catalog,
    List<String>? engagementIdentifier,
    int? maxResults,
    String? nextToken,
    List<String>? opportunityIdentifier,
    ListTasksSortBase? sort,
    List<String>? taskIdentifier,
    List<TaskStatus>? taskStatus,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSPartnerCentralSelling.ListEngagementFromOpportunityTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (engagementIdentifier != null)
          'EngagementIdentifier': engagementIdentifier,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (opportunityIdentifier != null)
          'OpportunityIdentifier': opportunityIdentifier,
        if (sort != null) 'Sort': sort,
        if (taskIdentifier != null) 'TaskIdentifier': taskIdentifier,
        if (taskStatus != null)
          'TaskStatus': taskStatus.map((e) => e.value).toList(),
      },
    );

    return ListEngagementFromOpportunityTasksResponse.fromJson(
        jsonResponse.body);
  }

  /// This action creates an invitation from a sender to a single receiver to
  /// join an engagement.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the engagement. Accepted values are
  /// <code>AWS</code> and <code>Sandbox</code>, which determine the environment
  /// in which the engagement is managed.
  ///
  /// Parameter [engagementIdentifier] :
  /// The unique identifier of the <code>Engagement</code> associated with the
  /// invitation. This parameter ensures the invitation is created within the
  /// correct <code>Engagement</code> context.
  ///
  /// Parameter [invitation] :
  /// The <code>Invitation</code> object all information necessary to initiate
  /// an engagement invitation to a partner. It contains a personalized message
  /// from the sender, the invitation's receiver, and a payload. The
  /// <code>Payload</code> can be the <code>OpportunityInvitation</code>, which
  /// includes detailed structures for sender contacts, partner
  /// responsibilities, customer information, and project details, or
  /// <code>LeadInvitation</code>, which includes structures for customer
  /// information and interaction details.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, client-generated UUID to ensure that the request is
  /// handled exactly once. This token helps prevent duplicate invitation
  /// creations.
  Future<CreateEngagementInvitationResponse> createEngagementInvitation({
    required String catalog,
    required String engagementIdentifier,
    required Invitation invitation,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.CreateEngagementInvitation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'EngagementIdentifier': engagementIdentifier,
        'Invitation': invitation,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateEngagementInvitationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details of an engagement invitation shared by AWS with a
  /// partner. The information includes aspects such as customer, project
  /// details, and lifecycle information. To connect an engagement invitation
  /// with an opportunity, match the invitation’s
  /// <code>Payload.Project.Title</code> with opportunity
  /// <code>Project.Title</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the request. The field accepts
  /// values from the predefined set: <code>AWS</code> for live operations or
  /// <code>Sandbox</code> for testing environments.
  ///
  /// Parameter [identifier] :
  /// Specifies the unique identifier for the retrieved engagement invitation.
  Future<GetEngagementInvitationResponse> getEngagementInvitation({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.GetEngagementInvitation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
      },
    );

    return GetEngagementInvitationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of engagement invitations sent to the partner. This
  /// allows partners to view all pending or past engagement invitations,
  /// helping them track opportunities shared by AWS.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog from which to list the engagement invitations. Use
  /// <code>AWS</code> for production invitations or <code>Sandbox</code> for
  /// testing environments.
  ///
  /// Parameter [participantType] :
  /// Specifies the type of participant for which to list engagement
  /// invitations. Identifies the role of the participant.
  ///
  /// Parameter [engagementIdentifier] :
  /// Retrieves a list of engagement invitation summaries based on specified
  /// filters. The ListEngagementInvitations operation allows you to view all
  /// invitations that you have sent or received. You must specify the
  /// ParticipantType to filter invitations where you are either the SENDER or
  /// the RECEIVER. Invitations will automatically expire if not accepted within
  /// 15 days.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of engagement invitations to return in the
  /// response. If more results are available, a pagination token will be
  /// provided.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used to retrieve additional pages of results when the
  /// response to a previous request was truncated. Pass this token to continue
  /// listing invitations from where the previous call left off.
  ///
  /// Parameter [payloadType] :
  /// Defines the type of payload associated with the engagement invitations to
  /// be listed. The attributes in this payload help decide on acceptance or
  /// rejection of the invitation.
  ///
  /// Parameter [senderAwsAccountId] :
  /// List of sender AWS account IDs to filter the invitations.
  ///
  /// Parameter [sort] :
  /// Specifies the sorting options for listing engagement invitations.
  /// Invitations can be sorted by fields such as <code>InvitationDate</code> or
  /// <code>Status</code> to help partners view results in their preferred
  /// order.
  ///
  /// Parameter [status] :
  /// Status values to filter the invitations.
  Future<ListEngagementInvitationsResponse> listEngagementInvitations({
    required String catalog,
    required ParticipantType participantType,
    List<String>? engagementIdentifier,
    int? maxResults,
    String? nextToken,
    List<EngagementInvitationPayloadType>? payloadType,
    List<String>? senderAwsAccountId,
    OpportunityEngagementInvitationSort? sort,
    List<InvitationStatus>? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.ListEngagementInvitations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ParticipantType': participantType.value,
        if (engagementIdentifier != null)
          'EngagementIdentifier': engagementIdentifier,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (payloadType != null)
          'PayloadType': payloadType.map((e) => e.value).toList(),
        if (senderAwsAccountId != null)
          'SenderAwsAccountId': senderAwsAccountId,
        if (sort != null) 'Sort': sort,
        if (status != null) 'Status': status.map((e) => e.value).toList(),
      },
    );

    return ListEngagementInvitationsResponse.fromJson(jsonResponse.body);
  }

  /// Use the <code>AcceptEngagementInvitation</code> action to accept an
  /// engagement invitation shared by AWS. Accepting the invitation indicates
  /// your willingness to participate in the engagement, granting you access to
  /// all engagement-related data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The <code>CatalogType</code> parameter specifies the catalog associated
  /// with the engagement invitation. Accepted values are <code>AWS</code> and
  /// <code>Sandbox</code>, which determine the environment in which the
  /// engagement invitation is managed.
  ///
  /// Parameter [identifier] :
  /// The <code>Identifier</code> parameter in the
  /// <code>AcceptEngagementInvitationRequest</code> specifies the unique
  /// identifier of the <code>EngagementInvitation</code> to be accepted.
  /// Providing the correct identifier ensures that the intended invitation is
  /// accepted.
  Future<void> acceptEngagementInvitation({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.AcceptEngagementInvitation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
      },
    );
  }

  /// This action rejects an <code>EngagementInvitation</code> that AWS shared.
  /// Rejecting an invitation indicates that the partner doesn't want to pursue
  /// the opportunity, and all related data will become inaccessible thereafter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// This is the catalog that's associated with the engagement invitation.
  /// Acceptable values are <code>AWS</code> or <code>Sandbox</code>, and these
  /// values determine the environment in which the opportunity is managed.
  ///
  /// Parameter [identifier] :
  /// This is the unique identifier of the rejected
  /// <code>EngagementInvitation</code>. Providing the correct identifier helps
  /// to ensure that the intended invitation is rejected.
  ///
  /// Parameter [rejectionReason] :
  /// This describes the reason for rejecting the engagement invitation, which
  /// helps AWS track usage patterns. Acceptable values include the following:
  ///
  /// <ul>
  /// <li>
  /// <i>Customer problem unclear:</i> The customer's problem isn't understood.
  /// </li>
  /// <li>
  /// <i>Next steps unclear:</i> The next steps required to proceed aren't
  /// understood.
  /// </li>
  /// <li>
  /// <i>Unable to support:</i> The partner is unable to provide support due to
  /// resource or capability constraints.
  /// </li>
  /// <li>
  /// <i>Duplicate of partner referral:</i> The opportunity is a duplicate of an
  /// existing referral.
  /// </li>
  /// <li>
  /// <i>Other:</i> Any reason not covered by other values.
  /// </li>
  /// </ul>
  Future<void> rejectEngagementInvitation({
    required String catalog,
    required String identifier,
    String? rejectionReason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.RejectEngagementInvitation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
        if (rejectionReason != null) 'RejectionReason': rejectionReason,
      },
    );
  }

  /// Creates an <code>Opportunity</code> record in Partner Central. Use this
  /// operation to create a potential business opportunity for submission to
  /// Amazon Web Services. Creating an opportunity sets
  /// <code>Lifecycle.ReviewStatus</code> to <code>Pending Submission</code>.
  ///
  /// To submit an opportunity, follow these steps:
  /// <ol>
  /// <li>
  /// To create the opportunity, use <code>CreateOpportunity</code>.
  /// </li>
  /// <li>
  /// To associate a solution with the opportunity, use
  /// <code>AssociateOpportunity</code>.
  /// </li>
  /// <li>
  /// To start the engagement with AWS, use
  /// <code>StartEngagementFromOpportunity</code>.
  /// </li> </ol>
  /// After submission, you can't edit the opportunity until the review is
  /// complete. But opportunities in the <code>Pending Submission</code> state
  /// must have complete details. You can update the opportunity while it's in
  /// the <code>Pending Submission</code> state.
  ///
  /// There's a set of mandatory fields to create opportunities, but consider
  /// providing optional fields to enrich the opportunity record.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the request. This field takes a
  /// string value from a predefined list: <code>AWS</code> or
  /// <code>Sandbox</code>. The catalog determines which environment the
  /// opportunity is created in. Use <code>AWS</code> to create opportunities in
  /// the Amazon Web Services catalog, and <code>Sandbox</code> for testing in
  /// secure, isolated environments.
  ///
  /// Parameter [clientToken] :
  /// Required to be unique, and should be unchanging, it can be randomly
  /// generated or a meaningful string.
  ///
  /// Default: None
  ///
  /// Best practice: To help ensure uniqueness and avoid conflicts, use a
  /// Universally Unique Identifier (UUID) as the <code>ClientToken</code>. You
  /// can use standard libraries from most programming languages to generate
  /// this. If you use the same client token, the API returns the following
  /// error: "Conflicting client token submitted for a new request body."
  ///
  /// Parameter [customer] :
  /// Specifies customer details associated with the <code>Opportunity</code>.
  ///
  /// Parameter [lifeCycle] :
  /// An object that contains lifecycle details for the
  /// <code>Opportunity</code>.
  ///
  /// Parameter [marketing] :
  /// This object contains marketing details and is optional for an opportunity.
  ///
  /// Parameter [nationalSecurity] :
  /// Indicates whether the <code>Opportunity</code> pertains to a national
  /// security project. This field must be set to <code>true</code> only when
  /// the customer's industry is <i>Government</i>. Additional privacy and
  /// security measures apply during the review and management process for
  /// opportunities marked as <code>NationalSecurity</code>.
  ///
  /// Parameter [opportunityTeam] :
  /// Represents the internal team handling the opportunity. Specify
  /// collaborating members of this opportunity who are within the partner's
  /// organization.
  ///
  /// Parameter [opportunityType] :
  /// Specifies the opportunity type as a renewal, new, or expansion.
  ///
  /// Opportunity types:
  ///
  /// <ul>
  /// <li>
  /// New opportunity: Represents a new business opportunity with a potential
  /// customer that's not previously engaged with your solutions or services.
  /// </li>
  /// <li>
  /// Renewal opportunity: Represents an opportunity to renew an existing
  /// contract or subscription with a current customer, ensuring continuity of
  /// service.
  /// </li>
  /// <li>
  /// Expansion opportunity: Represents an opportunity to expand the scope of an
  /// existing contract or subscription, either by adding new services or
  /// increasing the volume of existing services for a current customer.
  /// </li>
  /// </ul>
  ///
  /// Parameter [origin] :
  /// Specifies the origin of the opportunity, indicating if it was sourced from
  /// Amazon Web Services or the partner. For all opportunities created with
  /// <code>Catalog: AWS</code>, this field must only be <code>Partner
  /// Referral</code>. However, when using <code>Catalog: Sandbox</code>, you
  /// can set this field to <code>AWS Referral</code> to simulate Amazon Web
  /// Services referral creation. This allows Amazon Web Services-originated
  /// flows testing in the sandbox catalog.
  ///
  /// Parameter [partnerOpportunityIdentifier] :
  /// Specifies the opportunity's unique identifier in the partner's CRM system.
  /// This value is essential to track and reconcile because it's included in
  /// the outbound payload to the partner.
  ///
  /// This field allows partners to link an opportunity to their CRM, which
  /// helps to ensure seamless integration and accurate synchronization between
  /// the Partner Central API and the partner's internal systems.
  ///
  /// Parameter [primaryNeedsFromAws] :
  /// Identifies the type of support the partner needs from Amazon Web Services.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// Cosell—Architectural Validation: Confirmation from Amazon Web Services
  /// that the partner's proposed solution architecture is aligned with Amazon
  /// Web Services best practices and poses minimal architectural risks.
  /// </li>
  /// <li>
  /// Cosell—Business Presentation: Request Amazon Web Services seller's
  /// participation in a joint customer presentation.
  /// </li>
  /// <li>
  /// Cosell—Competitive Information: Access to Amazon Web Services competitive
  /// resources and support for the partner's proposed solution.
  /// </li>
  /// <li>
  /// Cosell—Pricing Assistance: Connect with an Amazon Web Services seller for
  /// support situations where a partner may be receiving an upfront discount on
  /// a service (for example: EDP deals).
  /// </li>
  /// <li>
  /// Cosell—Technical Consultation: Connect with an Amazon Web Services
  /// Solutions Architect to address the partner's questions about the proposed
  /// solution.
  /// </li>
  /// <li>
  /// Cosell—Total Cost of Ownership Evaluation: Assistance with quoting
  /// different cost savings of proposed solutions on Amazon Web Services versus
  /// on-premises or a traditional hosting environment.
  /// </li>
  /// <li>
  /// Cosell—Deal Support: Request Amazon Web Services seller's support to
  /// progress the opportunity (for example: joint customer call, strategic
  /// positioning).
  /// </li>
  /// <li>
  /// Cosell—Support for Public Tender/RFx: Opportunity related to the public
  /// sector where the partner needs Amazon Web Services RFx support.
  /// </li>
  /// </ul>
  ///
  /// Parameter [project] :
  /// An object that contains project details for the <code>Opportunity</code>.
  ///
  /// Parameter [softwareRevenue] :
  /// Specifies details of a customer's procurement terms. This is required only
  /// for partners in eligible programs.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign.
  Future<CreateOpportunityResponse> createOpportunity({
    required String catalog,
    String? clientToken,
    Customer? customer,
    LifeCycle? lifeCycle,
    Marketing? marketing,
    NationalSecurity? nationalSecurity,
    List<Contact>? opportunityTeam,
    OpportunityType? opportunityType,
    OpportunityOrigin? origin,
    String? partnerOpportunityIdentifier,
    List<PrimaryNeedFromAws>? primaryNeedsFromAws,
    Project? project,
    SoftwareRevenue? softwareRevenue,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.CreateOpportunity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (customer != null) 'Customer': customer,
        if (lifeCycle != null) 'LifeCycle': lifeCycle,
        if (marketing != null) 'Marketing': marketing,
        if (nationalSecurity != null)
          'NationalSecurity': nationalSecurity.value,
        if (opportunityTeam != null) 'OpportunityTeam': opportunityTeam,
        if (opportunityType != null) 'OpportunityType': opportunityType.value,
        if (origin != null) 'Origin': origin.value,
        if (partnerOpportunityIdentifier != null)
          'PartnerOpportunityIdentifier': partnerOpportunityIdentifier,
        if (primaryNeedsFromAws != null)
          'PrimaryNeedsFromAws':
              primaryNeedsFromAws.map((e) => e.value).toList(),
        if (project != null) 'Project': project,
        if (softwareRevenue != null) 'SoftwareRevenue': softwareRevenue,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateOpportunityResponse.fromJson(jsonResponse.body);
  }

  /// Fetches the <code>Opportunity</code> record from Partner Central by a
  /// given <code>Identifier</code>.
  ///
  /// Use the <code>ListOpportunities</code> action or the event notification
  /// (from Amazon EventBridge) to obtain this identifier.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the request. This field takes a
  /// string value from a predefined list: <code>AWS</code> or
  /// <code>Sandbox</code>. The catalog determines which environment the
  /// opportunity is fetched from. Use <code>AWS</code> to retrieve
  /// opportunities in the Amazon Web Services catalog, and <code>Sandbox</code>
  /// to retrieve opportunities in a secure, isolated testing environment.
  ///
  /// Parameter [identifier] :
  /// Read-only, system generated <code>Opportunity</code> unique identifier.
  Future<GetOpportunityResponse> getOpportunity({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.GetOpportunity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
      },
    );

    return GetOpportunityResponse.fromJson(jsonResponse.body);
  }

  /// Updates the <code>Opportunity</code> record identified by a given
  /// <code>Identifier</code>. This operation allows you to modify the details
  /// of an existing opportunity to reflect the latest information and progress.
  /// Use this action to keep the opportunity record up-to-date and accurate.
  ///
  /// When you perform updates, include the entire payload with each request. If
  /// any field is omitted, the API assumes that the field is set to
  /// <code>null</code>. The best practice is to always perform a
  /// <code>GetOpportunity</code> to retrieve the latest values, then send the
  /// complete payload with the updated values to be changed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the request. This field takes a
  /// string value from a predefined list: <code>AWS</code> or
  /// <code>Sandbox</code>. The catalog determines which environment the
  /// opportunity is updated in. Use <code>AWS</code> to update real
  /// opportunities in the production environment, and <code>Sandbox</code> for
  /// testing in secure, isolated environments. When you use the
  /// <code>Sandbox</code> catalog, it allows you to simulate and validate your
  /// interactions with Amazon Web Services services without affecting live data
  /// or operations.
  ///
  /// Parameter [identifier] :
  /// Read-only, system generated <code>Opportunity</code> unique identifier.
  ///
  /// Parameter [lastModifiedDate] :
  /// <code>DateTime</code> when the opportunity was last modified.
  ///
  /// Parameter [customer] :
  /// Specifies details of the customer associated with the
  /// <code>Opportunity</code>.
  ///
  /// Parameter [lifeCycle] :
  /// An object that contains lifecycle details for the
  /// <code>Opportunity</code>.
  ///
  /// Parameter [marketing] :
  /// An object that contains marketing details for the
  /// <code>Opportunity</code>.
  ///
  /// Parameter [nationalSecurity] :
  /// Specifies if the opportunity is associated with national security
  /// concerns. This flag is only applicable when the industry is
  /// <code>Government</code>. For national-security-related opportunities,
  /// validation and compliance rules may apply, impacting the opportunity's
  /// visibility and processing.
  ///
  /// Parameter [opportunityType] :
  /// Specifies the opportunity type as a renewal, new, or expansion.
  ///
  /// Opportunity types:
  ///
  /// <ul>
  /// <li>
  /// New opportunity: Represents a new business opportunity with a potential
  /// customer that's not previously engaged with your solutions or services.
  /// </li>
  /// <li>
  /// Renewal opportunity: Represents an opportunity to renew an existing
  /// contract or subscription with a current customer, ensuring continuity of
  /// service.
  /// </li>
  /// <li>
  /// Expansion opportunity: Represents an opportunity to expand the scope of an
  /// existing contract or subscription, either by adding new services or
  /// increasing the volume of existing services for a current customer.
  /// </li>
  /// </ul>
  ///
  /// Parameter [partnerOpportunityIdentifier] :
  /// Specifies the opportunity's unique identifier in the partner's CRM system.
  /// This value is essential to track and reconcile because it's included in
  /// the outbound payload sent back to the partner.
  ///
  /// Parameter [primaryNeedsFromAws] :
  /// Identifies the type of support the partner needs from Amazon Web Services.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// Cosell—Architectural Validation: Confirmation from Amazon Web Services
  /// that the partner's proposed solution architecture is aligned with Amazon
  /// Web Services best practices and poses minimal architectural risks.
  /// </li>
  /// <li>
  /// Cosell—Business Presentation: Request Amazon Web Services seller's
  /// participation in a joint customer presentation.
  /// </li>
  /// <li>
  /// Cosell—Competitive Information: Access to Amazon Web Services competitive
  /// resources and support for the partner's proposed solution.
  /// </li>
  /// <li>
  /// Cosell—Pricing Assistance: Connect with an AWS seller for support
  /// situations where a partner may be receiving an upfront discount on a
  /// service (for example: EDP deals).
  /// </li>
  /// <li>
  /// Cosell—Technical Consultation: Connection with an Amazon Web Services
  /// Solutions Architect to address the partner's questions about the proposed
  /// solution.
  /// </li>
  /// <li>
  /// Cosell—Total Cost of Ownership Evaluation: Assistance with quoting
  /// different cost savings of proposed solutions on Amazon Web Services versus
  /// on-premises or a traditional hosting environment.
  /// </li>
  /// <li>
  /// Cosell—Deal Support: Request Amazon Web Services seller's support to
  /// progress the opportunity (for example: joint customer call, strategic
  /// positioning).
  /// </li>
  /// <li>
  /// Cosell—Support for Public Tender/RFx: Opportunity related to the public
  /// sector where the partner needs RFx support from Amazon Web Services.
  /// </li>
  /// </ul>
  ///
  /// Parameter [project] :
  /// An object that contains project details summary for the
  /// <code>Opportunity</code>.
  ///
  /// Parameter [softwareRevenue] :
  /// Specifies details of a customer's procurement terms. Required only for
  /// partners in eligible programs.
  Future<UpdateOpportunityResponse> updateOpportunity({
    required String catalog,
    required String identifier,
    required DateTime lastModifiedDate,
    Customer? customer,
    LifeCycle? lifeCycle,
    Marketing? marketing,
    NationalSecurity? nationalSecurity,
    OpportunityType? opportunityType,
    String? partnerOpportunityIdentifier,
    List<PrimaryNeedFromAws>? primaryNeedsFromAws,
    Project? project,
    SoftwareRevenue? softwareRevenue,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.UpdateOpportunity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
        'LastModifiedDate': iso8601ToJson(lastModifiedDate),
        if (customer != null) 'Customer': customer,
        if (lifeCycle != null) 'LifeCycle': lifeCycle,
        if (marketing != null) 'Marketing': marketing,
        if (nationalSecurity != null)
          'NationalSecurity': nationalSecurity.value,
        if (opportunityType != null) 'OpportunityType': opportunityType.value,
        if (partnerOpportunityIdentifier != null)
          'PartnerOpportunityIdentifier': partnerOpportunityIdentifier,
        if (primaryNeedsFromAws != null)
          'PrimaryNeedsFromAws':
              primaryNeedsFromAws.map((e) => e.value).toList(),
        if (project != null) 'Project': project,
        if (softwareRevenue != null) 'SoftwareRevenue': softwareRevenue,
      },
    );

    return UpdateOpportunityResponse.fromJson(jsonResponse.body);
  }

  /// This request accepts a list of filters that retrieve opportunity subsets
  /// as well as sort options. This feature is available to partners from <a
  /// href="https://partnercentral.awspartner.com/">Partner Central</a> using
  /// the <code>ListOpportunities</code> API action.
  ///
  /// To synchronize your system with Amazon Web Services, list only the
  /// opportunities that were newly created or updated. We recommend you rely on
  /// events emitted by the service into your Amazon Web Services account’s
  /// Amazon EventBridge default event bus. You can also use the
  /// <code>ListOpportunities</code> action.
  ///
  /// We recommend the following approach:
  /// <ol>
  /// <li>
  /// Find the latest <code>LastModifiedDate</code> that you stored, and only
  /// use the values that came from Amazon Web Services. Don’t use values
  /// generated by your system.
  /// </li>
  /// <li>
  /// When you send a <code>ListOpportunities</code> request, submit the date in
  /// ISO 8601 format in the <code>AfterLastModifiedDate</code> filter.
  /// </li>
  /// <li>
  /// Amazon Web Services only returns opportunities created or updated on or
  /// after that date and time. Use <code>NextToken</code> to iterate over all
  /// pages.
  /// </li> </ol>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the request. This field takes a
  /// string value from a predefined list: <code>AWS</code> or
  /// <code>Sandbox</code>. The catalog determines which environment the
  /// opportunities are listed in. Use <code>AWS</code> for listing real
  /// opportunities in the Amazon Web Services catalog, and <code>Sandbox</code>
  /// for testing in secure, isolated environments.
  ///
  /// Parameter [createdDate] :
  /// Filter opportunities by creation date criteria.
  ///
  /// Parameter [customerCompanyName] :
  /// Filters the opportunities based on the customer's company name. This
  /// allows partners to search for opportunities associated with a specific
  /// customer by matching the provided company name string.
  ///
  /// Parameter [identifier] :
  /// Filters the opportunities based on the opportunity identifier. This allows
  /// partners to retrieve specific opportunities by providing their unique
  /// identifiers, ensuring precise results.
  ///
  /// Parameter [lastModifiedDate] :
  /// Filters the opportunities based on their last modified date. This filter
  /// helps retrieve opportunities that were updated after the specified date,
  /// allowing partners to track recent changes or updates.
  ///
  /// Parameter [lifeCycleReviewStatus] :
  /// Filters the opportunities based on their current lifecycle approval
  /// status. Use this filter to retrieve opportunities with statuses such as
  /// <code>Pending Submission</code>, <code>In Review</code>, <code>Action
  /// Required</code>, or <code>Approved</code>.
  ///
  /// Parameter [lifeCycleStage] :
  /// Filters the opportunities based on their lifecycle stage. This filter
  /// allows partners to retrieve opportunities at various stages in the sales
  /// cycle, such as <code>Qualified</code>, <code>Technical Validation</code>,
  /// <code>Business Validation</code>, or <code>Closed Won</code>.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results to return in a single call. This
  /// limits the number of opportunities returned in the response to avoid
  /// providing too many results at once.
  ///
  /// Default: 20
  ///
  /// Parameter [nextToken] :
  /// A pagination token used to retrieve the next set of results in subsequent
  /// calls. This token is included in the response only if there are additional
  /// result pages available.
  ///
  /// Parameter [sort] :
  /// An object that specifies how the response is sorted. The default
  /// <code>Sort.SortBy</code> value is <code>LastModifiedDate</code>.
  ///
  /// Parameter [targetCloseDate] :
  /// Filters opportunities based on their target close date. This filter helps
  /// retrieve opportunities with an expected close date before or after a
  /// specified date.
  Future<ListOpportunitiesResponse> listOpportunities({
    required String catalog,
    CreatedDateFilter? createdDate,
    List<String>? customerCompanyName,
    List<String>? identifier,
    LastModifiedDate? lastModifiedDate,
    List<ReviewStatus>? lifeCycleReviewStatus,
    List<Stage>? lifeCycleStage,
    int? maxResults,
    String? nextToken,
    OpportunitySort? sort,
    TargetCloseDateFilter? targetCloseDate,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.ListOpportunities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (createdDate != null) 'CreatedDate': createdDate,
        if (customerCompanyName != null)
          'CustomerCompanyName': customerCompanyName,
        if (identifier != null) 'Identifier': identifier,
        if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
        if (lifeCycleReviewStatus != null)
          'LifeCycleReviewStatus':
              lifeCycleReviewStatus.map((e) => e.value).toList(),
        if (lifeCycleStage != null)
          'LifeCycleStage': lifeCycleStage.map((e) => e.value).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sort != null) 'Sort': sort,
        if (targetCloseDate != null) 'TargetCloseDate': targetCloseDate,
      },
    );

    return ListOpportunitiesResponse.fromJson(jsonResponse.body);
  }

  /// Enables you to reassign an existing <code>Opportunity</code> to another
  /// user within your Partner Central account. The specified user receives the
  /// opportunity, and it appears on their Partner Central dashboard, allowing
  /// them to take necessary actions or proceed with the opportunity.
  ///
  /// This is useful for distributing opportunities to the appropriate team
  /// members or departments within your organization, ensuring that each
  /// opportunity is handled by the right person. By default, the opportunity
  /// owner is the one who creates it. Currently, there's no API to enumerate
  /// the list of available users.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assignee] :
  /// Specifies the user or team member responsible for managing the assigned
  /// opportunity. This field identifies the <i>Assignee</i> based on the
  /// partner's internal team structure. Ensure that the email address is
  /// associated with a registered user in your Partner Central account.
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the request. This field takes a
  /// string value from a predefined list: <code>AWS</code> or
  /// <code>Sandbox</code>. The catalog determines which environment the
  /// opportunity is assigned in. Use <code>AWS</code> to assign real
  /// opportunities in the Amazon Web Services catalog, and <code>Sandbox</code>
  /// for testing in secure, isolated environments.
  ///
  /// Parameter [identifier] :
  /// Requires the <code>Opportunity</code>'s unique identifier when you want to
  /// assign it to another user. Provide the correct identifier so the intended
  /// opportunity is reassigned.
  Future<void> assignOpportunity({
    required AssigneeContact assignee,
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.AssignOpportunity'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Assignee': assignee,
        'Catalog': catalog,
        'Identifier': identifier,
      },
    );
  }

  /// Enables you to create a formal association between an
  /// <code>Opportunity</code> and various related entities, enriching the
  /// context and details of the opportunity for better collaboration and
  /// decision making. You can associate an opportunity with the following
  /// entity types:
  ///
  /// <ul>
  /// <li>
  /// Partner Solution: A software product or consulting practice created and
  /// delivered by Partners. Partner Solutions help customers address business
  /// challenges using Amazon Web Services services.
  /// </li>
  /// <li>
  /// Amazon Web Services Products: Amazon Web Services offers many products and
  /// services that provide scalable, reliable, and cost-effective
  /// infrastructure solutions. For the latest list of Amazon Web Services
  /// products, see <a
  /// href="https://github.com/aws-samples/partner-crm-integration-samples/blob/main/resources/aws_products.json">Amazon
  /// Web Services products</a>.
  /// </li>
  /// <li>
  /// Amazon Web Services Marketplace private offer: Allows Amazon Web Services
  /// Marketplace sellers to extend custom pricing and terms to individual
  /// Amazon Web Services customers. Sellers can negotiate custom prices,
  /// payment schedules, and end user license terms through private offers,
  /// enabling Amazon Web Services customers to acquire software solutions
  /// tailored to their specific needs. For more information, see <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/buyerguide/buyer-private-offers.html">Private
  /// offers in Amazon Web Services Marketplace</a>.
  /// </li>
  /// </ul>
  /// To obtain identifiers for these entities, use the following methods:
  ///
  /// <ul>
  /// <li>
  /// Solution: Use the <code>ListSolutions</code> operation.
  /// </li>
  /// <li>
  /// AWS Products: For the latest list of Amazon Web Services products, see <a
  /// href="https://github.com/aws-samples/partner-crm-integration-samples/blob/main/resources/aws_products.json">Amazon
  /// Web Services products</a>.
  /// </li>
  /// <li>
  /// Amazon Web Services Marketplace private offer: Use the <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/APIReference/catalog-apis.html">Using
  /// the Amazon Web Services Marketplace Catalog API</a> to list entities.
  /// Specifically, use the <code>ListEntities</code> operation to retrieve a
  /// list of private offers. The request returns the details of available
  /// private offers. For more information, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/API_ListEntities.html">ListEntities</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the request. This field takes a
  /// string value from a predefined list: <code>AWS</code> or
  /// <code>Sandbox</code>. The catalog determines which environment the
  /// opportunity association is made in. Use <code>AWS</code> to associate
  /// opportunities in the Amazon Web Services catalog, and <code>Sandbox</code>
  /// for testing in secure, isolated environments.
  ///
  /// Parameter [opportunityIdentifier] :
  /// Requires the <code>Opportunity</code>'s unique identifier when you want to
  /// associate it with a related entity. Provide the correct identifier so the
  /// intended opportunity is updated with the association.
  ///
  /// Parameter [relatedEntityIdentifier] :
  /// Requires the related entity's unique identifier when you want to associate
  /// it with the <code> Opportunity</code>. For Amazon Web Services Marketplace
  /// entities, provide the Amazon Resource Name (ARN). Use the <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html">
  /// Amazon Web Services Marketplace API</a> to obtain the ARN.
  ///
  /// Parameter [relatedEntityType] :
  /// Specifies the entity type that you're associating with the <code>
  /// Opportunity</code>. This helps to categorize and properly process the
  /// association.
  Future<void> associateOpportunity({
    required String catalog,
    required String opportunityIdentifier,
    required String relatedEntityIdentifier,
    required RelatedEntityType relatedEntityType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.AssociateOpportunity'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'OpportunityIdentifier': opportunityIdentifier,
        'RelatedEntityIdentifier': relatedEntityIdentifier,
        'RelatedEntityType': relatedEntityType.value,
      },
    );
  }

  /// Allows you to remove an existing association between an
  /// <code>Opportunity</code> and related entities, such as a Partner Solution,
  /// Amazon Web Services product, or an Amazon Web Services Marketplace offer.
  /// This operation is the counterpart to <code>AssociateOpportunity</code>,
  /// and it provides flexibility to manage associations as business needs
  /// change.
  ///
  /// Use this operation to update the associations of an
  /// <code>Opportunity</code> due to changes in the related entities, or if an
  /// association was made in error. Ensuring accurate associations helps
  /// maintain clarity and accuracy to track and manage business opportunities.
  /// When you replace an entity, first attach the new entity and then
  /// disassociate the one to be removed, especially if it's the last remaining
  /// entity that's required.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the request. This field takes a
  /// string value from a predefined list: <code>AWS</code> or
  /// <code>Sandbox</code>. The catalog determines which environment the
  /// opportunity disassociation is made in. Use <code>AWS</code> to
  /// disassociate opportunities in the Amazon Web Services catalog, and
  /// <code>Sandbox</code> for testing in secure, isolated environments.
  ///
  /// Parameter [opportunityIdentifier] :
  /// The opportunity's unique identifier for when you want to disassociate it
  /// from related entities. This identifier helps to ensure that the correct
  /// opportunity is updated.
  ///
  /// Validation: Ensure that the provided identifier corresponds to an existing
  /// opportunity in the Amazon Web Services system because incorrect
  /// identifiers result in an error and no changes are made.
  ///
  /// Parameter [relatedEntityIdentifier] :
  /// The related entity's identifier that you want to disassociate from the
  /// opportunity. Depending on the type of entity, this could be a simple
  /// identifier or an Amazon Resource Name (ARN) for entities managed through
  /// Amazon Web Services Marketplace.
  ///
  /// For Amazon Web Services Marketplace entities, use the Amazon Web Services
  /// Marketplace API to obtain the necessary ARNs. For guidance on retrieving
  /// these ARNs, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html">
  /// Amazon Web Services MarketplaceUsing the Amazon Web Services Marketplace
  /// Catalog API</a>.
  ///
  /// Validation: Ensure the identifier or ARN is valid and corresponds to an
  /// existing entity. An incorrect or invalid identifier results in an error.
  ///
  /// Parameter [relatedEntityType] :
  /// The type of the entity that you're disassociating from the opportunity.
  /// When you specify the entity type, it helps the system correctly process
  /// the disassociation request to ensure that the right connections are
  /// removed.
  ///
  /// Examples of entity types include Partner Solution, Amazon Web Services
  /// product, and Amazon Web Services Marketplaceoffer. Ensure that the value
  /// matches one of the expected entity types.
  ///
  /// Validation: Provide a valid entity type to help ensure successful
  /// disassociation. An invalid or incorrect entity type results in an error.
  Future<void> disassociateOpportunity({
    required String catalog,
    required String opportunityIdentifier,
    required String relatedEntityIdentifier,
    required RelatedEntityType relatedEntityType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.DisassociateOpportunity'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'OpportunityIdentifier': opportunityIdentifier,
        'RelatedEntityIdentifier': relatedEntityIdentifier,
        'RelatedEntityType': relatedEntityType.value,
      },
    );
  }

  /// Retrieves a summary of an AWS Opportunity. This summary includes
  /// high-level details about the opportunity sourced from AWS, such as
  /// lifecycle information, customer details, and involvement type. It is
  /// useful for tracking updates on the AWS opportunity corresponding to an
  /// opportunity in the partner's account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog in which the AWS Opportunity is located. Accepted
  /// values include <code>AWS</code> for production opportunities or
  /// <code>Sandbox</code> for testing purposes. The catalog determines which
  /// environment the opportunity data is pulled from.
  ///
  /// Parameter [relatedOpportunityIdentifier] :
  /// The unique identifier for the related partner opportunity. Use this field
  /// to correlate an AWS opportunity with its corresponding partner
  /// opportunity.
  Future<GetAwsOpportunitySummaryResponse> getAwsOpportunitySummary({
    required String catalog,
    required String relatedOpportunityIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.GetAwsOpportunitySummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'RelatedOpportunityIdentifier': relatedOpportunityIdentifier,
      },
    );

    return GetAwsOpportunitySummaryResponse.fromJson(jsonResponse.body);
  }

  /// Use this action to submit an Opportunity that was previously created by
  /// partner for AWS review. After you perform this action, the Opportunity
  /// becomes non-editable until it is reviewed by AWS and has <code>
  /// LifeCycle.ReviewStatus </code> as either <code>Approved</code> or
  /// <code>Action Required</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// AWS: Submits the opportunity request from the production AWS environment.
  /// </li>
  /// <li>
  /// Sandbox: Submits the opportunity request from a sandbox environment used
  /// for testing or development purposes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [identifier] :
  /// The identifier of the Opportunity previously created by partner and needs
  /// to be submitted.
  ///
  /// Parameter [involvementType] :
  /// Specifies the level of AWS sellers' involvement on the opportunity. Valid
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>Co-sell</code>: Indicates the user wants to co-sell with AWS. Share
  /// the opportunity with AWS to receive deal assistance and support.
  /// </li>
  /// <li>
  /// <code>For Visibility Only</code>: Indicates that the user does not need
  /// support from AWS Sales Rep. Share this opportunity with AWS for visibility
  /// only, you will not receive deal assistance and support.
  /// </li>
  /// </ul>
  ///
  /// Parameter [visibility] :
  /// Determines whether to restrict visibility of the opportunity from AWS
  /// sales. Default value is Full. Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>Full</code>: The opportunity is fully visible to AWS sales.
  /// </li>
  /// <li>
  /// <code>Limited</code>: The opportunity has restricted visibility to AWS
  /// sales.
  /// </li>
  /// </ul>
  Future<void> submitOpportunity({
    required String catalog,
    required String identifier,
    required SalesInvolvementType involvementType,
    Visibility? visibility,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.SubmitOpportunity'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
        'InvolvementType': involvementType.value,
        if (visibility != null) 'Visibility': visibility.value,
      },
    );
  }

  /// This action creates an opportunity from an existing engagement context.
  /// The task is asynchronous and orchestrates the process of converting
  /// engagement contextual information into a structured opportunity record
  /// within the partner's account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog in which the opportunity creation task is executed.
  /// Acceptable values include <code>AWS</code> for production and
  /// <code>Sandbox</code> for testing environments.
  ///
  /// Parameter [contextIdentifier] :
  /// The unique identifier of the engagement context from which to create the
  /// opportunity. This specifies the specific contextual information within the
  /// engagement that will be used for opportunity creation.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the engagement from which the opportunity
  /// creation task is to be initiated. This helps ensure that the task is
  /// applied to the correct engagement.
  ///
  /// Parameter [clientToken] :
  /// A unique token provided by the client to help ensure the idempotency of
  /// the request. It helps prevent the same task from being performed multiple
  /// times.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign.
  Future<StartOpportunityFromEngagementTaskResponse>
      startOpportunityFromEngagementTask({
    required String catalog,
    required String contextIdentifier,
    required String identifier,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSPartnerCentralSelling.StartOpportunityFromEngagementTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ContextIdentifier': contextIdentifier,
        'Identifier': identifier,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return StartOpportunityFromEngagementTaskResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists all in-progress, completed, or failed opportunity creation tasks
  /// from engagements that were initiated by the caller's account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request. Valid values are
  /// <code>AWS</code> for production environments and <code>Sandbox</code> for
  /// testing or development purposes. The catalog determines which environment
  /// the task data is retrieved from.
  ///
  /// Parameter [contextIdentifier] :
  /// Filters tasks by the identifiers of the engagement contexts associated
  /// with the opportunity creation. Use this to find tasks related to specific
  /// contextual information within engagements that are being converted to
  /// opportunities.
  ///
  /// Parameter [engagementIdentifier] :
  /// Filters tasks by the identifiers of the engagements from which
  /// opportunities are being created. Use this to find all opportunity creation
  /// tasks associated with a specific engagement.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results to return in a single page of the
  /// response. Use this parameter to control the number of items returned in
  /// each request, which can be useful for performance tuning and managing
  /// large result sets.
  ///
  /// Parameter [nextToken] :
  /// The token for requesting the next page of results. This value is obtained
  /// from the NextToken field in the response of a previous call to this API.
  /// Use this parameter for pagination when the result set spans multiple
  /// pages.
  ///
  /// Parameter [opportunityIdentifier] :
  /// Filters tasks by the identifiers of the opportunities they created or are
  /// associated with. Use this to find tasks related to specific opportunity
  /// creation processes.
  ///
  /// Parameter [taskIdentifier] :
  /// Filters tasks by their unique identifiers. Use this when you want to
  /// retrieve information about specific tasks. Provide the task ID to get
  /// details about a particular opportunity creation task.
  ///
  /// Parameter [taskStatus] :
  /// Filters the tasks based on their current status. This allows you to focus
  /// on tasks in specific states. Valid values are <code>COMPLETE</code> for
  /// tasks that have finished successfully, <code>INPROGRESS</code> for tasks
  /// that are currently running, and <code>FAILED</code> for tasks that have
  /// encountered an error and failed to complete.
  Future<ListOpportunityFromEngagementTasksResponse>
      listOpportunityFromEngagementTasks({
    required String catalog,
    List<String>? contextIdentifier,
    List<String>? engagementIdentifier,
    int? maxResults,
    String? nextToken,
    List<String>? opportunityIdentifier,
    ListTasksSortBase? sort,
    List<String>? taskIdentifier,
    List<TaskStatus>? taskStatus,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSPartnerCentralSelling.ListOpportunityFromEngagementTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (contextIdentifier != null) 'ContextIdentifier': contextIdentifier,
        if (engagementIdentifier != null)
          'EngagementIdentifier': engagementIdentifier,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (opportunityIdentifier != null)
          'OpportunityIdentifier': opportunityIdentifier,
        if (sort != null) 'Sort': sort,
        if (taskIdentifier != null) 'TaskIdentifier': taskIdentifier,
        if (taskStatus != null)
          'TaskStatus': taskStatus.map((e) => e.value).toList(),
      },
    );

    return ListOpportunityFromEngagementTasksResponse.fromJson(
        jsonResponse.body);
  }

  /// This action allows you to create an immutable snapshot of a specific
  /// resource, such as an opportunity, within the context of an engagement. The
  /// snapshot captures a subset of the resource's data based on the schema
  /// defined by the provided template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog where the snapshot is created. Valid values are
  /// <code>AWS</code> and <code>Sandbox</code>.
  ///
  /// Parameter [engagementIdentifier] :
  /// The unique identifier of the engagement associated with this snapshot.
  /// This field links the snapshot to a specific engagement context.
  ///
  /// Parameter [resourceIdentifier] :
  /// The unique identifier of the specific resource to be snapshotted. The
  /// format and constraints of this identifier depend on the
  /// <code>ResourceType</code> specified. For example: For
  /// <code>Opportunity</code> type, it will be an opportunity ID.
  ///
  /// Parameter [resourceSnapshotTemplateIdentifier] :
  /// The name of the template that defines the schema for the snapshot. This
  /// template determines which subset of the resource data will be included in
  /// the snapshot. Must correspond to an existing and valid template for the
  /// specified <code>ResourceType</code>.
  ///
  /// Parameter [resourceType] :
  /// Specifies the type of resource for which the snapshot is being created.
  /// This field determines the structure and content of the snapshot. Must be
  /// one of the supported resource types, such as: <code>Opportunity</code>.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, client-generated UUID to ensure that the request is
  /// handled exactly once. This token helps prevent duplicate snapshot
  /// creations.
  Future<CreateResourceSnapshotResponse> createResourceSnapshot({
    required String catalog,
    required String engagementIdentifier,
    required String resourceIdentifier,
    required String resourceSnapshotTemplateIdentifier,
    required ResourceType resourceType,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.CreateResourceSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'EngagementIdentifier': engagementIdentifier,
        'ResourceIdentifier': resourceIdentifier,
        'ResourceSnapshotTemplateIdentifier':
            resourceSnapshotTemplateIdentifier,
        'ResourceType': resourceType.value,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateResourceSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Use this action to retrieve a specific snapshot record.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// AWS: Retrieves the snapshot from the production AWS environment.
  /// </li>
  /// <li>
  /// Sandbox: Retrieves the snapshot from a sandbox environment used for
  /// testing or development purposes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [engagementIdentifier] :
  /// The unique identifier of the engagement associated with the snapshot. This
  /// field links the snapshot to a specific engagement context.
  ///
  /// Parameter [resourceIdentifier] :
  /// The unique identifier of the specific resource that was snapshotted. The
  /// format and constraints of this identifier depend on the ResourceType
  /// specified. For <code>Opportunity</code> type, it will be an
  /// <code>opportunity ID</code>
  ///
  /// Parameter [resourceSnapshotTemplateIdentifier] :
  /// he name of the template that defines the schema for the snapshot. This
  /// template determines which subset of the resource data is included in the
  /// snapshot and must correspond to an existing and valid template for the
  /// specified <code>ResourceType</code>.
  ///
  /// Parameter [resourceType] :
  /// Specifies the type of resource that was snapshotted. This field determines
  /// the structure and content of the snapshot payload. Valid value
  /// includes:<code>Opportunity</code>: For opportunity-related data.
  ///
  /// Parameter [revision] :
  /// Specifies which revision of the snapshot to retrieve. If omitted returns
  /// the latest revision.
  Future<GetResourceSnapshotResponse> getResourceSnapshot({
    required String catalog,
    required String engagementIdentifier,
    required String resourceIdentifier,
    required String resourceSnapshotTemplateIdentifier,
    required ResourceType resourceType,
    int? revision,
  }) async {
    _s.validateNumRange(
      'revision',
      revision,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.GetResourceSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'EngagementIdentifier': engagementIdentifier,
        'ResourceIdentifier': resourceIdentifier,
        'ResourceSnapshotTemplateIdentifier':
            resourceSnapshotTemplateIdentifier,
        'ResourceType': resourceType.value,
        if (revision != null) 'Revision': revision,
      },
    );

    return GetResourceSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Lists the associations between resources and engagements where the caller
  /// is a member and has at least one snapshot in the engagement.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog in which to search for engagement-resource
  /// associations. Valid Values: "AWS" or "Sandbox"
  ///
  /// <ul>
  /// <li>
  /// <code>AWS</code> for production environments.
  /// </li>
  /// <li>
  /// <code>Sandbox</code> for testing and development purposes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [createdBy] :
  /// Filters the response to include only snapshots of resources owned by the
  /// specified AWS account ID. Use this when you want to find associations
  /// related to resources owned by a particular account.
  ///
  /// Parameter [engagementIdentifier] :
  /// Filters the results to include only associations related to the specified
  /// engagement. Use this when you want to find all resources associated with a
  /// specific engagement.
  ///
  /// Parameter [maxResults] :
  /// Limits the number of results returned in a single call. Use this to
  /// control the number of results returned, especially useful for pagination.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results. Include this token in subsequent
  /// requests to retrieve the next set of results.
  ///
  /// Parameter [resourceIdentifier] :
  /// Filters the results to include only associations with the specified
  /// resource. Varies depending on the resource type. Use this when you want to
  /// find all engagements associated with a specific resource.
  ///
  /// Parameter [resourceType] :
  /// Filters the results to include only associations with resources of the
  /// specified type.
  Future<ListEngagementResourceAssociationsResponse>
      listEngagementResourceAssociations({
    required String catalog,
    String? createdBy,
    String? engagementIdentifier,
    int? maxResults,
    String? nextToken,
    String? resourceIdentifier,
    ResourceType? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSPartnerCentralSelling.ListEngagementResourceAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (createdBy != null) 'CreatedBy': createdBy,
        if (engagementIdentifier != null)
          'EngagementIdentifier': engagementIdentifier,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceIdentifier != null)
          'ResourceIdentifier': resourceIdentifier,
        if (resourceType != null) 'ResourceType': resourceType.value,
      },
    );

    return ListEngagementResourceAssociationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves a list of resource view snapshots based on specified criteria.
  /// This operation supports various use cases, including:
  ///
  /// <ul>
  /// <li>
  /// Fetching all snapshots associated with an engagement.
  /// </li>
  /// <li>
  /// Retrieving snapshots of a specific resource type within an engagement.
  /// </li>
  /// <li>
  /// Obtaining snapshots for a particular resource using a specified template.
  /// </li>
  /// <li>
  /// Accessing the latest snapshot of a resource within an engagement.
  /// </li>
  /// <li>
  /// Filtering snapshots by resource owner.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request.
  ///
  /// Parameter [engagementIdentifier] :
  /// The unique identifier of the engagement associated with the snapshots.
  ///
  /// Parameter [createdBy] :
  /// Filters the response to include only snapshots of resources owned by the
  /// specified AWS account.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [resourceIdentifier] :
  /// Filters the response to include only snapshots of the specified resource.
  ///
  /// Parameter [resourceSnapshotTemplateIdentifier] :
  /// Filters the response to include only snapshots created using the specified
  /// template.
  ///
  /// Parameter [resourceType] :
  /// Filters the response to include only snapshots of the specified resource
  /// type.
  Future<ListResourceSnapshotsResponse> listResourceSnapshots({
    required String catalog,
    required String engagementIdentifier,
    String? createdBy,
    int? maxResults,
    String? nextToken,
    String? resourceIdentifier,
    String? resourceSnapshotTemplateIdentifier,
    ResourceType? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.ListResourceSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'EngagementIdentifier': engagementIdentifier,
        if (createdBy != null) 'CreatedBy': createdBy,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceIdentifier != null)
          'ResourceIdentifier': resourceIdentifier,
        if (resourceSnapshotTemplateIdentifier != null)
          'ResourceSnapshotTemplateIdentifier':
              resourceSnapshotTemplateIdentifier,
        if (resourceType != null) 'ResourceType': resourceType.value,
      },
    );

    return ListResourceSnapshotsResponse.fromJson(jsonResponse.body);
  }

  /// Use this action to create a job to generate a snapshot of the specified
  /// resource within an engagement. It initiates an asynchronous process to
  /// create a resource snapshot. The job creates a new snapshot only if the
  /// resource state has changed, adhering to the same access control and
  /// immutability rules as direct snapshot creation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog in which to create the snapshot job. Valid values
  /// are <code>AWS</code> and <code> Sandbox</code>.
  ///
  /// Parameter [engagementIdentifier] :
  /// Specifies the identifier of the engagement associated with the resource to
  /// be snapshotted.
  ///
  /// Parameter [resourceIdentifier] :
  /// Specifies the identifier of the specific resource to be snapshotted. The
  /// format depends on the <code> ResourceType</code>.
  ///
  /// Parameter [resourceSnapshotTemplateIdentifier] :
  /// Specifies the name of the template that defines the schema for the
  /// snapshot.
  ///
  /// Parameter [resourceType] :
  /// The type of resource for which the snapshot job is being created. Must be
  /// one of the supported resource types i.e. <code>Opportunity</code>
  ///
  /// Parameter [clientToken] :
  /// A client-generated UUID used for idempotency check. The token helps
  /// prevent duplicate job creations.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign.
  Future<CreateResourceSnapshotJobResponse> createResourceSnapshotJob({
    required String catalog,
    required String engagementIdentifier,
    required String resourceIdentifier,
    required String resourceSnapshotTemplateIdentifier,
    required ResourceType resourceType,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.CreateResourceSnapshotJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'EngagementIdentifier': engagementIdentifier,
        'ResourceIdentifier': resourceIdentifier,
        'ResourceSnapshotTemplateIdentifier':
            resourceSnapshotTemplateIdentifier,
        'ResourceType': resourceType.value,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateResourceSnapshotJobResponse.fromJson(jsonResponse.body);
  }

  /// Use this action to retrieves information about a specific resource
  /// snapshot job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// AWS: Retrieves the snapshot job from the production AWS environment.
  /// </li>
  /// <li>
  /// Sandbox: Retrieves the snapshot job from a sandbox environment used for
  /// testing or development purposes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceSnapshotJobIdentifier] :
  /// The unique identifier of the resource snapshot job to be retrieved. This
  /// identifier is crucial for pinpointing the specific job you want to query.
  Future<GetResourceSnapshotJobResponse> getResourceSnapshotJob({
    required String catalog,
    required String resourceSnapshotJobIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.GetResourceSnapshotJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ResourceSnapshotJobIdentifier': resourceSnapshotJobIdentifier,
      },
    );

    return GetResourceSnapshotJobResponse.fromJson(jsonResponse.body);
  }

  /// Use this action to deletes a previously created resource snapshot job. The
  /// job must be in a stopped state before it can be deleted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog from which to delete the snapshot job. Valid values
  /// are <code>AWS</code> and <code>Sandbox</code>.
  ///
  /// Parameter [resourceSnapshotJobIdentifier] :
  /// The unique identifier of the resource snapshot job to be deleted.
  Future<void> deleteResourceSnapshotJob({
    required String catalog,
    required String resourceSnapshotJobIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.DeleteResourceSnapshotJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ResourceSnapshotJobIdentifier': resourceSnapshotJobIdentifier,
      },
    );
  }

  /// Lists resource snapshot jobs owned by the customer. This operation
  /// supports various filtering scenarios, including listing all jobs owned by
  /// the caller, jobs for a specific engagement, jobs with a specific status,
  /// or any combination of these filters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request.
  ///
  /// Parameter [engagementIdentifier] :
  /// The identifier of the engagement to filter the response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. If omitted,
  /// defaults to 50.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [sort] :
  /// Configures the sorting of the response. If omitted, results are sorted by
  /// <code>CreatedDate</code> in descending order.
  ///
  /// Parameter [status] :
  /// The status of the jobs to filter the response.
  Future<ListResourceSnapshotJobsResponse> listResourceSnapshotJobs({
    required String catalog,
    String? engagementIdentifier,
    int? maxResults,
    String? nextToken,
    SortObject? sort,
    ResourceSnapshotJobStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.ListResourceSnapshotJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (engagementIdentifier != null)
          'EngagementIdentifier': engagementIdentifier,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sort != null) 'Sort': sort,
        if (status != null) 'Status': status.value,
      },
    );

    return ListResourceSnapshotJobsResponse.fromJson(jsonResponse.body);
  }

  /// Starts a resource snapshot job that has been previously created.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// AWS: Starts the request from the production AWS environment.
  /// </li>
  /// <li>
  /// Sandbox: Starts the request from a sandbox environment used for testing or
  /// development purposes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceSnapshotJobIdentifier] :
  /// The identifier of the resource snapshot job to start.
  Future<void> startResourceSnapshotJob({
    required String catalog,
    required String resourceSnapshotJobIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.StartResourceSnapshotJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ResourceSnapshotJobIdentifier': resourceSnapshotJobIdentifier,
      },
    );
  }

  /// Stops a resource snapshot job. The job must be started prior to being
  /// stopped.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog related to the request. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// AWS: Stops the request from the production AWS environment.
  /// </li>
  /// <li>
  /// Sandbox: Stops the request from a sandbox environment used for testing or
  /// development purposes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceSnapshotJobIdentifier] :
  /// The identifier of the job to stop.
  Future<void> stopResourceSnapshotJob({
    required String catalog,
    required String resourceSnapshotJobIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.StopResourceSnapshotJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ResourceSnapshotJobIdentifier': resourceSnapshotJobIdentifier,
      },
    );
  }

  /// Retrieves a list of Partner Solutions that the partner registered on
  /// Partner Central. This API is used to generate a list of solutions that an
  /// end user selects from for association with an opportunity.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// Specifies the catalog associated with the request. This field takes a
  /// string value from a predefined list: <code>AWS</code> or
  /// <code>Sandbox</code>. The catalog determines which environment the
  /// solutions are listed in. Use <code>AWS</code> to list solutions in the
  /// Amazon Web Services catalog, and <code>Sandbox</code> to list solutions in
  /// a secure and isolated testing environment.
  ///
  /// Parameter [category] :
  /// Filters the solutions based on the category to which they belong. This
  /// allows partners to search for solutions within specific categories, such
  /// as <code>Software</code>, <code>Consulting</code>, or <code>Managed
  /// Services</code>.
  ///
  /// Parameter [identifier] :
  /// Filters the solutions based on their unique identifier. Use this filter to
  /// retrieve specific solutions by providing the solution's identifier for
  /// accurate results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by a single call. This value must
  /// be provided in the next call to retrieve the next set of results.
  ///
  /// Default: 20
  ///
  /// Parameter [nextToken] :
  /// A pagination token used to retrieve the next set of results in subsequent
  /// calls. This token is included in the response only if there are additional
  /// result pages available.
  ///
  /// Parameter [sort] :
  /// Object that configures sorting done on the response. Default
  /// <code>Sort.SortBy</code> is <code>Identifier</code>.
  ///
  /// Parameter [status] :
  /// Filters solutions based on their status. This filter helps partners manage
  /// their solution portfolios effectively.
  Future<ListSolutionsResponse> listSolutions({
    required String catalog,
    List<String>? category,
    List<String>? identifier,
    int? maxResults,
    String? nextToken,
    SolutionSort? sort,
    List<SolutionStatus>? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSPartnerCentralSelling.ListSolutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (category != null) 'Category': category,
        if (identifier != null) 'Identifier': identifier,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sort != null) 'Sort': sort,
        if (status != null) 'Status': status.map((e) => e.value).toList(),
      },
    );

    return ListSolutionsResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class CreateEngagementContextResponse {
  /// The unique identifier assigned to the newly created engagement context. This
  /// ID can be used to reference the specific context within the engagement for
  /// future operations.
  final String? contextId;

  /// The Amazon Resource Name (ARN) of the engagement to which the context was
  /// added. This globally unique identifier can be used for cross-service
  /// references and IAM policies.
  final String? engagementArn;

  /// The unique identifier of the engagement to which the context was added. This
  /// ID confirms the successful association of the context with the specified
  /// engagement.
  final String? engagementId;

  /// The timestamp indicating when the engagement was last modified as a result
  /// of adding the context, in ISO 8601 format (UTC). Example:
  /// "2023-05-01T20:37:46Z".
  final DateTime? engagementLastModifiedAt;

  CreateEngagementContextResponse({
    this.contextId,
    this.engagementArn,
    this.engagementId,
    this.engagementLastModifiedAt,
  });

  factory CreateEngagementContextResponse.fromJson(Map<String, dynamic> json) {
    return CreateEngagementContextResponse(
      contextId: json['ContextId'] as String?,
      engagementArn: json['EngagementArn'] as String?,
      engagementId: json['EngagementId'] as String?,
      engagementLastModifiedAt:
          timeStampFromJson(json['EngagementLastModifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final contextId = this.contextId;
    final engagementArn = this.engagementArn;
    final engagementId = this.engagementId;
    final engagementLastModifiedAt = this.engagementLastModifiedAt;
    return {
      if (contextId != null) 'ContextId': contextId,
      if (engagementArn != null) 'EngagementArn': engagementArn,
      if (engagementId != null) 'EngagementId': engagementId,
      if (engagementLastModifiedAt != null)
        'EngagementLastModifiedAt': iso8601ToJson(engagementLastModifiedAt),
    };
  }
}

/// @nodoc
class GetSellingSystemSettingsResponse {
  /// Specifies the catalog in which the settings are defined. Acceptable values
  /// include <code>AWS</code> for production and <code>Sandbox</code> for testing
  /// environments.
  final String catalog;

  /// Specifies the ARN of the IAM Role used for resource snapshot job executions.
  final String? resourceSnapshotJobRoleArn;

  GetSellingSystemSettingsResponse({
    required this.catalog,
    this.resourceSnapshotJobRoleArn,
  });

  factory GetSellingSystemSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetSellingSystemSettingsResponse(
      catalog: (json['Catalog'] as String?) ?? '',
      resourceSnapshotJobRoleArn: json['ResourceSnapshotJobRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final resourceSnapshotJobRoleArn = this.resourceSnapshotJobRoleArn;
    return {
      'Catalog': catalog,
      if (resourceSnapshotJobRoleArn != null)
        'ResourceSnapshotJobRoleArn': resourceSnapshotJobRoleArn,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// A map of the key-value pairs for the tag or tags assigned to the specified
  /// resource.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: ((json['Tags'] as List?) ?? const [])
          .nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'Tags': tags,
    };
  }
}

/// @nodoc
class PutSellingSystemSettingsResponse {
  /// Specifies the catalog in which the settings are defined. Acceptable values
  /// include <code>AWS</code> for production and <code>Sandbox</code> for testing
  /// environments.
  final String catalog;

  /// Specifies the ARN of the IAM Role used for resource snapshot job executions.
  final String? resourceSnapshotJobRoleArn;

  PutSellingSystemSettingsResponse({
    required this.catalog,
    this.resourceSnapshotJobRoleArn,
  });

  factory PutSellingSystemSettingsResponse.fromJson(Map<String, dynamic> json) {
    return PutSellingSystemSettingsResponse(
      catalog: (json['Catalog'] as String?) ?? '',
      resourceSnapshotJobRoleArn: json['ResourceSnapshotJobRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final resourceSnapshotJobRoleArn = this.resourceSnapshotJobRoleArn;
    return {
      'Catalog': catalog,
      if (resourceSnapshotJobRoleArn != null)
        'ResourceSnapshotJobRoleArn': resourceSnapshotJobRoleArn,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateEngagementContextResponse {
  /// The unique identifier of the engagement context that was updated.
  final String contextId;

  /// The Amazon Resource Name (ARN) of the updated engagement.
  final String engagementArn;

  /// The unique identifier of the engagement that was updated.
  final String engagementId;

  /// The timestamp when the engagement context was last modified.
  final DateTime engagementLastModifiedAt;

  UpdateEngagementContextResponse({
    required this.contextId,
    required this.engagementArn,
    required this.engagementId,
    required this.engagementLastModifiedAt,
  });

  factory UpdateEngagementContextResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEngagementContextResponse(
      contextId: (json['ContextId'] as String?) ?? '',
      engagementArn: (json['EngagementArn'] as String?) ?? '',
      engagementId: (json['EngagementId'] as String?) ?? '',
      engagementLastModifiedAt:
          nonNullableTimeStampFromJson(json['EngagementLastModifiedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final contextId = this.contextId;
    final engagementArn = this.engagementArn;
    final engagementId = this.engagementId;
    final engagementLastModifiedAt = this.engagementLastModifiedAt;
    return {
      'ContextId': contextId,
      'EngagementArn': engagementArn,
      'EngagementId': engagementId,
      'EngagementLastModifiedAt': iso8601ToJson(engagementLastModifiedAt),
    };
  }
}

/// @nodoc
class CreateEngagementResponse {
  /// The Amazon Resource Name (ARN) that identifies the engagement.
  final String? arn;

  /// Unique identifier assigned to the newly created engagement.
  final String? id;

  /// The timestamp indicating when the engagement was last modified, in ISO 8601
  /// format (UTC). For newly created engagements, this value matches the creation
  /// timestamp. Example: "2023-05-01T20:37:46Z".
  final DateTime? modifiedAt;

  CreateEngagementResponse({
    this.arn,
    this.id,
    this.modifiedAt,
  });

  factory CreateEngagementResponse.fromJson(Map<String, dynamic> json) {
    return CreateEngagementResponse(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final modifiedAt = this.modifiedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (modifiedAt != null) 'ModifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

/// @nodoc
class GetEngagementResponse {
  /// The Amazon Resource Name (ARN) of the engagement retrieved.
  final String? arn;

  /// A list of context objects associated with the engagement. Each context
  /// provides additional information related to the Engagement, such as customer
  /// projects or documents.
  final List<EngagementContextDetails>? contexts;

  /// The date and time when the Engagement was created, presented in ISO 8601
  /// format (UTC). For example: "2023-05-01T20:37:46Z". This timestamp helps
  /// track the lifecycle of the Engagement.
  final DateTime? createdAt;

  /// The AWS account ID of the user who originally created the engagement. This
  /// field helps in tracking the origin of the engagement.
  final String? createdBy;

  /// A more detailed description of the engagement. This provides additional
  /// context or information about the engagement's purpose or scope.
  final String? description;

  /// The unique resource identifier of the engagement retrieved.
  final String? id;

  /// Specifies the current count of members participating in the Engagement. This
  /// count includes all active members regardless of their roles or permissions
  /// within the Engagement.
  final int? memberCount;

  /// The timestamp indicating when the engagement was last modified, in ISO 8601
  /// format (UTC). Example: "2023-05-01T20:37:46Z". This helps track the most
  /// recent changes to the engagement.
  final DateTime? modifiedAt;

  /// The AWS account ID of the user who last modified the engagement. This field
  /// helps track who made the most recent changes to the engagement.
  final String? modifiedBy;

  /// The title of the engagement. It provides a brief, descriptive name for the
  /// engagement that is meaningful and easily recognizable.
  final String? title;

  GetEngagementResponse({
    this.arn,
    this.contexts,
    this.createdAt,
    this.createdBy,
    this.description,
    this.id,
    this.memberCount,
    this.modifiedAt,
    this.modifiedBy,
    this.title,
  });

  factory GetEngagementResponse.fromJson(Map<String, dynamic> json) {
    return GetEngagementResponse(
      arn: json['Arn'] as String?,
      contexts: (json['Contexts'] as List?)
          ?.nonNulls
          .map((e) =>
              EngagementContextDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      createdBy: json['CreatedBy'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      memberCount: json['MemberCount'] as int?,
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
      modifiedBy: json['ModifiedBy'] as String?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final contexts = this.contexts;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final id = this.id;
    final memberCount = this.memberCount;
    final modifiedAt = this.modifiedAt;
    final modifiedBy = this.modifiedBy;
    final title = this.title;
    return {
      if (arn != null) 'Arn': arn,
      if (contexts != null) 'Contexts': contexts,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (memberCount != null) 'MemberCount': memberCount,
      if (modifiedAt != null) 'ModifiedAt': iso8601ToJson(modifiedAt),
      if (modifiedBy != null) 'ModifiedBy': modifiedBy,
      if (title != null) 'Title': title,
    };
  }
}

/// @nodoc
class ListEngagementsResponse {
  /// An array of engagement summary objects.
  final List<EngagementSummary> engagementSummaryList;

  /// The token to retrieve the next set of results. This field will be null if
  /// there are no more results.
  final String? nextToken;

  ListEngagementsResponse({
    required this.engagementSummaryList,
    this.nextToken,
  });

  factory ListEngagementsResponse.fromJson(Map<String, dynamic> json) {
    return ListEngagementsResponse(
      engagementSummaryList:
          ((json['EngagementSummaryList'] as List?) ?? const [])
              .nonNulls
              .map((e) => EngagementSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engagementSummaryList = this.engagementSummaryList;
    final nextToken = this.nextToken;
    return {
      'EngagementSummaryList': engagementSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListEngagementMembersResponse {
  /// Provides a list of engagement members.
  final List<EngagementMember> engagementMemberList;

  /// A pagination token used to retrieve the next set of results. If there are
  /// more results available than can be returned in a single response, this token
  /// will be present. Use this token in a subsequent request to retrieve the next
  /// page of results. If there are no more results, this value will be null.
  final String? nextToken;

  ListEngagementMembersResponse({
    required this.engagementMemberList,
    this.nextToken,
  });

  factory ListEngagementMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListEngagementMembersResponse(
      engagementMemberList:
          ((json['EngagementMemberList'] as List?) ?? const [])
              .nonNulls
              .map((e) => EngagementMember.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engagementMemberList = this.engagementMemberList;
    final nextToken = this.nextToken;
    return {
      'EngagementMemberList': engagementMemberList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class StartEngagementByAcceptingInvitationTaskResponse {
  /// Returns the identifier of the engagement invitation that was accepted and
  /// used to create the opportunity.
  final String? engagementInvitationId;

  /// If the task fails, this field contains a detailed message describing the
  /// failure and possible recovery steps.
  final String? message;

  /// Returns the original opportunity identifier passed in the request. This is
  /// the unique identifier for the opportunity.
  final String? opportunityId;

  /// Indicates the reason for task failure using an enumerated code.
  final ReasonCode? reasonCode;

  /// The identifier of the Resource Snapshot Job created as part of this task.
  final String? resourceSnapshotJobId;

  /// The timestamp indicating when the task was initiated. The format follows RFC
  /// 3339 section 5.6.
  final DateTime? startTime;

  /// The Amazon Resource Name (ARN) of the task, used for tracking and managing
  /// the task within AWS.
  final String? taskArn;

  /// The unique identifier of the task, used to track the task’s progress.
  final String? taskId;

  /// Indicates the current status of the task.
  final TaskStatus? taskStatus;

  StartEngagementByAcceptingInvitationTaskResponse({
    this.engagementInvitationId,
    this.message,
    this.opportunityId,
    this.reasonCode,
    this.resourceSnapshotJobId,
    this.startTime,
    this.taskArn,
    this.taskId,
    this.taskStatus,
  });

  factory StartEngagementByAcceptingInvitationTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return StartEngagementByAcceptingInvitationTaskResponse(
      engagementInvitationId: json['EngagementInvitationId'] as String?,
      message: json['Message'] as String?,
      opportunityId: json['OpportunityId'] as String?,
      reasonCode: (json['ReasonCode'] as String?)?.let(ReasonCode.fromString),
      resourceSnapshotJobId: json['ResourceSnapshotJobId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      taskArn: json['TaskArn'] as String?,
      taskId: json['TaskId'] as String?,
      taskStatus: (json['TaskStatus'] as String?)?.let(TaskStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final engagementInvitationId = this.engagementInvitationId;
    final message = this.message;
    final opportunityId = this.opportunityId;
    final reasonCode = this.reasonCode;
    final resourceSnapshotJobId = this.resourceSnapshotJobId;
    final startTime = this.startTime;
    final taskArn = this.taskArn;
    final taskId = this.taskId;
    final taskStatus = this.taskStatus;
    return {
      if (engagementInvitationId != null)
        'EngagementInvitationId': engagementInvitationId,
      if (message != null) 'Message': message,
      if (opportunityId != null) 'OpportunityId': opportunityId,
      if (reasonCode != null) 'ReasonCode': reasonCode.value,
      if (resourceSnapshotJobId != null)
        'ResourceSnapshotJobId': resourceSnapshotJobId,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskId != null) 'TaskId': taskId,
      if (taskStatus != null) 'TaskStatus': taskStatus.value,
    };
  }
}

/// @nodoc
class ListEngagementByAcceptingInvitationTasksResponse {
  /// A token used for pagination to retrieve the next page of results.If there
  /// are more results available, this field will contain a token that can be used
  /// in a subsequent API call to retrieve the next page. If there are no more
  /// results, this field will be null or an empty string.
  final String? nextToken;

  /// An array of <code>EngagementByAcceptingInvitationTaskSummary</code> objects,
  /// each representing a task that matches the specified filters. The array may
  /// be empty if no tasks match the criteria.
  final List<ListEngagementByAcceptingInvitationTaskSummary>? taskSummaries;

  ListEngagementByAcceptingInvitationTasksResponse({
    this.nextToken,
    this.taskSummaries,
  });

  factory ListEngagementByAcceptingInvitationTasksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEngagementByAcceptingInvitationTasksResponse(
      nextToken: json['NextToken'] as String?,
      taskSummaries: (json['TaskSummaries'] as List?)
          ?.nonNulls
          .map((e) => ListEngagementByAcceptingInvitationTaskSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskSummaries = this.taskSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (taskSummaries != null) 'TaskSummaries': taskSummaries,
    };
  }
}

/// @nodoc
class StartEngagementFromOpportunityTaskResponse {
  /// The identifier of the newly created Engagement. Only populated if TaskStatus
  /// is COMPLETE.
  final String? engagementId;

  /// The identifier of the new Engagement invitation. Only populated if
  /// TaskStatus is COMPLETE.
  final String? engagementInvitationId;

  /// If the task fails, this field contains a detailed message describing the
  /// failure and possible recovery steps.
  final String? message;

  /// Returns the original opportunity identifier passed in the request, which is
  /// the unique identifier for the opportunity created in the partner’s system.
  final String? opportunityId;

  /// Indicates the reason for task failure using an enumerated code.
  final ReasonCode? reasonCode;

  /// The identifier of the resource snapshot job created to add the opportunity
  /// resource snapshot to the Engagement. Only populated if TaskStatus is
  /// COMPLETE
  final String? resourceSnapshotJobId;

  /// The timestamp indicating when the task was initiated. The format follows RFC
  /// 3339 section 5.6.
  final DateTime? startTime;

  /// The Amazon Resource Name (ARN) of the task, used for tracking and managing
  /// the task within AWS.
  final String? taskArn;

  /// The unique identifier of the task, used to track the task’s progress. This
  /// value follows a specific pattern: <code>^oit-\[0-9a-z\]{13}$</code>.
  final String? taskId;

  /// Indicates the current status of the task. Valid values include
  /// <code>IN_PROGRESS</code>, <code>COMPLETE</code>, and <code>FAILED</code>.
  final TaskStatus? taskStatus;

  StartEngagementFromOpportunityTaskResponse({
    this.engagementId,
    this.engagementInvitationId,
    this.message,
    this.opportunityId,
    this.reasonCode,
    this.resourceSnapshotJobId,
    this.startTime,
    this.taskArn,
    this.taskId,
    this.taskStatus,
  });

  factory StartEngagementFromOpportunityTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return StartEngagementFromOpportunityTaskResponse(
      engagementId: json['EngagementId'] as String?,
      engagementInvitationId: json['EngagementInvitationId'] as String?,
      message: json['Message'] as String?,
      opportunityId: json['OpportunityId'] as String?,
      reasonCode: (json['ReasonCode'] as String?)?.let(ReasonCode.fromString),
      resourceSnapshotJobId: json['ResourceSnapshotJobId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      taskArn: json['TaskArn'] as String?,
      taskId: json['TaskId'] as String?,
      taskStatus: (json['TaskStatus'] as String?)?.let(TaskStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final engagementId = this.engagementId;
    final engagementInvitationId = this.engagementInvitationId;
    final message = this.message;
    final opportunityId = this.opportunityId;
    final reasonCode = this.reasonCode;
    final resourceSnapshotJobId = this.resourceSnapshotJobId;
    final startTime = this.startTime;
    final taskArn = this.taskArn;
    final taskId = this.taskId;
    final taskStatus = this.taskStatus;
    return {
      if (engagementId != null) 'EngagementId': engagementId,
      if (engagementInvitationId != null)
        'EngagementInvitationId': engagementInvitationId,
      if (message != null) 'Message': message,
      if (opportunityId != null) 'OpportunityId': opportunityId,
      if (reasonCode != null) 'ReasonCode': reasonCode.value,
      if (resourceSnapshotJobId != null)
        'ResourceSnapshotJobId': resourceSnapshotJobId,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskId != null) 'TaskId': taskId,
      if (taskStatus != null) 'TaskStatus': taskStatus.value,
    };
  }
}

/// @nodoc
class ListEngagementFromOpportunityTasksResponse {
  /// A token used for pagination to retrieve the next page of results. If there
  /// are more results available, this field will contain a token that can be used
  /// in a subsequent API call to retrieve the next page. If there are no more
  /// results, this field will be null or an empty string.
  final String? nextToken;

  /// TaskSummaries An array of TaskSummary objects containing details about each
  /// task.
  final List<ListEngagementFromOpportunityTaskSummary>? taskSummaries;

  ListEngagementFromOpportunityTasksResponse({
    this.nextToken,
    this.taskSummaries,
  });

  factory ListEngagementFromOpportunityTasksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEngagementFromOpportunityTasksResponse(
      nextToken: json['NextToken'] as String?,
      taskSummaries: (json['TaskSummaries'] as List?)
          ?.nonNulls
          .map((e) => ListEngagementFromOpportunityTaskSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskSummaries = this.taskSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (taskSummaries != null) 'TaskSummaries': taskSummaries,
    };
  }
}

/// @nodoc
class CreateEngagementInvitationResponse {
  /// The Amazon Resource Name (ARN) that uniquely identifies the engagement
  /// invitation.
  final String arn;

  /// Unique identifier assigned to the newly created engagement invitation.
  final String id;

  CreateEngagementInvitationResponse({
    required this.arn,
    required this.id,
  });

  factory CreateEngagementInvitationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateEngagementInvitationResponse(
      arn: (json['Arn'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      'Arn': arn,
      'Id': id,
    };
  }
}

/// @nodoc
class GetEngagementInvitationResponse {
  /// Indicates the catalog from which the engagement invitation details are
  /// retrieved. This field helps in identifying the appropriate catalog (e.g.,
  /// <code>AWS</code> or <code>Sandbox</code>) used in the request.
  final String catalog;

  /// Unique identifier assigned to the engagement invitation being retrieved.
  final String id;

  /// The Amazon Resource Name (ARN) that identifies the engagement invitation.
  final String? arn;

  /// The description of the engagement associated with this invitation.
  final String? engagementDescription;

  /// The identifier of the engagement associated with this invitation.This ID
  /// links the invitation to its corresponding engagement.
  final String? engagementId;

  /// The title of the engagement invitation, summarizing the purpose or
  /// objectives of the opportunity shared by AWS.
  final String? engagementTitle;

  /// A list of active members currently part of the Engagement. This array
  /// contains a maximum of 10 members, each represented by an object with the
  /// following properties.
  ///
  /// <ul>
  /// <li>
  /// CompanyName: The name of the member's company.
  /// </li>
  /// <li>
  /// WebsiteUrl: The website URL of the member's company.
  /// </li>
  /// </ul>
  final List<EngagementMemberSummary>? existingMembers;

  /// Indicates the date on which the engagement invitation will expire if not
  /// accepted by the partner.
  final DateTime? expirationDate;

  /// The date when the engagement invitation was sent to the partner.
  final DateTime? invitationDate;

  /// The message sent to the invited partner when the invitation was created.
  final String? invitationMessage;

  /// Details of the engagement invitation payload, including specific data
  /// relevant to the invitation's contents, such as customer information and
  /// opportunity insights.
  final Payload? payload;

  /// The type of payload contained in the engagement invitation, indicating what
  /// data or context the payload covers.
  final EngagementInvitationPayloadType? payloadType;

  /// Information about the partner organization or team that received the
  /// engagement invitation, including contact details and identifiers.
  final Receiver? receiver;

  /// If the engagement invitation was rejected, this field specifies the reason
  /// provided by the partner for the rejection.
  final String? rejectionReason;

  /// Specifies the AWS Account ID of the sender, which identifies the AWS team
  /// responsible for sharing the engagement invitation.
  final String? senderAwsAccountId;

  /// The name of the AWS organization or team that sent the engagement
  /// invitation.
  final String? senderCompanyName;

  /// The current status of the engagement invitation.
  final InvitationStatus? status;

  GetEngagementInvitationResponse({
    required this.catalog,
    required this.id,
    this.arn,
    this.engagementDescription,
    this.engagementId,
    this.engagementTitle,
    this.existingMembers,
    this.expirationDate,
    this.invitationDate,
    this.invitationMessage,
    this.payload,
    this.payloadType,
    this.receiver,
    this.rejectionReason,
    this.senderAwsAccountId,
    this.senderCompanyName,
    this.status,
  });

  factory GetEngagementInvitationResponse.fromJson(Map<String, dynamic> json) {
    return GetEngagementInvitationResponse(
      catalog: (json['Catalog'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      arn: json['Arn'] as String?,
      engagementDescription: json['EngagementDescription'] as String?,
      engagementId: json['EngagementId'] as String?,
      engagementTitle: json['EngagementTitle'] as String?,
      existingMembers: (json['ExistingMembers'] as List?)
          ?.nonNulls
          .map((e) =>
              EngagementMemberSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      expirationDate: timeStampFromJson(json['ExpirationDate']),
      invitationDate: timeStampFromJson(json['InvitationDate']),
      invitationMessage: json['InvitationMessage'] as String?,
      payload: json['Payload'] != null
          ? Payload.fromJson(json['Payload'] as Map<String, dynamic>)
          : null,
      payloadType: (json['PayloadType'] as String?)
          ?.let(EngagementInvitationPayloadType.fromString),
      receiver: json['Receiver'] != null
          ? Receiver.fromJson(json['Receiver'] as Map<String, dynamic>)
          : null,
      rejectionReason: json['RejectionReason'] as String?,
      senderAwsAccountId: json['SenderAwsAccountId'] as String?,
      senderCompanyName: json['SenderCompanyName'] as String?,
      status: (json['Status'] as String?)?.let(InvitationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final id = this.id;
    final arn = this.arn;
    final engagementDescription = this.engagementDescription;
    final engagementId = this.engagementId;
    final engagementTitle = this.engagementTitle;
    final existingMembers = this.existingMembers;
    final expirationDate = this.expirationDate;
    final invitationDate = this.invitationDate;
    final invitationMessage = this.invitationMessage;
    final payload = this.payload;
    final payloadType = this.payloadType;
    final receiver = this.receiver;
    final rejectionReason = this.rejectionReason;
    final senderAwsAccountId = this.senderAwsAccountId;
    final senderCompanyName = this.senderCompanyName;
    final status = this.status;
    return {
      'Catalog': catalog,
      'Id': id,
      if (arn != null) 'Arn': arn,
      if (engagementDescription != null)
        'EngagementDescription': engagementDescription,
      if (engagementId != null) 'EngagementId': engagementId,
      if (engagementTitle != null) 'EngagementTitle': engagementTitle,
      if (existingMembers != null) 'ExistingMembers': existingMembers,
      if (expirationDate != null)
        'ExpirationDate': iso8601ToJson(expirationDate),
      if (invitationDate != null)
        'InvitationDate': iso8601ToJson(invitationDate),
      if (invitationMessage != null) 'InvitationMessage': invitationMessage,
      if (payload != null) 'Payload': payload,
      if (payloadType != null) 'PayloadType': payloadType.value,
      if (receiver != null) 'Receiver': receiver,
      if (rejectionReason != null) 'RejectionReason': rejectionReason,
      if (senderAwsAccountId != null) 'SenderAwsAccountId': senderAwsAccountId,
      if (senderCompanyName != null) 'SenderCompanyName': senderCompanyName,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class ListEngagementInvitationsResponse {
  /// An array containing summaries of engagement invitations. Each summary
  /// includes information such as the invitation title, invitation date, and the
  /// current status of the invitation.
  final List<EngagementInvitationSummary>? engagementInvitationSummaries;

  /// A pagination token returned when there are more results available than can
  /// be returned in a single call. Use this token to retrieve additional pages of
  /// engagement invitation summaries.
  final String? nextToken;

  ListEngagementInvitationsResponse({
    this.engagementInvitationSummaries,
    this.nextToken,
  });

  factory ListEngagementInvitationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEngagementInvitationsResponse(
      engagementInvitationSummaries: (json['EngagementInvitationSummaries']
              as List?)
          ?.nonNulls
          .map((e) =>
              EngagementInvitationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engagementInvitationSummaries = this.engagementInvitationSummaries;
    final nextToken = this.nextToken;
    return {
      if (engagementInvitationSummaries != null)
        'EngagementInvitationSummaries': engagementInvitationSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateOpportunityResponse {
  /// Read-only, system-generated <code>Opportunity</code> unique identifier.
  /// Amazon Web Services creates this identifier, and it's used for all
  /// subsequent opportunity actions, such as updates, associations, and
  /// submissions. It helps to ensure that each opportunity is accurately tracked
  /// and managed.
  final String id;

  /// <code>DateTime</code> when the opportunity was last modified. When the
  /// <code>Opportunity</code> is created, its value is <code>CreatedDate</code>.
  final DateTime? lastModifiedDate;

  /// Specifies the opportunity's unique identifier in the partner's CRM system.
  /// This value is essential to track and reconcile because it's included in the
  /// outbound payload sent back to the partner.
  final String? partnerOpportunityIdentifier;

  CreateOpportunityResponse({
    required this.id,
    this.lastModifiedDate,
    this.partnerOpportunityIdentifier,
  });

  factory CreateOpportunityResponse.fromJson(Map<String, dynamic> json) {
    return CreateOpportunityResponse(
      id: (json['Id'] as String?) ?? '',
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      partnerOpportunityIdentifier:
          json['PartnerOpportunityIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    final partnerOpportunityIdentifier = this.partnerOpportunityIdentifier;
    return {
      'Id': id,
      if (lastModifiedDate != null)
        'LastModifiedDate': iso8601ToJson(lastModifiedDate),
      if (partnerOpportunityIdentifier != null)
        'PartnerOpportunityIdentifier': partnerOpportunityIdentifier,
    };
  }
}

/// @nodoc
class GetOpportunityResponse {
  /// Specifies the catalog associated with the request. This field takes a string
  /// value from a predefined list: <code>AWS</code> or <code>Sandbox</code>. The
  /// catalog determines which environment the opportunity information is
  /// retrieved from. Use <code>AWS</code> to retrieve opportunities in the Amazon
  /// Web Services catalog, and <code>Sandbox</code> to retrieve opportunities in
  /// a secure and isolated testing environment.
  final String catalog;

  /// <code>DateTime</code> when the <code>Opportunity</code> was last created.
  final DateTime createdDate;

  /// Read-only, system generated <code>Opportunity</code> unique identifier.
  final String id;

  /// <code>DateTime</code> when the opportunity was last modified.
  final DateTime lastModifiedDate;

  /// Provides information about the associations of other entities with the
  /// opportunity. These entities include identifiers for
  /// <code>AWSProducts</code>, <code>Partner Solutions</code>, and
  /// <code>AWSMarketplaceOffers</code>.
  final RelatedEntityIdentifiers relatedEntityIdentifiers;

  /// The Amazon Resource Name (ARN) that uniquely identifies the opportunity.
  final String? arn;

  /// Specifies details of the customer associated with the
  /// <code>Opportunity</code>.
  final Customer? customer;

  /// An object that contains lifecycle details for the <code>Opportunity</code>.
  final LifeCycle? lifeCycle;

  /// An object that contains marketing details for the <code>Opportunity</code>.
  final Marketing? marketing;

  /// Indicates whether the <code>Opportunity</code> pertains to a national
  /// security project. This field must be set to <code>true</code> only when the
  /// customer's industry is <i>Government</i>. Additional privacy and security
  /// measures apply during the review and management process for opportunities
  /// marked as <code>NationalSecurity</code>.
  final NationalSecurity? nationalSecurity;

  /// Represents the internal team handling the opportunity. Specify the members
  /// involved in collaborating on this opportunity within the partner's
  /// organization.
  final List<Contact>? opportunityTeam;

  /// Specifies the opportunity type as renewal, new, or expansion.
  ///
  /// Opportunity types:
  ///
  /// <ul>
  /// <li>
  /// New opportunity: Represents a new business opportunity with a potential
  /// customer that's not previously engaged with your solutions or services.
  /// </li>
  /// <li>
  /// Renewal opportunity: Represents an opportunity to renew an existing contract
  /// or subscription with a current customer, which helps to ensure service
  /// continuity.
  /// </li>
  /// <li>
  /// Expansion opportunity: Represents an opportunity to expand the scope of a
  /// customer's contract or subscription, either by adding new services or
  /// increasing the volume of existing services.
  /// </li>
  /// </ul>
  final OpportunityType? opportunityType;

  /// Specifies the opportunity's unique identifier in the partner's CRM system.
  /// This value is essential to track and reconcile because it's included in the
  /// outbound payload sent back to the partner.
  final String? partnerOpportunityIdentifier;

  /// Identifies the type of support the partner needs from Amazon Web Services.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// Cosell—Architectural Validation: Confirmation from Amazon Web Services that
  /// the partner's proposed solution architecture is aligned with Amazon Web
  /// Services best practices and poses minimal architectural risks.
  /// </li>
  /// <li>
  /// Cosell—Business Presentation: Request Amazon Web Services seller's
  /// participation in a joint customer presentation.
  /// </li>
  /// <li>
  /// Cosell—Competitive Information: Access to Amazon Web Services competitive
  /// resources and support for the partner's proposed solution.
  /// </li>
  /// <li>
  /// Cosell—Pricing Assistance: Connect with an Amazon Web Services seller for
  /// support situations where a partner may be receiving an upfront discount on a
  /// service (for example: EDP deals).
  /// </li>
  /// <li>
  /// Cosell—Technical Consultation: Connect with an Amazon Web Services Solutions
  /// Architect to address the partner's questions about the proposed solution.
  /// </li>
  /// <li>
  /// Cosell—Total Cost of Ownership Evaluation: Assistance with quoting different
  /// cost savings of proposed solutions on Amazon Web Services versus on-premises
  /// or a traditional hosting environment.
  /// </li>
  /// <li>
  /// Cosell—Deal Support: Request Amazon Web Services seller's support to
  /// progress the opportunity (for example: joint customer call, strategic
  /// positioning).
  /// </li>
  /// <li>
  /// Cosell—Support for Public Tender/RFx: Opportunity related to the public
  /// sector where the partner needs Amazon Web Services RFx support.
  /// </li>
  /// </ul>
  final List<PrimaryNeedFromAws>? primaryNeedsFromAws;

  /// An object that contains project details summary for the
  /// <code>Opportunity</code>.
  final Project? project;

  /// Specifies details of a customer's procurement terms. Required only for
  /// partners in eligible programs.
  final SoftwareRevenue? softwareRevenue;

  GetOpportunityResponse({
    required this.catalog,
    required this.createdDate,
    required this.id,
    required this.lastModifiedDate,
    required this.relatedEntityIdentifiers,
    this.arn,
    this.customer,
    this.lifeCycle,
    this.marketing,
    this.nationalSecurity,
    this.opportunityTeam,
    this.opportunityType,
    this.partnerOpportunityIdentifier,
    this.primaryNeedsFromAws,
    this.project,
    this.softwareRevenue,
  });

  factory GetOpportunityResponse.fromJson(Map<String, dynamic> json) {
    return GetOpportunityResponse(
      catalog: (json['Catalog'] as String?) ?? '',
      createdDate: nonNullableTimeStampFromJson(json['CreatedDate'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      lastModifiedDate:
          nonNullableTimeStampFromJson(json['LastModifiedDate'] ?? 0),
      relatedEntityIdentifiers: RelatedEntityIdentifiers.fromJson(
          (json['RelatedEntityIdentifiers'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      arn: json['Arn'] as String?,
      customer: json['Customer'] != null
          ? Customer.fromJson(json['Customer'] as Map<String, dynamic>)
          : null,
      lifeCycle: json['LifeCycle'] != null
          ? LifeCycle.fromJson(json['LifeCycle'] as Map<String, dynamic>)
          : null,
      marketing: json['Marketing'] != null
          ? Marketing.fromJson(json['Marketing'] as Map<String, dynamic>)
          : null,
      nationalSecurity: (json['NationalSecurity'] as String?)
          ?.let(NationalSecurity.fromString),
      opportunityTeam: (json['OpportunityTeam'] as List?)
          ?.nonNulls
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      opportunityType:
          (json['OpportunityType'] as String?)?.let(OpportunityType.fromString),
      partnerOpportunityIdentifier:
          json['PartnerOpportunityIdentifier'] as String?,
      primaryNeedsFromAws: (json['PrimaryNeedsFromAws'] as List?)
          ?.nonNulls
          .map((e) => PrimaryNeedFromAws.fromString((e as String)))
          .toList(),
      project: json['Project'] != null
          ? Project.fromJson(json['Project'] as Map<String, dynamic>)
          : null,
      softwareRevenue: json['SoftwareRevenue'] != null
          ? SoftwareRevenue.fromJson(
              json['SoftwareRevenue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final createdDate = this.createdDate;
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    final relatedEntityIdentifiers = this.relatedEntityIdentifiers;
    final arn = this.arn;
    final customer = this.customer;
    final lifeCycle = this.lifeCycle;
    final marketing = this.marketing;
    final nationalSecurity = this.nationalSecurity;
    final opportunityTeam = this.opportunityTeam;
    final opportunityType = this.opportunityType;
    final partnerOpportunityIdentifier = this.partnerOpportunityIdentifier;
    final primaryNeedsFromAws = this.primaryNeedsFromAws;
    final project = this.project;
    final softwareRevenue = this.softwareRevenue;
    return {
      'Catalog': catalog,
      'CreatedDate': iso8601ToJson(createdDate),
      'Id': id,
      'LastModifiedDate': iso8601ToJson(lastModifiedDate),
      'RelatedEntityIdentifiers': relatedEntityIdentifiers,
      if (arn != null) 'Arn': arn,
      if (customer != null) 'Customer': customer,
      if (lifeCycle != null) 'LifeCycle': lifeCycle,
      if (marketing != null) 'Marketing': marketing,
      if (nationalSecurity != null) 'NationalSecurity': nationalSecurity.value,
      if (opportunityTeam != null) 'OpportunityTeam': opportunityTeam,
      if (opportunityType != null) 'OpportunityType': opportunityType.value,
      if (partnerOpportunityIdentifier != null)
        'PartnerOpportunityIdentifier': partnerOpportunityIdentifier,
      if (primaryNeedsFromAws != null)
        'PrimaryNeedsFromAws': primaryNeedsFromAws.map((e) => e.value).toList(),
      if (project != null) 'Project': project,
      if (softwareRevenue != null) 'SoftwareRevenue': softwareRevenue,
    };
  }
}

/// @nodoc
class UpdateOpportunityResponse {
  /// Read-only, system generated <code>Opportunity</code> unique identifier.
  final String id;

  /// <code>DateTime</code> when the opportunity was last modified.
  final DateTime lastModifiedDate;

  UpdateOpportunityResponse({
    required this.id,
    required this.lastModifiedDate,
  });

  factory UpdateOpportunityResponse.fromJson(Map<String, dynamic> json) {
    return UpdateOpportunityResponse(
      id: (json['Id'] as String?) ?? '',
      lastModifiedDate:
          nonNullableTimeStampFromJson(json['LastModifiedDate'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    return {
      'Id': id,
      'LastModifiedDate': iso8601ToJson(lastModifiedDate),
    };
  }
}

/// @nodoc
class ListOpportunitiesResponse {
  /// An array that contains minimal details for opportunities that match the
  /// request criteria. This summary view provides a quick overview of relevant
  /// opportunities.
  final List<OpportunitySummary> opportunitySummaries;

  /// A pagination token used to retrieve the next set of results in subsequent
  /// calls. This token is included in the response only if there are additional
  /// result pages available.
  final String? nextToken;

  ListOpportunitiesResponse({
    required this.opportunitySummaries,
    this.nextToken,
  });

  factory ListOpportunitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListOpportunitiesResponse(
      opportunitySummaries: ((json['OpportunitySummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => OpportunitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final opportunitySummaries = this.opportunitySummaries;
    final nextToken = this.nextToken;
    return {
      'OpportunitySummaries': opportunitySummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class GetAwsOpportunitySummaryResponse {
  /// Specifies the catalog in which the AWS Opportunity exists. This is the
  /// environment (e.g., <code>AWS</code> or <code>Sandbox</code>) where the
  /// opportunity is being managed.
  final String catalog;

  /// Provides details about the customer associated with the AWS Opportunity,
  /// including account information, industry, and other customer data. These
  /// details help partners understand the business context of the opportunity.
  final AwsOpportunityCustomer? customer;

  /// Provides insights into the AWS Opportunity, including engagement score and
  /// recommended actions that AWS suggests for the partner.
  final AwsOpportunityInsights? insights;

  /// Specifies the type of involvement AWS has in the opportunity, such as direct
  /// cosell or advisory support. This field helps partners understand the role
  /// AWS plays in advancing the opportunity.
  final SalesInvolvementType? involvementType;

  /// Provides a reason for any changes in the involvement type of AWS in the
  /// opportunity. This field is used to track why the level of AWS engagement has
  /// changed from <code>For Visibility Only</code> to <code>Co-sell</code>
  /// offering transparency into the partnership dynamics.
  final InvolvementTypeChangeReason? involvementTypeChangeReason;

  /// Contains lifecycle information for the AWS Opportunity, including review
  /// status, stage, and target close date. This field is crucial for partners to
  /// monitor the progression of the opportunity.
  final AwsOpportunityLifeCycle? lifeCycle;

  /// Details the AWS opportunity team, including members involved. This
  /// information helps partners know who from AWS is engaged and what their role
  /// is.
  final List<AwsTeamMember>? opportunityTeam;

  /// Specifies whether the AWS Opportunity originated from AWS or the partner.
  /// This helps distinguish between opportunities that were sourced by AWS and
  /// those referred by the partner.
  final OpportunityOrigin? origin;

  /// Provides details about the project associated with the AWS Opportunity,
  /// including the customer’s business problem, expected outcomes, and project
  /// scope. This information is crucial for understanding the broader context of
  /// the opportunity.
  final AwsOpportunityProject? project;

  /// Lists related entity identifiers, such as AWS products or partner solutions,
  /// associated with the AWS Opportunity. These identifiers provide additional
  /// context and help partners understand which AWS services are involved.
  final AwsOpportunityRelatedEntities? relatedEntityIds;

  /// Provides the unique identifier of the related partner opportunity, allowing
  /// partners to link the AWS Opportunity to their corresponding opportunity in
  /// their CRM system.
  final String? relatedOpportunityId;

  /// Defines the visibility level for the AWS Opportunity. Use <code>Full</code>
  /// visibility for most cases, while <code>Limited</code> visibility is reserved
  /// for special programs or sensitive opportunities.
  final Visibility? visibility;

  GetAwsOpportunitySummaryResponse({
    required this.catalog,
    this.customer,
    this.insights,
    this.involvementType,
    this.involvementTypeChangeReason,
    this.lifeCycle,
    this.opportunityTeam,
    this.origin,
    this.project,
    this.relatedEntityIds,
    this.relatedOpportunityId,
    this.visibility,
  });

  factory GetAwsOpportunitySummaryResponse.fromJson(Map<String, dynamic> json) {
    return GetAwsOpportunitySummaryResponse(
      catalog: (json['Catalog'] as String?) ?? '',
      customer: json['Customer'] != null
          ? AwsOpportunityCustomer.fromJson(
              json['Customer'] as Map<String, dynamic>)
          : null,
      insights: json['Insights'] != null
          ? AwsOpportunityInsights.fromJson(
              json['Insights'] as Map<String, dynamic>)
          : null,
      involvementType: (json['InvolvementType'] as String?)
          ?.let(SalesInvolvementType.fromString),
      involvementTypeChangeReason:
          (json['InvolvementTypeChangeReason'] as String?)
              ?.let(InvolvementTypeChangeReason.fromString),
      lifeCycle: json['LifeCycle'] != null
          ? AwsOpportunityLifeCycle.fromJson(
              json['LifeCycle'] as Map<String, dynamic>)
          : null,
      opportunityTeam: (json['OpportunityTeam'] as List?)
          ?.nonNulls
          .map((e) => AwsTeamMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      origin: (json['Origin'] as String?)?.let(OpportunityOrigin.fromString),
      project: json['Project'] != null
          ? AwsOpportunityProject.fromJson(
              json['Project'] as Map<String, dynamic>)
          : null,
      relatedEntityIds: json['RelatedEntityIds'] != null
          ? AwsOpportunityRelatedEntities.fromJson(
              json['RelatedEntityIds'] as Map<String, dynamic>)
          : null,
      relatedOpportunityId: json['RelatedOpportunityId'] as String?,
      visibility: (json['Visibility'] as String?)?.let(Visibility.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final customer = this.customer;
    final insights = this.insights;
    final involvementType = this.involvementType;
    final involvementTypeChangeReason = this.involvementTypeChangeReason;
    final lifeCycle = this.lifeCycle;
    final opportunityTeam = this.opportunityTeam;
    final origin = this.origin;
    final project = this.project;
    final relatedEntityIds = this.relatedEntityIds;
    final relatedOpportunityId = this.relatedOpportunityId;
    final visibility = this.visibility;
    return {
      'Catalog': catalog,
      if (customer != null) 'Customer': customer,
      if (insights != null) 'Insights': insights,
      if (involvementType != null) 'InvolvementType': involvementType.value,
      if (involvementTypeChangeReason != null)
        'InvolvementTypeChangeReason': involvementTypeChangeReason.value,
      if (lifeCycle != null) 'LifeCycle': lifeCycle,
      if (opportunityTeam != null) 'OpportunityTeam': opportunityTeam,
      if (origin != null) 'Origin': origin.value,
      if (project != null) 'Project': project,
      if (relatedEntityIds != null) 'RelatedEntityIds': relatedEntityIds,
      if (relatedOpportunityId != null)
        'RelatedOpportunityId': relatedOpportunityId,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

/// @nodoc
class StartOpportunityFromEngagementTaskResponse {
  /// The unique identifier of the engagement context used to create the
  /// opportunity.
  final String? contextId;

  /// The unique identifier of the engagement from which the opportunity was
  /// created.
  final String? engagementId;

  /// If the task fails, this field contains a detailed message describing the
  /// failure and possible recovery steps.
  final String? message;

  /// The unique identifier of the opportunity created as a result of the task.
  /// This field is populated when the task is completed successfully.
  final String? opportunityId;

  /// Indicates the reason for task failure using an enumerated code.
  final ReasonCode? reasonCode;

  /// The identifier of the resource snapshot job created as part of the
  /// opportunity creation process.
  final String? resourceSnapshotJobId;

  /// The timestamp indicating when the task was initiated. The format follows RFC
  /// 3339 section 5.6.
  final DateTime? startTime;

  /// The Amazon Resource Name (ARN) of the task, used for tracking and managing
  /// the task within AWS.
  final String? taskArn;

  /// The unique identifier of the task, used to track the task's progress.
  final String? taskId;

  /// Indicates the current status of the task.
  final TaskStatus? taskStatus;

  StartOpportunityFromEngagementTaskResponse({
    this.contextId,
    this.engagementId,
    this.message,
    this.opportunityId,
    this.reasonCode,
    this.resourceSnapshotJobId,
    this.startTime,
    this.taskArn,
    this.taskId,
    this.taskStatus,
  });

  factory StartOpportunityFromEngagementTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return StartOpportunityFromEngagementTaskResponse(
      contextId: json['ContextId'] as String?,
      engagementId: json['EngagementId'] as String?,
      message: json['Message'] as String?,
      opportunityId: json['OpportunityId'] as String?,
      reasonCode: (json['ReasonCode'] as String?)?.let(ReasonCode.fromString),
      resourceSnapshotJobId: json['ResourceSnapshotJobId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      taskArn: json['TaskArn'] as String?,
      taskId: json['TaskId'] as String?,
      taskStatus: (json['TaskStatus'] as String?)?.let(TaskStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final contextId = this.contextId;
    final engagementId = this.engagementId;
    final message = this.message;
    final opportunityId = this.opportunityId;
    final reasonCode = this.reasonCode;
    final resourceSnapshotJobId = this.resourceSnapshotJobId;
    final startTime = this.startTime;
    final taskArn = this.taskArn;
    final taskId = this.taskId;
    final taskStatus = this.taskStatus;
    return {
      if (contextId != null) 'ContextId': contextId,
      if (engagementId != null) 'EngagementId': engagementId,
      if (message != null) 'Message': message,
      if (opportunityId != null) 'OpportunityId': opportunityId,
      if (reasonCode != null) 'ReasonCode': reasonCode.value,
      if (resourceSnapshotJobId != null)
        'ResourceSnapshotJobId': resourceSnapshotJobId,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskId != null) 'TaskId': taskId,
      if (taskStatus != null) 'TaskStatus': taskStatus.value,
    };
  }
}

/// @nodoc
class ListOpportunityFromEngagementTasksResponse {
  /// A token used for pagination to retrieve the next page of results. If there
  /// are more results available, this field will contain a token that can be used
  /// in a subsequent API call to retrieve the next page. If there are no more
  /// results, this field will be null or an empty string.
  final String? nextToken;

  /// An array of <code>ListOpportunityFromEngagementTaskSummary</code> objects,
  /// each representing a task that matches the specified filters. The array may
  /// be empty if no tasks match the criteria.
  final List<ListOpportunityFromEngagementTaskSummary>? taskSummaries;

  ListOpportunityFromEngagementTasksResponse({
    this.nextToken,
    this.taskSummaries,
  });

  factory ListOpportunityFromEngagementTasksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListOpportunityFromEngagementTasksResponse(
      nextToken: json['NextToken'] as String?,
      taskSummaries: (json['TaskSummaries'] as List?)
          ?.nonNulls
          .map((e) => ListOpportunityFromEngagementTaskSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskSummaries = this.taskSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (taskSummaries != null) 'TaskSummaries': taskSummaries,
    };
  }
}

/// @nodoc
class CreateResourceSnapshotResponse {
  /// Specifies the Amazon Resource Name (ARN) that uniquely identifies the
  /// snapshot created.
  final String? arn;

  /// Specifies the revision number of the created snapshot. This field provides
  /// important information about the snapshot's place in the sequence of
  /// snapshots for the given resource.
  final int? revision;

  CreateResourceSnapshotResponse({
    this.arn,
    this.revision,
  });

  factory CreateResourceSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return CreateResourceSnapshotResponse(
      arn: json['Arn'] as String?,
      revision: json['Revision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final revision = this.revision;
    return {
      if (arn != null) 'Arn': arn,
      if (revision != null) 'Revision': revision,
    };
  }
}

/// @nodoc
class GetResourceSnapshotResponse {
  /// The catalog in which the snapshot was created. Matches the Catalog specified
  /// in the request.
  final String catalog;

  /// The Amazon Resource Name (ARN) that uniquely identifies the resource
  /// snapshot.
  final String? arn;

  /// The timestamp when the snapshot was created, in ISO 8601 format (e.g.,
  /// "2023-06-01T14:30:00Z"). This allows for precise tracking of when the
  /// snapshot was taken.
  final DateTime? createdAt;

  /// The AWS account ID of the principal (user or role) who created the snapshot.
  /// This helps in tracking the origin of the snapshot.
  final String? createdBy;

  /// The identifier of the engagement associated with this snapshot. Matches the
  /// EngagementIdentifier specified in the request.
  final String? engagementId;
  final ResourceSnapshotPayload? payload;

  /// The identifier of the specific resource that was snapshotted. Matches the
  /// ResourceIdentifier specified in the request.
  final String? resourceId;

  /// The name of the view used for this snapshot. This is the same as the
  /// template name.
  final String? resourceSnapshotTemplateName;

  /// The type of the resource that was snapshotted. Matches the ResourceType
  /// specified in the request.
  final ResourceType? resourceType;

  /// The revision number of this snapshot. This is a positive integer that is
  /// sequential and unique within the context of a resource view.
  final int? revision;

  /// Target member accounts associated with the resource snapshot.
  final List<String>? targetMemberAccounts;

  GetResourceSnapshotResponse({
    required this.catalog,
    this.arn,
    this.createdAt,
    this.createdBy,
    this.engagementId,
    this.payload,
    this.resourceId,
    this.resourceSnapshotTemplateName,
    this.resourceType,
    this.revision,
    this.targetMemberAccounts,
  });

  factory GetResourceSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceSnapshotResponse(
      catalog: (json['Catalog'] as String?) ?? '',
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      createdBy: json['CreatedBy'] as String?,
      engagementId: json['EngagementId'] as String?,
      payload: json['Payload'] != null
          ? ResourceSnapshotPayload.fromJson(
              json['Payload'] as Map<String, dynamic>)
          : null,
      resourceId: json['ResourceId'] as String?,
      resourceSnapshotTemplateName:
          json['ResourceSnapshotTemplateName'] as String?,
      resourceType:
          (json['ResourceType'] as String?)?.let(ResourceType.fromString),
      revision: json['Revision'] as int?,
      targetMemberAccounts: (json['TargetMemberAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final engagementId = this.engagementId;
    final payload = this.payload;
    final resourceId = this.resourceId;
    final resourceSnapshotTemplateName = this.resourceSnapshotTemplateName;
    final resourceType = this.resourceType;
    final revision = this.revision;
    final targetMemberAccounts = this.targetMemberAccounts;
    return {
      'Catalog': catalog,
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (engagementId != null) 'EngagementId': engagementId,
      if (payload != null) 'Payload': payload,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceSnapshotTemplateName != null)
        'ResourceSnapshotTemplateName': resourceSnapshotTemplateName,
      if (resourceType != null) 'ResourceType': resourceType.value,
      if (revision != null) 'Revision': revision,
      if (targetMemberAccounts != null)
        'TargetMemberAccounts': targetMemberAccounts,
    };
  }
}

/// @nodoc
class ListEngagementResourceAssociationsResponse {
  /// A list of engagement-resource association summaries.
  final List<EngagementResourceAssociationSummary>
      engagementResourceAssociationSummaries;

  /// A token to retrieve the next set of results. Use this token in a subsequent
  /// request to retrieve additional results if the response was truncated.
  final String? nextToken;

  ListEngagementResourceAssociationsResponse({
    required this.engagementResourceAssociationSummaries,
    this.nextToken,
  });

  factory ListEngagementResourceAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEngagementResourceAssociationsResponse(
      engagementResourceAssociationSummaries:
          ((json['EngagementResourceAssociationSummaries'] as List?) ??
                  const [])
              .nonNulls
              .map((e) => EngagementResourceAssociationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engagementResourceAssociationSummaries =
        this.engagementResourceAssociationSummaries;
    final nextToken = this.nextToken;
    return {
      'EngagementResourceAssociationSummaries':
          engagementResourceAssociationSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListResourceSnapshotsResponse {
  /// An array of resource snapshot summary objects.
  final List<ResourceSnapshotSummary> resourceSnapshotSummaries;

  /// The token to retrieve the next set of results. If there are no additional
  /// results, this value is null.
  final String? nextToken;

  ListResourceSnapshotsResponse({
    required this.resourceSnapshotSummaries,
    this.nextToken,
  });

  factory ListResourceSnapshotsResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceSnapshotsResponse(
      resourceSnapshotSummaries:
          ((json['ResourceSnapshotSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  ResourceSnapshotSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceSnapshotSummaries = this.resourceSnapshotSummaries;
    final nextToken = this.nextToken;
    return {
      'ResourceSnapshotSummaries': resourceSnapshotSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateResourceSnapshotJobResponse {
  /// The Amazon Resource Name (ARN) of the created snapshot job.
  final String? arn;

  /// The unique identifier for the created snapshot job.
  final String? id;

  CreateResourceSnapshotJobResponse({
    this.arn,
    this.id,
  });

  factory CreateResourceSnapshotJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateResourceSnapshotJobResponse(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
    };
  }
}

/// @nodoc
class GetResourceSnapshotJobResponse {
  /// The catalog in which the snapshot job was created. This will match the
  /// Catalog specified in the request.
  final String catalog;

  /// The Amazon Resource Name (ARN) of the snapshot job. This globally unique
  /// identifier can be used for resource-specific operations across AWS services.
  final String? arn;

  /// The date and time when the snapshot job was created in ISO 8601 format
  /// (UTC). Example: "2023-05-01T20:37:46Z"
  final DateTime? createdAt;

  /// The identifier of the engagement associated with this snapshot job. This
  /// links the job to a specific engagement context.
  final String? engagementId;

  /// The unique identifier of the snapshot job. This matches the
  /// ResourceSnapshotJobIdentifier provided in the request.
  final String? id;

  /// If the job has encountered any failures, this field contains the error
  /// message from the most recent failure. This can be useful for troubleshooting
  /// issues with the job.
  final String? lastFailure;

  /// The date and time of the last successful execution of the job, in ISO 8601
  /// format (UTC). Example: "2023-05-01T20:37:46Z"
  final DateTime? lastSuccessfulExecutionDate;

  /// The Amazon Resource Name (ARN) of the resource being snapshotted. This
  /// provides a globally unique identifier for the resource across AWS.
  final String? resourceArn;

  /// The identifier of the specific resource being snapshotted. The format might
  /// vary depending on the ResourceType.
  final String? resourceId;

  /// The name of the template used for creating the snapshot. This is the same as
  /// the template name. It defines the structure and content of the snapshot.
  final String? resourceSnapshotTemplateName;

  /// The type of resource being snapshotted. This would have "Opportunity" as a
  /// value as it is dependent on the supported resource type.
  final ResourceType? resourceType;

  /// The current status of the snapshot job. Valid values:
  ///
  /// <ul>
  /// <li>
  /// STOPPED: The job is not currently running.
  /// </li>
  /// <li>
  /// RUNNING: The job is actively executing.
  /// </li>
  /// </ul>
  final ResourceSnapshotJobStatus? status;

  GetResourceSnapshotJobResponse({
    required this.catalog,
    this.arn,
    this.createdAt,
    this.engagementId,
    this.id,
    this.lastFailure,
    this.lastSuccessfulExecutionDate,
    this.resourceArn,
    this.resourceId,
    this.resourceSnapshotTemplateName,
    this.resourceType,
    this.status,
  });

  factory GetResourceSnapshotJobResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceSnapshotJobResponse(
      catalog: (json['Catalog'] as String?) ?? '',
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      engagementId: json['EngagementId'] as String?,
      id: json['Id'] as String?,
      lastFailure: json['LastFailure'] as String?,
      lastSuccessfulExecutionDate:
          timeStampFromJson(json['LastSuccessfulExecutionDate']),
      resourceArn: json['ResourceArn'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceSnapshotTemplateName:
          json['ResourceSnapshotTemplateName'] as String?,
      resourceType:
          (json['ResourceType'] as String?)?.let(ResourceType.fromString),
      status: (json['Status'] as String?)
          ?.let(ResourceSnapshotJobStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final engagementId = this.engagementId;
    final id = this.id;
    final lastFailure = this.lastFailure;
    final lastSuccessfulExecutionDate = this.lastSuccessfulExecutionDate;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceSnapshotTemplateName = this.resourceSnapshotTemplateName;
    final resourceType = this.resourceType;
    final status = this.status;
    return {
      'Catalog': catalog,
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (engagementId != null) 'EngagementId': engagementId,
      if (id != null) 'Id': id,
      if (lastFailure != null) 'LastFailure': lastFailure,
      if (lastSuccessfulExecutionDate != null)
        'LastSuccessfulExecutionDate':
            iso8601ToJson(lastSuccessfulExecutionDate),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceSnapshotTemplateName != null)
        'ResourceSnapshotTemplateName': resourceSnapshotTemplateName,
      if (resourceType != null) 'ResourceType': resourceType.value,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class ListResourceSnapshotJobsResponse {
  /// An array of resource snapshot job summary objects.
  final List<ResourceSnapshotJobSummary> resourceSnapshotJobSummaries;

  /// The token to retrieve the next set of results. If there are no additional
  /// results, this value is null.
  final String? nextToken;

  ListResourceSnapshotJobsResponse({
    required this.resourceSnapshotJobSummaries,
    this.nextToken,
  });

  factory ListResourceSnapshotJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceSnapshotJobsResponse(
      resourceSnapshotJobSummaries: ((json['ResourceSnapshotJobSummaries']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              ResourceSnapshotJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceSnapshotJobSummaries = this.resourceSnapshotJobSummaries;
    final nextToken = this.nextToken;
    return {
      'ResourceSnapshotJobSummaries': resourceSnapshotJobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSolutionsResponse {
  /// An array with minimal details for solutions matching the request criteria.
  final List<SolutionBase> solutionSummaries;

  /// A pagination token used to retrieve the next set of results in subsequent
  /// calls. This token is included in the response only if there are additional
  /// result pages available.
  final String? nextToken;

  ListSolutionsResponse({
    required this.solutionSummaries,
    this.nextToken,
  });

  factory ListSolutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSolutionsResponse(
      solutionSummaries: ((json['SolutionSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => SolutionBase.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final solutionSummaries = this.solutionSummaries;
    final nextToken = this.nextToken;
    return {
      'SolutionSummaries': solutionSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Specifies minimal information for the solution offered to solve the
/// customer's business problem.
///
/// @nodoc
class SolutionBase {
  /// Specifies the catalog in which the solution is hosted, either
  /// <code>AWS</code> or <code>Sandbox</code>. This helps partners differentiate
  /// between live solutions and those in testing environments.
  final String catalog;

  /// Specifies the solution category, which helps to categorize and organize the
  /// solutions partners offer. Valid values: <code>Software Product</code> |
  /// <code>Consulting Service</code> | <code>Hardware Product</code> |
  /// <code>Communications Product</code> | <code>Professional Service</code> |
  /// <code>Managed Service</code> | <code>Value-Added Resale Amazon Web Services
  /// Service</code> | <code>Distribution Service</code> | <code>Training
  /// Service</code> | <code>Merger and Acquisition Advising Service</code>.
  final String category;

  /// Indicates the solution creation date. This is useful to track and audit.
  final DateTime createdDate;

  /// Enables the association of solutions (offerings) to opportunities.
  final String id;

  /// Specifies the solution name.
  final String name;

  /// Specifies the solution's current status, which indicates its state in the
  /// system. Valid values: <code>Active</code> | <code>Inactive</code> |
  /// <code>Draft</code>. The status helps partners and Amazon Web Services track
  /// the solution's lifecycle and availability. Filter for <code>Active</code>
  /// solutions for association to an opportunity.
  final SolutionStatus status;

  /// The SolutionBase structure provides essential information about a solution.
  final String? arn;

  SolutionBase({
    required this.catalog,
    required this.category,
    required this.createdDate,
    required this.id,
    required this.name,
    required this.status,
    this.arn,
  });

  factory SolutionBase.fromJson(Map<String, dynamic> json) {
    return SolutionBase(
      catalog: (json['Catalog'] as String?) ?? '',
      category: (json['Category'] as String?) ?? '',
      createdDate: nonNullableTimeStampFromJson(json['CreatedDate'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      status: SolutionStatus.fromString((json['Status'] as String?) ?? ''),
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final category = this.category;
    final createdDate = this.createdDate;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final arn = this.arn;
    return {
      'Catalog': catalog,
      'Category': category,
      'CreatedDate': iso8601ToJson(createdDate),
      'Id': id,
      'Name': name,
      'Status': status.value,
      if (arn != null) 'Arn': arn,
    };
  }
}

/// @nodoc
class SolutionStatus {
  static const active = SolutionStatus._('Active');
  static const inactive = SolutionStatus._('Inactive');
  static const draft = SolutionStatus._('Draft');

  final String value;

  const SolutionStatus._(this.value);

  static const values = [active, inactive, draft];

  static SolutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SolutionStatus._(value));

  @override
  bool operator ==(other) => other is SolutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configures the solutions' response sorting that enables partners to order
/// solutions based on specified attributes.
///
/// @nodoc
class SolutionSort {
  /// Specifies the attribute to sort by, such as <code>Name</code>,
  /// <code>CreatedDate</code>, or <code>Status</code>.
  final SolutionSortName sortBy;

  /// Specifies the sorting order, either <code>Ascending</code> or
  /// <code>Descending</code>. The default is <code>Descending</code>.
  final SortOrder sortOrder;

  SolutionSort({
    required this.sortBy,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      'SortBy': sortBy.value,
      'SortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class SortOrder {
  static const ascending = SortOrder._('ASCENDING');
  static const descending = SortOrder._('DESCENDING');

  final String value;

  const SortOrder._(this.value);

  static const values = [ascending, descending];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SolutionSortName {
  static const identifier = SolutionSortName._('Identifier');
  static const name = SolutionSortName._('Name');
  static const status = SolutionSortName._('Status');
  static const category = SolutionSortName._('Category');
  static const createdDate = SolutionSortName._('CreatedDate');

  final String value;

  const SolutionSortName._(this.value);

  static const values = [identifier, name, status, category, createdDate];

  static SolutionSortName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SolutionSortName._(value));

  @override
  bool operator ==(other) => other is SolutionSortName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that contains a <code>Resource Snapshot Job</code>'s subset of
/// fields.
///
/// @nodoc
class ResourceSnapshotJobSummary {
  /// The Amazon Resource Name (ARN) for the resource snapshot job.
  final String? arn;

  /// The unique identifier of the Engagement.
  final String? engagementId;

  /// The unique identifier for the resource snapshot job within the AWS Partner
  /// Central system. This ID is used for direct references to the job within the
  /// service.
  final String? id;

  /// The current status of the snapshot job.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// STOPPED: The job is not currently running.
  /// </li>
  /// <li>
  /// RUNNING: The job is actively executing.
  /// </li>
  /// </ul>
  final ResourceSnapshotJobStatus? status;

  ResourceSnapshotJobSummary({
    this.arn,
    this.engagementId,
    this.id,
    this.status,
  });

  factory ResourceSnapshotJobSummary.fromJson(Map<String, dynamic> json) {
    return ResourceSnapshotJobSummary(
      arn: json['Arn'] as String?,
      engagementId: json['EngagementId'] as String?,
      id: json['Id'] as String?,
      status: (json['Status'] as String?)
          ?.let(ResourceSnapshotJobStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final engagementId = this.engagementId;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (engagementId != null) 'EngagementId': engagementId,
      if (id != null) 'Id': id,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class ResourceSnapshotJobStatus {
  static const running = ResourceSnapshotJobStatus._('Running');
  static const stopped = ResourceSnapshotJobStatus._('Stopped');

  final String value;

  const ResourceSnapshotJobStatus._(this.value);

  static const values = [running, stopped];

  static ResourceSnapshotJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceSnapshotJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ResourceSnapshotJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the sorting parameters for listing resource snapshot jobs. This
/// structure allows you to specify the field to sort by and the order of
/// sorting.
///
/// @nodoc
class SortObject {
  /// Specifies the field by which to sort the resource snapshot jobs.
  final SortBy? sortBy;

  /// Determines the order in which the sorted results are presented.
  final SortOrder? sortOrder;

  SortObject({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'SortBy': sortBy.value,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class SortBy {
  static const createdDate = SortBy._('CreatedDate');

  final String value;

  const SortBy._(this.value);

  static const values = [createdDate];

  static SortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => SortBy._(value));

  @override
  bool operator ==(other) => other is SortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResourceType {
  static const opportunity = ResourceType._('Opportunity');

  final String value;

  const ResourceType._(this.value);

  static const values = [opportunity];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The key-value pair assigned to a specified resource.
///
/// @nodoc
class Tag {
  /// The key in the tag.
  final String key;

  /// The value in the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// Provides a concise summary of a resource snapshot, including its unique
/// identifier and version information. This structure is used to quickly
/// reference and identify specific versions of resource snapshots.
///
/// @nodoc
class ResourceSnapshotSummary {
  /// The Amazon Resource Name (ARN) of the snapshot. This globally unique
  /// identifier can be used for cross-service references and in IAM policies.
  final String? arn;

  /// The AWS account ID of the entity that owns the resource from which the
  /// snapshot was created.
  final String? createdBy;

  /// The identifier of the specific resource snapshotted. The format might vary
  /// depending on the ResourceType.
  final String? resourceId;

  /// The name of the template used to create the snapshot.
  final String? resourceSnapshotTemplateName;

  /// The type of resource snapshotted.
  final ResourceType? resourceType;

  /// The revision number of the snapshot. This integer value is incremented each
  /// time the snapshot is updated, allowing for version tracking of the resource
  /// snapshot.
  final int? revision;

  ResourceSnapshotSummary({
    this.arn,
    this.createdBy,
    this.resourceId,
    this.resourceSnapshotTemplateName,
    this.resourceType,
    this.revision,
  });

  factory ResourceSnapshotSummary.fromJson(Map<String, dynamic> json) {
    return ResourceSnapshotSummary(
      arn: json['Arn'] as String?,
      createdBy: json['CreatedBy'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceSnapshotTemplateName:
          json['ResourceSnapshotTemplateName'] as String?,
      resourceType:
          (json['ResourceType'] as String?)?.let(ResourceType.fromString),
      revision: json['Revision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final resourceId = this.resourceId;
    final resourceSnapshotTemplateName = this.resourceSnapshotTemplateName;
    final resourceType = this.resourceType;
    final revision = this.revision;
    return {
      if (arn != null) 'Arn': arn,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceSnapshotTemplateName != null)
        'ResourceSnapshotTemplateName': resourceSnapshotTemplateName,
      if (resourceType != null) 'ResourceType': resourceType.value,
      if (revision != null) 'Revision': revision,
    };
  }
}

/// This provide a streamlined view of the relationships between engagements and
/// resources. These summaries offer a crucial link between collaborative
/// engagements and the specific resources involved, such as opportunities.These
/// summaries are particularly valuable for partners navigating complex
/// engagements with multiple resources. They enable quick insights into
/// resource distribution across engagements, support efficient resource
/// management, and help maintain a clear overview of collaborative activities.
///
/// @nodoc
class EngagementResourceAssociationSummary {
  /// Indicates the environment in which the resource and engagement exist.
  final String catalog;

  /// The AWS account ID of the entity that owns the resource. Identifies the
  /// account responsible for or having primary control over the resource.
  final String? createdBy;

  /// A unique identifier for the engagement associated with the resource.
  final String? engagementId;

  /// A unique identifier for the specific resource. Varies depending on the
  /// resource type.
  final String? resourceId;

  /// Categorizes the type of resource associated with the engagement.
  final ResourceType? resourceType;

  EngagementResourceAssociationSummary({
    required this.catalog,
    this.createdBy,
    this.engagementId,
    this.resourceId,
    this.resourceType,
  });

  factory EngagementResourceAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return EngagementResourceAssociationSummary(
      catalog: (json['Catalog'] as String?) ?? '',
      createdBy: json['CreatedBy'] as String?,
      engagementId: json['EngagementId'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceType:
          (json['ResourceType'] as String?)?.let(ResourceType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final createdBy = this.createdBy;
    final engagementId = this.engagementId;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      'Catalog': catalog,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (engagementId != null) 'EngagementId': engagementId,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType.value,
    };
  }
}

/// Represents the payload of a resource snapshot. This structure is designed to
/// accommodate different types of resource snapshots, currently supporting
/// opportunity summaries.
///
/// @nodoc
class ResourceSnapshotPayload {
  /// Provides a comprehensive view of AwsOpportunitySummaryFullView template.
  final AwsOpportunitySummaryFullView? awsOpportunitySummaryFullView;

  /// An object that contains an <code>opportunity</code>'s subset of fields.
  final OpportunitySummaryView? opportunitySummary;

  ResourceSnapshotPayload({
    this.awsOpportunitySummaryFullView,
    this.opportunitySummary,
  });

  factory ResourceSnapshotPayload.fromJson(Map<String, dynamic> json) {
    return ResourceSnapshotPayload(
      awsOpportunitySummaryFullView:
          json['AwsOpportunitySummaryFullView'] != null
              ? AwsOpportunitySummaryFullView.fromJson(
                  json['AwsOpportunitySummaryFullView'] as Map<String, dynamic>)
              : null,
      opportunitySummary: json['OpportunitySummary'] != null
          ? OpportunitySummaryView.fromJson(
              json['OpportunitySummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsOpportunitySummaryFullView = this.awsOpportunitySummaryFullView;
    final opportunitySummary = this.opportunitySummary;
    return {
      if (awsOpportunitySummaryFullView != null)
        'AwsOpportunitySummaryFullView': awsOpportunitySummaryFullView,
      if (opportunitySummary != null) 'OpportunitySummary': opportunitySummary,
    };
  }
}

/// Provides a comprehensive view of an opportunity summary, including lifecycle
/// information, team details, opportunity type, primary needs from AWS, and
/// associated project information.
///
/// @nodoc
class OpportunitySummaryView {
  final Customer? customer;

  /// Contains information about the opportunity's lifecycle, including its
  /// current stage, status, and important dates such as creation and last
  /// modification times.
  final LifeCycleForView? lifecycle;

  /// Represents the internal team handling the opportunity. Specify the members
  /// involved in collaborating on an opportunity within the partner's
  /// organization.
  final List<Contact>? opportunityTeam;

  /// Specifies the opportunity type.
  final OpportunityType? opportunityType;

  /// Identifies the type of support the partner needs from AWS.
  final List<PrimaryNeedFromAws>? primaryNeedsFromAws;

  /// Contains summary information about the project associated with the
  /// opportunity, including project name, description, timeline, and other
  /// relevant details.
  final ProjectView? project;
  final RelatedEntityIdentifiers? relatedEntityIdentifiers;

  OpportunitySummaryView({
    this.customer,
    this.lifecycle,
    this.opportunityTeam,
    this.opportunityType,
    this.primaryNeedsFromAws,
    this.project,
    this.relatedEntityIdentifiers,
  });

  factory OpportunitySummaryView.fromJson(Map<String, dynamic> json) {
    return OpportunitySummaryView(
      customer: json['Customer'] != null
          ? Customer.fromJson(json['Customer'] as Map<String, dynamic>)
          : null,
      lifecycle: json['Lifecycle'] != null
          ? LifeCycleForView.fromJson(json['Lifecycle'] as Map<String, dynamic>)
          : null,
      opportunityTeam: (json['OpportunityTeam'] as List?)
          ?.nonNulls
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      opportunityType:
          (json['OpportunityType'] as String?)?.let(OpportunityType.fromString),
      primaryNeedsFromAws: (json['PrimaryNeedsFromAws'] as List?)
          ?.nonNulls
          .map((e) => PrimaryNeedFromAws.fromString((e as String)))
          .toList(),
      project: json['Project'] != null
          ? ProjectView.fromJson(json['Project'] as Map<String, dynamic>)
          : null,
      relatedEntityIdentifiers: json['RelatedEntityIdentifiers'] != null
          ? RelatedEntityIdentifiers.fromJson(
              json['RelatedEntityIdentifiers'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customer = this.customer;
    final lifecycle = this.lifecycle;
    final opportunityTeam = this.opportunityTeam;
    final opportunityType = this.opportunityType;
    final primaryNeedsFromAws = this.primaryNeedsFromAws;
    final project = this.project;
    final relatedEntityIdentifiers = this.relatedEntityIdentifiers;
    return {
      if (customer != null) 'Customer': customer,
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (opportunityTeam != null) 'OpportunityTeam': opportunityTeam,
      if (opportunityType != null) 'OpportunityType': opportunityType.value,
      if (primaryNeedsFromAws != null)
        'PrimaryNeedsFromAws': primaryNeedsFromAws.map((e) => e.value).toList(),
      if (project != null) 'Project': project,
      if (relatedEntityIdentifiers != null)
        'RelatedEntityIdentifiers': relatedEntityIdentifiers,
    };
  }
}

/// Provides a comprehensive view of AwsOpportunitySummaryFullView template.
///
/// @nodoc
class AwsOpportunitySummaryFullView {
  final AwsOpportunityCustomer? customer;
  final AwsOpportunityInsights? insights;

  /// Type of AWS involvement in the opportunity.
  final SalesInvolvementType? involvementType;

  /// Reason for changes in AWS involvement type for the opportunity.
  final InvolvementTypeChangeReason? involvementTypeChangeReason;
  final AwsOpportunityLifeCycle? lifeCycle;

  /// AWS team members involved in the opportunity.
  final List<AwsTeamMember>? opportunityTeam;

  /// Source origin of the AWS opportunity.
  final OpportunityOrigin? origin;
  final AwsOpportunityProject? project;
  final AwsOpportunityRelatedEntities? relatedEntityIds;

  /// Identifier of the related partner opportunity.
  final String? relatedOpportunityId;

  /// Visibility level for the AWS opportunity.
  final Visibility? visibility;

  AwsOpportunitySummaryFullView({
    this.customer,
    this.insights,
    this.involvementType,
    this.involvementTypeChangeReason,
    this.lifeCycle,
    this.opportunityTeam,
    this.origin,
    this.project,
    this.relatedEntityIds,
    this.relatedOpportunityId,
    this.visibility,
  });

  factory AwsOpportunitySummaryFullView.fromJson(Map<String, dynamic> json) {
    return AwsOpportunitySummaryFullView(
      customer: json['Customer'] != null
          ? AwsOpportunityCustomer.fromJson(
              json['Customer'] as Map<String, dynamic>)
          : null,
      insights: json['Insights'] != null
          ? AwsOpportunityInsights.fromJson(
              json['Insights'] as Map<String, dynamic>)
          : null,
      involvementType: (json['InvolvementType'] as String?)
          ?.let(SalesInvolvementType.fromString),
      involvementTypeChangeReason:
          (json['InvolvementTypeChangeReason'] as String?)
              ?.let(InvolvementTypeChangeReason.fromString),
      lifeCycle: json['LifeCycle'] != null
          ? AwsOpportunityLifeCycle.fromJson(
              json['LifeCycle'] as Map<String, dynamic>)
          : null,
      opportunityTeam: (json['OpportunityTeam'] as List?)
          ?.nonNulls
          .map((e) => AwsTeamMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      origin: (json['Origin'] as String?)?.let(OpportunityOrigin.fromString),
      project: json['Project'] != null
          ? AwsOpportunityProject.fromJson(
              json['Project'] as Map<String, dynamic>)
          : null,
      relatedEntityIds: json['RelatedEntityIds'] != null
          ? AwsOpportunityRelatedEntities.fromJson(
              json['RelatedEntityIds'] as Map<String, dynamic>)
          : null,
      relatedOpportunityId: json['RelatedOpportunityId'] as String?,
      visibility: (json['Visibility'] as String?)?.let(Visibility.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final customer = this.customer;
    final insights = this.insights;
    final involvementType = this.involvementType;
    final involvementTypeChangeReason = this.involvementTypeChangeReason;
    final lifeCycle = this.lifeCycle;
    final opportunityTeam = this.opportunityTeam;
    final origin = this.origin;
    final project = this.project;
    final relatedEntityIds = this.relatedEntityIds;
    final relatedOpportunityId = this.relatedOpportunityId;
    final visibility = this.visibility;
    return {
      if (customer != null) 'Customer': customer,
      if (insights != null) 'Insights': insights,
      if (involvementType != null) 'InvolvementType': involvementType.value,
      if (involvementTypeChangeReason != null)
        'InvolvementTypeChangeReason': involvementTypeChangeReason.value,
      if (lifeCycle != null) 'LifeCycle': lifeCycle,
      if (opportunityTeam != null) 'OpportunityTeam': opportunityTeam,
      if (origin != null) 'Origin': origin.value,
      if (project != null) 'Project': project,
      if (relatedEntityIds != null) 'RelatedEntityIds': relatedEntityIds,
      if (relatedOpportunityId != null)
        'RelatedOpportunityId': relatedOpportunityId,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

/// @nodoc
class OpportunityOrigin {
  static const awsReferral = OpportunityOrigin._('AWS Referral');
  static const partnerReferral = OpportunityOrigin._('Partner Referral');

  final String value;

  const OpportunityOrigin._(this.value);

  static const values = [awsReferral, partnerReferral];

  static OpportunityOrigin fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OpportunityOrigin._(value));

  @override
  bool operator ==(other) => other is OpportunityOrigin && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SalesInvolvementType {
  static const forVisibilityOnly =
      SalesInvolvementType._('For Visibility Only');
  static const coSell = SalesInvolvementType._('Co-Sell');

  final String value;

  const SalesInvolvementType._(this.value);

  static const values = [forVisibilityOnly, coSell];

  static SalesInvolvementType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SalesInvolvementType._(value));

  @override
  bool operator ==(other) =>
      other is SalesInvolvementType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Visibility {
  static const full = Visibility._('Full');
  static const limited = Visibility._('Limited');

  final String value;

  const Visibility._(this.value);

  static const values = [full, limited];

  static Visibility fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Visibility._(value));

  @override
  bool operator ==(other) => other is Visibility && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Tracks the lifecycle of the AWS opportunity, including stages such as
/// qualification, validation, and closure. This field helps partners understand
/// the current status and progression of the opportunity.
///
/// @nodoc
class AwsOpportunityLifeCycle {
  /// Indicates the reason why an opportunity was marked as <code>Closed
  /// Lost</code>. This helps in understanding the context behind the lost
  /// opportunity and aids in refining future strategies.
  final AwsClosedLostReason? closedLostReason;

  /// Specifies the immediate next steps required to progress the opportunity.
  /// These steps are based on AWS guidance and the current stage of the
  /// opportunity.
  final String? nextSteps;

  /// Provides a historical log of previous next steps that were taken to move the
  /// opportunity forward. This helps in tracking the decision-making process and
  /// identifying any delays or obstacles encountered.
  final List<ProfileNextStepsHistory>? nextStepsHistory;

  /// Represents the current stage of the opportunity in its lifecycle, such as
  /// <code>Qualification</code>, <code>Validation</code>, or <code>Closed
  /// Won</code>. This helps in understanding the opportunity's progress.
  final AwsOpportunityStage? stage;

  /// Indicates the expected date by which the opportunity is projected to close.
  /// This field helps in planning resources and timelines for both the partner
  /// and AWS.
  final String? targetCloseDate;

  AwsOpportunityLifeCycle({
    this.closedLostReason,
    this.nextSteps,
    this.nextStepsHistory,
    this.stage,
    this.targetCloseDate,
  });

  factory AwsOpportunityLifeCycle.fromJson(Map<String, dynamic> json) {
    return AwsOpportunityLifeCycle(
      closedLostReason: (json['ClosedLostReason'] as String?)
          ?.let(AwsClosedLostReason.fromString),
      nextSteps: json['NextSteps'] as String?,
      nextStepsHistory: (json['NextStepsHistory'] as List?)
          ?.nonNulls
          .map((e) =>
              ProfileNextStepsHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      stage: (json['Stage'] as String?)?.let(AwsOpportunityStage.fromString),
      targetCloseDate: json['TargetCloseDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final closedLostReason = this.closedLostReason;
    final nextSteps = this.nextSteps;
    final nextStepsHistory = this.nextStepsHistory;
    final stage = this.stage;
    final targetCloseDate = this.targetCloseDate;
    return {
      if (closedLostReason != null) 'ClosedLostReason': closedLostReason.value,
      if (nextSteps != null) 'NextSteps': nextSteps,
      if (nextStepsHistory != null) 'NextStepsHistory': nextStepsHistory,
      if (stage != null) 'Stage': stage.value,
      if (targetCloseDate != null) 'TargetCloseDate': targetCloseDate,
    };
  }
}

/// Contains insights provided by AWS for the opportunity, offering
/// recommendations and analysis that can help the partner optimize their
/// engagement and strategy.
///
/// @nodoc
class AwsOpportunityInsights {
  /// Source-separated spend insights that provide independent analysis for AWS
  /// recommendations and partner estimates.
  final AwsProductsSpendInsightsBySource? awsProductsSpendInsightsBySource;

  /// Represents a score assigned by AWS to indicate the level of engagement and
  /// potential success for the opportunity. This score helps partners prioritize
  /// their efforts.
  final EngagementScore? engagementScore;

  /// Provides recommendations from AWS on the next best actions to take in order
  /// to move the opportunity forward and increase the likelihood of success.
  final String? nextBestActions;

  AwsOpportunityInsights({
    this.awsProductsSpendInsightsBySource,
    this.engagementScore,
    this.nextBestActions,
  });

  factory AwsOpportunityInsights.fromJson(Map<String, dynamic> json) {
    return AwsOpportunityInsights(
      awsProductsSpendInsightsBySource:
          json['AwsProductsSpendInsightsBySource'] != null
              ? AwsProductsSpendInsightsBySource.fromJson(
                  json['AwsProductsSpendInsightsBySource']
                      as Map<String, dynamic>)
              : null,
      engagementScore:
          (json['EngagementScore'] as String?)?.let(EngagementScore.fromString),
      nextBestActions: json['NextBestActions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsProductsSpendInsightsBySource =
        this.awsProductsSpendInsightsBySource;
    final engagementScore = this.engagementScore;
    final nextBestActions = this.nextBestActions;
    return {
      if (awsProductsSpendInsightsBySource != null)
        'AwsProductsSpendInsightsBySource': awsProductsSpendInsightsBySource,
      if (engagementScore != null) 'EngagementScore': engagementScore.value,
      if (nextBestActions != null) 'NextBestActions': nextBestActions,
    };
  }
}

/// @nodoc
class InvolvementTypeChangeReason {
  static const expansionOpportunity =
      InvolvementTypeChangeReason._('Expansion Opportunity');
  static const changeInDealInformation =
      InvolvementTypeChangeReason._('Change in Deal Information');
  static const customerRequested =
      InvolvementTypeChangeReason._('Customer Requested');
  static const technicalComplexity =
      InvolvementTypeChangeReason._('Technical Complexity');
  static const riskMitigation =
      InvolvementTypeChangeReason._('Risk Mitigation');

  final String value;

  const InvolvementTypeChangeReason._(this.value);

  static const values = [
    expansionOpportunity,
    changeInDealInformation,
    customerRequested,
    technicalComplexity,
    riskMitigation
  ];

  static InvolvementTypeChangeReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InvolvementTypeChangeReason._(value));

  @override
  bool operator ==(other) =>
      other is InvolvementTypeChangeReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents other entities related to the AWS opportunity, such as AWS
/// products, partner solutions, and marketplace offers. These associations help
/// build a complete picture of the solution being sold.
///
/// @nodoc
class AwsOpportunityRelatedEntities {
  /// Specifies the AWS products associated with the opportunity. This field helps
  /// track the specific products that are part of the proposed solution.
  final List<String>? awsProducts;

  /// Specifies the partner solutions related to the opportunity. These solutions
  /// represent the partner's offerings that are being positioned as part of the
  /// overall AWS opportunity.
  final List<String>? solutions;

  AwsOpportunityRelatedEntities({
    this.awsProducts,
    this.solutions,
  });

  factory AwsOpportunityRelatedEntities.fromJson(Map<String, dynamic> json) {
    return AwsOpportunityRelatedEntities(
      awsProducts: (json['AwsProducts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      solutions: (json['Solutions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsProducts = this.awsProducts;
    final solutions = this.solutions;
    return {
      if (awsProducts != null) 'AwsProducts': awsProducts,
      if (solutions != null) 'Solutions': solutions,
    };
  }
}

/// Represents the customer associated with the AWS opportunity. This field
/// captures key details about the customer that are necessary for managing the
/// opportunity.
///
/// @nodoc
class AwsOpportunityCustomer {
  /// Provides a list of customer contacts involved in the opportunity. These
  /// contacts may include decision makers, influencers, and other stakeholders
  /// within the customer's organization.
  final List<Contact>? contacts;

  AwsOpportunityCustomer({
    this.contacts,
  });

  factory AwsOpportunityCustomer.fromJson(Map<String, dynamic> json) {
    return AwsOpportunityCustomer(
      contacts: (json['Contacts'] as List?)
          ?.nonNulls
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final contacts = this.contacts;
    return {
      if (contacts != null) 'Contacts': contacts,
    };
  }
}

/// Captures details about the project associated with the opportunity,
/// including objectives, scope, and customer requirements.
///
/// @nodoc
class AwsOpportunityProject {
  /// AWS partition where the opportunity will be deployed. Possible values:
  /// <code>aws-eusc</code> for AWS European Sovereign Cloud, <code>null</code>
  /// for all other partitions.
  final AwsPartition? awsPartition;

  /// Indicates the expected spending by the customer over the course of the
  /// project. This value helps partners and AWS estimate the financial impact of
  /// the opportunity. Use the <a href="https://calculator.aws/#/">AWS Pricing
  /// Calculator</a> to create an estimate of the customer’s total spend. If only
  /// annual recurring revenue (ARR) is available, distribute it across 12 months
  /// to provide an average monthly value.
  final List<ExpectedCustomerSpend>? expectedCustomerSpend;

  AwsOpportunityProject({
    this.awsPartition,
    this.expectedCustomerSpend,
  });

  factory AwsOpportunityProject.fromJson(Map<String, dynamic> json) {
    return AwsOpportunityProject(
      awsPartition:
          (json['AwsPartition'] as String?)?.let(AwsPartition.fromString),
      expectedCustomerSpend: (json['ExpectedCustomerSpend'] as List?)
          ?.nonNulls
          .map((e) => ExpectedCustomerSpend.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsPartition = this.awsPartition;
    final expectedCustomerSpend = this.expectedCustomerSpend;
    return {
      if (awsPartition != null) 'AwsPartition': awsPartition.value,
      if (expectedCustomerSpend != null)
        'ExpectedCustomerSpend': expectedCustomerSpend,
    };
  }
}

/// @nodoc
class AwsPartition {
  static const awsEusc = AwsPartition._('aws-eusc');

  final String value;

  const AwsPartition._(this.value);

  static const values = [awsEusc];

  static AwsPartition fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AwsPartition._(value));

  @override
  bool operator ==(other) => other is AwsPartition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides an estimate of the revenue that the partner is expected to generate
/// from the opportunity. This information helps partners assess the financial
/// value of the project.
///
/// @nodoc
class ExpectedCustomerSpend {
  /// Indicates the currency in which the revenue estimate is provided. This helps
  /// in understanding the financial impact across different markets. Accepted
  /// values are <code>USD</code> (US Dollars) and <code>EUR</code> (Euros). If
  /// the AWS Partition is <code>aws-eusc</code> (AWS European Sovereign Cloud),
  /// the currency code must be <code>EUR</code>.
  final CurrencyCode currencyCode;

  /// Indicates how frequently the customer is expected to spend the projected
  /// amount. Only the value <code>Monthly</code> is allowed for the
  /// <code>Frequency</code> field, representing recurring monthly spend.
  final PaymentFrequency frequency;

  /// Specifies the name of the partner company that is expected to generate
  /// revenue from the opportunity. This field helps track the partner’s
  /// involvement in the opportunity. This field only accepts the value
  /// <code>AWS</code>. If any other value is provided, the system will
  /// automatically set it to <code>AWS</code>.
  final String targetCompany;

  /// Represents the estimated monthly revenue that the partner expects to earn
  /// from the opportunity. This helps in forecasting financial returns.
  final String? amount;

  /// A URL providing additional information or context about the spend
  /// estimation.
  final String? estimationUrl;

  ExpectedCustomerSpend({
    required this.currencyCode,
    required this.frequency,
    required this.targetCompany,
    this.amount,
    this.estimationUrl,
  });

  factory ExpectedCustomerSpend.fromJson(Map<String, dynamic> json) {
    return ExpectedCustomerSpend(
      currencyCode:
          CurrencyCode.fromString((json['CurrencyCode'] as String?) ?? ''),
      frequency:
          PaymentFrequency.fromString((json['Frequency'] as String?) ?? ''),
      targetCompany: (json['TargetCompany'] as String?) ?? '',
      amount: json['Amount'] as String?,
      estimationUrl: json['EstimationUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final frequency = this.frequency;
    final targetCompany = this.targetCompany;
    final amount = this.amount;
    final estimationUrl = this.estimationUrl;
    return {
      'CurrencyCode': currencyCode.value,
      'Frequency': frequency.value,
      'TargetCompany': targetCompany,
      if (amount != null) 'Amount': amount,
      if (estimationUrl != null) 'EstimationUrl': estimationUrl,
    };
  }
}

/// @nodoc
class CurrencyCode {
  static const usd = CurrencyCode._('USD');
  static const eur = CurrencyCode._('EUR');
  static const gbp = CurrencyCode._('GBP');
  static const aud = CurrencyCode._('AUD');
  static const cad = CurrencyCode._('CAD');
  static const cny = CurrencyCode._('CNY');
  static const nzd = CurrencyCode._('NZD');
  static const inr = CurrencyCode._('INR');
  static const jpy = CurrencyCode._('JPY');
  static const chf = CurrencyCode._('CHF');
  static const sek = CurrencyCode._('SEK');
  static const aed = CurrencyCode._('AED');
  static const afn = CurrencyCode._('AFN');
  static const all = CurrencyCode._('ALL');
  static const amd = CurrencyCode._('AMD');
  static const ang = CurrencyCode._('ANG');
  static const aoa = CurrencyCode._('AOA');
  static const ars = CurrencyCode._('ARS');
  static const awg = CurrencyCode._('AWG');
  static const azn = CurrencyCode._('AZN');
  static const bam = CurrencyCode._('BAM');
  static const bbd = CurrencyCode._('BBD');
  static const bdt = CurrencyCode._('BDT');
  static const bgn = CurrencyCode._('BGN');
  static const bhd = CurrencyCode._('BHD');
  static const bif = CurrencyCode._('BIF');
  static const bmd = CurrencyCode._('BMD');
  static const bnd = CurrencyCode._('BND');
  static const bob = CurrencyCode._('BOB');
  static const bov = CurrencyCode._('BOV');
  static const brl = CurrencyCode._('BRL');
  static const bsd = CurrencyCode._('BSD');
  static const btn = CurrencyCode._('BTN');
  static const bwp = CurrencyCode._('BWP');
  static const byn = CurrencyCode._('BYN');
  static const bzd = CurrencyCode._('BZD');
  static const cdf = CurrencyCode._('CDF');
  static const che = CurrencyCode._('CHE');
  static const chw = CurrencyCode._('CHW');
  static const clf = CurrencyCode._('CLF');
  static const clp = CurrencyCode._('CLP');
  static const cop = CurrencyCode._('COP');
  static const cou = CurrencyCode._('COU');
  static const crc = CurrencyCode._('CRC');
  static const cuc = CurrencyCode._('CUC');
  static const cup = CurrencyCode._('CUP');
  static const cve = CurrencyCode._('CVE');
  static const czk = CurrencyCode._('CZK');
  static const djf = CurrencyCode._('DJF');
  static const dkk = CurrencyCode._('DKK');
  static const dop = CurrencyCode._('DOP');
  static const dzd = CurrencyCode._('DZD');
  static const egp = CurrencyCode._('EGP');
  static const ern = CurrencyCode._('ERN');
  static const etb = CurrencyCode._('ETB');
  static const fjd = CurrencyCode._('FJD');
  static const fkp = CurrencyCode._('FKP');
  static const gel = CurrencyCode._('GEL');
  static const ghs = CurrencyCode._('GHS');
  static const gip = CurrencyCode._('GIP');
  static const gmd = CurrencyCode._('GMD');
  static const gnf = CurrencyCode._('GNF');
  static const gtq = CurrencyCode._('GTQ');
  static const gyd = CurrencyCode._('GYD');
  static const hkd = CurrencyCode._('HKD');
  static const hnl = CurrencyCode._('HNL');
  static const hrk = CurrencyCode._('HRK');
  static const htg = CurrencyCode._('HTG');
  static const huf = CurrencyCode._('HUF');
  static const idr = CurrencyCode._('IDR');
  static const ils = CurrencyCode._('ILS');
  static const iqd = CurrencyCode._('IQD');
  static const irr = CurrencyCode._('IRR');
  static const isk = CurrencyCode._('ISK');
  static const jmd = CurrencyCode._('JMD');
  static const jod = CurrencyCode._('JOD');
  static const kes = CurrencyCode._('KES');
  static const kgs = CurrencyCode._('KGS');
  static const khr = CurrencyCode._('KHR');
  static const kmf = CurrencyCode._('KMF');
  static const kpw = CurrencyCode._('KPW');
  static const krw = CurrencyCode._('KRW');
  static const kwd = CurrencyCode._('KWD');
  static const kyd = CurrencyCode._('KYD');
  static const kzt = CurrencyCode._('KZT');
  static const lak = CurrencyCode._('LAK');
  static const lbp = CurrencyCode._('LBP');
  static const lkr = CurrencyCode._('LKR');
  static const lrd = CurrencyCode._('LRD');
  static const lsl = CurrencyCode._('LSL');
  static const lyd = CurrencyCode._('LYD');
  static const mad = CurrencyCode._('MAD');
  static const mdl = CurrencyCode._('MDL');
  static const mga = CurrencyCode._('MGA');
  static const mkd = CurrencyCode._('MKD');
  static const mmk = CurrencyCode._('MMK');
  static const mnt = CurrencyCode._('MNT');
  static const mop = CurrencyCode._('MOP');
  static const mru = CurrencyCode._('MRU');
  static const mur = CurrencyCode._('MUR');
  static const mvr = CurrencyCode._('MVR');
  static const mwk = CurrencyCode._('MWK');
  static const mxn = CurrencyCode._('MXN');
  static const mxv = CurrencyCode._('MXV');
  static const myr = CurrencyCode._('MYR');
  static const mzn = CurrencyCode._('MZN');
  static const nad = CurrencyCode._('NAD');
  static const ngn = CurrencyCode._('NGN');
  static const nio = CurrencyCode._('NIO');
  static const nok = CurrencyCode._('NOK');
  static const npr = CurrencyCode._('NPR');
  static const omr = CurrencyCode._('OMR');
  static const pab = CurrencyCode._('PAB');
  static const pen = CurrencyCode._('PEN');
  static const pgk = CurrencyCode._('PGK');
  static const php = CurrencyCode._('PHP');
  static const pkr = CurrencyCode._('PKR');
  static const pln = CurrencyCode._('PLN');
  static const pyg = CurrencyCode._('PYG');
  static const qar = CurrencyCode._('QAR');
  static const ron = CurrencyCode._('RON');
  static const rsd = CurrencyCode._('RSD');
  static const rub = CurrencyCode._('RUB');
  static const rwf = CurrencyCode._('RWF');
  static const sar = CurrencyCode._('SAR');
  static const sbd = CurrencyCode._('SBD');
  static const scr = CurrencyCode._('SCR');
  static const sdg = CurrencyCode._('SDG');
  static const sgd = CurrencyCode._('SGD');
  static const shp = CurrencyCode._('SHP');
  static const sll = CurrencyCode._('SLL');
  static const sos = CurrencyCode._('SOS');
  static const srd = CurrencyCode._('SRD');
  static const ssp = CurrencyCode._('SSP');
  static const stn = CurrencyCode._('STN');
  static const svc = CurrencyCode._('SVC');
  static const syp = CurrencyCode._('SYP');
  static const szl = CurrencyCode._('SZL');
  static const thb = CurrencyCode._('THB');
  static const tjs = CurrencyCode._('TJS');
  static const tmt = CurrencyCode._('TMT');
  static const tnd = CurrencyCode._('TND');
  static const top = CurrencyCode._('TOP');
  static const $try = CurrencyCode._('TRY');
  static const ttd = CurrencyCode._('TTD');
  static const twd = CurrencyCode._('TWD');
  static const tzs = CurrencyCode._('TZS');
  static const uah = CurrencyCode._('UAH');
  static const ugx = CurrencyCode._('UGX');
  static const usn = CurrencyCode._('USN');
  static const uyi = CurrencyCode._('UYI');
  static const uyu = CurrencyCode._('UYU');
  static const uzs = CurrencyCode._('UZS');
  static const vef = CurrencyCode._('VEF');
  static const vnd = CurrencyCode._('VND');
  static const vuv = CurrencyCode._('VUV');
  static const wst = CurrencyCode._('WST');
  static const xaf = CurrencyCode._('XAF');
  static const xcd = CurrencyCode._('XCD');
  static const xdr = CurrencyCode._('XDR');
  static const xof = CurrencyCode._('XOF');
  static const xpf = CurrencyCode._('XPF');
  static const xsu = CurrencyCode._('XSU');
  static const xua = CurrencyCode._('XUA');
  static const yer = CurrencyCode._('YER');
  static const zar = CurrencyCode._('ZAR');
  static const zmw = CurrencyCode._('ZMW');
  static const zwl = CurrencyCode._('ZWL');

  final String value;

  const CurrencyCode._(this.value);

  static const values = [
    usd,
    eur,
    gbp,
    aud,
    cad,
    cny,
    nzd,
    inr,
    jpy,
    chf,
    sek,
    aed,
    afn,
    all,
    amd,
    ang,
    aoa,
    ars,
    awg,
    azn,
    bam,
    bbd,
    bdt,
    bgn,
    bhd,
    bif,
    bmd,
    bnd,
    bob,
    bov,
    brl,
    bsd,
    btn,
    bwp,
    byn,
    bzd,
    cdf,
    che,
    chw,
    clf,
    clp,
    cop,
    cou,
    crc,
    cuc,
    cup,
    cve,
    czk,
    djf,
    dkk,
    dop,
    dzd,
    egp,
    ern,
    etb,
    fjd,
    fkp,
    gel,
    ghs,
    gip,
    gmd,
    gnf,
    gtq,
    gyd,
    hkd,
    hnl,
    hrk,
    htg,
    huf,
    idr,
    ils,
    iqd,
    irr,
    isk,
    jmd,
    jod,
    kes,
    kgs,
    khr,
    kmf,
    kpw,
    krw,
    kwd,
    kyd,
    kzt,
    lak,
    lbp,
    lkr,
    lrd,
    lsl,
    lyd,
    mad,
    mdl,
    mga,
    mkd,
    mmk,
    mnt,
    mop,
    mru,
    mur,
    mvr,
    mwk,
    mxn,
    mxv,
    myr,
    mzn,
    nad,
    ngn,
    nio,
    nok,
    npr,
    omr,
    pab,
    pen,
    pgk,
    php,
    pkr,
    pln,
    pyg,
    qar,
    ron,
    rsd,
    rub,
    rwf,
    sar,
    sbd,
    scr,
    sdg,
    sgd,
    shp,
    sll,
    sos,
    srd,
    ssp,
    stn,
    svc,
    syp,
    szl,
    thb,
    tjs,
    tmt,
    tnd,
    top,
    $try,
    ttd,
    twd,
    tzs,
    uah,
    ugx,
    usn,
    uyi,
    uyu,
    uzs,
    vef,
    vnd,
    vuv,
    wst,
    xaf,
    xcd,
    xdr,
    xof,
    xpf,
    xsu,
    xua,
    yer,
    zar,
    zmw,
    zwl
  ];

  static CurrencyCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CurrencyCode._(value));

  @override
  bool operator ==(other) => other is CurrencyCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PaymentFrequency {
  static const monthly = PaymentFrequency._('Monthly');

  final String value;

  const PaymentFrequency._(this.value);

  static const values = [monthly];

  static PaymentFrequency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PaymentFrequency._(value));

  @override
  bool operator ==(other) => other is PaymentFrequency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that contains a <code>Customer Partner</code>'s contact details.
///
/// @nodoc
class Contact {
  /// The partner contact's title (job title or role) associated with the
  /// <code>Opportunity</code>. <code>BusinessTitle</code> supports either
  /// <code>PartnerAccountManager</code> or <code>OpportunityOwner</code>.
  final String? businessTitle;

  /// The contact's email address associated with the <code>Opportunity</code>.
  final String? email;

  /// The contact's first name associated with the <code>Opportunity</code>.
  final String? firstName;

  /// The contact's last name associated with the <code>Opportunity</code>.
  final String? lastName;

  /// The contact's phone number associated with the <code>Opportunity</code>.
  final String? phone;

  Contact({
    this.businessTitle,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      businessTitle: json['BusinessTitle'] as String?,
      email: json['Email'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      phone: json['Phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final businessTitle = this.businessTitle;
    final email = this.email;
    final firstName = this.firstName;
    final lastName = this.lastName;
    final phone = this.phone;
    return {
      if (businessTitle != null) 'BusinessTitle': businessTitle,
      if (email != null) 'Email': email,
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
      if (phone != null) 'Phone': phone,
    };
  }
}

/// @nodoc
class EngagementScore {
  static const high = EngagementScore._('High');
  static const medium = EngagementScore._('Medium');
  static const low = EngagementScore._('Low');

  final String value;

  const EngagementScore._(this.value);

  static const values = [high, medium, low];

  static EngagementScore fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EngagementScore._(value));

  @override
  bool operator ==(other) => other is EngagementScore && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Source-separated spend insights that provide independent analysis for AWS
/// recommendations and partner estimates.
///
/// @nodoc
class AwsProductsSpendInsightsBySource {
  /// AI-generated insights including recommended products from AWS.
  final AwsProductInsights? aws;

  /// Partner-sourced insights derived from Pricing Calculator URLs.
  final AwsProductInsights? partner;

  AwsProductsSpendInsightsBySource({
    this.aws,
    this.partner,
  });

  factory AwsProductsSpendInsightsBySource.fromJson(Map<String, dynamic> json) {
    return AwsProductsSpendInsightsBySource(
      aws: json['AWS'] != null
          ? AwsProductInsights.fromJson(json['AWS'] as Map<String, dynamic>)
          : null,
      partner: json['Partner'] != null
          ? AwsProductInsights.fromJson(json['Partner'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aws = this.aws;
    final partner = this.partner;
    return {
      if (aws != null) 'AWS': aws,
      if (partner != null) 'Partner': partner,
    };
  }
}

/// Comprehensive spend analysis for a single source (AWS or Partner) including
/// total amounts, optimization savings, program category breakdowns, and
/// detailed product-level insights.
///
/// @nodoc
class AwsProductInsights {
  /// Product-level details including costs and optimization recommendations.
  final List<AwsProductDetails> awsProducts;

  /// ISO 4217 currency code. Supported values are <code>USD</code> and
  /// <code>EUR</code>. Returns <code>EUR</code> when the opportunity is in the
  /// <code>aws-eusc</code> (AWS European Sovereign Cloud) partition.
  final CurrencyCode currencyCode;

  /// Time period for spend amounts.
  final PaymentFrequency frequency;

  /// Spend amounts mapped to AWS programs and modernization pathways.
  final Map<String, String> totalAmountByCategory;

  /// Total estimated spend for this source before optimizations.
  final String? totalAmount;

  /// Total estimated spend after applying recommended optimizations.
  final String? totalOptimizedAmount;

  /// Quantified savings achievable through implementing optimizations.
  final String? totalPotentialSavingsAmount;

  AwsProductInsights({
    required this.awsProducts,
    required this.currencyCode,
    required this.frequency,
    required this.totalAmountByCategory,
    this.totalAmount,
    this.totalOptimizedAmount,
    this.totalPotentialSavingsAmount,
  });

  factory AwsProductInsights.fromJson(Map<String, dynamic> json) {
    return AwsProductInsights(
      awsProducts: ((json['AwsProducts'] as List?) ?? const [])
          .nonNulls
          .map((e) => AwsProductDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      currencyCode:
          CurrencyCode.fromString((json['CurrencyCode'] as String?) ?? ''),
      frequency:
          PaymentFrequency.fromString((json['Frequency'] as String?) ?? ''),
      totalAmountByCategory:
          ((json['TotalAmountByCategory'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      totalAmount: json['TotalAmount'] as String?,
      totalOptimizedAmount: json['TotalOptimizedAmount'] as String?,
      totalPotentialSavingsAmount:
          json['TotalPotentialSavingsAmount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsProducts = this.awsProducts;
    final currencyCode = this.currencyCode;
    final frequency = this.frequency;
    final totalAmountByCategory = this.totalAmountByCategory;
    final totalAmount = this.totalAmount;
    final totalOptimizedAmount = this.totalOptimizedAmount;
    final totalPotentialSavingsAmount = this.totalPotentialSavingsAmount;
    return {
      'AwsProducts': awsProducts,
      'CurrencyCode': currencyCode.value,
      'Frequency': frequency.value,
      'TotalAmountByCategory': totalAmountByCategory,
      if (totalAmount != null) 'TotalAmount': totalAmount,
      if (totalOptimizedAmount != null)
        'TotalOptimizedAmount': totalOptimizedAmount,
      if (totalPotentialSavingsAmount != null)
        'TotalPotentialSavingsAmount': totalPotentialSavingsAmount,
    };
  }
}

/// List of AWS services with program eligibility indicators (MAP, modernization
/// pathways), cost estimates, and optimization recommendations.
///
/// @nodoc
class AwsProductDetails {
  /// List of program and pathway categories this product is eligible for.
  final List<String> categories;

  /// List of specific optimization recommendations for this product.
  final List<AwsProductOptimization> optimizations;

  /// AWS Partner Central product identifier used for opportunity association.
  final String productCode;

  /// Baseline service cost before optimizations.
  final String? amount;

  /// Service cost after applying optimizations.
  final String? optimizedAmount;

  /// Service-specific cost reduction through optimizations.
  final String? potentialSavingsAmount;

  /// Pricing Calculator service code.
  final String? serviceCode;

  AwsProductDetails({
    required this.categories,
    required this.optimizations,
    required this.productCode,
    this.amount,
    this.optimizedAmount,
    this.potentialSavingsAmount,
    this.serviceCode,
  });

  factory AwsProductDetails.fromJson(Map<String, dynamic> json) {
    return AwsProductDetails(
      categories: ((json['Categories'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      optimizations: ((json['Optimizations'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => AwsProductOptimization.fromJson(e as Map<String, dynamic>))
          .toList(),
      productCode: (json['ProductCode'] as String?) ?? '',
      amount: json['Amount'] as String?,
      optimizedAmount: json['OptimizedAmount'] as String?,
      potentialSavingsAmount: json['PotentialSavingsAmount'] as String?,
      serviceCode: json['ServiceCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final optimizations = this.optimizations;
    final productCode = this.productCode;
    final amount = this.amount;
    final optimizedAmount = this.optimizedAmount;
    final potentialSavingsAmount = this.potentialSavingsAmount;
    final serviceCode = this.serviceCode;
    return {
      'Categories': categories,
      'Optimizations': optimizations,
      'ProductCode': productCode,
      if (amount != null) 'Amount': amount,
      if (optimizedAmount != null) 'OptimizedAmount': optimizedAmount,
      if (potentialSavingsAmount != null)
        'PotentialSavingsAmount': potentialSavingsAmount,
      if (serviceCode != null) 'ServiceCode': serviceCode,
    };
  }
}

/// Specific optimization strategies partners can implement to reduce costs.
///
/// @nodoc
class AwsProductOptimization {
  /// Human-readable explanation of the optimization strategy.
  final String description;

  /// Quantified cost savings achievable by implementing this optimization.
  final String savingsAmount;

  AwsProductOptimization({
    required this.description,
    required this.savingsAmount,
  });

  factory AwsProductOptimization.fromJson(Map<String, dynamic> json) {
    return AwsProductOptimization(
      description: (json['Description'] as String?) ?? '',
      savingsAmount: (json['SavingsAmount'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final savingsAmount = this.savingsAmount;
    return {
      'Description': description,
      'SavingsAmount': savingsAmount,
    };
  }
}

/// Represents an Amazon Web Services team member for the engagement. This
/// structure includes details such as name, email, and business title.
///
/// @nodoc
class AwsTeamMember {
  /// Specifies the Amazon Web Services team member's business title and indicates
  /// their organizational role.
  final AwsMemberBusinessTitle? businessTitle;

  /// Provides the Amazon Web Services team member's email address.
  final String? email;

  /// Provides the Amazon Web Services team member's first name.
  final String? firstName;

  /// Provides the Amazon Web Services team member's last name.
  final String? lastName;

  AwsTeamMember({
    this.businessTitle,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory AwsTeamMember.fromJson(Map<String, dynamic> json) {
    return AwsTeamMember(
      businessTitle: (json['BusinessTitle'] as String?)
          ?.let(AwsMemberBusinessTitle.fromString),
      email: json['Email'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final businessTitle = this.businessTitle;
    final email = this.email;
    final firstName = this.firstName;
    final lastName = this.lastName;
    return {
      if (businessTitle != null) 'BusinessTitle': businessTitle.value,
      if (email != null) 'Email': email,
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
    };
  }
}

/// @nodoc
class AwsMemberBusinessTitle {
  static const awsSalesRep = AwsMemberBusinessTitle._('AWSSalesRep');
  static const awsAccountOwner = AwsMemberBusinessTitle._('AWSAccountOwner');
  static const wwpspdm = AwsMemberBusinessTitle._('WWPSPDM');
  static const pdm = AwsMemberBusinessTitle._('PDM');
  static const psm = AwsMemberBusinessTitle._('PSM');
  static const isvsm = AwsMemberBusinessTitle._('ISVSM');

  final String value;

  const AwsMemberBusinessTitle._(this.value);

  static const values = [
    awsSalesRep,
    awsAccountOwner,
    wwpspdm,
    pdm,
    psm,
    isvsm
  ];

  static AwsMemberBusinessTitle fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AwsMemberBusinessTitle._(value));

  @override
  bool operator ==(other) =>
      other is AwsMemberBusinessTitle && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AwsClosedLostReason {
  static const administrative = AwsClosedLostReason._('Administrative');
  static const businessAssociateAgreement =
      AwsClosedLostReason._('Business Associate Agreement');
  static const companyAcquiredDissolved =
      AwsClosedLostReason._('Company Acquired/Dissolved');
  static const competitiveOffering =
      AwsClosedLostReason._('Competitive Offering');
  static const customerDataRequirement =
      AwsClosedLostReason._('Customer Data Requirement');
  static const customerDeficiency =
      AwsClosedLostReason._('Customer Deficiency');
  static const customerExperience =
      AwsClosedLostReason._('Customer Experience');
  static const delayCancellationOfProject =
      AwsClosedLostReason._('Delay / Cancellation of Project');
  static const duplicate = AwsClosedLostReason._('Duplicate');
  static const duplicateOpportunity =
      AwsClosedLostReason._('Duplicate Opportunity');
  static const executiveBlocker = AwsClosedLostReason._('Executive Blocker');
  static const failedVetting = AwsClosedLostReason._('Failed Vetting');
  static const featureLimitation = AwsClosedLostReason._('Feature Limitation');
  static const financialCommercial =
      AwsClosedLostReason._('Financial/Commercial');
  static const insufficientAmazonValue =
      AwsClosedLostReason._('Insufficient Amazon Value');
  static const insufficientAwsValue =
      AwsClosedLostReason._('Insufficient AWS Value');
  static const internationalConstraints =
      AwsClosedLostReason._('International Constraints');
  static const legalTaxRegulatory =
      AwsClosedLostReason._('Legal / Tax / Regulatory');
  static const legalTermsAndConditions =
      AwsClosedLostReason._('Legal Terms and Conditions');
  static const lostToCompetitor = AwsClosedLostReason._('Lost to Competitor');
  static const lostToCompetitorGoogle =
      AwsClosedLostReason._('Lost to Competitor - Google');
  static const lostToCompetitorMicrosoft =
      AwsClosedLostReason._('Lost to Competitor - Microsoft');
  static const lostToCompetitorOther =
      AwsClosedLostReason._('Lost to Competitor - Other');
  static const lostToCompetitorRackspace =
      AwsClosedLostReason._('Lost to Competitor - Rackspace');
  static const lostToCompetitorSoftLayer =
      AwsClosedLostReason._('Lost to Competitor - SoftLayer');
  static const lostToCompetitorVMWare =
      AwsClosedLostReason._('Lost to Competitor - VMWare');
  static const noCustomerReference =
      AwsClosedLostReason._('No Customer Reference');
  static const noIntegrationResources =
      AwsClosedLostReason._('No Integration Resources');
  static const noOpportunity = AwsClosedLostReason._('No Opportunity');
  static const noPerceivedValueOfMp =
      AwsClosedLostReason._('No Perceived Value of MP');
  static const noResponse = AwsClosedLostReason._('No Response');
  static const notCommittedToAws =
      AwsClosedLostReason._('Not Committed to AWS');
  static const noUpdate = AwsClosedLostReason._('No Update');
  static const onPremisesDeployment =
      AwsClosedLostReason._('On Premises Deployment');
  static const other = AwsClosedLostReason._('Other');
  static const otherDetailsInDescription =
      AwsClosedLostReason._('Other (Details in Description)');
  static const partnerGap = AwsClosedLostReason._('Partner Gap');
  static const pastDue = AwsClosedLostReason._('Past Due');
  static const peopleRelationshipGovernance =
      AwsClosedLostReason._('People/Relationship/Governance');
  static const platformTechnologyLimitation =
      AwsClosedLostReason._('Platform Technology Limitation');
  static const preferenceForCompetitor =
      AwsClosedLostReason._('Preference for Competitor');
  static const price = AwsClosedLostReason._('Price');
  static const productTechnology = AwsClosedLostReason._('Product/Technology');
  static const productNotOnAws = AwsClosedLostReason._('Product Not on AWS');
  static const securityCompliance =
      AwsClosedLostReason._('Security / Compliance');
  static const selfService = AwsClosedLostReason._('Self-Service');
  static const technicalLimitations =
      AwsClosedLostReason._('Technical Limitations');
  static const termSheetImpasse = AwsClosedLostReason._('Term Sheet Impasse');

  final String value;

  const AwsClosedLostReason._(this.value);

  static const values = [
    administrative,
    businessAssociateAgreement,
    companyAcquiredDissolved,
    competitiveOffering,
    customerDataRequirement,
    customerDeficiency,
    customerExperience,
    delayCancellationOfProject,
    duplicate,
    duplicateOpportunity,
    executiveBlocker,
    failedVetting,
    featureLimitation,
    financialCommercial,
    insufficientAmazonValue,
    insufficientAwsValue,
    internationalConstraints,
    legalTaxRegulatory,
    legalTermsAndConditions,
    lostToCompetitor,
    lostToCompetitorGoogle,
    lostToCompetitorMicrosoft,
    lostToCompetitorOther,
    lostToCompetitorRackspace,
    lostToCompetitorSoftLayer,
    lostToCompetitorVMWare,
    noCustomerReference,
    noIntegrationResources,
    noOpportunity,
    noPerceivedValueOfMp,
    noResponse,
    notCommittedToAws,
    noUpdate,
    onPremisesDeployment,
    other,
    otherDetailsInDescription,
    partnerGap,
    pastDue,
    peopleRelationshipGovernance,
    platformTechnologyLimitation,
    preferenceForCompetitor,
    price,
    productTechnology,
    productNotOnAws,
    securityCompliance,
    selfService,
    technicalLimitations,
    termSheetImpasse
  ];

  static AwsClosedLostReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AwsClosedLostReason._(value));

  @override
  bool operator ==(other) =>
      other is AwsClosedLostReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AwsOpportunityStage {
  static const notStarted = AwsOpportunityStage._('Not Started');
  static const inProgress = AwsOpportunityStage._('In Progress');
  static const prospect = AwsOpportunityStage._('Prospect');
  static const engaged = AwsOpportunityStage._('Engaged');
  static const identified = AwsOpportunityStage._('Identified');
  static const qualify = AwsOpportunityStage._('Qualify');
  static const research = AwsOpportunityStage._('Research');
  static const sellerEngaged = AwsOpportunityStage._('Seller Engaged');
  static const evaluating = AwsOpportunityStage._('Evaluating');
  static const sellerRegistered = AwsOpportunityStage._('Seller Registered');
  static const termSheetNegotiation =
      AwsOpportunityStage._('Term Sheet Negotiation');
  static const contractNegotiation =
      AwsOpportunityStage._('Contract Negotiation');
  static const onboarding = AwsOpportunityStage._('Onboarding');
  static const buildingIntegration =
      AwsOpportunityStage._('Building Integration');
  static const qualified = AwsOpportunityStage._('Qualified');
  static const onHold = AwsOpportunityStage._('On-hold');
  static const technicalValidation =
      AwsOpportunityStage._('Technical Validation');
  static const businessValidation =
      AwsOpportunityStage._('Business Validation');
  static const committed = AwsOpportunityStage._('Committed');
  static const launched = AwsOpportunityStage._('Launched');
  static const deferredToPartner = AwsOpportunityStage._('Deferred to Partner');
  static const closedLost = AwsOpportunityStage._('Closed Lost');
  static const completed = AwsOpportunityStage._('Completed');
  static const closedIncomplete = AwsOpportunityStage._('Closed Incomplete');

  final String value;

  const AwsOpportunityStage._(this.value);

  static const values = [
    notStarted,
    inProgress,
    prospect,
    engaged,
    identified,
    qualify,
    research,
    sellerEngaged,
    evaluating,
    sellerRegistered,
    termSheetNegotiation,
    contractNegotiation,
    onboarding,
    buildingIntegration,
    qualified,
    onHold,
    technicalValidation,
    businessValidation,
    committed,
    launched,
    deferredToPartner,
    closedLost,
    completed,
    closedIncomplete
  ];

  static AwsOpportunityStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AwsOpportunityStage._(value));

  @override
  bool operator ==(other) =>
      other is AwsOpportunityStage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Tracks the history of next steps associated with the opportunity. This field
/// captures the actions planned for the future and their timeline.
///
/// @nodoc
class ProfileNextStepsHistory {
  /// Indicates the date and time when a particular next step was recorded or
  /// planned. This helps in managing the timeline for the opportunity.
  final DateTime time;

  /// Represents the details of the next step recorded, such as follow-up actions
  /// or decisions made. This field helps in tracking progress and ensuring
  /// alignment with project goals.
  final String value;

  ProfileNextStepsHistory({
    required this.time,
    required this.value,
  });

  factory ProfileNextStepsHistory.fromJson(Map<String, dynamic> json) {
    return ProfileNextStepsHistory(
      time: nonNullableTimeStampFromJson(json['Time'] ?? 0),
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final time = this.time;
    final value = this.value;
    return {
      'Time': iso8601ToJson(time),
      'Value': value,
    };
  }
}

/// @nodoc
class OpportunityType {
  static const netNewBusiness = OpportunityType._('Net New Business');
  static const flatRenewal = OpportunityType._('Flat Renewal');
  static const expansion = OpportunityType._('Expansion');

  final String value;

  const OpportunityType._(this.value);

  static const values = [netNewBusiness, flatRenewal, expansion];

  static OpportunityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OpportunityType._(value));

  @override
  bool operator ==(other) => other is OpportunityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides the lifecycle view of an opportunity resource shared through a
/// snapshot.
///
/// @nodoc
class LifeCycleForView {
  /// Describes the next steps for the opportunity shared through a snapshot.
  final String? nextSteps;

  /// Defines the approval status of the opportunity shared through a snapshot.
  final ReviewStatus? reviewStatus;

  /// Defines the current stage of the opportunity shared through a snapshot.
  final Stage? stage;

  /// The projected launch date of the opportunity shared through a snapshot.
  final String? targetCloseDate;

  LifeCycleForView({
    this.nextSteps,
    this.reviewStatus,
    this.stage,
    this.targetCloseDate,
  });

  factory LifeCycleForView.fromJson(Map<String, dynamic> json) {
    return LifeCycleForView(
      nextSteps: json['NextSteps'] as String?,
      reviewStatus:
          (json['ReviewStatus'] as String?)?.let(ReviewStatus.fromString),
      stage: (json['Stage'] as String?)?.let(Stage.fromString),
      targetCloseDate: json['TargetCloseDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextSteps = this.nextSteps;
    final reviewStatus = this.reviewStatus;
    final stage = this.stage;
    final targetCloseDate = this.targetCloseDate;
    return {
      if (nextSteps != null) 'NextSteps': nextSteps,
      if (reviewStatus != null) 'ReviewStatus': reviewStatus.value,
      if (stage != null) 'Stage': stage.value,
      if (targetCloseDate != null) 'TargetCloseDate': targetCloseDate,
    };
  }
}

/// An object that contains the customer's <code>Account</code> and
/// <code>Contact</code>.
///
/// @nodoc
class Customer {
  /// An object that contains the customer's account details.
  final Account? account;

  /// Represents the contact details for individuals associated with the customer
  /// of the <code>Opportunity</code>. This field captures relevant contacts,
  /// including decision-makers, influencers, and technical stakeholders within
  /// the customer organization. These contacts are key to progressing the
  /// opportunity.
  final List<Contact>? contacts;

  Customer({
    this.account,
    this.contacts,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      account: json['Account'] != null
          ? Account.fromJson(json['Account'] as Map<String, dynamic>)
          : null,
      contacts: (json['Contacts'] as List?)
          ?.nonNulls
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final contacts = this.contacts;
    return {
      if (account != null) 'Account': account,
      if (contacts != null) 'Contacts': contacts,
    };
  }
}

/// Provides the project view of an opportunity resource shared through a
/// snapshot.
///
/// @nodoc
class ProjectView {
  /// Specifies the proposed solution focus or type of workload for the project.
  final String? customerUseCase;

  /// Describes the deployment or consumption model for the partner solution or
  /// offering. This field indicates how the project's solution will be delivered
  /// or implemented for the customer.
  final List<DeliveryModel>? deliveryModels;

  /// Optional. The expected contract duration for this opportunity, representing
  /// the anticipated length of the contract in the unit specified by
  /// <code>Term</code>.
  final ExpectedContractDuration? expectedContractDuration;

  /// Provides information about the anticipated customer spend related to this
  /// project. This may include details such as amount, frequency, and currency of
  /// expected expenditure.
  final List<ExpectedCustomerSpend>? expectedCustomerSpend;

  /// Offers a description of other solutions if the standard solutions do not
  /// adequately cover the project's scope.
  final String? otherSolutionDescription;

  /// Lists the pre-sales activities that have occurred with the end-customer
  /// related to the opportunity. This field is conditionally mandatory when the
  /// project is qualified for Co-Sell and helps drive assignment priority on the
  /// AWS side. It provides insight into the engagement level with the customer.
  final List<SalesActivity>? salesActivities;

  ProjectView({
    this.customerUseCase,
    this.deliveryModels,
    this.expectedContractDuration,
    this.expectedCustomerSpend,
    this.otherSolutionDescription,
    this.salesActivities,
  });

  factory ProjectView.fromJson(Map<String, dynamic> json) {
    return ProjectView(
      customerUseCase: json['CustomerUseCase'] as String?,
      deliveryModels: (json['DeliveryModels'] as List?)
          ?.nonNulls
          .map((e) => DeliveryModel.fromString((e as String)))
          .toList(),
      expectedContractDuration: json['ExpectedContractDuration'] != null
          ? ExpectedContractDuration.fromJson(
              json['ExpectedContractDuration'] as Map<String, dynamic>)
          : null,
      expectedCustomerSpend: (json['ExpectedCustomerSpend'] as List?)
          ?.nonNulls
          .map((e) => ExpectedCustomerSpend.fromJson(e as Map<String, dynamic>))
          .toList(),
      otherSolutionDescription: json['OtherSolutionDescription'] as String?,
      salesActivities: (json['SalesActivities'] as List?)
          ?.nonNulls
          .map((e) => SalesActivity.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customerUseCase = this.customerUseCase;
    final deliveryModels = this.deliveryModels;
    final expectedContractDuration = this.expectedContractDuration;
    final expectedCustomerSpend = this.expectedCustomerSpend;
    final otherSolutionDescription = this.otherSolutionDescription;
    final salesActivities = this.salesActivities;
    return {
      if (customerUseCase != null) 'CustomerUseCase': customerUseCase,
      if (deliveryModels != null)
        'DeliveryModels': deliveryModels.map((e) => e.value).toList(),
      if (expectedContractDuration != null)
        'ExpectedContractDuration': expectedContractDuration,
      if (expectedCustomerSpend != null)
        'ExpectedCustomerSpend': expectedCustomerSpend,
      if (otherSolutionDescription != null)
        'OtherSolutionDescription': otherSolutionDescription,
      if (salesActivities != null)
        'SalesActivities': salesActivities.map((e) => e.value).toList(),
    };
  }
}

/// This field provides the associations' information for other entities with
/// the opportunity. These entities include identifiers for
/// <code>AWSProducts</code>, <code>Partner Solutions</code>, and
/// <code>AWSMarketplaceOffers</code>.
///
/// @nodoc
class RelatedEntityIdentifiers {
  /// Enables the association of AWS Marketplace offer sets with the
  /// <code>Opportunity</code>. Offer sets allow grouping multiple related
  /// marketplace offers together for comprehensive solution packaging. Each value
  /// is an Amazon Resource Name (ARN) in this format:
  /// <code>arn:aws:aws-marketplace:us-east-1:999999999999:AWSMarketplace/OfferSet/offerset-sampleOfferSet32</code>.
  final List<String>? awsMarketplaceOfferSets;

  /// Takes one value per opportunity. Each value is an Amazon Resource Name
  /// (ARN), in this format: <code>"offers":
  /// \["arn:aws:aws-marketplace:us-east-1:999999999999:AWSMarketplace/Offer/offer-sampleOffer32"\]</code>.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/API_ListEntities.html">ListEntities</a>
  /// action in the Marketplace Catalog APIs for a list of offers in the
  /// associated Marketplace seller account.
  final List<String>? awsMarketplaceOffers;

  /// Enables the association of specific Amazon Web Services products with the
  /// <code>Opportunity</code>. Partners can indicate the relevant Amazon Web
  /// Services products for the <code>Opportunity</code>'s solution and align with
  /// the customer's needs. Returns multiple values separated by commas. For
  /// example, <code>"AWSProducts" : \["AmazonRedshift", "AWSAppFabric",
  /// "AWSCleanRooms"\]</code>.
  ///
  /// Use the file with the list of Amazon Web Services products hosted on GitHub:
  /// <a
  /// href="https://github.com/aws-samples/partner-crm-integration-samples/blob/main/resources/aws_products.json">
  /// Amazon Web Services products</a>.
  final List<String>? awsProducts;

  /// Enables partner solutions or offerings' association with an opportunity. To
  /// associate a solution, provide the solution's unique identifier, which you
  /// can obtain with the <code>ListSolutions</code> operation.
  ///
  /// If the specific solution identifier is not available, you can use the value
  /// <code>Other</code> and provide details about the solution in the
  /// <code>otherSolutionOffered</code> field. But when the opportunity reaches
  /// the <code>Committed</code> stage or beyond, the <code>Other</code> value
  /// cannot be used, and a valid solution identifier must be provided.
  ///
  /// By associating the relevant solutions with the opportunity, you can
  /// communicate the offerings that are being considered or implemented to
  /// address the customer's business problem.
  final List<String>? solutions;

  RelatedEntityIdentifiers({
    this.awsMarketplaceOfferSets,
    this.awsMarketplaceOffers,
    this.awsProducts,
    this.solutions,
  });

  factory RelatedEntityIdentifiers.fromJson(Map<String, dynamic> json) {
    return RelatedEntityIdentifiers(
      awsMarketplaceOfferSets: (json['AwsMarketplaceOfferSets'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      awsMarketplaceOffers: (json['AwsMarketplaceOffers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      awsProducts: (json['AwsProducts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      solutions: (json['Solutions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsMarketplaceOfferSets = this.awsMarketplaceOfferSets;
    final awsMarketplaceOffers = this.awsMarketplaceOffers;
    final awsProducts = this.awsProducts;
    final solutions = this.solutions;
    return {
      if (awsMarketplaceOfferSets != null)
        'AwsMarketplaceOfferSets': awsMarketplaceOfferSets,
      if (awsMarketplaceOffers != null)
        'AwsMarketplaceOffers': awsMarketplaceOffers,
      if (awsProducts != null) 'AwsProducts': awsProducts,
      if (solutions != null) 'Solutions': solutions,
    };
  }
}

/// The expected duration of a partner's contract with the customer. Used to
/// convert Total Contract Value (TCV) to Monthly Recurring Revenue (MRR) for
/// opportunity dealsizing calculations.
///
/// @nodoc
class ExpectedContractDuration {
  /// The unit of measurement for the contract duration value. Currently accepts
  /// only <code>Months</code>.
  final ExpectedContractDurationTerm term;

  /// A String representation of the contract duration as an integer, expressed in
  /// the unit defined by <code>Term</code>. Valid values range from
  /// <code>1</code> to <code>144</code>.
  final String value;

  ExpectedContractDuration({
    required this.term,
    required this.value,
  });

  factory ExpectedContractDuration.fromJson(Map<String, dynamic> json) {
    return ExpectedContractDuration(
      term: ExpectedContractDurationTerm.fromString(
          (json['Term'] as String?) ?? ''),
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final term = this.term;
    final value = this.value;
    return {
      'Term': term.value,
      'Value': value,
    };
  }
}

/// @nodoc
class SalesActivity {
  static const initializedDiscussionsWithCustomer =
      SalesActivity._('Initialized discussions with customer');
  static const customerHasShownInterestInSolution =
      SalesActivity._('Customer has shown interest in solution');
  static const conductedPocDemo = SalesActivity._('Conducted POC / Demo');
  static const inEvaluationPlanningStage =
      SalesActivity._('In evaluation / planning stage');
  static const agreedOnSolutionToBusinessProblem =
      SalesActivity._('Agreed on solution to Business Problem');
  static const completedActionPlan = SalesActivity._('Completed Action Plan');
  static const finalizedDeploymentNeed =
      SalesActivity._('Finalized Deployment Need');
  static const sowSigned = SalesActivity._('SOW Signed');

  final String value;

  const SalesActivity._(this.value);

  static const values = [
    initializedDiscussionsWithCustomer,
    customerHasShownInterestInSolution,
    conductedPocDemo,
    inEvaluationPlanningStage,
    agreedOnSolutionToBusinessProblem,
    completedActionPlan,
    finalizedDeploymentNeed,
    sowSigned
  ];

  static SalesActivity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SalesActivity._(value));

  @override
  bool operator ==(other) => other is SalesActivity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The unit of measurement for the contract duration value. Currently accepts
/// only <code>Months</code>.
///
/// @nodoc
class ExpectedContractDurationTerm {
  static const months = ExpectedContractDurationTerm._('Months');

  final String value;

  const ExpectedContractDurationTerm._(this.value);

  static const values = [months];

  static ExpectedContractDurationTerm fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExpectedContractDurationTerm._(value));

  @override
  bool operator ==(other) =>
      other is ExpectedContractDurationTerm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DeliveryModel {
  static const saaSOrPaaS = DeliveryModel._('SaaS or PaaS');
  static const byolOrAmi = DeliveryModel._('BYOL or AMI');
  static const managedServices = DeliveryModel._('Managed Services');
  static const professionalServices = DeliveryModel._('Professional Services');
  static const resell = DeliveryModel._('Resell');
  static const other = DeliveryModel._('Other');

  final String value;

  const DeliveryModel._(this.value);

  static const values = [
    saaSOrPaaS,
    byolOrAmi,
    managedServices,
    professionalServices,
    resell,
    other
  ];

  static DeliveryModel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeliveryModel._(value));

  @override
  bool operator ==(other) => other is DeliveryModel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the <code>Customer</code>'s account details associated with the
/// <code>Opportunity</code>.
///
/// @nodoc
class Account {
  /// Specifies the end <code>Customer</code>'s company name associated with the
  /// <code>Opportunity</code>.
  final String companyName;

  /// Specifies the end <code>Customer</code>'s address details associated with
  /// the <code>Opportunity</code>.
  final Address? address;

  /// Specifies the <code>Customer</code> Amazon Web Services account ID
  /// associated with the <code>Opportunity</code>.
  final String? awsAccountId;

  /// Indicates the <code>Customer</code> DUNS number, if available.
  final String? duns;

  /// Specifies the industry the end <code>Customer</code> belongs to that's
  /// associated with the <code>Opportunity</code>. It refers to the category or
  /// sector where the customer's business operates. This is a required field.
  final Industry? industry;

  /// Specifies the end <code>Customer</code>'s industry associated with the
  /// <code>Opportunity</code>, when the selected value in the
  /// <code>Industry</code> field is <code>Other</code>.
  final String? otherIndustry;

  /// Specifies the end customer's company website URL associated with the
  /// <code>Opportunity</code>. This value is crucial to map the customer within
  /// the Amazon Web Services CRM system. This field is required in all cases
  /// except when the opportunity is related to national security.
  final String? websiteUrl;

  Account({
    required this.companyName,
    this.address,
    this.awsAccountId,
    this.duns,
    this.industry,
    this.otherIndustry,
    this.websiteUrl,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      companyName: (json['CompanyName'] as String?) ?? '',
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      awsAccountId: json['AwsAccountId'] as String?,
      duns: json['Duns'] as String?,
      industry: (json['Industry'] as String?)?.let(Industry.fromString),
      otherIndustry: json['OtherIndustry'] as String?,
      websiteUrl: json['WebsiteUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final companyName = this.companyName;
    final address = this.address;
    final awsAccountId = this.awsAccountId;
    final duns = this.duns;
    final industry = this.industry;
    final otherIndustry = this.otherIndustry;
    final websiteUrl = this.websiteUrl;
    return {
      'CompanyName': companyName,
      if (address != null) 'Address': address,
      if (awsAccountId != null) 'AwsAccountId': awsAccountId,
      if (duns != null) 'Duns': duns,
      if (industry != null) 'Industry': industry.value,
      if (otherIndustry != null) 'OtherIndustry': otherIndustry,
      if (websiteUrl != null) 'WebsiteUrl': websiteUrl,
    };
  }
}

/// @nodoc
class Industry {
  static const aerospace = Industry._('Aerospace');
  static const agriculture = Industry._('Agriculture');
  static const automotive = Industry._('Automotive');
  static const computersAndElectronics =
      Industry._('Computers and Electronics');
  static const consumerGoods = Industry._('Consumer Goods');
  static const education = Industry._('Education');
  static const energyOilAndGas = Industry._('Energy - Oil and Gas');
  static const energyPowerAndUtilities =
      Industry._('Energy - Power and Utilities');
  static const financialServices = Industry._('Financial Services');
  static const gaming = Industry._('Gaming');
  static const government = Industry._('Government');
  static const healthcare = Industry._('Healthcare');
  static const hospitality = Industry._('Hospitality');
  static const lifeSciences = Industry._('Life Sciences');
  static const manufacturing = Industry._('Manufacturing');
  static const marketingAndAdvertising =
      Industry._('Marketing and Advertising');
  static const mediaAndEntertainment = Industry._('Media and Entertainment');
  static const mining = Industry._('Mining');
  static const nonProfitOrganization = Industry._('Non-Profit Organization');
  static const professionalServices = Industry._('Professional Services');
  static const realEstateAndConstruction =
      Industry._('Real Estate and Construction');
  static const retail = Industry._('Retail');
  static const softwareAndInternet = Industry._('Software and Internet');
  static const telecommunications = Industry._('Telecommunications');
  static const transportationAndLogistics =
      Industry._('Transportation and Logistics');
  static const travel = Industry._('Travel');
  static const wholesaleAndDistribution =
      Industry._('Wholesale and Distribution');
  static const other = Industry._('Other');

  final String value;

  const Industry._(this.value);

  static const values = [
    aerospace,
    agriculture,
    automotive,
    computersAndElectronics,
    consumerGoods,
    education,
    energyOilAndGas,
    energyPowerAndUtilities,
    financialServices,
    gaming,
    government,
    healthcare,
    hospitality,
    lifeSciences,
    manufacturing,
    marketingAndAdvertising,
    mediaAndEntertainment,
    mining,
    nonProfitOrganization,
    professionalServices,
    realEstateAndConstruction,
    retail,
    softwareAndInternet,
    telecommunications,
    transportationAndLogistics,
    travel,
    wholesaleAndDistribution,
    other
  ];

  static Industry fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Industry._(value));

  @override
  bool operator ==(other) => other is Industry && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the end <code>Customer</code>'s address details associated with
/// the <code>Opportunity</code>.
///
/// @nodoc
class Address {
  /// Specifies the end <code>Customer</code>'s city associated with the
  /// <code>Opportunity</code>.
  final String? city;

  /// Specifies the end <code>Customer</code>'s country associated with the
  /// <code>Opportunity</code>.
  final CountryCode? countryCode;

  /// Specifies the end <code>Customer</code>'s postal code associated with the
  /// <code>Opportunity</code>.
  final String? postalCode;

  /// Specifies the end <code>Customer</code>'s state or region associated with
  /// the <code>Opportunity</code>.
  ///
  /// Valid values: <code>Alabama | Alaska | American Samoa | Arizona | Arkansas |
  /// California | Colorado | Connecticut | Delaware | Dist. of Columbia |
  /// Federated States of Micronesia | Florida | Georgia | Guam | Hawaii | Idaho |
  /// Illinois | Indiana | Iowa | Kansas | Kentucky | Louisiana | Maine | Marshall
  /// Islands | Maryland | Massachusetts | Michigan | Minnesota | Mississippi |
  /// Missouri | Montana | Nebraska | Nevada | New Hampshire | New Jersey | New
  /// Mexico | New York | North Carolina | North Dakota | Northern Mariana Islands
  /// | Ohio | Oklahoma | Oregon | Palau | Pennsylvania | Puerto Rico | Rhode
  /// Island | South Carolina | South Dakota | Tennessee | Texas | Utah | Vermont
  /// | Virginia | Virgin Islands | Washington | West Virginia | Wisconsin |
  /// Wyoming | APO/AE | AFO/FPO | FPO, AP</code>
  final String? stateOrRegion;

  /// Specifies the end <code>Customer</code>'s street address associated with the
  /// <code>Opportunity</code>.
  final String? streetAddress;

  Address({
    this.city,
    this.countryCode,
    this.postalCode,
    this.stateOrRegion,
    this.streetAddress,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['City'] as String?,
      countryCode:
          (json['CountryCode'] as String?)?.let(CountryCode.fromString),
      postalCode: json['PostalCode'] as String?,
      stateOrRegion: json['StateOrRegion'] as String?,
      streetAddress: json['StreetAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final countryCode = this.countryCode;
    final postalCode = this.postalCode;
    final stateOrRegion = this.stateOrRegion;
    final streetAddress = this.streetAddress;
    return {
      if (city != null) 'City': city,
      if (countryCode != null) 'CountryCode': countryCode.value,
      if (postalCode != null) 'PostalCode': postalCode,
      if (stateOrRegion != null) 'StateOrRegion': stateOrRegion,
      if (streetAddress != null) 'StreetAddress': streetAddress,
    };
  }
}

/// @nodoc
class CountryCode {
  static const us = CountryCode._('US');
  static const af = CountryCode._('AF');
  static const ax = CountryCode._('AX');
  static const al = CountryCode._('AL');
  static const dz = CountryCode._('DZ');
  static const as = CountryCode._('AS');
  static const ad = CountryCode._('AD');
  static const ao = CountryCode._('AO');
  static const ai = CountryCode._('AI');
  static const aq = CountryCode._('AQ');
  static const ag = CountryCode._('AG');
  static const ar = CountryCode._('AR');
  static const am = CountryCode._('AM');
  static const aw = CountryCode._('AW');
  static const au = CountryCode._('AU');
  static const at = CountryCode._('AT');
  static const az = CountryCode._('AZ');
  static const bs = CountryCode._('BS');
  static const bh = CountryCode._('BH');
  static const bd = CountryCode._('BD');
  static const bb = CountryCode._('BB');
  static const by = CountryCode._('BY');
  static const be = CountryCode._('BE');
  static const bz = CountryCode._('BZ');
  static const bj = CountryCode._('BJ');
  static const bm = CountryCode._('BM');
  static const bt = CountryCode._('BT');
  static const bo = CountryCode._('BO');
  static const bq = CountryCode._('BQ');
  static const ba = CountryCode._('BA');
  static const bw = CountryCode._('BW');
  static const bv = CountryCode._('BV');
  static const br = CountryCode._('BR');
  static const io = CountryCode._('IO');
  static const bn = CountryCode._('BN');
  static const bg = CountryCode._('BG');
  static const bf = CountryCode._('BF');
  static const bi = CountryCode._('BI');
  static const kh = CountryCode._('KH');
  static const cm = CountryCode._('CM');
  static const ca = CountryCode._('CA');
  static const cv = CountryCode._('CV');
  static const ky = CountryCode._('KY');
  static const cf = CountryCode._('CF');
  static const td = CountryCode._('TD');
  static const cl = CountryCode._('CL');
  static const cn = CountryCode._('CN');
  static const cx = CountryCode._('CX');
  static const cc = CountryCode._('CC');
  static const co = CountryCode._('CO');
  static const km = CountryCode._('KM');
  static const cg = CountryCode._('CG');
  static const ck = CountryCode._('CK');
  static const cr = CountryCode._('CR');
  static const ci = CountryCode._('CI');
  static const hr = CountryCode._('HR');
  static const cu = CountryCode._('CU');
  static const cw = CountryCode._('CW');
  static const cy = CountryCode._('CY');
  static const cz = CountryCode._('CZ');
  static const cd = CountryCode._('CD');
  static const dk = CountryCode._('DK');
  static const dj = CountryCode._('DJ');
  static const dm = CountryCode._('DM');
  static const $do = CountryCode._('DO');
  static const ec = CountryCode._('EC');
  static const eg = CountryCode._('EG');
  static const sv = CountryCode._('SV');
  static const gq = CountryCode._('GQ');
  static const er = CountryCode._('ER');
  static const ee = CountryCode._('EE');
  static const et = CountryCode._('ET');
  static const fk = CountryCode._('FK');
  static const fo = CountryCode._('FO');
  static const fj = CountryCode._('FJ');
  static const fi = CountryCode._('FI');
  static const fr = CountryCode._('FR');
  static const gf = CountryCode._('GF');
  static const pf = CountryCode._('PF');
  static const tf = CountryCode._('TF');
  static const ga = CountryCode._('GA');
  static const gm = CountryCode._('GM');
  static const ge = CountryCode._('GE');
  static const de = CountryCode._('DE');
  static const gh = CountryCode._('GH');
  static const gi = CountryCode._('GI');
  static const gr = CountryCode._('GR');
  static const gl = CountryCode._('GL');
  static const gd = CountryCode._('GD');
  static const gp = CountryCode._('GP');
  static const gu = CountryCode._('GU');
  static const gt = CountryCode._('GT');
  static const gg = CountryCode._('GG');
  static const gn = CountryCode._('GN');
  static const gw = CountryCode._('GW');
  static const gy = CountryCode._('GY');
  static const ht = CountryCode._('HT');
  static const hm = CountryCode._('HM');
  static const va = CountryCode._('VA');
  static const hn = CountryCode._('HN');
  static const hk = CountryCode._('HK');
  static const hu = CountryCode._('HU');
  static const $is = CountryCode._('IS');
  static const $in = CountryCode._('IN');
  static const id = CountryCode._('ID');
  static const ir = CountryCode._('IR');
  static const iq = CountryCode._('IQ');
  static const ie = CountryCode._('IE');
  static const im = CountryCode._('IM');
  static const il = CountryCode._('IL');
  static const it = CountryCode._('IT');
  static const jm = CountryCode._('JM');
  static const jp = CountryCode._('JP');
  static const je = CountryCode._('JE');
  static const jo = CountryCode._('JO');
  static const kz = CountryCode._('KZ');
  static const ke = CountryCode._('KE');
  static const ki = CountryCode._('KI');
  static const kr = CountryCode._('KR');
  static const kw = CountryCode._('KW');
  static const kg = CountryCode._('KG');
  static const la = CountryCode._('LA');
  static const lv = CountryCode._('LV');
  static const lb = CountryCode._('LB');
  static const ls = CountryCode._('LS');
  static const lr = CountryCode._('LR');
  static const ly = CountryCode._('LY');
  static const li = CountryCode._('LI');
  static const lt = CountryCode._('LT');
  static const lu = CountryCode._('LU');
  static const mo = CountryCode._('MO');
  static const mk = CountryCode._('MK');
  static const mg = CountryCode._('MG');
  static const mw = CountryCode._('MW');
  static const my = CountryCode._('MY');
  static const mv = CountryCode._('MV');
  static const ml = CountryCode._('ML');
  static const mt = CountryCode._('MT');
  static const mh = CountryCode._('MH');
  static const mq = CountryCode._('MQ');
  static const mr = CountryCode._('MR');
  static const mu = CountryCode._('MU');
  static const yt = CountryCode._('YT');
  static const mx = CountryCode._('MX');
  static const fm = CountryCode._('FM');
  static const md = CountryCode._('MD');
  static const mc = CountryCode._('MC');
  static const mn = CountryCode._('MN');
  static const me = CountryCode._('ME');
  static const ms = CountryCode._('MS');
  static const ma = CountryCode._('MA');
  static const mz = CountryCode._('MZ');
  static const mm = CountryCode._('MM');
  static const na = CountryCode._('NA');
  static const nr = CountryCode._('NR');
  static const np = CountryCode._('NP');
  static const nl = CountryCode._('NL');
  static const an = CountryCode._('AN');
  static const nc = CountryCode._('NC');
  static const nz = CountryCode._('NZ');
  static const ni = CountryCode._('NI');
  static const ne = CountryCode._('NE');
  static const ng = CountryCode._('NG');
  static const nu = CountryCode._('NU');
  static const nf = CountryCode._('NF');
  static const mp = CountryCode._('MP');
  static const no = CountryCode._('NO');
  static const om = CountryCode._('OM');
  static const pk = CountryCode._('PK');
  static const pw = CountryCode._('PW');
  static const ps = CountryCode._('PS');
  static const pa = CountryCode._('PA');
  static const pg = CountryCode._('PG');
  static const py = CountryCode._('PY');
  static const pe = CountryCode._('PE');
  static const ph = CountryCode._('PH');
  static const pn = CountryCode._('PN');
  static const pl = CountryCode._('PL');
  static const pt = CountryCode._('PT');
  static const pr = CountryCode._('PR');
  static const qa = CountryCode._('QA');
  static const re = CountryCode._('RE');
  static const ro = CountryCode._('RO');
  static const ru = CountryCode._('RU');
  static const rw = CountryCode._('RW');
  static const bl = CountryCode._('BL');
  static const sh = CountryCode._('SH');
  static const kn = CountryCode._('KN');
  static const lc = CountryCode._('LC');
  static const mf = CountryCode._('MF');
  static const pm = CountryCode._('PM');
  static const vc = CountryCode._('VC');
  static const ws = CountryCode._('WS');
  static const sm = CountryCode._('SM');
  static const st = CountryCode._('ST');
  static const sa = CountryCode._('SA');
  static const sn = CountryCode._('SN');
  static const rs = CountryCode._('RS');
  static const sc = CountryCode._('SC');
  static const sl = CountryCode._('SL');
  static const sg = CountryCode._('SG');
  static const sx = CountryCode._('SX');
  static const sk = CountryCode._('SK');
  static const si = CountryCode._('SI');
  static const sb = CountryCode._('SB');
  static const so = CountryCode._('SO');
  static const za = CountryCode._('ZA');
  static const gs = CountryCode._('GS');
  static const ss = CountryCode._('SS');
  static const es = CountryCode._('ES');
  static const lk = CountryCode._('LK');
  static const sd = CountryCode._('SD');
  static const sr = CountryCode._('SR');
  static const sj = CountryCode._('SJ');
  static const sz = CountryCode._('SZ');
  static const se = CountryCode._('SE');
  static const ch = CountryCode._('CH');
  static const sy = CountryCode._('SY');
  static const tw = CountryCode._('TW');
  static const tj = CountryCode._('TJ');
  static const tz = CountryCode._('TZ');
  static const th = CountryCode._('TH');
  static const tl = CountryCode._('TL');
  static const tg = CountryCode._('TG');
  static const tk = CountryCode._('TK');
  static const to = CountryCode._('TO');
  static const tt = CountryCode._('TT');
  static const tn = CountryCode._('TN');
  static const tr = CountryCode._('TR');
  static const tm = CountryCode._('TM');
  static const tc = CountryCode._('TC');
  static const tv = CountryCode._('TV');
  static const ug = CountryCode._('UG');
  static const ua = CountryCode._('UA');
  static const ae = CountryCode._('AE');
  static const gb = CountryCode._('GB');
  static const um = CountryCode._('UM');
  static const uy = CountryCode._('UY');
  static const uz = CountryCode._('UZ');
  static const vu = CountryCode._('VU');
  static const ve = CountryCode._('VE');
  static const vn = CountryCode._('VN');
  static const vg = CountryCode._('VG');
  static const vi = CountryCode._('VI');
  static const wf = CountryCode._('WF');
  static const eh = CountryCode._('EH');
  static const ye = CountryCode._('YE');
  static const zm = CountryCode._('ZM');
  static const zw = CountryCode._('ZW');

  final String value;

  const CountryCode._(this.value);

  static const values = [
    us,
    af,
    ax,
    al,
    dz,
    as,
    ad,
    ao,
    ai,
    aq,
    ag,
    ar,
    am,
    aw,
    au,
    at,
    az,
    bs,
    bh,
    bd,
    bb,
    by,
    be,
    bz,
    bj,
    bm,
    bt,
    bo,
    bq,
    ba,
    bw,
    bv,
    br,
    io,
    bn,
    bg,
    bf,
    bi,
    kh,
    cm,
    ca,
    cv,
    ky,
    cf,
    td,
    cl,
    cn,
    cx,
    cc,
    co,
    km,
    cg,
    ck,
    cr,
    ci,
    hr,
    cu,
    cw,
    cy,
    cz,
    cd,
    dk,
    dj,
    dm,
    $do,
    ec,
    eg,
    sv,
    gq,
    er,
    ee,
    et,
    fk,
    fo,
    fj,
    fi,
    fr,
    gf,
    pf,
    tf,
    ga,
    gm,
    ge,
    de,
    gh,
    gi,
    gr,
    gl,
    gd,
    gp,
    gu,
    gt,
    gg,
    gn,
    gw,
    gy,
    ht,
    hm,
    va,
    hn,
    hk,
    hu,
    $is,
    $in,
    id,
    ir,
    iq,
    ie,
    im,
    il,
    it,
    jm,
    jp,
    je,
    jo,
    kz,
    ke,
    ki,
    kr,
    kw,
    kg,
    la,
    lv,
    lb,
    ls,
    lr,
    ly,
    li,
    lt,
    lu,
    mo,
    mk,
    mg,
    mw,
    my,
    mv,
    ml,
    mt,
    mh,
    mq,
    mr,
    mu,
    yt,
    mx,
    fm,
    md,
    mc,
    mn,
    me,
    ms,
    ma,
    mz,
    mm,
    na,
    nr,
    np,
    nl,
    an,
    nc,
    nz,
    ni,
    ne,
    ng,
    nu,
    nf,
    mp,
    no,
    om,
    pk,
    pw,
    ps,
    pa,
    pg,
    py,
    pe,
    ph,
    pn,
    pl,
    pt,
    pr,
    qa,
    re,
    ro,
    ru,
    rw,
    bl,
    sh,
    kn,
    lc,
    mf,
    pm,
    vc,
    ws,
    sm,
    st,
    sa,
    sn,
    rs,
    sc,
    sl,
    sg,
    sx,
    sk,
    si,
    sb,
    so,
    za,
    gs,
    ss,
    es,
    lk,
    sd,
    sr,
    sj,
    sz,
    se,
    ch,
    sy,
    tw,
    tj,
    tz,
    th,
    tl,
    tg,
    tk,
    to,
    tt,
    tn,
    tr,
    tm,
    tc,
    tv,
    ug,
    ua,
    ae,
    gb,
    um,
    uy,
    uz,
    vu,
    ve,
    vn,
    vg,
    vi,
    wf,
    eh,
    ye,
    zm,
    zw
  ];

  static CountryCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CountryCode._(value));

  @override
  bool operator ==(other) => other is CountryCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PrimaryNeedFromAws {
  static const coSellArchitecturalValidation =
      PrimaryNeedFromAws._('Co-Sell - Architectural Validation');
  static const coSellBusinessPresentation =
      PrimaryNeedFromAws._('Co-Sell - Business Presentation');
  static const coSellCompetitiveInformation =
      PrimaryNeedFromAws._('Co-Sell - Competitive Information');
  static const coSellPricingAssistance =
      PrimaryNeedFromAws._('Co-Sell - Pricing Assistance');
  static const coSellTechnicalConsultation =
      PrimaryNeedFromAws._('Co-Sell - Technical Consultation');
  static const coSellTotalCostOfOwnershipEvaluation =
      PrimaryNeedFromAws._('Co-Sell - Total Cost of Ownership Evaluation');
  static const coSellDealSupport =
      PrimaryNeedFromAws._('Co-Sell - Deal Support');
  static const coSellSupportForPublicTenderRFx =
      PrimaryNeedFromAws._('Co-Sell - Support for Public Tender / RFx');

  final String value;

  const PrimaryNeedFromAws._(this.value);

  static const values = [
    coSellArchitecturalValidation,
    coSellBusinessPresentation,
    coSellCompetitiveInformation,
    coSellPricingAssistance,
    coSellTechnicalConsultation,
    coSellTotalCostOfOwnershipEvaluation,
    coSellDealSupport,
    coSellSupportForPublicTenderRFx
  ];

  static PrimaryNeedFromAws fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrimaryNeedFromAws._(value));

  @override
  bool operator ==(other) =>
      other is PrimaryNeedFromAws && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReviewStatus {
  static const pendingSubmission = ReviewStatus._('Pending Submission');
  static const submitted = ReviewStatus._('Submitted');
  static const inReview = ReviewStatus._('In review');
  static const approved = ReviewStatus._('Approved');
  static const rejected = ReviewStatus._('Rejected');
  static const actionRequired = ReviewStatus._('Action Required');

  final String value;

  const ReviewStatus._(this.value);

  static const values = [
    pendingSubmission,
    submitted,
    inReview,
    approved,
    rejected,
    actionRequired
  ];

  static ReviewStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReviewStatus._(value));

  @override
  bool operator ==(other) => other is ReviewStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Stage {
  static const prospect = Stage._('Prospect');
  static const qualified = Stage._('Qualified');
  static const technicalValidation = Stage._('Technical Validation');
  static const businessValidation = Stage._('Business Validation');
  static const committed = Stage._('Committed');
  static const launched = Stage._('Launched');
  static const closedLost = Stage._('Closed Lost');

  final String value;

  const Stage._(this.value);

  static const values = [
    prospect,
    qualified,
    technicalValidation,
    businessValidation,
    committed,
    launched,
    closedLost
  ];

  static Stage fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Stage._(value));

  @override
  bool operator ==(other) => other is Stage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a summary of a task related to creating an opportunity from an
/// engagement. This structure contains key information about the task's status,
/// associated identifiers, and any failure details for opportunity creation
/// processes.
///
/// @nodoc
class ListOpportunityFromEngagementTaskSummary {
  /// The unique identifier of the engagement context associated with the
  /// opportunity creation task. This links the task to specific contextual
  /// information within the engagement.
  final String? contextId;

  /// The unique identifier of the engagement from which the opportunity is being
  /// created. This field helps track the source of the opportunity creation task.
  final String? engagementId;

  /// A detailed message providing additional information about the task,
  /// especially useful in case of failures. This field may contain error details
  /// or other relevant information about the task's execution.
  final String? message;

  /// The unique identifier of the opportunity created as a result of the task.
  /// This field is populated when the task is completed successfully.
  final String? opportunityId;

  /// A code indicating the specific reason for a task failure. This field is
  /// populated when the task status is FAILED and provides a categorized reason
  /// for the failure.
  final ReasonCode? reasonCode;

  /// The identifier of the resource snapshot job associated with this task, if a
  /// snapshot was created as part of the opportunity creation process.
  final String? resourceSnapshotJobId;

  /// The timestamp indicating when the task was initiated, in RFC 3339 format.
  final DateTime? startTime;

  /// The Amazon Resource Name (ARN) that uniquely identifies the task within AWS.
  /// This ARN can be used for referencing the task in other AWS services or APIs.
  final String? taskArn;

  /// The unique identifier of the task for creating an opportunity from an
  /// engagement.
  final String? taskId;

  /// The current status of the task. Valid values are COMPLETE, INPROGRESS, or
  /// FAILED.
  final TaskStatus? taskStatus;

  ListOpportunityFromEngagementTaskSummary({
    this.contextId,
    this.engagementId,
    this.message,
    this.opportunityId,
    this.reasonCode,
    this.resourceSnapshotJobId,
    this.startTime,
    this.taskArn,
    this.taskId,
    this.taskStatus,
  });

  factory ListOpportunityFromEngagementTaskSummary.fromJson(
      Map<String, dynamic> json) {
    return ListOpportunityFromEngagementTaskSummary(
      contextId: json['ContextId'] as String?,
      engagementId: json['EngagementId'] as String?,
      message: json['Message'] as String?,
      opportunityId: json['OpportunityId'] as String?,
      reasonCode: (json['ReasonCode'] as String?)?.let(ReasonCode.fromString),
      resourceSnapshotJobId: json['ResourceSnapshotJobId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      taskArn: json['TaskArn'] as String?,
      taskId: json['TaskId'] as String?,
      taskStatus: (json['TaskStatus'] as String?)?.let(TaskStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final contextId = this.contextId;
    final engagementId = this.engagementId;
    final message = this.message;
    final opportunityId = this.opportunityId;
    final reasonCode = this.reasonCode;
    final resourceSnapshotJobId = this.resourceSnapshotJobId;
    final startTime = this.startTime;
    final taskArn = this.taskArn;
    final taskId = this.taskId;
    final taskStatus = this.taskStatus;
    return {
      if (contextId != null) 'ContextId': contextId,
      if (engagementId != null) 'EngagementId': engagementId,
      if (message != null) 'Message': message,
      if (opportunityId != null) 'OpportunityId': opportunityId,
      if (reasonCode != null) 'ReasonCode': reasonCode.value,
      if (resourceSnapshotJobId != null)
        'ResourceSnapshotJobId': resourceSnapshotJobId,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskId != null) 'TaskId': taskId,
      if (taskStatus != null) 'TaskStatus': taskStatus.value,
    };
  }
}

/// @nodoc
class TaskStatus {
  static const inProgress = TaskStatus._('IN_PROGRESS');
  static const complete = TaskStatus._('COMPLETE');
  static const failed = TaskStatus._('FAILED');

  final String value;

  const TaskStatus._(this.value);

  static const values = [inProgress, complete, failed];

  static TaskStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaskStatus._(value));

  @override
  bool operator ==(other) => other is TaskStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReasonCode {
  static const invitationAccessDenied = ReasonCode._('InvitationAccessDenied');
  static const invitationValidationFailed =
      ReasonCode._('InvitationValidationFailed');
  static const engagementAccessDenied = ReasonCode._('EngagementAccessDenied');
  static const opportunityAccessDenied =
      ReasonCode._('OpportunityAccessDenied');
  static const resourceSnapshotJobAccessDenied =
      ReasonCode._('ResourceSnapshotJobAccessDenied');
  static const resourceSnapshotJobValidationFailed =
      ReasonCode._('ResourceSnapshotJobValidationFailed');
  static const resourceSnapshotJobConflict =
      ReasonCode._('ResourceSnapshotJobConflict');
  static const engagementValidationFailed =
      ReasonCode._('EngagementValidationFailed');
  static const engagementConflict = ReasonCode._('EngagementConflict');
  static const opportunitySubmissionFailed =
      ReasonCode._('OpportunitySubmissionFailed');
  static const engagementInvitationConflict =
      ReasonCode._('EngagementInvitationConflict');
  static const internalError = ReasonCode._('InternalError');
  static const opportunityValidationFailed =
      ReasonCode._('OpportunityValidationFailed');
  static const opportunityConflict = ReasonCode._('OpportunityConflict');
  static const resourceSnapshotAccessDenied =
      ReasonCode._('ResourceSnapshotAccessDenied');
  static const resourceSnapshotValidationFailed =
      ReasonCode._('ResourceSnapshotValidationFailed');
  static const resourceSnapshotConflict =
      ReasonCode._('ResourceSnapshotConflict');
  static const serviceQuotaExceeded = ReasonCode._('ServiceQuotaExceeded');
  static const requestThrottled = ReasonCode._('RequestThrottled');
  static const contextNotFound = ReasonCode._('ContextNotFound');
  static const customerProjectContextNotPermitted =
      ReasonCode._('CustomerProjectContextNotPermitted');
  static const disqualifiedLeadNotPermitted =
      ReasonCode._('DisqualifiedLeadNotPermitted');

  final String value;

  const ReasonCode._(this.value);

  static const values = [
    invitationAccessDenied,
    invitationValidationFailed,
    engagementAccessDenied,
    opportunityAccessDenied,
    resourceSnapshotJobAccessDenied,
    resourceSnapshotJobValidationFailed,
    resourceSnapshotJobConflict,
    engagementValidationFailed,
    engagementConflict,
    opportunitySubmissionFailed,
    engagementInvitationConflict,
    internalError,
    opportunityValidationFailed,
    opportunityConflict,
    resourceSnapshotAccessDenied,
    resourceSnapshotValidationFailed,
    resourceSnapshotConflict,
    serviceQuotaExceeded,
    requestThrottled,
    contextNotFound,
    customerProjectContextNotPermitted,
    disqualifiedLeadNotPermitted
  ];

  static ReasonCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReasonCode._(value));

  @override
  bool operator ==(other) => other is ReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the sorting parameters for listing tasks. This structure allows for
/// specifying the field to sort by and the order of sorting.
///
/// @nodoc
class ListTasksSortBase {
  /// Specifies the field by which the task list should be sorted.
  final ListTasksSortName sortBy;

  /// Determines the order in which the sorted results are presented.
  final SortOrder sortOrder;

  ListTasksSortBase({
    required this.sortBy,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      'SortBy': sortBy.value,
      'SortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class ListTasksSortName {
  static const startTime = ListTasksSortName._('StartTime');

  final String value;

  const ListTasksSortName._(this.value);

  static const values = [startTime];

  static ListTasksSortName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListTasksSortName._(value));

  @override
  bool operator ==(other) => other is ListTasksSortName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RelatedEntityType {
  static const solutions = RelatedEntityType._('Solutions');
  static const awsProducts = RelatedEntityType._('AwsProducts');
  static const awsMarketplaceOffers =
      RelatedEntityType._('AwsMarketplaceOffers');
  static const awsMarketplaceOfferSets =
      RelatedEntityType._('AwsMarketplaceOfferSets');

  final String value;

  const RelatedEntityType._(this.value);

  static const values = [
    solutions,
    awsProducts,
    awsMarketplaceOffers,
    awsMarketplaceOfferSets
  ];

  static RelatedEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RelatedEntityType._(value));

  @override
  bool operator ==(other) => other is RelatedEntityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the contact details of the individual assigned to manage the
/// opportunity within the partner organization. This helps to ensure that there
/// is a point of contact for the opportunity's progress.
///
/// @nodoc
class AssigneeContact {
  /// Specifies the business title of the assignee managing the opportunity. This
  /// helps clarify the individual's role and responsibilities within the
  /// organization. Use the value <code>PartnerAccountManager</code> to update
  /// details of the opportunity owner.
  final String businessTitle;

  /// Provides the email address of the assignee. This email is used for
  /// communications and notifications related to the opportunity.
  final String email;

  /// Specifies the first name of the assignee managing the opportunity. The
  /// system automatically retrieves this value from the user profile by
  /// referencing the associated email address.
  final String firstName;

  /// Specifies the last name of the assignee managing the opportunity. The system
  /// automatically retrieves this value from the user profile by referencing the
  /// associated email address.
  final String lastName;

  /// Specifies the contact phone number of the assignee responsible for the
  /// opportunity or engagement. This field enables direct communication for
  /// time-sensitive matters and facilitates coordination between AWS and partner
  /// teams.
  final String? phone;

  AssigneeContact({
    required this.businessTitle,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    final businessTitle = this.businessTitle;
    final email = this.email;
    final firstName = this.firstName;
    final lastName = this.lastName;
    final phone = this.phone;
    return {
      'BusinessTitle': businessTitle,
      'Email': email,
      'FirstName': firstName,
      'LastName': lastName,
      if (phone != null) 'Phone': phone,
    };
  }
}

/// An object that contains an <code>Opportunity</code>'s subset of fields.
///
/// @nodoc
class OpportunitySummary {
  /// Specifies the catalog associated with the opportunity, either
  /// <code>AWS</code> or <code>Sandbox</code>. This indicates the environment in
  /// which the opportunity is managed.
  final String catalog;

  /// The Amazon Resource Name (ARN) for the opportunity. This globally unique
  /// identifier can be used for IAM policies and cross-service references.
  final String? arn;

  /// <code>DateTime</code> when the <code>Opportunity</code> was last created.
  final DateTime? createdDate;

  /// An object that contains the <code>Opportunity</code>'s customer details.
  final CustomerSummary? customer;

  /// Read-only, system-generated <code>Opportunity</code> unique identifier.
  final String? id;

  /// <code>DateTime</code> when the <code>Opportunity</code> was last modified.
  final DateTime? lastModifiedDate;

  /// An object that contains the <code>Opportunity</code>'s lifecycle details.
  final LifeCycleSummary? lifeCycle;

  /// Specifies opportunity type as a renewal, new, or expansion.
  ///
  /// Opportunity types:
  ///
  /// <ul>
  /// <li>
  /// New Opportunity: Represents a new business opportunity with a potential
  /// customer that's not previously engaged with your solutions or services.
  /// </li>
  /// <li>
  /// Renewal Opportunity: Represents an opportunity to renew an existing contract
  /// or subscription with a current customer, ensuring continuity of service.
  /// </li>
  /// <li>
  /// Expansion Opportunity: Represents an opportunity to expand the scope of an
  /// existing contract or subscription, either by adding new services or
  /// increasing the volume of existing services for a current customer.
  /// </li>
  /// </ul>
  final OpportunityType? opportunityType;

  /// Specifies the <code>Opportunity</code>'s unique identifier in the partner's
  /// CRM system. This value is essential to track and reconcile because it's
  /// included in the outbound payload sent back to the partner. It allows
  /// partners to link an opportunity to their CRM.
  final String? partnerOpportunityIdentifier;

  /// An object that contains the <code>Opportunity</code>'s project details
  /// summary.
  final ProjectSummary? project;

  OpportunitySummary({
    required this.catalog,
    this.arn,
    this.createdDate,
    this.customer,
    this.id,
    this.lastModifiedDate,
    this.lifeCycle,
    this.opportunityType,
    this.partnerOpportunityIdentifier,
    this.project,
  });

  factory OpportunitySummary.fromJson(Map<String, dynamic> json) {
    return OpportunitySummary(
      catalog: (json['Catalog'] as String?) ?? '',
      arn: json['Arn'] as String?,
      createdDate: timeStampFromJson(json['CreatedDate']),
      customer: json['Customer'] != null
          ? CustomerSummary.fromJson(json['Customer'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      lifeCycle: json['LifeCycle'] != null
          ? LifeCycleSummary.fromJson(json['LifeCycle'] as Map<String, dynamic>)
          : null,
      opportunityType:
          (json['OpportunityType'] as String?)?.let(OpportunityType.fromString),
      partnerOpportunityIdentifier:
          json['PartnerOpportunityIdentifier'] as String?,
      project: json['Project'] != null
          ? ProjectSummary.fromJson(json['Project'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final arn = this.arn;
    final createdDate = this.createdDate;
    final customer = this.customer;
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    final lifeCycle = this.lifeCycle;
    final opportunityType = this.opportunityType;
    final partnerOpportunityIdentifier = this.partnerOpportunityIdentifier;
    final project = this.project;
    return {
      'Catalog': catalog,
      if (arn != null) 'Arn': arn,
      if (createdDate != null) 'CreatedDate': iso8601ToJson(createdDate),
      if (customer != null) 'Customer': customer,
      if (id != null) 'Id': id,
      if (lastModifiedDate != null)
        'LastModifiedDate': iso8601ToJson(lastModifiedDate),
      if (lifeCycle != null) 'LifeCycle': lifeCycle,
      if (opportunityType != null) 'OpportunityType': opportunityType.value,
      if (partnerOpportunityIdentifier != null)
        'PartnerOpportunityIdentifier': partnerOpportunityIdentifier,
      if (project != null) 'Project': project,
    };
  }
}

/// An object that contains a <code>LifeCycle</code> object's subset of fields.
///
/// @nodoc
class LifeCycleSummary {
  /// Specifies the reason code when an opportunity is marked as <i>Closed
  /// Lost</i>. When you select an appropriate reason code, you communicate the
  /// context for closing the <code>Opportunity</code>, and aid in accurate
  /// reports and analysis of opportunity outcomes.
  final ClosedLostReason? closedLostReason;

  /// Specifies the upcoming actions or tasks for the <code>Opportunity</code>.
  /// This field is utilized to communicate to Amazon Web Services the next
  /// actions required for the <code>Opportunity</code>.
  final String? nextSteps;

  /// Indicates why an opportunity was sent back for further details. Partners
  /// must take corrective action based on the <code>ReviewComments</code>.
  final String? reviewComments;

  /// Indicates the review status of a partner referred opportunity. This field is
  /// read-only and only applicable for partner referrals. Valid values:
  ///
  /// <ul>
  /// <li>
  /// Pending Submission: Not submitted for validation (editable).
  /// </li>
  /// <li>
  /// Submitted: Submitted for validation and not yet Amazon Web Services reviewed
  /// (read-only).
  /// </li>
  /// <li>
  /// In Review: Undergoing Amazon Web Services validation (read-only).
  /// </li>
  /// <li>
  /// Action Required: Address any issues Amazon Web Services highlights. Use the
  /// <code>UpdateOpportunity</code> API action to update the opportunity, and
  /// ensure you make all required changes. Only these fields are editable when
  /// the <code>Lifecycle.ReviewStatus</code> is <code>Action Required</code>:
  ///
  /// <ul>
  /// <li>
  /// Customer.Account.Address.City
  /// </li>
  /// <li>
  /// Customer.Account.Address.CountryCode
  /// </li>
  /// <li>
  /// Customer.Account.Address.PostalCode
  /// </li>
  /// <li>
  /// Customer.Account.Address.StateOrRegion
  /// </li>
  /// <li>
  /// Customer.Account.Address.StreetAddress
  /// </li>
  /// <li>
  /// Customer.Account.WebsiteUrl
  /// </li>
  /// <li>
  /// LifeCycle.TargetCloseDate
  /// </li>
  /// <li>
  /// Project.ExpectedCustomerSpend.Amount
  /// </li>
  /// <li>
  /// Project.ExpectedCustomerSpend.CurrencyCode
  /// </li>
  /// <li>
  /// Project.CustomerBusinessProblem
  /// </li>
  /// <li>
  /// PartnerOpportunityIdentifier
  /// </li>
  /// </ul>
  /// After updates, the opportunity re-enters the validation phase. This process
  /// repeats until all issues are resolved, and the opportunity's
  /// <code>Lifecycle.ReviewStatus</code> is set to <code>Approved</code> or
  /// <code>Rejected</code>.
  /// </li>
  /// <li>
  /// Approved: Validated and converted into the Amazon Web Services seller's
  /// pipeline (editable).
  /// </li>
  /// <li>
  /// Rejected: Disqualified (read-only).
  /// </li>
  /// </ul>
  final ReviewStatus? reviewStatus;

  /// Indicates the reason a specific decision was taken during the opportunity
  /// review process. This field combines the reasons for both disqualified and
  /// action required statuses, and provides clarity for why an opportunity was
  /// disqualified or required further action.
  final String? reviewStatusReason;

  /// Specifies the current stage of the <code>Opportunity</code>'s lifecycle as
  /// it maps to Amazon Web Services stages from the current stage in the partner
  /// CRM. This field provides a translated value of the stage, and offers insight
  /// into the <code>Opportunity</code>'s progression in the sales cycle,
  /// according to Amazon Web Services definitions.
  /// <note>
  /// A lead and a prospect must be further matured to a <code>Qualified</code>
  /// opportunity before submission. Opportunities that were closed/lost before
  /// submission aren't suitable for submission.
  /// </note>
  /// The descriptions of each sales stage are:
  ///
  /// <ul>
  /// <li>
  /// Prospect: Amazon Web Services identifies the opportunity. It can be active
  /// (Comes directly from the end customer through a lead) or latent (Your
  /// account team believes it exists based on research, account plans, sales
  /// plays).
  /// </li>
  /// <li>
  /// Qualified: Your account team engaged with the customer to discuss viability
  /// and understand requirements. The customer agreed that the opportunity is
  /// real, of interest, and may solve business/technical needs.
  /// </li>
  /// <li>
  /// Technical Validation: All parties understand the implementation plan.
  /// </li>
  /// <li>
  /// Business Validation: Pricing was proposed, and all parties agree to the
  /// steps to close.
  /// </li>
  /// <li>
  /// Committed: The customer signed the contract, but Amazon Web Services hasn't
  /// started billing.
  /// </li>
  /// <li>
  /// Launched: The workload is complete, and Amazon Web Services has started
  /// billing.
  /// </li>
  /// <li>
  /// Closed Lost: The opportunity is lost, and there are no steps to move
  /// forward.
  /// </li>
  /// </ul>
  final Stage? stage;

  /// Specifies the date when Amazon Web Services expects to start significant
  /// billing, when the project finishes, and when it moves into production. This
  /// field informs the Amazon Web Services seller about when the opportunity
  /// launches and starts to incur Amazon Web Services usage.
  ///
  /// Ensure the <code>Target Close Date</code> isn't in the past.
  final String? targetCloseDate;

  LifeCycleSummary({
    this.closedLostReason,
    this.nextSteps,
    this.reviewComments,
    this.reviewStatus,
    this.reviewStatusReason,
    this.stage,
    this.targetCloseDate,
  });

  factory LifeCycleSummary.fromJson(Map<String, dynamic> json) {
    return LifeCycleSummary(
      closedLostReason: (json['ClosedLostReason'] as String?)
          ?.let(ClosedLostReason.fromString),
      nextSteps: json['NextSteps'] as String?,
      reviewComments: json['ReviewComments'] as String?,
      reviewStatus:
          (json['ReviewStatus'] as String?)?.let(ReviewStatus.fromString),
      reviewStatusReason: json['ReviewStatusReason'] as String?,
      stage: (json['Stage'] as String?)?.let(Stage.fromString),
      targetCloseDate: json['TargetCloseDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final closedLostReason = this.closedLostReason;
    final nextSteps = this.nextSteps;
    final reviewComments = this.reviewComments;
    final reviewStatus = this.reviewStatus;
    final reviewStatusReason = this.reviewStatusReason;
    final stage = this.stage;
    final targetCloseDate = this.targetCloseDate;
    return {
      if (closedLostReason != null) 'ClosedLostReason': closedLostReason.value,
      if (nextSteps != null) 'NextSteps': nextSteps,
      if (reviewComments != null) 'ReviewComments': reviewComments,
      if (reviewStatus != null) 'ReviewStatus': reviewStatus.value,
      if (reviewStatusReason != null) 'ReviewStatusReason': reviewStatusReason,
      if (stage != null) 'Stage': stage.value,
      if (targetCloseDate != null) 'TargetCloseDate': targetCloseDate,
    };
  }
}

/// An object that contains a <code>Customer</code> object's subset of fields.
///
/// @nodoc
class CustomerSummary {
  /// An object that contains a customer's account details.
  final AccountSummary? account;

  CustomerSummary({
    this.account,
  });

  factory CustomerSummary.fromJson(Map<String, dynamic> json) {
    return CustomerSummary(
      account: json['Account'] != null
          ? AccountSummary.fromJson(json['Account'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    return {
      if (account != null) 'Account': account,
    };
  }
}

/// An object that contains a <code>Project</code> object's subset of fields.
///
/// @nodoc
class ProjectSummary {
  /// Specifies your solution or service's deployment or consumption model in the
  /// <code>Opportunity</code>'s context. You can select multiple options.
  ///
  /// Options' descriptions from the <code>Delivery Model</code> field are:
  ///
  /// <ul>
  /// <li>
  /// SaaS or PaaS: Your Amazon Web Services based solution deployed as SaaS or
  /// PaaS in your Amazon Web Services environment.
  /// </li>
  /// <li>
  /// BYOL or AMI: Your Amazon Web Services based solution deployed as BYOL or AMI
  /// in the end customer's Amazon Web Services environment.
  /// </li>
  /// <li>
  /// Managed Services: The end customer's Amazon Web Services business management
  /// (For example: Consulting, design, implementation, billing support, cost
  /// optimization, technical support).
  /// </li>
  /// <li>
  /// Professional Services: Offerings to help enterprise end customers achieve
  /// specific business outcomes for enterprise cloud adoption (For example:
  /// Advisory or transformation planning).
  /// </li>
  /// <li>
  /// Resell: Amazon Web Services accounts and billing management for your
  /// customers.
  /// </li>
  /// <li>
  /// Other: Delivery model not described above.
  /// </li>
  /// </ul>
  final List<DeliveryModel>? deliveryModels;

  /// Optional. The expected contract duration for this opportunity, representing
  /// the anticipated length of the contract in the unit specified by
  /// <code>Term</code>.
  final ExpectedContractDuration? expectedContractDuration;

  /// Provides a summary of the expected customer spend for the project, offering
  /// a high-level view of the potential financial impact.
  final List<ExpectedCustomerSpend>? expectedCustomerSpend;

  ProjectSummary({
    this.deliveryModels,
    this.expectedContractDuration,
    this.expectedCustomerSpend,
  });

  factory ProjectSummary.fromJson(Map<String, dynamic> json) {
    return ProjectSummary(
      deliveryModels: (json['DeliveryModels'] as List?)
          ?.nonNulls
          .map((e) => DeliveryModel.fromString((e as String)))
          .toList(),
      expectedContractDuration: json['ExpectedContractDuration'] != null
          ? ExpectedContractDuration.fromJson(
              json['ExpectedContractDuration'] as Map<String, dynamic>)
          : null,
      expectedCustomerSpend: (json['ExpectedCustomerSpend'] as List?)
          ?.nonNulls
          .map((e) => ExpectedCustomerSpend.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryModels = this.deliveryModels;
    final expectedContractDuration = this.expectedContractDuration;
    final expectedCustomerSpend = this.expectedCustomerSpend;
    return {
      if (deliveryModels != null)
        'DeliveryModels': deliveryModels.map((e) => e.value).toList(),
      if (expectedContractDuration != null)
        'ExpectedContractDuration': expectedContractDuration,
      if (expectedCustomerSpend != null)
        'ExpectedCustomerSpend': expectedCustomerSpend,
    };
  }
}

/// An object that contains an <code>Account</code>'s subset of fields.
///
/// @nodoc
class AccountSummary {
  /// Specifies the end <code>Customer</code>'s company name associated with the
  /// <code>Opportunity</code>.
  final String companyName;

  /// Specifies the end <code>Customer</code>'s address details associated with
  /// the <code>Opportunity</code>.
  final AddressSummary? address;

  /// Specifies which industry the end <code>Customer</code> belongs to associated
  /// with the <code>Opportunity</code>. It refers to the category or sector that
  /// the customer's business operates in.
  ///
  /// To submit a value outside the picklist, use <code>Other</code>.
  ///
  /// Conditionally mandatory if <code>Other</code> is selected for Industry
  /// Vertical in LOVs.
  final Industry? industry;

  /// Specifies the end <code>Customer</code>'s industry associated with the
  /// <code> Opportunity</code>, when the selected value in the
  /// <code>Industry</code> field is <code>Other</code>. This field is relevant
  /// when the customer's industry doesn't fall under the predefined picklist
  /// values and requires a custom description.
  final String? otherIndustry;

  /// Specifies the end customer's company website URL associated with the
  /// <code>Opportunity</code>. This value is crucial to map the customer within
  /// the Amazon Web Services CRM system.
  final String? websiteUrl;

  AccountSummary({
    required this.companyName,
    this.address,
    this.industry,
    this.otherIndustry,
    this.websiteUrl,
  });

  factory AccountSummary.fromJson(Map<String, dynamic> json) {
    return AccountSummary(
      companyName: (json['CompanyName'] as String?) ?? '',
      address: json['Address'] != null
          ? AddressSummary.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      industry: (json['Industry'] as String?)?.let(Industry.fromString),
      otherIndustry: json['OtherIndustry'] as String?,
      websiteUrl: json['WebsiteUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final companyName = this.companyName;
    final address = this.address;
    final industry = this.industry;
    final otherIndustry = this.otherIndustry;
    final websiteUrl = this.websiteUrl;
    return {
      'CompanyName': companyName,
      if (address != null) 'Address': address,
      if (industry != null) 'Industry': industry.value,
      if (otherIndustry != null) 'OtherIndustry': otherIndustry,
      if (websiteUrl != null) 'WebsiteUrl': websiteUrl,
    };
  }
}

/// An object that contains an <code>Address</code> object's subset of fields.
///
/// @nodoc
class AddressSummary {
  /// Specifies the end <code>Customer</code>'s city associated with the
  /// <code>Opportunity</code>.
  final String? city;

  /// Specifies the end <code>Customer</code>'s country associated with the
  /// <code>Opportunity</code>.
  final CountryCode? countryCode;

  /// Specifies the end <code>Customer</code>'s postal code associated with the
  /// <code>Opportunity</code>.
  final String? postalCode;

  /// Specifies the end <code>Customer</code>'s state or region associated with
  /// the <code>Opportunity</code>.
  ///
  /// Valid values: <code>Alabama | Alaska | American Samoa | Arizona | Arkansas |
  /// California | Colorado | Connecticut | Delaware | Dist. of Columbia |
  /// Federated States of Micronesia | Florida | Georgia | Guam | Hawaii | Idaho |
  /// Illinois | Indiana | Iowa | Kansas | Kentucky | Louisiana | Maine | Marshall
  /// Islands | Maryland | Massachusetts | Michigan | Minnesota | Mississippi |
  /// Missouri | Montana | Nebraska | Nevada | New Hampshire | New Jersey | New
  /// Mexico | New York | North Carolina | North Dakota | Northern Mariana Islands
  /// | Ohio | Oklahoma | Oregon | Palau | Pennsylvania | Puerto Rico | Rhode
  /// Island | South Carolina | South Dakota | Tennessee | Texas | Utah | Vermont
  /// | Virginia | Virgin Islands | Washington | West Virginia | Wisconsin |
  /// Wyoming | APO/AE | AFO/FPO | FPO, AP</code>
  final String? stateOrRegion;

  AddressSummary({
    this.city,
    this.countryCode,
    this.postalCode,
    this.stateOrRegion,
  });

  factory AddressSummary.fromJson(Map<String, dynamic> json) {
    return AddressSummary(
      city: json['City'] as String?,
      countryCode:
          (json['CountryCode'] as String?)?.let(CountryCode.fromString),
      postalCode: json['PostalCode'] as String?,
      stateOrRegion: json['StateOrRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final countryCode = this.countryCode;
    final postalCode = this.postalCode;
    final stateOrRegion = this.stateOrRegion;
    return {
      if (city != null) 'City': city,
      if (countryCode != null) 'CountryCode': countryCode.value,
      if (postalCode != null) 'PostalCode': postalCode,
      if (stateOrRegion != null) 'StateOrRegion': stateOrRegion,
    };
  }
}

/// @nodoc
class ClosedLostReason {
  static const customerDeficiency = ClosedLostReason._('Customer Deficiency');
  static const delayCancellationOfProject =
      ClosedLostReason._('Delay / Cancellation of Project');
  static const legalTaxRegulatory =
      ClosedLostReason._('Legal / Tax / Regulatory');
  static const lostToCompetitorGoogle =
      ClosedLostReason._('Lost to Competitor - Google');
  static const lostToCompetitorMicrosoft =
      ClosedLostReason._('Lost to Competitor - Microsoft');
  static const lostToCompetitorSoftLayer =
      ClosedLostReason._('Lost to Competitor - SoftLayer');
  static const lostToCompetitorVMWare =
      ClosedLostReason._('Lost to Competitor - VMWare');
  static const lostToCompetitorOther =
      ClosedLostReason._('Lost to Competitor - Other');
  static const noOpportunity = ClosedLostReason._('No Opportunity');
  static const onPremisesDeployment =
      ClosedLostReason._('On Premises Deployment');
  static const partnerGap = ClosedLostReason._('Partner Gap');
  static const price = ClosedLostReason._('Price');
  static const securityCompliance = ClosedLostReason._('Security / Compliance');
  static const technicalLimitations =
      ClosedLostReason._('Technical Limitations');
  static const customerExperience = ClosedLostReason._('Customer Experience');
  static const other = ClosedLostReason._('Other');
  static const peopleRelationshipGovernance =
      ClosedLostReason._('People/Relationship/Governance');
  static const productTechnology = ClosedLostReason._('Product/Technology');
  static const financialCommercial = ClosedLostReason._('Financial/Commercial');

  final String value;

  const ClosedLostReason._(this.value);

  static const values = [
    customerDeficiency,
    delayCancellationOfProject,
    legalTaxRegulatory,
    lostToCompetitorGoogle,
    lostToCompetitorMicrosoft,
    lostToCompetitorSoftLayer,
    lostToCompetitorVMWare,
    lostToCompetitorOther,
    noOpportunity,
    onPremisesDeployment,
    partnerGap,
    price,
    securityCompliance,
    technicalLimitations,
    customerExperience,
    other,
    peopleRelationshipGovernance,
    productTechnology,
    financialCommercial
  ];

  static ClosedLostReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClosedLostReason._(value));

  @override
  bool operator ==(other) => other is ClosedLostReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object that configures response sorting.
///
/// @nodoc
class OpportunitySort {
  /// Field name to sort by.
  final OpportunitySortName sortBy;

  /// Sort order.
  ///
  /// Default: <code>Descending</code>
  final SortOrder sortOrder;

  OpportunitySort({
    required this.sortBy,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      'SortBy': sortBy.value,
      'SortOrder': sortOrder.value,
    };
  }
}

/// Defines a filter to retrieve opportunities based on the last modified date.
/// This filter is useful for tracking changes or updates to opportunities over
/// time.
///
/// @nodoc
class LastModifiedDate {
  /// Specifies the date after which the opportunities were modified. Use this
  /// filter to retrieve only those opportunities that were modified after a given
  /// timestamp.
  final DateTime? afterLastModifiedDate;

  /// Specifies the date before which the opportunities were modified. Use this
  /// filter to retrieve only those opportunities that were modified before a
  /// given timestamp.
  final DateTime? beforeLastModifiedDate;

  LastModifiedDate({
    this.afterLastModifiedDate,
    this.beforeLastModifiedDate,
  });

  Map<String, dynamic> toJson() {
    final afterLastModifiedDate = this.afterLastModifiedDate;
    final beforeLastModifiedDate = this.beforeLastModifiedDate;
    return {
      if (afterLastModifiedDate != null)
        'AfterLastModifiedDate': iso8601ToJson(afterLastModifiedDate),
      if (beforeLastModifiedDate != null)
        'BeforeLastModifiedDate': iso8601ToJson(beforeLastModifiedDate),
    };
  }
}

/// Filter for opportunities based on creation date range.
///
/// @nodoc
class CreatedDateFilter {
  /// Filter opportunities created after this date.
  final DateTime? afterCreatedDate;

  /// Filter opportunities created before this date.
  final DateTime? beforeCreatedDate;

  CreatedDateFilter({
    this.afterCreatedDate,
    this.beforeCreatedDate,
  });

  Map<String, dynamic> toJson() {
    final afterCreatedDate = this.afterCreatedDate;
    final beforeCreatedDate = this.beforeCreatedDate;
    return {
      if (afterCreatedDate != null)
        'AfterCreatedDate': iso8601ToJson(afterCreatedDate),
      if (beforeCreatedDate != null)
        'BeforeCreatedDate': iso8601ToJson(beforeCreatedDate),
    };
  }
}

/// Filters opportunities based on their target close date.
///
/// @nodoc
class TargetCloseDateFilter {
  /// Filters opportunities with a target close date after this date. Use the
  /// <code>YYYY-MM-DD</code> format.
  final String? afterTargetCloseDate;

  /// Filters opportunities with a target close date before this date. Use the
  /// <code>YYYY-MM-DD</code> format.
  final String? beforeTargetCloseDate;

  TargetCloseDateFilter({
    this.afterTargetCloseDate,
    this.beforeTargetCloseDate,
  });

  Map<String, dynamic> toJson() {
    final afterTargetCloseDate = this.afterTargetCloseDate;
    final beforeTargetCloseDate = this.beforeTargetCloseDate;
    return {
      if (afterTargetCloseDate != null)
        'AfterTargetCloseDate': afterTargetCloseDate,
      if (beforeTargetCloseDate != null)
        'BeforeTargetCloseDate': beforeTargetCloseDate,
    };
  }
}

/// @nodoc
class OpportunitySortName {
  static const lastModifiedDate = OpportunitySortName._('LastModifiedDate');
  static const identifier = OpportunitySortName._('Identifier');
  static const customerCompanyName =
      OpportunitySortName._('CustomerCompanyName');
  static const createdDate = OpportunitySortName._('CreatedDate');
  static const targetCloseDate = OpportunitySortName._('TargetCloseDate');

  final String value;

  const OpportunitySortName._(this.value);

  static const values = [
    lastModifiedDate,
    identifier,
    customerCompanyName,
    createdDate,
    targetCloseDate
  ];

  static OpportunitySortName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OpportunitySortName._(value));

  @override
  bool operator ==(other) =>
      other is OpportunitySortName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class NationalSecurity {
  static const yes = NationalSecurity._('Yes');
  static const no = NationalSecurity._('No');

  final String value;

  const NationalSecurity._(this.value);

  static const values = [yes, no];

  static NationalSecurity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NationalSecurity._(value));

  @override
  bool operator ==(other) => other is NationalSecurity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that contains the <code>Opportunity</code>'s project details.
///
/// @nodoc
class Project {
  /// Captures additional comments or information for the <code>Opportunity</code>
  /// that weren't captured in other fields.
  final String? additionalComments;

  /// Specifies the Amazon Partner Network (APN) program that influenced the
  /// <code>Opportunity</code>. APN programs refer to specific partner programs or
  /// initiatives that can impact the <code>Opportunity</code>.
  ///
  /// Valid values: <code>APN Immersion Days | APN Solution Space | ATO (Authority
  /// to Operate) | AWS Marketplace Campaign | IS Immersion Day SFID Program | ISV
  /// Workload Migration | Migration Acceleration Program | P3 | Partner Launch
  /// Initiative | Partner Opportunity Acceleration Funded | The Next Smart |
  /// VMware Cloud on AWS | Well-Architected | Windows | Workspaces/AppStream
  /// Accelerator Program | WWPS NDPP</code>
  final List<String>? apnPrograms;

  /// AWS partition where the opportunity will be deployed. Possible values:
  /// <code>aws-eusc</code> for AWS European Sovereign Cloud, <code>null</code>
  /// for all other partitions.
  final AwsPartition? awsPartition;

  /// Name of the <code>Opportunity</code>'s competitor (if any). Use
  /// <code>Other</code> to submit a value not in the picklist.
  final CompetitorName? competitorName;

  /// Describes the problem the end customer has, and how the partner is helping.
  /// Utilize this field to provide a concise narrative that outlines the
  /// customer's business challenge or issue. Elaborate on how the partner's
  /// solution or offerings align to resolve the customer's business problem.
  /// Include relevant information about the partner's value proposition, unique
  /// selling points, and expertise to tackle the issue. Offer insights on how the
  /// proposed solution meets the customer's needs and provides value. Use concise
  /// language and precise descriptions to convey the context and significance of
  /// the <code>Opportunity</code>. The content in this field helps Amazon Web
  /// Services understand the nature of the <code>Opportunity</code> and the
  /// strategic fit of the partner's solution.
  final String? customerBusinessProblem;

  /// Specifies the proposed solution focus or type of workload for the
  /// Opportunity. This field captures the primary use case or objective of the
  /// proposed solution, and provides context and clarity to the addressed
  /// workload.
  ///
  /// Valid values: <code>AI Machine Learning and Analytics | Archiving | Big
  /// Data: Data Warehouse/Data Integration/ETL/Data Lake/BI | Blockchain |
  /// Business Applications: Mainframe Modernization | Business Applications &amp;
  /// Contact Center | Business Applications &amp; SAP Production | Centralized
  /// Operations Management | Cloud Management Tools | Cloud Management Tools
  /// &amp; DevOps with Continuous Integration &amp; Continuous Delivery (CICD) |
  /// Configuration, Compliance &amp; Auditing | Connected Services | Containers
  /// &amp; Serverless | Content Delivery &amp; Edge Services | Database | Edge
  /// Computing/End User Computing | Energy | Enterprise Governance &amp; Controls
  /// | Enterprise Resource Planning | Financial Services | Healthcare and Life
  /// Sciences | High Performance Computing | Hybrid Application Platform |
  /// Industrial Software | IOT | Manufacturing, Supply Chain and Operations |
  /// Media &amp; High performance computing (HPC) | Migration/Database Migration
  /// | Monitoring, logging and performance | Monitoring &amp; Observability |
  /// Networking | Outpost | SAP | Security &amp; Compliance | Storage &amp;
  /// Backup | Training | VMC | VMWare | Web development &amp; DevOps</code>
  final String? customerUseCase;

  /// Specifies the deployment or consumption model for your solution or service
  /// in the <code>Opportunity</code>'s context. You can select multiple options.
  ///
  /// Options' descriptions from the <code>Delivery Model</code> field are:
  ///
  /// <ul>
  /// <li>
  /// SaaS or PaaS: Your Amazon Web Services based solution deployed as SaaS or
  /// PaaS in your Amazon Web Services environment.
  /// </li>
  /// <li>
  /// BYOL or AMI: Your Amazon Web Services based solution deployed as BYOL or AMI
  /// in the end customer's Amazon Web Services environment.
  /// </li>
  /// <li>
  /// Managed Services: The end customer's Amazon Web Services business management
  /// (For example: Consulting, design, implementation, billing support, cost
  /// optimization, technical support).
  /// </li>
  /// <li>
  /// Professional Services: Offerings to help enterprise end customers achieve
  /// specific business outcomes for enterprise cloud adoption (For example:
  /// Advisory or transformation planning).
  /// </li>
  /// <li>
  /// Resell: Amazon Web Services accounts and billing management for your
  /// customers.
  /// </li>
  /// <li>
  /// Other: Delivery model not described above.
  /// </li>
  /// </ul>
  final List<DeliveryModel>? deliveryModels;

  /// Optional. The expected duration of the contract associated with this
  /// opportunity. Partners use this value alongside expected customer spend to
  /// convert Total Contract Value (TCV) into Monthly Recurring Revenue (MRR).
  final ExpectedContractDuration? expectedContractDuration;

  /// Represents the estimated amount that the customer is expected to spend on
  /// AWS services related to the opportunity. This helps in evaluating the
  /// potential financial value of the opportunity for AWS.
  final List<ExpectedCustomerSpend>? expectedCustomerSpend;

  /// Only allowed when <code>CompetitorNames</code> has <code>Other</code>
  /// selected.
  final String? otherCompetitorNames;

  /// Specifies the offered solution for the customer's business problem when the
  /// <code> RelatedEntityIdentifiers.Solutions</code> field value is
  /// <code>Other</code>.
  final String? otherSolutionDescription;

  /// Specifies the current opportunity's parent opportunity identifier.
  final String? relatedOpportunityIdentifier;

  /// Specifies the <code>Opportunity</code>'s sales activities conducted with the
  /// end customer. These activities help drive Amazon Web Services assignment
  /// priority.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// Initialized discussions with customer: Initial conversations with the
  /// customer to understand their needs and introduce your solution.
  /// </li>
  /// <li>
  /// Customer has shown interest in solution: After initial discussions, the
  /// customer is interested in your solution.
  /// </li>
  /// <li>
  /// Conducted POC/demo: You conducted a proof of concept (POC) or demonstration
  /// of the solution for the customer.
  /// </li>
  /// <li>
  /// In evaluation/planning stage: The customer is evaluating the solution and
  /// planning potential implementation.
  /// </li>
  /// <li>
  /// Agreed on solution to Business Problem: Both parties agree on how the
  /// solution addresses the customer's business problem.
  /// </li>
  /// <li>
  /// Completed Action Plan: A detailed action plan is complete and outlines the
  /// steps for implementation.
  /// </li>
  /// <li>
  /// Finalized Deployment Need: Both parties agree with and finalized the
  /// deployment needs.
  /// </li>
  /// <li>
  /// SOW Signed: Both parties signed a statement of work (SOW), and formalize the
  /// agreement and detail the project scope and deliverables.
  /// </li>
  /// </ul>
  final List<SalesActivity>? salesActivities;

  /// Specifies the <code>Opportunity</code>'s title or name.
  final String? title;

  Project({
    this.additionalComments,
    this.apnPrograms,
    this.awsPartition,
    this.competitorName,
    this.customerBusinessProblem,
    this.customerUseCase,
    this.deliveryModels,
    this.expectedContractDuration,
    this.expectedCustomerSpend,
    this.otherCompetitorNames,
    this.otherSolutionDescription,
    this.relatedOpportunityIdentifier,
    this.salesActivities,
    this.title,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      additionalComments: json['AdditionalComments'] as String?,
      apnPrograms: (json['ApnPrograms'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      awsPartition:
          (json['AwsPartition'] as String?)?.let(AwsPartition.fromString),
      competitorName:
          (json['CompetitorName'] as String?)?.let(CompetitorName.fromString),
      customerBusinessProblem: json['CustomerBusinessProblem'] as String?,
      customerUseCase: json['CustomerUseCase'] as String?,
      deliveryModels: (json['DeliveryModels'] as List?)
          ?.nonNulls
          .map((e) => DeliveryModel.fromString((e as String)))
          .toList(),
      expectedContractDuration: json['ExpectedContractDuration'] != null
          ? ExpectedContractDuration.fromJson(
              json['ExpectedContractDuration'] as Map<String, dynamic>)
          : null,
      expectedCustomerSpend: (json['ExpectedCustomerSpend'] as List?)
          ?.nonNulls
          .map((e) => ExpectedCustomerSpend.fromJson(e as Map<String, dynamic>))
          .toList(),
      otherCompetitorNames: json['OtherCompetitorNames'] as String?,
      otherSolutionDescription: json['OtherSolutionDescription'] as String?,
      relatedOpportunityIdentifier:
          json['RelatedOpportunityIdentifier'] as String?,
      salesActivities: (json['SalesActivities'] as List?)
          ?.nonNulls
          .map((e) => SalesActivity.fromString((e as String)))
          .toList(),
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalComments = this.additionalComments;
    final apnPrograms = this.apnPrograms;
    final awsPartition = this.awsPartition;
    final competitorName = this.competitorName;
    final customerBusinessProblem = this.customerBusinessProblem;
    final customerUseCase = this.customerUseCase;
    final deliveryModels = this.deliveryModels;
    final expectedContractDuration = this.expectedContractDuration;
    final expectedCustomerSpend = this.expectedCustomerSpend;
    final otherCompetitorNames = this.otherCompetitorNames;
    final otherSolutionDescription = this.otherSolutionDescription;
    final relatedOpportunityIdentifier = this.relatedOpportunityIdentifier;
    final salesActivities = this.salesActivities;
    final title = this.title;
    return {
      if (additionalComments != null) 'AdditionalComments': additionalComments,
      if (apnPrograms != null) 'ApnPrograms': apnPrograms,
      if (awsPartition != null) 'AwsPartition': awsPartition.value,
      if (competitorName != null) 'CompetitorName': competitorName.value,
      if (customerBusinessProblem != null)
        'CustomerBusinessProblem': customerBusinessProblem,
      if (customerUseCase != null) 'CustomerUseCase': customerUseCase,
      if (deliveryModels != null)
        'DeliveryModels': deliveryModels.map((e) => e.value).toList(),
      if (expectedContractDuration != null)
        'ExpectedContractDuration': expectedContractDuration,
      if (expectedCustomerSpend != null)
        'ExpectedCustomerSpend': expectedCustomerSpend,
      if (otherCompetitorNames != null)
        'OtherCompetitorNames': otherCompetitorNames,
      if (otherSolutionDescription != null)
        'OtherSolutionDescription': otherSolutionDescription,
      if (relatedOpportunityIdentifier != null)
        'RelatedOpportunityIdentifier': relatedOpportunityIdentifier,
      if (salesActivities != null)
        'SalesActivities': salesActivities.map((e) => e.value).toList(),
      if (title != null) 'Title': title,
    };
  }
}

/// An object that contains marketing details for the <code>Opportunity</code>.
///
/// @nodoc
class Marketing {
  /// Indicates if the <code>Opportunity</code> is a marketing development fund
  /// (MDF) funded activity.
  final AwsFundingUsed? awsFundingUsed;

  /// Specifies the <code>Opportunity</code> marketing campaign code. The Amazon
  /// Web Services campaign code is a reference to specific marketing initiatives,
  /// promotions, or activities. This field captures the identifier used to track
  /// and categorize the <code>Opportunity</code> within marketing campaigns. If
  /// you don't have a campaign code, contact your Amazon Web Services point of
  /// contact to obtain one.
  final String? campaignName;

  /// Specifies the <code>Opportunity</code>'s channel that the marketing activity
  /// is associated with or was contacted through. This field provides information
  /// about the specific marketing channel that contributed to the generation of
  /// the lead or contact.
  final List<Channel>? channels;

  /// Indicates if the <code>Opportunity</code> was sourced from an Amazon Web
  /// Services marketing activity. Use the value <code>Marketing Activity</code>.
  /// Use <code>None</code> if it's not associated with an Amazon Web Services
  /// marketing activity. This field helps Amazon Web Services track the return on
  /// marketing investments and enables better distribution of marketing budgets
  /// among partners.
  final MarketingSource? source;

  /// Specifies the marketing activity use case or purpose that led to the
  /// <code>Opportunity</code>'s creation or contact. This field captures the
  /// context or marketing activity's execution's intention and the direct
  /// correlation to the generated opportunity or contact. Must be empty when
  /// <code>Marketing.AWSFundingUsed = No</code>.
  ///
  /// Valid values: <code>AI/ML | Analytics | Application Integration | Blockchain
  /// | Business Applications | Cloud Financial Management | Compute | Containers
  /// | Customer Engagement | Databases | Developer Tools | End User Computing |
  /// Front End Web &amp; Mobile | Game Tech | IoT | Management &amp; Governance |
  /// Media Services | Migration &amp; Transfer | Networking &amp; Content
  /// Delivery | Quantum Technologies | Robotics | Satellite | Security |
  /// Serverless | Storage | VR &amp; AR</code>
  final List<String>? useCases;

  Marketing({
    this.awsFundingUsed,
    this.campaignName,
    this.channels,
    this.source,
    this.useCases,
  });

  factory Marketing.fromJson(Map<String, dynamic> json) {
    return Marketing(
      awsFundingUsed:
          (json['AwsFundingUsed'] as String?)?.let(AwsFundingUsed.fromString),
      campaignName: json['CampaignName'] as String?,
      channels: (json['Channels'] as List?)
          ?.nonNulls
          .map((e) => Channel.fromString((e as String)))
          .toList(),
      source: (json['Source'] as String?)?.let(MarketingSource.fromString),
      useCases: (json['UseCases'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsFundingUsed = this.awsFundingUsed;
    final campaignName = this.campaignName;
    final channels = this.channels;
    final source = this.source;
    final useCases = this.useCases;
    return {
      if (awsFundingUsed != null) 'AwsFundingUsed': awsFundingUsed.value,
      if (campaignName != null) 'CampaignName': campaignName,
      if (channels != null) 'Channels': channels.map((e) => e.value).toList(),
      if (source != null) 'Source': source.value,
      if (useCases != null) 'UseCases': useCases,
    };
  }
}

/// Specifies a customer's procurement terms details. Required only for partners
/// in eligible programs.
///
/// @nodoc
class SoftwareRevenue {
  /// Specifies the customer's intended payment type agreement or procurement
  /// method to acquire the solution or service outlined in the
  /// <code>Opportunity</code>.
  final RevenueModel? deliveryModel;

  /// Specifies the <code>Opportunity</code>'s customer engagement start date for
  /// the contract's effectiveness.
  final String? effectiveDate;

  /// Specifies the expiration date for the contract between the customer and
  /// Amazon Web Services partner. It signifies the termination date of the
  /// agreed-upon engagement period between both parties.
  final String? expirationDate;

  /// Specifies the payment value (amount and currency).
  final MonetaryValue? value;

  SoftwareRevenue({
    this.deliveryModel,
    this.effectiveDate,
    this.expirationDate,
    this.value,
  });

  factory SoftwareRevenue.fromJson(Map<String, dynamic> json) {
    return SoftwareRevenue(
      deliveryModel:
          (json['DeliveryModel'] as String?)?.let(RevenueModel.fromString),
      effectiveDate: json['EffectiveDate'] as String?,
      expirationDate: json['ExpirationDate'] as String?,
      value: json['Value'] != null
          ? MonetaryValue.fromJson(json['Value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryModel = this.deliveryModel;
    final effectiveDate = this.effectiveDate;
    final expirationDate = this.expirationDate;
    final value = this.value;
    return {
      if (deliveryModel != null) 'DeliveryModel': deliveryModel.value,
      if (effectiveDate != null) 'EffectiveDate': effectiveDate,
      if (expirationDate != null) 'ExpirationDate': expirationDate,
      if (value != null) 'Value': value,
    };
  }
}

/// An object that contains the <code>Opportunity</code> lifecycle's details.
///
/// @nodoc
class LifeCycle {
  /// Specifies the reason code when an opportunity is marked as <i>Closed
  /// Lost</i>. When you select an appropriate reason code, you communicate the
  /// context for closing the <code>Opportunity</code>, and aid in accurate
  /// reports and analysis of opportunity outcomes. The possible values are:
  ///
  /// <ul>
  /// <li>
  /// Customer Deficiency: The customer lacked necessary resources or
  /// capabilities.
  /// </li>
  /// <li>
  /// Delay/Cancellation of Project: The project was delayed or canceled.
  /// </li>
  /// <li>
  /// Legal/Tax/Regulatory: Legal, tax, or regulatory issues prevented progress.
  /// </li>
  /// <li>
  /// Lost to Competitor—Google: The opportunity was lost to Google.
  /// </li>
  /// <li>
  /// Lost to Competitor—Microsoft: The opportunity was lost to Microsoft.
  /// </li>
  /// <li>
  /// Lost to Competitor—SoftLayer: The opportunity was lost to SoftLayer.
  /// </li>
  /// <li>
  /// Lost to Competitor—VMWare: The opportunity was lost to VMWare.
  /// </li>
  /// <li>
  /// Lost to Competitor—Other: The opportunity was lost to a competitor not
  /// listed above.
  /// </li>
  /// <li>
  /// No Opportunity: There was no opportunity to pursue.
  /// </li>
  /// <li>
  /// On Premises Deployment: The customer chose an on-premises solution.
  /// </li>
  /// <li>
  /// Partner Gap: The partner lacked necessary resources or capabilities.
  /// </li>
  /// <li>
  /// Price: The price was not competitive or acceptable to the customer.
  /// </li>
  /// <li>
  /// Security/Compliance: Security or compliance issues prevented progress.
  /// </li>
  /// <li>
  /// Technical Limitations: Technical limitations prevented progress.
  /// </li>
  /// <li>
  /// Customer Experience: Issues related to the customer's experience impacted
  /// the decision.
  /// </li>
  /// <li>
  /// Other: Any reason not covered by the other values.
  /// </li>
  /// <li>
  /// People/Relationship/Governance: Issues related to people, relationships, or
  /// governance.
  /// </li>
  /// <li>
  /// Product/Technology: Issues related to the product or technology.
  /// </li>
  /// <li>
  /// Financial/Commercial: Financial or commercial issues impacted the decision.
  /// </li>
  /// </ul>
  final ClosedLostReason? closedLostReason;

  /// Specifies the upcoming actions or tasks for the <code>Opportunity</code>.
  /// Use this field to communicate with Amazon Web Services about the next
  /// actions required for the <code>Opportunity</code>.
  final String? nextSteps;

  /// Captures a chronological record of the next steps or actions planned or
  /// taken for the current opportunity, along with the timestamp.
  final List<NextStepsHistory>? nextStepsHistory;

  /// Contains detailed feedback from Amazon Web Services when requesting
  /// additional information from partners. Provides specific guidance on what
  /// partners need to provide or clarify for opportunity validation,
  /// complementing the <code>ReviewStatusReason</code> field.
  final String? reviewComments;

  /// Indicates the review status of an opportunity referred by a partner. This
  /// field is read-only and only applicable for partner referrals. The possible
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// Pending Submission: Not submitted for validation (editable).
  /// </li>
  /// <li>
  /// Submitted: Submitted for validation, and Amazon Web Services hasn't reviewed
  /// it (read-only).
  /// </li>
  /// <li>
  /// In Review: Amazon Web Services is validating (read-only).
  /// </li>
  /// <li>
  /// Action Required: Issues that Amazon Web Services highlights need to be
  /// addressed. Partners should use the <code>UpdateOpportunity</code> API action
  /// to update the opportunity and helps to ensure that all required changes are
  /// made. Only the following fields are editable when the
  /// <code>Lifecycle.ReviewStatus</code> is <code>Action Required</code>:
  ///
  /// <ul>
  /// <li>
  /// Customer.Account.Address.City
  /// </li>
  /// <li>
  /// Customer.Account.Address.CountryCode
  /// </li>
  /// <li>
  /// Customer.Account.Address.PostalCode
  /// </li>
  /// <li>
  /// Customer.Account.Address.StateOrRegion
  /// </li>
  /// <li>
  /// Customer.Account.Address.StreetAddress
  /// </li>
  /// <li>
  /// Customer.Account.WebsiteUrl
  /// </li>
  /// <li>
  /// LifeCycle.TargetCloseDate
  /// </li>
  /// <li>
  /// Project.ExpectedMonthlyAWSRevenue.Amount
  /// </li>
  /// <li>
  /// Project.ExpectedMonthlyAWSRevenue.CurrencyCode
  /// </li>
  /// <li>
  /// Project.CustomerBusinessProblem
  /// </li>
  /// <li>
  /// PartnerOpportunityIdentifier
  /// </li>
  /// </ul>
  /// After updates, the opportunity re-enters the validation phase. This process
  /// repeats until all issues are resolved, and the opportunity's
  /// <code>Lifecycle.ReviewStatus</code> is set to <code>Approved</code> or
  /// <code>Rejected</code>.
  /// </li>
  /// <li>
  /// Approved: Validated and converted into the Amazon Web Services seller's
  /// pipeline (editable).
  /// </li>
  /// <li>
  /// Rejected: Disqualified (read-only).
  /// </li>
  /// </ul>
  final ReviewStatus? reviewStatus;

  /// Code indicating the validation decision during the Amazon Web Services
  /// opportunity review. Applies when status is <code>Rejected</code> or
  /// <code>Action Required</code>. Used to document validation results for AWS
  /// Partner Referrals and indicate when additional information is needed from
  /// partners as part of the APN Customer Engagement (ACE) program.
  final String? reviewStatusReason;

  /// Specifies the current stage of the <code>Opportunity</code>'s lifecycle as
  /// it maps to Amazon Web Services stages from the current stage in the partner
  /// CRM. This field provides a translated value of the stage, and offers insight
  /// into the <code>Opportunity</code>'s progression in the sales cycle,
  /// according to Amazon Web Services definitions.
  /// <note>
  /// A lead and a prospect must be further matured to a <code>Qualified</code>
  /// opportunity before submission. Opportunities that were closed/lost before
  /// submission aren't suitable for submission.
  /// </note>
  /// The descriptions of each sales stage are:
  ///
  /// <ul>
  /// <li>
  /// Prospect: Amazon Web Services identifies the opportunity. It can be active
  /// (Comes directly from the end customer through a lead) or latent (Your
  /// account team believes it exists based on research, account plans, sales
  /// plays).
  /// </li>
  /// <li>
  /// Qualified: Your account team engaged with the customer to discuss viability
  /// and requirements. The customer agreed that the opportunity is real, of
  /// interest, and may solve business/technical needs.
  /// </li>
  /// <li>
  /// Technical Validation: All parties understand the implementation plan.
  /// </li>
  /// <li>
  /// Business Validation: Pricing was proposed, and all parties agree to the
  /// steps to close.
  /// </li>
  /// <li>
  /// Committed: The customer signed the contract, but Amazon Web Services hasn't
  /// started billing.
  /// </li>
  /// <li>
  /// Launched: The workload is complete, and Amazon Web Services has started
  /// billing.
  /// </li>
  /// <li>
  /// Closed Lost: The opportunity is lost, and there are no steps to move
  /// forward.
  /// </li>
  /// </ul>
  final Stage? stage;

  /// Specifies the date when Amazon Web Services expects to start significant
  /// billing, when the project finishes, and when it moves into production. This
  /// field informs the Amazon Web Services seller about when the opportunity
  /// launches and starts to incur Amazon Web Services usage.
  ///
  /// Ensure the <code>Target Close Date</code> isn't in the past.
  final String? targetCloseDate;

  LifeCycle({
    this.closedLostReason,
    this.nextSteps,
    this.nextStepsHistory,
    this.reviewComments,
    this.reviewStatus,
    this.reviewStatusReason,
    this.stage,
    this.targetCloseDate,
  });

  factory LifeCycle.fromJson(Map<String, dynamic> json) {
    return LifeCycle(
      closedLostReason: (json['ClosedLostReason'] as String?)
          ?.let(ClosedLostReason.fromString),
      nextSteps: json['NextSteps'] as String?,
      nextStepsHistory: (json['NextStepsHistory'] as List?)
          ?.nonNulls
          .map((e) => NextStepsHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewComments: json['ReviewComments'] as String?,
      reviewStatus:
          (json['ReviewStatus'] as String?)?.let(ReviewStatus.fromString),
      reviewStatusReason: json['ReviewStatusReason'] as String?,
      stage: (json['Stage'] as String?)?.let(Stage.fromString),
      targetCloseDate: json['TargetCloseDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final closedLostReason = this.closedLostReason;
    final nextSteps = this.nextSteps;
    final nextStepsHistory = this.nextStepsHistory;
    final reviewComments = this.reviewComments;
    final reviewStatus = this.reviewStatus;
    final reviewStatusReason = this.reviewStatusReason;
    final stage = this.stage;
    final targetCloseDate = this.targetCloseDate;
    return {
      if (closedLostReason != null) 'ClosedLostReason': closedLostReason.value,
      if (nextSteps != null) 'NextSteps': nextSteps,
      if (nextStepsHistory != null) 'NextStepsHistory': nextStepsHistory,
      if (reviewComments != null) 'ReviewComments': reviewComments,
      if (reviewStatus != null) 'ReviewStatus': reviewStatus.value,
      if (reviewStatusReason != null) 'ReviewStatusReason': reviewStatusReason,
      if (stage != null) 'Stage': stage.value,
      if (targetCloseDate != null) 'TargetCloseDate': targetCloseDate,
    };
  }
}

/// Read-only; shows the last 50 values and change dates for the
/// <code>NextSteps</code> field.
///
/// @nodoc
class NextStepsHistory {
  /// Indicates the step execution time.
  final DateTime time;

  /// Indicates the step's execution details.
  final String value;

  NextStepsHistory({
    required this.time,
    required this.value,
  });

  factory NextStepsHistory.fromJson(Map<String, dynamic> json) {
    return NextStepsHistory(
      time: nonNullableTimeStampFromJson(json['Time'] ?? 0),
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final time = this.time;
    final value = this.value;
    return {
      'Time': iso8601ToJson(time),
      'Value': value,
    };
  }
}

/// @nodoc
class RevenueModel {
  static const contract = RevenueModel._('Contract');
  static const payAsYouGo = RevenueModel._('Pay-as-you-go');
  static const subscription = RevenueModel._('Subscription');

  final String value;

  const RevenueModel._(this.value);

  static const values = [contract, payAsYouGo, subscription];

  static RevenueModel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RevenueModel._(value));

  @override
  bool operator ==(other) => other is RevenueModel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies payments details.
///
/// @nodoc
class MonetaryValue {
  /// Specifies the payment amount.
  final String amount;

  /// Specifies the payment currency. Accepted values are <code>USD</code> (US
  /// Dollars) and <code>EUR</code> (Euros). If the AWS Partition is
  /// <code>aws-eusc</code> (AWS European Sovereign Cloud), the currency code must
  /// be <code>EUR</code>.
  final CurrencyCode currencyCode;

  MonetaryValue({
    required this.amount,
    required this.currencyCode,
  });

  factory MonetaryValue.fromJson(Map<String, dynamic> json) {
    return MonetaryValue(
      amount: (json['Amount'] as String?) ?? '',
      currencyCode:
          CurrencyCode.fromString((json['CurrencyCode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final currencyCode = this.currencyCode;
    return {
      'Amount': amount,
      'CurrencyCode': currencyCode.value,
    };
  }
}

/// @nodoc
class MarketingSource {
  static const marketingActivity = MarketingSource._('Marketing Activity');
  static const none = MarketingSource._('None');

  final String value;

  const MarketingSource._(this.value);

  static const values = [marketingActivity, none];

  static MarketingSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MarketingSource._(value));

  @override
  bool operator ==(other) => other is MarketingSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AwsFundingUsed {
  static const yes = AwsFundingUsed._('Yes');
  static const no = AwsFundingUsed._('No');

  final String value;

  const AwsFundingUsed._(this.value);

  static const values = [yes, no];

  static AwsFundingUsed fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AwsFundingUsed._(value));

  @override
  bool operator ==(other) => other is AwsFundingUsed && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Channel {
  static const awsMarketingCentral = Channel._('AWS Marketing Central');
  static const contentSyndication = Channel._('Content Syndication');
  static const display = Channel._('Display');
  static const email = Channel._('Email');
  static const liveEvent = Channel._('Live Event');
  static const outOfHomeOoh = Channel._('Out Of Home (OOH)');
  static const print = Channel._('Print');
  static const search = Channel._('Search');
  static const social = Channel._('Social');
  static const telemarketing = Channel._('Telemarketing');
  static const tv = Channel._('TV');
  static const video = Channel._('Video');
  static const virtualEvent = Channel._('Virtual Event');

  final String value;

  const Channel._(this.value);

  static const values = [
    awsMarketingCentral,
    contentSyndication,
    display,
    email,
    liveEvent,
    outOfHomeOoh,
    print,
    search,
    social,
    telemarketing,
    tv,
    video,
    virtualEvent
  ];

  static Channel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Channel._(value));

  @override
  bool operator ==(other) => other is Channel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CompetitorName {
  static const oracleCloud = CompetitorName._('Oracle Cloud');
  static const onPrem = CompetitorName._('On-Prem');
  static const coLocation = CompetitorName._('Co-location');
  static const akamai = CompetitorName._('Akamai');
  static const aliCloud = CompetitorName._('AliCloud');
  static const googleCloudPlatform = CompetitorName._('Google Cloud Platform');
  static const ibmSoftlayer = CompetitorName._('IBM Softlayer');
  static const microsoftAzure = CompetitorName._('Microsoft Azure');
  static const otherCostOptimization =
      CompetitorName._('Other- Cost Optimization');
  static const noCompetition = CompetitorName._('No Competition');
  static const other = CompetitorName._('*Other');

  final String value;

  const CompetitorName._(this.value);

  static const values = [
    oracleCloud,
    onPrem,
    coLocation,
    akamai,
    aliCloud,
    googleCloudPlatform,
    ibmSoftlayer,
    microsoftAzure,
    otherCostOptimization,
    noCompetition,
    other
  ];

  static CompetitorName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CompetitorName._(value));

  @override
  bool operator ==(other) => other is CompetitorName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a summarized view of the Engagement Invitation, including details
/// like the identifier, status, and sender. This summary helps partners track
/// and manage AWS originated opportunities.
///
/// @nodoc
class EngagementInvitationSummary {
  /// Specifies the catalog in which the Engagement Invitation resides. This can
  /// be either the <code>AWS</code> or <code>Sandbox</code> catalog, indicating
  /// whether the opportunity is live or being tested.
  final String catalog;

  /// Represents the unique identifier of the Engagement Invitation. This
  /// identifier is used to track the invitation and to manage responses like
  /// acceptance or rejection.
  final String id;

  /// The Amazon Resource Name (ARN) of the Engagement Invitation. The ARN is a
  /// unique identifier that allows partners to reference the invitation in their
  /// system and manage its lifecycle.
  final String? arn;

  /// The identifier of the Engagement associated with this invitation. This links
  /// the invitation to its parent Engagement.
  final String? engagementId;

  /// Provides a short title or description of the Engagement Invitation. This
  /// title helps partners quickly identify and differentiate between multiple
  /// engagement opportunities.
  final String? engagementTitle;

  /// Indicates the date and time when the Engagement Invitation will expire.
  /// After this date, the invitation can no longer be accepted, and the
  /// opportunity will be unavailable to the partner.
  final DateTime? expirationDate;

  /// Indicates the date when the Engagement Invitation was sent to the partner.
  /// This provides context for when the opportunity was shared and helps in
  /// tracking the timeline for engagement.
  final DateTime? invitationDate;

  /// Identifies the role of the caller in the engagement invitation.
  final ParticipantType? participantType;

  /// Describes the type of payload associated with the Engagement Invitation,
  /// such as <code>Opportunity</code> or <code>MarketplaceOffer</code>. This
  /// helps partners understand the nature of the engagement request from AWS.
  final EngagementInvitationPayloadType? payloadType;

  /// Specifies the partner company or individual that received the Engagement
  /// Invitation. This field is important for tracking who the invitation was sent
  /// to within the partner organization.
  final Receiver? receiver;

  /// Specifies the AWS account ID of the sender who initiated the Engagement
  /// Invitation. This allows the partner to identify the AWS entity or
  /// representative responsible for sharing the opportunity.
  final String? senderAwsAccountId;

  /// Indicates the name of the company or AWS division that sent the Engagement
  /// Invitation. This information is useful for partners to know which part of
  /// AWS is requesting engagement.
  final String? senderCompanyName;

  /// Represents the current status of the Engagement Invitation, such as
  /// <code>Pending</code>, <code>Accepted</code>, or <code>Rejected</code>. The
  /// status helps track the progress and response to the invitation.
  final InvitationStatus? status;

  EngagementInvitationSummary({
    required this.catalog,
    required this.id,
    this.arn,
    this.engagementId,
    this.engagementTitle,
    this.expirationDate,
    this.invitationDate,
    this.participantType,
    this.payloadType,
    this.receiver,
    this.senderAwsAccountId,
    this.senderCompanyName,
    this.status,
  });

  factory EngagementInvitationSummary.fromJson(Map<String, dynamic> json) {
    return EngagementInvitationSummary(
      catalog: (json['Catalog'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      arn: json['Arn'] as String?,
      engagementId: json['EngagementId'] as String?,
      engagementTitle: json['EngagementTitle'] as String?,
      expirationDate: timeStampFromJson(json['ExpirationDate']),
      invitationDate: timeStampFromJson(json['InvitationDate']),
      participantType:
          (json['ParticipantType'] as String?)?.let(ParticipantType.fromString),
      payloadType: (json['PayloadType'] as String?)
          ?.let(EngagementInvitationPayloadType.fromString),
      receiver: json['Receiver'] != null
          ? Receiver.fromJson(json['Receiver'] as Map<String, dynamic>)
          : null,
      senderAwsAccountId: json['SenderAwsAccountId'] as String?,
      senderCompanyName: json['SenderCompanyName'] as String?,
      status: (json['Status'] as String?)?.let(InvitationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final id = this.id;
    final arn = this.arn;
    final engagementId = this.engagementId;
    final engagementTitle = this.engagementTitle;
    final expirationDate = this.expirationDate;
    final invitationDate = this.invitationDate;
    final participantType = this.participantType;
    final payloadType = this.payloadType;
    final receiver = this.receiver;
    final senderAwsAccountId = this.senderAwsAccountId;
    final senderCompanyName = this.senderCompanyName;
    final status = this.status;
    return {
      'Catalog': catalog,
      'Id': id,
      if (arn != null) 'Arn': arn,
      if (engagementId != null) 'EngagementId': engagementId,
      if (engagementTitle != null) 'EngagementTitle': engagementTitle,
      if (expirationDate != null)
        'ExpirationDate': iso8601ToJson(expirationDate),
      if (invitationDate != null)
        'InvitationDate': iso8601ToJson(invitationDate),
      if (participantType != null) 'ParticipantType': participantType.value,
      if (payloadType != null) 'PayloadType': payloadType.value,
      if (receiver != null) 'Receiver': receiver,
      if (senderAwsAccountId != null) 'SenderAwsAccountId': senderAwsAccountId,
      if (senderCompanyName != null) 'SenderCompanyName': senderCompanyName,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class EngagementInvitationPayloadType {
  static const opportunityInvitation =
      EngagementInvitationPayloadType._('OpportunityInvitation');
  static const leadInvitation =
      EngagementInvitationPayloadType._('LeadInvitation');

  final String value;

  const EngagementInvitationPayloadType._(this.value);

  static const values = [opportunityInvitation, leadInvitation];

  static EngagementInvitationPayloadType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EngagementInvitationPayloadType._(value));

  @override
  bool operator ==(other) =>
      other is EngagementInvitationPayloadType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InvitationStatus {
  static const accepted = InvitationStatus._('ACCEPTED');
  static const pending = InvitationStatus._('PENDING');
  static const rejected = InvitationStatus._('REJECTED');
  static const expired = InvitationStatus._('EXPIRED');

  final String value;

  const InvitationStatus._(this.value);

  static const values = [accepted, pending, rejected, expired];

  static InvitationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InvitationStatus._(value));

  @override
  bool operator ==(other) => other is InvitationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the entity that received the Engagement Invitation, including
/// account and company details. This field is essential for tracking the
/// partner who is being invited to collaborate.
///
/// @nodoc
class Receiver {
  /// Specifies the AWS account of the partner who received the Engagement
  /// Invitation. This field is used to track the invitation recipient within the
  /// AWS ecosystem.
  final AccountReceiver? account;

  Receiver({
    this.account,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      account: json['Account'] != null
          ? AccountReceiver.fromJson(json['Account'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    return {
      if (account != null) 'Account': account,
    };
  }
}

/// @nodoc
class ParticipantType {
  static const sender = ParticipantType._('SENDER');
  static const receiver = ParticipantType._('RECEIVER');

  final String value;

  const ParticipantType._(this.value);

  static const values = [sender, receiver];

  static ParticipantType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParticipantType._(value));

  @override
  bool operator ==(other) => other is ParticipantType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the account details of the partner who received the Engagement
/// Invitation, including the AWS account ID and company name.
///
/// @nodoc
class AccountReceiver {
  /// Indicates the AWS account ID of the partner who received the Engagement
  /// Invitation. This is a unique identifier for managing engagements with
  /// specific AWS accounts.
  final String awsAccountId;

  /// Represents the alias of the partner account receiving the Engagement
  /// Invitation, making it easier to identify and track the recipient in reports
  /// or logs.
  final String? alias;

  AccountReceiver({
    required this.awsAccountId,
    this.alias,
  });

  factory AccountReceiver.fromJson(Map<String, dynamic> json) {
    return AccountReceiver(
      awsAccountId: (json['AwsAccountId'] as String?) ?? '',
      alias: json['Alias'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final alias = this.alias;
    return {
      'AwsAccountId': awsAccountId,
      if (alias != null) 'Alias': alias,
    };
  }
}

/// Defines sorting options for retrieving Engagement Invitations. Sorting can
/// be done based on various criteria like the invitation date or status.
///
/// @nodoc
class OpportunityEngagementInvitationSort {
  /// Specifies the field by which the Engagement Invitations are sorted. Common
  /// values include <code>InvitationDate</code> and <code>Status</code>.
  final OpportunityEngagementInvitationSortName sortBy;

  /// Defines the order in which the Engagement Invitations are sorted. The values
  /// can be <code>ASC</code> (ascending) or <code>DESC</code> (descending).
  final SortOrder sortOrder;

  OpportunityEngagementInvitationSort({
    required this.sortBy,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      'SortBy': sortBy.value,
      'SortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class OpportunityEngagementInvitationSortName {
  static const invitationDate =
      OpportunityEngagementInvitationSortName._('InvitationDate');

  final String value;

  const OpportunityEngagementInvitationSortName._(this.value);

  static const values = [invitationDate];

  static OpportunityEngagementInvitationSortName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OpportunityEngagementInvitationSortName._(value));

  @override
  bool operator ==(other) =>
      other is OpportunityEngagementInvitationSortName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the data payload associated with the Engagement Invitation. This
/// payload includes essential details related to the AWS opportunity and is
/// used by partners to evaluate whether to accept or reject the engagement.
///
/// @nodoc
class Payload {
  /// Specifies the details of the lead invitation within the Engagement
  /// Invitation payload. This data helps partners understand the lead context,
  /// customer information, and interaction history for the lead opportunity from
  /// AWS.
  final LeadInvitationPayload? leadInvitation;

  /// Specifies the details of the opportunity invitation within the Engagement
  /// Invitation payload. This data helps partners understand the context, scope,
  /// and expected involvement for the opportunity from AWS.
  final OpportunityInvitationPayload? opportunityInvitation;

  Payload({
    this.leadInvitation,
    this.opportunityInvitation,
  });

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
      leadInvitation: json['LeadInvitation'] != null
          ? LeadInvitationPayload.fromJson(
              json['LeadInvitation'] as Map<String, dynamic>)
          : null,
      opportunityInvitation: json['OpportunityInvitation'] != null
          ? OpportunityInvitationPayload.fromJson(
              json['OpportunityInvitation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final leadInvitation = this.leadInvitation;
    final opportunityInvitation = this.opportunityInvitation;
    return {
      if (leadInvitation != null) 'LeadInvitation': leadInvitation,
      if (opportunityInvitation != null)
        'OpportunityInvitation': opportunityInvitation,
    };
  }
}

/// The EngagementMemberSummary provides a snapshot of essential information
/// about participants in an AWS Partner Central Engagement. This compact data
/// structure encapsulates key details of each member, facilitating efficient
/// collaboration and management within the Engagement.
///
/// @nodoc
class EngagementMemberSummary {
  /// The official name of the member's company or organization.
  final String? companyName;

  /// The URL of the member company's website. This offers a way to find more
  /// information about the member organization and serves as an additional
  /// identifier.
  final String? websiteUrl;

  EngagementMemberSummary({
    this.companyName,
    this.websiteUrl,
  });

  factory EngagementMemberSummary.fromJson(Map<String, dynamic> json) {
    return EngagementMemberSummary(
      companyName: json['CompanyName'] as String?,
      websiteUrl: json['WebsiteUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final companyName = this.companyName;
    final websiteUrl = this.websiteUrl;
    return {
      if (companyName != null) 'CompanyName': companyName,
      if (websiteUrl != null) 'WebsiteUrl': websiteUrl,
    };
  }
}

/// Represents the data payload of an Engagement Invitation for a specific
/// opportunity. This contains detailed information that partners use to
/// evaluate the engagement.
///
/// @nodoc
class OpportunityInvitationPayload {
  /// Contains information about the customer related to the opportunity in the
  /// Engagement Invitation. This data helps partners understand the customer’s
  /// profile and requirements.
  final EngagementCustomer customer;

  /// Describes the project details associated with the opportunity, including the
  /// customer’s needs and the scope of work expected to be performed.
  final ProjectDetails project;

  /// Outlines the responsibilities or expectations of the receiver in the context
  /// of the invitation.
  final List<ReceiverResponsibility> receiverResponsibilities;

  /// Represents the contact details of the AWS representatives involved in
  /// sending the Engagement Invitation. These contacts are opportunity
  /// stakeholders.
  final List<SenderContact>? senderContacts;

  OpportunityInvitationPayload({
    required this.customer,
    required this.project,
    required this.receiverResponsibilities,
    this.senderContacts,
  });

  factory OpportunityInvitationPayload.fromJson(Map<String, dynamic> json) {
    return OpportunityInvitationPayload(
      customer: EngagementCustomer.fromJson(
          (json['Customer'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      project: ProjectDetails.fromJson(
          (json['Project'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      receiverResponsibilities:
          ((json['ReceiverResponsibilities'] as List?) ?? const [])
              .nonNulls
              .map((e) => ReceiverResponsibility.fromString((e as String)))
              .toList(),
      senderContacts: (json['SenderContacts'] as List?)
          ?.nonNulls
          .map((e) => SenderContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customer = this.customer;
    final project = this.project;
    final receiverResponsibilities = this.receiverResponsibilities;
    final senderContacts = this.senderContacts;
    return {
      'Customer': customer,
      'Project': project,
      'ReceiverResponsibilities':
          receiverResponsibilities.map((e) => e.value).toList(),
      if (senderContacts != null) 'SenderContacts': senderContacts,
    };
  }
}

/// Represents the data payload of an engagement invitation for a lead
/// opportunity. This contains detailed information about the customer and
/// interaction history that partners use to evaluate whether to accept the lead
/// engagement invitation.
///
/// @nodoc
class LeadInvitationPayload {
  /// Contains information about the customer associated with the lead invitation.
  /// This data helps partners understand the customer's profile, industry, and
  /// business context to assess the lead opportunity.
  final LeadInvitationCustomer customer;

  /// Describes the interaction details associated with the lead, including the
  /// source of the lead generation and customer engagement information. This
  /// context helps partners evaluate the lead quality and engagement approach.
  final LeadInvitationInteraction interaction;

  LeadInvitationPayload({
    required this.customer,
    required this.interaction,
  });

  factory LeadInvitationPayload.fromJson(Map<String, dynamic> json) {
    return LeadInvitationPayload(
      customer: LeadInvitationCustomer.fromJson(
          (json['Customer'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      interaction: LeadInvitationInteraction.fromJson(
          (json['Interaction'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final customer = this.customer;
    final interaction = this.interaction;
    return {
      'Customer': customer,
      'Interaction': interaction,
    };
  }
}

/// Contains customer information included in a lead invitation payload. This
/// structure provides essential details about the customer to help partners
/// evaluate the lead opportunity and determine their interest in engagement.
///
/// @nodoc
class LeadInvitationCustomer {
  /// The name of the customer company associated with the lead invitation. This
  /// field identifies the target organization for the lead engagement
  /// opportunity.
  final String companyName;

  /// The country code indicating the geographic location of the customer company.
  /// This information helps partners understand regional requirements and assess
  /// their ability to serve the customer effectively.
  final CountryCode countryCode;

  /// Indicates the customer's level of experience and adoption with AWS services.
  /// This assessment helps partners understand the customer's cloud maturity and
  /// tailor their engagement approach accordingly.
  final String? awsMaturity;

  /// Specifies the industry sector of the customer company associated with the
  /// lead invitation. This categorization helps partners understand the
  /// customer's business context and assess solution fit.
  final Industry? industry;

  /// Specifies the market segment classification of the customer, such as
  /// enterprise, mid-market, or small business. This segmentation helps partners
  /// determine the appropriate solution complexity and engagement strategy.
  final MarketSegment? marketSegment;

  /// The website URL of the customer company. This provides additional context
  /// about the customer organization and helps partners verify company details
  /// and assess business size and legitimacy.
  final String? websiteUrl;

  LeadInvitationCustomer({
    required this.companyName,
    required this.countryCode,
    this.awsMaturity,
    this.industry,
    this.marketSegment,
    this.websiteUrl,
  });

  factory LeadInvitationCustomer.fromJson(Map<String, dynamic> json) {
    return LeadInvitationCustomer(
      companyName: (json['CompanyName'] as String?) ?? '',
      countryCode:
          CountryCode.fromString((json['CountryCode'] as String?) ?? ''),
      awsMaturity: json['AwsMaturity'] as String?,
      industry: (json['Industry'] as String?)?.let(Industry.fromString),
      marketSegment:
          (json['MarketSegment'] as String?)?.let(MarketSegment.fromString),
      websiteUrl: json['WebsiteUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final companyName = this.companyName;
    final countryCode = this.countryCode;
    final awsMaturity = this.awsMaturity;
    final industry = this.industry;
    final marketSegment = this.marketSegment;
    final websiteUrl = this.websiteUrl;
    return {
      'CompanyName': companyName,
      'CountryCode': countryCode.value,
      if (awsMaturity != null) 'AwsMaturity': awsMaturity,
      if (industry != null) 'Industry': industry.value,
      if (marketSegment != null) 'MarketSegment': marketSegment.value,
      if (websiteUrl != null) 'WebsiteUrl': websiteUrl,
    };
  }
}

/// Represents interaction details included in a lead invitation payload. This
/// structure provides context about how the lead was generated and the
/// customer's engagement history to help partners assess the opportunity
/// quality.
///
/// @nodoc
class LeadInvitationInteraction {
  /// The business title or job role of the customer contact involved in the lead
  /// interaction. This helps partners identify the decision-making level and
  /// engagement approach for the lead.
  final String contactBusinessTitle;

  /// The unique identifier of the specific source that generated the lead
  /// interaction. This provides traceability to the original lead generation
  /// activity for reference and follow-up purposes.
  final String sourceId;

  /// The descriptive name of the source that generated the lead interaction. This
  /// human-readable identifier helps partners understand the specific lead
  /// generation channel or campaign that created the opportunity.
  final String sourceName;

  /// Specifies the type of source that generated the lead interaction, such as
  /// "Event", "Website", or "Campaign". This helps partners understand the lead
  /// generation channel and assess lead quality based on the source type.
  final String sourceType;

  /// Describes the specific use case or business scenario associated with the
  /// lead interaction. This information helps partners understand the customer's
  /// interests and potential solution requirements.
  final String? usecase;

  LeadInvitationInteraction({
    required this.contactBusinessTitle,
    required this.sourceId,
    required this.sourceName,
    required this.sourceType,
    this.usecase,
  });

  factory LeadInvitationInteraction.fromJson(Map<String, dynamic> json) {
    return LeadInvitationInteraction(
      contactBusinessTitle: (json['ContactBusinessTitle'] as String?) ?? '',
      sourceId: (json['SourceId'] as String?) ?? '',
      sourceName: (json['SourceName'] as String?) ?? '',
      sourceType: (json['SourceType'] as String?) ?? '',
      usecase: json['Usecase'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactBusinessTitle = this.contactBusinessTitle;
    final sourceId = this.sourceId;
    final sourceName = this.sourceName;
    final sourceType = this.sourceType;
    final usecase = this.usecase;
    return {
      'ContactBusinessTitle': contactBusinessTitle,
      'SourceId': sourceId,
      'SourceName': sourceName,
      'SourceType': sourceType,
      if (usecase != null) 'Usecase': usecase,
    };
  }
}

/// @nodoc
class MarketSegment {
  static const enterprise = MarketSegment._('Enterprise');
  static const large = MarketSegment._('Large');
  static const medium = MarketSegment._('Medium');
  static const small = MarketSegment._('Small');
  static const micro = MarketSegment._('Micro');

  final String value;

  const MarketSegment._(this.value);

  static const values = [enterprise, large, medium, small, micro];

  static MarketSegment fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MarketSegment._(value));

  @override
  bool operator ==(other) => other is MarketSegment && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about the customer associated with the Engagement
/// Invitation, including company information and industry.
///
/// @nodoc
class EngagementCustomer {
  /// Represents the name of the customer’s company associated with the Engagement
  /// Invitation. This field is used to identify the customer.
  final String companyName;

  /// Indicates the country in which the customer’s company operates. This field
  /// is useful for understanding regional requirements or compliance needs.
  final CountryCode countryCode;

  /// Specifies the industry to which the customer’s company belongs. This field
  /// helps categorize the opportunity based on the customer’s business sector.
  final Industry industry;

  /// Provides the website URL of the customer’s company. This field helps
  /// partners verify the legitimacy and size of the customer organization.
  final String websiteUrl;

  EngagementCustomer({
    required this.companyName,
    required this.countryCode,
    required this.industry,
    required this.websiteUrl,
  });

  factory EngagementCustomer.fromJson(Map<String, dynamic> json) {
    return EngagementCustomer(
      companyName: (json['CompanyName'] as String?) ?? '',
      countryCode:
          CountryCode.fromString((json['CountryCode'] as String?) ?? ''),
      industry: Industry.fromString((json['Industry'] as String?) ?? ''),
      websiteUrl: (json['WebsiteUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final companyName = this.companyName;
    final countryCode = this.countryCode;
    final industry = this.industry;
    final websiteUrl = this.websiteUrl;
    return {
      'CompanyName': companyName,
      'CountryCode': countryCode.value,
      'Industry': industry.value,
      'WebsiteUrl': websiteUrl,
    };
  }
}

/// Contains details about the project associated with the Engagement
/// Invitation, including the business problem and expected outcomes.
///
/// @nodoc
class ProjectDetails {
  /// Describes the business problem that the project aims to solve. This
  /// information is crucial for understanding the project’s goals and objectives.
  final String businessProblem;

  /// Contains revenue estimates for the partner related to the project. This
  /// field provides an idea of the financial potential of the opportunity for the
  /// partner.
  final List<ExpectedCustomerSpend> expectedCustomerSpend;

  /// Specifies the estimated date of project completion. This field helps track
  /// the project timeline and manage expectations.
  final String targetCompletionDate;

  /// Specifies the title of the project. This title helps partners quickly
  /// identify and understand the focus of the project.
  final String title;

  ProjectDetails({
    required this.businessProblem,
    required this.expectedCustomerSpend,
    required this.targetCompletionDate,
    required this.title,
  });

  factory ProjectDetails.fromJson(Map<String, dynamic> json) {
    return ProjectDetails(
      businessProblem: (json['BusinessProblem'] as String?) ?? '',
      expectedCustomerSpend: ((json['ExpectedCustomerSpend'] as List?) ??
              const [])
          .nonNulls
          .map((e) => ExpectedCustomerSpend.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetCompletionDate: (json['TargetCompletionDate'] as String?) ?? '',
      title: (json['Title'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final businessProblem = this.businessProblem;
    final expectedCustomerSpend = this.expectedCustomerSpend;
    final targetCompletionDate = this.targetCompletionDate;
    final title = this.title;
    return {
      'BusinessProblem': businessProblem,
      'ExpectedCustomerSpend': expectedCustomerSpend,
      'TargetCompletionDate': targetCompletionDate,
      'Title': title,
    };
  }
}

/// @nodoc
class ReceiverResponsibility {
  static const distributor = ReceiverResponsibility._('Distributor');
  static const reseller = ReceiverResponsibility._('Reseller');
  static const hardwarePartner = ReceiverResponsibility._('Hardware Partner');
  static const managedServiceProvider =
      ReceiverResponsibility._('Managed Service Provider');
  static const softwarePartner = ReceiverResponsibility._('Software Partner');
  static const servicesPartner = ReceiverResponsibility._('Services Partner');
  static const trainingPartner = ReceiverResponsibility._('Training Partner');
  static const coSellFacilitator =
      ReceiverResponsibility._('Co-Sell Facilitator');
  static const facilitator = ReceiverResponsibility._('Facilitator');

  final String value;

  const ReceiverResponsibility._(this.value);

  static const values = [
    distributor,
    reseller,
    hardwarePartner,
    managedServiceProvider,
    softwarePartner,
    servicesPartner,
    trainingPartner,
    coSellFacilitator,
    facilitator
  ];

  static ReceiverResponsibility fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReceiverResponsibility._(value));

  @override
  bool operator ==(other) =>
      other is ReceiverResponsibility && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that contains the details of the sender-provided contact person
/// for the <code>EngagementInvitation</code>.
///
/// @nodoc
class SenderContact {
  /// The sender-provided contact's email address associated with the
  /// <code>EngagementInvitation</code>.
  final String email;

  /// The sender-provided contact's title (job title or role) associated with the
  /// <code>EngagementInvitation</code>.
  final String? businessTitle;

  /// The sender-provided contact's last name associated with the
  /// <code>EngagementInvitation</code>.
  final String? firstName;

  /// The sender-provided contact's first name associated with the
  /// <code>EngagementInvitation</code>.
  final String? lastName;

  /// The sender-provided contact's phone number associated with the
  /// <code>EngagementInvitation</code>.
  final String? phone;

  SenderContact({
    required this.email,
    this.businessTitle,
    this.firstName,
    this.lastName,
    this.phone,
  });

  factory SenderContact.fromJson(Map<String, dynamic> json) {
    return SenderContact(
      email: (json['Email'] as String?) ?? '',
      businessTitle: json['BusinessTitle'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      phone: json['Phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final businessTitle = this.businessTitle;
    final firstName = this.firstName;
    final lastName = this.lastName;
    final phone = this.phone;
    return {
      'Email': email,
      if (businessTitle != null) 'BusinessTitle': businessTitle,
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
      if (phone != null) 'Phone': phone,
    };
  }
}

/// The Invitation structure represents an invitation exchanged between partners
/// and AWS. It includes a message, receiver information, and a payload
/// providing context for the invitation.
///
/// @nodoc
class Invitation {
  /// A message accompanying the invitation.
  final String message;
  final Payload payload;
  final Receiver receiver;

  Invitation({
    required this.message,
    required this.payload,
    required this.receiver,
  });

  Map<String, dynamic> toJson() {
    final message = this.message;
    final payload = this.payload;
    final receiver = this.receiver;
    return {
      'Message': message,
      'Payload': payload,
      'Receiver': receiver,
    };
  }
}

/// Provides a summary of a task related to creating an engagement from an
/// opportunity. This structure contains key information about the task's
/// status, associated identifiers, and any failure details.
///
/// @nodoc
class ListEngagementFromOpportunityTaskSummary {
  /// The unique identifier of the engagement created as a result of the task.
  /// This field is populated when the task is completed successfully.
  final String? engagementId;

  /// The unique identifier of the Engagement Invitation.
  final String? engagementInvitationId;

  /// A detailed message providing additional information about the task,
  /// especially useful in case of failures. This field may contain error details
  /// or other relevant information about the task's execution
  final String? message;

  /// The unique identifier of the original Opportunity from which the Engagement
  /// is being created. This field helps track the source of the Engagement
  /// creation task.
  final String? opportunityId;

  /// A code indicating the specific reason for a task failure. This field is
  /// populated when the task status is FAILED and provides a categorized reason
  /// for the failure.
  final ReasonCode? reasonCode;

  /// The identifier of the resource snapshot job associated with this task, if a
  /// snapshot was created as part of the Engagement creation process.
  final String? resourceSnapshotJobId;

  /// The timestamp indicating when the task was initiated, in RFC 3339 5.6
  /// date-time format.
  final DateTime? startTime;

  /// The Amazon Resource Name (ARN) uniquely identifying this task within AWS.
  /// This ARN can be used for referencing the task in other AWS services or APIs.
  final String? taskArn;

  /// A unique identifier for a specific task.
  final String? taskId;

  /// The current status of the task.
  final TaskStatus? taskStatus;

  ListEngagementFromOpportunityTaskSummary({
    this.engagementId,
    this.engagementInvitationId,
    this.message,
    this.opportunityId,
    this.reasonCode,
    this.resourceSnapshotJobId,
    this.startTime,
    this.taskArn,
    this.taskId,
    this.taskStatus,
  });

  factory ListEngagementFromOpportunityTaskSummary.fromJson(
      Map<String, dynamic> json) {
    return ListEngagementFromOpportunityTaskSummary(
      engagementId: json['EngagementId'] as String?,
      engagementInvitationId: json['EngagementInvitationId'] as String?,
      message: json['Message'] as String?,
      opportunityId: json['OpportunityId'] as String?,
      reasonCode: (json['ReasonCode'] as String?)?.let(ReasonCode.fromString),
      resourceSnapshotJobId: json['ResourceSnapshotJobId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      taskArn: json['TaskArn'] as String?,
      taskId: json['TaskId'] as String?,
      taskStatus: (json['TaskStatus'] as String?)?.let(TaskStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final engagementId = this.engagementId;
    final engagementInvitationId = this.engagementInvitationId;
    final message = this.message;
    final opportunityId = this.opportunityId;
    final reasonCode = this.reasonCode;
    final resourceSnapshotJobId = this.resourceSnapshotJobId;
    final startTime = this.startTime;
    final taskArn = this.taskArn;
    final taskId = this.taskId;
    final taskStatus = this.taskStatus;
    return {
      if (engagementId != null) 'EngagementId': engagementId,
      if (engagementInvitationId != null)
        'EngagementInvitationId': engagementInvitationId,
      if (message != null) 'Message': message,
      if (opportunityId != null) 'OpportunityId': opportunityId,
      if (reasonCode != null) 'ReasonCode': reasonCode.value,
      if (resourceSnapshotJobId != null)
        'ResourceSnapshotJobId': resourceSnapshotJobId,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskId != null) 'TaskId': taskId,
      if (taskStatus != null) 'TaskStatus': taskStatus.value,
    };
  }
}

/// Indicates the level of AWS involvement in the opportunity. This field helps
/// track AWS participation throughout the engagement, such as providing
/// technical support, deal assistance, and sales support.
///
/// @nodoc
class AwsSubmission {
  /// Specifies the type of AWS involvement in the opportunity, such as coselling,
  /// deal support, or technical consultation. This helps categorize the nature of
  /// AWS participation.
  final SalesInvolvementType involvementType;

  /// Determines who can view AWS involvement in the opportunity. Typically, this
  /// field is set to <code>Full</code> for most cases, but it may be restricted
  /// based on special program requirements or confidentiality needs.
  final Visibility? visibility;

  AwsSubmission({
    required this.involvementType,
    this.visibility,
  });

  Map<String, dynamic> toJson() {
    final involvementType = this.involvementType;
    final visibility = this.visibility;
    return {
      'InvolvementType': involvementType.value,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

/// Specifies a subset of fields associated with tasks related to accepting an
/// engagement invitation.
///
/// @nodoc
class ListEngagementByAcceptingInvitationTaskSummary {
  /// The unique identifier of the engagement invitation that was accepted.
  final String? engagementInvitationId;

  /// Detailed message describing the failure and possible recovery steps.
  final String? message;

  /// Unique identifier of opportunity that was created.
  final String? opportunityId;

  /// A code pointing to the specific reason for the failure.
  final ReasonCode? reasonCode;

  /// Unique identifier of the resource snapshot job that was created.
  final String? resourceSnapshotJobId;

  /// Task start timestamp.
  final DateTime? startTime;

  /// The Amazon Resource Name (ARN) that uniquely identifies the task.
  final String? taskArn;

  /// Unique identifier of the task.
  final String? taskId;

  /// Status of the task.
  final TaskStatus? taskStatus;

  ListEngagementByAcceptingInvitationTaskSummary({
    this.engagementInvitationId,
    this.message,
    this.opportunityId,
    this.reasonCode,
    this.resourceSnapshotJobId,
    this.startTime,
    this.taskArn,
    this.taskId,
    this.taskStatus,
  });

  factory ListEngagementByAcceptingInvitationTaskSummary.fromJson(
      Map<String, dynamic> json) {
    return ListEngagementByAcceptingInvitationTaskSummary(
      engagementInvitationId: json['EngagementInvitationId'] as String?,
      message: json['Message'] as String?,
      opportunityId: json['OpportunityId'] as String?,
      reasonCode: (json['ReasonCode'] as String?)?.let(ReasonCode.fromString),
      resourceSnapshotJobId: json['ResourceSnapshotJobId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      taskArn: json['TaskArn'] as String?,
      taskId: json['TaskId'] as String?,
      taskStatus: (json['TaskStatus'] as String?)?.let(TaskStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final engagementInvitationId = this.engagementInvitationId;
    final message = this.message;
    final opportunityId = this.opportunityId;
    final reasonCode = this.reasonCode;
    final resourceSnapshotJobId = this.resourceSnapshotJobId;
    final startTime = this.startTime;
    final taskArn = this.taskArn;
    final taskId = this.taskId;
    final taskStatus = this.taskStatus;
    return {
      if (engagementInvitationId != null)
        'EngagementInvitationId': engagementInvitationId,
      if (message != null) 'Message': message,
      if (opportunityId != null) 'OpportunityId': opportunityId,
      if (reasonCode != null) 'ReasonCode': reasonCode.value,
      if (resourceSnapshotJobId != null)
        'ResourceSnapshotJobId': resourceSnapshotJobId,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskId != null) 'TaskId': taskId,
      if (taskStatus != null) 'TaskStatus': taskStatus.value,
    };
  }
}

/// Engagement members are the participants in an Engagement, which is likely a
/// collaborative project or business opportunity within the AWS partner
/// network. Members can be different partner organizations or AWS accounts that
/// are working together on a specific engagement.
///
/// Each member is represented by their AWS Account ID, Company Name, and
/// associated details. Members have a status within the Engagement (PENDING,
/// ACCEPTED, REJECTED, or WITHDRAWN), indicating their current state of
/// participation. Only existing members of an Engagement can view the list of
/// other members. This implies a level of privacy and access control within the
/// Engagement structure.
///
/// @nodoc
class EngagementMember {
  /// This is the unique identifier for the AWS account associated with the member
  /// organization. It's used for AWS-related operations and identity
  /// verification.
  final String? accountId;

  /// The official name of the member's company or organization.
  final String? companyName;

  /// The URL of the member company's website. This offers a way to find more
  /// information about the member organization and serves as an additional
  /// identifier.
  final String? websiteUrl;

  EngagementMember({
    this.accountId,
    this.companyName,
    this.websiteUrl,
  });

  factory EngagementMember.fromJson(Map<String, dynamic> json) {
    return EngagementMember(
      accountId: json['AccountId'] as String?,
      companyName: json['CompanyName'] as String?,
      websiteUrl: json['WebsiteUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final companyName = this.companyName;
    final websiteUrl = this.websiteUrl;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (companyName != null) 'CompanyName': companyName,
      if (websiteUrl != null) 'WebsiteUrl': websiteUrl,
    };
  }
}

/// An object that contains an <code>Engagement</code>'s subset of fields.
///
/// @nodoc
class EngagementSummary {
  /// The Amazon Resource Name (ARN) of the created Engagement.
  final String? arn;

  /// An array of context types associated with the engagement, such as
  /// "CustomerProject" or "Lead". This provides a quick overview of the types of
  /// contexts included in the engagement.
  final List<EngagementContextType>? contextTypes;

  /// The date and time when the Engagement was created.
  final DateTime? createdAt;

  /// The AWS Account ID of the Engagement creator.
  final String? createdBy;

  /// The unique identifier for the Engagement.
  final String? id;

  /// The number of members in the Engagement.
  final int? memberCount;

  /// The timestamp indicating when the engagement was last modified, in ISO 8601
  /// format (UTC). Example: "2023-05-01T20:37:46Z".
  final DateTime? modifiedAt;

  /// The AWS account ID of the user who last modified the engagement. This field
  /// helps track who made the most recent changes to the engagement.
  final String? modifiedBy;

  /// The title of the Engagement.
  final String? title;

  EngagementSummary({
    this.arn,
    this.contextTypes,
    this.createdAt,
    this.createdBy,
    this.id,
    this.memberCount,
    this.modifiedAt,
    this.modifiedBy,
    this.title,
  });

  factory EngagementSummary.fromJson(Map<String, dynamic> json) {
    return EngagementSummary(
      arn: json['Arn'] as String?,
      contextTypes: (json['ContextTypes'] as List?)
          ?.nonNulls
          .map((e) => EngagementContextType.fromString((e as String)))
          .toList(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      createdBy: json['CreatedBy'] as String?,
      id: json['Id'] as String?,
      memberCount: json['MemberCount'] as int?,
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
      modifiedBy: json['ModifiedBy'] as String?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final contextTypes = this.contextTypes;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final id = this.id;
    final memberCount = this.memberCount;
    final modifiedAt = this.modifiedAt;
    final modifiedBy = this.modifiedBy;
    final title = this.title;
    return {
      if (arn != null) 'Arn': arn,
      if (contextTypes != null)
        'ContextTypes': contextTypes.map((e) => e.value).toList(),
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (id != null) 'Id': id,
      if (memberCount != null) 'MemberCount': memberCount,
      if (modifiedAt != null) 'ModifiedAt': iso8601ToJson(modifiedAt),
      if (modifiedBy != null) 'ModifiedBy': modifiedBy,
      if (title != null) 'Title': title,
    };
  }
}

/// @nodoc
class EngagementContextType {
  static const customerProject = EngagementContextType._('CustomerProject');
  static const lead = EngagementContextType._('Lead');

  final String value;

  const EngagementContextType._(this.value);

  static const values = [customerProject, lead];

  static EngagementContextType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EngagementContextType._(value));

  @override
  bool operator ==(other) =>
      other is EngagementContextType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the sorting parameters for listing Engagements.
///
/// @nodoc
class EngagementSort {
  /// The field by which to sort the results.
  final EngagementSortName sortBy;

  /// The order in which to sort the results.
  final SortOrder sortOrder;

  EngagementSort({
    required this.sortBy,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      'SortBy': sortBy.value,
      'SortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class EngagementSortName {
  static const createdDate = EngagementSortName._('CreatedDate');

  final String value;

  const EngagementSortName._(this.value);

  static const values = [createdDate];

  static EngagementSortName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EngagementSortName._(value));

  @override
  bool operator ==(other) =>
      other is EngagementSortName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides detailed context information for an Engagement. This structure
/// allows for specifying the type of context and its associated payload.
///
/// @nodoc
class EngagementContextDetails {
  /// Specifies the type of Engagement context. Valid values are "CustomerProject"
  /// or "Document", indicating whether the context relates to a customer project
  /// or a document respectively.
  final EngagementContextType type;

  /// The unique identifier of the engagement context. This ID is used to
  /// reference and manage the specific context within the engagement.
  final String? id;

  /// Contains the specific details of the Engagement context. The structure of
  /// this payload varies depending on the Type field.
  final EngagementContextPayload? payload;

  EngagementContextDetails({
    required this.type,
    this.id,
    this.payload,
  });

  factory EngagementContextDetails.fromJson(Map<String, dynamic> json) {
    return EngagementContextDetails(
      type: EngagementContextType.fromString((json['Type'] as String?) ?? ''),
      id: json['Id'] as String?,
      payload: json['Payload'] != null
          ? EngagementContextPayload.fromJson(
              json['Payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final id = this.id;
    final payload = this.payload;
    return {
      'Type': type.value,
      if (id != null) 'Id': id,
      if (payload != null) 'Payload': payload,
    };
  }
}

/// Represents the payload of an Engagement context. The structure of this
/// payload varies based on the context type specified in the
/// EngagementContextDetails.
///
/// @nodoc
class EngagementContextPayload {
  /// Contains detailed information about a customer project when the context type
  /// is "CustomerProject". This field is present only when the Type in
  /// EngagementContextDetails is set to "CustomerProject".
  final CustomerProjectsContext? customerProject;

  /// Contains detailed information about a lead when the context type is "Lead".
  /// This field is present only when the Type in EngagementContextDetails is set
  /// to "Lead".
  final LeadContext? lead;

  EngagementContextPayload({
    this.customerProject,
    this.lead,
  });

  factory EngagementContextPayload.fromJson(Map<String, dynamic> json) {
    return EngagementContextPayload(
      customerProject: json['CustomerProject'] != null
          ? CustomerProjectsContext.fromJson(
              json['CustomerProject'] as Map<String, dynamic>)
          : null,
      lead: json['Lead'] != null
          ? LeadContext.fromJson(json['Lead'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerProject = this.customerProject;
    final lead = this.lead;
    return {
      if (customerProject != null) 'CustomerProject': customerProject,
      if (lead != null) 'Lead': lead,
    };
  }
}

/// The CustomerProjects structure in Engagements offers a flexible framework
/// for managing customer-project relationships. It supports multiple customers
/// per Engagement and multiple projects per customer, while also allowing for
/// customers without projects and projects without specific customers.
///
/// All Engagement members have full visibility of customers and their
/// associated projects, enabling the capture of relevant context even when
/// project details are not fully defined. This structure also facilitates
/// targeted invitations, allowing partners to focus on specific customers and
/// their business problems when sending Engagement invitations.
///
/// @nodoc
class CustomerProjectsContext {
  final EngagementCustomer? customer;

  /// Information about the customer project associated with the Engagement.
  final EngagementCustomerProjectDetails? project;

  CustomerProjectsContext({
    this.customer,
    this.project,
  });

  factory CustomerProjectsContext.fromJson(Map<String, dynamic> json) {
    return CustomerProjectsContext(
      customer: json['Customer'] != null
          ? EngagementCustomer.fromJson(
              json['Customer'] as Map<String, dynamic>)
          : null,
      project: json['Project'] != null
          ? EngagementCustomerProjectDetails.fromJson(
              json['Project'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customer = this.customer;
    final project = this.project;
    return {
      if (customer != null) 'Customer': customer,
      if (project != null) 'Project': project,
    };
  }
}

/// Provides comprehensive details about a lead associated with an engagement.
/// This structure contains information about lead qualification status,
/// customer details, and interaction history to facilitate lead management and
/// tracking within the engagement.
///
/// @nodoc
class LeadContext {
  /// Contains detailed information about the customer associated with the lead,
  /// including company information, contact details, and other relevant customer
  /// data.
  final LeadCustomer customer;

  /// An array of interactions that have occurred with the lead, providing a
  /// history of communications, meetings, and other engagement activities related
  /// to the lead.
  final List<LeadInteraction> interactions;

  /// Indicates the current qualification status of the lead, such as whether it
  /// has been qualified, disqualified, or is still under evaluation. This helps
  /// track the lead's progression through the qualification process.
  final String? qualificationStatus;

  LeadContext({
    required this.customer,
    required this.interactions,
    this.qualificationStatus,
  });

  factory LeadContext.fromJson(Map<String, dynamic> json) {
    return LeadContext(
      customer: LeadCustomer.fromJson(
          (json['Customer'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      interactions: ((json['Interactions'] as List?) ?? const [])
          .nonNulls
          .map((e) => LeadInteraction.fromJson(e as Map<String, dynamic>))
          .toList(),
      qualificationStatus: json['QualificationStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customer = this.customer;
    final interactions = this.interactions;
    final qualificationStatus = this.qualificationStatus;
    return {
      'Customer': customer,
      'Interactions': interactions,
      if (qualificationStatus != null)
        'QualificationStatus': qualificationStatus,
    };
  }
}

/// Contains detailed information about the customer associated with the lead,
/// including company details, industry classification, and AWS maturity level.
/// This information helps qualify and categorize the lead for appropriate
/// engagement strategies.
///
/// @nodoc
class LeadCustomer {
  final AddressSummary address;

  /// The name of the lead customer's company. This field is essential for
  /// identifying and tracking the customer organization associated with the lead.
  final String companyName;

  /// Indicates the customer's level of experience and adoption with AWS services.
  /// This assessment helps determine the appropriate engagement approach and
  /// solution complexity.
  final String? awsMaturity;

  /// Specifies the industry sector to which the lead customer's company belongs.
  /// This categorization helps in understanding the customer's business context
  /// and tailoring appropriate solutions.
  final Industry? industry;

  /// Specifies the market segment classification of the lead customer, such as
  /// enterprise, mid-market, or small business. This segmentation helps in
  /// targeting appropriate solutions and engagement strategies.
  final MarketSegment? marketSegment;

  /// The website URL of the lead customer's company. This provides additional
  /// context about the customer organization and helps verify company legitimacy
  /// and size.
  final String? websiteUrl;

  LeadCustomer({
    required this.address,
    required this.companyName,
    this.awsMaturity,
    this.industry,
    this.marketSegment,
    this.websiteUrl,
  });

  factory LeadCustomer.fromJson(Map<String, dynamic> json) {
    return LeadCustomer(
      address: AddressSummary.fromJson(
          (json['Address'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      companyName: (json['CompanyName'] as String?) ?? '',
      awsMaturity: json['AwsMaturity'] as String?,
      industry: (json['Industry'] as String?)?.let(Industry.fromString),
      marketSegment:
          (json['MarketSegment'] as String?)?.let(MarketSegment.fromString),
      websiteUrl: json['WebsiteUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final companyName = this.companyName;
    final awsMaturity = this.awsMaturity;
    final industry = this.industry;
    final marketSegment = this.marketSegment;
    final websiteUrl = this.websiteUrl;
    return {
      'Address': address,
      'CompanyName': companyName,
      if (awsMaturity != null) 'AwsMaturity': awsMaturity,
      if (industry != null) 'Industry': industry.value,
      if (marketSegment != null) 'MarketSegment': marketSegment.value,
      if (websiteUrl != null) 'WebsiteUrl': websiteUrl,
    };
  }
}

/// Represents a specific interaction or touchpoint with a lead customer. This
/// structure captures details about communications, meetings, or other
/// engagement activities that help track the lead's progression and engagement
/// history.
///
/// @nodoc
class LeadInteraction {
  /// Contains contact information for the customer representative involved in the
  /// lead interaction, including their name, title, and contact details.
  final LeadContact contact;

  /// Describes the action taken by the customer during or as a result of the
  /// interaction, such as requesting information, scheduling a meeting, or
  /// expressing interest in a solution.
  final String customerAction;

  /// The unique identifier of the specific source that generated the lead
  /// interaction. This ID provides traceability back to the original lead
  /// generation activity.
  final String sourceId;

  /// The descriptive name of the source that generated the lead interaction,
  /// providing a human-readable identifier for the lead generation channel or
  /// activity.
  final String sourceName;

  /// Specifies the type of source that generated the lead interaction, such as
  /// "Event", "Website", "Referral", or "Campaign". This categorization helps
  /// track lead generation effectiveness across different channels.
  final String sourceType;

  /// Describes the business problem or challenge that the customer discussed
  /// during the interaction. This information helps qualify the lead and identify
  /// appropriate solutions.
  final String? businessProblem;

  /// The date and time when the lead interaction occurred, in ISO 8601 format
  /// (UTC). This timestamp helps track the chronology of lead engagement
  /// activities.
  final DateTime? interactionDate;

  /// Describes the specific use case or business scenario discussed during the
  /// lead interaction. This helps categorize the customer's interests and
  /// potential solutions.
  final String? usecase;

  LeadInteraction({
    required this.contact,
    required this.customerAction,
    required this.sourceId,
    required this.sourceName,
    required this.sourceType,
    this.businessProblem,
    this.interactionDate,
    this.usecase,
  });

  factory LeadInteraction.fromJson(Map<String, dynamic> json) {
    return LeadInteraction(
      contact: LeadContact.fromJson(
          (json['Contact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      customerAction: (json['CustomerAction'] as String?) ?? '',
      sourceId: (json['SourceId'] as String?) ?? '',
      sourceName: (json['SourceName'] as String?) ?? '',
      sourceType: (json['SourceType'] as String?) ?? '',
      businessProblem: json['BusinessProblem'] as String?,
      interactionDate: timeStampFromJson(json['InteractionDate']),
      usecase: json['Usecase'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contact = this.contact;
    final customerAction = this.customerAction;
    final sourceId = this.sourceId;
    final sourceName = this.sourceName;
    final sourceType = this.sourceType;
    final businessProblem = this.businessProblem;
    final interactionDate = this.interactionDate;
    final usecase = this.usecase;
    return {
      'Contact': contact,
      'CustomerAction': customerAction,
      'SourceId': sourceId,
      'SourceName': sourceName,
      'SourceType': sourceType,
      if (businessProblem != null) 'BusinessProblem': businessProblem,
      if (interactionDate != null)
        'InteractionDate': iso8601ToJson(interactionDate),
      if (usecase != null) 'Usecase': usecase,
    };
  }
}

/// An object that contains a lead contact's details associated with the
/// engagement. This provides contact information for individuals involved in
/// lead-related activities.
///
/// @nodoc
class LeadContact {
  /// The lead contact's business title or job role associated with the
  /// engagement.
  final String businessTitle;

  /// The lead contact's email address associated with the engagement.
  final String email;

  /// The lead contact's first name associated with the engagement.
  final String firstName;

  /// The lead contact's last name associated with the engagement.
  final String lastName;

  /// The lead contact's phone number associated with the engagement.
  final String? phone;

  LeadContact({
    required this.businessTitle,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
  });

  factory LeadContact.fromJson(Map<String, dynamic> json) {
    return LeadContact(
      businessTitle: (json['BusinessTitle'] as String?) ?? '',
      email: (json['Email'] as String?) ?? '',
      firstName: (json['FirstName'] as String?) ?? '',
      lastName: (json['LastName'] as String?) ?? '',
      phone: json['Phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final businessTitle = this.businessTitle;
    final email = this.email;
    final firstName = this.firstName;
    final lastName = this.lastName;
    final phone = this.phone;
    return {
      'BusinessTitle': businessTitle,
      'Email': email,
      'FirstName': firstName,
      'LastName': lastName,
      if (phone != null) 'Phone': phone,
    };
  }
}

/// Provides comprehensive details about a customer project associated with an
/// Engagement. This may include information such as project goals, timelines,
/// and specific customer requirements.
///
/// @nodoc
class EngagementCustomerProjectDetails {
  /// A description of the business problem the project aims to solve.
  final String businessProblem;

  /// The target completion date for the customer's project.
  final String targetCompletionDate;

  /// The title of the project.
  final String title;

  EngagementCustomerProjectDetails({
    required this.businessProblem,
    required this.targetCompletionDate,
    required this.title,
  });

  factory EngagementCustomerProjectDetails.fromJson(Map<String, dynamic> json) {
    return EngagementCustomerProjectDetails(
      businessProblem: (json['BusinessProblem'] as String?) ?? '',
      targetCompletionDate: (json['TargetCompletionDate'] as String?) ?? '',
      title: (json['Title'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final businessProblem = this.businessProblem;
    final targetCompletionDate = this.targetCompletionDate;
    final title = this.title;
    return {
      'BusinessProblem': businessProblem,
      'TargetCompletionDate': targetCompletionDate,
      'Title': title,
    };
  }
}

/// Represents the updated payload of an engagement context. The structure of
/// this payload varies based on the context type being updated.
///
/// @nodoc
class UpdateEngagementContextPayload {
  final CustomerProjectsContext? customerProject;

  /// Contains updated information about a lead when the context type is "Lead".
  /// This field is present only when updating a lead context within the
  /// engagement.
  final UpdateLeadContext? lead;

  UpdateEngagementContextPayload({
    this.customerProject,
    this.lead,
  });

  Map<String, dynamic> toJson() {
    final customerProject = this.customerProject;
    final lead = this.lead;
    return {
      if (customerProject != null) 'CustomerProject': customerProject,
      if (lead != null) 'Lead': lead,
    };
  }
}

/// Updates the context information for a lead with qualification status,
/// customer details, and interaction data.
///
/// @nodoc
class UpdateLeadContext {
  /// Updated customer information associated with the lead.
  final LeadCustomer customer;

  /// Updated interaction details for the lead context.
  final LeadInteraction? interaction;

  /// The updated qualification status of the lead.
  final String? qualificationStatus;

  UpdateLeadContext({
    required this.customer,
    this.interaction,
    this.qualificationStatus,
  });

  Map<String, dynamic> toJson() {
    final customer = this.customer;
    final interaction = this.interaction;
    final qualificationStatus = this.qualificationStatus;
    return {
      'Customer': customer,
      if (interaction != null) 'Interaction': interaction,
      if (qualificationStatus != null)
        'QualificationStatus': qualificationStatus,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
