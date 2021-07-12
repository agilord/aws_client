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

/// AWS Service Catalog AppRegistry enables organizations to understand the
/// application context of their AWS resources. AppRegistry provides a
/// repository of your applications, their resources, and the application
/// metadata that you use within your enterprise.
class AppRegistry {
  final _s.RestJsonProtocol _protocol;
  AppRegistry({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// Associates an attribute group with an application to augment the
  /// application's metadata with the group's attributes. This feature enables
  /// applications to be described with user-defined details that are
  /// machine-readable, such as third-party integrations.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [application] :
  /// The name or ID of the application.
  ///
  /// Parameter [attributeGroup] :
  /// The name or ID of the attribute group that holds the attributes to
  /// describe the application.
  Future<AssociateAttributeGroupResponse> associateAttributeGroup({
    required String application,
    required String attributeGroup,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(attributeGroup, 'attributeGroup');
    _s.validateStringLength(
      'attributeGroup',
      attributeGroup,
      1,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(application)}/attribute-groups/${Uri.encodeComponent(attributeGroup)}',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateAttributeGroupResponse.fromJson(response);
  }

  /// Associates a resource with an application. Both the resource and the
  /// application can be specified either by ID or name.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [application] :
  /// The name or ID of the application.
  ///
  /// Parameter [resource] :
  /// The name or ID of the resource of which the application will be
  /// associated.
  ///
  /// Parameter [resourceType] :
  /// The type of resource of which the application will be associated.
  Future<AssociateResourceResponse> associateResource({
    required String application,
    required String resource,
    required ResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringLength(
      'resource',
      resource,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final response = await _protocol.send(
      payload: null,
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
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      128,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
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
    ArgumentError.checkNotNull(attributes, 'attributes');
    _s.validateStringLength(
      'attributes',
      attributes,
      1,
      8000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      128,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
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

  /// Deletes an application that is specified either by its application ID or
  /// name. All associated attribute groups and resources must be disassociated
  /// from it before deleting an application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The name or ID of the application.
  Future<DeleteApplicationResponse> deleteApplication({
    required String application,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/applications/${Uri.encodeComponent(application)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteApplicationResponse.fromJson(response);
  }

  /// Deletes an attribute group, specified either by its attribute group ID or
  /// name.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attributeGroup] :
  /// The name or ID of the attribute group that holds the attributes to
  /// describe the application.
  Future<DeleteAttributeGroupResponse> deleteAttributeGroup({
    required String attributeGroup,
  }) async {
    ArgumentError.checkNotNull(attributeGroup, 'attributeGroup');
    _s.validateStringLength(
      'attributeGroup',
      attributeGroup,
      1,
      256,
      isRequired: true,
    );
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
  /// The name or ID of the application.
  ///
  /// Parameter [attributeGroup] :
  /// The name or ID of the attribute group that holds the attributes to
  /// describe the application.
  Future<DisassociateAttributeGroupResponse> disassociateAttributeGroup({
    required String application,
    required String attributeGroup,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(attributeGroup, 'attributeGroup');
    _s.validateStringLength(
      'attributeGroup',
      attributeGroup,
      1,
      256,
      isRequired: true,
    );
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringLength(
      'resource',
      resource,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
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
  /// application can be specified either by its unique ID or by its name (which
  /// is unique within one account in one region at a given point in time).
  /// Specify by ID in automated workflows if you want to make sure that the
  /// exact same application is returned or a
  /// <code>ResourceNotFoundException</code> is thrown, avoiding the ABA
  /// addressing problem.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The name or ID of the application.
  Future<GetApplicationResponse> getApplication({
    required String application,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(application)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationResponse.fromJson(response);
  }

  /// Retrieves an attribute group, either by its name or its ID. The attribute
  /// group can be specified either by its unique ID or by its name.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attributeGroup] :
  /// The name or ID of the attribute group that holds the attributes to
  /// describe the application.
  Future<GetAttributeGroupResponse> getAttributeGroup({
    required String attributeGroup,
  }) async {
    ArgumentError.checkNotNull(attributeGroup, 'attributeGroup');
    _s.validateStringLength(
      'attributeGroup',
      attributeGroup,
      1,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/attribute-groups/${Uri.encodeComponent(attributeGroup)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAttributeGroupResponse.fromJson(response);
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
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2024,
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
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      256,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2024,
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

  /// Lists all resources that are associated with specified application.
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
  Future<ListAssociatedResourcesResponse> listAssociatedResources({
    required String application,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      256,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2024,
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
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2024,
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Syncs the resource with what is currently recorded in App registry.
  /// Specifically, the resource’s App registry system tags are synced with its
  /// associated application. The resource is removed if it is not associated
  /// with the application. The caller must have permissions to read and update
  /// the resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resource] :
  /// An entity you can work with and specify with a name or ID. Examples
  /// include an Amazon EC2 instance, an AWS CloudFormation stack, or an Amazon
  /// S3 bucket.
  ///
  /// Parameter [resourceType] :
  /// The type of resource of which the application will be associated.
  Future<SyncResourceResponse> syncResource({
    required String resource,
    required ResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringLength(
      'resource',
      resource,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The name or ID of the application that will be updated.
  ///
  /// Parameter [description] :
  /// The new description of the application.
  ///
  /// Parameter [name] :
  /// The new name of the application. The name must be unique in the region in
  /// which you are updating the application.
  Future<UpdateApplicationResponse> updateApplication({
    required String application,
    String? description,
    String? name,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
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
  /// The name or ID of the attribute group that holds the attributes to
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
  /// The new name of the attribute group. The name must be unique in the region
  /// in which you are updating the attribute group.
  Future<UpdateAttributeGroupResponse> updateAttributeGroup({
    required String attributeGroup,
    String? attributes,
    String? description,
    String? name,
  }) async {
    ArgumentError.checkNotNull(attributeGroup, 'attributeGroup');
    _s.validateStringLength(
      'attributeGroup',
      attributeGroup,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'attributes',
      attributes,
      1,
      8000,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
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

/// Represents a Service Catalog AppRegistry application that is the top-level
/// node in a hierarchy of related cloud resource abstractions.
class Application {
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

/// Summary of a Service Catalog AppRegistry application.
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

  /// The Amazon resource name (ARN) that specifies the resource.
  final String? resourceArn;

  AssociateResourceResponse({
    this.applicationArn,
    this.resourceArn,
  });

  factory AssociateResourceResponse.fromJson(Map<String, dynamic> json) {
    return AssociateResourceResponse(
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

/// Represents a Service Catalog AppRegistry attribute group that is rich
/// metadata which describes an application and its components.
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

/// Summary of a Service Catalog AppRegistry attribute group.
class AttributeGroupSummary {
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

  AttributeGroupSummary({
    this.arn,
    this.creationTime,
    this.description,
    this.id,
    this.lastUpdateTime,
    this.name,
  });

  factory AttributeGroupSummary.fromJson(Map<String, dynamic> json) {
    return AttributeGroupSummary(
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

  /// The ISO-8601 formatted timestamp of the moment when the application was last
  /// updated.
  final DateTime? lastUpdateTime;

  /// The name of the application. The name must be unique in the region in which
  /// you are creating the application.
  final String? name;

  /// Key-value pairs associated with the application.
  final Map<String, String>? tags;

  GetApplicationResponse({
    this.arn,
    this.associatedResourceCount,
    this.creationTime,
    this.description,
    this.id,
    this.lastUpdateTime,
    this.name,
    this.tags,
  });

  factory GetApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationResponse(
      arn: json['arn'] as String?,
      associatedResourceCount: json['associatedResourceCount'] as int?,
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
    final associatedResourceCount = this.associatedResourceCount;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (associatedResourceCount != null)
        'associatedResourceCount': associatedResourceCount,
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

class GetAttributeGroupResponse {
  /// The Amazon resource name (ARN) that specifies the attribute group across
  /// services.
  final String? arn;

  /// A JSON string in the form of nested key-value pairs that represent the
  /// attributes in the group and describes an application and its components.
  final String? attributes;

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
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (attributes != null) 'attributes': attributes,
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

/// Information about the resource.
class ResourceInfo {
  /// The Amazon resource name (ARN) that specifies the resource across services.
  final String? arn;

  /// The name of the resource.
  final String? name;

  ResourceInfo({
    this.arn,
    this.name,
  });

  factory ResourceInfo.fromJson(Map<String, dynamic> json) {
    return ResourceInfo(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
    };
  }
}

enum ResourceType {
  cfnStack,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.cfnStack:
        return 'CFN_STACK';
    }
  }
}

extension on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'CFN_STACK':
        return ResourceType.cfnStack;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

enum SyncAction {
  startSync,
  noAction,
}

extension on SyncAction {
  String toValue() {
    switch (this) {
      case SyncAction.startSync:
        return 'START_SYNC';
      case SyncAction.noAction:
        return 'NO_ACTION';
    }
  }
}

extension on String {
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
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
