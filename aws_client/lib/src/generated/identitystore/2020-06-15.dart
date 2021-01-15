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

part '2020-06-15.g.dart';

class IdentityStore {
  final _s.JsonProtocol _protocol;
  IdentityStore({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String groupId,
    @_s.required String identityStoreId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      1,
      47,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupId',
      groupId,
      r'''^([0-9a-f]{10}-|)[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'identityStoreId',
      identityStoreId,
      r'''^d-[0-9a-f]{10}$''',
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
    @_s.required String identityStoreId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(identityStoreId, 'identityStoreId');
    _s.validateStringLength(
      'identityStoreId',
      identityStoreId,
      1,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityStoreId',
      identityStoreId,
      r'''^d-[0-9a-f]{10}$''',
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
    _s.validateStringPattern(
      'userId',
      userId,
      r'''^([0-9a-f]{10}-|)[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}$''',
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
    @_s.required String identityStoreId,
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(identityStoreId, 'identityStoreId');
    _s.validateStringLength(
      'identityStoreId',
      identityStoreId,
      1,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityStoreId',
      identityStoreId,
      r'''^d-[0-9a-f]{10}$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/:]*''',
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
    @_s.required String identityStoreId,
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(identityStoreId, 'identityStoreId');
    _s.validateStringLength(
      'identityStoreId',
      identityStoreId,
      1,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityStoreId',
      identityStoreId,
      r'''^d-[0-9a-f]{10}$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[-a-zA-Z0-9+=/:]*''',
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGroupResponse {
  /// Contains the group’s display name value. The length limit is 1024
  /// characters. This value can consist of letters, accented characters, symbols,
  /// numbers, punctuation, tab, new line, carriage return, space and non breaking
  /// space in this attribute. The characters “&lt;&gt;;:%” are excluded. This
  /// value is specified at the time the group is created and stored as an
  /// attribute of the group object in the identity store.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The identifier for a group in the identity store.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  DescribeGroupResponse({
    @_s.required this.displayName,
    @_s.required this.groupId,
  });
  factory DescribeGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserResponse {
  /// The identifier for a user in the identity store.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  /// Contains the user’s username value. The length limit is 128 characters. This
  /// value can consist of letters, accented characters, symbols, numbers and
  /// punctuation. The characters “&lt;&gt;;:%” are excluded. This value is
  /// specified at the time the user is created and stored as an attribute of the
  /// user object in the identity store.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  DescribeUserResponse({
    @_s.required this.userId,
    @_s.required this.userName,
  });
  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserResponseFromJson(json);
}

/// A query filter used by <code>ListUsers</code> and <code>ListGroup</code>.
/// This filter object provides the attribute name and attribute value to search
/// users or groups.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The attribute path used to specify which attribute name to search. Length
  /// limit is 255 characters. For example, <code>UserName</code> is a valid
  /// attribute path for the <code>ListUsers</code> API, and
  /// <code>DisplayName</code> is a valid attribute path for the
  /// <code>ListGroups</code> API.
  @_s.JsonKey(name: 'AttributePath')
  final String attributePath;

  /// Represents the data for an attribute. Each attribute value is described as a
  /// name-value pair.
  @_s.JsonKey(name: 'AttributeValue')
  final String attributeValue;

  Filter({
    @_s.required this.attributePath,
    @_s.required this.attributeValue,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

/// A group object, which contains a specified group’s metadata and attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Group {
  /// Contains the group’s display name value. The length limit is 1024
  /// characters. This value can consist of letters, accented characters, symbols,
  /// numbers, punctuation, tab, new line, carriage return, space and non breaking
  /// space in this attribute. The characters “&lt;&gt;;:%” are excluded. This
  /// value is specified at the time the group is created and stored as an
  /// attribute of the group object in the identity store.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The identifier for a group in the identity store.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  Group({
    @_s.required this.displayName,
    @_s.required this.groupId,
  });
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupsResponse {
  /// A list of <code>Group</code> objects in the identity store.
  @_s.JsonKey(name: 'Groups')
  final List<Group> groups;

  /// The pagination token used for the <code>ListUsers</code> and
  /// <code>ListGroups</code> APIs. This value is generated by the identity store
  /// service and is returned in the API response if the total results are more
  /// than the size of one page, and when this token is used in the API request to
  /// search for the next page.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGroupsResponse({
    @_s.required this.groups,
    this.nextToken,
  });
  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsersResponse {
  /// A list of <code>User</code> objects in the identity store.
  @_s.JsonKey(name: 'Users')
  final List<User> users;

  /// The pagination token used for the <code>ListUsers</code> and
  /// <code>ListGroups</code> APIs. This value is generated by the identity store
  /// service and is returned in the API response if the total results are more
  /// than the size of one page, and when this token is used in the API request to
  /// search for the next page.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListUsersResponse({
    @_s.required this.users,
    this.nextToken,
  });
  factory ListUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUsersResponseFromJson(json);
}

/// A user object, which contains a specified user’s metadata and attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class User {
  /// The identifier for a user in the identity store.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  /// Contains the user’s username value. The length limit is 128 characters. This
  /// value can consist of letters, accented characters, symbols, numbers and
  /// punctuation. The characters “&lt;&gt;;:%” are excluded. This value is
  /// specified at the time the user is created and stored as an attribute of the
  /// user object in the identity store.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  User({
    @_s.required this.userId,
    @_s.required this.userName,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
