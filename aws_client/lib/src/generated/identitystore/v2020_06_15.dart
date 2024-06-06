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

/// The Identity Store service used by IAM Identity Center provides a single
/// place to retrieve all of your identities (users and groups). For more
/// information, see the <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html">IAM
/// Identity Center User Guide</a>.
///
/// This reference guide describes the identity store operations that you can
/// call programmatically and includes detailed information about data types and
/// errors.
/// <note>
/// IAM Identity Center uses the <code>sso</code> and <code>identitystore</code>
/// API namespaces.
/// </note>
class IdentityStore {
  final _s.JsonProtocol _protocol;
  IdentityStore({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'identitystore',
            signingName: 'identitystore',
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

  /// Creates a group within the specified identity store.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [description] :
  /// A string containing the description of the group.
  ///
  /// Parameter [displayName] :
  /// A string containing the name of the group. This value is commonly
  /// displayed when the group is referenced. <code>Administrator</code> and
  /// <code>AWSAdministrators</code> are reserved names and can't be used for
  /// users or groups.
  Future<CreateGroupResponse> createGroup({
    required String identityStoreId,
    String? description,
    String? displayName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.CreateGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityStoreId': identityStoreId,
        if (description != null) 'Description': description,
        if (displayName != null) 'DisplayName': displayName,
      },
    );

    return CreateGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a relationship between a member and a group. The following
  /// identifiers must be specified: <code>GroupId</code>,
  /// <code>IdentityStoreId</code>, and <code>MemberId</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [groupId] :
  /// The identifier for a group in the identity store.
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [memberId] :
  /// An object that contains the identifier of a group member. Setting the
  /// <code>UserID</code> field to the specific identifier for a user indicates
  /// that the user is a member of the group.
  Future<CreateGroupMembershipResponse> createGroupMembership({
    required String groupId,
    required String identityStoreId,
    required MemberId memberId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.CreateGroupMembership'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'IdentityStoreId': identityStoreId,
        'MemberId': memberId,
      },
    );

    return CreateGroupMembershipResponse.fromJson(jsonResponse.body);
  }

  /// Creates a user within the specified identity store.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [addresses] :
  /// A list of <code>Address</code> objects containing addresses associated
  /// with the user.
  ///
  /// Parameter [displayName] :
  /// A string containing the name of the user. This value is typically
  /// formatted for display when the user is referenced. For example, "John
  /// Doe."
  ///
  /// Parameter [emails] :
  /// A list of <code>Email</code> objects containing email addresses associated
  /// with the user.
  ///
  /// Parameter [locale] :
  /// A string containing the geographical region or location of the user.
  ///
  /// Parameter [name] :
  /// An object containing the name of the user.
  ///
  /// Parameter [nickName] :
  /// A string containing an alternate name for the user.
  ///
  /// Parameter [phoneNumbers] :
  /// A list of <code>PhoneNumber</code> objects containing phone numbers
  /// associated with the user.
  ///
  /// Parameter [preferredLanguage] :
  /// A string containing the preferred language of the user. For example,
  /// "American English" or "en-us."
  ///
  /// Parameter [profileUrl] :
  /// A string containing a URL that might be associated with the user.
  ///
  /// Parameter [timezone] :
  /// A string containing the time zone of the user.
  ///
  /// Parameter [title] :
  /// A string containing the title of the user. Possible values are left
  /// unspecified. The value can vary based on your specific use case.
  ///
  /// Parameter [userName] :
  /// A unique string used to identify the user. The length limit is 128
  /// characters. This value can consist of letters, accented characters,
  /// symbols, numbers, and punctuation. This value is specified at the time the
  /// user is created and stored as an attribute of the user object in the
  /// identity store. <code>Administrator</code> and
  /// <code>AWSAdministrators</code> are reserved names and can't be used for
  /// users or groups.
  ///
  /// Parameter [userType] :
  /// A string indicating the type of user. Possible values are left
  /// unspecified. The value can vary based on your specific use case.
  Future<CreateUserResponse> createUser({
    required String identityStoreId,
    List<Address>? addresses,
    String? displayName,
    List<Email>? emails,
    String? locale,
    Name? name,
    String? nickName,
    List<PhoneNumber>? phoneNumbers,
    String? preferredLanguage,
    String? profileUrl,
    String? timezone,
    String? title,
    String? userName,
    String? userType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.CreateUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityStoreId': identityStoreId,
        if (addresses != null) 'Addresses': addresses,
        if (displayName != null) 'DisplayName': displayName,
        if (emails != null) 'Emails': emails,
        if (locale != null) 'Locale': locale,
        if (name != null) 'Name': name,
        if (nickName != null) 'NickName': nickName,
        if (phoneNumbers != null) 'PhoneNumbers': phoneNumbers,
        if (preferredLanguage != null) 'PreferredLanguage': preferredLanguage,
        if (profileUrl != null) 'ProfileUrl': profileUrl,
        if (timezone != null) 'Timezone': timezone,
        if (title != null) 'Title': title,
        if (userName != null) 'UserName': userName,
        if (userType != null) 'UserType': userType,
      },
    );

    return CreateUserResponse.fromJson(jsonResponse.body);
  }

  /// Delete a group within an identity store given <code>GroupId</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [groupId] :
  /// The identifier for a group in the identity store.
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  Future<void> deleteGroup({
    required String groupId,
    required String identityStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.DeleteGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'IdentityStoreId': identityStoreId,
      },
    );
  }

  /// Delete a membership within a group given <code>MembershipId</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [membershipId] :
  /// The identifier for a <code>GroupMembership</code> in an identity store.
  Future<void> deleteGroupMembership({
    required String identityStoreId,
    required String membershipId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.DeleteGroupMembership'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityStoreId': identityStoreId,
        'MembershipId': membershipId,
      },
    );
  }

  /// Deletes a user within an identity store given <code>UserId</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [userId] :
  /// The identifier for a user in the identity store.
  Future<void> deleteUser({
    required String identityStoreId,
    required String userId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.DeleteUser'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityStoreId': identityStoreId,
        'UserId': userId,
      },
    );
  }

  /// Retrieves the group metadata and attributes from <code>GroupId</code> in
  /// an identity store.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [groupId] :
  /// The identifier for a group in the identity store.
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store, such as
  /// <code>d-1234567890</code>. In this example, <code>d-</code> is a fixed
  /// prefix, and <code>1234567890</code> is a randomly generated string that
  /// contains numbers and lower case letters. This value is generated at the
  /// time that a new identity store is created.
  Future<DescribeGroupResponse> describeGroup({
    required String groupId,
    required String identityStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.DescribeGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'IdentityStoreId': identityStoreId,
      },
    );

    return DescribeGroupResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves membership metadata and attributes from
  /// <code>MembershipId</code> in an identity store.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [membershipId] :
  /// The identifier for a <code>GroupMembership</code> in an identity store.
  Future<DescribeGroupMembershipResponse> describeGroupMembership({
    required String identityStoreId,
    required String membershipId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.DescribeGroupMembership'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityStoreId': identityStoreId,
        'MembershipId': membershipId,
      },
    );

    return DescribeGroupMembershipResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the user metadata and attributes from the <code>UserId</code> in
  /// an identity store.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store, such as
  /// <code>d-1234567890</code>. In this example, <code>d-</code> is a fixed
  /// prefix, and <code>1234567890</code> is a randomly generated string that
  /// contains numbers and lower case letters. This value is generated at the
  /// time that a new identity store is created.
  ///
  /// Parameter [userId] :
  /// The identifier for a user in the identity store.
  Future<DescribeUserResponse> describeUser({
    required String identityStoreId,
    required String userId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.DescribeUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityStoreId': identityStoreId,
        'UserId': userId,
      },
    );

    return DescribeUserResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves <code>GroupId</code> in an identity store.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [alternateIdentifier] :
  /// A unique identifier for a user or group that is not the primary
  /// identifier. This value can be an identifier from an external identity
  /// provider (IdP) that is associated with the user, the group, or a unique
  /// attribute. For the unique attribute, the only valid path is
  /// <code>displayName</code>.
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  Future<GetGroupIdResponse> getGroupId({
    required AlternateIdentifier alternateIdentifier,
    required String identityStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.GetGroupId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AlternateIdentifier': alternateIdentifier,
        'IdentityStoreId': identityStoreId,
      },
    );

    return GetGroupIdResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the <code>MembershipId</code> in an identity store.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [groupId] :
  /// The identifier for a group in the identity store.
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [memberId] :
  /// An object that contains the identifier of a group member. Setting the
  /// <code>UserID</code> field to the specific identifier for a user indicates
  /// that the user is a member of the group.
  Future<GetGroupMembershipIdResponse> getGroupMembershipId({
    required String groupId,
    required String identityStoreId,
    required MemberId memberId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.GetGroupMembershipId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'IdentityStoreId': identityStoreId,
        'MemberId': memberId,
      },
    );

    return GetGroupMembershipIdResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the <code>UserId</code> in an identity store.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [alternateIdentifier] :
  /// A unique identifier for a user or group that is not the primary
  /// identifier. This value can be an identifier from an external identity
  /// provider (IdP) that is associated with the user, the group, or a unique
  /// attribute. For the unique attribute, the only valid paths are
  /// <code>userName</code> and <code>emails.value</code>.
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  Future<GetUserIdResponse> getUserId({
    required AlternateIdentifier alternateIdentifier,
    required String identityStoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.GetUserId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AlternateIdentifier': alternateIdentifier,
        'IdentityStoreId': identityStoreId,
      },
    );

    return GetUserIdResponse.fromJson(jsonResponse.body);
  }

  /// Checks the user's membership in all requested groups and returns if the
  /// member exists in all queried groups.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [groupIds] :
  /// A list of identifiers for groups in the identity store.
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [memberId] :
  /// An object containing the identifier of a group member.
  Future<IsMemberInGroupsResponse> isMemberInGroups({
    required List<String> groupIds,
    required String identityStoreId,
    required MemberId memberId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.IsMemberInGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupIds': groupIds,
        'IdentityStoreId': identityStoreId,
        'MemberId': memberId,
      },
    );

    return IsMemberInGroupsResponse.fromJson(jsonResponse.body);
  }

  /// For the specified group in the specified identity store, returns the list
  /// of all <code>GroupMembership</code> objects and returns results in
  /// paginated form.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [groupId] :
  /// The identifier for a group in the identity store.
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request. This parameter
  /// is used in all <code>List</code> requests to specify how many results to
  /// return in one page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used for the <code>ListUsers</code>,
  /// <code>ListGroups</code> and <code>ListGroupMemberships</code> API
  /// operations. This value is generated by the identity store service. It is
  /// returned in the API response if the total results are more than the size
  /// of one page. This token is also returned when it is used in the API
  /// request to search for the next page.
  Future<ListGroupMembershipsResponse> listGroupMemberships({
    required String groupId,
    required String identityStoreId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.ListGroupMemberships'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'IdentityStoreId': identityStoreId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGroupMembershipsResponse.fromJson(jsonResponse.body);
  }

  /// For the specified member in the specified identity store, returns the list
  /// of all <code>GroupMembership</code> objects and returns results in
  /// paginated form.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [memberId] :
  /// An object that contains the identifier of a group member. Setting the
  /// <code>UserID</code> field to the specific identifier for a user indicates
  /// that the user is a member of the group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request. This parameter
  /// is used in the <code>ListUsers</code> and <code>ListGroups</code> requests
  /// to specify how many results to return in one page. The length limit is 50
  /// characters.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used for the <code>ListUsers</code>,
  /// <code>ListGroups</code>, and <code>ListGroupMemberships</code> API
  /// operations. This value is generated by the identity store service. It is
  /// returned in the API response if the total results are more than the size
  /// of one page. This token is also returned when it is used in the API
  /// request to search for the next page.
  Future<ListGroupMembershipsForMemberResponse> listGroupMembershipsForMember({
    required String identityStoreId,
    required MemberId memberId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.ListGroupMembershipsForMember'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityStoreId': identityStoreId,
        'MemberId': memberId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGroupMembershipsForMemberResponse.fromJson(jsonResponse.body);
  }

  /// Lists all groups in the identity store. Returns a paginated list of
  /// complete <code>Group</code> objects. Filtering for a <code>Group</code> by
  /// the <code>DisplayName</code> attribute is deprecated. Instead, use the
  /// <code>GetGroupId</code> API action.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store, such as
  /// <code>d-1234567890</code>. In this example, <code>d-</code> is a fixed
  /// prefix, and <code>1234567890</code> is a randomly generated string that
  /// contains numbers and lower case letters. This value is generated at the
  /// time that a new identity store is created.
  ///
  /// Parameter [filters] :
  /// A list of <code>Filter</code> objects, which is used in the
  /// <code>ListUsers</code> and <code>ListGroups</code> requests.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request. This parameter
  /// is used in the <code>ListUsers</code> and <code>ListGroups</code> requests
  /// to specify how many results to return in one page. The length limit is 50
  /// characters.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used for the <code>ListUsers</code> and
  /// <code>ListGroups</code> API operations. This value is generated by the
  /// identity store service. It is returned in the API response if the total
  /// results are more than the size of one page. This token is also returned
  /// when it is used in the API request to search for the next page.
  Future<ListGroupsResponse> listGroups({
    required String identityStoreId,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.ListGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityStoreId': identityStoreId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all users in the identity store. Returns a paginated list of
  /// complete <code>User</code> objects. Filtering for a <code>User</code> by
  /// the <code>UserName</code> attribute is deprecated. Instead, use the
  /// <code>GetUserId</code> API action.
  /// <note>
  /// If you have administrator access to a member account, you can use this API
  /// from the member account. Read about <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html">member
  /// accounts</a> in the <i>Organizations User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store, such as
  /// <code>d-1234567890</code>. In this example, <code>d-</code> is a fixed
  /// prefix, and <code>1234567890</code> is a randomly generated string that
  /// contains numbers and lower case letters. This value is generated at the
  /// time that a new identity store is created.
  ///
  /// Parameter [filters] :
  /// A list of <code>Filter</code> objects, which is used in the
  /// <code>ListUsers</code> and <code>ListGroups</code> requests.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request. This parameter
  /// is used in the <code>ListUsers</code> and <code>ListGroups</code> requests
  /// to specify how many results to return in one page. The length limit is 50
  /// characters.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used for the <code>ListUsers</code> and
  /// <code>ListGroups</code> API operations. This value is generated by the
  /// identity store service. It is returned in the API response if the total
  /// results are more than the size of one page. This token is also returned
  /// when it is used in the API request to search for the next page.
  Future<ListUsersResponse> listUsers({
    required String identityStoreId,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.ListUsers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityStoreId': identityStoreId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListUsersResponse.fromJson(jsonResponse.body);
  }

  /// For the specified group in the specified identity store, updates the group
  /// metadata and attributes.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [groupId] :
  /// The identifier for a group in the identity store.
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [operations] :
  /// A list of <code>AttributeOperation</code> objects to apply to the
  /// requested group. These operations might add, replace, or remove an
  /// attribute.
  Future<void> updateGroup({
    required String groupId,
    required String identityStoreId,
    required List<AttributeOperation> operations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.UpdateGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'IdentityStoreId': identityStoreId,
        'Operations': operations,
      },
    );
  }

  /// For the specified user in the specified identity store, updates the user
  /// metadata and attributes.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store.
  ///
  /// Parameter [operations] :
  /// A list of <code>AttributeOperation</code> objects to apply to the
  /// requested user. These operations might add, replace, or remove an
  /// attribute.
  ///
  /// Parameter [userId] :
  /// The identifier for a user in the identity store.
  Future<void> updateUser({
    required String identityStoreId,
    required List<AttributeOperation> operations,
    required String userId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIdentityStore.UpdateUser'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityStoreId': identityStoreId,
        'Operations': operations,
        'UserId': userId,
      },
    );
  }
}

/// The address associated with the specified user.
class Address {
  /// The country of the address.
  final String? country;

  /// A string containing a formatted version of the address for display.
  final String? formatted;

  /// A string of the address locality.
  final String? locality;

  /// The postal code of the address.
  final String? postalCode;

  /// A Boolean value representing whether this is the primary address for the
  /// associated resource.
  final bool? primary;

  /// The region of the address.
  final String? region;

  /// The street of the address.
  final String? streetAddress;

  /// A string representing the type of address. For example, "Home."
  final String? type;

  Address({
    this.country,
    this.formatted,
    this.locality,
    this.postalCode,
    this.primary,
    this.region,
    this.streetAddress,
    this.type,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      country: json['Country'] as String?,
      formatted: json['Formatted'] as String?,
      locality: json['Locality'] as String?,
      postalCode: json['PostalCode'] as String?,
      primary: json['Primary'] as bool?,
      region: json['Region'] as String?,
      streetAddress: json['StreetAddress'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final country = this.country;
    final formatted = this.formatted;
    final locality = this.locality;
    final postalCode = this.postalCode;
    final primary = this.primary;
    final region = this.region;
    final streetAddress = this.streetAddress;
    final type = this.type;
    return {
      if (country != null) 'Country': country,
      if (formatted != null) 'Formatted': formatted,
      if (locality != null) 'Locality': locality,
      if (postalCode != null) 'PostalCode': postalCode,
      if (primary != null) 'Primary': primary,
      if (region != null) 'Region': region,
      if (streetAddress != null) 'StreetAddress': streetAddress,
      if (type != null) 'Type': type,
    };
  }
}

/// A unique identifier for a user or group that is not the primary identifier.
/// This value can be an identifier from an external identity provider (IdP)
/// that is associated with the user, the group, or a unique attribute.
class AlternateIdentifier {
  /// The identifier issued to this resource by an external identity provider.
  final ExternalId? externalId;

  /// An entity attribute that's unique to a specific entity.
  final UniqueAttribute? uniqueAttribute;

  AlternateIdentifier({
    this.externalId,
    this.uniqueAttribute,
  });

  Map<String, dynamic> toJson() {
    final externalId = this.externalId;
    final uniqueAttribute = this.uniqueAttribute;
    return {
      if (externalId != null) 'ExternalId': externalId,
      if (uniqueAttribute != null) 'UniqueAttribute': uniqueAttribute,
    };
  }
}

/// An operation that applies to the requested group. This operation might add,
/// replace, or remove an attribute.
class AttributeOperation {
  /// A string representation of the path to a given attribute or sub-attribute.
  /// Supports JMESPath.
  final String attributePath;

  /// The value of the attribute. This is a <code>Document</code> type. This type
  /// is not supported by Java V1, Go V1, and older versions of the CLI.
  final AttributeValue? attributeValue;

  AttributeOperation({
    required this.attributePath,
    this.attributeValue,
  });

  Map<String, dynamic> toJson() {
    final attributePath = this.attributePath;
    final attributeValue = this.attributeValue;
    return {
      'AttributePath': attributePath,
      if (attributeValue != null) 'AttributeValue': attributeValue,
    };
  }
}

/// The value of the attribute. This is a <code>Document</code> type. This type
/// is not supported by Java V1, Go V1, and older versions of the CLI.
class AttributeValue {
  AttributeValue();

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateGroupMembershipResponse {
  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  /// The identifier for a newly created <code>GroupMembership</code> in an
  /// identity store.
  final String membershipId;

  CreateGroupMembershipResponse({
    required this.identityStoreId,
    required this.membershipId,
  });

  factory CreateGroupMembershipResponse.fromJson(Map<String, dynamic> json) {
    return CreateGroupMembershipResponse(
      identityStoreId: json['IdentityStoreId'] as String,
      membershipId: json['MembershipId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identityStoreId = this.identityStoreId;
    final membershipId = this.membershipId;
    return {
      'IdentityStoreId': identityStoreId,
      'MembershipId': membershipId,
    };
  }
}

class CreateGroupResponse {
  /// The identifier of the newly created group in the identity store.
  final String groupId;

  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  CreateGroupResponse({
    required this.groupId,
    required this.identityStoreId,
  });

  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateGroupResponse(
      groupId: json['GroupId'] as String,
      identityStoreId: json['IdentityStoreId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final identityStoreId = this.identityStoreId;
    return {
      'GroupId': groupId,
      'IdentityStoreId': identityStoreId,
    };
  }
}

class CreateUserResponse {
  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  /// The identifier of the newly created user in the identity store.
  final String userId;

  CreateUserResponse({
    required this.identityStoreId,
    required this.userId,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      identityStoreId: json['IdentityStoreId'] as String,
      userId: json['UserId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identityStoreId = this.identityStoreId;
    final userId = this.userId;
    return {
      'IdentityStoreId': identityStoreId,
      'UserId': userId,
    };
  }
}

class DeleteGroupMembershipResponse {
  DeleteGroupMembershipResponse();

  factory DeleteGroupMembershipResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGroupMembershipResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteGroupResponse {
  DeleteGroupResponse();

  factory DeleteGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteUserResponse {
  DeleteUserResponse();

  factory DeleteUserResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeGroupMembershipResponse {
  /// The identifier for a group in the identity store.
  final String groupId;

  /// The globally unique identifier for the identity store.
  final String identityStoreId;
  final MemberId memberId;

  /// The identifier for a <code>GroupMembership</code> in an identity store.
  final String membershipId;

  DescribeGroupMembershipResponse({
    required this.groupId,
    required this.identityStoreId,
    required this.memberId,
    required this.membershipId,
  });

  factory DescribeGroupMembershipResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGroupMembershipResponse(
      groupId: json['GroupId'] as String,
      identityStoreId: json['IdentityStoreId'] as String,
      memberId: MemberId.fromJson(json['MemberId'] as Map<String, dynamic>),
      membershipId: json['MembershipId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final identityStoreId = this.identityStoreId;
    final memberId = this.memberId;
    final membershipId = this.membershipId;
    return {
      'GroupId': groupId,
      'IdentityStoreId': identityStoreId,
      'MemberId': memberId,
      'MembershipId': membershipId,
    };
  }
}

class DescribeGroupResponse {
  /// The identifier for a group in the identity store.
  final String groupId;

  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  /// A string containing a description of the group.
  final String? description;

  /// The group’s display name value. The length limit is 1,024 characters. This
  /// value can consist of letters, accented characters, symbols, numbers,
  /// punctuation, tab, new line, carriage return, space, and nonbreaking space in
  /// this attribute. This value is specified at the time that the group is
  /// created and stored as an attribute of the group object in the identity
  /// store.
  final String? displayName;

  /// A list of <code>ExternalId</code> objects that contains the identifiers
  /// issued to this resource by an external identity provider.
  final List<ExternalId>? externalIds;

  DescribeGroupResponse({
    required this.groupId,
    required this.identityStoreId,
    this.description,
    this.displayName,
    this.externalIds,
  });

  factory DescribeGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGroupResponse(
      groupId: json['GroupId'] as String,
      identityStoreId: json['IdentityStoreId'] as String,
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      externalIds: (json['ExternalIds'] as List?)
          ?.whereNotNull()
          .map((e) => ExternalId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final identityStoreId = this.identityStoreId;
    final description = this.description;
    final displayName = this.displayName;
    final externalIds = this.externalIds;
    return {
      'GroupId': groupId,
      'IdentityStoreId': identityStoreId,
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (externalIds != null) 'ExternalIds': externalIds,
    };
  }
}

class DescribeUserResponse {
  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  /// The identifier for a user in the identity store.
  final String userId;

  /// The physical address of the user.
  final List<Address>? addresses;

  /// The display name of the user.
  final String? displayName;

  /// The email address of the user.
  final List<Email>? emails;

  /// A list of <code>ExternalId</code> objects that contains the identifiers
  /// issued to this resource by an external identity provider.
  final List<ExternalId>? externalIds;

  /// A string containing the geographical region or location of the user.
  final String? locale;

  /// The name of the user.
  final Name? name;

  /// An alternative descriptive name for the user.
  final String? nickName;

  /// A list of <code>PhoneNumber</code> objects associated with a user.
  final List<PhoneNumber>? phoneNumbers;

  /// The preferred language of the user.
  final String? preferredLanguage;

  /// A URL link for the user's profile.
  final String? profileUrl;

  /// The time zone for a user.
  final String? timezone;

  /// A string containing the title of the user.
  final String? title;

  /// A unique string used to identify the user. The length limit is 128
  /// characters. This value can consist of letters, accented characters, symbols,
  /// numbers, and punctuation. This value is specified at the time the user is
  /// created and stored as an attribute of the user object in the identity store.
  final String? userName;

  /// A string indicating the type of user.
  final String? userType;

  DescribeUserResponse({
    required this.identityStoreId,
    required this.userId,
    this.addresses,
    this.displayName,
    this.emails,
    this.externalIds,
    this.locale,
    this.name,
    this.nickName,
    this.phoneNumbers,
    this.preferredLanguage,
    this.profileUrl,
    this.timezone,
    this.title,
    this.userName,
    this.userType,
  });

  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUserResponse(
      identityStoreId: json['IdentityStoreId'] as String,
      userId: json['UserId'] as String,
      addresses: (json['Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayName: json['DisplayName'] as String?,
      emails: (json['Emails'] as List?)
          ?.whereNotNull()
          .map((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList(),
      externalIds: (json['ExternalIds'] as List?)
          ?.whereNotNull()
          .map((e) => ExternalId.fromJson(e as Map<String, dynamic>))
          .toList(),
      locale: json['Locale'] as String?,
      name: json['Name'] != null
          ? Name.fromJson(json['Name'] as Map<String, dynamic>)
          : null,
      nickName: json['NickName'] as String?,
      phoneNumbers: (json['PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      preferredLanguage: json['PreferredLanguage'] as String?,
      profileUrl: json['ProfileUrl'] as String?,
      timezone: json['Timezone'] as String?,
      title: json['Title'] as String?,
      userName: json['UserName'] as String?,
      userType: json['UserType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityStoreId = this.identityStoreId;
    final userId = this.userId;
    final addresses = this.addresses;
    final displayName = this.displayName;
    final emails = this.emails;
    final externalIds = this.externalIds;
    final locale = this.locale;
    final name = this.name;
    final nickName = this.nickName;
    final phoneNumbers = this.phoneNumbers;
    final preferredLanguage = this.preferredLanguage;
    final profileUrl = this.profileUrl;
    final timezone = this.timezone;
    final title = this.title;
    final userName = this.userName;
    final userType = this.userType;
    return {
      'IdentityStoreId': identityStoreId,
      'UserId': userId,
      if (addresses != null) 'Addresses': addresses,
      if (displayName != null) 'DisplayName': displayName,
      if (emails != null) 'Emails': emails,
      if (externalIds != null) 'ExternalIds': externalIds,
      if (locale != null) 'Locale': locale,
      if (name != null) 'Name': name,
      if (nickName != null) 'NickName': nickName,
      if (phoneNumbers != null) 'PhoneNumbers': phoneNumbers,
      if (preferredLanguage != null) 'PreferredLanguage': preferredLanguage,
      if (profileUrl != null) 'ProfileUrl': profileUrl,
      if (timezone != null) 'Timezone': timezone,
      if (title != null) 'Title': title,
      if (userName != null) 'UserName': userName,
      if (userType != null) 'UserType': userType,
    };
  }
}

/// The email address associated with the user.
class Email {
  /// A Boolean value representing whether this is the primary email address for
  /// the associated resource.
  final bool? primary;

  /// A string representing the type of address. For example, "Work."
  final String? type;

  /// A string containing an email address. For example, "johndoe@amazon.com."
  final String? value;

  Email({
    this.primary,
    this.type,
    this.value,
  });

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(
      primary: json['Primary'] as bool?,
      type: json['Type'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final primary = this.primary;
    final type = this.type;
    final value = this.value;
    return {
      if (primary != null) 'Primary': primary,
      if (type != null) 'Type': type,
      if (value != null) 'Value': value,
    };
  }
}

/// The identifier issued to this resource by an external identity provider.
class ExternalId {
  /// The identifier issued to this resource by an external identity provider.
  final String id;

  /// The issuer for an external identifier.
  final String issuer;

  ExternalId({
    required this.id,
    required this.issuer,
  });

  factory ExternalId.fromJson(Map<String, dynamic> json) {
    return ExternalId(
      id: json['Id'] as String,
      issuer: json['Issuer'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final issuer = this.issuer;
    return {
      'Id': id,
      'Issuer': issuer,
    };
  }
}

/// A query filter used by <code>ListUsers</code> and <code>ListGroups</code>.
/// This filter object provides the attribute name and attribute value to search
/// users or groups.
class Filter {
  /// The attribute path that is used to specify which attribute name to search.
  /// Length limit is 255 characters. For example, <code>UserName</code> is a
  /// valid attribute path for the <code>ListUsers</code> API, and
  /// <code>DisplayName</code> is a valid attribute path for the
  /// <code>ListGroups</code> API.
  final String attributePath;

  /// Represents the data for an attribute. Each attribute value is described as a
  /// name-value pair.
  final String attributeValue;

  Filter({
    required this.attributePath,
    required this.attributeValue,
  });

  Map<String, dynamic> toJson() {
    final attributePath = this.attributePath;
    final attributeValue = this.attributeValue;
    return {
      'AttributePath': attributePath,
      'AttributeValue': attributeValue,
    };
  }
}

class GetGroupIdResponse {
  /// The identifier for a group in the identity store.
  final String groupId;

  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  GetGroupIdResponse({
    required this.groupId,
    required this.identityStoreId,
  });

  factory GetGroupIdResponse.fromJson(Map<String, dynamic> json) {
    return GetGroupIdResponse(
      groupId: json['GroupId'] as String,
      identityStoreId: json['IdentityStoreId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final identityStoreId = this.identityStoreId;
    return {
      'GroupId': groupId,
      'IdentityStoreId': identityStoreId,
    };
  }
}

class GetGroupMembershipIdResponse {
  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  /// The identifier for a <code>GroupMembership</code> in an identity store.
  final String membershipId;

  GetGroupMembershipIdResponse({
    required this.identityStoreId,
    required this.membershipId,
  });

  factory GetGroupMembershipIdResponse.fromJson(Map<String, dynamic> json) {
    return GetGroupMembershipIdResponse(
      identityStoreId: json['IdentityStoreId'] as String,
      membershipId: json['MembershipId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identityStoreId = this.identityStoreId;
    final membershipId = this.membershipId;
    return {
      'IdentityStoreId': identityStoreId,
      'MembershipId': membershipId,
    };
  }
}

class GetUserIdResponse {
  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  /// The identifier for a user in the identity store.
  final String userId;

  GetUserIdResponse({
    required this.identityStoreId,
    required this.userId,
  });

  factory GetUserIdResponse.fromJson(Map<String, dynamic> json) {
    return GetUserIdResponse(
      identityStoreId: json['IdentityStoreId'] as String,
      userId: json['UserId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identityStoreId = this.identityStoreId;
    final userId = this.userId;
    return {
      'IdentityStoreId': identityStoreId,
      'UserId': userId,
    };
  }
}

/// A group object that contains the metadata and attributes for a specified
/// group.
class Group {
  /// The identifier for a group in the identity store.
  final String groupId;

  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  /// A string containing a description of the specified group.
  final String? description;

  /// The display name value for the group. The length limit is 1,024 characters.
  /// This value can consist of letters, accented characters, symbols, numbers,
  /// punctuation, tab, new line, carriage return, space, and nonbreaking space in
  /// this attribute. This value is specified at the time the group is created and
  /// stored as an attribute of the group object in the identity store.
  final String? displayName;

  /// A list of <code>ExternalId</code> objects that contains the identifiers
  /// issued to this resource by an external identity provider.
  final List<ExternalId>? externalIds;

  Group({
    required this.groupId,
    required this.identityStoreId,
    this.description,
    this.displayName,
    this.externalIds,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupId: json['GroupId'] as String,
      identityStoreId: json['IdentityStoreId'] as String,
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      externalIds: (json['ExternalIds'] as List?)
          ?.whereNotNull()
          .map((e) => ExternalId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final identityStoreId = this.identityStoreId;
    final description = this.description;
    final displayName = this.displayName;
    final externalIds = this.externalIds;
    return {
      'GroupId': groupId,
      'IdentityStoreId': identityStoreId,
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (externalIds != null) 'ExternalIds': externalIds,
    };
  }
}

/// Contains the identifiers for a group, a group member, and a
/// <code>GroupMembership</code> object in the identity store.
class GroupMembership {
  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  /// The identifier for a group in the identity store.
  final String? groupId;

  /// An object that contains the identifier of a group member. Setting the
  /// <code>UserID</code> field to the specific identifier for a user indicates
  /// that the user is a member of the group.
  final MemberId? memberId;

  /// The identifier for a <code>GroupMembership</code> object in an identity
  /// store.
  final String? membershipId;

  GroupMembership({
    required this.identityStoreId,
    this.groupId,
    this.memberId,
    this.membershipId,
  });

  factory GroupMembership.fromJson(Map<String, dynamic> json) {
    return GroupMembership(
      identityStoreId: json['IdentityStoreId'] as String,
      groupId: json['GroupId'] as String?,
      memberId: json['MemberId'] != null
          ? MemberId.fromJson(json['MemberId'] as Map<String, dynamic>)
          : null,
      membershipId: json['MembershipId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityStoreId = this.identityStoreId;
    final groupId = this.groupId;
    final memberId = this.memberId;
    final membershipId = this.membershipId;
    return {
      'IdentityStoreId': identityStoreId,
      if (groupId != null) 'GroupId': groupId,
      if (memberId != null) 'MemberId': memberId,
      if (membershipId != null) 'MembershipId': membershipId,
    };
  }
}

/// Indicates whether a resource is a member of a group in the identity store.
class GroupMembershipExistenceResult {
  /// The identifier for a group in the identity store.
  final String? groupId;

  /// An object that contains the identifier of a group member. Setting the
  /// <code>UserID</code> field to the specific identifier for a user indicates
  /// that the user is a member of the group.
  final MemberId? memberId;

  /// Indicates whether a membership relation exists or not.
  final bool? membershipExists;

  GroupMembershipExistenceResult({
    this.groupId,
    this.memberId,
    this.membershipExists,
  });

  factory GroupMembershipExistenceResult.fromJson(Map<String, dynamic> json) {
    return GroupMembershipExistenceResult(
      groupId: json['GroupId'] as String?,
      memberId: json['MemberId'] != null
          ? MemberId.fromJson(json['MemberId'] as Map<String, dynamic>)
          : null,
      membershipExists: json['MembershipExists'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final memberId = this.memberId;
    final membershipExists = this.membershipExists;
    return {
      if (groupId != null) 'GroupId': groupId,
      if (memberId != null) 'MemberId': memberId,
      if (membershipExists != null) 'MembershipExists': membershipExists,
    };
  }
}

class IsMemberInGroupsResponse {
  /// A list containing the results of membership existence checks.
  final List<GroupMembershipExistenceResult> results;

  IsMemberInGroupsResponse({
    required this.results,
  });

  factory IsMemberInGroupsResponse.fromJson(Map<String, dynamic> json) {
    return IsMemberInGroupsResponse(
      results: (json['Results'] as List)
          .whereNotNull()
          .map((e) => GroupMembershipExistenceResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    return {
      'Results': results,
    };
  }
}

class ListGroupMembershipsForMemberResponse {
  /// A list of <code>GroupMembership</code> objects in the group for a specified
  /// member.
  final List<GroupMembership> groupMemberships;

  /// The pagination token used for the <code>ListUsers</code>,
  /// <code>ListGroups</code>, and <code>ListGroupMemberships</code> API
  /// operations. This value is generated by the identity store service. It is
  /// returned in the API response if the total results are more than the size of
  /// one page. This token is also returned when it is used in the API request to
  /// search for the next page.
  final String? nextToken;

  ListGroupMembershipsForMemberResponse({
    required this.groupMemberships,
    this.nextToken,
  });

  factory ListGroupMembershipsForMemberResponse.fromJson(
      Map<String, dynamic> json) {
    return ListGroupMembershipsForMemberResponse(
      groupMemberships: (json['GroupMemberships'] as List)
          .whereNotNull()
          .map((e) => GroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupMemberships = this.groupMemberships;
    final nextToken = this.nextToken;
    return {
      'GroupMemberships': groupMemberships,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGroupMembershipsResponse {
  /// A list of <code>GroupMembership</code> objects in the group.
  final List<GroupMembership> groupMemberships;

  /// The pagination token used for the <code>ListUsers</code>,
  /// <code>ListGroups</code>, and <code>ListGroupMemberships</code> API
  /// operations. This value is generated by the identity store service. It is
  /// returned in the API response if the total results are more than the size of
  /// one page. This token is also returned when it is used in the API request to
  /// search for the next page.
  final String? nextToken;

  ListGroupMembershipsResponse({
    required this.groupMemberships,
    this.nextToken,
  });

  factory ListGroupMembershipsResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupMembershipsResponse(
      groupMemberships: (json['GroupMemberships'] as List)
          .whereNotNull()
          .map((e) => GroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupMemberships = this.groupMemberships;
    final nextToken = this.nextToken;
    return {
      'GroupMemberships': groupMemberships,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGroupsResponse {
  /// A list of <code>Group</code> objects in the identity store.
  final List<Group> groups;

  /// The pagination token used for the <code>ListUsers</code> and
  /// <code>ListGroups</code> API operations. This value is generated by the
  /// identity store service. It is returned in the API response if the total
  /// results are more than the size of one page. This token is also returned when
  /// it1 is used in the API request to search for the next page.
  final String? nextToken;

  ListGroupsResponse({
    required this.groups,
    this.nextToken,
  });

  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupsResponse(
      groups: (json['Groups'] as List)
          .whereNotNull()
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final nextToken = this.nextToken;
    return {
      'Groups': groups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListUsersResponse {
  /// A list of <code>User</code> objects in the identity store.
  final List<User> users;

  /// The pagination token used for the <code>ListUsers</code> and
  /// <code>ListGroups</code> API operations. This value is generated by the
  /// identity store service. It is returned in the API response if the total
  /// results are more than the size of one page. This token is also returned when
  /// it is used in the API request to search for the next page.
  final String? nextToken;

  ListUsersResponse({
    required this.users,
    this.nextToken,
  });

  factory ListUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListUsersResponse(
      users: (json['Users'] as List)
          .whereNotNull()
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final users = this.users;
    final nextToken = this.nextToken;
    return {
      'Users': users,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// An object containing the identifier of a group member.
class MemberId {
  /// An object containing the identifiers of resources that can be members.
  final String? userId;

  MemberId({
    this.userId,
  });

  factory MemberId.fromJson(Map<String, dynamic> json) {
    return MemberId(
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    return {
      if (userId != null) 'UserId': userId,
    };
  }
}

/// The full name of the user.
class Name {
  /// The family name of the user.
  final String? familyName;

  /// A string containing a formatted version of the name for display.
  final String? formatted;

  /// The given name of the user.
  final String? givenName;

  /// The honorific prefix of the user. For example, "Dr."
  final String? honorificPrefix;

  /// The honorific suffix of the user. For example, "M.D."
  final String? honorificSuffix;

  /// The middle name of the user.
  final String? middleName;

  Name({
    this.familyName,
    this.formatted,
    this.givenName,
    this.honorificPrefix,
    this.honorificSuffix,
    this.middleName,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      familyName: json['FamilyName'] as String?,
      formatted: json['Formatted'] as String?,
      givenName: json['GivenName'] as String?,
      honorificPrefix: json['HonorificPrefix'] as String?,
      honorificSuffix: json['HonorificSuffix'] as String?,
      middleName: json['MiddleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final familyName = this.familyName;
    final formatted = this.formatted;
    final givenName = this.givenName;
    final honorificPrefix = this.honorificPrefix;
    final honorificSuffix = this.honorificSuffix;
    final middleName = this.middleName;
    return {
      if (familyName != null) 'FamilyName': familyName,
      if (formatted != null) 'Formatted': formatted,
      if (givenName != null) 'GivenName': givenName,
      if (honorificPrefix != null) 'HonorificPrefix': honorificPrefix,
      if (honorificSuffix != null) 'HonorificSuffix': honorificSuffix,
      if (middleName != null) 'MiddleName': middleName,
    };
  }
}

/// The phone number associated with the user.
class PhoneNumber {
  /// A Boolean value representing whether this is the primary phone number for
  /// the associated resource.
  final bool? primary;

  /// A string representing the type of a phone number. For example, "Mobile."
  final String? type;

  /// A string containing a phone number. For example, "8675309" or "+1 (800)
  /// 123-4567".
  final String? value;

  PhoneNumber({
    this.primary,
    this.type,
    this.value,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> json) {
    return PhoneNumber(
      primary: json['Primary'] as bool?,
      type: json['Type'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final primary = this.primary;
    final type = this.type;
    final value = this.value;
    return {
      if (primary != null) 'Primary': primary,
      if (type != null) 'Type': type,
      if (value != null) 'Value': value,
    };
  }
}

/// An entity attribute that's unique to a specific entity.
class UniqueAttribute {
  /// A string representation of the path to a given attribute or sub-attribute.
  /// Supports JMESPath.
  final String attributePath;

  /// The value of the attribute. This is a <code>Document</code> type. This type
  /// is not supported by Java V1, Go V1, and older versions of the CLI.
  final AttributeValue attributeValue;

  UniqueAttribute({
    required this.attributePath,
    required this.attributeValue,
  });

  Map<String, dynamic> toJson() {
    final attributePath = this.attributePath;
    final attributeValue = this.attributeValue;
    return {
      'AttributePath': attributePath,
      'AttributeValue': attributeValue,
    };
  }
}

class UpdateGroupResponse {
  UpdateGroupResponse();

  factory UpdateGroupResponse.fromJson(Map<String, dynamic> _) {
    return UpdateGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateUserResponse {
  UpdateUserResponse();

  factory UpdateUserResponse.fromJson(Map<String, dynamic> _) {
    return UpdateUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A user object that contains the metadata and attributes for a specified
/// user.
class User {
  /// The globally unique identifier for the identity store.
  final String identityStoreId;

  /// The identifier for a user in the identity store.
  final String userId;

  /// A list of <code>Address</code> objects containing addresses associated with
  /// the user.
  final List<Address>? addresses;

  /// A string containing the name of the user that is formatted for display when
  /// the user is referenced. For example, "John Doe."
  final String? displayName;

  /// A list of <code>Email</code> objects containing email addresses associated
  /// with the user.
  final List<Email>? emails;

  /// A list of <code>ExternalId</code> objects that contains the identifiers
  /// issued to this resource by an external identity provider.
  final List<ExternalId>? externalIds;

  /// A string containing the geographical region or location of the user.
  final String? locale;

  /// An object containing the name of the user.
  final Name? name;

  /// A string containing an alternate name for the user.
  final String? nickName;

  /// A list of <code>PhoneNumber</code> objects containing phone numbers
  /// associated with the user.
  final List<PhoneNumber>? phoneNumbers;

  /// A string containing the preferred language of the user. For example,
  /// "American English" or "en-us."
  final String? preferredLanguage;

  /// A string containing a URL that might be associated with the user.
  final String? profileUrl;

  /// A string containing the time zone of the user.
  final String? timezone;

  /// A string containing the title of the user. Possible values are left
  /// unspecified. The value can vary based on your specific use case.
  final String? title;

  /// A unique string used to identify the user. The length limit is 128
  /// characters. This value can consist of letters, accented characters, symbols,
  /// numbers, and punctuation. This value is specified at the time the user is
  /// created and stored as an attribute of the user object in the identity store.
  final String? userName;

  /// A string indicating the type of user. Possible values are left unspecified.
  /// The value can vary based on your specific use case.
  final String? userType;

  User({
    required this.identityStoreId,
    required this.userId,
    this.addresses,
    this.displayName,
    this.emails,
    this.externalIds,
    this.locale,
    this.name,
    this.nickName,
    this.phoneNumbers,
    this.preferredLanguage,
    this.profileUrl,
    this.timezone,
    this.title,
    this.userName,
    this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      identityStoreId: json['IdentityStoreId'] as String,
      userId: json['UserId'] as String,
      addresses: (json['Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayName: json['DisplayName'] as String?,
      emails: (json['Emails'] as List?)
          ?.whereNotNull()
          .map((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList(),
      externalIds: (json['ExternalIds'] as List?)
          ?.whereNotNull()
          .map((e) => ExternalId.fromJson(e as Map<String, dynamic>))
          .toList(),
      locale: json['Locale'] as String?,
      name: json['Name'] != null
          ? Name.fromJson(json['Name'] as Map<String, dynamic>)
          : null,
      nickName: json['NickName'] as String?,
      phoneNumbers: (json['PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      preferredLanguage: json['PreferredLanguage'] as String?,
      profileUrl: json['ProfileUrl'] as String?,
      timezone: json['Timezone'] as String?,
      title: json['Title'] as String?,
      userName: json['UserName'] as String?,
      userType: json['UserType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityStoreId = this.identityStoreId;
    final userId = this.userId;
    final addresses = this.addresses;
    final displayName = this.displayName;
    final emails = this.emails;
    final externalIds = this.externalIds;
    final locale = this.locale;
    final name = this.name;
    final nickName = this.nickName;
    final phoneNumbers = this.phoneNumbers;
    final preferredLanguage = this.preferredLanguage;
    final profileUrl = this.profileUrl;
    final timezone = this.timezone;
    final title = this.title;
    final userName = this.userName;
    final userType = this.userType;
    return {
      'IdentityStoreId': identityStoreId,
      'UserId': userId,
      if (addresses != null) 'Addresses': addresses,
      if (displayName != null) 'DisplayName': displayName,
      if (emails != null) 'Emails': emails,
      if (externalIds != null) 'ExternalIds': externalIds,
      if (locale != null) 'Locale': locale,
      if (name != null) 'Name': name,
      if (nickName != null) 'NickName': nickName,
      if (phoneNumbers != null) 'PhoneNumbers': phoneNumbers,
      if (preferredLanguage != null) 'PreferredLanguage': preferredLanguage,
      if (profileUrl != null) 'ProfileUrl': profileUrl,
      if (timezone != null) 'Timezone': timezone,
      if (title != null) 'Title': title,
      if (userName != null) 'UserName': userName,
      if (userType != null) 'UserType': userType,
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
