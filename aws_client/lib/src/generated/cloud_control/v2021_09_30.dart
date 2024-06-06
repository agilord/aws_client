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

/// For more information about Amazon Web Services Cloud Control API, see the <a
/// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/what-is-cloudcontrolapi.html">Amazon
/// Web Services Cloud Control API User Guide</a>.
class CloudControlApi {
  final _s.JsonProtocol _protocol;
  CloudControlApi({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudcontrolapi',
            signingName: 'cloudcontrolapi',
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

  /// Cancels the specified resource operation request. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html#resource-operations-manage-requests-cancel">Canceling
  /// resource operation requests</a> in the <i>Amazon Web Services Cloud
  /// Control API User Guide</i>.
  ///
  /// Only resource operations requests with a status of <code>PENDING</code> or
  /// <code>IN_PROGRESS</code> can be canceled.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [RequestTokenNotFoundException].
  ///
  /// Parameter [requestToken] :
  /// The <code>RequestToken</code> of the <code>ProgressEvent</code> object
  /// returned by the resource operation request.
  Future<CancelResourceRequestOutput> cancelResourceRequest({
    required String requestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CloudApiService.CancelResourceRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequestToken': requestToken,
      },
    );

    return CancelResourceRequestOutput.fromJson(jsonResponse.body);
  }

  /// Creates the specified resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-create.html">Creating
  /// a resource</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// After you have initiated a resource creation request, you can monitor the
  /// progress of your request by calling <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html">GetResourceRequestStatus</a>
  /// using the <code>RequestToken</code> of the <code>ProgressEvent</code> type
  /// returned by <code>CreateResource</code>.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [HandlerInternalFailureException].
  /// May throw [GeneralServiceException].
  /// May throw [NotUpdatableException].
  /// May throw [TypeNotFoundException].
  /// May throw [ConcurrentOperationException].
  /// May throw [InvalidRequestException].
  /// May throw [PrivateTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NetworkFailureException].
  /// May throw [UnsupportedActionException].
  /// May throw [NotStabilizedException].
  /// May throw [ServiceInternalErrorException].
  /// May throw [HandlerFailureException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InvalidCredentialsException].
  /// May throw [ResourceConflictException].
  /// May throw [ClientTokenConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [desiredState] :
  /// Structured data format representing the desired state of the resource,
  /// consisting of that resource's properties and their desired values.
  /// <note>
  /// Cloud Control API currently supports JSON as a structured data format.
  /// </note>
  /// Specify the desired state as one of the following:
  ///
  /// <ul>
  /// <li>
  /// A JSON blob
  /// </li>
  /// <li>
  /// A local path containing the desired state in JSON data format
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-create.html#resource-operations-create-desiredstate">Composing
  /// the desired state of the resource</a> in the <i>Amazon Web Services Cloud
  /// Control API User Guide</i>.
  ///
  /// For more information about the properties of a specific resource, refer to
  /// the related topic for the resource in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Resource
  /// and property types reference</a> in the <i>CloudFormation Users Guide</i>.
  ///
  /// Parameter [typeName] :
  /// The name of the resource type.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier to ensure the idempotency of the resource request. As
  /// a best practice, specify this token to ensure idempotency, so that Amazon
  /// Web Services Cloud Control API can accurately distinguish between request
  /// retries and new resource requests. You might retry a resource request to
  /// ensure that it was successfully received.
  ///
  /// A client token is valid for 36 hours once used. After that, a resource
  /// request with the same client token is treated as a new request.
  ///
  /// If you do not specify a client token, one is generated for inclusion in
  /// the request.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-idempotency">Ensuring
  /// resource operation requests are unique</a> in the <i>Amazon Web Services
  /// Cloud Control API User Guide</i>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role for Cloud Control API to use when performing this resource operation.
  /// The role specified must have the permissions required for this operation.
  /// The necessary permissions for each event handler are defined in the <code>
  /// <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-handlers">handlers</a>
  /// </code> section of the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html">resource
  /// type definition schema</a>.
  ///
  /// If you do not specify a role, Cloud Control API uses a temporary session
  /// created using your Amazon Web Services user credentials.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-permissions">Specifying
  /// credentials</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// Parameter [typeVersionId] :
  /// For private resource types, the type version to use in this resource
  /// operation. If you do not specify a resource version, CloudFormation uses
  /// the default version.
  Future<CreateResourceOutput> createResource({
    required String desiredState,
    required String typeName,
    String? clientToken,
    String? roleArn,
    String? typeVersionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CloudApiService.CreateResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DesiredState': desiredState,
        'TypeName': typeName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (roleArn != null) 'RoleArn': roleArn,
        if (typeVersionId != null) 'TypeVersionId': typeVersionId,
      },
    );

    return CreateResourceOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the specified resource. For details, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-delete.html">Deleting
  /// a resource</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// After you have initiated a resource deletion request, you can monitor the
  /// progress of your request by calling <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html">GetResourceRequestStatus</a>
  /// using the <code>RequestToken</code> of the <code>ProgressEvent</code>
  /// returned by <code>DeleteResource</code>.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [HandlerInternalFailureException].
  /// May throw [GeneralServiceException].
  /// May throw [NotUpdatableException].
  /// May throw [TypeNotFoundException].
  /// May throw [ConcurrentOperationException].
  /// May throw [InvalidRequestException].
  /// May throw [PrivateTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NetworkFailureException].
  /// May throw [UnsupportedActionException].
  /// May throw [NotStabilizedException].
  /// May throw [ServiceInternalErrorException].
  /// May throw [HandlerFailureException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InvalidCredentialsException].
  /// May throw [ResourceConflictException].
  /// May throw [ClientTokenConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [identifier] :
  /// The identifier for the resource.
  ///
  /// You can specify the primary identifier, or any secondary identifier
  /// defined for the resource type in its resource schema. You can only specify
  /// one identifier. Primary identifiers can be specified as a string or JSON;
  /// secondary identifiers must be specified as JSON.
  ///
  /// For compound primary identifiers (that is, one that consists of multiple
  /// resource properties strung together), to specify the primary identifier as
  /// a string, list the property values <i>in the order they are specified</i>
  /// in the primary identifier definition, separated by <code>|</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-identifier.html">Identifying
  /// resources</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// Parameter [typeName] :
  /// The name of the resource type.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier to ensure the idempotency of the resource request. As
  /// a best practice, specify this token to ensure idempotency, so that Amazon
  /// Web Services Cloud Control API can accurately distinguish between request
  /// retries and new resource requests. You might retry a resource request to
  /// ensure that it was successfully received.
  ///
  /// A client token is valid for 36 hours once used. After that, a resource
  /// request with the same client token is treated as a new request.
  ///
  /// If you do not specify a client token, one is generated for inclusion in
  /// the request.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-idempotency">Ensuring
  /// resource operation requests are unique</a> in the <i>Amazon Web Services
  /// Cloud Control API User Guide</i>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role for Cloud Control API to use when performing this resource operation.
  /// The role specified must have the permissions required for this operation.
  /// The necessary permissions for each event handler are defined in the <code>
  /// <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-handlers">handlers</a>
  /// </code> section of the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html">resource
  /// type definition schema</a>.
  ///
  /// If you do not specify a role, Cloud Control API uses a temporary session
  /// created using your Amazon Web Services user credentials.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-permissions">Specifying
  /// credentials</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// Parameter [typeVersionId] :
  /// For private resource types, the type version to use in this resource
  /// operation. If you do not specify a resource version, CloudFormation uses
  /// the default version.
  Future<DeleteResourceOutput> deleteResource({
    required String identifier,
    required String typeName,
    String? clientToken,
    String? roleArn,
    String? typeVersionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CloudApiService.DeleteResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'TypeName': typeName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (roleArn != null) 'RoleArn': roleArn,
        if (typeVersionId != null) 'TypeVersionId': typeVersionId,
      },
    );

    return DeleteResourceOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the current state of the specified resource. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-read.html">Reading
  /// a resource's current state</a>.
  ///
  /// You can use this action to return information about an existing resource
  /// in your account and Amazon Web Services Region, whether those resources
  /// were provisioned using Cloud Control API.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [HandlerInternalFailureException].
  /// May throw [GeneralServiceException].
  /// May throw [NotUpdatableException].
  /// May throw [TypeNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [PrivateTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NetworkFailureException].
  /// May throw [UnsupportedActionException].
  /// May throw [NotStabilizedException].
  /// May throw [ServiceInternalErrorException].
  /// May throw [HandlerFailureException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InvalidCredentialsException].
  /// May throw [ResourceConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [identifier] :
  /// The identifier for the resource.
  ///
  /// You can specify the primary identifier, or any secondary identifier
  /// defined for the resource type in its resource schema. You can only specify
  /// one identifier. Primary identifiers can be specified as a string or JSON;
  /// secondary identifiers must be specified as JSON.
  ///
  /// For compound primary identifiers (that is, one that consists of multiple
  /// resource properties strung together), to specify the primary identifier as
  /// a string, list the property values <i>in the order they are specified</i>
  /// in the primary identifier definition, separated by <code>|</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-identifier.html">Identifying
  /// resources</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// Parameter [typeName] :
  /// The name of the resource type.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role for Cloud Control API to use when performing this resource operation.
  /// The role specified must have the permissions required for this operation.
  /// The necessary permissions for each event handler are defined in the <code>
  /// <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-handlers">handlers</a>
  /// </code> section of the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html">resource
  /// type definition schema</a>.
  ///
  /// If you do not specify a role, Cloud Control API uses a temporary session
  /// created using your Amazon Web Services user credentials.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-permissions">Specifying
  /// credentials</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// Parameter [typeVersionId] :
  /// For private resource types, the type version to use in this resource
  /// operation. If you do not specify a resource version, CloudFormation uses
  /// the default version.
  Future<GetResourceOutput> getResource({
    required String identifier,
    required String typeName,
    String? roleArn,
    String? typeVersionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CloudApiService.GetResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'TypeName': typeName,
        if (roleArn != null) 'RoleArn': roleArn,
        if (typeVersionId != null) 'TypeVersionId': typeVersionId,
      },
    );

    return GetResourceOutput.fromJson(jsonResponse.body);
  }

  /// Returns the current status of a resource operation request. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html#resource-operations-manage-requests-track">Tracking
  /// the progress of resource operation requests</a> in the <i>Amazon Web
  /// Services Cloud Control API User Guide</i>.
  ///
  /// May throw [RequestTokenNotFoundException].
  ///
  /// Parameter [requestToken] :
  /// A unique token used to track the progress of the resource operation
  /// request.
  ///
  /// Request tokens are included in the <code>ProgressEvent</code> type
  /// returned by a resource operation request.
  Future<GetResourceRequestStatusOutput> getResourceRequestStatus({
    required String requestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CloudApiService.GetResourceRequestStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequestToken': requestToken,
      },
    );

    return GetResourceRequestStatusOutput.fromJson(jsonResponse.body);
  }

  /// Returns existing resource operation requests. This includes requests of
  /// all status types. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html#resource-operations-manage-requests-list">Listing
  /// active resource operation requests</a> in the <i>Amazon Web Services Cloud
  /// Control API User Guide</i>.
  /// <note>
  /// Resource operation requests expire after 7 days.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned with a single call. If the
  /// number of available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// The default is <code>20</code>.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request didn't return all of the remaining
  /// results, the response object's <code>NextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call this action
  /// again and assign that token to the request object's <code>NextToken</code>
  /// parameter. If there are no remaining results, the previous response
  /// object's <code>NextToken</code> parameter is set to <code>null</code>.
  ///
  /// Parameter [resourceRequestStatusFilter] :
  /// The filter criteria to apply to the requests returned.
  Future<ListResourceRequestsOutput> listResourceRequests({
    int? maxResults,
    String? nextToken,
    ResourceRequestStatusFilter? resourceRequestStatusFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CloudApiService.ListResourceRequests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceRequestStatusFilter != null)
          'ResourceRequestStatusFilter': resourceRequestStatusFilter,
      },
    );

    return ListResourceRequestsOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified resources. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-list.html">Discovering
  /// resources</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// You can use this action to return information about existing resources in
  /// your account and Amazon Web Services Region, whether those resources were
  /// provisioned using Cloud Control API.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [HandlerInternalFailureException].
  /// May throw [GeneralServiceException].
  /// May throw [NotUpdatableException].
  /// May throw [TypeNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [PrivateTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NetworkFailureException].
  /// May throw [UnsupportedActionException].
  /// May throw [NotStabilizedException].
  /// May throw [ServiceInternalErrorException].
  /// May throw [HandlerFailureException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InvalidCredentialsException].
  /// May throw [ResourceConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [typeName] :
  /// The name of the resource type.
  ///
  /// Parameter [maxResults] :
  /// Reserved.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request didn't return all of the remaining
  /// results, the response object's <code>NextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call this action
  /// again and assign that token to the request object's <code>NextToken</code>
  /// parameter. If there are no remaining results, the previous response
  /// object's <code>NextToken</code> parameter is set to <code>null</code>.
  ///
  /// Parameter [resourceModel] :
  /// The resource model to use to select the resources to return.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role for Cloud Control API to use when performing this resource operation.
  /// The role specified must have the permissions required for this operation.
  /// The necessary permissions for each event handler are defined in the <code>
  /// <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-handlers">handlers</a>
  /// </code> section of the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html">resource
  /// type definition schema</a>.
  ///
  /// If you do not specify a role, Cloud Control API uses a temporary session
  /// created using your Amazon Web Services user credentials.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-permissions">Specifying
  /// credentials</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// Parameter [typeVersionId] :
  /// For private resource types, the type version to use in this resource
  /// operation. If you do not specify a resource version, CloudFormation uses
  /// the default version.
  Future<ListResourcesOutput> listResources({
    required String typeName,
    int? maxResults,
    String? nextToken,
    String? resourceModel,
    String? roleArn,
    String? typeVersionId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CloudApiService.ListResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TypeName': typeName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceModel != null) 'ResourceModel': resourceModel,
        if (roleArn != null) 'RoleArn': roleArn,
        if (typeVersionId != null) 'TypeVersionId': typeVersionId,
      },
    );

    return ListResourcesOutput.fromJson(jsonResponse.body);
  }

  /// Updates the specified property values in the resource.
  ///
  /// You specify your resource property updates as a list of patch operations
  /// contained in a JSON patch document that adheres to the <a
  /// href="https://datatracker.ietf.org/doc/html/rfc6902"> <i>RFC 6902 -
  /// JavaScript Object Notation (JSON) Patch</i> </a> standard.
  ///
  /// For details on how Cloud Control API performs resource update operations,
  /// see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-update.html">Updating
  /// a resource</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// After you have initiated a resource update request, you can monitor the
  /// progress of your request by calling <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html">GetResourceRequestStatus</a>
  /// using the <code>RequestToken</code> of the <code>ProgressEvent</code>
  /// returned by <code>UpdateResource</code>.
  ///
  /// For more information about the properties of a specific resource, refer to
  /// the related topic for the resource in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Resource
  /// and property types reference</a> in the <i>CloudFormation Users Guide</i>.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [HandlerInternalFailureException].
  /// May throw [GeneralServiceException].
  /// May throw [NotUpdatableException].
  /// May throw [TypeNotFoundException].
  /// May throw [ConcurrentOperationException].
  /// May throw [InvalidRequestException].
  /// May throw [PrivateTypeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NetworkFailureException].
  /// May throw [UnsupportedActionException].
  /// May throw [NotStabilizedException].
  /// May throw [ServiceInternalErrorException].
  /// May throw [HandlerFailureException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InvalidCredentialsException].
  /// May throw [ResourceConflictException].
  /// May throw [ClientTokenConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [identifier] :
  /// The identifier for the resource.
  ///
  /// You can specify the primary identifier, or any secondary identifier
  /// defined for the resource type in its resource schema. You can only specify
  /// one identifier. Primary identifiers can be specified as a string or JSON;
  /// secondary identifiers must be specified as JSON.
  ///
  /// For compound primary identifiers (that is, one that consists of multiple
  /// resource properties strung together), to specify the primary identifier as
  /// a string, list the property values <i>in the order they are specified</i>
  /// in the primary identifier definition, separated by <code>|</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-identifier.html">Identifying
  /// resources</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// Parameter [patchDocument] :
  /// A JavaScript Object Notation (JSON) document listing the patch operations
  /// that represent the updates to apply to the current resource properties.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-update.html#resource-operations-update-patch">Composing
  /// the patch document</a> in the <i>Amazon Web Services Cloud Control API
  /// User Guide</i>.
  ///
  /// Parameter [typeName] :
  /// The name of the resource type.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier to ensure the idempotency of the resource request. As
  /// a best practice, specify this token to ensure idempotency, so that Amazon
  /// Web Services Cloud Control API can accurately distinguish between request
  /// retries and new resource requests. You might retry a resource request to
  /// ensure that it was successfully received.
  ///
  /// A client token is valid for 36 hours once used. After that, a resource
  /// request with the same client token is treated as a new request.
  ///
  /// If you do not specify a client token, one is generated for inclusion in
  /// the request.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-idempotency">Ensuring
  /// resource operation requests are unique</a> in the <i>Amazon Web Services
  /// Cloud Control API User Guide</i>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role for Cloud Control API to use when performing this resource operation.
  /// The role specified must have the permissions required for this operation.
  /// The necessary permissions for each event handler are defined in the <code>
  /// <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-handlers">handlers</a>
  /// </code> section of the <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html">resource
  /// type definition schema</a>.
  ///
  /// If you do not specify a role, Cloud Control API uses a temporary session
  /// created using your Amazon Web Services user credentials.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations.html#resource-operations-permissions">Specifying
  /// credentials</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  ///
  /// Parameter [typeVersionId] :
  /// For private resource types, the type version to use in this resource
  /// operation. If you do not specify a resource version, CloudFormation uses
  /// the default version.
  Future<UpdateResourceOutput> updateResource({
    required String identifier,
    required String patchDocument,
    required String typeName,
    String? clientToken,
    String? roleArn,
    String? typeVersionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CloudApiService.UpdateResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'PatchDocument': patchDocument,
        'TypeName': typeName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (roleArn != null) 'RoleArn': roleArn,
        if (typeVersionId != null) 'TypeVersionId': typeVersionId,
      },
    );

    return UpdateResourceOutput.fromJson(jsonResponse.body);
  }
}

class CancelResourceRequestOutput {
  final ProgressEvent? progressEvent;

  CancelResourceRequestOutput({
    this.progressEvent,
  });

  factory CancelResourceRequestOutput.fromJson(Map<String, dynamic> json) {
    return CancelResourceRequestOutput(
      progressEvent: json['ProgressEvent'] != null
          ? ProgressEvent.fromJson(
              json['ProgressEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final progressEvent = this.progressEvent;
    return {
      if (progressEvent != null) 'ProgressEvent': progressEvent,
    };
  }
}

class CreateResourceOutput {
  /// Represents the current status of the resource creation request.
  ///
  /// After you have initiated a resource creation request, you can monitor the
  /// progress of your request by calling <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html">GetResourceRequestStatus</a>
  /// using the <code>RequestToken</code> of the <code>ProgressEvent</code>
  /// returned by <code>CreateResource</code>.
  final ProgressEvent? progressEvent;

  CreateResourceOutput({
    this.progressEvent,
  });

  factory CreateResourceOutput.fromJson(Map<String, dynamic> json) {
    return CreateResourceOutput(
      progressEvent: json['ProgressEvent'] != null
          ? ProgressEvent.fromJson(
              json['ProgressEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final progressEvent = this.progressEvent;
    return {
      if (progressEvent != null) 'ProgressEvent': progressEvent,
    };
  }
}

class DeleteResourceOutput {
  /// Represents the current status of the resource deletion request.
  ///
  /// After you have initiated a resource deletion request, you can monitor the
  /// progress of your request by calling <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html">GetResourceRequestStatus</a>
  /// using the <code>RequestToken</code> of the <code>ProgressEvent</code>
  /// returned by <code>DeleteResource</code>.
  final ProgressEvent? progressEvent;

  DeleteResourceOutput({
    this.progressEvent,
  });

  factory DeleteResourceOutput.fromJson(Map<String, dynamic> json) {
    return DeleteResourceOutput(
      progressEvent: json['ProgressEvent'] != null
          ? ProgressEvent.fromJson(
              json['ProgressEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final progressEvent = this.progressEvent;
    return {
      if (progressEvent != null) 'ProgressEvent': progressEvent,
    };
  }
}

class GetResourceOutput {
  final ResourceDescription? resourceDescription;

  /// The name of the resource type.
  final String? typeName;

  GetResourceOutput({
    this.resourceDescription,
    this.typeName,
  });

  factory GetResourceOutput.fromJson(Map<String, dynamic> json) {
    return GetResourceOutput(
      resourceDescription: json['ResourceDescription'] != null
          ? ResourceDescription.fromJson(
              json['ResourceDescription'] as Map<String, dynamic>)
          : null,
      typeName: json['TypeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceDescription = this.resourceDescription;
    final typeName = this.typeName;
    return {
      if (resourceDescription != null)
        'ResourceDescription': resourceDescription,
      if (typeName != null) 'TypeName': typeName,
    };
  }
}

class GetResourceRequestStatusOutput {
  /// Represents the current status of the resource operation request.
  final ProgressEvent? progressEvent;

  GetResourceRequestStatusOutput({
    this.progressEvent,
  });

  factory GetResourceRequestStatusOutput.fromJson(Map<String, dynamic> json) {
    return GetResourceRequestStatusOutput(
      progressEvent: json['ProgressEvent'] != null
          ? ProgressEvent.fromJson(
              json['ProgressEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final progressEvent = this.progressEvent;
    return {
      if (progressEvent != null) 'ProgressEvent': progressEvent,
    };
  }
}

enum HandlerErrorCode {
  notUpdatable,
  invalidRequest,
  accessDenied,
  invalidCredentials,
  alreadyExists,
  notFound,
  resourceConflict,
  throttling,
  serviceLimitExceeded,
  notStabilized,
  generalServiceException,
  serviceInternalError,
  serviceTimeout,
  networkFailure,
  internalFailure,
}

extension HandlerErrorCodeValueExtension on HandlerErrorCode {
  String toValue() {
    switch (this) {
      case HandlerErrorCode.notUpdatable:
        return 'NotUpdatable';
      case HandlerErrorCode.invalidRequest:
        return 'InvalidRequest';
      case HandlerErrorCode.accessDenied:
        return 'AccessDenied';
      case HandlerErrorCode.invalidCredentials:
        return 'InvalidCredentials';
      case HandlerErrorCode.alreadyExists:
        return 'AlreadyExists';
      case HandlerErrorCode.notFound:
        return 'NotFound';
      case HandlerErrorCode.resourceConflict:
        return 'ResourceConflict';
      case HandlerErrorCode.throttling:
        return 'Throttling';
      case HandlerErrorCode.serviceLimitExceeded:
        return 'ServiceLimitExceeded';
      case HandlerErrorCode.notStabilized:
        return 'NotStabilized';
      case HandlerErrorCode.generalServiceException:
        return 'GeneralServiceException';
      case HandlerErrorCode.serviceInternalError:
        return 'ServiceInternalError';
      case HandlerErrorCode.serviceTimeout:
        return 'ServiceTimeout';
      case HandlerErrorCode.networkFailure:
        return 'NetworkFailure';
      case HandlerErrorCode.internalFailure:
        return 'InternalFailure';
    }
  }
}

extension HandlerErrorCodeFromString on String {
  HandlerErrorCode toHandlerErrorCode() {
    switch (this) {
      case 'NotUpdatable':
        return HandlerErrorCode.notUpdatable;
      case 'InvalidRequest':
        return HandlerErrorCode.invalidRequest;
      case 'AccessDenied':
        return HandlerErrorCode.accessDenied;
      case 'InvalidCredentials':
        return HandlerErrorCode.invalidCredentials;
      case 'AlreadyExists':
        return HandlerErrorCode.alreadyExists;
      case 'NotFound':
        return HandlerErrorCode.notFound;
      case 'ResourceConflict':
        return HandlerErrorCode.resourceConflict;
      case 'Throttling':
        return HandlerErrorCode.throttling;
      case 'ServiceLimitExceeded':
        return HandlerErrorCode.serviceLimitExceeded;
      case 'NotStabilized':
        return HandlerErrorCode.notStabilized;
      case 'GeneralServiceException':
        return HandlerErrorCode.generalServiceException;
      case 'ServiceInternalError':
        return HandlerErrorCode.serviceInternalError;
      case 'ServiceTimeout':
        return HandlerErrorCode.serviceTimeout;
      case 'NetworkFailure':
        return HandlerErrorCode.networkFailure;
      case 'InternalFailure':
        return HandlerErrorCode.internalFailure;
    }
    throw Exception('$this is not known in enum HandlerErrorCode');
  }
}

class ListResourceRequestsOutput {
  /// If the request doesn't return all of the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>ListResources</code> again and assign that token to the
  /// request object's <code>NextToken</code> parameter. If the request returns
  /// all results, <code>NextToken</code> is set to null.
  final String? nextToken;

  /// The requests that match the specified filter criteria.
  final List<ProgressEvent>? resourceRequestStatusSummaries;

  ListResourceRequestsOutput({
    this.nextToken,
    this.resourceRequestStatusSummaries,
  });

  factory ListResourceRequestsOutput.fromJson(Map<String, dynamic> json) {
    return ListResourceRequestsOutput(
      nextToken: json['NextToken'] as String?,
      resourceRequestStatusSummaries:
          (json['ResourceRequestStatusSummaries'] as List?)
              ?.whereNotNull()
              .map((e) => ProgressEvent.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceRequestStatusSummaries = this.resourceRequestStatusSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceRequestStatusSummaries != null)
        'ResourceRequestStatusSummaries': resourceRequestStatusSummaries,
    };
  }
}

class ListResourcesOutput {
  /// If the request doesn't return all of the remaining results,
  /// <code>NextToken</code> is set to a token. To retrieve the next set of
  /// results, call <code>ListResources</code> again and assign that token to the
  /// request object's <code>NextToken</code> parameter. If the request returns
  /// all results, <code>NextToken</code> is set to null.
  final String? nextToken;

  /// Information about the specified resources, including primary identifier and
  /// resource model.
  final List<ResourceDescription>? resourceDescriptions;

  /// The name of the resource type.
  final String? typeName;

  ListResourcesOutput({
    this.nextToken,
    this.resourceDescriptions,
    this.typeName,
  });

  factory ListResourcesOutput.fromJson(Map<String, dynamic> json) {
    return ListResourcesOutput(
      nextToken: json['NextToken'] as String?,
      resourceDescriptions: (json['ResourceDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeName: json['TypeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceDescriptions = this.resourceDescriptions;
    final typeName = this.typeName;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceDescriptions != null)
        'ResourceDescriptions': resourceDescriptions,
      if (typeName != null) 'TypeName': typeName,
    };
  }
}

enum Operation {
  create,
  delete,
  update,
}

extension OperationValueExtension on Operation {
  String toValue() {
    switch (this) {
      case Operation.create:
        return 'CREATE';
      case Operation.delete:
        return 'DELETE';
      case Operation.update:
        return 'UPDATE';
    }
  }
}

extension OperationFromString on String {
  Operation toOperation() {
    switch (this) {
      case 'CREATE':
        return Operation.create;
      case 'DELETE':
        return Operation.delete;
      case 'UPDATE':
        return Operation.update;
    }
    throw Exception('$this is not known in enum Operation');
  }
}

enum OperationStatus {
  pending,
  inProgress,
  success,
  failed,
  cancelInProgress,
  cancelComplete,
}

extension OperationStatusValueExtension on OperationStatus {
  String toValue() {
    switch (this) {
      case OperationStatus.pending:
        return 'PENDING';
      case OperationStatus.inProgress:
        return 'IN_PROGRESS';
      case OperationStatus.success:
        return 'SUCCESS';
      case OperationStatus.failed:
        return 'FAILED';
      case OperationStatus.cancelInProgress:
        return 'CANCEL_IN_PROGRESS';
      case OperationStatus.cancelComplete:
        return 'CANCEL_COMPLETE';
    }
  }
}

extension OperationStatusFromString on String {
  OperationStatus toOperationStatus() {
    switch (this) {
      case 'PENDING':
        return OperationStatus.pending;
      case 'IN_PROGRESS':
        return OperationStatus.inProgress;
      case 'SUCCESS':
        return OperationStatus.success;
      case 'FAILED':
        return OperationStatus.failed;
      case 'CANCEL_IN_PROGRESS':
        return OperationStatus.cancelInProgress;
      case 'CANCEL_COMPLETE':
        return OperationStatus.cancelComplete;
    }
    throw Exception('$this is not known in enum OperationStatus');
  }
}

/// Represents the current status of a resource operation request. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html">Managing
/// resource operation requests</a> in the <i>Amazon Web Services Cloud Control
/// API User Guide</i>.
class ProgressEvent {
  /// For requests with a status of <code>FAILED</code>, the associated error
  /// code.
  ///
  /// For error code definitions, see <a
  /// href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-test-contract-errors.html">Handler
  /// error codes</a> in the <i>CloudFormation Command Line Interface User Guide
  /// for Extension Development</i>.
  final HandlerErrorCode? errorCode;

  /// When the resource operation request was initiated.
  final DateTime? eventTime;

  /// The primary identifier for the resource.
  /// <note>
  /// In some cases, the resource identifier may be available before the resource
  /// operation has reached a status of <code>SUCCESS</code>.
  /// </note>
  final String? identifier;

  /// The resource operation type.
  final Operation? operation;

  /// The current status of the resource operation request.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The resource operation hasn't yet started.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code>: The resource operation is currently in progress.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code>: The resource operation has successfully completed.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The resource operation has failed. Refer to the error
  /// code and status message for more information.
  /// </li>
  /// <li>
  /// <code>CANCEL_IN_PROGRESS</code>: The resource operation is in the process of
  /// being canceled.
  /// </li>
  /// <li>
  /// <code>CANCEL_COMPLETE</code>: The resource operation has been canceled.
  /// </li>
  /// </ul>
  final OperationStatus? operationStatus;

  /// The unique token representing this resource operation request.
  ///
  /// Use the <code>RequestToken</code> with <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html">GetResourceRequestStatus</a>
  /// to return the current status of a resource operation request.
  final String? requestToken;

  /// A JSON string containing the resource model, consisting of each resource
  /// property and its current value.
  final String? resourceModel;

  /// When to next request the status of this resource operation request.
  final DateTime? retryAfter;

  /// Any message explaining the current status.
  final String? statusMessage;

  /// The name of the resource type used in the operation.
  final String? typeName;

  ProgressEvent({
    this.errorCode,
    this.eventTime,
    this.identifier,
    this.operation,
    this.operationStatus,
    this.requestToken,
    this.resourceModel,
    this.retryAfter,
    this.statusMessage,
    this.typeName,
  });

  factory ProgressEvent.fromJson(Map<String, dynamic> json) {
    return ProgressEvent(
      errorCode: (json['ErrorCode'] as String?)?.toHandlerErrorCode(),
      eventTime: timeStampFromJson(json['EventTime']),
      identifier: json['Identifier'] as String?,
      operation: (json['Operation'] as String?)?.toOperation(),
      operationStatus:
          (json['OperationStatus'] as String?)?.toOperationStatus(),
      requestToken: json['RequestToken'] as String?,
      resourceModel: json['ResourceModel'] as String?,
      retryAfter: timeStampFromJson(json['RetryAfter']),
      statusMessage: json['StatusMessage'] as String?,
      typeName: json['TypeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final eventTime = this.eventTime;
    final identifier = this.identifier;
    final operation = this.operation;
    final operationStatus = this.operationStatus;
    final requestToken = this.requestToken;
    final resourceModel = this.resourceModel;
    final retryAfter = this.retryAfter;
    final statusMessage = this.statusMessage;
    final typeName = this.typeName;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (eventTime != null) 'EventTime': unixTimestampToJson(eventTime),
      if (identifier != null) 'Identifier': identifier,
      if (operation != null) 'Operation': operation.toValue(),
      if (operationStatus != null) 'OperationStatus': operationStatus.toValue(),
      if (requestToken != null) 'RequestToken': requestToken,
      if (resourceModel != null) 'ResourceModel': resourceModel,
      if (retryAfter != null) 'RetryAfter': unixTimestampToJson(retryAfter),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (typeName != null) 'TypeName': typeName,
    };
  }
}

/// Represents information about a provisioned resource.
class ResourceDescription {
  /// The primary identifier for the resource.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-identifier.html">Identifying
  /// resources</a> in the <i>Amazon Web Services Cloud Control API User
  /// Guide</i>.
  final String? identifier;

  /// A list of the resource properties and their current values.
  final String? properties;

  ResourceDescription({
    this.identifier,
    this.properties,
  });

  factory ResourceDescription.fromJson(Map<String, dynamic> json) {
    return ResourceDescription(
      identifier: json['Identifier'] as String?,
      properties: json['Properties'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final properties = this.properties;
    return {
      if (identifier != null) 'Identifier': identifier,
      if (properties != null) 'Properties': properties,
    };
  }
}

/// The filter criteria to use in determining the requests returned.
class ResourceRequestStatusFilter {
  /// The operation statuses to include in the filter.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The operation has been requested, but not yet
  /// initiated.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code>: The operation is in progress.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code>: The operation completed.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The operation failed.
  /// </li>
  /// <li>
  /// <code>CANCEL_IN_PROGRESS</code>: The operation is in the process of being
  /// canceled.
  /// </li>
  /// <li>
  /// <code>CANCEL_COMPLETE</code>: The operation has been canceled.
  /// </li>
  /// </ul>
  final List<OperationStatus>? operationStatuses;

  /// The operation types to include in the filter.
  final List<Operation>? operations;

  ResourceRequestStatusFilter({
    this.operationStatuses,
    this.operations,
  });

  Map<String, dynamic> toJson() {
    final operationStatuses = this.operationStatuses;
    final operations = this.operations;
    return {
      if (operationStatuses != null)
        'OperationStatuses': operationStatuses.map((e) => e.toValue()).toList(),
      if (operations != null)
        'Operations': operations.map((e) => e.toValue()).toList(),
    };
  }
}

class UpdateResourceOutput {
  /// Represents the current status of the resource update request.
  ///
  /// Use the <code>RequestToken</code> of the <code>ProgressEvent</code> with <a
  /// href="https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html">GetResourceRequestStatus</a>
  /// to return the current status of a resource operation request.
  final ProgressEvent? progressEvent;

  UpdateResourceOutput({
    this.progressEvent,
  });

  factory UpdateResourceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateResourceOutput(
      progressEvent: json['ProgressEvent'] != null
          ? ProgressEvent.fromJson(
              json['ProgressEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final progressEvent = this.progressEvent;
    return {
      if (progressEvent != null) 'ProgressEvent': progressEvent,
    };
  }
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class ClientTokenConflictException extends _s.GenericAwsException {
  ClientTokenConflictException({String? type, String? message})
      : super(
            type: type, code: 'ClientTokenConflictException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConcurrentOperationException extends _s.GenericAwsException {
  ConcurrentOperationException({String? type, String? message})
      : super(
            type: type, code: 'ConcurrentOperationException', message: message);
}

class GeneralServiceException extends _s.GenericAwsException {
  GeneralServiceException({String? type, String? message})
      : super(type: type, code: 'GeneralServiceException', message: message);
}

class HandlerFailureException extends _s.GenericAwsException {
  HandlerFailureException({String? type, String? message})
      : super(type: type, code: 'HandlerFailureException', message: message);
}

class HandlerInternalFailureException extends _s.GenericAwsException {
  HandlerInternalFailureException({String? type, String? message})
      : super(
            type: type,
            code: 'HandlerInternalFailureException',
            message: message);
}

class InvalidCredentialsException extends _s.GenericAwsException {
  InvalidCredentialsException({String? type, String? message})
      : super(
            type: type, code: 'InvalidCredentialsException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class NetworkFailureException extends _s.GenericAwsException {
  NetworkFailureException({String? type, String? message})
      : super(type: type, code: 'NetworkFailureException', message: message);
}

class NotStabilizedException extends _s.GenericAwsException {
  NotStabilizedException({String? type, String? message})
      : super(type: type, code: 'NotStabilizedException', message: message);
}

class NotUpdatableException extends _s.GenericAwsException {
  NotUpdatableException({String? type, String? message})
      : super(type: type, code: 'NotUpdatableException', message: message);
}

class PrivateTypeException extends _s.GenericAwsException {
  PrivateTypeException({String? type, String? message})
      : super(type: type, code: 'PrivateTypeException', message: message);
}

class RequestTokenNotFoundException extends _s.GenericAwsException {
  RequestTokenNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestTokenNotFoundException',
            message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceInternalErrorException extends _s.GenericAwsException {
  ServiceInternalErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceInternalErrorException',
            message: message);
}

class ServiceLimitExceededException extends _s.GenericAwsException {
  ServiceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceLimitExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TypeNotFoundException extends _s.GenericAwsException {
  TypeNotFoundException({String? type, String? message})
      : super(type: type, code: 'TypeNotFoundException', message: message);
}

class UnsupportedActionException extends _s.GenericAwsException {
  UnsupportedActionException({String? type, String? message})
      : super(type: type, code: 'UnsupportedActionException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'ClientTokenConflictException': (type, message) =>
      ClientTokenConflictException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConcurrentOperationException': (type, message) =>
      ConcurrentOperationException(type: type, message: message),
  'GeneralServiceException': (type, message) =>
      GeneralServiceException(type: type, message: message),
  'HandlerFailureException': (type, message) =>
      HandlerFailureException(type: type, message: message),
  'HandlerInternalFailureException': (type, message) =>
      HandlerInternalFailureException(type: type, message: message),
  'InvalidCredentialsException': (type, message) =>
      InvalidCredentialsException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'NetworkFailureException': (type, message) =>
      NetworkFailureException(type: type, message: message),
  'NotStabilizedException': (type, message) =>
      NotStabilizedException(type: type, message: message),
  'NotUpdatableException': (type, message) =>
      NotUpdatableException(type: type, message: message),
  'PrivateTypeException': (type, message) =>
      PrivateTypeException(type: type, message: message),
  'RequestTokenNotFoundException': (type, message) =>
      RequestTokenNotFoundException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceInternalErrorException': (type, message) =>
      ServiceInternalErrorException(type: type, message: message),
  'ServiceLimitExceededException': (type, message) =>
      ServiceLimitExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TypeNotFoundException': (type, message) =>
      TypeNotFoundException(type: type, message: message),
  'UnsupportedActionException': (type, message) =>
      UnsupportedActionException(type: type, message: message),
};
