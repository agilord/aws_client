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

/// Amazon Web Services Directory Service Data is an extension of Directory
/// Service. This API reference provides detailed information about Directory
/// Service Data operations and object types.
///
/// With Directory Service Data, you can create, read, update, and delete users,
/// groups, and memberships from your Managed Microsoft AD without additional
/// costs and without deploying dedicated management instances. You can also
/// perform built-in object management tasks across directories without direct
/// network connectivity, which simplifies provisioning and access management to
/// achieve fully automated deployments. Directory Service Data supports user
/// and group write operations, such as <code>CreateUser</code> and
/// <code>CreateGroup</code>, within the organizational unit (OU) of your
/// Managed Microsoft AD. Directory Service Data supports read operations, such
/// as <code>ListUsers</code> and <code>ListGroups</code>, on all users, groups,
/// and group memberships within your Managed Microsoft AD and across trusted
/// realms. Directory Service Data supports adding and removing group members in
/// your OU and the Amazon Web Services Delegated Groups OU, so you can grant
/// and deny access to specific roles and permissions. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_manage_users_groups.html">Manage
/// users and groups</a> in the <i>Directory Service Administration Guide</i>.
/// <note>
/// Directory management operations and configuration changes made against the
/// Directory Service API will also reflect in Directory Service Data API with
/// eventual consistency. You can expect a short delay between management
/// changes, such as adding a new directory trust and calling the Directory
/// Service Data API for the newly created trusted realm.
/// </note>
/// Directory Service Data connects to your Managed Microsoft AD domain
/// controllers and performs operations on underlying directory objects. When
/// you create your Managed Microsoft AD, you choose subnets for domain
/// controllers that Directory Service creates on your behalf. If a domain
/// controller is unavailable, Directory Service Data uses an available domain
/// controller. As a result, you might notice eventual consistency while objects
/// replicate from one domain controller to another domain controller. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_getting_started_what_gets_created.html">What
/// gets created</a> in the <i>Directory Service Administration Guide</i>.
/// Directory limits vary by Managed Microsoft AD edition:
///
/// <ul>
/// <li>
/// <b>Standard edition</b> – Supports 8 transactions per second (TPS) for read
/// operations and 4 TPS for write operations per directory. There's a
/// concurrency limit of 10 concurrent requests.
/// </li>
/// <li>
/// <b>Enterprise edition</b> – Supports 16 transactions per second (TPS) for
/// read operations and 8 TPS for write operations per directory. There's a
/// concurrency limit of 10 concurrent requests.
/// </li>
/// <li>
/// <b>Amazon Web Services Account</b> - Supports a total of 100 TPS for
/// Directory Service Data operations across all directories.
/// </li>
/// </ul>
/// Directory Service Data only supports the Managed Microsoft AD directory type
/// and is only available in the primary Amazon Web Services Region. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html">Managed
/// Microsoft AD</a> and <a
/// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/multi-region-global-primary-additional.html">Primary
/// vs additional Regions</a> in the <i>Directory Service Administration
/// Guide</i>.
class DirectoryServiceData {
  final _s.RestJsonProtocol _protocol;
  DirectoryServiceData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ds-data',
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

  /// Adds an existing user, group, or computer as a group member.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the group.
  ///
  /// Parameter [groupName] :
  /// The name of the group.
  ///
  /// Parameter [memberName] :
  /// The <code>SAMAccountName</code> of the user, group, or computer to add as
  /// a group member.
  ///
  /// Parameter [clientToken] :
  /// A unique and case-sensitive identifier that you provide to make sure the
  /// idempotency of the request, so multiple identical calls have the same
  /// effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// completes. After 8 hours, any request with the same client token is
  /// treated as a new request. If the request succeeds, any future uses of that
  /// token will be idempotent for another 8 hours.
  ///
  /// If you submit a request with the same client token but change one of the
  /// other parameters within the 8-hour idempotency window, Directory Service
  /// Data returns an <code>ConflictException</code>.
  /// <note>
  /// This parameter is optional when using the CLI or SDK.
  /// </note>
  ///
  /// Parameter [memberRealm] :
  /// The domain name that's associated with the group member. This parameter is
  /// required only when adding a member outside of your Managed Microsoft AD
  /// domain to a group inside of your Managed Microsoft AD domain. This
  /// parameter defaults to the Managed Microsoft AD domain.
  /// <note>
  /// This parameter is case insensitive.
  /// </note>
  Future<void> addGroupMember({
    required String directoryId,
    required String groupName,
    required String memberName,
    String? clientToken,
    String? memberRealm,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'GroupName': groupName,
      'MemberName': memberName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (memberRealm != null) 'MemberRealm': memberRealm,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GroupMemberships/AddGroupMember',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the group.
  ///
  /// Parameter [sAMAccountName] :
  /// The name of the group.
  ///
  /// Parameter [clientToken] :
  /// A unique and case-sensitive identifier that you provide to make sure the
  /// idempotency of the request, so multiple identical calls have the same
  /// effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// completes. After 8 hours, any request with the same client token is
  /// treated as a new request. If the request succeeds, any future uses of that
  /// token will be idempotent for another 8 hours.
  ///
  /// If you submit a request with the same client token but change one of the
  /// other parameters within the 8-hour idempotency window, Directory Service
  /// Data returns an <code>ConflictException</code>.
  /// <note>
  /// This parameter is optional when using the CLI or SDK.
  /// </note>
  ///
  /// Parameter [groupScope] :
  /// The scope of the AD group. For details, see <a
  /// href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#group-scope">Active
  /// Directory security group scope</a>.
  ///
  /// Parameter [groupType] :
  /// The AD group type. For details, see <a
  /// href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#how-active-directory-security-groups-work">Active
  /// Directory security group type</a>.
  ///
  /// Parameter [otherAttributes] :
  /// An expression that defines one or more attributes with the data type and
  /// value of each attribute.
  Future<CreateGroupResult> createGroup({
    required String directoryId,
    required String sAMAccountName,
    String? clientToken,
    GroupScope? groupScope,
    GroupType? groupType,
    Map<String, AttributeValue>? otherAttributes,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (groupScope != null) 'GroupScope': groupScope.value,
      if (groupType != null) 'GroupType': groupType.value,
      if (otherAttributes != null) 'OtherAttributes': otherAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Groups/CreateGroup',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateGroupResult.fromJson(response);
  }

  /// Creates a new user.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that’s associated with the user.
  ///
  /// Parameter [sAMAccountName] :
  /// The name of the user.
  ///
  /// Parameter [clientToken] :
  /// A unique and case-sensitive identifier that you provide to make sure the
  /// idempotency of the request, so multiple identical calls have the same
  /// effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// completes. After 8 hours, any request with the same client token is
  /// treated as a new request. If the request succeeds, any future uses of that
  /// token will be idempotent for another 8 hours.
  ///
  /// If you submit a request with the same client token but change one of the
  /// other parameters within the 8-hour idempotency window, Directory Service
  /// Data returns an <code>ConflictException</code>.
  /// <note>
  /// This parameter is optional when using the CLI or SDK.
  /// </note>
  ///
  /// Parameter [emailAddress] :
  /// The email address of the user.
  ///
  /// Parameter [givenName] :
  /// The first name of the user.
  ///
  /// Parameter [otherAttributes] :
  /// An expression that defines one or more attribute names with the data type
  /// and value of each attribute. A key is an attribute name, and the value is
  /// a list of maps. For a list of supported attributes, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ad_data_attributes.html">Directory
  /// Service Data Attributes</a>.
  /// <note>
  /// Attribute names are case insensitive.
  /// </note>
  ///
  /// Parameter [surname] :
  /// The last name of the user.
  Future<CreateUserResult> createUser({
    required String directoryId,
    required String sAMAccountName,
    String? clientToken,
    String? emailAddress,
    String? givenName,
    Map<String, AttributeValue>? otherAttributes,
    String? surname,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (givenName != null) 'GivenName': givenName,
      if (otherAttributes != null) 'OtherAttributes': otherAttributes,
      if (surname != null) 'Surname': surname,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Users/CreateUser',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserResult.fromJson(response);
  }

  /// Deletes a group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the group.
  ///
  /// Parameter [sAMAccountName] :
  /// The name of the group.
  ///
  /// Parameter [clientToken] :
  /// A unique and case-sensitive identifier that you provide to make sure the
  /// idempotency of the request, so multiple identical calls have the same
  /// effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// completes. After 8 hours, any request with the same client token is
  /// treated as a new request. If the request succeeds, any future uses of that
  /// token will be idempotent for another 8 hours.
  ///
  /// If you submit a request with the same client token but change one of the
  /// other parameters within the 8-hour idempotency window, Directory Service
  /// Data returns an <code>ConflictException</code>.
  /// <note>
  /// This parameter is optional when using the CLI or SDK.
  /// </note>
  Future<void> deleteGroup({
    required String directoryId,
    required String sAMAccountName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Groups/DeleteGroup',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a user.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the user.
  ///
  /// Parameter [sAMAccountName] :
  /// The name of the user.
  ///
  /// Parameter [clientToken] :
  /// A unique and case-sensitive identifier that you provide to make sure the
  /// idempotency of the request, so multiple identical calls have the same
  /// effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// completes. After 8 hours, any request with the same client token is
  /// treated as a new request. If the request succeeds, any future uses of that
  /// token will be idempotent for another 8 hours.
  ///
  /// If you submit a request with the same client token but change one of the
  /// other parameters within the 8-hour idempotency window, Directory Service
  /// Data returns an <code>ConflictException</code>.
  /// <note>
  /// This parameter is optional when using the CLI or SDK.
  /// </note>
  Future<void> deleteUser({
    required String directoryId,
    required String sAMAccountName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Users/DeleteUser',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about a specific group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The Identifier (ID) of the directory associated with the group.
  ///
  /// Parameter [sAMAccountName] :
  /// The name of the group.
  ///
  /// Parameter [otherAttributes] :
  /// One or more attributes to be returned for the group. For a list of
  /// supported attributes, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ad_data_attributes.html">Directory
  /// Service Data Attributes</a>.
  ///
  /// Parameter [realm] :
  /// The domain name that's associated with the group.
  /// <note>
  /// This parameter is optional, so you can return groups outside of your
  /// Managed Microsoft AD domain. When no value is defined, only your Managed
  /// Microsoft AD groups are returned.
  ///
  /// This value is case insensitive.
  /// </note>
  Future<DescribeGroupResult> describeGroup({
    required String directoryId,
    required String sAMAccountName,
    List<String>? otherAttributes,
    String? realm,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      if (otherAttributes != null) 'OtherAttributes': otherAttributes,
      if (realm != null) 'Realm': realm,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Groups/DescribeGroup',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGroupResult.fromJson(response);
  }

  /// Returns information about a specific user.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the user.
  ///
  /// Parameter [sAMAccountName] :
  /// The name of the user.
  ///
  /// Parameter [otherAttributes] :
  /// One or more attribute names to be returned for the user. A key is an
  /// attribute name, and the value is a list of maps. For a list of supported
  /// attributes, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ad_data_attributes.html">Directory
  /// Service Data Attributes</a>.
  ///
  /// Parameter [realm] :
  /// The domain name that's associated with the user.
  /// <note>
  /// This parameter is optional, so you can return users outside your Managed
  /// Microsoft AD domain. When no value is defined, only your Managed Microsoft
  /// AD users are returned.
  ///
  /// This value is case insensitive.
  /// </note>
  Future<DescribeUserResult> describeUser({
    required String directoryId,
    required String sAMAccountName,
    List<String>? otherAttributes,
    String? realm,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      if (otherAttributes != null) 'OtherAttributes': otherAttributes,
      if (realm != null) 'Realm': realm,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Users/DescribeUser',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUserResult.fromJson(response);
  }

  /// Deactivates an active user account. For information about how to enable an
  /// inactive user account, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/devguide/API_ResetUserPassword.html">ResetUserPassword</a>
  /// in the <i>Directory Service API Reference</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the user.
  ///
  /// Parameter [sAMAccountName] :
  /// The name of the user.
  ///
  /// Parameter [clientToken] :
  /// A unique and case-sensitive identifier that you provide to make sure the
  /// idempotency of the request, so multiple identical calls have the same
  /// effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// completes. After 8 hours, any request with the same client token is
  /// treated as a new request. If the request succeeds, any future uses of that
  /// token will be idempotent for another 8 hours.
  ///
  /// If you submit a request with the same client token but change one of the
  /// other parameters within the 8-hour idempotency window, Directory Service
  /// Data returns an <code>ConflictException</code>.
  /// <note>
  /// This parameter is optional when using the CLI or SDK.
  /// </note>
  Future<void> disableUser({
    required String directoryId,
    required String sAMAccountName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Users/DisableUser',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns member information for the specified group.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> request and response parameters. If more results
  /// are available, the <code>ListGroupMembers.NextToken</code> member contains
  /// a token that you pass in the next call to <code>ListGroupMembers</code>.
  /// This retrieves the next set of items.
  ///
  /// You can also specify a maximum number of return results with the
  /// <code>MaxResults</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the group.
  ///
  /// Parameter [sAMAccountName] :
  /// The name of the group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [memberRealm] :
  /// The domain name that's associated with the group member. This parameter
  /// defaults to the Managed Microsoft AD domain.
  /// <note>
  /// This parameter is optional and case insensitive.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  ///
  /// Parameter [realm] :
  /// The domain name that's associated with the group.
  /// <note>
  /// This parameter is optional, so you can return members from a group outside
  /// of your Managed Microsoft AD domain. When no value is defined, only
  /// members of your Managed Microsoft AD groups are returned.
  ///
  /// This value is case insensitive.
  /// </note>
  Future<ListGroupMembersResult> listGroupMembers({
    required String directoryId,
    required String sAMAccountName,
    int? maxResults,
    String? memberRealm,
    String? nextToken,
    String? realm,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      if (maxResults != null) 'MaxResults': maxResults,
      if (memberRealm != null) 'MemberRealm': memberRealm,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GroupMemberships/ListGroupMembers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupMembersResult.fromJson(response);
  }

  /// Returns group information for the specified directory.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> request and response parameters. If more results
  /// are available, the <code>ListGroups.NextToken</code> member contains a
  /// token that you pass in the next call to <code>ListGroups</code>. This
  /// retrieves the next set of items.
  ///
  /// You can also specify a maximum number of return results with the
  /// <code>MaxResults</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  ///
  /// Parameter [realm] :
  /// The domain name associated with the directory.
  /// <note>
  /// This parameter is optional, so you can return groups outside of your
  /// Managed Microsoft AD domain. When no value is defined, only your Managed
  /// Microsoft AD groups are returned.
  ///
  /// This value is case insensitive.
  /// </note>
  Future<ListGroupsResult> listGroups({
    required String directoryId,
    int? maxResults,
    String? nextToken,
    String? realm,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Groups/ListGroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupsResult.fromJson(response);
  }

  /// Returns group information for the specified member.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> request and response parameters. If more results
  /// are available, the <code>ListGroupsForMember.NextToken</code> member
  /// contains a token that you pass in the next call to
  /// <code>ListGroupsForMember</code>. This retrieves the next set of items.
  ///
  /// You can also specify a maximum number of return results with the
  /// <code>MaxResults</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the member.
  ///
  /// Parameter [sAMAccountName] :
  /// The <code>SAMAccountName</code> of the user, group, or computer that's a
  /// member of the group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [memberRealm] :
  /// The domain name that's associated with the group member.
  /// <note>
  /// This parameter is optional, so you can limit your results to the group
  /// members in a specific domain.
  ///
  /// This parameter is case insensitive and defaults to <code>Realm</code>
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  ///
  /// Parameter [realm] :
  /// The domain name that's associated with the group.
  /// <note>
  /// This parameter is optional, so you can return groups outside of your
  /// Managed Microsoft AD domain. When no value is defined, only your Managed
  /// Microsoft AD groups are returned.
  ///
  /// This value is case insensitive and defaults to your Managed Microsoft AD
  /// domain.
  /// </note>
  Future<ListGroupsForMemberResult> listGroupsForMember({
    required String directoryId,
    required String sAMAccountName,
    int? maxResults,
    String? memberRealm,
    String? nextToken,
    String? realm,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      if (maxResults != null) 'MaxResults': maxResults,
      if (memberRealm != null) 'MemberRealm': memberRealm,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GroupMemberships/ListGroupsForMember',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupsForMemberResult.fromJson(response);
  }

  /// Returns user information for the specified directory.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> request and response parameters. If more results
  /// are available, the <code>ListUsers.NextToken</code> member contains a
  /// token that you pass in the next call to <code>ListUsers</code>. This
  /// retrieves the next set of items.
  ///
  /// You can also specify a maximum number of return results with the
  /// <code>MaxResults</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the user.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  ///
  /// Parameter [realm] :
  /// The domain name that's associated with the user.
  /// <note>
  /// This parameter is optional, so you can return users outside of your
  /// Managed Microsoft AD domain. When no value is defined, only your Managed
  /// Microsoft AD users are returned.
  ///
  /// This value is case insensitive.
  /// </note>
  Future<ListUsersResult> listUsers({
    required String directoryId,
    int? maxResults,
    String? nextToken,
    String? realm,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Users/ListUsers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUsersResult.fromJson(response);
  }

  /// Removes a member from a group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the member.
  ///
  /// Parameter [groupName] :
  /// The name of the group.
  ///
  /// Parameter [memberName] :
  /// The <code>SAMAccountName</code> of the user, group, or computer to remove
  /// from the group.
  ///
  /// Parameter [clientToken] :
  /// A unique and case-sensitive identifier that you provide to make sure the
  /// idempotency of the request, so multiple identical calls have the same
  /// effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// completes. After 8 hours, any request with the same client token is
  /// treated as a new request. If the request succeeds, any future uses of that
  /// token will be idempotent for another 8 hours.
  ///
  /// If you submit a request with the same client token but change one of the
  /// other parameters within the 8-hour idempotency window, Directory Service
  /// Data returns an <code>ConflictException</code>.
  /// <note>
  /// This parameter is optional when using the CLI or SDK.
  /// </note>
  ///
  /// Parameter [memberRealm] :
  /// The domain name that's associated with the group member. This parameter
  /// defaults to the Managed Microsoft AD domain.
  /// <note>
  /// This parameter is optional and case insensitive.
  /// </note>
  Future<void> removeGroupMember({
    required String directoryId,
    required String groupName,
    required String memberName,
    String? clientToken,
    String? memberRealm,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'GroupName': groupName,
      'MemberName': memberName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (memberRealm != null) 'MemberRealm': memberRealm,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GroupMemberships/RemoveGroupMember',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Searches the specified directory for a group. You can find groups that
  /// match the <code>SearchString</code> parameter with the value of their
  /// attributes included in the <code>SearchString</code> parameter.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> request and response parameters. If more results
  /// are available, the <code>SearchGroups.NextToken</code> member contains a
  /// token that you pass in the next call to <code>SearchGroups</code>. This
  /// retrieves the next set of items.
  ///
  /// You can also specify a maximum number of return results with the
  /// <code>MaxResults</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the group.
  ///
  /// Parameter [searchAttributes] :
  /// One or more data attributes that are used to search for a group. For a
  /// list of supported attributes, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ad_data_attributes.html">Directory
  /// Service Data Attributes</a>.
  ///
  /// Parameter [searchString] :
  /// The attribute value that you want to search for.
  /// <note>
  /// Wildcard <code>(*)</code> searches aren't supported. For a list of
  /// supported attributes, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ad_data_attributes.html">Directory
  /// Service Data Attributes</a>.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  ///
  /// Parameter [realm] :
  /// The domain name that's associated with the group.
  /// <note>
  /// This parameter is optional, so you can return groups outside of your
  /// Managed Microsoft AD domain. When no value is defined, only your Managed
  /// Microsoft AD groups are returned.
  ///
  /// This value is case insensitive.
  /// </note>
  Future<SearchGroupsResult> searchGroups({
    required String directoryId,
    required List<String> searchAttributes,
    required String searchString,
    int? maxResults,
    String? nextToken,
    String? realm,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SearchAttributes': searchAttributes,
      'SearchString': searchString,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Groups/SearchGroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchGroupsResult.fromJson(response);
  }

  /// Searches the specified directory for a user. You can find users that match
  /// the <code>SearchString</code> parameter with the value of their attributes
  /// included in the <code>SearchString</code> parameter.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> request and response parameters. If more results
  /// are available, the <code>SearchUsers.NextToken</code> member contains a
  /// token that you pass in the next call to <code>SearchUsers</code>. This
  /// retrieves the next set of items.
  ///
  /// You can also specify a maximum number of return results with the
  /// <code>MaxResults</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the user.
  ///
  /// Parameter [searchAttributes] :
  /// One or more data attributes that are used to search for a user. For a list
  /// of supported attributes, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ad_data_attributes.html">Directory
  /// Service Data Attributes</a>.
  ///
  /// Parameter [searchString] :
  /// The attribute value that you want to search for.
  /// <note>
  /// Wildcard <code>(*)</code> searches aren't supported. For a list of
  /// supported attributes, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ad_data_attributes.html">Directory
  /// Service Data Attributes</a>.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  ///
  /// Parameter [realm] :
  /// The domain name that's associated with the user.
  /// <note>
  /// This parameter is optional, so you can return users outside of your
  /// Managed Microsoft AD domain. When no value is defined, only your Managed
  /// Microsoft AD users are returned.
  ///
  /// This value is case insensitive.
  /// </note>
  Future<SearchUsersResult> searchUsers({
    required String directoryId,
    required List<String> searchAttributes,
    required String searchString,
    int? maxResults,
    String? nextToken,
    String? realm,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SearchAttributes': searchAttributes,
      'SearchString': searchString,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Users/SearchUsers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchUsersResult.fromJson(response);
  }

  /// Updates group information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the group.
  ///
  /// Parameter [sAMAccountName] :
  /// The name of the group.
  ///
  /// Parameter [clientToken] :
  /// A unique and case-sensitive identifier that you provide to make sure the
  /// idempotency of the request, so multiple identical calls have the same
  /// effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// completes. After 8 hours, any request with the same client token is
  /// treated as a new request. If the request succeeds, any future uses of that
  /// token will be idempotent for another 8 hours.
  ///
  /// If you submit a request with the same client token but change one of the
  /// other parameters within the 8-hour idempotency window, Directory Service
  /// Data returns an <code>ConflictException</code>.
  /// <note>
  /// This parameter is optional when using the CLI or SDK.
  /// </note>
  ///
  /// Parameter [groupScope] :
  /// The scope of the AD group. For details, see <a
  /// href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#group-scope">Active
  /// Directory security groups</a>.
  ///
  /// Parameter [groupType] :
  /// The AD group type. For details, see <a
  /// href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#how-active-directory-security-groups-work">Active
  /// Directory security group type</a>.
  ///
  /// Parameter [otherAttributes] :
  /// An expression that defines one or more attributes with the data type and
  /// the value of each attribute.
  ///
  /// Parameter [updateType] :
  /// The type of update to be performed. If no value exists for the attribute,
  /// use <code>ADD</code>. Otherwise, use <code>REPLACE</code> to change an
  /// attribute value or <code>REMOVE</code> to clear the attribute value.
  Future<void> updateGroup({
    required String directoryId,
    required String sAMAccountName,
    String? clientToken,
    GroupScope? groupScope,
    GroupType? groupType,
    Map<String, AttributeValue>? otherAttributes,
    UpdateType? updateType,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (groupScope != null) 'GroupScope': groupScope.value,
      if (groupType != null) 'GroupType': groupType.value,
      if (otherAttributes != null) 'OtherAttributes': otherAttributes,
      if (updateType != null) 'UpdateType': updateType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Groups/UpdateGroup',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates user information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier (ID) of the directory that's associated with the user.
  ///
  /// Parameter [sAMAccountName] :
  /// The name of the user.
  ///
  /// Parameter [clientToken] :
  /// A unique and case-sensitive identifier that you provide to make sure the
  /// idempotency of the request, so multiple identical calls have the same
  /// effect as one single call.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// completes. After 8 hours, any request with the same client token is
  /// treated as a new request. If the request succeeds, any future uses of that
  /// token will be idempotent for another 8 hours.
  ///
  /// If you submit a request with the same client token but change one of the
  /// other parameters within the 8-hour idempotency window, Directory Service
  /// Data returns an <code>ConflictException</code>.
  /// <note>
  /// This parameter is optional when using the CLI or SDK.
  /// </note>
  ///
  /// Parameter [emailAddress] :
  /// The email address of the user.
  ///
  /// Parameter [givenName] :
  /// The first name of the user.
  ///
  /// Parameter [otherAttributes] :
  /// An expression that defines one or more attribute names with the data type
  /// and value of each attribute. A key is an attribute name, and the value is
  /// a list of maps. For a list of supported attributes, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ad_data_attributes.html">Directory
  /// Service Data Attributes</a>.
  /// <note>
  /// Attribute names are case insensitive.
  /// </note>
  ///
  /// Parameter [surname] :
  /// The last name of the user.
  ///
  /// Parameter [updateType] :
  /// The type of update to be performed. If no value exists for the attribute,
  /// use <code>ADD</code>. Otherwise, use <code>REPLACE</code> to change an
  /// attribute value or <code>REMOVE</code> to clear the attribute value.
  Future<void> updateUser({
    required String directoryId,
    required String sAMAccountName,
    String? clientToken,
    String? emailAddress,
    String? givenName,
    Map<String, AttributeValue>? otherAttributes,
    String? surname,
    UpdateType? updateType,
  }) async {
    final $query = <String, List<String>>{
      'DirectoryId': [directoryId],
    };
    final $payload = <String, dynamic>{
      'SAMAccountName': sAMAccountName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (givenName != null) 'GivenName': givenName,
      if (otherAttributes != null) 'OtherAttributes': otherAttributes,
      if (surname != null) 'Surname': surname,
      if (updateType != null) 'UpdateType': updateType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Users/UpdateUser',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class AddGroupMemberResult {
  AddGroupMemberResult();

  factory AddGroupMemberResult.fromJson(Map<String, dynamic> _) {
    return AddGroupMemberResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateGroupResult {
  /// The identifier (ID) of the directory that's associated with the group.
  final String? directoryId;

  /// The name of the group.
  final String? sAMAccountName;

  /// The unique security identifier (SID) of the group.
  final String? sid;

  CreateGroupResult({
    this.directoryId,
    this.sAMAccountName,
    this.sid,
  });

  factory CreateGroupResult.fromJson(Map<String, dynamic> json) {
    return CreateGroupResult(
      directoryId: json['DirectoryId'] as String?,
      sAMAccountName: json['SAMAccountName'] as String?,
      sid: json['SID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final sAMAccountName = this.sAMAccountName;
    final sid = this.sid;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (sAMAccountName != null) 'SAMAccountName': sAMAccountName,
      if (sid != null) 'SID': sid,
    };
  }
}

/// @nodoc
class CreateUserResult {
  /// The identifier (ID) of the directory where the address block is added.
  final String? directoryId;

  /// The name of the user.
  final String? sAMAccountName;

  /// The unique security identifier (SID) of the user.
  final String? sid;

  CreateUserResult({
    this.directoryId,
    this.sAMAccountName,
    this.sid,
  });

  factory CreateUserResult.fromJson(Map<String, dynamic> json) {
    return CreateUserResult(
      directoryId: json['DirectoryId'] as String?,
      sAMAccountName: json['SAMAccountName'] as String?,
      sid: json['SID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final sAMAccountName = this.sAMAccountName;
    final sid = this.sid;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (sAMAccountName != null) 'SAMAccountName': sAMAccountName,
      if (sid != null) 'SID': sid,
    };
  }
}

/// @nodoc
class DeleteGroupResult {
  DeleteGroupResult();

  factory DeleteGroupResult.fromJson(Map<String, dynamic> _) {
    return DeleteGroupResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteUserResult {
  DeleteUserResult();

  factory DeleteUserResult.fromJson(Map<String, dynamic> _) {
    return DeleteUserResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DescribeGroupResult {
  /// The identifier (ID) of the directory that's associated with the group.
  final String? directoryId;

  /// The <a
  /// href="https://learn.microsoft.com/en-us/windows/win32/ad/object-names-and-identities#distinguished-name">distinguished
  /// name</a> of the object.
  final String? distinguishedName;

  /// The scope of the AD group. For details, see <a
  /// href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#group-scope">Active
  /// Directory security groups</a>.
  final GroupScope? groupScope;

  /// The AD group type. For details, see <a
  /// href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#how-active-directory-security-groups-work">Active
  /// Directory security group type</a>.
  final GroupType? groupType;

  /// The attribute values that are returned for the attribute names that are
  /// included in the request.
  final Map<String, AttributeValue>? otherAttributes;

  /// The domain name that's associated with the group.
  final String? realm;

  /// The name of the group.
  final String? sAMAccountName;

  /// The unique security identifier (SID) of the group.
  final String? sid;

  DescribeGroupResult({
    this.directoryId,
    this.distinguishedName,
    this.groupScope,
    this.groupType,
    this.otherAttributes,
    this.realm,
    this.sAMAccountName,
    this.sid,
  });

  factory DescribeGroupResult.fromJson(Map<String, dynamic> json) {
    return DescribeGroupResult(
      directoryId: json['DirectoryId'] as String?,
      distinguishedName: json['DistinguishedName'] as String?,
      groupScope: (json['GroupScope'] as String?)?.let(GroupScope.fromString),
      groupType: (json['GroupType'] as String?)?.let(GroupType.fromString),
      otherAttributes: (json['OtherAttributes'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      realm: json['Realm'] as String?,
      sAMAccountName: json['SAMAccountName'] as String?,
      sid: json['SID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final distinguishedName = this.distinguishedName;
    final groupScope = this.groupScope;
    final groupType = this.groupType;
    final otherAttributes = this.otherAttributes;
    final realm = this.realm;
    final sAMAccountName = this.sAMAccountName;
    final sid = this.sid;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (distinguishedName != null) 'DistinguishedName': distinguishedName,
      if (groupScope != null) 'GroupScope': groupScope.value,
      if (groupType != null) 'GroupType': groupType.value,
      if (otherAttributes != null) 'OtherAttributes': otherAttributes,
      if (realm != null) 'Realm': realm,
      if (sAMAccountName != null) 'SAMAccountName': sAMAccountName,
      if (sid != null) 'SID': sid,
    };
  }
}

/// @nodoc
class DescribeUserResult {
  /// The identifier (ID) of the directory that's associated with the user.
  final String? directoryId;

  /// The <a
  /// href="https://learn.microsoft.com/en-us/windows/win32/ad/object-names-and-identities#distinguished-name">distinguished
  /// name</a> of the object.
  final String? distinguishedName;

  /// The email address of the user.
  final String? emailAddress;

  /// Indicates whether the user account is active.
  final bool? enabled;

  /// The first name of the user.
  final String? givenName;

  /// The attribute values that are returned for the attribute names that are
  /// included in the request.
  /// <note>
  /// Attribute names are case insensitive.
  /// </note>
  final Map<String, AttributeValue>? otherAttributes;

  /// The domain name that's associated with the user.
  final String? realm;

  /// The name of the user.
  final String? sAMAccountName;

  /// The unique security identifier (SID) of the user.
  final String? sid;

  /// The last name of the user.
  final String? surname;

  /// The UPN that is an Internet-style login name for a user and is based on the
  /// Internet standard <a href="https://datatracker.ietf.org/doc/html/rfc822">RFC
  /// 822</a>. The UPN is shorter than the distinguished name and easier to
  /// remember.
  final String? userPrincipalName;

  DescribeUserResult({
    this.directoryId,
    this.distinguishedName,
    this.emailAddress,
    this.enabled,
    this.givenName,
    this.otherAttributes,
    this.realm,
    this.sAMAccountName,
    this.sid,
    this.surname,
    this.userPrincipalName,
  });

  factory DescribeUserResult.fromJson(Map<String, dynamic> json) {
    return DescribeUserResult(
      directoryId: json['DirectoryId'] as String?,
      distinguishedName: json['DistinguishedName'] as String?,
      emailAddress: json['EmailAddress'] as String?,
      enabled: json['Enabled'] as bool?,
      givenName: json['GivenName'] as String?,
      otherAttributes: (json['OtherAttributes'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      realm: json['Realm'] as String?,
      sAMAccountName: json['SAMAccountName'] as String?,
      sid: json['SID'] as String?,
      surname: json['Surname'] as String?,
      userPrincipalName: json['UserPrincipalName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final distinguishedName = this.distinguishedName;
    final emailAddress = this.emailAddress;
    final enabled = this.enabled;
    final givenName = this.givenName;
    final otherAttributes = this.otherAttributes;
    final realm = this.realm;
    final sAMAccountName = this.sAMAccountName;
    final sid = this.sid;
    final surname = this.surname;
    final userPrincipalName = this.userPrincipalName;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (distinguishedName != null) 'DistinguishedName': distinguishedName,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (enabled != null) 'Enabled': enabled,
      if (givenName != null) 'GivenName': givenName,
      if (otherAttributes != null) 'OtherAttributes': otherAttributes,
      if (realm != null) 'Realm': realm,
      if (sAMAccountName != null) 'SAMAccountName': sAMAccountName,
      if (sid != null) 'SID': sid,
      if (surname != null) 'Surname': surname,
      if (userPrincipalName != null) 'UserPrincipalName': userPrincipalName,
    };
  }
}

/// @nodoc
class DisableUserResult {
  DisableUserResult();

  factory DisableUserResult.fromJson(Map<String, dynamic> _) {
    return DisableUserResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListGroupMembersResult {
  /// Identifier (ID) of the directory associated with the group.
  final String? directoryId;

  /// The domain name that's associated with the member.
  final String? memberRealm;

  /// The member information that the request returns.
  final List<Member>? members;

  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  final String? nextToken;

  /// The domain name that's associated with the group.
  final String? realm;

  ListGroupMembersResult({
    this.directoryId,
    this.memberRealm,
    this.members,
    this.nextToken,
    this.realm,
  });

  factory ListGroupMembersResult.fromJson(Map<String, dynamic> json) {
    return ListGroupMembersResult(
      directoryId: json['DirectoryId'] as String?,
      memberRealm: json['MemberRealm'] as String?,
      members: (json['Members'] as List?)
          ?.nonNulls
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      realm: json['Realm'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final memberRealm = this.memberRealm;
    final members = this.members;
    final nextToken = this.nextToken;
    final realm = this.realm;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (memberRealm != null) 'MemberRealm': memberRealm,
      if (members != null) 'Members': members,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
    };
  }
}

/// @nodoc
class ListGroupsResult {
  /// The identifier (ID) of the directory that's associated with the group.
  final String? directoryId;

  /// The group information that the request returns.
  final List<GroupSummary>? groups;

  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  final String? nextToken;

  /// The domain name associated with the group.
  final String? realm;

  ListGroupsResult({
    this.directoryId,
    this.groups,
    this.nextToken,
    this.realm,
  });

  factory ListGroupsResult.fromJson(Map<String, dynamic> json) {
    return ListGroupsResult(
      directoryId: json['DirectoryId'] as String?,
      groups: (json['Groups'] as List?)
          ?.nonNulls
          .map((e) => GroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      realm: json['Realm'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final groups = this.groups;
    final nextToken = this.nextToken;
    final realm = this.realm;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (groups != null) 'Groups': groups,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
    };
  }
}

/// @nodoc
class ListGroupsForMemberResult {
  /// The identifier (ID) of the directory that's associated with the member.
  final String? directoryId;

  /// The group information that the request returns.
  final List<GroupSummary>? groups;

  /// The domain that's associated with the member.
  final String? memberRealm;

  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  final String? nextToken;

  /// The domain that's associated with the group.
  final String? realm;

  ListGroupsForMemberResult({
    this.directoryId,
    this.groups,
    this.memberRealm,
    this.nextToken,
    this.realm,
  });

  factory ListGroupsForMemberResult.fromJson(Map<String, dynamic> json) {
    return ListGroupsForMemberResult(
      directoryId: json['DirectoryId'] as String?,
      groups: (json['Groups'] as List?)
          ?.nonNulls
          .map((e) => GroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      memberRealm: json['MemberRealm'] as String?,
      nextToken: json['NextToken'] as String?,
      realm: json['Realm'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final groups = this.groups;
    final memberRealm = this.memberRealm;
    final nextToken = this.nextToken;
    final realm = this.realm;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (groups != null) 'Groups': groups,
      if (memberRealm != null) 'MemberRealm': memberRealm,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
    };
  }
}

/// @nodoc
class ListUsersResult {
  /// The identifier (ID) of the directory that's associated with the user.
  final String? directoryId;

  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  final String? nextToken;

  /// The domain that's associated with the user.
  final String? realm;

  /// The user information that the request returns.
  final List<UserSummary>? users;

  ListUsersResult({
    this.directoryId,
    this.nextToken,
    this.realm,
    this.users,
  });

  factory ListUsersResult.fromJson(Map<String, dynamic> json) {
    return ListUsersResult(
      directoryId: json['DirectoryId'] as String?,
      nextToken: json['NextToken'] as String?,
      realm: json['Realm'] as String?,
      users: (json['Users'] as List?)
          ?.nonNulls
          .map((e) => UserSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final nextToken = this.nextToken;
    final realm = this.realm;
    final users = this.users;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
      if (users != null) 'Users': users,
    };
  }
}

/// @nodoc
class RemoveGroupMemberResult {
  RemoveGroupMemberResult();

  factory RemoveGroupMemberResult.fromJson(Map<String, dynamic> _) {
    return RemoveGroupMemberResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class SearchGroupsResult {
  /// The identifier (ID) of the directory that's associated with the group.
  final String? directoryId;

  /// The group information that the request returns.
  final List<Group>? groups;

  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  final String? nextToken;

  /// The domain that's associated with the group.
  final String? realm;

  SearchGroupsResult({
    this.directoryId,
    this.groups,
    this.nextToken,
    this.realm,
  });

  factory SearchGroupsResult.fromJson(Map<String, dynamic> json) {
    return SearchGroupsResult(
      directoryId: json['DirectoryId'] as String?,
      groups: (json['Groups'] as List?)
          ?.nonNulls
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      realm: json['Realm'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final groups = this.groups;
    final nextToken = this.nextToken;
    final realm = this.realm;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (groups != null) 'Groups': groups,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
    };
  }
}

/// @nodoc
class SearchUsersResult {
  /// The identifier (ID) of the directory where the address block is added.
  final String? directoryId;

  /// An encoded paging token for paginated calls that can be passed back to
  /// retrieve the next page.
  final String? nextToken;

  /// The domain that's associated with the user.
  final String? realm;

  /// The user information that the request returns.
  final List<User>? users;

  SearchUsersResult({
    this.directoryId,
    this.nextToken,
    this.realm,
    this.users,
  });

  factory SearchUsersResult.fromJson(Map<String, dynamic> json) {
    return SearchUsersResult(
      directoryId: json['DirectoryId'] as String?,
      nextToken: json['NextToken'] as String?,
      realm: json['Realm'] as String?,
      users: (json['Users'] as List?)
          ?.nonNulls
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final nextToken = this.nextToken;
    final realm = this.realm;
    final users = this.users;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (nextToken != null) 'NextToken': nextToken,
      if (realm != null) 'Realm': realm,
      if (users != null) 'Users': users,
    };
  }
}

/// @nodoc
class UpdateGroupResult {
  UpdateGroupResult();

  factory UpdateGroupResult.fromJson(Map<String, dynamic> _) {
    return UpdateGroupResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateUserResult {
  UpdateUserResult();

  factory UpdateUserResult.fromJson(Map<String, dynamic> _) {
    return UpdateUserResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateType {
  static const add = UpdateType._('ADD');
  static const replace = UpdateType._('REPLACE');
  static const remove = UpdateType._('REMOVE');

  final String value;

  const UpdateType._(this.value);

  static const values = [add, replace, remove];

  static UpdateType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UpdateType._(value));

  @override
  bool operator ==(other) => other is UpdateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The data type for an attribute. Each attribute value is described as a
/// name-value pair. The name is the AD schema name, and the value is the data
/// itself. For a list of supported attributes, see <a
/// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ad_data_attributes.html">Directory
/// Service Data Attributes</a>.
///
/// @nodoc
class AttributeValue {
  /// Indicates that the attribute type value is a boolean. For example:
  ///
  /// <code>"BOOL": true</code>
  final bool? boolValue;

  /// Indicates that the attribute type value is a number. For example:
  ///
  /// <code>"N": "16"</code>
  final int? n;

  /// Indicates that the attribute type value is a string. For example:
  ///
  /// <code>"S": "S Group"</code>
  final String? s;

  /// Indicates that the attribute type value is a string set. For example:
  ///
  /// <code>"SS":
  /// \["sample_service_class/host.sample.com:1234/sample_service_name_1",
  /// "sample_service_class/host.sample.com:1234/sample_service_name_2"\]</code>
  final List<String>? ss;

  AttributeValue({
    this.boolValue,
    this.n,
    this.s,
    this.ss,
  });

  factory AttributeValue.fromJson(Map<String, dynamic> json) {
    return AttributeValue(
      boolValue: json['BOOL'] as bool?,
      n: json['N'] as int?,
      s: json['S'] as String?,
      ss: (json['SS'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final boolValue = this.boolValue;
    final n = this.n;
    final s = this.s;
    final ss = this.ss;
    return {
      if (boolValue != null) 'BOOL': boolValue,
      if (n != null) 'N': n,
      if (s != null) 'S': s,
      if (ss != null) 'SS': ss,
    };
  }
}

/// @nodoc
class GroupType {
  static const distribution = GroupType._('Distribution');
  static const security = GroupType._('Security');

  final String value;

  const GroupType._(this.value);

  static const values = [distribution, security];

  static GroupType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => GroupType._(value));

  @override
  bool operator ==(other) => other is GroupType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GroupScope {
  static const domainLocal = GroupScope._('DomainLocal');
  static const global = GroupScope._('Global');
  static const universal = GroupScope._('Universal');
  static const builtinLocal = GroupScope._('BuiltinLocal');

  final String value;

  const GroupScope._(this.value);

  static const values = [domainLocal, global, universal, builtinLocal];

  static GroupScope fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => GroupScope._(value));

  @override
  bool operator ==(other) => other is GroupScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A user object that contains identifying information and attributes for a
/// specified user.
///
/// @nodoc
class User {
  /// The name of the user.
  final String sAMAccountName;

  /// The <a
  /// href="https://learn.microsoft.com/en-us/windows/win32/ad/object-names-and-identities#distinguished-name">distinguished
  /// name</a> of the object.
  final String? distinguishedName;

  /// The email address of the user.
  final String? emailAddress;

  /// Indicates whether the user account is active.
  final bool? enabled;

  /// The first name of the user.
  final String? givenName;

  /// An expression that includes one or more attributes, data types, and values
  /// of a user.
  final Map<String, AttributeValue>? otherAttributes;

  /// The unique security identifier (SID) of the user.
  final String? sid;

  /// The last name of the user.
  final String? surname;

  /// The UPN that is an internet-style login name for a user and based on the
  /// internet standard <a href="https://datatracker.ietf.org/doc/html/rfc822">RFC
  /// 822</a>. The UPN is shorter than the distinguished name and easier to
  /// remember.
  final String? userPrincipalName;

  User({
    required this.sAMAccountName,
    this.distinguishedName,
    this.emailAddress,
    this.enabled,
    this.givenName,
    this.otherAttributes,
    this.sid,
    this.surname,
    this.userPrincipalName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      sAMAccountName: (json['SAMAccountName'] as String?) ?? '',
      distinguishedName: json['DistinguishedName'] as String?,
      emailAddress: json['EmailAddress'] as String?,
      enabled: json['Enabled'] as bool?,
      givenName: json['GivenName'] as String?,
      otherAttributes: (json['OtherAttributes'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      sid: json['SID'] as String?,
      surname: json['Surname'] as String?,
      userPrincipalName: json['UserPrincipalName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sAMAccountName = this.sAMAccountName;
    final distinguishedName = this.distinguishedName;
    final emailAddress = this.emailAddress;
    final enabled = this.enabled;
    final givenName = this.givenName;
    final otherAttributes = this.otherAttributes;
    final sid = this.sid;
    final surname = this.surname;
    final userPrincipalName = this.userPrincipalName;
    return {
      'SAMAccountName': sAMAccountName,
      if (distinguishedName != null) 'DistinguishedName': distinguishedName,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (enabled != null) 'Enabled': enabled,
      if (givenName != null) 'GivenName': givenName,
      if (otherAttributes != null) 'OtherAttributes': otherAttributes,
      if (sid != null) 'SID': sid,
      if (surname != null) 'Surname': surname,
      if (userPrincipalName != null) 'UserPrincipalName': userPrincipalName,
    };
  }
}

/// A group object that contains identifying information and attributes for a
/// specified group.
///
/// @nodoc
class Group {
  /// The name of the group.
  final String sAMAccountName;

  /// The <a
  /// href="https://learn.microsoft.com/en-us/windows/win32/ad/object-names-and-identities#distinguished-name">distinguished
  /// name</a> of the object.
  final String? distinguishedName;

  /// The scope of the AD group. For details, see <a
  /// href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#group-scope">Active
  /// Directory security groups</a>
  final GroupScope? groupScope;

  /// The AD group type. For details, see <a
  /// href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#how-active-directory-security-groups-work">Active
  /// Directory security group type</a>.
  final GroupType? groupType;

  /// An expression of one or more attributes, data types, and the values of a
  /// group.
  final Map<String, AttributeValue>? otherAttributes;

  /// The unique security identifier (SID) of the group.
  final String? sid;

  Group({
    required this.sAMAccountName,
    this.distinguishedName,
    this.groupScope,
    this.groupType,
    this.otherAttributes,
    this.sid,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      sAMAccountName: (json['SAMAccountName'] as String?) ?? '',
      distinguishedName: json['DistinguishedName'] as String?,
      groupScope: (json['GroupScope'] as String?)?.let(GroupScope.fromString),
      groupType: (json['GroupType'] as String?)?.let(GroupType.fromString),
      otherAttributes: (json['OtherAttributes'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, AttributeValue.fromJson(e as Map<String, dynamic>))),
      sid: json['SID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sAMAccountName = this.sAMAccountName;
    final distinguishedName = this.distinguishedName;
    final groupScope = this.groupScope;
    final groupType = this.groupType;
    final otherAttributes = this.otherAttributes;
    final sid = this.sid;
    return {
      'SAMAccountName': sAMAccountName,
      if (distinguishedName != null) 'DistinguishedName': distinguishedName,
      if (groupScope != null) 'GroupScope': groupScope.value,
      if (groupType != null) 'GroupType': groupType.value,
      if (otherAttributes != null) 'OtherAttributes': otherAttributes,
      if (sid != null) 'SID': sid,
    };
  }
}

/// A structure containing a subset of the fields of a user object from a
/// directory.
///
/// @nodoc
class UserSummary {
  /// Indicates whether the user account is active.
  final bool enabled;

  /// The name of the user.
  final String sAMAccountName;

  /// The unique security identifier (SID) of the user.
  final String sid;

  /// The first name of the user.
  final String? givenName;

  /// The last name of the user.
  final String? surname;

  UserSummary({
    required this.enabled,
    required this.sAMAccountName,
    required this.sid,
    this.givenName,
    this.surname,
  });

  factory UserSummary.fromJson(Map<String, dynamic> json) {
    return UserSummary(
      enabled: (json['Enabled'] as bool?) ?? false,
      sAMAccountName: (json['SAMAccountName'] as String?) ?? '',
      sid: (json['SID'] as String?) ?? '',
      givenName: json['GivenName'] as String?,
      surname: json['Surname'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final sAMAccountName = this.sAMAccountName;
    final sid = this.sid;
    final givenName = this.givenName;
    final surname = this.surname;
    return {
      'Enabled': enabled,
      'SAMAccountName': sAMAccountName,
      'SID': sid,
      if (givenName != null) 'GivenName': givenName,
      if (surname != null) 'Surname': surname,
    };
  }
}

/// A structure containing a subset of fields of a group object from a
/// directory.
///
/// @nodoc
class GroupSummary {
  /// The scope of the AD group. For details, see <a
  /// href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#group-scope">Active
  /// Directory security groups</a>.
  final GroupScope groupScope;

  /// The AD group type. For details, see <a
  /// href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#how-active-directory-security-groups-work">Active
  /// Directory security group type</a>.
  final GroupType groupType;

  /// The name of the group.
  final String sAMAccountName;

  /// The unique security identifier (SID) of the group.
  final String sid;

  GroupSummary({
    required this.groupScope,
    required this.groupType,
    required this.sAMAccountName,
    required this.sid,
  });

  factory GroupSummary.fromJson(Map<String, dynamic> json) {
    return GroupSummary(
      groupScope: GroupScope.fromString((json['GroupScope'] as String?) ?? ''),
      groupType: GroupType.fromString((json['GroupType'] as String?) ?? ''),
      sAMAccountName: (json['SAMAccountName'] as String?) ?? '',
      sid: (json['SID'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final groupScope = this.groupScope;
    final groupType = this.groupType;
    final sAMAccountName = this.sAMAccountName;
    final sid = this.sid;
    return {
      'GroupScope': groupScope.value,
      'GroupType': groupType.value,
      'SAMAccountName': sAMAccountName,
      'SID': sid,
    };
  }
}

/// A member object that contains identifying information for a specified
/// member.
///
/// @nodoc
class Member {
  /// The AD type of the member object.
  final MemberType memberType;

  /// The name of the group member.
  final String sAMAccountName;

  /// The unique security identifier (SID) of the group member.
  final String sid;

  Member({
    required this.memberType,
    required this.sAMAccountName,
    required this.sid,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      memberType: MemberType.fromString((json['MemberType'] as String?) ?? ''),
      sAMAccountName: (json['SAMAccountName'] as String?) ?? '',
      sid: (json['SID'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final memberType = this.memberType;
    final sAMAccountName = this.sAMAccountName;
    final sid = this.sid;
    return {
      'MemberType': memberType.value,
      'SAMAccountName': sAMAccountName,
      'SID': sid,
    };
  }
}

/// @nodoc
class MemberType {
  static const user = MemberType._('USER');
  static const group = MemberType._('GROUP');
  static const computer = MemberType._('COMPUTER');

  final String value;

  const MemberType._(this.value);

  static const values = [user, group, computer];

  static MemberType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MemberType._(value));

  @override
  bool operator ==(other) => other is MemberType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
class DirectoryUnavailableException extends _s.GenericAwsException {
  DirectoryUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryUnavailableException',
            message: message);
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
  'DirectoryUnavailableException': (type, message) =>
      DirectoryUnavailableException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
