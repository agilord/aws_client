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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2016-05-01.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String documentId,
    @_s.required String versionId,
    String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String userId,
    String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[&\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required List<SharePrincipal> principals,
    @_s.required String resourceId,
    String authenticationToken,
    NotificationOptions notificationOptions,
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
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String documentId,
    @_s.required String text,
    @_s.required String versionId,
    String authenticationToken,
    bool notifyCollaborators,
    String parentId,
    String threadId,
    CommentVisibilityType visibility,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'parentId',
      parentId,
      r'''[\w+-.@]+''',
    );
    _s.validateStringLength(
      'threadId',
      threadId,
      1,
      128,
    );
    _s.validateStringPattern(
      'threadId',
      threadId,
      r'''[\w+-.@]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required Map<String, String> customMetadata,
    @_s.required String resourceId,
    String authenticationToken,
    String versionId,
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
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[\w+-.@]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    return CreateCustomMetadataResponse.fromJson(response);
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
    @_s.required String parentFolderId,
    String authenticationToken,
    String name,
  }) async {
    ArgumentError.checkNotNull(parentFolderId, 'parentFolderId');
    _s.validateStringLength(
      'parentFolderId',
      parentFolderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'parentFolderId',
      parentFolderId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\u202D\u202F-\uFFFF]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required List<String> labels,
    @_s.required String resourceId,
    String authenticationToken,
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
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    return CreateLabelsResponse.fromJson(response);
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
    @_s.required String endpoint,
    @_s.required String organizationId,
    @_s.required SubscriptionProtocolType protocol,
    @_s.required SubscriptionType subscriptionType,
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
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''[&\w+-.@]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(protocol, 'protocol');
    ArgumentError.checkNotNull(subscriptionType, 'subscriptionType');
    final $payload = <String, dynamic>{
      'Endpoint': endpoint,
      'Protocol': protocol?.toValue() ?? '',
      'SubscriptionType': subscriptionType?.toValue() ?? '',
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
    @_s.required String givenName,
    @_s.required String password,
    @_s.required String surname,
    @_s.required String username,
    String authenticationToken,
    String emailAddress,
    String organizationId,
    StorageRuleType storageRule,
    String timeZoneId,
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
    _s.validateStringPattern(
      'password',
      password,
      r'''[\u0020-\u00FF]+''',
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
    _s.validateStringPattern(
      'username',
      username,
      r'''[\w\-+.]+(@[a-zA-Z0-9.\-]+\.[a-zA-Z]+)?''',
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
    _s.validateStringPattern(
      'emailAddress',
      emailAddress,
      r'''[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}''',
    );
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
    );
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''[&\w+-.@]+''',
    );
    _s.validateStringLength(
      'timeZoneId',
      timeZoneId,
      1,
      256,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String userId,
    String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[&\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String commentId,
    @_s.required String documentId,
    @_s.required String versionId,
    String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(commentId, 'commentId');
    _s.validateStringLength(
      'commentId',
      commentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'commentId',
      commentId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String resourceId,
    String authenticationToken,
    bool deleteAll,
    List<String> keys,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[\w+-.@]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    return DeleteCustomMetadataResponse.fromJson(response);
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
    @_s.required String documentId,
    String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String folderId,
    String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'folderId',
      folderId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String folderId,
    String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'folderId',
      folderId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String resourceId,
    String authenticationToken,
    bool deleteAll,
    List<String> labels,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    return DeleteLabelsResponse.fromJson(response);
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
    @_s.required String organizationId,
    @_s.required String subscriptionId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''[&\w+-.@]+''',
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
    _s.validateStringPattern(
      'subscriptionId',
      subscriptionId,
      r'''[&\w+-.@]+''',
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
    @_s.required String userId,
    String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[&\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    String activityTypes,
    String authenticationToken,
    DateTime endTime,
    bool includeIndirectActivities,
    int limit,
    String marker,
    String organizationId,
    String resourceId,
    DateTime startTime,
    String userId,
  }) async {
    _s.validateStringLength(
      'activityTypes',
      activityTypes,
      1,
      1024,
    );
    _s.validateStringPattern(
      'activityTypes',
      activityTypes,
      r'''[\w,]+''',
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
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0000-\u00FF]+''',
    );
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
    );
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''[&\w+-.@]+''',
    );
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      256,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[&\w+-.@]+''',
    );
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[&\w+-.@]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String documentId,
    @_s.required String versionId,
    String authenticationToken,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0000-\u00FF]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String documentId,
    String authenticationToken,
    String fields,
    String include,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'fields',
      fields,
      r'''[\w,]+''',
    );
    _s.validateStringLength(
      'include',
      include,
      1,
      256,
    );
    _s.validateStringPattern(
      'include',
      include,
      r'''[\w,]+''',
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
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String folderId,
    String authenticationToken,
    String include,
    int limit,
    String marker,
    OrderType order,
    ResourceSortType sort,
    FolderContentType type,
  }) async {
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'folderId',
      folderId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'include',
      include,
      r'''[\w,]+''',
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
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String searchQuery,
    String authenticationToken,
    int limit,
    String marker,
    String organizationId,
  }) async {
    ArgumentError.checkNotNull(searchQuery, 'searchQuery');
    _s.validateStringLength(
      'searchQuery',
      searchQuery,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'searchQuery',
      searchQuery,
      r'''[\u0020-\uFFFF]+''',
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
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0000-\u00FF]+''',
    );
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
    );
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''[&\w+-.@]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
    final $query = <String, List<String>>{
      if (searchQuery != null) 'searchQuery': [searchQuery],
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
    @_s.required String organizationId,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''[&\w+-.@]+''',
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
    @_s.required String resourceId,
    String authenticationToken,
    int limit,
    String marker,
    String principalId,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'principalId',
      principalId,
      r'''[&\w+-.@]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String authenticationToken,
    int limit,
    String marker,
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
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    String authenticationToken,
    String fields,
    UserFilterType include,
    int limit,
    String marker,
    OrderType order,
    String organizationId,
    String query,
    UserSortType sort,
    String userIds,
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
    _s.validateStringPattern(
      'fields',
      fields,
      r'''[\w,]+''',
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
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''[&\w+-.@]+''',
    );
    _s.validateStringLength(
      'query',
      query,
      1,
      512,
    );
    _s.validateStringPattern(
      'query',
      query,
      r'''[\u0020-\uFFFF]+''',
    );
    _s.validateStringLength(
      'userIds',
      userIds,
      1,
      2000,
    );
    _s.validateStringPattern(
      'userIds',
      userIds,
      r'''[&\w+-.@, ]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(authenticationToken, 'authenticationToken');
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
      isRequired: true,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String documentId,
    String authenticationToken,
    bool includeCustomMetadata,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String documentId,
    String authenticationToken,
    String fields,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[&\w+-.@]+''',
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
    _s.validateStringPattern(
      'fields',
      fields,
      r'''[\w,]+''',
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
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String documentId,
    @_s.required String versionId,
    String authenticationToken,
    String fields,
    bool includeCustomMetadata,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'fields',
      fields,
      r'''[\w,]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String folderId,
    String authenticationToken,
    bool includeCustomMetadata,
  }) async {
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'folderId',
      folderId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String folderId,
    String authenticationToken,
    String fields,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'folderId',
      folderId,
      r'''[&\w+-.@]+''',
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
    _s.validateStringPattern(
      'fields',
      fields,
      r'''[\w,]+''',
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
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    String authenticationToken,
    ResourceCollectionType collectionType,
    int limit,
    String marker,
    String userId,
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
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[&\w+-.@]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String parentFolderId,
    String authenticationToken,
    DateTime contentCreatedTimestamp,
    DateTime contentModifiedTimestamp,
    String contentType,
    int documentSizeInBytes,
    String id,
    String name,
  }) async {
    ArgumentError.checkNotNull(parentFolderId, 'parentFolderId');
    _s.validateStringLength(
      'parentFolderId',
      parentFolderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'parentFolderId',
      parentFolderId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'id',
      id,
      r'''[\w+-.@]+''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\u202D\u202F-\uFFFF]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String resourceId,
    String authenticationToken,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String principalId,
    @_s.required String resourceId,
    String authenticationToken,
    PrincipalType principalType,
  }) async {
    ArgumentError.checkNotNull(principalId, 'principalId');
    _s.validateStringLength(
      'principalId',
      principalId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'principalId',
      principalId,
      r'''[&\w+-.@]+''',
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
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String documentId,
    String authenticationToken,
    String name,
    String parentFolderId,
    ResourceStateType resourceState,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\u202D\u202F-\uFFFF]+''',
    );
    _s.validateStringLength(
      'parentFolderId',
      parentFolderId,
      1,
      128,
    );
    _s.validateStringPattern(
      'parentFolderId',
      parentFolderId,
      r'''[\w+-.@]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String documentId,
    @_s.required String versionId,
    String authenticationToken,
    DocumentVersionStatus versionStatus,
  }) async {
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[\w+-.@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authenticationToken',
      authenticationToken,
      1,
      8199,
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String folderId,
    String authenticationToken,
    String name,
    String parentFolderId,
    ResourceStateType resourceState,
  }) async {
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'folderId',
      folderId,
      r'''[\w+-.@]+''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\u202D\u202F-\uFFFF]+''',
    );
    _s.validateStringLength(
      'parentFolderId',
      parentFolderId,
      1,
      128,
    );
    _s.validateStringPattern(
      'parentFolderId',
      parentFolderId,
      r'''[\w+-.@]+''',
    );
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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
    @_s.required String userId,
    String authenticationToken,
    String givenName,
    BooleanEnumType grantPoweruserPrivileges,
    LocaleType locale,
    StorageRuleType storageRule,
    String surname,
    String timeZoneId,
    UserType type,
  }) async {
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[&\w+-.@]+''',
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
    final headers = <String, String>{};
    authenticationToken?.let((v) => headers['Authentication'] = v.toString());
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivateUserResponse {
  /// The user information.
  @_s.JsonKey(name: 'User')
  final User user;

  ActivateUserResponse({
    this.user,
  });
  factory ActivateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivateUserResponseFromJson(json);
}

/// Describes the activity information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Activity {
  /// Metadata of the commenting activity. This is an optional field and is filled
  /// for commenting activities.
  @_s.JsonKey(name: 'CommentMetadata')
  final CommentMetadata commentMetadata;

  /// The user who performed the action.
  @_s.JsonKey(name: 'Initiator')
  final UserMetadata initiator;

  /// Indicates whether an activity is indirect or direct. An indirect activity
  /// results from a direct activity performed on a parent resource. For example,
  /// sharing a parent folder (the direct activity) shares all of the subfolders
  /// and documents within the parent folder (the indirect activity).
  @_s.JsonKey(name: 'IsIndirectActivity')
  final bool isIndirectActivity;

  /// The ID of the organization.
  @_s.JsonKey(name: 'OrganizationId')
  final String organizationId;

  /// The original parent of the resource. This is an optional field and is filled
  /// for move activities.
  @_s.JsonKey(name: 'OriginalParent')
  final ResourceMetadata originalParent;

  /// The list of users or groups impacted by this action. This is an optional
  /// field and is filled for the following sharing activities: DOCUMENT_SHARED,
  /// DOCUMENT_SHARED, DOCUMENT_UNSHARED, FOLDER_SHARED, FOLDER_UNSHARED.
  @_s.JsonKey(name: 'Participants')
  final Participants participants;

  /// The metadata of the resource involved in the user action.
  @_s.JsonKey(name: 'ResourceMetadata')
  final ResourceMetadata resourceMetadata;

  /// The timestamp when the action was performed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'TimeStamp')
  final DateTime timeStamp;

  /// The activity type.
  @_s.JsonKey(name: 'Type')
  final ActivityType type;

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
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}

enum ActivityType {
  @_s.JsonValue('DOCUMENT_CHECKED_IN')
  documentCheckedIn,
  @_s.JsonValue('DOCUMENT_CHECKED_OUT')
  documentCheckedOut,
  @_s.JsonValue('DOCUMENT_RENAMED')
  documentRenamed,
  @_s.JsonValue('DOCUMENT_VERSION_UPLOADED')
  documentVersionUploaded,
  @_s.JsonValue('DOCUMENT_VERSION_DELETED')
  documentVersionDeleted,
  @_s.JsonValue('DOCUMENT_VERSION_VIEWED')
  documentVersionViewed,
  @_s.JsonValue('DOCUMENT_VERSION_DOWNLOADED')
  documentVersionDownloaded,
  @_s.JsonValue('DOCUMENT_RECYCLED')
  documentRecycled,
  @_s.JsonValue('DOCUMENT_RESTORED')
  documentRestored,
  @_s.JsonValue('DOCUMENT_REVERTED')
  documentReverted,
  @_s.JsonValue('DOCUMENT_SHARED')
  documentShared,
  @_s.JsonValue('DOCUMENT_UNSHARED')
  documentUnshared,
  @_s.JsonValue('DOCUMENT_SHARE_PERMISSION_CHANGED')
  documentSharePermissionChanged,
  @_s.JsonValue('DOCUMENT_SHAREABLE_LINK_CREATED')
  documentShareableLinkCreated,
  @_s.JsonValue('DOCUMENT_SHAREABLE_LINK_REMOVED')
  documentShareableLinkRemoved,
  @_s.JsonValue('DOCUMENT_SHAREABLE_LINK_PERMISSION_CHANGED')
  documentShareableLinkPermissionChanged,
  @_s.JsonValue('DOCUMENT_MOVED')
  documentMoved,
  @_s.JsonValue('DOCUMENT_COMMENT_ADDED')
  documentCommentAdded,
  @_s.JsonValue('DOCUMENT_COMMENT_DELETED')
  documentCommentDeleted,
  @_s.JsonValue('DOCUMENT_ANNOTATION_ADDED')
  documentAnnotationAdded,
  @_s.JsonValue('DOCUMENT_ANNOTATION_DELETED')
  documentAnnotationDeleted,
  @_s.JsonValue('FOLDER_CREATED')
  folderCreated,
  @_s.JsonValue('FOLDER_DELETED')
  folderDeleted,
  @_s.JsonValue('FOLDER_RENAMED')
  folderRenamed,
  @_s.JsonValue('FOLDER_RECYCLED')
  folderRecycled,
  @_s.JsonValue('FOLDER_RESTORED')
  folderRestored,
  @_s.JsonValue('FOLDER_SHARED')
  folderShared,
  @_s.JsonValue('FOLDER_UNSHARED')
  folderUnshared,
  @_s.JsonValue('FOLDER_SHARE_PERMISSION_CHANGED')
  folderSharePermissionChanged,
  @_s.JsonValue('FOLDER_SHAREABLE_LINK_CREATED')
  folderShareableLinkCreated,
  @_s.JsonValue('FOLDER_SHAREABLE_LINK_REMOVED')
  folderShareableLinkRemoved,
  @_s.JsonValue('FOLDER_SHAREABLE_LINK_PERMISSION_CHANGED')
  folderShareableLinkPermissionChanged,
  @_s.JsonValue('FOLDER_MOVED')
  folderMoved,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddResourcePermissionsResponse {
  /// The share results.
  @_s.JsonKey(name: 'ShareResults')
  final List<ShareResult> shareResults;

  AddResourcePermissionsResponse({
    this.shareResults,
  });
  factory AddResourcePermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$AddResourcePermissionsResponseFromJson(json);
}

enum BooleanEnumType {
  @_s.JsonValue('TRUE')
  $true,
  @_s.JsonValue('FALSE')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a comment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Comment {
  /// The ID of the comment.
  @_s.JsonKey(name: 'CommentId')
  final String commentId;

  /// The details of the user who made the comment.
  @_s.JsonKey(name: 'Contributor')
  final User contributor;

  /// The time that the comment was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The ID of the parent comment.
  @_s.JsonKey(name: 'ParentId')
  final String parentId;

  /// If the comment is a reply to another user's comment, this field contains the
  /// user ID of the user being replied to.
  @_s.JsonKey(name: 'RecipientId')
  final String recipientId;

  /// The status of the comment.
  @_s.JsonKey(name: 'Status')
  final CommentStatusType status;

  /// The text of the comment.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// The ID of the root comment in the thread.
  @_s.JsonKey(name: 'ThreadId')
  final String threadId;

  /// The visibility of the comment. Options are either PRIVATE, where the comment
  /// is visible only to the comment author and document owner and co-owners, or
  /// PUBLIC, where the comment is visible to document owners, co-owners, and
  /// contributors.
  @_s.JsonKey(name: 'Visibility')
  final CommentVisibilityType visibility;

  Comment({
    @_s.required this.commentId,
    this.contributor,
    this.createdTimestamp,
    this.parentId,
    this.recipientId,
    this.status,
    this.text,
    this.threadId,
    this.visibility,
  });
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

/// Describes the metadata of a comment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CommentMetadata {
  /// The ID of the comment.
  @_s.JsonKey(name: 'CommentId')
  final String commentId;

  /// The status of the comment.
  @_s.JsonKey(name: 'CommentStatus')
  final CommentStatusType commentStatus;

  /// The user who made the comment.
  @_s.JsonKey(name: 'Contributor')
  final User contributor;

  /// The timestamp that the comment was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The ID of the user being replied to.
  @_s.JsonKey(name: 'RecipientId')
  final String recipientId;

  CommentMetadata({
    this.commentId,
    this.commentStatus,
    this.contributor,
    this.createdTimestamp,
    this.recipientId,
  });
  factory CommentMetadata.fromJson(Map<String, dynamic> json) =>
      _$CommentMetadataFromJson(json);
}

enum CommentStatusType {
  @_s.JsonValue('DRAFT')
  draft,
  @_s.JsonValue('PUBLISHED')
  published,
  @_s.JsonValue('DELETED')
  deleted,
}

enum CommentVisibilityType {
  @_s.JsonValue('PUBLIC')
  public,
  @_s.JsonValue('PRIVATE')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCommentResponse {
  /// The comment that has been created.
  @_s.JsonKey(name: 'Comment')
  final Comment comment;

  CreateCommentResponse({
    this.comment,
  });
  factory CreateCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCustomMetadataResponse {
  CreateCustomMetadataResponse();
  factory CreateCustomMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomMetadataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFolderResponse {
  /// The metadata of the folder.
  @_s.JsonKey(name: 'Metadata')
  final FolderMetadata metadata;

  CreateFolderResponse({
    this.metadata,
  });
  factory CreateFolderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFolderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLabelsResponse {
  CreateLabelsResponse();
  factory CreateLabelsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLabelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNotificationSubscriptionResponse {
  /// The subscription.
  @_s.JsonKey(name: 'Subscription')
  final Subscription subscription;

  CreateNotificationSubscriptionResponse({
    this.subscription,
  });
  factory CreateNotificationSubscriptionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateNotificationSubscriptionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserResponse {
  /// The user information.
  @_s.JsonKey(name: 'User')
  final User user;

  CreateUserResponse({
    this.user,
  });
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCustomMetadataResponse {
  DeleteCustomMetadataResponse();
  factory DeleteCustomMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCustomMetadataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLabelsResponse {
  DeleteLabelsResponse();
  factory DeleteLabelsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteLabelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeActivitiesResponse {
  /// The marker for the next set of results.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The list of activities for the specified user and time period.
  @_s.JsonKey(name: 'UserActivities')
  final List<Activity> userActivities;

  DescribeActivitiesResponse({
    this.marker,
    this.userActivities,
  });
  factory DescribeActivitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeActivitiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCommentsResponse {
  /// The list of comments for the specified document version.
  @_s.JsonKey(name: 'Comments')
  final List<Comment> comments;

  /// The marker for the next set of results. This marker was received from a
  /// previous call.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeCommentsResponse({
    this.comments,
    this.marker,
  });
  factory DescribeCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCommentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDocumentVersionsResponse {
  /// The document versions.
  @_s.JsonKey(name: 'DocumentVersions')
  final List<DocumentVersionMetadata> documentVersions;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeDocumentVersionsResponse({
    this.documentVersions,
    this.marker,
  });
  factory DescribeDocumentVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDocumentVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFolderContentsResponse {
  /// The documents in the specified folder.
  @_s.JsonKey(name: 'Documents')
  final List<DocumentMetadata> documents;

  /// The subfolders in the specified folder.
  @_s.JsonKey(name: 'Folders')
  final List<FolderMetadata> folders;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeFolderContentsResponse({
    this.documents,
    this.folders,
    this.marker,
  });
  factory DescribeFolderContentsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFolderContentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGroupsResponse {
  /// The list of groups.
  @_s.JsonKey(name: 'Groups')
  final List<GroupMetadata> groups;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeGroupsResponse({
    this.groups,
    this.marker,
  });
  factory DescribeGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeNotificationSubscriptionsResponse {
  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The subscriptions.
  @_s.JsonKey(name: 'Subscriptions')
  final List<Subscription> subscriptions;

  DescribeNotificationSubscriptionsResponse({
    this.marker,
    this.subscriptions,
  });
  factory DescribeNotificationSubscriptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeNotificationSubscriptionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeResourcePermissionsResponse {
  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The principals.
  @_s.JsonKey(name: 'Principals')
  final List<Principal> principals;

  DescribeResourcePermissionsResponse({
    this.marker,
    this.principals,
  });
  factory DescribeResourcePermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeResourcePermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRootFoldersResponse {
  /// The user's special folders.
  @_s.JsonKey(name: 'Folders')
  final List<FolderMetadata> folders;

  /// The marker for the next set of results.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeRootFoldersResponse({
    this.folders,
    this.marker,
  });
  factory DescribeRootFoldersResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRootFoldersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUsersResponse {
  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The total number of users included in the results.
  @_s.JsonKey(name: 'TotalNumberOfUsers')
  final int totalNumberOfUsers;

  /// The users.
  @_s.JsonKey(name: 'Users')
  final List<User> users;

  DescribeUsersResponse({
    this.marker,
    this.totalNumberOfUsers,
    this.users,
  });
  factory DescribeUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUsersResponseFromJson(json);
}

/// Describes the document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentMetadata {
  /// The time when the document was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The ID of the creator.
  @_s.JsonKey(name: 'CreatorId')
  final String creatorId;

  /// The ID of the document.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// List of labels on the document.
  @_s.JsonKey(name: 'Labels')
  final List<String> labels;

  /// The latest version of the document.
  @_s.JsonKey(name: 'LatestVersionMetadata')
  final DocumentVersionMetadata latestVersionMetadata;

  /// The time when the document was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ModifiedTimestamp')
  final DateTime modifiedTimestamp;

  /// The ID of the parent folder.
  @_s.JsonKey(name: 'ParentFolderId')
  final String parentFolderId;

  /// The resource state.
  @_s.JsonKey(name: 'ResourceState')
  final ResourceStateType resourceState;

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
  factory DocumentMetadata.fromJson(Map<String, dynamic> json) =>
      _$DocumentMetadataFromJson(json);
}

enum DocumentSourceType {
  @_s.JsonValue('ORIGINAL')
  original,
  @_s.JsonValue('WITH_COMMENTS')
  withComments,
}

enum DocumentStatusType {
  @_s.JsonValue('INITIALIZED')
  initialized,
  @_s.JsonValue('ACTIVE')
  active,
}

enum DocumentThumbnailType {
  @_s.JsonValue('SMALL')
  small,
  @_s.JsonValue('SMALL_HQ')
  smallHq,
  @_s.JsonValue('LARGE')
  large,
}

/// Describes a version of a document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentVersionMetadata {
  /// The timestamp when the content of the document was originally created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ContentCreatedTimestamp')
  final DateTime contentCreatedTimestamp;

  /// The timestamp when the content of the document was modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ContentModifiedTimestamp')
  final DateTime contentModifiedTimestamp;

  /// The content type of the document.
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  /// The timestamp when the document was first uploaded.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The ID of the creator.
  @_s.JsonKey(name: 'CreatorId')
  final String creatorId;

  /// The ID of the version.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The timestamp when the document was last uploaded.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ModifiedTimestamp')
  final DateTime modifiedTimestamp;

  /// The name of the version.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The signature of the document.
  @_s.JsonKey(name: 'Signature')
  final String signature;

  /// The size of the document, in bytes.
  @_s.JsonKey(name: 'Size')
  final int size;

  /// The source of the document.
  @_s.JsonKey(name: 'Source')
  final Map<DocumentSourceType, String> source;

  /// The status of the document.
  @_s.JsonKey(name: 'Status')
  final DocumentStatusType status;

  /// The thumbnail of the document.
  @_s.JsonKey(name: 'Thumbnail')
  final Map<DocumentThumbnailType, String> thumbnail;

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
  factory DocumentVersionMetadata.fromJson(Map<String, dynamic> json) =>
      _$DocumentVersionMetadataFromJson(json);
}

enum DocumentVersionStatus {
  @_s.JsonValue('ACTIVE')
  active,
}

extension on DocumentVersionStatus {
  String toValue() {
    switch (this) {
      case DocumentVersionStatus.active:
        return 'ACTIVE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum FolderContentType {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('DOCUMENT')
  document,
  @_s.JsonValue('FOLDER')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a folder.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FolderMetadata {
  /// The time when the folder was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The ID of the creator.
  @_s.JsonKey(name: 'CreatorId')
  final String creatorId;

  /// The ID of the folder.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// List of labels on the folder.
  @_s.JsonKey(name: 'Labels')
  final List<String> labels;

  /// The size of the latest version of the folder metadata.
  @_s.JsonKey(name: 'LatestVersionSize')
  final int latestVersionSize;

  /// The time when the folder was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ModifiedTimestamp')
  final DateTime modifiedTimestamp;

  /// The name of the folder.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the parent folder.
  @_s.JsonKey(name: 'ParentFolderId')
  final String parentFolderId;

  /// The resource state of the folder.
  @_s.JsonKey(name: 'ResourceState')
  final ResourceStateType resourceState;

  /// The unique identifier created from the subfolders and documents of the
  /// folder.
  @_s.JsonKey(name: 'Signature')
  final String signature;

  /// The size of the folder metadata.
  @_s.JsonKey(name: 'Size')
  final int size;

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
  factory FolderMetadata.fromJson(Map<String, dynamic> json) =>
      _$FolderMetadataFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCurrentUserResponse {
  /// Metadata of the user.
  @_s.JsonKey(name: 'User')
  final User user;

  GetCurrentUserResponse({
    this.user,
  });
  factory GetCurrentUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDocumentPathResponse {
  /// The path information.
  @_s.JsonKey(name: 'Path')
  final ResourcePath path;

  GetDocumentPathResponse({
    this.path,
  });
  factory GetDocumentPathResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDocumentPathResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDocumentResponse {
  /// The custom metadata on the document.
  @_s.JsonKey(name: 'CustomMetadata')
  final Map<String, String> customMetadata;

  /// The metadata details of the document.
  @_s.JsonKey(name: 'Metadata')
  final DocumentMetadata metadata;

  GetDocumentResponse({
    this.customMetadata,
    this.metadata,
  });
  factory GetDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDocumentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDocumentVersionResponse {
  /// The custom metadata on the document version.
  @_s.JsonKey(name: 'CustomMetadata')
  final Map<String, String> customMetadata;

  /// The version metadata.
  @_s.JsonKey(name: 'Metadata')
  final DocumentVersionMetadata metadata;

  GetDocumentVersionResponse({
    this.customMetadata,
    this.metadata,
  });
  factory GetDocumentVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDocumentVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFolderPathResponse {
  /// The path information.
  @_s.JsonKey(name: 'Path')
  final ResourcePath path;

  GetFolderPathResponse({
    this.path,
  });
  factory GetFolderPathResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFolderPathResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFolderResponse {
  /// The custom metadata on the folder.
  @_s.JsonKey(name: 'CustomMetadata')
  final Map<String, String> customMetadata;

  /// The metadata of the folder.
  @_s.JsonKey(name: 'Metadata')
  final FolderMetadata metadata;

  GetFolderResponse({
    this.customMetadata,
    this.metadata,
  });
  factory GetFolderResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFolderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourcesResponse {
  /// The documents in the specified collection.
  @_s.JsonKey(name: 'Documents')
  final List<DocumentMetadata> documents;

  /// The folders in the specified folder.
  @_s.JsonKey(name: 'Folders')
  final List<FolderMetadata> folders;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  GetResourcesResponse({
    this.documents,
    this.folders,
    this.marker,
  });
  factory GetResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResourcesResponseFromJson(json);
}

/// Describes the metadata of a user group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupMetadata {
  /// The ID of the user group.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the group.
  @_s.JsonKey(name: 'Name')
  final String name;

  GroupMetadata({
    this.id,
    this.name,
  });
  factory GroupMetadata.fromJson(Map<String, dynamic> json) =>
      _$GroupMetadataFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InitiateDocumentVersionUploadResponse {
  /// The document metadata.
  @_s.JsonKey(name: 'Metadata')
  final DocumentMetadata metadata;

  /// The upload metadata.
  @_s.JsonKey(name: 'UploadMetadata')
  final UploadMetadata uploadMetadata;

  InitiateDocumentVersionUploadResponse({
    this.metadata,
    this.uploadMetadata,
  });
  factory InitiateDocumentVersionUploadResponse.fromJson(
          Map<String, dynamic> json) =>
      _$InitiateDocumentVersionUploadResponseFromJson(json);
}

enum LocaleType {
  @_s.JsonValue('en')
  en,
  @_s.JsonValue('fr')
  fr,
  @_s.JsonValue('ko')
  ko,
  @_s.JsonValue('de')
  de,
  @_s.JsonValue('es')
  es,
  @_s.JsonValue('ja')
  ja,
  @_s.JsonValue('ru')
  ru,
  @_s.JsonValue('zh_CN')
  zhCn,
  @_s.JsonValue('zh_TW')
  zhTw,
  @_s.JsonValue('pt_BR')
  ptBr,
  @_s.JsonValue('default')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Set of options which defines notification preferences of given action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NotificationOptions {
  /// Text value to be included in the email body.
  @_s.JsonKey(name: 'EmailMessage')
  final String emailMessage;

  /// Boolean value to indicate an email notification should be sent to the
  /// receipients.
  @_s.JsonKey(name: 'SendEmail')
  final bool sendEmail;

  NotificationOptions({
    this.emailMessage,
    this.sendEmail,
  });
  Map<String, dynamic> toJson() => _$NotificationOptionsToJson(this);
}

enum OrderType {
  @_s.JsonValue('ASCENDING')
  ascending,
  @_s.JsonValue('DESCENDING')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the users or user groups.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Participants {
  /// The list of user groups.
  @_s.JsonKey(name: 'Groups')
  final List<GroupMetadata> groups;

  /// The list of users.
  @_s.JsonKey(name: 'Users')
  final List<UserMetadata> users;

  Participants({
    this.groups,
    this.users,
  });
  factory Participants.fromJson(Map<String, dynamic> json) =>
      _$ParticipantsFromJson(json);
}

/// Describes the permissions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PermissionInfo {
  /// The role of the user.
  @_s.JsonKey(name: 'Role')
  final RoleType role;

  /// The type of permissions.
  @_s.JsonKey(name: 'Type')
  final RolePermissionType type;

  PermissionInfo({
    this.role,
    this.type,
  });
  factory PermissionInfo.fromJson(Map<String, dynamic> json) =>
      _$PermissionInfoFromJson(json);
}

/// Describes a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Principal {
  /// The ID of the resource.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The permission information for the resource.
  @_s.JsonKey(name: 'Roles')
  final List<PermissionInfo> roles;

  /// The type of resource.
  @_s.JsonKey(name: 'Type')
  final PrincipalType type;

  Principal({
    this.id,
    this.roles,
    this.type,
  });
  factory Principal.fromJson(Map<String, dynamic> json) =>
      _$PrincipalFromJson(json);
}

enum PrincipalType {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('GROUP')
  group,
  @_s.JsonValue('INVITE')
  invite,
  @_s.JsonValue('ANONYMOUS')
  anonymous,
  @_s.JsonValue('ORGANIZATION')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ResourceCollectionType {
  @_s.JsonValue('SHARED_WITH_ME')
  sharedWithMe,
}

extension on ResourceCollectionType {
  String toValue() {
    switch (this) {
      case ResourceCollectionType.sharedWithMe:
        return 'SHARED_WITH_ME';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the metadata of a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceMetadata {
  /// The ID of the resource.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The original name of the resource before a rename operation.
  @_s.JsonKey(name: 'OriginalName')
  final String originalName;

  /// The owner of the resource.
  @_s.JsonKey(name: 'Owner')
  final UserMetadata owner;

  /// The parent ID of the resource before a rename operation.
  @_s.JsonKey(name: 'ParentId')
  final String parentId;

  /// The type of resource.
  @_s.JsonKey(name: 'Type')
  final ResourceType type;

  /// The version ID of the resource. This is an optional field and is filled for
  /// action on document version.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  ResourceMetadata({
    this.id,
    this.name,
    this.originalName,
    this.owner,
    this.parentId,
    this.type,
    this.versionId,
  });
  factory ResourceMetadata.fromJson(Map<String, dynamic> json) =>
      _$ResourceMetadataFromJson(json);
}

/// Describes the path information of a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourcePath {
  /// The components of the resource path.
  @_s.JsonKey(name: 'Components')
  final List<ResourcePathComponent> components;

  ResourcePath({
    this.components,
  });
  factory ResourcePath.fromJson(Map<String, dynamic> json) =>
      _$ResourcePathFromJson(json);
}

/// Describes the resource path.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourcePathComponent {
  /// The ID of the resource path.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the resource path.
  @_s.JsonKey(name: 'Name')
  final String name;

  ResourcePathComponent({
    this.id,
    this.name,
  });
  factory ResourcePathComponent.fromJson(Map<String, dynamic> json) =>
      _$ResourcePathComponentFromJson(json);
}

enum ResourceSortType {
  @_s.JsonValue('DATE')
  date,
  @_s.JsonValue('NAME')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ResourceStateType {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('RESTORING')
  restoring,
  @_s.JsonValue('RECYCLING')
  recycling,
  @_s.JsonValue('RECYCLED')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ResourceType {
  @_s.JsonValue('FOLDER')
  folder,
  @_s.JsonValue('DOCUMENT')
  document,
}

enum RolePermissionType {
  @_s.JsonValue('DIRECT')
  direct,
  @_s.JsonValue('INHERITED')
  inherited,
}

enum RoleType {
  @_s.JsonValue('VIEWER')
  viewer,
  @_s.JsonValue('CONTRIBUTOR')
  contributor,
  @_s.JsonValue('OWNER')
  owner,
  @_s.JsonValue('COOWNER')
  coowner,
}

/// Describes the recipient type and ID, if available.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SharePrincipal {
  /// The ID of the recipient.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The role of the recipient.
  @_s.JsonKey(name: 'Role')
  final RoleType role;

  /// The type of the recipient.
  @_s.JsonKey(name: 'Type')
  final PrincipalType type;

  SharePrincipal({
    @_s.required this.id,
    @_s.required this.role,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$SharePrincipalToJson(this);
}

/// Describes the share results of a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ShareResult {
  /// The ID of the invited user.
  @_s.JsonKey(name: 'InviteePrincipalId')
  final String inviteePrincipalId;

  /// The ID of the principal.
  @_s.JsonKey(name: 'PrincipalId')
  final String principalId;

  /// The role.
  @_s.JsonKey(name: 'Role')
  final RoleType role;

  /// The ID of the resource that was shared.
  @_s.JsonKey(name: 'ShareId')
  final String shareId;

  /// The status.
  @_s.JsonKey(name: 'Status')
  final ShareStatusType status;

  /// The status message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  ShareResult({
    this.inviteePrincipalId,
    this.principalId,
    this.role,
    this.shareId,
    this.status,
    this.statusMessage,
  });
  factory ShareResult.fromJson(Map<String, dynamic> json) =>
      _$ShareResultFromJson(json);
}

enum ShareStatusType {
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAILURE')
  failure,
}

/// Describes the storage for a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StorageRuleType {
  /// The amount of storage allocated, in bytes.
  @_s.JsonKey(name: 'StorageAllocatedInBytes')
  final int storageAllocatedInBytes;

  /// The type of storage.
  @_s.JsonKey(name: 'StorageType')
  final StorageType storageType;

  StorageRuleType({
    this.storageAllocatedInBytes,
    this.storageType,
  });
  factory StorageRuleType.fromJson(Map<String, dynamic> json) =>
      _$StorageRuleTypeFromJson(json);

  Map<String, dynamic> toJson() => _$StorageRuleTypeToJson(this);
}

enum StorageType {
  @_s.JsonValue('UNLIMITED')
  unlimited,
  @_s.JsonValue('QUOTA')
  quota,
}

/// Describes a subscription.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Subscription {
  /// The endpoint of the subscription.
  @_s.JsonKey(name: 'EndPoint')
  final String endPoint;

  /// The protocol of the subscription.
  @_s.JsonKey(name: 'Protocol')
  final SubscriptionProtocolType protocol;

  /// The ID of the subscription.
  @_s.JsonKey(name: 'SubscriptionId')
  final String subscriptionId;

  Subscription({
    this.endPoint,
    this.protocol,
    this.subscriptionId,
  });
  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

enum SubscriptionProtocolType {
  @_s.JsonValue('HTTPS')
  https,
}

extension on SubscriptionProtocolType {
  String toValue() {
    switch (this) {
      case SubscriptionProtocolType.https:
        return 'HTTPS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SubscriptionType {
  @_s.JsonValue('ALL')
  all,
}

extension on SubscriptionType {
  String toValue() {
    switch (this) {
      case SubscriptionType.all:
        return 'ALL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserResponse {
  /// The user information.
  @_s.JsonKey(name: 'User')
  final User user;

  UpdateUserResponse({
    this.user,
  });
  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);
}

/// Describes the upload.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UploadMetadata {
  /// The signed headers.
  @_s.JsonKey(name: 'SignedHeaders')
  final Map<String, String> signedHeaders;

  /// The URL of the upload.
  @_s.JsonKey(name: 'UploadUrl')
  final String uploadUrl;

  UploadMetadata({
    this.signedHeaders,
    this.uploadUrl,
  });
  factory UploadMetadata.fromJson(Map<String, dynamic> json) =>
      _$UploadMetadataFromJson(json);
}

/// Describes a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class User {
  /// The time when the user was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The email address of the user.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  /// The given name of the user.
  @_s.JsonKey(name: 'GivenName')
  final String givenName;

  /// The ID of the user.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The locale of the user.
  @_s.JsonKey(name: 'Locale')
  final LocaleType locale;

  /// The time when the user was modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ModifiedTimestamp')
  final DateTime modifiedTimestamp;

  /// The ID of the organization.
  @_s.JsonKey(name: 'OrganizationId')
  final String organizationId;

  /// The ID of the recycle bin folder.
  @_s.JsonKey(name: 'RecycleBinFolderId')
  final String recycleBinFolderId;

  /// The ID of the root folder.
  @_s.JsonKey(name: 'RootFolderId')
  final String rootFolderId;

  /// The status of the user.
  @_s.JsonKey(name: 'Status')
  final UserStatusType status;

  /// The storage for the user.
  @_s.JsonKey(name: 'Storage')
  final UserStorageMetadata storage;

  /// The surname of the user.
  @_s.JsonKey(name: 'Surname')
  final String surname;

  /// The time zone ID of the user.
  @_s.JsonKey(name: 'TimeZoneId')
  final String timeZoneId;

  /// The type of user.
  @_s.JsonKey(name: 'Type')
  final UserType type;

  /// The login name of the user.
  @_s.JsonKey(name: 'Username')
  final String username;

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
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserFilterType {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('ACTIVE_PENDING')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the metadata of the user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserMetadata {
  /// The email address of the user.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  /// The given name of the user before a rename operation.
  @_s.JsonKey(name: 'GivenName')
  final String givenName;

  /// The ID of the user.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The surname of the user.
  @_s.JsonKey(name: 'Surname')
  final String surname;

  /// The name of the user.
  @_s.JsonKey(name: 'Username')
  final String username;

  UserMetadata({
    this.emailAddress,
    this.givenName,
    this.id,
    this.surname,
    this.username,
  });
  factory UserMetadata.fromJson(Map<String, dynamic> json) =>
      _$UserMetadataFromJson(json);
}

enum UserSortType {
  @_s.JsonValue('USER_NAME')
  userName,
  @_s.JsonValue('FULL_NAME')
  fullName,
  @_s.JsonValue('STORAGE_LIMIT')
  storageLimit,
  @_s.JsonValue('USER_STATUS')
  userStatus,
  @_s.JsonValue('STORAGE_USED')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum UserStatusType {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('PENDING')
  pending,
}

/// Describes the storage for a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserStorageMetadata {
  /// The storage for a user.
  @_s.JsonKey(name: 'StorageRule')
  final StorageRuleType storageRule;

  /// The amount of storage used, in bytes.
  @_s.JsonKey(name: 'StorageUtilizedInBytes')
  final int storageUtilizedInBytes;

  UserStorageMetadata({
    this.storageRule,
    this.storageUtilizedInBytes,
  });
  factory UserStorageMetadata.fromJson(Map<String, dynamic> json) =>
      _$UserStorageMetadataFromJson(json);
}

enum UserType {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('ADMIN')
  admin,
  @_s.JsonValue('POWERUSER')
  poweruser,
  @_s.JsonValue('MINIMALUSER')
  minimaluser,
  @_s.JsonValue('WORKSPACESUSER')
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
    throw Exception('Unknown enum value: $this');
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConflictingOperationException extends _s.GenericAwsException {
  ConflictingOperationException({String type, String message})
      : super(
            type: type,
            code: 'ConflictingOperationException',
            message: message);
}

class CustomMetadataLimitExceededException extends _s.GenericAwsException {
  CustomMetadataLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'CustomMetadataLimitExceededException',
            message: message);
}

class DeactivatingLastSystemUserException extends _s.GenericAwsException {
  DeactivatingLastSystemUserException({String type, String message})
      : super(
            type: type,
            code: 'DeactivatingLastSystemUserException',
            message: message);
}

class DocumentLockedForCommentsException extends _s.GenericAwsException {
  DocumentLockedForCommentsException({String type, String message})
      : super(
            type: type,
            code: 'DocumentLockedForCommentsException',
            message: message);
}

class DraftUploadOutOfSyncException extends _s.GenericAwsException {
  DraftUploadOutOfSyncException({String type, String message})
      : super(
            type: type,
            code: 'DraftUploadOutOfSyncException',
            message: message);
}

class EntityAlreadyExistsException extends _s.GenericAwsException {
  EntityAlreadyExistsException({String type, String message})
      : super(
            type: type, code: 'EntityAlreadyExistsException', message: message);
}

class EntityNotExistsException extends _s.GenericAwsException {
  EntityNotExistsException({String type, String message})
      : super(type: type, code: 'EntityNotExistsException', message: message);
}

class FailedDependencyException extends _s.GenericAwsException {
  FailedDependencyException({String type, String message})
      : super(type: type, code: 'FailedDependencyException', message: message);
}

class IllegalUserStateException extends _s.GenericAwsException {
  IllegalUserStateException({String type, String message})
      : super(type: type, code: 'IllegalUserStateException', message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String type, String message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidCommentOperationException extends _s.GenericAwsException {
  InvalidCommentOperationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidCommentOperationException',
            message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String type, String message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidPasswordException extends _s.GenericAwsException {
  InvalidPasswordException({String type, String message})
      : super(type: type, code: 'InvalidPasswordException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ProhibitedStateException extends _s.GenericAwsException {
  ProhibitedStateException({String type, String message})
      : super(type: type, code: 'ProhibitedStateException', message: message);
}

class RequestedEntityTooLargeException extends _s.GenericAwsException {
  RequestedEntityTooLargeException({String type, String message})
      : super(
            type: type,
            code: 'RequestedEntityTooLargeException',
            message: message);
}

class ResourceAlreadyCheckedOutException extends _s.GenericAwsException {
  ResourceAlreadyCheckedOutException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyCheckedOutException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class StorageLimitExceededException extends _s.GenericAwsException {
  StorageLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'StorageLimitExceededException',
            message: message);
}

class StorageLimitWillExceedException extends _s.GenericAwsException {
  StorageLimitWillExceedException({String type, String message})
      : super(
            type: type,
            code: 'StorageLimitWillExceedException',
            message: message);
}

class TooManyLabelsException extends _s.GenericAwsException {
  TooManyLabelsException({String type, String message})
      : super(type: type, code: 'TooManyLabelsException', message: message);
}

class TooManySubscriptionsException extends _s.GenericAwsException {
  TooManySubscriptionsException({String type, String message})
      : super(
            type: type,
            code: 'TooManySubscriptionsException',
            message: message);
}

class UnauthorizedOperationException extends _s.GenericAwsException {
  UnauthorizedOperationException({String type, String message})
      : super(
            type: type,
            code: 'UnauthorizedOperationException',
            message: message);
}

class UnauthorizedResourceAccessException extends _s.GenericAwsException {
  UnauthorizedResourceAccessException({String type, String message})
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
