// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'resource-groups-2017-11-27.g.dart';

/// AWS Resource Groups lets you organize AWS resources such as Amazon EC2
/// instances, Amazon Relational Database Service databases, and Amazon S3
/// buckets into groups using criteria that you define as tags. A resource group
/// is a collection of resources that match the resource types specified in a
/// query, and share one or more tags or portions of tags. You can create a
/// group of resources based on their roles in your cloud infrastructure,
/// lifecycle stages, regions, application layers, or virtually any criteria.
/// Resource groups enable you to automate management tasks, such as those in
/// AWS Systems Manager Automation documents, on tag-related resources in AWS
/// Systems Manager. Groups of tagged resources also let you quickly view a
/// custom console in AWS Systems Manager that shows AWS Config compliance and
/// other monitoring data about member resources.
class ResourceGroups {
  final _s.RestJsonProtocol _protocol;
  ResourceGroups({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'resource-groups',
            signingName: 'resource-groups',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a group with a specified name, description, and resource query.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [name] :
  /// The name of the group, which is the identifier of the group in other
  /// operations. A resource group name cannot be updated after it is created. A
  /// resource group name can have a maximum of 128 characters, including
  /// letters, numbers, hyphens, dots, and underscores. The name cannot start
  /// with <code>AWS</code> or <code>aws</code>; these are reserved. A resource
  /// group name must be unique within your account.
  ///
  /// Parameter [resourceQuery] :
  /// The resource query that determines which AWS resources are members of this
  /// group.
  ///
  /// Parameter [description] :
  /// The description of the resource group. Descriptions can have a maximum of
  /// 511 characters, including letters, numbers, hyphens, underscores,
  /// punctuation, and spaces.
  ///
  /// Parameter [tags] :
  /// The tags to add to the group. A tag is a string-to-string map of key-value
  /// pairs. Tag keys can have a maximum character length of 128 characters, and
  /// tag values can have a maximum length of 256 characters.
  Future<CreateGroupOutput> createGroup({
    @_s.required String name,
    @_s.required ResourceQuery resourceQuery,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceQuery, 'resourceQuery');
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\sa-zA-Z0-9_\.-]*''',
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'ResourceQuery': resourceQuery,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/groups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGroupOutput.fromJson(response);
  }

  /// Deletes a specified resource group. Deleting a resource group does not
  /// delete resources that are members of the group; it only deletes the group
  /// structure.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the resource group to delete.
  Future<DeleteGroupOutput> deleteGroup({
    @_s.required String groupName,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/groups/${Uri.encodeComponent(groupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGroupOutput.fromJson(response);
  }

  /// Returns information about a specified resource group.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the resource group.
  Future<GetGroupOutput> getGroup({
    @_s.required String groupName,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/groups/${Uri.encodeComponent(groupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupOutput.fromJson(response);
  }

  /// Returns the resource query associated with the specified resource group.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the resource group.
  Future<GetGroupQueryOutput> getGroupQuery({
    @_s.required String groupName,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/groups/${Uri.encodeComponent(groupName)}/query',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupQueryOutput.fromJson(response);
  }

  /// Returns a list of tags that are associated with a resource group,
  /// specified by an ARN.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [arn] :
  /// The ARN of the resource group for which you want a list of tags. The
  /// resource must exist within the account you are using.
  Future<GetTagsOutput> getTags({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      12,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}-[a-z]+-\d{1}:[0-9]{12}:group/[a-zA-Z0-9_\.-]{1,128}''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resources/${Uri.encodeComponent(arn)}/tags',
      exceptionFnMap: _exceptionFns,
    );
    return GetTagsOutput.fromJson(response);
  }

  /// Returns a list of ARNs of resources that are members of a specified
  /// resource group.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the resource group.
  ///
  /// Parameter [filters] :
  /// Filters, formatted as ResourceFilter objects, that you want to apply to a
  /// ListGroupResources operation.
  ///
  /// <ul>
  /// <li>
  /// <code>resource-type</code> - Filter resources by their type. Specify up to
  /// five resource types in the format AWS::ServiceCode::ResourceType. For
  /// example, AWS::EC2::Instance, or AWS::S3::Bucket.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of group member ARNs that are returned in a single call
  /// by ListGroupResources, in paginated output. By default, this number is 50.
  ///
  /// Parameter [nextToken] :
  /// The NextToken value that is returned in a paginated ListGroupResources
  /// request. To get the next page of results, run the call again, add the
  /// NextToken parameter, and specify the NextToken value.
  Future<ListGroupResourcesOutput> listGroupResources({
    @_s.required String groupName,
    List<ResourceFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
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
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9+/]*={0,2}$''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/groups/${Uri.encodeComponent(groupName)}/resource-identifiers-list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupResourcesOutput.fromJson(response);
  }

  /// Returns a list of existing resource groups in your account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [filters] :
  /// Filters, formatted as GroupFilter objects, that you want to apply to a
  /// ListGroups operation.
  ///
  /// <ul>
  /// <li>
  /// <code>resource-type</code> - Filter groups by resource type. Specify up to
  /// five resource types in the format AWS::ServiceCode::ResourceType. For
  /// example, AWS::EC2::Instance, or AWS::S3::Bucket.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource group results that are returned by
  /// ListGroups in paginated output. By default, this number is 50.
  ///
  /// Parameter [nextToken] :
  /// The NextToken value that is returned in a paginated
  /// <code>ListGroups</code> request. To get the next page of results, run the
  /// call again, add the NextToken parameter, and specify the NextToken value.
  Future<ListGroupsOutput> listGroups({
    List<GroupFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9+/]*={0,2}$''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/groups-list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupsOutput.fromJson(response);
  }

  /// Returns a list of AWS resource identifiers that matches a specified query.
  /// The query uses the same format as a resource query in a CreateGroup or
  /// UpdateGroupQuery operation.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceQuery] :
  /// The search query, using the same formats that are supported for resource
  /// group definition.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of group member ARNs returned by
  /// <code>SearchResources</code> in paginated output. By default, this number
  /// is 50.
  ///
  /// Parameter [nextToken] :
  /// The NextToken value that is returned in a paginated
  /// <code>SearchResources</code> request. To get the next page of results, run
  /// the call again, add the NextToken parameter, and specify the NextToken
  /// value.
  Future<SearchResourcesOutput> searchResources({
    @_s.required ResourceQuery resourceQuery,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceQuery, 'resourceQuery');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9+/]*={0,2}$''',
    );
    final $payload = <String, dynamic>{
      'ResourceQuery': resourceQuery,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resources/search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchResourcesOutput.fromJson(response);
  }

  /// Adds tags to a resource group with the specified ARN. Existing tags on a
  /// resource group are not changed if they are not specified in the request
  /// parameters.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [arn] :
  /// The ARN of the resource to which to add tags.
  ///
  /// Parameter [tags] :
  /// The tags to add to the specified resource. A tag is a string-to-string map
  /// of key-value pairs. Tag keys can have a maximum character length of 128
  /// characters, and tag values can have a maximum length of 256 characters.
  Future<TagOutput> tag({
    @_s.required String arn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      12,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}-[a-z]+-\d{1}:[0-9]{12}:group/[a-zA-Z0-9_\.-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/resources/${Uri.encodeComponent(arn)}/tags',
      exceptionFnMap: _exceptionFns,
    );
    return TagOutput.fromJson(response);
  }

  /// Deletes specified tags from a specified resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [arn] :
  /// The ARN of the resource from which to remove tags.
  ///
  /// Parameter [keys] :
  /// The keys of the tags to be removed.
  Future<UntagOutput> untag({
    @_s.required String arn,
    @_s.required List<String> keys,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      12,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}-[a-z]+-\d{1}:[0-9]{12}:group/[a-zA-Z0-9_\.-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(keys, 'keys');
    final $payload = <String, dynamic>{
      'Keys': keys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/resources/${Uri.encodeComponent(arn)}/tags',
      exceptionFnMap: _exceptionFns,
    );
    return UntagOutput.fromJson(response);
  }

  /// Updates an existing group with a new or changed description. You cannot
  /// update the name of a resource group.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the resource group for which you want to update its
  /// description.
  ///
  /// Parameter [description] :
  /// The description of the resource group. Descriptions can have a maximum of
  /// 511 characters, including letters, numbers, hyphens, underscores,
  /// punctuation, and spaces.
  Future<UpdateGroupOutput> updateGroup({
    @_s.required String groupName,
    String description,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\sa-zA-Z0-9_\.-]*''',
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/groups/${Uri.encodeComponent(groupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGroupOutput.fromJson(response);
  }

  /// Updates the resource query of a group.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the resource group for which you want to edit the query.
  ///
  /// Parameter [resourceQuery] :
  /// The resource query that determines which AWS resources are members of the
  /// resource group.
  Future<UpdateGroupQueryOutput> updateGroupQuery({
    @_s.required String groupName,
    @_s.required ResourceQuery resourceQuery,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceQuery, 'resourceQuery');
    final $payload = <String, dynamic>{
      'ResourceQuery': resourceQuery,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/groups/${Uri.encodeComponent(groupName)}/query',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGroupQueryOutput.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGroupOutput {
  /// A full description of the resource group after it is created.
  @_s.JsonKey(name: 'Group')
  final Group group;

  /// The resource query associated with the group.
  @_s.JsonKey(name: 'ResourceQuery')
  final ResourceQuery resourceQuery;

  /// The tags associated with the group.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  CreateGroupOutput({
    this.group,
    this.resourceQuery,
    this.tags,
  });
  factory CreateGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGroupOutput {
  /// A full description of the deleted resource group.
  @_s.JsonKey(name: 'Group')
  final Group group;

  DeleteGroupOutput({
    this.group,
  });
  factory DeleteGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGroupOutput {
  /// A full description of the resource group.
  @_s.JsonKey(name: 'Group')
  final Group group;

  GetGroupOutput({
    this.group,
  });
  factory GetGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$GetGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGroupQueryOutput {
  /// The resource query associated with the specified group.
  @_s.JsonKey(name: 'GroupQuery')
  final GroupQuery groupQuery;

  GetGroupQueryOutput({
    this.groupQuery,
  });
  factory GetGroupQueryOutput.fromJson(Map<String, dynamic> json) =>
      _$GetGroupQueryOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTagsOutput {
  /// The ARN of the tagged resource group.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The tags associated with the specified resource group.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  GetTagsOutput({
    this.arn,
    this.tags,
  });
  factory GetTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$GetTagsOutputFromJson(json);
}

/// A resource group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Group {
  /// The ARN of a resource group.
  @_s.JsonKey(name: 'GroupArn')
  final String groupArn;

  /// The name of a resource group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The description of the resource group.
  @_s.JsonKey(name: 'Description')
  final String description;

  Group({
    @_s.required this.groupArn,
    @_s.required this.name,
    this.description,
  });
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

/// A filter name and value pair that is used to obtain more specific results
/// from a list of groups.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GroupFilter {
  /// The name of the filter. Filter names are case-sensitive.
  @_s.JsonKey(name: 'Name')
  final GroupFilterName name;

  /// One or more filter values. Allowed filter values vary by group filter name,
  /// and are case-sensitive.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  GroupFilter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$GroupFilterToJson(this);
}

enum GroupFilterName {
  @_s.JsonValue('resource-type')
  resourceType,
}

/// The ARN and group name of a group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupIdentifier {
  /// The ARN of a resource group.
  @_s.JsonKey(name: 'GroupArn')
  final String groupArn;

  /// The name of a resource group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  GroupIdentifier({
    this.groupArn,
    this.groupName,
  });
  factory GroupIdentifier.fromJson(Map<String, dynamic> json) =>
      _$GroupIdentifierFromJson(json);
}

/// The underlying resource query of a resource group. Resources that match
/// query results are part of the group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupQuery {
  /// The name of a resource group that is associated with a specific resource
  /// query.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The resource query which determines which AWS resources are members of the
  /// associated resource group.
  @_s.JsonKey(name: 'ResourceQuery')
  final ResourceQuery resourceQuery;

  GroupQuery({
    @_s.required this.groupName,
    @_s.required this.resourceQuery,
  });
  factory GroupQuery.fromJson(Map<String, dynamic> json) =>
      _$GroupQueryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupResourcesOutput {
  /// The NextToken value to include in a subsequent
  /// <code>ListGroupResources</code> request, to get more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>QueryError</code> objects. Each error is an object that
  /// contains <code>ErrorCode</code> and <code>Message</code> structures.
  /// Possible values for <code>ErrorCode</code> are
  /// <code>CLOUDFORMATION_STACK_INACTIVE</code> and
  /// <code>CLOUDFORMATION_STACK_NOT_EXISTING</code>.
  @_s.JsonKey(name: 'QueryErrors')
  final List<QueryError> queryErrors;

  /// The ARNs and resource types of resources that are members of the group that
  /// you specified.
  @_s.JsonKey(name: 'ResourceIdentifiers')
  final List<ResourceIdentifier> resourceIdentifiers;

  ListGroupResourcesOutput({
    this.nextToken,
    this.queryErrors,
    this.resourceIdentifiers,
  });
  factory ListGroupResourcesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListGroupResourcesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupsOutput {
  /// A list of GroupIdentifier objects. Each identifier is an object that
  /// contains both the GroupName and the GroupArn.
  @_s.JsonKey(name: 'GroupIdentifiers')
  final List<GroupIdentifier> groupIdentifiers;

  /// A list of resource groups.
  @_s.JsonKey(name: 'Groups')
  final List<Group> groups;

  /// The NextToken value to include in a subsequent <code>ListGroups</code>
  /// request, to get more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGroupsOutput({
    this.groupIdentifiers,
    this.groups,
    this.nextToken,
  });
  factory ListGroupsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListGroupsOutputFromJson(json);
}

/// A two-part error structure that can occur in <code>ListGroupResources</code>
/// or <code>SearchResources</code> operations on CloudFormation stack-based
/// queries. The error occurs if the CloudFormation stack on which the query is
/// based either does not exist, or has a status that renders the stack
/// inactive. A <code>QueryError</code> occurrence does not necessarily mean
/// that AWS Resource Groups could not complete the operation, but the resulting
/// group might have no member resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryError {
  /// Possible values are <code>CLOUDFORMATION_STACK_INACTIVE</code> and
  /// <code>CLOUDFORMATION_STACK_NOT_EXISTING</code>.
  @_s.JsonKey(name: 'ErrorCode')
  final QueryErrorCode errorCode;

  /// A message that explains the <code>ErrorCode</code> value. Messages might
  /// state that the specified CloudFormation stack does not exist (or no longer
  /// exists). For <code>CLOUDFORMATION_STACK_INACTIVE</code>, the message
  /// typically states that the CloudFormation stack has a status that is not (or
  /// no longer) active, such as <code>CREATE_FAILED</code>.
  @_s.JsonKey(name: 'Message')
  final String message;

  QueryError({
    this.errorCode,
    this.message,
  });
  factory QueryError.fromJson(Map<String, dynamic> json) =>
      _$QueryErrorFromJson(json);
}

enum QueryErrorCode {
  @_s.JsonValue('CLOUDFORMATION_STACK_INACTIVE')
  cloudformationStackInactive,
  @_s.JsonValue('CLOUDFORMATION_STACK_NOT_EXISTING')
  cloudformationStackNotExisting,
}

enum QueryType {
  @_s.JsonValue('TAG_FILTERS_1_0')
  tagFilters_1_0,
  @_s.JsonValue('CLOUDFORMATION_STACK_1_0')
  cloudformationStack_1_0,
}

/// A filter name and value pair that is used to obtain more specific results
/// from a list of resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResourceFilter {
  /// The name of the filter. Filter names are case-sensitive.
  @_s.JsonKey(name: 'Name')
  final ResourceFilterName name;

  /// One or more filter values. Allowed filter values vary by resource filter
  /// name, and are case-sensitive.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  ResourceFilter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$ResourceFilterToJson(this);
}

enum ResourceFilterName {
  @_s.JsonValue('resource-type')
  resourceType,
}

/// The ARN of a resource, and its resource type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceIdentifier {
  /// The ARN of a resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The resource type of a resource, such as <code>AWS::EC2::Instance</code>.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  ResourceIdentifier({
    this.resourceArn,
    this.resourceType,
  });
  factory ResourceIdentifier.fromJson(Map<String, dynamic> json) =>
      _$ResourceIdentifierFromJson(json);
}

/// The query that is used to define a resource group or a search for resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceQuery {
  /// The query that defines a group or a search.
  @_s.JsonKey(name: 'Query')
  final String query;

  /// The type of the query. The valid values in this release are
  /// <code>TAG_FILTERS_1_0</code> and <code>CLOUDFORMATION_STACK_1_0</code>.
  ///
  /// <i> <code>TAG_FILTERS_1_0:</code> </i> A JSON syntax that lets you specify a
  /// collection of simple tag filters for resource types and tags, as supported
  /// by the AWS Tagging API <a
  /// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_GetResources.html">GetResources</a>
  /// operation. If you specify more than one tag key, only resources that match
  /// all tag keys, and at least one value of each specified tag key, are returned
  /// in your query. If you specify more than one value for a tag key, a resource
  /// matches the filter if it has a tag key value that matches <i>any</i> of the
  /// specified values.
  ///
  /// For example, consider the following sample query for resources that have two
  /// tags, <code>Stage</code> and <code>Version</code>, with two values each.
  /// (<code>[{"Key":"Stage","Values":["Test","Deploy"]},{"Key":"Version","Values":["1","2"]}]</code>)
  /// The results of this query might include the following.
  ///
  /// <ul>
  /// <li>
  /// An EC2 instance that has the following two tags:
  /// <code>{"Key":"Stage","Value":"Deploy"}</code>, and
  /// <code>{"Key":"Version","Value":"2"}</code>
  /// </li>
  /// <li>
  /// An S3 bucket that has the following two tags:
  /// {"Key":"Stage","Value":"Test"}, and {"Key":"Version","Value":"1"}
  /// </li>
  /// </ul>
  /// The query would not return the following results, however. The following EC2
  /// instance does not have all tag keys specified in the filter, so it is
  /// rejected. The RDS database has all of the tag keys, but no values that match
  /// at least one of the specified tag key values in the filter.
  ///
  /// <ul>
  /// <li>
  /// An EC2 instance that has only the following tag:
  /// <code>{"Key":"Stage","Value":"Deploy"}</code>.
  /// </li>
  /// <li>
  /// An RDS database that has the following two tags:
  /// <code>{"Key":"Stage","Value":"Archived"}</code>, and
  /// <code>{"Key":"Version","Value":"4"}</code>
  /// </li>
  /// </ul>
  /// <i> <code>CLOUDFORMATION_STACK_1_0:</code> </i> A JSON syntax that lets you
  /// specify a CloudFormation stack ARN.
  @_s.JsonKey(name: 'Type')
  final QueryType type;

  ResourceQuery({
    @_s.required this.query,
    @_s.required this.type,
  });
  factory ResourceQuery.fromJson(Map<String, dynamic> json) =>
      _$ResourceQueryFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceQueryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchResourcesOutput {
  /// The NextToken value to include in a subsequent <code>SearchResources</code>
  /// request, to get more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>QueryError</code> objects. Each error is an object that
  /// contains <code>ErrorCode</code> and <code>Message</code> structures.
  /// Possible values for <code>ErrorCode</code> are
  /// <code>CLOUDFORMATION_STACK_INACTIVE</code> and
  /// <code>CLOUDFORMATION_STACK_NOT_EXISTING</code>.
  @_s.JsonKey(name: 'QueryErrors')
  final List<QueryError> queryErrors;

  /// The ARNs and resource types of resources that are members of the group that
  /// you specified.
  @_s.JsonKey(name: 'ResourceIdentifiers')
  final List<ResourceIdentifier> resourceIdentifiers;

  SearchResourcesOutput({
    this.nextToken,
    this.queryErrors,
    this.resourceIdentifiers,
  });
  factory SearchResourcesOutput.fromJson(Map<String, dynamic> json) =>
      _$SearchResourcesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagOutput {
  /// The ARN of the tagged resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The tags that have been added to the specified resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  TagOutput({
    this.arn,
    this.tags,
  });
  factory TagOutput.fromJson(Map<String, dynamic> json) =>
      _$TagOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagOutput {
  /// The ARN of the resource from which tags have been removed.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The keys of tags that have been removed.
  @_s.JsonKey(name: 'Keys')
  final List<String> keys;

  UntagOutput({
    this.arn,
    this.keys,
  });
  factory UntagOutput.fromJson(Map<String, dynamic> json) =>
      _$UntagOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGroupOutput {
  /// The full description of the resource group after it has been updated.
  @_s.JsonKey(name: 'Group')
  final Group group;

  UpdateGroupOutput({
    this.group,
  });
  factory UpdateGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGroupQueryOutput {
  /// The resource query associated with the resource group after the update.
  @_s.JsonKey(name: 'GroupQuery')
  final GroupQuery groupQuery;

  UpdateGroupQueryOutput({
    this.groupQuery,
  });
  factory UpdateGroupQueryOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGroupQueryOutputFromJson(json);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class MethodNotAllowedException extends _s.GenericAwsException {
  MethodNotAllowedException({String type, String message})
      : super(type: type, code: 'MethodNotAllowedException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'MethodNotAllowedException': (type, message) =>
      MethodNotAllowedException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
