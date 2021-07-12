// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// The WorkDocs API is designed for the following use cases:
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
/// API actions, along with AWS CloudTrail, allow these applications to detect
/// when changes occur in Amazon WorkDocs. Then, the application can take the
/// necessary actions and replace the target file. If the target file violates
/// the policy, the application can also choose to email the user.
/// </li>
/// <li>
/// eDiscovery/Analytics: General administrative applications are supported,
/// such as eDiscovery and analytics. These applications can choose to mimic or
/// record the actions in an Amazon WorkDocs site, along with AWS CloudTrail, to
/// replicate data for eDiscovery, backup, or analytical applications.
/// </li>
/// </ul>
/// All Amazon WorkDocs API actions are Amazon authenticated and
/// certificate-signed. They not only require the use of the AWS SDK, but also
/// allow for the exclusive use of IAM users and roles to help facilitate
/// access, trust, and permission policies. By creating a role and allowing an
/// IAM user to access the Amazon WorkDocs site, the IAM user gains full
/// administrative visibility into the entire Amazon WorkDocs site (or as set in
/// the IAM policy). This includes, but is not limited to, the ability to modify
/// file permissions and upload any file to any user. This allows developers to
/// perform the three use cases above, as well as give users the ability to
/// grant access on a selective basis using the IAM model.
class WorkDocs {
  final _s.RestJsonProtocol _protocol;
  WorkDocs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'workdocs',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Aborts the upload of the specified document version that was previously
  /// initiated by <a>InitiateDocumentVersionUpload</a>. The client should make
  /// this call only when it no longer intends to upload the document version,
  /// or fails to do so.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [ProhibitedStateException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [versionId] :
  /// The ID of the version.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  Future<void> abortDocumentVersionUpload({
    required String documentId,
    required String versionId,
    String? authenticationToken,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  Future<ActivateUserResponse> activateUser({
    required String userId,
    String? authenticationToken,
  }) async {
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [principals] :
  /// The users, groups, or organization being granted permission.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  ///
  /// Parameter [notificationOptions] :
  /// The notification options.
  Future<AddResourcePermissionsResponse> addResourcePermissions({
    required List<SharePrincipal> principals,
    required String resourceId,
    String? authenticationToken,
    NotificationOptions? notificationOptions,
  }) async {
    ArgumentError.checkNotNull(principals, 'principals');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [EntityNotExistsException].
  /// May throw [ProhibitedStateException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [DocumentLockedForCommentsException].
  /// May throw [InvalidCommentOperationException].
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
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'parentId',
      parentId,
      1,
      128,
    );
    _s.validateStringLength(
      'threadId',
      threadId,
      1,
      128,
    );
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
      if (visibility != null) 'Visibility': visibility.toValue(),
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
  /// May throw [EntityNotExistsException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [ProhibitedStateException].
  /// May throw [CustomMetadataLimitExceededException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [customMetadata] :
  /// Custom metadata in the form of name-value pairs.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(customMetadata, 'customMetadata');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
    );
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
  /// May throw [EntityNotExistsException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [ProhibitedStateException].
  /// May throw [ConflictingOperationException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [parentFolderId] :
  /// The ID of the parent folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  ///
  /// Parameter [name] :
  /// The name of the new folder.
  Future<CreateFolderResponse> createFolder({
    required String parentFolderId,
    String? authenticationToken,
    String? name,
  }) async {
    ArgumentError.checkNotNull(parentFolderId, 'parentFolderId');
    _s.validateStringLength(
      'parentFolderId',
      parentFolderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyLabelsException].
  ///
  /// Parameter [labels] :
  /// List of labels to add to the resource.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  Future<void> createLabels({
    required List<String> labels,
    required String resourceId,
    String? authenticationToken,
  }) async {
    ArgumentError.checkNotNull(labels, 'labels');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// href="https://docs.aws.amazon.com/workdocs/latest/developerguide/subscribe-notifications.html">Subscribe
  /// to Notifications</a> in the <i>Amazon WorkDocs Developer Guide</i>.
  ///
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [TooManySubscriptionsException].
  /// May throw [ServiceUnavailableException].
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
    ArgumentError.checkNotNull(endpoint, 'endpoint');
    _s.validateStringLength(
      'endpoint',
      endpoint,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(protocol, 'protocol');
    ArgumentError.checkNotNull(subscriptionType, 'subscriptionType');
    final $payload = <String, dynamic>{
      'Endpoint': endpoint,
      'Protocol': protocol.toValue(),
      'SubscriptionType': subscriptionType.toValue(),
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
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
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(givenName, 'givenName');
    _s.validateStringLength(
      'givenName',
      givenName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      4,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(surname, 'surname');
    _s.validateStringLength(
      'surname',
      surname,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'emailAddress',
      emailAddress,
      1,
      256,
    );
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
    );
    _s.validateStringLength(
      'timeZoneId',
      timeZoneId,
      1,
      256,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  Future<void> deactivateUser({
    required String userId,
    String? authenticationToken,
  }) async {
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [EntityNotExistsException].
  /// May throw [ProhibitedStateException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [DocumentLockedForCommentsException].
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
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  Future<void> deleteComment({
    required String commentId,
    required String documentId,
    required String versionId,
    String? authenticationToken,
  }) async {
    ArgumentError.checkNotNull(commentId, 'commentId');
    _s.validateStringLength(
      'commentId',
      commentId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [ProhibitedStateException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource, either a document or folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
    );
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
  /// May throw [EntityNotExistsException].
  /// May throw [ProhibitedStateException].
  /// May throw [ConflictingOperationException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  Future<void> deleteDocument({
    required String documentId,
    String? authenticationToken,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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

  /// Permanently deletes the specified folder and its contents.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [ProhibitedStateException].
  /// May throw [ConflictingOperationException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  Future<void> deleteFolder({
    required String folderId,
    String? authenticationToken,
  }) async {
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [EntityNotExistsException].
  /// May throw [ProhibitedStateException].
  /// May throw [ConflictingOperationException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  Future<void> deleteFolderContents({
    required String folderId,
    String? authenticationToken,
  }) async {
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [EntityNotExistsException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ProhibitedStateException].
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
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(subscriptionId, 'subscriptionId');
    _s.validateStringLength(
      'subscriptionId',
      subscriptionId,
      1,
      256,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/v1/organizations/${Uri.encodeComponent(organizationId)}/subscriptions/${Uri.encodeComponent(subscriptionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified user from a Simple AD or Microsoft AD directory.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Do not set this field when using
  /// administrative API actions, as in accessing the API using AWS credentials.
  Future<void> deleteUser({
    required String userId,
    String? authenticationToken,
  }) async {
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [InvalidArgumentException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [activityTypes] :
  /// Specifies which activity types to include in the response. If this field
  /// is left empty, all activity types are returned.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    _s.validateStringLength(
      'activityTypes',
      activityTypes,
      1,
      1024,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
    );
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
    );
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      256,
    );
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
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
  /// May throw [ProhibitedStateException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [versionId] :
  /// The ID of the document version.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [InvalidArgumentException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ProhibitedStateException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'fields',
      fields,
      1,
      256,
    );
    _s.validateStringLength(
      'include',
      include,
      1,
      256,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
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
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [InvalidArgumentException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ProhibitedStateException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'include',
      include,
      1,
      256,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (include != null) 'include': [include],
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
      if (order != null) 'order': [order.toValue()],
      if (sort != null) 'sort': [sort.toValue()],
      if (type != null) 'type': [type.toValue()],
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [searchQuery] :
  /// A query to describe groups by group name.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(searchQuery, 'searchQuery');
    _s.validateStringLength(
      'searchQuery',
      searchQuery,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
    );
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
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
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [EntityNotExistsException].
  /// May throw [ServiceUnavailableException].
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
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
    );
    _s.validateStringLength(
      'principalId',
      principalId,
      1,
      256,
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [InvalidArgumentException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
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
    ArgumentError.checkNotNull(authenticationToken, 'authenticationToken');
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidArgumentException].
  /// May throw [RequestedEntityTooLargeException].
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
  /// A query to filter users by user name.
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
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'fields',
      fields,
      1,
      256,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
    );
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
    );
    _s.validateStringLength(
      'query',
      query,
      1,
      512,
    );
    _s.validateStringLength(
      'userIds',
      userIds,
      1,
      2000,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (fields != null) 'fields': [fields],
      if (include != null) 'include': [include.toValue()],
      if (limit != null) 'limit': [limit.toString()],
      if (marker != null) 'marker': [marker],
      if (order != null) 'order': [order.toValue()],
      if (organizationId != null) 'organizationId': [organizationId],
      if (query != null) 'query': [query],
      if (sort != null) 'sort': [sort.toValue()],
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token.
  Future<GetCurrentUserResponse> getCurrentUser({
    required String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(authenticationToken, 'authenticationToken');
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
      isRequired: true,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [InvalidArgumentException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidPasswordException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  ///
  /// Parameter [includeCustomMetadata] :
  /// Set this to <code>TRUE</code> to include custom metadata in the response.
  Future<GetDocumentResponse> getDocument({
    required String documentId,
    String? authenticationToken,
    bool? includeCustomMetadata,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'fields',
      fields,
      1,
      256,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ProhibitedStateException].
  /// May throw [InvalidPasswordException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [versionId] :
  /// The version ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'fields',
      fields,
      1,
      256,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [InvalidArgumentException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ProhibitedStateException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  ///
  /// Parameter [includeCustomMetadata] :
  /// Set to TRUE to include custom metadata in the response.
  Future<GetFolderResponse> getFolder({
    required String folderId,
    String? authenticationToken,
    bool? includeCustomMetadata,
  }) async {
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'fields',
      fields,
      1,
      256,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
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
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidArgumentException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [authenticationToken] :
  /// The Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      999,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      2048,
    );
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (collectionType != null) 'collectionType': [collectionType.toValue()],
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
  /// May throw [EntityNotExistsException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [StorageLimitExceededException].
  /// May throw [StorageLimitWillExceedException].
  /// May throw [ProhibitedStateException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [DraftUploadOutOfSyncException].
  /// May throw [ResourceAlreadyCheckedOutException].
  ///
  /// Parameter [parentFolderId] :
  /// The ID of the parent folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
  Future<InitiateDocumentVersionUploadResponse> initiateDocumentVersionUpload({
    required String parentFolderId,
    String? authenticationToken,
    DateTime? contentCreatedTimestamp,
    DateTime? contentModifiedTimestamp,
    String? contentType,
    int? documentSizeInBytes,
    String? id,
    String? name,
  }) async {
    ArgumentError.checkNotNull(parentFolderId, 'parentFolderId');
    _s.validateStringLength(
      'parentFolderId',
      parentFolderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'contentType',
      contentType,
      1,
      128,
    );
    _s.validateStringLength(
      'id',
      id,
      1,
      128,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ParentFolderId': parentFolderId,
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  Future<void> removeAllResourcePermissions({
    required String resourceId,
    String? authenticationToken,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
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
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [principalId] :
  /// The principal ID of the resource.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  ///
  /// Parameter [principalType] :
  /// The principal type of the resource.
  Future<void> removeResourcePermission({
    required String principalId,
    required String resourceId,
    String? authenticationToken,
    PrincipalType? principalType,
  }) async {
    ArgumentError.checkNotNull(principalId, 'principalId');
    _s.validateStringLength(
      'principalId',
      principalId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $query = <String, List<String>>{
      if (principalType != null) 'type': [principalType.toValue()],
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

  /// Updates the specified attributes of a document. The user must have access
  /// to both the document and its parent folder, if applicable.
  ///
  /// May throw [EntityNotExistsException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ProhibitedStateException].
  /// May throw [ConflictingOperationException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
    );
    _s.validateStringLength(
      'parentFolderId',
      parentFolderId,
      1,
      128,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
      if (parentFolderId != null) 'ParentFolderId': parentFolderId,
      if (resourceState != null) 'ResourceState': resourceState.toValue(),
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
  /// May throw [EntityNotExistsException].
  /// May throw [ProhibitedStateException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidOperationException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [documentId] :
  /// The ID of the document.
  ///
  /// Parameter [versionId] :
  /// The version ID of the document.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  ///
  /// Parameter [versionStatus] :
  /// The status of the version.
  Future<void> updateDocumentVersion({
    required String documentId,
    required String versionId,
    String? authenticationToken,
    DocumentVersionStatus? versionStatus,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (versionStatus != null) 'VersionStatus': versionStatus.toValue(),
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
  /// May throw [EntityNotExistsException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [ProhibitedStateException].
  /// May throw [ConflictingOperationException].
  /// May throw [ConcurrentModificationException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [folderId] :
  /// The ID of the folder.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
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
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
    );
    _s.validateStringLength(
      'parentFolderId',
      parentFolderId,
      1,
      128,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
      if (parentFolderId != null) 'ParentFolderId': parentFolderId,
      if (resourceState != null) 'ResourceState': resourceState.toValue(),
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
  /// May throw [EntityNotExistsException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [UnauthorizedResourceAccessException].
  /// May throw [IllegalUserStateException].
  /// May throw [FailedDependencyException].
  /// May throw [ServiceUnavailableException].
  /// May throw [DeactivatingLastSystemUserException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  ///
  /// Parameter [authenticationToken] :
  /// Amazon WorkDocs authentication token. Not required when using AWS
  /// administrator credentials to access the API.
  ///
  /// Parameter [givenName] :
  /// The given name of the user.
  ///
  /// Parameter [grantPoweruserPrivileges] :
  /// Boolean value to determine whether the user is granted Poweruser
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
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    _s.validateStringLength(
      'givenName',
      givenName,
      1,
      64,
    );
    _s.validateStringLength(
      'surname',
      surname,
      1,
      64,
    );
    _s.validateStringLength(
      'timeZoneId',
      timeZoneId,
      1,
      256,
    );
    final headers = <String, String>{
      if (authenticationToken != null)
        'Authentication': authenticationToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (givenName != null) 'GivenName': givenName,
      if (grantPoweruserPrivileges != null)
        'GrantPoweruserPrivileges': grantPoweruserPrivileges.toValue(),
      if (locale != null) 'Locale': locale.toValue(),
      if (storageRule != null) 'StorageRule': storageRule,
      if (surname != null) 'Surname': surname,
      if (timeZoneId != null) 'TimeZoneId': timeZoneId,
      if (type != null) 'Type': type.toValue(),
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

/// Describes the activity information.
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
      type: (json['Type'] as String?)?.toActivityType(),
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
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ActivityType {
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
  folderMoved,
}

extension on ActivityType {
  String toValue() {
    switch (this) {
      case ActivityType.documentCheckedIn:
        return 'DOCUMENT_CHECKED_IN';
      case ActivityType.documentCheckedOut:
        return 'DOCUMENT_CHECKED_OUT';
      case ActivityType.documentRenamed:
        return 'DOCUMENT_RENAMED';
      case ActivityType.documentVersionUploaded:
        return 'DOCUMENT_VERSION_UPLOADED';
      case ActivityType.documentVersionDeleted:
        return 'DOCUMENT_VERSION_DELETED';
      case ActivityType.documentVersionViewed:
        return 'DOCUMENT_VERSION_VIEWED';
      case ActivityType.documentVersionDownloaded:
        return 'DOCUMENT_VERSION_DOWNLOADED';
      case ActivityType.documentRecycled:
        return 'DOCUMENT_RECYCLED';
      case ActivityType.documentRestored:
        return 'DOCUMENT_RESTORED';
      case ActivityType.documentReverted:
        return 'DOCUMENT_REVERTED';
      case ActivityType.documentShared:
        return 'DOCUMENT_SHARED';
      case ActivityType.documentUnshared:
        return 'DOCUMENT_UNSHARED';
      case ActivityType.documentSharePermissionChanged:
        return 'DOCUMENT_SHARE_PERMISSION_CHANGED';
      case ActivityType.documentShareableLinkCreated:
        return 'DOCUMENT_SHAREABLE_LINK_CREATED';
      case ActivityType.documentShareableLinkRemoved:
        return 'DOCUMENT_SHAREABLE_LINK_REMOVED';
      case ActivityType.documentShareableLinkPermissionChanged:
        return 'DOCUMENT_SHAREABLE_LINK_PERMISSION_CHANGED';
      case ActivityType.documentMoved:
        return 'DOCUMENT_MOVED';
      case ActivityType.documentCommentAdded:
        return 'DOCUMENT_COMMENT_ADDED';
      case ActivityType.documentCommentDeleted:
        return 'DOCUMENT_COMMENT_DELETED';
      case ActivityType.documentAnnotationAdded:
        return 'DOCUMENT_ANNOTATION_ADDED';
      case ActivityType.documentAnnotationDeleted:
        return 'DOCUMENT_ANNOTATION_DELETED';
      case ActivityType.folderCreated:
        return 'FOLDER_CREATED';
      case ActivityType.folderDeleted:
        return 'FOLDER_DELETED';
      case ActivityType.folderRenamed:
        return 'FOLDER_RENAMED';
      case ActivityType.folderRecycled:
        return 'FOLDER_RECYCLED';
      case ActivityType.folderRestored:
        return 'FOLDER_RESTORED';
      case ActivityType.folderShared:
        return 'FOLDER_SHARED';
      case ActivityType.folderUnshared:
        return 'FOLDER_UNSHARED';
      case ActivityType.folderSharePermissionChanged:
        return 'FOLDER_SHARE_PERMISSION_CHANGED';
      case ActivityType.folderShareableLinkCreated:
        return 'FOLDER_SHAREABLE_LINK_CREATED';
      case ActivityType.folderShareableLinkRemoved:
        return 'FOLDER_SHAREABLE_LINK_REMOVED';
      case ActivityType.folderShareableLinkPermissionChanged:
        return 'FOLDER_SHAREABLE_LINK_PERMISSION_CHANGED';
      case ActivityType.folderMoved:
        return 'FOLDER_MOVED';
    }
  }
}

extension on String {
  ActivityType toActivityType() {
    switch (this) {
      case 'DOCUMENT_CHECKED_IN':
        return ActivityType.documentCheckedIn;
      case 'DOCUMENT_CHECKED_OUT':
        return ActivityType.documentCheckedOut;
      case 'DOCUMENT_RENAMED':
        return ActivityType.documentRenamed;
      case 'DOCUMENT_VERSION_UPLOADED':
        return ActivityType.documentVersionUploaded;
      case 'DOCUMENT_VERSION_DELETED':
        return ActivityType.documentVersionDeleted;
      case 'DOCUMENT_VERSION_VIEWED':
        return ActivityType.documentVersionViewed;
      case 'DOCUMENT_VERSION_DOWNLOADED':
        return ActivityType.documentVersionDownloaded;
      case 'DOCUMENT_RECYCLED':
        return ActivityType.documentRecycled;
      case 'DOCUMENT_RESTORED':
        return ActivityType.documentRestored;
      case 'DOCUMENT_REVERTED':
        return ActivityType.documentReverted;
      case 'DOCUMENT_SHARED':
        return ActivityType.documentShared;
      case 'DOCUMENT_UNSHARED':
        return ActivityType.documentUnshared;
      case 'DOCUMENT_SHARE_PERMISSION_CHANGED':
        return ActivityType.documentSharePermissionChanged;
      case 'DOCUMENT_SHAREABLE_LINK_CREATED':
        return ActivityType.documentShareableLinkCreated;
      case 'DOCUMENT_SHAREABLE_LINK_REMOVED':
        return ActivityType.documentShareableLinkRemoved;
      case 'DOCUMENT_SHAREABLE_LINK_PERMISSION_CHANGED':
        return ActivityType.documentShareableLinkPermissionChanged;
      case 'DOCUMENT_MOVED':
        return ActivityType.documentMoved;
      case 'DOCUMENT_COMMENT_ADDED':
        return ActivityType.documentCommentAdded;
      case 'DOCUMENT_COMMENT_DELETED':
        return ActivityType.documentCommentDeleted;
      case 'DOCUMENT_ANNOTATION_ADDED':
        return ActivityType.documentAnnotationAdded;
      case 'DOCUMENT_ANNOTATION_DELETED':
        return ActivityType.documentAnnotationDeleted;
      case 'FOLDER_CREATED':
        return ActivityType.folderCreated;
      case 'FOLDER_DELETED':
        return ActivityType.folderDeleted;
      case 'FOLDER_RENAMED':
        return ActivityType.folderRenamed;
      case 'FOLDER_RECYCLED':
        return ActivityType.folderRecycled;
      case 'FOLDER_RESTORED':
        return ActivityType.folderRestored;
      case 'FOLDER_SHARED':
        return ActivityType.folderShared;
      case 'FOLDER_UNSHARED':
        return ActivityType.folderUnshared;
      case 'FOLDER_SHARE_PERMISSION_CHANGED':
        return ActivityType.folderSharePermissionChanged;
      case 'FOLDER_SHAREABLE_LINK_CREATED':
        return ActivityType.folderShareableLinkCreated;
      case 'FOLDER_SHAREABLE_LINK_REMOVED':
        return ActivityType.folderShareableLinkRemoved;
      case 'FOLDER_SHAREABLE_LINK_PERMISSION_CHANGED':
        return ActivityType.folderShareableLinkPermissionChanged;
      case 'FOLDER_MOVED':
        return ActivityType.folderMoved;
    }
    throw Exception('$this is not known in enum ActivityType');
  }
}

class AddResourcePermissionsResponse {
  /// The share results.
  final List<ShareResult>? shareResults;

  AddResourcePermissionsResponse({
    this.shareResults,
  });

  factory AddResourcePermissionsResponse.fromJson(Map<String, dynamic> json) {
    return AddResourcePermissionsResponse(
      shareResults: (json['ShareResults'] as List?)
          ?.whereNotNull()
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

enum BooleanEnumType {
  $true,
  $false,
}

extension on BooleanEnumType {
  String toValue() {
    switch (this) {
      case BooleanEnumType.$true:
        return 'TRUE';
      case BooleanEnumType.$false:
        return 'FALSE';
    }
  }
}

extension on String {
  BooleanEnumType toBooleanEnumType() {
    switch (this) {
      case 'TRUE':
        return BooleanEnumType.$true;
      case 'FALSE':
        return BooleanEnumType.$false;
    }
    throw Exception('$this is not known in enum BooleanEnumType');
  }
}

/// Describes a comment.
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
      commentId: json['CommentId'] as String,
      contributor: json['Contributor'] != null
          ? User.fromJson(json['Contributor'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      parentId: json['ParentId'] as String?,
      recipientId: json['RecipientId'] as String?,
      status: (json['Status'] as String?)?.toCommentStatusType(),
      text: json['Text'] as String?,
      threadId: json['ThreadId'] as String?,
      visibility: (json['Visibility'] as String?)?.toCommentVisibilityType(),
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
      if (status != null) 'Status': status.toValue(),
      if (text != null) 'Text': text,
      if (threadId != null) 'ThreadId': threadId,
      if (visibility != null) 'Visibility': visibility.toValue(),
    };
  }
}

/// Describes the metadata of a comment.
class CommentMetadata {
  /// The ID of the comment.
  final String? commentId;

  /// The status of the comment.
  final CommentStatusType? commentStatus;

  /// The user who made the comment.
  final User? contributor;

  /// The timestamp that the comment was created.
  final DateTime? createdTimestamp;

  /// The ID of the user being replied to.
  final String? recipientId;

  CommentMetadata({
    this.commentId,
    this.commentStatus,
    this.contributor,
    this.createdTimestamp,
    this.recipientId,
  });

  factory CommentMetadata.fromJson(Map<String, dynamic> json) {
    return CommentMetadata(
      commentId: json['CommentId'] as String?,
      commentStatus: (json['CommentStatus'] as String?)?.toCommentStatusType(),
      contributor: json['Contributor'] != null
          ? User.fromJson(json['Contributor'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      recipientId: json['RecipientId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commentId = this.commentId;
    final commentStatus = this.commentStatus;
    final contributor = this.contributor;
    final createdTimestamp = this.createdTimestamp;
    final recipientId = this.recipientId;
    return {
      if (commentId != null) 'CommentId': commentId,
      if (commentStatus != null) 'CommentStatus': commentStatus.toValue(),
      if (contributor != null) 'Contributor': contributor,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (recipientId != null) 'RecipientId': recipientId,
    };
  }
}

enum CommentStatusType {
  draft,
  published,
  deleted,
}

extension on CommentStatusType {
  String toValue() {
    switch (this) {
      case CommentStatusType.draft:
        return 'DRAFT';
      case CommentStatusType.published:
        return 'PUBLISHED';
      case CommentStatusType.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  CommentStatusType toCommentStatusType() {
    switch (this) {
      case 'DRAFT':
        return CommentStatusType.draft;
      case 'PUBLISHED':
        return CommentStatusType.published;
      case 'DELETED':
        return CommentStatusType.deleted;
    }
    throw Exception('$this is not known in enum CommentStatusType');
  }
}

enum CommentVisibilityType {
  public,
  private,
}

extension on CommentVisibilityType {
  String toValue() {
    switch (this) {
      case CommentVisibilityType.public:
        return 'PUBLIC';
      case CommentVisibilityType.private:
        return 'PRIVATE';
    }
  }
}

extension on String {
  CommentVisibilityType toCommentVisibilityType() {
    switch (this) {
      case 'PUBLIC':
        return CommentVisibilityType.public;
      case 'PRIVATE':
        return CommentVisibilityType.private;
    }
    throw Exception('$this is not known in enum CommentVisibilityType');
  }
}

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

class CreateCustomMetadataResponse {
  CreateCustomMetadataResponse();

  factory CreateCustomMetadataResponse.fromJson(Map<String, dynamic> _) {
    return CreateCustomMetadataResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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

class CreateLabelsResponse {
  CreateLabelsResponse();

  factory CreateLabelsResponse.fromJson(Map<String, dynamic> _) {
    return CreateLabelsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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

class DeleteCustomMetadataResponse {
  DeleteCustomMetadataResponse();

  factory DeleteCustomMetadataResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCustomMetadataResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLabelsResponse {
  DeleteLabelsResponse();

  factory DeleteLabelsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLabelsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
          .map((e) => DocumentMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      folders: (json['Folders'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

/// Describes the document.
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
      labels: (json['Labels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      latestVersionMetadata: json['LatestVersionMetadata'] != null
          ? DocumentVersionMetadata.fromJson(
              json['LatestVersionMetadata'] as Map<String, dynamic>)
          : null,
      modifiedTimestamp: timeStampFromJson(json['ModifiedTimestamp']),
      parentFolderId: json['ParentFolderId'] as String?,
      resourceState: (json['ResourceState'] as String?)?.toResourceStateType(),
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
      if (resourceState != null) 'ResourceState': resourceState.toValue(),
    };
  }
}

enum DocumentSourceType {
  original,
  withComments,
}

extension on DocumentSourceType {
  String toValue() {
    switch (this) {
      case DocumentSourceType.original:
        return 'ORIGINAL';
      case DocumentSourceType.withComments:
        return 'WITH_COMMENTS';
    }
  }
}

extension on String {
  DocumentSourceType toDocumentSourceType() {
    switch (this) {
      case 'ORIGINAL':
        return DocumentSourceType.original;
      case 'WITH_COMMENTS':
        return DocumentSourceType.withComments;
    }
    throw Exception('$this is not known in enum DocumentSourceType');
  }
}

enum DocumentStatusType {
  initialized,
  active,
}

extension on DocumentStatusType {
  String toValue() {
    switch (this) {
      case DocumentStatusType.initialized:
        return 'INITIALIZED';
      case DocumentStatusType.active:
        return 'ACTIVE';
    }
  }
}

extension on String {
  DocumentStatusType toDocumentStatusType() {
    switch (this) {
      case 'INITIALIZED':
        return DocumentStatusType.initialized;
      case 'ACTIVE':
        return DocumentStatusType.active;
    }
    throw Exception('$this is not known in enum DocumentStatusType');
  }
}

enum DocumentThumbnailType {
  small,
  smallHq,
  large,
}

extension on DocumentThumbnailType {
  String toValue() {
    switch (this) {
      case DocumentThumbnailType.small:
        return 'SMALL';
      case DocumentThumbnailType.smallHq:
        return 'SMALL_HQ';
      case DocumentThumbnailType.large:
        return 'LARGE';
    }
  }
}

extension on String {
  DocumentThumbnailType toDocumentThumbnailType() {
    switch (this) {
      case 'SMALL':
        return DocumentThumbnailType.small;
      case 'SMALL_HQ':
        return DocumentThumbnailType.smallHq;
      case 'LARGE':
        return DocumentThumbnailType.large;
    }
    throw Exception('$this is not known in enum DocumentThumbnailType');
  }
}

/// Describes a version of a document.
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
      source: (json['Source'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toDocumentSourceType(), e as String)),
      status: (json['Status'] as String?)?.toDocumentStatusType(),
      thumbnail: (json['Thumbnail'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toDocumentThumbnailType(), e as String)),
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
      if (source != null)
        'Source': source.map((k, e) => MapEntry(k.toValue(), e)),
      if (status != null) 'Status': status.toValue(),
      if (thumbnail != null)
        'Thumbnail': thumbnail.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

enum DocumentVersionStatus {
  active,
}

extension on DocumentVersionStatus {
  String toValue() {
    switch (this) {
      case DocumentVersionStatus.active:
        return 'ACTIVE';
    }
  }
}

extension on String {
  DocumentVersionStatus toDocumentVersionStatus() {
    switch (this) {
      case 'ACTIVE':
        return DocumentVersionStatus.active;
    }
    throw Exception('$this is not known in enum DocumentVersionStatus');
  }
}

enum FolderContentType {
  all,
  document,
  folder,
}

extension on FolderContentType {
  String toValue() {
    switch (this) {
      case FolderContentType.all:
        return 'ALL';
      case FolderContentType.document:
        return 'DOCUMENT';
      case FolderContentType.folder:
        return 'FOLDER';
    }
  }
}

extension on String {
  FolderContentType toFolderContentType() {
    switch (this) {
      case 'ALL':
        return FolderContentType.all;
      case 'DOCUMENT':
        return FolderContentType.document;
      case 'FOLDER':
        return FolderContentType.folder;
    }
    throw Exception('$this is not known in enum FolderContentType');
  }
}

/// Describes a folder.
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
      labels: (json['Labels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      latestVersionSize: json['LatestVersionSize'] as int?,
      modifiedTimestamp: timeStampFromJson(json['ModifiedTimestamp']),
      name: json['Name'] as String?,
      parentFolderId: json['ParentFolderId'] as String?,
      resourceState: (json['ResourceState'] as String?)?.toResourceStateType(),
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
      if (resourceState != null) 'ResourceState': resourceState.toValue(),
      if (signature != null) 'Signature': signature,
      if (size != null) 'Size': size,
    };
  }
}

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
          ?.whereNotNull()
          .map((e) => DocumentMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      folders: (json['Folders'] as List?)
          ?.whereNotNull()
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

/// Describes the metadata of a user group.
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

enum LocaleType {
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
  $default,
}

extension on LocaleType {
  String toValue() {
    switch (this) {
      case LocaleType.en:
        return 'en';
      case LocaleType.fr:
        return 'fr';
      case LocaleType.ko:
        return 'ko';
      case LocaleType.de:
        return 'de';
      case LocaleType.es:
        return 'es';
      case LocaleType.ja:
        return 'ja';
      case LocaleType.ru:
        return 'ru';
      case LocaleType.zhCn:
        return 'zh_CN';
      case LocaleType.zhTw:
        return 'zh_TW';
      case LocaleType.ptBr:
        return 'pt_BR';
      case LocaleType.$default:
        return 'default';
    }
  }
}

extension on String {
  LocaleType toLocaleType() {
    switch (this) {
      case 'en':
        return LocaleType.en;
      case 'fr':
        return LocaleType.fr;
      case 'ko':
        return LocaleType.ko;
      case 'de':
        return LocaleType.de;
      case 'es':
        return LocaleType.es;
      case 'ja':
        return LocaleType.ja;
      case 'ru':
        return LocaleType.ru;
      case 'zh_CN':
        return LocaleType.zhCn;
      case 'zh_TW':
        return LocaleType.zhTw;
      case 'pt_BR':
        return LocaleType.ptBr;
      case 'default':
        return LocaleType.$default;
    }
    throw Exception('$this is not known in enum LocaleType');
  }
}

/// Set of options which defines notification preferences of given action.
class NotificationOptions {
  /// Text value to be included in the email body.
  final String? emailMessage;

  /// Boolean value to indicate an email notification should be sent to the
  /// receipients.
  final bool? sendEmail;

  NotificationOptions({
    this.emailMessage,
    this.sendEmail,
  });

  factory NotificationOptions.fromJson(Map<String, dynamic> json) {
    return NotificationOptions(
      emailMessage: json['EmailMessage'] as String?,
      sendEmail: json['SendEmail'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailMessage = this.emailMessage;
    final sendEmail = this.sendEmail;
    return {
      if (emailMessage != null) 'EmailMessage': emailMessage,
      if (sendEmail != null) 'SendEmail': sendEmail,
    };
  }
}

enum OrderType {
  ascending,
  descending,
}

extension on OrderType {
  String toValue() {
    switch (this) {
      case OrderType.ascending:
        return 'ASCENDING';
      case OrderType.descending:
        return 'DESCENDING';
    }
  }
}

extension on String {
  OrderType toOrderType() {
    switch (this) {
      case 'ASCENDING':
        return OrderType.ascending;
      case 'DESCENDING':
        return OrderType.descending;
    }
    throw Exception('$this is not known in enum OrderType');
  }
}

/// Describes the users or user groups.
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
          ?.whereNotNull()
          .map((e) => GroupMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['Users'] as List?)
          ?.whereNotNull()
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

/// Describes the permissions.
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
      role: (json['Role'] as String?)?.toRoleType(),
      type: (json['Type'] as String?)?.toRolePermissionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    final type = this.type;
    return {
      if (role != null) 'Role': role.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Describes a resource.
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
          ?.whereNotNull()
          .map((e) => PermissionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final roles = this.roles;
    final type = this.type;
    return {
      if (id != null) 'Id': id,
      if (roles != null) 'Roles': roles,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum PrincipalType {
  user,
  group,
  invite,
  anonymous,
  organization,
}

extension on PrincipalType {
  String toValue() {
    switch (this) {
      case PrincipalType.user:
        return 'USER';
      case PrincipalType.group:
        return 'GROUP';
      case PrincipalType.invite:
        return 'INVITE';
      case PrincipalType.anonymous:
        return 'ANONYMOUS';
      case PrincipalType.organization:
        return 'ORGANIZATION';
    }
  }
}

extension on String {
  PrincipalType toPrincipalType() {
    switch (this) {
      case 'USER':
        return PrincipalType.user;
      case 'GROUP':
        return PrincipalType.group;
      case 'INVITE':
        return PrincipalType.invite;
      case 'ANONYMOUS':
        return PrincipalType.anonymous;
      case 'ORGANIZATION':
        return PrincipalType.organization;
    }
    throw Exception('$this is not known in enum PrincipalType');
  }
}

enum ResourceCollectionType {
  sharedWithMe,
}

extension on ResourceCollectionType {
  String toValue() {
    switch (this) {
      case ResourceCollectionType.sharedWithMe:
        return 'SHARED_WITH_ME';
    }
  }
}

extension on String {
  ResourceCollectionType toResourceCollectionType() {
    switch (this) {
      case 'SHARED_WITH_ME':
        return ResourceCollectionType.sharedWithMe;
    }
    throw Exception('$this is not known in enum ResourceCollectionType');
  }
}

/// Describes the metadata of a resource.
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
      type: (json['Type'] as String?)?.toResourceType(),
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
      if (type != null) 'Type': type.toValue(),
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// Describes the path information of a resource.
class ResourcePath {
  /// The components of the resource path.
  final List<ResourcePathComponent>? components;

  ResourcePath({
    this.components,
  });

  factory ResourcePath.fromJson(Map<String, dynamic> json) {
    return ResourcePath(
      components: (json['Components'] as List?)
          ?.whereNotNull()
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

enum ResourceSortType {
  date,
  name,
}

extension on ResourceSortType {
  String toValue() {
    switch (this) {
      case ResourceSortType.date:
        return 'DATE';
      case ResourceSortType.name:
        return 'NAME';
    }
  }
}

extension on String {
  ResourceSortType toResourceSortType() {
    switch (this) {
      case 'DATE':
        return ResourceSortType.date;
      case 'NAME':
        return ResourceSortType.name;
    }
    throw Exception('$this is not known in enum ResourceSortType');
  }
}

enum ResourceStateType {
  active,
  restoring,
  recycling,
  recycled,
}

extension on ResourceStateType {
  String toValue() {
    switch (this) {
      case ResourceStateType.active:
        return 'ACTIVE';
      case ResourceStateType.restoring:
        return 'RESTORING';
      case ResourceStateType.recycling:
        return 'RECYCLING';
      case ResourceStateType.recycled:
        return 'RECYCLED';
    }
  }
}

extension on String {
  ResourceStateType toResourceStateType() {
    switch (this) {
      case 'ACTIVE':
        return ResourceStateType.active;
      case 'RESTORING':
        return ResourceStateType.restoring;
      case 'RECYCLING':
        return ResourceStateType.recycling;
      case 'RECYCLED':
        return ResourceStateType.recycled;
    }
    throw Exception('$this is not known in enum ResourceStateType');
  }
}

enum ResourceType {
  folder,
  document,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.folder:
        return 'FOLDER';
      case ResourceType.document:
        return 'DOCUMENT';
    }
  }
}

extension on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'FOLDER':
        return ResourceType.folder;
      case 'DOCUMENT':
        return ResourceType.document;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

enum RolePermissionType {
  direct,
  inherited,
}

extension on RolePermissionType {
  String toValue() {
    switch (this) {
      case RolePermissionType.direct:
        return 'DIRECT';
      case RolePermissionType.inherited:
        return 'INHERITED';
    }
  }
}

extension on String {
  RolePermissionType toRolePermissionType() {
    switch (this) {
      case 'DIRECT':
        return RolePermissionType.direct;
      case 'INHERITED':
        return RolePermissionType.inherited;
    }
    throw Exception('$this is not known in enum RolePermissionType');
  }
}

enum RoleType {
  viewer,
  contributor,
  owner,
  coowner,
}

extension on RoleType {
  String toValue() {
    switch (this) {
      case RoleType.viewer:
        return 'VIEWER';
      case RoleType.contributor:
        return 'CONTRIBUTOR';
      case RoleType.owner:
        return 'OWNER';
      case RoleType.coowner:
        return 'COOWNER';
    }
  }
}

extension on String {
  RoleType toRoleType() {
    switch (this) {
      case 'VIEWER':
        return RoleType.viewer;
      case 'CONTRIBUTOR':
        return RoleType.contributor;
      case 'OWNER':
        return RoleType.owner;
      case 'COOWNER':
        return RoleType.coowner;
    }
    throw Exception('$this is not known in enum RoleType');
  }
}

/// Describes the recipient type and ID, if available.
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

  factory SharePrincipal.fromJson(Map<String, dynamic> json) {
    return SharePrincipal(
      id: json['Id'] as String,
      role: (json['Role'] as String).toRoleType(),
      type: (json['Type'] as String).toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final role = this.role;
    final type = this.type;
    return {
      'Id': id,
      'Role': role.toValue(),
      'Type': type.toValue(),
    };
  }
}

/// Describes the share results of a resource.
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
      role: (json['Role'] as String?)?.toRoleType(),
      shareId: json['ShareId'] as String?,
      status: (json['Status'] as String?)?.toShareStatusType(),
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
      if (role != null) 'Role': role.toValue(),
      if (shareId != null) 'ShareId': shareId,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum ShareStatusType {
  success,
  failure,
}

extension on ShareStatusType {
  String toValue() {
    switch (this) {
      case ShareStatusType.success:
        return 'SUCCESS';
      case ShareStatusType.failure:
        return 'FAILURE';
    }
  }
}

extension on String {
  ShareStatusType toShareStatusType() {
    switch (this) {
      case 'SUCCESS':
        return ShareStatusType.success;
      case 'FAILURE':
        return ShareStatusType.failure;
    }
    throw Exception('$this is not known in enum ShareStatusType');
  }
}

/// Describes the storage for a user.
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
      storageType: (json['StorageType'] as String?)?.toStorageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final storageAllocatedInBytes = this.storageAllocatedInBytes;
    final storageType = this.storageType;
    return {
      if (storageAllocatedInBytes != null)
        'StorageAllocatedInBytes': storageAllocatedInBytes,
      if (storageType != null) 'StorageType': storageType.toValue(),
    };
  }
}

enum StorageType {
  unlimited,
  quota,
}

extension on StorageType {
  String toValue() {
    switch (this) {
      case StorageType.unlimited:
        return 'UNLIMITED';
      case StorageType.quota:
        return 'QUOTA';
    }
  }
}

extension on String {
  StorageType toStorageType() {
    switch (this) {
      case 'UNLIMITED':
        return StorageType.unlimited;
      case 'QUOTA':
        return StorageType.quota;
    }
    throw Exception('$this is not known in enum StorageType');
  }
}

/// Describes a subscription.
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
      protocol: (json['Protocol'] as String?)?.toSubscriptionProtocolType(),
      subscriptionId: json['SubscriptionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endPoint = this.endPoint;
    final protocol = this.protocol;
    final subscriptionId = this.subscriptionId;
    return {
      if (endPoint != null) 'EndPoint': endPoint,
      if (protocol != null) 'Protocol': protocol.toValue(),
      if (subscriptionId != null) 'SubscriptionId': subscriptionId,
    };
  }
}

enum SubscriptionProtocolType {
  https,
}

extension on SubscriptionProtocolType {
  String toValue() {
    switch (this) {
      case SubscriptionProtocolType.https:
        return 'HTTPS';
    }
  }
}

extension on String {
  SubscriptionProtocolType toSubscriptionProtocolType() {
    switch (this) {
      case 'HTTPS':
        return SubscriptionProtocolType.https;
    }
    throw Exception('$this is not known in enum SubscriptionProtocolType');
  }
}

enum SubscriptionType {
  all,
}

extension on SubscriptionType {
  String toValue() {
    switch (this) {
      case SubscriptionType.all:
        return 'ALL';
    }
  }
}

extension on String {
  SubscriptionType toSubscriptionType() {
    switch (this) {
      case 'ALL':
        return SubscriptionType.all;
    }
    throw Exception('$this is not known in enum SubscriptionType');
  }
}

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

/// Describes the upload.
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

/// Describes a user.
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
      locale: (json['Locale'] as String?)?.toLocaleType(),
      modifiedTimestamp: timeStampFromJson(json['ModifiedTimestamp']),
      organizationId: json['OrganizationId'] as String?,
      recycleBinFolderId: json['RecycleBinFolderId'] as String?,
      rootFolderId: json['RootFolderId'] as String?,
      status: (json['Status'] as String?)?.toUserStatusType(),
      storage: json['Storage'] != null
          ? UserStorageMetadata.fromJson(
              json['Storage'] as Map<String, dynamic>)
          : null,
      surname: json['Surname'] as String?,
      timeZoneId: json['TimeZoneId'] as String?,
      type: (json['Type'] as String?)?.toUserType(),
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
      if (locale != null) 'Locale': locale.toValue(),
      if (modifiedTimestamp != null)
        'ModifiedTimestamp': unixTimestampToJson(modifiedTimestamp),
      if (organizationId != null) 'OrganizationId': organizationId,
      if (recycleBinFolderId != null) 'RecycleBinFolderId': recycleBinFolderId,
      if (rootFolderId != null) 'RootFolderId': rootFolderId,
      if (status != null) 'Status': status.toValue(),
      if (storage != null) 'Storage': storage,
      if (surname != null) 'Surname': surname,
      if (timeZoneId != null) 'TimeZoneId': timeZoneId,
      if (type != null) 'Type': type.toValue(),
      if (username != null) 'Username': username,
    };
  }
}

enum UserFilterType {
  all,
  activePending,
}

extension on UserFilterType {
  String toValue() {
    switch (this) {
      case UserFilterType.all:
        return 'ALL';
      case UserFilterType.activePending:
        return 'ACTIVE_PENDING';
    }
  }
}

extension on String {
  UserFilterType toUserFilterType() {
    switch (this) {
      case 'ALL':
        return UserFilterType.all;
      case 'ACTIVE_PENDING':
        return UserFilterType.activePending;
    }
    throw Exception('$this is not known in enum UserFilterType');
  }
}

/// Describes the metadata of the user.
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

enum UserSortType {
  userName,
  fullName,
  storageLimit,
  userStatus,
  storageUsed,
}

extension on UserSortType {
  String toValue() {
    switch (this) {
      case UserSortType.userName:
        return 'USER_NAME';
      case UserSortType.fullName:
        return 'FULL_NAME';
      case UserSortType.storageLimit:
        return 'STORAGE_LIMIT';
      case UserSortType.userStatus:
        return 'USER_STATUS';
      case UserSortType.storageUsed:
        return 'STORAGE_USED';
    }
  }
}

extension on String {
  UserSortType toUserSortType() {
    switch (this) {
      case 'USER_NAME':
        return UserSortType.userName;
      case 'FULL_NAME':
        return UserSortType.fullName;
      case 'STORAGE_LIMIT':
        return UserSortType.storageLimit;
      case 'USER_STATUS':
        return UserSortType.userStatus;
      case 'STORAGE_USED':
        return UserSortType.storageUsed;
    }
    throw Exception('$this is not known in enum UserSortType');
  }
}

enum UserStatusType {
  active,
  inactive,
  pending,
}

extension on UserStatusType {
  String toValue() {
    switch (this) {
      case UserStatusType.active:
        return 'ACTIVE';
      case UserStatusType.inactive:
        return 'INACTIVE';
      case UserStatusType.pending:
        return 'PENDING';
    }
  }
}

extension on String {
  UserStatusType toUserStatusType() {
    switch (this) {
      case 'ACTIVE':
        return UserStatusType.active;
      case 'INACTIVE':
        return UserStatusType.inactive;
      case 'PENDING':
        return UserStatusType.pending;
    }
    throw Exception('$this is not known in enum UserStatusType');
  }
}

/// Describes the storage for a user.
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

enum UserType {
  user,
  admin,
  poweruser,
  minimaluser,
  workspacesuser,
}

extension on UserType {
  String toValue() {
    switch (this) {
      case UserType.user:
        return 'USER';
      case UserType.admin:
        return 'ADMIN';
      case UserType.poweruser:
        return 'POWERUSER';
      case UserType.minimaluser:
        return 'MINIMALUSER';
      case UserType.workspacesuser:
        return 'WORKSPACESUSER';
    }
  }
}

extension on String {
  UserType toUserType() {
    switch (this) {
      case 'USER':
        return UserType.user;
      case 'ADMIN':
        return UserType.admin;
      case 'POWERUSER':
        return UserType.poweruser;
      case 'MINIMALUSER':
        return UserType.minimaluser;
      case 'WORKSPACESUSER':
        return UserType.workspacesuser;
    }
    throw Exception('$this is not known in enum UserType');
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConflictingOperationException extends _s.GenericAwsException {
  ConflictingOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConflictingOperationException',
            message: message);
}

class CustomMetadataLimitExceededException extends _s.GenericAwsException {
  CustomMetadataLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CustomMetadataLimitExceededException',
            message: message);
}

class DeactivatingLastSystemUserException extends _s.GenericAwsException {
  DeactivatingLastSystemUserException({String? type, String? message})
      : super(
            type: type,
            code: 'DeactivatingLastSystemUserException',
            message: message);
}

class DocumentLockedForCommentsException extends _s.GenericAwsException {
  DocumentLockedForCommentsException({String? type, String? message})
      : super(
            type: type,
            code: 'DocumentLockedForCommentsException',
            message: message);
}

class DraftUploadOutOfSyncException extends _s.GenericAwsException {
  DraftUploadOutOfSyncException({String? type, String? message})
      : super(
            type: type,
            code: 'DraftUploadOutOfSyncException',
            message: message);
}

class EntityAlreadyExistsException extends _s.GenericAwsException {
  EntityAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'EntityAlreadyExistsException', message: message);
}

class EntityNotExistsException extends _s.GenericAwsException {
  EntityNotExistsException({String? type, String? message})
      : super(type: type, code: 'EntityNotExistsException', message: message);
}

class FailedDependencyException extends _s.GenericAwsException {
  FailedDependencyException({String? type, String? message})
      : super(type: type, code: 'FailedDependencyException', message: message);
}

class IllegalUserStateException extends _s.GenericAwsException {
  IllegalUserStateException({String? type, String? message})
      : super(type: type, code: 'IllegalUserStateException', message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidCommentOperationException extends _s.GenericAwsException {
  InvalidCommentOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCommentOperationException',
            message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String? type, String? message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidPasswordException extends _s.GenericAwsException {
  InvalidPasswordException({String? type, String? message})
      : super(type: type, code: 'InvalidPasswordException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ProhibitedStateException extends _s.GenericAwsException {
  ProhibitedStateException({String? type, String? message})
      : super(type: type, code: 'ProhibitedStateException', message: message);
}

class RequestedEntityTooLargeException extends _s.GenericAwsException {
  RequestedEntityTooLargeException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestedEntityTooLargeException',
            message: message);
}

class ResourceAlreadyCheckedOutException extends _s.GenericAwsException {
  ResourceAlreadyCheckedOutException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyCheckedOutException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class StorageLimitExceededException extends _s.GenericAwsException {
  StorageLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'StorageLimitExceededException',
            message: message);
}

class StorageLimitWillExceedException extends _s.GenericAwsException {
  StorageLimitWillExceedException({String? type, String? message})
      : super(
            type: type,
            code: 'StorageLimitWillExceedException',
            message: message);
}

class TooManyLabelsException extends _s.GenericAwsException {
  TooManyLabelsException({String? type, String? message})
      : super(type: type, code: 'TooManyLabelsException', message: message);
}

class TooManySubscriptionsException extends _s.GenericAwsException {
  TooManySubscriptionsException({String? type, String? message})
      : super(
            type: type,
            code: 'TooManySubscriptionsException',
            message: message);
}

class UnauthorizedOperationException extends _s.GenericAwsException {
  UnauthorizedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnauthorizedOperationException',
            message: message);
}

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
