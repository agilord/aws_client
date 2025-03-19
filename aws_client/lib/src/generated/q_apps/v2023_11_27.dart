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

/// The Amazon Q Apps feature capability within Amazon Q Business allows web
/// experience users to create lightweight, purpose-built AI apps to fulfill
/// specific tasks from within their web experience. For example, users can
/// create a Q App that exclusively generates marketing-related content to
/// improve your marketing team's productivity or a Q App for writing customer
/// emails and creating promotional content using a certain style of voice,
/// tone, and branding. For more information on the capabilities, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/deploy-experience-iam-role.html#q-apps-actions">Amazon
/// Q Apps capabilities</a> in the <i>Amazon Q Business User Guide</i>.
///
/// For an overview of the Amazon Q App APIs, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_Operations_QApps.html">Overview
/// of Amazon Q Apps API operations</a>.
///
/// For information about the IAM access control permissions you need to use the
/// Amazon Q Apps API, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/deploy-experience-iam-role.html">
/// IAM role for the Amazon Q Business web experience including Amazon Q
/// Apps</a> in the <i>Amazon Q Business User Guide</i>.
class QApps {
  final _s.RestJsonProtocol _protocol;
  QApps({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'data.qapps',
            signingName: 'qapps',
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

  /// Associates a rating or review for a library item with the user submitting
  /// the request. This increments the rating count for the specified library
  /// item.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier for the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [libraryItemId] :
  /// The unique identifier of the library item to associate the review with.
  Future<void> associateLibraryItemReview({
    required String instanceId,
    required String libraryItemId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'libraryItemId': libraryItemId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/catalog.associateItemRating',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation creates a link between the user's identity calling the
  /// operation and a specific Q App. This is useful to mark the Q App as a
  /// <i>favorite</i> for the user if the user doesn't own the Amazon Q App so
  /// they can still run it and see it in their inventory of Q Apps.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appId] :
  /// The ID of the Amazon Q App to associate with the user.
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  Future<void> associateQAppWithUser({
    required String appId,
    required String instanceId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'appId': appId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps.install',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new library item for an Amazon Q App, allowing it to be
  /// discovered and used by other allowed users.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appId] :
  /// The unique identifier of the Amazon Q App to publish to the library.
  ///
  /// Parameter [appVersion] :
  /// The version of the Amazon Q App to publish to the library.
  ///
  /// Parameter [categories] :
  /// The categories to associate with the library item for easier discovery.
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  Future<CreateLibraryItemOutput> createLibraryItem({
    required String appId,
    required int appVersion,
    required List<String> categories,
    required String instanceId,
  }) async {
    _s.validateNumRange(
      'appVersion',
      appVersion,
      0,
      2147483647,
      isRequired: true,
    );
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'appId': appId,
      'appVersion': appVersion,
      'categories': categories,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/catalog.createItem',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateLibraryItemOutput.fromJson(response);
  }

  /// Creates a new Amazon Q App based on the provided definition. The Q App
  /// definition specifies the cards and flow of the Q App. This operation also
  /// calculates the dependencies between the cards by inspecting the references
  /// in the prompts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ContentTooLargeException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appDefinition] :
  /// The definition of the new Q App, specifying the cards and flow.
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [title] :
  /// The title of the new Q App.
  ///
  /// Parameter [description] :
  /// The description of the new Q App.
  ///
  /// Parameter [tags] :
  /// Optional tags to associate with the new Q App.
  Future<CreateQAppOutput> createQApp({
    required AppDefinitionInput appDefinition,
    required String instanceId,
    required String title,
    String? description,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'appDefinition': appDefinition,
      'title': title,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps.create',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateQAppOutput.fromJson(response);
  }

  /// Deletes a library item for an Amazon Q App, removing it from the library
  /// so it can no longer be discovered or used by other users.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [libraryItemId] :
  /// The unique identifier of the library item to delete.
  Future<void> deleteLibraryItem({
    required String instanceId,
    required String libraryItemId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'libraryItemId': libraryItemId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/catalog.deleteItem',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Q App owned by the user. If the Q App was previously
  /// published to the library, it is also removed from the library.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appId] :
  /// The unique identifier of the Q App to delete.
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  Future<void> deleteQApp({
    required String appId,
    required String instanceId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'appId': appId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps.delete',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a rating or review previously submitted by the user for a library
  /// item.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [libraryItemId] :
  /// The unique identifier of the library item to remove the review from.
  Future<void> disassociateLibraryItemReview({
    required String instanceId,
    required String libraryItemId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'libraryItemId': libraryItemId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/catalog.disassociateItemRating',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a Q App from a user removing the user's access to run the Q
  /// App.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appId] :
  /// The unique identifier of the Q App to disassociate from the user.
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  Future<void> disassociateQAppFromUser({
    required String appId,
    required String instanceId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'appId': appId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps.uninstall',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves details about a library item for an Amazon Q App, including its
  /// metadata, categories, ratings, and usage statistics.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [libraryItemId] :
  /// The unique identifier of the library item to retrieve.
  ///
  /// Parameter [appId] :
  /// The unique identifier of the Amazon Q App associated with the library
  /// item.
  Future<GetLibraryItemOutput> getLibraryItem({
    required String instanceId,
    required String libraryItemId,
    String? appId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $query = <String, List<String>>{
      'libraryItemId': [libraryItemId],
      if (appId != null) 'appId': [appId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/catalog.getItem',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetLibraryItemOutput.fromJson(response);
  }

  /// Retrieves the full details of an Q App, including its definition
  /// specifying the cards and flow.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appId] :
  /// The unique identifier of the Q App to retrieve.
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  Future<GetQAppOutput> getQApp({
    required String appId,
    required String instanceId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $query = <String, List<String>>{
      'appId': [appId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/apps.get',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetQAppOutput.fromJson(response);
  }

  /// Retrieves the current state and results for an active session of an Amazon
  /// Q App.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the Q App session to retrieve.
  Future<GetQAppSessionOutput> getQAppSession({
    required String instanceId,
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $query = <String, List<String>>{
      'sessionId': [sessionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/runtime.getQAppSession',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetQAppSessionOutput.fromJson(response);
  }

  /// Uploads a file that can then be used either as a default in a
  /// <code>FileUploadCard</code> from Q App definition or as a file that is
  /// used inside a single Q App run. The purpose of the document is determined
  /// by a scope parameter that indicates whether it is at the app definition
  /// level or at the app session level.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ContentTooLargeException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appId] :
  /// The unique identifier of the Q App the file is associated with.
  ///
  /// Parameter [cardId] :
  /// The unique identifier of the card the file is associated with, if
  /// applicable.
  ///
  /// Parameter [fileContentsBase64] :
  /// The base64-encoded contents of the file to upload.
  ///
  /// Parameter [fileName] :
  /// The name of the file being uploaded.
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [scope] :
  /// Whether the file is associated with an Q App definition or a specific Q
  /// App session.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the Q App session the file is associated with, if
  /// applicable.
  Future<ImportDocumentOutput> importDocument({
    required String appId,
    required String cardId,
    required String fileContentsBase64,
    required String fileName,
    required String instanceId,
    required DocumentScope scope,
    String? sessionId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'appId': appId,
      'cardId': cardId,
      'fileContentsBase64': fileContentsBase64,
      'fileName': fileName,
      'scope': scope.value,
      if (sessionId != null) 'sessionId': sessionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps.importDocument',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ImportDocumentOutput.fromJson(response);
  }

  /// Lists the library items for Amazon Q Apps that are published and available
  /// for users in your Amazon Web Services account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [categoryId] :
  /// Optional category to filter the library items by.
  ///
  /// Parameter [limit] :
  /// The maximum number of library items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListLibraryItemsOutput> listLibraryItems({
    required String instanceId,
    String? categoryId,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $query = <String, List<String>>{
      if (categoryId != null) 'categoryId': [categoryId],
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/catalog.list',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListLibraryItemsOutput.fromJson(response);
  }

  /// Lists the Amazon Q Apps owned by or associated with the user either
  /// because they created it or because they used it from the library in the
  /// past. The user identity is extracted from the credentials used to invoke
  /// this operation..
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [limit] :
  /// The maximum number of Q Apps to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListQAppsOutput> listQApps({
    required String instanceId,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/apps.list',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListQAppsOutput.fromJson(response);
  }

  /// Lists the tags associated with an Amazon Q Apps resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource whose tags should be
  /// listed.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceARN)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Generates an Amazon Q App definition based on either a conversation or a
  /// problem statement provided as input.The resulting app definition can be
  /// used to call <code>CreateQApp</code>. This API doesn't create Amazon Q
  /// Apps directly.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [options] :
  /// The input to generate the Q App definition from, either a conversation or
  /// problem statement.
  Future<PredictQAppOutput> predictQApp({
    required String instanceId,
    PredictQAppInputOptions? options,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      if (options != null) 'options': options,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps.predictQApp',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PredictQAppOutput.fromJson(response);
  }

  /// Starts a new session for an Amazon Q App, allowing inputs to be provided
  /// and the app to be run.
  /// <note>
  /// Each Q App session will be condensed into a single conversation in the web
  /// experience.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appId] :
  /// The unique identifier of the Q App to start a session for.
  ///
  /// Parameter [appVersion] :
  /// The version of the Q App to use for the session.
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [initialValues] :
  /// Optional initial input values to provide for the Q App session.
  ///
  /// Parameter [tags] :
  /// Optional tags to associate with the new Q App session.
  Future<StartQAppSessionOutput> startQAppSession({
    required String appId,
    required int appVersion,
    required String instanceId,
    List<CardValue>? initialValues,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'appVersion',
      appVersion,
      0,
      2147483647,
      isRequired: true,
    );
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'appId': appId,
      'appVersion': appVersion,
      if (initialValues != null) 'initialValues': initialValues,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runtime.startQAppSession',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StartQAppSessionOutput.fromJson(response);
  }

  /// Stops an active session for an Amazon Q App.This deletes all data related
  /// to the session and makes it invalid for future uses. The results of the
  /// session will be persisted as part of the conversation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the Q App session to stop.
  Future<void> stopQAppSession({
    required String instanceId,
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'sessionId': sessionId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runtime.deleteMiniAppRun',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates tags with an Amazon Q Apps resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource to tag.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the resource.
  Future<void> tagResource({
    required String resourceARN,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceARN)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates tags from an Amazon Q Apps resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource to disassociate the tag
  /// from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to disassociate from the resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceARN)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the library item for an Amazon Q App.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [libraryItemId] :
  /// The unique identifier of the library item to update.
  ///
  /// Parameter [categories] :
  /// The new categories to associate with the library item.
  ///
  /// Parameter [status] :
  /// The new status to set for the library item, such as "Published" or
  /// "Hidden".
  Future<UpdateLibraryItemOutput> updateLibraryItem({
    required String instanceId,
    required String libraryItemId,
    List<String>? categories,
    LibraryItemStatus? status,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'libraryItemId': libraryItemId,
      if (categories != null) 'categories': categories,
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/catalog.updateItem',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLibraryItemOutput.fromJson(response);
  }

  /// Updates the verification status of a library item for an Amazon Q App.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [libraryItemId] :
  /// The unique identifier of the updated library item.
  ///
  /// Parameter [isVerified] :
  /// The verification status of the library item
  Future<void> updateLibraryItemMetadata({
    required String instanceId,
    required String libraryItemId,
    bool? isVerified,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'libraryItemId': libraryItemId,
      if (isVerified != null) 'isVerified': isVerified,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/catalog.updateItemMetadata',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing Amazon Q App, allowing modifications to its title,
  /// description, and definition.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ContentTooLargeException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appId] :
  /// The unique identifier of the Q App to update.
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [appDefinition] :
  /// The new definition specifying the cards and flow for the Q App.
  ///
  /// Parameter [description] :
  /// The new description for the Q App.
  ///
  /// Parameter [title] :
  /// The new title for the Q App.
  Future<UpdateQAppOutput> updateQApp({
    required String appId,
    required String instanceId,
    AppDefinitionInput? appDefinition,
    String? description,
    String? title,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'appId': appId,
      if (appDefinition != null) 'appDefinition': appDefinition,
      if (description != null) 'description': description,
      if (title != null) 'title': title,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps.update',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateQAppOutput.fromJson(response);
  }

  /// Updates the session for a given Q App <code>sessionId</code>. This is only
  /// valid when at least one card of the session is in the <code>WAITING</code>
  /// state. Data for each <code>WAITING</code> card can be provided as input.
  /// If inputs are not provided, the call will be accepted but session will not
  /// move forward. Inputs for cards that are not in the <code>WAITING</code>
  /// status will be ignored.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The unique identifier of the Amazon Q Business application environment
  /// instance.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the Q App session to provide input for.
  ///
  /// Parameter [values] :
  /// The input values to provide for the current state of the Q App session.
  Future<UpdateQAppSessionOutput> updateQAppSession({
    required String instanceId,
    required String sessionId,
    List<CardValue>? values,
  }) async {
    final headers = <String, String>{
      'instance-id': instanceId.toString(),
    };
    final $payload = <String, dynamic>{
      'sessionId': sessionId,
      if (values != null) 'values': values,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runtime.updateQAppSession',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateQAppSessionOutput.fromJson(response);
  }
}

/// The definition of the Q App, specifying the cards and flow.
class AppDefinition {
  /// The version of the app definition schema or specification.
  final String appDefinitionVersion;

  /// The cards that make up the Q App, such as text input, file upload, or query
  /// cards.
  final List<Card> cards;

  /// A flag indicating whether the Q App's definition can be edited by the user.
  final bool? canEdit;

  AppDefinition({
    required this.appDefinitionVersion,
    required this.cards,
    this.canEdit,
  });

  factory AppDefinition.fromJson(Map<String, dynamic> json) {
    return AppDefinition(
      appDefinitionVersion: json['appDefinitionVersion'] as String,
      cards: (json['cards'] as List)
          .nonNulls
          .map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
      canEdit: json['canEdit'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final appDefinitionVersion = this.appDefinitionVersion;
    final cards = this.cards;
    final canEdit = this.canEdit;
    return {
      'appDefinitionVersion': appDefinitionVersion,
      'cards': cards,
      if (canEdit != null) 'canEdit': canEdit,
    };
  }
}

/// The input for defining an Q App.
class AppDefinitionInput {
  /// The cards that make up the Q App definition.
  final List<CardInput> cards;

  /// The initial prompt displayed when the Q App is started.
  final String? initialPrompt;

  AppDefinitionInput({
    required this.cards,
    this.initialPrompt,
  });

  factory AppDefinitionInput.fromJson(Map<String, dynamic> json) {
    return AppDefinitionInput(
      cards: (json['cards'] as List)
          .nonNulls
          .map((e) => CardInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      initialPrompt: json['initialPrompt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cards = this.cards;
    final initialPrompt = this.initialPrompt;
    return {
      'cards': cards,
      if (initialPrompt != null) 'initialPrompt': initialPrompt,
    };
  }
}

enum AppRequiredCapability {
  fileUpload('FileUpload'),
  creatorMode('CreatorMode'),
  retrievalMode('RetrievalMode'),
  pluginMode('PluginMode'),
  ;

  final String value;

  const AppRequiredCapability(this.value);

  static AppRequiredCapability fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum AppRequiredCapability'));
}

enum AppStatus {
  published('PUBLISHED'),
  draft('DRAFT'),
  deleted('DELETED'),
  ;

  final String value;

  const AppStatus(this.value);

  static AppStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum AppStatus'));
}

/// The filter criteria used on responses based on document attributes or
/// metadata fields.
class AttributeFilter {
  /// Performs a logical <code>AND</code> operation on all supplied filters.
  final List<AttributeFilter>? andAllFilters;

  /// Returns <code>true</code> when a document contains all the specified
  /// document attributes or metadata fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>stringListValue</code>.
  final DocumentAttribute? containsAll;

  /// Returns <code>true</code> when a document contains any of the specified
  /// document attributes or metadata fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>stringListValue</code>.
  final DocumentAttribute? containsAny;

  /// Performs an <i>equals</i> operation on two document attributes or metadata
  /// fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>dateValue</code>, <code>longValue</code>,
  /// <code>stringListValue</code> and <code>stringValue</code>.
  final DocumentAttribute? equalsTo;

  /// Performs a <i>greater than</i> operation on two document attributes or
  /// metadata fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>dateValue</code> and
  /// <code>longValue</code>.
  final DocumentAttribute? greaterThan;

  /// Performs a <i>greater than or equals</i> operation on two document
  /// attributes or metadata fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>dateValue</code> and
  /// <code>longValue</code>.
  final DocumentAttribute? greaterThanOrEquals;

  /// Performs a <i>less than</i> operation on two document attributes or metadata
  /// fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>dateValue</code> and
  /// <code>longValue</code>.
  final DocumentAttribute? lessThan;

  /// Performs a <i>less than or equals</i> operation on two document attributes
  /// or metadata fields.Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value type</a>: <code>dateValue</code> and <code>longValue</code>.
  final DocumentAttribute? lessThanOrEquals;

  /// Performs a logical <code>NOT</code> operation on all supplied filters.
  final AttributeFilter? notFilter;

  /// Performs a logical <code>OR</code> operation on all supplied filters.
  final List<AttributeFilter>? orAllFilters;

  AttributeFilter({
    this.andAllFilters,
    this.containsAll,
    this.containsAny,
    this.equalsTo,
    this.greaterThan,
    this.greaterThanOrEquals,
    this.lessThan,
    this.lessThanOrEquals,
    this.notFilter,
    this.orAllFilters,
  });

  factory AttributeFilter.fromJson(Map<String, dynamic> json) {
    return AttributeFilter(
      andAllFilters: (json['andAllFilters'] as List?)
          ?.nonNulls
          .map((e) => AttributeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      containsAll: json['containsAll'] != null
          ? DocumentAttribute.fromJson(
              json['containsAll'] as Map<String, dynamic>)
          : null,
      containsAny: json['containsAny'] != null
          ? DocumentAttribute.fromJson(
              json['containsAny'] as Map<String, dynamic>)
          : null,
      equalsTo: json['equalsTo'] != null
          ? DocumentAttribute.fromJson(json['equalsTo'] as Map<String, dynamic>)
          : null,
      greaterThan: json['greaterThan'] != null
          ? DocumentAttribute.fromJson(
              json['greaterThan'] as Map<String, dynamic>)
          : null,
      greaterThanOrEquals: json['greaterThanOrEquals'] != null
          ? DocumentAttribute.fromJson(
              json['greaterThanOrEquals'] as Map<String, dynamic>)
          : null,
      lessThan: json['lessThan'] != null
          ? DocumentAttribute.fromJson(json['lessThan'] as Map<String, dynamic>)
          : null,
      lessThanOrEquals: json['lessThanOrEquals'] != null
          ? DocumentAttribute.fromJson(
              json['lessThanOrEquals'] as Map<String, dynamic>)
          : null,
      notFilter: json['notFilter'] != null
          ? AttributeFilter.fromJson(json['notFilter'] as Map<String, dynamic>)
          : null,
      orAllFilters: (json['orAllFilters'] as List?)
          ?.nonNulls
          .map((e) => AttributeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final andAllFilters = this.andAllFilters;
    final containsAll = this.containsAll;
    final containsAny = this.containsAny;
    final equalsTo = this.equalsTo;
    final greaterThan = this.greaterThan;
    final greaterThanOrEquals = this.greaterThanOrEquals;
    final lessThan = this.lessThan;
    final lessThanOrEquals = this.lessThanOrEquals;
    final notFilter = this.notFilter;
    final orAllFilters = this.orAllFilters;
    return {
      if (andAllFilters != null) 'andAllFilters': andAllFilters,
      if (containsAll != null) 'containsAll': containsAll,
      if (containsAny != null) 'containsAny': containsAny,
      if (equalsTo != null) 'equalsTo': equalsTo,
      if (greaterThan != null) 'greaterThan': greaterThan,
      if (greaterThanOrEquals != null)
        'greaterThanOrEquals': greaterThanOrEquals,
      if (lessThan != null) 'lessThan': lessThan,
      if (lessThanOrEquals != null) 'lessThanOrEquals': lessThanOrEquals,
      if (notFilter != null) 'notFilter': notFilter,
      if (orAllFilters != null) 'orAllFilters': orAllFilters,
    };
  }
}

/// A card representing a component or step in an Amazon Q App's flow.
class Card {
  /// A container for the properties of the file upload card.
  final FileUploadCard? fileUpload;

  /// A container for the properties of the plugin card.
  final QPluginCard? qPlugin;

  /// A container for the properties of the query card.
  final QQueryCard? qQuery;

  /// A container for the properties of the text input card.
  final TextInputCard? textInput;

  Card({
    this.fileUpload,
    this.qPlugin,
    this.qQuery,
    this.textInput,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      fileUpload: json['fileUpload'] != null
          ? FileUploadCard.fromJson(json['fileUpload'] as Map<String, dynamic>)
          : null,
      qPlugin: json['qPlugin'] != null
          ? QPluginCard.fromJson(json['qPlugin'] as Map<String, dynamic>)
          : null,
      qQuery: json['qQuery'] != null
          ? QQueryCard.fromJson(json['qQuery'] as Map<String, dynamic>)
          : null,
      textInput: json['textInput'] != null
          ? TextInputCard.fromJson(json['textInput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileUpload = this.fileUpload;
    final qPlugin = this.qPlugin;
    final qQuery = this.qQuery;
    final textInput = this.textInput;
    return {
      if (fileUpload != null) 'fileUpload': fileUpload,
      if (qPlugin != null) 'qPlugin': qPlugin,
      if (qQuery != null) 'qQuery': qQuery,
      if (textInput != null) 'textInput': textInput,
    };
  }
}

/// The properties defining an input card in an Amazon Q App.
class CardInput {
  /// A container for the properties of the file upload input card.
  final FileUploadCardInput? fileUpload;

  /// A container for the properties of the plugin input card.
  final QPluginCardInput? qPlugin;

  /// A container for the properties of the query input card.
  final QQueryCardInput? qQuery;

  /// A container for the properties of the text input card.
  final TextInputCardInput? textInput;

  CardInput({
    this.fileUpload,
    this.qPlugin,
    this.qQuery,
    this.textInput,
  });

  factory CardInput.fromJson(Map<String, dynamic> json) {
    return CardInput(
      fileUpload: json['fileUpload'] != null
          ? FileUploadCardInput.fromJson(
              json['fileUpload'] as Map<String, dynamic>)
          : null,
      qPlugin: json['qPlugin'] != null
          ? QPluginCardInput.fromJson(json['qPlugin'] as Map<String, dynamic>)
          : null,
      qQuery: json['qQuery'] != null
          ? QQueryCardInput.fromJson(json['qQuery'] as Map<String, dynamic>)
          : null,
      textInput: json['textInput'] != null
          ? TextInputCardInput.fromJson(
              json['textInput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileUpload = this.fileUpload;
    final qPlugin = this.qPlugin;
    final qQuery = this.qQuery;
    final textInput = this.textInput;
    return {
      if (fileUpload != null) 'fileUpload': fileUpload,
      if (qPlugin != null) 'qPlugin': qPlugin,
      if (qQuery != null) 'qQuery': qQuery,
      if (textInput != null) 'textInput': textInput,
    };
  }
}

enum CardOutputSource {
  approvedSources('approved-sources'),
  llm('llm'),
  ;

  final String value;

  const CardOutputSource(this.value);

  static CardOutputSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CardOutputSource'));
}

/// The current status and value of a card in an active Amazon Q App session.
class CardStatus {
  /// The current state of the card.
  final ExecutionStatus currentState;

  /// The current value or result associated with the card.
  final String currentValue;

  CardStatus({
    required this.currentState,
    required this.currentValue,
  });

  factory CardStatus.fromJson(Map<String, dynamic> json) {
    return CardStatus(
      currentState:
          ExecutionStatus.fromString((json['currentState'] as String)),
      currentValue: json['currentValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final currentState = this.currentState;
    final currentValue = this.currentValue;
    return {
      'currentState': currentState.value,
      'currentValue': currentValue,
    };
  }
}

enum CardType {
  textInput('text-input'),
  qQuery('q-query'),
  fileUpload('file-upload'),
  qPlugin('q-plugin'),
  ;

  final String value;

  const CardType(this.value);

  static CardType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum CardType'));
}

/// The value or result associated with a card in a Amazon Q App session.
class CardValue {
  /// The unique identifier of the card.
  final String cardId;

  /// The value or result associated with the card.
  final String value;

  CardValue({
    required this.cardId,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final cardId = this.cardId;
    final value = this.value;
    return {
      'cardId': cardId,
      'value': value,
    };
  }
}

/// A category used to classify and filter library items for Amazon Q Apps.
class Category {
  /// The unique identifier of the category.
  final String id;

  /// The title or name of the category.
  final String title;

  Category({
    required this.id,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final title = this.title;
    return {
      'id': id,
      'title': title,
    };
  }
}

/// A message in a conversation, used as input for generating an Amazon Q App
/// definition.
class ConversationMessage {
  /// The text content of the conversation message.
  final String body;

  /// The type of the conversation message.
  final Sender type;

  ConversationMessage({
    required this.body,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final type = this.type;
    return {
      'body': body,
      'type': type.value,
    };
  }
}

class CreateLibraryItemOutput {
  /// The date and time the library item was created.
  final DateTime createdAt;

  /// The user who created the library item.
  final String createdBy;

  /// The unique identifier of the new library item.
  final String libraryItemId;

  /// The number of ratings the library item has received from users.
  final int ratingCount;

  /// The status of the new library item, such as "Published".
  final String status;

  /// Indicates whether the library item has been verified.
  final bool? isVerified;

  /// The date and time the library item was last updated.
  final DateTime? updatedAt;

  /// The user who last updated the library item.
  final String? updatedBy;

  CreateLibraryItemOutput({
    required this.createdAt,
    required this.createdBy,
    required this.libraryItemId,
    required this.ratingCount,
    required this.status,
    this.isVerified,
    this.updatedAt,
    this.updatedBy,
  });

  factory CreateLibraryItemOutput.fromJson(Map<String, dynamic> json) {
    return CreateLibraryItemOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      libraryItemId: json['libraryItemId'] as String,
      ratingCount: json['ratingCount'] as int,
      status: json['status'] as String,
      isVerified: json['isVerified'] as bool?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final libraryItemId = this.libraryItemId;
    final ratingCount = this.ratingCount;
    final status = this.status;
    final isVerified = this.isVerified;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'libraryItemId': libraryItemId,
      'ratingCount': ratingCount,
      'status': status,
      if (isVerified != null) 'isVerified': isVerified,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class CreateQAppOutput {
  /// The Amazon Resource Name (ARN) of the new Q App.
  final String appArn;

  /// The unique identifier of the new Q App.
  final String appId;

  /// The version of the new Q App.
  final int appVersion;

  /// The date and time the Q App was created.
  final DateTime createdAt;

  /// The user who created the Q App.
  final String createdBy;

  /// The status of the new Q App, such as "Created".
  final AppStatus status;

  /// The title of the new Q App.
  final String title;

  /// The date and time the Q App was last updated.
  final DateTime updatedAt;

  /// The user who last updated the Q App.
  final String updatedBy;

  /// The description of the new Q App.
  final String? description;

  /// The initial prompt displayed when the Q App is started.
  final String? initialPrompt;

  /// The capabilities required to run the Q App, such as file upload or
  /// third-party integrations.
  final List<AppRequiredCapability>? requiredCapabilities;

  CreateQAppOutput({
    required this.appArn,
    required this.appId,
    required this.appVersion,
    required this.createdAt,
    required this.createdBy,
    required this.status,
    required this.title,
    required this.updatedAt,
    required this.updatedBy,
    this.description,
    this.initialPrompt,
    this.requiredCapabilities,
  });

  factory CreateQAppOutput.fromJson(Map<String, dynamic> json) {
    return CreateQAppOutput(
      appArn: json['appArn'] as String,
      appId: json['appId'] as String,
      appVersion: json['appVersion'] as int,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      status: AppStatus.fromString((json['status'] as String)),
      title: json['title'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      updatedBy: json['updatedBy'] as String,
      description: json['description'] as String?,
      initialPrompt: json['initialPrompt'] as String?,
      requiredCapabilities: (json['requiredCapabilities'] as List?)
          ?.nonNulls
          .map((e) => AppRequiredCapability.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appId = this.appId;
    final appVersion = this.appVersion;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final status = this.status;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final description = this.description;
    final initialPrompt = this.initialPrompt;
    final requiredCapabilities = this.requiredCapabilities;
    return {
      'appArn': appArn,
      'appId': appId,
      'appVersion': appVersion,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'status': status.value,
      'title': title,
      'updatedAt': iso8601ToJson(updatedAt),
      'updatedBy': updatedBy,
      if (description != null) 'description': description,
      if (initialPrompt != null) 'initialPrompt': initialPrompt,
      if (requiredCapabilities != null)
        'requiredCapabilities':
            requiredCapabilities.map((e) => e.value).toList(),
    };
  }
}

/// A document attribute or metadata field.
class DocumentAttribute {
  /// The identifier for the attribute.
  final String name;

  /// The value of the attribute.
  final DocumentAttributeValue value;

  DocumentAttribute({
    required this.name,
    required this.value,
  });

  factory DocumentAttribute.fromJson(Map<String, dynamic> json) {
    return DocumentAttribute(
      name: json['name'] as String,
      value: DocumentAttributeValue.fromJson(
          json['value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// The value of a document attribute. You can only provide one value for a
/// document attribute.
class DocumentAttributeValue {
  /// A date expressed as an ISO 8601 string.
  ///
  /// It's important for the time zone to be included in the <i>ISO 8601
  /// date-time</i> format. For example, 2012-03-25T12:30:10+01:00 is the ISO 8601
  /// date-time format for March 25th 2012 at 12:30PM (plus 10 seconds) in Central
  /// European Time.
  final DateTime? dateValue;

  /// A long integer value.
  final int? longValue;

  /// A list of strings.
  final List<String>? stringListValue;

  /// A string.
  final String? stringValue;

  DocumentAttributeValue({
    this.dateValue,
    this.longValue,
    this.stringListValue,
    this.stringValue,
  });

  factory DocumentAttributeValue.fromJson(Map<String, dynamic> json) {
    return DocumentAttributeValue(
      dateValue: timeStampFromJson(json['dateValue']),
      longValue: json['longValue'] as int?,
      stringListValue: (json['stringListValue'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dateValue = this.dateValue;
    final longValue = this.longValue;
    final stringListValue = this.stringListValue;
    final stringValue = this.stringValue;
    return {
      if (dateValue != null) 'dateValue': unixTimestampToJson(dateValue),
      if (longValue != null) 'longValue': longValue,
      if (stringListValue != null) 'stringListValue': stringListValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

enum DocumentScope {
  application('APPLICATION'),
  session('SESSION'),
  ;

  final String value;

  const DocumentScope(this.value);

  static DocumentScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DocumentScope'));
}

enum ExecutionStatus {
  inProgress('IN_PROGRESS'),
  waiting('WAITING'),
  completed('COMPLETED'),
  ;

  final String value;

  const ExecutionStatus(this.value);

  static ExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ExecutionStatus'));
}

/// A card in an Amazon Q App that allows the user to upload a file.
class FileUploadCard {
  /// Any dependencies or requirements for the file upload card.
  final List<String> dependencies;

  /// The unique identifier of the file upload card.
  final String id;

  /// The title of the file upload card.
  final String title;

  /// The type of the card.
  final CardType type;

  /// A flag indicating if the user can override the default file for the upload
  /// card.
  final bool? allowOverride;

  /// The unique identifier of the file associated with the card.
  final String? fileId;

  /// The name of the file being uploaded.
  final String? filename;

  FileUploadCard({
    required this.dependencies,
    required this.id,
    required this.title,
    required this.type,
    this.allowOverride,
    this.fileId,
    this.filename,
  });

  factory FileUploadCard.fromJson(Map<String, dynamic> json) {
    return FileUploadCard(
      dependencies: (json['dependencies'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String,
      title: json['title'] as String,
      type: CardType.fromString((json['type'] as String)),
      allowOverride: json['allowOverride'] as bool?,
      fileId: json['fileId'] as String?,
      filename: json['filename'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dependencies = this.dependencies;
    final id = this.id;
    final title = this.title;
    final type = this.type;
    final allowOverride = this.allowOverride;
    final fileId = this.fileId;
    final filename = this.filename;
    return {
      'dependencies': dependencies,
      'id': id,
      'title': title,
      'type': type.value,
      if (allowOverride != null) 'allowOverride': allowOverride,
      if (fileId != null) 'fileId': fileId,
      if (filename != null) 'filename': filename,
    };
  }
}

/// Represents a file upload card. It can optionally receive a
/// <code>filename</code> and <code>fileId</code> to set a default file. If not
/// received, the user must provide the file when the Q App runs.
class FileUploadCardInput {
  /// The unique identifier of the file upload card.
  final String id;

  /// The title or label of the file upload card.
  final String title;

  /// The type of the card.
  final CardType type;

  /// A flag indicating if the user can override the default file for the upload
  /// card.
  final bool? allowOverride;

  /// The identifier of a pre-uploaded file associated with the card.
  final String? fileId;

  /// The default filename to use for the file upload card.
  final String? filename;

  FileUploadCardInput({
    required this.id,
    required this.title,
    required this.type,
    this.allowOverride,
    this.fileId,
    this.filename,
  });

  factory FileUploadCardInput.fromJson(Map<String, dynamic> json) {
    return FileUploadCardInput(
      id: json['id'] as String,
      title: json['title'] as String,
      type: CardType.fromString((json['type'] as String)),
      allowOverride: json['allowOverride'] as bool?,
      fileId: json['fileId'] as String?,
      filename: json['filename'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final title = this.title;
    final type = this.type;
    final allowOverride = this.allowOverride;
    final fileId = this.fileId;
    final filename = this.filename;
    return {
      'id': id,
      'title': title,
      'type': type.value,
      if (allowOverride != null) 'allowOverride': allowOverride,
      if (fileId != null) 'fileId': fileId,
      if (filename != null) 'filename': filename,
    };
  }
}

class GetLibraryItemOutput {
  /// The unique identifier of the Q App associated with the library item.
  final String appId;

  /// The version of the Q App associated with the library item.
  final int appVersion;

  /// The categories associated with the library item for discovery.
  final List<Category> categories;

  /// The date and time the library item was created.
  final DateTime createdAt;

  /// The user who created the library item.
  final String createdBy;

  /// The unique identifier of the library item.
  final String libraryItemId;

  /// The number of ratings the library item has received from users.
  final int ratingCount;

  /// The status of the library item, such as "Published".
  final String status;

  /// Whether the current user has rated the library item.
  final bool? isRatedByUser;

  /// Indicates whether the library item has been verified.
  final bool? isVerified;

  /// The date and time the library item was last updated.
  final DateTime? updatedAt;

  /// The user who last updated the library item.
  final String? updatedBy;

  /// The number of users who have associated the Q App with their account.
  final int? userCount;

  GetLibraryItemOutput({
    required this.appId,
    required this.appVersion,
    required this.categories,
    required this.createdAt,
    required this.createdBy,
    required this.libraryItemId,
    required this.ratingCount,
    required this.status,
    this.isRatedByUser,
    this.isVerified,
    this.updatedAt,
    this.updatedBy,
    this.userCount,
  });

  factory GetLibraryItemOutput.fromJson(Map<String, dynamic> json) {
    return GetLibraryItemOutput(
      appId: json['appId'] as String,
      appVersion: json['appVersion'] as int,
      categories: (json['categories'] as List)
          .nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      libraryItemId: json['libraryItemId'] as String,
      ratingCount: json['ratingCount'] as int,
      status: json['status'] as String,
      isRatedByUser: json['isRatedByUser'] as bool?,
      isVerified: json['isVerified'] as bool?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
      userCount: json['userCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final appVersion = this.appVersion;
    final categories = this.categories;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final libraryItemId = this.libraryItemId;
    final ratingCount = this.ratingCount;
    final status = this.status;
    final isRatedByUser = this.isRatedByUser;
    final isVerified = this.isVerified;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final userCount = this.userCount;
    return {
      'appId': appId,
      'appVersion': appVersion,
      'categories': categories,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'libraryItemId': libraryItemId,
      'ratingCount': ratingCount,
      'status': status,
      if (isRatedByUser != null) 'isRatedByUser': isRatedByUser,
      if (isVerified != null) 'isVerified': isVerified,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (userCount != null) 'userCount': userCount,
    };
  }
}

class GetQAppOutput {
  /// The Amazon Resource Name (ARN) of the Q App.
  final String appArn;

  /// The full definition of the Q App, specifying the cards and flow.
  final AppDefinition appDefinition;

  /// The unique identifier of the Q App.
  final String appId;

  /// The version of the Q App.
  final int appVersion;

  /// The date and time the Q App was created.
  final DateTime createdAt;

  /// The user who created the Q App.
  final String createdBy;

  /// The status of the Q App.
  final AppStatus status;

  /// The title of the Q App.
  final String title;

  /// The date and time the Q App was last updated.
  final DateTime updatedAt;

  /// The user who last updated the Q App.
  final String updatedBy;

  /// The description of the Q App.
  final String? description;

  /// The initial prompt displayed when the Q App is started.
  final String? initialPrompt;

  /// The capabilities required to run the Q App, such as file upload or
  /// third-party integrations.
  final List<AppRequiredCapability>? requiredCapabilities;

  GetQAppOutput({
    required this.appArn,
    required this.appDefinition,
    required this.appId,
    required this.appVersion,
    required this.createdAt,
    required this.createdBy,
    required this.status,
    required this.title,
    required this.updatedAt,
    required this.updatedBy,
    this.description,
    this.initialPrompt,
    this.requiredCapabilities,
  });

  factory GetQAppOutput.fromJson(Map<String, dynamic> json) {
    return GetQAppOutput(
      appArn: json['appArn'] as String,
      appDefinition:
          AppDefinition.fromJson(json['appDefinition'] as Map<String, dynamic>),
      appId: json['appId'] as String,
      appVersion: json['appVersion'] as int,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      status: AppStatus.fromString((json['status'] as String)),
      title: json['title'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      updatedBy: json['updatedBy'] as String,
      description: json['description'] as String?,
      initialPrompt: json['initialPrompt'] as String?,
      requiredCapabilities: (json['requiredCapabilities'] as List?)
          ?.nonNulls
          .map((e) => AppRequiredCapability.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appDefinition = this.appDefinition;
    final appId = this.appId;
    final appVersion = this.appVersion;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final status = this.status;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final description = this.description;
    final initialPrompt = this.initialPrompt;
    final requiredCapabilities = this.requiredCapabilities;
    return {
      'appArn': appArn,
      'appDefinition': appDefinition,
      'appId': appId,
      'appVersion': appVersion,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'status': status.value,
      'title': title,
      'updatedAt': iso8601ToJson(updatedAt),
      'updatedBy': updatedBy,
      if (description != null) 'description': description,
      if (initialPrompt != null) 'initialPrompt': initialPrompt,
      if (requiredCapabilities != null)
        'requiredCapabilities':
            requiredCapabilities.map((e) => e.value).toList(),
    };
  }
}

class GetQAppSessionOutput {
  /// The current status for each card in the Q App session.
  final Map<String, CardStatus> cardStatus;

  /// The Amazon Resource Name (ARN) of the Q App session.
  final String sessionArn;

  /// The unique identifier of the Q App session.
  final String sessionId;

  /// The current status of the Q App session.
  final ExecutionStatus status;

  GetQAppSessionOutput({
    required this.cardStatus,
    required this.sessionArn,
    required this.sessionId,
    required this.status,
  });

  factory GetQAppSessionOutput.fromJson(Map<String, dynamic> json) {
    return GetQAppSessionOutput(
      cardStatus: (json['cardStatus'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, CardStatus.fromJson(e as Map<String, dynamic>))),
      sessionArn: json['sessionArn'] as String,
      sessionId: json['sessionId'] as String,
      status: ExecutionStatus.fromString((json['status'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final cardStatus = this.cardStatus;
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    final status = this.status;
    return {
      'cardStatus': cardStatus,
      'sessionArn': sessionArn,
      'sessionId': sessionId,
      'status': status.value,
    };
  }
}

class ImportDocumentOutput {
  /// The unique identifier assigned to the uploaded file.
  final String? fileId;

  ImportDocumentOutput({
    this.fileId,
  });

  factory ImportDocumentOutput.fromJson(Map<String, dynamic> json) {
    return ImportDocumentOutput(
      fileId: json['fileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileId = this.fileId;
    return {
      if (fileId != null) 'fileId': fileId,
    };
  }
}

/// A library item is a snapshot of an Amazon Q App that can be published so the
/// users in their Amazon Q Apps library can discover it, clone it, and run it.
class LibraryItemMember {
  /// The unique identifier of the Q App associated with the library item.
  final String appId;

  /// The version of the Q App associated with the library item.
  final int appVersion;

  /// The categories associated with the library item.
  final List<Category> categories;

  /// The date and time the library item was created.
  final DateTime createdAt;

  /// The user who created the library item.
  final String createdBy;

  /// The unique identifier of the library item.
  final String libraryItemId;

  /// The number of ratings the library item has received.
  final int ratingCount;

  /// The status of the library item.
  final String status;

  /// Whether the current user has rated the library item.
  final bool? isRatedByUser;

  /// Indicates whether the library item has been verified.
  final bool? isVerified;

  /// The date and time the library item was last updated.
  final DateTime? updatedAt;

  /// The user who last updated the library item.
  final String? updatedBy;

  /// The number of users who have the associated Q App.
  final int? userCount;

  LibraryItemMember({
    required this.appId,
    required this.appVersion,
    required this.categories,
    required this.createdAt,
    required this.createdBy,
    required this.libraryItemId,
    required this.ratingCount,
    required this.status,
    this.isRatedByUser,
    this.isVerified,
    this.updatedAt,
    this.updatedBy,
    this.userCount,
  });

  factory LibraryItemMember.fromJson(Map<String, dynamic> json) {
    return LibraryItemMember(
      appId: json['appId'] as String,
      appVersion: json['appVersion'] as int,
      categories: (json['categories'] as List)
          .nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      libraryItemId: json['libraryItemId'] as String,
      ratingCount: json['ratingCount'] as int,
      status: json['status'] as String,
      isRatedByUser: json['isRatedByUser'] as bool?,
      isVerified: json['isVerified'] as bool?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
      userCount: json['userCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final appVersion = this.appVersion;
    final categories = this.categories;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final libraryItemId = this.libraryItemId;
    final ratingCount = this.ratingCount;
    final status = this.status;
    final isRatedByUser = this.isRatedByUser;
    final isVerified = this.isVerified;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final userCount = this.userCount;
    return {
      'appId': appId,
      'appVersion': appVersion,
      'categories': categories,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'libraryItemId': libraryItemId,
      'ratingCount': ratingCount,
      'status': status,
      if (isRatedByUser != null) 'isRatedByUser': isRatedByUser,
      if (isVerified != null) 'isVerified': isVerified,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (userCount != null) 'userCount': userCount,
    };
  }
}

enum LibraryItemStatus {
  published('PUBLISHED'),
  disabled('DISABLED'),
  ;

  final String value;

  const LibraryItemStatus(this.value);

  static LibraryItemStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LibraryItemStatus'));
}

class ListLibraryItemsOutput {
  /// The list of library items meeting the request criteria.
  final List<LibraryItemMember>? libraryItems;

  /// The token to use to request the next page of results.
  final String? nextToken;

  ListLibraryItemsOutput({
    this.libraryItems,
    this.nextToken,
  });

  factory ListLibraryItemsOutput.fromJson(Map<String, dynamic> json) {
    return ListLibraryItemsOutput(
      libraryItems: (json['libraryItems'] as List?)
          ?.nonNulls
          .map((e) => LibraryItemMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final libraryItems = this.libraryItems;
    final nextToken = this.nextToken;
    return {
      if (libraryItems != null) 'libraryItems': libraryItems,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListQAppsOutput {
  /// The list of Amazon Q Apps meeting the request criteria.
  final List<UserAppItem> apps;

  /// The token to use to request the next page of results.
  final String? nextToken;

  ListQAppsOutput({
    required this.apps,
    this.nextToken,
  });

  factory ListQAppsOutput.fromJson(Map<String, dynamic> json) {
    return ListQAppsOutput(
      apps: (json['apps'] as List)
          .nonNulls
          .map((e) => UserAppItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apps = this.apps;
    final nextToken = this.nextToken;
    return {
      'apps': apps,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags that are assigned to the resource.
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

enum PluginType {
  serviceNow('SERVICE_NOW'),
  salesforce('SALESFORCE'),
  jira('JIRA'),
  zendesk('ZENDESK'),
  custom('CUSTOM'),
  ;

  final String value;

  const PluginType(this.value);

  static PluginType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum PluginType'));
}

/// The definition of an Amazon Q App generated based on input such as a
/// conversation or problem statement.
class PredictAppDefinition {
  /// The definition specifying the cards and flow of the generated Q App.
  final AppDefinitionInput appDefinition;

  /// The title of the generated Q App definition.
  final String title;

  /// The description of the generated Q App definition.
  final String? description;

  PredictAppDefinition({
    required this.appDefinition,
    required this.title,
    this.description,
  });

  factory PredictAppDefinition.fromJson(Map<String, dynamic> json) {
    return PredictAppDefinition(
      appDefinition: AppDefinitionInput.fromJson(
          json['appDefinition'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appDefinition = this.appDefinition;
    final title = this.title;
    final description = this.description;
    return {
      'appDefinition': appDefinition,
      'title': title,
      if (description != null) 'description': description,
    };
  }
}

/// The input options for generating an Q App definition.
class PredictQAppInputOptions {
  /// A conversation to use as input for generating the Q App definition.
  final List<ConversationMessage>? conversation;

  /// A problem statement to use as input for generating the Q App definition.
  final String? problemStatement;

  PredictQAppInputOptions({
    this.conversation,
    this.problemStatement,
  });

  Map<String, dynamic> toJson() {
    final conversation = this.conversation;
    final problemStatement = this.problemStatement;
    return {
      if (conversation != null) 'conversation': conversation,
      if (problemStatement != null) 'problemStatement': problemStatement,
    };
  }
}

class PredictQAppOutput {
  /// The generated Q App definition.
  final PredictAppDefinition app;

  /// The problem statement extracted from the input conversation, if provided.
  final String problemStatement;

  PredictQAppOutput({
    required this.app,
    required this.problemStatement,
  });

  factory PredictQAppOutput.fromJson(Map<String, dynamic> json) {
    return PredictQAppOutput(
      app: PredictAppDefinition.fromJson(json['app'] as Map<String, dynamic>),
      problemStatement: json['problemStatement'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    final problemStatement = this.problemStatement;
    return {
      'app': app,
      'problemStatement': problemStatement,
    };
  }
}

/// A card in an Q App that integrates with a third-party plugin or service.
class QPluginCard {
  /// Any dependencies or requirements for the plugin card.
  final List<String> dependencies;

  /// The unique identifier of the plugin card.
  final String id;

  /// The unique identifier of the plugin used by the card.
  final String pluginId;

  /// The type or category of the plugin used by the card.
  final PluginType pluginType;

  /// The prompt or instructions displayed for the plugin card.
  final String prompt;

  /// The title or label of the plugin card.
  final String title;

  /// The type of the card.
  final CardType type;

  QPluginCard({
    required this.dependencies,
    required this.id,
    required this.pluginId,
    required this.pluginType,
    required this.prompt,
    required this.title,
    required this.type,
  });

  factory QPluginCard.fromJson(Map<String, dynamic> json) {
    return QPluginCard(
      dependencies: (json['dependencies'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String,
      pluginId: json['pluginId'] as String,
      pluginType: PluginType.fromString((json['pluginType'] as String)),
      prompt: json['prompt'] as String,
      title: json['title'] as String,
      type: CardType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final dependencies = this.dependencies;
    final id = this.id;
    final pluginId = this.pluginId;
    final pluginType = this.pluginType;
    final prompt = this.prompt;
    final title = this.title;
    final type = this.type;
    return {
      'dependencies': dependencies,
      'id': id,
      'pluginId': pluginId,
      'pluginType': pluginType.value,
      'prompt': prompt,
      'title': title,
      'type': type.value,
    };
  }
}

/// The input shape for defining a plugin card in an Amazon Q App.
class QPluginCardInput {
  /// The unique identifier of the plugin card.
  final String id;

  /// The unique identifier of the plugin used by the card.
  final String pluginId;

  /// The prompt or instructions displayed for the plugin card.
  final String prompt;

  /// The title or label of the plugin card.
  final String title;

  /// The type of the card.
  final CardType type;

  QPluginCardInput({
    required this.id,
    required this.pluginId,
    required this.prompt,
    required this.title,
    required this.type,
  });

  factory QPluginCardInput.fromJson(Map<String, dynamic> json) {
    return QPluginCardInput(
      id: json['id'] as String,
      pluginId: json['pluginId'] as String,
      prompt: json['prompt'] as String,
      title: json['title'] as String,
      type: CardType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final pluginId = this.pluginId;
    final prompt = this.prompt;
    final title = this.title;
    final type = this.type;
    return {
      'id': id,
      'pluginId': pluginId,
      'prompt': prompt,
      'title': title,
      'type': type.value,
    };
  }
}

/// A card in a Amazon Q App that generates a response based on the Amazon Q
/// Business service.
class QQueryCard {
  /// Any dependencies or requirements for the query card.
  final List<String> dependencies;

  /// The unique identifier of the query card.
  final String id;

  /// The source or type of output generated by the query card.
  final CardOutputSource outputSource;

  /// The prompt or instructions displayed for the query card.
  final String prompt;

  /// The title or label of the query card.
  final String title;

  /// The type of the card.
  final CardType type;

  /// The Amazon Q Business filters applied in this query card when resolving data
  /// sources
  final AttributeFilter? attributeFilter;

  QQueryCard({
    required this.dependencies,
    required this.id,
    required this.outputSource,
    required this.prompt,
    required this.title,
    required this.type,
    this.attributeFilter,
  });

  factory QQueryCard.fromJson(Map<String, dynamic> json) {
    return QQueryCard(
      dependencies: (json['dependencies'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String,
      outputSource:
          CardOutputSource.fromString((json['outputSource'] as String)),
      prompt: json['prompt'] as String,
      title: json['title'] as String,
      type: CardType.fromString((json['type'] as String)),
      attributeFilter: json['attributeFilter'] != null
          ? AttributeFilter.fromJson(
              json['attributeFilter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dependencies = this.dependencies;
    final id = this.id;
    final outputSource = this.outputSource;
    final prompt = this.prompt;
    final title = this.title;
    final type = this.type;
    final attributeFilter = this.attributeFilter;
    return {
      'dependencies': dependencies,
      'id': id,
      'outputSource': outputSource.value,
      'prompt': prompt,
      'title': title,
      'type': type.value,
      if (attributeFilter != null) 'attributeFilter': attributeFilter,
    };
  }
}

/// The input shape for defining a query card in an Amazon Q App.
class QQueryCardInput {
  /// The unique identifier of the query card.
  final String id;

  /// The prompt or instructions displayed for the query card.
  final String prompt;

  /// The title or label of the query card.
  final String title;

  /// The type of the card.
  final CardType type;

  /// Turns on filtering of responses based on document attributes or metadata
  /// fields.
  final AttributeFilter? attributeFilter;

  /// The source or type of output to generate for the query card.
  final CardOutputSource? outputSource;

  QQueryCardInput({
    required this.id,
    required this.prompt,
    required this.title,
    required this.type,
    this.attributeFilter,
    this.outputSource,
  });

  factory QQueryCardInput.fromJson(Map<String, dynamic> json) {
    return QQueryCardInput(
      id: json['id'] as String,
      prompt: json['prompt'] as String,
      title: json['title'] as String,
      type: CardType.fromString((json['type'] as String)),
      attributeFilter: json['attributeFilter'] != null
          ? AttributeFilter.fromJson(
              json['attributeFilter'] as Map<String, dynamic>)
          : null,
      outputSource:
          (json['outputSource'] as String?)?.let(CardOutputSource.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final prompt = this.prompt;
    final title = this.title;
    final type = this.type;
    final attributeFilter = this.attributeFilter;
    final outputSource = this.outputSource;
    return {
      'id': id,
      'prompt': prompt,
      'title': title,
      'type': type.value,
      if (attributeFilter != null) 'attributeFilter': attributeFilter,
      if (outputSource != null) 'outputSource': outputSource.value,
    };
  }
}

enum Sender {
  user('USER'),
  system('SYSTEM'),
  ;

  final String value;

  const Sender(this.value);

  static Sender fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Sender'));
}

class StartQAppSessionOutput {
  /// The Amazon Resource Name (ARN) of the new Q App session.
  final String sessionArn;

  /// The unique identifier of the new Q App session.
  final String sessionId;

  StartQAppSessionOutput({
    required this.sessionArn,
    required this.sessionId,
  });

  factory StartQAppSessionOutput.fromJson(Map<String, dynamic> json) {
    return StartQAppSessionOutput(
      sessionArn: json['sessionArn'] as String,
      sessionId: json['sessionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    return {
      'sessionArn': sessionArn,
      'sessionId': sessionId,
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

/// A card in an Amazon Q App that allows the user to input text.
class TextInputCard {
  /// Any dependencies or requirements for the text input card.
  final List<String> dependencies;

  /// The unique identifier of the text input card.
  final String id;

  /// The title or label of the text input card.
  final String title;

  /// The type of the card.
  final CardType type;

  /// The default value to pre-populate in the text input field.
  final String? defaultValue;

  /// The placeholder text to display in the text input field.
  final String? placeholder;

  TextInputCard({
    required this.dependencies,
    required this.id,
    required this.title,
    required this.type,
    this.defaultValue,
    this.placeholder,
  });

  factory TextInputCard.fromJson(Map<String, dynamic> json) {
    return TextInputCard(
      dependencies: (json['dependencies'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String,
      title: json['title'] as String,
      type: CardType.fromString((json['type'] as String)),
      defaultValue: json['defaultValue'] as String?,
      placeholder: json['placeholder'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dependencies = this.dependencies;
    final id = this.id;
    final title = this.title;
    final type = this.type;
    final defaultValue = this.defaultValue;
    final placeholder = this.placeholder;
    return {
      'dependencies': dependencies,
      'id': id,
      'title': title,
      'type': type.value,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (placeholder != null) 'placeholder': placeholder,
    };
  }
}

/// The input shape for defining a text input card in an Amazon Q App.
class TextInputCardInput {
  /// The unique identifier of the text input card.
  final String id;

  /// The title or label of the text input card.
  final String title;

  /// The type of the card.
  final CardType type;

  /// The default value to pre-populate in the text input field.
  final String? defaultValue;

  /// The placeholder text to display in the text input field.
  final String? placeholder;

  TextInputCardInput({
    required this.id,
    required this.title,
    required this.type,
    this.defaultValue,
    this.placeholder,
  });

  factory TextInputCardInput.fromJson(Map<String, dynamic> json) {
    return TextInputCardInput(
      id: json['id'] as String,
      title: json['title'] as String,
      type: CardType.fromString((json['type'] as String)),
      defaultValue: json['defaultValue'] as String?,
      placeholder: json['placeholder'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final title = this.title;
    final type = this.type;
    final defaultValue = this.defaultValue;
    final placeholder = this.placeholder;
    return {
      'id': id,
      'title': title,
      'type': type.value,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (placeholder != null) 'placeholder': placeholder,
    };
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

class UpdateLibraryItemOutput {
  /// The unique identifier of the Q App associated with the library item.
  final String appId;

  /// The version of the Q App associated with the library item.
  final int appVersion;

  /// The categories associated with the updated library item.
  final List<Category> categories;

  /// The date and time the library item was originally created.
  final DateTime createdAt;

  /// The user who originally created the library item.
  final String createdBy;

  /// The unique identifier of the updated library item.
  final String libraryItemId;

  /// The number of ratings the library item has received.
  final int ratingCount;

  /// The new status of the updated library item.
  final String status;

  /// Whether the current user has rated the library item.
  final bool? isRatedByUser;

  /// Indicates whether the library item has been verified.
  final bool? isVerified;

  /// The date and time the library item was last updated.
  final DateTime? updatedAt;

  /// The user who last updated the library item.
  final String? updatedBy;

  /// The number of users who have the associated Q App.
  final int? userCount;

  UpdateLibraryItemOutput({
    required this.appId,
    required this.appVersion,
    required this.categories,
    required this.createdAt,
    required this.createdBy,
    required this.libraryItemId,
    required this.ratingCount,
    required this.status,
    this.isRatedByUser,
    this.isVerified,
    this.updatedAt,
    this.updatedBy,
    this.userCount,
  });

  factory UpdateLibraryItemOutput.fromJson(Map<String, dynamic> json) {
    return UpdateLibraryItemOutput(
      appId: json['appId'] as String,
      appVersion: json['appVersion'] as int,
      categories: (json['categories'] as List)
          .nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      libraryItemId: json['libraryItemId'] as String,
      ratingCount: json['ratingCount'] as int,
      status: json['status'] as String,
      isRatedByUser: json['isRatedByUser'] as bool?,
      isVerified: json['isVerified'] as bool?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
      userCount: json['userCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final appVersion = this.appVersion;
    final categories = this.categories;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final libraryItemId = this.libraryItemId;
    final ratingCount = this.ratingCount;
    final status = this.status;
    final isRatedByUser = this.isRatedByUser;
    final isVerified = this.isVerified;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final userCount = this.userCount;
    return {
      'appId': appId,
      'appVersion': appVersion,
      'categories': categories,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'libraryItemId': libraryItemId,
      'ratingCount': ratingCount,
      'status': status,
      if (isRatedByUser != null) 'isRatedByUser': isRatedByUser,
      if (isVerified != null) 'isVerified': isVerified,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (userCount != null) 'userCount': userCount,
    };
  }
}

class UpdateQAppOutput {
  /// The Amazon Resource Name (ARN) of the updated Q App.
  final String appArn;

  /// The unique identifier of the updated Q App.
  final String appId;

  /// The new version of the updated Q App.
  final int appVersion;

  /// The date and time the Q App was originally created.
  final DateTime createdAt;

  /// The user who originally created the Q App.
  final String createdBy;

  /// The status of the updated Q App.
  final AppStatus status;

  /// The new title of the updated Q App.
  final String title;

  /// The date and time the Q App was last updated.
  final DateTime updatedAt;

  /// The user who last updated the Q App.
  final String updatedBy;

  /// The new description of the updated Q App.
  final String? description;

  /// The initial prompt for the updated Q App.
  final String? initialPrompt;

  /// The capabilities required for the updated Q App.
  final List<AppRequiredCapability>? requiredCapabilities;

  UpdateQAppOutput({
    required this.appArn,
    required this.appId,
    required this.appVersion,
    required this.createdAt,
    required this.createdBy,
    required this.status,
    required this.title,
    required this.updatedAt,
    required this.updatedBy,
    this.description,
    this.initialPrompt,
    this.requiredCapabilities,
  });

  factory UpdateQAppOutput.fromJson(Map<String, dynamic> json) {
    return UpdateQAppOutput(
      appArn: json['appArn'] as String,
      appId: json['appId'] as String,
      appVersion: json['appVersion'] as int,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      status: AppStatus.fromString((json['status'] as String)),
      title: json['title'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      updatedBy: json['updatedBy'] as String,
      description: json['description'] as String?,
      initialPrompt: json['initialPrompt'] as String?,
      requiredCapabilities: (json['requiredCapabilities'] as List?)
          ?.nonNulls
          .map((e) => AppRequiredCapability.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appId = this.appId;
    final appVersion = this.appVersion;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final status = this.status;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final description = this.description;
    final initialPrompt = this.initialPrompt;
    final requiredCapabilities = this.requiredCapabilities;
    return {
      'appArn': appArn,
      'appId': appId,
      'appVersion': appVersion,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'status': status.value,
      'title': title,
      'updatedAt': iso8601ToJson(updatedAt),
      'updatedBy': updatedBy,
      if (description != null) 'description': description,
      if (initialPrompt != null) 'initialPrompt': initialPrompt,
      if (requiredCapabilities != null)
        'requiredCapabilities':
            requiredCapabilities.map((e) => e.value).toList(),
    };
  }
}

class UpdateQAppSessionOutput {
  /// The Amazon Resource Name (ARN) of the updated Q App session.
  final String sessionArn;

  /// The unique identifier of the updated Q App session.
  final String sessionId;

  UpdateQAppSessionOutput({
    required this.sessionArn,
    required this.sessionId,
  });

  factory UpdateQAppSessionOutput.fromJson(Map<String, dynamic> json) {
    return UpdateQAppSessionOutput(
      sessionArn: json['sessionArn'] as String,
      sessionId: json['sessionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    return {
      'sessionArn': sessionArn,
      'sessionId': sessionId,
    };
  }
}

/// An Amazon Q App associated with a user, either owned by the user or
/// favorited.
class UserAppItem {
  /// The Amazon Resource Name (ARN) of the Q App.
  final String appArn;

  /// The unique identifier of the Q App.
  final String appId;

  /// The date and time the user's association with the Q App was created.
  final DateTime createdAt;

  /// The title of the Q App.
  final String title;

  /// A flag indicating whether the user can edit the Q App.
  final bool? canEdit;

  /// The description of the Q App.
  final String? description;

  /// Indicates whether the Q App has been verified.
  final bool? isVerified;

  /// The status of the user's association with the Q App.
  final String? status;

  UserAppItem({
    required this.appArn,
    required this.appId,
    required this.createdAt,
    required this.title,
    this.canEdit,
    this.description,
    this.isVerified,
    this.status,
  });

  factory UserAppItem.fromJson(Map<String, dynamic> json) {
    return UserAppItem(
      appArn: json['appArn'] as String,
      appId: json['appId'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      title: json['title'] as String,
      canEdit: json['canEdit'] as bool?,
      description: json['description'] as String?,
      isVerified: json['isVerified'] as bool?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appId = this.appId;
    final createdAt = this.createdAt;
    final title = this.title;
    final canEdit = this.canEdit;
    final description = this.description;
    final isVerified = this.isVerified;
    final status = this.status;
    return {
      'appArn': appArn,
      'appId': appId,
      'createdAt': iso8601ToJson(createdAt),
      'title': title,
      if (canEdit != null) 'canEdit': canEdit,
      if (description != null) 'description': description,
      if (isVerified != null) 'isVerified': isVerified,
      if (status != null) 'status': status,
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

class ContentTooLargeException extends _s.GenericAwsException {
  ContentTooLargeException({String? type, String? message})
      : super(type: type, code: 'ContentTooLargeException', message: message);
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

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
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
  'ContentTooLargeException': (type, message) =>
      ContentTooLargeException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
