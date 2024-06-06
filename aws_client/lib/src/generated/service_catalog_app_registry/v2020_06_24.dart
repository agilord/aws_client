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

/// Amazon Web Services Service Catalog AppRegistry enables organizations to
/// understand the application context of their Amazon Web Services resources.
/// AppRegistry provides a repository of your applications, their resources, and
/// the application metadata that you use within your enterprise.
class AppRegistry {
  final _s.RestJsonProtocol _protocol;
  AppRegistry({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'servicecatalog-appregistry',
            signingName: 'servicecatalog',
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

  /// Associates an attribute group with an application to augment the
  /// application's metadata with the group's attributes. This feature enables
  /// applications to be described with user-defined details that are
  /// machine-readable, such as third-party integrations.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [application] :
  /// The name, ID, or ARN of the application.
  ///
  /// Parameter [attributeGroup] :
  /// The name, ID, or ARN of the attribute group that holds the attributes to
  /// describe the application.
  Future<AssociateAttributeGroupResponse> associateAttributeGroup({
    required String application,
    required String attributeGroup,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(application)}/attribute-groups/${Uri.encodeComponent(attributeGroup)}',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateAttributeGroupResponse.fromJson(response);
  }

  /// Associates a resource with an application. The resource can be specified
  /// by its ARN or name. The application can be specified by ARN, ID, or name.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// You must have the following permissions to associate a resource using the
  /// <code>OPTIONS</code> parameter set to <code>APPLY_APPLICATION_TAG</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>tag:GetResources</code>
  /// </li>
  /// <li>
  /// <code>tag:TagResources</code>
  /// </li>
  /// </ul>
  /// You must also have these additional permissions if you don't use the
  /// <code>AWSServiceCatalogAppRegistryFullAccess</code> policy. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/servicecatalog/latest/arguide/full.html">AWSServiceCatalogAppRegistryFullAccess</a>
  /// in the AppRegistry Administrator Guide.
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:AssociateResource</code>
  /// </li>
  /// <li>
  /// <code>cloudformation:UpdateStack</code>
  /// </li>
  /// <li>
  /// <code>cloudformation:DescribeStacks</code>
  /// </li>
  /// </ul> <note>
  /// In addition, you must have the tagging permission defined by the Amazon
  /// Web Services service that creates the resource. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_TagResources.html">TagResources</a>
  /// in the <i>Resource Groups Tagging API Reference</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [application] :
  /// The name, ID, or ARN of the application.
  ///
  /// Parameter [resource] :
  /// The name or ID of the resource of which the application will be
  /// associated.
  ///
  /// Parameter [resourceType] :
  /// The type of resource of which the application will be associated.
  ///
  /// Parameter [options] :
  /// Determines whether an application tag is applied or skipped.
  Future<AssociateResourceResponse> associateResource({
    required String application,
    required String resource,
    required ResourceType resourceType,
    List<AssociationOption>? options,
  }) async {
    final $payload = <String, dynamic>{
      if (options != null) 'options': options.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(application)}/resources/${Uri.encodeComponent(resourceType.toValue())}/${Uri.encodeComponent(resource)}',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateResourceResponse.fromJson(response);
  }

  /// Creates a new application that is the top-level node in a hierarchy of
  /// related cloud resource abstractions.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the application. The name must be unique in the region in
  /// which you are creating the application.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you provide to ensure idempotency. If you retry a
  /// request that completed successfully using the same client token and the
  /// same parameters, the retry succeeds without performing any further
  /// actions. If you retry a successful request using the same client token,
  /// but one or more of the parameters are different, the retry fails.
  ///
  /// Parameter [description] :
  /// The description of the application.
  ///
  /// Parameter [tags] :
  /// Key-value pairs you can use to associate with the application.
  Future<CreateApplicationResponse> createApplication({
    required String name,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationResponse.fromJson(response);
  }

  /// Creates a new attribute group as a container for user-defined attributes.
  /// This feature enables users to have full control over their cloud
  /// application's metadata in a rich machine-readable format to facilitate
  /// integration with automated workflows and third-party tools.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attributes] :
  /// A JSON string in the form of nested key-value pairs that represent the
  /// attributes in the group and describes an application and its components.
  ///
  /// Parameter [name] :
  /// The name of the attribute group.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you provide to ensure idempotency. If you retry a
  /// request that completed successfully using the same client token and the
  /// same parameters, the retry succeeds without performing any further
  /// actions. If you retry a successful request using the same client token,
  /// but one or more of the parameters are different, the retry fails.
  ///
  /// Parameter [description] :
  /// The description of the attribute group that the user provides.
  ///
  /// Parameter [tags] :
  /// Key-value pairs you can use to associate with the attribute group.
  Future<CreateAttributeGroupResponse> createAttributeGroup({
    required String attributes,
    required String name,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'attributes': attributes,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/attribute-groups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAttributeGroupResponse.fromJson(response);
  }

  /// Deletes an application that is specified either by its application ID,
  /// name, or ARN. All associated attribute groups and resources must be
  /// disassociated from it before deleting an application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The name, ID, or ARN of the application.
  Future<DeleteApplicationResponse> deleteApplication({
    required String application,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/applications/${Uri.encodeComponent(application)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteApplicationResponse.fromJson(response);
  }

  /// Deletes an attribute group, specified either by its attribute group ID,
  /// name, or ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attributeGroup] :
  /// The name, ID, or ARN of the attribute group that holds the attributes to
  /// describe the application.
  Future<DeleteAttributeGroupResponse> deleteAttributeGroup({
    required String attributeGroup,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/attribute-groups/${Uri.encodeComponent(attributeGroup)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAttributeGroupResponse.fromJson(response);
  }

  /// Disassociates an attribute group from an application to remove the extra
  /// attributes contained in the attribute group from the application's
  /// metadata. This operation reverts <code>AssociateAttributeGroup</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The name, ID, or ARN of the application.
  ///
  /// Parameter [attributeGroup] :
  /// The name, ID, or ARN of the attribute group that holds the attributes to
  /// describe the application.
  Future<DisassociateAttributeGroupResponse> disassociateAttributeGroup({
    required String application,
    required String attributeGroup,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(application)}/attribute-groups/${Uri.encodeComponent(attributeGroup)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateAttributeGroupResponse.fromJson(response);
  }

  /// Disassociates a resource from application. Both the resource and the
  /// application can be specified either by ID or name.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// You must have the following permissions to remove a resource that's been
  /// associated with an application using the
  /// <code>APPLY_APPLICATION_TAG</code> option for <a
  /// href="https://docs.aws.amazon.com/servicecatalog/latest/dg/API_app-registry_AssociateResource.html">AssociateResource</a>.
  ///
  /// <ul>
  /// <li>
  /// <code>tag:GetResources</code>
  /// </li>
  /// <li>
  /// <code>tag:UntagResources</code>
  /// </li>
  /// </ul>
  /// You must also have the following permissions if you don't use the
  /// <code>AWSServiceCatalogAppRegistryFullAccess</code> policy. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/servicecatalog/latest/arguide/full.html">AWSServiceCatalogAppRegistryFullAccess</a>
  /// in the AppRegistry Administrator Guide.
  ///
  /// <ul>
  /// <li>
  /// <code>resource-groups:DisassociateResource</code>
  /// </li>
  /// <li>
  /// <code>cloudformation:UpdateStack</code>
  /// </li>
  /// <li>
  /// <code>cloudformation:DescribeStacks</code>
  /// </li>
  /// </ul> <note>
  /// In addition, you must have the tagging permission defined by the Amazon
  /// Web Services service that creates the resource. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_UntTagResources.html">UntagResources</a>
  /// in the <i>Resource Groups Tagging API Reference</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [application] :
  /// The name or ID of the application.
  ///
  /// Parameter [resource] :
  /// The name or ID of the resource.
  ///
  /// Parameter [resourceType] :
  /// The type of the resource that is being disassociated.
  Future<DisassociateResourceResponse> disassociateResource({
    required String application,
    required String resource,
    required ResourceType resourceType,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(application)}/resources/${Uri.encodeComponent(resourceType.toValue())}/${Uri.encodeComponent(resource)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateResourceResponse.fromJson(response);
  }

  /// Retrieves metadata information about one of your applications. The
  /// application can be specified by its ARN, ID, or name (which is unique
  /// within one account in one region at a given point in time). Specify by ARN
  /// or ID in automated workflows if you want to make sure that the exact same
  /// application is returned or a <code>ResourceNotFoundException</code> is
  /// thrown, avoiding the ABA addressing problem.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [application] :
  /// The name, ID, or ARN of the application.
  Future<GetApplicationResponse> getApplication({
    required String application,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(application)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationResponse.fromJson(response);
  }

  /// Gets the resource associated with the application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The name, ID, or ARN of the application.
  ///
  /// Parameter [resource] :
  /// The name or ID of the resource associated with the application.
  ///
  /// Parameter [resourceType] :
  /// The type of resource associated with the application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. If the parameter is omitted, it
  /// defaults to 25. The value is optional.
  ///
  /// Parameter [nextToken] :
  /// A unique pagination token for each page of results. Make the call again
  /// with the returned token to retrieve the next page of results.
  ///
  /// Parameter [resourceTagStatus] :
  /// States whether an application tag is applied, not applied, in the process
  /// of being applied, or skipped.
  Future<GetAssociatedResourceResponse> getAssociatedResource({
    required String application,
    required String resource,
    required ResourceType resourceType,
    int? maxResults,
    String? nextToken,
    List<ResourceItemStatus>? resourceTagStatus,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceTagStatus != null)
        'resourceTagStatus': resourceTagStatus.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(application)}/resources/${Uri.encodeComponent(resourceType.toValue())}/${Uri.encodeComponent(resource)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAssociatedResourceResponse.fromJson(response);
  }

  /// Retrieves an attribute group by its ARN, ID, or name. The attribute group
  /// can be specified by its ARN, ID, or name.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [attributeGroup] :
  /// The name, ID, or ARN of the attribute group that holds the attributes to
  /// describe the application.
  Future<GetAttributeGroupResponse> getAttributeGroup({
    required String attributeGroup,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/attribute-groups/${Uri.encodeComponent(attributeGroup)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAttributeGroupResponse.fromJson(response);
  }

  /// Retrieves a <code>TagKey</code> configuration from an account.
  ///
  /// May throw [InternalServerException].
  Future<GetConfigurationResponse> getConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfigurationResponse.fromJson(response);
  }

  /// Retrieves a list of all of your applications. Results are paginated.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The upper bound of the number of results to return (cannot exceed 25). If
  /// this parameter is omitted, it defaults to 25. This value is optional.
  ///
  /// Parameter [nextToken] :
  /// The token to use to get the next page of results after a previous API
  /// call.
  Future<ListApplicationsResponse> listApplications({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsResponse.fromJson(response);
  }

  /// Lists all attribute groups that are associated with specified application.
  /// Results are paginated.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The name or ID of the application.
  ///
  /// Parameter [maxResults] :
  /// The upper bound of the number of results to return (cannot exceed 25). If
  /// this parameter is omitted, it defaults to 25. This value is optional.
  ///
  /// Parameter [nextToken] :
  /// The token to use to get the next page of results after a previous API
  /// call.
  Future<ListAssociatedAttributeGroupsResponse> listAssociatedAttributeGroups({
    required String application,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(application)}/attribute-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssociatedAttributeGroupsResponse.fromJson(response);
  }

  /// Lists all of the resources that are associated with the specified
  /// application. Results are paginated.
  /// <note>
  /// If you share an application, and a consumer account associates a tag query
  /// to the application, all of the users who can access the application can
  /// also view the tag values in all accounts that are associated with it using
  /// this API.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The name, ID, or ARN of the application.
  ///
  /// Parameter [maxResults] :
  /// The upper bound of the number of results to return (cannot exceed 25). If
  /// this parameter is omitted, it defaults to 25. This value is optional.
  ///
  /// Parameter [nextToken] :
  /// The token to use to get the next page of results after a previous API
  /// call.
  Future<ListAssociatedResourcesResponse> listAssociatedResources({
    required String application,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(application)}/resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssociatedResourcesResponse.fromJson(response);
  }

  /// Lists all attribute groups which you have access to. Results are
  /// paginated.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The upper bound of the number of results to return (cannot exceed 25). If
  /// this parameter is omitted, it defaults to 25. This value is optional.
  ///
  /// Parameter [nextToken] :
  /// The token to use to get the next page of results after a previous API
  /// call.
  Future<ListAttributeGroupsResponse> listAttributeGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/attribute-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAttributeGroupsResponse.fromJson(response);
  }

  /// Lists the details of all attribute groups associated with a specific
  /// application. The results display in pages.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The name or ID of the application.
  ///
  /// Parameter [maxResults] :
  /// The upper bound of the number of results to return. The value cannot
  /// exceed 25. If you omit this parameter, it defaults to 25. This value is
  /// optional.
  ///
  /// Parameter [nextToken] :
  /// This token retrieves the next page of results after a previous API call.
  Future<ListAttributeGroupsForApplicationResponse>
      listAttributeGroupsForApplication({
    required String application,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(application)}/attribute-group-details',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAttributeGroupsForApplicationResponse.fromJson(response);
  }

  /// Lists all of the tags on the resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon resource name (ARN) that specifies the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Associates a <code>TagKey</code> configuration to an account.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuration] :
  /// Associates a <code>TagKey</code> configuration to an account.
  Future<void> putConfiguration({
    required AppRegistryConfiguration configuration,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Syncs the resource with current AppRegistry records.
  ///
  /// Specifically, the resource’s AppRegistry system tags sync with its
  /// associated application. We remove the resource's AppRegistry system tags
  /// if it does not associate with the application. The caller must have
  /// permissions to read and update the resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resource] :
  /// An entity you can work with and specify with a name or ID. Examples
  /// include an Amazon EC2 instance, an Amazon Web Services CloudFormation
  /// stack, or an Amazon S3 bucket.
  ///
  /// Parameter [resourceType] :
  /// The type of resource of which the application will be associated.
  Future<SyncResourceResponse> syncResource({
    required String resource,
    required ResourceType resourceType,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/sync/${Uri.encodeComponent(resourceType.toValue())}/${Uri.encodeComponent(resource)}',
      exceptionFnMap: _exceptionFns,
    );
    return SyncResourceResponse.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified resource.
  ///
  /// Each tag consists of a key and an optional value. If a tag with the same
  /// key is already associated with the resource, this action updates its
  /// value.
  ///
  /// This operation returns an empty response if the call was successful.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon resource name (ARN) that specifies the resource.
  ///
  /// Parameter [tags] :
  /// The new or modified tags for the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a resource.
  ///
  /// This operation returns an empty response if the call was successful.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon resource name (ARN) that specifies the resource.
  ///
  /// Parameter [tagKeys] :
  /// A list of the tag keys to remove from the specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing application with new attributes.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [application] :
  /// The name, ID, or ARN of the application that will be updated.
  ///
  /// Parameter [description] :
  /// The new description of the application.
  ///
  /// Parameter [name] :
  /// Deprecated: The new name of the application. The name must be unique in
  /// the region in which you are updating the application. Please do not use
  /// this field as we have stopped supporting name updates.
  Future<UpdateApplicationResponse> updateApplication({
    required String application,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/applications/${Uri.encodeComponent(application)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApplicationResponse.fromJson(response);
  }

  /// Updates an existing attribute group with new details.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attributeGroup] :
  /// The name, ID, or ARN of the attribute group that holds the attributes to
  /// describe the application.
  ///
  /// Parameter [attributes] :
  /// A JSON string in the form of nested key-value pairs that represent the
  /// attributes in the group and describes an application and its components.
  ///
  /// Parameter [description] :
  /// The description of the attribute group that the user provides.
  ///
  /// Parameter [name] :
  /// Deprecated: The new name of the attribute group. The name must be unique
  /// in the region in which you are updating the attribute group. Please do not
  /// use this field as we have stopped supporting name updates.
  Future<UpdateAttributeGroupResponse> updateAttributeGroup({
    required String attributeGroup,
    String? attributes,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (attributes != null) 'attributes': attributes,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/attribute-groups/${Uri.encodeComponent(attributeGroup)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAttributeGroupResponse.fromJson(response);
  }
}

/// Includes all of the AppRegistry settings.
class AppRegistryConfiguration {
  /// Includes the definition of a <code>tagQuery</code>.
  final TagQueryConfiguration? tagQueryConfiguration;

  AppRegistryConfiguration({
    this.tagQueryConfiguration,
  });

  factory AppRegistryConfiguration.fromJson(Map<String, dynamic> json) {
    return AppRegistryConfiguration(
      tagQueryConfiguration: json['tagQueryConfiguration'] != null
          ? TagQueryConfiguration.fromJson(
              json['tagQueryConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tagQueryConfiguration = this.tagQueryConfiguration;
    return {
      if (tagQueryConfiguration != null)
        'tagQueryConfiguration': tagQueryConfiguration,
    };
  }
}

/// Represents a Amazon Web Services Service Catalog AppRegistry application
/// that is the top-level node in a hierarchy of related cloud resource
/// abstractions.
class Application {
  /// A key-value pair that identifies an associated resource.
  final Map<String, String>? applicationTag;

  /// The Amazon resource name (ARN) that specifies the application across
  /// services.
  final String? arn;

  /// The ISO-8601 formatted timestamp of the moment when the application was
  /// created.
  final DateTime? creationTime;

  /// The description of the application.
  final String? description;

  /// The identifier of the application.
  final String? id;

  /// The ISO-8601 formatted timestamp of the moment when the application was last
  /// updated.
  final DateTime? lastUpdateTime;

  /// The name of the application. The name must be unique in the region in which
  /// you are creating the application.
  final String? name;

  /// Key-value pairs you can use to associate with the application.
  final Map<String, String>? tags;

  Application({
    this.applicationTag,
    this.arn,
    this.creationTime,
    this.description,
    this.id,
    this.lastUpdateTime,
    this.name,
    this.tags,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      applicationTag: (json['applicationTag'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationTag = this.applicationTag;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final tags = this.tags;
    return {
      if (applicationTag != null) 'applicationTag': applicationTag,
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastUpdateTime != null)
        'lastUpdateTime': iso8601ToJson(lastUpdateTime),
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Summary of a Amazon Web Services Service Catalog AppRegistry application.
class ApplicationSummary {
  /// The Amazon resource name (ARN) that specifies the application across
  /// services.
  final String? arn;

  /// The ISO-8601 formatted timestamp of the moment when the application was
  /// created.
  final DateTime? creationTime;

  /// The description of the application.
  final String? description;

  /// The identifier of the application.
  final String? id;

  /// The ISO-8601 formatted timestamp of the moment when the application was last
  /// updated.
  final DateTime? lastUpdateTime;

  /// The name of the application. The name must be unique in the region in which
  /// you are creating the application.
  final String? name;

  ApplicationSummary({
    this.arn,
    this.creationTime,
    this.description,
    this.id,
    this.lastUpdateTime,
    this.name,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastUpdateTime != null)
        'lastUpdateTime': iso8601ToJson(lastUpdateTime),
      if (name != null) 'name': name,
    };
  }
}

/// The result of the application tag that's applied to a resource.
class ApplicationTagResult {
  /// The application tag is in the process of being applied to a resource, was
  /// successfully applied to a resource, or failed to apply to a resource.
  final ApplicationTagStatus? applicationTagStatus;

  /// The message returned if the call fails.
  final String? errorMessage;

  /// A unique pagination token for each page of results. Make the call again with
  /// the returned token to retrieve the next page of results.
  final String? nextToken;

  /// The resources associated with an application
  final List<ResourcesListItem>? resources;

  ApplicationTagResult({
    this.applicationTagStatus,
    this.errorMessage,
    this.nextToken,
    this.resources,
  });

  factory ApplicationTagResult.fromJson(Map<String, dynamic> json) {
    return ApplicationTagResult(
      applicationTagStatus:
          (json['applicationTagStatus'] as String?)?.toApplicationTagStatus(),
      errorMessage: json['errorMessage'] as String?,
      nextToken: json['nextToken'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcesListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationTagStatus = this.applicationTagStatus;
    final errorMessage = this.errorMessage;
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (applicationTagStatus != null)
        'applicationTagStatus': applicationTagStatus.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (nextToken != null) 'nextToken': nextToken,
      if (resources != null) 'resources': resources,
    };
  }
}

enum ApplicationTagStatus {
  inProgress,
  success,
  failure,
}

extension ApplicationTagStatusValueExtension on ApplicationTagStatus {
  String toValue() {
    switch (this) {
      case ApplicationTagStatus.inProgress:
        return 'IN_PROGRESS';
      case ApplicationTagStatus.success:
        return 'SUCCESS';
      case ApplicationTagStatus.failure:
        return 'FAILURE';
    }
  }
}

extension ApplicationTagStatusFromString on String {
  ApplicationTagStatus toApplicationTagStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ApplicationTagStatus.inProgress;
      case 'SUCCESS':
        return ApplicationTagStatus.success;
      case 'FAILURE':
        return ApplicationTagStatus.failure;
    }
    throw Exception('$this is not known in enum ApplicationTagStatus');
  }
}

class AssociateAttributeGroupResponse {
  /// The Amazon resource name (ARN) of the application that was augmented with
  /// attributes.
  final String? applicationArn;

  /// The Amazon resource name (ARN) of the attribute group that contains the
  /// application's new attributes.
  final String? attributeGroupArn;

  AssociateAttributeGroupResponse({
    this.applicationArn,
    this.attributeGroupArn,
  });

  factory AssociateAttributeGroupResponse.fromJson(Map<String, dynamic> json) {
    return AssociateAttributeGroupResponse(
      applicationArn: json['applicationArn'] as String?,
      attributeGroupArn: json['attributeGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final attributeGroupArn = this.attributeGroupArn;
    return {
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (attributeGroupArn != null) 'attributeGroupArn': attributeGroupArn,
    };
  }
}

class AssociateResourceResponse {
  /// The Amazon resource name (ARN) of the application that was augmented with
  /// attributes.
  final String? applicationArn;

  /// Determines whether an application tag is applied or skipped.
  final List<AssociationOption>? options;

  /// The Amazon resource name (ARN) that specifies the resource.
  final String? resourceArn;

  AssociateResourceResponse({
    this.applicationArn,
    this.options,
    this.resourceArn,
  });

  factory AssociateResourceResponse.fromJson(Map<String, dynamic> json) {
    return AssociateResourceResponse(
      applicationArn: json['applicationArn'] as String?,
      options: (json['options'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAssociationOption())
          .toList(),
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final options = this.options;
    final resourceArn = this.resourceArn;
    return {
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (options != null) 'options': options.map((e) => e.toValue()).toList(),
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

enum AssociationOption {
  applyApplicationTag,
  skipApplicationTag,
}

extension AssociationOptionValueExtension on AssociationOption {
  String toValue() {
    switch (this) {
      case AssociationOption.applyApplicationTag:
        return 'APPLY_APPLICATION_TAG';
      case AssociationOption.skipApplicationTag:
        return 'SKIP_APPLICATION_TAG';
    }
  }
}

extension AssociationOptionFromString on String {
  AssociationOption toAssociationOption() {
    switch (this) {
      case 'APPLY_APPLICATION_TAG':
        return AssociationOption.applyApplicationTag;
      case 'SKIP_APPLICATION_TAG':
        return AssociationOption.skipApplicationTag;
    }
    throw Exception('$this is not known in enum AssociationOption');
  }
}

/// Represents a Amazon Web Services Service Catalog AppRegistry attribute group
/// that is rich metadata which describes an application and its components.
class AttributeGroup {
  /// The Amazon resource name (ARN) that specifies the attribute group across
  /// services.
  final String? arn;

  /// The ISO-8601 formatted timestamp of the moment the attribute group was
  /// created.
  final DateTime? creationTime;

  /// The description of the attribute group that the user provides.
  final String? description;

  /// The globally unique attribute group identifier of the attribute group.
  final String? id;

  /// The ISO-8601 formatted timestamp of the moment the attribute group was last
  /// updated. This time is the same as the creationTime for a newly created
  /// attribute group.
  final DateTime? lastUpdateTime;

  /// The name of the attribute group.
  final String? name;

  /// Key-value pairs you can use to associate with the attribute group.
  final Map<String, String>? tags;

  AttributeGroup({
    this.arn,
    this.creationTime,
    this.description,
    this.id,
    this.lastUpdateTime,
    this.name,
    this.tags,
  });

  factory AttributeGroup.fromJson(Map<String, dynamic> json) {
    return AttributeGroup(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastUpdateTime != null)
        'lastUpdateTime': iso8601ToJson(lastUpdateTime),
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The details related to a specific AttributeGroup.
class AttributeGroupDetails {
  /// The Amazon resource name (ARN) that specifies the attribute group.
  final String? arn;

  /// The service principal that created the attribute group.
  final String? createdBy;

  /// The unique identifier of the attribute group.
  final String? id;

  /// <important>
  /// This field is no longer supported. We recommend you don't use the field when
  /// using <code>ListAttributeGroupsForApplication</code>.
  /// </important>
  /// The name of the attribute group.
  final String? name;

  AttributeGroupDetails({
    this.arn,
    this.createdBy,
    this.id,
    this.name,
  });

  factory AttributeGroupDetails.fromJson(Map<String, dynamic> json) {
    return AttributeGroupDetails(
      arn: json['arn'] as String?,
      createdBy: json['createdBy'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdBy != null) 'createdBy': createdBy,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

/// Summary of a Amazon Web Services Service Catalog AppRegistry attribute
/// group.
class AttributeGroupSummary {
  /// The Amazon resource name (ARN) that specifies the attribute group across
  /// services.
  final String? arn;

  /// The service principal that created the attribute group.
  final String? createdBy;

  /// The ISO-8601 formatted timestamp of the moment the attribute group was
  /// created.
  final DateTime? creationTime;

  /// The description of the attribute group that the user provides.
  final String? description;

  /// The globally unique attribute group identifier of the attribute group.
  final String? id;

  /// The ISO-8601 formatted timestamp of the moment the attribute group was last
  /// updated. This time is the same as the creationTime for a newly created
  /// attribute group.
  final DateTime? lastUpdateTime;

  /// The name of the attribute group.
  final String? name;

  AttributeGroupSummary({
    this.arn,
    this.createdBy,
    this.creationTime,
    this.description,
    this.id,
    this.lastUpdateTime,
    this.name,
  });

  factory AttributeGroupSummary.fromJson(Map<String, dynamic> json) {
    return AttributeGroupSummary(
      arn: json['arn'] as String?,
      createdBy: json['createdBy'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdBy != null) 'createdBy': createdBy,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastUpdateTime != null)
        'lastUpdateTime': iso8601ToJson(lastUpdateTime),
      if (name != null) 'name': name,
    };
  }
}

class CreateApplicationResponse {
  /// Information about the application.
  final Application? application;

  CreateApplicationResponse({
    this.application,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      application: json['application'] != null
          ? Application.fromJson(json['application'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    return {
      if (application != null) 'application': application,
    };
  }
}

class CreateAttributeGroupResponse {
  /// Information about the attribute group.
  final AttributeGroup? attributeGroup;

  CreateAttributeGroupResponse({
    this.attributeGroup,
  });

  factory CreateAttributeGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateAttributeGroupResponse(
      attributeGroup: json['attributeGroup'] != null
          ? AttributeGroup.fromJson(
              json['attributeGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeGroup = this.attributeGroup;
    return {
      if (attributeGroup != null) 'attributeGroup': attributeGroup,
    };
  }
}

class DeleteApplicationResponse {
  /// Information about the deleted application.
  final ApplicationSummary? application;

  DeleteApplicationResponse({
    this.application,
  });

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteApplicationResponse(
      application: json['application'] != null
          ? ApplicationSummary.fromJson(
              json['application'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    return {
      if (application != null) 'application': application,
    };
  }
}

class DeleteAttributeGroupResponse {
  /// Information about the deleted attribute group.
  final AttributeGroupSummary? attributeGroup;

  DeleteAttributeGroupResponse({
    this.attributeGroup,
  });

  factory DeleteAttributeGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAttributeGroupResponse(
      attributeGroup: json['attributeGroup'] != null
          ? AttributeGroupSummary.fromJson(
              json['attributeGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeGroup = this.attributeGroup;
    return {
      if (attributeGroup != null) 'attributeGroup': attributeGroup,
    };
  }
}

class DisassociateAttributeGroupResponse {
  /// The Amazon resource name (ARN) that specifies the application.
  final String? applicationArn;

  /// The Amazon resource name (ARN) that specifies the attribute group.
  final String? attributeGroupArn;

  DisassociateAttributeGroupResponse({
    this.applicationArn,
    this.attributeGroupArn,
  });

  factory DisassociateAttributeGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateAttributeGroupResponse(
      applicationArn: json['applicationArn'] as String?,
      attributeGroupArn: json['attributeGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final attributeGroupArn = this.attributeGroupArn;
    return {
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (attributeGroupArn != null) 'attributeGroupArn': attributeGroupArn,
    };
  }
}

class DisassociateResourceResponse {
  /// The Amazon resource name (ARN) that specifies the application.
  final String? applicationArn;

  /// The Amazon resource name (ARN) that specifies the resource.
  final String? resourceArn;

  DisassociateResourceResponse({
    this.applicationArn,
    this.resourceArn,
  });

  factory DisassociateResourceResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateResourceResponse(
      applicationArn: json['applicationArn'] as String?,
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final resourceArn = this.resourceArn;
    return {
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

class GetApplicationResponse {
  /// A key-value pair that identifies an associated resource.
  final Map<String, String>? applicationTag;

  /// The Amazon resource name (ARN) that specifies the application across
  /// services.
  final String? arn;

  /// The number of top-level resources that were registered as part of this
  /// application.
  final int? associatedResourceCount;

  /// The ISO-8601 formatted timestamp of the moment when the application was
  /// created.
  final DateTime? creationTime;

  /// The description of the application.
  final String? description;

  /// The identifier of the application.
  final String? id;

  /// The information about the integration of the application with other
  /// services, such as Resource Groups.
  final Integrations? integrations;

  /// The ISO-8601 formatted timestamp of the moment when the application was last
  /// updated.
  final DateTime? lastUpdateTime;

  /// The name of the application. The name must be unique in the region in which
  /// you are creating the application.
  final String? name;

  /// Key-value pairs associated with the application.
  final Map<String, String>? tags;

  GetApplicationResponse({
    this.applicationTag,
    this.arn,
    this.associatedResourceCount,
    this.creationTime,
    this.description,
    this.id,
    this.integrations,
    this.lastUpdateTime,
    this.name,
    this.tags,
  });

  factory GetApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationResponse(
      applicationTag: (json['applicationTag'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      arn: json['arn'] as String?,
      associatedResourceCount: json['associatedResourceCount'] as int?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      integrations: json['integrations'] != null
          ? Integrations.fromJson(json['integrations'] as Map<String, dynamic>)
          : null,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationTag = this.applicationTag;
    final arn = this.arn;
    final associatedResourceCount = this.associatedResourceCount;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final integrations = this.integrations;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final tags = this.tags;
    return {
      if (applicationTag != null) 'applicationTag': applicationTag,
      if (arn != null) 'arn': arn,
      if (associatedResourceCount != null)
        'associatedResourceCount': associatedResourceCount,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (integrations != null) 'integrations': integrations,
      if (lastUpdateTime != null)
        'lastUpdateTime': iso8601ToJson(lastUpdateTime),
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetAssociatedResourceResponse {
  /// The result of the application that's tag applied to a resource.
  final ApplicationTagResult? applicationTagResult;

  /// Determines whether an application tag is applied or skipped.
  final List<AssociationOption>? options;

  /// The resource associated with the application.
  final Resource? resource;

  GetAssociatedResourceResponse({
    this.applicationTagResult,
    this.options,
    this.resource,
  });

  factory GetAssociatedResourceResponse.fromJson(Map<String, dynamic> json) {
    return GetAssociatedResourceResponse(
      applicationTagResult: json['applicationTagResult'] != null
          ? ApplicationTagResult.fromJson(
              json['applicationTagResult'] as Map<String, dynamic>)
          : null,
      options: (json['options'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAssociationOption())
          .toList(),
      resource: json['resource'] != null
          ? Resource.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationTagResult = this.applicationTagResult;
    final options = this.options;
    final resource = this.resource;
    return {
      if (applicationTagResult != null)
        'applicationTagResult': applicationTagResult,
      if (options != null) 'options': options.map((e) => e.toValue()).toList(),
      if (resource != null) 'resource': resource,
    };
  }
}

class GetAttributeGroupResponse {
  /// The Amazon resource name (ARN) that specifies the attribute group across
  /// services.
  final String? arn;

  /// A JSON string in the form of nested key-value pairs that represent the
  /// attributes in the group and describes an application and its components.
  final String? attributes;

  /// The service principal that created the attribute group.
  final String? createdBy;

  /// The ISO-8601 formatted timestamp of the moment the attribute group was
  /// created.
  final DateTime? creationTime;

  /// The description of the attribute group that the user provides.
  final String? description;

  /// The identifier of the attribute group.
  final String? id;

  /// The ISO-8601 formatted timestamp of the moment the attribute group was last
  /// updated. This time is the same as the creationTime for a newly created
  /// attribute group.
  final DateTime? lastUpdateTime;

  /// The name of the attribute group.
  final String? name;

  /// Key-value pairs associated with the attribute group.
  final Map<String, String>? tags;

  GetAttributeGroupResponse({
    this.arn,
    this.attributes,
    this.createdBy,
    this.creationTime,
    this.description,
    this.id,
    this.lastUpdateTime,
    this.name,
    this.tags,
  });

  factory GetAttributeGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetAttributeGroupResponse(
      arn: json['arn'] as String?,
      attributes: json['attributes'] as String?,
      createdBy: json['createdBy'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attributes = this.attributes;
    final createdBy = this.createdBy;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (attributes != null) 'attributes': attributes,
      if (createdBy != null) 'createdBy': createdBy,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastUpdateTime != null)
        'lastUpdateTime': iso8601ToJson(lastUpdateTime),
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetConfigurationResponse {
  /// Retrieves <code>TagKey</code> configuration from an account.
  final AppRegistryConfiguration? configuration;

  GetConfigurationResponse({
    this.configuration,
  });

  factory GetConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetConfigurationResponse(
      configuration: json['configuration'] != null
          ? AppRegistryConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      if (configuration != null) 'configuration': configuration,
    };
  }
}

/// The information about the service integration.
class Integrations {
  final ResourceGroup? applicationTagResourceGroup;

  /// The information about the resource group integration.
  final ResourceGroup? resourceGroup;

  Integrations({
    this.applicationTagResourceGroup,
    this.resourceGroup,
  });

  factory Integrations.fromJson(Map<String, dynamic> json) {
    return Integrations(
      applicationTagResourceGroup: json['applicationTagResourceGroup'] != null
          ? ResourceGroup.fromJson(
              json['applicationTagResourceGroup'] as Map<String, dynamic>)
          : null,
      resourceGroup: json['resourceGroup'] != null
          ? ResourceGroup.fromJson(
              json['resourceGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationTagResourceGroup = this.applicationTagResourceGroup;
    final resourceGroup = this.resourceGroup;
    return {
      if (applicationTagResourceGroup != null)
        'applicationTagResourceGroup': applicationTagResourceGroup,
      if (resourceGroup != null) 'resourceGroup': resourceGroup,
    };
  }
}

class ListApplicationsResponse {
  /// This list of applications.
  final List<ApplicationSummary>? applications;

  /// The token to use to get the next page of results after a previous API call.
  final String? nextToken;

  ListApplicationsResponse({
    this.applications,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applications: (json['applications'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final nextToken = this.nextToken;
    return {
      if (applications != null) 'applications': applications,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssociatedAttributeGroupsResponse {
  /// A list of attribute group IDs.
  final List<String>? attributeGroups;

  /// The token to use to get the next page of results after a previous API call.
  final String? nextToken;

  ListAssociatedAttributeGroupsResponse({
    this.attributeGroups,
    this.nextToken,
  });

  factory ListAssociatedAttributeGroupsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAssociatedAttributeGroupsResponse(
      attributeGroups: (json['attributeGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeGroups = this.attributeGroups;
    final nextToken = this.nextToken;
    return {
      if (attributeGroups != null) 'attributeGroups': attributeGroups,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssociatedResourcesResponse {
  /// The token to use to get the next page of results after a previous API call.
  final String? nextToken;

  /// Information about the resources.
  final List<ResourceInfo>? resources;

  ListAssociatedResourcesResponse({
    this.nextToken,
    this.resources,
  });

  factory ListAssociatedResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListAssociatedResourcesResponse(
      nextToken: json['nextToken'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resources != null) 'resources': resources,
    };
  }
}

class ListAttributeGroupsForApplicationResponse {
  /// The details related to a specific attribute group.
  final List<AttributeGroupDetails>? attributeGroupsDetails;

  /// The token to use to get the next page of results after a previous API call.
  final String? nextToken;

  ListAttributeGroupsForApplicationResponse({
    this.attributeGroupsDetails,
    this.nextToken,
  });

  factory ListAttributeGroupsForApplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAttributeGroupsForApplicationResponse(
      attributeGroupsDetails: (json['attributeGroupsDetails'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeGroupDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeGroupsDetails = this.attributeGroupsDetails;
    final nextToken = this.nextToken;
    return {
      if (attributeGroupsDetails != null)
        'attributeGroupsDetails': attributeGroupsDetails,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAttributeGroupsResponse {
  /// This list of attribute groups.
  final List<AttributeGroupSummary>? attributeGroups;

  /// The token to use to get the next page of results after a previous API call.
  final String? nextToken;

  ListAttributeGroupsResponse({
    this.attributeGroups,
    this.nextToken,
  });

  factory ListAttributeGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListAttributeGroupsResponse(
      attributeGroups: (json['attributeGroups'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeGroups = this.attributeGroups;
    final nextToken = this.nextToken;
    return {
      if (attributeGroups != null) 'attributeGroups': attributeGroups,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags on the resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// The information about the resource.
class Resource {
  /// The Amazon resource name (ARN) of the resource.
  final String? arn;

  /// The time the resource was associated with the application.
  final DateTime? associationTime;

  /// The service integration information about the resource.
  final ResourceIntegrations? integrations;

  /// The name of the resource.
  final String? name;

  Resource({
    this.arn,
    this.associationTime,
    this.integrations,
    this.name,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      arn: json['arn'] as String?,
      associationTime: timeStampFromJson(json['associationTime']),
      integrations: json['integrations'] != null
          ? ResourceIntegrations.fromJson(
              json['integrations'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associationTime = this.associationTime;
    final integrations = this.integrations;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (associationTime != null)
        'associationTime': iso8601ToJson(associationTime),
      if (integrations != null) 'integrations': integrations,
      if (name != null) 'name': name,
    };
  }
}

/// The details related to the resource.
class ResourceDetails {
  /// The value of the tag.
  final String? tagValue;

  ResourceDetails({
    this.tagValue,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      tagValue: json['tagValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tagValue = this.tagValue;
    return {
      if (tagValue != null) 'tagValue': tagValue,
    };
  }
}

/// The information about the resource group integration.
class ResourceGroup {
  /// The Amazon resource name (ARN) of the resource group.
  final String? arn;

  /// The error message that generates when the propagation process for the
  /// resource group fails.
  final String? errorMessage;

  /// The state of the propagation process for the resource group. The states
  /// includes:
  ///
  /// <code>CREATING </code>if the resource group is in the process of being
  /// created.
  ///
  /// <code>CREATE_COMPLETE</code> if the resource group was created successfully.
  ///
  /// <code>CREATE_FAILED</code> if the resource group failed to be created.
  ///
  /// <code>UPDATING</code> if the resource group is in the process of being
  /// updated.
  ///
  /// <code>UPDATE_COMPLETE</code> if the resource group updated successfully.
  ///
  /// <code>UPDATE_FAILED</code> if the resource group could not update
  /// successfully.
  final ResourceGroupState? state;

  ResourceGroup({
    this.arn,
    this.errorMessage,
    this.state,
  });

  factory ResourceGroup.fromJson(Map<String, dynamic> json) {
    return ResourceGroup(
      arn: json['arn'] as String?,
      errorMessage: json['errorMessage'] as String?,
      state: (json['state'] as String?)?.toResourceGroupState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final errorMessage = this.errorMessage;
    final state = this.state;
    return {
      if (arn != null) 'arn': arn,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (state != null) 'state': state.toValue(),
    };
  }
}

enum ResourceGroupState {
  creating,
  createComplete,
  createFailed,
  updating,
  updateComplete,
  updateFailed,
}

extension ResourceGroupStateValueExtension on ResourceGroupState {
  String toValue() {
    switch (this) {
      case ResourceGroupState.creating:
        return 'CREATING';
      case ResourceGroupState.createComplete:
        return 'CREATE_COMPLETE';
      case ResourceGroupState.createFailed:
        return 'CREATE_FAILED';
      case ResourceGroupState.updating:
        return 'UPDATING';
      case ResourceGroupState.updateComplete:
        return 'UPDATE_COMPLETE';
      case ResourceGroupState.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension ResourceGroupStateFromString on String {
  ResourceGroupState toResourceGroupState() {
    switch (this) {
      case 'CREATING':
        return ResourceGroupState.creating;
      case 'CREATE_COMPLETE':
        return ResourceGroupState.createComplete;
      case 'CREATE_FAILED':
        return ResourceGroupState.createFailed;
      case 'UPDATING':
        return ResourceGroupState.updating;
      case 'UPDATE_COMPLETE':
        return ResourceGroupState.updateComplete;
      case 'UPDATE_FAILED':
        return ResourceGroupState.updateFailed;
    }
    throw Exception('$this is not known in enum ResourceGroupState');
  }
}

/// The information about the resource.
class ResourceInfo {
  /// The Amazon resource name (ARN) that specifies the resource across services.
  final String? arn;

  /// The name of the resource.
  final String? name;

  /// Determines whether an application tag is applied or skipped.
  final List<AssociationOption>? options;

  /// The details related to the resource.
  final ResourceDetails? resourceDetails;

  /// Provides information about the Service Catalog App Registry resource type.
  final ResourceType? resourceType;

  ResourceInfo({
    this.arn,
    this.name,
    this.options,
    this.resourceDetails,
    this.resourceType,
  });

  factory ResourceInfo.fromJson(Map<String, dynamic> json) {
    return ResourceInfo(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
      options: (json['options'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAssociationOption())
          .toList(),
      resourceDetails: json['resourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['resourceDetails'] as Map<String, dynamic>)
          : null,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final options = this.options;
    final resourceDetails = this.resourceDetails;
    final resourceType = this.resourceType;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
      if (options != null) 'options': options.map((e) => e.toValue()).toList(),
      if (resourceDetails != null) 'resourceDetails': resourceDetails,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
  }
}

/// The service integration information about the resource.
class ResourceIntegrations {
  /// The information about the integration of Resource Groups.
  final ResourceGroup? resourceGroup;

  ResourceIntegrations({
    this.resourceGroup,
  });

  factory ResourceIntegrations.fromJson(Map<String, dynamic> json) {
    return ResourceIntegrations(
      resourceGroup: json['resourceGroup'] != null
          ? ResourceGroup.fromJson(
              json['resourceGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceGroup = this.resourceGroup;
    return {
      if (resourceGroup != null) 'resourceGroup': resourceGroup,
    };
  }
}

enum ResourceItemStatus {
  success,
  failed,
  inProgress,
  skipped,
}

extension ResourceItemStatusValueExtension on ResourceItemStatus {
  String toValue() {
    switch (this) {
      case ResourceItemStatus.success:
        return 'SUCCESS';
      case ResourceItemStatus.failed:
        return 'FAILED';
      case ResourceItemStatus.inProgress:
        return 'IN_PROGRESS';
      case ResourceItemStatus.skipped:
        return 'SKIPPED';
    }
  }
}

extension ResourceItemStatusFromString on String {
  ResourceItemStatus toResourceItemStatus() {
    switch (this) {
      case 'SUCCESS':
        return ResourceItemStatus.success;
      case 'FAILED':
        return ResourceItemStatus.failed;
      case 'IN_PROGRESS':
        return ResourceItemStatus.inProgress;
      case 'SKIPPED':
        return ResourceItemStatus.skipped;
    }
    throw Exception('$this is not known in enum ResourceItemStatus');
  }
}

enum ResourceType {
  cfnStack,
  resourceTagValue,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.cfnStack:
        return 'CFN_STACK';
      case ResourceType.resourceTagValue:
        return 'RESOURCE_TAG_VALUE';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'CFN_STACK':
        return ResourceType.cfnStack;
      case 'RESOURCE_TAG_VALUE':
        return ResourceType.resourceTagValue;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// The resource in a list of resources.
class ResourcesListItem {
  /// The message returned if the call fails.
  final String? errorMessage;

  /// The Amazon resource name (ARN) of the resource.
  final String? resourceArn;

  /// Provides information about the AppRegistry resource type.
  final String? resourceType;

  /// The status of the list item.
  final String? status;

  ResourcesListItem({
    this.errorMessage,
    this.resourceArn,
    this.resourceType,
    this.status,
  });

  factory ResourcesListItem.fromJson(Map<String, dynamic> json) {
    return ResourcesListItem(
      errorMessage: json['errorMessage'] as String?,
      resourceArn: json['resourceArn'] as String?,
      resourceType: json['resourceType'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final resourceArn = this.resourceArn;
    final resourceType = this.resourceType;
    final status = this.status;
    return {
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceType != null) 'resourceType': resourceType,
      if (status != null) 'status': status,
    };
  }
}

enum SyncAction {
  startSync,
  noAction,
}

extension SyncActionValueExtension on SyncAction {
  String toValue() {
    switch (this) {
      case SyncAction.startSync:
        return 'START_SYNC';
      case SyncAction.noAction:
        return 'NO_ACTION';
    }
  }
}

extension SyncActionFromString on String {
  SyncAction toSyncAction() {
    switch (this) {
      case 'START_SYNC':
        return SyncAction.startSync;
      case 'NO_ACTION':
        return SyncAction.noAction;
    }
    throw Exception('$this is not known in enum SyncAction');
  }
}

class SyncResourceResponse {
  /// The results of the output if an application is associated with an ARN value,
  /// which could be <code>syncStarted</code> or None.
  final SyncAction? actionTaken;

  /// The Amazon resource name (ARN) that specifies the application.
  final String? applicationArn;

  /// The Amazon resource name (ARN) that specifies the resource.
  final String? resourceArn;

  SyncResourceResponse({
    this.actionTaken,
    this.applicationArn,
    this.resourceArn,
  });

  factory SyncResourceResponse.fromJson(Map<String, dynamic> json) {
    return SyncResourceResponse(
      actionTaken: (json['actionTaken'] as String?)?.toSyncAction(),
      applicationArn: json['applicationArn'] as String?,
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionTaken = this.actionTaken;
    final applicationArn = this.applicationArn;
    final resourceArn = this.resourceArn;
    return {
      if (actionTaken != null) 'actionTaken': actionTaken.toValue(),
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

/// The definition of <code>tagQuery</code>. Specifies which resources are
/// associated with an application.
class TagQueryConfiguration {
  /// Condition in the IAM policy that associates resources to an application.
  final String? tagKey;

  TagQueryConfiguration({
    this.tagKey,
  });

  factory TagQueryConfiguration.fromJson(Map<String, dynamic> json) {
    return TagQueryConfiguration(
      tagKey: json['tagKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    return {
      if (tagKey != null) 'tagKey': tagKey,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateApplicationResponse {
  /// The updated information of the application.
  final Application? application;

  UpdateApplicationResponse({
    this.application,
  });

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApplicationResponse(
      application: json['application'] != null
          ? Application.fromJson(json['application'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    return {
      if (application != null) 'application': application,
    };
  }
}

class UpdateAttributeGroupResponse {
  /// The updated information of the attribute group.
  final AttributeGroup? attributeGroup;

  UpdateAttributeGroupResponse({
    this.attributeGroup,
  });

  factory UpdateAttributeGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAttributeGroupResponse(
      attributeGroup: json['attributeGroup'] != null
          ? AttributeGroup.fromJson(
              json['attributeGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeGroup = this.attributeGroup;
    return {
      if (attributeGroup != null) 'attributeGroup': attributeGroup,
    };
  }
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
