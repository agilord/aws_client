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

/// AWS Resource Groups lets you organize AWS resources such as Amazon EC2
/// instances, Amazon Relational Database Service databases, and Amazon S3
/// buckets into groups using criteria that you define as tags. A resource group
/// is a collection of resources that match the resource types specified in a
/// query, and share one or more tags or portions of tags. You can create a
/// group of resources based on their roles in your cloud infrastructure,
/// lifecycle stages, regions, application layers, or virtually any criteria.
/// Resource Groups enable you to automate management tasks, such as those in
/// AWS Systems Manager Automation documents, on tag-related resources in AWS
/// Systems Manager. Groups of tagged resources also let you quickly view a
/// custom console in AWS Systems Manager that shows AWS Config compliance and
/// other monitoring data about member resources.
class ResourceGroups {
  final _s.RestJsonProtocol _protocol;
  ResourceGroups({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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

  /// Creates a resource group with the specified name and description. You can
  /// optionally include a resource query, or a service configuration. For more
  /// information about constructing a resource query, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create
  /// a tag-based group in Resource Groups</a>. For more information about
  /// service configurations, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
  /// configurations for resource groups</a>.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:CreateGroup</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [name] :
  /// The name of the group, which is the identifier of the group in other
  /// operations. You can't change the name of a resource group after you create
  /// it. A resource group name can consist of letters, numbers, hyphens,
  /// periods, and underscores. The name cannot start with <code>AWS</code> or
  /// <code>aws</code>; these are reserved. A resource group name must be unique
  /// within each AWS Region in your AWS account.
  ///
  /// Parameter [configuration] :
  /// A configuration associates the resource group with an AWS service and
  /// specifies how the service can interact with the resources in the group. A
  /// configuration is an array of <a>GroupConfigurationItem</a> elements. For
  /// details about the syntax of service configurations, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
  /// configurations for resource groups</a>.
  /// <note>
  /// A resource group can contain either a <code>Configuration</code> or a
  /// <code>ResourceQuery</code>, but not both.
  /// </note>
  ///
  /// Parameter [description] :
  /// The description of the resource group. Descriptions can consist of
  /// letters, numbers, hyphens, underscores, periods, and spaces.
  ///
  /// Parameter [resourceQuery] :
  /// The resource query that determines which AWS resources are members of this
  /// group. For more information about resource queries, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create
  /// a tag-based group in Resource Groups</a>.
  /// <note>
  /// A resource group can contain either a <code>ResourceQuery</code> or a
  /// <code>Configuration</code>, but not both.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The tags to add to the group. A tag is key-value pair string.
  Future<CreateGroupOutput> createGroup({
    required String name,
    List<GroupConfigurationItem>? configuration,
    String? description,
    ResourceQuery? resourceQuery,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      if (configuration != null) 'Configuration': configuration,
      if (description != null) 'Description': description,
      if (resourceQuery != null) 'ResourceQuery': resourceQuery,
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

  /// Deletes the specified resource group. Deleting a resource group does not
  /// delete any resources that are members of the group; it only deletes the
  /// group structure.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:DeleteGroup</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [group] :
  /// The name or the ARN of the resource group to delete.
  ///
  /// Parameter [groupName] :
  /// Deprecated - don't use this parameter. Use <code>Group</code> instead.
  Future<DeleteGroupOutput> deleteGroup({
    String? group,
    String? groupName,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    final $payload = <String, dynamic>{
      if (group != null) 'Group': group,
      if (groupName != null) 'GroupName': groupName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-group',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGroupOutput.fromJson(response);
  }

  /// Returns information about a specified resource group.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:GetGroup</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [group] :
  /// The name or the ARN of the resource group to retrieve.
  ///
  /// Parameter [groupName] :
  /// Deprecated - don't use this parameter. Use <code>Group</code> instead.
  Future<GetGroupOutput> getGroup({
    String? group,
    String? groupName,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    final $payload = <String, dynamic>{
      if (group != null) 'Group': group,
      if (groupName != null) 'GroupName': groupName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-group',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupOutput.fromJson(response);
  }

  /// Returns the service configuration associated with the specified resource
  /// group. For details about the service configuration syntax, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
  /// configurations for resource groups</a>.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:GetGroupConfiguration</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [group] :
  /// The name or the ARN of the resource group.
  Future<GetGroupConfigurationOutput> getGroupConfiguration({
    String? group,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    final $payload = <String, dynamic>{
      if (group != null) 'Group': group,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-group-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupConfigurationOutput.fromJson(response);
  }

  /// Retrieves the resource query associated with the specified resource group.
  /// For more information about resource queries, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create
  /// a tag-based group in Resource Groups</a>.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:GetGroupQuery</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [group] :
  /// The name or the ARN of the resource group to query.
  ///
  /// Parameter [groupName] :
  /// Don't use this parameter. Use <code>Group</code> instead.
  Future<GetGroupQueryOutput> getGroupQuery({
    String? group,
    String? groupName,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    final $payload = <String, dynamic>{
      if (group != null) 'Group': group,
      if (groupName != null) 'GroupName': groupName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-group-query',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupQueryOutput.fromJson(response);
  }

  /// Returns a list of tags that are associated with a resource group,
  /// specified by an ARN.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:GetTags</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [arn] :
  /// The ARN of the resource group whose tags you want to retrieve.
  Future<GetTagsOutput> getTags({
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      12,
      1600,
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

  /// Adds the specified resources to the specified group.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:GroupResources</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [group] :
  /// The name or the ARN of the resource group to add resources to.
  ///
  /// Parameter [resourceArns] :
  /// The list of ARNs for resources to be added to the group.
  Future<GroupResourcesOutput> groupResources({
    required String group,
    required List<String> resourceArns,
  }) async {
    ArgumentError.checkNotNull(group, 'group');
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArns, 'resourceArns');
    final $payload = <String, dynamic>{
      'Group': group,
      'ResourceArns': resourceArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/group-resources',
      exceptionFnMap: _exceptionFns,
    );
    return GroupResourcesOutput.fromJson(response);
  }

  /// Returns a list of ARNs of the resources that are members of a specified
  /// resource group.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:ListGroupResources</code>
  /// </li>
  /// <li>
  /// <code>cloudformation:DescribeStacks</code>
  /// </li>
  /// <li>
  /// <code>cloudformation:ListStackResources</code>
  /// </li>
  /// <li>
  /// <code>tag:GetResources</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [filters] :
  /// Filters, formatted as <a>ResourceFilter</a> objects, that you want to
  /// apply to a <code>ListGroupResources</code> operation. Filters the results
  /// to include only those of the specified resource types.
  ///
  /// <ul>
  /// <li>
  /// <code>resource-type</code> - Filter resources by their type. Specify up to
  /// five resource types in the format
  /// <code>AWS::ServiceCode::ResourceType</code>. For example,
  /// <code>AWS::EC2::Instance</code>, or <code>AWS::S3::Bucket</code>.
  /// </li>
  /// </ul>
  /// When you specify a <code>resource-type</code> filter for
  /// <code>ListGroupResources</code>, AWS Resource Groups validates your filter
  /// resource types against the types that are defined in the query associated
  /// with the group. For example, if a group contains only S3 buckets because
  /// its query specifies only that resource type, but your
  /// <code>resource-type</code> filter includes EC2 instances, AWS Resource
  /// Groups does not filter for EC2 instances. In this case, a
  /// <code>ListGroupResources</code> request returns a
  /// <code>BadRequestException</code> error with a message similar to the
  /// following:
  ///
  /// <code>The resource types specified as filters in the request are not
  /// valid.</code>
  ///
  /// The error includes a list of resource types that failed the validation
  /// because they are not part of the query associated with the group. This
  /// validation doesn't occur when the group query specifies
  /// <code>AWS::AllSupported</code>, because a group based on such a query can
  /// contain any of the allowed resource types for the query type (tag-based or
  /// AWS CloudFormation stack-based queries).
  ///
  /// Parameter [group] :
  /// The name or the ARN of the resource group
  ///
  /// Parameter [groupName] :
  /// <important>
  /// <i> <b>Deprecated - don't use this parameter. Use the <code>Group</code>
  /// request field instead.</b> </i>
  /// </important>
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value provided by a previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListGroupResourcesOutput> listGroupResources({
    List<ResourceFilter>? filters,
    String? group,
    String? groupName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
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
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (group != null) 'Group': group,
      if (groupName != null) 'GroupName': groupName,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-group-resources',
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupResourcesOutput.fromJson(response);
  }

  /// Returns a list of existing resource groups in your account.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:ListGroups</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [filters] :
  /// Filters, formatted as <a>GroupFilter</a> objects, that you want to apply
  /// to a <code>ListGroups</code> operation.
  ///
  /// <ul>
  /// <li>
  /// <code>resource-type</code> - Filter the results to include only those of
  /// the specified resource types. Specify up to five resource types in the
  /// format <code>AWS::<i>ServiceCode</i>::<i>ResourceType</i> </code>. For
  /// example, <code>AWS::EC2::Instance</code>, or <code>AWS::S3::Bucket</code>.
  /// </li>
  /// <li>
  /// <code>configuration-type</code> - Filter the results to include only those
  /// groups that have the specified configuration types attached. The current
  /// supported values are:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS:EC2::CapacityReservationPool</code>
  /// </li>
  /// <li>
  /// <code>AWS:EC2::HostManagement</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value provided by a previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListGroupsOutput> listGroups({
    List<GroupFilter>? filters,
    int? maxResults,
    String? nextToken,
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

  /// Attaches a service configuration to the specified group. This occurs
  /// asynchronously, and can take time to complete. You can use
  /// <a>GetGroupConfiguration</a> to check the status of the update.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:PutGroupConfiguration</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [configuration] :
  /// The new configuration to associate with the specified group. A
  /// configuration associates the resource group with an AWS service and
  /// specifies how the service can interact with the resources in the group. A
  /// configuration is an array of <a>GroupConfigurationItem</a> elements.
  ///
  /// For information about the syntax of a service configuration, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
  /// configurations for resource groups</a>.
  /// <note>
  /// A resource group can contain either a <code>Configuration</code> or a
  /// <code>ResourceQuery</code>, but not both.
  /// </note>
  ///
  /// Parameter [group] :
  /// The name or ARN of the resource group with the configuration that you want
  /// to update.
  Future<void> putGroupConfiguration({
    List<GroupConfigurationItem>? configuration,
    String? group,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    final $payload = <String, dynamic>{
      if (configuration != null) 'Configuration': configuration,
      if (group != null) 'Group': group,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/put-group-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of AWS resource identifiers that matches the specified
  /// query. The query uses the same format as a resource query in a CreateGroup
  /// or UpdateGroupQuery operation.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:SearchResources</code>
  /// </li>
  /// <li>
  /// <code>cloudformation:DescribeStacks</code>
  /// </li>
  /// <li>
  /// <code>cloudformation:ListStackResources</code>
  /// </li>
  /// <li>
  /// <code>tag:GetResources</code>
  /// </li>
  /// </ul>
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
  /// group definition. For more information, see <a>CreateGroup</a>.
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that the service might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value provided by a previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<SearchResourcesOutput> searchResources({
    required ResourceQuery resourceQuery,
    int? maxResults,
    String? nextToken,
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
  /// <important>
  /// Do not store personally identifiable information (PII) or other
  /// confidential or sensitive information in tags. We use tags to provide you
  /// with billing and administration services. Tags are not intended to be used
  /// for private or sensitive data.
  /// </important>
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:Tag</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [arn] :
  /// The ARN of the resource group to which to add tags.
  ///
  /// Parameter [tags] :
  /// The tags to add to the specified resource group. A tag is a
  /// string-to-string map of key-value pairs.
  Future<TagOutput> tag({
    required String arn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      12,
      1600,
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

  /// Removes the specified resources from the specified group.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:UngroupResources</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [group] :
  /// The name or the ARN of the resource group from which to remove the
  /// resources.
  ///
  /// Parameter [resourceArns] :
  /// The ARNs of the resources to be removed from the group.
  Future<UngroupResourcesOutput> ungroupResources({
    required String group,
    required List<String> resourceArns,
  }) async {
    ArgumentError.checkNotNull(group, 'group');
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArns, 'resourceArns');
    final $payload = <String, dynamic>{
      'Group': group,
      'ResourceArns': resourceArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ungroup-resources',
      exceptionFnMap: _exceptionFns,
    );
    return UngroupResourcesOutput.fromJson(response);
  }

  /// Deletes tags from a specified resource group.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:Untag</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [arn] :
  /// The ARN of the resource group from which to remove tags. The command
  /// removed both the specified keys and any values associated with those keys.
  ///
  /// Parameter [keys] :
  /// The keys of the tags to be removed.
  Future<UntagOutput> untag({
    required String arn,
    required List<String> keys,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      12,
      1600,
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

  /// Updates the description for an existing group. You cannot update the name
  /// of a resource group.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:UpdateGroup</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [description] :
  /// The new description that you want to update the resource group with.
  /// Descriptions can contain letters, numbers, hyphens, underscores, periods,
  /// and spaces.
  ///
  /// Parameter [group] :
  /// The name or the ARN of the resource group to modify.
  ///
  /// Parameter [groupName] :
  /// Don't use this parameter. Use <code>Group</code> instead.
  Future<UpdateGroupOutput> updateGroup({
    String? description,
    String? group,
    String? groupName,
  }) async {
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (group != null) 'Group': group,
      if (groupName != null) 'GroupName': groupName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-group',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGroupOutput.fromJson(response);
  }

  /// Updates the resource query of a group. For more information about resource
  /// queries, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create
  /// a tag-based group in Resource Groups</a>.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:UpdateGroupQuery</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceQuery] :
  /// The resource query to determine which AWS resources are members of this
  /// resource group.
  /// <note>
  /// A resource group can contain either a <code>Configuration</code> or a
  /// <code>ResourceQuery</code>, but not both.
  /// </note>
  ///
  /// Parameter [group] :
  /// The name or the ARN of the resource group to query.
  ///
  /// Parameter [groupName] :
  /// Don't use this parameter. Use <code>Group</code> instead.
  Future<UpdateGroupQueryOutput> updateGroupQuery({
    required ResourceQuery resourceQuery,
    String? group,
    String? groupName,
  }) async {
    ArgumentError.checkNotNull(resourceQuery, 'resourceQuery');
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    final $payload = <String, dynamic>{
      'ResourceQuery': resourceQuery,
      if (group != null) 'Group': group,
      if (groupName != null) 'GroupName': groupName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-group-query',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGroupQueryOutput.fromJson(response);
  }
}

class CreateGroupOutput {
  /// The description of the resource group.
  final Group? group;

  /// The service configuration associated with the resource group. For details
  /// about the syntax of a service configuration, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
  /// configurations for resource groups</a>.
  final GroupConfiguration? groupConfiguration;

  /// The resource query associated with the group. For more information about
  /// resource queries, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create
  /// a tag-based group in Resource Groups</a>.
  final ResourceQuery? resourceQuery;

  /// The tags associated with the group.
  final Map<String, String>? tags;

  CreateGroupOutput({
    this.group,
    this.groupConfiguration,
    this.resourceQuery,
    this.tags,
  });

  factory CreateGroupOutput.fromJson(Map<String, dynamic> json) {
    return CreateGroupOutput(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
      groupConfiguration: json['GroupConfiguration'] != null
          ? GroupConfiguration.fromJson(
              json['GroupConfiguration'] as Map<String, dynamic>)
          : null,
      resourceQuery: json['ResourceQuery'] != null
          ? ResourceQuery.fromJson(
              json['ResourceQuery'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final groupConfiguration = this.groupConfiguration;
    final resourceQuery = this.resourceQuery;
    final tags = this.tags;
    return {
      if (group != null) 'Group': group,
      if (groupConfiguration != null) 'GroupConfiguration': groupConfiguration,
      if (resourceQuery != null) 'ResourceQuery': resourceQuery,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DeleteGroupOutput {
  /// A full description of the deleted resource group.
  final Group? group;

  DeleteGroupOutput({
    this.group,
  });

  factory DeleteGroupOutput.fromJson(Map<String, dynamic> json) {
    return DeleteGroupOutput(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    return {
      if (group != null) 'Group': group,
    };
  }
}

/// A resource that failed to be added to or removed from a group.
class FailedResource {
  /// The error code associated with the failure.
  final String? errorCode;

  /// The error message text associated with the failure.
  final String? errorMessage;

  /// The ARN of the resource that failed to be added or removed.
  final String? resourceArn;

  FailedResource({
    this.errorCode,
    this.errorMessage,
    this.resourceArn,
  });

  factory FailedResource.fromJson(Map<String, dynamic> json) {
    return FailedResource(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final resourceArn = this.resourceArn;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

class GetGroupConfigurationOutput {
  /// The service configuration associated with the specified group. For details
  /// about the service configuration syntax, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
  /// configurations for resource groups</a>.
  final GroupConfiguration? groupConfiguration;

  GetGroupConfigurationOutput({
    this.groupConfiguration,
  });

  factory GetGroupConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return GetGroupConfigurationOutput(
      groupConfiguration: json['GroupConfiguration'] != null
          ? GroupConfiguration.fromJson(
              json['GroupConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final groupConfiguration = this.groupConfiguration;
    return {
      if (groupConfiguration != null) 'GroupConfiguration': groupConfiguration,
    };
  }
}

class GetGroupOutput {
  /// A full description of the resource group.
  final Group? group;

  GetGroupOutput({
    this.group,
  });

  factory GetGroupOutput.fromJson(Map<String, dynamic> json) {
    return GetGroupOutput(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    return {
      if (group != null) 'Group': group,
    };
  }
}

class GetGroupQueryOutput {
  /// The resource query associated with the specified group. For more information
  /// about resource queries, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create
  /// a tag-based group in Resource Groups</a>.
  final GroupQuery? groupQuery;

  GetGroupQueryOutput({
    this.groupQuery,
  });

  factory GetGroupQueryOutput.fromJson(Map<String, dynamic> json) {
    return GetGroupQueryOutput(
      groupQuery: json['GroupQuery'] != null
          ? GroupQuery.fromJson(json['GroupQuery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final groupQuery = this.groupQuery;
    return {
      if (groupQuery != null) 'GroupQuery': groupQuery,
    };
  }
}

class GetTagsOutput {
  /// The ARN of the tagged resource group.
  final String? arn;

  /// The tags associated with the specified resource group.
  final Map<String, String>? tags;

  GetTagsOutput({
    this.arn,
    this.tags,
  });

  factory GetTagsOutput.fromJson(Map<String, dynamic> json) {
    return GetTagsOutput(
      arn: json['Arn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A resource group that contains AWS resources. You can assign resources to
/// the group by associating either of the following elements with the group:
///
/// <ul>
/// <li>
/// <a>ResourceQuery</a> - Use a resource query to specify a set of tag keys and
/// values. All resources in the same AWS Region and AWS account that have those
/// keys with the same values are included in the group. You can add a resource
/// query when you create the group, or later by using the
/// <a>PutGroupConfiguration</a> operation.
/// </li>
/// <li>
/// <a>GroupConfiguration</a> - Use a service configuration to associate the
/// group with an AWS service. The configuration specifies which resource types
/// can be included in the group.
/// </li>
/// </ul>
class Group {
  /// The ARN of the resource group.
  final String groupArn;

  /// The name of the resource group.
  final String name;

  /// The description of the resource group.
  final String? description;

  Group({
    required this.groupArn,
    required this.name,
    this.description,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupArn: json['GroupArn'] as String,
      name: json['Name'] as String,
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupArn = this.groupArn;
    final name = this.name;
    final description = this.description;
    return {
      'GroupArn': groupArn,
      'Name': name,
      if (description != null) 'Description': description,
    };
  }
}

/// A service configuration associated with a resource group. The configuration
/// options are determined by the AWS service that defines the
/// <code>Type</code>, and specifies which resources can be included in the
/// group. You can add a service configuration when you create the group by
/// using <a>CreateGroup</a>, or later by using the <a>PutGroupConfiguration</a>
/// operation. For details about group service configuration syntax, see <a
/// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
/// configurations for resource groups</a>.
class GroupConfiguration {
  /// The configuration currently associated with the group and in effect.
  final List<GroupConfigurationItem>? configuration;

  /// If present, the reason why a request to update the group configuration
  /// failed.
  final String? failureReason;

  /// If present, the new configuration that is in the process of being applied to
  /// the group.
  final List<GroupConfigurationItem>? proposedConfiguration;

  /// The current status of an attempt to update the group configuration.
  final GroupConfigurationStatus? status;

  GroupConfiguration({
    this.configuration,
    this.failureReason,
    this.proposedConfiguration,
    this.status,
  });

  factory GroupConfiguration.fromJson(Map<String, dynamic> json) {
    return GroupConfiguration(
      configuration: (json['Configuration'] as List?)
          ?.whereNotNull()
          .map(
              (e) => GroupConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureReason: json['FailureReason'] as String?,
      proposedConfiguration: (json['ProposedConfiguration'] as List?)
          ?.whereNotNull()
          .map(
              (e) => GroupConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toGroupConfigurationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final failureReason = this.failureReason;
    final proposedConfiguration = this.proposedConfiguration;
    final status = this.status;
    return {
      if (configuration != null) 'Configuration': configuration,
      if (failureReason != null) 'FailureReason': failureReason,
      if (proposedConfiguration != null)
        'ProposedConfiguration': proposedConfiguration,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// An item in a group configuration. A group service configuration can have one
/// or more items. For details about group service configuration syntax, see <a
/// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
/// configurations for resource groups</a>.
class GroupConfigurationItem {
  /// Specifies the type of group configuration item. Each item must have a unique
  /// value for <code>type</code>. For the list of types that you can specify for
  /// a configuration item, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html#about-slg-types">Supported
  /// resource types and parameters</a>.
  final String type;

  /// A collection of parameters for this group configuration item. For the list
  /// of parameters that you can use with each configuration item type, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html#about-slg-types">Supported
  /// resource types and parameters</a>.
  final List<GroupConfigurationParameter>? parameters;

  GroupConfigurationItem({
    required this.type,
    this.parameters,
  });

  factory GroupConfigurationItem.fromJson(Map<String, dynamic> json) {
    return GroupConfigurationItem(
      type: json['Type'] as String,
      parameters: (json['Parameters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              GroupConfigurationParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final parameters = this.parameters;
    return {
      'Type': type,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// A parameter for a group configuration item. For details about group service
/// configuration syntax, see <a
/// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
/// configurations for resource groups</a>.
class GroupConfigurationParameter {
  /// The name of the group configuration parameter. For the list of parameters
  /// that you can use with each configuration item type, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html#about-slg-types">Supported
  /// resource types and parameters</a>.
  final String name;

  /// The value or values to be used for the specified parameter. For the list of
  /// values you can use with each parameter, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html#about-slg-types">Supported
  /// resource types and parameters</a>.
  final List<String>? values;

  GroupConfigurationParameter({
    required this.name,
    this.values,
  });

  factory GroupConfigurationParameter.fromJson(Map<String, dynamic> json) {
    return GroupConfigurationParameter(
      name: json['Name'] as String,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name,
      if (values != null) 'Values': values,
    };
  }
}

enum GroupConfigurationStatus {
  updating,
  updateComplete,
  updateFailed,
}

extension on GroupConfigurationStatus {
  String toValue() {
    switch (this) {
      case GroupConfigurationStatus.updating:
        return 'UPDATING';
      case GroupConfigurationStatus.updateComplete:
        return 'UPDATE_COMPLETE';
      case GroupConfigurationStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension on String {
  GroupConfigurationStatus toGroupConfigurationStatus() {
    switch (this) {
      case 'UPDATING':
        return GroupConfigurationStatus.updating;
      case 'UPDATE_COMPLETE':
        return GroupConfigurationStatus.updateComplete;
      case 'UPDATE_FAILED':
        return GroupConfigurationStatus.updateFailed;
    }
    throw Exception('$this is not known in enum GroupConfigurationStatus');
  }
}

/// A filter collection that you can use to restrict the results from a
/// <code>List</code> operation to only those you want to include.
class GroupFilter {
  /// The name of the filter. Filter names are case-sensitive.
  final GroupFilterName name;

  /// One or more filter values. Allowed filter values vary by group filter name,
  /// and are case-sensitive.
  final List<String> values;

  GroupFilter({
    required this.name,
    required this.values,
  });

  factory GroupFilter.fromJson(Map<String, dynamic> json) {
    return GroupFilter(
      name: (json['Name'] as String).toGroupFilterName(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Values': values,
    };
  }
}

enum GroupFilterName {
  resourceType,
  configurationType,
}

extension on GroupFilterName {
  String toValue() {
    switch (this) {
      case GroupFilterName.resourceType:
        return 'resource-type';
      case GroupFilterName.configurationType:
        return 'configuration-type';
    }
  }
}

extension on String {
  GroupFilterName toGroupFilterName() {
    switch (this) {
      case 'resource-type':
        return GroupFilterName.resourceType;
      case 'configuration-type':
        return GroupFilterName.configurationType;
    }
    throw Exception('$this is not known in enum GroupFilterName');
  }
}

/// The unique identifiers for a resource group.
class GroupIdentifier {
  /// The ARN of the resource group.
  final String? groupArn;

  /// The name of the resource group.
  final String? groupName;

  GroupIdentifier({
    this.groupArn,
    this.groupName,
  });

  factory GroupIdentifier.fromJson(Map<String, dynamic> json) {
    return GroupIdentifier(
      groupArn: json['GroupArn'] as String?,
      groupName: json['GroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupArn = this.groupArn;
    final groupName = this.groupName;
    return {
      if (groupArn != null) 'GroupArn': groupArn,
      if (groupName != null) 'GroupName': groupName,
    };
  }
}

/// A mapping of a query attached to a resource group that determines the AWS
/// resources that are members of the group.
class GroupQuery {
  /// The name of the resource group that is associated with the specified
  /// resource query.
  final String groupName;

  /// The resource query that determines which AWS resources are members of the
  /// associated resource group.
  final ResourceQuery resourceQuery;

  GroupQuery({
    required this.groupName,
    required this.resourceQuery,
  });

  factory GroupQuery.fromJson(Map<String, dynamic> json) {
    return GroupQuery(
      groupName: json['GroupName'] as String,
      resourceQuery:
          ResourceQuery.fromJson(json['ResourceQuery'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final groupName = this.groupName;
    final resourceQuery = this.resourceQuery;
    return {
      'GroupName': groupName,
      'ResourceQuery': resourceQuery,
    };
  }
}

class GroupResourcesOutput {
  /// A list of ARNs of any resources that failed to be added to the group by this
  /// operation.
  final List<FailedResource>? failed;

  /// A list of ARNs of any resources that are still in the process of being added
  /// to the group by this operation. These pending additions continue
  /// asynchronously. You can check the status of pending additions by using the
  /// <code> <a>ListGroupResources</a> </code> operation, and checking the
  /// <code>Resources</code> array in the response and the <code>Status</code>
  /// field of each object in that array.
  final List<PendingResource>? pending;

  /// A list of ARNs of resources that were successfully added to the group by
  /// this operation.
  final List<String>? succeeded;

  GroupResourcesOutput({
    this.failed,
    this.pending,
    this.succeeded,
  });

  factory GroupResourcesOutput.fromJson(Map<String, dynamic> json) {
    return GroupResourcesOutput(
      failed: (json['Failed'] as List?)
          ?.whereNotNull()
          .map((e) => FailedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      pending: (json['Pending'] as List?)
          ?.whereNotNull()
          .map((e) => PendingResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      succeeded: (json['Succeeded'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final pending = this.pending;
    final succeeded = this.succeeded;
    return {
      if (failed != null) 'Failed': failed,
      if (pending != null) 'Pending': pending,
      if (succeeded != null) 'Succeeded': succeeded,
    };
  }
}

/// A structure returned by the <a>ListGroupResources</a> operation that
/// contains identity and group membership status information for one of the
/// resources in the group.
class ListGroupResourcesItem {
  final ResourceIdentifier? identifier;

  /// A structure that contains the status of this resource's membership in the
  /// group.
  /// <note>
  /// This field is present in the response only if the group is of type
  /// <code>AWS::EC2::HostManagement</code>.
  /// </note>
  final ResourceStatus? status;

  ListGroupResourcesItem({
    this.identifier,
    this.status,
  });

  factory ListGroupResourcesItem.fromJson(Map<String, dynamic> json) {
    return ListGroupResourcesItem(
      identifier: json['Identifier'] != null
          ? ResourceIdentifier.fromJson(
              json['Identifier'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? ResourceStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final status = this.status;
    return {
      if (identifier != null) 'Identifier': identifier,
      if (status != null) 'Status': status,
    };
  }
}

class ListGroupResourcesOutput {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  final String? nextToken;

  /// A list of <code>QueryError</code> objects. Each error is an object that
  /// contains <code>ErrorCode</code> and <code>Message</code> structures.
  /// Possible values for <code>ErrorCode</code> are
  /// <code>CLOUDFORMATION_STACK_INACTIVE</code> and
  /// <code>CLOUDFORMATION_STACK_NOT_EXISTING</code>.
  final List<QueryError>? queryErrors;

  /// <important>
  /// <b> <i>Deprecated - don't use this parameter. Use the <code>Resources</code>
  /// response field instead.</i> </b>
  /// </important>
  final List<ResourceIdentifier>? resourceIdentifiers;

  /// An array of resources from which you can determine each resource's identity,
  /// type, and group membership status.
  final List<ListGroupResourcesItem>? resources;

  ListGroupResourcesOutput({
    this.nextToken,
    this.queryErrors,
    this.resourceIdentifiers,
    this.resources,
  });

  factory ListGroupResourcesOutput.fromJson(Map<String, dynamic> json) {
    return ListGroupResourcesOutput(
      nextToken: json['NextToken'] as String?,
      queryErrors: (json['QueryErrors'] as List?)
          ?.whereNotNull()
          .map((e) => QueryError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceIdentifiers: (json['ResourceIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ListGroupResourcesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final queryErrors = this.queryErrors;
    final resourceIdentifiers = this.resourceIdentifiers;
    final resources = this.resources;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (queryErrors != null) 'QueryErrors': queryErrors,
      if (resourceIdentifiers != null)
        'ResourceIdentifiers': resourceIdentifiers,
      if (resources != null) 'Resources': resources,
    };
  }
}

class ListGroupsOutput {
  /// A list of <a>GroupIdentifier</a> objects. Each identifier is an object that
  /// contains both the <code>Name</code> and the <code>GroupArn</code>.
  final List<GroupIdentifier>? groupIdentifiers;

  /// <important>
  /// <i> <b>Deprecated - don't use this field. Use the
  /// <code>GroupIdentifiers</code> response field instead.</b> </i>
  /// </important>
  final List<Group>? groups;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  final String? nextToken;

  ListGroupsOutput({
    this.groupIdentifiers,
    this.groups,
    this.nextToken,
  });

  factory ListGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListGroupsOutput(
      groupIdentifiers: (json['GroupIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => GroupIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupIdentifiers = this.groupIdentifiers;
    final groups = this.groups;
    final nextToken = this.nextToken;
    return {
      if (groupIdentifiers != null) 'GroupIdentifiers': groupIdentifiers,
      if (groups != null) 'Groups': groups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A structure that identifies a resource that is currently pending addition to
/// the group as a member. Adding a resource to a resource group happens
/// asynchronously as a background task and this one isn't completed yet.
class PendingResource {
  /// The Amazon resource name (ARN) of the resource that's in a pending state.
  final String? resourceArn;

  PendingResource({
    this.resourceArn,
  });

  factory PendingResource.fromJson(Map<String, dynamic> json) {
    return PendingResource(
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

class PutGroupConfigurationOutput {
  PutGroupConfigurationOutput();

  factory PutGroupConfigurationOutput.fromJson(Map<String, dynamic> _) {
    return PutGroupConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A two-part error structure that can occur in <code>ListGroupResources</code>
/// or <code>SearchResources</code> operations on CloudFormation stack-based
/// queries. The error occurs if the CloudFormation stack on which the query is
/// based either does not exist, or has a status that renders the stack
/// inactive. A <code>QueryError</code> occurrence does not necessarily mean
/// that AWS Resource Groups could not complete the operation, but the resulting
/// group might have no member resources.
class QueryError {
  /// Possible values are <code>CLOUDFORMATION_STACK_INACTIVE</code> and
  /// <code>CLOUDFORMATION_STACK_NOT_EXISTING</code>.
  final QueryErrorCode? errorCode;

  /// A message that explains the <code>ErrorCode</code> value. Messages might
  /// state that the specified CloudFormation stack does not exist (or no longer
  /// exists). For <code>CLOUDFORMATION_STACK_INACTIVE</code>, the message
  /// typically states that the CloudFormation stack has a status that is not (or
  /// no longer) active, such as <code>CREATE_FAILED</code>.
  final String? message;

  QueryError({
    this.errorCode,
    this.message,
  });

  factory QueryError.fromJson(Map<String, dynamic> json) {
    return QueryError(
      errorCode: (json['ErrorCode'] as String?)?.toQueryErrorCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum QueryErrorCode {
  cloudformationStackInactive,
  cloudformationStackNotExisting,
}

extension on QueryErrorCode {
  String toValue() {
    switch (this) {
      case QueryErrorCode.cloudformationStackInactive:
        return 'CLOUDFORMATION_STACK_INACTIVE';
      case QueryErrorCode.cloudformationStackNotExisting:
        return 'CLOUDFORMATION_STACK_NOT_EXISTING';
    }
  }
}

extension on String {
  QueryErrorCode toQueryErrorCode() {
    switch (this) {
      case 'CLOUDFORMATION_STACK_INACTIVE':
        return QueryErrorCode.cloudformationStackInactive;
      case 'CLOUDFORMATION_STACK_NOT_EXISTING':
        return QueryErrorCode.cloudformationStackNotExisting;
    }
    throw Exception('$this is not known in enum QueryErrorCode');
  }
}

enum QueryType {
  tagFilters_1_0,
  cloudformationStack_1_0,
}

extension on QueryType {
  String toValue() {
    switch (this) {
      case QueryType.tagFilters_1_0:
        return 'TAG_FILTERS_1_0';
      case QueryType.cloudformationStack_1_0:
        return 'CLOUDFORMATION_STACK_1_0';
    }
  }
}

extension on String {
  QueryType toQueryType() {
    switch (this) {
      case 'TAG_FILTERS_1_0':
        return QueryType.tagFilters_1_0;
      case 'CLOUDFORMATION_STACK_1_0':
        return QueryType.cloudformationStack_1_0;
    }
    throw Exception('$this is not known in enum QueryType');
  }
}

/// A filter name and value pair that is used to obtain more specific results
/// from a list of resources.
class ResourceFilter {
  /// The name of the filter. Filter names are case-sensitive.
  final ResourceFilterName name;

  /// One or more filter values. Allowed filter values vary by resource filter
  /// name, and are case-sensitive.
  final List<String> values;

  ResourceFilter({
    required this.name,
    required this.values,
  });

  factory ResourceFilter.fromJson(Map<String, dynamic> json) {
    return ResourceFilter(
      name: (json['Name'] as String).toResourceFilterName(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Values': values,
    };
  }
}

enum ResourceFilterName {
  resourceType,
}

extension on ResourceFilterName {
  String toValue() {
    switch (this) {
      case ResourceFilterName.resourceType:
        return 'resource-type';
    }
  }
}

extension on String {
  ResourceFilterName toResourceFilterName() {
    switch (this) {
      case 'resource-type':
        return ResourceFilterName.resourceType;
    }
    throw Exception('$this is not known in enum ResourceFilterName');
  }
}

/// A structure that contains the ARN of a resource and its resource type.
class ResourceIdentifier {
  /// The ARN of a resource.
  final String? resourceArn;

  /// The resource type of a resource, such as <code>AWS::EC2::Instance</code>.
  final String? resourceType;

  ResourceIdentifier({
    this.resourceArn,
    this.resourceType,
  });

  factory ResourceIdentifier.fromJson(Map<String, dynamic> json) {
    return ResourceIdentifier(
      resourceArn: json['ResourceArn'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final resourceType = this.resourceType;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// The query that is used to define a resource group or a search for resources.
/// A query specifies both a query type and a query string as a JSON object. See
/// the examples section for example JSON strings.
///
/// The examples that follow are shown as standard JSON strings. If you include
/// such a string as a parameter to the AWS CLI or an SDK API, you might need to
/// 'escape' the string into a single line. For example, see the <a
/// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-quoting-strings.html">Quoting
/// strings</a> in the <i>AWS CLI User Guide</i>.
///
/// <b>Example 1</b>
///
/// The following generic example shows a resource query JSON string that
/// includes only resources that meet the following criteria:
///
/// <ul>
/// <li>
/// The resource type must be either <code>resource_type1</code> or
/// <code>resource_type2</code>.
/// </li>
/// <li>
/// The resource must have a tag <code>Key1</code> with a value of either
/// <code>ValueA</code> or <code>ValueB</code>.
/// </li>
/// <li>
/// The resource must have a tag <code>Key2</code> with a value of either
/// <code>ValueC</code> or <code>ValueD</code>.
/// </li>
/// </ul>
/// <code>{ "Type": "TAG_FILTERS_1_0", "Query": { "ResourceTypeFilters": [
/// "resource_type1", "resource_type2"], "TagFilters": [ { "Key": "Key1",
/// "Values": ["ValueA","ValueB"] }, { "Key":"Key2",
/// "Values":["ValueC","ValueD"] } ] } }</code>
///
/// This has the equivalent "shortcut" syntax of the following:
///
/// <code>{ "Type": "TAG_FILTERS_1_0", "Query": { "ResourceTypeFilters": [
/// "resource_type1", "resource_type2"], "TagFilters": [ { "Key1":
/// ["ValueA","ValueB"] }, { "Key2": ["ValueC","ValueD"] } ] } }</code>
///
/// <b>Example 2</b>
///
/// The following example shows a resource query JSON string that includes only
/// Amazon EC2 instances that are tagged <code>Stage</code> with a value of
/// <code>Test</code>.
///
/// <code>{ "Type": "TAG_FILTERS_1_0", "Query": "{ "ResourceTypeFilters":
/// "AWS::EC2::Instance", "TagFilters": { "Stage": "Test" } } }</code>
///
/// <b>Example 3</b>
///
/// The following example shows a resource query JSON string that includes
/// resource of any supported type as long as it is tagged <code>Stage</code>
/// with a value of <code>Prod</code>.
///
/// <code>{ "Type": "TAG_FILTERS_1_0", "Query": { "ResourceTypeFilters":
/// "AWS::AllSupported", "TagFilters": { "Stage": "Prod" } } }</code>
///
/// <b>Example 4</b>
///
/// The following example shows a resource query JSON string that includes only
/// Amazon EC2 instances and Amazon S3 buckets that are part of the specified
/// AWS CloudFormation stack.
///
/// <code>{ "Type": "CLOUDFORMATION_STACK_1_0", "Query": {
/// "ResourceTypeFilters": [ "AWS::EC2::Instance", "AWS::S3::Bucket" ],
/// "StackIdentifier":
/// "arn:aws:cloudformation:us-west-2:123456789012:stack/AWStestuseraccount/fb0d5000-aba8-00e8-aa9e-50d5cEXAMPLE"
/// } }</code>
class ResourceQuery {
  /// The query that defines a group or a search.
  final String query;

  /// The type of the query. You can use the following values:
  ///
  /// <ul>
  /// <li>
  /// <i> <code>CLOUDFORMATION_STACK_1_0:</code> </i>Specifies that the
  /// <code>Query</code> contains an ARN for a CloudFormation stack.
  /// </li>
  /// <li>
  /// <i> <code>TAG_FILTERS_1_0:</code> </i>Specifies that the <code>Query</code>
  /// parameter contains a JSON string that represents a collection of simple tag
  /// filters for resource types and tags. The JSON string uses a syntax similar
  /// to the <code> <a
  /// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_GetResources.html">GetResources</a>
  /// </code> operation, but uses only the <code> <a
  /// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_GetResources.html#resourcegrouptagging-GetResources-request-ResourceTypeFilters">
  /// ResourceTypeFilters</a> </code> and <code> <a
  /// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_GetResources.html#resourcegrouptagging-GetResources-request-TagFiltersTagFilters">TagFilters</a>
  /// </code> fields. If you specify more than one tag key, only resources that
  /// match all tag keys, and at least one value of each specified tag key, are
  /// returned in your query. If you specify more than one value for a tag key, a
  /// resource matches the filter if it has a tag key value that matches
  /// <i>any</i> of the specified values.
  ///
  /// For example, consider the following sample query for resources that have two
  /// tags, <code>Stage</code> and <code>Version</code>, with two values each:
  ///
  /// <code>[{"Stage":["Test","Deploy"]},{"Version":["1","2"]}]</code>
  ///
  /// The results of this query could include the following.
  ///
  /// <ul>
  /// <li>
  /// An EC2 instance that has the following two tags:
  /// <code>{"Stage":"Deploy"}</code>, and <code>{"Version":"2"}</code>
  /// </li>
  /// <li>
  /// An S3 bucket that has the following two tags: <code>{"Stage":"Test"}</code>,
  /// and <code>{"Version":"1"}</code>
  /// </li>
  /// </ul>
  /// The query would not include the following items in the results, however.
  ///
  /// <ul>
  /// <li>
  /// An EC2 instance that has only the following tag:
  /// <code>{"Stage":"Deploy"}</code>.
  ///
  /// The instance does not have <b>all</b> of the tag keys specified in the
  /// filter, so it is excluded from the results.
  /// </li>
  /// <li>
  /// An RDS database that has the following two tags:
  /// <code>{"Stage":"Archived"}</code> and <code>{"Version":"4"}</code>
  ///
  /// The database has all of the tag keys, but none of those keys has an
  /// associated value that matches at least one of the specified values in the
  /// filter.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final QueryType type;

  ResourceQuery({
    required this.query,
    required this.type,
  });

  factory ResourceQuery.fromJson(Map<String, dynamic> json) {
    return ResourceQuery(
      query: json['Query'] as String,
      type: (json['Type'] as String).toQueryType(),
    );
  }

  Map<String, dynamic> toJson() {
    final query = this.query;
    final type = this.type;
    return {
      'Query': query,
      'Type': type.toValue(),
    };
  }
}

/// A structure that identifies the current group membership status for a
/// resource. Adding a resource to a resource group is performed asynchronously
/// as a background task. A <code>PENDING</code> status indicates, for this
/// resource, that the process isn't completed yet.
class ResourceStatus {
  /// The current status.
  final ResourceStatusValue? name;

  ResourceStatus({
    this.name,
  });

  factory ResourceStatus.fromJson(Map<String, dynamic> json) {
    return ResourceStatus(
      name: (json['Name'] as String?)?.toResourceStatusValue(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name.toValue(),
    };
  }
}

enum ResourceStatusValue {
  pending,
}

extension on ResourceStatusValue {
  String toValue() {
    switch (this) {
      case ResourceStatusValue.pending:
        return 'PENDING';
    }
  }
}

extension on String {
  ResourceStatusValue toResourceStatusValue() {
    switch (this) {
      case 'PENDING':
        return ResourceStatusValue.pending;
    }
    throw Exception('$this is not known in enum ResourceStatusValue');
  }
}

class SearchResourcesOutput {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  final String? nextToken;

  /// A list of <code>QueryError</code> objects. Each error is an object that
  /// contains <code>ErrorCode</code> and <code>Message</code> structures.
  /// Possible values for <code>ErrorCode</code> are
  /// <code>CLOUDFORMATION_STACK_INACTIVE</code> and
  /// <code>CLOUDFORMATION_STACK_NOT_EXISTING</code>.
  final List<QueryError>? queryErrors;

  /// The ARNs and resource types of resources that are members of the group that
  /// you specified.
  final List<ResourceIdentifier>? resourceIdentifiers;

  SearchResourcesOutput({
    this.nextToken,
    this.queryErrors,
    this.resourceIdentifiers,
  });

  factory SearchResourcesOutput.fromJson(Map<String, dynamic> json) {
    return SearchResourcesOutput(
      nextToken: json['NextToken'] as String?,
      queryErrors: (json['QueryErrors'] as List?)
          ?.whereNotNull()
          .map((e) => QueryError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceIdentifiers: (json['ResourceIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final queryErrors = this.queryErrors;
    final resourceIdentifiers = this.resourceIdentifiers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (queryErrors != null) 'QueryErrors': queryErrors,
      if (resourceIdentifiers != null)
        'ResourceIdentifiers': resourceIdentifiers,
    };
  }
}

class TagOutput {
  /// The ARN of the tagged resource.
  final String? arn;

  /// The tags that have been added to the specified resource group.
  final Map<String, String>? tags;

  TagOutput({
    this.arn,
    this.tags,
  });

  factory TagOutput.fromJson(Map<String, dynamic> json) {
    return TagOutput(
      arn: json['Arn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class UngroupResourcesOutput {
  /// A list of any resources that failed to be removed from the group by this
  /// operation.
  final List<FailedResource>? failed;

  /// A list of any resources that are still in the process of being removed from
  /// the group by this operation. These pending removals continue asynchronously.
  /// You can check the status of pending removals by using the <code>
  /// <a>ListGroupResources</a> </code> operation. After the resource is
  /// successfully removed, it no longer appears in the response.
  final List<PendingResource>? pending;

  /// A list of resources that were successfully removed from the group by this
  /// operation.
  final List<String>? succeeded;

  UngroupResourcesOutput({
    this.failed,
    this.pending,
    this.succeeded,
  });

  factory UngroupResourcesOutput.fromJson(Map<String, dynamic> json) {
    return UngroupResourcesOutput(
      failed: (json['Failed'] as List?)
          ?.whereNotNull()
          .map((e) => FailedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      pending: (json['Pending'] as List?)
          ?.whereNotNull()
          .map((e) => PendingResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      succeeded: (json['Succeeded'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final pending = this.pending;
    final succeeded = this.succeeded;
    return {
      if (failed != null) 'Failed': failed,
      if (pending != null) 'Pending': pending,
      if (succeeded != null) 'Succeeded': succeeded,
    };
  }
}

class UntagOutput {
  /// The ARN of the resource group from which tags have been removed.
  final String? arn;

  /// The keys of the tags that were removed.
  final List<String>? keys;

  UntagOutput({
    this.arn,
    this.keys,
  });

  factory UntagOutput.fromJson(Map<String, dynamic> json) {
    return UntagOutput(
      arn: json['Arn'] as String?,
      keys: (json['Keys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final keys = this.keys;
    return {
      if (arn != null) 'Arn': arn,
      if (keys != null) 'Keys': keys,
    };
  }
}

class UpdateGroupOutput {
  /// The update description of the resource group.
  final Group? group;

  UpdateGroupOutput({
    this.group,
  });

  factory UpdateGroupOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGroupOutput(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    return {
      if (group != null) 'Group': group,
    };
  }
}

class UpdateGroupQueryOutput {
  /// The updated resource query associated with the resource group after the
  /// update.
  final GroupQuery? groupQuery;

  UpdateGroupQueryOutput({
    this.groupQuery,
  });

  factory UpdateGroupQueryOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGroupQueryOutput(
      groupQuery: json['GroupQuery'] != null
          ? GroupQuery.fromJson(json['GroupQuery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final groupQuery = this.groupQuery;
    return {
      if (groupQuery != null) 'GroupQuery': groupQuery,
    };
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class MethodNotAllowedException extends _s.GenericAwsException {
  MethodNotAllowedException({String? type, String? message})
      : super(type: type, code: 'MethodNotAllowedException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
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
