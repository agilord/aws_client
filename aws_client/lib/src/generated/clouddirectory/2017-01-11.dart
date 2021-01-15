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

part '2017-01-11.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'clouddirectory',
            signingName: 'clouddirectory',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    @_s.required SchemaFacet schemaFacet,
    List<AttributeKeyAndValue> objectAttributeList,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    ArgumentError.checkNotNull(schemaFacet, 'schemaFacet');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return AddFacetToObjectResponse.fromJson(response);
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
    @_s.required String directoryArn,
    @_s.required String publishedSchemaArn,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(publishedSchemaArn, 'publishedSchemaArn');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required ObjectReference childReference,
    @_s.required String directoryArn,
    @_s.required String linkName,
    @_s.required ObjectReference parentReference,
  }) async {
    ArgumentError.checkNotNull(childReference, 'childReference');
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(linkName, 'linkName');
    _s.validateStringLength(
      'linkName',
      linkName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'linkName',
      linkName,
      r'''[^\/\[\]\(\):\{\}#@!?\s\\;]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(parentReference, 'parentReference');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    @_s.required ObjectReference policyReference,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    ArgumentError.checkNotNull(policyReference, 'policyReference');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return AttachPolicyResponse.fromJson(response);
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
    @_s.required String directoryArn,
    @_s.required ObjectReference indexReference,
    @_s.required ObjectReference targetReference,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(indexReference, 'indexReference');
    ArgumentError.checkNotNull(targetReference, 'targetReference');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required List<AttributeNameAndValue> attributes,
    @_s.required String directoryArn,
    @_s.required ObjectReference sourceObjectReference,
    @_s.required ObjectReference targetObjectReference,
    @_s.required TypedLinkSchemaAndFacetName typedLinkFacet,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(sourceObjectReference, 'sourceObjectReference');
    ArgumentError.checkNotNull(targetObjectReference, 'targetObjectReference');
    ArgumentError.checkNotNull(typedLinkFacet, 'typedLinkFacet');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required List<BatchReadOperation> operations,
    ConsistencyLevel consistencyLevel,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(operations, 'operations');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
    consistencyLevel
        ?.let((v) => headers['x-amz-consistency-level'] = v.toValue());
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
    @_s.required String directoryArn,
    @_s.required List<BatchWriteOperation> operations,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(operations, 'operations');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String name,
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String name,
    @_s.required String schemaArn,
    List<FacetAttribute> attributes,
    FacetStyle facetStyle,
    ObjectType objectType,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return CreateFacetResponse.fromJson(response);
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
    @_s.required String directoryArn,
    @_s.required bool isUnique,
    @_s.required List<AttributeKey> orderedIndexedAttributeList,
    String linkName,
    ObjectReference parentReference,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(isUnique, 'isUnique');
    ArgumentError.checkNotNull(
        orderedIndexedAttributeList, 'orderedIndexedAttributeList');
    _s.validateStringLength(
      'linkName',
      linkName,
      1,
      64,
    );
    _s.validateStringPattern(
      'linkName',
      linkName,
      r'''[^\/\[\]\(\):\{\}#@!?\s\\;]+''',
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required List<SchemaFacet> schemaFacets,
    String linkName,
    List<AttributeKeyAndValue> objectAttributeList,
    ObjectReference parentReference,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(schemaFacets, 'schemaFacets');
    _s.validateStringLength(
      'linkName',
      linkName,
      1,
      64,
    );
    _s.validateStringPattern(
      'linkName',
      linkName,
      r'''[^\/\[\]\(\):\{\}#@!?\s\\;]+''',
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
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
    @_s.required TypedLinkFacet facet,
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(facet, 'facet');
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return CreateTypedLinkFacetResponse.fromJson(response);
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
    @_s.required String directoryArn,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String name,
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return DeleteFacetResponse.fromJson(response);
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return DeleteObjectResponse.fromJson(response);
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
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String name,
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return DeleteTypedLinkFacetResponse.fromJson(response);
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
    @_s.required String directoryArn,
    @_s.required ObjectReference indexReference,
    @_s.required ObjectReference targetReference,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(indexReference, 'indexReference');
    ArgumentError.checkNotNull(targetReference, 'targetReference');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required String linkName,
    @_s.required ObjectReference parentReference,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(linkName, 'linkName');
    _s.validateStringLength(
      'linkName',
      linkName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'linkName',
      linkName,
      r'''[^\/\[\]\(\):\{\}#@!?\s\\;]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(parentReference, 'parentReference');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    @_s.required ObjectReference policyReference,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    ArgumentError.checkNotNull(policyReference, 'policyReference');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return DetachPolicyResponse.fromJson(response);
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
    @_s.required String directoryArn,
    @_s.required TypedLinkSpecifier typedLinkSpecifier,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(typedLinkSpecifier, 'typedLinkSpecifier');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
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
    @_s.required String directoryArn,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String name,
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required List<String> attributeNames,
    @_s.required String directoryArn,
    @_s.required TypedLinkSpecifier typedLinkSpecifier,
    ConsistencyLevel consistencyLevel,
  }) async {
    ArgumentError.checkNotNull(attributeNames, 'attributeNames');
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(typedLinkSpecifier, 'typedLinkSpecifier');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required List<String> attributeNames,
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    @_s.required SchemaFacet schemaFacet,
    ConsistencyLevel consistencyLevel,
  }) async {
    ArgumentError.checkNotNull(attributeNames, 'attributeNames');
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    ArgumentError.checkNotNull(schemaFacet, 'schemaFacet');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
    consistencyLevel
        ?.let((v) => headers['x-amz-consistency-level'] = v.toValue());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    ConsistencyLevel consistencyLevel,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
    consistencyLevel
        ?.let((v) => headers['x-amz-consistency-level'] = v.toValue());
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
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String name,
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    int maxResults,
    String nextToken,
    String schemaArn,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
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
    @_s.required String directoryArn,
    @_s.required ObjectReference targetReference,
    ConsistencyLevel consistencyLevel,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(targetReference, 'targetReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
    consistencyLevel
        ?.let((v) => headers['x-amz-consistency-level'] = v.toValue());
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
    DirectoryState state,
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
    @_s.required String name,
    @_s.required String schemaArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String schemaArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    ConsistencyLevel consistencyLevel,
    List<TypedLinkAttributeRange> filterAttributeRanges,
    TypedLinkSchemaAndFacetName filterTypedLink,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference indexReference,
    ConsistencyLevel consistencyLevel,
    int maxResults,
    String nextToken,
    List<ObjectAttributeRange> rangesOnIndexedValues,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(indexReference, 'indexReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
    consistencyLevel
        ?.let((v) => headers['x-amz-consistency-level'] = v.toValue());
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
    int maxResults,
    String nextToken,
    String schemaArn,
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    ConsistencyLevel consistencyLevel,
    SchemaFacet facetFilter,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
    consistencyLevel
        ?.let((v) => headers['x-amz-consistency-level'] = v.toValue());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    ConsistencyLevel consistencyLevel,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
    consistencyLevel
        ?.let((v) => headers['x-amz-consistency-level'] = v.toValue());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    ConsistencyLevel consistencyLevel,
    bool includeAllLinksToEachParent,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
    consistencyLevel
        ?.let((v) => headers['x-amz-consistency-level'] = v.toValue());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    ConsistencyLevel consistencyLevel,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
    consistencyLevel
        ?.let((v) => headers['x-amz-consistency-level'] = v.toValue());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    ConsistencyLevel consistencyLevel,
    List<TypedLinkAttributeRange> filterAttributeRanges,
    TypedLinkSchemaAndFacetName filterTypedLink,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference policyReference,
    ConsistencyLevel consistencyLevel,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(policyReference, 'policyReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
    consistencyLevel
        ?.let((v) => headers['x-amz-consistency-level'] = v.toValue());
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
    int maxResults,
    String nextToken,
    String schemaArn,
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
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    @_s.required String name,
    @_s.required String schemaArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String schemaArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String developmentSchemaArn,
    @_s.required String version,
    String minorVersion,
    String name,
  }) async {
    ArgumentError.checkNotNull(developmentSchemaArn, 'developmentSchemaArn');
    ArgumentError.checkNotNull(version, 'version');
    _s.validateStringLength(
      'version',
      version,
      1,
      10,
      isRequired: true,
    );
    _s.validateStringPattern(
      'version',
      version,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'minorVersion',
      minorVersion,
      1,
      10,
    );
    _s.validateStringPattern(
      'minorVersion',
      minorVersion,
      r'''^[a-zA-Z0-9._-]*$''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
    );
    final headers = <String, String>{};
    developmentSchemaArn
        ?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String document,
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(document, 'document');
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
    @_s.required SchemaFacet schemaFacet,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    ArgumentError.checkNotNull(schemaFacet, 'schemaFacet');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return RemoveFacetFromObjectResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
    return UntagResourceResponse.fromJson(response);
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
    @_s.required String name,
    @_s.required String schemaArn,
    List<FacetAttributeUpdate> attributeUpdates,
    ObjectType objectType,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return UpdateFacetResponse.fromJson(response);
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
    @_s.required List<LinkAttributeUpdate> attributeUpdates,
    @_s.required String directoryArn,
    @_s.required TypedLinkSpecifier typedLinkSpecifier,
  }) async {
    ArgumentError.checkNotNull(attributeUpdates, 'attributeUpdates');
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(typedLinkSpecifier, 'typedLinkSpecifier');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return UpdateLinkAttributesResponse.fromJson(response);
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
    @_s.required List<ObjectAttributeUpdate> attributeUpdates,
    @_s.required String directoryArn,
    @_s.required ObjectReference objectReference,
  }) async {
    ArgumentError.checkNotNull(attributeUpdates, 'attributeUpdates');
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(objectReference, 'objectReference');
    final headers = <String, String>{};
    directoryArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required String name,
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    @_s.required List<TypedLinkFacetAttributeUpdate> attributeUpdates,
    @_s.required List<String> identityAttributeOrder,
    @_s.required String name,
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(attributeUpdates, 'attributeUpdates');
    ArgumentError.checkNotNull(
        identityAttributeOrder, 'identityAttributeOrder');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    final headers = <String, String>{};
    schemaArn?.let((v) => headers['x-amz-data-partition'] = v.toString());
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
    return UpdateTypedLinkFacetResponse.fromJson(response);
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
    @_s.required String directoryArn,
    @_s.required String publishedSchemaArn,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(directoryArn, 'directoryArn');
    ArgumentError.checkNotNull(publishedSchemaArn, 'publishedSchemaArn');
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
    @_s.required String developmentSchemaArn,
    @_s.required String minorVersion,
    @_s.required String publishedSchemaArn,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(developmentSchemaArn, 'developmentSchemaArn');
    ArgumentError.checkNotNull(minorVersion, 'minorVersion');
    _s.validateStringLength(
      'minorVersion',
      minorVersion,
      1,
      10,
      isRequired: true,
    );
    _s.validateStringPattern(
      'minorVersion',
      minorVersion,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(publishedSchemaArn, 'publishedSchemaArn');
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddFacetToObjectResponse {
  AddFacetToObjectResponse();
  factory AddFacetToObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$AddFacetToObjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplySchemaResponse {
  /// The applied schema ARN that is associated with the copied schema in the
  /// <a>Directory</a>. You can use this ARN to describe the schema information
  /// applied on this directory. For more information, see <a>arns</a>.
  @_s.JsonKey(name: 'AppliedSchemaArn')
  final String appliedSchemaArn;

  /// The ARN that is associated with the <a>Directory</a>. For more information,
  /// see <a>arns</a>.
  @_s.JsonKey(name: 'DirectoryArn')
  final String directoryArn;

  ApplySchemaResponse({
    this.appliedSchemaArn,
    this.directoryArn,
  });
  factory ApplySchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplySchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachObjectResponse {
  /// The attached <code>ObjectIdentifier</code>, which is the child
  /// <code>ObjectIdentifier</code>.
  @_s.JsonKey(name: 'AttachedObjectIdentifier')
  final String attachedObjectIdentifier;

  AttachObjectResponse({
    this.attachedObjectIdentifier,
  });
  factory AttachObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$AttachObjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachPolicyResponse {
  AttachPolicyResponse();
  factory AttachPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$AttachPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachToIndexResponse {
  /// The <code>ObjectIdentifier</code> of the object that was attached to the
  /// index.
  @_s.JsonKey(name: 'AttachedObjectIdentifier')
  final String attachedObjectIdentifier;

  AttachToIndexResponse({
    this.attachedObjectIdentifier,
  });
  factory AttachToIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$AttachToIndexResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachTypedLinkResponse {
  /// Returns a typed link specifier as output.
  @_s.JsonKey(name: 'TypedLinkSpecifier')
  final TypedLinkSpecifier typedLinkSpecifier;

  AttachTypedLinkResponse({
    this.typedLinkSpecifier,
  });
  factory AttachTypedLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$AttachTypedLinkResponseFromJson(json);
}

/// A unique identifier for an attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AttributeKey {
  /// The name of the facet that the attribute exists within.
  @_s.JsonKey(name: 'FacetName')
  final String facetName;

  /// The name of the attribute.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Resource Name (ARN) of the schema that contains the facet and
  /// attribute.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  AttributeKey({
    @_s.required this.facetName,
    @_s.required this.name,
    @_s.required this.schemaArn,
  });
  factory AttributeKey.fromJson(Map<String, dynamic> json) =>
      _$AttributeKeyFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeKeyToJson(this);
}

/// The combination of an attribute key and an attribute value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AttributeKeyAndValue {
  /// The key of the attribute.
  @_s.JsonKey(name: 'Key')
  final AttributeKey key;

  /// The value of the attribute.
  @_s.JsonKey(name: 'Value')
  final TypedAttributeValue value;

  AttributeKeyAndValue({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory AttributeKeyAndValue.fromJson(Map<String, dynamic> json) =>
      _$AttributeKeyAndValueFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeKeyAndValueToJson(this);
}

/// Identifies the attribute name and value for a typed link.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AttributeNameAndValue {
  /// The attribute name of the typed link.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The value for the typed link.
  @_s.JsonKey(name: 'Value')
  final TypedAttributeValue value;

  AttributeNameAndValue({
    @_s.required this.attributeName,
    @_s.required this.value,
  });
  factory AttributeNameAndValue.fromJson(Map<String, dynamic> json) =>
      _$AttributeNameAndValueFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeNameAndValueToJson(this);
}

/// Represents the output of a batch add facet to object operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchAddFacetToObject {
  /// The attributes to set on the object.
  @_s.JsonKey(name: 'ObjectAttributeList')
  final List<AttributeKeyAndValue> objectAttributeList;

  /// A reference to the object being mutated.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// Represents the facet being added to the object.
  @_s.JsonKey(name: 'SchemaFacet')
  final SchemaFacet schemaFacet;

  BatchAddFacetToObject({
    @_s.required this.objectAttributeList,
    @_s.required this.objectReference,
    @_s.required this.schemaFacet,
  });
  Map<String, dynamic> toJson() => _$BatchAddFacetToObjectToJson(this);
}

/// The result of a batch add facet to object operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAddFacetToObjectResponse {
  BatchAddFacetToObjectResponse();
  factory BatchAddFacetToObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchAddFacetToObjectResponseFromJson(json);
}

/// Represents the output of an <a>AttachObject</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchAttachObject {
  /// The child object reference that is to be attached to the object.
  @_s.JsonKey(name: 'ChildReference')
  final ObjectReference childReference;

  /// The name of the link.
  @_s.JsonKey(name: 'LinkName')
  final String linkName;

  /// The parent object reference.
  @_s.JsonKey(name: 'ParentReference')
  final ObjectReference parentReference;

  BatchAttachObject({
    @_s.required this.childReference,
    @_s.required this.linkName,
    @_s.required this.parentReference,
  });
  Map<String, dynamic> toJson() => _$BatchAttachObjectToJson(this);
}

/// Represents the output batch <a>AttachObject</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAttachObjectResponse {
  /// The <code>ObjectIdentifier</code> of the object that has been attached.
  @_s.JsonKey(name: 'attachedObjectIdentifier')
  final String attachedObjectIdentifier;

  BatchAttachObjectResponse({
    this.attachedObjectIdentifier,
  });
  factory BatchAttachObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchAttachObjectResponseFromJson(json);
}

/// Attaches a policy object to a regular object inside a <a>BatchRead</a>
/// operation. For more information, see <a>AttachPolicy</a> and
/// <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchAttachPolicy {
  /// The reference that identifies the object to which the policy will be
  /// attached.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// The reference that is associated with the policy object.
  @_s.JsonKey(name: 'PolicyReference')
  final ObjectReference policyReference;

  BatchAttachPolicy({
    @_s.required this.objectReference,
    @_s.required this.policyReference,
  });
  Map<String, dynamic> toJson() => _$BatchAttachPolicyToJson(this);
}

/// Represents the output of an <a>AttachPolicy</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAttachPolicyResponse {
  BatchAttachPolicyResponse();
  factory BatchAttachPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchAttachPolicyResponseFromJson(json);
}

/// Attaches the specified object to the specified index inside a
/// <a>BatchRead</a> operation. For more information, see <a>AttachToIndex</a>
/// and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchAttachToIndex {
  /// A reference to the index that you are attaching the object to.
  @_s.JsonKey(name: 'IndexReference')
  final ObjectReference indexReference;

  /// A reference to the object that you are attaching to the index.
  @_s.JsonKey(name: 'TargetReference')
  final ObjectReference targetReference;

  BatchAttachToIndex({
    @_s.required this.indexReference,
    @_s.required this.targetReference,
  });
  Map<String, dynamic> toJson() => _$BatchAttachToIndexToJson(this);
}

/// Represents the output of a <a>AttachToIndex</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAttachToIndexResponse {
  /// The <code>ObjectIdentifier</code> of the object that was attached to the
  /// index.
  @_s.JsonKey(name: 'AttachedObjectIdentifier')
  final String attachedObjectIdentifier;

  BatchAttachToIndexResponse({
    this.attachedObjectIdentifier,
  });
  factory BatchAttachToIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchAttachToIndexResponseFromJson(json);
}

/// Attaches a typed link to a specified source and target object inside a
/// <a>BatchRead</a> operation. For more information, see <a>AttachTypedLink</a>
/// and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchAttachTypedLink {
  /// A set of attributes that are associated with the typed link.
  @_s.JsonKey(name: 'Attributes')
  final List<AttributeNameAndValue> attributes;

  /// Identifies the source object that the typed link will attach to.
  @_s.JsonKey(name: 'SourceObjectReference')
  final ObjectReference sourceObjectReference;

  /// Identifies the target object that the typed link will attach to.
  @_s.JsonKey(name: 'TargetObjectReference')
  final ObjectReference targetObjectReference;

  /// Identifies the typed link facet that is associated with the typed link.
  @_s.JsonKey(name: 'TypedLinkFacet')
  final TypedLinkSchemaAndFacetName typedLinkFacet;

  BatchAttachTypedLink({
    @_s.required this.attributes,
    @_s.required this.sourceObjectReference,
    @_s.required this.targetObjectReference,
    @_s.required this.typedLinkFacet,
  });
  Map<String, dynamic> toJson() => _$BatchAttachTypedLinkToJson(this);
}

/// Represents the output of a <a>AttachTypedLink</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAttachTypedLinkResponse {
  /// Returns a typed link specifier as output.
  @_s.JsonKey(name: 'TypedLinkSpecifier')
  final TypedLinkSpecifier typedLinkSpecifier;

  BatchAttachTypedLinkResponse({
    this.typedLinkSpecifier,
  });
  factory BatchAttachTypedLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchAttachTypedLinkResponseFromJson(json);
}

/// Creates an index object inside of a <a>BatchRead</a> operation. For more
/// information, see <a>CreateIndex</a> and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchCreateIndex {
  /// Indicates whether the attribute that is being indexed has unique values or
  /// not.
  @_s.JsonKey(name: 'IsUnique')
  final bool isUnique;

  /// Specifies the attributes that should be indexed on. Currently only a single
  /// attribute is supported.
  @_s.JsonKey(name: 'OrderedIndexedAttributeList')
  final List<AttributeKey> orderedIndexedAttributeList;

  /// The batch reference name. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/transaction_support.html">Transaction
  /// Support</a> for more information.
  @_s.JsonKey(name: 'BatchReferenceName')
  final String batchReferenceName;

  /// The name of the link between the parent object and the index object.
  @_s.JsonKey(name: 'LinkName')
  final String linkName;

  /// A reference to the parent object that contains the index object.
  @_s.JsonKey(name: 'ParentReference')
  final ObjectReference parentReference;

  BatchCreateIndex({
    @_s.required this.isUnique,
    @_s.required this.orderedIndexedAttributeList,
    this.batchReferenceName,
    this.linkName,
    this.parentReference,
  });
  Map<String, dynamic> toJson() => _$BatchCreateIndexToJson(this);
}

/// Represents the output of a <a>CreateIndex</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCreateIndexResponse {
  /// The <code>ObjectIdentifier</code> of the index created by this operation.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  BatchCreateIndexResponse({
    this.objectIdentifier,
  });
  factory BatchCreateIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateIndexResponseFromJson(json);
}

/// Represents the output of a <a>CreateObject</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchCreateObject {
  /// An attribute map, which contains an attribute ARN as the key and attribute
  /// value as the map value.
  @_s.JsonKey(name: 'ObjectAttributeList')
  final List<AttributeKeyAndValue> objectAttributeList;

  /// A list of <code>FacetArns</code> that will be associated with the object.
  /// For more information, see <a>arns</a>.
  @_s.JsonKey(name: 'SchemaFacet')
  final List<SchemaFacet> schemaFacet;

  /// The batch reference name. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/transaction_support.html">Transaction
  /// Support</a> for more information.
  @_s.JsonKey(name: 'BatchReferenceName')
  final String batchReferenceName;

  /// The name of the link.
  @_s.JsonKey(name: 'LinkName')
  final String linkName;

  /// If specified, the parent reference to which this object will be attached.
  @_s.JsonKey(name: 'ParentReference')
  final ObjectReference parentReference;

  BatchCreateObject({
    @_s.required this.objectAttributeList,
    @_s.required this.schemaFacet,
    this.batchReferenceName,
    this.linkName,
    this.parentReference,
  });
  Map<String, dynamic> toJson() => _$BatchCreateObjectToJson(this);
}

/// Represents the output of a <a>CreateObject</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCreateObjectResponse {
  /// The ID that is associated with the object.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  BatchCreateObjectResponse({
    this.objectIdentifier,
  });
  factory BatchCreateObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateObjectResponseFromJson(json);
}

/// Represents the output of a <a>DeleteObject</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchDeleteObject {
  /// The reference that identifies the object.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  BatchDeleteObject({
    @_s.required this.objectReference,
  });
  Map<String, dynamic> toJson() => _$BatchDeleteObjectToJson(this);
}

/// Represents the output of a <a>DeleteObject</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteObjectResponse {
  BatchDeleteObjectResponse();
  factory BatchDeleteObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteObjectResponseFromJson(json);
}

/// Detaches the specified object from the specified index inside a
/// <a>BatchRead</a> operation. For more information, see <a>DetachFromIndex</a>
/// and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchDetachFromIndex {
  /// A reference to the index object.
  @_s.JsonKey(name: 'IndexReference')
  final ObjectReference indexReference;

  /// A reference to the object being detached from the index.
  @_s.JsonKey(name: 'TargetReference')
  final ObjectReference targetReference;

  BatchDetachFromIndex({
    @_s.required this.indexReference,
    @_s.required this.targetReference,
  });
  Map<String, dynamic> toJson() => _$BatchDetachFromIndexToJson(this);
}

/// Represents the output of a <a>DetachFromIndex</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDetachFromIndexResponse {
  /// The <code>ObjectIdentifier</code> of the object that was detached from the
  /// index.
  @_s.JsonKey(name: 'DetachedObjectIdentifier')
  final String detachedObjectIdentifier;

  BatchDetachFromIndexResponse({
    this.detachedObjectIdentifier,
  });
  factory BatchDetachFromIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDetachFromIndexResponseFromJson(json);
}

/// Represents the output of a <a>DetachObject</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchDetachObject {
  /// The name of the link.
  @_s.JsonKey(name: 'LinkName')
  final String linkName;

  /// Parent reference from which the object with the specified link name is
  /// detached.
  @_s.JsonKey(name: 'ParentReference')
  final ObjectReference parentReference;

  /// The batch reference name. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/transaction_support.html">Transaction
  /// Support</a> for more information.
  @_s.JsonKey(name: 'BatchReferenceName')
  final String batchReferenceName;

  BatchDetachObject({
    @_s.required this.linkName,
    @_s.required this.parentReference,
    this.batchReferenceName,
  });
  Map<String, dynamic> toJson() => _$BatchDetachObjectToJson(this);
}

/// Represents the output of a <a>DetachObject</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDetachObjectResponse {
  /// The <code>ObjectIdentifier</code> of the detached object.
  @_s.JsonKey(name: 'detachedObjectIdentifier')
  final String detachedObjectIdentifier;

  BatchDetachObjectResponse({
    this.detachedObjectIdentifier,
  });
  factory BatchDetachObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDetachObjectResponseFromJson(json);
}

/// Detaches the specified policy from the specified directory inside a
/// <a>BatchWrite</a> operation. For more information, see <a>DetachPolicy</a>
/// and <a>BatchWriteRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchDetachPolicy {
  /// Reference that identifies the object whose policy object will be detached.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// Reference that identifies the policy object.
  @_s.JsonKey(name: 'PolicyReference')
  final ObjectReference policyReference;

  BatchDetachPolicy({
    @_s.required this.objectReference,
    @_s.required this.policyReference,
  });
  Map<String, dynamic> toJson() => _$BatchDetachPolicyToJson(this);
}

/// Represents the output of a <a>DetachPolicy</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDetachPolicyResponse {
  BatchDetachPolicyResponse();
  factory BatchDetachPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDetachPolicyResponseFromJson(json);
}

/// Detaches a typed link from a specified source and target object inside a
/// <a>BatchRead</a> operation. For more information, see <a>DetachTypedLink</a>
/// and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchDetachTypedLink {
  /// Used to accept a typed link specifier as input.
  @_s.JsonKey(name: 'TypedLinkSpecifier')
  final TypedLinkSpecifier typedLinkSpecifier;

  BatchDetachTypedLink({
    @_s.required this.typedLinkSpecifier,
  });
  Map<String, dynamic> toJson() => _$BatchDetachTypedLinkToJson(this);
}

/// Represents the output of a <a>DetachTypedLink</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDetachTypedLinkResponse {
  BatchDetachTypedLinkResponse();
  factory BatchDetachTypedLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDetachTypedLinkResponseFromJson(json);
}

/// Retrieves attributes that are associated with a typed link inside a
/// <a>BatchRead</a> operation. For more information, see
/// <a>GetLinkAttributes</a> and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchGetLinkAttributes {
  /// A list of attribute names whose values will be retrieved.
  @_s.JsonKey(name: 'AttributeNames')
  final List<String> attributeNames;

  /// Allows a typed link specifier to be accepted as input.
  @_s.JsonKey(name: 'TypedLinkSpecifier')
  final TypedLinkSpecifier typedLinkSpecifier;

  BatchGetLinkAttributes({
    @_s.required this.attributeNames,
    @_s.required this.typedLinkSpecifier,
  });
  Map<String, dynamic> toJson() => _$BatchGetLinkAttributesToJson(this);
}

/// Represents the output of a <a>GetLinkAttributes</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetLinkAttributesResponse {
  /// The attributes that are associated with the typed link.
  @_s.JsonKey(name: 'Attributes')
  final List<AttributeKeyAndValue> attributes;

  BatchGetLinkAttributesResponse({
    this.attributes,
  });
  factory BatchGetLinkAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetLinkAttributesResponseFromJson(json);
}

/// Retrieves attributes within a facet that are associated with an object
/// inside an <a>BatchRead</a> operation. For more information, see
/// <a>GetObjectAttributes</a> and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchGetObjectAttributes {
  /// List of attribute names whose values will be retrieved.
  @_s.JsonKey(name: 'AttributeNames')
  final List<String> attributeNames;

  /// Reference that identifies the object whose attributes will be retrieved.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// Identifier for the facet whose attributes will be retrieved. See
  /// <a>SchemaFacet</a> for details.
  @_s.JsonKey(name: 'SchemaFacet')
  final SchemaFacet schemaFacet;

  BatchGetObjectAttributes({
    @_s.required this.attributeNames,
    @_s.required this.objectReference,
    @_s.required this.schemaFacet,
  });
  Map<String, dynamic> toJson() => _$BatchGetObjectAttributesToJson(this);
}

/// Represents the output of a <a>GetObjectAttributes</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetObjectAttributesResponse {
  /// The attribute values that are associated with an object.
  @_s.JsonKey(name: 'Attributes')
  final List<AttributeKeyAndValue> attributes;

  BatchGetObjectAttributesResponse({
    this.attributes,
  });
  factory BatchGetObjectAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchGetObjectAttributesResponseFromJson(json);
}

/// Retrieves metadata about an object inside a <a>BatchRead</a> operation. For
/// more information, see <a>GetObjectInformation</a> and
/// <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchGetObjectInformation {
  /// A reference to the object.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  BatchGetObjectInformation({
    @_s.required this.objectReference,
  });
  Map<String, dynamic> toJson() => _$BatchGetObjectInformationToJson(this);
}

/// Represents the output of a <a>GetObjectInformation</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetObjectInformationResponse {
  /// The <code>ObjectIdentifier</code> of the specified object.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  /// The facets attached to the specified object.
  @_s.JsonKey(name: 'SchemaFacets')
  final List<SchemaFacet> schemaFacets;

  BatchGetObjectInformationResponse({
    this.objectIdentifier,
    this.schemaFacets,
  });
  factory BatchGetObjectInformationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchGetObjectInformationResponseFromJson(json);
}

/// Lists indices attached to an object inside a <a>BatchRead</a> operation. For
/// more information, see <a>ListAttachedIndices</a> and
/// <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchListAttachedIndices {
  /// A reference to the object that has indices attached.
  @_s.JsonKey(name: 'TargetReference')
  final ObjectReference targetReference;

  /// The maximum number of results to retrieve.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListAttachedIndices({
    @_s.required this.targetReference,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$BatchListAttachedIndicesToJson(this);
}

/// Represents the output of a <a>ListAttachedIndices</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchListAttachedIndicesResponse {
  /// The indices attached to the specified object.
  @_s.JsonKey(name: 'IndexAttachments')
  final List<IndexAttachment> indexAttachments;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListAttachedIndicesResponse({
    this.indexAttachments,
    this.nextToken,
  });
  factory BatchListAttachedIndicesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchListAttachedIndicesResponseFromJson(json);
}

/// Returns a paginated list of all the incoming <a>TypedLinkSpecifier</a>
/// information for an object inside a <a>BatchRead</a> operation. For more
/// information, see <a>ListIncomingTypedLinks</a> and
/// <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchListIncomingTypedLinks {
  /// The reference that identifies the object whose attributes will be listed.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// Provides range filters for multiple attributes. When providing ranges to
  /// typed link selection, any inexact ranges must be specified at the end. Any
  /// attributes that do not have a range specified are presumed to match the
  /// entire range.
  @_s.JsonKey(name: 'FilterAttributeRanges')
  final List<TypedLinkAttributeRange> filterAttributeRanges;

  /// Filters are interpreted in the order of the attributes on the typed link
  /// facet, not the order in which they are supplied to any API calls.
  @_s.JsonKey(name: 'FilterTypedLink')
  final TypedLinkSchemaAndFacetName filterTypedLink;

  /// The maximum number of results to retrieve.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListIncomingTypedLinks({
    @_s.required this.objectReference,
    this.filterAttributeRanges,
    this.filterTypedLink,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$BatchListIncomingTypedLinksToJson(this);
}

/// Represents the output of a <a>ListIncomingTypedLinks</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchListIncomingTypedLinksResponse {
  /// Returns one or more typed link specifiers as output.
  @_s.JsonKey(name: 'LinkSpecifiers')
  final List<TypedLinkSpecifier> linkSpecifiers;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListIncomingTypedLinksResponse({
    this.linkSpecifiers,
    this.nextToken,
  });
  factory BatchListIncomingTypedLinksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchListIncomingTypedLinksResponseFromJson(json);
}

/// Lists objects attached to the specified index inside a <a>BatchRead</a>
/// operation. For more information, see <a>ListIndex</a> and
/// <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchListIndex {
  /// The reference to the index to list.
  @_s.JsonKey(name: 'IndexReference')
  final ObjectReference indexReference;

  /// The maximum number of results to retrieve.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Specifies the ranges of indexed values that you want to query.
  @_s.JsonKey(name: 'RangesOnIndexedValues')
  final List<ObjectAttributeRange> rangesOnIndexedValues;

  BatchListIndex({
    @_s.required this.indexReference,
    this.maxResults,
    this.nextToken,
    this.rangesOnIndexedValues,
  });
  Map<String, dynamic> toJson() => _$BatchListIndexToJson(this);
}

/// Represents the output of a <a>ListIndex</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchListIndexResponse {
  /// The objects and indexed values attached to the index.
  @_s.JsonKey(name: 'IndexAttachments')
  final List<IndexAttachment> indexAttachments;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListIndexResponse({
    this.indexAttachments,
    this.nextToken,
  });
  factory BatchListIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchListIndexResponseFromJson(json);
}

/// Represents the output of a <a>ListObjectAttributes</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchListObjectAttributes {
  /// Reference of the object whose attributes need to be listed.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// Used to filter the list of object attributes that are associated with a
  /// certain facet.
  @_s.JsonKey(name: 'FacetFilter')
  final SchemaFacet facetFilter;

  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListObjectAttributes({
    @_s.required this.objectReference,
    this.facetFilter,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$BatchListObjectAttributesToJson(this);
}

/// Represents the output of a <a>ListObjectAttributes</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchListObjectAttributesResponse {
  /// The attributes map that is associated with the object.
  /// <code>AttributeArn</code> is the key; attribute value is the value.
  @_s.JsonKey(name: 'Attributes')
  final List<AttributeKeyAndValue> attributes;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListObjectAttributesResponse({
    this.attributes,
    this.nextToken,
  });
  factory BatchListObjectAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchListObjectAttributesResponseFromJson(json);
}

/// Represents the output of a <a>ListObjectChildren</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchListObjectChildren {
  /// Reference of the object for which child objects are being listed.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// Maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListObjectChildren({
    @_s.required this.objectReference,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$BatchListObjectChildrenToJson(this);
}

/// Represents the output of a <a>ListObjectChildren</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchListObjectChildrenResponse {
  /// The children structure, which is a map with the key as the
  /// <code>LinkName</code> and <code>ObjectIdentifier</code> as the value.
  @_s.JsonKey(name: 'Children')
  final Map<String, String> children;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListObjectChildrenResponse({
    this.children,
    this.nextToken,
  });
  factory BatchListObjectChildrenResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchListObjectChildrenResponseFromJson(json);
}

/// Retrieves all available parent paths for any object type such as node, leaf
/// node, policy node, and index node objects inside a <a>BatchRead</a>
/// operation. For more information, see <a>ListObjectParentPaths</a> and
/// <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchListObjectParentPaths {
  /// The reference that identifies the object whose attributes will be listed.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// The maximum number of results to retrieve.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListObjectParentPaths({
    @_s.required this.objectReference,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$BatchListObjectParentPathsToJson(this);
}

/// Represents the output of a <a>ListObjectParentPaths</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchListObjectParentPathsResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns the path to the <code>ObjectIdentifiers</code> that are associated
  /// with the directory.
  @_s.JsonKey(name: 'PathToObjectIdentifiersList')
  final List<PathToObjectIdentifiers> pathToObjectIdentifiersList;

  BatchListObjectParentPathsResponse({
    this.nextToken,
    this.pathToObjectIdentifiersList,
  });
  factory BatchListObjectParentPathsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchListObjectParentPathsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchListObjectParents {
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListObjectParents({
    @_s.required this.objectReference,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$BatchListObjectParentsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchListObjectParentsResponse {
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'ParentLinks')
  final List<ObjectIdentifierAndLinkNameTuple> parentLinks;

  BatchListObjectParentsResponse({
    this.nextToken,
    this.parentLinks,
  });
  factory BatchListObjectParentsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchListObjectParentsResponseFromJson(json);
}

/// Returns policies attached to an object in pagination fashion inside a
/// <a>BatchRead</a> operation. For more information, see
/// <a>ListObjectPolicies</a> and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchListObjectPolicies {
  /// The reference that identifies the object whose attributes will be listed.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// The maximum number of results to retrieve.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListObjectPolicies({
    @_s.required this.objectReference,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$BatchListObjectPoliciesToJson(this);
}

/// Represents the output of a <a>ListObjectPolicies</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchListObjectPoliciesResponse {
  /// A list of policy <code>ObjectIdentifiers</code>, that are attached to the
  /// object.
  @_s.JsonKey(name: 'AttachedPolicyIds')
  final List<String> attachedPolicyIds;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListObjectPoliciesResponse({
    this.attachedPolicyIds,
    this.nextToken,
  });
  factory BatchListObjectPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchListObjectPoliciesResponseFromJson(json);
}

/// Returns a paginated list of all the outgoing <a>TypedLinkSpecifier</a>
/// information for an object inside a <a>BatchRead</a> operation. For more
/// information, see <a>ListOutgoingTypedLinks</a> and
/// <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchListOutgoingTypedLinks {
  /// The reference that identifies the object whose attributes will be listed.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// Provides range filters for multiple attributes. When providing ranges to
  /// typed link selection, any inexact ranges must be specified at the end. Any
  /// attributes that do not have a range specified are presumed to match the
  /// entire range.
  @_s.JsonKey(name: 'FilterAttributeRanges')
  final List<TypedLinkAttributeRange> filterAttributeRanges;

  /// Filters are interpreted in the order of the attributes defined on the typed
  /// link facet, not the order they are supplied to any API calls.
  @_s.JsonKey(name: 'FilterTypedLink')
  final TypedLinkSchemaAndFacetName filterTypedLink;

  /// The maximum number of results to retrieve.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListOutgoingTypedLinks({
    @_s.required this.objectReference,
    this.filterAttributeRanges,
    this.filterTypedLink,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$BatchListOutgoingTypedLinksToJson(this);
}

/// Represents the output of a <a>ListOutgoingTypedLinks</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchListOutgoingTypedLinksResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a typed link specifier as output.
  @_s.JsonKey(name: 'TypedLinkSpecifiers')
  final List<TypedLinkSpecifier> typedLinkSpecifiers;

  BatchListOutgoingTypedLinksResponse({
    this.nextToken,
    this.typedLinkSpecifiers,
  });
  factory BatchListOutgoingTypedLinksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchListOutgoingTypedLinksResponseFromJson(json);
}

/// Returns all of the <code>ObjectIdentifiers</code> to which a given policy is
/// attached inside a <a>BatchRead</a> operation. For more information, see
/// <a>ListPolicyAttachments</a> and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchListPolicyAttachments {
  /// The reference that identifies the policy object.
  @_s.JsonKey(name: 'PolicyReference')
  final ObjectReference policyReference;

  /// The maximum number of results to retrieve.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchListPolicyAttachments({
    @_s.required this.policyReference,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$BatchListPolicyAttachmentsToJson(this);
}

/// Represents the output of a <a>ListPolicyAttachments</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchListPolicyAttachmentsResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>ObjectIdentifiers</code> to which the policy is attached.
  @_s.JsonKey(name: 'ObjectIdentifiers')
  final List<String> objectIdentifiers;

  BatchListPolicyAttachmentsResponse({
    this.nextToken,
    this.objectIdentifiers,
  });
  factory BatchListPolicyAttachmentsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchListPolicyAttachmentsResponseFromJson(json);
}

/// Lists all policies from the root of the Directory to the object specified
/// inside a <a>BatchRead</a> operation. For more information, see
/// <a>LookupPolicy</a> and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchLookupPolicy {
  /// Reference that identifies the object whose policies will be looked up.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// The maximum number of results to retrieve.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  BatchLookupPolicy({
    @_s.required this.objectReference,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$BatchLookupPolicyToJson(this);
}

/// Represents the output of a <a>LookupPolicy</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchLookupPolicyResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Provides list of path to policies. Policies contain <code>PolicyId</code>,
  /// <code>ObjectIdentifier</code>, and <code>PolicyType</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
  @_s.JsonKey(name: 'PolicyToPathList')
  final List<PolicyToPath> policyToPathList;

  BatchLookupPolicyResponse({
    this.nextToken,
    this.policyToPathList,
  });
  factory BatchLookupPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchLookupPolicyResponseFromJson(json);
}

/// The batch read exception structure, which contains the exception type and
/// message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchReadException {
  /// An exception message that is associated with the failure.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// A type of exception, such as <code>InvalidArnException</code>.
  @_s.JsonKey(name: 'Type')
  final BatchReadExceptionType type;

  BatchReadException({
    this.message,
    this.type,
  });
  factory BatchReadException.fromJson(Map<String, dynamic> json) =>
      _$BatchReadExceptionFromJson(json);
}

enum BatchReadExceptionType {
  @_s.JsonValue('ValidationException')
  validationException,
  @_s.JsonValue('InvalidArnException')
  invalidArnException,
  @_s.JsonValue('ResourceNotFoundException')
  resourceNotFoundException,
  @_s.JsonValue('InvalidNextTokenException')
  invalidNextTokenException,
  @_s.JsonValue('AccessDeniedException')
  accessDeniedException,
  @_s.JsonValue('NotNodeException')
  notNodeException,
  @_s.JsonValue('FacetValidationException')
  facetValidationException,
  @_s.JsonValue('CannotListParentOfRootException')
  cannotListParentOfRootException,
  @_s.JsonValue('NotIndexException')
  notIndexException,
  @_s.JsonValue('NotPolicyException')
  notPolicyException,
  @_s.JsonValue('DirectoryNotEnabledException')
  directoryNotEnabledException,
  @_s.JsonValue('LimitExceededException')
  limitExceededException,
  @_s.JsonValue('InternalServiceException')
  internalServiceException,
}

/// Represents the output of a <code>BatchRead</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchReadOperation {
  /// Retrieves attributes that are associated with a typed link.
  @_s.JsonKey(name: 'GetLinkAttributes')
  final BatchGetLinkAttributes getLinkAttributes;

  /// Retrieves attributes within a facet that are associated with an object.
  @_s.JsonKey(name: 'GetObjectAttributes')
  final BatchGetObjectAttributes getObjectAttributes;

  /// Retrieves metadata about an object.
  @_s.JsonKey(name: 'GetObjectInformation')
  final BatchGetObjectInformation getObjectInformation;

  /// Lists indices attached to an object.
  @_s.JsonKey(name: 'ListAttachedIndices')
  final BatchListAttachedIndices listAttachedIndices;

  /// Returns a paginated list of all the incoming <a>TypedLinkSpecifier</a>
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  @_s.JsonKey(name: 'ListIncomingTypedLinks')
  final BatchListIncomingTypedLinks listIncomingTypedLinks;

  /// Lists objects attached to the specified index.
  @_s.JsonKey(name: 'ListIndex')
  final BatchListIndex listIndex;

  /// Lists all attributes that are associated with an object.
  @_s.JsonKey(name: 'ListObjectAttributes')
  final BatchListObjectAttributes listObjectAttributes;

  /// Returns a paginated list of child objects that are associated with a given
  /// object.
  @_s.JsonKey(name: 'ListObjectChildren')
  final BatchListObjectChildren listObjectChildren;

  /// Retrieves all available parent paths for any object type such as node, leaf
  /// node, policy node, and index node objects. For more information about
  /// objects, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directorystructure.html">Directory
  /// Structure</a>.
  @_s.JsonKey(name: 'ListObjectParentPaths')
  final BatchListObjectParentPaths listObjectParentPaths;
  @_s.JsonKey(name: 'ListObjectParents')
  final BatchListObjectParents listObjectParents;

  /// Returns policies attached to an object in pagination fashion.
  @_s.JsonKey(name: 'ListObjectPolicies')
  final BatchListObjectPolicies listObjectPolicies;

  /// Returns a paginated list of all the outgoing <a>TypedLinkSpecifier</a>
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  @_s.JsonKey(name: 'ListOutgoingTypedLinks')
  final BatchListOutgoingTypedLinks listOutgoingTypedLinks;

  /// Returns all of the <code>ObjectIdentifiers</code> to which a given policy is
  /// attached.
  @_s.JsonKey(name: 'ListPolicyAttachments')
  final BatchListPolicyAttachments listPolicyAttachments;

  /// Lists all policies from the root of the <a>Directory</a> to the object
  /// specified. If there are no policies present, an empty list is returned. If
  /// policies are present, and if some objects don't have the policies attached,
  /// it returns the <code>ObjectIdentifier</code> for such objects. If policies
  /// are present, it returns <code>ObjectIdentifier</code>,
  /// <code>policyId</code>, and <code>policyType</code>. Paths that don't lead to
  /// the root from the target object are ignored. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
  @_s.JsonKey(name: 'LookupPolicy')
  final BatchLookupPolicy lookupPolicy;

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
  Map<String, dynamic> toJson() => _$BatchReadOperationToJson(this);
}

/// Represents the output of a <code>BatchRead</code> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchReadOperationResponse {
  /// Identifies which operation in a batch has failed.
  @_s.JsonKey(name: 'ExceptionResponse')
  final BatchReadException exceptionResponse;

  /// Identifies which operation in a batch has succeeded.
  @_s.JsonKey(name: 'SuccessfulResponse')
  final BatchReadSuccessfulResponse successfulResponse;

  BatchReadOperationResponse({
    this.exceptionResponse,
    this.successfulResponse,
  });
  factory BatchReadOperationResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchReadOperationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchReadResponse {
  /// A list of all the responses for each batch read.
  @_s.JsonKey(name: 'Responses')
  final List<BatchReadOperationResponse> responses;

  BatchReadResponse({
    this.responses,
  });
  factory BatchReadResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchReadResponseFromJson(json);
}

/// Represents the output of a <code>BatchRead</code> success response
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchReadSuccessfulResponse {
  /// The list of attributes to retrieve from the typed link.
  @_s.JsonKey(name: 'GetLinkAttributes')
  final BatchGetLinkAttributesResponse getLinkAttributes;

  /// Retrieves attributes within a facet that are associated with an object.
  @_s.JsonKey(name: 'GetObjectAttributes')
  final BatchGetObjectAttributesResponse getObjectAttributes;

  /// Retrieves metadata about an object.
  @_s.JsonKey(name: 'GetObjectInformation')
  final BatchGetObjectInformationResponse getObjectInformation;

  /// Lists indices attached to an object.
  @_s.JsonKey(name: 'ListAttachedIndices')
  final BatchListAttachedIndicesResponse listAttachedIndices;

  /// Returns a paginated list of all the incoming <a>TypedLinkSpecifier</a>
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  @_s.JsonKey(name: 'ListIncomingTypedLinks')
  final BatchListIncomingTypedLinksResponse listIncomingTypedLinks;

  /// Lists objects attached to the specified index.
  @_s.JsonKey(name: 'ListIndex')
  final BatchListIndexResponse listIndex;

  /// Lists all attributes that are associated with an object.
  @_s.JsonKey(name: 'ListObjectAttributes')
  final BatchListObjectAttributesResponse listObjectAttributes;

  /// Returns a paginated list of child objects that are associated with a given
  /// object.
  @_s.JsonKey(name: 'ListObjectChildren')
  final BatchListObjectChildrenResponse listObjectChildren;

  /// Retrieves all available parent paths for any object type such as node, leaf
  /// node, policy node, and index node objects. For more information about
  /// objects, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directorystructure.html">Directory
  /// Structure</a>.
  @_s.JsonKey(name: 'ListObjectParentPaths')
  final BatchListObjectParentPathsResponse listObjectParentPaths;
  @_s.JsonKey(name: 'ListObjectParents')
  final BatchListObjectParentsResponse listObjectParents;

  /// Returns policies attached to an object in pagination fashion.
  @_s.JsonKey(name: 'ListObjectPolicies')
  final BatchListObjectPoliciesResponse listObjectPolicies;

  /// Returns a paginated list of all the outgoing <a>TypedLinkSpecifier</a>
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  @_s.JsonKey(name: 'ListOutgoingTypedLinks')
  final BatchListOutgoingTypedLinksResponse listOutgoingTypedLinks;

  /// Returns all of the <code>ObjectIdentifiers</code> to which a given policy is
  /// attached.
  @_s.JsonKey(name: 'ListPolicyAttachments')
  final BatchListPolicyAttachmentsResponse listPolicyAttachments;

  /// Lists all policies from the root of the <a>Directory</a> to the object
  /// specified. If there are no policies present, an empty list is returned. If
  /// policies are present, and if some objects don't have the policies attached,
  /// it returns the <code>ObjectIdentifier</code> for such objects. If policies
  /// are present, it returns <code>ObjectIdentifier</code>,
  /// <code>policyId</code>, and <code>policyType</code>. Paths that don't lead to
  /// the root from the target object are ignored. For more information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
  @_s.JsonKey(name: 'LookupPolicy')
  final BatchLookupPolicyResponse lookupPolicy;

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
  factory BatchReadSuccessfulResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchReadSuccessfulResponseFromJson(json);
}

/// A batch operation to remove a facet from an object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchRemoveFacetFromObject {
  /// A reference to the object whose facet will be removed.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  /// The facet to remove from the object.
  @_s.JsonKey(name: 'SchemaFacet')
  final SchemaFacet schemaFacet;

  BatchRemoveFacetFromObject({
    @_s.required this.objectReference,
    @_s.required this.schemaFacet,
  });
  Map<String, dynamic> toJson() => _$BatchRemoveFacetFromObjectToJson(this);
}

/// An empty result that represents success.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchRemoveFacetFromObjectResponse {
  BatchRemoveFacetFromObjectResponse();
  factory BatchRemoveFacetFromObjectResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchRemoveFacetFromObjectResponseFromJson(json);
}

/// Updates a given typed link’s attributes inside a <a>BatchRead</a> operation.
/// Attributes to be updated must not contribute to the typed link’s identity,
/// as defined by its <code>IdentityAttributeOrder</code>. For more information,
/// see <a>UpdateLinkAttributes</a> and <a>BatchReadRequest$Operations</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchUpdateLinkAttributes {
  /// The attributes update structure.
  @_s.JsonKey(name: 'AttributeUpdates')
  final List<LinkAttributeUpdate> attributeUpdates;

  /// Allows a typed link specifier to be accepted as input.
  @_s.JsonKey(name: 'TypedLinkSpecifier')
  final TypedLinkSpecifier typedLinkSpecifier;

  BatchUpdateLinkAttributes({
    @_s.required this.attributeUpdates,
    @_s.required this.typedLinkSpecifier,
  });
  Map<String, dynamic> toJson() => _$BatchUpdateLinkAttributesToJson(this);
}

/// Represents the output of a <a>UpdateLinkAttributes</a> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateLinkAttributesResponse {
  BatchUpdateLinkAttributesResponse();
  factory BatchUpdateLinkAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchUpdateLinkAttributesResponseFromJson(json);
}

/// Represents the output of a <code>BatchUpdate</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchUpdateObjectAttributes {
  /// Attributes update structure.
  @_s.JsonKey(name: 'AttributeUpdates')
  final List<ObjectAttributeUpdate> attributeUpdates;

  /// Reference that identifies the object.
  @_s.JsonKey(name: 'ObjectReference')
  final ObjectReference objectReference;

  BatchUpdateObjectAttributes({
    @_s.required this.attributeUpdates,
    @_s.required this.objectReference,
  });
  Map<String, dynamic> toJson() => _$BatchUpdateObjectAttributesToJson(this);
}

/// Represents the output of a <code>BatchUpdate</code> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateObjectAttributesResponse {
  /// ID that is associated with the object.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  BatchUpdateObjectAttributesResponse({
    this.objectIdentifier,
  });
  factory BatchUpdateObjectAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchUpdateObjectAttributesResponseFromJson(json);
}

/// Represents the output of a <code>BatchWrite</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchWriteOperation {
  /// A batch operation that adds a facet to an object.
  @_s.JsonKey(name: 'AddFacetToObject')
  final BatchAddFacetToObject addFacetToObject;

  /// Attaches an object to a <a>Directory</a>.
  @_s.JsonKey(name: 'AttachObject')
  final BatchAttachObject attachObject;

  /// Attaches a policy object to a regular object. An object can have a limited
  /// number of attached policies.
  @_s.JsonKey(name: 'AttachPolicy')
  final BatchAttachPolicy attachPolicy;

  /// Attaches the specified object to the specified index.
  @_s.JsonKey(name: 'AttachToIndex')
  final BatchAttachToIndex attachToIndex;

  /// Attaches a typed link to a specified source and target object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  @_s.JsonKey(name: 'AttachTypedLink')
  final BatchAttachTypedLink attachTypedLink;

  /// Creates an index object. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/indexing_search.htm">Indexing
  /// and search</a> for more information.
  @_s.JsonKey(name: 'CreateIndex')
  final BatchCreateIndex createIndex;

  /// Creates an object.
  @_s.JsonKey(name: 'CreateObject')
  final BatchCreateObject createObject;

  /// Deletes an object in a <a>Directory</a>.
  @_s.JsonKey(name: 'DeleteObject')
  final BatchDeleteObject deleteObject;

  /// Detaches the specified object from the specified index.
  @_s.JsonKey(name: 'DetachFromIndex')
  final BatchDetachFromIndex detachFromIndex;

  /// Detaches an object from a <a>Directory</a>.
  @_s.JsonKey(name: 'DetachObject')
  final BatchDetachObject detachObject;

  /// Detaches a policy from a <a>Directory</a>.
  @_s.JsonKey(name: 'DetachPolicy')
  final BatchDetachPolicy detachPolicy;

  /// Detaches a typed link from a specified source and target object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  @_s.JsonKey(name: 'DetachTypedLink')
  final BatchDetachTypedLink detachTypedLink;

  /// A batch operation that removes a facet from an object.
  @_s.JsonKey(name: 'RemoveFacetFromObject')
  final BatchRemoveFacetFromObject removeFacetFromObject;

  /// Updates a given object's attributes.
  @_s.JsonKey(name: 'UpdateLinkAttributes')
  final BatchUpdateLinkAttributes updateLinkAttributes;

  /// Updates a given object's attributes.
  @_s.JsonKey(name: 'UpdateObjectAttributes')
  final BatchUpdateObjectAttributes updateObjectAttributes;

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
  Map<String, dynamic> toJson() => _$BatchWriteOperationToJson(this);
}

/// Represents the output of a <code>BatchWrite</code> response operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchWriteOperationResponse {
  /// The result of an add facet to object batch operation.
  @_s.JsonKey(name: 'AddFacetToObject')
  final BatchAddFacetToObjectResponse addFacetToObject;

  /// Attaches an object to a <a>Directory</a>.
  @_s.JsonKey(name: 'AttachObject')
  final BatchAttachObjectResponse attachObject;

  /// Attaches a policy object to a regular object. An object can have a limited
  /// number of attached policies.
  @_s.JsonKey(name: 'AttachPolicy')
  final BatchAttachPolicyResponse attachPolicy;

  /// Attaches the specified object to the specified index.
  @_s.JsonKey(name: 'AttachToIndex')
  final BatchAttachToIndexResponse attachToIndex;

  /// Attaches a typed link to a specified source and target object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  @_s.JsonKey(name: 'AttachTypedLink')
  final BatchAttachTypedLinkResponse attachTypedLink;

  /// Creates an index object. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/indexing_search.htm">Indexing
  /// and search</a> for more information.
  @_s.JsonKey(name: 'CreateIndex')
  final BatchCreateIndexResponse createIndex;

  /// Creates an object in a <a>Directory</a>.
  @_s.JsonKey(name: 'CreateObject')
  final BatchCreateObjectResponse createObject;

  /// Deletes an object in a <a>Directory</a>.
  @_s.JsonKey(name: 'DeleteObject')
  final BatchDeleteObjectResponse deleteObject;

  /// Detaches the specified object from the specified index.
  @_s.JsonKey(name: 'DetachFromIndex')
  final BatchDetachFromIndexResponse detachFromIndex;

  /// Detaches an object from a <a>Directory</a>.
  @_s.JsonKey(name: 'DetachObject')
  final BatchDetachObjectResponse detachObject;

  /// Detaches a policy from a <a>Directory</a>.
  @_s.JsonKey(name: 'DetachPolicy')
  final BatchDetachPolicyResponse detachPolicy;

  /// Detaches a typed link from a specified source and target object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed
  /// Links</a>.
  @_s.JsonKey(name: 'DetachTypedLink')
  final BatchDetachTypedLinkResponse detachTypedLink;

  /// The result of a batch remove facet from object operation.
  @_s.JsonKey(name: 'RemoveFacetFromObject')
  final BatchRemoveFacetFromObjectResponse removeFacetFromObject;

  /// Represents the output of a <code>BatchWrite</code> response operation.
  @_s.JsonKey(name: 'UpdateLinkAttributes')
  final BatchUpdateLinkAttributesResponse updateLinkAttributes;

  /// Updates a given object’s attributes.
  @_s.JsonKey(name: 'UpdateObjectAttributes')
  final BatchUpdateObjectAttributesResponse updateObjectAttributes;

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
  factory BatchWriteOperationResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchWriteOperationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchWriteResponse {
  /// A list of all the responses for each batch write.
  @_s.JsonKey(name: 'Responses')
  final List<BatchWriteOperationResponse> responses;

  BatchWriteResponse({
    this.responses,
  });
  factory BatchWriteResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchWriteResponseFromJson(json);
}

enum ConsistencyLevel {
  @_s.JsonValue('SERIALIZABLE')
  serializable,
  @_s.JsonValue('EVENTUAL')
  eventual,
}

extension on ConsistencyLevel {
  String toValue() {
    switch (this) {
      case ConsistencyLevel.serializable:
        return 'SERIALIZABLE';
      case ConsistencyLevel.eventual:
        return 'EVENTUAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDirectoryResponse {
  /// The ARN of the published schema in the <a>Directory</a>. Once a published
  /// schema is copied into the directory, it has its own ARN, which is referred
  /// to applied schema ARN. For more information, see <a>arns</a>.
  @_s.JsonKey(name: 'AppliedSchemaArn')
  final String appliedSchemaArn;

  /// The ARN that is associated with the <a>Directory</a>. For more information,
  /// see <a>arns</a>.
  @_s.JsonKey(name: 'DirectoryArn')
  final String directoryArn;

  /// The name of the <a>Directory</a>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The root object node of the created directory.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  CreateDirectoryResponse({
    @_s.required this.appliedSchemaArn,
    @_s.required this.directoryArn,
    @_s.required this.name,
    @_s.required this.objectIdentifier,
  });
  factory CreateDirectoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDirectoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFacetResponse {
  CreateFacetResponse();
  factory CreateFacetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFacetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIndexResponse {
  /// The <code>ObjectIdentifier</code> of the index created by this operation.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  CreateIndexResponse({
    this.objectIdentifier,
  });
  factory CreateIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateIndexResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateObjectResponse {
  /// The identifier that is associated with the object.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  CreateObjectResponse({
    this.objectIdentifier,
  });
  factory CreateObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateObjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSchemaResponse {
  /// The Amazon Resource Name (ARN) that is associated with the schema. For more
  /// information, see <a>arns</a>.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  CreateSchemaResponse({
    this.schemaArn,
  });
  factory CreateSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTypedLinkFacetResponse {
  CreateTypedLinkFacetResponse();
  factory CreateTypedLinkFacetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTypedLinkFacetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDirectoryResponse {
  /// The ARN of the deleted directory.
  @_s.JsonKey(name: 'DirectoryArn')
  final String directoryArn;

  DeleteDirectoryResponse({
    @_s.required this.directoryArn,
  });
  factory DeleteDirectoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDirectoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFacetResponse {
  DeleteFacetResponse();
  factory DeleteFacetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFacetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteObjectResponse {
  DeleteObjectResponse();
  factory DeleteObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteObjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSchemaResponse {
  /// The input ARN that is returned as part of the response. For more
  /// information, see <a>arns</a>.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  DeleteSchemaResponse({
    this.schemaArn,
  });
  factory DeleteSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTypedLinkFacetResponse {
  DeleteTypedLinkFacetResponse();
  factory DeleteTypedLinkFacetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTypedLinkFacetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachFromIndexResponse {
  /// The <code>ObjectIdentifier</code> of the object that was detached from the
  /// index.
  @_s.JsonKey(name: 'DetachedObjectIdentifier')
  final String detachedObjectIdentifier;

  DetachFromIndexResponse({
    this.detachedObjectIdentifier,
  });
  factory DetachFromIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$DetachFromIndexResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachObjectResponse {
  /// The <code>ObjectIdentifier</code> that was detached from the object.
  @_s.JsonKey(name: 'DetachedObjectIdentifier')
  final String detachedObjectIdentifier;

  DetachObjectResponse({
    this.detachedObjectIdentifier,
  });
  factory DetachObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DetachObjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachPolicyResponse {
  DetachPolicyResponse();
  factory DetachPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DetachPolicyResponseFromJson(json);
}

/// Directory structure that includes the directory name and directory ARN.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Directory {
  /// The date and time when the directory was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The Amazon Resource Name (ARN) that is associated with the directory. For
  /// more information, see <a>arns</a>.
  @_s.JsonKey(name: 'DirectoryArn')
  final String directoryArn;

  /// The name of the directory.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The state of the directory. Can be either <code>Enabled</code>,
  /// <code>Disabled</code>, or <code>Deleted</code>.
  @_s.JsonKey(name: 'State')
  final DirectoryState state;

  Directory({
    this.creationDateTime,
    this.directoryArn,
    this.name,
    this.state,
  });
  factory Directory.fromJson(Map<String, dynamic> json) =>
      _$DirectoryFromJson(json);
}

enum DirectoryState {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('DELETED')
  deleted,
}

extension on DirectoryState {
  String toValue() {
    switch (this) {
      case DirectoryState.enabled:
        return 'ENABLED';
      case DirectoryState.disabled:
        return 'DISABLED';
      case DirectoryState.deleted:
        return 'DELETED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableDirectoryResponse {
  /// The ARN of the directory that has been disabled.
  @_s.JsonKey(name: 'DirectoryArn')
  final String directoryArn;

  DisableDirectoryResponse({
    @_s.required this.directoryArn,
  });
  factory DisableDirectoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DisableDirectoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableDirectoryResponse {
  /// The ARN of the enabled directory.
  @_s.JsonKey(name: 'DirectoryArn')
  final String directoryArn;

  EnableDirectoryResponse({
    @_s.required this.directoryArn,
  });
  factory EnableDirectoryResponse.fromJson(Map<String, dynamic> json) =>
      _$EnableDirectoryResponseFromJson(json);
}

/// A structure that contains <code>Name</code>, <code>ARN</code>,
/// <code>Attributes</code>, <code> <a>Rule</a>s</code>, and
/// <code>ObjectTypes</code>. See <a
/// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_whatarefacets.html">Facets</a>
/// for more information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Facet {
  /// There are two different styles that you can define on any given facet,
  /// <code>Static</code> and <code>Dynamic</code>. For static facets, all
  /// attributes must be defined in the schema. For dynamic facets, attributes can
  /// be defined during data plane operations.
  @_s.JsonKey(name: 'FacetStyle')
  final FacetStyle facetStyle;

  /// The name of the <a>Facet</a>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The object type that is associated with the facet. See
  /// <a>CreateFacetRequest$ObjectType</a> for more details.
  @_s.JsonKey(name: 'ObjectType')
  final ObjectType objectType;

  Facet({
    this.facetStyle,
    this.name,
    this.objectType,
  });
  factory Facet.fromJson(Map<String, dynamic> json) => _$FacetFromJson(json);
}

/// An attribute that is associated with the <a>Facet</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FacetAttribute {
  /// The name of the facet attribute.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A facet attribute consists of either a definition or a reference. This
  /// structure contains the attribute definition. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_attributereferences.html">Attribute
  /// References</a> for more information.
  @_s.JsonKey(name: 'AttributeDefinition')
  final FacetAttributeDefinition attributeDefinition;

  /// An attribute reference that is associated with the attribute. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_attributereferences.html">Attribute
  /// References</a> for more information.
  @_s.JsonKey(name: 'AttributeReference')
  final FacetAttributeReference attributeReference;

  /// The required behavior of the <code>FacetAttribute</code>.
  @_s.JsonKey(name: 'RequiredBehavior')
  final RequiredAttributeBehavior requiredBehavior;

  FacetAttribute({
    @_s.required this.name,
    this.attributeDefinition,
    this.attributeReference,
    this.requiredBehavior,
  });
  factory FacetAttribute.fromJson(Map<String, dynamic> json) =>
      _$FacetAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$FacetAttributeToJson(this);
}

/// A facet attribute definition. See <a
/// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_attributereferences.html">Attribute
/// References</a> for more information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FacetAttributeDefinition {
  /// The type of the attribute.
  @_s.JsonKey(name: 'Type')
  final FacetAttributeType type;

  /// The default value of the attribute (if configured).
  @_s.JsonKey(name: 'DefaultValue')
  final TypedAttributeValue defaultValue;

  /// Whether the attribute is mutable or not.
  @_s.JsonKey(name: 'IsImmutable')
  final bool isImmutable;

  /// Validation rules attached to the attribute definition.
  @_s.JsonKey(name: 'Rules')
  final Map<String, Rule> rules;

  FacetAttributeDefinition({
    @_s.required this.type,
    this.defaultValue,
    this.isImmutable,
    this.rules,
  });
  factory FacetAttributeDefinition.fromJson(Map<String, dynamic> json) =>
      _$FacetAttributeDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$FacetAttributeDefinitionToJson(this);
}

/// The facet attribute reference that specifies the attribute definition that
/// contains the attribute facet name and attribute name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FacetAttributeReference {
  /// The target attribute name that is associated with the facet reference. See
  /// <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_attributereferences.html">Attribute
  /// References</a> for more information.
  @_s.JsonKey(name: 'TargetAttributeName')
  final String targetAttributeName;

  /// The target facet name that is associated with the facet reference. See <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_attributereferences.html">Attribute
  /// References</a> for more information.
  @_s.JsonKey(name: 'TargetFacetName')
  final String targetFacetName;

  FacetAttributeReference({
    @_s.required this.targetAttributeName,
    @_s.required this.targetFacetName,
  });
  factory FacetAttributeReference.fromJson(Map<String, dynamic> json) =>
      _$FacetAttributeReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$FacetAttributeReferenceToJson(this);
}

enum FacetAttributeType {
  @_s.JsonValue('STRING')
  string,
  @_s.JsonValue('BINARY')
  binary,
  @_s.JsonValue('BOOLEAN')
  boolean,
  @_s.JsonValue('NUMBER')
  number,
  @_s.JsonValue('DATETIME')
  datetime,
  @_s.JsonValue('VARIANT')
  variant,
}

/// A structure that contains information used to update an attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FacetAttributeUpdate {
  /// The action to perform when updating the attribute.
  @_s.JsonKey(name: 'Action')
  final UpdateActionType action;

  /// The attribute to update.
  @_s.JsonKey(name: 'Attribute')
  final FacetAttribute attribute;

  FacetAttributeUpdate({
    this.action,
    this.attribute,
  });
  Map<String, dynamic> toJson() => _$FacetAttributeUpdateToJson(this);
}

enum FacetStyle {
  @_s.JsonValue('STATIC')
  static,
  @_s.JsonValue('DYNAMIC')
  dynamic,
}

extension on FacetStyle {
  String toValue() {
    switch (this) {
      case FacetStyle.static:
        return 'STATIC';
      case FacetStyle.dynamic:
        return 'DYNAMIC';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAppliedSchemaVersionResponse {
  /// Current applied schema ARN, including the minor version in use if one was
  /// provided.
  @_s.JsonKey(name: 'AppliedSchemaArn')
  final String appliedSchemaArn;

  GetAppliedSchemaVersionResponse({
    this.appliedSchemaArn,
  });
  factory GetAppliedSchemaVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppliedSchemaVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDirectoryResponse {
  /// Metadata about the directory.
  @_s.JsonKey(name: 'Directory')
  final Directory directory;

  GetDirectoryResponse({
    @_s.required this.directory,
  });
  factory GetDirectoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDirectoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFacetResponse {
  /// The <a>Facet</a> structure that is associated with the facet.
  @_s.JsonKey(name: 'Facet')
  final Facet facet;

  GetFacetResponse({
    this.facet,
  });
  factory GetFacetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFacetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLinkAttributesResponse {
  /// The attributes that are associated with the typed link.
  @_s.JsonKey(name: 'Attributes')
  final List<AttributeKeyAndValue> attributes;

  GetLinkAttributesResponse({
    this.attributes,
  });
  factory GetLinkAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLinkAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetObjectAttributesResponse {
  /// The attributes that are associated with the object.
  @_s.JsonKey(name: 'Attributes')
  final List<AttributeKeyAndValue> attributes;

  GetObjectAttributesResponse({
    this.attributes,
  });
  factory GetObjectAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetObjectAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetObjectInformationResponse {
  /// The <code>ObjectIdentifier</code> of the specified object.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  /// The facets attached to the specified object. Although the response does not
  /// include minor version information, the most recently applied minor version
  /// of each Facet is in effect. See <a>GetAppliedSchemaVersion</a> for details.
  @_s.JsonKey(name: 'SchemaFacets')
  final List<SchemaFacet> schemaFacets;

  GetObjectInformationResponse({
    this.objectIdentifier,
    this.schemaFacets,
  });
  factory GetObjectInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetObjectInformationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSchemaAsJsonResponse {
  /// The JSON representation of the schema document.
  @_s.JsonKey(name: 'Document')
  final String document;

  /// The name of the retrieved schema.
  @_s.JsonKey(name: 'Name')
  final String name;

  GetSchemaAsJsonResponse({
    this.document,
    this.name,
  });
  factory GetSchemaAsJsonResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSchemaAsJsonResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'IdentityAttributeOrder')
  final List<String> identityAttributeOrder;

  GetTypedLinkFacetInformationResponse({
    this.identityAttributeOrder,
  });
  factory GetTypedLinkFacetInformationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetTypedLinkFacetInformationResponseFromJson(json);
}

/// Represents an index and an attached object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IndexAttachment {
  /// The indexed attribute values.
  @_s.JsonKey(name: 'IndexedAttributes')
  final List<AttributeKeyAndValue> indexedAttributes;

  /// In response to <a>ListIndex</a>, the <code>ObjectIdentifier</code> of the
  /// object attached to the index. In response to <a>ListAttachedIndices</a>, the
  /// <code>ObjectIdentifier</code> of the index attached to the object. This
  /// field will always contain the <code>ObjectIdentifier</code> of the object on
  /// the opposite side of the attachment specified in the query.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  IndexAttachment({
    this.indexedAttributes,
    this.objectIdentifier,
  });
  factory IndexAttachment.fromJson(Map<String, dynamic> json) =>
      _$IndexAttachmentFromJson(json);
}

/// The action to take on a typed link attribute value. Updates are only
/// supported for attributes which don’t contribute to link identity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LinkAttributeAction {
  /// A type that can be either <code>UPDATE_OR_CREATE</code> or
  /// <code>DELETE</code>.
  @_s.JsonKey(name: 'AttributeActionType')
  final UpdateActionType attributeActionType;

  /// The value that you want to update to.
  @_s.JsonKey(name: 'AttributeUpdateValue')
  final TypedAttributeValue attributeUpdateValue;

  LinkAttributeAction({
    this.attributeActionType,
    this.attributeUpdateValue,
  });
  Map<String, dynamic> toJson() => _$LinkAttributeActionToJson(this);
}

/// Structure that contains attribute update information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LinkAttributeUpdate {
  /// The action to perform as part of the attribute update.
  @_s.JsonKey(name: 'AttributeAction')
  final LinkAttributeAction attributeAction;

  /// The key of the attribute being updated.
  @_s.JsonKey(name: 'AttributeKey')
  final AttributeKey attributeKey;

  LinkAttributeUpdate({
    this.attributeAction,
    this.attributeKey,
  });
  Map<String, dynamic> toJson() => _$LinkAttributeUpdateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAppliedSchemaArnsResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The ARNs of schemas that are applied to the directory.
  @_s.JsonKey(name: 'SchemaArns')
  final List<String> schemaArns;

  ListAppliedSchemaArnsResponse({
    this.nextToken,
    this.schemaArns,
  });
  factory ListAppliedSchemaArnsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAppliedSchemaArnsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAttachedIndicesResponse {
  /// The indices attached to the specified object.
  @_s.JsonKey(name: 'IndexAttachments')
  final List<IndexAttachment> indexAttachments;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAttachedIndicesResponse({
    this.indexAttachments,
    this.nextToken,
  });
  factory ListAttachedIndicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAttachedIndicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDevelopmentSchemaArnsResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The ARNs of retrieved development schemas.
  @_s.JsonKey(name: 'SchemaArns')
  final List<String> schemaArns;

  ListDevelopmentSchemaArnsResponse({
    this.nextToken,
    this.schemaArns,
  });
  factory ListDevelopmentSchemaArnsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDevelopmentSchemaArnsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDirectoriesResponse {
  /// Lists all directories that are associated with your account in pagination
  /// fashion.
  @_s.JsonKey(name: 'Directories')
  final List<Directory> directories;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDirectoriesResponse({
    @_s.required this.directories,
    this.nextToken,
  });
  factory ListDirectoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDirectoriesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFacetAttributesResponse {
  /// The attributes attached to the facet.
  @_s.JsonKey(name: 'Attributes')
  final List<FacetAttribute> attributes;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFacetAttributesResponse({
    this.attributes,
    this.nextToken,
  });
  factory ListFacetAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFacetAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFacetNamesResponse {
  /// The names of facets that exist within the schema.
  @_s.JsonKey(name: 'FacetNames')
  final List<String> facetNames;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFacetNamesResponse({
    this.facetNames,
    this.nextToken,
  });
  factory ListFacetNamesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFacetNamesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIncomingTypedLinksResponse {
  /// Returns one or more typed link specifiers as output.
  @_s.JsonKey(name: 'LinkSpecifiers')
  final List<TypedLinkSpecifier> linkSpecifiers;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIncomingTypedLinksResponse({
    this.linkSpecifiers,
    this.nextToken,
  });
  factory ListIncomingTypedLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIncomingTypedLinksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIndexResponse {
  /// The objects and indexed values attached to the index.
  @_s.JsonKey(name: 'IndexAttachments')
  final List<IndexAttachment> indexAttachments;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIndexResponse({
    this.indexAttachments,
    this.nextToken,
  });
  factory ListIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIndexResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListManagedSchemaArnsResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The ARNs for all AWS managed schemas.
  @_s.JsonKey(name: 'SchemaArns')
  final List<String> schemaArns;

  ListManagedSchemaArnsResponse({
    this.nextToken,
    this.schemaArns,
  });
  factory ListManagedSchemaArnsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListManagedSchemaArnsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListObjectAttributesResponse {
  /// Attributes map that is associated with the object. <code>AttributeArn</code>
  /// is the key, and attribute value is the value.
  @_s.JsonKey(name: 'Attributes')
  final List<AttributeKeyAndValue> attributes;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListObjectAttributesResponse({
    this.attributes,
    this.nextToken,
  });
  factory ListObjectAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListObjectAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListObjectChildrenResponse {
  /// Children structure, which is a map with key as the <code>LinkName</code> and
  /// <code>ObjectIdentifier</code> as the value.
  @_s.JsonKey(name: 'Children')
  final Map<String, String> children;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListObjectChildrenResponse({
    this.children,
    this.nextToken,
  });
  factory ListObjectChildrenResponse.fromJson(Map<String, dynamic> json) =>
      _$ListObjectChildrenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListObjectParentPathsResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns the path to the <code>ObjectIdentifiers</code> that are associated
  /// with the directory.
  @_s.JsonKey(name: 'PathToObjectIdentifiersList')
  final List<PathToObjectIdentifiers> pathToObjectIdentifiersList;

  ListObjectParentPathsResponse({
    this.nextToken,
    this.pathToObjectIdentifiersList,
  });
  factory ListObjectParentPathsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListObjectParentPathsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListObjectParentsResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a list of parent reference and LinkName Tuples.
  @_s.JsonKey(name: 'ParentLinks')
  final List<ObjectIdentifierAndLinkNameTuple> parentLinks;

  /// The parent structure, which is a map with key as the
  /// <code>ObjectIdentifier</code> and LinkName as the value.
  @_s.JsonKey(name: 'Parents')
  final Map<String, String> parents;

  ListObjectParentsResponse({
    this.nextToken,
    this.parentLinks,
    this.parents,
  });
  factory ListObjectParentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListObjectParentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListObjectPoliciesResponse {
  /// A list of policy <code>ObjectIdentifiers</code>, that are attached to the
  /// object.
  @_s.JsonKey(name: 'AttachedPolicyIds')
  final List<String> attachedPolicyIds;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListObjectPoliciesResponse({
    this.attachedPolicyIds,
    this.nextToken,
  });
  factory ListObjectPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListObjectPoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOutgoingTypedLinksResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a typed link specifier as output.
  @_s.JsonKey(name: 'TypedLinkSpecifiers')
  final List<TypedLinkSpecifier> typedLinkSpecifiers;

  ListOutgoingTypedLinksResponse({
    this.nextToken,
    this.typedLinkSpecifiers,
  });
  factory ListOutgoingTypedLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOutgoingTypedLinksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPolicyAttachmentsResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>ObjectIdentifiers</code> to which the policy is attached.
  @_s.JsonKey(name: 'ObjectIdentifiers')
  final List<String> objectIdentifiers;

  ListPolicyAttachmentsResponse({
    this.nextToken,
    this.objectIdentifiers,
  });
  factory ListPolicyAttachmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPolicyAttachmentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPublishedSchemaArnsResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The ARNs of published schemas.
  @_s.JsonKey(name: 'SchemaArns')
  final List<String> schemaArns;

  ListPublishedSchemaArnsResponse({
    this.nextToken,
    this.schemaArns,
  });
  factory ListPublishedSchemaArnsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPublishedSchemaArnsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of tag key value pairs that are associated with the response.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTypedLinkFacetAttributesResponse {
  /// An ordered set of attributes associate with the typed link.
  @_s.JsonKey(name: 'Attributes')
  final List<TypedLinkAttributeDefinition> attributes;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTypedLinkFacetAttributesResponse({
    this.attributes,
    this.nextToken,
  });
  factory ListTypedLinkFacetAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListTypedLinkFacetAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTypedLinkFacetNamesResponse {
  /// The names of typed link facets that exist within the schema.
  @_s.JsonKey(name: 'FacetNames')
  final List<String> facetNames;

  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTypedLinkFacetNamesResponse({
    this.facetNames,
    this.nextToken,
  });
  factory ListTypedLinkFacetNamesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTypedLinkFacetNamesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LookupPolicyResponse {
  /// The pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Provides list of path to policies. Policies contain <code>PolicyId</code>,
  /// <code>ObjectIdentifier</code>, and <code>PolicyType</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
  @_s.JsonKey(name: 'PolicyToPathList')
  final List<PolicyToPath> policyToPathList;

  LookupPolicyResponse({
    this.nextToken,
    this.policyToPathList,
  });
  factory LookupPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$LookupPolicyResponseFromJson(json);
}

/// The action to take on the object attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ObjectAttributeAction {
  /// A type that can be either <code>Update</code> or <code>Delete</code>.
  @_s.JsonKey(name: 'ObjectAttributeActionType')
  final UpdateActionType objectAttributeActionType;

  /// The value that you want to update to.
  @_s.JsonKey(name: 'ObjectAttributeUpdateValue')
  final TypedAttributeValue objectAttributeUpdateValue;

  ObjectAttributeAction({
    this.objectAttributeActionType,
    this.objectAttributeUpdateValue,
  });
  Map<String, dynamic> toJson() => _$ObjectAttributeActionToJson(this);
}

/// A range of attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ObjectAttributeRange {
  /// The key of the attribute that the attribute range covers.
  @_s.JsonKey(name: 'AttributeKey')
  final AttributeKey attributeKey;

  /// The range of attribute values being selected.
  @_s.JsonKey(name: 'Range')
  final TypedAttributeValueRange range;

  ObjectAttributeRange({
    this.attributeKey,
    this.range,
  });
  Map<String, dynamic> toJson() => _$ObjectAttributeRangeToJson(this);
}

/// Structure that contains attribute update information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ObjectAttributeUpdate {
  /// The action to perform as part of the attribute update.
  @_s.JsonKey(name: 'ObjectAttributeAction')
  final ObjectAttributeAction objectAttributeAction;

  /// The key of the attribute being updated.
  @_s.JsonKey(name: 'ObjectAttributeKey')
  final AttributeKey objectAttributeKey;

  ObjectAttributeUpdate({
    this.objectAttributeAction,
    this.objectAttributeKey,
  });
  Map<String, dynamic> toJson() => _$ObjectAttributeUpdateToJson(this);
}

/// A pair of ObjectIdentifier and LinkName.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ObjectIdentifierAndLinkNameTuple {
  /// The name of the link between the parent and the child object.
  @_s.JsonKey(name: 'LinkName')
  final String linkName;

  /// The ID that is associated with the object.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  ObjectIdentifierAndLinkNameTuple({
    this.linkName,
    this.objectIdentifier,
  });
  factory ObjectIdentifierAndLinkNameTuple.fromJson(
          Map<String, dynamic> json) =>
      _$ObjectIdentifierAndLinkNameTupleFromJson(json);
}

/// The reference that identifies an object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  /// immutable and no two objects will ever share the same object identifier
  /// </li>
  /// <li>
  /// <i>/some/path</i> - Identifies the object based on path
  /// </li>
  /// <li>
  /// <i>#SomeBatchReference</i> - Identifies the object in a batch call
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Selector')
  final String selector;

  ObjectReference({
    this.selector,
  });
  factory ObjectReference.fromJson(Map<String, dynamic> json) =>
      _$ObjectReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectReferenceToJson(this);
}

enum ObjectType {
  @_s.JsonValue('NODE')
  node,
  @_s.JsonValue('LEAF_NODE')
  leafNode,
  @_s.JsonValue('POLICY')
  policy,
  @_s.JsonValue('INDEX')
  $index,
}

extension on ObjectType {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Returns the path to the <code>ObjectIdentifiers</code> that is associated
/// with the directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PathToObjectIdentifiers {
  /// Lists <code>ObjectIdentifiers</code> starting from directory root to the
  /// object in the request.
  @_s.JsonKey(name: 'ObjectIdentifiers')
  final List<String> objectIdentifiers;

  /// The path that is used to identify the object starting from directory root.
  @_s.JsonKey(name: 'Path')
  final String path;

  PathToObjectIdentifiers({
    this.objectIdentifiers,
    this.path,
  });
  factory PathToObjectIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$PathToObjectIdentifiersFromJson(json);
}

/// Contains the <code>PolicyType</code>, <code>PolicyId</code>, and the
/// <code>ObjectIdentifier</code> to which it is attached. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PolicyAttachment {
  /// The <code>ObjectIdentifier</code> that is associated with
  /// <code>PolicyAttachment</code>.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  /// The ID of <code>PolicyAttachment</code>.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// The type of policy that can be associated with
  /// <code>PolicyAttachment</code>.
  @_s.JsonKey(name: 'PolicyType')
  final String policyType;

  PolicyAttachment({
    this.objectIdentifier,
    this.policyId,
    this.policyType,
  });
  factory PolicyAttachment.fromJson(Map<String, dynamic> json) =>
      _$PolicyAttachmentFromJson(json);
}

/// Used when a regular object exists in a <a>Directory</a> and you want to find
/// all of the policies that are associated with that object and the parent to
/// that object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PolicyToPath {
  /// The path that is referenced from the root.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// List of policy objects.
  @_s.JsonKey(name: 'Policies')
  final List<PolicyAttachment> policies;

  PolicyToPath({
    this.path,
    this.policies,
  });
  factory PolicyToPath.fromJson(Map<String, dynamic> json) =>
      _$PolicyToPathFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PublishSchemaResponse {
  /// The ARN that is associated with the published schema. For more information,
  /// see <a>arns</a>.
  @_s.JsonKey(name: 'PublishedSchemaArn')
  final String publishedSchemaArn;

  PublishSchemaResponse({
    this.publishedSchemaArn,
  });
  factory PublishSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$PublishSchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutSchemaFromJsonResponse {
  /// The ARN of the schema to update.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  PutSchemaFromJsonResponse({
    this.arn,
  });
  factory PutSchemaFromJsonResponse.fromJson(Map<String, dynamic> json) =>
      _$PutSchemaFromJsonResponseFromJson(json);
}

enum RangeMode {
  @_s.JsonValue('FIRST')
  first,
  @_s.JsonValue('LAST')
  last,
  @_s.JsonValue('LAST_BEFORE_MISSING_VALUES')
  lastBeforeMissingValues,
  @_s.JsonValue('INCLUSIVE')
  inclusive,
  @_s.JsonValue('EXCLUSIVE')
  exclusive,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveFacetFromObjectResponse {
  RemoveFacetFromObjectResponse();
  factory RemoveFacetFromObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveFacetFromObjectResponseFromJson(json);
}

enum RequiredAttributeBehavior {
  @_s.JsonValue('REQUIRED_ALWAYS')
  requiredAlways,
  @_s.JsonValue('NOT_REQUIRED')
  notRequired,
}

/// Contains an Amazon Resource Name (ARN) and parameters that are associated
/// with the rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Rule {
  /// The minimum and maximum parameters that are associated with the rule.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  /// The type of attribute validation rule.
  @_s.JsonKey(name: 'Type')
  final RuleType type;

  Rule({
    this.parameters,
    this.type,
  });
  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);
}

enum RuleType {
  @_s.JsonValue('BINARY_LENGTH')
  binaryLength,
  @_s.JsonValue('NUMBER_COMPARISON')
  numberComparison,
  @_s.JsonValue('STRING_FROM_SET')
  stringFromSet,
  @_s.JsonValue('STRING_LENGTH')
  stringLength,
}

/// A facet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SchemaFacet {
  /// The name of the facet.
  @_s.JsonKey(name: 'FacetName')
  final String facetName;

  /// The ARN of the schema that contains the facet with no minor component. See
  /// <a>arns</a> and <a
  /// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_inplaceschemaupgrade.html">In-Place
  /// Schema Upgrade</a> for a description of when to provide minor versions.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  SchemaFacet({
    this.facetName,
    this.schemaArn,
  });
  factory SchemaFacet.fromJson(Map<String, dynamic> json) =>
      _$SchemaFacetFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaFacetToJson(this);
}

/// The tag structure that contains a tag key and value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key that is associated with the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value that is associated with the tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Represents the data for a typed attribute. You can set one, and only one, of
/// the elements. Each attribute in an item is a name-value pair. Attributes
/// have a single value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TypedAttributeValue {
  /// A binary data value.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'BinaryValue')
  final Uint8List binaryValue;

  /// A Boolean data value.
  @_s.JsonKey(name: 'BooleanValue')
  final bool booleanValue;

  /// A date and time value.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DatetimeValue')
  final DateTime datetimeValue;

  /// A number data value.
  @_s.JsonKey(name: 'NumberValue')
  final String numberValue;

  /// A string data value.
  @_s.JsonKey(name: 'StringValue')
  final String stringValue;

  TypedAttributeValue({
    this.binaryValue,
    this.booleanValue,
    this.datetimeValue,
    this.numberValue,
    this.stringValue,
  });
  factory TypedAttributeValue.fromJson(Map<String, dynamic> json) =>
      _$TypedAttributeValueFromJson(json);

  Map<String, dynamic> toJson() => _$TypedAttributeValueToJson(this);
}

/// A range of attribute values. For more information, see <a
/// href="https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_range_filters.html">Range
/// Filters</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TypedAttributeValueRange {
  /// The inclusive or exclusive range end.
  @_s.JsonKey(name: 'EndMode')
  final RangeMode endMode;

  /// The inclusive or exclusive range start.
  @_s.JsonKey(name: 'StartMode')
  final RangeMode startMode;

  /// The attribute value to terminate the range at.
  @_s.JsonKey(name: 'EndValue')
  final TypedAttributeValue endValue;

  /// The value to start the range at.
  @_s.JsonKey(name: 'StartValue')
  final TypedAttributeValue startValue;

  TypedAttributeValueRange({
    @_s.required this.endMode,
    @_s.required this.startMode,
    this.endValue,
    this.startValue,
  });
  Map<String, dynamic> toJson() => _$TypedAttributeValueRangeToJson(this);
}

/// A typed link attribute definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TypedLinkAttributeDefinition {
  /// The unique name of the typed link attribute.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The required behavior of the <code>TypedLinkAttributeDefinition</code>.
  @_s.JsonKey(name: 'RequiredBehavior')
  final RequiredAttributeBehavior requiredBehavior;

  /// The type of the attribute.
  @_s.JsonKey(name: 'Type')
  final FacetAttributeType type;

  /// The default value of the attribute (if configured).
  @_s.JsonKey(name: 'DefaultValue')
  final TypedAttributeValue defaultValue;

  /// Whether the attribute is mutable or not.
  @_s.JsonKey(name: 'IsImmutable')
  final bool isImmutable;

  /// Validation rules that are attached to the attribute definition.
  @_s.JsonKey(name: 'Rules')
  final Map<String, Rule> rules;

  TypedLinkAttributeDefinition({
    @_s.required this.name,
    @_s.required this.requiredBehavior,
    @_s.required this.type,
    this.defaultValue,
    this.isImmutable,
    this.rules,
  });
  factory TypedLinkAttributeDefinition.fromJson(Map<String, dynamic> json) =>
      _$TypedLinkAttributeDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$TypedLinkAttributeDefinitionToJson(this);
}

/// Identifies the range of attributes that are used by a specified filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TypedLinkAttributeRange {
  /// The range of attribute values that are being selected.
  @_s.JsonKey(name: 'Range')
  final TypedAttributeValueRange range;

  /// The unique name of the typed link attribute.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  TypedLinkAttributeRange({
    @_s.required this.range,
    this.attributeName,
  });
  Map<String, dynamic> toJson() => _$TypedLinkAttributeRangeToJson(this);
}

/// Defines the typed links structure and its attributes. To create a typed link
/// facet, use the <a>CreateTypedLinkFacet</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TypedLinkFacet {
  /// A set of key-value pairs associated with the typed link. Typed link
  /// attributes are used when you have data values that are related to the link
  /// itself, and not to one of the two objects being linked. Identity attributes
  /// also serve to distinguish the link from others of the same type between the
  /// same objects.
  @_s.JsonKey(name: 'Attributes')
  final List<TypedLinkAttributeDefinition> attributes;

  /// The set of attributes that distinguish links made from this facet from each
  /// other, in the order of significance. Listing typed links can filter on the
  /// values of these attributes. See <a>ListOutgoingTypedLinks</a> and
  /// <a>ListIncomingTypedLinks</a> for details.
  @_s.JsonKey(name: 'IdentityAttributeOrder')
  final List<String> identityAttributeOrder;

  /// The unique name of the typed link facet.
  @_s.JsonKey(name: 'Name')
  final String name;

  TypedLinkFacet({
    @_s.required this.attributes,
    @_s.required this.identityAttributeOrder,
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$TypedLinkFacetToJson(this);
}

/// A typed link facet attribute update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TypedLinkFacetAttributeUpdate {
  /// The action to perform when updating the attribute.
  @_s.JsonKey(name: 'Action')
  final UpdateActionType action;

  /// The attribute to update.
  @_s.JsonKey(name: 'Attribute')
  final TypedLinkAttributeDefinition attribute;

  TypedLinkFacetAttributeUpdate({
    @_s.required this.action,
    @_s.required this.attribute,
  });
  Map<String, dynamic> toJson() => _$TypedLinkFacetAttributeUpdateToJson(this);
}

/// Identifies the schema Amazon Resource Name (ARN) and facet name for the
/// typed link.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TypedLinkSchemaAndFacetName {
  /// The Amazon Resource Name (ARN) that is associated with the schema. For more
  /// information, see <a>arns</a>.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  /// The unique name of the typed link facet.
  @_s.JsonKey(name: 'TypedLinkName')
  final String typedLinkName;

  TypedLinkSchemaAndFacetName({
    @_s.required this.schemaArn,
    @_s.required this.typedLinkName,
  });
  factory TypedLinkSchemaAndFacetName.fromJson(Map<String, dynamic> json) =>
      _$TypedLinkSchemaAndFacetNameFromJson(json);

  Map<String, dynamic> toJson() => _$TypedLinkSchemaAndFacetNameToJson(this);
}

/// Contains all the information that is used to uniquely identify a typed link.
/// The parameters discussed in this topic are used to uniquely specify the
/// typed link being operated on. The <a>AttachTypedLink</a> API returns a typed
/// link specifier while the <a>DetachTypedLink</a> API accepts one as input.
/// Similarly, the <a>ListIncomingTypedLinks</a> and
/// <a>ListOutgoingTypedLinks</a> API operations provide typed link specifiers
/// as output. You can also construct a typed link specifier from scratch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TypedLinkSpecifier {
  /// Identifies the attribute value to update.
  @_s.JsonKey(name: 'IdentityAttributeValues')
  final List<AttributeNameAndValue> identityAttributeValues;

  /// Identifies the source object that the typed link will attach to.
  @_s.JsonKey(name: 'SourceObjectReference')
  final ObjectReference sourceObjectReference;

  /// Identifies the target object that the typed link will attach to.
  @_s.JsonKey(name: 'TargetObjectReference')
  final ObjectReference targetObjectReference;

  /// Identifies the typed link facet that is associated with the typed link.
  @_s.JsonKey(name: 'TypedLinkFacet')
  final TypedLinkSchemaAndFacetName typedLinkFacet;

  TypedLinkSpecifier({
    @_s.required this.identityAttributeValues,
    @_s.required this.sourceObjectReference,
    @_s.required this.targetObjectReference,
    @_s.required this.typedLinkFacet,
  });
  factory TypedLinkSpecifier.fromJson(Map<String, dynamic> json) =>
      _$TypedLinkSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$TypedLinkSpecifierToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

enum UpdateActionType {
  @_s.JsonValue('CREATE_OR_UPDATE')
  createOrUpdate,
  @_s.JsonValue('DELETE')
  delete,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFacetResponse {
  UpdateFacetResponse();
  factory UpdateFacetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFacetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLinkAttributesResponse {
  UpdateLinkAttributesResponse();
  factory UpdateLinkAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateLinkAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateObjectAttributesResponse {
  /// The <code>ObjectIdentifier</code> of the updated object.
  @_s.JsonKey(name: 'ObjectIdentifier')
  final String objectIdentifier;

  UpdateObjectAttributesResponse({
    this.objectIdentifier,
  });
  factory UpdateObjectAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateObjectAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSchemaResponse {
  /// The ARN that is associated with the updated schema. For more information,
  /// see <a>arns</a>.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  UpdateSchemaResponse({
    this.schemaArn,
  });
  factory UpdateSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTypedLinkFacetResponse {
  UpdateTypedLinkFacetResponse();
  factory UpdateTypedLinkFacetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTypedLinkFacetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpgradeAppliedSchemaResponse {
  /// The ARN of the directory that is returned as part of the response.
  @_s.JsonKey(name: 'DirectoryArn')
  final String directoryArn;

  /// The ARN of the upgraded schema that is returned as part of the response.
  @_s.JsonKey(name: 'UpgradedSchemaArn')
  final String upgradedSchemaArn;

  UpgradeAppliedSchemaResponse({
    this.directoryArn,
    this.upgradedSchemaArn,
  });
  factory UpgradeAppliedSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$UpgradeAppliedSchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpgradePublishedSchemaResponse {
  /// The ARN of the upgraded schema that is returned as part of the response.
  @_s.JsonKey(name: 'UpgradedSchemaArn')
  final String upgradedSchemaArn;

  UpgradePublishedSchemaResponse({
    this.upgradedSchemaArn,
  });
  factory UpgradePublishedSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$UpgradePublishedSchemaResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BatchWriteException extends _s.GenericAwsException {
  BatchWriteException({String type, String message})
      : super(type: type, code: 'BatchWriteException', message: message);
}

class CannotListParentOfRootException extends _s.GenericAwsException {
  CannotListParentOfRootException({String type, String message})
      : super(
            type: type,
            code: 'CannotListParentOfRootException',
            message: message);
}

class DirectoryAlreadyExistsException extends _s.GenericAwsException {
  DirectoryAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'DirectoryAlreadyExistsException',
            message: message);
}

class DirectoryDeletedException extends _s.GenericAwsException {
  DirectoryDeletedException({String type, String message})
      : super(type: type, code: 'DirectoryDeletedException', message: message);
}

class DirectoryNotDisabledException extends _s.GenericAwsException {
  DirectoryNotDisabledException({String type, String message})
      : super(
            type: type,
            code: 'DirectoryNotDisabledException',
            message: message);
}

class DirectoryNotEnabledException extends _s.GenericAwsException {
  DirectoryNotEnabledException({String type, String message})
      : super(
            type: type, code: 'DirectoryNotEnabledException', message: message);
}

class FacetAlreadyExistsException extends _s.GenericAwsException {
  FacetAlreadyExistsException({String type, String message})
      : super(
            type: type, code: 'FacetAlreadyExistsException', message: message);
}

class FacetInUseException extends _s.GenericAwsException {
  FacetInUseException({String type, String message})
      : super(type: type, code: 'FacetInUseException', message: message);
}

class FacetNotFoundException extends _s.GenericAwsException {
  FacetNotFoundException({String type, String message})
      : super(type: type, code: 'FacetNotFoundException', message: message);
}

class FacetValidationException extends _s.GenericAwsException {
  FacetValidationException({String type, String message})
      : super(type: type, code: 'FacetValidationException', message: message);
}

class IncompatibleSchemaException extends _s.GenericAwsException {
  IncompatibleSchemaException({String type, String message})
      : super(
            type: type, code: 'IncompatibleSchemaException', message: message);
}

class IndexedAttributeMissingException extends _s.GenericAwsException {
  IndexedAttributeMissingException({String type, String message})
      : super(
            type: type,
            code: 'IndexedAttributeMissingException',
            message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String type, String message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidAttachmentException extends _s.GenericAwsException {
  InvalidAttachmentException({String type, String message})
      : super(type: type, code: 'InvalidAttachmentException', message: message);
}

class InvalidFacetUpdateException extends _s.GenericAwsException {
  InvalidFacetUpdateException({String type, String message})
      : super(
            type: type, code: 'InvalidFacetUpdateException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidRuleException extends _s.GenericAwsException {
  InvalidRuleException({String type, String message})
      : super(type: type, code: 'InvalidRuleException', message: message);
}

class InvalidSchemaDocException extends _s.GenericAwsException {
  InvalidSchemaDocException({String type, String message})
      : super(type: type, code: 'InvalidSchemaDocException', message: message);
}

class InvalidTaggingRequestException extends _s.GenericAwsException {
  InvalidTaggingRequestException({String type, String message})
      : super(
            type: type,
            code: 'InvalidTaggingRequestException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class LinkNameAlreadyInUseException extends _s.GenericAwsException {
  LinkNameAlreadyInUseException({String type, String message})
      : super(
            type: type,
            code: 'LinkNameAlreadyInUseException',
            message: message);
}

class NotIndexException extends _s.GenericAwsException {
  NotIndexException({String type, String message})
      : super(type: type, code: 'NotIndexException', message: message);
}

class NotNodeException extends _s.GenericAwsException {
  NotNodeException({String type, String message})
      : super(type: type, code: 'NotNodeException', message: message);
}

class NotPolicyException extends _s.GenericAwsException {
  NotPolicyException({String type, String message})
      : super(type: type, code: 'NotPolicyException', message: message);
}

class ObjectAlreadyDetachedException extends _s.GenericAwsException {
  ObjectAlreadyDetachedException({String type, String message})
      : super(
            type: type,
            code: 'ObjectAlreadyDetachedException',
            message: message);
}

class ObjectNotDetachedException extends _s.GenericAwsException {
  ObjectNotDetachedException({String type, String message})
      : super(type: type, code: 'ObjectNotDetachedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class RetryableConflictException extends _s.GenericAwsException {
  RetryableConflictException({String type, String message})
      : super(type: type, code: 'RetryableConflictException', message: message);
}

class SchemaAlreadyExistsException extends _s.GenericAwsException {
  SchemaAlreadyExistsException({String type, String message})
      : super(
            type: type, code: 'SchemaAlreadyExistsException', message: message);
}

class SchemaAlreadyPublishedException extends _s.GenericAwsException {
  SchemaAlreadyPublishedException({String type, String message})
      : super(
            type: type,
            code: 'SchemaAlreadyPublishedException',
            message: message);
}

class StillContainsLinksException extends _s.GenericAwsException {
  StillContainsLinksException({String type, String message})
      : super(
            type: type, code: 'StillContainsLinksException', message: message);
}

class UnsupportedIndexTypeException extends _s.GenericAwsException {
  UnsupportedIndexTypeException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedIndexTypeException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
