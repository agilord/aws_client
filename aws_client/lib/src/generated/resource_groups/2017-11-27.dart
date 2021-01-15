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

part '2017-11-27.g.dart';

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
    @_s.required String name,
    List<GroupConfigurationItem> configuration,
    String description,
    ResourceQuery resourceQuery,
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
    String group,
    String groupName,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringPattern(
      'group',
      group,
      r'''(arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/)?[a-zA-Z0-9_\.-]{1,128}''',
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
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
    String group,
    String groupName,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringPattern(
      'group',
      group,
      r'''(arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/)?[a-zA-Z0-9_\.-]{1,128}''',
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
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
    String group,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringPattern(
      'group',
      group,
      r'''(arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/)?[a-zA-Z0-9_\.-]{1,128}''',
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
    String group,
    String groupName,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringPattern(
      'group',
      group,
      r'''(arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/)?[a-zA-Z0-9_\.-]{1,128}''',
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
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
      r'''arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/[a-zA-Z0-9_\.-]{1,128}''',
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
    @_s.required String group,
    @_s.required List<String> resourceArns,
  }) async {
    ArgumentError.checkNotNull(group, 'group');
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'group',
      group,
      r'''(arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/)?[a-zA-Z0-9_\.-]{1,128}''',
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
    List<ResourceFilter> filters,
    String group,
    String groupName,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringPattern(
      'group',
      group,
      r'''(arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/)?[a-zA-Z0-9_\.-]{1,128}''',
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
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
    List<GroupConfigurationItem> configuration,
    String group,
  }) async {
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringPattern(
      'group',
      group,
      r'''(arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/)?[a-zA-Z0-9_\.-]{1,128}''',
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
    return PutGroupConfigurationOutput.fromJson(response);
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
      r'''arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/[a-zA-Z0-9_\.-]{1,128}''',
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
    @_s.required String group,
    @_s.required List<String> resourceArns,
  }) async {
    ArgumentError.checkNotNull(group, 'group');
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'group',
      group,
      r'''(arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/)?[a-zA-Z0-9_\.-]{1,128}''',
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
      r'''arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/[a-zA-Z0-9_\.-]{1,128}''',
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
    String description,
    String group,
    String groupName,
  }) async {
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
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringPattern(
      'group',
      group,
      r'''(arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/)?[a-zA-Z0-9_\.-]{1,128}''',
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
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
    @_s.required ResourceQuery resourceQuery,
    String group,
    String groupName,
  }) async {
    ArgumentError.checkNotNull(resourceQuery, 'resourceQuery');
    _s.validateStringLength(
      'group',
      group,
      1,
      1600,
    );
    _s.validateStringPattern(
      'group',
      group,
      r'''(arn:aws(-[a-z]+)*:resource-groups:[a-z]{2}(-[a-z]+)+-\d{1}:[0-9]{12}:group/)?[a-zA-Z0-9_\.-]{1,128}''',
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[a-zA-Z0-9_\.-]+''',
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGroupOutput {
  /// The description of the resource group.
  @_s.JsonKey(name: 'Group')
  final Group group;

  /// The service configuration associated with the resource group. For details
  /// about the syntax of a service configuration, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
  /// configurations for resource groups</a>.
  @_s.JsonKey(name: 'GroupConfiguration')
  final GroupConfiguration groupConfiguration;

  /// The resource query associated with the group. For more information about
  /// resource queries, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create
  /// a tag-based group in Resource Groups</a>.
  @_s.JsonKey(name: 'ResourceQuery')
  final ResourceQuery resourceQuery;

  /// The tags associated with the group.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  CreateGroupOutput({
    this.group,
    this.groupConfiguration,
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

/// A resource that failed to be added to or removed from a group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedResource {
  /// The error code associated with the failure.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message text associated with the failure.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The ARN of the resource that failed to be added or removed.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  FailedResource({
    this.errorCode,
    this.errorMessage,
    this.resourceArn,
  });
  factory FailedResource.fromJson(Map<String, dynamic> json) =>
      _$FailedResourceFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGroupConfigurationOutput {
  /// The service configuration associated with the specified group. For details
  /// about the service configuration syntax, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
  /// configurations for resource groups</a>.
  @_s.JsonKey(name: 'GroupConfiguration')
  final GroupConfiguration groupConfiguration;

  GetGroupConfigurationOutput({
    this.groupConfiguration,
  });
  factory GetGroupConfigurationOutput.fromJson(Map<String, dynamic> json) =>
      _$GetGroupConfigurationOutputFromJson(json);
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
  /// The resource query associated with the specified group. For more information
  /// about resource queries, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create
  /// a tag-based group in Resource Groups</a>.
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Group {
  /// The ARN of the resource group.
  @_s.JsonKey(name: 'GroupArn')
  final String groupArn;

  /// The name of the resource group.
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

/// A service configuration associated with a resource group. The configuration
/// options are determined by the AWS service that defines the
/// <code>Type</code>, and specifies which resources can be included in the
/// group. You can add a service configuration when you create the group by
/// using <a>CreateGroup</a>, or later by using the <a>PutGroupConfiguration</a>
/// operation. For details about group service configuration syntax, see <a
/// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
/// configurations for resource groups</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupConfiguration {
  /// The configuration currently associated with the group and in effect.
  @_s.JsonKey(name: 'Configuration')
  final List<GroupConfigurationItem> configuration;

  /// If present, the reason why a request to update the group configuration
  /// failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// If present, the new configuration that is in the process of being applied to
  /// the group.
  @_s.JsonKey(name: 'ProposedConfiguration')
  final List<GroupConfigurationItem> proposedConfiguration;

  /// The current status of an attempt to update the group configuration.
  @_s.JsonKey(name: 'Status')
  final GroupConfigurationStatus status;

  GroupConfiguration({
    this.configuration,
    this.failureReason,
    this.proposedConfiguration,
    this.status,
  });
  factory GroupConfiguration.fromJson(Map<String, dynamic> json) =>
      _$GroupConfigurationFromJson(json);
}

/// An item in a group configuration. A group service configuration can have one
/// or more items. For details about group service configuration syntax, see <a
/// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
/// configurations for resource groups</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GroupConfigurationItem {
  /// Specifies the type of group configuration item. Each item must have a unique
  /// value for <code>type</code>. For the list of types that you can specify for
  /// a configuration item, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html#about-slg-types">Supported
  /// resource types and parameters</a>.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// A collection of parameters for this group configuration item. For the list
  /// of parameters that you can use with each configuration item type, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html#about-slg-types">Supported
  /// resource types and parameters</a>.
  @_s.JsonKey(name: 'Parameters')
  final List<GroupConfigurationParameter> parameters;

  GroupConfigurationItem({
    @_s.required this.type,
    this.parameters,
  });
  factory GroupConfigurationItem.fromJson(Map<String, dynamic> json) =>
      _$GroupConfigurationItemFromJson(json);

  Map<String, dynamic> toJson() => _$GroupConfigurationItemToJson(this);
}

/// A parameter for a group configuration item. For details about group service
/// configuration syntax, see <a
/// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service
/// configurations for resource groups</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GroupConfigurationParameter {
  /// The name of the group configuration parameter. For the list of parameters
  /// that you can use with each configuration item type, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html#about-slg-types">Supported
  /// resource types and parameters</a>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value or values to be used for the specified parameter. For the list of
  /// values you can use with each parameter, see <a
  /// href="https://docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html#about-slg-types">Supported
  /// resource types and parameters</a>.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  GroupConfigurationParameter({
    @_s.required this.name,
    this.values,
  });
  factory GroupConfigurationParameter.fromJson(Map<String, dynamic> json) =>
      _$GroupConfigurationParameterFromJson(json);

  Map<String, dynamic> toJson() => _$GroupConfigurationParameterToJson(this);
}

enum GroupConfigurationStatus {
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('UPDATE_COMPLETE')
  updateComplete,
  @_s.JsonValue('UPDATE_FAILED')
  updateFailed,
}

/// A filter collection that you can use to restrict the results from a
/// <code>List</code> operation to only those you want to include.
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
  @_s.JsonValue('configuration-type')
  configurationType,
}

/// The unique identifiers for a resource group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupIdentifier {
  /// The ARN of the resource group.
  @_s.JsonKey(name: 'GroupArn')
  final String groupArn;

  /// The name of the resource group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  GroupIdentifier({
    this.groupArn,
    this.groupName,
  });
  factory GroupIdentifier.fromJson(Map<String, dynamic> json) =>
      _$GroupIdentifierFromJson(json);
}

/// A mapping of a query attached to a resource group that determines the AWS
/// resources that are members of the group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupQuery {
  /// The name of the resource group that is associated with the specified
  /// resource query.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The resource query that determines which AWS resources are members of the
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
class GroupResourcesOutput {
  /// A list of ARNs of any resources that failed to be added to the group by this
  /// operation.
  @_s.JsonKey(name: 'Failed')
  final List<FailedResource> failed;

  /// A list of ARNs of any resources that are still in the process of being added
  /// to the group by this operation. These pending additions continue
  /// asynchronously. You can check the status of pending additions by using the
  /// <code> <a>ListGroupResources</a> </code> operation, and checking the
  /// <code>Resources</code> array in the response and the <code>Status</code>
  /// field of each object in that array.
  @_s.JsonKey(name: 'Pending')
  final List<PendingResource> pending;

  /// A list of ARNs of resources that were successfully added to the group by
  /// this operation.
  @_s.JsonKey(name: 'Succeeded')
  final List<String> succeeded;

  GroupResourcesOutput({
    this.failed,
    this.pending,
    this.succeeded,
  });
  factory GroupResourcesOutput.fromJson(Map<String, dynamic> json) =>
      _$GroupResourcesOutputFromJson(json);
}

/// A structure returned by the <a>ListGroupResources</a> operation that
/// contains identity and group membership status information for one of the
/// resources in the group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupResourcesItem {
  @_s.JsonKey(name: 'Identifier')
  final ResourceIdentifier identifier;

  /// A structure that contains the status of this resource's membership in the
  /// group.
  /// <note>
  /// This field is present in the response only if the group is of type
  /// <code>AWS::EC2::HostManagement</code>.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  ListGroupResourcesItem({
    this.identifier,
    this.status,
  });
  factory ListGroupResourcesItem.fromJson(Map<String, dynamic> json) =>
      _$ListGroupResourcesItemFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupResourcesOutput {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>QueryError</code> objects. Each error is an object that
  /// contains <code>ErrorCode</code> and <code>Message</code> structures.
  /// Possible values for <code>ErrorCode</code> are
  /// <code>CLOUDFORMATION_STACK_INACTIVE</code> and
  /// <code>CLOUDFORMATION_STACK_NOT_EXISTING</code>.
  @_s.JsonKey(name: 'QueryErrors')
  final List<QueryError> queryErrors;

  /// <important>
  /// <b> <i>Deprecated - don't use this parameter. Use the <code>Resources</code>
  /// response field instead.</i> </b>
  /// </important>
  @_s.JsonKey(name: 'ResourceIdentifiers')
  final List<ResourceIdentifier> resourceIdentifiers;

  /// An array of resources from which you can determine each resource's identity,
  /// type, and group membership status.
  @_s.JsonKey(name: 'Resources')
  final List<ListGroupResourcesItem> resources;

  ListGroupResourcesOutput({
    this.nextToken,
    this.queryErrors,
    this.resourceIdentifiers,
    this.resources,
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
  /// A list of <a>GroupIdentifier</a> objects. Each identifier is an object that
  /// contains both the <code>Name</code> and the <code>GroupArn</code>.
  @_s.JsonKey(name: 'GroupIdentifiers')
  final List<GroupIdentifier> groupIdentifiers;

  /// <important>
  /// <i> <b>Deprecated - don't use this field. Use the
  /// <code>GroupIdentifiers</code> response field instead.</b> </i>
  /// </important>
  @_s.JsonKey(name: 'Groups')
  final List<Group> groups;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
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

/// A structure that identifies a resource that is currently pending addition to
/// the group as a member. Adding a resource to a resource group happens
/// asynchronously as a background task and this one isn't completed yet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PendingResource {
  /// The Amazon resource name (ARN) of the resource that's in a pending state.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  PendingResource({
    this.resourceArn,
  });
  factory PendingResource.fromJson(Map<String, dynamic> json) =>
      _$PendingResourceFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutGroupConfigurationOutput {
  PutGroupConfigurationOutput();
  factory PutGroupConfigurationOutput.fromJson(Map<String, dynamic> json) =>
      _$PutGroupConfigurationOutputFromJson(json);
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

/// A structure that contains the ARN of a resource and its resource type.
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceQuery {
  /// The query that defines a group or a search.
  @_s.JsonKey(name: 'Query')
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

/// A structure that identifies the current group membership status for a
/// resource. Adding a resource to a resource group is performed asynchronously
/// as a background task. A <code>PENDING</code> status indicates, for this
/// resource, that the process isn't completed yet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceStatus {
  /// The current status.
  @_s.JsonKey(name: 'Name')
  final ResourceStatusValue name;

  ResourceStatus({
    this.name,
  });
  factory ResourceStatus.fromJson(Map<String, dynamic> json) =>
      _$ResourceStatusFromJson(json);
}

enum ResourceStatusValue {
  @_s.JsonValue('PENDING')
  pending,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchResourcesOutput {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
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

  /// The tags that have been added to the specified resource group.
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
class UngroupResourcesOutput {
  /// A list of any resources that failed to be removed from the group by this
  /// operation.
  @_s.JsonKey(name: 'Failed')
  final List<FailedResource> failed;

  /// A list of any resources that are still in the process of being removed from
  /// the group by this operation. These pending removals continue asynchronously.
  /// You can check the status of pending removals by using the <code>
  /// <a>ListGroupResources</a> </code> operation. After the resource is
  /// successfully removed, it no longer appears in the response.
  @_s.JsonKey(name: 'Pending')
  final List<PendingResource> pending;

  /// A list of resources that were successfully removed from the group by this
  /// operation.
  @_s.JsonKey(name: 'Succeeded')
  final List<String> succeeded;

  UngroupResourcesOutput({
    this.failed,
    this.pending,
    this.succeeded,
  });
  factory UngroupResourcesOutput.fromJson(Map<String, dynamic> json) =>
      _$UngroupResourcesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagOutput {
  /// The ARN of the resource group from which tags have been removed.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The keys of the tags that were removed.
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
  /// The update description of the resource group.
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
  /// The updated resource query associated with the resource group after the
  /// update.
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
