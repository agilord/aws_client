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

/// Amazon Cloud Directory is a component of the AWS Directory Service that
/// simplifies the development and management of cloud-scale web, mobile, and
/// IoT applications. This guide describes the Cloud Directory operations that
/// you can call programmatically and includes detailed information on data
/// types and errors. For information about Cloud Directory features, see <a
/// href="https://aws.amazon.com/directoryservice/">AWS Directory Service</a>
/// and the <a
/// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/what_is_cloud_directory.html">Amazon
/// Cloud Directory Developer Guide</a>.
class CloudDirectory {
  final _s.RestJsonProtocol _protocol;
  CloudDirectory({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'clouddirectory',
            signingName: 'clouddirectory',
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

  /// Adds a new <a>Facet</a> to an object. An object can have more than one
  /// facet applied on it.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where the object resides. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [objectReference] :
  /// A reference to the object you are adding the specified facet to.
  ///
  /// Parameter [schemaFacet] :
  /// Identifiers for the facet that you are adding to the object. See
  /// <a>SchemaFacet</a> for details.
  ///
  /// Parameter [objectAttributeList] :
  /// Attributes on the facet that you are adding to the object.
  Future<void> addFacetToObject({
    required String directoryArn,
    required ObjectReference objectReference,
    required SchemaFacet schemaFacet,
    List<AttributeKeyAndValue>? objectAttributeList,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      'SchemaFacet': schemaFacet,
      if (objectAttributeList != null)
        'ObjectAttributeList': objectAttributeList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/object/facets',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Copies the input published schema, at the specified version, into the
  /// <a>Directory</a> with the same name and version as that of the published
  /// schema.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [SchemaAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAttachmentException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> into which the schema is copied. For more information,
  /// see <a>arns</a>.
  ///
  /// Parameter [publishedSchemaArn] :
  /// Published schema Amazon Resource Name (ARN) that needs to be copied. For
  /// more information, see <a>arns</a>.
  Future<ApplySchemaResponse> applySchema({
    required String directoryArn,
    required String publishedSchemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'PublishedSchemaArn': publishedSchemaArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/apply',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ApplySchemaResponse.fromJson(response);
  }

  /// Attaches an existing object to another object. An object can be accessed
  /// in two ways:
  /// <ol>
  /// <li>
  /// Using the path
  /// </li>
  /// <li>
  /// Using <code>ObjectIdentifier</code>
  /// </li> </ol>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LinkNameAlreadyInUseException].
  /// May throw [InvalidAttachmentException].
  /// May throw [ValidationException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [childReference] :
  /// The child object reference to be attached to the object.
  ///
  /// Parameter [directoryArn] :
  /// Amazon Resource Name (ARN) that is associated with the <a>Directory</a>
  /// where both objects reside. For more information, see <a>arns</a>.
  ///
  /// Parameter [linkName] :
  /// The link name with which the child object is attached to the parent.
  ///
  /// Parameter [parentReference] :
  /// The parent object reference.
  Future<AttachObjectResponse> attachObject({
    required ObjectReference childReference,
    required String directoryArn,
    required String linkName,
    required ObjectReference parentReference,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'ChildReference': childReference,
      'LinkName': linkName,
      'ParentReference': parentReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/object/attach',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return AttachObjectResponse.fromJson(response);
  }

  /// Attaches a policy object to a regular object. An object can have a limited
  /// number of attached policies.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotPolicyException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where both objects reside. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [objectReference] :
  /// The reference that identifies the object to which the policy will be
  /// attached.
  ///
  /// Parameter [policyReference] :
  /// The reference that is associated with the policy object.
  Future<void> attachPolicy({
    required String directoryArn,
    required ObjectReference objectReference,
    required ObjectReference policyReference,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      'PolicyReference': policyReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/policy/attach',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Attaches the specified object to the specified index.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [InvalidAttachmentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LinkNameAlreadyInUseException].
  /// May throw [IndexedAttributeMissingException].
  /// May throw [NotIndexException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) of the directory where the object and index
  /// exist.
  ///
  /// Parameter [indexReference] :
  /// A reference to the index that you are attaching the object to.
  ///
  /// Parameter [targetReference] :
  /// A reference to the object that you are attaching to the index.
  Future<AttachToIndexResponse> attachToIndex({
    required String directoryArn,
    required ObjectReference indexReference,
    required ObjectReference targetReference,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'IndexReference': indexReference,
      'TargetReference': targetReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/index/attach',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return AttachToIndexResponse.fromJson(response);
  }

  /// Attaches a typed link to a specified source and target object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAttachmentException].
  /// May throw [ValidationException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [attributes] :
  /// A set of attributes that are associated with the typed link.
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) of the directory where you want to attach
  /// the typed link.
  ///
  /// Parameter [sourceObjectReference] :
  /// Identifies the source object that the typed link will attach to.
  ///
  /// Parameter [targetObjectReference] :
  /// Identifies the target object that the typed link will attach to.
  ///
  /// Parameter [typedLinkFacet] :
  /// Identifies the typed link facet that is associated with the typed link.
  Future<AttachTypedLinkResponse> attachTypedLink({
    required List<AttributeNameAndValue> attributes,
    required String directoryArn,
    required ObjectReference sourceObjectReference,
    required ObjectReference targetObjectReference,
    required TypedLinkSchemaAndFacetName typedLinkFacet,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Attributes': attributes,
      'SourceObjectReference': sourceObjectReference,
      'TargetObjectReference': targetObjectReference,
      'TypedLinkFacet': typedLinkFacet,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/attach',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return AttachTypedLinkResponse.fromJson(response);
  }

  /// Performs all the read operations in a batch.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a>. For more information, see <a>arns</a>.
  ///
  /// Parameter [operations] :
  /// A list of operations that are part of the batch.
  ///
  /// Parameter [consistencyLevel] :
  /// Represents the manner and timing in which the successful write or update
  /// of an object is reflected in a subsequent read operation of that same
  /// object.
  Future<BatchReadResponse> batchRead({
    required String directoryArn,
    required List<BatchReadOperation> operations,
    ConsistencyLevel? consistencyLevel,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
      if (consistencyLevel != null)
        'x-amz-consistency-level': consistencyLevel.toValue(),
    };
    final $payload = <String, dynamic>{
      'Operations': operations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/batchread',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchReadResponse.fromJson(response);
  }

  /// Performs all the write operations in a batch. Either all the operations
  /// succeed or none.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [BatchWriteException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a>. For more information, see <a>arns</a>.
  ///
  /// Parameter [operations] :
  /// A list of operations that are part of the batch.
  Future<BatchWriteResponse> batchWrite({
    required String directoryArn,
    required List<BatchWriteOperation> operations,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Operations': operations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/batchwrite',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchWriteResponse.fromJson(response);
  }

  /// Creates a <a>Directory</a> by copying the published schema into the
  /// directory. A directory cannot be created without a schema.
  ///
  /// You can also quickly create a directory using a managed schema, called the
  /// <code>QuickStartSchema</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_managed.html">Managed
  /// Schema</a> in the <i>Amazon Cloud Directory Developer Guide</i>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the <a>Directory</a>. Should be unique per account, per
  /// region.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) of the published schema that will be copied
  /// into the data <a>Directory</a>. For more information, see <a>arns</a>.
  Future<CreateDirectoryResponse> createDirectory({
    required String name,
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/directory/create',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateDirectoryResponse.fromJson(response);
  }

  /// Creates a new <a>Facet</a> in a schema. Facet creation is allowed only in
  /// development or applied schemas.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetAlreadyExistsException].
  /// May throw [InvalidRuleException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [name] :
  /// The name of the <a>Facet</a>, which is unique for a given schema.
  ///
  /// Parameter [schemaArn] :
  /// The schema ARN in which the new <a>Facet</a> will be created. For more
  /// information, see <a>arns</a>.
  ///
  /// Parameter [attributes] :
  /// The attributes that are associated with the <a>Facet</a>.
  ///
  /// Parameter [facetStyle] :
  /// There are two different styles that you can define on any given facet,
  /// <code>Static</code> and <code>Dynamic</code>. For static facets, all
  /// attributes must be defined in the schema. For dynamic facets, attributes
  /// can be defined during data plane operations.
  ///
  /// Parameter [objectType] :
  /// Specifies whether a given object created from this facet is of type node,
  /// leaf node, policy or index.
  ///
  /// <ul>
  /// <li>
  /// Node: Can have multiple children but one parent.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// Leaf node: Cannot have children but can have multiple parents.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// Policy: Allows you to store a policy document and policy type. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// Index: Can be created with the Index API.
  /// </li>
  /// </ul>
  Future<void> createFacet({
    required String name,
    required String schemaArn,
    List<FacetAttribute>? attributes,
    FacetStyle? facetStyle,
    ObjectType? objectType,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
      if (attributes != null) 'Attributes': attributes,
      if (facetStyle != null) 'FacetStyle': facetStyle.toValue(),
      if (objectType != null) 'ObjectType': objectType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/facet/create',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an index object. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/indexing_search.html">Indexing
  /// and search</a> for more information.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetValidationException].
  /// May throw [LinkNameAlreadyInUseException].
  /// May throw [UnsupportedIndexTypeException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory where the index should be created.
  ///
  /// Parameter [isUnique] :
  /// Indicates whether the attribute that is being indexed has unique values or
  /// not.
  ///
  /// Parameter [orderedIndexedAttributeList] :
  /// Specifies the attributes that should be indexed on. Currently only a
  /// single attribute is supported.
  ///
  /// Parameter [linkName] :
  /// The name of the link between the parent object and the index object.
  ///
  /// Parameter [parentReference] :
  /// A reference to the parent object that contains the index object.
  Future<CreateIndexResponse> createIndex({
    required String directoryArn,
    required bool isUnique,
    required List<AttributeKey> orderedIndexedAttributeList,
    String? linkName,
    ObjectReference? parentReference,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'IsUnique': isUnique,
      'OrderedIndexedAttributeList': orderedIndexedAttributeList,
      if (linkName != null) 'LinkName': linkName,
      if (parentReference != null) 'ParentReference': parentReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/index',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateIndexResponse.fromJson(response);
  }

  /// Creates an object in a <a>Directory</a>. Additionally attaches the object
  /// to a parent, if a parent reference and <code>LinkName</code> is specified.
  /// An object is simply a collection of <a>Facet</a> attributes. You can also
  /// use this API call to create a policy object, if the facet from which you
  /// create the object is a policy facet.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetValidationException].
  /// May throw [LinkNameAlreadyInUseException].
  /// May throw [UnsupportedIndexTypeException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> in which the object will be created. For more
  /// information, see <a>arns</a>.
  ///
  /// Parameter [schemaFacets] :
  /// A list of schema facets to be associated with the object. Do not provide
  /// minor version components. See <a>SchemaFacet</a> for details.
  ///
  /// Parameter [linkName] :
  /// The name of link that is used to attach this object to a parent.
  ///
  /// Parameter [objectAttributeList] :
  /// The attribute map whose attribute ARN contains the key and attribute value
  /// as the map value.
  ///
  /// Parameter [parentReference] :
  /// If specified, the parent reference to which this object will be attached.
  Future<CreateObjectResponse> createObject({
    required String directoryArn,
    required List<SchemaFacet> schemaFacets,
    String? linkName,
    List<AttributeKeyAndValue>? objectAttributeList,
    ObjectReference? parentReference,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'SchemaFacets': schemaFacets,
      if (linkName != null) 'LinkName': linkName,
      if (objectAttributeList != null)
        'ObjectAttributeList': objectAttributeList,
      if (parentReference != null) 'ParentReference': parentReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/object',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateObjectResponse.fromJson(response);
  }

  /// Creates a new schema in a development state. A schema can exist in three
  /// phases:
  ///
  /// <ul>
  /// <li>
  /// <i>Development:</i> This is a mutable phase of the schema. All new schemas
  /// are in the development phase. Once the schema is finalized, it can be
  /// published.
  /// </li>
  /// <li>
  /// <i>Published:</i> Published schemas are immutable and have a version
  /// associated with them.
  /// </li>
  /// <li>
  /// <i>Applied:</i> Applied schemas are mutable in a way that allows you to
  /// add new schema facets. You can also add new, nonrequired attributes to
  /// existing schema facets. You can apply only published schemas to
  /// directories.
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [SchemaAlreadyExistsException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name that is associated with the schema. This is unique to each
  /// account and in each region.
  Future<CreateSchemaResponse> createSchema({
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSchemaResponse.fromJson(response);
  }

  /// Creates a <a>TypedLinkFacet</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetAlreadyExistsException].
  /// May throw [InvalidRuleException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [facet] :
  /// <a>Facet</a> structure that is associated with the typed link facet.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) that is associated with the schema. For
  /// more information, see <a>arns</a>.
  Future<void> createTypedLinkFacet({
    required TypedLinkFacet facet,
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Facet': facet,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/facet/create',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a directory. Only disabled directories can be deleted. A deleted
  /// directory cannot be undone. Exercise extreme caution when deleting
  /// directories.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DirectoryNotDisabledException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryDeletedException].
  /// May throw [RetryableConflictException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory to delete.
  Future<DeleteDirectoryResponse> deleteDirectory({
    required String directoryArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/directory',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDirectoryResponse.fromJson(response);
  }

  /// Deletes a given <a>Facet</a>. All attributes and <a>Rule</a>s that are
  /// associated with the facet will be deleted. Only development schema facets
  /// are allowed deletion.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetNotFoundException].
  /// May throw [FacetInUseException].
  ///
  /// Parameter [name] :
  /// The name of the facet to delete.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) that is associated with the <a>Facet</a>.
  /// For more information, see <a>arns</a>.
  Future<void> deleteFacet({
    required String name,
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/facet/delete',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an object and its associated attributes. Only objects with no
  /// children and no parents can be deleted. The maximum number of attributes
  /// that can be deleted during an object deletion is 30. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/limits.html">Amazon
  /// Cloud Directory Limits</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ObjectNotDetachedException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where the object resides. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [objectReference] :
  /// A reference that identifies the object.
  Future<void> deleteObject({
    required String directoryArn,
    required ObjectReference objectReference,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/object/delete',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a given schema. Schemas in a development and published state can
  /// only be deleted.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [StillContainsLinksException].
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) of the development schema. For more
  /// information, see <a>arns</a>.
  Future<DeleteSchemaResponse> deleteSchema({
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/schema',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSchemaResponse.fromJson(response);
  }

  /// Deletes a <a>TypedLinkFacet</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetNotFoundException].
  ///
  /// Parameter [name] :
  /// The unique name of the typed link facet.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) that is associated with the schema. For
  /// more information, see <a>arns</a>.
  Future<void> deleteTypedLinkFacet({
    required String name,
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/facet/delete',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Detaches the specified object from the specified index.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ObjectAlreadyDetachedException].
  /// May throw [NotIndexException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) of the directory the index and object exist
  /// in.
  ///
  /// Parameter [indexReference] :
  /// A reference to the index object.
  ///
  /// Parameter [targetReference] :
  /// A reference to the object being detached from the index.
  Future<DetachFromIndexResponse> detachFromIndex({
    required String directoryArn,
    required ObjectReference indexReference,
    required ObjectReference targetReference,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'IndexReference': indexReference,
      'TargetReference': targetReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/index/detach',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DetachFromIndexResponse.fromJson(response);
  }

  /// Detaches a given object from the parent object. The object that is to be
  /// detached from the parent is specified by the link name.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotNodeException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where objects reside. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [linkName] :
  /// The link name associated with the object that needs to be detached.
  ///
  /// Parameter [parentReference] :
  /// The parent reference from which the object with the specified link name is
  /// detached.
  Future<DetachObjectResponse> detachObject({
    required String directoryArn,
    required String linkName,
    required ObjectReference parentReference,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'LinkName': linkName,
      'ParentReference': parentReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/object/detach',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DetachObjectResponse.fromJson(response);
  }

  /// Detaches a policy from an object.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotPolicyException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where both objects reside. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [objectReference] :
  /// Reference that identifies the object whose policy object will be detached.
  ///
  /// Parameter [policyReference] :
  /// Reference that identifies the policy object.
  Future<void> detachPolicy({
    required String directoryArn,
    required ObjectReference objectReference,
    required ObjectReference policyReference,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      'PolicyReference': policyReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/policy/detach',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Detaches a typed link from a specified source and target object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) of the directory where you want to detach
  /// the typed link.
  ///
  /// Parameter [typedLinkSpecifier] :
  /// Used to accept a typed link specifier as input.
  Future<void> detachTypedLink({
    required String directoryArn,
    required TypedLinkSpecifier typedLinkSpecifier,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'TypedLinkSpecifier': typedLinkSpecifier,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/detach',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disables the specified directory. Disabled directories cannot be read or
  /// written to. Only enabled directories can be disabled. Disabled directories
  /// may be reenabled.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DirectoryDeletedException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [RetryableConflictException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory to disable.
  Future<DisableDirectoryResponse> disableDirectory({
    required String directoryArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/directory/disable',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DisableDirectoryResponse.fromJson(response);
  }

  /// Enables the specified directory. Only disabled directories can be enabled.
  /// Once enabled, the directory can then be read and written to.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DirectoryDeletedException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [RetryableConflictException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory to enable.
  Future<EnableDirectoryResponse> enableDirectory({
    required String directoryArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/directory/enable',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return EnableDirectoryResponse.fromJson(response);
  }

  /// Returns current applied schema version ARN, including the minor version in
  /// use.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [schemaArn] :
  /// The ARN of the applied schema.
  Future<GetAppliedSchemaVersionResponse> getAppliedSchemaVersion({
    required String schemaArn,
  }) async {
    final $payload = <String, dynamic>{
      'SchemaArn': schemaArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/getappliedschema',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppliedSchemaVersionResponse.fromJson(response);
  }

  /// Retrieves metadata about a directory.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory.
  Future<GetDirectoryResponse> getDirectory({
    required String directoryArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/directory/get',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetDirectoryResponse.fromJson(response);
  }

  /// Gets details of the <a>Facet</a>, such as facet name, attributes,
  /// <a>Rule</a>s, or <code>ObjectType</code>. You can call this on all kinds
  /// of schema facets -- published, development, or applied.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the facet to retrieve.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) that is associated with the <a>Facet</a>.
  /// For more information, see <a>arns</a>.
  Future<GetFacetResponse> getFacet({
    required String name,
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/facet',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetFacetResponse.fromJson(response);
  }

  /// Retrieves attributes that are associated with a typed link.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [attributeNames] :
  /// A list of attribute names whose values will be retrieved.
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the Directory where
  /// the typed link resides. For more information, see <a>arns</a> or <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// Parameter [typedLinkSpecifier] :
  /// Allows a typed link specifier to be accepted as input.
  ///
  /// Parameter [consistencyLevel] :
  /// The consistency level at which to retrieve the attributes on a typed link.
  Future<GetLinkAttributesResponse> getLinkAttributes({
    required List<String> attributeNames,
    required String directoryArn,
    required TypedLinkSpecifier typedLinkSpecifier,
    ConsistencyLevel? consistencyLevel,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'AttributeNames': attributeNames,
      'TypedLinkSpecifier': typedLinkSpecifier,
      if (consistencyLevel != null)
        'ConsistencyLevel': consistencyLevel.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/attributes/get',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetLinkAttributesResponse.fromJson(response);
  }

  /// Retrieves attributes within a facet that are associated with an object.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [attributeNames] :
  /// List of attribute names whose values will be retrieved.
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where the object resides.
  ///
  /// Parameter [objectReference] :
  /// Reference that identifies the object whose attributes will be retrieved.
  ///
  /// Parameter [schemaFacet] :
  /// Identifier for the facet whose attributes will be retrieved. See
  /// <a>SchemaFacet</a> for details.
  ///
  /// Parameter [consistencyLevel] :
  /// The consistency level at which to retrieve the attributes on an object.
  Future<GetObjectAttributesResponse> getObjectAttributes({
    required List<String> attributeNames,
    required String directoryArn,
    required ObjectReference objectReference,
    required SchemaFacet schemaFacet,
    ConsistencyLevel? consistencyLevel,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
      if (consistencyLevel != null)
        'x-amz-consistency-level': consistencyLevel.toValue(),
    };
    final $payload = <String, dynamic>{
      'AttributeNames': attributeNames,
      'ObjectReference': objectReference,
      'SchemaFacet': schemaFacet,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/object/attributes/get',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetObjectAttributesResponse.fromJson(response);
  }

  /// Retrieves metadata about an object.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory being retrieved.
  ///
  /// Parameter [objectReference] :
  /// A reference to the object.
  ///
  /// Parameter [consistencyLevel] :
  /// The consistency level at which to retrieve the object information.
  Future<GetObjectInformationResponse> getObjectInformation({
    required String directoryArn,
    required ObjectReference objectReference,
    ConsistencyLevel? consistencyLevel,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
      if (consistencyLevel != null)
        'x-amz-consistency-level': consistencyLevel.toValue(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/object/information',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetObjectInformationResponse.fromJson(response);
  }

  /// Retrieves a JSON representation of the schema. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_jsonformat.html#schemas_json">JSON
  /// Schema Format</a> for more information.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [schemaArn] :
  /// The ARN of the schema to retrieve.
  Future<GetSchemaAsJsonResponse> getSchemaAsJson({
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/json',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetSchemaAsJsonResponse.fromJson(response);
  }

  /// Returns the identity attribute order for a specific <a>TypedLinkFacet</a>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [FacetNotFoundException].
  ///
  /// Parameter [name] :
  /// The unique name of the typed link facet.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) that is associated with the schema. For
  /// more information, see <a>arns</a>.
  Future<GetTypedLinkFacetInformationResponse> getTypedLinkFacetInformation({
    required String name,
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/facet/get',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetTypedLinkFacetInformationResponse.fromJson(response);
  }

  /// Lists schema major versions applied to a directory. If
  /// <code>SchemaArn</code> is provided, lists the minor version.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory you are listing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  ///
  /// Parameter [schemaArn] :
  /// The response for <code>ListAppliedSchemaArns</code> when this parameter is
  /// used will list all minor version ARNs for a major version.
  Future<ListAppliedSchemaArnsResponse> listAppliedSchemaArns({
    required String directoryArn,
    int? maxResults,
    String? nextToken,
    String? schemaArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'DirectoryArn': directoryArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (schemaArn != null) 'SchemaArn': schemaArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/applied',
      exceptionFnMap: _exceptionFns,
    );
    return ListAppliedSchemaArnsResponse.fromJson(response);
  }

  /// Lists indices attached to the specified object.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory.
  ///
  /// Parameter [targetReference] :
  /// A reference to the object that has indices attached.
  ///
  /// Parameter [consistencyLevel] :
  /// The consistency level to use for this operation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListAttachedIndicesResponse> listAttachedIndices({
    required String directoryArn,
    required ObjectReference targetReference,
    ConsistencyLevel? consistencyLevel,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
      if (consistencyLevel != null)
        'x-amz-consistency-level': consistencyLevel.toValue(),
    };
    final $payload = <String, dynamic>{
      'TargetReference': targetReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/object/indices',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAttachedIndicesResponse.fromJson(response);
  }

  /// Retrieves each Amazon Resource Name (ARN) of schemas in the development
  /// state.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListDevelopmentSchemaArnsResponse> listDevelopmentSchemaArns({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/development',
      exceptionFnMap: _exceptionFns,
    );
    return ListDevelopmentSchemaArnsResponse.fromJson(response);
  }

  /// Lists directories created within an account.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  ///
  /// Parameter [state] :
  /// The state of the directories in the list. Can be either Enabled, Disabled,
  /// or Deleted.
  Future<ListDirectoriesResponse> listDirectories({
    int? maxResults,
    String? nextToken,
    DirectoryState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (state != null) 'state': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/directory/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListDirectoriesResponse.fromJson(response);
  }

  /// Retrieves attributes attached to the facet.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [name] :
  /// The name of the facet whose attributes will be retrieved.
  ///
  /// Parameter [schemaArn] :
  /// The ARN of the schema where the facet resides.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListFacetAttributesResponse> listFacetAttributes({
    required String name,
    required String schemaArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/facet/attributes',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListFacetAttributesResponse.fromJson(response);
  }

  /// Retrieves the names of facets that exist in a schema.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) to retrieve facet names from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListFacetNamesResponse> listFacetNames({
    required String schemaArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/facet/list',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListFacetNamesResponse.fromJson(response);
  }

  /// Returns a paginated list of all the incoming <a>TypedLinkSpecifier</a>
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) of the directory where you want to list the
  /// typed links.
  ///
  /// Parameter [objectReference] :
  /// Reference that identifies the object whose attributes will be listed.
  ///
  /// Parameter [consistencyLevel] :
  /// The consistency level to execute the request at.
  ///
  /// Parameter [filterAttributeRanges] :
  /// Provides range filters for multiple attributes. When providing ranges to
  /// typed link selection, any inexact ranges must be specified at the end. Any
  /// attributes that do not have a range specified are presumed to match the
  /// entire range.
  ///
  /// Parameter [filterTypedLink] :
  /// Filters are interpreted in the order of the attributes on the typed link
  /// facet, not the order in which they are supplied to any API calls.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListIncomingTypedLinksResponse> listIncomingTypedLinks({
    required String directoryArn,
    required ObjectReference objectReference,
    ConsistencyLevel? consistencyLevel,
    List<TypedLinkAttributeRange>? filterAttributeRanges,
    TypedLinkSchemaAndFacetName? filterTypedLink,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      if (consistencyLevel != null)
        'ConsistencyLevel': consistencyLevel.toValue(),
      if (filterAttributeRanges != null)
        'FilterAttributeRanges': filterAttributeRanges,
      if (filterTypedLink != null) 'FilterTypedLink': filterTypedLink,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/incoming',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListIncomingTypedLinksResponse.fromJson(response);
  }

  /// Lists objects attached to the specified index.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [FacetValidationException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotIndexException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory that the index exists in.
  ///
  /// Parameter [indexReference] :
  /// The reference to the index to list.
  ///
  /// Parameter [consistencyLevel] :
  /// The consistency level to execute the request at.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects in a single page to retrieve from the index
  /// during a request. For more information, see <a
  /// href="http://docs.aws.amazon.com/clouddirectory/latest/developerguide/limits.html">Amazon
  /// Cloud Directory Limits</a>.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  ///
  /// Parameter [rangesOnIndexedValues] :
  /// Specifies the ranges of indexed values that you want to query.
  Future<ListIndexResponse> listIndex({
    required String directoryArn,
    required ObjectReference indexReference,
    ConsistencyLevel? consistencyLevel,
    int? maxResults,
    String? nextToken,
    List<ObjectAttributeRange>? rangesOnIndexedValues,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
      if (consistencyLevel != null)
        'x-amz-consistency-level': consistencyLevel.toValue(),
    };
    final $payload = <String, dynamic>{
      'IndexReference': indexReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (rangesOnIndexedValues != null)
        'RangesOnIndexedValues': rangesOnIndexedValues,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/index/targets',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListIndexResponse.fromJson(response);
  }

  /// Lists the major version families of each managed schema. If a major
  /// version ARN is provided as SchemaArn, the minor version revisions in that
  /// family are listed instead.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  ///
  /// Parameter [schemaArn] :
  /// The response for ListManagedSchemaArns. When this parameter is used, all
  /// minor version ARNs for a major version are listed.
  Future<ListManagedSchemaArnsResponse> listManagedSchemaArns({
    int? maxResults,
    String? nextToken,
    String? schemaArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (schemaArn != null) 'SchemaArn': schemaArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/managed',
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedSchemaArnsResponse.fromJson(response);
  }

  /// Lists all attributes that are associated with an object.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where the object resides. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [objectReference] :
  /// The reference that identifies the object whose attributes will be listed.
  ///
  /// Parameter [consistencyLevel] :
  /// Represents the manner and timing in which the successful write or update
  /// of an object is reflected in a subsequent read operation of that same
  /// object.
  ///
  /// Parameter [facetFilter] :
  /// Used to filter the list of object attributes that are associated with a
  /// certain facet.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListObjectAttributesResponse> listObjectAttributes({
    required String directoryArn,
    required ObjectReference objectReference,
    ConsistencyLevel? consistencyLevel,
    SchemaFacet? facetFilter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
      if (consistencyLevel != null)
        'x-amz-consistency-level': consistencyLevel.toValue(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      if (facetFilter != null) 'FacetFilter': facetFilter,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/object/attributes',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectAttributesResponse.fromJson(response);
  }

  /// Returns a paginated list of child objects that are associated with a given
  /// object.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NotNodeException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where the object resides. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [objectReference] :
  /// The reference that identifies the object for which child objects are being
  /// listed.
  ///
  /// Parameter [consistencyLevel] :
  /// Represents the manner and timing in which the successful write or update
  /// of an object is reflected in a subsequent read operation of that same
  /// object.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListObjectChildrenResponse> listObjectChildren({
    required String directoryArn,
    required ObjectReference objectReference,
    ConsistencyLevel? consistencyLevel,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
      if (consistencyLevel != null)
        'x-amz-consistency-level': consistencyLevel.toValue(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/object/children',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectChildrenResponse.fromJson(response);
  }

  /// Retrieves all available parent paths for any object type such as node,
  /// leaf node, policy node, and index node objects. For more information about
  /// objects, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directorystructure.html">Directory
  /// Structure</a>.
  ///
  /// Use this API to evaluate all parents for an object. The call returns all
  /// objects from the root of the directory up to the requested object. The API
  /// returns the number of paths based on user-defined <code>MaxResults</code>,
  /// in case there are multiple paths to the parent. The order of the paths and
  /// nodes returned is consistent among multiple API calls unless the objects
  /// are deleted or moved. Paths not leading to the directory root are ignored
  /// from the target object.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory to which the parent path applies.
  ///
  /// Parameter [objectReference] :
  /// The reference that identifies the object whose parent paths are listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListObjectParentPathsResponse> listObjectParentPaths({
    required String directoryArn,
    required ObjectReference objectReference,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/object/parentpaths',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectParentPathsResponse.fromJson(response);
  }

  /// Lists parent objects that are associated with a given object in pagination
  /// fashion.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [CannotListParentOfRootException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where the object resides. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [objectReference] :
  /// The reference that identifies the object for which parent objects are
  /// being listed.
  ///
  /// Parameter [consistencyLevel] :
  /// Represents the manner and timing in which the successful write or update
  /// of an object is reflected in a subsequent read operation of that same
  /// object.
  ///
  /// Parameter [includeAllLinksToEachParent] :
  /// When set to True, returns all
  /// <a>ListObjectParentsResponse$ParentLinks</a>. There could be multiple
  /// links between a parent-child pair.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListObjectParentsResponse> listObjectParents({
    required String directoryArn,
    required ObjectReference objectReference,
    ConsistencyLevel? consistencyLevel,
    bool? includeAllLinksToEachParent,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
      if (consistencyLevel != null)
        'x-amz-consistency-level': consistencyLevel.toValue(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      if (includeAllLinksToEachParent != null)
        'IncludeAllLinksToEachParent': includeAllLinksToEachParent,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/object/parent',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectParentsResponse.fromJson(response);
  }

  /// Returns policies attached to an object in pagination fashion.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where objects reside. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [objectReference] :
  /// Reference that identifies the object for which policies will be listed.
  ///
  /// Parameter [consistencyLevel] :
  /// Represents the manner and timing in which the successful write or update
  /// of an object is reflected in a subsequent read operation of that same
  /// object.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListObjectPoliciesResponse> listObjectPolicies({
    required String directoryArn,
    required ObjectReference objectReference,
    ConsistencyLevel? consistencyLevel,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
      if (consistencyLevel != null)
        'x-amz-consistency-level': consistencyLevel.toValue(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/object/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectPoliciesResponse.fromJson(response);
  }

  /// Returns a paginated list of all the outgoing <a>TypedLinkSpecifier</a>
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) of the directory where you want to list the
  /// typed links.
  ///
  /// Parameter [objectReference] :
  /// A reference that identifies the object whose attributes will be listed.
  ///
  /// Parameter [consistencyLevel] :
  /// The consistency level to execute the request at.
  ///
  /// Parameter [filterAttributeRanges] :
  /// Provides range filters for multiple attributes. When providing ranges to
  /// typed link selection, any inexact ranges must be specified at the end. Any
  /// attributes that do not have a range specified are presumed to match the
  /// entire range.
  ///
  /// Parameter [filterTypedLink] :
  /// Filters are interpreted in the order of the attributes defined on the
  /// typed link facet, not the order they are supplied to any API calls.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListOutgoingTypedLinksResponse> listOutgoingTypedLinks({
    required String directoryArn,
    required ObjectReference objectReference,
    ConsistencyLevel? consistencyLevel,
    List<TypedLinkAttributeRange>? filterAttributeRanges,
    TypedLinkSchemaAndFacetName? filterTypedLink,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      if (consistencyLevel != null)
        'ConsistencyLevel': consistencyLevel.toValue(),
      if (filterAttributeRanges != null)
        'FilterAttributeRanges': filterAttributeRanges,
      if (filterTypedLink != null) 'FilterTypedLink': filterTypedLink,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/outgoing',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListOutgoingTypedLinksResponse.fromJson(response);
  }

  /// Returns all of the <code>ObjectIdentifiers</code> to which a given policy
  /// is attached.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotPolicyException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where objects reside. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [policyReference] :
  /// The reference that identifies the policy object.
  ///
  /// Parameter [consistencyLevel] :
  /// Represents the manner and timing in which the successful write or update
  /// of an object is reflected in a subsequent read operation of that same
  /// object.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListPolicyAttachmentsResponse> listPolicyAttachments({
    required String directoryArn,
    required ObjectReference policyReference,
    ConsistencyLevel? consistencyLevel,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
      if (consistencyLevel != null)
        'x-amz-consistency-level': consistencyLevel.toValue(),
    };
    final $payload = <String, dynamic>{
      'PolicyReference': policyReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/policy/attachment',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListPolicyAttachmentsResponse.fromJson(response);
  }

  /// Lists the major version families of each published schema. If a major
  /// version ARN is provided as <code>SchemaArn</code>, the minor version
  /// revisions in that family are listed instead.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  ///
  /// Parameter [schemaArn] :
  /// The response for <code>ListPublishedSchemaArns</code> when this parameter
  /// is used will list all minor version ARNs for a major version.
  Future<ListPublishedSchemaArnsResponse> listPublishedSchemaArns({
    int? maxResults,
    String? nextToken,
    String? schemaArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (schemaArn != null) 'SchemaArn': schemaArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/published',
      exceptionFnMap: _exceptionFns,
    );
    return ListPublishedSchemaArnsResponse.fromJson(response);
  }

  /// Returns tags for a resource. Tagging is currently supported only for
  /// directories with a limit of 50 tags per directory. All 50 tags are
  /// returned for a given directory with this API call.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidTaggingRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. Tagging is only supported
  /// for directories.
  ///
  /// Parameter [maxResults] :
  /// The <code>MaxResults</code> parameter sets the maximum number of results
  /// returned in a single page. This is for future use and is not supported
  /// currently.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. This is for future use. Currently pagination is not
  /// supported for tagging.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      50,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/tags',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Returns a paginated list of all attribute definitions for a particular
  /// <a>TypedLinkFacet</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [name] :
  /// The unique name of the typed link facet.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) that is associated with the schema. For
  /// more information, see <a>arns</a>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListTypedLinkFacetAttributesResponse> listTypedLinkFacetAttributes({
    required String name,
    required String schemaArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/facet/attributes',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListTypedLinkFacetAttributesResponse.fromJson(response);
  }

  /// Returns a paginated list of <code>TypedLink</code> facet names for a
  /// particular schema. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) that is associated with the schema. For
  /// more information, see <a>arns</a>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListTypedLinkFacetNamesResponse> listTypedLinkFacetNames({
    required String schemaArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/facet/list',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListTypedLinkFacetNamesResponse.fromJson(response);
  }

  /// Lists all policies from the root of the <a>Directory</a> to the object
  /// specified. If there are no policies present, an empty list is returned. If
  /// policies are present, and if some objects don't have the policies
  /// attached, it returns the <code>ObjectIdentifier</code> for such objects.
  /// If policies are present, it returns <code>ObjectIdentifier</code>,
  /// <code>policyId</code>, and <code>policyType</code>. Paths that don't lead
  /// to the root from the target object are ignored. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a>. For more information, see <a>arns</a>.
  ///
  /// Parameter [objectReference] :
  /// Reference that identifies the object whose policies will be looked up.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<LookupPolicyResponse> lookupPolicy({
    required String directoryArn,
    required ObjectReference objectReference,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/amazonclouddirectory/2017-01-11/policy/lookup',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return LookupPolicyResponse.fromJson(response);
  }

  /// Publishes a development schema with a major version and a recommended
  /// minor version.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [SchemaAlreadyPublishedException].
  ///
  /// Parameter [developmentSchemaArn] :
  /// The Amazon Resource Name (ARN) that is associated with the development
  /// schema. For more information, see <a>arns</a>.
  ///
  /// Parameter [version] :
  /// The major version under which the schema will be published. Schemas have
  /// both a major and minor version associated with them.
  ///
  /// Parameter [minorVersion] :
  /// The minor version under which the schema will be published. This parameter
  /// is recommended. Schemas have both a major and minor version associated
  /// with them.
  ///
  /// Parameter [name] :
  /// The new name under which the schema will be published. If this is not
  /// provided, the development schema is considered.
  Future<PublishSchemaResponse> publishSchema({
    required String developmentSchemaArn,
    required String version,
    String? minorVersion,
    String? name,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': developmentSchemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Version': version,
      if (minorVersion != null) 'MinorVersion': minorVersion,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/publish',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PublishSchemaResponse.fromJson(response);
  }

  /// Allows a schema to be updated using JSON upload. Only available for
  /// development schemas. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_jsonformat.html#schemas_json">JSON
  /// Schema Format</a> for more information.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidSchemaDocException].
  /// May throw [InvalidRuleException].
  ///
  /// Parameter [document] :
  /// The replacement JSON schema.
  ///
  /// Parameter [schemaArn] :
  /// The ARN of the schema to update.
  Future<PutSchemaFromJsonResponse> putSchemaFromJson({
    required String document,
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Document': document,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/json',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PutSchemaFromJsonResponse.fromJson(response);
  }

  /// Removes the specified facet from the specified object.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN of the directory in which the object resides.
  ///
  /// Parameter [objectReference] :
  /// A reference to the object to remove the facet from.
  ///
  /// Parameter [schemaFacet] :
  /// The facet to remove. See <a>SchemaFacet</a> for details.
  Future<void> removeFacetFromObject({
    required String directoryArn,
    required ObjectReference objectReference,
    required SchemaFacet schemaFacet,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'ObjectReference': objectReference,
      'SchemaFacet': schemaFacet,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/object/facets/delete',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// An API operation for adding tags to a resource.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidTaggingRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. Tagging is only supported
  /// for directories.
  ///
  /// Parameter [tags] :
  /// A list of tag key-value pairs.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/tags/add',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// An API operation for removing tags from a resource.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidTaggingRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. Tagging is only supported
  /// for directories.
  ///
  /// Parameter [tagKeys] :
  /// Keys of the tag that need to be removed from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/tags/remove',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Does the following:
  /// <ol>
  /// <li>
  /// Adds new <code>Attributes</code>, <code>Rules</code>, or
  /// <code>ObjectTypes</code>.
  /// </li>
  /// <li>
  /// Updates existing <code>Attributes</code>, <code>Rules</code>, or
  /// <code>ObjectTypes</code>.
  /// </li>
  /// <li>
  /// Deletes existing <code>Attributes</code>, <code>Rules</code>, or
  /// <code>ObjectTypes</code>.
  /// </li> </ol>
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidFacetUpdateException].
  /// May throw [FacetValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetNotFoundException].
  /// May throw [InvalidRuleException].
  ///
  /// Parameter [name] :
  /// The name of the facet.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) that is associated with the <a>Facet</a>.
  /// For more information, see <a>arns</a>.
  ///
  /// Parameter [attributeUpdates] :
  /// List of attributes that need to be updated in a given schema <a>Facet</a>.
  /// Each attribute is followed by <code>AttributeAction</code>, which
  /// specifies the type of update operation to perform.
  ///
  /// Parameter [objectType] :
  /// The object type that is associated with the facet. See
  /// <a>CreateFacetRequest$ObjectType</a> for more details.
  Future<void> updateFacet({
    required String name,
    required String schemaArn,
    List<FacetAttributeUpdate>? attributeUpdates,
    ObjectType? objectType,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
      if (attributeUpdates != null) 'AttributeUpdates': attributeUpdates,
      if (objectType != null) 'ObjectType': objectType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/facet',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a given typed link’s attributes. Attributes to be updated must not
  /// contribute to the typed link’s identity, as defined by its
  /// <code>IdentityAttributeOrder</code>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [attributeUpdates] :
  /// The attributes update structure.
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the Directory where
  /// the updated typed link resides. For more information, see <a>arns</a> or
  /// <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// Parameter [typedLinkSpecifier] :
  /// Allows a typed link specifier to be accepted as input.
  Future<void> updateLinkAttributes({
    required List<LinkAttributeUpdate> attributeUpdates,
    required String directoryArn,
    required TypedLinkSpecifier typedLinkSpecifier,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'AttributeUpdates': attributeUpdates,
      'TypedLinkSpecifier': typedLinkSpecifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/amazonclouddirectory/2017-01-11/typedlink/attributes/update',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a given object's attributes.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [DirectoryNotEnabledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LinkNameAlreadyInUseException].
  /// May throw [FacetValidationException].
  ///
  /// Parameter [attributeUpdates] :
  /// The attributes update structure.
  ///
  /// Parameter [directoryArn] :
  /// The Amazon Resource Name (ARN) that is associated with the
  /// <a>Directory</a> where the object resides. For more information, see
  /// <a>arns</a>.
  ///
  /// Parameter [objectReference] :
  /// The reference that identifies the object.
  Future<UpdateObjectAttributesResponse> updateObjectAttributes({
    required List<ObjectAttributeUpdate> attributeUpdates,
    required String directoryArn,
    required ObjectReference objectReference,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': directoryArn.toString(),
    };
    final $payload = <String, dynamic>{
      'AttributeUpdates': attributeUpdates,
      'ObjectReference': objectReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/object/update',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateObjectAttributesResponse.fromJson(response);
  }

  /// Updates the schema name with a new name. Only development schema names can
  /// be updated.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the schema.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) of the development schema. For more
  /// information, see <a>arns</a>.
  Future<UpdateSchemaResponse> updateSchema({
    required String name,
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/update',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSchemaResponse.fromJson(response);
  }

  /// Updates a <a>TypedLinkFacet</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [FacetValidationException].
  /// May throw [InvalidFacetUpdateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [FacetNotFoundException].
  /// May throw [InvalidRuleException].
  ///
  /// Parameter [attributeUpdates] :
  /// Attributes update structure.
  ///
  /// Parameter [identityAttributeOrder] :
  /// The order of identity attributes for the facet, from most significant to
  /// least significant. The ability to filter typed links considers the order
  /// that the attributes are defined on the typed link facet. When providing
  /// ranges to a typed link selection, any inexact ranges must be specified at
  /// the end. Any attributes that do not have a range specified are presumed to
  /// match the entire range. Filters are interpreted in the order of the
  /// attributes on the typed link facet, not the order in which they are
  /// supplied to any API calls. For more information about identity attributes,
  /// see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  ///
  /// Parameter [name] :
  /// The unique name of the typed link facet.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) that is associated with the schema. For
  /// more information, see <a>arns</a>.
  Future<void> updateTypedLinkFacet({
    required List<TypedLinkFacetAttributeUpdate> attributeUpdates,
    required List<String> identityAttributeOrder,
    required String name,
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'x-amz-data-partition': schemaArn.toString(),
    };
    final $payload = <String, dynamic>{
      'AttributeUpdates': attributeUpdates,
      'IdentityAttributeOrder': identityAttributeOrder,
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/typedlink/facet',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Upgrades a single directory in-place using the
  /// <code>PublishedSchemaArn</code> with schema updates found in
  /// <code>MinorVersion</code>. Backwards-compatible minor version upgrades are
  /// instantaneously available for readers on all objects in the directory.
  /// Note: This is a synchronous API call and upgrades only one schema on a
  /// given directory per call. To upgrade multiple directories from one schema,
  /// you would need to call this API on each directory.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [IncompatibleSchemaException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAttachmentException].
  /// May throw [SchemaAlreadyExistsException].
  ///
  /// Parameter [directoryArn] :
  /// The ARN for the directory to which the upgraded schema will be applied.
  ///
  /// Parameter [publishedSchemaArn] :
  /// The revision of the published schema to upgrade the directory to.
  ///
  /// Parameter [dryRun] :
  /// Used for testing whether the major version schemas are backward compatible
  /// or not. If schema compatibility fails, an exception would be thrown else
  /// the call would succeed but no changes will be saved. This parameter is
  /// optional.
  Future<UpgradeAppliedSchemaResponse> upgradeAppliedSchema({
    required String directoryArn,
    required String publishedSchemaArn,
    bool? dryRun,
  }) async {
    final $payload = <String, dynamic>{
      'DirectoryArn': directoryArn,
      'PublishedSchemaArn': publishedSchemaArn,
      if (dryRun != null) 'DryRun': dryRun,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/upgradeapplied',
      exceptionFnMap: _exceptionFns,
    );
    return UpgradeAppliedSchemaResponse.fromJson(response);
  }

  /// Upgrades a published schema under a new minor version revision using the
  /// current contents of <code>DevelopmentSchemaArn</code>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidArnException].
  /// May throw [RetryableConflictException].
  /// May throw [ValidationException].
  /// May throw [IncompatibleSchemaException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAttachmentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [developmentSchemaArn] :
  /// The ARN of the development schema with the changes used for the upgrade.
  ///
  /// Parameter [minorVersion] :
  /// Identifies the minor version of the published schema that will be created.
  /// This parameter is NOT optional.
  ///
  /// Parameter [publishedSchemaArn] :
  /// The ARN of the published schema to be upgraded.
  ///
  /// Parameter [dryRun] :
  /// Used for testing whether the Development schema provided is backwards
  /// compatible, or not, with the publish schema provided by the user to be
  /// upgraded. If schema compatibility fails, an exception would be thrown else
  /// the call would succeed. This parameter is optional and defaults to false.
  Future<UpgradePublishedSchemaResponse> upgradePublishedSchema({
    required String developmentSchemaArn,
    required String minorVersion,
    required String publishedSchemaArn,
    bool? dryRun,
  }) async {
    final $payload = <String, dynamic>{
      'DevelopmentSchemaArn': developmentSchemaArn,
      'MinorVersion': minorVersion,
      'PublishedSchemaArn': publishedSchemaArn,
      if (dryRun != null) 'DryRun': dryRun,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/amazonclouddirectory/2017-01-11/schema/upgradepublished',
      exceptionFnMap: _exceptionFns,
    );
    return UpgradePublishedSchemaResponse.fromJson(response);
  }
}

class AddFacetToObjectResponse {
  AddFacetToObjectResponse();

  factory AddFacetToObjectResponse.fromJson(Map<String, dynamic> _) {
    return AddFacetToObjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ApplySchemaResponse {
  /// The applied schema ARN that is associated with the copied schema in the
  /// <a>Directory</a>. You can use this ARN to describe the schema information
  /// applied on this directory. For more information, see <a>arns</a>.
  final String? appliedSchemaArn;

  /// The ARN that is associated with the <a>Directory</a>. For more information,
  /// see <a>arns</a>.
  final String? directoryArn;

  ApplySchemaResponse({
    this.appliedSchemaArn,
    this.directoryArn,
  });

  factory ApplySchemaResponse.fromJson(Map<String, dynamic> json) {
    return ApplySchemaResponse(
      appliedSchemaArn: json['AppliedSchemaArn'] as String?,
      directoryArn: json['DirectoryArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appliedSchemaArn = this.appliedSchemaArn;
    final directoryArn = this.directoryArn;
    return {
      if (appliedSchemaArn != null) 'AppliedSchemaArn': appliedSchemaArn,
      if (directoryArn != null) 'DirectoryArn': directoryArn,
    };
  }
}

class AttachObjectResponse {
  /// The attached <code>ObjectIdentifier</code>, which is the child
  /// <code>ObjectIdentifier</code>.
  final String? attachedObjectIdentifier;

  AttachObjectResponse({
    this.attachedObjectIdentifier,
  });

  factory AttachObjectResponse.fromJson(Map<String, dynamic> json) {
    return AttachObjectResponse(
      attachedObjectIdentifier: json['AttachedObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachedObjectIdentifier = this.attachedObjectIdentifier;
    return {
      if (attachedObjectIdentifier != null)
        'AttachedObjectIdentifier': attachedObjectIdentifier,
    };
  }
}

class AttachPolicyResponse {
  AttachPolicyResponse();

  factory AttachPolicyResponse.fromJson(Map<String, dynamic> _) {
    return AttachPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AttachToIndexResponse {
  /// The <code>ObjectIdentifier</code> of the object that was attached to the
  /// index.
  final String? attachedObjectIdentifier;

  AttachToIndexResponse({
    this.attachedObjectIdentifier,
  });

  factory AttachToIndexResponse.fromJson(Map<String, dynamic> json) {
    return AttachToIndexResponse(
      attachedObjectIdentifier: json['AttachedObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachedObjectIdentifier = this.attachedObjectIdentifier;
    return {
      if (attachedObjectIdentifier != null)
        'AttachedObjectIdentifier': attachedObjectIdentifier,
    };
  }
}

class AttachTypedLinkResponse {
  /// Returns a typed link specifier as output.
  final TypedLinkSpecifier? typedLinkSpecifier;

  AttachTypedLinkResponse({
    this.typedLinkSpecifier,
  });

  factory AttachTypedLinkResponse.fromJson(Map<String, dynamic> json) {
    return AttachTypedLinkResponse(
      typedLinkSpecifier: json['TypedLinkSpecifier'] != null
          ? TypedLinkSpecifier.fromJson(
              json['TypedLinkSpecifier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final typedLinkSpecifier = this.typedLinkSpecifier;
    return {
      if (typedLinkSpecifier != null) 'TypedLinkSpecifier': typedLinkSpecifier,
    };
  }
}

/// A unique identifier for an attribute.
class AttributeKey {
  /// The name of the facet that the attribute exists within.
  final String facetName;

  /// The name of the attribute.
  final String name;

  /// The Amazon Resource Name (ARN) of the schema that contains the facet and
  /// attribute.
  final String schemaArn;

  AttributeKey({
    required this.facetName,
    required this.name,
    required this.schemaArn,
  });

  factory AttributeKey.fromJson(Map<String, dynamic> json) {
    return AttributeKey(
      facetName: json['FacetName'] as String,
      name: json['Name'] as String,
      schemaArn: json['SchemaArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final facetName = this.facetName;
    final name = this.name;
    final schemaArn = this.schemaArn;
    return {
      'FacetName': facetName,
      'Name': name,
      'SchemaArn': schemaArn,
    };
  }
}

/// The combination of an attribute key and an attribute value.
class AttributeKeyAndValue {
  /// The key of the attribute.
  final AttributeKey key;

  /// The value of the attribute.
  final TypedAttributeValue value;

  AttributeKeyAndValue({
    required this.key,
    required this.value,
  });

  factory AttributeKeyAndValue.fromJson(Map<String, dynamic> json) {
    return AttributeKeyAndValue(
      key: AttributeKey.fromJson(json['Key'] as Map<String, dynamic>),
      value:
          TypedAttributeValue.fromJson(json['Value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// Identifies the attribute name and value for a typed link.
class AttributeNameAndValue {
  /// The attribute name of the typed link.
  final String attributeName;

  /// The value for the typed link.
  final TypedAttributeValue value;

  AttributeNameAndValue({
    required this.attributeName,
    required this.value,
  });

  factory AttributeNameAndValue.fromJson(Map<String, dynamic> json) {
    return AttributeNameAndValue(
      attributeName: json['AttributeName'] as String,
      value:
          TypedAttributeValue.fromJson(json['Value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final value = this.value;
    return {
      'AttributeName': attributeName,
      'Value': value,
    };
  }
}

/// Represents the output of a batch add facet to object operation.
class BatchAddFacetToObject {
  /// The attributes to set on the object.
  final List<AttributeKeyAndValue> objectAttributeList;

  /// A reference to the object being mutated.
  final ObjectReference objectReference;

  /// Represents the facet being added to the object.
  final SchemaFacet schemaFacet;

  BatchAddFacetToObject({
    required this.objectAttributeList,
    required this.objectReference,
    required this.schemaFacet,
  });

  Map<String, dynamic> toJson() {
    final objectAttributeList = this.objectAttributeList;
    final objectReference = this.objectReference;
    final schemaFacet = this.schemaFacet;
    return {
      'ObjectAttributeList': objectAttributeList,
      'ObjectReference': objectReference,
      'SchemaFacet': schemaFacet,
    };
  }
}

/// The result of a batch add facet to object operation.
class BatchAddFacetToObjectResponse {
  BatchAddFacetToObjectResponse();

  factory BatchAddFacetToObjectResponse.fromJson(Map<String, dynamic> _) {
    return BatchAddFacetToObjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the output of an <a>AttachObject</a> operation.
class BatchAttachObject {
  /// The child object reference that is to be attached to the object.
  final ObjectReference childReference;

  /// The name of the link.
  final String linkName;

  /// The parent object reference.
  final ObjectReference parentReference;

  BatchAttachObject({
    required this.childReference,
    required this.linkName,
    required this.parentReference,
  });

  Map<String, dynamic> toJson() {
    final childReference = this.childReference;
    final linkName = this.linkName;
    final parentReference = this.parentReference;
    return {
      'ChildReference': childReference,
      'LinkName': linkName,
      'ParentReference': parentReference,
    };
  }
}

/// Represents the output batch <a>AttachObject</a> response operation.
class BatchAttachObjectResponse {
  /// The <code>ObjectIdentifier</code> of the object that has been attached.
  final String? attachedObjectIdentifier;

  BatchAttachObjectResponse({
    this.attachedObjectIdentifier,
  });

  factory BatchAttachObjectResponse.fromJson(Map<String, dynamic> json) {
    return BatchAttachObjectResponse(
      attachedObjectIdentifier: json['attachedObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachedObjectIdentifier = this.attachedObjectIdentifier;
    return {
      if (attachedObjectIdentifier != null)
        'attachedObjectIdentifier': attachedObjectIdentifier,
    };
  }
}

/// Attaches a policy object to a regular object inside a <a>BatchRead</a>
/// operation. For more information, see <a>AttachPolicy</a> and
/// <a>BatchReadRequest$Operations</a>.
class BatchAttachPolicy {
  /// The reference that identifies the object to which the policy will be
  /// attached.
  final ObjectReference objectReference;

  /// The reference that is associated with the policy object.
  final ObjectReference policyReference;

  BatchAttachPolicy({
    required this.objectReference,
    required this.policyReference,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final policyReference = this.policyReference;
    return {
      'ObjectReference': objectReference,
      'PolicyReference': policyReference,
    };
  }
}

/// Represents the output of an <a>AttachPolicy</a> response operation.
class BatchAttachPolicyResponse {
  BatchAttachPolicyResponse();

  factory BatchAttachPolicyResponse.fromJson(Map<String, dynamic> _) {
    return BatchAttachPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Attaches the specified object to the specified index inside a
/// <a>BatchRead</a> operation. For more information, see <a>AttachToIndex</a>
/// and <a>BatchReadRequest$Operations</a>.
class BatchAttachToIndex {
  /// A reference to the index that you are attaching the object to.
  final ObjectReference indexReference;

  /// A reference to the object that you are attaching to the index.
  final ObjectReference targetReference;

  BatchAttachToIndex({
    required this.indexReference,
    required this.targetReference,
  });

  Map<String, dynamic> toJson() {
    final indexReference = this.indexReference;
    final targetReference = this.targetReference;
    return {
      'IndexReference': indexReference,
      'TargetReference': targetReference,
    };
  }
}

/// Represents the output of a <a>AttachToIndex</a> response operation.
class BatchAttachToIndexResponse {
  /// The <code>ObjectIdentifier</code> of the object that was attached to the
  /// index.
  final String? attachedObjectIdentifier;

  BatchAttachToIndexResponse({
    this.attachedObjectIdentifier,
  });

  factory BatchAttachToIndexResponse.fromJson(Map<String, dynamic> json) {
    return BatchAttachToIndexResponse(
      attachedObjectIdentifier: json['AttachedObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachedObjectIdentifier = this.attachedObjectIdentifier;
    return {
      if (attachedObjectIdentifier != null)
        'AttachedObjectIdentifier': attachedObjectIdentifier,
    };
  }
}

/// Attaches a typed link to a specified source and target object inside a
/// <a>BatchRead</a> operation. For more information, see <a>AttachTypedLink</a>
/// and <a>BatchReadRequest$Operations</a>.
class BatchAttachTypedLink {
  /// A set of attributes that are associated with the typed link.
  final List<AttributeNameAndValue> attributes;

  /// Identifies the source object that the typed link will attach to.
  final ObjectReference sourceObjectReference;

  /// Identifies the target object that the typed link will attach to.
  final ObjectReference targetObjectReference;

  /// Identifies the typed link facet that is associated with the typed link.
  final TypedLinkSchemaAndFacetName typedLinkFacet;

  BatchAttachTypedLink({
    required this.attributes,
    required this.sourceObjectReference,
    required this.targetObjectReference,
    required this.typedLinkFacet,
  });

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final sourceObjectReference = this.sourceObjectReference;
    final targetObjectReference = this.targetObjectReference;
    final typedLinkFacet = this.typedLinkFacet;
    return {
      'Attributes': attributes,
      'SourceObjectReference': sourceObjectReference,
      'TargetObjectReference': targetObjectReference,
      'TypedLinkFacet': typedLinkFacet,
    };
  }
}

/// Represents the output of a <a>AttachTypedLink</a> response operation.
class BatchAttachTypedLinkResponse {
  /// Returns a typed link specifier as output.
  final TypedLinkSpecifier? typedLinkSpecifier;

  BatchAttachTypedLinkResponse({
    this.typedLinkSpecifier,
  });

  factory BatchAttachTypedLinkResponse.fromJson(Map<String, dynamic> json) {
    return BatchAttachTypedLinkResponse(
      typedLinkSpecifier: json['TypedLinkSpecifier'] != null
          ? TypedLinkSpecifier.fromJson(
              json['TypedLinkSpecifier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final typedLinkSpecifier = this.typedLinkSpecifier;
    return {
      if (typedLinkSpecifier != null) 'TypedLinkSpecifier': typedLinkSpecifier,
    };
  }
}

/// Creates an index object inside of a <a>BatchRead</a> operation. For more
/// information, see <a>CreateIndex</a> and <a>BatchReadRequest$Operations</a>.
class BatchCreateIndex {
  /// Indicates whether the attribute that is being indexed has unique values or
  /// not.
  final bool isUnique;

  /// Specifies the attributes that should be indexed on. Currently only a single
  /// attribute is supported.
  final List<AttributeKey> orderedIndexedAttributeList;

  /// The batch reference name. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/transaction_support.html">Transaction
  /// Support</a> for more information.
  final String? batchReferenceName;

  /// The name of the link between the parent object and the index object.
  final String? linkName;

  /// A reference to the parent object that contains the index object.
  final ObjectReference? parentReference;

  BatchCreateIndex({
    required this.isUnique,
    required this.orderedIndexedAttributeList,
    this.batchReferenceName,
    this.linkName,
    this.parentReference,
  });

  Map<String, dynamic> toJson() {
    final isUnique = this.isUnique;
    final orderedIndexedAttributeList = this.orderedIndexedAttributeList;
    final batchReferenceName = this.batchReferenceName;
    final linkName = this.linkName;
    final parentReference = this.parentReference;
    return {
      'IsUnique': isUnique,
      'OrderedIndexedAttributeList': orderedIndexedAttributeList,
      if (batchReferenceName != null) 'BatchReferenceName': batchReferenceName,
      if (linkName != null) 'LinkName': linkName,
      if (parentReference != null) 'ParentReference': parentReference,
    };
  }
}

/// Represents the output of a <a>CreateIndex</a> response operation.
class BatchCreateIndexResponse {
  /// The <code>ObjectIdentifier</code> of the index created by this operation.
  final String? objectIdentifier;

  BatchCreateIndexResponse({
    this.objectIdentifier,
  });

  factory BatchCreateIndexResponse.fromJson(Map<String, dynamic> json) {
    return BatchCreateIndexResponse(
      objectIdentifier: json['ObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
    };
  }
}

/// Represents the output of a <a>CreateObject</a> operation.
class BatchCreateObject {
  /// An attribute map, which contains an attribute ARN as the key and attribute
  /// value as the map value.
  final List<AttributeKeyAndValue> objectAttributeList;

  /// A list of <code>FacetArns</code> that will be associated with the object.
  /// For more information, see <a>arns</a>.
  final List<SchemaFacet> schemaFacet;

  /// The batch reference name. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/transaction_support.html">Transaction
  /// Support</a> for more information.
  final String? batchReferenceName;

  /// The name of the link.
  final String? linkName;

  /// If specified, the parent reference to which this object will be attached.
  final ObjectReference? parentReference;

  BatchCreateObject({
    required this.objectAttributeList,
    required this.schemaFacet,
    this.batchReferenceName,
    this.linkName,
    this.parentReference,
  });

  Map<String, dynamic> toJson() {
    final objectAttributeList = this.objectAttributeList;
    final schemaFacet = this.schemaFacet;
    final batchReferenceName = this.batchReferenceName;
    final linkName = this.linkName;
    final parentReference = this.parentReference;
    return {
      'ObjectAttributeList': objectAttributeList,
      'SchemaFacet': schemaFacet,
      if (batchReferenceName != null) 'BatchReferenceName': batchReferenceName,
      if (linkName != null) 'LinkName': linkName,
      if (parentReference != null) 'ParentReference': parentReference,
    };
  }
}

/// Represents the output of a <a>CreateObject</a> response operation.
class BatchCreateObjectResponse {
  /// The ID that is associated with the object.
  final String? objectIdentifier;

  BatchCreateObjectResponse({
    this.objectIdentifier,
  });

  factory BatchCreateObjectResponse.fromJson(Map<String, dynamic> json) {
    return BatchCreateObjectResponse(
      objectIdentifier: json['ObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
    };
  }
}

/// Represents the output of a <a>DeleteObject</a> operation.
class BatchDeleteObject {
  /// The reference that identifies the object.
  final ObjectReference objectReference;

  BatchDeleteObject({
    required this.objectReference,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    return {
      'ObjectReference': objectReference,
    };
  }
}

/// Represents the output of a <a>DeleteObject</a> response operation.
class BatchDeleteObjectResponse {
  BatchDeleteObjectResponse();

  factory BatchDeleteObjectResponse.fromJson(Map<String, dynamic> _) {
    return BatchDeleteObjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Detaches the specified object from the specified index inside a
/// <a>BatchRead</a> operation. For more information, see <a>DetachFromIndex</a>
/// and <a>BatchReadRequest$Operations</a>.
class BatchDetachFromIndex {
  /// A reference to the index object.
  final ObjectReference indexReference;

  /// A reference to the object being detached from the index.
  final ObjectReference targetReference;

  BatchDetachFromIndex({
    required this.indexReference,
    required this.targetReference,
  });

  Map<String, dynamic> toJson() {
    final indexReference = this.indexReference;
    final targetReference = this.targetReference;
    return {
      'IndexReference': indexReference,
      'TargetReference': targetReference,
    };
  }
}

/// Represents the output of a <a>DetachFromIndex</a> response operation.
class BatchDetachFromIndexResponse {
  /// The <code>ObjectIdentifier</code> of the object that was detached from the
  /// index.
  final String? detachedObjectIdentifier;

  BatchDetachFromIndexResponse({
    this.detachedObjectIdentifier,
  });

  factory BatchDetachFromIndexResponse.fromJson(Map<String, dynamic> json) {
    return BatchDetachFromIndexResponse(
      detachedObjectIdentifier: json['DetachedObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detachedObjectIdentifier = this.detachedObjectIdentifier;
    return {
      if (detachedObjectIdentifier != null)
        'DetachedObjectIdentifier': detachedObjectIdentifier,
    };
  }
}

/// Represents the output of a <a>DetachObject</a> operation.
class BatchDetachObject {
  /// The name of the link.
  final String linkName;

  /// Parent reference from which the object with the specified link name is
  /// detached.
  final ObjectReference parentReference;

  /// The batch reference name. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/transaction_support.html">Transaction
  /// Support</a> for more information.
  final String? batchReferenceName;

  BatchDetachObject({
    required this.linkName,
    required this.parentReference,
    this.batchReferenceName,
  });

  Map<String, dynamic> toJson() {
    final linkName = this.linkName;
    final parentReference = this.parentReference;
    final batchReferenceName = this.batchReferenceName;
    return {
      'LinkName': linkName,
      'ParentReference': parentReference,
      if (batchReferenceName != null) 'BatchReferenceName': batchReferenceName,
    };
  }
}

/// Represents the output of a <a>DetachObject</a> response operation.
class BatchDetachObjectResponse {
  /// The <code>ObjectIdentifier</code> of the detached object.
  final String? detachedObjectIdentifier;

  BatchDetachObjectResponse({
    this.detachedObjectIdentifier,
  });

  factory BatchDetachObjectResponse.fromJson(Map<String, dynamic> json) {
    return BatchDetachObjectResponse(
      detachedObjectIdentifier: json['detachedObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detachedObjectIdentifier = this.detachedObjectIdentifier;
    return {
      if (detachedObjectIdentifier != null)
        'detachedObjectIdentifier': detachedObjectIdentifier,
    };
  }
}

/// Detaches the specified policy from the specified directory inside a
/// <a>BatchWrite</a> operation. For more information, see <a>DetachPolicy</a>
/// and <a>BatchWriteRequest$Operations</a>.
class BatchDetachPolicy {
  /// Reference that identifies the object whose policy object will be detached.
  final ObjectReference objectReference;

  /// Reference that identifies the policy object.
  final ObjectReference policyReference;

  BatchDetachPolicy({
    required this.objectReference,
    required this.policyReference,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final policyReference = this.policyReference;
    return {
      'ObjectReference': objectReference,
      'PolicyReference': policyReference,
    };
  }
}

/// Represents the output of a <a>DetachPolicy</a> response operation.
class BatchDetachPolicyResponse {
  BatchDetachPolicyResponse();

  factory BatchDetachPolicyResponse.fromJson(Map<String, dynamic> _) {
    return BatchDetachPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Detaches a typed link from a specified source and target object inside a
/// <a>BatchRead</a> operation. For more information, see <a>DetachTypedLink</a>
/// and <a>BatchReadRequest$Operations</a>.
class BatchDetachTypedLink {
  /// Used to accept a typed link specifier as input.
  final TypedLinkSpecifier typedLinkSpecifier;

  BatchDetachTypedLink({
    required this.typedLinkSpecifier,
  });

  Map<String, dynamic> toJson() {
    final typedLinkSpecifier = this.typedLinkSpecifier;
    return {
      'TypedLinkSpecifier': typedLinkSpecifier,
    };
  }
}

/// Represents the output of a <a>DetachTypedLink</a> response operation.
class BatchDetachTypedLinkResponse {
  BatchDetachTypedLinkResponse();

  factory BatchDetachTypedLinkResponse.fromJson(Map<String, dynamic> _) {
    return BatchDetachTypedLinkResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Retrieves attributes that are associated with a typed link inside a
/// <a>BatchRead</a> operation. For more information, see
/// <a>GetLinkAttributes</a> and <a>BatchReadRequest$Operations</a>.
class BatchGetLinkAttributes {
  /// A list of attribute names whose values will be retrieved.
  final List<String> attributeNames;

  /// Allows a typed link specifier to be accepted as input.
  final TypedLinkSpecifier typedLinkSpecifier;

  BatchGetLinkAttributes({
    required this.attributeNames,
    required this.typedLinkSpecifier,
  });

  Map<String, dynamic> toJson() {
    final attributeNames = this.attributeNames;
    final typedLinkSpecifier = this.typedLinkSpecifier;
    return {
      'AttributeNames': attributeNames,
      'TypedLinkSpecifier': typedLinkSpecifier,
    };
  }
}

/// Represents the output of a <a>GetLinkAttributes</a> response operation.
class BatchGetLinkAttributesResponse {
  /// The attributes that are associated with the typed link.
  final List<AttributeKeyAndValue>? attributes;

  BatchGetLinkAttributesResponse({
    this.attributes,
  });

  factory BatchGetLinkAttributesResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetLinkAttributesResponse(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// Retrieves attributes within a facet that are associated with an object
/// inside an <a>BatchRead</a> operation. For more information, see
/// <a>GetObjectAttributes</a> and <a>BatchReadRequest$Operations</a>.
class BatchGetObjectAttributes {
  /// List of attribute names whose values will be retrieved.
  final List<String> attributeNames;

  /// Reference that identifies the object whose attributes will be retrieved.
  final ObjectReference objectReference;

  /// Identifier for the facet whose attributes will be retrieved. See
  /// <a>SchemaFacet</a> for details.
  final SchemaFacet schemaFacet;

  BatchGetObjectAttributes({
    required this.attributeNames,
    required this.objectReference,
    required this.schemaFacet,
  });

  Map<String, dynamic> toJson() {
    final attributeNames = this.attributeNames;
    final objectReference = this.objectReference;
    final schemaFacet = this.schemaFacet;
    return {
      'AttributeNames': attributeNames,
      'ObjectReference': objectReference,
      'SchemaFacet': schemaFacet,
    };
  }
}

/// Represents the output of a <a>GetObjectAttributes</a> response operation.
class BatchGetObjectAttributesResponse {
  /// The attribute values that are associated with an object.
  final List<AttributeKeyAndValue>? attributes;

  BatchGetObjectAttributesResponse({
    this.attributes,
  });

  factory BatchGetObjectAttributesResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetObjectAttributesResponse(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// Retrieves metadata about an object inside a <a>BatchRead</a> operation. For
/// more information, see <a>GetObjectInformation</a> and
/// <a>BatchReadRequest$Operations</a>.
class BatchGetObjectInformation {
  /// A reference to the object.
  final ObjectReference objectReference;

  BatchGetObjectInformation({
    required this.objectReference,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    return {
      'ObjectReference': objectReference,
    };
  }
}

/// Represents the output of a <a>GetObjectInformation</a> response operation.
class BatchGetObjectInformationResponse {
  /// The <code>ObjectIdentifier</code> of the specified object.
  final String? objectIdentifier;

  /// The facets attached to the specified object.
  final List<SchemaFacet>? schemaFacets;

  BatchGetObjectInformationResponse({
    this.objectIdentifier,
    this.schemaFacets,
  });

  factory BatchGetObjectInformationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetObjectInformationResponse(
      objectIdentifier: json['ObjectIdentifier'] as String?,
      schemaFacets: (json['SchemaFacets'] as List?)
          ?.whereNotNull()
          .map((e) => SchemaFacet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    final schemaFacets = this.schemaFacets;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
      if (schemaFacets != null) 'SchemaFacets': schemaFacets,
    };
  }
}

/// Lists indices attached to an object inside a <a>BatchRead</a> operation. For
/// more information, see <a>ListAttachedIndices</a> and
/// <a>BatchReadRequest$Operations</a>.
class BatchListAttachedIndices {
  /// A reference to the object that has indices attached.
  final ObjectReference targetReference;

  /// The maximum number of results to retrieve.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  BatchListAttachedIndices({
    required this.targetReference,
    this.maxResults,
    this.nextToken,
  });

  Map<String, dynamic> toJson() {
    final targetReference = this.targetReference;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'TargetReference': targetReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListAttachedIndices</a> response operation.
class BatchListAttachedIndicesResponse {
  /// The indices attached to the specified object.
  final List<IndexAttachment>? indexAttachments;

  /// The pagination token.
  final String? nextToken;

  BatchListAttachedIndicesResponse({
    this.indexAttachments,
    this.nextToken,
  });

  factory BatchListAttachedIndicesResponse.fromJson(Map<String, dynamic> json) {
    return BatchListAttachedIndicesResponse(
      indexAttachments: (json['IndexAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => IndexAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexAttachments = this.indexAttachments;
    final nextToken = this.nextToken;
    return {
      if (indexAttachments != null) 'IndexAttachments': indexAttachments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Returns a paginated list of all the incoming <a>TypedLinkSpecifier</a>
/// information for an object inside a <a>BatchRead</a> operation. For more
/// information, see <a>ListIncomingTypedLinks</a> and
/// <a>BatchReadRequest$Operations</a>.
class BatchListIncomingTypedLinks {
  /// The reference that identifies the object whose attributes will be listed.
  final ObjectReference objectReference;

  /// Provides range filters for multiple attributes. When providing ranges to
  /// typed link selection, any inexact ranges must be specified at the end. Any
  /// attributes that do not have a range specified are presumed to match the
  /// entire range.
  final List<TypedLinkAttributeRange>? filterAttributeRanges;

  /// Filters are interpreted in the order of the attributes on the typed link
  /// facet, not the order in which they are supplied to any API calls.
  final TypedLinkSchemaAndFacetName? filterTypedLink;

  /// The maximum number of results to retrieve.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  BatchListIncomingTypedLinks({
    required this.objectReference,
    this.filterAttributeRanges,
    this.filterTypedLink,
    this.maxResults,
    this.nextToken,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final filterAttributeRanges = this.filterAttributeRanges;
    final filterTypedLink = this.filterTypedLink;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'ObjectReference': objectReference,
      if (filterAttributeRanges != null)
        'FilterAttributeRanges': filterAttributeRanges,
      if (filterTypedLink != null) 'FilterTypedLink': filterTypedLink,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListIncomingTypedLinks</a> response operation.
class BatchListIncomingTypedLinksResponse {
  /// Returns one or more typed link specifiers as output.
  final List<TypedLinkSpecifier>? linkSpecifiers;

  /// The pagination token.
  final String? nextToken;

  BatchListIncomingTypedLinksResponse({
    this.linkSpecifiers,
    this.nextToken,
  });

  factory BatchListIncomingTypedLinksResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchListIncomingTypedLinksResponse(
      linkSpecifiers: (json['LinkSpecifiers'] as List?)
          ?.whereNotNull()
          .map((e) => TypedLinkSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linkSpecifiers = this.linkSpecifiers;
    final nextToken = this.nextToken;
    return {
      if (linkSpecifiers != null) 'LinkSpecifiers': linkSpecifiers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Lists objects attached to the specified index inside a <a>BatchRead</a>
/// operation. For more information, see <a>ListIndex</a> and
/// <a>BatchReadRequest$Operations</a>.
class BatchListIndex {
  /// The reference to the index to list.
  final ObjectReference indexReference;

  /// The maximum number of results to retrieve.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  /// Specifies the ranges of indexed values that you want to query.
  final List<ObjectAttributeRange>? rangesOnIndexedValues;

  BatchListIndex({
    required this.indexReference,
    this.maxResults,
    this.nextToken,
    this.rangesOnIndexedValues,
  });

  Map<String, dynamic> toJson() {
    final indexReference = this.indexReference;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    final rangesOnIndexedValues = this.rangesOnIndexedValues;
    return {
      'IndexReference': indexReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (rangesOnIndexedValues != null)
        'RangesOnIndexedValues': rangesOnIndexedValues,
    };
  }
}

/// Represents the output of a <a>ListIndex</a> response operation.
class BatchListIndexResponse {
  /// The objects and indexed values attached to the index.
  final List<IndexAttachment>? indexAttachments;

  /// The pagination token.
  final String? nextToken;

  BatchListIndexResponse({
    this.indexAttachments,
    this.nextToken,
  });

  factory BatchListIndexResponse.fromJson(Map<String, dynamic> json) {
    return BatchListIndexResponse(
      indexAttachments: (json['IndexAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => IndexAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexAttachments = this.indexAttachments;
    final nextToken = this.nextToken;
    return {
      if (indexAttachments != null) 'IndexAttachments': indexAttachments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListObjectAttributes</a> operation.
class BatchListObjectAttributes {
  /// Reference of the object whose attributes need to be listed.
  final ObjectReference objectReference;

  /// Used to filter the list of object attributes that are associated with a
  /// certain facet.
  final SchemaFacet? facetFilter;

  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  BatchListObjectAttributes({
    required this.objectReference,
    this.facetFilter,
    this.maxResults,
    this.nextToken,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final facetFilter = this.facetFilter;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'ObjectReference': objectReference,
      if (facetFilter != null) 'FacetFilter': facetFilter,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListObjectAttributes</a> response operation.
class BatchListObjectAttributesResponse {
  /// The attributes map that is associated with the object.
  /// <code>AttributeArn</code> is the key; attribute value is the value.
  final List<AttributeKeyAndValue>? attributes;

  /// The pagination token.
  final String? nextToken;

  BatchListObjectAttributesResponse({
    this.attributes,
    this.nextToken,
  });

  factory BatchListObjectAttributesResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchListObjectAttributesResponse(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final nextToken = this.nextToken;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListObjectChildren</a> operation.
class BatchListObjectChildren {
  /// Reference of the object for which child objects are being listed.
  final ObjectReference objectReference;

  /// Maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  BatchListObjectChildren({
    required this.objectReference,
    this.maxResults,
    this.nextToken,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'ObjectReference': objectReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListObjectChildren</a> response operation.
class BatchListObjectChildrenResponse {
  /// The children structure, which is a map with the key as the
  /// <code>LinkName</code> and <code>ObjectIdentifier</code> as the value.
  final Map<String, String>? children;

  /// The pagination token.
  final String? nextToken;

  BatchListObjectChildrenResponse({
    this.children,
    this.nextToken,
  });

  factory BatchListObjectChildrenResponse.fromJson(Map<String, dynamic> json) {
    return BatchListObjectChildrenResponse(
      children: (json['Children'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final children = this.children;
    final nextToken = this.nextToken;
    return {
      if (children != null) 'Children': children,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Retrieves all available parent paths for any object type such as node, leaf
/// node, policy node, and index node objects inside a <a>BatchRead</a>
/// operation. For more information, see <a>ListObjectParentPaths</a> and
/// <a>BatchReadRequest$Operations</a>.
class BatchListObjectParentPaths {
  /// The reference that identifies the object whose attributes will be listed.
  final ObjectReference objectReference;

  /// The maximum number of results to retrieve.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  BatchListObjectParentPaths({
    required this.objectReference,
    this.maxResults,
    this.nextToken,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'ObjectReference': objectReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListObjectParentPaths</a> response operation.
class BatchListObjectParentPathsResponse {
  /// The pagination token.
  final String? nextToken;

  /// Returns the path to the <code>ObjectIdentifiers</code> that are associated
  /// with the directory.
  final List<PathToObjectIdentifiers>? pathToObjectIdentifiersList;

  BatchListObjectParentPathsResponse({
    this.nextToken,
    this.pathToObjectIdentifiersList,
  });

  factory BatchListObjectParentPathsResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchListObjectParentPathsResponse(
      nextToken: json['NextToken'] as String?,
      pathToObjectIdentifiersList:
          (json['PathToObjectIdentifiersList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  PathToObjectIdentifiers.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pathToObjectIdentifiersList = this.pathToObjectIdentifiersList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (pathToObjectIdentifiersList != null)
        'PathToObjectIdentifiersList': pathToObjectIdentifiersList,
    };
  }
}

/// Lists parent objects that are associated with a given object in pagination
/// fashion.
class BatchListObjectParents {
  final ObjectReference objectReference;

  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  BatchListObjectParents({
    required this.objectReference,
    this.maxResults,
    this.nextToken,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'ObjectReference': objectReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListObjectParents</a> response operation.
class BatchListObjectParentsResponse {
  /// The pagination token.
  final String? nextToken;

  /// Returns a list of parent reference and LinkName Tuples.
  final List<ObjectIdentifierAndLinkNameTuple>? parentLinks;

  BatchListObjectParentsResponse({
    this.nextToken,
    this.parentLinks,
  });

  factory BatchListObjectParentsResponse.fromJson(Map<String, dynamic> json) {
    return BatchListObjectParentsResponse(
      nextToken: json['NextToken'] as String?,
      parentLinks: (json['ParentLinks'] as List?)
          ?.whereNotNull()
          .map((e) => ObjectIdentifierAndLinkNameTuple.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final parentLinks = this.parentLinks;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (parentLinks != null) 'ParentLinks': parentLinks,
    };
  }
}

/// Returns policies attached to an object in pagination fashion inside a
/// <a>BatchRead</a> operation. For more information, see
/// <a>ListObjectPolicies</a> and <a>BatchReadRequest$Operations</a>.
class BatchListObjectPolicies {
  /// The reference that identifies the object whose attributes will be listed.
  final ObjectReference objectReference;

  /// The maximum number of results to retrieve.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  BatchListObjectPolicies({
    required this.objectReference,
    this.maxResults,
    this.nextToken,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'ObjectReference': objectReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListObjectPolicies</a> response operation.
class BatchListObjectPoliciesResponse {
  /// A list of policy <code>ObjectIdentifiers</code>, that are attached to the
  /// object.
  final List<String>? attachedPolicyIds;

  /// The pagination token.
  final String? nextToken;

  BatchListObjectPoliciesResponse({
    this.attachedPolicyIds,
    this.nextToken,
  });

  factory BatchListObjectPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return BatchListObjectPoliciesResponse(
      attachedPolicyIds: (json['AttachedPolicyIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachedPolicyIds = this.attachedPolicyIds;
    final nextToken = this.nextToken;
    return {
      if (attachedPolicyIds != null) 'AttachedPolicyIds': attachedPolicyIds,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Returns a paginated list of all the outgoing <a>TypedLinkSpecifier</a>
/// information for an object inside a <a>BatchRead</a> operation. For more
/// information, see <a>ListOutgoingTypedLinks</a> and
/// <a>BatchReadRequest$Operations</a>.
class BatchListOutgoingTypedLinks {
  /// The reference that identifies the object whose attributes will be listed.
  final ObjectReference objectReference;

  /// Provides range filters for multiple attributes. When providing ranges to
  /// typed link selection, any inexact ranges must be specified at the end. Any
  /// attributes that do not have a range specified are presumed to match the
  /// entire range.
  final List<TypedLinkAttributeRange>? filterAttributeRanges;

  /// Filters are interpreted in the order of the attributes defined on the typed
  /// link facet, not the order they are supplied to any API calls.
  final TypedLinkSchemaAndFacetName? filterTypedLink;

  /// The maximum number of results to retrieve.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  BatchListOutgoingTypedLinks({
    required this.objectReference,
    this.filterAttributeRanges,
    this.filterTypedLink,
    this.maxResults,
    this.nextToken,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final filterAttributeRanges = this.filterAttributeRanges;
    final filterTypedLink = this.filterTypedLink;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'ObjectReference': objectReference,
      if (filterAttributeRanges != null)
        'FilterAttributeRanges': filterAttributeRanges,
      if (filterTypedLink != null) 'FilterTypedLink': filterTypedLink,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListOutgoingTypedLinks</a> response operation.
class BatchListOutgoingTypedLinksResponse {
  /// The pagination token.
  final String? nextToken;

  /// Returns a typed link specifier as output.
  final List<TypedLinkSpecifier>? typedLinkSpecifiers;

  BatchListOutgoingTypedLinksResponse({
    this.nextToken,
    this.typedLinkSpecifiers,
  });

  factory BatchListOutgoingTypedLinksResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchListOutgoingTypedLinksResponse(
      nextToken: json['NextToken'] as String?,
      typedLinkSpecifiers: (json['TypedLinkSpecifiers'] as List?)
          ?.whereNotNull()
          .map((e) => TypedLinkSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final typedLinkSpecifiers = this.typedLinkSpecifiers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (typedLinkSpecifiers != null)
        'TypedLinkSpecifiers': typedLinkSpecifiers,
    };
  }
}

/// Returns all of the <code>ObjectIdentifiers</code> to which a given policy is
/// attached inside a <a>BatchRead</a> operation. For more information, see
/// <a>ListPolicyAttachments</a> and <a>BatchReadRequest$Operations</a>.
class BatchListPolicyAttachments {
  /// The reference that identifies the policy object.
  final ObjectReference policyReference;

  /// The maximum number of results to retrieve.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  BatchListPolicyAttachments({
    required this.policyReference,
    this.maxResults,
    this.nextToken,
  });

  Map<String, dynamic> toJson() {
    final policyReference = this.policyReference;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'PolicyReference': policyReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>ListPolicyAttachments</a> response operation.
class BatchListPolicyAttachmentsResponse {
  /// The pagination token.
  final String? nextToken;

  /// A list of <code>ObjectIdentifiers</code> to which the policy is attached.
  final List<String>? objectIdentifiers;

  BatchListPolicyAttachmentsResponse({
    this.nextToken,
    this.objectIdentifiers,
  });

  factory BatchListPolicyAttachmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchListPolicyAttachmentsResponse(
      nextToken: json['NextToken'] as String?,
      objectIdentifiers: (json['ObjectIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final objectIdentifiers = this.objectIdentifiers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (objectIdentifiers != null) 'ObjectIdentifiers': objectIdentifiers,
    };
  }
}

/// Lists all policies from the root of the Directory to the object specified
/// inside a <a>BatchRead</a> operation. For more information, see
/// <a>LookupPolicy</a> and <a>BatchReadRequest$Operations</a>.
class BatchLookupPolicy {
  /// Reference that identifies the object whose policies will be looked up.
  final ObjectReference objectReference;

  /// The maximum number of results to retrieve.
  final int? maxResults;

  /// The pagination token.
  final String? nextToken;

  BatchLookupPolicy({
    required this.objectReference,
    this.maxResults,
    this.nextToken,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'ObjectReference': objectReference,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output of a <a>LookupPolicy</a> response operation.
class BatchLookupPolicyResponse {
  /// The pagination token.
  final String? nextToken;

  /// Provides list of path to policies. Policies contain <code>PolicyId</code>,
  /// <code>ObjectIdentifier</code>, and <code>PolicyType</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
  final List<PolicyToPath>? policyToPathList;

  BatchLookupPolicyResponse({
    this.nextToken,
    this.policyToPathList,
  });

  factory BatchLookupPolicyResponse.fromJson(Map<String, dynamic> json) {
    return BatchLookupPolicyResponse(
      nextToken: json['NextToken'] as String?,
      policyToPathList: (json['PolicyToPathList'] as List?)
          ?.whereNotNull()
          .map((e) => PolicyToPath.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final policyToPathList = this.policyToPathList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (policyToPathList != null) 'PolicyToPathList': policyToPathList,
    };
  }
}

/// The batch read exception structure, which contains the exception type and
/// message.
class BatchReadException {
  /// An exception message that is associated with the failure.
  final String? message;

  /// A type of exception, such as <code>InvalidArnException</code>.
  final BatchReadExceptionType? type;

  BatchReadException({
    this.message,
    this.type,
  });

  factory BatchReadException.fromJson(Map<String, dynamic> json) {
    return BatchReadException(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)?.toBatchReadExceptionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum BatchReadExceptionType {
  validationException,
  invalidArnException,
  resourceNotFoundException,
  invalidNextTokenException,
  accessDeniedException,
  notNodeException,
  facetValidationException,
  cannotListParentOfRootException,
  notIndexException,
  notPolicyException,
  directoryNotEnabledException,
  limitExceededException,
  internalServiceException,
}

extension BatchReadExceptionTypeValueExtension on BatchReadExceptionType {
  String toValue() {
    switch (this) {
      case BatchReadExceptionType.validationException:
        return 'ValidationException';
      case BatchReadExceptionType.invalidArnException:
        return 'InvalidArnException';
      case BatchReadExceptionType.resourceNotFoundException:
        return 'ResourceNotFoundException';
      case BatchReadExceptionType.invalidNextTokenException:
        return 'InvalidNextTokenException';
      case BatchReadExceptionType.accessDeniedException:
        return 'AccessDeniedException';
      case BatchReadExceptionType.notNodeException:
        return 'NotNodeException';
      case BatchReadExceptionType.facetValidationException:
        return 'FacetValidationException';
      case BatchReadExceptionType.cannotListParentOfRootException:
        return 'CannotListParentOfRootException';
      case BatchReadExceptionType.notIndexException:
        return 'NotIndexException';
      case BatchReadExceptionType.notPolicyException:
        return 'NotPolicyException';
      case BatchReadExceptionType.directoryNotEnabledException:
        return 'DirectoryNotEnabledException';
      case BatchReadExceptionType.limitExceededException:
        return 'LimitExceededException';
      case BatchReadExceptionType.internalServiceException:
        return 'InternalServiceException';
    }
  }
}

extension BatchReadExceptionTypeFromString on String {
  BatchReadExceptionType toBatchReadExceptionType() {
    switch (this) {
      case 'ValidationException':
        return BatchReadExceptionType.validationException;
      case 'InvalidArnException':
        return BatchReadExceptionType.invalidArnException;
      case 'ResourceNotFoundException':
        return BatchReadExceptionType.resourceNotFoundException;
      case 'InvalidNextTokenException':
        return BatchReadExceptionType.invalidNextTokenException;
      case 'AccessDeniedException':
        return BatchReadExceptionType.accessDeniedException;
      case 'NotNodeException':
        return BatchReadExceptionType.notNodeException;
      case 'FacetValidationException':
        return BatchReadExceptionType.facetValidationException;
      case 'CannotListParentOfRootException':
        return BatchReadExceptionType.cannotListParentOfRootException;
      case 'NotIndexException':
        return BatchReadExceptionType.notIndexException;
      case 'NotPolicyException':
        return BatchReadExceptionType.notPolicyException;
      case 'DirectoryNotEnabledException':
        return BatchReadExceptionType.directoryNotEnabledException;
      case 'LimitExceededException':
        return BatchReadExceptionType.limitExceededException;
      case 'InternalServiceException':
        return BatchReadExceptionType.internalServiceException;
    }
    throw Exception('$this is not known in enum BatchReadExceptionType');
  }
}

/// Represents the output of a <code>BatchRead</code> operation.
class BatchReadOperation {
  /// Retrieves attributes that are associated with a typed link.
  final BatchGetLinkAttributes? getLinkAttributes;

  /// Retrieves attributes within a facet that are associated with an object.
  final BatchGetObjectAttributes? getObjectAttributes;

  /// Retrieves metadata about an object.
  final BatchGetObjectInformation? getObjectInformation;

  /// Lists indices attached to an object.
  final BatchListAttachedIndices? listAttachedIndices;

  /// Returns a paginated list of all the incoming <a>TypedLinkSpecifier</a>
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  final BatchListIncomingTypedLinks? listIncomingTypedLinks;

  /// Lists objects attached to the specified index.
  final BatchListIndex? listIndex;

  /// Lists all attributes that are associated with an object.
  final BatchListObjectAttributes? listObjectAttributes;

  /// Returns a paginated list of child objects that are associated with a given
  /// object.
  final BatchListObjectChildren? listObjectChildren;

  /// Retrieves all available parent paths for any object type such as node, leaf
  /// node, policy node, and index node objects. For more information about
  /// objects, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directorystructure.html">Directory
  /// Structure</a>.
  final BatchListObjectParentPaths? listObjectParentPaths;

  /// Lists parent objects that are associated with a given object in pagination
  /// fashion.
  final BatchListObjectParents? listObjectParents;

  /// Returns policies attached to an object in pagination fashion.
  final BatchListObjectPolicies? listObjectPolicies;

  /// Returns a paginated list of all the outgoing <a>TypedLinkSpecifier</a>
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  final BatchListOutgoingTypedLinks? listOutgoingTypedLinks;

  /// Returns all of the <code>ObjectIdentifiers</code> to which a given policy is
  /// attached.
  final BatchListPolicyAttachments? listPolicyAttachments;

  /// Lists all policies from the root of the <a>Directory</a> to the object
  /// specified. If there are no policies present, an empty list is returned. If
  /// policies are present, and if some objects don't have the policies attached,
  /// it returns the <code>ObjectIdentifier</code> for such objects. If policies
  /// are present, it returns <code>ObjectIdentifier</code>,
  /// <code>policyId</code>, and <code>policyType</code>. Paths that don't lead to
  /// the root from the target object are ignored. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
  final BatchLookupPolicy? lookupPolicy;

  BatchReadOperation({
    this.getLinkAttributes,
    this.getObjectAttributes,
    this.getObjectInformation,
    this.listAttachedIndices,
    this.listIncomingTypedLinks,
    this.listIndex,
    this.listObjectAttributes,
    this.listObjectChildren,
    this.listObjectParentPaths,
    this.listObjectParents,
    this.listObjectPolicies,
    this.listOutgoingTypedLinks,
    this.listPolicyAttachments,
    this.lookupPolicy,
  });

  Map<String, dynamic> toJson() {
    final getLinkAttributes = this.getLinkAttributes;
    final getObjectAttributes = this.getObjectAttributes;
    final getObjectInformation = this.getObjectInformation;
    final listAttachedIndices = this.listAttachedIndices;
    final listIncomingTypedLinks = this.listIncomingTypedLinks;
    final listIndex = this.listIndex;
    final listObjectAttributes = this.listObjectAttributes;
    final listObjectChildren = this.listObjectChildren;
    final listObjectParentPaths = this.listObjectParentPaths;
    final listObjectParents = this.listObjectParents;
    final listObjectPolicies = this.listObjectPolicies;
    final listOutgoingTypedLinks = this.listOutgoingTypedLinks;
    final listPolicyAttachments = this.listPolicyAttachments;
    final lookupPolicy = this.lookupPolicy;
    return {
      if (getLinkAttributes != null) 'GetLinkAttributes': getLinkAttributes,
      if (getObjectAttributes != null)
        'GetObjectAttributes': getObjectAttributes,
      if (getObjectInformation != null)
        'GetObjectInformation': getObjectInformation,
      if (listAttachedIndices != null)
        'ListAttachedIndices': listAttachedIndices,
      if (listIncomingTypedLinks != null)
        'ListIncomingTypedLinks': listIncomingTypedLinks,
      if (listIndex != null) 'ListIndex': listIndex,
      if (listObjectAttributes != null)
        'ListObjectAttributes': listObjectAttributes,
      if (listObjectChildren != null) 'ListObjectChildren': listObjectChildren,
      if (listObjectParentPaths != null)
        'ListObjectParentPaths': listObjectParentPaths,
      if (listObjectParents != null) 'ListObjectParents': listObjectParents,
      if (listObjectPolicies != null) 'ListObjectPolicies': listObjectPolicies,
      if (listOutgoingTypedLinks != null)
        'ListOutgoingTypedLinks': listOutgoingTypedLinks,
      if (listPolicyAttachments != null)
        'ListPolicyAttachments': listPolicyAttachments,
      if (lookupPolicy != null) 'LookupPolicy': lookupPolicy,
    };
  }
}

/// Represents the output of a <code>BatchRead</code> response operation.
class BatchReadOperationResponse {
  /// Identifies which operation in a batch has failed.
  final BatchReadException? exceptionResponse;

  /// Identifies which operation in a batch has succeeded.
  final BatchReadSuccessfulResponse? successfulResponse;

  BatchReadOperationResponse({
    this.exceptionResponse,
    this.successfulResponse,
  });

  factory BatchReadOperationResponse.fromJson(Map<String, dynamic> json) {
    return BatchReadOperationResponse(
      exceptionResponse: json['ExceptionResponse'] != null
          ? BatchReadException.fromJson(
              json['ExceptionResponse'] as Map<String, dynamic>)
          : null,
      successfulResponse: json['SuccessfulResponse'] != null
          ? BatchReadSuccessfulResponse.fromJson(
              json['SuccessfulResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exceptionResponse = this.exceptionResponse;
    final successfulResponse = this.successfulResponse;
    return {
      if (exceptionResponse != null) 'ExceptionResponse': exceptionResponse,
      if (successfulResponse != null) 'SuccessfulResponse': successfulResponse,
    };
  }
}

class BatchReadResponse {
  /// A list of all the responses for each batch read.
  final List<BatchReadOperationResponse>? responses;

  BatchReadResponse({
    this.responses,
  });

  factory BatchReadResponse.fromJson(Map<String, dynamic> json) {
    return BatchReadResponse(
      responses: (json['Responses'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchReadOperationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final responses = this.responses;
    return {
      if (responses != null) 'Responses': responses,
    };
  }
}

/// Represents the output of a <code>BatchRead</code> success response
/// operation.
class BatchReadSuccessfulResponse {
  /// The list of attributes to retrieve from the typed link.
  final BatchGetLinkAttributesResponse? getLinkAttributes;

  /// Retrieves attributes within a facet that are associated with an object.
  final BatchGetObjectAttributesResponse? getObjectAttributes;

  /// Retrieves metadata about an object.
  final BatchGetObjectInformationResponse? getObjectInformation;

  /// Lists indices attached to an object.
  final BatchListAttachedIndicesResponse? listAttachedIndices;

  /// Returns a paginated list of all the incoming <a>TypedLinkSpecifier</a>
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  final BatchListIncomingTypedLinksResponse? listIncomingTypedLinks;

  /// Lists objects attached to the specified index.
  final BatchListIndexResponse? listIndex;

  /// Lists all attributes that are associated with an object.
  final BatchListObjectAttributesResponse? listObjectAttributes;

  /// Returns a paginated list of child objects that are associated with a given
  /// object.
  final BatchListObjectChildrenResponse? listObjectChildren;

  /// Retrieves all available parent paths for any object type such as node, leaf
  /// node, policy node, and index node objects. For more information about
  /// objects, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directorystructure.html">Directory
  /// Structure</a>.
  final BatchListObjectParentPathsResponse? listObjectParentPaths;

  /// The list of parent objects to retrieve.
  final BatchListObjectParentsResponse? listObjectParents;

  /// Returns policies attached to an object in pagination fashion.
  final BatchListObjectPoliciesResponse? listObjectPolicies;

  /// Returns a paginated list of all the outgoing <a>TypedLinkSpecifier</a>
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  final BatchListOutgoingTypedLinksResponse? listOutgoingTypedLinks;

  /// Returns all of the <code>ObjectIdentifiers</code> to which a given policy is
  /// attached.
  final BatchListPolicyAttachmentsResponse? listPolicyAttachments;

  /// Lists all policies from the root of the <a>Directory</a> to the object
  /// specified. If there are no policies present, an empty list is returned. If
  /// policies are present, and if some objects don't have the policies attached,
  /// it returns the <code>ObjectIdentifier</code> for such objects. If policies
  /// are present, it returns <code>ObjectIdentifier</code>,
  /// <code>policyId</code>, and <code>policyType</code>. Paths that don't lead to
  /// the root from the target object are ignored. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
  final BatchLookupPolicyResponse? lookupPolicy;

  BatchReadSuccessfulResponse({
    this.getLinkAttributes,
    this.getObjectAttributes,
    this.getObjectInformation,
    this.listAttachedIndices,
    this.listIncomingTypedLinks,
    this.listIndex,
    this.listObjectAttributes,
    this.listObjectChildren,
    this.listObjectParentPaths,
    this.listObjectParents,
    this.listObjectPolicies,
    this.listOutgoingTypedLinks,
    this.listPolicyAttachments,
    this.lookupPolicy,
  });

  factory BatchReadSuccessfulResponse.fromJson(Map<String, dynamic> json) {
    return BatchReadSuccessfulResponse(
      getLinkAttributes: json['GetLinkAttributes'] != null
          ? BatchGetLinkAttributesResponse.fromJson(
              json['GetLinkAttributes'] as Map<String, dynamic>)
          : null,
      getObjectAttributes: json['GetObjectAttributes'] != null
          ? BatchGetObjectAttributesResponse.fromJson(
              json['GetObjectAttributes'] as Map<String, dynamic>)
          : null,
      getObjectInformation: json['GetObjectInformation'] != null
          ? BatchGetObjectInformationResponse.fromJson(
              json['GetObjectInformation'] as Map<String, dynamic>)
          : null,
      listAttachedIndices: json['ListAttachedIndices'] != null
          ? BatchListAttachedIndicesResponse.fromJson(
              json['ListAttachedIndices'] as Map<String, dynamic>)
          : null,
      listIncomingTypedLinks: json['ListIncomingTypedLinks'] != null
          ? BatchListIncomingTypedLinksResponse.fromJson(
              json['ListIncomingTypedLinks'] as Map<String, dynamic>)
          : null,
      listIndex: json['ListIndex'] != null
          ? BatchListIndexResponse.fromJson(
              json['ListIndex'] as Map<String, dynamic>)
          : null,
      listObjectAttributes: json['ListObjectAttributes'] != null
          ? BatchListObjectAttributesResponse.fromJson(
              json['ListObjectAttributes'] as Map<String, dynamic>)
          : null,
      listObjectChildren: json['ListObjectChildren'] != null
          ? BatchListObjectChildrenResponse.fromJson(
              json['ListObjectChildren'] as Map<String, dynamic>)
          : null,
      listObjectParentPaths: json['ListObjectParentPaths'] != null
          ? BatchListObjectParentPathsResponse.fromJson(
              json['ListObjectParentPaths'] as Map<String, dynamic>)
          : null,
      listObjectParents: json['ListObjectParents'] != null
          ? BatchListObjectParentsResponse.fromJson(
              json['ListObjectParents'] as Map<String, dynamic>)
          : null,
      listObjectPolicies: json['ListObjectPolicies'] != null
          ? BatchListObjectPoliciesResponse.fromJson(
              json['ListObjectPolicies'] as Map<String, dynamic>)
          : null,
      listOutgoingTypedLinks: json['ListOutgoingTypedLinks'] != null
          ? BatchListOutgoingTypedLinksResponse.fromJson(
              json['ListOutgoingTypedLinks'] as Map<String, dynamic>)
          : null,
      listPolicyAttachments: json['ListPolicyAttachments'] != null
          ? BatchListPolicyAttachmentsResponse.fromJson(
              json['ListPolicyAttachments'] as Map<String, dynamic>)
          : null,
      lookupPolicy: json['LookupPolicy'] != null
          ? BatchLookupPolicyResponse.fromJson(
              json['LookupPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final getLinkAttributes = this.getLinkAttributes;
    final getObjectAttributes = this.getObjectAttributes;
    final getObjectInformation = this.getObjectInformation;
    final listAttachedIndices = this.listAttachedIndices;
    final listIncomingTypedLinks = this.listIncomingTypedLinks;
    final listIndex = this.listIndex;
    final listObjectAttributes = this.listObjectAttributes;
    final listObjectChildren = this.listObjectChildren;
    final listObjectParentPaths = this.listObjectParentPaths;
    final listObjectParents = this.listObjectParents;
    final listObjectPolicies = this.listObjectPolicies;
    final listOutgoingTypedLinks = this.listOutgoingTypedLinks;
    final listPolicyAttachments = this.listPolicyAttachments;
    final lookupPolicy = this.lookupPolicy;
    return {
      if (getLinkAttributes != null) 'GetLinkAttributes': getLinkAttributes,
      if (getObjectAttributes != null)
        'GetObjectAttributes': getObjectAttributes,
      if (getObjectInformation != null)
        'GetObjectInformation': getObjectInformation,
      if (listAttachedIndices != null)
        'ListAttachedIndices': listAttachedIndices,
      if (listIncomingTypedLinks != null)
        'ListIncomingTypedLinks': listIncomingTypedLinks,
      if (listIndex != null) 'ListIndex': listIndex,
      if (listObjectAttributes != null)
        'ListObjectAttributes': listObjectAttributes,
      if (listObjectChildren != null) 'ListObjectChildren': listObjectChildren,
      if (listObjectParentPaths != null)
        'ListObjectParentPaths': listObjectParentPaths,
      if (listObjectParents != null) 'ListObjectParents': listObjectParents,
      if (listObjectPolicies != null) 'ListObjectPolicies': listObjectPolicies,
      if (listOutgoingTypedLinks != null)
        'ListOutgoingTypedLinks': listOutgoingTypedLinks,
      if (listPolicyAttachments != null)
        'ListPolicyAttachments': listPolicyAttachments,
      if (lookupPolicy != null) 'LookupPolicy': lookupPolicy,
    };
  }
}

/// A batch operation to remove a facet from an object.
class BatchRemoveFacetFromObject {
  /// A reference to the object whose facet will be removed.
  final ObjectReference objectReference;

  /// The facet to remove from the object.
  final SchemaFacet schemaFacet;

  BatchRemoveFacetFromObject({
    required this.objectReference,
    required this.schemaFacet,
  });

  Map<String, dynamic> toJson() {
    final objectReference = this.objectReference;
    final schemaFacet = this.schemaFacet;
    return {
      'ObjectReference': objectReference,
      'SchemaFacet': schemaFacet,
    };
  }
}

/// An empty result that represents success.
class BatchRemoveFacetFromObjectResponse {
  BatchRemoveFacetFromObjectResponse();

  factory BatchRemoveFacetFromObjectResponse.fromJson(Map<String, dynamic> _) {
    return BatchRemoveFacetFromObjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Updates a given typed link’s attributes inside a <a>BatchRead</a> operation.
/// Attributes to be updated must not contribute to the typed link’s identity,
/// as defined by its <code>IdentityAttributeOrder</code>. For more information,
/// see <a>UpdateLinkAttributes</a> and <a>BatchReadRequest$Operations</a>.
class BatchUpdateLinkAttributes {
  /// The attributes update structure.
  final List<LinkAttributeUpdate> attributeUpdates;

  /// Allows a typed link specifier to be accepted as input.
  final TypedLinkSpecifier typedLinkSpecifier;

  BatchUpdateLinkAttributes({
    required this.attributeUpdates,
    required this.typedLinkSpecifier,
  });

  Map<String, dynamic> toJson() {
    final attributeUpdates = this.attributeUpdates;
    final typedLinkSpecifier = this.typedLinkSpecifier;
    return {
      'AttributeUpdates': attributeUpdates,
      'TypedLinkSpecifier': typedLinkSpecifier,
    };
  }
}

/// Represents the output of a <a>UpdateLinkAttributes</a> response operation.
class BatchUpdateLinkAttributesResponse {
  BatchUpdateLinkAttributesResponse();

  factory BatchUpdateLinkAttributesResponse.fromJson(Map<String, dynamic> _) {
    return BatchUpdateLinkAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the output of a <code>BatchUpdate</code> operation.
class BatchUpdateObjectAttributes {
  /// Attributes update structure.
  final List<ObjectAttributeUpdate> attributeUpdates;

  /// Reference that identifies the object.
  final ObjectReference objectReference;

  BatchUpdateObjectAttributes({
    required this.attributeUpdates,
    required this.objectReference,
  });

  Map<String, dynamic> toJson() {
    final attributeUpdates = this.attributeUpdates;
    final objectReference = this.objectReference;
    return {
      'AttributeUpdates': attributeUpdates,
      'ObjectReference': objectReference,
    };
  }
}

/// Represents the output of a <code>BatchUpdate</code> response operation.
class BatchUpdateObjectAttributesResponse {
  /// ID that is associated with the object.
  final String? objectIdentifier;

  BatchUpdateObjectAttributesResponse({
    this.objectIdentifier,
  });

  factory BatchUpdateObjectAttributesResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateObjectAttributesResponse(
      objectIdentifier: json['ObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
    };
  }
}

/// Represents the output of a <code>BatchWrite</code> operation.
class BatchWriteOperation {
  /// A batch operation that adds a facet to an object.
  final BatchAddFacetToObject? addFacetToObject;

  /// Attaches an object to a <a>Directory</a>.
  final BatchAttachObject? attachObject;

  /// Attaches a policy object to a regular object. An object can have a limited
  /// number of attached policies.
  final BatchAttachPolicy? attachPolicy;

  /// Attaches the specified object to the specified index.
  final BatchAttachToIndex? attachToIndex;

  /// Attaches a typed link to a specified source and target object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  final BatchAttachTypedLink? attachTypedLink;

  /// Creates an index object. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/indexing_search.htm">Indexing
  /// and search</a> for more information.
  final BatchCreateIndex? createIndex;

  /// Creates an object.
  final BatchCreateObject? createObject;

  /// Deletes an object in a <a>Directory</a>.
  final BatchDeleteObject? deleteObject;

  /// Detaches the specified object from the specified index.
  final BatchDetachFromIndex? detachFromIndex;

  /// Detaches an object from a <a>Directory</a>.
  final BatchDetachObject? detachObject;

  /// Detaches a policy from a <a>Directory</a>.
  final BatchDetachPolicy? detachPolicy;

  /// Detaches a typed link from a specified source and target object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  final BatchDetachTypedLink? detachTypedLink;

  /// A batch operation that removes a facet from an object.
  final BatchRemoveFacetFromObject? removeFacetFromObject;

  /// Updates a given object's attributes.
  final BatchUpdateLinkAttributes? updateLinkAttributes;

  /// Updates a given object's attributes.
  final BatchUpdateObjectAttributes? updateObjectAttributes;

  BatchWriteOperation({
    this.addFacetToObject,
    this.attachObject,
    this.attachPolicy,
    this.attachToIndex,
    this.attachTypedLink,
    this.createIndex,
    this.createObject,
    this.deleteObject,
    this.detachFromIndex,
    this.detachObject,
    this.detachPolicy,
    this.detachTypedLink,
    this.removeFacetFromObject,
    this.updateLinkAttributes,
    this.updateObjectAttributes,
  });

  Map<String, dynamic> toJson() {
    final addFacetToObject = this.addFacetToObject;
    final attachObject = this.attachObject;
    final attachPolicy = this.attachPolicy;
    final attachToIndex = this.attachToIndex;
    final attachTypedLink = this.attachTypedLink;
    final createIndex = this.createIndex;
    final createObject = this.createObject;
    final deleteObject = this.deleteObject;
    final detachFromIndex = this.detachFromIndex;
    final detachObject = this.detachObject;
    final detachPolicy = this.detachPolicy;
    final detachTypedLink = this.detachTypedLink;
    final removeFacetFromObject = this.removeFacetFromObject;
    final updateLinkAttributes = this.updateLinkAttributes;
    final updateObjectAttributes = this.updateObjectAttributes;
    return {
      if (addFacetToObject != null) 'AddFacetToObject': addFacetToObject,
      if (attachObject != null) 'AttachObject': attachObject,
      if (attachPolicy != null) 'AttachPolicy': attachPolicy,
      if (attachToIndex != null) 'AttachToIndex': attachToIndex,
      if (attachTypedLink != null) 'AttachTypedLink': attachTypedLink,
      if (createIndex != null) 'CreateIndex': createIndex,
      if (createObject != null) 'CreateObject': createObject,
      if (deleteObject != null) 'DeleteObject': deleteObject,
      if (detachFromIndex != null) 'DetachFromIndex': detachFromIndex,
      if (detachObject != null) 'DetachObject': detachObject,
      if (detachPolicy != null) 'DetachPolicy': detachPolicy,
      if (detachTypedLink != null) 'DetachTypedLink': detachTypedLink,
      if (removeFacetFromObject != null)
        'RemoveFacetFromObject': removeFacetFromObject,
      if (updateLinkAttributes != null)
        'UpdateLinkAttributes': updateLinkAttributes,
      if (updateObjectAttributes != null)
        'UpdateObjectAttributes': updateObjectAttributes,
    };
  }
}

/// Represents the output of a <code>BatchWrite</code> response operation.
class BatchWriteOperationResponse {
  /// The result of an add facet to object batch operation.
  final BatchAddFacetToObjectResponse? addFacetToObject;

  /// Attaches an object to a <a>Directory</a>.
  final BatchAttachObjectResponse? attachObject;

  /// Attaches a policy object to a regular object. An object can have a limited
  /// number of attached policies.
  final BatchAttachPolicyResponse? attachPolicy;

  /// Attaches the specified object to the specified index.
  final BatchAttachToIndexResponse? attachToIndex;

  /// Attaches a typed link to a specified source and target object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  final BatchAttachTypedLinkResponse? attachTypedLink;

  /// Creates an index object. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/indexing_search.htm">Indexing
  /// and search</a> for more information.
  final BatchCreateIndexResponse? createIndex;

  /// Creates an object in a <a>Directory</a>.
  final BatchCreateObjectResponse? createObject;

  /// Deletes an object in a <a>Directory</a>.
  final BatchDeleteObjectResponse? deleteObject;

  /// Detaches the specified object from the specified index.
  final BatchDetachFromIndexResponse? detachFromIndex;

  /// Detaches an object from a <a>Directory</a>.
  final BatchDetachObjectResponse? detachObject;

  /// Detaches a policy from a <a>Directory</a>.
  final BatchDetachPolicyResponse? detachPolicy;

  /// Detaches a typed link from a specified source and target object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  final BatchDetachTypedLinkResponse? detachTypedLink;

  /// The result of a batch remove facet from object operation.
  final BatchRemoveFacetFromObjectResponse? removeFacetFromObject;

  /// Represents the output of a <code>BatchWrite</code> response operation.
  final BatchUpdateLinkAttributesResponse? updateLinkAttributes;

  /// Updates a given object’s attributes.
  final BatchUpdateObjectAttributesResponse? updateObjectAttributes;

  BatchWriteOperationResponse({
    this.addFacetToObject,
    this.attachObject,
    this.attachPolicy,
    this.attachToIndex,
    this.attachTypedLink,
    this.createIndex,
    this.createObject,
    this.deleteObject,
    this.detachFromIndex,
    this.detachObject,
    this.detachPolicy,
    this.detachTypedLink,
    this.removeFacetFromObject,
    this.updateLinkAttributes,
    this.updateObjectAttributes,
  });

  factory BatchWriteOperationResponse.fromJson(Map<String, dynamic> json) {
    return BatchWriteOperationResponse(
      addFacetToObject: json['AddFacetToObject'] != null
          ? BatchAddFacetToObjectResponse.fromJson(
              json['AddFacetToObject'] as Map<String, dynamic>)
          : null,
      attachObject: json['AttachObject'] != null
          ? BatchAttachObjectResponse.fromJson(
              json['AttachObject'] as Map<String, dynamic>)
          : null,
      attachPolicy: json['AttachPolicy'] != null
          ? BatchAttachPolicyResponse.fromJson(
              json['AttachPolicy'] as Map<String, dynamic>)
          : null,
      attachToIndex: json['AttachToIndex'] != null
          ? BatchAttachToIndexResponse.fromJson(
              json['AttachToIndex'] as Map<String, dynamic>)
          : null,
      attachTypedLink: json['AttachTypedLink'] != null
          ? BatchAttachTypedLinkResponse.fromJson(
              json['AttachTypedLink'] as Map<String, dynamic>)
          : null,
      createIndex: json['CreateIndex'] != null
          ? BatchCreateIndexResponse.fromJson(
              json['CreateIndex'] as Map<String, dynamic>)
          : null,
      createObject: json['CreateObject'] != null
          ? BatchCreateObjectResponse.fromJson(
              json['CreateObject'] as Map<String, dynamic>)
          : null,
      deleteObject: json['DeleteObject'] != null
          ? BatchDeleteObjectResponse.fromJson(
              json['DeleteObject'] as Map<String, dynamic>)
          : null,
      detachFromIndex: json['DetachFromIndex'] != null
          ? BatchDetachFromIndexResponse.fromJson(
              json['DetachFromIndex'] as Map<String, dynamic>)
          : null,
      detachObject: json['DetachObject'] != null
          ? BatchDetachObjectResponse.fromJson(
              json['DetachObject'] as Map<String, dynamic>)
          : null,
      detachPolicy: json['DetachPolicy'] != null
          ? BatchDetachPolicyResponse.fromJson(
              json['DetachPolicy'] as Map<String, dynamic>)
          : null,
      detachTypedLink: json['DetachTypedLink'] != null
          ? BatchDetachTypedLinkResponse.fromJson(
              json['DetachTypedLink'] as Map<String, dynamic>)
          : null,
      removeFacetFromObject: json['RemoveFacetFromObject'] != null
          ? BatchRemoveFacetFromObjectResponse.fromJson(
              json['RemoveFacetFromObject'] as Map<String, dynamic>)
          : null,
      updateLinkAttributes: json['UpdateLinkAttributes'] != null
          ? BatchUpdateLinkAttributesResponse.fromJson(
              json['UpdateLinkAttributes'] as Map<String, dynamic>)
          : null,
      updateObjectAttributes: json['UpdateObjectAttributes'] != null
          ? BatchUpdateObjectAttributesResponse.fromJson(
              json['UpdateObjectAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addFacetToObject = this.addFacetToObject;
    final attachObject = this.attachObject;
    final attachPolicy = this.attachPolicy;
    final attachToIndex = this.attachToIndex;
    final attachTypedLink = this.attachTypedLink;
    final createIndex = this.createIndex;
    final createObject = this.createObject;
    final deleteObject = this.deleteObject;
    final detachFromIndex = this.detachFromIndex;
    final detachObject = this.detachObject;
    final detachPolicy = this.detachPolicy;
    final detachTypedLink = this.detachTypedLink;
    final removeFacetFromObject = this.removeFacetFromObject;
    final updateLinkAttributes = this.updateLinkAttributes;
    final updateObjectAttributes = this.updateObjectAttributes;
    return {
      if (addFacetToObject != null) 'AddFacetToObject': addFacetToObject,
      if (attachObject != null) 'AttachObject': attachObject,
      if (attachPolicy != null) 'AttachPolicy': attachPolicy,
      if (attachToIndex != null) 'AttachToIndex': attachToIndex,
      if (attachTypedLink != null) 'AttachTypedLink': attachTypedLink,
      if (createIndex != null) 'CreateIndex': createIndex,
      if (createObject != null) 'CreateObject': createObject,
      if (deleteObject != null) 'DeleteObject': deleteObject,
      if (detachFromIndex != null) 'DetachFromIndex': detachFromIndex,
      if (detachObject != null) 'DetachObject': detachObject,
      if (detachPolicy != null) 'DetachPolicy': detachPolicy,
      if (detachTypedLink != null) 'DetachTypedLink': detachTypedLink,
      if (removeFacetFromObject != null)
        'RemoveFacetFromObject': removeFacetFromObject,
      if (updateLinkAttributes != null)
        'UpdateLinkAttributes': updateLinkAttributes,
      if (updateObjectAttributes != null)
        'UpdateObjectAttributes': updateObjectAttributes,
    };
  }
}

class BatchWriteResponse {
  /// A list of all the responses for each batch write.
  final List<BatchWriteOperationResponse>? responses;

  BatchWriteResponse({
    this.responses,
  });

  factory BatchWriteResponse.fromJson(Map<String, dynamic> json) {
    return BatchWriteResponse(
      responses: (json['Responses'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchWriteOperationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final responses = this.responses;
    return {
      if (responses != null) 'Responses': responses,
    };
  }
}

enum ConsistencyLevel {
  serializable,
  eventual,
}

extension ConsistencyLevelValueExtension on ConsistencyLevel {
  String toValue() {
    switch (this) {
      case ConsistencyLevel.serializable:
        return 'SERIALIZABLE';
      case ConsistencyLevel.eventual:
        return 'EVENTUAL';
    }
  }
}

extension ConsistencyLevelFromString on String {
  ConsistencyLevel toConsistencyLevel() {
    switch (this) {
      case 'SERIALIZABLE':
        return ConsistencyLevel.serializable;
      case 'EVENTUAL':
        return ConsistencyLevel.eventual;
    }
    throw Exception('$this is not known in enum ConsistencyLevel');
  }
}

class CreateDirectoryResponse {
  /// The ARN of the published schema in the <a>Directory</a>. Once a published
  /// schema is copied into the directory, it has its own ARN, which is referred
  /// to applied schema ARN. For more information, see <a>arns</a>.
  final String appliedSchemaArn;

  /// The ARN that is associated with the <a>Directory</a>. For more information,
  /// see <a>arns</a>.
  final String directoryArn;

  /// The name of the <a>Directory</a>.
  final String name;

  /// The root object node of the created directory.
  final String objectIdentifier;

  CreateDirectoryResponse({
    required this.appliedSchemaArn,
    required this.directoryArn,
    required this.name,
    required this.objectIdentifier,
  });

  factory CreateDirectoryResponse.fromJson(Map<String, dynamic> json) {
    return CreateDirectoryResponse(
      appliedSchemaArn: json['AppliedSchemaArn'] as String,
      directoryArn: json['DirectoryArn'] as String,
      name: json['Name'] as String,
      objectIdentifier: json['ObjectIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final appliedSchemaArn = this.appliedSchemaArn;
    final directoryArn = this.directoryArn;
    final name = this.name;
    final objectIdentifier = this.objectIdentifier;
    return {
      'AppliedSchemaArn': appliedSchemaArn,
      'DirectoryArn': directoryArn,
      'Name': name,
      'ObjectIdentifier': objectIdentifier,
    };
  }
}

class CreateFacetResponse {
  CreateFacetResponse();

  factory CreateFacetResponse.fromJson(Map<String, dynamic> _) {
    return CreateFacetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateIndexResponse {
  /// The <code>ObjectIdentifier</code> of the index created by this operation.
  final String? objectIdentifier;

  CreateIndexResponse({
    this.objectIdentifier,
  });

  factory CreateIndexResponse.fromJson(Map<String, dynamic> json) {
    return CreateIndexResponse(
      objectIdentifier: json['ObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
    };
  }
}

class CreateObjectResponse {
  /// The identifier that is associated with the object.
  final String? objectIdentifier;

  CreateObjectResponse({
    this.objectIdentifier,
  });

  factory CreateObjectResponse.fromJson(Map<String, dynamic> json) {
    return CreateObjectResponse(
      objectIdentifier: json['ObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
    };
  }
}

class CreateSchemaResponse {
  /// The Amazon Resource Name (ARN) that is associated with the schema. For more
  /// information, see <a>arns</a>.
  final String? schemaArn;

  CreateSchemaResponse({
    this.schemaArn,
  });

  factory CreateSchemaResponse.fromJson(Map<String, dynamic> json) {
    return CreateSchemaResponse(
      schemaArn: json['SchemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaArn = this.schemaArn;
    return {
      if (schemaArn != null) 'SchemaArn': schemaArn,
    };
  }
}

class CreateTypedLinkFacetResponse {
  CreateTypedLinkFacetResponse();

  factory CreateTypedLinkFacetResponse.fromJson(Map<String, dynamic> _) {
    return CreateTypedLinkFacetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDirectoryResponse {
  /// The ARN of the deleted directory.
  final String directoryArn;

  DeleteDirectoryResponse({
    required this.directoryArn,
  });

  factory DeleteDirectoryResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDirectoryResponse(
      directoryArn: json['DirectoryArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryArn = this.directoryArn;
    return {
      'DirectoryArn': directoryArn,
    };
  }
}

class DeleteFacetResponse {
  DeleteFacetResponse();

  factory DeleteFacetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFacetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteObjectResponse {
  DeleteObjectResponse();

  factory DeleteObjectResponse.fromJson(Map<String, dynamic> _) {
    return DeleteObjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSchemaResponse {
  /// The input ARN that is returned as part of the response. For more
  /// information, see <a>arns</a>.
  final String? schemaArn;

  DeleteSchemaResponse({
    this.schemaArn,
  });

  factory DeleteSchemaResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSchemaResponse(
      schemaArn: json['SchemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaArn = this.schemaArn;
    return {
      if (schemaArn != null) 'SchemaArn': schemaArn,
    };
  }
}

class DeleteTypedLinkFacetResponse {
  DeleteTypedLinkFacetResponse();

  factory DeleteTypedLinkFacetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTypedLinkFacetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DetachFromIndexResponse {
  /// The <code>ObjectIdentifier</code> of the object that was detached from the
  /// index.
  final String? detachedObjectIdentifier;

  DetachFromIndexResponse({
    this.detachedObjectIdentifier,
  });

  factory DetachFromIndexResponse.fromJson(Map<String, dynamic> json) {
    return DetachFromIndexResponse(
      detachedObjectIdentifier: json['DetachedObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detachedObjectIdentifier = this.detachedObjectIdentifier;
    return {
      if (detachedObjectIdentifier != null)
        'DetachedObjectIdentifier': detachedObjectIdentifier,
    };
  }
}

class DetachObjectResponse {
  /// The <code>ObjectIdentifier</code> that was detached from the object.
  final String? detachedObjectIdentifier;

  DetachObjectResponse({
    this.detachedObjectIdentifier,
  });

  factory DetachObjectResponse.fromJson(Map<String, dynamic> json) {
    return DetachObjectResponse(
      detachedObjectIdentifier: json['DetachedObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detachedObjectIdentifier = this.detachedObjectIdentifier;
    return {
      if (detachedObjectIdentifier != null)
        'DetachedObjectIdentifier': detachedObjectIdentifier,
    };
  }
}

class DetachPolicyResponse {
  DetachPolicyResponse();

  factory DetachPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DetachPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Directory structure that includes the directory name and directory ARN.
class Directory {
  /// The date and time when the directory was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) that is associated with the directory. For
  /// more information, see <a>arns</a>.
  final String? directoryArn;

  /// The name of the directory.
  final String? name;

  /// The state of the directory. Can be either <code>Enabled</code>,
  /// <code>Disabled</code>, or <code>Deleted</code>.
  final DirectoryState? state;

  Directory({
    this.creationDateTime,
    this.directoryArn,
    this.name,
    this.state,
  });

  factory Directory.fromJson(Map<String, dynamic> json) {
    return Directory(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      directoryArn: json['DirectoryArn'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toDirectoryState(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final directoryArn = this.directoryArn;
    final name = this.name;
    final state = this.state;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (directoryArn != null) 'DirectoryArn': directoryArn,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum DirectoryState {
  enabled,
  disabled,
  deleted,
}

extension DirectoryStateValueExtension on DirectoryState {
  String toValue() {
    switch (this) {
      case DirectoryState.enabled:
        return 'ENABLED';
      case DirectoryState.disabled:
        return 'DISABLED';
      case DirectoryState.deleted:
        return 'DELETED';
    }
  }
}

extension DirectoryStateFromString on String {
  DirectoryState toDirectoryState() {
    switch (this) {
      case 'ENABLED':
        return DirectoryState.enabled;
      case 'DISABLED':
        return DirectoryState.disabled;
      case 'DELETED':
        return DirectoryState.deleted;
    }
    throw Exception('$this is not known in enum DirectoryState');
  }
}

class DisableDirectoryResponse {
  /// The ARN of the directory that has been disabled.
  final String directoryArn;

  DisableDirectoryResponse({
    required this.directoryArn,
  });

  factory DisableDirectoryResponse.fromJson(Map<String, dynamic> json) {
    return DisableDirectoryResponse(
      directoryArn: json['DirectoryArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryArn = this.directoryArn;
    return {
      'DirectoryArn': directoryArn,
    };
  }
}

class EnableDirectoryResponse {
  /// The ARN of the enabled directory.
  final String directoryArn;

  EnableDirectoryResponse({
    required this.directoryArn,
  });

  factory EnableDirectoryResponse.fromJson(Map<String, dynamic> json) {
    return EnableDirectoryResponse(
      directoryArn: json['DirectoryArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryArn = this.directoryArn;
    return {
      'DirectoryArn': directoryArn,
    };
  }
}

/// A structure that contains <code>Name</code>, <code>ARN</code>,
/// <code>Attributes</code>, <code> <a>Rule</a>s</code>, and
/// <code>ObjectTypes</code>. See <a
/// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_whatarefacets.html">Facets</a>
/// for more information.
class Facet {
  /// There are two different styles that you can define on any given facet,
  /// <code>Static</code> and <code>Dynamic</code>. For static facets, all
  /// attributes must be defined in the schema. For dynamic facets, attributes can
  /// be defined during data plane operations.
  final FacetStyle? facetStyle;

  /// The name of the <a>Facet</a>.
  final String? name;

  /// The object type that is associated with the facet. See
  /// <a>CreateFacetRequest$ObjectType</a> for more details.
  final ObjectType? objectType;

  Facet({
    this.facetStyle,
    this.name,
    this.objectType,
  });

  factory Facet.fromJson(Map<String, dynamic> json) {
    return Facet(
      facetStyle: (json['FacetStyle'] as String?)?.toFacetStyle(),
      name: json['Name'] as String?,
      objectType: (json['ObjectType'] as String?)?.toObjectType(),
    );
  }

  Map<String, dynamic> toJson() {
    final facetStyle = this.facetStyle;
    final name = this.name;
    final objectType = this.objectType;
    return {
      if (facetStyle != null) 'FacetStyle': facetStyle.toValue(),
      if (name != null) 'Name': name,
      if (objectType != null) 'ObjectType': objectType.toValue(),
    };
  }
}

/// An attribute that is associated with the <a>Facet</a>.
class FacetAttribute {
  /// The name of the facet attribute.
  final String name;

  /// A facet attribute consists of either a definition or a reference. This
  /// structure contains the attribute definition. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_attributereferences.html">Attribute
  /// References</a> for more information.
  final FacetAttributeDefinition? attributeDefinition;

  /// An attribute reference that is associated with the attribute. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_attributereferences.html">Attribute
  /// References</a> for more information.
  final FacetAttributeReference? attributeReference;

  /// The required behavior of the <code>FacetAttribute</code>.
  final RequiredAttributeBehavior? requiredBehavior;

  FacetAttribute({
    required this.name,
    this.attributeDefinition,
    this.attributeReference,
    this.requiredBehavior,
  });

  factory FacetAttribute.fromJson(Map<String, dynamic> json) {
    return FacetAttribute(
      name: json['Name'] as String,
      attributeDefinition: json['AttributeDefinition'] != null
          ? FacetAttributeDefinition.fromJson(
              json['AttributeDefinition'] as Map<String, dynamic>)
          : null,
      attributeReference: json['AttributeReference'] != null
          ? FacetAttributeReference.fromJson(
              json['AttributeReference'] as Map<String, dynamic>)
          : null,
      requiredBehavior:
          (json['RequiredBehavior'] as String?)?.toRequiredAttributeBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final attributeDefinition = this.attributeDefinition;
    final attributeReference = this.attributeReference;
    final requiredBehavior = this.requiredBehavior;
    return {
      'Name': name,
      if (attributeDefinition != null)
        'AttributeDefinition': attributeDefinition,
      if (attributeReference != null) 'AttributeReference': attributeReference,
      if (requiredBehavior != null)
        'RequiredBehavior': requiredBehavior.toValue(),
    };
  }
}

/// A facet attribute definition. See <a
/// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_attributereferences.html">Attribute
/// References</a> for more information.
class FacetAttributeDefinition {
  /// The type of the attribute.
  final FacetAttributeType type;

  /// The default value of the attribute (if configured).
  final TypedAttributeValue? defaultValue;

  /// Whether the attribute is mutable or not.
  final bool? isImmutable;

  /// Validation rules attached to the attribute definition.
  final Map<String, Rule>? rules;

  FacetAttributeDefinition({
    required this.type,
    this.defaultValue,
    this.isImmutable,
    this.rules,
  });

  factory FacetAttributeDefinition.fromJson(Map<String, dynamic> json) {
    return FacetAttributeDefinition(
      type: (json['Type'] as String).toFacetAttributeType(),
      defaultValue: json['DefaultValue'] != null
          ? TypedAttributeValue.fromJson(
              json['DefaultValue'] as Map<String, dynamic>)
          : null,
      isImmutable: json['IsImmutable'] as bool?,
      rules: (json['Rules'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Rule.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final defaultValue = this.defaultValue;
    final isImmutable = this.isImmutable;
    final rules = this.rules;
    return {
      'Type': type.toValue(),
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (isImmutable != null) 'IsImmutable': isImmutable,
      if (rules != null) 'Rules': rules,
    };
  }
}

/// The facet attribute reference that specifies the attribute definition that
/// contains the attribute facet name and attribute name.
class FacetAttributeReference {
  /// The target attribute name that is associated with the facet reference. See
  /// <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_attributereferences.html">Attribute
  /// References</a> for more information.
  final String targetAttributeName;

  /// The target facet name that is associated with the facet reference. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_attributereferences.html">Attribute
  /// References</a> for more information.
  final String targetFacetName;

  FacetAttributeReference({
    required this.targetAttributeName,
    required this.targetFacetName,
  });

  factory FacetAttributeReference.fromJson(Map<String, dynamic> json) {
    return FacetAttributeReference(
      targetAttributeName: json['TargetAttributeName'] as String,
      targetFacetName: json['TargetFacetName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final targetAttributeName = this.targetAttributeName;
    final targetFacetName = this.targetFacetName;
    return {
      'TargetAttributeName': targetAttributeName,
      'TargetFacetName': targetFacetName,
    };
  }
}

enum FacetAttributeType {
  string,
  binary,
  boolean,
  number,
  datetime,
  variant,
}

extension FacetAttributeTypeValueExtension on FacetAttributeType {
  String toValue() {
    switch (this) {
      case FacetAttributeType.string:
        return 'STRING';
      case FacetAttributeType.binary:
        return 'BINARY';
      case FacetAttributeType.boolean:
        return 'BOOLEAN';
      case FacetAttributeType.number:
        return 'NUMBER';
      case FacetAttributeType.datetime:
        return 'DATETIME';
      case FacetAttributeType.variant:
        return 'VARIANT';
    }
  }
}

extension FacetAttributeTypeFromString on String {
  FacetAttributeType toFacetAttributeType() {
    switch (this) {
      case 'STRING':
        return FacetAttributeType.string;
      case 'BINARY':
        return FacetAttributeType.binary;
      case 'BOOLEAN':
        return FacetAttributeType.boolean;
      case 'NUMBER':
        return FacetAttributeType.number;
      case 'DATETIME':
        return FacetAttributeType.datetime;
      case 'VARIANT':
        return FacetAttributeType.variant;
    }
    throw Exception('$this is not known in enum FacetAttributeType');
  }
}

/// A structure that contains information used to update an attribute.
class FacetAttributeUpdate {
  /// The action to perform when updating the attribute.
  final UpdateActionType? action;

  /// The attribute to update.
  final FacetAttribute? attribute;

  FacetAttributeUpdate({
    this.action,
    this.attribute,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final attribute = this.attribute;
    return {
      if (action != null) 'Action': action.toValue(),
      if (attribute != null) 'Attribute': attribute,
    };
  }
}

enum FacetStyle {
  static,
  $dynamic,
}

extension FacetStyleValueExtension on FacetStyle {
  String toValue() {
    switch (this) {
      case FacetStyle.static:
        return 'STATIC';
      case FacetStyle.$dynamic:
        return 'DYNAMIC';
    }
  }
}

extension FacetStyleFromString on String {
  FacetStyle toFacetStyle() {
    switch (this) {
      case 'STATIC':
        return FacetStyle.static;
      case 'DYNAMIC':
        return FacetStyle.$dynamic;
    }
    throw Exception('$this is not known in enum FacetStyle');
  }
}

class GetAppliedSchemaVersionResponse {
  /// Current applied schema ARN, including the minor version in use if one was
  /// provided.
  final String? appliedSchemaArn;

  GetAppliedSchemaVersionResponse({
    this.appliedSchemaArn,
  });

  factory GetAppliedSchemaVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetAppliedSchemaVersionResponse(
      appliedSchemaArn: json['AppliedSchemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appliedSchemaArn = this.appliedSchemaArn;
    return {
      if (appliedSchemaArn != null) 'AppliedSchemaArn': appliedSchemaArn,
    };
  }
}

class GetDirectoryResponse {
  /// Metadata about the directory.
  final Directory directory;

  GetDirectoryResponse({
    required this.directory,
  });

  factory GetDirectoryResponse.fromJson(Map<String, dynamic> json) {
    return GetDirectoryResponse(
      directory: Directory.fromJson(json['Directory'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final directory = this.directory;
    return {
      'Directory': directory,
    };
  }
}

class GetFacetResponse {
  /// The <a>Facet</a> structure that is associated with the facet.
  final Facet? facet;

  GetFacetResponse({
    this.facet,
  });

  factory GetFacetResponse.fromJson(Map<String, dynamic> json) {
    return GetFacetResponse(
      facet: json['Facet'] != null
          ? Facet.fromJson(json['Facet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final facet = this.facet;
    return {
      if (facet != null) 'Facet': facet,
    };
  }
}

class GetLinkAttributesResponse {
  /// The attributes that are associated with the typed link.
  final List<AttributeKeyAndValue>? attributes;

  GetLinkAttributesResponse({
    this.attributes,
  });

  factory GetLinkAttributesResponse.fromJson(Map<String, dynamic> json) {
    return GetLinkAttributesResponse(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

class GetObjectAttributesResponse {
  /// The attributes that are associated with the object.
  final List<AttributeKeyAndValue>? attributes;

  GetObjectAttributesResponse({
    this.attributes,
  });

  factory GetObjectAttributesResponse.fromJson(Map<String, dynamic> json) {
    return GetObjectAttributesResponse(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

class GetObjectInformationResponse {
  /// The <code>ObjectIdentifier</code> of the specified object.
  final String? objectIdentifier;

  /// The facets attached to the specified object. Although the response does not
  /// include minor version information, the most recently applied minor version
  /// of each Facet is in effect. See <a>GetAppliedSchemaVersion</a> for details.
  final List<SchemaFacet>? schemaFacets;

  GetObjectInformationResponse({
    this.objectIdentifier,
    this.schemaFacets,
  });

  factory GetObjectInformationResponse.fromJson(Map<String, dynamic> json) {
    return GetObjectInformationResponse(
      objectIdentifier: json['ObjectIdentifier'] as String?,
      schemaFacets: (json['SchemaFacets'] as List?)
          ?.whereNotNull()
          .map((e) => SchemaFacet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    final schemaFacets = this.schemaFacets;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
      if (schemaFacets != null) 'SchemaFacets': schemaFacets,
    };
  }
}

class GetSchemaAsJsonResponse {
  /// The JSON representation of the schema document.
  final String? document;

  /// The name of the retrieved schema.
  final String? name;

  GetSchemaAsJsonResponse({
    this.document,
    this.name,
  });

  factory GetSchemaAsJsonResponse.fromJson(Map<String, dynamic> json) {
    return GetSchemaAsJsonResponse(
      document: json['Document'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    final name = this.name;
    return {
      if (document != null) 'Document': document,
      if (name != null) 'Name': name,
    };
  }
}

class GetTypedLinkFacetInformationResponse {
  /// The order of identity attributes for the facet, from most significant to
  /// least significant. The ability to filter typed links considers the order
  /// that the attributes are defined on the typed link facet. When providing
  /// ranges to typed link selection, any inexact ranges must be specified at the
  /// end. Any attributes that do not have a range specified are presumed to match
  /// the entire range. Filters are interpreted in the order of the attributes on
  /// the typed link facet, not the order in which they are supplied to any API
  /// calls. For more information about identity attributes, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  final List<String>? identityAttributeOrder;

  GetTypedLinkFacetInformationResponse({
    this.identityAttributeOrder,
  });

  factory GetTypedLinkFacetInformationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTypedLinkFacetInformationResponse(
      identityAttributeOrder: (json['IdentityAttributeOrder'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final identityAttributeOrder = this.identityAttributeOrder;
    return {
      if (identityAttributeOrder != null)
        'IdentityAttributeOrder': identityAttributeOrder,
    };
  }
}

/// Represents an index and an attached object.
class IndexAttachment {
  /// The indexed attribute values.
  final List<AttributeKeyAndValue>? indexedAttributes;

  /// In response to <a>ListIndex</a>, the <code>ObjectIdentifier</code> of the
  /// object attached to the index. In response to <a>ListAttachedIndices</a>, the
  /// <code>ObjectIdentifier</code> of the index attached to the object. This
  /// field will always contain the <code>ObjectIdentifier</code> of the object on
  /// the opposite side of the attachment specified in the query.
  final String? objectIdentifier;

  IndexAttachment({
    this.indexedAttributes,
    this.objectIdentifier,
  });

  factory IndexAttachment.fromJson(Map<String, dynamic> json) {
    return IndexAttachment(
      indexedAttributes: (json['IndexedAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      objectIdentifier: json['ObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexedAttributes = this.indexedAttributes;
    final objectIdentifier = this.objectIdentifier;
    return {
      if (indexedAttributes != null) 'IndexedAttributes': indexedAttributes,
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
    };
  }
}

/// The action to take on a typed link attribute value. Updates are only
/// supported for attributes which don’t contribute to link identity.
class LinkAttributeAction {
  /// A type that can be either <code>UPDATE_OR_CREATE</code> or
  /// <code>DELETE</code>.
  final UpdateActionType? attributeActionType;

  /// The value that you want to update to.
  final TypedAttributeValue? attributeUpdateValue;

  LinkAttributeAction({
    this.attributeActionType,
    this.attributeUpdateValue,
  });

  Map<String, dynamic> toJson() {
    final attributeActionType = this.attributeActionType;
    final attributeUpdateValue = this.attributeUpdateValue;
    return {
      if (attributeActionType != null)
        'AttributeActionType': attributeActionType.toValue(),
      if (attributeUpdateValue != null)
        'AttributeUpdateValue': attributeUpdateValue,
    };
  }
}

/// Structure that contains attribute update information.
class LinkAttributeUpdate {
  /// The action to perform as part of the attribute update.
  final LinkAttributeAction? attributeAction;

  /// The key of the attribute being updated.
  final AttributeKey? attributeKey;

  LinkAttributeUpdate({
    this.attributeAction,
    this.attributeKey,
  });

  Map<String, dynamic> toJson() {
    final attributeAction = this.attributeAction;
    final attributeKey = this.attributeKey;
    return {
      if (attributeAction != null) 'AttributeAction': attributeAction,
      if (attributeKey != null) 'AttributeKey': attributeKey,
    };
  }
}

class ListAppliedSchemaArnsResponse {
  /// The pagination token.
  final String? nextToken;

  /// The ARNs of schemas that are applied to the directory.
  final List<String>? schemaArns;

  ListAppliedSchemaArnsResponse({
    this.nextToken,
    this.schemaArns,
  });

  factory ListAppliedSchemaArnsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppliedSchemaArnsResponse(
      nextToken: json['NextToken'] as String?,
      schemaArns: (json['SchemaArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schemaArns = this.schemaArns;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (schemaArns != null) 'SchemaArns': schemaArns,
    };
  }
}

class ListAttachedIndicesResponse {
  /// The indices attached to the specified object.
  final List<IndexAttachment>? indexAttachments;

  /// The pagination token.
  final String? nextToken;

  ListAttachedIndicesResponse({
    this.indexAttachments,
    this.nextToken,
  });

  factory ListAttachedIndicesResponse.fromJson(Map<String, dynamic> json) {
    return ListAttachedIndicesResponse(
      indexAttachments: (json['IndexAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => IndexAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexAttachments = this.indexAttachments;
    final nextToken = this.nextToken;
    return {
      if (indexAttachments != null) 'IndexAttachments': indexAttachments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDevelopmentSchemaArnsResponse {
  /// The pagination token.
  final String? nextToken;

  /// The ARNs of retrieved development schemas.
  final List<String>? schemaArns;

  ListDevelopmentSchemaArnsResponse({
    this.nextToken,
    this.schemaArns,
  });

  factory ListDevelopmentSchemaArnsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDevelopmentSchemaArnsResponse(
      nextToken: json['NextToken'] as String?,
      schemaArns: (json['SchemaArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schemaArns = this.schemaArns;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (schemaArns != null) 'SchemaArns': schemaArns,
    };
  }
}

class ListDirectoriesResponse {
  /// Lists all directories that are associated with your account in pagination
  /// fashion.
  final List<Directory> directories;

  /// The pagination token.
  final String? nextToken;

  ListDirectoriesResponse({
    required this.directories,
    this.nextToken,
  });

  factory ListDirectoriesResponse.fromJson(Map<String, dynamic> json) {
    return ListDirectoriesResponse(
      directories: (json['Directories'] as List)
          .whereNotNull()
          .map((e) => Directory.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directories = this.directories;
    final nextToken = this.nextToken;
    return {
      'Directories': directories,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFacetAttributesResponse {
  /// The attributes attached to the facet.
  final List<FacetAttribute>? attributes;

  /// The pagination token.
  final String? nextToken;

  ListFacetAttributesResponse({
    this.attributes,
    this.nextToken,
  });

  factory ListFacetAttributesResponse.fromJson(Map<String, dynamic> json) {
    return ListFacetAttributesResponse(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => FacetAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final nextToken = this.nextToken;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFacetNamesResponse {
  /// The names of facets that exist within the schema.
  final List<String>? facetNames;

  /// The pagination token.
  final String? nextToken;

  ListFacetNamesResponse({
    this.facetNames,
    this.nextToken,
  });

  factory ListFacetNamesResponse.fromJson(Map<String, dynamic> json) {
    return ListFacetNamesResponse(
      facetNames: (json['FacetNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final facetNames = this.facetNames;
    final nextToken = this.nextToken;
    return {
      if (facetNames != null) 'FacetNames': facetNames,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIncomingTypedLinksResponse {
  /// Returns one or more typed link specifiers as output.
  final List<TypedLinkSpecifier>? linkSpecifiers;

  /// The pagination token.
  final String? nextToken;

  ListIncomingTypedLinksResponse({
    this.linkSpecifiers,
    this.nextToken,
  });

  factory ListIncomingTypedLinksResponse.fromJson(Map<String, dynamic> json) {
    return ListIncomingTypedLinksResponse(
      linkSpecifiers: (json['LinkSpecifiers'] as List?)
          ?.whereNotNull()
          .map((e) => TypedLinkSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linkSpecifiers = this.linkSpecifiers;
    final nextToken = this.nextToken;
    return {
      if (linkSpecifiers != null) 'LinkSpecifiers': linkSpecifiers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIndexResponse {
  /// The objects and indexed values attached to the index.
  final List<IndexAttachment>? indexAttachments;

  /// The pagination token.
  final String? nextToken;

  ListIndexResponse({
    this.indexAttachments,
    this.nextToken,
  });

  factory ListIndexResponse.fromJson(Map<String, dynamic> json) {
    return ListIndexResponse(
      indexAttachments: (json['IndexAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => IndexAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexAttachments = this.indexAttachments;
    final nextToken = this.nextToken;
    return {
      if (indexAttachments != null) 'IndexAttachments': indexAttachments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListManagedSchemaArnsResponse {
  /// The pagination token.
  final String? nextToken;

  /// The ARNs for all AWS managed schemas.
  final List<String>? schemaArns;

  ListManagedSchemaArnsResponse({
    this.nextToken,
    this.schemaArns,
  });

  factory ListManagedSchemaArnsResponse.fromJson(Map<String, dynamic> json) {
    return ListManagedSchemaArnsResponse(
      nextToken: json['NextToken'] as String?,
      schemaArns: (json['SchemaArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schemaArns = this.schemaArns;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (schemaArns != null) 'SchemaArns': schemaArns,
    };
  }
}

class ListObjectAttributesResponse {
  /// Attributes map that is associated with the object. <code>AttributeArn</code>
  /// is the key, and attribute value is the value.
  final List<AttributeKeyAndValue>? attributes;

  /// The pagination token.
  final String? nextToken;

  ListObjectAttributesResponse({
    this.attributes,
    this.nextToken,
  });

  factory ListObjectAttributesResponse.fromJson(Map<String, dynamic> json) {
    return ListObjectAttributesResponse(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final nextToken = this.nextToken;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListObjectChildrenResponse {
  /// Children structure, which is a map with key as the <code>LinkName</code> and
  /// <code>ObjectIdentifier</code> as the value.
  final Map<String, String>? children;

  /// The pagination token.
  final String? nextToken;

  ListObjectChildrenResponse({
    this.children,
    this.nextToken,
  });

  factory ListObjectChildrenResponse.fromJson(Map<String, dynamic> json) {
    return ListObjectChildrenResponse(
      children: (json['Children'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final children = this.children;
    final nextToken = this.nextToken;
    return {
      if (children != null) 'Children': children,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListObjectParentPathsResponse {
  /// The pagination token.
  final String? nextToken;

  /// Returns the path to the <code>ObjectIdentifiers</code> that are associated
  /// with the directory.
  final List<PathToObjectIdentifiers>? pathToObjectIdentifiersList;

  ListObjectParentPathsResponse({
    this.nextToken,
    this.pathToObjectIdentifiersList,
  });

  factory ListObjectParentPathsResponse.fromJson(Map<String, dynamic> json) {
    return ListObjectParentPathsResponse(
      nextToken: json['NextToken'] as String?,
      pathToObjectIdentifiersList:
          (json['PathToObjectIdentifiersList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  PathToObjectIdentifiers.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pathToObjectIdentifiersList = this.pathToObjectIdentifiersList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (pathToObjectIdentifiersList != null)
        'PathToObjectIdentifiersList': pathToObjectIdentifiersList,
    };
  }
}

class ListObjectParentsResponse {
  /// The pagination token.
  final String? nextToken;

  /// Returns a list of parent reference and LinkName Tuples.
  final List<ObjectIdentifierAndLinkNameTuple>? parentLinks;

  /// The parent structure, which is a map with key as the
  /// <code>ObjectIdentifier</code> and LinkName as the value.
  final Map<String, String>? parents;

  ListObjectParentsResponse({
    this.nextToken,
    this.parentLinks,
    this.parents,
  });

  factory ListObjectParentsResponse.fromJson(Map<String, dynamic> json) {
    return ListObjectParentsResponse(
      nextToken: json['NextToken'] as String?,
      parentLinks: (json['ParentLinks'] as List?)
          ?.whereNotNull()
          .map((e) => ObjectIdentifierAndLinkNameTuple.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      parents: (json['Parents'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final parentLinks = this.parentLinks;
    final parents = this.parents;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (parentLinks != null) 'ParentLinks': parentLinks,
      if (parents != null) 'Parents': parents,
    };
  }
}

class ListObjectPoliciesResponse {
  /// A list of policy <code>ObjectIdentifiers</code>, that are attached to the
  /// object.
  final List<String>? attachedPolicyIds;

  /// The pagination token.
  final String? nextToken;

  ListObjectPoliciesResponse({
    this.attachedPolicyIds,
    this.nextToken,
  });

  factory ListObjectPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListObjectPoliciesResponse(
      attachedPolicyIds: (json['AttachedPolicyIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachedPolicyIds = this.attachedPolicyIds;
    final nextToken = this.nextToken;
    return {
      if (attachedPolicyIds != null) 'AttachedPolicyIds': attachedPolicyIds,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListOutgoingTypedLinksResponse {
  /// The pagination token.
  final String? nextToken;

  /// Returns a typed link specifier as output.
  final List<TypedLinkSpecifier>? typedLinkSpecifiers;

  ListOutgoingTypedLinksResponse({
    this.nextToken,
    this.typedLinkSpecifiers,
  });

  factory ListOutgoingTypedLinksResponse.fromJson(Map<String, dynamic> json) {
    return ListOutgoingTypedLinksResponse(
      nextToken: json['NextToken'] as String?,
      typedLinkSpecifiers: (json['TypedLinkSpecifiers'] as List?)
          ?.whereNotNull()
          .map((e) => TypedLinkSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final typedLinkSpecifiers = this.typedLinkSpecifiers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (typedLinkSpecifiers != null)
        'TypedLinkSpecifiers': typedLinkSpecifiers,
    };
  }
}

class ListPolicyAttachmentsResponse {
  /// The pagination token.
  final String? nextToken;

  /// A list of <code>ObjectIdentifiers</code> to which the policy is attached.
  final List<String>? objectIdentifiers;

  ListPolicyAttachmentsResponse({
    this.nextToken,
    this.objectIdentifiers,
  });

  factory ListPolicyAttachmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListPolicyAttachmentsResponse(
      nextToken: json['NextToken'] as String?,
      objectIdentifiers: (json['ObjectIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final objectIdentifiers = this.objectIdentifiers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (objectIdentifiers != null) 'ObjectIdentifiers': objectIdentifiers,
    };
  }
}

class ListPublishedSchemaArnsResponse {
  /// The pagination token.
  final String? nextToken;

  /// The ARNs of published schemas.
  final List<String>? schemaArns;

  ListPublishedSchemaArnsResponse({
    this.nextToken,
    this.schemaArns,
  });

  factory ListPublishedSchemaArnsResponse.fromJson(Map<String, dynamic> json) {
    return ListPublishedSchemaArnsResponse(
      nextToken: json['NextToken'] as String?,
      schemaArns: (json['SchemaArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schemaArns = this.schemaArns;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (schemaArns != null) 'SchemaArns': schemaArns,
    };
  }
}

class ListTagsForResourceResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// A list of tag key value pairs that are associated with the response.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListTypedLinkFacetAttributesResponse {
  /// An ordered set of attributes associate with the typed link.
  final List<TypedLinkAttributeDefinition>? attributes;

  /// The pagination token.
  final String? nextToken;

  ListTypedLinkFacetAttributesResponse({
    this.attributes,
    this.nextToken,
  });

  factory ListTypedLinkFacetAttributesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTypedLinkFacetAttributesResponse(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TypedLinkAttributeDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final nextToken = this.nextToken;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTypedLinkFacetNamesResponse {
  /// The names of typed link facets that exist within the schema.
  final List<String>? facetNames;

  /// The pagination token.
  final String? nextToken;

  ListTypedLinkFacetNamesResponse({
    this.facetNames,
    this.nextToken,
  });

  factory ListTypedLinkFacetNamesResponse.fromJson(Map<String, dynamic> json) {
    return ListTypedLinkFacetNamesResponse(
      facetNames: (json['FacetNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final facetNames = this.facetNames;
    final nextToken = this.nextToken;
    return {
      if (facetNames != null) 'FacetNames': facetNames,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class LookupPolicyResponse {
  /// The pagination token.
  final String? nextToken;

  /// Provides list of path to policies. Policies contain <code>PolicyId</code>,
  /// <code>ObjectIdentifier</code>, and <code>PolicyType</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
  final List<PolicyToPath>? policyToPathList;

  LookupPolicyResponse({
    this.nextToken,
    this.policyToPathList,
  });

  factory LookupPolicyResponse.fromJson(Map<String, dynamic> json) {
    return LookupPolicyResponse(
      nextToken: json['NextToken'] as String?,
      policyToPathList: (json['PolicyToPathList'] as List?)
          ?.whereNotNull()
          .map((e) => PolicyToPath.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final policyToPathList = this.policyToPathList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (policyToPathList != null) 'PolicyToPathList': policyToPathList,
    };
  }
}

/// The action to take on the object attribute.
class ObjectAttributeAction {
  /// A type that can be either <code>Update</code> or <code>Delete</code>.
  final UpdateActionType? objectAttributeActionType;

  /// The value that you want to update to.
  final TypedAttributeValue? objectAttributeUpdateValue;

  ObjectAttributeAction({
    this.objectAttributeActionType,
    this.objectAttributeUpdateValue,
  });

  Map<String, dynamic> toJson() {
    final objectAttributeActionType = this.objectAttributeActionType;
    final objectAttributeUpdateValue = this.objectAttributeUpdateValue;
    return {
      if (objectAttributeActionType != null)
        'ObjectAttributeActionType': objectAttributeActionType.toValue(),
      if (objectAttributeUpdateValue != null)
        'ObjectAttributeUpdateValue': objectAttributeUpdateValue,
    };
  }
}

/// A range of attributes.
class ObjectAttributeRange {
  /// The key of the attribute that the attribute range covers.
  final AttributeKey? attributeKey;

  /// The range of attribute values being selected.
  final TypedAttributeValueRange? range;

  ObjectAttributeRange({
    this.attributeKey,
    this.range,
  });

  Map<String, dynamic> toJson() {
    final attributeKey = this.attributeKey;
    final range = this.range;
    return {
      if (attributeKey != null) 'AttributeKey': attributeKey,
      if (range != null) 'Range': range,
    };
  }
}

/// Structure that contains attribute update information.
class ObjectAttributeUpdate {
  /// The action to perform as part of the attribute update.
  final ObjectAttributeAction? objectAttributeAction;

  /// The key of the attribute being updated.
  final AttributeKey? objectAttributeKey;

  ObjectAttributeUpdate({
    this.objectAttributeAction,
    this.objectAttributeKey,
  });

  Map<String, dynamic> toJson() {
    final objectAttributeAction = this.objectAttributeAction;
    final objectAttributeKey = this.objectAttributeKey;
    return {
      if (objectAttributeAction != null)
        'ObjectAttributeAction': objectAttributeAction,
      if (objectAttributeKey != null) 'ObjectAttributeKey': objectAttributeKey,
    };
  }
}

/// A pair of ObjectIdentifier and LinkName.
class ObjectIdentifierAndLinkNameTuple {
  /// The name of the link between the parent and the child object.
  final String? linkName;

  /// The ID that is associated with the object.
  final String? objectIdentifier;

  ObjectIdentifierAndLinkNameTuple({
    this.linkName,
    this.objectIdentifier,
  });

  factory ObjectIdentifierAndLinkNameTuple.fromJson(Map<String, dynamic> json) {
    return ObjectIdentifierAndLinkNameTuple(
      linkName: json['LinkName'] as String?,
      objectIdentifier: json['ObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linkName = this.linkName;
    final objectIdentifier = this.objectIdentifier;
    return {
      if (linkName != null) 'LinkName': linkName,
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
    };
  }
}

/// The reference that identifies an object.
class ObjectReference {
  /// A path selector supports easy selection of an object by the parent/child
  /// links leading to it from the directory root. Use the link names from each
  /// parent/child link to construct the path. Path selectors start with a slash
  /// (/) and link names are separated by slashes. For more information about
  /// paths, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_access_objects.html">Access
  /// Objects</a>. You can identify an object in one of the following ways:
  ///
  /// <ul>
  /// <li>
  /// <i>$ObjectIdentifier</i> - An object identifier is an opaque string provided
  /// by Amazon Cloud Directory. When creating objects, the system will provide
  /// you with the identifier of the created object. An object’s identifier is
  /// immutable and no two objects will ever share the same object identifier. To
  /// identify an object with ObjectIdentifier, the ObjectIdentifier must be
  /// wrapped in double quotes.
  /// </li>
  /// <li>
  /// <i>/some/path</i> - Identifies the object based on path
  /// </li>
  /// <li>
  /// <i>#SomeBatchReference</i> - Identifies the object in a batch call
  /// </li>
  /// </ul>
  final String? selector;

  ObjectReference({
    this.selector,
  });

  factory ObjectReference.fromJson(Map<String, dynamic> json) {
    return ObjectReference(
      selector: json['Selector'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final selector = this.selector;
    return {
      if (selector != null) 'Selector': selector,
    };
  }
}

enum ObjectType {
  node,
  leafNode,
  policy,
  $index,
}

extension ObjectTypeValueExtension on ObjectType {
  String toValue() {
    switch (this) {
      case ObjectType.node:
        return 'NODE';
      case ObjectType.leafNode:
        return 'LEAF_NODE';
      case ObjectType.policy:
        return 'POLICY';
      case ObjectType.$index:
        return 'INDEX';
    }
  }
}

extension ObjectTypeFromString on String {
  ObjectType toObjectType() {
    switch (this) {
      case 'NODE':
        return ObjectType.node;
      case 'LEAF_NODE':
        return ObjectType.leafNode;
      case 'POLICY':
        return ObjectType.policy;
      case 'INDEX':
        return ObjectType.$index;
    }
    throw Exception('$this is not known in enum ObjectType');
  }
}

/// Returns the path to the <code>ObjectIdentifiers</code> that is associated
/// with the directory.
class PathToObjectIdentifiers {
  /// Lists <code>ObjectIdentifiers</code> starting from directory root to the
  /// object in the request.
  final List<String>? objectIdentifiers;

  /// The path that is used to identify the object starting from directory root.
  final String? path;

  PathToObjectIdentifiers({
    this.objectIdentifiers,
    this.path,
  });

  factory PathToObjectIdentifiers.fromJson(Map<String, dynamic> json) {
    return PathToObjectIdentifiers(
      objectIdentifiers: (json['ObjectIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      path: json['Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifiers = this.objectIdentifiers;
    final path = this.path;
    return {
      if (objectIdentifiers != null) 'ObjectIdentifiers': objectIdentifiers,
      if (path != null) 'Path': path,
    };
  }
}

/// Contains the <code>PolicyType</code>, <code>PolicyId</code>, and the
/// <code>ObjectIdentifier</code> to which it is attached. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
class PolicyAttachment {
  /// The <code>ObjectIdentifier</code> that is associated with
  /// <code>PolicyAttachment</code>.
  final String? objectIdentifier;

  /// The ID of <code>PolicyAttachment</code>.
  final String? policyId;

  /// The type of policy that can be associated with
  /// <code>PolicyAttachment</code>.
  final String? policyType;

  PolicyAttachment({
    this.objectIdentifier,
    this.policyId,
    this.policyType,
  });

  factory PolicyAttachment.fromJson(Map<String, dynamic> json) {
    return PolicyAttachment(
      objectIdentifier: json['ObjectIdentifier'] as String?,
      policyId: json['PolicyId'] as String?,
      policyType: json['PolicyType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    final policyId = this.policyId;
    final policyType = this.policyType;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
      if (policyId != null) 'PolicyId': policyId,
      if (policyType != null) 'PolicyType': policyType,
    };
  }
}

/// Used when a regular object exists in a <a>Directory</a> and you want to find
/// all of the policies that are associated with that object and the parent to
/// that object.
class PolicyToPath {
  /// The path that is referenced from the root.
  final String? path;

  /// List of policy objects.
  final List<PolicyAttachment>? policies;

  PolicyToPath({
    this.path,
    this.policies,
  });

  factory PolicyToPath.fromJson(Map<String, dynamic> json) {
    return PolicyToPath(
      path: json['Path'] as String?,
      policies: (json['Policies'] as List?)
          ?.whereNotNull()
          .map((e) => PolicyAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final policies = this.policies;
    return {
      if (path != null) 'Path': path,
      if (policies != null) 'Policies': policies,
    };
  }
}

class PublishSchemaResponse {
  /// The ARN that is associated with the published schema. For more information,
  /// see <a>arns</a>.
  final String? publishedSchemaArn;

  PublishSchemaResponse({
    this.publishedSchemaArn,
  });

  factory PublishSchemaResponse.fromJson(Map<String, dynamic> json) {
    return PublishSchemaResponse(
      publishedSchemaArn: json['PublishedSchemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final publishedSchemaArn = this.publishedSchemaArn;
    return {
      if (publishedSchemaArn != null) 'PublishedSchemaArn': publishedSchemaArn,
    };
  }
}

class PutSchemaFromJsonResponse {
  /// The ARN of the schema to update.
  final String? arn;

  PutSchemaFromJsonResponse({
    this.arn,
  });

  factory PutSchemaFromJsonResponse.fromJson(Map<String, dynamic> json) {
    return PutSchemaFromJsonResponse(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

enum RangeMode {
  first,
  last,
  lastBeforeMissingValues,
  inclusive,
  exclusive,
}

extension RangeModeValueExtension on RangeMode {
  String toValue() {
    switch (this) {
      case RangeMode.first:
        return 'FIRST';
      case RangeMode.last:
        return 'LAST';
      case RangeMode.lastBeforeMissingValues:
        return 'LAST_BEFORE_MISSING_VALUES';
      case RangeMode.inclusive:
        return 'INCLUSIVE';
      case RangeMode.exclusive:
        return 'EXCLUSIVE';
    }
  }
}

extension RangeModeFromString on String {
  RangeMode toRangeMode() {
    switch (this) {
      case 'FIRST':
        return RangeMode.first;
      case 'LAST':
        return RangeMode.last;
      case 'LAST_BEFORE_MISSING_VALUES':
        return RangeMode.lastBeforeMissingValues;
      case 'INCLUSIVE':
        return RangeMode.inclusive;
      case 'EXCLUSIVE':
        return RangeMode.exclusive;
    }
    throw Exception('$this is not known in enum RangeMode');
  }
}

class RemoveFacetFromObjectResponse {
  RemoveFacetFromObjectResponse();

  factory RemoveFacetFromObjectResponse.fromJson(Map<String, dynamic> _) {
    return RemoveFacetFromObjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum RequiredAttributeBehavior {
  requiredAlways,
  notRequired,
}

extension RequiredAttributeBehaviorValueExtension on RequiredAttributeBehavior {
  String toValue() {
    switch (this) {
      case RequiredAttributeBehavior.requiredAlways:
        return 'REQUIRED_ALWAYS';
      case RequiredAttributeBehavior.notRequired:
        return 'NOT_REQUIRED';
    }
  }
}

extension RequiredAttributeBehaviorFromString on String {
  RequiredAttributeBehavior toRequiredAttributeBehavior() {
    switch (this) {
      case 'REQUIRED_ALWAYS':
        return RequiredAttributeBehavior.requiredAlways;
      case 'NOT_REQUIRED':
        return RequiredAttributeBehavior.notRequired;
    }
    throw Exception('$this is not known in enum RequiredAttributeBehavior');
  }
}

/// Contains an Amazon Resource Name (ARN) and parameters that are associated
/// with the rule.
class Rule {
  /// The minimum and maximum parameters that are associated with the rule.
  final Map<String, String>? parameters;

  /// The type of attribute validation rule.
  final RuleType? type;

  Rule({
    this.parameters,
    this.type,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.toRuleType(),
    );
  }

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final type = this.type;
    return {
      if (parameters != null) 'Parameters': parameters,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum RuleType {
  binaryLength,
  numberComparison,
  stringFromSet,
  stringLength,
}

extension RuleTypeValueExtension on RuleType {
  String toValue() {
    switch (this) {
      case RuleType.binaryLength:
        return 'BINARY_LENGTH';
      case RuleType.numberComparison:
        return 'NUMBER_COMPARISON';
      case RuleType.stringFromSet:
        return 'STRING_FROM_SET';
      case RuleType.stringLength:
        return 'STRING_LENGTH';
    }
  }
}

extension RuleTypeFromString on String {
  RuleType toRuleType() {
    switch (this) {
      case 'BINARY_LENGTH':
        return RuleType.binaryLength;
      case 'NUMBER_COMPARISON':
        return RuleType.numberComparison;
      case 'STRING_FROM_SET':
        return RuleType.stringFromSet;
      case 'STRING_LENGTH':
        return RuleType.stringLength;
    }
    throw Exception('$this is not known in enum RuleType');
  }
}

/// A facet.
class SchemaFacet {
  /// The name of the facet. If this value is set, SchemaArn must also be set.
  final String? facetName;

  /// The ARN of the schema that contains the facet with no minor component. See
  /// <a>arns</a> and <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_inplaceschemaupgrade.html">In-Place
  /// Schema Upgrade</a> for a description of when to provide minor versions. If
  /// this value is set, FacetName must also be set.
  final String? schemaArn;

  SchemaFacet({
    this.facetName,
    this.schemaArn,
  });

  factory SchemaFacet.fromJson(Map<String, dynamic> json) {
    return SchemaFacet(
      facetName: json['FacetName'] as String?,
      schemaArn: json['SchemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final facetName = this.facetName;
    final schemaArn = this.schemaArn;
    return {
      if (facetName != null) 'FacetName': facetName,
      if (schemaArn != null) 'SchemaArn': schemaArn,
    };
  }
}

/// The tag structure that contains a tag key and value.
class Tag {
  /// The key that is associated with the tag.
  final String? key;

  /// The value that is associated with the tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
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

/// Represents the data for a typed attribute. You can set one, and only one, of
/// the elements. Each attribute in an item is a name-value pair. Attributes
/// have a single value.
class TypedAttributeValue {
  /// A binary data value.
  final Uint8List? binaryValue;

  /// A Boolean data value.
  final bool? booleanValue;

  /// A date and time value.
  final DateTime? datetimeValue;

  /// A number data value.
  final String? numberValue;

  /// A string data value.
  final String? stringValue;

  TypedAttributeValue({
    this.binaryValue,
    this.booleanValue,
    this.datetimeValue,
    this.numberValue,
    this.stringValue,
  });

  factory TypedAttributeValue.fromJson(Map<String, dynamic> json) {
    return TypedAttributeValue(
      binaryValue: _s.decodeNullableUint8List(json['BinaryValue'] as String?),
      booleanValue: json['BooleanValue'] as bool?,
      datetimeValue: timeStampFromJson(json['DatetimeValue']),
      numberValue: json['NumberValue'] as String?,
      stringValue: json['StringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final binaryValue = this.binaryValue;
    final booleanValue = this.booleanValue;
    final datetimeValue = this.datetimeValue;
    final numberValue = this.numberValue;
    final stringValue = this.stringValue;
    return {
      if (binaryValue != null) 'BinaryValue': base64Encode(binaryValue),
      if (booleanValue != null) 'BooleanValue': booleanValue,
      if (datetimeValue != null)
        'DatetimeValue': unixTimestampToJson(datetimeValue),
      if (numberValue != null) 'NumberValue': numberValue,
      if (stringValue != null) 'StringValue': stringValue,
    };
  }
}

/// A range of attribute values. For more information, see <a
/// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_range_filters.html">Range
/// Filters</a>.
class TypedAttributeValueRange {
  /// The inclusive or exclusive range end.
  final RangeMode endMode;

  /// The inclusive or exclusive range start.
  final RangeMode startMode;

  /// The attribute value to terminate the range at.
  final TypedAttributeValue? endValue;

  /// The value to start the range at.
  final TypedAttributeValue? startValue;

  TypedAttributeValueRange({
    required this.endMode,
    required this.startMode,
    this.endValue,
    this.startValue,
  });

  Map<String, dynamic> toJson() {
    final endMode = this.endMode;
    final startMode = this.startMode;
    final endValue = this.endValue;
    final startValue = this.startValue;
    return {
      'EndMode': endMode.toValue(),
      'StartMode': startMode.toValue(),
      if (endValue != null) 'EndValue': endValue,
      if (startValue != null) 'StartValue': startValue,
    };
  }
}

/// A typed link attribute definition.
class TypedLinkAttributeDefinition {
  /// The unique name of the typed link attribute.
  final String name;

  /// The required behavior of the <code>TypedLinkAttributeDefinition</code>.
  final RequiredAttributeBehavior requiredBehavior;

  /// The type of the attribute.
  final FacetAttributeType type;

  /// The default value of the attribute (if configured).
  final TypedAttributeValue? defaultValue;

  /// Whether the attribute is mutable or not.
  final bool? isImmutable;

  /// Validation rules that are attached to the attribute definition.
  final Map<String, Rule>? rules;

  TypedLinkAttributeDefinition({
    required this.name,
    required this.requiredBehavior,
    required this.type,
    this.defaultValue,
    this.isImmutable,
    this.rules,
  });

  factory TypedLinkAttributeDefinition.fromJson(Map<String, dynamic> json) {
    return TypedLinkAttributeDefinition(
      name: json['Name'] as String,
      requiredBehavior:
          (json['RequiredBehavior'] as String).toRequiredAttributeBehavior(),
      type: (json['Type'] as String).toFacetAttributeType(),
      defaultValue: json['DefaultValue'] != null
          ? TypedAttributeValue.fromJson(
              json['DefaultValue'] as Map<String, dynamic>)
          : null,
      isImmutable: json['IsImmutable'] as bool?,
      rules: (json['Rules'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Rule.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final requiredBehavior = this.requiredBehavior;
    final type = this.type;
    final defaultValue = this.defaultValue;
    final isImmutable = this.isImmutable;
    final rules = this.rules;
    return {
      'Name': name,
      'RequiredBehavior': requiredBehavior.toValue(),
      'Type': type.toValue(),
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (isImmutable != null) 'IsImmutable': isImmutable,
      if (rules != null) 'Rules': rules,
    };
  }
}

/// Identifies the range of attributes that are used by a specified filter.
class TypedLinkAttributeRange {
  /// The range of attribute values that are being selected.
  final TypedAttributeValueRange range;

  /// The unique name of the typed link attribute.
  final String? attributeName;

  TypedLinkAttributeRange({
    required this.range,
    this.attributeName,
  });

  Map<String, dynamic> toJson() {
    final range = this.range;
    final attributeName = this.attributeName;
    return {
      'Range': range,
      if (attributeName != null) 'AttributeName': attributeName,
    };
  }
}

/// Defines the typed links structure and its attributes. To create a typed link
/// facet, use the <a>CreateTypedLinkFacet</a> API.
class TypedLinkFacet {
  /// A set of key-value pairs associated with the typed link. Typed link
  /// attributes are used when you have data values that are related to the link
  /// itself, and not to one of the two objects being linked. Identity attributes
  /// also serve to distinguish the link from others of the same type between the
  /// same objects.
  final List<TypedLinkAttributeDefinition> attributes;

  /// The set of attributes that distinguish links made from this facet from each
  /// other, in the order of significance. Listing typed links can filter on the
  /// values of these attributes. See <a>ListOutgoingTypedLinks</a> and
  /// <a>ListIncomingTypedLinks</a> for details.
  final List<String> identityAttributeOrder;

  /// The unique name of the typed link facet.
  final String name;

  TypedLinkFacet({
    required this.attributes,
    required this.identityAttributeOrder,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final identityAttributeOrder = this.identityAttributeOrder;
    final name = this.name;
    return {
      'Attributes': attributes,
      'IdentityAttributeOrder': identityAttributeOrder,
      'Name': name,
    };
  }
}

/// A typed link facet attribute update.
class TypedLinkFacetAttributeUpdate {
  /// The action to perform when updating the attribute.
  final UpdateActionType action;

  /// The attribute to update.
  final TypedLinkAttributeDefinition attribute;

  TypedLinkFacetAttributeUpdate({
    required this.action,
    required this.attribute,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final attribute = this.attribute;
    return {
      'Action': action.toValue(),
      'Attribute': attribute,
    };
  }
}

/// Identifies the schema Amazon Resource Name (ARN) and facet name for the
/// typed link.
class TypedLinkSchemaAndFacetName {
  /// The Amazon Resource Name (ARN) that is associated with the schema. For more
  /// information, see <a>arns</a>.
  final String schemaArn;

  /// The unique name of the typed link facet.
  final String typedLinkName;

  TypedLinkSchemaAndFacetName({
    required this.schemaArn,
    required this.typedLinkName,
  });

  factory TypedLinkSchemaAndFacetName.fromJson(Map<String, dynamic> json) {
    return TypedLinkSchemaAndFacetName(
      schemaArn: json['SchemaArn'] as String,
      typedLinkName: json['TypedLinkName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaArn = this.schemaArn;
    final typedLinkName = this.typedLinkName;
    return {
      'SchemaArn': schemaArn,
      'TypedLinkName': typedLinkName,
    };
  }
}

/// Contains all the information that is used to uniquely identify a typed link.
/// The parameters discussed in this topic are used to uniquely specify the
/// typed link being operated on. The <a>AttachTypedLink</a> API returns a typed
/// link specifier while the <a>DetachTypedLink</a> API accepts one as input.
/// Similarly, the <a>ListIncomingTypedLinks</a> and
/// <a>ListOutgoingTypedLinks</a> API operations provide typed link specifiers
/// as output. You can also construct a typed link specifier from scratch.
class TypedLinkSpecifier {
  /// Identifies the attribute value to update.
  final List<AttributeNameAndValue> identityAttributeValues;

  /// Identifies the source object that the typed link will attach to.
  final ObjectReference sourceObjectReference;

  /// Identifies the target object that the typed link will attach to.
  final ObjectReference targetObjectReference;

  /// Identifies the typed link facet that is associated with the typed link.
  final TypedLinkSchemaAndFacetName typedLinkFacet;

  TypedLinkSpecifier({
    required this.identityAttributeValues,
    required this.sourceObjectReference,
    required this.targetObjectReference,
    required this.typedLinkFacet,
  });

  factory TypedLinkSpecifier.fromJson(Map<String, dynamic> json) {
    return TypedLinkSpecifier(
      identityAttributeValues: (json['IdentityAttributeValues'] as List)
          .whereNotNull()
          .map((e) => AttributeNameAndValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceObjectReference: ObjectReference.fromJson(
          json['SourceObjectReference'] as Map<String, dynamic>),
      targetObjectReference: ObjectReference.fromJson(
          json['TargetObjectReference'] as Map<String, dynamic>),
      typedLinkFacet: TypedLinkSchemaAndFacetName.fromJson(
          json['TypedLinkFacet'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final identityAttributeValues = this.identityAttributeValues;
    final sourceObjectReference = this.sourceObjectReference;
    final targetObjectReference = this.targetObjectReference;
    final typedLinkFacet = this.typedLinkFacet;
    return {
      'IdentityAttributeValues': identityAttributeValues,
      'SourceObjectReference': sourceObjectReference,
      'TargetObjectReference': targetObjectReference,
      'TypedLinkFacet': typedLinkFacet,
    };
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

enum UpdateActionType {
  createOrUpdate,
  delete,
}

extension UpdateActionTypeValueExtension on UpdateActionType {
  String toValue() {
    switch (this) {
      case UpdateActionType.createOrUpdate:
        return 'CREATE_OR_UPDATE';
      case UpdateActionType.delete:
        return 'DELETE';
    }
  }
}

extension UpdateActionTypeFromString on String {
  UpdateActionType toUpdateActionType() {
    switch (this) {
      case 'CREATE_OR_UPDATE':
        return UpdateActionType.createOrUpdate;
      case 'DELETE':
        return UpdateActionType.delete;
    }
    throw Exception('$this is not known in enum UpdateActionType');
  }
}

class UpdateFacetResponse {
  UpdateFacetResponse();

  factory UpdateFacetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFacetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLinkAttributesResponse {
  UpdateLinkAttributesResponse();

  factory UpdateLinkAttributesResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLinkAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateObjectAttributesResponse {
  /// The <code>ObjectIdentifier</code> of the updated object.
  final String? objectIdentifier;

  UpdateObjectAttributesResponse({
    this.objectIdentifier,
  });

  factory UpdateObjectAttributesResponse.fromJson(Map<String, dynamic> json) {
    return UpdateObjectAttributesResponse(
      objectIdentifier: json['ObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
    };
  }
}

class UpdateSchemaResponse {
  /// The ARN that is associated with the updated schema. For more information,
  /// see <a>arns</a>.
  final String? schemaArn;

  UpdateSchemaResponse({
    this.schemaArn,
  });

  factory UpdateSchemaResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSchemaResponse(
      schemaArn: json['SchemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaArn = this.schemaArn;
    return {
      if (schemaArn != null) 'SchemaArn': schemaArn,
    };
  }
}

class UpdateTypedLinkFacetResponse {
  UpdateTypedLinkFacetResponse();

  factory UpdateTypedLinkFacetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTypedLinkFacetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpgradeAppliedSchemaResponse {
  /// The ARN of the directory that is returned as part of the response.
  final String? directoryArn;

  /// The ARN of the upgraded schema that is returned as part of the response.
  final String? upgradedSchemaArn;

  UpgradeAppliedSchemaResponse({
    this.directoryArn,
    this.upgradedSchemaArn,
  });

  factory UpgradeAppliedSchemaResponse.fromJson(Map<String, dynamic> json) {
    return UpgradeAppliedSchemaResponse(
      directoryArn: json['DirectoryArn'] as String?,
      upgradedSchemaArn: json['UpgradedSchemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryArn = this.directoryArn;
    final upgradedSchemaArn = this.upgradedSchemaArn;
    return {
      if (directoryArn != null) 'DirectoryArn': directoryArn,
      if (upgradedSchemaArn != null) 'UpgradedSchemaArn': upgradedSchemaArn,
    };
  }
}

class UpgradePublishedSchemaResponse {
  /// The ARN of the upgraded schema that is returned as part of the response.
  final String? upgradedSchemaArn;

  UpgradePublishedSchemaResponse({
    this.upgradedSchemaArn,
  });

  factory UpgradePublishedSchemaResponse.fromJson(Map<String, dynamic> json) {
    return UpgradePublishedSchemaResponse(
      upgradedSchemaArn: json['UpgradedSchemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final upgradedSchemaArn = this.upgradedSchemaArn;
    return {
      if (upgradedSchemaArn != null) 'UpgradedSchemaArn': upgradedSchemaArn,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BatchWriteException extends _s.GenericAwsException {
  BatchWriteException({String? type, String? message})
      : super(type: type, code: 'BatchWriteException', message: message);
}

class CannotListParentOfRootException extends _s.GenericAwsException {
  CannotListParentOfRootException({String? type, String? message})
      : super(
            type: type,
            code: 'CannotListParentOfRootException',
            message: message);
}

class DirectoryAlreadyExistsException extends _s.GenericAwsException {
  DirectoryAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryAlreadyExistsException',
            message: message);
}

class DirectoryDeletedException extends _s.GenericAwsException {
  DirectoryDeletedException({String? type, String? message})
      : super(type: type, code: 'DirectoryDeletedException', message: message);
}

class DirectoryNotDisabledException extends _s.GenericAwsException {
  DirectoryNotDisabledException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryNotDisabledException',
            message: message);
}

class DirectoryNotEnabledException extends _s.GenericAwsException {
  DirectoryNotEnabledException({String? type, String? message})
      : super(
            type: type, code: 'DirectoryNotEnabledException', message: message);
}

class FacetAlreadyExistsException extends _s.GenericAwsException {
  FacetAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'FacetAlreadyExistsException', message: message);
}

class FacetInUseException extends _s.GenericAwsException {
  FacetInUseException({String? type, String? message})
      : super(type: type, code: 'FacetInUseException', message: message);
}

class FacetNotFoundException extends _s.GenericAwsException {
  FacetNotFoundException({String? type, String? message})
      : super(type: type, code: 'FacetNotFoundException', message: message);
}

class FacetValidationException extends _s.GenericAwsException {
  FacetValidationException({String? type, String? message})
      : super(type: type, code: 'FacetValidationException', message: message);
}

class IncompatibleSchemaException extends _s.GenericAwsException {
  IncompatibleSchemaException({String? type, String? message})
      : super(
            type: type, code: 'IncompatibleSchemaException', message: message);
}

class IndexedAttributeMissingException extends _s.GenericAwsException {
  IndexedAttributeMissingException({String? type, String? message})
      : super(
            type: type,
            code: 'IndexedAttributeMissingException',
            message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String? type, String? message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidAttachmentException extends _s.GenericAwsException {
  InvalidAttachmentException({String? type, String? message})
      : super(type: type, code: 'InvalidAttachmentException', message: message);
}

class InvalidFacetUpdateException extends _s.GenericAwsException {
  InvalidFacetUpdateException({String? type, String? message})
      : super(
            type: type, code: 'InvalidFacetUpdateException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidRuleException extends _s.GenericAwsException {
  InvalidRuleException({String? type, String? message})
      : super(type: type, code: 'InvalidRuleException', message: message);
}

class InvalidSchemaDocException extends _s.GenericAwsException {
  InvalidSchemaDocException({String? type, String? message})
      : super(type: type, code: 'InvalidSchemaDocException', message: message);
}

class InvalidTaggingRequestException extends _s.GenericAwsException {
  InvalidTaggingRequestException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidTaggingRequestException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class LinkNameAlreadyInUseException extends _s.GenericAwsException {
  LinkNameAlreadyInUseException({String? type, String? message})
      : super(
            type: type,
            code: 'LinkNameAlreadyInUseException',
            message: message);
}

class NotIndexException extends _s.GenericAwsException {
  NotIndexException({String? type, String? message})
      : super(type: type, code: 'NotIndexException', message: message);
}

class NotNodeException extends _s.GenericAwsException {
  NotNodeException({String? type, String? message})
      : super(type: type, code: 'NotNodeException', message: message);
}

class NotPolicyException extends _s.GenericAwsException {
  NotPolicyException({String? type, String? message})
      : super(type: type, code: 'NotPolicyException', message: message);
}

class ObjectAlreadyDetachedException extends _s.GenericAwsException {
  ObjectAlreadyDetachedException({String? type, String? message})
      : super(
            type: type,
            code: 'ObjectAlreadyDetachedException',
            message: message);
}

class ObjectNotDetachedException extends _s.GenericAwsException {
  ObjectNotDetachedException({String? type, String? message})
      : super(type: type, code: 'ObjectNotDetachedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class RetryableConflictException extends _s.GenericAwsException {
  RetryableConflictException({String? type, String? message})
      : super(type: type, code: 'RetryableConflictException', message: message);
}

class SchemaAlreadyExistsException extends _s.GenericAwsException {
  SchemaAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'SchemaAlreadyExistsException', message: message);
}

class SchemaAlreadyPublishedException extends _s.GenericAwsException {
  SchemaAlreadyPublishedException({String? type, String? message})
      : super(
            type: type,
            code: 'SchemaAlreadyPublishedException',
            message: message);
}

class StillContainsLinksException extends _s.GenericAwsException {
  StillContainsLinksException({String? type, String? message})
      : super(
            type: type, code: 'StillContainsLinksException', message: message);
}

class UnsupportedIndexTypeException extends _s.GenericAwsException {
  UnsupportedIndexTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedIndexTypeException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BatchWriteException': (type, message) =>
      BatchWriteException(type: type, message: message),
  'CannotListParentOfRootException': (type, message) =>
      CannotListParentOfRootException(type: type, message: message),
  'DirectoryAlreadyExistsException': (type, message) =>
      DirectoryAlreadyExistsException(type: type, message: message),
  'DirectoryDeletedException': (type, message) =>
      DirectoryDeletedException(type: type, message: message),
  'DirectoryNotDisabledException': (type, message) =>
      DirectoryNotDisabledException(type: type, message: message),
  'DirectoryNotEnabledException': (type, message) =>
      DirectoryNotEnabledException(type: type, message: message),
  'FacetAlreadyExistsException': (type, message) =>
      FacetAlreadyExistsException(type: type, message: message),
  'FacetInUseException': (type, message) =>
      FacetInUseException(type: type, message: message),
  'FacetNotFoundException': (type, message) =>
      FacetNotFoundException(type: type, message: message),
  'FacetValidationException': (type, message) =>
      FacetValidationException(type: type, message: message),
  'IncompatibleSchemaException': (type, message) =>
      IncompatibleSchemaException(type: type, message: message),
  'IndexedAttributeMissingException': (type, message) =>
      IndexedAttributeMissingException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidArnException': (type, message) =>
      InvalidArnException(type: type, message: message),
  'InvalidAttachmentException': (type, message) =>
      InvalidAttachmentException(type: type, message: message),
  'InvalidFacetUpdateException': (type, message) =>
      InvalidFacetUpdateException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidRuleException': (type, message) =>
      InvalidRuleException(type: type, message: message),
  'InvalidSchemaDocException': (type, message) =>
      InvalidSchemaDocException(type: type, message: message),
  'InvalidTaggingRequestException': (type, message) =>
      InvalidTaggingRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'LinkNameAlreadyInUseException': (type, message) =>
      LinkNameAlreadyInUseException(type: type, message: message),
  'NotIndexException': (type, message) =>
      NotIndexException(type: type, message: message),
  'NotNodeException': (type, message) =>
      NotNodeException(type: type, message: message),
  'NotPolicyException': (type, message) =>
      NotPolicyException(type: type, message: message),
  'ObjectAlreadyDetachedException': (type, message) =>
      ObjectAlreadyDetachedException(type: type, message: message),
  'ObjectNotDetachedException': (type, message) =>
      ObjectNotDetachedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'RetryableConflictException': (type, message) =>
      RetryableConflictException(type: type, message: message),
  'SchemaAlreadyExistsException': (type, message) =>
      SchemaAlreadyExistsException(type: type, message: message),
  'SchemaAlreadyPublishedException': (type, message) =>
      SchemaAlreadyPublishedException(type: type, message: message),
  'StillContainsLinksException': (type, message) =>
      StillContainsLinksException(type: type, message: message),
  'UnsupportedIndexTypeException': (type, message) =>
      UnsupportedIndexTypeException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
