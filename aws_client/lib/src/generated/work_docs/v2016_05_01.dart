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

/// The Amazon WorkDocs API is designed for the following use cases:
///
/// <ul>
/// <li>
/// File Migration: File migration applications are supported for users who want
/// to migrate their files from an on-premises or off-premises file system or
/// service. Users can insert files into a user directory structure, as well as
/// allow for basic metadata changes, such as modifications to the permissions
/// of files.
/// </li>
/// <li>
/// Security: Support security applications are supported for users who have
/// additional security needs, such as antivirus or data loss prevention. The
/// API actions, along with CloudTrail, allow these applications to detect when
/// changes occur in Amazon WorkDocs. Then, the application can take the
/// necessary actions and replace the target file. If the target file violates
/// the policy, the application can also choose to email the user.
/// </li>
/// <li>
/// eDiscovery/Analytics: General administrative applications are supported,
/// such as eDiscovery and analytics. These applications can choose to mimic or
/// record the actions in an Amazon WorkDocs site, along with CloudTrail, to
/// replicate data for eDiscovery, backup, or analytical applications.
/// </li>
/// </ul>
/// All Amazon WorkDocs API actions are Amazon authenticated and
/// certificate-signed. They not only require the use of the Amazon Web Services
/// SDK, but also allow for the exclusive use of IAM users and roles to help
/// facilitate access, trust, and permission policies. By creating a role and
/// allowing an IAM user to access the Amazon WorkDocs site, the IAM user gains
/// full administrative visibility into the entire Amazon WorkDocs site (or as
/// set in the IAM policy). This includes, but is not limited to, the ability to
/// modify file permissions and upload any file to any user. This allows
/// developers to perform the three use cases above, as well as give users the
/// ability to grant access on a selective basis using the IAM model.
/// <note>
/// The pricing for Amazon WorkDocs APIs varies depending on the API call type
/// for these actions:
///
/// <ul>
/// <li>
/// <code>READ (Get*)</code>
/// </li>
/// <li>
/// <code>WRITE (Activate*, Add*, Create*, Deactivate*, Initiate*,
/// Update*)</code>
/// </li>
/// <li>
/// <code>LIST (Describe*)</code>
/// </li>
/// <li>
/// <code>DELETE*, CANCEL</code>
/// </li>
/// </ul>
/// For information about Amazon WorkDocs API pricing, see <a
/// href="https://aws.amazon.com/workdocs/pricing/">Amazon WorkDocs Pricing</a>.
/// </note>
class WorkDocs {
  final _s.RestJsonProtocol _protocol;
  WorkDocs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'workdocs',
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

  /// Aborts the upload of the specified document version that was previously
  /// initiated by <a>InitiateDocumentVersionUpload</a>. The client should make
  /// this call only when it no longer intends to upload the document version,
  /// or fails to do so.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [versionId] :
  /// The ID of the version.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<void> abortDocumentVersionUpload({
    required String documentId,
    required String versionId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/v1/documents/${Uri.encodeComponent(documentId)}/versions/${Uri.encodeComponent(versionId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Activates the specified user. Only active users can access Amazon
  /// WorkDocs.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<ActivateUserResponse> activateUser({
    required String userId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/api/v1/users/${Uri.encodeComponent(userId)}/activation',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ActivateUserResponse.fromJson(response);
  }

  /// Creates a set of permissions for the specified folder or document. The
  /// resource permissions are overwritten if the principals already have
  /// different permissions.
  ///
  /// May throw [FailedDependencyException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [principals] :
  /// The users, groups, or organization being granted permission.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [notificationOptions] :
  /// The notification options.
  Future<AddResourcePermissionsResponse> addResourcePermissions({
    required List<SharePrincipal> principals,
    required String resourceId,
    String? authenticationToken,
    NotificationOptions? notificationOptions,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      'Principals': principals,
      if (notificationOptions != null)
        'NotificationOptions': notificationOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/api/v1/resources/${Uri.encodeComponent(resourceId)}/permissions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return AddResourcePermissionsResponse.fromJson(response);
  }

  /// Adds a new comment to the specified document version.
  ///
  /// May throw [DocumentLockedForCommentsException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidCommentOperationException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [text] :
  /// The text of the comment.
  ///
  /// Parameter [versionId] :
  /// The ID of the document version.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [notifyCollaborators] :
  /// Set this parameter to TRUE to send an email out to the document
  /// collaborators after the comment is created.
  ///
  /// Parameter [parentId] :
  /// The ID of the parent comment.
  ///
  /// Parameter [threadId] :
  /// The ID of the root comment in the thread.
  ///
  /// Parameter [visibility] :
  /// The visibility of the comment. Options are either PRIVATE, where the
  /// comment is visible only to the comment author and document owner and
  /// co-owners, or PUBLIC, where the comment is visible to document owners,
  /// co-owners, and contributors.
  Future<CreateCommentResponse> createComment({
    required String documentId,
    required String text,
    required String versionId,
    String? authenticationToken,
    bool? notifyCollaborators,
    String? parentId,
    String? threadId,
    CommentVisibilityType? visibility,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      'Text': text,
      if (notifyCollaborators != null)
        'NotifyCollaborators': notifyCollaborators,
      if (parentId != null) 'ParentId': parentId,
      if (threadId != null) 'ThreadId': threadId,
      if (visibility != null) 'Visibility': visibility.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/api/v1/documents/${Uri.encodeComponent(documentId)}/versions/${Uri.encodeComponent(versionId)}/comment',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateCommentResponse.fromJson(response);
  }

  /// Adds one or more custom properties to the specified resource (a folder,
  /// document, or version).
  ///
  /// May throw [CustomMetadataLimitExceededException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [customMetadata] :
  /// Custom metadata in the form of name-value pairs.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [versionId] :
  /// The ID of the version, if the custom metadata is being added to a document
  /// version.
  Future<void> createCustomMetadata({
    required Map<String, String> customMetadata,
    required String resourceId,
    String? authenticationToken,
    String? versionId,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (versionId != null) 'versionid': [versionId],
    };
    final $payload = <String, dynamic>{
      'CustomMetadata': customMetadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/api/v1/resources/${Uri.encodeComponent(resourceId)}/customMetadata',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a folder with the specified name and parent folder.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ConflictingOperationException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [LimitExceededException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [parentFolderId] :
  /// The ID of the parent folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [name] :
  /// The name of the new folder.
  Future<CreateFolderResponse> createFolder({
    required String parentFolderId,
    String? authenticationToken,
    String? name,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ParentFolderId': parentFolderId,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/api/v1/folders',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateFolderResponse.fromJson(response);
  }

  /// Adds the specified list of labels to the given resource (a document or
  /// folder)
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyLabelsException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [labels] :
  /// List of labels to add to the resource.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<void> createLabels({
    required List<String> labels,
    required String resourceId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      'Labels': labels,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/api/v1/resources/${Uri.encodeComponent(resourceId)}/labels',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Configure Amazon WorkDocs to use Amazon SNS notifications. The endpoint
  /// receives a confirmation message, and must confirm the subscription.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/workdocs/latest/developerguide/manage-notifications.html">Setting
  /// up notifications for an IAM user or role</a> in the <i>Amazon WorkDocs
  /// Developer Guide</i>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManySubscriptionsException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [endpoint] :
  /// The endpoint to receive the notifications. If the protocol is HTTPS, the
  /// endpoint is a URL that begins with <code>https</code>.
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization.
  ///
  /// Parameter [protocol] :
  /// The protocol to use. The supported value is https, which delivers
  /// JSON-encoded messages using HTTPS POST.
  ///
  /// Parameter [subscriptionType] :
  /// The notification type.
  Future<CreateNotificationSubscriptionResponse>
      createNotificationSubscription({
    required String endpoint,
    required String organizationId,
    required SubscriptionProtocolType protocol,
    required SubscriptionType subscriptionType,
  }) async {
    final $payload = <String, dynamic>{
      'Endpoint': endpoint,
      'Protocol': protocol.value,
      'SubscriptionType': subscriptionType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/api/v1/organizations/${Uri.encodeComponent(organizationId)}/subscriptions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNotificationSubscriptionResponse.fromJson(response);
  }

  /// Creates a user in a Simple AD or Microsoft AD directory. The status of a
  /// newly created user is "ACTIVE". New users can access Amazon WorkDocs.
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [givenName] :
  /// The given name of the user.
  ///
  /// Parameter [password] :
  /// The password of the user.
  ///
  /// Parameter [surname] :
  /// The surname of the user.
  ///
  /// Parameter [username] :
  /// The login name of the user.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [emailAddress] :
  /// The email address of the user.
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization.
  ///
  /// Parameter [storageRule] :
  /// The amount of storage for the user.
  ///
  /// Parameter [timeZoneId] :
  /// The time zone ID of the user.
  Future<CreateUserResponse> createUser({
    required String givenName,
    required String password,
    required String surname,
    required String username,
    String? authenticationToken,
    String? emailAddress,
    String? organizationId,
    StorageRuleType? storageRule,
    String? timeZoneId,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      'GivenName': givenName,
      'Password': password,
      'Surname': surname,
      'Username': username,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (organizationId != null) 'OrganizationId': organizationId,
      if (storageRule != null) 'StorageRule': storageRule,
      if (timeZoneId != null) 'TimeZoneId': timeZoneId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/api/v1/users',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserResponse.fromJson(response);
  }

  /// Deactivates the specified user, which revokes the user's access to Amazon
  /// WorkDocs.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<void> deactivateUser({
    required String userId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/api/v1/users/${Uri.encodeComponent(userId)}/activation',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified comment from the document version.
  ///
  /// May throw [DocumentLockedForCommentsException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [commentId] :
  /// The ID of the comment.
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [versionId] :
  /// The ID of the document version.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<void> deleteComment({
    required String commentId,
    required String documentId,
    required String versionId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/v1/documents/${Uri.encodeComponent(documentId)}/versions/${Uri.encodeComponent(versionId)}/comment/${Uri.encodeComponent(commentId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes custom metadata from the specified resource.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource, either a document or folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [deleteAll] :
  /// Flag to indicate removal of all custom metadata properties from the
  /// specified resource.
  ///
  /// Parameter [keys] :
  /// List of properties to remove.
  ///
  /// Parameter [versionId] :
  /// The ID of the version, if the custom metadata is being deleted from a
  /// document version.
  Future<void> deleteCustomMetadata({
    required String resourceId,
    String? authenticationToken,
    bool? deleteAll,
    List<String>? keys,
    String? versionId,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (deleteAll != null) 'deleteAll': [deleteAll.toString()],
      if (keys != null) 'keys': keys,
      if (versionId != null) 'versionId': [versionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/v1/resources/${Uri.encodeComponent(resourceId)}/customMetadata',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Permanently deletes the specified document and its associated metadata.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ConflictingOperationException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [LimitExceededException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<void> deleteDocument({
    required String documentId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/api/v1/documents/${Uri.encodeComponent(documentId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specific version of a document.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ConflictingOperationException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidOperationException].
  /// May throw [ProhibitedStateException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [deletePriorVersions] :
  /// Deletes all versions of a document prior to the current version.
  ///
  /// Parameter [documentId] :
  /// The ID of the document associated with the version being deleted.
  ///
  /// Parameter [versionId] :
  /// The ID of the version being deleted.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<void> deleteDocumentVersion({
    required bool deletePriorVersions,
    required String documentId,
    required String versionId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      'deletePriorVersions': [deletePriorVersions.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/v1/documentVersions/${Uri.encodeComponent(documentId)}/versions/${Uri.encodeComponent(versionId)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Permanently deletes the specified folder and its contents.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ConflictingOperationException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [LimitExceededException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<void> deleteFolder({
    required String folderId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/api/v1/folders/${Uri.encodeComponent(folderId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the contents of the specified folder.
  ///
  /// May throw [ConflictingOperationException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<void> deleteFolderContents({
    required String folderId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/api/v1/folders/${Uri.encodeComponent(folderId)}/contents',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified list of labels from a resource.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [deleteAll] :
  /// Flag to request removal of all labels from the specified resource.
  ///
  /// Parameter [labels] :
  /// List of labels to delete from the resource.
  Future<void> deleteLabels({
    required String resourceId,
    String? authenticationToken,
    bool? deleteAll,
    List<String>? labels,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (deleteAll != null) 'deleteAll': [deleteAll.toString()],
      if (labels != null) 'labels': labels,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/api/v1/resources/${Uri.encodeComponent(resourceId)}/labels',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified subscription from the specified organization.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization.
  ///
  /// Parameter [subscriptionId] :
  /// The ID of the subscription.
  Future<void> deleteNotificationSubscription({
    required String organizationId,
    required String subscriptionId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/v1/organizations/${Uri.encodeComponent(organizationId)}/subscriptions/${Uri.encodeComponent(subscriptionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified user from a Simple AD or Microsoft AD directory.
  /// <important>
  /// Deleting a user immediately and permanently deletes all content in that
  /// user's folder structure. Site retention policies do NOT apply to this type
  /// of deletion.
  /// </important>
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Do not set this field when using
  /// administrative API actions, as in accessing the API using Amazon Web
  /// Services credentials.
  Future<void> deleteUser({
    required String userId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/api/v1/users/${Uri.encodeComponent(userId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes the user activities in a specified time period.
  ///
  /// May throw [FailedDependencyException].
  /// May throw [InvalidArgumentException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [activityTypes] :
  /// Specifies which activity types to include in the response. If this field
  /// is left empty, all activity types are returned.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [endTime] :
  /// The timestamp that determines the end time of the activities. The response
  /// includes the activities performed before the specified timestamp.
  ///
  /// Parameter [includeIndirectActivities] :
  /// Includes indirect activities. An indirect activity results from a direct
  /// activity performed on a parent resource. For example, sharing a parent
  /// folder (the direct activity) shares all of the subfolders and documents
  /// within the parent folder (the indirect activity).
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization. This is a mandatory parameter when using
  /// administrative API (SigV4) requests.
  ///
  /// Parameter [resourceId] :
  /// The document or folder ID for which to describe activity types.
  ///
  /// Parameter [startTime] :
  /// The timestamp that determines the starting time of the activities. The
  /// response includes the activities performed after the specified timestamp.
  ///
  /// Parameter [userId] :
  /// The ID of the user who performed the action. The response includes
  /// activities pertaining to this user. This is an optional parameter and is
  /// only applicable for administrative API (SigV4) requests.
  Future<DescribeActivitiesResponse> describeActivities({
    String? activityTypes,
    String? authenticationToken,
    DateTime? endTime,
    bool? includeIndirectActivities,
    int? limit,
    String? marker,
    String? organizationId,
    String? resourceId,
    DateTime? startTime,
    String? userId,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (activityTypes != null) 'activityTypes': [activityTypes],
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (includeIndirectActivities != null)
        'includeIndirectActivities': [includeIndirectActivities.toString()],
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
      if (organizationId != null) 'organizationId': [organizationId],
      if (resourceId != null) 'resourceId': [resourceId],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (userId != null) 'userId': [userId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/activities',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeActivitiesResponse.fromJson(response);
  }

  /// List all the comments for the specified document version.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [versionId] :
  /// The ID of the document version.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. This marker was received from a
  /// previous call.
  Future<DescribeCommentsResponse> describeComments({
    required String documentId,
    required String versionId,
    String? authenticationToken,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/v1/documents/${Uri.encodeComponent(documentId)}/versions/${Uri.encodeComponent(versionId)}/comments',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCommentsResponse.fromJson(response);
  }

  /// Retrieves the document versions for the specified document.
  ///
  /// By default, only active versions are returned.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidPasswordException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [fields] :
  /// Specify "SOURCE" to include initialized versions and a URL for the source
  /// document.
  ///
  /// Parameter [include] :
  /// A comma-separated list of values. Specify "INITIALIZED" to include
  /// incomplete versions.
  ///
  /// Parameter [limit] :
  /// The maximum number of versions to return with this call.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  Future<DescribeDocumentVersionsResponse> describeDocumentVersions({
    required String documentId,
    String? authenticationToken,
    String? fields,
    String? include,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (fields != null) 'fields': [fields],
      if (include != null) 'include': [include],
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/v1/documents/${Uri.encodeComponent(documentId)}/versions',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDocumentVersionsResponse.fromJson(response);
  }

  /// Describes the contents of the specified folder, including its documents
  /// and subfolders.
  ///
  /// By default, Amazon WorkDocs returns the first 100 active document and
  /// folder metadata items. If there are more results, the response includes a
  /// marker that you can use to request the next set of results. You can also
  /// request initialized documents.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidArgumentException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [include] :
  /// The contents to include. Specify "INITIALIZED" to include initialized
  /// documents.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. This marker was received from a
  /// previous call.
  ///
  /// Parameter [order] :
  /// The order for the contents of the folder.
  ///
  /// Parameter [sort] :
  /// The sorting criteria.
  ///
  /// Parameter [type] :
  /// The type of items.
  Future<DescribeFolderContentsResponse> describeFolderContents({
    required String folderId,
    String? authenticationToken,
    String? include,
    int? limit,
    String? marker,
    OrderType? order,
    ResourceSortType? sort,
    FolderContentType? type,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (include != null) 'include': [include],
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
      if (order != null) 'order': [order.value],
      if (sort != null) 'sort': [sort.value],
      if (type != null) 'type': [type.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/folders/${Uri.encodeComponent(folderId)}/contents',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFolderContentsResponse.fromJson(response);
  }

  /// Describes the groups specified by the query. Groups are defined by the
  /// underlying Active Directory.
  ///
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [searchQuery] :
  /// A query to describe groups by group name.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization.
  Future<DescribeGroupsResponse> describeGroups({
    required String searchQuery,
    String? authenticationToken,
    int? limit,
    String? marker,
    String? organizationId,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      'searchQuery': [searchQuery],
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
      if (organizationId != null) 'organizationId': [organizationId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/groups',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGroupsResponse.fromJson(response);
  }

  /// Lists the specified notification subscriptions.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  Future<DescribeNotificationSubscriptionsResponse>
      describeNotificationSubscriptions({
    required String organizationId,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/v1/organizations/${Uri.encodeComponent(organizationId)}/subscriptions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeNotificationSubscriptionsResponse.fromJson(response);
  }

  /// Describes the permissions of a specified resource.
  ///
  /// May throw [FailedDependencyException].
  /// May throw [InvalidArgumentException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return with this call.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call)
  ///
  /// Parameter [principalId] :
  /// The ID of the principal to filter permissions by.
  Future<DescribeResourcePermissionsResponse> describeResourcePermissions({
    required String resourceId,
    String? authenticationToken,
    int? limit,
    String? marker,
    String? principalId,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
      if (principalId != null) 'principalId': [principalId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/v1/resources/${Uri.encodeComponent(resourceId)}/permissions',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeResourcePermissionsResponse.fromJson(response);
  }

  /// Describes the current user's special folders; the <code>RootFolder</code>
  /// and the <code>RecycleBin</code>. <code>RootFolder</code> is the root of
  /// user's files and folders and <code>RecycleBin</code> is the root of
  /// recycled items. This is not a valid action for SigV4 (administrative API)
  /// clients.
  ///
  /// This action requires an authentication token. To get an authentication
  /// token, register an application with Amazon WorkDocs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/workdocs/latest/developerguide/wd-auth-user.html">Authentication
  /// and Access Control for User Applications</a> in the <i>Amazon WorkDocs
  /// Developer Guide</i>.
  ///
  /// May throw [FailedDependencyException].
  /// May throw [InvalidArgumentException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  Future<DescribeRootFoldersResponse> describeRootFolders({
    required String authenticationToken,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final headers = <String, String>{
      'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/me/root',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRootFoldersResponse.fromJson(response);
  }

  /// Describes the specified users. You can describe all users or filter the
  /// results (for example, by status or organization).
  ///
  /// By default, Amazon WorkDocs returns the first 24 active or pending users.
  /// If there are more results, the response includes a marker that you can use
  /// to request the next set of results.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidArgumentException].
  /// May throw [RequestedEntityTooLargeException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [fields] :
  /// A comma-separated list of values. Specify "STORAGE_METADATA" to include
  /// the user storage quota and utilization information.
  ///
  /// Parameter [include] :
  /// The state of the users. Specify "ALL" to include inactive users.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [order] :
  /// The order for the results.
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization.
  ///
  /// Parameter [query] :
  /// A query to filter users by user name. Remember the following about the
  /// <code>Userids</code> and <code>Query</code> parameters:
  ///
  /// <ul>
  /// <li>
  /// If you don't use either parameter, the API returns a paginated list of all
  /// users on the site.
  /// </li>
  /// <li>
  /// If you use both parameters, the API ignores the <code>Query</code>
  /// parameter.
  /// </li>
  /// <li>
  /// The <code>Userid</code> parameter only returns user names that match a
  /// corresponding user ID.
  /// </li>
  /// <li>
  /// The <code>Query</code> parameter runs a "prefix" search for users by the
  /// <code>GivenName</code>, <code>SurName</code>, or <code>UserName</code>
  /// fields included in a <a
  /// href="https://docs.aws.amazon.com/workdocs/latest/APIReference/API_CreateUser.html">CreateUser</a>
  /// API call. For example, querying on <code>Ma</code> returns Márcia
  /// Oliveira, María García, and Mateo Jackson. If you use multiple characters,
  /// the API only returns data that matches all characters. For example,
  /// querying on <code>Ma J</code> only returns Mateo Jackson.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sort] :
  /// The sorting criteria.
  ///
  /// Parameter [userIds] :
  /// The IDs of the users.
  Future<DescribeUsersResponse> describeUsers({
    String? authenticationToken,
    String? fields,
    UserFilterType? include,
    int? limit,
    String? marker,
    OrderType? order,
    String? organizationId,
    String? query,
    UserSortType? sort,
    String? userIds,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (fields != null) 'fields': [fields],
      if (include != null) 'include': [include.value],
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
      if (order != null) 'order': [order.value],
      if (organizationId != null) 'organizationId': [organizationId],
      if (query != null) 'query': [query],
      if (sort != null) 'sort': [sort.value],
      if (userIds != null) 'userIds': [userIds],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/users',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUsersResponse.fromJson(response);
  }

  /// Retrieves details of the current user for whom the authentication token
  /// was generated. This is not a valid action for SigV4 (administrative API)
  /// clients.
  ///
  /// This action requires an authentication token. To get an authentication
  /// token, register an application with Amazon WorkDocs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/workdocs/latest/developerguide/wd-auth-user.html">Authentication
  /// and Access Control for User Applications</a> in the <i>Amazon WorkDocs
  /// Developer Guide</i>.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token.
  Future<GetCurrentUserResponse> getCurrentUser({
    required String authenticationToken,
  }) async {
    final headers = <String, String>{
      'Authentication': authenticationToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/me',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetCurrentUserResponse.fromJson(response);
  }

  /// Retrieves details of a document.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidPasswordException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [includeCustomMetadata] :
  /// Set this to <code>TRUE</code> to include custom metadata in the response.
  Future<GetDocumentResponse> getDocument({
    required String documentId,
    String? authenticationToken,
    bool? includeCustomMetadata,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (includeCustomMetadata != null)
        'includeCustomMetadata': [includeCustomMetadata.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/documents/${Uri.encodeComponent(documentId)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetDocumentResponse.fromJson(response);
  }

  /// Retrieves the path information (the hierarchy from the root folder) for
  /// the requested document.
  ///
  /// By default, Amazon WorkDocs returns a maximum of 100 levels upwards from
  /// the requested document and only includes the IDs of the parent folders in
  /// the path. You can limit the maximum number of levels. You can also request
  /// the names of the parent folders.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [fields] :
  /// A comma-separated list of values. Specify <code>NAME</code> to include the
  /// names of the parent folders.
  ///
  /// Parameter [limit] :
  /// The maximum number of levels in the hierarchy to return.
  ///
  /// Parameter [marker] :
  /// This value is not supported.
  Future<GetDocumentPathResponse> getDocumentPath({
    required String documentId,
    String? authenticationToken,
    String? fields,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (fields != null) 'fields': [fields],
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/documents/${Uri.encodeComponent(documentId)}/path',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetDocumentPathResponse.fromJson(response);
  }

  /// Retrieves version metadata for the specified document.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidPasswordException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [versionId] :
  /// The version ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [fields] :
  /// A comma-separated list of values. Specify "SOURCE" to include a URL for
  /// the source document.
  ///
  /// Parameter [includeCustomMetadata] :
  /// Set this to TRUE to include custom metadata in the response.
  Future<GetDocumentVersionResponse> getDocumentVersion({
    required String documentId,
    required String versionId,
    String? authenticationToken,
    String? fields,
    bool? includeCustomMetadata,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (fields != null) 'fields': [fields],
      if (includeCustomMetadata != null)
        'includeCustomMetadata': [includeCustomMetadata.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/v1/documents/${Uri.encodeComponent(documentId)}/versions/${Uri.encodeComponent(versionId)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetDocumentVersionResponse.fromJson(response);
  }

  /// Retrieves the metadata of the specified folder.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidArgumentException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [includeCustomMetadata] :
  /// Set to TRUE to include custom metadata in the response.
  Future<GetFolderResponse> getFolder({
    required String folderId,
    String? authenticationToken,
    bool? includeCustomMetadata,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (includeCustomMetadata != null)
        'includeCustomMetadata': [includeCustomMetadata.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/folders/${Uri.encodeComponent(folderId)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetFolderResponse.fromJson(response);
  }

  /// Retrieves the path information (the hierarchy from the root folder) for
  /// the specified folder.
  ///
  /// By default, Amazon WorkDocs returns a maximum of 100 levels upwards from
  /// the requested folder and only includes the IDs of the parent folders in
  /// the path. You can limit the maximum number of levels. You can also request
  /// the parent folder names.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [fields] :
  /// A comma-separated list of values. Specify "NAME" to include the names of
  /// the parent folders.
  ///
  /// Parameter [limit] :
  /// The maximum number of levels in the hierarchy to return.
  ///
  /// Parameter [marker] :
  /// This value is not supported.
  Future<GetFolderPathResponse> getFolderPath({
    required String folderId,
    String? authenticationToken,
    String? fields,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (fields != null) 'fields': [fields],
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/folders/${Uri.encodeComponent(folderId)}/path',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetFolderPathResponse.fromJson(response);
  }

  /// Retrieves a collection of resources, including folders and documents. The
  /// only <code>CollectionType</code> supported is <code>SHARED_WITH_ME</code>.
  ///
  /// May throw [FailedDependencyException].
  /// May throw [InvalidArgumentException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [authenticationToken] :
  /// The Amazon WorkDocs authentication token. Not required when using Amazon
  /// Web Services administrator credentials to access the API.
  ///
  /// Parameter [collectionType] :
  /// The collection type.
  ///
  /// Parameter [limit] :
  /// The maximum number of resources to return.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. This marker was received from a
  /// previous call.
  ///
  /// Parameter [userId] :
  /// The user ID for the resource collection. This is a required field for
  /// accessing the API operation using IAM credentials.
  Future<GetResourcesResponse> getResources({
    String? authenticationToken,
    ResourceCollectionType? collectionType,
    int? limit,
    String? marker,
    String? userId,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (collectionType != null) 'collectionType': [collectionType.value],
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
      if (userId != null) 'userId': [userId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v1/resources',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcesResponse.fromJson(response);
  }

  /// Creates a new document object and version object.
  ///
  /// The client specifies the parent folder ID and name of the document to
  /// upload. The ID is optionally specified when creating a new version of an
  /// existing document. This is the first step to upload a document. Next,
  /// upload the document to the URL returned from the call, and then call
  /// <a>UpdateDocumentVersion</a>.
  ///
  /// To cancel the document upload, call <a>AbortDocumentVersionUpload</a>.
  ///
  /// May throw [DraftUploadOutOfSyncException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidPasswordException].
  /// May throw [LimitExceededException].
  /// May throw [ProhibitedStateException].
  /// May throw [ResourceAlreadyCheckedOutException].
  /// May throw [ServiceUnavailableException].
  /// May throw [StorageLimitExceededException].
  /// May throw [StorageLimitWillExceedException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [contentCreatedTimestamp] :
  /// The timestamp when the content of the document was originally created.
  ///
  /// Parameter [contentModifiedTimestamp] :
  /// The timestamp when the content of the document was modified.
  ///
  /// Parameter [contentType] :
  /// The content type of the document.
  ///
  /// Parameter [documentSizeInBytes] :
  /// The size of the document, in bytes.
  ///
  /// Parameter [id] :
  /// The ID of the document.
  ///
  /// Parameter [name] :
  /// The name of the document.
  ///
  /// Parameter [parentFolderId] :
  /// The ID of the parent folder.
  Future<InitiateDocumentVersionUploadResponse> initiateDocumentVersionUpload({
    String? authenticationToken,
    DateTime? contentCreatedTimestamp,
    DateTime? contentModifiedTimestamp,
    String? contentType,
    int? documentSizeInBytes,
    String? id,
    String? name,
    String? parentFolderId,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (contentCreatedTimestamp != null)
        'ContentCreatedTimestamp': unixTimestampToJson(contentCreatedTimestamp),
      if (contentModifiedTimestamp != null)
        'ContentModifiedTimestamp':
            unixTimestampToJson(contentModifiedTimestamp),
      if (contentType != null) 'ContentType': contentType,
      if (documentSizeInBytes != null)
        'DocumentSizeInBytes': documentSizeInBytes,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (parentFolderId != null) 'ParentFolderId': parentFolderId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/api/v1/documents',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return InitiateDocumentVersionUploadResponse.fromJson(response);
  }

  /// Removes all the permissions from the specified resource.
  ///
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<void> removeAllResourcePermissions({
    required String resourceId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/v1/resources/${Uri.encodeComponent(resourceId)}/permissions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the permission for the specified principal from the specified
  /// resource.
  ///
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [principalId] :
  /// The principal ID of the resource.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [principalType] :
  /// The principal type of the resource.
  Future<void> removeResourcePermission({
    required String principalId,
    required String resourceId,
    String? authenticationToken,
    PrincipalType? principalType,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (principalType != null) 'type': [principalType.value],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/v1/resources/${Uri.encodeComponent(resourceId)}/permissions/${Uri.encodeComponent(principalId)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Recovers a deleted version of an Amazon WorkDocs document.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ConflictingOperationException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidOperationException].
  /// May throw [ProhibitedStateException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  Future<void> restoreDocumentVersions({
    required String documentId,
    String? authenticationToken,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/api/v1/documentVersions/restore/${Uri.encodeComponent(documentId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Searches metadata and the content of folders, documents, document
  /// versions, and comments.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [additionalResponseFields] :
  /// A list of attributes to include in the response. Used to request fields
  /// that are not normally returned in a standard response.
  ///
  /// Parameter [authenticationToken] :
  /// WorkDocs authentication token. Not required when using Amazon Web Services
  /// administrator credentials to access the API.
  ///
  /// Parameter [filters] :
  /// Filters results based on entity metadata.
  ///
  /// Parameter [limit] :
  /// Max results count per page.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [orderBy] :
  /// Order by results in one or more categories.
  ///
  /// Parameter [organizationId] :
  /// Filters based on the resource owner OrgId. This is a mandatory parameter
  /// when using Admin SigV4 credentials.
  ///
  /// Parameter [queryScopes] :
  /// Filter based on the text field type. A Folder has only a name and no
  /// content. A Comment has only content and no name. A Document or Document
  /// Version has a name and content
  ///
  /// Parameter [queryText] :
  /// The String to search for. Searches across different text fields based on
  /// request parameters. Use double quotes around the query string for exact
  /// phrase matches.
  Future<SearchResourcesResponse> searchResources({
    List<AdditionalResponseFieldType>? additionalResponseFields,
    String? authenticationToken,
    Filters? filters,
    int? limit,
    String? marker,
    List<SearchSortResult>? orderBy,
    String? organizationId,
    List<SearchQueryScopeType>? queryScopes,
    String? queryText,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (additionalResponseFields != null)
        'AdditionalResponseFields':
            additionalResponseFields.map((e) => e.value).toList(),
      if (filters != null) 'Filters': filters,
      if (limit != null) 'Limit': limit,
      if (marker != null) 'Marker': marker,
      if (orderBy != null) 'OrderBy': orderBy,
      if (organizationId != null) 'OrganizationId': organizationId,
      if (queryScopes != null)
        'QueryScopes': queryScopes.map((e) => e.value).toList(),
      if (queryText != null) 'QueryText': queryText,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/api/v1/search',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return SearchResourcesResponse.fromJson(response);
  }

  /// Updates the specified attributes of a document. The user must have access
  /// to both the document and its parent folder, if applicable.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ConflictingOperationException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [LimitExceededException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [name] :
  /// The name of the document.
  ///
  /// Parameter [parentFolderId] :
  /// The ID of the parent folder.
  ///
  /// Parameter [resourceState] :
  /// The resource state of the document. Only ACTIVE and RECYCLED are
  /// supported.
  Future<void> updateDocument({
    required String documentId,
    String? authenticationToken,
    String? name,
    String? parentFolderId,
    ResourceStateType? resourceState,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
      if (parentFolderId != null) 'ParentFolderId': parentFolderId,
      if (resourceState != null) 'ResourceState': resourceState.value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/api/v1/documents/${Uri.encodeComponent(documentId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Changes the status of the document version to ACTIVE.
  ///
  /// Amazon WorkDocs also sets its document container to ACTIVE. This is the
  /// last step in a document upload, after the client uploads the document to
  /// an S3-presigned URL returned by <a>InitiateDocumentVersionUpload</a>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [InvalidOperationException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [versionId] :
  /// The version ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [versionStatus] :
  /// The status of the version.
  Future<void> updateDocumentVersion({
    required String documentId,
    required String versionId,
    String? authenticationToken,
    DocumentVersionStatus? versionStatus,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (versionStatus != null) 'VersionStatus': versionStatus.value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/api/v1/documents/${Uri.encodeComponent(documentId)}/versions/${Uri.encodeComponent(versionId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified attributes of the specified folder. The user must
  /// have access to both the folder and its parent folder, if applicable.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ConflictingOperationException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [LimitExceededException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [name] :
  /// The name of the folder.
  ///
  /// Parameter [parentFolderId] :
  /// The ID of the parent folder.
  ///
  /// Parameter [resourceState] :
  /// The resource state of the folder. Only ACTIVE and RECYCLED are accepted
  /// values from the API.
  Future<void> updateFolder({
    required String folderId,
    String? authenticationToken,
    String? name,
    String? parentFolderId,
    ResourceStateType? resourceState,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
      if (parentFolderId != null) 'ParentFolderId': parentFolderId,
      if (resourceState != null) 'ResourceState': resourceState.value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/api/v1/folders/${Uri.encodeComponent(folderId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified attributes of the specified user, and grants or
  /// revokes administrative privileges to the Amazon WorkDocs site.
  ///
  /// May throw [DeactivatingLastSystemUserException].
  /// May throw [EntityNotExistsException].
  /// May throw [FailedDependencyException].
  /// May throw [IllegalUserStateException].
  /// May throw [InvalidArgumentException].
  /// May throw [ProhibitedStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using Amazon Web
  /// Services administrator credentials to access the API.
  ///
  /// Parameter [givenName] :
  /// The given name of the user.
  ///
  /// Parameter [grantPoweruserPrivileges] :
  /// Boolean value to determine whether the user is granted Power user
  /// privileges.
  ///
  /// Parameter [locale] :
  /// The locale of the user.
  ///
  /// Parameter [storageRule] :
  /// The amount of storage for the user.
  ///
  /// Parameter [surname] :
  /// The surname of the user.
  ///
  /// Parameter [timeZoneId] :
  /// The time zone ID of the user.
  ///
  /// Parameter [type] :
  /// The type of the user.
  Future<UpdateUserResponse> updateUser({
    required String userId,
    String? authenticationToken,
    String? givenName,
    BooleanEnumType? grantPoweruserPrivileges,
    LocaleType? locale,
    StorageRuleType? storageRule,
    String? surname,
    String? timeZoneId,
    UserType? type,
  }) async {
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (givenName != null) 'GivenName': givenName,
      if (grantPoweruserPrivileges != null)
        'GrantPoweruserPrivileges': grantPoweruserPrivileges.value,
      if (locale != null) 'Locale': locale.value,
      if (storageRule != null) 'StorageRule': storageRule,
      if (surname != null) 'Surname': surname,
      if (timeZoneId != null) 'TimeZoneId': timeZoneId,
      if (type != null) 'Type': type.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/api/v1/users/${Uri.encodeComponent(userId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserResponse.fromJson(response);
  }
}

/// @nodoc
class ActivateUserResponse {
  /// The user information.
  final User? user;

  ActivateUserResponse({
    this.user,
  });

  factory ActivateUserResponse.fromJson(Map<String, dynamic> json) {
    return ActivateUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

/// @nodoc
class AddResourcePermissionsResponse {
  /// The share results.
  final List<ShareResult>? shareResults;

  AddResourcePermissionsResponse({
    this.shareResults,
  });

  factory AddResourcePermissionsResponse.fromJson(Map<String, dynamic> json) {
    return AddResourcePermissionsResponse(
      shareResults: (json['ShareResults'] as List?)
          ?.nonNulls
          .map((e) => ShareResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final shareResults = this.shareResults;
    return {
      if (shareResults != null) 'ShareResults': shareResults,
    };
  }
}

/// @nodoc
class CreateCommentResponse {
  /// The comment that has been created.
  final Comment? comment;

  CreateCommentResponse({
    this.comment,
  });

  factory CreateCommentResponse.fromJson(Map<String, dynamic> json) {
    return CreateCommentResponse(
      comment: json['Comment'] != null
          ? Comment.fromJson(json['Comment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    return {
      if (comment != null) 'Comment': comment,
    };
  }
}

/// @nodoc
class CreateCustomMetadataResponse {
  CreateCustomMetadataResponse();

  factory CreateCustomMetadataResponse.fromJson(Map<String, dynamic> _) {
    return CreateCustomMetadataResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateFolderResponse {
  /// The metadata of the folder.
  final FolderMetadata? metadata;

  CreateFolderResponse({
    this.metadata,
  });

  factory CreateFolderResponse.fromJson(Map<String, dynamic> json) {
    return CreateFolderResponse(
      metadata: json['Metadata'] != null
          ? FolderMetadata.fromJson(json['Metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    return {
      if (metadata != null) 'Metadata': metadata,
    };
  }
}

/// @nodoc
class CreateLabelsResponse {
  CreateLabelsResponse();

  factory CreateLabelsResponse.fromJson(Map<String, dynamic> _) {
    return CreateLabelsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateNotificationSubscriptionResponse {
  /// The subscription.
  final Subscription? subscription;

  CreateNotificationSubscriptionResponse({
    this.subscription,
  });

  factory CreateNotificationSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateNotificationSubscriptionResponse(
      subscription: json['Subscription'] != null
          ? Subscription.fromJson(json['Subscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscription = this.subscription;
    return {
      if (subscription != null) 'Subscription': subscription,
    };
  }
}

/// @nodoc
class CreateUserResponse {
  /// The user information.
  final User? user;

  CreateUserResponse({
    this.user,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

/// @nodoc
class DeleteCustomMetadataResponse {
  DeleteCustomMetadataResponse();

  factory DeleteCustomMetadataResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCustomMetadataResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteLabelsResponse {
  DeleteLabelsResponse();

  factory DeleteLabelsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLabelsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DescribeActivitiesResponse {
  /// The marker for the next set of results.
  final String? marker;

  /// The list of activities for the specified user and time period.
  final List<Activity>? userActivities;

  DescribeActivitiesResponse({
    this.marker,
    this.userActivities,
  });

  factory DescribeActivitiesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeActivitiesResponse(
      marker: json['Marker'] as String?,
      userActivities: (json['UserActivities'] as List?)
          ?.nonNulls
          .map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final userActivities = this.userActivities;
    return {
      if (marker != null) 'Marker': marker,
      if (userActivities != null) 'UserActivities': userActivities,
    };
  }
}

/// @nodoc
class DescribeCommentsResponse {
  /// The list of comments for the specified document version.
  final List<Comment>? comments;

  /// The marker for the next set of results. This marker was received from a
  /// previous call.
  final String? marker;

  DescribeCommentsResponse({
    this.comments,
    this.marker,
  });

  factory DescribeCommentsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCommentsResponse(
      comments: (json['Comments'] as List?)
          ?.nonNulls
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comments = this.comments;
    final marker = this.marker;
    return {
      if (comments != null) 'Comments': comments,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// @nodoc
class DescribeDocumentVersionsResponse {
  /// The document versions.
  final List<DocumentVersionMetadata>? documentVersions;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String? marker;

  DescribeDocumentVersionsResponse({
    this.documentVersions,
    this.marker,
  });

  factory DescribeDocumentVersionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDocumentVersionsResponse(
      documentVersions: (json['DocumentVersions'] as List?)
          ?.nonNulls
          .map((e) =>
              DocumentVersionMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentVersions = this.documentVersions;
    final marker = this.marker;
    return {
      if (documentVersions != null) 'DocumentVersions': documentVersions,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// @nodoc
class DescribeFolderContentsResponse {
  /// The documents in the specified folder.
  final List<DocumentMetadata>? documents;

  /// The subfolders in the specified folder.
  final List<FolderMetadata>? folders;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String? marker;

  DescribeFolderContentsResponse({
    this.documents,
    this.folders,
    this.marker,
  });

  factory DescribeFolderContentsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFolderContentsResponse(
      documents: (json['Documents'] as List?)
          ?.nonNulls
          .map((e) => DocumentMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      folders: (json['Folders'] as List?)
          ?.nonNulls
          .map((e) => FolderMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documents = this.documents;
    final folders = this.folders;
    final marker = this.marker;
    return {
      if (documents != null) 'Documents': documents,
      if (folders != null) 'Folders': folders,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// @nodoc
class DescribeGroupsResponse {
  /// The list of groups.
  final List<GroupMetadata>? groups;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String? marker;

  DescribeGroupsResponse({
    this.groups,
    this.marker,
  });

  factory DescribeGroupsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGroupsResponse(
      groups: (json['Groups'] as List?)
          ?.nonNulls
          .map((e) => GroupMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final marker = this.marker;
    return {
      if (groups != null) 'Groups': groups,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// @nodoc
class DescribeNotificationSubscriptionsResponse {
  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String? marker;

  /// The subscriptions.
  final List<Subscription>? subscriptions;

  DescribeNotificationSubscriptionsResponse({
    this.marker,
    this.subscriptions,
  });

  factory DescribeNotificationSubscriptionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeNotificationSubscriptionsResponse(
      marker: json['Marker'] as String?,
      subscriptions: (json['Subscriptions'] as List?)
          ?.nonNulls
          .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final subscriptions = this.subscriptions;
    return {
      if (marker != null) 'Marker': marker,
      if (subscriptions != null) 'Subscriptions': subscriptions,
    };
  }
}

/// @nodoc
class DescribeResourcePermissionsResponse {
  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String? marker;

  /// The principals.
  final List<Principal>? principals;

  DescribeResourcePermissionsResponse({
    this.marker,
    this.principals,
  });

  factory DescribeResourcePermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeResourcePermissionsResponse(
      marker: json['Marker'] as String?,
      principals: (json['Principals'] as List?)
          ?.nonNulls
          .map((e) => Principal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final principals = this.principals;
    return {
      if (marker != null) 'Marker': marker,
      if (principals != null) 'Principals': principals,
    };
  }
}

/// @nodoc
class DescribeRootFoldersResponse {
  /// The user's special folders.
  final List<FolderMetadata>? folders;

  /// The marker for the next set of results.
  final String? marker;

  DescribeRootFoldersResponse({
    this.folders,
    this.marker,
  });

  factory DescribeRootFoldersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRootFoldersResponse(
      folders: (json['Folders'] as List?)
          ?.nonNulls
          .map((e) => FolderMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final folders = this.folders;
    final marker = this.marker;
    return {
      if (folders != null) 'Folders': folders,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// @nodoc
class DescribeUsersResponse {
  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String? marker;

  /// The total number of users included in the results.
  final int? totalNumberOfUsers;

  /// The users.
  final List<User>? users;

  DescribeUsersResponse({
    this.marker,
    this.totalNumberOfUsers,
    this.users,
  });

  factory DescribeUsersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUsersResponse(
      marker: json['Marker'] as String?,
      totalNumberOfUsers: json['TotalNumberOfUsers'] as int?,
      users: (json['Users'] as List?)
          ?.nonNulls
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final totalNumberOfUsers = this.totalNumberOfUsers;
    final users = this.users;
    return {
      if (marker != null) 'Marker': marker,
      if (totalNumberOfUsers != null) 'TotalNumberOfUsers': totalNumberOfUsers,
      if (users != null) 'Users': users,
    };
  }
}

/// @nodoc
class GetCurrentUserResponse {
  /// Metadata of the user.
  final User? user;

  GetCurrentUserResponse({
    this.user,
  });

  factory GetCurrentUserResponse.fromJson(Map<String, dynamic> json) {
    return GetCurrentUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

/// @nodoc
class GetDocumentResponse {
  /// The custom metadata on the document.
  final Map<String, String>? customMetadata;

  /// The metadata details of the document.
  final DocumentMetadata? metadata;

  GetDocumentResponse({
    this.customMetadata,
    this.metadata,
  });

  factory GetDocumentResponse.fromJson(Map<String, dynamic> json) {
    return GetDocumentResponse(
      customMetadata: (json['CustomMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      metadata: json['Metadata'] != null
          ? DocumentMetadata.fromJson(json['Metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customMetadata = this.customMetadata;
    final metadata = this.metadata;
    return {
      if (customMetadata != null) 'CustomMetadata': customMetadata,
      if (metadata != null) 'Metadata': metadata,
    };
  }
}

/// @nodoc
class GetDocumentPathResponse {
  /// The path information.
  final ResourcePath? path;

  GetDocumentPathResponse({
    this.path,
  });

  factory GetDocumentPathResponse.fromJson(Map<String, dynamic> json) {
    return GetDocumentPathResponse(
      path: json['Path'] != null
          ? ResourcePath.fromJson(json['Path'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    return {
      if (path != null) 'Path': path,
    };
  }
}

/// @nodoc
class GetDocumentVersionResponse {
  /// The custom metadata on the document version.
  final Map<String, String>? customMetadata;

  /// The version metadata.
  final DocumentVersionMetadata? metadata;

  GetDocumentVersionResponse({
    this.customMetadata,
    this.metadata,
  });

  factory GetDocumentVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetDocumentVersionResponse(
      customMetadata: (json['CustomMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      metadata: json['Metadata'] != null
          ? DocumentVersionMetadata.fromJson(
              json['Metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customMetadata = this.customMetadata;
    final metadata = this.metadata;
    return {
      if (customMetadata != null) 'CustomMetadata': customMetadata,
      if (metadata != null) 'Metadata': metadata,
    };
  }
}

/// @nodoc
class GetFolderResponse {
  /// The custom metadata on the folder.
  final Map<String, String>? customMetadata;

  /// The metadata of the folder.
  final FolderMetadata? metadata;

  GetFolderResponse({
    this.customMetadata,
    this.metadata,
  });

  factory GetFolderResponse.fromJson(Map<String, dynamic> json) {
    return GetFolderResponse(
      customMetadata: (json['CustomMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      metadata: json['Metadata'] != null
          ? FolderMetadata.fromJson(json['Metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customMetadata = this.customMetadata;
    final metadata = this.metadata;
    return {
      if (customMetadata != null) 'CustomMetadata': customMetadata,
      if (metadata != null) 'Metadata': metadata,
    };
  }
}

/// @nodoc
class GetFolderPathResponse {
  /// The path information.
  final ResourcePath? path;

  GetFolderPathResponse({
    this.path,
  });

  factory GetFolderPathResponse.fromJson(Map<String, dynamic> json) {
    return GetFolderPathResponse(
      path: json['Path'] != null
          ? ResourcePath.fromJson(json['Path'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    return {
      if (path != null) 'Path': path,
    };
  }
}

/// @nodoc
class GetResourcesResponse {
  /// The documents in the specified collection.
  final List<DocumentMetadata>? documents;

  /// The folders in the specified folder.
  final List<FolderMetadata>? folders;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String? marker;

  GetResourcesResponse({
    this.documents,
    this.folders,
    this.marker,
  });

  factory GetResourcesResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcesResponse(
      documents: (json['Documents'] as List?)
          ?.nonNulls
          .map((e) => DocumentMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      folders: (json['Folders'] as List?)
          ?.nonNulls
          .map((e) => FolderMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documents = this.documents;
    final folders = this.folders;
    final marker = this.marker;
    return {
      if (documents != null) 'Documents': documents,
      if (folders != null) 'Folders': folders,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// @nodoc
class InitiateDocumentVersionUploadResponse {
  /// The document metadata.
  final DocumentMetadata? metadata;

  /// The upload metadata.
  final UploadMetadata? uploadMetadata;

  InitiateDocumentVersionUploadResponse({
    this.metadata,
    this.uploadMetadata,
  });

  factory InitiateDocumentVersionUploadResponse.fromJson(
      Map<String, dynamic> json) {
    return InitiateDocumentVersionUploadResponse(
      metadata: json['Metadata'] != null
          ? DocumentMetadata.fromJson(json['Metadata'] as Map<String, dynamic>)
          : null,
      uploadMetadata: json['UploadMetadata'] != null
          ? UploadMetadata.fromJson(
              json['UploadMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final uploadMetadata = this.uploadMetadata;
    return {
      if (metadata != null) 'Metadata': metadata,
      if (uploadMetadata != null) 'UploadMetadata': uploadMetadata,
    };
  }
}

/// @nodoc
class SearchResourcesResponse {
  /// List of Documents, Folders, Comments, and Document Versions matching the
  /// query.
  final List<ResponseItem>? items;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String? marker;

  SearchResourcesResponse({
    this.items,
    this.marker,
  });

  factory SearchResourcesResponse.fromJson(Map<String, dynamic> json) {
    return SearchResourcesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final marker = this.marker;
    return {
      if (items != null) 'Items': items,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// @nodoc
class UpdateUserResponse {
  /// The user information.
  final User? user;

  UpdateUserResponse({
    this.user,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

/// Describes a user.
///
/// @nodoc
class User {
  /// The time when the user was created.
  final DateTime? createdTimestamp;

  /// The email address of the user.
  final String? emailAddress;

  /// The given name of the user.
  final String? givenName;

  /// The ID of the user.
  final String? id;

  /// The locale of the user.
  final LocaleType? locale;

  /// The time when the user was modified.
  final DateTime? modifiedTimestamp;

  /// The ID of the organization.
  final String? organizationId;

  /// The ID of the recycle bin folder.
  final String? recycleBinFolderId;

  /// The ID of the root folder.
  final String? rootFolderId;

  /// The status of the user.
  final UserStatusType? status;

  /// The storage for the user.
  final UserStorageMetadata? storage;

  /// The surname of the user.
  final String? surname;

  /// The time zone ID of the user.
  final String? timeZoneId;

  /// The type of user.
  final UserType? type;

  /// The login name of the user.
  final String? username;

  User({
    this.createdTimestamp,
    this.emailAddress,
    this.givenName,
    this.id,
    this.locale,
    this.modifiedTimestamp,
    this.organizationId,
    this.recycleBinFolderId,
    this.rootFolderId,
    this.status,
    this.storage,
    this.surname,
    this.timeZoneId,
    this.type,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      emailAddress: json['EmailAddress'] as String?,
      givenName: json['GivenName'] as String?,
      id: json['Id'] as String?,
      locale: (json['Locale'] as String?)?.let(LocaleType.fromString),
      modifiedTimestamp: timeStampFromJson(json['ModifiedTimestamp']),
      organizationId: json['OrganizationId'] as String?,
      recycleBinFolderId: json['RecycleBinFolderId'] as String?,
      rootFolderId: json['RootFolderId'] as String?,
      status: (json['Status'] as String?)?.let(UserStatusType.fromString),
      storage: json['Storage'] != null
          ? UserStorageMetadata.fromJson(
              json['Storage'] as Map<String, dynamic>)
          : null,
      surname: json['Surname'] as String?,
      timeZoneId: json['TimeZoneId'] as String?,
      type: (json['Type'] as String?)?.let(UserType.fromString),
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final emailAddress = this.emailAddress;
    final givenName = this.givenName;
    final id = this.id;
    final locale = this.locale;
    final modifiedTimestamp = this.modifiedTimestamp;
    final organizationId = this.organizationId;
    final recycleBinFolderId = this.recycleBinFolderId;
    final rootFolderId = this.rootFolderId;
    final status = this.status;
    final storage = this.storage;
    final surname = this.surname;
    final timeZoneId = this.timeZoneId;
    final type = this.type;
    final username = this.username;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (givenName != null) 'GivenName': givenName,
      if (id != null) 'Id': id,
      if (locale != null) 'Locale': locale.value,
      if (modifiedTimestamp != null)
        'ModifiedTimestamp': unixTimestampToJson(modifiedTimestamp),
      if (organizationId != null) 'OrganizationId': organizationId,
      if (recycleBinFolderId != null) 'RecycleBinFolderId': recycleBinFolderId,
      if (rootFolderId != null) 'RootFolderId': rootFolderId,
      if (status != null) 'Status': status.value,
      if (storage != null) 'Storage': storage,
      if (surname != null) 'Surname': surname,
      if (timeZoneId != null) 'TimeZoneId': timeZoneId,
      if (type != null) 'Type': type.value,
      if (username != null) 'Username': username,
    };
  }
}

/// @nodoc
class UserStatusType {
  static const active = UserStatusType._('ACTIVE');
  static const inactive = UserStatusType._('INACTIVE');
  static const pending = UserStatusType._('PENDING');

  final String value;

  const UserStatusType._(this.value);

  static const values = [active, inactive, pending];

  static UserStatusType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UserStatusType._(value));

  @override
  bool operator ==(other) => other is UserStatusType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class UserType {
  static const user = UserType._('USER');
  static const admin = UserType._('ADMIN');
  static const poweruser = UserType._('POWERUSER');
  static const minimaluser = UserType._('MINIMALUSER');
  static const workspacesuser = UserType._('WORKSPACESUSER');

  final String value;

  const UserType._(this.value);

  static const values = [user, admin, poweruser, minimaluser, workspacesuser];

  static UserType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UserType._(value));

  @override
  bool operator ==(other) => other is UserType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LocaleType {
  static const en = LocaleType._('en');
  static const fr = LocaleType._('fr');
  static const ko = LocaleType._('ko');
  static const de = LocaleType._('de');
  static const es = LocaleType._('es');
  static const ja = LocaleType._('ja');
  static const ru = LocaleType._('ru');
  static const zhCn = LocaleType._('zh_CN');
  static const zhTw = LocaleType._('zh_TW');
  static const ptBr = LocaleType._('pt_BR');
  static const $default = LocaleType._('default');

  final String value;

  const LocaleType._(this.value);

  static const values = [
    en,
    fr,
    ko,
    de,
    es,
    ja,
    ru,
    zhCn,
    zhTw,
    ptBr,
    $default
  ];

  static LocaleType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LocaleType._(value));

  @override
  bool operator ==(other) => other is LocaleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the storage for a user.
///
/// @nodoc
class UserStorageMetadata {
  /// The storage for a user.
  final StorageRuleType? storageRule;

  /// The amount of storage used, in bytes.
  final int? storageUtilizedInBytes;

  UserStorageMetadata({
    this.storageRule,
    this.storageUtilizedInBytes,
  });

  factory UserStorageMetadata.fromJson(Map<String, dynamic> json) {
    return UserStorageMetadata(
      storageRule: json['StorageRule'] != null
          ? StorageRuleType.fromJson(
              json['StorageRule'] as Map<String, dynamic>)
          : null,
      storageUtilizedInBytes: json['StorageUtilizedInBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final storageRule = this.storageRule;
    final storageUtilizedInBytes = this.storageUtilizedInBytes;
    return {
      if (storageRule != null) 'StorageRule': storageRule,
      if (storageUtilizedInBytes != null)
        'StorageUtilizedInBytes': storageUtilizedInBytes,
    };
  }
}

/// Describes the storage for a user.
///
/// @nodoc
class StorageRuleType {
  /// The amount of storage allocated, in bytes.
  final int? storageAllocatedInBytes;

  /// The type of storage.
  final StorageType? storageType;

  StorageRuleType({
    this.storageAllocatedInBytes,
    this.storageType,
  });

  factory StorageRuleType.fromJson(Map<String, dynamic> json) {
    return StorageRuleType(
      storageAllocatedInBytes: json['StorageAllocatedInBytes'] as int?,
      storageType:
          (json['StorageType'] as String?)?.let(StorageType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final storageAllocatedInBytes = this.storageAllocatedInBytes;
    final storageType = this.storageType;
    return {
      if (storageAllocatedInBytes != null)
        'StorageAllocatedInBytes': storageAllocatedInBytes,
      if (storageType != null) 'StorageType': storageType.value,
    };
  }
}

/// @nodoc
class StorageType {
  static const unlimited = StorageType._('UNLIMITED');
  static const quota = StorageType._('QUOTA');

  final String value;

  const StorageType._(this.value);

  static const values = [unlimited, quota];

  static StorageType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StorageType._(value));

  @override
  bool operator ==(other) => other is StorageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BooleanEnumType {
  static const $true = BooleanEnumType._('TRUE');
  static const $false = BooleanEnumType._('FALSE');

  final String value;

  const BooleanEnumType._(this.value);

  static const values = [$true, $false];

  static BooleanEnumType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BooleanEnumType._(value));

  @override
  bool operator ==(other) => other is BooleanEnumType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResourceStateType {
  static const active = ResourceStateType._('ACTIVE');
  static const restoring = ResourceStateType._('RESTORING');
  static const recycling = ResourceStateType._('RECYCLING');
  static const recycled = ResourceStateType._('RECYCLED');

  final String value;

  const ResourceStateType._(this.value);

  static const values = [active, restoring, recycling, recycled];

  static ResourceStateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceStateType._(value));

  @override
  bool operator ==(other) => other is ResourceStateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DocumentVersionStatus {
  static const active = DocumentVersionStatus._('ACTIVE');

  final String value;

  const DocumentVersionStatus._(this.value);

  static const values = [active];

  static DocumentVersionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentVersionStatus._(value));

  @override
  bool operator ==(other) =>
      other is DocumentVersionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// List of Documents, Folders, Comments, and Document Versions matching the
/// query.
///
/// @nodoc
class ResponseItem {
  /// The comment that matches the query.
  final CommentMetadata? commentMetadata;

  /// The document that matches the query.
  final DocumentMetadata? documentMetadata;

  /// The document version that matches the metadata.
  final DocumentVersionMetadata? documentVersionMetadata;

  /// The folder that matches the query.
  final FolderMetadata? folderMetadata;

  /// The type of item being returned.
  final ResponseItemType? resourceType;

  /// The webUrl of the item being returned.
  final String? webUrl;

  ResponseItem({
    this.commentMetadata,
    this.documentMetadata,
    this.documentVersionMetadata,
    this.folderMetadata,
    this.resourceType,
    this.webUrl,
  });

  factory ResponseItem.fromJson(Map<String, dynamic> json) {
    return ResponseItem(
      commentMetadata: json['CommentMetadata'] != null
          ? CommentMetadata.fromJson(
              json['CommentMetadata'] as Map<String, dynamic>)
          : null,
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      documentVersionMetadata: json['DocumentVersionMetadata'] != null
          ? DocumentVersionMetadata.fromJson(
              json['DocumentVersionMetadata'] as Map<String, dynamic>)
          : null,
      folderMetadata: json['FolderMetadata'] != null
          ? FolderMetadata.fromJson(
              json['FolderMetadata'] as Map<String, dynamic>)
          : null,
      resourceType:
          (json['ResourceType'] as String?)?.let(ResponseItemType.fromString),
      webUrl: json['WebUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commentMetadata = this.commentMetadata;
    final documentMetadata = this.documentMetadata;
    final documentVersionMetadata = this.documentVersionMetadata;
    final folderMetadata = this.folderMetadata;
    final resourceType = this.resourceType;
    final webUrl = this.webUrl;
    return {
      if (commentMetadata != null) 'CommentMetadata': commentMetadata,
      if (documentMetadata != null) 'DocumentMetadata': documentMetadata,
      if (documentVersionMetadata != null)
        'DocumentVersionMetadata': documentVersionMetadata,
      if (folderMetadata != null) 'FolderMetadata': folderMetadata,
      if (resourceType != null) 'ResourceType': resourceType.value,
      if (webUrl != null) 'WebUrl': webUrl,
    };
  }
}

/// @nodoc
class ResponseItemType {
  static const document = ResponseItemType._('DOCUMENT');
  static const folder = ResponseItemType._('FOLDER');
  static const comment = ResponseItemType._('COMMENT');
  static const documentVersion = ResponseItemType._('DOCUMENT_VERSION');

  final String value;

  const ResponseItemType._(this.value);

  static const values = [document, folder, comment, documentVersion];

  static ResponseItemType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResponseItemType._(value));

  @override
  bool operator ==(other) => other is ResponseItemType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the document.
///
/// @nodoc
class DocumentMetadata {
  /// The time when the document was created.
  final DateTime? createdTimestamp;

  /// The ID of the creator.
  final String? creatorId;

  /// The ID of the document.
  final String? id;

  /// List of labels on the document.
  final List<String>? labels;

  /// The latest version of the document.
  final DocumentVersionMetadata? latestVersionMetadata;

  /// The time when the document was updated.
  final DateTime? modifiedTimestamp;

  /// The ID of the parent folder.
  final String? parentFolderId;

  /// The resource state.
  final ResourceStateType? resourceState;

  DocumentMetadata({
    this.createdTimestamp,
    this.creatorId,
    this.id,
    this.labels,
    this.latestVersionMetadata,
    this.modifiedTimestamp,
    this.parentFolderId,
    this.resourceState,
  });

  factory DocumentMetadata.fromJson(Map<String, dynamic> json) {
    return DocumentMetadata(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      creatorId: json['CreatorId'] as String?,
      id: json['Id'] as String?,
      labels:
          (json['Labels'] as List?)?.nonNulls.map((e) => e as String).toList(),
      latestVersionMetadata: json['LatestVersionMetadata'] != null
          ? DocumentVersionMetadata.fromJson(
              json['LatestVersionMetadata'] as Map<String, dynamic>)
          : null,
      modifiedTimestamp: timeStampFromJson(json['ModifiedTimestamp']),
      parentFolderId: json['ParentFolderId'] as String?,
      resourceState:
          (json['ResourceState'] as String?)?.let(ResourceStateType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final creatorId = this.creatorId;
    final id = this.id;
    final labels = this.labels;
    final latestVersionMetadata = this.latestVersionMetadata;
    final modifiedTimestamp = this.modifiedTimestamp;
    final parentFolderId = this.parentFolderId;
    final resourceState = this.resourceState;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (creatorId != null) 'CreatorId': creatorId,
      if (id != null) 'Id': id,
      if (labels != null) 'Labels': labels,
      if (latestVersionMetadata != null)
        'LatestVersionMetadata': latestVersionMetadata,
      if (modifiedTimestamp != null)
        'ModifiedTimestamp': unixTimestampToJson(modifiedTimestamp),
      if (parentFolderId != null) 'ParentFolderId': parentFolderId,
      if (resourceState != null) 'ResourceState': resourceState.value,
    };
  }
}

/// Describes a folder.
///
/// @nodoc
class FolderMetadata {
  /// The time when the folder was created.
  final DateTime? createdTimestamp;

  /// The ID of the creator.
  final String? creatorId;

  /// The ID of the folder.
  final String? id;

  /// List of labels on the folder.
  final List<String>? labels;

  /// The size of the latest version of the folder metadata.
  final int? latestVersionSize;

  /// The time when the folder was updated.
  final DateTime? modifiedTimestamp;

  /// The name of the folder.
  final String? name;

  /// The ID of the parent folder.
  final String? parentFolderId;

  /// The resource state of the folder.
  final ResourceStateType? resourceState;

  /// The unique identifier created from the subfolders and documents of the
  /// folder.
  final String? signature;

  /// The size of the folder metadata.
  final int? size;

  FolderMetadata({
    this.createdTimestamp,
    this.creatorId,
    this.id,
    this.labels,
    this.latestVersionSize,
    this.modifiedTimestamp,
    this.name,
    this.parentFolderId,
    this.resourceState,
    this.signature,
    this.size,
  });

  factory FolderMetadata.fromJson(Map<String, dynamic> json) {
    return FolderMetadata(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      creatorId: json['CreatorId'] as String?,
      id: json['Id'] as String?,
      labels:
          (json['Labels'] as List?)?.nonNulls.map((e) => e as String).toList(),
      latestVersionSize: json['LatestVersionSize'] as int?,
      modifiedTimestamp: timeStampFromJson(json['ModifiedTimestamp']),
      name: json['Name'] as String?,
      parentFolderId: json['ParentFolderId'] as String?,
      resourceState:
          (json['ResourceState'] as String?)?.let(ResourceStateType.fromString),
      signature: json['Signature'] as String?,
      size: json['Size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final creatorId = this.creatorId;
    final id = this.id;
    final labels = this.labels;
    final latestVersionSize = this.latestVersionSize;
    final modifiedTimestamp = this.modifiedTimestamp;
    final name = this.name;
    final parentFolderId = this.parentFolderId;
    final resourceState = this.resourceState;
    final signature = this.signature;
    final size = this.size;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (creatorId != null) 'CreatorId': creatorId,
      if (id != null) 'Id': id,
      if (labels != null) 'Labels': labels,
      if (latestVersionSize != null) 'LatestVersionSize': latestVersionSize,
      if (modifiedTimestamp != null)
        'ModifiedTimestamp': unixTimestampToJson(modifiedTimestamp),
      if (name != null) 'Name': name,
      if (parentFolderId != null) 'ParentFolderId': parentFolderId,
      if (resourceState != null) 'ResourceState': resourceState.value,
      if (signature != null) 'Signature': signature,
      if (size != null) 'Size': size,
    };
  }
}

/// Describes the metadata of a comment.
///
/// @nodoc
class CommentMetadata {
  /// The ID of the comment.
  final String? commentId;

  /// The status of the comment.
  final CommentStatusType? commentStatus;

  /// The user who made the comment.
  final User? contributor;

  /// The ID of the user who made the comment.
  final String? contributorId;

  /// The timestamp that the comment was created.
  final DateTime? createdTimestamp;

  /// The ID of the user being replied to.
  final String? recipientId;

  CommentMetadata({
    this.commentId,
    this.commentStatus,
    this.contributor,
    this.contributorId,
    this.createdTimestamp,
    this.recipientId,
  });

  factory CommentMetadata.fromJson(Map<String, dynamic> json) {
    return CommentMetadata(
      commentId: json['CommentId'] as String?,
      commentStatus:
          (json['CommentStatus'] as String?)?.let(CommentStatusType.fromString),
      contributor: json['Contributor'] != null
          ? User.fromJson(json['Contributor'] as Map<String, dynamic>)
          : null,
      contributorId: json['ContributorId'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      recipientId: json['RecipientId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commentId = this.commentId;
    final commentStatus = this.commentStatus;
    final contributor = this.contributor;
    final contributorId = this.contributorId;
    final createdTimestamp = this.createdTimestamp;
    final recipientId = this.recipientId;
    return {
      if (commentId != null) 'CommentId': commentId,
      if (commentStatus != null) 'CommentStatus': commentStatus.value,
      if (contributor != null) 'Contributor': contributor,
      if (contributorId != null) 'ContributorId': contributorId,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (recipientId != null) 'RecipientId': recipientId,
    };
  }
}

/// Describes a version of a document.
///
/// @nodoc
class DocumentVersionMetadata {
  /// The timestamp when the content of the document was originally created.
  final DateTime? contentCreatedTimestamp;

  /// The timestamp when the content of the document was modified.
  final DateTime? contentModifiedTimestamp;

  /// The content type of the document.
  final String? contentType;

  /// The timestamp when the document was first uploaded.
  final DateTime? createdTimestamp;

  /// The ID of the creator.
  final String? creatorId;

  /// The ID of the version.
  final String? id;

  /// The timestamp when the document was last uploaded.
  final DateTime? modifiedTimestamp;

  /// The name of the version.
  final String? name;

  /// The signature of the document.
  final String? signature;

  /// The size of the document, in bytes.
  final int? size;

  /// The source of the document.
  final Map<DocumentSourceType, String>? source;

  /// The status of the document.
  final DocumentStatusType? status;

  /// The thumbnail of the document.
  final Map<DocumentThumbnailType, String>? thumbnail;

  DocumentVersionMetadata({
    this.contentCreatedTimestamp,
    this.contentModifiedTimestamp,
    this.contentType,
    this.createdTimestamp,
    this.creatorId,
    this.id,
    this.modifiedTimestamp,
    this.name,
    this.signature,
    this.size,
    this.source,
    this.status,
    this.thumbnail,
  });

  factory DocumentVersionMetadata.fromJson(Map<String, dynamic> json) {
    return DocumentVersionMetadata(
      contentCreatedTimestamp:
          timeStampFromJson(json['ContentCreatedTimestamp']),
      contentModifiedTimestamp:
          timeStampFromJson(json['ContentModifiedTimestamp']),
      contentType: json['ContentType'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      creatorId: json['CreatorId'] as String?,
      id: json['Id'] as String?,
      modifiedTimestamp: timeStampFromJson(json['ModifiedTimestamp']),
      name: json['Name'] as String?,
      signature: json['Signature'] as String?,
      size: json['Size'] as int?,
      source: (json['Source'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(DocumentSourceType.fromString(k), e as String)),
      status: (json['Status'] as String?)?.let(DocumentStatusType.fromString),
      thumbnail: (json['Thumbnail'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(DocumentThumbnailType.fromString(k), e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final contentCreatedTimestamp = this.contentCreatedTimestamp;
    final contentModifiedTimestamp = this.contentModifiedTimestamp;
    final contentType = this.contentType;
    final createdTimestamp = this.createdTimestamp;
    final creatorId = this.creatorId;
    final id = this.id;
    final modifiedTimestamp = this.modifiedTimestamp;
    final name = this.name;
    final signature = this.signature;
    final size = this.size;
    final source = this.source;
    final status = this.status;
    final thumbnail = this.thumbnail;
    return {
      if (contentCreatedTimestamp != null)
        'ContentCreatedTimestamp': unixTimestampToJson(contentCreatedTimestamp),
      if (contentModifiedTimestamp != null)
        'ContentModifiedTimestamp':
            unixTimestampToJson(contentModifiedTimestamp),
      if (contentType != null) 'ContentType': contentType,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (creatorId != null) 'CreatorId': creatorId,
      if (id != null) 'Id': id,
      if (modifiedTimestamp != null)
        'ModifiedTimestamp': unixTimestampToJson(modifiedTimestamp),
      if (name != null) 'Name': name,
      if (signature != null) 'Signature': signature,
      if (size != null) 'Size': size,
      if (source != null) 'Source': source.map((k, e) => MapEntry(k.value, e)),
      if (status != null) 'Status': status.value,
      if (thumbnail != null)
        'Thumbnail': thumbnail.map((k, e) => MapEntry(k.value, e)),
    };
  }
}

/// @nodoc
class DocumentStatusType {
  static const initialized = DocumentStatusType._('INITIALIZED');
  static const active = DocumentStatusType._('ACTIVE');

  final String value;

  const DocumentStatusType._(this.value);

  static const values = [initialized, active];

  static DocumentStatusType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentStatusType._(value));

  @override
  bool operator ==(other) =>
      other is DocumentStatusType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DocumentSourceType {
  static const original = DocumentSourceType._('ORIGINAL');
  static const withComments = DocumentSourceType._('WITH_COMMENTS');

  final String value;

  const DocumentSourceType._(this.value);

  static const values = [original, withComments];

  static DocumentSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentSourceType._(value));

  @override
  bool operator ==(other) =>
      other is DocumentSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DocumentThumbnailType {
  static const small = DocumentThumbnailType._('SMALL');
  static const smallHq = DocumentThumbnailType._('SMALL_HQ');
  static const large = DocumentThumbnailType._('LARGE');

  final String value;

  const DocumentThumbnailType._(this.value);

  static const values = [small, smallHq, large];

  static DocumentThumbnailType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentThumbnailType._(value));

  @override
  bool operator ==(other) =>
      other is DocumentThumbnailType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CommentStatusType {
  static const draft = CommentStatusType._('DRAFT');
  static const published = CommentStatusType._('PUBLISHED');
  static const deleted = CommentStatusType._('DELETED');

  final String value;

  const CommentStatusType._(this.value);

  static const values = [draft, published, deleted];

  static CommentStatusType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CommentStatusType._(value));

  @override
  bool operator ==(other) => other is CommentStatusType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters results based on entity metadata.
///
/// @nodoc
class Filters {
  /// Filter based on resource’s path.
  final List<String>? ancestorIds;

  /// Filters by content category.
  final List<ContentCategoryType>? contentCategories;

  /// Filter based on resource’s creation timestamp.
  final DateRangeType? createdRange;

  /// Filter by labels using exact match.
  final List<String>? labels;

  /// Filter based on resource’s modified timestamp.
  final DateRangeType? modifiedRange;

  /// Filter based on UserIds or GroupIds.
  final List<SearchPrincipalType>? principals;

  /// Filters based on entity type.
  final List<SearchResourceType>? resourceTypes;

  /// Filter based on file groupings.
  final List<SearchCollectionType>? searchCollectionTypes;

  /// Filter based on size (in bytes).
  final LongRangeType? sizeRange;

  /// Filters by the locale of the content or comment.
  final List<LanguageCodeType>? textLocales;

  Filters({
    this.ancestorIds,
    this.contentCategories,
    this.createdRange,
    this.labels,
    this.modifiedRange,
    this.principals,
    this.resourceTypes,
    this.searchCollectionTypes,
    this.sizeRange,
    this.textLocales,
  });

  Map<String, dynamic> toJson() {
    final ancestorIds = this.ancestorIds;
    final contentCategories = this.contentCategories;
    final createdRange = this.createdRange;
    final labels = this.labels;
    final modifiedRange = this.modifiedRange;
    final principals = this.principals;
    final resourceTypes = this.resourceTypes;
    final searchCollectionTypes = this.searchCollectionTypes;
    final sizeRange = this.sizeRange;
    final textLocales = this.textLocales;
    return {
      if (ancestorIds != null) 'AncestorIds': ancestorIds,
      if (contentCategories != null)
        'ContentCategories': contentCategories.map((e) => e.value).toList(),
      if (createdRange != null) 'CreatedRange': createdRange,
      if (labels != null) 'Labels': labels,
      if (modifiedRange != null) 'ModifiedRange': modifiedRange,
      if (principals != null) 'Principals': principals,
      if (resourceTypes != null)
        'ResourceTypes': resourceTypes.map((e) => e.value).toList(),
      if (searchCollectionTypes != null)
        'SearchCollectionTypes':
            searchCollectionTypes.map((e) => e.value).toList(),
      if (sizeRange != null) 'SizeRange': sizeRange,
      if (textLocales != null)
        'TextLocales': textLocales.map((e) => e.value).toList(),
    };
  }
}

/// The result of the sort operation.
///
/// @nodoc
class SearchSortResult {
  /// Sort search results based on this field name.
  final OrderByFieldType? field;

  /// Sort direction.
  final SortOrder? order;

  SearchSortResult({
    this.field,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final field = this.field;
    final order = this.order;
    return {
      if (field != null) 'Field': field.value,
      if (order != null) 'Order': order.value,
    };
  }
}

/// @nodoc
class OrderByFieldType {
  static const relevance = OrderByFieldType._('RELEVANCE');
  static const name = OrderByFieldType._('NAME');
  static const size = OrderByFieldType._('SIZE');
  static const createdTimestamp = OrderByFieldType._('CREATED_TIMESTAMP');
  static const modifiedTimestamp = OrderByFieldType._('MODIFIED_TIMESTAMP');

  final String value;

  const OrderByFieldType._(this.value);

  static const values = [
    relevance,
    name,
    size,
    createdTimestamp,
    modifiedTimestamp
  ];

  static OrderByFieldType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OrderByFieldType._(value));

  @override
  bool operator ==(other) => other is OrderByFieldType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SortOrder {
  static const asc = SortOrder._('ASC');
  static const desc = SortOrder._('DESC');

  final String value;

  const SortOrder._(this.value);

  static const values = [asc, desc];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filter based on size (in bytes).
///
/// @nodoc
class LongRangeType {
  /// The size end range (in bytes).
  final int? endValue;

  /// The size start range (in bytes).
  final int? startValue;

  LongRangeType({
    this.endValue,
    this.startValue,
  });

  Map<String, dynamic> toJson() {
    final endValue = this.endValue;
    final startValue = this.startValue;
    return {
      if (endValue != null) 'EndValue': endValue,
      if (startValue != null) 'StartValue': startValue,
    };
  }
}

/// Filters results based on timestamp range (in epochs).
///
/// @nodoc
class DateRangeType {
  /// Timestamp range end value (in epochs).
  final DateTime? endValue;

  /// Timestamp range start value (in epochs)
  final DateTime? startValue;

  DateRangeType({
    this.endValue,
    this.startValue,
  });

  Map<String, dynamic> toJson() {
    final endValue = this.endValue;
    final startValue = this.startValue;
    return {
      if (endValue != null) 'EndValue': unixTimestampToJson(endValue),
      if (startValue != null) 'StartValue': unixTimestampToJson(startValue),
    };
  }
}

/// @nodoc
class SearchCollectionType {
  static const owned = SearchCollectionType._('OWNED');
  static const sharedWithMe = SearchCollectionType._('SHARED_WITH_ME');

  final String value;

  const SearchCollectionType._(this.value);

  static const values = [owned, sharedWithMe];

  static SearchCollectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchCollectionType._(value));

  @override
  bool operator ==(other) =>
      other is SearchCollectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filter based on UserIds or GroupIds.
///
/// @nodoc
class SearchPrincipalType {
  /// UserIds or GroupIds.
  final String id;

  /// The Role of a User or Group.
  final List<PrincipalRoleType>? roles;

  SearchPrincipalType({
    required this.id,
    this.roles,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final roles = this.roles;
    return {
      'Id': id,
      if (roles != null) 'Roles': roles.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class PrincipalRoleType {
  static const viewer = PrincipalRoleType._('VIEWER');
  static const contributor = PrincipalRoleType._('CONTRIBUTOR');
  static const owner = PrincipalRoleType._('OWNER');
  static const coowner = PrincipalRoleType._('COOWNER');

  final String value;

  const PrincipalRoleType._(this.value);

  static const values = [viewer, contributor, owner, coowner];

  static PrincipalRoleType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrincipalRoleType._(value));

  @override
  bool operator ==(other) => other is PrincipalRoleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SearchResourceType {
  static const folder = SearchResourceType._('FOLDER');
  static const document = SearchResourceType._('DOCUMENT');
  static const comment = SearchResourceType._('COMMENT');
  static const documentVersion = SearchResourceType._('DOCUMENT_VERSION');

  final String value;

  const SearchResourceType._(this.value);

  static const values = [folder, document, comment, documentVersion];

  static SearchResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchResourceType._(value));

  @override
  bool operator ==(other) =>
      other is SearchResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ContentCategoryType {
  static const image = ContentCategoryType._('IMAGE');
  static const document = ContentCategoryType._('DOCUMENT');
  static const pdf = ContentCategoryType._('PDF');
  static const spreadsheet = ContentCategoryType._('SPREADSHEET');
  static const presentation = ContentCategoryType._('PRESENTATION');
  static const audio = ContentCategoryType._('AUDIO');
  static const video = ContentCategoryType._('VIDEO');
  static const sourceCode = ContentCategoryType._('SOURCE_CODE');
  static const other = ContentCategoryType._('OTHER');

  final String value;

  const ContentCategoryType._(this.value);

  static const values = [
    image,
    document,
    pdf,
    spreadsheet,
    presentation,
    audio,
    video,
    sourceCode,
    other
  ];

  static ContentCategoryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentCategoryType._(value));

  @override
  bool operator ==(other) =>
      other is ContentCategoryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LanguageCodeType {
  static const ar = LanguageCodeType._('AR');
  static const bg = LanguageCodeType._('BG');
  static const bn = LanguageCodeType._('BN');
  static const da = LanguageCodeType._('DA');
  static const de = LanguageCodeType._('DE');
  static const cs = LanguageCodeType._('CS');
  static const el = LanguageCodeType._('EL');
  static const en = LanguageCodeType._('EN');
  static const es = LanguageCodeType._('ES');
  static const fa = LanguageCodeType._('FA');
  static const fi = LanguageCodeType._('FI');
  static const fr = LanguageCodeType._('FR');
  static const hi = LanguageCodeType._('HI');
  static const hu = LanguageCodeType._('HU');
  static const id = LanguageCodeType._('ID');
  static const it = LanguageCodeType._('IT');
  static const ja = LanguageCodeType._('JA');
  static const ko = LanguageCodeType._('KO');
  static const lt = LanguageCodeType._('LT');
  static const lv = LanguageCodeType._('LV');
  static const nl = LanguageCodeType._('NL');
  static const no = LanguageCodeType._('NO');
  static const pt = LanguageCodeType._('PT');
  static const ro = LanguageCodeType._('RO');
  static const ru = LanguageCodeType._('RU');
  static const sv = LanguageCodeType._('SV');
  static const sw = LanguageCodeType._('SW');
  static const th = LanguageCodeType._('TH');
  static const tr = LanguageCodeType._('TR');
  static const zh = LanguageCodeType._('ZH');
  static const $default = LanguageCodeType._('DEFAULT');

  final String value;

  const LanguageCodeType._(this.value);

  static const values = [
    ar,
    bg,
    bn,
    da,
    de,
    cs,
    el,
    en,
    es,
    fa,
    fi,
    fr,
    hi,
    hu,
    id,
    it,
    ja,
    ko,
    lt,
    lv,
    nl,
    no,
    pt,
    ro,
    ru,
    sv,
    sw,
    th,
    tr,
    zh,
    $default
  ];

  static LanguageCodeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LanguageCodeType._(value));

  @override
  bool operator ==(other) => other is LanguageCodeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AdditionalResponseFieldType {
  static const weburl = AdditionalResponseFieldType._('WEBURL');

  final String value;

  const AdditionalResponseFieldType._(this.value);

  static const values = [weburl];

  static AdditionalResponseFieldType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AdditionalResponseFieldType._(value));

  @override
  bool operator ==(other) =>
      other is AdditionalResponseFieldType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SearchQueryScopeType {
  static const name = SearchQueryScopeType._('NAME');
  static const content = SearchQueryScopeType._('CONTENT');

  final String value;

  const SearchQueryScopeType._(this.value);

  static const values = [name, content];

  static SearchQueryScopeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchQueryScopeType._(value));

  @override
  bool operator ==(other) =>
      other is SearchQueryScopeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PrincipalType {
  static const user = PrincipalType._('USER');
  static const group = PrincipalType._('GROUP');
  static const invite = PrincipalType._('INVITE');
  static const anonymous = PrincipalType._('ANONYMOUS');
  static const organization = PrincipalType._('ORGANIZATION');

  final String value;

  const PrincipalType._(this.value);

  static const values = [user, group, invite, anonymous, organization];

  static PrincipalType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrincipalType._(value));

  @override
  bool operator ==(other) => other is PrincipalType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the upload.
///
/// @nodoc
class UploadMetadata {
  /// The signed headers.
  final Map<String, String>? signedHeaders;

  /// The URL of the upload.
  final String? uploadUrl;

  UploadMetadata({
    this.signedHeaders,
    this.uploadUrl,
  });

  factory UploadMetadata.fromJson(Map<String, dynamic> json) {
    return UploadMetadata(
      signedHeaders: (json['SignedHeaders'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uploadUrl: json['UploadUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final signedHeaders = this.signedHeaders;
    final uploadUrl = this.uploadUrl;
    return {
      if (signedHeaders != null) 'SignedHeaders': signedHeaders,
      if (uploadUrl != null) 'UploadUrl': uploadUrl,
    };
  }
}

/// @nodoc
class ResourceCollectionType {
  static const sharedWithMe = ResourceCollectionType._('SHARED_WITH_ME');

  final String value;

  const ResourceCollectionType._(this.value);

  static const values = [sharedWithMe];

  static ResourceCollectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceCollectionType._(value));

  @override
  bool operator ==(other) =>
      other is ResourceCollectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the path information of a resource.
///
/// @nodoc
class ResourcePath {
  /// The components of the resource path.
  final List<ResourcePathComponent>? components;

  ResourcePath({
    this.components,
  });

  factory ResourcePath.fromJson(Map<String, dynamic> json) {
    return ResourcePath(
      components: (json['Components'] as List?)
          ?.nonNulls
          .map((e) => ResourcePathComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final components = this.components;
    return {
      if (components != null) 'Components': components,
    };
  }
}

/// Describes the resource path.
///
/// @nodoc
class ResourcePathComponent {
  /// The ID of the resource path.
  final String? id;

  /// The name of the resource path.
  final String? name;

  ResourcePathComponent({
    this.id,
    this.name,
  });

  factory ResourcePathComponent.fromJson(Map<String, dynamic> json) {
    return ResourcePathComponent(
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// @nodoc
class UserFilterType {
  static const all = UserFilterType._('ALL');
  static const activePending = UserFilterType._('ACTIVE_PENDING');

  final String value;

  const UserFilterType._(this.value);

  static const values = [all, activePending];

  static UserFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UserFilterType._(value));

  @override
  bool operator ==(other) => other is UserFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OrderType {
  static const ascending = OrderType._('ASCENDING');
  static const descending = OrderType._('DESCENDING');

  final String value;

  const OrderType._(this.value);

  static const values = [ascending, descending];

  static OrderType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OrderType._(value));

  @override
  bool operator ==(other) => other is OrderType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class UserSortType {
  static const userName = UserSortType._('USER_NAME');
  static const fullName = UserSortType._('FULL_NAME');
  static const storageLimit = UserSortType._('STORAGE_LIMIT');
  static const userStatus = UserSortType._('USER_STATUS');
  static const storageUsed = UserSortType._('STORAGE_USED');

  final String value;

  const UserSortType._(this.value);

  static const values = [
    userName,
    fullName,
    storageLimit,
    userStatus,
    storageUsed
  ];

  static UserSortType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UserSortType._(value));

  @override
  bool operator ==(other) => other is UserSortType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a resource.
///
/// @nodoc
class Principal {
  /// The ID of the resource.
  final String? id;

  /// The permission information for the resource.
  final List<PermissionInfo>? roles;

  /// The type of resource.
  final PrincipalType? type;

  Principal({
    this.id,
    this.roles,
    this.type,
  });

  factory Principal.fromJson(Map<String, dynamic> json) {
    return Principal(
      id: json['Id'] as String?,
      roles: (json['Roles'] as List?)
          ?.nonNulls
          .map((e) => PermissionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.let(PrincipalType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final roles = this.roles;
    final type = this.type;
    return {
      if (id != null) 'Id': id,
      if (roles != null) 'Roles': roles,
      if (type != null) 'Type': type.value,
    };
  }
}

/// Describes the permissions.
///
/// @nodoc
class PermissionInfo {
  /// The role of the user.
  final RoleType? role;

  /// The type of permissions.
  final RolePermissionType? type;

  PermissionInfo({
    this.role,
    this.type,
  });

  factory PermissionInfo.fromJson(Map<String, dynamic> json) {
    return PermissionInfo(
      role: (json['Role'] as String?)?.let(RoleType.fromString),
      type: (json['Type'] as String?)?.let(RolePermissionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    final type = this.type;
    return {
      if (role != null) 'Role': role.value,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class RoleType {
  static const viewer = RoleType._('VIEWER');
  static const contributor = RoleType._('CONTRIBUTOR');
  static const owner = RoleType._('OWNER');
  static const coowner = RoleType._('COOWNER');

  final String value;

  const RoleType._(this.value);

  static const values = [viewer, contributor, owner, coowner];

  static RoleType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RoleType._(value));

  @override
  bool operator ==(other) => other is RoleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RolePermissionType {
  static const direct = RolePermissionType._('DIRECT');
  static const inherited = RolePermissionType._('INHERITED');

  final String value;

  const RolePermissionType._(this.value);

  static const values = [direct, inherited];

  static RolePermissionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RolePermissionType._(value));

  @override
  bool operator ==(other) =>
      other is RolePermissionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a subscription.
///
/// @nodoc
class Subscription {
  /// The endpoint of the subscription.
  final String? endPoint;

  /// The protocol of the subscription.
  final SubscriptionProtocolType? protocol;

  /// The ID of the subscription.
  final String? subscriptionId;

  Subscription({
    this.endPoint,
    this.protocol,
    this.subscriptionId,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      endPoint: json['EndPoint'] as String?,
      protocol: (json['Protocol'] as String?)
          ?.let(SubscriptionProtocolType.fromString),
      subscriptionId: json['SubscriptionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endPoint = this.endPoint;
    final protocol = this.protocol;
    final subscriptionId = this.subscriptionId;
    return {
      if (endPoint != null) 'EndPoint': endPoint,
      if (protocol != null) 'Protocol': protocol.value,
      if (subscriptionId != null) 'SubscriptionId': subscriptionId,
    };
  }
}

/// @nodoc
class SubscriptionProtocolType {
  static const https = SubscriptionProtocolType._('HTTPS');
  static const sqs = SubscriptionProtocolType._('SQS');

  final String value;

  const SubscriptionProtocolType._(this.value);

  static const values = [https, sqs];

  static SubscriptionProtocolType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SubscriptionProtocolType._(value));

  @override
  bool operator ==(other) =>
      other is SubscriptionProtocolType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the metadata of a user group.
///
/// @nodoc
class GroupMetadata {
  /// The ID of the user group.
  final String? id;

  /// The name of the group.
  final String? name;

  GroupMetadata({
    this.id,
    this.name,
  });

  factory GroupMetadata.fromJson(Map<String, dynamic> json) {
    return GroupMetadata(
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// @nodoc
class ResourceSortType {
  static const date = ResourceSortType._('DATE');
  static const name = ResourceSortType._('NAME');

  final String value;

  const ResourceSortType._(this.value);

  static const values = [date, name];

  static ResourceSortType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceSortType._(value));

  @override
  bool operator ==(other) => other is ResourceSortType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FolderContentType {
  static const all = FolderContentType._('ALL');
  static const document = FolderContentType._('DOCUMENT');
  static const folder = FolderContentType._('FOLDER');

  final String value;

  const FolderContentType._(this.value);

  static const values = [all, document, folder];

  static FolderContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FolderContentType._(value));

  @override
  bool operator ==(other) => other is FolderContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a comment.
///
/// @nodoc
class Comment {
  /// The ID of the comment.
  final String commentId;

  /// The details of the user who made the comment.
  final User? contributor;

  /// The time that the comment was created.
  final DateTime? createdTimestamp;

  /// The ID of the parent comment.
  final String? parentId;

  /// If the comment is a reply to another user's comment, this field contains the
  /// user ID of the user being replied to.
  final String? recipientId;

  /// The status of the comment.
  final CommentStatusType? status;

  /// The text of the comment.
  final String? text;

  /// The ID of the root comment in the thread.
  final String? threadId;

  /// The visibility of the comment. Options are either PRIVATE, where the comment
  /// is visible only to the comment author and document owner and co-owners, or
  /// PUBLIC, where the comment is visible to document owners, co-owners, and
  /// contributors.
  final CommentVisibilityType? visibility;

  Comment({
    required this.commentId,
    this.contributor,
    this.createdTimestamp,
    this.parentId,
    this.recipientId,
    this.status,
    this.text,
    this.threadId,
    this.visibility,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: (json['CommentId'] as String?) ?? '',
      contributor: json['Contributor'] != null
          ? User.fromJson(json['Contributor'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      parentId: json['ParentId'] as String?,
      recipientId: json['RecipientId'] as String?,
      status: (json['Status'] as String?)?.let(CommentStatusType.fromString),
      text: json['Text'] as String?,
      threadId: json['ThreadId'] as String?,
      visibility: (json['Visibility'] as String?)
          ?.let(CommentVisibilityType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final commentId = this.commentId;
    final contributor = this.contributor;
    final createdTimestamp = this.createdTimestamp;
    final parentId = this.parentId;
    final recipientId = this.recipientId;
    final status = this.status;
    final text = this.text;
    final threadId = this.threadId;
    final visibility = this.visibility;
    return {
      'CommentId': commentId,
      if (contributor != null) 'Contributor': contributor,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (parentId != null) 'ParentId': parentId,
      if (recipientId != null) 'RecipientId': recipientId,
      if (status != null) 'Status': status.value,
      if (text != null) 'Text': text,
      if (threadId != null) 'ThreadId': threadId,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

/// @nodoc
class CommentVisibilityType {
  static const public = CommentVisibilityType._('PUBLIC');
  static const private = CommentVisibilityType._('PRIVATE');

  final String value;

  const CommentVisibilityType._(this.value);

  static const values = [public, private];

  static CommentVisibilityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CommentVisibilityType._(value));

  @override
  bool operator ==(other) =>
      other is CommentVisibilityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the activity information.
///
/// @nodoc
class Activity {
  /// Metadata of the commenting activity. This is an optional field and is filled
  /// for commenting activities.
  final CommentMetadata? commentMetadata;

  /// The user who performed the action.
  final UserMetadata? initiator;

  /// Indicates whether an activity is indirect or direct. An indirect activity
  /// results from a direct activity performed on a parent resource. For example,
  /// sharing a parent folder (the direct activity) shares all of the subfolders
  /// and documents within the parent folder (the indirect activity).
  final bool? isIndirectActivity;

  /// The ID of the organization.
  final String? organizationId;

  /// The original parent of the resource. This is an optional field and is filled
  /// for move activities.
  final ResourceMetadata? originalParent;

  /// The list of users or groups impacted by this action. This is an optional
  /// field and is filled for the following sharing activities: DOCUMENT_SHARED,
  /// DOCUMENT_SHARED, DOCUMENT_UNSHARED, FOLDER_SHARED, FOLDER_UNSHARED.
  final Participants? participants;

  /// The metadata of the resource involved in the user action.
  final ResourceMetadata? resourceMetadata;

  /// The timestamp when the action was performed.
  final DateTime? timeStamp;

  /// The activity type.
  final ActivityType? type;

  Activity({
    this.commentMetadata,
    this.initiator,
    this.isIndirectActivity,
    this.organizationId,
    this.originalParent,
    this.participants,
    this.resourceMetadata,
    this.timeStamp,
    this.type,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      commentMetadata: json['CommentMetadata'] != null
          ? CommentMetadata.fromJson(
              json['CommentMetadata'] as Map<String, dynamic>)
          : null,
      initiator: json['Initiator'] != null
          ? UserMetadata.fromJson(json['Initiator'] as Map<String, dynamic>)
          : null,
      isIndirectActivity: json['IsIndirectActivity'] as bool?,
      organizationId: json['OrganizationId'] as String?,
      originalParent: json['OriginalParent'] != null
          ? ResourceMetadata.fromJson(
              json['OriginalParent'] as Map<String, dynamic>)
          : null,
      participants: json['Participants'] != null
          ? Participants.fromJson(json['Participants'] as Map<String, dynamic>)
          : null,
      resourceMetadata: json['ResourceMetadata'] != null
          ? ResourceMetadata.fromJson(
              json['ResourceMetadata'] as Map<String, dynamic>)
          : null,
      timeStamp: timeStampFromJson(json['TimeStamp']),
      type: (json['Type'] as String?)?.let(ActivityType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final commentMetadata = this.commentMetadata;
    final initiator = this.initiator;
    final isIndirectActivity = this.isIndirectActivity;
    final organizationId = this.organizationId;
    final originalParent = this.originalParent;
    final participants = this.participants;
    final resourceMetadata = this.resourceMetadata;
    final timeStamp = this.timeStamp;
    final type = this.type;
    return {
      if (commentMetadata != null) 'CommentMetadata': commentMetadata,
      if (initiator != null) 'Initiator': initiator,
      if (isIndirectActivity != null) 'IsIndirectActivity': isIndirectActivity,
      if (organizationId != null) 'OrganizationId': organizationId,
      if (originalParent != null) 'OriginalParent': originalParent,
      if (participants != null) 'Participants': participants,
      if (resourceMetadata != null) 'ResourceMetadata': resourceMetadata,
      if (timeStamp != null) 'TimeStamp': unixTimestampToJson(timeStamp),
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class ActivityType {
  static const documentCheckedIn = ActivityType._('DOCUMENT_CHECKED_IN');
  static const documentCheckedOut = ActivityType._('DOCUMENT_CHECKED_OUT');
  static const documentRenamed = ActivityType._('DOCUMENT_RENAMED');
  static const documentVersionUploaded =
      ActivityType._('DOCUMENT_VERSION_UPLOADED');
  static const documentVersionDeleted =
      ActivityType._('DOCUMENT_VERSION_DELETED');
  static const documentVersionViewed =
      ActivityType._('DOCUMENT_VERSION_VIEWED');
  static const documentVersionDownloaded =
      ActivityType._('DOCUMENT_VERSION_DOWNLOADED');
  static const documentRecycled = ActivityType._('DOCUMENT_RECYCLED');
  static const documentRestored = ActivityType._('DOCUMENT_RESTORED');
  static const documentReverted = ActivityType._('DOCUMENT_REVERTED');
  static const documentShared = ActivityType._('DOCUMENT_SHARED');
  static const documentUnshared = ActivityType._('DOCUMENT_UNSHARED');
  static const documentSharePermissionChanged =
      ActivityType._('DOCUMENT_SHARE_PERMISSION_CHANGED');
  static const documentShareableLinkCreated =
      ActivityType._('DOCUMENT_SHAREABLE_LINK_CREATED');
  static const documentShareableLinkRemoved =
      ActivityType._('DOCUMENT_SHAREABLE_LINK_REMOVED');
  static const documentShareableLinkPermissionChanged =
      ActivityType._('DOCUMENT_SHAREABLE_LINK_PERMISSION_CHANGED');
  static const documentMoved = ActivityType._('DOCUMENT_MOVED');
  static const documentCommentAdded = ActivityType._('DOCUMENT_COMMENT_ADDED');
  static const documentCommentDeleted =
      ActivityType._('DOCUMENT_COMMENT_DELETED');
  static const documentAnnotationAdded =
      ActivityType._('DOCUMENT_ANNOTATION_ADDED');
  static const documentAnnotationDeleted =
      ActivityType._('DOCUMENT_ANNOTATION_DELETED');
  static const folderCreated = ActivityType._('FOLDER_CREATED');
  static const folderDeleted = ActivityType._('FOLDER_DELETED');
  static const folderRenamed = ActivityType._('FOLDER_RENAMED');
  static const folderRecycled = ActivityType._('FOLDER_RECYCLED');
  static const folderRestored = ActivityType._('FOLDER_RESTORED');
  static const folderShared = ActivityType._('FOLDER_SHARED');
  static const folderUnshared = ActivityType._('FOLDER_UNSHARED');
  static const folderSharePermissionChanged =
      ActivityType._('FOLDER_SHARE_PERMISSION_CHANGED');
  static const folderShareableLinkCreated =
      ActivityType._('FOLDER_SHAREABLE_LINK_CREATED');
  static const folderShareableLinkRemoved =
      ActivityType._('FOLDER_SHAREABLE_LINK_REMOVED');
  static const folderShareableLinkPermissionChanged =
      ActivityType._('FOLDER_SHAREABLE_LINK_PERMISSION_CHANGED');
  static const folderMoved = ActivityType._('FOLDER_MOVED');

  final String value;

  const ActivityType._(this.value);

  static const values = [
    documentCheckedIn,
    documentCheckedOut,
    documentRenamed,
    documentVersionUploaded,
    documentVersionDeleted,
    documentVersionViewed,
    documentVersionDownloaded,
    documentRecycled,
    documentRestored,
    documentReverted,
    documentShared,
    documentUnshared,
    documentSharePermissionChanged,
    documentShareableLinkCreated,
    documentShareableLinkRemoved,
    documentShareableLinkPermissionChanged,
    documentMoved,
    documentCommentAdded,
    documentCommentDeleted,
    documentAnnotationAdded,
    documentAnnotationDeleted,
    folderCreated,
    folderDeleted,
    folderRenamed,
    folderRecycled,
    folderRestored,
    folderShared,
    folderUnshared,
    folderSharePermissionChanged,
    folderShareableLinkCreated,
    folderShareableLinkRemoved,
    folderShareableLinkPermissionChanged,
    folderMoved
  ];

  static ActivityType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ActivityType._(value));

  @override
  bool operator ==(other) => other is ActivityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the metadata of the user.
///
/// @nodoc
class UserMetadata {
  /// The email address of the user.
  final String? emailAddress;

  /// The given name of the user before a rename operation.
  final String? givenName;

  /// The ID of the user.
  final String? id;

  /// The surname of the user.
  final String? surname;

  /// The name of the user.
  final String? username;

  UserMetadata({
    this.emailAddress,
    this.givenName,
    this.id,
    this.surname,
    this.username,
  });

  factory UserMetadata.fromJson(Map<String, dynamic> json) {
    return UserMetadata(
      emailAddress: json['EmailAddress'] as String?,
      givenName: json['GivenName'] as String?,
      id: json['Id'] as String?,
      surname: json['Surname'] as String?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final givenName = this.givenName;
    final id = this.id;
    final surname = this.surname;
    final username = this.username;
    return {
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (givenName != null) 'GivenName': givenName,
      if (id != null) 'Id': id,
      if (surname != null) 'Surname': surname,
      if (username != null) 'Username': username,
    };
  }
}

/// Describes the users or user groups.
///
/// @nodoc
class Participants {
  /// The list of user groups.
  final List<GroupMetadata>? groups;

  /// The list of users.
  final List<UserMetadata>? users;

  Participants({
    this.groups,
    this.users,
  });

  factory Participants.fromJson(Map<String, dynamic> json) {
    return Participants(
      groups: (json['Groups'] as List?)
          ?.nonNulls
          .map((e) => GroupMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['Users'] as List?)
          ?.nonNulls
          .map((e) => UserMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final users = this.users;
    return {
      if (groups != null) 'Groups': groups,
      if (users != null) 'Users': users,
    };
  }
}

/// Describes the metadata of a resource.
///
/// @nodoc
class ResourceMetadata {
  /// The ID of the resource.
  final String? id;

  /// The name of the resource.
  final String? name;

  /// The original name of the resource before a rename operation.
  final String? originalName;

  /// The owner of the resource.
  final UserMetadata? owner;

  /// The parent ID of the resource before a rename operation.
  final String? parentId;

  /// The type of resource.
  final ResourceType? type;

  /// The version ID of the resource. This is an optional field and is filled for
  /// action on document version.
  final String? versionId;

  ResourceMetadata({
    this.id,
    this.name,
    this.originalName,
    this.owner,
    this.parentId,
    this.type,
    this.versionId,
  });

  factory ResourceMetadata.fromJson(Map<String, dynamic> json) {
    return ResourceMetadata(
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      originalName: json['OriginalName'] as String?,
      owner: json['Owner'] != null
          ? UserMetadata.fromJson(json['Owner'] as Map<String, dynamic>)
          : null,
      parentId: json['ParentId'] as String?,
      type: (json['Type'] as String?)?.let(ResourceType.fromString),
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final originalName = this.originalName;
    final owner = this.owner;
    final parentId = this.parentId;
    final type = this.type;
    final versionId = this.versionId;
    return {
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (originalName != null) 'OriginalName': originalName,
      if (owner != null) 'Owner': owner,
      if (parentId != null) 'ParentId': parentId,
      if (type != null) 'Type': type.value,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// @nodoc
class ResourceType {
  static const folder = ResourceType._('FOLDER');
  static const document = ResourceType._('DOCUMENT');

  final String value;

  const ResourceType._(this.value);

  static const values = [folder, document];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SubscriptionType {
  static const all = SubscriptionType._('ALL');

  final String value;

  const SubscriptionType._(this.value);

  static const values = [all];

  static SubscriptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SubscriptionType._(value));

  @override
  bool operator ==(other) => other is SubscriptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the share results of a resource.
///
/// @nodoc
class ShareResult {
  /// The ID of the invited user.
  final String? inviteePrincipalId;

  /// The ID of the principal.
  final String? principalId;

  /// The role.
  final RoleType? role;

  /// The ID of the resource that was shared.
  final String? shareId;

  /// The status.
  final ShareStatusType? status;

  /// The status message.
  final String? statusMessage;

  ShareResult({
    this.inviteePrincipalId,
    this.principalId,
    this.role,
    this.shareId,
    this.status,
    this.statusMessage,
  });

  factory ShareResult.fromJson(Map<String, dynamic> json) {
    return ShareResult(
      inviteePrincipalId: json['InviteePrincipalId'] as String?,
      principalId: json['PrincipalId'] as String?,
      role: (json['Role'] as String?)?.let(RoleType.fromString),
      shareId: json['ShareId'] as String?,
      status: (json['Status'] as String?)?.let(ShareStatusType.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inviteePrincipalId = this.inviteePrincipalId;
    final principalId = this.principalId;
    final role = this.role;
    final shareId = this.shareId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (inviteePrincipalId != null) 'InviteePrincipalId': inviteePrincipalId,
      if (principalId != null) 'PrincipalId': principalId,
      if (role != null) 'Role': role.value,
      if (shareId != null) 'ShareId': shareId,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class ShareStatusType {
  static const success = ShareStatusType._('SUCCESS');
  static const failure = ShareStatusType._('FAILURE');

  final String value;

  const ShareStatusType._(this.value);

  static const values = [success, failure];

  static ShareStatusType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ShareStatusType._(value));

  @override
  bool operator ==(other) => other is ShareStatusType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Set of options which defines notification preferences of given action.
///
/// @nodoc
class NotificationOptions {
  /// Text value to be included in the email body.
  final String? emailMessage;

  /// Boolean value to indicate an email notification should be sent to the
  /// recipients.
  final bool? sendEmail;

  NotificationOptions({
    this.emailMessage,
    this.sendEmail,
  });

  Map<String, dynamic> toJson() {
    final emailMessage = this.emailMessage;
    final sendEmail = this.sendEmail;
    return {
      if (emailMessage != null) 'EmailMessage': emailMessage,
      if (sendEmail != null) 'SendEmail': sendEmail,
    };
  }
}

/// Describes the recipient type and ID, if available.
///
/// @nodoc
class SharePrincipal {
  /// The ID of the recipient.
  final String id;

  /// The role of the recipient.
  final RoleType role;

  /// The type of the recipient.
  final PrincipalType type;

  SharePrincipal({
    required this.id,
    required this.role,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final role = this.role;
    final type = this.type;
    return {
      'Id': id,
      'Role': role.value,
      'Type': type.value,
    };
  }
}

/// @nodoc
class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

/// @nodoc
class ConflictingOperationException extends _s.GenericAwsException {
  ConflictingOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConflictingOperationException',
            message: message);
}

/// @nodoc
class CustomMetadataLimitExceededException extends _s.GenericAwsException {
  CustomMetadataLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CustomMetadataLimitExceededException',
            message: message);
}

/// @nodoc
class DeactivatingLastSystemUserException extends _s.GenericAwsException {
  DeactivatingLastSystemUserException({String? type, String? message})
      : super(
            type: type,
            code: 'DeactivatingLastSystemUserException',
            message: message);
}

/// @nodoc
class DocumentLockedForCommentsException extends _s.GenericAwsException {
  DocumentLockedForCommentsException({String? type, String? message})
      : super(
            type: type,
            code: 'DocumentLockedForCommentsException',
            message: message);
}

/// @nodoc
class DraftUploadOutOfSyncException extends _s.GenericAwsException {
  DraftUploadOutOfSyncException({String? type, String? message})
      : super(
            type: type,
            code: 'DraftUploadOutOfSyncException',
            message: message);
}

/// @nodoc
class EntityAlreadyExistsException extends _s.GenericAwsException {
  EntityAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'EntityAlreadyExistsException', message: message);
}

/// @nodoc
class EntityNotExistsException extends _s.GenericAwsException {
  EntityNotExistsException({String? type, String? message})
      : super(type: type, code: 'EntityNotExistsException', message: message);
}

/// @nodoc
class FailedDependencyException extends _s.GenericAwsException {
  FailedDependencyException({String? type, String? message})
      : super(type: type, code: 'FailedDependencyException', message: message);
}

/// @nodoc
class IllegalUserStateException extends _s.GenericAwsException {
  IllegalUserStateException({String? type, String? message})
      : super(type: type, code: 'IllegalUserStateException', message: message);
}

/// @nodoc
class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

/// @nodoc
class InvalidCommentOperationException extends _s.GenericAwsException {
  InvalidCommentOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCommentOperationException',
            message: message);
}

/// @nodoc
class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String? type, String? message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

/// @nodoc
class InvalidPasswordException extends _s.GenericAwsException {
  InvalidPasswordException({String? type, String? message})
      : super(type: type, code: 'InvalidPasswordException', message: message);
}

/// @nodoc
class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

/// @nodoc
class ProhibitedStateException extends _s.GenericAwsException {
  ProhibitedStateException({String? type, String? message})
      : super(type: type, code: 'ProhibitedStateException', message: message);
}

/// @nodoc
class RequestedEntityTooLargeException extends _s.GenericAwsException {
  RequestedEntityTooLargeException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestedEntityTooLargeException',
            message: message);
}

/// @nodoc
class ResourceAlreadyCheckedOutException extends _s.GenericAwsException {
  ResourceAlreadyCheckedOutException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyCheckedOutException',
            message: message);
}

/// @nodoc
class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

/// @nodoc
class StorageLimitExceededException extends _s.GenericAwsException {
  StorageLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'StorageLimitExceededException',
            message: message);
}

/// @nodoc
class StorageLimitWillExceedException extends _s.GenericAwsException {
  StorageLimitWillExceedException({String? type, String? message})
      : super(
            type: type,
            code: 'StorageLimitWillExceedException',
            message: message);
}

/// @nodoc
class TooManyLabelsException extends _s.GenericAwsException {
  TooManyLabelsException({String? type, String? message})
      : super(type: type, code: 'TooManyLabelsException', message: message);
}

/// @nodoc
class TooManySubscriptionsException extends _s.GenericAwsException {
  TooManySubscriptionsException({String? type, String? message})
      : super(
            type: type,
            code: 'TooManySubscriptionsException',
            message: message);
}

/// @nodoc
class UnauthorizedOperationException extends _s.GenericAwsException {
  UnauthorizedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnauthorizedOperationException',
            message: message);
}

/// @nodoc
class UnauthorizedResourceAccessException extends _s.GenericAwsException {
  UnauthorizedResourceAccessException({String? type, String? message})
      : super(
            type: type,
            code: 'UnauthorizedResourceAccessException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConflictingOperationException': (type, message) =>
      ConflictingOperationException(type: type, message: message),
  'CustomMetadataLimitExceededException': (type, message) =>
      CustomMetadataLimitExceededException(type: type, message: message),
  'DeactivatingLastSystemUserException': (type, message) =>
      DeactivatingLastSystemUserException(type: type, message: message),
  'DocumentLockedForCommentsException': (type, message) =>
      DocumentLockedForCommentsException(type: type, message: message),
  'DraftUploadOutOfSyncException': (type, message) =>
      DraftUploadOutOfSyncException(type: type, message: message),
  'EntityAlreadyExistsException': (type, message) =>
      EntityAlreadyExistsException(type: type, message: message),
  'EntityNotExistsException': (type, message) =>
      EntityNotExistsException(type: type, message: message),
  'FailedDependencyException': (type, message) =>
      FailedDependencyException(type: type, message: message),
  'IllegalUserStateException': (type, message) =>
      IllegalUserStateException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'InvalidCommentOperationException': (type, message) =>
      InvalidCommentOperationException(type: type, message: message),
  'InvalidOperationException': (type, message) =>
      InvalidOperationException(type: type, message: message),
  'InvalidPasswordException': (type, message) =>
      InvalidPasswordException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ProhibitedStateException': (type, message) =>
      ProhibitedStateException(type: type, message: message),
  'RequestedEntityTooLargeException': (type, message) =>
      RequestedEntityTooLargeException(type: type, message: message),
  'ResourceAlreadyCheckedOutException': (type, message) =>
      ResourceAlreadyCheckedOutException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'StorageLimitExceededException': (type, message) =>
      StorageLimitExceededException(type: type, message: message),
  'StorageLimitWillExceedException': (type, message) =>
      StorageLimitWillExceedException(type: type, message: message),
  'TooManyLabelsException': (type, message) =>
      TooManyLabelsException(type: type, message: message),
  'TooManySubscriptionsException': (type, message) =>
      TooManySubscriptionsException(type: type, message: message),
  'UnauthorizedOperationException': (type, message) =>
      UnauthorizedOperationException(type: type, message: message),
  'UnauthorizedResourceAccessException': (type, message) =>
      UnauthorizedResourceAccessException(type: type, message: message),
};
