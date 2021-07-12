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

class IdentityStore {
  final _s.JsonProtocol _protocol;
  IdentityStore({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// Retrieves the group metadata and attributes from <code>GroupId</code> in
  /// an identity store.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [groupId] :
  /// The identifier for a group in the identity store.
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store, such as
  /// d-1234567890. In this example, d- is a fixed prefix, and 1234567890 is a
  /// randomly generated string which contains number and lower case letters.
  /// This value is generated at the time that a new identity store is created.
  Future<DescribeGroupResponse> describeGroup({
    required String groupId,
    required String identityStoreId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      1,
      47,
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityStoreId, 'identityStoreId');
    _s.validateStringLength(
      'identityStoreId',
      identityStoreId,
      1,
      12,
      isRequired: true,
    );
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

  /// Retrieves the user metadata and attributes from <code>UserId</code> in an
  /// identity store.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store, such as
  /// d-1234567890. In this example, d- is a fixed prefix, and 1234567890 is a
  /// randomly generated string which contains number and lower case letters.
  /// This value is generated at the time that a new identity store is created.
  ///
  /// Parameter [userId] :
  /// The identifier for a user in the identity store.
  Future<DescribeUserResponse> describeUser({
    required String identityStoreId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(identityStoreId, 'identityStoreId');
    _s.validateStringLength(
      'identityStoreId',
      identityStoreId,
      1,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      47,
      isRequired: true,
    );
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

  /// Lists the attribute name and value of the group that you specified in the
  /// search. We only support <code>DisplayName</code> as a valid filter
  /// attribute path currently, and filter is required. This API returns minimum
  /// attributes, including <code>GroupId</code> and group
  /// <code>DisplayName</code> in the response.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store, such as
  /// d-1234567890. In this example, d- is a fixed prefix, and 1234567890 is a
  /// randomly generated string which contains number and lower case letters.
  /// This value is generated at the time that a new identity store is created.
  ///
  /// Parameter [filters] :
  /// A list of <code>Filter</code> objects, which is used in the
  /// <code>ListUsers</code> and <code>ListGroups</code> request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request, which is used in
  /// the <code>ListUsers</code> and <code>ListGroups</code> request to specify
  /// how many results to return in one page. The length limit is 50 characters.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used for the <code>ListUsers</code> and
  /// <code>ListGroups</code> APIs. This value is generated by the identity
  /// store service and is returned in the API response if the total results are
  /// more than the size of one page, and when this token is used in the API
  /// request to search for the next page.
  Future<ListGroupsResponse> listGroups({
    required String identityStoreId,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(identityStoreId, 'identityStoreId');
    _s.validateStringLength(
      'identityStoreId',
      identityStoreId,
      1,
      12,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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

  /// Lists the attribute name and value of the user that you specified in the
  /// search. We only support <code>UserName</code> as a valid filter attribute
  /// path currently, and filter is required. This API returns minimum
  /// attributes, including <code>UserId</code> and <code>UserName</code> in the
  /// response.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [identityStoreId] :
  /// The globally unique identifier for the identity store, such as
  /// d-1234567890. In this example, d- is a fixed prefix, and 1234567890 is a
  /// randomly generated string which contains number and lower case letters.
  /// This value is generated at the time that a new identity store is created.
  ///
  /// Parameter [filters] :
  /// A list of <code>Filter</code> objects, which is used in the
  /// <code>ListUsers</code> and <code>ListGroups</code> request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request, which is used in
  /// the <code>ListUsers</code> and <code>ListGroups</code> request to specify
  /// how many results to return in one page. The length limit is 50 characters.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used for the <code>ListUsers</code> and
  /// <code>ListGroups</code> APIs. This value is generated by the identity
  /// store service and is returned in the API response if the total results are
  /// more than the size of one page, and when this token is used in the API
  /// request to search for the next page.
  Future<ListUsersResponse> listUsers({
    required String identityStoreId,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(identityStoreId, 'identityStoreId');
    _s.validateStringLength(
      'identityStoreId',
      identityStoreId,
      1,
      12,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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
}

class DescribeGroupResponse {
  /// Contains the group’s display name value. The length limit is 1024
  /// characters. This value can consist of letters, accented characters, symbols,
  /// numbers, punctuation, tab, new line, carriage return, space and non breaking
  /// space in this attribute. The characters “&lt;&gt;;:%” are excluded. This
  /// value is specified at the time the group is created and stored as an
  /// attribute of the group object in the identity store.
  final String displayName;

  /// The identifier for a group in the identity store.
  final String groupId;

  DescribeGroupResponse({
    required this.displayName,
    required this.groupId,
  });

  factory DescribeGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGroupResponse(
      displayName: json['DisplayName'] as String,
      groupId: json['GroupId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final groupId = this.groupId;
    return {
      'DisplayName': displayName,
      'GroupId': groupId,
    };
  }
}

class DescribeUserResponse {
  /// The identifier for a user in the identity store.
  final String userId;

  /// Contains the user’s username value. The length limit is 128 characters. This
  /// value can consist of letters, accented characters, symbols, numbers and
  /// punctuation. The characters “&lt;&gt;;:%” are excluded. This value is
  /// specified at the time the user is created and stored as an attribute of the
  /// user object in the identity store.
  final String userName;

  DescribeUserResponse({
    required this.userId,
    required this.userName,
  });

  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUserResponse(
      userId: json['UserId'] as String,
      userName: json['UserName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final userName = this.userName;
    return {
      'UserId': userId,
      'UserName': userName,
    };
  }
}

/// A query filter used by <code>ListUsers</code> and <code>ListGroup</code>.
/// This filter object provides the attribute name and attribute value to search
/// users or groups.
class Filter {
  /// The attribute path used to specify which attribute name to search. Length
  /// limit is 255 characters. For example, <code>UserName</code> is a valid
  /// attribute path for the <code>ListUsers</code> API, and
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

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      attributePath: json['AttributePath'] as String,
      attributeValue: json['AttributeValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final attributePath = this.attributePath;
    final attributeValue = this.attributeValue;
    return {
      'AttributePath': attributePath,
      'AttributeValue': attributeValue,
    };
  }
}

/// A group object, which contains a specified group’s metadata and attributes.
class Group {
  /// Contains the group’s display name value. The length limit is 1024
  /// characters. This value can consist of letters, accented characters, symbols,
  /// numbers, punctuation, tab, new line, carriage return, space and non breaking
  /// space in this attribute. The characters “&lt;&gt;;:%” are excluded. This
  /// value is specified at the time the group is created and stored as an
  /// attribute of the group object in the identity store.
  final String displayName;

  /// The identifier for a group in the identity store.
  final String groupId;

  Group({
    required this.displayName,
    required this.groupId,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      displayName: json['DisplayName'] as String,
      groupId: json['GroupId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final groupId = this.groupId;
    return {
      'DisplayName': displayName,
      'GroupId': groupId,
    };
  }
}

class ListGroupsResponse {
  /// A list of <code>Group</code> objects in the identity store.
  final List<Group> groups;

  /// The pagination token used for the <code>ListUsers</code> and
  /// <code>ListGroups</code> APIs. This value is generated by the identity store
  /// service and is returned in the API response if the total results are more
  /// than the size of one page, and when this token is used in the API request to
  /// search for the next page.
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
  /// <code>ListGroups</code> APIs. This value is generated by the identity store
  /// service and is returned in the API response if the total results are more
  /// than the size of one page, and when this token is used in the API request to
  /// search for the next page.
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

/// A user object, which contains a specified user’s metadata and attributes.
class User {
  /// The identifier for a user in the identity store.
  final String userId;

  /// Contains the user’s username value. The length limit is 128 characters. This
  /// value can consist of letters, accented characters, symbols, numbers and
  /// punctuation. The characters “&lt;&gt;;:%” are excluded. This value is
  /// specified at the time the user is created and stored as an attribute of the
  /// user object in the identity store.
  final String userName;

  User({
    required this.userId,
    required this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['UserId'] as String,
      userName: json['UserName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final userName = this.userName;
    return {
      'UserId': userId,
      'UserName': userName,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
