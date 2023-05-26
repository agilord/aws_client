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

/// AWS IoT Things Graph provides an integrated set of tools that enable
/// developers to connect devices and services that use different standards,
/// such as units of measure and communication protocols. AWS IoT Things Graph
/// makes it possible to build IoT applications with little to no code by
/// connecting devices and services and defining how they interact at an
/// abstract level.
class IoTThingsGraph {
  final _s.JsonProtocol _protocol;
  IoTThingsGraph({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotthingsgraph',
            signingName: 'iotthingsgraph',
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

  /// Associates a device with a concrete thing that is in the user's registry.
  ///
  /// A thing can be associated with only one device at a time. If you associate
  /// a thing with a new device id, its previous association will be removed.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [entityId] :
  /// The ID of the device to be associated with the thing.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME</code>
  ///
  /// Parameter [thingName] :
  /// The name of the thing to which the entity is to be associated.
  ///
  /// Parameter [namespaceVersion] :
  /// The version of the user's namespace. Defaults to the latest version of the
  /// user's namespace.
  @Deprecated('since: 2022-08-30')
  Future<void> associateEntityToThing({
    required String entityId,
    required String thingName,
    int? namespaceVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.AssociateEntityToThing'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'entityId': entityId,
        'thingName': thingName,
        if (namespaceVersion != null) 'namespaceVersion': namespaceVersion,
      },
    );
  }

  /// Creates a workflow template. Workflows can be created only in the user's
  /// namespace. (The public namespace contains only entities.) The workflow can
  /// contain only entities in the specified namespace. The workflow is
  /// validated against the entities in the latest version of the user's
  /// namespace unless another namespace version is specified in the request.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [definition] :
  /// The workflow <code>DefinitionDocument</code>.
  ///
  /// Parameter [compatibleNamespaceVersion] :
  /// The namespace version in which the workflow is to be created.
  ///
  /// If no value is specified, the latest version is used by default.
  @Deprecated('since: 2022-08-30')
  Future<CreateFlowTemplateResponse> createFlowTemplate({
    required DefinitionDocument definition,
    int? compatibleNamespaceVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.CreateFlowTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'definition': definition,
        if (compatibleNamespaceVersion != null)
          'compatibleNamespaceVersion': compatibleNamespaceVersion,
      },
    );

    return CreateFlowTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Creates a system instance.
  ///
  /// This action validates the system instance, prepares the deployment-related
  /// resources. For Greengrass deployments, it updates the Greengrass group
  /// that is specified by the <code>greengrassGroupName</code> parameter. It
  /// also adds a file to the S3 bucket specified by the
  /// <code>s3BucketName</code> parameter. You need to call
  /// <code>DeploySystemInstance</code> after running this action.
  ///
  /// For Greengrass deployments, since this action modifies and adds resources
  /// to a Greengrass group and an S3 bucket on the caller's behalf, the calling
  /// identity must have write permissions to both the specified Greengrass
  /// group and S3 bucket. Otherwise, the call will fail with an authorization
  /// error.
  ///
  /// For cloud deployments, this action requires a
  /// <code>flowActionsRoleArn</code> value. This is an IAM role that has
  /// permissions to access AWS services, such as AWS Lambda and AWS IoT, that
  /// the flow uses when it executes.
  ///
  /// If the definition document doesn't specify a version of the user's
  /// namespace, the latest version will be used by default.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [target] :
  /// The target type of the deployment. Valid values are
  /// <code>GREENGRASS</code> and <code>CLOUD</code>.
  ///
  /// Parameter [flowActionsRoleArn] :
  /// The ARN of the IAM role that AWS IoT Things Graph will assume when it
  /// executes the flow. This role must have read and write access to AWS Lambda
  /// and AWS IoT and any other AWS services that the flow uses when it
  /// executes. This value is required if the value of the <code>target</code>
  /// parameter is <code>CLOUD</code>.
  ///
  /// Parameter [greengrassGroupName] :
  /// The name of the Greengrass group where the system instance will be
  /// deployed. This value is required if the value of the <code>target</code>
  /// parameter is <code>GREENGRASS</code>.
  ///
  /// Parameter [s3BucketName] :
  /// The name of the Amazon Simple Storage Service bucket that will be used to
  /// store and deploy the system instance's resource file. This value is
  /// required if the value of the <code>target</code> parameter is
  /// <code>GREENGRASS</code>.
  ///
  /// Parameter [tags] :
  /// Metadata, consisting of key-value pairs, that can be used to categorize
  /// your system instances.
  @Deprecated('since: 2022-08-30')
  Future<CreateSystemInstanceResponse> createSystemInstance({
    required DefinitionDocument definition,
    required DeploymentTarget target,
    String? flowActionsRoleArn,
    String? greengrassGroupName,
    MetricsConfiguration? metricsConfiguration,
    String? s3BucketName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.CreateSystemInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'definition': definition,
        'target': target.toValue(),
        if (flowActionsRoleArn != null)
          'flowActionsRoleArn': flowActionsRoleArn,
        if (greengrassGroupName != null)
          'greengrassGroupName': greengrassGroupName,
        if (metricsConfiguration != null)
          'metricsConfiguration': metricsConfiguration,
        if (s3BucketName != null) 's3BucketName': s3BucketName,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateSystemInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a system. The system is validated against the entities in the
  /// latest version of the user's namespace unless another namespace version is
  /// specified in the request.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [definition] :
  /// The <code>DefinitionDocument</code> used to create the system.
  ///
  /// Parameter [compatibleNamespaceVersion] :
  /// The namespace version in which the system is to be created.
  ///
  /// If no value is specified, the latest version is used by default.
  @Deprecated('since: 2022-08-30')
  Future<CreateSystemTemplateResponse> createSystemTemplate({
    required DefinitionDocument definition,
    int? compatibleNamespaceVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.CreateSystemTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'definition': definition,
        if (compatibleNamespaceVersion != null)
          'compatibleNamespaceVersion': compatibleNamespaceVersion,
      },
    );

    return CreateSystemTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a workflow. Any new system or deployment that contains this
  /// workflow will fail to update or deploy. Existing deployments that contain
  /// the workflow will continue to run (since they use a snapshot of the
  /// workflow taken at the time of deployment).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [id] :
  /// The ID of the workflow to be deleted.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME</code>
  @Deprecated('since: 2022-08-30')
  Future<void> deleteFlowTemplate({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeleteFlowTemplate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );
  }

  /// Deletes the specified namespace. This action deletes all of the entities
  /// in the namespace. Delete the systems and flows that use entities in the
  /// namespace before performing this action. This action takes no request
  /// parameters.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  @Deprecated('since: 2022-08-30')
  Future<DeleteNamespaceResponse> deleteNamespace() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeleteNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a system instance. Only system instances that have never been
  /// deployed, or that have been undeployed can be deleted.
  ///
  /// Users can create a new system instance that has the same ID as a deleted
  /// system instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [id] :
  /// The ID of the system instance to be deleted.
  @Deprecated('since: 2022-08-30')
  Future<void> deleteSystemInstance({
    String? id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeleteSystemInstance'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (id != null) 'id': id,
      },
    );
  }

  /// Deletes a system. New deployments can't contain the system after its
  /// deletion. Existing deployments that contain the system will continue to
  /// work because they use a snapshot of the system that is taken when it is
  /// deployed.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [id] :
  /// The ID of the system to be deleted.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME</code>
  @Deprecated('since: 2022-08-30')
  Future<void> deleteSystemTemplate({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeleteSystemTemplate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );
  }

  /// <b>Greengrass and Cloud Deployments</b>
  ///
  /// Deploys the system instance to the target specified in
  /// <code>CreateSystemInstance</code>.
  ///
  /// <b>Greengrass Deployments</b>
  ///
  /// If the system or any workflows and entities have been updated before this
  /// action is called, then the deployment will create a new Amazon Simple
  /// Storage Service resource file and then deploy it.
  ///
  /// Since this action creates a Greengrass deployment on the caller's behalf,
  /// the calling identity must have write permissions to the specified
  /// Greengrass group. Otherwise, the call will fail with an authorization
  /// error.
  ///
  /// For information about the artifacts that get added to your Greengrass core
  /// device when you use this API, see <a
  /// href="https://docs.aws.amazon.com/thingsgraph/latest/ug/iot-tg-greengrass.html">AWS
  /// IoT Things Graph and AWS IoT Greengrass</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [id] :
  /// The ID of the system instance. This value is returned by the
  /// <code>CreateSystemInstance</code> action.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:deployment:DEPLOYMENTNAME</code>
  @Deprecated('since: 2022-08-30')
  Future<DeploySystemInstanceResponse> deploySystemInstance({
    String? id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeploySystemInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (id != null) 'id': id,
      },
    );

    return DeploySystemInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Deprecates the specified workflow. This action marks the workflow for
  /// deletion. Deprecated flows can't be deployed, but existing deployments
  /// will continue to run.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the workflow to be deleted.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME</code>
  @Deprecated('since: 2022-08-30')
  Future<void> deprecateFlowTemplate({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeprecateFlowTemplate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );
  }

  /// Deprecates the specified system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the system to delete.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME</code>
  @Deprecated('since: 2022-08-30')
  Future<void> deprecateSystemTemplate({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DeprecateSystemTemplate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );
  }

  /// Gets the latest version of the user's namespace and the public version
  /// that it is tracking.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [namespaceName] :
  /// The name of the user's namespace. Set this to <code>aws</code> to get the
  /// public namespace.
  @Deprecated('since: 2022-08-30')
  Future<DescribeNamespaceResponse> describeNamespace({
    String? namespaceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DescribeNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (namespaceName != null) 'namespaceName': namespaceName,
      },
    );

    return DescribeNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Dissociates a device entity from a concrete thing. The action takes only
  /// the type of the entity that you need to dissociate because only one entity
  /// of a particular type can be associated with a thing.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [entityType] :
  /// The entity type from which to disassociate the thing.
  ///
  /// Parameter [thingName] :
  /// The name of the thing to disassociate.
  @Deprecated('since: 2022-08-30')
  Future<void> dissociateEntityFromThing({
    required EntityType entityType,
    required String thingName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.DissociateEntityFromThing'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'entityType': entityType.toValue(),
        'thingName': thingName,
      },
    );
  }

  /// Gets definitions of the specified entities. Uses the latest version of the
  /// user's namespace by default. This API returns the following TDM entities.
  ///
  /// <ul>
  /// <li>
  /// Properties
  /// </li>
  /// <li>
  /// States
  /// </li>
  /// <li>
  /// Events
  /// </li>
  /// <li>
  /// Actions
  /// </li>
  /// <li>
  /// Capabilities
  /// </li>
  /// <li>
  /// Mappings
  /// </li>
  /// <li>
  /// Devices
  /// </li>
  /// <li>
  /// Device Models
  /// </li>
  /// <li>
  /// Services
  /// </li>
  /// </ul>
  /// This action doesn't return definitions for systems, flows, and
  /// deployments.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ids] :
  /// An array of entity IDs.
  ///
  /// The IDs should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME</code>
  ///
  /// Parameter [namespaceVersion] :
  /// The version of the user's namespace. Defaults to the latest version of the
  /// user's namespace.
  @Deprecated('since: 2022-08-30')
  Future<GetEntitiesResponse> getEntities({
    required List<String> ids,
    int? namespaceVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.GetEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ids': ids,
        if (namespaceVersion != null) 'namespaceVersion': namespaceVersion,
      },
    );

    return GetEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Gets the latest version of the <code>DefinitionDocument</code> and
  /// <code>FlowTemplateSummary</code> for the specified workflow.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the workflow.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME</code>
  ///
  /// Parameter [revisionNumber] :
  /// The number of the workflow revision to retrieve.
  @Deprecated('since: 2022-08-30')
  Future<GetFlowTemplateResponse> getFlowTemplate({
    required String id,
    int? revisionNumber,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.GetFlowTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (revisionNumber != null) 'revisionNumber': revisionNumber,
      },
    );

    return GetFlowTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Gets revisions of the specified workflow. Only the last 100 revisions are
  /// stored. If the workflow has been deprecated, this action will return
  /// revisions that occurred before the deprecation. This action won't work for
  /// workflows that have been deleted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the workflow.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results. Use this when you're
  /// paginating results.
  @Deprecated('since: 2022-08-30')
  Future<GetFlowTemplateRevisionsResponse> getFlowTemplateRevisions({
    required String id,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.GetFlowTemplateRevisions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetFlowTemplateRevisionsResponse.fromJson(jsonResponse.body);
  }

  /// Gets the status of a namespace deletion task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  @Deprecated('since: 2022-08-30')
  Future<GetNamespaceDeletionStatusResponse>
      getNamespaceDeletionStatus() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.GetNamespaceDeletionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetNamespaceDeletionStatusResponse.fromJson(jsonResponse.body);
  }

  /// Gets a system instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the system deployment instance. This value is returned by
  /// <code>CreateSystemInstance</code>.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:deployment:DEPLOYMENTNAME</code>
  @Deprecated('since: 2022-08-30')
  Future<GetSystemInstanceResponse> getSystemInstance({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.GetSystemInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );

    return GetSystemInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Gets a system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the system to get. This ID must be in the user's namespace.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME</code>
  ///
  /// Parameter [revisionNumber] :
  /// The number that specifies the revision of the system to get.
  @Deprecated('since: 2022-08-30')
  Future<GetSystemTemplateResponse> getSystemTemplate({
    required String id,
    int? revisionNumber,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.GetSystemTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (revisionNumber != null) 'revisionNumber': revisionNumber,
      },
    );

    return GetSystemTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Gets revisions made to the specified system template. Only the previous
  /// 100 revisions are stored. If the system has been deprecated, this action
  /// will return the revisions that occurred before its deprecation. This
  /// action won't work with systems that have been deleted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the system template.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results. Use this when you're
  /// paginating results.
  @Deprecated('since: 2022-08-30')
  Future<GetSystemTemplateRevisionsResponse> getSystemTemplateRevisions({
    required String id,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.GetSystemTemplateRevisions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetSystemTemplateRevisionsResponse.fromJson(jsonResponse.body);
  }

  /// Gets the status of the specified upload.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [uploadId] :
  /// The ID of the upload. This value is returned by the
  /// <code>UploadEntityDefinitions</code> action.
  @Deprecated('since: 2022-08-30')
  Future<GetUploadStatusResponse> getUploadStatus({
    required String uploadId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.GetUploadStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'uploadId': uploadId,
      },
    );

    return GetUploadStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of objects that contain information about events in a flow
  /// execution.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [flowExecutionId] :
  /// The ID of the flow execution.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results. Use this when you're
  /// paginating results.
  @Deprecated('since: 2022-08-30')
  Future<ListFlowExecutionMessagesResponse> listFlowExecutionMessages({
    required String flowExecutionId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.ListFlowExecutionMessages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'flowExecutionId': flowExecutionId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListFlowExecutionMessagesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all tags on an AWS IoT Things Graph resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags are to be
  /// returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tags to return.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results to return.
  @Deprecated('since: 2022-08-30')
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Searches for entities of the specified type. You can search for entities
  /// in your namespace and the public namespace that you're tracking.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [entityTypes] :
  /// The entity types for which to search.
  ///
  /// Parameter [filters] :
  /// Optional filter to apply to the search. Valid filters are
  /// <code>NAME</code> <code>NAMESPACE</code>, <code>SEMANTIC_TYPE_PATH</code>
  /// and <code>REFERENCED_ENTITY_ID</code>. <code>REFERENCED_ENTITY_ID</code>
  /// filters on entities that are used by the entity in the result set. For
  /// example, you can filter on the ID of a property that is used in a state.
  ///
  /// Multiple filters function as OR criteria in the query. Multiple values
  /// passed inside the filter function as AND criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [namespaceVersion] :
  /// The version of the user's namespace. Defaults to the latest version of the
  /// user's namespace.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results. Use this when you're
  /// paginating results.
  @Deprecated('since: 2022-08-30')
  Future<SearchEntitiesResponse> searchEntities({
    required List<EntityType> entityTypes,
    List<EntityFilter>? filters,
    int? maxResults,
    int? namespaceVersion,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.SearchEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'entityTypes': entityTypes.map((e) => e.toValue()).toList(),
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (namespaceVersion != null) 'namespaceVersion': namespaceVersion,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return SearchEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Searches for AWS IoT Things Graph workflow execution instances.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [systemInstanceId] :
  /// The ID of the system instance that contains the flow.
  ///
  /// Parameter [endTime] :
  /// The date and time of the latest flow execution to return.
  ///
  /// Parameter [flowExecutionId] :
  /// The ID of a flow execution.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results. Use this when you're
  /// paginating results.
  ///
  /// Parameter [startTime] :
  /// The date and time of the earliest flow execution to return.
  @Deprecated('since: 2022-08-30')
  Future<SearchFlowExecutionsResponse> searchFlowExecutions({
    required String systemInstanceId,
    DateTime? endTime,
    String? flowExecutionId,
    int? maxResults,
    String? nextToken,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.SearchFlowExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'systemInstanceId': systemInstanceId,
        if (endTime != null) 'endTime': unixTimestampToJson(endTime),
        if (flowExecutionId != null) 'flowExecutionId': flowExecutionId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      },
    );

    return SearchFlowExecutionsResponse.fromJson(jsonResponse.body);
  }

  /// Searches for summary information about workflows.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [filters] :
  /// An array of objects that limit the result set. The only valid filter is
  /// <code>DEVICE_MODEL_ID</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results. Use this when you're
  /// paginating results.
  @Deprecated('since: 2022-08-30')
  Future<SearchFlowTemplatesResponse> searchFlowTemplates({
    List<FlowTemplateFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.SearchFlowTemplates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return SearchFlowTemplatesResponse.fromJson(jsonResponse.body);
  }

  /// Searches for system instances in the user's account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [filters] :
  /// Optional filter to apply to the search. Valid filters are
  /// <code>SYSTEM_TEMPLATE_ID</code>, <code>STATUS</code>, and
  /// <code>GREENGRASS_GROUP_NAME</code>.
  ///
  /// Multiple filters function as OR criteria in the query. Multiple values
  /// passed inside the filter function as AND criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results. Use this when you're
  /// paginating results.
  @Deprecated('since: 2022-08-30')
  Future<SearchSystemInstancesResponse> searchSystemInstances({
    List<SystemInstanceFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.SearchSystemInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return SearchSystemInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Searches for summary information about systems in the user's account. You
  /// can filter by the ID of a workflow to return only systems that use the
  /// specified workflow.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [filters] :
  /// An array of filters that limit the result set. The only valid filter is
  /// <code>FLOW_TEMPLATE_ID</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results. Use this when you're
  /// paginating results.
  @Deprecated('since: 2022-08-30')
  Future<SearchSystemTemplatesResponse> searchSystemTemplates({
    List<SystemTemplateFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.SearchSystemTemplates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return SearchSystemTemplatesResponse.fromJson(jsonResponse.body);
  }

  /// Searches for things associated with the specified entity. You can search
  /// by both device and device model.
  ///
  /// For example, if two different devices, camera1 and camera2, implement the
  /// camera device model, the user can associate thing1 to camera1 and thing2
  /// to camera2. <code>SearchThings(camera2)</code> will return only thing2,
  /// but <code>SearchThings(camera)</code> will return both thing1 and thing2.
  ///
  /// This action searches for exact matches and doesn't perform partial text
  /// matching.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [entityId] :
  /// The ID of the entity to which the things are associated.
  ///
  /// The IDs should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [namespaceVersion] :
  /// The version of the user's namespace. Defaults to the latest version of the
  /// user's namespace.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results. Use this when you're
  /// paginating results.
  @Deprecated('since: 2022-08-30')
  Future<SearchThingsResponse> searchThings({
    required String entityId,
    int? maxResults,
    int? namespaceVersion,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.SearchThings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'entityId': entityId,
        if (maxResults != null) 'maxResults': maxResults,
        if (namespaceVersion != null) 'namespaceVersion': namespaceVersion,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return SearchThingsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a tag for the specified resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags are returned.
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the resource.&gt;
  @Deprecated('since: 2022-08-30')
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Removes a system instance from its target (Cloud or Greengrass).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [id] :
  /// The ID of the system instance to remove from its target.
  @Deprecated('since: 2022-08-30')
  Future<UndeploySystemInstanceResponse> undeploySystemInstance({
    String? id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.UndeploySystemInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (id != null) 'id': id,
      },
    );

    return UndeploySystemInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Removes a tag from the specified resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags are to be
  /// removed.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag key names to remove from the resource. You don't specify the
  /// value. Both the key and its associated value are removed.
  ///
  /// This parameter to the API requires a JSON text string argument. For
  /// information on how to format a JSON parameter for the various command line
  /// tool environments, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters.html#cli-using-param-json">Using
  /// JSON for Parameters</a> in the <i>AWS CLI User Guide</i>.
  @Deprecated('since: 2022-08-30')
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Updates the specified workflow. All deployed systems and system instances
  /// that use the workflow will see the changes in the flow when it is
  /// redeployed. If you don't want this behavior, copy the workflow (creating a
  /// new workflow with a different ID), and update the copy. The workflow can
  /// contain only entities in the specified namespace.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [definition] :
  /// The <code>DefinitionDocument</code> that contains the updated workflow
  /// definition.
  ///
  /// Parameter [id] :
  /// The ID of the workflow to be updated.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME</code>
  ///
  /// Parameter [compatibleNamespaceVersion] :
  /// The version of the user's namespace.
  ///
  /// If no value is specified, the latest version is used by default. Use the
  /// <code>GetFlowTemplateRevisions</code> if you want to find earlier
  /// revisions of the flow to update.
  @Deprecated('since: 2022-08-30')
  Future<UpdateFlowTemplateResponse> updateFlowTemplate({
    required DefinitionDocument definition,
    required String id,
    int? compatibleNamespaceVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.UpdateFlowTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'definition': definition,
        'id': id,
        if (compatibleNamespaceVersion != null)
          'compatibleNamespaceVersion': compatibleNamespaceVersion,
      },
    );

    return UpdateFlowTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified system. You don't need to run this action after
  /// updating a workflow. Any deployment that uses the system will see the
  /// changes in the system when it is redeployed.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [definition] :
  /// The <code>DefinitionDocument</code> that contains the updated system
  /// definition.
  ///
  /// Parameter [id] :
  /// The ID of the system to be updated.
  ///
  /// The ID should be in the following format.
  ///
  /// <code>urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME</code>
  ///
  /// Parameter [compatibleNamespaceVersion] :
  /// The version of the user's namespace. Defaults to the latest version of the
  /// user's namespace.
  ///
  /// If no value is specified, the latest version is used by default.
  @Deprecated('since: 2022-08-30')
  Future<UpdateSystemTemplateResponse> updateSystemTemplate({
    required DefinitionDocument definition,
    required String id,
    int? compatibleNamespaceVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.UpdateSystemTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'definition': definition,
        'id': id,
        if (compatibleNamespaceVersion != null)
          'compatibleNamespaceVersion': compatibleNamespaceVersion,
      },
    );

    return UpdateSystemTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Asynchronously uploads one or more entity definitions to the user's
  /// namespace. The <code>document</code> parameter is required if
  /// <code>syncWithPublicNamespace</code> and
  /// <code>deleteExistingEntites</code> are false. If the
  /// <code>syncWithPublicNamespace</code> parameter is set to
  /// <code>true</code>, the user's namespace will synchronize with the latest
  /// version of the public namespace. If <code>deprecateExistingEntities</code>
  /// is set to true, all entities in the latest version will be deleted before
  /// the new <code>DefinitionDocument</code> is uploaded.
  ///
  /// When a user uploads entity definitions for the first time, the service
  /// creates a new namespace for the user. The new namespace tracks the public
  /// namespace. Currently users can have only one namespace. The namespace
  /// version increments whenever a user uploads entity definitions that are
  /// backwards-incompatible and whenever a user sets the
  /// <code>syncWithPublicNamespace</code> parameter or the
  /// <code>deprecateExistingEntities</code> parameter to <code>true</code>.
  ///
  /// The IDs for all of the entities should be in URN format. Each entity must
  /// be in the user's namespace. Users can't create entities in the public
  /// namespace, but entity definitions can refer to entities in the public
  /// namespace.
  ///
  /// Valid entities are <code>Device</code>, <code>DeviceModel</code>,
  /// <code>Service</code>, <code>Capability</code>, <code>State</code>,
  /// <code>Action</code>, <code>Event</code>, <code>Property</code>,
  /// <code>Mapping</code>, <code>Enum</code>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [deprecateExistingEntities] :
  /// A Boolean that specifies whether to deprecate all entities in the latest
  /// version before uploading the new <code>DefinitionDocument</code>. If set
  /// to <code>true</code>, the upload will create a new namespace version.
  ///
  /// Parameter [document] :
  /// The <code>DefinitionDocument</code> that defines the updated entities.
  ///
  /// Parameter [syncWithPublicNamespace] :
  /// A Boolean that specifies whether to synchronize with the latest version of
  /// the public namespace. If set to <code>true</code>, the upload will create
  /// a new namespace version.
  @Deprecated('since: 2022-08-30')
  Future<UploadEntityDefinitionsResponse> uploadEntityDefinitions({
    bool? deprecateExistingEntities,
    DefinitionDocument? document,
    bool? syncWithPublicNamespace,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IotThingsGraphFrontEndService.UploadEntityDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deprecateExistingEntities != null)
          'deprecateExistingEntities': deprecateExistingEntities,
        if (document != null) 'document': document,
        if (syncWithPublicNamespace != null)
          'syncWithPublicNamespace': syncWithPublicNamespace,
      },
    );

    return UploadEntityDefinitionsResponse.fromJson(jsonResponse.body);
  }
}

class AssociateEntityToThingResponse {
  AssociateEntityToThingResponse();

  factory AssociateEntityToThingResponse.fromJson(Map<String, dynamic> _) {
    return AssociateEntityToThingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateFlowTemplateResponse {
  /// The summary object that describes the created workflow.
  final FlowTemplateSummary? summary;

  CreateFlowTemplateResponse({
    this.summary,
  });

  factory CreateFlowTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateFlowTemplateResponse(
      summary: json['summary'] != null
          ? FlowTemplateSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    return {
      if (summary != null) 'summary': summary,
    };
  }
}

class CreateSystemInstanceResponse {
  /// The summary object that describes the new system instance.
  final SystemInstanceSummary? summary;

  CreateSystemInstanceResponse({
    this.summary,
  });

  factory CreateSystemInstanceResponse.fromJson(Map<String, dynamic> json) {
    return CreateSystemInstanceResponse(
      summary: json['summary'] != null
          ? SystemInstanceSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    return {
      if (summary != null) 'summary': summary,
    };
  }
}

class CreateSystemTemplateResponse {
  /// The summary object that describes the created system.
  final SystemTemplateSummary? summary;

  CreateSystemTemplateResponse({
    this.summary,
  });

  factory CreateSystemTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateSystemTemplateResponse(
      summary: json['summary'] != null
          ? SystemTemplateSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    return {
      if (summary != null) 'summary': summary,
    };
  }
}

/// A document that defines an entity.
class DefinitionDocument {
  /// The language used to define the entity. <code>GRAPHQL</code> is the only
  /// valid value.
  final DefinitionLanguage language;

  /// The GraphQL text that defines the entity.
  final String text;

  DefinitionDocument({
    required this.language,
    required this.text,
  });

  factory DefinitionDocument.fromJson(Map<String, dynamic> json) {
    return DefinitionDocument(
      language: (json['language'] as String).toDefinitionLanguage(),
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final language = this.language;
    final text = this.text;
    return {
      'language': language.toValue(),
      'text': text,
    };
  }
}

enum DefinitionLanguage {
  graphql,
}

extension DefinitionLanguageValueExtension on DefinitionLanguage {
  String toValue() {
    switch (this) {
      case DefinitionLanguage.graphql:
        return 'GRAPHQL';
    }
  }
}

extension DefinitionLanguageFromString on String {
  DefinitionLanguage toDefinitionLanguage() {
    switch (this) {
      case 'GRAPHQL':
        return DefinitionLanguage.graphql;
    }
    throw Exception('$this is not known in enum DefinitionLanguage');
  }
}

class DeleteFlowTemplateResponse {
  DeleteFlowTemplateResponse();

  factory DeleteFlowTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFlowTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteNamespaceResponse {
  /// The ARN of the namespace to be deleted.
  final String? namespaceArn;

  /// The name of the namespace to be deleted.
  final String? namespaceName;

  DeleteNamespaceResponse({
    this.namespaceArn,
    this.namespaceName,
  });

  factory DeleteNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNamespaceResponse(
      namespaceArn: json['namespaceArn'] as String?,
      namespaceName: json['namespaceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespaceArn = this.namespaceArn;
    final namespaceName = this.namespaceName;
    return {
      if (namespaceArn != null) 'namespaceArn': namespaceArn,
      if (namespaceName != null) 'namespaceName': namespaceName,
    };
  }
}

class DeleteSystemInstanceResponse {
  DeleteSystemInstanceResponse();

  factory DeleteSystemInstanceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSystemInstanceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSystemTemplateResponse {
  DeleteSystemTemplateResponse();

  factory DeleteSystemTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSystemTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object that contains the ID and revision number of a workflow or system
/// that is part of a deployment.
class DependencyRevision {
  /// The ID of the workflow or system.
  final String? id;

  /// The revision number of the workflow or system.
  final int? revisionNumber;

  DependencyRevision({
    this.id,
    this.revisionNumber,
  });

  factory DependencyRevision.fromJson(Map<String, dynamic> json) {
    return DependencyRevision(
      id: json['id'] as String?,
      revisionNumber: json['revisionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final revisionNumber = this.revisionNumber;
    return {
      if (id != null) 'id': id,
      if (revisionNumber != null) 'revisionNumber': revisionNumber,
    };
  }
}

class DeploySystemInstanceResponse {
  /// An object that contains summary information about a system instance that was
  /// deployed.
  final SystemInstanceSummary summary;

  /// The ID of the Greengrass deployment used to deploy the system instance.
  final String? greengrassDeploymentId;

  DeploySystemInstanceResponse({
    required this.summary,
    this.greengrassDeploymentId,
  });

  factory DeploySystemInstanceResponse.fromJson(Map<String, dynamic> json) {
    return DeploySystemInstanceResponse(
      summary: SystemInstanceSummary.fromJson(
          json['summary'] as Map<String, dynamic>),
      greengrassDeploymentId: json['greengrassDeploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    final greengrassDeploymentId = this.greengrassDeploymentId;
    return {
      'summary': summary,
      if (greengrassDeploymentId != null)
        'greengrassDeploymentId': greengrassDeploymentId,
    };
  }
}

enum DeploymentTarget {
  greengrass,
  cloud,
}

extension DeploymentTargetValueExtension on DeploymentTarget {
  String toValue() {
    switch (this) {
      case DeploymentTarget.greengrass:
        return 'GREENGRASS';
      case DeploymentTarget.cloud:
        return 'CLOUD';
    }
  }
}

extension DeploymentTargetFromString on String {
  DeploymentTarget toDeploymentTarget() {
    switch (this) {
      case 'GREENGRASS':
        return DeploymentTarget.greengrass;
      case 'CLOUD':
        return DeploymentTarget.cloud;
    }
    throw Exception('$this is not known in enum DeploymentTarget');
  }
}

class DeprecateFlowTemplateResponse {
  DeprecateFlowTemplateResponse();

  factory DeprecateFlowTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeprecateFlowTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeprecateSystemTemplateResponse {
  DeprecateSystemTemplateResponse();

  factory DeprecateSystemTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeprecateSystemTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeNamespaceResponse {
  /// The ARN of the namespace.
  final String? namespaceArn;

  /// The name of the namespace.
  final String? namespaceName;

  /// The version of the user's namespace to describe.
  final int? namespaceVersion;

  /// The name of the public namespace that the latest namespace version is
  /// tracking.
  final String? trackingNamespaceName;

  /// The version of the public namespace that the latest version is tracking.
  final int? trackingNamespaceVersion;

  DescribeNamespaceResponse({
    this.namespaceArn,
    this.namespaceName,
    this.namespaceVersion,
    this.trackingNamespaceName,
    this.trackingNamespaceVersion,
  });

  factory DescribeNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeNamespaceResponse(
      namespaceArn: json['namespaceArn'] as String?,
      namespaceName: json['namespaceName'] as String?,
      namespaceVersion: json['namespaceVersion'] as int?,
      trackingNamespaceName: json['trackingNamespaceName'] as String?,
      trackingNamespaceVersion: json['trackingNamespaceVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespaceArn = this.namespaceArn;
    final namespaceName = this.namespaceName;
    final namespaceVersion = this.namespaceVersion;
    final trackingNamespaceName = this.trackingNamespaceName;
    final trackingNamespaceVersion = this.trackingNamespaceVersion;
    return {
      if (namespaceArn != null) 'namespaceArn': namespaceArn,
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (namespaceVersion != null) 'namespaceVersion': namespaceVersion,
      if (trackingNamespaceName != null)
        'trackingNamespaceName': trackingNamespaceName,
      if (trackingNamespaceVersion != null)
        'trackingNamespaceVersion': trackingNamespaceVersion,
    };
  }
}

class DissociateEntityFromThingResponse {
  DissociateEntityFromThingResponse();

  factory DissociateEntityFromThingResponse.fromJson(Map<String, dynamic> _) {
    return DissociateEntityFromThingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the properties of an entity.
class EntityDescription {
  /// The entity ARN.
  final String? arn;

  /// The time at which the entity was created.
  final DateTime? createdAt;

  /// The definition document of the entity.
  final DefinitionDocument? definition;

  /// The entity ID.
  final String? id;

  /// The entity type.
  final EntityType? type;

  EntityDescription({
    this.arn,
    this.createdAt,
    this.definition,
    this.id,
    this.type,
  });

  factory EntityDescription.fromJson(Map<String, dynamic> json) {
    return EntityDescription(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      definition: json['definition'] != null
          ? DefinitionDocument.fromJson(
              json['definition'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      type: (json['type'] as String?)?.toEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final definition = this.definition;
    final id = this.id;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (definition != null) 'definition': definition,
      if (id != null) 'id': id,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// An object that filters an entity search. Multiple filters function as OR
/// criteria in the search. For example a search that includes a
/// <code>NAMESPACE</code> and a <code>REFERENCED_ENTITY_ID</code> filter
/// searches for entities in the specified namespace that use the entity
/// specified by the value of <code>REFERENCED_ENTITY_ID</code>.
class EntityFilter {
  /// The name of the entity search filter field.
  /// <code>REFERENCED_ENTITY_ID</code> filters on entities that are used by the
  /// entity in the result set. For example, you can filter on the ID of a
  /// property that is used in a state.
  final EntityFilterName? name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  final List<String>? value;

  EntityFilter({
    this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum EntityFilterName {
  name,
  namespace,
  semanticTypePath,
  referencedEntityId,
}

extension EntityFilterNameValueExtension on EntityFilterName {
  String toValue() {
    switch (this) {
      case EntityFilterName.name:
        return 'NAME';
      case EntityFilterName.namespace:
        return 'NAMESPACE';
      case EntityFilterName.semanticTypePath:
        return 'SEMANTIC_TYPE_PATH';
      case EntityFilterName.referencedEntityId:
        return 'REFERENCED_ENTITY_ID';
    }
  }
}

extension EntityFilterNameFromString on String {
  EntityFilterName toEntityFilterName() {
    switch (this) {
      case 'NAME':
        return EntityFilterName.name;
      case 'NAMESPACE':
        return EntityFilterName.namespace;
      case 'SEMANTIC_TYPE_PATH':
        return EntityFilterName.semanticTypePath;
      case 'REFERENCED_ENTITY_ID':
        return EntityFilterName.referencedEntityId;
    }
    throw Exception('$this is not known in enum EntityFilterName');
  }
}

enum EntityType {
  device,
  service,
  deviceModel,
  capability,
  state,
  action,
  event,
  property,
  mapping,
  $enum,
}

extension EntityTypeValueExtension on EntityType {
  String toValue() {
    switch (this) {
      case EntityType.device:
        return 'DEVICE';
      case EntityType.service:
        return 'SERVICE';
      case EntityType.deviceModel:
        return 'DEVICE_MODEL';
      case EntityType.capability:
        return 'CAPABILITY';
      case EntityType.state:
        return 'STATE';
      case EntityType.action:
        return 'ACTION';
      case EntityType.event:
        return 'EVENT';
      case EntityType.property:
        return 'PROPERTY';
      case EntityType.mapping:
        return 'MAPPING';
      case EntityType.$enum:
        return 'ENUM';
    }
  }
}

extension EntityTypeFromString on String {
  EntityType toEntityType() {
    switch (this) {
      case 'DEVICE':
        return EntityType.device;
      case 'SERVICE':
        return EntityType.service;
      case 'DEVICE_MODEL':
        return EntityType.deviceModel;
      case 'CAPABILITY':
        return EntityType.capability;
      case 'STATE':
        return EntityType.state;
      case 'ACTION':
        return EntityType.action;
      case 'EVENT':
        return EntityType.event;
      case 'PROPERTY':
        return EntityType.property;
      case 'MAPPING':
        return EntityType.mapping;
      case 'ENUM':
        return EntityType.$enum;
    }
    throw Exception('$this is not known in enum EntityType');
  }
}

enum FlowExecutionEventType {
  executionStarted,
  executionFailed,
  executionAborted,
  executionSucceeded,
  stepStarted,
  stepFailed,
  stepSucceeded,
  activityScheduled,
  activityStarted,
  activityFailed,
  activitySucceeded,
  startFlowExecutionTask,
  scheduleNextReadyStepsTask,
  thingActionTask,
  thingActionTaskFailed,
  thingActionTaskSucceeded,
  acknowledgeTaskMessage,
}

extension FlowExecutionEventTypeValueExtension on FlowExecutionEventType {
  String toValue() {
    switch (this) {
      case FlowExecutionEventType.executionStarted:
        return 'EXECUTION_STARTED';
      case FlowExecutionEventType.executionFailed:
        return 'EXECUTION_FAILED';
      case FlowExecutionEventType.executionAborted:
        return 'EXECUTION_ABORTED';
      case FlowExecutionEventType.executionSucceeded:
        return 'EXECUTION_SUCCEEDED';
      case FlowExecutionEventType.stepStarted:
        return 'STEP_STARTED';
      case FlowExecutionEventType.stepFailed:
        return 'STEP_FAILED';
      case FlowExecutionEventType.stepSucceeded:
        return 'STEP_SUCCEEDED';
      case FlowExecutionEventType.activityScheduled:
        return 'ACTIVITY_SCHEDULED';
      case FlowExecutionEventType.activityStarted:
        return 'ACTIVITY_STARTED';
      case FlowExecutionEventType.activityFailed:
        return 'ACTIVITY_FAILED';
      case FlowExecutionEventType.activitySucceeded:
        return 'ACTIVITY_SUCCEEDED';
      case FlowExecutionEventType.startFlowExecutionTask:
        return 'START_FLOW_EXECUTION_TASK';
      case FlowExecutionEventType.scheduleNextReadyStepsTask:
        return 'SCHEDULE_NEXT_READY_STEPS_TASK';
      case FlowExecutionEventType.thingActionTask:
        return 'THING_ACTION_TASK';
      case FlowExecutionEventType.thingActionTaskFailed:
        return 'THING_ACTION_TASK_FAILED';
      case FlowExecutionEventType.thingActionTaskSucceeded:
        return 'THING_ACTION_TASK_SUCCEEDED';
      case FlowExecutionEventType.acknowledgeTaskMessage:
        return 'ACKNOWLEDGE_TASK_MESSAGE';
    }
  }
}

extension FlowExecutionEventTypeFromString on String {
  FlowExecutionEventType toFlowExecutionEventType() {
    switch (this) {
      case 'EXECUTION_STARTED':
        return FlowExecutionEventType.executionStarted;
      case 'EXECUTION_FAILED':
        return FlowExecutionEventType.executionFailed;
      case 'EXECUTION_ABORTED':
        return FlowExecutionEventType.executionAborted;
      case 'EXECUTION_SUCCEEDED':
        return FlowExecutionEventType.executionSucceeded;
      case 'STEP_STARTED':
        return FlowExecutionEventType.stepStarted;
      case 'STEP_FAILED':
        return FlowExecutionEventType.stepFailed;
      case 'STEP_SUCCEEDED':
        return FlowExecutionEventType.stepSucceeded;
      case 'ACTIVITY_SCHEDULED':
        return FlowExecutionEventType.activityScheduled;
      case 'ACTIVITY_STARTED':
        return FlowExecutionEventType.activityStarted;
      case 'ACTIVITY_FAILED':
        return FlowExecutionEventType.activityFailed;
      case 'ACTIVITY_SUCCEEDED':
        return FlowExecutionEventType.activitySucceeded;
      case 'START_FLOW_EXECUTION_TASK':
        return FlowExecutionEventType.startFlowExecutionTask;
      case 'SCHEDULE_NEXT_READY_STEPS_TASK':
        return FlowExecutionEventType.scheduleNextReadyStepsTask;
      case 'THING_ACTION_TASK':
        return FlowExecutionEventType.thingActionTask;
      case 'THING_ACTION_TASK_FAILED':
        return FlowExecutionEventType.thingActionTaskFailed;
      case 'THING_ACTION_TASK_SUCCEEDED':
        return FlowExecutionEventType.thingActionTaskSucceeded;
      case 'ACKNOWLEDGE_TASK_MESSAGE':
        return FlowExecutionEventType.acknowledgeTaskMessage;
    }
    throw Exception('$this is not known in enum FlowExecutionEventType');
  }
}

/// An object that contains information about a flow event.
class FlowExecutionMessage {
  /// The type of flow event .
  final FlowExecutionEventType? eventType;

  /// The unique identifier of the message.
  final String? messageId;

  /// A string containing information about the flow event.
  final String? payload;

  /// The date and time when the message was last updated.
  final DateTime? timestamp;

  FlowExecutionMessage({
    this.eventType,
    this.messageId,
    this.payload,
    this.timestamp,
  });

  factory FlowExecutionMessage.fromJson(Map<String, dynamic> json) {
    return FlowExecutionMessage(
      eventType: (json['eventType'] as String?)?.toFlowExecutionEventType(),
      messageId: json['messageId'] as String?,
      payload: json['payload'] as String?,
      timestamp: timeStampFromJson(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final messageId = this.messageId;
    final payload = this.payload;
    final timestamp = this.timestamp;
    return {
      if (eventType != null) 'eventType': eventType.toValue(),
      if (messageId != null) 'messageId': messageId,
      if (payload != null) 'payload': payload,
      if (timestamp != null) 'timestamp': unixTimestampToJson(timestamp),
    };
  }
}

enum FlowExecutionStatus {
  running,
  aborted,
  succeeded,
  failed,
}

extension FlowExecutionStatusValueExtension on FlowExecutionStatus {
  String toValue() {
    switch (this) {
      case FlowExecutionStatus.running:
        return 'RUNNING';
      case FlowExecutionStatus.aborted:
        return 'ABORTED';
      case FlowExecutionStatus.succeeded:
        return 'SUCCEEDED';
      case FlowExecutionStatus.failed:
        return 'FAILED';
    }
  }
}

extension FlowExecutionStatusFromString on String {
  FlowExecutionStatus toFlowExecutionStatus() {
    switch (this) {
      case 'RUNNING':
        return FlowExecutionStatus.running;
      case 'ABORTED':
        return FlowExecutionStatus.aborted;
      case 'SUCCEEDED':
        return FlowExecutionStatus.succeeded;
      case 'FAILED':
        return FlowExecutionStatus.failed;
    }
    throw Exception('$this is not known in enum FlowExecutionStatus');
  }
}

/// An object that contains summary information about a flow execution.
class FlowExecutionSummary {
  /// The date and time when the flow execution summary was created.
  final DateTime? createdAt;

  /// The ID of the flow execution.
  final String? flowExecutionId;

  /// The ID of the flow.
  final String? flowTemplateId;

  /// The current status of the flow execution.
  final FlowExecutionStatus? status;

  /// The ID of the system instance that contains the flow.
  final String? systemInstanceId;

  /// The date and time when the flow execution summary was last updated.
  final DateTime? updatedAt;

  FlowExecutionSummary({
    this.createdAt,
    this.flowExecutionId,
    this.flowTemplateId,
    this.status,
    this.systemInstanceId,
    this.updatedAt,
  });

  factory FlowExecutionSummary.fromJson(Map<String, dynamic> json) {
    return FlowExecutionSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      flowExecutionId: json['flowExecutionId'] as String?,
      flowTemplateId: json['flowTemplateId'] as String?,
      status: (json['status'] as String?)?.toFlowExecutionStatus(),
      systemInstanceId: json['systemInstanceId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final flowExecutionId = this.flowExecutionId;
    final flowTemplateId = this.flowTemplateId;
    final status = this.status;
    final systemInstanceId = this.systemInstanceId;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (flowExecutionId != null) 'flowExecutionId': flowExecutionId,
      if (flowTemplateId != null) 'flowTemplateId': flowTemplateId,
      if (status != null) 'status': status.toValue(),
      if (systemInstanceId != null) 'systemInstanceId': systemInstanceId,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// An object that contains a workflow's definition and summary information.
class FlowTemplateDescription {
  /// A workflow's definition document.
  final DefinitionDocument? definition;

  /// An object that contains summary information about a workflow.
  final FlowTemplateSummary? summary;

  /// The version of the user's namespace against which the workflow was
  /// validated. Use this value in your system instance.
  final int? validatedNamespaceVersion;

  FlowTemplateDescription({
    this.definition,
    this.summary,
    this.validatedNamespaceVersion,
  });

  factory FlowTemplateDescription.fromJson(Map<String, dynamic> json) {
    return FlowTemplateDescription(
      definition: json['definition'] != null
          ? DefinitionDocument.fromJson(
              json['definition'] as Map<String, dynamic>)
          : null,
      summary: json['summary'] != null
          ? FlowTemplateSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
      validatedNamespaceVersion: json['validatedNamespaceVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final summary = this.summary;
    final validatedNamespaceVersion = this.validatedNamespaceVersion;
    return {
      if (definition != null) 'definition': definition,
      if (summary != null) 'summary': summary,
      if (validatedNamespaceVersion != null)
        'validatedNamespaceVersion': validatedNamespaceVersion,
    };
  }
}

/// An object that filters a workflow search.
class FlowTemplateFilter {
  /// The name of the search filter field.
  final FlowTemplateFilterName name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  final List<String> value;

  FlowTemplateFilter({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name.toValue(),
      'value': value,
    };
  }
}

enum FlowTemplateFilterName {
  deviceModelId,
}

extension FlowTemplateFilterNameValueExtension on FlowTemplateFilterName {
  String toValue() {
    switch (this) {
      case FlowTemplateFilterName.deviceModelId:
        return 'DEVICE_MODEL_ID';
    }
  }
}

extension FlowTemplateFilterNameFromString on String {
  FlowTemplateFilterName toFlowTemplateFilterName() {
    switch (this) {
      case 'DEVICE_MODEL_ID':
        return FlowTemplateFilterName.deviceModelId;
    }
    throw Exception('$this is not known in enum FlowTemplateFilterName');
  }
}

/// An object that contains summary information about a workflow.
class FlowTemplateSummary {
  /// The ARN of the workflow.
  final String? arn;

  /// The date when the workflow was created.
  final DateTime? createdAt;

  /// The ID of the workflow.
  final String? id;

  /// The revision number of the workflow.
  final int? revisionNumber;

  FlowTemplateSummary({
    this.arn,
    this.createdAt,
    this.id,
    this.revisionNumber,
  });

  factory FlowTemplateSummary.fromJson(Map<String, dynamic> json) {
    return FlowTemplateSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      revisionNumber: json['revisionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final revisionNumber = this.revisionNumber;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (id != null) 'id': id,
      if (revisionNumber != null) 'revisionNumber': revisionNumber,
    };
  }
}

class GetEntitiesResponse {
  /// An array of descriptions for the specified entities.
  final List<EntityDescription>? descriptions;

  GetEntitiesResponse({
    this.descriptions,
  });

  factory GetEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return GetEntitiesResponse(
      descriptions: (json['descriptions'] as List?)
          ?.whereNotNull()
          .map((e) => EntityDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final descriptions = this.descriptions;
    return {
      if (descriptions != null) 'descriptions': descriptions,
    };
  }
}

class GetFlowTemplateResponse {
  /// The object that describes the specified workflow.
  final FlowTemplateDescription? description;

  GetFlowTemplateResponse({
    this.description,
  });

  factory GetFlowTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetFlowTemplateResponse(
      description: json['description'] != null
          ? FlowTemplateDescription.fromJson(
              json['description'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    return {
      if (description != null) 'description': description,
    };
  }
}

class GetFlowTemplateRevisionsResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  final String? nextToken;

  /// An array of objects that provide summary data about each revision.
  final List<FlowTemplateSummary>? summaries;

  GetFlowTemplateRevisionsResponse({
    this.nextToken,
    this.summaries,
  });

  factory GetFlowTemplateRevisionsResponse.fromJson(Map<String, dynamic> json) {
    return GetFlowTemplateRevisionsResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.whereNotNull()
          .map((e) => FlowTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (summaries != null) 'summaries': summaries,
    };
  }
}

class GetNamespaceDeletionStatusResponse {
  /// An error code returned by the namespace deletion task.
  final NamespaceDeletionStatusErrorCodes? errorCode;

  /// An error code returned by the namespace deletion task.
  final String? errorMessage;

  /// The ARN of the namespace that is being deleted.
  final String? namespaceArn;

  /// The name of the namespace that is being deleted.
  final String? namespaceName;

  /// The status of the deletion request.
  final NamespaceDeletionStatus? status;

  GetNamespaceDeletionStatusResponse({
    this.errorCode,
    this.errorMessage,
    this.namespaceArn,
    this.namespaceName,
    this.status,
  });

  factory GetNamespaceDeletionStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetNamespaceDeletionStatusResponse(
      errorCode:
          (json['errorCode'] as String?)?.toNamespaceDeletionStatusErrorCodes(),
      errorMessage: json['errorMessage'] as String?,
      namespaceArn: json['namespaceArn'] as String?,
      namespaceName: json['namespaceName'] as String?,
      status: (json['status'] as String?)?.toNamespaceDeletionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final namespaceArn = this.namespaceArn;
    final namespaceName = this.namespaceName;
    final status = this.status;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (namespaceArn != null) 'namespaceArn': namespaceArn,
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetSystemInstanceResponse {
  /// An object that describes the system instance.
  final SystemInstanceDescription? description;

  GetSystemInstanceResponse({
    this.description,
  });

  factory GetSystemInstanceResponse.fromJson(Map<String, dynamic> json) {
    return GetSystemInstanceResponse(
      description: json['description'] != null
          ? SystemInstanceDescription.fromJson(
              json['description'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    return {
      if (description != null) 'description': description,
    };
  }
}

class GetSystemTemplateResponse {
  /// An object that contains summary data about the system.
  final SystemTemplateDescription? description;

  GetSystemTemplateResponse({
    this.description,
  });

  factory GetSystemTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetSystemTemplateResponse(
      description: json['description'] != null
          ? SystemTemplateDescription.fromJson(
              json['description'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    return {
      if (description != null) 'description': description,
    };
  }
}

class GetSystemTemplateRevisionsResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  final String? nextToken;

  /// An array of objects that contain summary data about the system template
  /// revisions.
  final List<SystemTemplateSummary>? summaries;

  GetSystemTemplateRevisionsResponse({
    this.nextToken,
    this.summaries,
  });

  factory GetSystemTemplateRevisionsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSystemTemplateRevisionsResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.whereNotNull()
          .map((e) => SystemTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (summaries != null) 'summaries': summaries,
    };
  }
}

class GetUploadStatusResponse {
  /// The date at which the upload was created.
  final DateTime createdDate;

  /// The ID of the upload.
  final String uploadId;

  /// The status of the upload. The initial status is <code>IN_PROGRESS</code>.
  /// The response show all validation failures if the upload fails.
  final UploadStatus uploadStatus;

  /// The reason for an upload failure.
  final List<String>? failureReason;

  /// The ARN of the upload.
  final String? namespaceArn;

  /// The name of the upload's namespace.
  final String? namespaceName;

  /// The version of the user's namespace. Defaults to the latest version of the
  /// user's namespace.
  final int? namespaceVersion;

  GetUploadStatusResponse({
    required this.createdDate,
    required this.uploadId,
    required this.uploadStatus,
    this.failureReason,
    this.namespaceArn,
    this.namespaceName,
    this.namespaceVersion,
  });

  factory GetUploadStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetUploadStatusResponse(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      uploadId: json['uploadId'] as String,
      uploadStatus: (json['uploadStatus'] as String).toUploadStatus(),
      failureReason: (json['failureReason'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      namespaceArn: json['namespaceArn'] as String?,
      namespaceName: json['namespaceName'] as String?,
      namespaceVersion: json['namespaceVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final uploadId = this.uploadId;
    final uploadStatus = this.uploadStatus;
    final failureReason = this.failureReason;
    final namespaceArn = this.namespaceArn;
    final namespaceName = this.namespaceName;
    final namespaceVersion = this.namespaceVersion;
    return {
      'createdDate': unixTimestampToJson(createdDate),
      'uploadId': uploadId,
      'uploadStatus': uploadStatus.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (namespaceArn != null) 'namespaceArn': namespaceArn,
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (namespaceVersion != null) 'namespaceVersion': namespaceVersion,
    };
  }
}

class ListFlowExecutionMessagesResponse {
  /// A list of objects that contain information about events in the specified
  /// flow execution.
  final List<FlowExecutionMessage>? messages;

  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  final String? nextToken;

  ListFlowExecutionMessagesResponse({
    this.messages,
    this.nextToken,
  });

  factory ListFlowExecutionMessagesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFlowExecutionMessagesResponse(
      messages: (json['messages'] as List?)
          ?.whereNotNull()
          .map((e) => FlowExecutionMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messages = this.messages;
    final nextToken = this.nextToken;
    return {
      if (messages != null) 'messages': messages,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The token that specifies the next page of results to return.
  final String? nextToken;

  /// List of tags returned by the <code>ListTagsForResource</code> operation.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tags != null) 'tags': tags,
    };
  }
}

/// An object that specifies whether cloud metrics are collected in a deployment
/// and, if so, what role is used to collect metrics.
class MetricsConfiguration {
  /// A Boolean that specifies whether cloud metrics are collected.
  final bool? cloudMetricEnabled;

  /// The ARN of the role that is used to collect cloud metrics.
  final String? metricRuleRoleArn;

  MetricsConfiguration({
    this.cloudMetricEnabled,
    this.metricRuleRoleArn,
  });

  factory MetricsConfiguration.fromJson(Map<String, dynamic> json) {
    return MetricsConfiguration(
      cloudMetricEnabled: json['cloudMetricEnabled'] as bool?,
      metricRuleRoleArn: json['metricRuleRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudMetricEnabled = this.cloudMetricEnabled;
    final metricRuleRoleArn = this.metricRuleRoleArn;
    return {
      if (cloudMetricEnabled != null) 'cloudMetricEnabled': cloudMetricEnabled,
      if (metricRuleRoleArn != null) 'metricRuleRoleArn': metricRuleRoleArn,
    };
  }
}

enum NamespaceDeletionStatus {
  inProgress,
  succeeded,
  failed,
}

extension NamespaceDeletionStatusValueExtension on NamespaceDeletionStatus {
  String toValue() {
    switch (this) {
      case NamespaceDeletionStatus.inProgress:
        return 'IN_PROGRESS';
      case NamespaceDeletionStatus.succeeded:
        return 'SUCCEEDED';
      case NamespaceDeletionStatus.failed:
        return 'FAILED';
    }
  }
}

extension NamespaceDeletionStatusFromString on String {
  NamespaceDeletionStatus toNamespaceDeletionStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return NamespaceDeletionStatus.inProgress;
      case 'SUCCEEDED':
        return NamespaceDeletionStatus.succeeded;
      case 'FAILED':
        return NamespaceDeletionStatus.failed;
    }
    throw Exception('$this is not known in enum NamespaceDeletionStatus');
  }
}

enum NamespaceDeletionStatusErrorCodes {
  validationFailed,
}

extension NamespaceDeletionStatusErrorCodesValueExtension
    on NamespaceDeletionStatusErrorCodes {
  String toValue() {
    switch (this) {
      case NamespaceDeletionStatusErrorCodes.validationFailed:
        return 'VALIDATION_FAILED';
    }
  }
}

extension NamespaceDeletionStatusErrorCodesFromString on String {
  NamespaceDeletionStatusErrorCodes toNamespaceDeletionStatusErrorCodes() {
    switch (this) {
      case 'VALIDATION_FAILED':
        return NamespaceDeletionStatusErrorCodes.validationFailed;
    }
    throw Exception(
        '$this is not known in enum NamespaceDeletionStatusErrorCodes');
  }
}

class SearchEntitiesResponse {
  /// An array of descriptions for each entity returned in the search result.
  final List<EntityDescription>? descriptions;

  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  final String? nextToken;

  SearchEntitiesResponse({
    this.descriptions,
    this.nextToken,
  });

  factory SearchEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return SearchEntitiesResponse(
      descriptions: (json['descriptions'] as List?)
          ?.whereNotNull()
          .map((e) => EntityDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final descriptions = this.descriptions;
    final nextToken = this.nextToken;
    return {
      if (descriptions != null) 'descriptions': descriptions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class SearchFlowExecutionsResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  final String? nextToken;

  /// An array of objects that contain summary information about each workflow
  /// execution in the result set.
  final List<FlowExecutionSummary>? summaries;

  SearchFlowExecutionsResponse({
    this.nextToken,
    this.summaries,
  });

  factory SearchFlowExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return SearchFlowExecutionsResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.whereNotNull()
          .map((e) => FlowExecutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (summaries != null) 'summaries': summaries,
    };
  }
}

class SearchFlowTemplatesResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  final String? nextToken;

  /// An array of objects that contain summary information about each workflow in
  /// the result set.
  final List<FlowTemplateSummary>? summaries;

  SearchFlowTemplatesResponse({
    this.nextToken,
    this.summaries,
  });

  factory SearchFlowTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return SearchFlowTemplatesResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.whereNotNull()
          .map((e) => FlowTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (summaries != null) 'summaries': summaries,
    };
  }
}

class SearchSystemInstancesResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  final String? nextToken;

  /// An array of objects that contain summary data abour the system instances in
  /// the result set.
  final List<SystemInstanceSummary>? summaries;

  SearchSystemInstancesResponse({
    this.nextToken,
    this.summaries,
  });

  factory SearchSystemInstancesResponse.fromJson(Map<String, dynamic> json) {
    return SearchSystemInstancesResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.whereNotNull()
          .map((e) => SystemInstanceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (summaries != null) 'summaries': summaries,
    };
  }
}

class SearchSystemTemplatesResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  final String? nextToken;

  /// An array of objects that contain summary information about each system
  /// deployment in the result set.
  final List<SystemTemplateSummary>? summaries;

  SearchSystemTemplatesResponse({
    this.nextToken,
    this.summaries,
  });

  factory SearchSystemTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return SearchSystemTemplatesResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.whereNotNull()
          .map((e) => SystemTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (summaries != null) 'summaries': summaries,
    };
  }
}

class SearchThingsResponse {
  /// The string to specify as <code>nextToken</code> when you request the next
  /// page of results.
  final String? nextToken;

  /// An array of things in the result set.
  final List<Thing>? things;

  SearchThingsResponse({
    this.nextToken,
    this.things,
  });

  factory SearchThingsResponse.fromJson(Map<String, dynamic> json) {
    return SearchThingsResponse(
      nextToken: json['nextToken'] as String?,
      things: (json['things'] as List?)
          ?.whereNotNull()
          .map((e) => Thing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final things = this.things;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (things != null) 'things': things,
    };
  }
}

enum SystemInstanceDeploymentStatus {
  notDeployed,
  bootstrap,
  deployInProgress,
  deployedInTarget,
  undeployInProgress,
  failed,
  pendingDelete,
  deletedInTarget,
}

extension SystemInstanceDeploymentStatusValueExtension
    on SystemInstanceDeploymentStatus {
  String toValue() {
    switch (this) {
      case SystemInstanceDeploymentStatus.notDeployed:
        return 'NOT_DEPLOYED';
      case SystemInstanceDeploymentStatus.bootstrap:
        return 'BOOTSTRAP';
      case SystemInstanceDeploymentStatus.deployInProgress:
        return 'DEPLOY_IN_PROGRESS';
      case SystemInstanceDeploymentStatus.deployedInTarget:
        return 'DEPLOYED_IN_TARGET';
      case SystemInstanceDeploymentStatus.undeployInProgress:
        return 'UNDEPLOY_IN_PROGRESS';
      case SystemInstanceDeploymentStatus.failed:
        return 'FAILED';
      case SystemInstanceDeploymentStatus.pendingDelete:
        return 'PENDING_DELETE';
      case SystemInstanceDeploymentStatus.deletedInTarget:
        return 'DELETED_IN_TARGET';
    }
  }
}

extension SystemInstanceDeploymentStatusFromString on String {
  SystemInstanceDeploymentStatus toSystemInstanceDeploymentStatus() {
    switch (this) {
      case 'NOT_DEPLOYED':
        return SystemInstanceDeploymentStatus.notDeployed;
      case 'BOOTSTRAP':
        return SystemInstanceDeploymentStatus.bootstrap;
      case 'DEPLOY_IN_PROGRESS':
        return SystemInstanceDeploymentStatus.deployInProgress;
      case 'DEPLOYED_IN_TARGET':
        return SystemInstanceDeploymentStatus.deployedInTarget;
      case 'UNDEPLOY_IN_PROGRESS':
        return SystemInstanceDeploymentStatus.undeployInProgress;
      case 'FAILED':
        return SystemInstanceDeploymentStatus.failed;
      case 'PENDING_DELETE':
        return SystemInstanceDeploymentStatus.pendingDelete;
      case 'DELETED_IN_TARGET':
        return SystemInstanceDeploymentStatus.deletedInTarget;
    }
    throw Exception(
        '$this is not known in enum SystemInstanceDeploymentStatus');
  }
}

/// An object that contains a system instance definition and summary
/// information.
class SystemInstanceDescription {
  final DefinitionDocument? definition;

  /// The AWS Identity and Access Management (IAM) role that AWS IoT Things Graph
  /// assumes during flow execution in a cloud deployment. This role must have
  /// read and write permissionss to AWS Lambda and AWS IoT and to any other AWS
  /// services that the flow uses.
  final String? flowActionsRoleArn;
  final MetricsConfiguration? metricsConfiguration;

  /// The Amazon Simple Storage Service bucket where information about a system
  /// instance is stored.
  final String? s3BucketName;

  /// An object that contains summary information about a system instance.
  final SystemInstanceSummary? summary;

  /// A list of objects that contain all of the IDs and revision numbers of
  /// workflows and systems that are used in a system instance.
  final List<DependencyRevision>? validatedDependencyRevisions;

  /// The version of the user's namespace against which the system instance was
  /// validated.
  final int? validatedNamespaceVersion;

  SystemInstanceDescription({
    this.definition,
    this.flowActionsRoleArn,
    this.metricsConfiguration,
    this.s3BucketName,
    this.summary,
    this.validatedDependencyRevisions,
    this.validatedNamespaceVersion,
  });

  factory SystemInstanceDescription.fromJson(Map<String, dynamic> json) {
    return SystemInstanceDescription(
      definition: json['definition'] != null
          ? DefinitionDocument.fromJson(
              json['definition'] as Map<String, dynamic>)
          : null,
      flowActionsRoleArn: json['flowActionsRoleArn'] as String?,
      metricsConfiguration: json['metricsConfiguration'] != null
          ? MetricsConfiguration.fromJson(
              json['metricsConfiguration'] as Map<String, dynamic>)
          : null,
      s3BucketName: json['s3BucketName'] as String?,
      summary: json['summary'] != null
          ? SystemInstanceSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
      validatedDependencyRevisions: (json['validatedDependencyRevisions']
              as List?)
          ?.whereNotNull()
          .map((e) => DependencyRevision.fromJson(e as Map<String, dynamic>))
          .toList(),
      validatedNamespaceVersion: json['validatedNamespaceVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final flowActionsRoleArn = this.flowActionsRoleArn;
    final metricsConfiguration = this.metricsConfiguration;
    final s3BucketName = this.s3BucketName;
    final summary = this.summary;
    final validatedDependencyRevisions = this.validatedDependencyRevisions;
    final validatedNamespaceVersion = this.validatedNamespaceVersion;
    return {
      if (definition != null) 'definition': definition,
      if (flowActionsRoleArn != null) 'flowActionsRoleArn': flowActionsRoleArn,
      if (metricsConfiguration != null)
        'metricsConfiguration': metricsConfiguration,
      if (s3BucketName != null) 's3BucketName': s3BucketName,
      if (summary != null) 'summary': summary,
      if (validatedDependencyRevisions != null)
        'validatedDependencyRevisions': validatedDependencyRevisions,
      if (validatedNamespaceVersion != null)
        'validatedNamespaceVersion': validatedNamespaceVersion,
    };
  }
}

/// An object that filters a system instance search. Multiple filters function
/// as OR criteria in the search. For example a search that includes a
/// GREENGRASS_GROUP_NAME and a STATUS filter searches for system instances in
/// the specified Greengrass group that have the specified status.
class SystemInstanceFilter {
  /// The name of the search filter field.
  final SystemInstanceFilterName? name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  final List<String>? value;

  SystemInstanceFilter({
    this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum SystemInstanceFilterName {
  systemTemplateId,
  status,
  greengrassGroupName,
}

extension SystemInstanceFilterNameValueExtension on SystemInstanceFilterName {
  String toValue() {
    switch (this) {
      case SystemInstanceFilterName.systemTemplateId:
        return 'SYSTEM_TEMPLATE_ID';
      case SystemInstanceFilterName.status:
        return 'STATUS';
      case SystemInstanceFilterName.greengrassGroupName:
        return 'GREENGRASS_GROUP_NAME';
    }
  }
}

extension SystemInstanceFilterNameFromString on String {
  SystemInstanceFilterName toSystemInstanceFilterName() {
    switch (this) {
      case 'SYSTEM_TEMPLATE_ID':
        return SystemInstanceFilterName.systemTemplateId;
      case 'STATUS':
        return SystemInstanceFilterName.status;
      case 'GREENGRASS_GROUP_NAME':
        return SystemInstanceFilterName.greengrassGroupName;
    }
    throw Exception('$this is not known in enum SystemInstanceFilterName');
  }
}

/// An object that contains summary information about a system instance.
class SystemInstanceSummary {
  /// The ARN of the system instance.
  final String? arn;

  /// The date when the system instance was created.
  final DateTime? createdAt;

  /// The ID of the Greengrass group where the system instance is deployed.
  final String? greengrassGroupId;

  /// The ID of the Greengrass group where the system instance is deployed.
  final String? greengrassGroupName;

  /// The version of the Greengrass group where the system instance is deployed.
  final String? greengrassGroupVersionId;

  /// The ID of the system instance.
  final String? id;

  /// The status of the system instance.
  final SystemInstanceDeploymentStatus? status;

  /// The target of the system instance.
  final DeploymentTarget? target;

  /// The date and time when the system instance was last updated.
  final DateTime? updatedAt;

  SystemInstanceSummary({
    this.arn,
    this.createdAt,
    this.greengrassGroupId,
    this.greengrassGroupName,
    this.greengrassGroupVersionId,
    this.id,
    this.status,
    this.target,
    this.updatedAt,
  });

  factory SystemInstanceSummary.fromJson(Map<String, dynamic> json) {
    return SystemInstanceSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      greengrassGroupId: json['greengrassGroupId'] as String?,
      greengrassGroupName: json['greengrassGroupName'] as String?,
      greengrassGroupVersionId: json['greengrassGroupVersionId'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toSystemInstanceDeploymentStatus(),
      target: (json['target'] as String?)?.toDeploymentTarget(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final greengrassGroupId = this.greengrassGroupId;
    final greengrassGroupName = this.greengrassGroupName;
    final greengrassGroupVersionId = this.greengrassGroupVersionId;
    final id = this.id;
    final status = this.status;
    final target = this.target;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (greengrassGroupId != null) 'greengrassGroupId': greengrassGroupId,
      if (greengrassGroupName != null)
        'greengrassGroupName': greengrassGroupName,
      if (greengrassGroupVersionId != null)
        'greengrassGroupVersionId': greengrassGroupVersionId,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
      if (target != null) 'target': target.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// An object that contains a system's definition document and summary
/// information.
class SystemTemplateDescription {
  /// The definition document of a system.
  final DefinitionDocument? definition;

  /// An object that contains summary information about a system.
  final SystemTemplateSummary? summary;

  /// The namespace version against which the system was validated. Use this value
  /// in your system instance.
  final int? validatedNamespaceVersion;

  SystemTemplateDescription({
    this.definition,
    this.summary,
    this.validatedNamespaceVersion,
  });

  factory SystemTemplateDescription.fromJson(Map<String, dynamic> json) {
    return SystemTemplateDescription(
      definition: json['definition'] != null
          ? DefinitionDocument.fromJson(
              json['definition'] as Map<String, dynamic>)
          : null,
      summary: json['summary'] != null
          ? SystemTemplateSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
      validatedNamespaceVersion: json['validatedNamespaceVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final summary = this.summary;
    final validatedNamespaceVersion = this.validatedNamespaceVersion;
    return {
      if (definition != null) 'definition': definition,
      if (summary != null) 'summary': summary,
      if (validatedNamespaceVersion != null)
        'validatedNamespaceVersion': validatedNamespaceVersion,
    };
  }
}

/// An object that filters a system search.
class SystemTemplateFilter {
  /// The name of the system search filter field.
  final SystemTemplateFilterName name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  final List<String> value;

  SystemTemplateFilter({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name.toValue(),
      'value': value,
    };
  }
}

enum SystemTemplateFilterName {
  flowTemplateId,
}

extension SystemTemplateFilterNameValueExtension on SystemTemplateFilterName {
  String toValue() {
    switch (this) {
      case SystemTemplateFilterName.flowTemplateId:
        return 'FLOW_TEMPLATE_ID';
    }
  }
}

extension SystemTemplateFilterNameFromString on String {
  SystemTemplateFilterName toSystemTemplateFilterName() {
    switch (this) {
      case 'FLOW_TEMPLATE_ID':
        return SystemTemplateFilterName.flowTemplateId;
    }
    throw Exception('$this is not known in enum SystemTemplateFilterName');
  }
}

/// An object that contains information about a system.
class SystemTemplateSummary {
  /// The ARN of the system.
  final String? arn;

  /// The date when the system was created.
  final DateTime? createdAt;

  /// The ID of the system.
  final String? id;

  /// The revision number of the system.
  final int? revisionNumber;

  SystemTemplateSummary({
    this.arn,
    this.createdAt,
    this.id,
    this.revisionNumber,
  });

  factory SystemTemplateSummary.fromJson(Map<String, dynamic> json) {
    return SystemTemplateSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      revisionNumber: json['revisionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final revisionNumber = this.revisionNumber;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (id != null) 'id': id,
      if (revisionNumber != null) 'revisionNumber': revisionNumber,
    };
  }
}

/// Metadata assigned to an AWS IoT Things Graph resource consisting of a
/// key-value pair.
class Tag {
  /// The required name of the tag. The string value can be from 1 to 128 Unicode
  /// characters in length.
  final String key;

  /// The optional value of the tag. The string value can be from 1 to 256 Unicode
  /// characters in length.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
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

/// An AWS IoT thing.
class Thing {
  /// The ARN of the thing.
  final String? thingArn;

  /// The name of the thing.
  final String? thingName;

  Thing({
    this.thingArn,
    this.thingName,
  });

  factory Thing.fromJson(Map<String, dynamic> json) {
    return Thing(
      thingArn: json['thingArn'] as String?,
      thingName: json['thingName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final thingArn = this.thingArn;
    final thingName = this.thingName;
    return {
      if (thingArn != null) 'thingArn': thingArn,
      if (thingName != null) 'thingName': thingName,
    };
  }
}

class UndeploySystemInstanceResponse {
  /// An object that contains summary information about the system instance that
  /// was removed from its target.
  final SystemInstanceSummary? summary;

  UndeploySystemInstanceResponse({
    this.summary,
  });

  factory UndeploySystemInstanceResponse.fromJson(Map<String, dynamic> json) {
    return UndeploySystemInstanceResponse(
      summary: json['summary'] != null
          ? SystemInstanceSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    return {
      if (summary != null) 'summary': summary,
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

class UpdateFlowTemplateResponse {
  /// An object containing summary information about the updated workflow.
  final FlowTemplateSummary? summary;

  UpdateFlowTemplateResponse({
    this.summary,
  });

  factory UpdateFlowTemplateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowTemplateResponse(
      summary: json['summary'] != null
          ? FlowTemplateSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    return {
      if (summary != null) 'summary': summary,
    };
  }
}

class UpdateSystemTemplateResponse {
  /// An object containing summary information about the updated system.
  final SystemTemplateSummary? summary;

  UpdateSystemTemplateResponse({
    this.summary,
  });

  factory UpdateSystemTemplateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSystemTemplateResponse(
      summary: json['summary'] != null
          ? SystemTemplateSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    return {
      if (summary != null) 'summary': summary,
    };
  }
}

class UploadEntityDefinitionsResponse {
  /// The ID that specifies the upload action. You can use this to track the
  /// status of the upload.
  final String uploadId;

  UploadEntityDefinitionsResponse({
    required this.uploadId,
  });

  factory UploadEntityDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return UploadEntityDefinitionsResponse(
      uploadId: json['uploadId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final uploadId = this.uploadId;
    return {
      'uploadId': uploadId,
    };
  }
}

enum UploadStatus {
  inProgress,
  succeeded,
  failed,
}

extension UploadStatusValueExtension on UploadStatus {
  String toValue() {
    switch (this) {
      case UploadStatus.inProgress:
        return 'IN_PROGRESS';
      case UploadStatus.succeeded:
        return 'SUCCEEDED';
      case UploadStatus.failed:
        return 'FAILED';
    }
  }
}

extension UploadStatusFromString on String {
  UploadStatus toUploadStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return UploadStatus.inProgress;
      case 'SUCCEEDED':
        return UploadStatus.succeeded;
      case 'FAILED':
        return UploadStatus.failed;
    }
    throw Exception('$this is not known in enum UploadStatus');
  }
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
